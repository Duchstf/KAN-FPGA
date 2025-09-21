# === Imports ===
import sys, os, glob, logging, re
from datetime import datetime

sys.path.append('../../src')
from KANQuant import KANQuant
from quant import QuantBrevitasActivation, ScalarBiasScale
from dataset import JetSubstructureDataset

import numpy as np
import torch
import torch.nn as nn
import torch.optim as optim
from torch.utils.data import TensorDataset, DataLoader
import matplotlib.pyplot as plt
import math
from typing import Optional

from sklearn.metrics import roc_curve, auc
from tqdm import tqdm
import json

# For quantization
from brevitas.nn import QuantHardTanh
from brevitas.core.scaling import ParameterScaling
from brevitas.core.quant import QuantType

# ---------------------------
# Helper: find latest ckpt
# ---------------------------
def _extract_epoch(fname: str) -> int:
    m = re.search(r'epoch(\d+)', os.path.basename(fname))
    return int(m.group(1)) if m else -1

def find_latest_checkpoint(path_like: str) -> Optional[str]:
    """
    If path_like is a file, return it.
    If it's a directory, return the checkpoint with the largest epoch number.
    If it doesn't exist or is empty, return None.
    """
    if os.path.isfile(path_like):
        return path_like
    if os.path.isdir(path_like):
        cands = sorted(
            glob.glob(os.path.join(path_like, "*.pt")),
            key=lambda p: (_extract_epoch(p), p)
        )
        return cands[-1] if cands else None
    return None

# ---------------------------
# Config (add resume options)
# ---------------------------

# Set the seed
seed = 321983
torch.manual_seed(seed)
np.random.seed(seed)

# Set the device
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

# === Logging Setup ===
os.makedirs('checkpoints', exist_ok=True)
logging.basicConfig(
    filename='training.log',
    filemode='a',  # append so resume keeps history
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)
console = logging.StreamHandler()
console.setLevel(logging.INFO)
formatter = logging.Formatter('%(message)s')
console.setFormatter(formatter)
logging.getLogger().addHandler(console)

# === Configuration ===
# Note: added "resume" and "resume_path".
config = {
    "seed": seed,
    "layers": [16, 8, 5],
    "grid_range": [-2, 2],
    "layers_bitwidth": [6, 6, 8],

    "grid_size": 40,
    "spline_order": 10,
    "grid_eps": 0.05,

    "base_activation": "nn.SiLU",

    "batch_size": 512,
    "num_epochs": 1000,  # total target epochs (not just additional)

    "learning_rate": 1e-3,
    "weight_decay": 1e-4,

    "prune_threshold": 0.9,
    "target_epoch": 25,
    "warmup_epochs": 4,
    "random_seed": seed,

    # --- NEW ---
    "resume": True,                 # set True to resume
    "resume_path": "models/20250918_102257/JSC_OpenML_acc0.7573_epoch99_remaining0.4583.pt",         # file .pt OR a directory to auto-pick latest
}

# ---------------------------
# Model directory policy
# ---------------------------
# If resuming from a specific checkpoint, keep using its directory.
# Otherwise, create a fresh timestamped directory.
resume_checkpoint_path = None
resume_start_epoch = 0

if config.get("resume", False):
    resume_checkpoint_path = find_latest_checkpoint(config.get("resume_path", "models"))
    if resume_checkpoint_path is None:
        logging.warning("Resume requested but no checkpoint found at '%s'. Starting fresh.", config.get("resume_path", "models"))

# Create / choose model_dir
if resume_checkpoint_path is not None:
    # use the same directory as the checkpoint
    model_dir = os.path.dirname(resume_checkpoint_path)
else:
    model_dir = f'models/{datetime.now().strftime("%Y%m%d_%H%M%S")}'
os.makedirs(model_dir, exist_ok=True)

# Save (or update) config alongside the run
with open(f'{model_dir}/config.json', 'w') as f:
    json.dump(config, f, indent=2)

# ---------------------------
# Build the input layer
# ---------------------------
bn_in = nn.BatchNorm1d(config["layers"][0])
nn.init.constant_(bn_in.weight.data, 1)
nn.init.constant_(bn_in.bias.data, 0)
input_bias = ScalarBiasScale(scale=False, bias_init=-0.25)
JSC_input_layer = QuantBrevitasActivation(
    QuantHardTanh(
        bit_width=config["layers_bitwidth"][0],
        max_val=1.0,
        min_val=-1.0,
        act_scaling_impl=ParameterScaling(1.33),
        quant_type=QuantType.INT,
        return_quant_tensor=False
    ),
    pre_transforms=[bn_in, input_bias],
    cuda=device.type == "cuda"
).to(device)

# === Load Data ===
dataset = {}
dataset["test"] = JetSubstructureDataset(
    "data/processed-pythia82-lhc13-all-pt1-50k-r1_h022_e0175_t220_nonu_truth.z",
    "config.yml",
    split="test"
)
dataset["train"] = JetSubstructureDataset(
    "data/processed-pythia82-lhc13-all-pt1-50k-r1_h022_e0175_t220_nonu_truth.z",
    "config.yml",
    split="train"
)

X_train = dataset["train"].X.to(device)
y_train = dataset["train"].y.float().argmax(dim=1).to(device)
X_test  = dataset["test"].X.to(device)
y_test  = dataset["test"].y.float().argmax(dim=1).to(device)

# === Create Data Loaders ===
train_dataset = TensorDataset(X_train, y_train)
test_dataset  = TensorDataset(X_test, y_test)
trainloader = DataLoader(train_dataset, batch_size=config["batch_size"], shuffle=True)
testloader  = DataLoader(test_dataset,  batch_size=config["batch_size"], shuffle=False)

# === Initialize Model ===
model = KANQuant(config, JSC_input_layer, device).to(device)

optimizer = optim.Adam(model.parameters(), lr=config["learning_rate"], weight_decay=config["weight_decay"])
scheduler = optim.lr_scheduler.ExponentialLR(optimizer, gamma=0.998)
criterion = nn.CrossEntropyLoss()

# ---------------------------
# Resume if requested
# ---------------------------
best_val_accuracy = 0.0
training_loss = []
testing_loss = []

if resume_checkpoint_path is not None:
    logging.info(f"Resuming from checkpoint: {resume_checkpoint_path}")
    ckpt = torch.load(resume_checkpoint_path, map_location=device)

    # Load states
    model.load_state_dict(ckpt['model_state_dict'])
    optimizer.load_state_dict(ckpt['optimizer_state_dict'])

    # If the old run saved scheduler state, restore it; otherwise keep new scheduler
    if 'scheduler_state_dict' in ckpt:
        try:
            scheduler.load_state_dict(ckpt['scheduler_state_dict'])
        except Exception as e:
            logging.warning(f"Could not load scheduler state: {e}. Continuing with a fresh scheduler.")

    # Resume counters
    resume_start_epoch = int(ckpt.get('epoch', 0))  # ckpt stored next epoch index (your code saved epoch+1)
    best_val_accuracy = float(ckpt.get('val_accuracy', 0.0))

    logging.info(f"Loaded epoch={resume_start_epoch}, last_val_acc={best_val_accuracy:.4f}")

# ---------------------------
# Training Loop
# ---------------------------
def validate(model, loader, criterion):
    model.eval()
    val_loss = 0.0
    val_accuracy = 0.0
    with torch.no_grad():
        for inputs, labels in loader:
            inputs = inputs.to(device)
            output = model(inputs)
            val_loss += criterion(output, labels.to(device)).item()
            val_accuracy += (output.argmax(dim=1) == labels.to(device)).float().mean().item()
    val_loss /= len(loader)
    val_accuracy /= len(loader)
    return val_loss, val_accuracy

# Train starting from resume_start_epoch up to config["num_epochs"]
for epoch in range(resume_start_epoch, config["num_epochs"]):
    model.train()
    epoch_train_loss = 0.0
    total_batches = 0

    with tqdm(trainloader, desc=f"Epoch {epoch+1}/{config['num_epochs']}") as pbar:
        for i, (inputs, labels) in enumerate(pbar):
            inputs = inputs.to(device)
            optimizer.zero_grad(set_to_none=True)

            output = model(inputs)
            loss = criterion(output, labels.to(device))
            loss.backward()
            optimizer.step()

            epoch_train_loss += loss.item()
            total_batches += 1

            with torch.no_grad():
                accuracy = (output.argmax(dim=1) == labels.to(device)).float().mean()
            pbar.set_postfix(loss=loss.item(), accuracy=accuracy.item(), lr=optimizer.param_groups[0]['lr'])

    average_train_loss = epoch_train_loss / max(total_batches, 1)
    training_loss.append(average_train_loss)

    # Prune model according to your schedule (epoch is 0-based; you're passing it directly)
    remaining_fraction = model.prune_below_threshold(
        threshold=config["prune_threshold"],
        epoch=epoch,
        target_epoch=config["target_epoch"],
        warmup_epochs=config["warmup_epochs"]
    )
    print(f"Remaining fraction: {remaining_fraction}")

    # Validation
    val_loss, val_accuracy = validate(model, testloader, criterion)
    testing_loss.append(val_loss)

    # Update learning rate AFTER validation (keeps parity with your original loop)
    scheduler.step()

    logging.info(
        f"Epoch {epoch + 1:02d} | "
        f"Train Loss: {average_train_loss:.4f} | "
        f"Val Loss: {val_loss:.4f} | "
        f"Val Accuracy: {val_accuracy:.4f} | "
        f"Remaining Fraction: {remaining_fraction:.4f}"
    )

    # === Save Checkpoint for each epoch ===
    checkpoint_path = f'{model_dir}/JSC_OpenML_acc{val_accuracy:.4f}_epoch{epoch + 1}_remaining{remaining_fraction:.4f}.pt'
    torch.save({
        'epoch': epoch + 1,  # next epoch index
        'model_state_dict': model.state_dict(),
        'optimizer_state_dict': optimizer.state_dict(),
        'scheduler_state_dict': scheduler.state_dict(),  # NEW: save scheduler
        'val_accuracy': val_accuracy,
        'val_loss': val_loss,
        'remaining_fraction': remaining_fraction,
    }, checkpoint_path)
    logging.info(f"Checkpoint saved: {checkpoint_path}")

# ---------------------------
# Notes on usage
# ---------------------------
# 1) Fresh run (default):
#    config["resume"] = False
#
# 2) Resume from a specific file:
#    config["resume"] = True
#    config["resume_path"] = "models/20250101_120000/JSC_CERNBox_acc0.8765_epoch123_remaining0.5321.pt"
#
# 3) Resume from latest in a directory:
#    config["resume"] = True
#    config["resume_path"] = "models/20250101_120000"  # or simply "models" to search that folder
