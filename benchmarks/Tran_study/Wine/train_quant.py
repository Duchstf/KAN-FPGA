import sys, os, random
import numpy as np
import torch
import torch.nn as nn
import pandas as pd
import math
import matplotlib.pyplot as plt
import json
from datetime import datetime
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from torch.utils.data import TensorDataset, DataLoader
import logging
from tqdm import tqdm
import torch.optim as optim

# === Use YOUR original KAN class ===
# (with grid_size, spline_order, grid_eps, base_activation, grid_range)
sys.path.append('../../../src')
from KAN_QAT import KAN
from helpers import quantize_dataset, plot_input_features

# -------------------------------
# Reproducibility & Device
# -------------------------------
SEED = 42
random.seed(SEED)
np.random.seed(SEED)
torch.manual_seed(SEED)
if torch.cuda.is_available():
    torch.cuda.manual_seed_all(SEED)

device = "cuda" if torch.cuda.is_available() else "cpu"
print("Device:", device)

# -------------------------------
# Configuration
# -------------------------------
layers_precision = [(6, 3), (7, 5), (8, 6)]  # keep your original precision settings
grid_size = 6
spline_order = 3

# Training parameters
batch_size = 64
num_epochs = 100
regularize_clipping = 1e-8

# Save to a config json file
config = {
    "layers": [13, 4, 3],                  # <<< adapted to Wine: 13 features -> 3 classes
    "layers_precision": layers_precision,  # precision is (bit_width, integer_width)

    "grid_size": grid_size,
    "grid_eps": 0.01,
    "spline_order": spline_order,
    "base_activation": "nn.GELU",

    "quantize_clip": False,
    "quantize": True,
    "regularize_clipping": regularize_clipping,
    "prune_threshold": 0.1,
}

# Create a new directory to save the config and checkpoints
model_dir = f'models/{datetime.now().strftime("%Y%m%d_%H%M%S")}'
os.makedirs(model_dir, exist_ok=True)
with open(f'{model_dir}/config.json', 'w') as f:
    json.dump(config, f)

# -------------------------------
# Data: Wine — split FIRST, scale on TRAIN only
# -------------------------------
from sklearn.datasets import load_wine
wine = load_wine()
X = wine.data           # [N, 13]
y = wine.target         # {0,1,2}

# Stratified split (match your second script)
X_tr_raw, X_te_raw, y_tr, y_te = train_test_split(
    X, y, test_size=0.3, random_state=40, stratify=y
)

# Standardize using TRAIN stats only
scaler = StandardScaler()
X_tr = scaler.fit_transform(X_tr_raw)
X_te = scaler.transform(X_te_raw)

# Torch tensors on device
X_tr_t = torch.from_numpy(X_tr).float().to(device)
X_te_t = torch.from_numpy(X_te).float().to(device)
y_tr_t = torch.from_numpy(y_tr).long().to(device)
y_te_t = torch.from_numpy(y_te).long().to(device)

# Plot the distribution of the input features
plot_input_features(X_tr_t, out_dir="plots", plot_name="features_grid.png")

# Quantize the data (use first precision tuple as in your original script)
X_tr_t, X_te_t = quantize_dataset(
    X_tr_t, X_te_t, precision=config["layers_precision"][0], rounding="nearest"
)

# Plot the distribution of the quantized features
plot_input_features(X_tr_t, out_dir="plots", plot_name="features_grid_quantized.png")

# Dataset dict to match your metric signatures
dataset = {
    "train_input": X_tr_t,
    "train_label": y_tr_t,
    "test_input":  X_te_t,
    "test_label":  y_te_t,
}

in_features = X_tr_t.shape[1]          # should be 13 for Wine
num_classes = len(np.unique(y))        # should be 3

print(f"in_features={in_features}, num_classes={num_classes}, trainN={len(y_tr)}, testN={len(y_te)}")

# === Create Data Loaders ===
train_dataset = TensorDataset(X_tr_t, y_tr_t)
test_dataset = TensorDataset(X_te_t, y_te_t)
trainloader = DataLoader(train_dataset, batch_size=batch_size, shuffle=True)
testloader = DataLoader(test_dataset, batch_size=batch_size, shuffle=False)

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
print("Total params:", sum(p.numel() for p in model.parameters()))

optimizer = optim.AdamW(model.parameters(), lr=0.05, weight_decay=1e-3)
scheduler = optim.lr_scheduler.ExponentialLR(optimizer, gamma=0.9)
criterion = nn.CrossEntropyLoss()

# -------------------------------
# Metrics (multi-class CE)
# -------------------------------
def train_acc():
    model.eval()
    with torch.no_grad():
        logits = model(dataset["train_input"])        # [Ntr, C]
        preds = logits.argmax(dim=1)
        labels = dataset["train_label"]
        return (preds == labels).float().mean()

def test_acc():
    model.eval()
    with torch.no_grad():
        logits = model(dataset["test_input"])         # [Nte, C]
        preds = logits.argmax(dim=1)
        labels = dataset["test_label"]
        return (preds == labels).float().mean()

# Logging: file + console
logging.basicConfig(
    filename=f'{model_dir}/training.log',
    filemode='w',
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)
console = logging.StreamHandler()
console.setLevel(logging.INFO)
console.setFormatter(logging.Formatter('%(message)s'))
logging.getLogger().addHandler(console)

# === Training Loop ===
training_loss = []
testing_loss = []
best_val_accuracy = 0.0

criterion = nn.CrossEntropyLoss()
for epoch in range(num_epochs):
    # Train
    model.train()
    epoch_train_loss = 0
    total_batches = 0
    with tqdm(trainloader) as pbar:
        for i, (inputs, labels) in enumerate(pbar):
            inputs = inputs.to(device)
            labels = labels.to(device)

            optimizer.zero_grad()
            output = model(inputs)
            loss = criterion(output, labels)
            loss.backward()
            optimizer.step()

            epoch_train_loss += loss.item()
            total_batches += 1

            accuracy = (output.argmax(dim=1) == labels).float().mean()
            pbar.set_postfix(loss=loss.item(), accuracy=accuracy.item(), lr=optimizer.param_groups[0]['lr'])

    average_train_loss = epoch_train_loss / max(1, total_batches)
    training_loss.append(average_train_loss)

    # Prune the model
    remaining_fraction = model.prune_below_threshold(threshold=config["prune_threshold"])
    print(f"Remaining fraction: {remaining_fraction:.4f}")

    # Validation
    model.eval()
    val_loss = 0.0
    val_accuracy = 0.0
    with torch.no_grad():
        for inputs, labels in testloader:
            inputs = inputs.to(device)
            labels = labels.to(device)
            output = model(inputs)
            val_loss += criterion(output, labels).item()
            val_accuracy += (output.argmax(dim=1) == labels).float().mean().item()

    val_loss /= len(testloader)
    val_accuracy /= len(testloader)
    testing_loss.append(val_loss)

    # Update learning rate
    scheduler.step()

    logging.info(
        f"Epoch {epoch + 1:02d} | "
        f"Train Loss: {average_train_loss:.4f} | "
        f"Val Loss: {val_loss:.4f} | "
        f"Val Accuracy: {val_accuracy:.4f} | "
        f"Remaining Fraction: {remaining_fraction:.4f}"
    )

    # === Save Checkpoint if Best ===
    if val_accuracy > best_val_accuracy:
        best_val_accuracy = val_accuracy
        checkpoint_path = f'{model_dir}/Wine_grid{grid_size}_spline{spline_order}_acc{val_accuracy:.4f}_epoch{epoch + 1}.pt'
        torch.save({
            'epoch': epoch + 1,
            'model_state_dict': model.state_dict(),
            'optimizer_state_dict': optimizer.state_dict(),
            'val_accuracy': val_accuracy,
            'val_loss': val_loss,
            'remaining_fraction': remaining_fraction,
            'scaler_mean_': scaler.mean_.tolist(),
            'scaler_scale_': scaler.scale_.tolist(),
        }, checkpoint_path)
        logging.info(f"New best model saved with val accuracy: {val_accuracy:.4f}")
