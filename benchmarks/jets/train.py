# === Imports ===
import sys, os, logging

sys.path.append('../../src')
from KANLinear import KAN

import numpy as np
import torch
import torch.nn as nn
import torch.optim as optim
from torch.utils.data import TensorDataset, DataLoader
import matplotlib.pyplot as plt
import math

from sklearn.metrics import roc_curve, auc
from tqdm import tqdm
import json

# Brevitas for quantizing inputs
import brevitas.nn as qnn
from brevitas.core.quant import QuantType
from brevitas.core.scaling import ScalingImplType

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
input_bits = 6
grid_size = 40
spline_order = 4

#Training parameters
REGULARIZE_ACTIVATION = 0.001
batch_size = 64
num_epochs = 50

#Save to a config json file
config = {
    "layers": [16, 5, 5],
    "layers_precision": [(input_bits,2), (7,3), (6,2)],

    "grid_size": grid_size,
    "grid_eps": 0.03,

    "spline_order": spline_order,
    "base_activation": "nn.GELU",

    "quantize_clip": False,
    "quantize": True,
}

with open('models/config.json', 'w') as f:
    json.dump(config, f)

# === Load Data ===
X_train = torch.from_numpy(np.load('data/X_train_val.npy')).float().to(device)
y_train = torch.from_numpy(np.load('data/y_train_val.npy')).float().to(device).argmax(dim=1)
X_test = torch.from_numpy(np.load('data/X_test.npy')).float().to(device)
y_test = torch.from_numpy(np.load('data/y_test.npy')).float().to(device).argmax(dim=1)

#Plot the distribution of the training data
os.makedirs("plots", exist_ok=True)
n_feat = X_train.shape[1]
cols = 4
rows = math.ceil(n_feat / cols)

plt.figure(figsize=(4*cols, 3*rows))
for i in range(n_feat):
    plt.subplot(rows, cols, i+1)
    plt.hist(X_train[:, i].cpu().numpy(), bins=50, alpha=0.7)
    plt.title(f"Feature {i}", fontsize=8)
    plt.tight_layout()

plt.savefig("plots/features_grid.png")
plt.close()

# === Create Data Loaders ===
train_dataset = TensorDataset(X_train, y_train)
test_dataset = TensorDataset(X_test, y_test)
trainloader = DataLoader(train_dataset, batch_size=batch_size, shuffle=True)
testloader = DataLoader(test_dataset, batch_size=batch_size, shuffle=False)

# === Initialize Model ===
model = KAN(
    config["layers"],
    config["layers_precision"],
    grid_size=config["grid_size"],
    spline_order=config["spline_order"],
    grid_eps=config["grid_eps"],
    base_activation=eval(config["base_activation"]),
    quantize=config["quantize"],
    quantize_clip=config["quantize_clip"]
).to(device)

# === Brevitas Input Quantizer (6-bit) ===
# Returns a plain Tensor (not a QuantTensor), appropriate if KAN expects normal tensors.
input_quant = qnn.QuantIdentity(
    bit_width=input_bits,
    quant_type=QuantType.INT,
    signed=True,
    return_quant_tensor=False,
    # Make scaling constant (static); fix the clipping range
    scaling_impl_type=ScalingImplType.CONST,
    min_val=-8,
    max_val=8,
).to(device).eval()
param_count = sum(p.numel() for p in model.parameters())
logging.info(f"Model has {param_count} trainable parameters")

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

            # Quantize inputs for validation too
            q_inputs = input_quant(inputs)
            output = model(q_inputs)

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
            q_inputs = input_quant(inputs)
            output = model(q_inputs)

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

    remaining_fraction = model.prune_below_threshold(threshold=0.0)

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
        checkpoint_path = f'models/jets_grid{grid_size}_spline{spline_order}_acc{val_accuracy:.4f}_epoch{epoch + 1}.pt'
        torch.save({
            'epoch': epoch + 1,
            'model_state_dict': model.state_dict(),
            'optimizer_state_dict': optimizer.state_dict(),
            'val_accuracy': val_accuracy,
            'val_loss': val_loss,
            'remaining_fraction': remaining_fraction
        }, checkpoint_path)
        logging.info(f"New best model saved with val accuracy: {val_accuracy:.4f}")
