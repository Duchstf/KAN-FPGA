# === Imports ===
import sys, os, logging
from datetime import datetime

sys.path.append('../../src')
from KANQuant import KANQuant
from quant import QuantBrevitasActivation, ScalarBiasScale

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

#For quantization
from brevitas.nn import QuantHardTanh, QuantIdentity
from brevitas.core.scaling import ParameterScaling
from brevitas.core.quant import QuantType

#Set the seed
seed = 1283
torch.manual_seed(seed)
np.random.seed(seed)

#Set the device
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

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

BITWIDTH = 2

# === Configuration ===
config = {
    "seed": seed,
    "layers": [16, 8, 5],
    "grid_range": [-2, 2],
    "layers_bitwidth": [BITWIDTH, BITWIDTH, BITWIDTH],

    "grid_size": 40,
    "spline_order": 10,
    "grid_eps": 0.05,

    "base_activation": "nn.SiLU",
    
    "batch_size": 512,
    "num_epochs": 200,

    "learning_rate": 1e-3,
    "weight_decay": 1e-3,

    "prune_threshold": 0,
    "target_epoch": 5,
    "warmup_epochs": 0,
    "random_seed": seed,
}

#Create a new directory to save the config and checkpoints
model_dir = f'bitwidth/{datetime.now().strftime("%Y%m%d_%H%M%S")}'
os.makedirs(model_dir, exist_ok=True)
with open(f'{model_dir}/config.json', 'w') as f:
    json.dump(config, f)

#Build the input layer
bn_in = nn.BatchNorm1d(config["layers"][0])
nn.init.constant_(bn_in.weight.data, 1)
nn.init.constant_(bn_in.bias.data, 0)
input_bias = ScalarBiasScale(scale=False, bias_init=-0.25)
JSC_input_layer = QuantBrevitasActivation(
    QuantHardTanh(bit_width = config["layers_bitwidth"][0],
    max_val=1.5,
    min_val=-1.5,
    act_scaling_impl=ParameterScaling(1.33),
    quant_type=QuantType.INT,
    return_quant_tensor = False),
    pre_transforms=[bn_in, input_bias],
    cuda=device.type == "cuda").to(device)

# === Load Data ===
data_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'data')
X_train = torch.from_numpy(np.load(os.path.join(data_dir, 'X_train.npy'))).float().to(device)
y_train = torch.from_numpy(np.load(os.path.join(data_dir, 'y_train.npy'))).float().to(device).argmax(dim=1)
X_test = torch.from_numpy(np.load(os.path.join(data_dir, 'X_test.npy'))).float().to(device)
y_test = torch.from_numpy(np.load(os.path.join(data_dir, 'y_test.npy'))).float().to(device).argmax(dim=1)

# === Create Data Loaders ===
train_dataset = TensorDataset(X_train, y_train)
test_dataset = TensorDataset(X_test, y_test)
trainloader = DataLoader(train_dataset, batch_size=config["batch_size"], shuffle=True)
testloader = DataLoader(test_dataset, batch_size=config["batch_size"], shuffle=False)

# === Initialize Model ===
#Define the model
model = KANQuant(config, JSC_input_layer, device).to(device)

optimizer = optim.AdamW(model.parameters(), lr=config["learning_rate"], weight_decay=config["weight_decay"])
scheduler = optim.lr_scheduler.ExponentialLR(optimizer, gamma=0.999)
criterion = nn.CrossEntropyLoss()

# === Training Loop ===
training_loss = []
testing_loss = []
best_val_accuracy = 0.0

# Define loss
criterion = nn.CrossEntropyLoss()
for epoch in range(config["num_epochs"]):
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

    # Prune the model
    remaining_fraction = model.prune_below_threshold(threshold=config["prune_threshold"], epoch=epoch, target_epoch=config["target_epoch"], warmup_epochs=config["warmup_epochs"])
    print(f"Remaining fraction: {remaining_fraction}")

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

    logging.info(
        f"Epoch {epoch + 1:02d} | "
        f"Train Loss: {average_train_loss:.4f} | "
        f"Val Loss: {val_loss:.4f} | "
        f"Val Accuracy: {val_accuracy:.4f} | "
        f"Remaining Fraction: {remaining_fraction:.4f}"
    )

    # === Save Checkpoint if Best ===
    #Always save the model
    checkpoint_path = f'{model_dir}/JSC_OpenML_acc{val_accuracy:.4f}_epoch{epoch + 1}_remaining{remaining_fraction:.4f}.pt'
    torch.save({
        'epoch': epoch + 1,
        'model_state_dict': model.state_dict(),
        'optimizer_state_dict': optimizer.state_dict(),
        'val_accuracy': val_accuracy,
        'val_loss': val_loss,
        'remaining_fraction': remaining_fraction,
    }, checkpoint_path)
    logging.info(f"New best model saved with val accuracy: {val_accuracy:.4f}, remaining fraction: {remaining_fraction:.4f}")