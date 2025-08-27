# === Imports ===
import sys, os, logging
from datetime import datetime

sys.path.append('../../src')
from KAN_QAT import KAN
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

#Set the seed
seed = 0
torch.manual_seed(seed)
np.random.seed(seed)

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
layers_precision = [(6, 3), (8, 4), (8, 4)]
grid_size = 40
spline_order = 4

#Training parameters
batch_size = 64
num_epochs = 50
regularize_clipping = 1e-6

#Save to a config json file
config = {
    "layers": [16, 4, 5],
    "layers_precision": layers_precision, #!!!Attention: the precision is of the form (bit_width, integer_width)

    "grid_size": grid_size,
    "grid_eps": 0.03,

    "spline_order": spline_order,
    "base_activation": "nn.GELU",

    "quantize_clip": False,
    "quantize": True,
}

#Create a new directory to save the config and checkpoints
model_dir = f'models/{datetime.now().strftime("%Y%m%d_%H%M%S")}'
os.makedirs(model_dir, exist_ok=True)
with open(f'{model_dir}/config.json', 'w') as f:
    json.dump(config, f)

# === Load Data ===
X_train = torch.from_numpy(np.load('data/X_train_val.npy')).float().to(device)
y_train = torch.from_numpy(np.load('data/y_train_val.npy')).float().to(device).argmax(dim=1)
X_test = torch.from_numpy(np.load('data/X_test.npy')).float().to(device)
y_test = torch.from_numpy(np.load('data/y_test.npy')).float().to(device).argmax(dim=1)

#Quantize the data
X_train_q, X_test_q = quantize_dataset(X_train, X_test, layers_precision[0], rounding="nearest")

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
model = KAN(config["layers"],
            layers_precision=config["layers_precision"], 
            quantize=config["quantize"], 
            quantize_clip=config["quantize_clip"],
            grid_size=config["grid_size"], 
            spline_order=config["spline_order"], 
            grid_eps=config["grid_eps"], 
            base_activation=eval(config["base_activation"])).to(device)
print(sum(p.numel() for p in model.parameters()))

optimizer = optim.AdamW(model.parameters(), lr=1e-4, weight_decay=1e-5)
scheduler = optim.lr_scheduler.ExponentialLR(optimizer, gamma=0.9)
criterion = nn.CrossEntropyLoss()

# === Training Loop ===
training_loss = []
testing_loss = []
best_val_accuracy = 0.0

# Define loss
criterion = nn.CrossEntropyLoss()
for epoch in range(num_epochs):
    # Train
    model.train()
    epoch_train_loss = 0  # Initialize loss for the epoch
    total_batches = 0
    with tqdm(trainloader) as pbar:
        for i, (inputs, labels) in enumerate(pbar):
            inputs = inputs.to(device)
            optimizer.zero_grad()
            output = model(inputs)
            loss = criterion(output, labels.to(device)) + model.quantization_loss(regularize_clipping=regularize_clipping)
            loss.backward()
            optimizer.step()

            epoch_train_loss += loss.item()
            total_batches += 1

            accuracy = (output.argmax(dim=1) == labels.to(device)).float().mean()
            pbar.set_postfix(loss=loss.item(), accuracy=accuracy.item(), lr=optimizer.param_groups[0]['lr'])

            #Reset quantization statistics
            model.reset_quant_stats()
    
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
            val_loss += criterion(output, labels.to(device)).item() + model.quantization_loss(regularize_clipping=regularize_clipping)
            val_accuracy += (
                (output.argmax(dim=1) == labels.to(device)).float().mean().item()
            )
    val_loss /= len(testloader)
    val_accuracy /= len(testloader)
    testing_loss.append(val_loss)

    # Update learning rate
    scheduler.step()

    logging.info(
        f"Epoch {epoch + 1:02d} | "
        f"Train Loss: {average_train_loss:.4f} | "
        f"Val Loss: {val_loss:.4f} | "
        f"Val Accuracy: {val_accuracy:.4f}"
    )

    # === Save Checkpoint if Best ===
    if val_accuracy > best_val_accuracy:
        best_val_accuracy = val_accuracy
        checkpoint_path = f'{model_dir}/jets_grid{grid_size}_spline{spline_order}_acc{val_accuracy:.4f}_epoch{epoch + 1}.pt'
        torch.save({
            'epoch': epoch + 1,
            'model_state_dict': model.state_dict(),
            'optimizer_state_dict': optimizer.state_dict(),
            'val_accuracy': val_accuracy,
            'val_loss': val_loss,
        }, checkpoint_path)
        logging.info(f"New best model saved with val accuracy: {val_accuracy:.4f}")