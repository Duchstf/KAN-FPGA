# === Imports ===
import sys, os, logging

sys.path.append('../../src')
from KANLinear import KAN, Quantizer

import numpy as np
import torch
import torch.nn as nn
import torch.optim as optim
from torch.utils.data import TensorDataset, DataLoader
from sklearn.metrics import roc_curve, auc
from tqdm import tqdm
import json

# === Setup ===
torch.cuda.empty_cache()
device = 'cuda' if torch.cuda.is_available() else 'cpu'

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
#Model parameters
TP = 7
FP = 3
grid_range = [-2**(TP - FP - 1), 2**(TP - FP - 1)]
resolution = int(2 ** TP)
grid_size = 30
spline_order = 10

#Training parameters
REGULARIZE_ACTIVATION = 0.001
batch_size = 64
num_epochs = 30

#Save to a config json file
config = {
    "layers": [16, 5, 5],

    "TP": TP,
    "FP": FP,
    "resolution": resolution,

    "grid_size": grid_size,
    "grid_range": grid_range,
    "grid_eps": 0.05,

    "spline_order": spline_order,
    "base_activation": "nn.GELU",

    "quantize_clip": True,
    "quantize": True,
}

with open('models/config.json', 'w') as f:
    json.dump(config, f)

# === Load Data ===
X_train = torch.from_numpy(np.load('data/X_train_val.npy')).float().to(device)
y_train = torch.from_numpy(np.load('data/y_train_val.npy')).float().to(device).argmax(dim=1)
X_test = torch.from_numpy(np.load('data/X_test.npy')).float().to(device)
y_test = torch.from_numpy(np.load('data/y_test.npy')).float().to(device).argmax(dim=1)

train_dataset = TensorDataset(X_train, y_train)
test_dataset = TensorDataset(X_test, y_test)
trainloader = DataLoader(train_dataset, batch_size=batch_size, shuffle=True)
testloader = DataLoader(test_dataset, batch_size=batch_size, shuffle=False)

# === Initialize Model ===
model = KAN(
    config["layers"],
    grid_size=config["grid_size"],
    spline_order=config["spline_order"],
    grid_eps=config["grid_eps"],
    base_activation=eval(config["base_activation"]),
    grid_range=config["grid_range"],
    quantize=config["quantize"],
    tp=config["TP"],
    fp=config["FP"],
    lut_res=config["resolution"],
    quantize_clip=config["quantize_clip"]
).to(device)

param_count = sum(p.numel() for p in model.parameters())
logging.info(f"Model has {param_count} parameters")

optimizer = optim.AdamW(model.parameters(), lr=1e-4, weight_decay=1e-5)
scheduler = optim.lr_scheduler.ExponentialLR(optimizer, gamma=0.99)
criterion = nn.CrossEntropyLoss()

# === Training Loop ===
training_loss = []
testing_loss = []
best_val_accuracy = 0.0

for epoch in range(num_epochs):
    model.train()
    epoch_train_loss = 0
    total_batches = 0

    with tqdm(trainloader, desc=f"Epoch {epoch + 1}/{num_epochs}") as pbar:
        for inputs, labels in pbar:
            inputs, labels = inputs.to(device), labels.to(device)

            optimizer.zero_grad()
            output = model(inputs)

            loss = criterion(output, labels) + model.regularization_loss(
                regularize_activation=REGULARIZE_ACTIVATION,
                regularize_entropy=min(0.005 * epoch, 0.05),
                regularize_clipping=min(0.05 * epoch, 0.2)
            )
            loss.backward()
            optimizer.step()

            epoch_train_loss += loss.item()
            total_batches += 1

            accuracy = (output.argmax(dim=1) == labels).float().mean()
            fracs_clipped = [
                round(x.item(), 4) for layer in model.layers for x in layer.get_frac_clipped()
            ]

            pbar.set_postfix(
                loss=loss.item(),
                accuracy=accuracy.item(),
                lr=optimizer.param_groups[0]['lr'],
                frac_clipped=fracs_clipped
            )

    avg_train_loss = epoch_train_loss / total_batches
    training_loss.append(avg_train_loss)

    # === Validation ===
    model.eval()
    val_loss = 0.0
    val_accuracy = 0.0

    with torch.no_grad():
        for inputs, labels in testloader:
            inputs, labels = inputs.to(device), labels.to(device)
            output = model(inputs)

            loss = criterion(output, labels) + model.regularization_loss(
                regularize_activation=0,
                regularize_entropy=0,
                regularize_clipping=0.2
            )

            val_loss += loss.item()
            val_accuracy += (output.argmax(dim=1) == labels).float().mean().item()

    val_loss /= len(testloader)
    val_accuracy /= len(testloader)
    testing_loss.append(val_loss)
    scheduler.step()

    remaining_fraction = model.prune_below_threshold(threshold=0.1)

    logging.info(
        f"Epoch {epoch + 1:02d} | "
        f"Train Loss: {avg_train_loss:.4f} | "
        f"Val Loss: {val_loss:.4f} | "
        f"Val Accuracy: {val_accuracy:.4f} | "
        f"Remaining Fraction: {remaining_fraction:.4f}"
    )

    # === Save Checkpoint if Best ===
    if val_accuracy > best_val_accuracy:
        best_val_accuracy = val_accuracy
        checkpoint_path = f'models/jets_quant_tp{TP}_fp{FP}_grid{grid_size}_spline{spline_order}_acc{val_accuracy:.4f}_epoch{epoch + 1}.pt'
        torch.save({
            'epoch': epoch + 1,
            'model_state_dict': model.state_dict(),
            'optimizer_state_dict': optimizer.state_dict(),
            'val_accuracy': val_accuracy,
            'val_loss': val_loss
        }, checkpoint_path)
        logging.info(f"New best model saved with val accuracy: {val_accuracy:.4f}")
