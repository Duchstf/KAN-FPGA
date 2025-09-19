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

from sklearn.metrics import roc_curve, auc, roc_auc_score
from tqdm import tqdm
import json

#For quantization
from brevitas.nn import QuantHardTanh
from brevitas.core.scaling import ParameterScaling
from brevitas.core.quant import QuantType

import common as com
from dataset import get_AD_data_for_split

#Set the seed
seed = 0
torch.manual_seed(seed)
np.random.seed(seed)

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

config = {
    "seed": seed,
    "layers": [128, 32, 8, 32, 128],  
    "grid_range": [-4, 4],
    "layers_bitwidth": [8, 8, 8, 8, 8],  

    "grid_size": 30,
    "spline_order": 10,
    "grid_eps": 0.05,

    "base_activation": "nn.SiLU",
    
    "batch_size": 32,
    "num_epochs": 200,

    "learning_rate": 1e-3,
    "weight_decay": 1e-4,

    "prune_threshold": 0.04,
}

#Create a new directory to save the config and checkpoints
model_dir = f'models/{datetime.now().strftime("%Y%m%d_%H%M%S")}'
os.makedirs(model_dir, exist_ok=True)
with open(f'{model_dir}/config.json', 'w') as f:
    json.dump(config, f)

#Build the input layer
bn_in = nn.BatchNorm1d(config["layers"][0])
nn.init.constant_(bn_in.weight.data, 1)
nn.init.constant_(bn_in.bias.data, 0)
input_bias = ScalarBiasScale(scale=False, bias_init=-0.25)
AD_input_layer = QuantBrevitasActivation(
    QuantHardTanh(bit_width = config["layers_bitwidth"][0],
    max_val=100.0,
    min_val=-100.0,
    act_scaling_impl=ParameterScaling(1.33),
    quant_type=QuantType.INT,
    return_quant_tensor = False),
    pre_transforms=[bn_in, input_bias],
    cuda=device.type == "cuda").to(device)

# === Load Data ===

X_train, y_train = get_AD_data_for_split("train")
X_test, y_test = get_AD_data_for_split("test")

print(X_train[0].shape)
print(X_test[0].shape)
print(y_train[0].shape)
print(y_test[0].shape)

X_train = torch.from_numpy(X_train).float().to(device)
X_test = torch.from_numpy(X_test).float().to(device)
y_train = torch.from_numpy(y_train).long().to(device)
y_test = torch.from_numpy(y_test).long().to(device)

# === Create Data Loaders ===
train_dataset = TensorDataset(X_train, y_train)
test_dataset = TensorDataset(X_test, y_test)
trainloader = DataLoader(train_dataset, batch_size=config["batch_size"], shuffle=True)
testloader = DataLoader(test_dataset, batch_size=config["batch_size"], shuffle=False)

# === Initialize Model ===
#Define the model
model = KANQuant(config, AD_input_layer, device).to(device)

optimizer = optim.AdamW(model.parameters(), lr=config["learning_rate"], weight_decay=config["weight_decay"])
scheduler = optim.lr_scheduler.ExponentialLR(optimizer, gamma=0.9)
criterion = nn.MSELoss()

# === Training Loop ===
training_loss = []
testing_loss = []
best_val_auc = 0.0

# Define loss - using MSE for autoencoder reconstruction
criterion = nn.MSELoss()
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
            loss = criterion(output, inputs)
            loss.backward()
            optimizer.step()

            epoch_train_loss += loss.item()
            total_batches += 1

            pbar.set_postfix(loss=loss.item(), lr=optimizer.param_groups[0]['lr'])

    
    average_train_loss = epoch_train_loss / total_batches
    training_loss.append(average_train_loss)  # Record the average training loss

    # Prune the model
    remaining_fraction = model.prune_below_threshold(threshold=config["prune_threshold"])
    print(f"Remaining fraction: {remaining_fraction}")

    # Validation
    model.eval()
    val_loss = 0

    y_pred = []
    y_true = []

    y_pred_curr = []
    y_true_curr = []

    samples_per_file = 200
    
    with torch.no_grad():
        with tqdm(testloader) as pbar:
            for i, (inputs, labels) in enumerate(pbar):
                if i != 0 and (i * config["batch_size"]) % samples_per_file == 0:
                    # take mean of y_pred and y_true for past samples_per_file samples
                    y_pred.append(np.mean(y_pred_curr))
                    y_true.append(int(np.mean(y_true_curr)))
                    y_pred_curr = []
                    y_true_curr = []

                inputs = inputs.to(device)
                output = model(inputs)

                val_loss += criterion(output, inputs).item()
                
                # For AUC calculation
                y_pred_curr.append(torch.mean(torch.square(inputs - output)).cpu().numpy())
                y_true_curr.append(int(labels[0].cpu().numpy()))
    
    val_loss /= len(testloader)
    testing_loss.append(val_loss)

    # Calculate AUC
    print(len(y_true))
    print(len(y_pred))
    auc = roc_auc_score(y_true, y_pred) if len(y_true) > 1 else 0.0
    p_auc = roc_auc_score(y_true, y_pred, max_fpr=0.1) if len(y_true) > 1 else 0.0

    # Update learning rate
    scheduler.step()

    logging.info(
        f"Epoch {epoch + 1:02d} | "
        f"Train Loss: {average_train_loss:.4f} | "
        f"Val Loss: {val_loss:.4f} | "
        f"Val AUC: {auc:.4f} | "
        f"Val pAUC: {p_auc:.4f} | "
        f"Remaining Fraction: {remaining_fraction:.4f}"
    )

    # === Save Checkpoint if Best ===
    if auc > best_val_auc:
        best_val_auc = auc
        checkpoint_path = f'{model_dir}/Anomaly_Detection_auc{auc:.4f}_epoch{epoch + 1}.pt'
        torch.save({
            'epoch': epoch + 1,
            'model_state_dict': model.state_dict(),
            'optimizer_state_dict': optimizer.state_dict(),
            'val_auc': auc,
            'val_loss': val_loss,
            'remaining_fraction': remaining_fraction,
        }, checkpoint_path)
        logging.info(f"New best model saved with val AUC: {auc:.4f}")