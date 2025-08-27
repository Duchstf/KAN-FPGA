# === Imports ===
import sys, os, logging

sys.path.append('../../src')
from kan_qat import KAN
from helpers import quantize_dataset

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
input_precision = (8, 5)
layers_precision = [(8, 5), (8, 4), (8, 4)]
grid_size = 40
spline_order = 4

#Training parameters
batch_size = 64
num_epochs = 50

# === Load Data ===
X_train = torch.from_numpy(np.load('data/X_train_val.npy')).float().to(device)
y_train = torch.from_numpy(np.load('data/y_train_val.npy')).float().to(device).argmax(dim=1)
X_test = torch.from_numpy(np.load('data/X_test.npy')).float().to(device)
y_test = torch.from_numpy(np.load('data/y_test.npy')).float().to(device).argmax(dim=1)

#Quantize the data
X_train_q, X_test_q = quantize_dataset(X_train, X_test, input_precision, rounding="nearest")

#Plot the distribution of the training data
os.makedirs("plots", exist_ok=True)
n_feat = X_train.shape[1]
cols = 4
rows = math.ceil(n_feat / cols)

plt.figure(figsize=(4*cols, 3*rows))
for i in range(n_feat):
    plt.subplot(rows, cols, i+1)
    plt.hist(X_train_q[:, i].cpu().numpy(), bins=50, alpha=0.7)
    plt.title(f"Feature {i}", fontsize=8)
    plt.tight_layout()

plt.savefig("plots/features_grid.png")
plt.close()

# === Create Data Loaders ===
train_dataset = TensorDataset(X_train_q, y_train)
test_dataset = TensorDataset(X_test_q, y_test)
trainloader = DataLoader(train_dataset, batch_size=batch_size, shuffle=True)
testloader = DataLoader(test_dataset, batch_size=batch_size, shuffle=False)

# === Initialize Model ===
model = KAN([16,4,5], layers_precision=layers_precision, quantize=True, quantize_mode="sat",
            grid_size=40, spline_order=4, grid_eps=0.03, base_activation=nn.GELU, grid_range=[-8,8]).to(device)
print(sum(p.numel() for p in model.parameters()))

# === Brevitas Input Quantizer (6-bit) ===
# Returns a plain Tensor (not a QuantTensor), appropriate if KAN expects normal tensors.
# input_quant = qnn.QuantIdentity(
#     bit_width=input_bits,
#     quant_type=QuantType.INT,
#     signed=True,
#     return_quant_tensor=False,
#     # Make scaling constant (static); fix the clipping range
#     scaling_impl_type=ScalingImplType.CONST,
#     min_val=-8,
#     max_val=8,
# ).to(device).eval()
# param_count = sum(p.numel() for p in model.parameters())
# logging.info(f"Model has {param_count} trainable parameters")

optimizer = optim.AdamW(model.parameters(), lr=1e-4, weight_decay=1e-5)
scheduler = optim.lr_scheduler.ExponentialLR(optimizer, gamma=0.9)
criterion = nn.CrossEntropyLoss()

# === Training Loop ===
training_loss = []
testing_loss = []

# Define loss
criterion = nn.CrossEntropyLoss()
for epoch in range(30):
    # Train
    model.train()
    epoch_train_loss = 0  # Initialize loss for the epoch
    total_batches = 0
    with tqdm(trainloader) as pbar:
        for i, (inputs, labels) in enumerate(pbar):
            inputs = inputs.to(device)
            optimizer.zero_grad()
            output = model(inputs)
            loss = criterion(output, labels.to(device))
            loss.backward()
            optimizer.step()

            epoch_train_loss += loss.item()
            total_batches += 1

            accuracy = (output.argmax(dim=1) == labels.to(device)).float().mean()
            pbar.set_postfix(loss=loss.item(), accuracy=accuracy.item(), lr=optimizer.param_groups[0]['lr'])
    
    average_train_loss = epoch_train_loss / total_batches
    training_loss.append(average_train_loss)  # Record the average training loss

    # Validation
    model.eval()
    val_loss = 0
    val_accuracy = 0
    with torch.no_grad():
        for inputs, labels in testloader:
            inputs = inputs.to(device)
            output = model(inputs)
            val_loss += criterion(output, labels.to(device)).item()
            val_accuracy += (
                (output.argmax(dim=1) == labels.to(device)).float().mean().item()
            )
    val_loss /= len(testloader)
    val_accuracy /= len(testloader)
    testing_loss.append(val_loss)

    # Update learning rate
    scheduler.step()

    print(
        f"Epoch {epoch + 1}, Val Loss: {val_loss}, Val Accuracy: {val_accuracy}"
    )