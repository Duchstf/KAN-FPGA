# === Imports ===
import sys, os, logging
from datetime import datetime

sys.path.append('../../src')
from KAN_OG import KAN
import numpy as np
import torch
import torch.nn as nn
import torch.optim as optim
from torch.utils.data import TensorDataset, DataLoader

from tqdm import tqdm
import json

#For quantization
from brevitas.nn import QuantHardTanh
from brevitas.core.scaling import ParameterScaling
from brevitas.core.quant import QuantType

#Set the seed
seed = 0
torch.manual_seed(seed)
np.random.seed(seed)

#Set the device
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

# === Load Data ===
def get_preqnt_dataset(data_file: str, split: str):
    unsw_nb15_data = np.load(data_file)
    splits = ["train", "test"]
    if not split in splits:
        print(f"Invalid dataset split: {split}")
        assert(False)
    part_data = unsw_nb15_data[split].astype(np.float32)
    part_data = torch.from_numpy(part_data)
    part_data_in = part_data[:, :-1]
    part_data_out = part_data[:, -1]
    return TensorDataset(part_data_in, part_data_out)


# Fetch the datasets
dataset = {}
dataset["train"] = get_preqnt_dataset("data/unsw_nb15_binarized.npz", split="train")
dataset["test"] = get_preqnt_dataset("data/unsw_nb15_binarized.npz", split="test")

# === Logging Setup ===
os.makedirs('checkpoints', exist_ok=True)
logging.basicConfig(
    filename='training.log',
    filemode='w',
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)
console = logging.StreamHandler()
console.setLevel(logging.INFO)
formatter = logging.Formatter('%(message)s')
console.setFormatter(formatter)
logging.getLogger().addHandler(console)

# === Configuration ===
config = {
    "base_activation": "nn.SiLU",
    
    "batch_size": 1024,
    "num_epochs": 200,

    "learning_rate": 2e-2,
    "weight_decay": 1e-4,
}

# === Data Loaders ===
trainloader = DataLoader(dataset["train"], batch_size=config["batch_size"], shuffle=True)
testloader  = DataLoader(dataset["test"], batch_size=config["batch_size"], shuffle=False)

#Create a new directory to save the config and checkpoints
model_dir = f'models/{datetime.now().strftime("%Y%m%d_%H%M%S")}'
os.makedirs(model_dir, exist_ok=True)
with open(f'{model_dir}/config.json', 'w') as f:
    json.dump(config, f)

# === Initialize Model ===
#Define the model
# -------------------------------
# Model: single-output regression head
# -------------------------------
model_check = KAN(
    [593, 1],              # last dim = 1
    grid_size=20,
    spline_order=5,
    grid_eps=0.2,
    base_activation=nn.SiLU,
    grid_range=[-1, 2]
).to(device)

# === Loss, Optimizer, Metrics, and Training Loop ===
criterion = nn.BCEWithLogitsLoss()
optimizer = optim.Adam(model_check.parameters(),
                       lr=config["learning_rate"],
                       weight_decay=config["weight_decay"])

def evaluate(model, loader, criterion):
    model.eval()
    total_loss = 0.0
    total = 0
    tp = tn = fp = fn = 0

    with torch.no_grad():
        for xb, yb in loader:
            xb = xb.to(device)
            yb = yb.to(device).float().view(-1, 1)  # shape (N,1)

            logits = model(xb)                      # shape (N,1)
            loss = criterion(logits.view(-1), yb.view(-1))
            total_loss += loss.item() * xb.size(0)
            total += xb.size(0)

            probs = torch.sigmoid(logits)
            preds = (probs > 0.5).float()

            tp += ((preds == 1) & (yb == 1)).sum().item()
            tn += ((preds == 0) & (yb == 0)).sum().item()
            fp += ((preds == 1) & (yb == 0)).sum().item()
            fn += ((preds == 0) & (yb == 1)).sum().item()

    avg_loss = total_loss / max(1, total)
    acc = (tp + tn) / max(1, (tp + tn + fp + fn))
    prec = tp / max(1, (tp + fp))
    rec = tp / max(1, (tp + fn))
    f1 = 0.0 if (prec + rec) == 0 else 2 * prec * rec / (prec + rec)

    return {
        "loss": avg_loss,
        "acc": acc,
        "precision": prec,
        "recall": rec,
        "f1": f1,
        "tp": tp, "tn": tn, "fp": fp, "fn": fn
    }

best_acc = 0.0
best_epoch = -1

for epoch in range(1, config["num_epochs"] + 1):
    model_check.train()
    running_loss = 0.0
    n_seen = 0

    for xb, yb in tqdm(trainloader, desc=f"Epoch {epoch}/{config['num_epochs']}", leave=False):
        xb = xb.to(device)
        yb = yb.to(device).float().view(-1, 1)  # ensure float targets and (N,1) shape

        optimizer.zero_grad(set_to_none=True)
        logits = model_check(xb)                # raw logits (N,1)
        loss = criterion(logits.view(-1), yb.view(-1))
        loss.backward()
        optimizer.step()

        running_loss += loss.item() * xb.size(0)
        n_seen += xb.size(0)

    train_loss = running_loss / max(1, n_seen)
    train_metrics = evaluate(model_check, trainloader, criterion)
    test_metrics = evaluate(model_check, testloader, criterion)

    logging.info(
        f"Epoch {epoch:03d} | "
        f"train_loss={train_loss:.5f} "
        f"| train_acc={train_metrics['acc']:.4f} "
        f"| test_loss={test_metrics['loss']:.5f} "
        f"| test_acc={test_metrics['acc']:.4f} "
        f"| test_f1={test_metrics['f1']:.4f} "
        f"| test_prec={test_metrics['precision']:.4f} "
        f"| test_rec={test_metrics['recall']:.4f} "
        f"| tp={test_metrics['tp']} tn={test_metrics['tn']} fp={test_metrics['fp']} fn={test_metrics['fn']}"
    )
   
logging.info(f"Training complete. Best epoch: {best_epoch} with test_acc={best_acc:.4f}")

# === Inference helper (example) ===
def predict_logits_probs_labels(model, xb):
    """
    xb: torch.Tensor of shape (N, 593)
    returns: logits (N,1), probs (N,1), preds_01 (N,1)
    """
    model.eval()
    with torch.no_grad():
        xb = xb.to(device)
        logits = model(xb)
        probs = torch.sigmoid(logits)
        preds = (probs > 0.5).float()
    return logits.cpu(), probs.cpu(), preds.cpu()
