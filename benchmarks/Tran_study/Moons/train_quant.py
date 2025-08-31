import sys, os, random, json
import numpy as np
import torch
import torch.nn as nn
from datetime import datetime
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.datasets import make_moons
from torch.utils.data import TensorDataset, DataLoader
import logging
from tqdm import tqdm
import torch.optim as optim

# === Use YOUR original KAN class ===
sys.path.append('../../../src')
from KAN_QAT import KAN
from helpers import quantize_dataset, plot_input_features

# -------------------------------
# Reproducibility & Device
# -------------------------------
SEED = 42
random.seed(SEED); np.random.seed(SEED); torch.manual_seed(SEED)
if torch.cuda.is_available(): torch.cuda.manual_seed_all(SEED)
device = "cuda" if torch.cuda.is_available() else "cpu"
print("Device:", device)

# -------------------------------
# Config (same scaffold, single-logit head)
# -------------------------------
layers_precision = [(6, 3), (5, 3), (8, 6)]
grid_size, spline_order = 6, 3
batch_size, num_epochs = 64, 100
regularize_clipping = 1e-8

config = {
    "layers": [2, 2, 1],
    "layers_precision": layers_precision,
    "grid_size": grid_size,
    "grid_eps": 0.01,
    "spline_order": spline_order,
    "base_activation": "nn.GELU",
    "quantize_clip": False,
    "quantize": True,
    "regularize_clipping": regularize_clipping,
    "prune_threshold": 0.00,
}

model_dir = f'models/{datetime.now().strftime("%Y%m%d_%H%M%S")}'
os.makedirs(model_dir, exist_ok=True)
with open(f'{model_dir}/config.json', 'w') as f: json.dump(config, f)

# -------------------------------
# Data: Two-Moons (binary), split FIRST, scale on TRAIN
# -------------------------------
X_all, y_all = make_moons(n_samples=10000, noise=0.2, random_state=SEED)
X_tr_raw, X_te_raw, y_tr, y_te = train_test_split(
    X_all, y_all, test_size=0.2, random_state=SEED, shuffle=True, stratify=y_all
)

scaler = StandardScaler()
X_tr = scaler.fit_transform(X_tr_raw); X_te = scaler.transform(X_te_raw)

X_tr_t = torch.from_numpy(X_tr).float().to(device)
X_te_t = torch.from_numpy(X_te).float().to(device)
y_tr_t = torch.from_numpy(y_tr).float().unsqueeze(1).to(device)  # for BCEWithLogits
y_te_t = torch.from_numpy(y_te).float().unsqueeze(1).to(device)

plot_input_features(X_tr_t, out_dir="plots", plot_name="moons_features.png")
X_tr_t, X_te_t = quantize_dataset(X_tr_t, X_te_t, precision=config["layers_precision"][0], rounding="nearest")
plot_input_features(X_tr_t, out_dir="plots", plot_name="moons_features_quantized.png")

dataset = {
    "train_input": X_tr_t,
    "train_label": y_tr_t,
    "test_input":  X_te_t,
    "test_label":  y_te_t,
}
print(f"in_features={X_tr_t.shape[1]}, trainN={len(y_tr)}, testN={len(y_te)}")

# === Data Loaders ===
trainloader = DataLoader(TensorDataset(X_tr_t, y_tr_t), batch_size=batch_size, shuffle=True)
testloader  = DataLoader(TensorDataset(X_te_t, y_te_t), batch_size=batch_size, shuffle=False)

# -------------------------------
# Model
# -------------------------------
model = KAN(
    config["layers"],
    layers_precision=config["layers_precision"],
    quantize=config["quantize"],
    quantize_clip=config["quantize_clip"],
    grid_size=config["grid_size"],
    spline_order=config["spline_order"],
    grid_eps=config["grid_eps"],
    base_activation=eval(config["base_activation"])
).to(device)
print("Num parameters:", sum(p.numel() for p in model.parameters()))

optimizer = optim.AdamW(model.parameters(), lr=1e-2, weight_decay=1e-4)
scheduler = optim.lr_scheduler.ExponentialLR(optimizer, gamma=0.9)
criterion = nn.BCEWithLogitsLoss()

# -------------------------------
# Metrics (sigmoid -> probability)
# -------------------------------
@torch.no_grad()
def train_acc():
    model.eval()
    logits = model(dataset["train_input"]).squeeze(-1)   # [Ntr]
    p = torch.sigmoid(logits)
    preds = (p > 0.5).long()
    labels = dataset["train_label"].long().squeeze(-1)
    return (preds == labels).float().mean()

@torch.no_grad()
def test_acc():
    model.eval()
    logits = model(dataset["test_input"]).squeeze(-1)    # [Nte]
    p = torch.sigmoid(logits)
    preds = (p > 0.5).long()
    labels = dataset["test_label"].long().squeeze(-1)
    return (preds == labels).float().mean()

# -------------------------------
# Logging
# -------------------------------
logging.basicConfig(
    filename=f'{model_dir}/training.log',
    filemode='w',
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)
console = logging.StreamHandler(); console.setLevel(logging.INFO)
console.setFormatter(logging.Formatter('%(message)s'))
logging.getLogger().addHandler(console)

# -------------------------------
# Training Loop
# -------------------------------
training_loss, testing_loss = [], []
best_val_acc = 0.0

for epoch in range(num_epochs):
    model.train()
    epoch_train_loss, total_batches = 0.0, 0
    with tqdm(trainloader) as pbar:
        for inputs, targets in pbar:
            inputs, targets = inputs.to(device), targets.to(device)
            optimizer.zero_grad()
            logits = model(inputs)               # [B,1]
            loss = criterion(logits, targets)
            loss.backward(); optimizer.step()
            epoch_train_loss += loss.item(); total_batches += 1
            with torch.no_grad():
                preds = (torch.sigmoid(logits).squeeze(-1) > 0.5).long()
                acc = (preds == targets.long().squeeze(-1)).float().mean().item()
            pbar.set_postfix(loss=loss.item(), acc=acc, lr=optimizer.param_groups[0]['lr'])

    avg_train_loss = epoch_train_loss / max(1, total_batches)
    training_loss.append(avg_train_loss)

    remaining_fraction = model.prune_below_threshold(threshold=config["prune_threshold"])
    print(f"Remaining fraction: {remaining_fraction}")

    model.eval()
    val_loss, val_acc_sum = 0.0, 0.0
    with torch.no_grad():
        for inputs, targets in testloader:
            inputs, targets = inputs.to(device), targets.to(device)
            logits = model(inputs)
            val_loss += criterion(logits, targets).item()
            preds = (torch.sigmoid(logits).squeeze(-1) > 0.5).long()
            val_acc_sum += (preds == targets.long().squeeze(-1)).float().mean().item()

    val_loss /= len(testloader)
    val_acc = val_acc_sum / len(testloader)
    testing_loss.append(val_loss)

    scheduler.step()

    logging.info(
        f"Epoch {epoch+1:02d} | Train Loss: {avg_train_loss:.6f} | "
        f"Val Loss: {val_loss:.6f} | Val Acc: {val_acc:.4f} | "
        f"Remaining Fraction: {remaining_fraction:.4f}"
    )

    if val_acc > best_val_acc:
        best_val_acc = val_acc
        torch.save({
            'epoch': epoch + 1,
            'model_state_dict': model.state_dict(),
            'optimizer_state_dict': optimizer.state_dict(),
            'val_accuracy': val_acc,
            'val_loss': val_loss,
            'remaining_fraction': remaining_fraction,
        }, f'{model_dir}/TwoMoons_bin_grid{grid_size}_spline{spline_order}_acc{val_acc:.4f}_epoch{epoch+1}.pt')
        logging.info(f"New best model saved with val accuracy: {val_acc:.4f}")

print("Final Train Acc:", float(train_acc()))
print("Final Test  Acc:", float(test_acc()))
