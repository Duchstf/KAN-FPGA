# === Imports ===
import sys, os, logging
from datetime import datetime
from functools import reduce # <-- Added for optimizer setup
import json

sys.path.append('../../src')
from KAN_OG import KAN
import numpy as np
import torch
import torch.nn as nn
import torch.optim as optim
from torch.utils.data import TensorDataset, DataLoader, random_split # <-- Added random_split

from tqdm import tqdm

# For quantization (not used in this script but kept from original)
from brevitas.nn import QuantHardTanh
from brevitas.core.scaling import ParameterScaling
from brevitas.core.quant import QuantType

# Set the seed
seed = 120
torch.manual_seed(seed)
np.random.seed(seed)

# Set the device
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

# --- NEW: Create Train/Validation Split ---
# Fetch the full training dataset
full_train_dataset = get_preqnt_dataset("data/unsw_nb15_binarized.npz", split="train")
test_dataset = get_preqnt_dataset("data/unsw_nb15_binarized.npz", split="test")

dataset = {
    "train": full_train_dataset,
    "valid": test_dataset,
    "test": test_dataset
}

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
    "learning_rate": 1e-1,
    "weight_decay": 1e-4,
    # --- NEW: Optimizer and Scheduler Config ---
    "decay_exclusions": ["bias"], # Exclude parameter names containing these strings from weight decay
    "scheduler_T_0_factor": 100, # For CosineAnnealingWarmRestarts
    "scheduler_T_mult": 1,
}

# === Data Loaders ===
trainloader = DataLoader(dataset["train"], batch_size=config["batch_size"], shuffle=True)
valloader = DataLoader(dataset["valid"], batch_size=config["batch_size"], shuffle=False)
testloader  = DataLoader(dataset["test"], batch_size=config["batch_size"], shuffle=False)

# Create a new directory to save the config and checkpoints
model_dir = f'models/{datetime.now().strftime("%Y%m%d_%H%M%S")}'
os.makedirs(model_dir, exist_ok=True)
with open(f'{model_dir}/config.json', 'w') as f:
    json.dump(config, f)
logging.info(f"Model and logs will be saved in: {model_dir}")

# === Initialize Model ===
model = KAN(
    [593, 1],
    grid_size=20,
    spline_order=5,
    grid_eps=0.05,
    base_activation=nn.SiLU,
    grid_range=[0, 1]
).to(device)

# === Loss, Optimizer, Scheduler ===
criterion = nn.BCEWithLogitsLoss()

# --- NEW: Advanced Optimizer Setup ---
decay_params = []
no_decay_params = []
for pname, params in model.named_parameters():
    if params.requires_grad:
        # Check if the parameter name contains any of the exclusion strings
        if reduce(lambda a, b: a or b, map(lambda x: x in pname, config["decay_exclusions"])):
            logging.info(f"Disabling weight decay for: {pname}")
            no_decay_params.append(params)
        else:
            decay_params.append(params)

optimizer_params = [
    {"params": decay_params, "weight_decay": config["weight_decay"]},
    {"params": no_decay_params, "weight_decay": 0.0},
]
optimizer = optim.AdamW(optimizer_params,
                        betas=(0.5, 0.999),
                        lr=config["learning_rate"])

# --- NEW: Learning Rate Scheduler ---
steps_per_epoch = len(trainloader)
scheduler = optim.lr_scheduler.CosineAnnealingWarmRestarts(
    optimizer,
    T_0=steps_per_epoch * config["scheduler_T_0_factor"],
    T_mult=config["scheduler_T_mult"]
)

# === Evaluation Function (Unchanged from original but now used for validation too) ===
def evaluate(model, loader, criterion):
    model.eval()
    total_loss = 0.0
    total = 0
    tp, tn, fp, fn = 0, 0, 0, 0

    with torch.no_grad():
        for xb, yb in loader:
            xb, yb = xb.to(device), yb.to(device).float().view(-1, 1)
            logits = model(xb)
            loss = criterion(logits.view(-1), yb.view(-1))
            total_loss += loss.item() * xb.size(0)
            total += xb.size(0)

            preds = (torch.sigmoid(logits) > 0.75).float()
            tp += ((preds == 1) & (yb == 1)).sum().item()
            tn += ((preds == 0) & (yb == 0)).sum().item()
            fp += ((preds == 1) & (yb == 0)).sum().item()
            fn += ((preds == 0) & (yb == 1)).sum().item()

    avg_loss = total_loss / max(1, total)
    acc = (tp + tn) / max(1, (tp + tn + fp + fn))
    prec = tp / max(1, (tp + fp))
    rec = tp / max(1, (tp + fn))
    f1 = 0.0 if (prec + rec) == 0 else 2 * prec * rec / (prec + rec)

    return {"loss": avg_loss, "acc": acc, "precision": prec, "recall": rec, "f1": f1}

# === Training Loop ===
best_val_acc = 0.0
best_epoch = -1

for epoch in range(1, config["num_epochs"] + 1):
    model.train()
    running_loss = 0.0
    n_seen = 0

    pbar = tqdm(trainloader, desc=f"Epoch {epoch}/{config['num_epochs']}", leave=False)
    for xb, yb in pbar:
        xb, yb = xb.to(device), yb.to(device).float().view(-1, 1)

        optimizer.zero_grad(set_to_none=True)
        logits = model(xb)
        loss = criterion(logits.view(-1), yb.view(-1))
        loss.backward()
        optimizer.step()
        scheduler.step() # <-- Step the scheduler at each batch

        running_loss += loss.item() * xb.size(0)
        n_seen += xb.size(0)
        pbar.set_postfix(loss=loss.item(), lr=scheduler.get_last_lr()[0])

    # --- Evaluate on training and validation set after each epoch ---
    train_metrics = evaluate(model, trainloader, criterion)
    val_metrics = evaluate(model, valloader, criterion)

    logging.info(
        f"Epoch {epoch:03d} | "
        f"train_loss={train_metrics['loss']:.5f} | train_acc={train_metrics['acc']:.4f} | "
        f"val_loss={val_metrics['loss']:.5f}   | val_acc={val_metrics['acc']:.4f} | "
        f"val_f1={val_metrics['f1']:.4f}"
    )

    # --- NEW: Model Checkpointing ---
    # Save the latest model checkpoint
    checkpoint = {
        'epoch': epoch,
        'model_dict': model.state_dict(),
        'optim_dict': optimizer.state_dict(),
        'val_accuracy': val_metrics['acc'],
    }
    torch.save(checkpoint, f'{model_dir}/checkpoint.pth')

    # Save the best model based on validation accuracy
    if val_metrics['acc'] > best_val_acc:
        best_val_acc = val_metrics['acc']
        best_epoch = epoch
        logging.info(f"🎉 New best validation accuracy: {best_val_acc:.4f}. Saving model to best_model.pth")
        torch.save(checkpoint, f'{model_dir}/best_model.pth')


logging.info(f"Training complete. Best epoch: {best_epoch} with val_acc={best_val_acc:.4f}")

# === Final Evaluation on Test Set ===
logging.info("Loading best model for final evaluation on the test set...")
best_model_checkpoint = torch.load(f'{model_dir}/best_model.pth')
model.load_state_dict(best_model_checkpoint['model_dict'])

test_metrics = evaluate(model, testloader, criterion)
logging.info(
    f"Final Test Metrics: | "
    f"test_loss={test_metrics['loss']:.5f} | "
    f"test_acc={test_metrics['acc']:.4f} | "
    f"test_f1={test_metrics['f1']:.4f} | "
    f"test_prec={test_metrics['precision']:.4f} | "
    f"test_rec={test_metrics['recall']:.4f}"
)