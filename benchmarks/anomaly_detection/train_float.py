# === Imports ===
import sys, os, logging
from datetime import datetime

sys.path.append('../../src')
from KAN_OG import KAN
from quant import QuantBrevitasActivation, ScalarBiasScale

from collections import defaultdict
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

os.environ["CUBLAS_WORKSPACE_CONFIG"] = ":4096:8"
#Set the seed
seed = 0
torch.manual_seed(seed)
np.random.seed(seed)

if torch.cuda.is_available():
    torch.cuda.manual_seed(seed)
    torch.cuda.manual_seed_all(seed)
torch.backends.cudnn.deterministic = True
torch.backends.cudnn.benchmark = False
torch.use_deterministic_algorithms(True, warn_only=True)

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

config = {"seed": seed, "layers": [64, 16, 8, 16, 64], "grid_range": [-2, 2], "layers_bitwidth": [7, 8, 8, 7, 8], "min_val": -1.0, "max_val": 1.0, "grid_size": 30, "spline_order": 10, "grid_eps": 0.05, "base_activation": "nn.SiLU", "batch_size": 256, "num_epochs": 200, "learning_rate": 0.001, "weight_decay": 0.0001, "gamma": 0.85, "prune_threshold": 0.1, "warmup_epochs": 100, "target_epoch": 300}
# === Load Data ===

data_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'data', 'ToyCar')

X_train = torch.from_numpy(np.load(f"{data_dir}/processed/X_train.npy")).float().to(device)
y_train = torch.from_numpy(np.load(f"{data_dir}/processed/y_train.npy")).int().to(device)
X_test = torch.from_numpy(np.load(f"{data_dir}/processed/X_test.npy")).float().to(device)
y_test = torch.from_numpy(np.load(f"{data_dir}/processed/y_test.npy")).int().to(device)

# === Create Data Loaders ===
train_dataset = TensorDataset(X_train, y_train)
test_dataset = TensorDataset(X_test, y_test)
trainloader = DataLoader(train_dataset, batch_size=config["batch_size"], shuffle=True)
testloader = DataLoader(test_dataset, batch_size=config["batch_size"], shuffle=False)

# === Initialize Model ===
#Define the model
model = nn.Sequential(
    nn.BatchNorm1d(64),
    KAN([64, 16, 8, 16, 64], grid_range=[-2, 2], grid_size=30, spline_order=10, base_activation=nn.SiLU)
).to(device)

optimizer = optim.AdamW(model.parameters(), lr=1e-3, weight_decay=1e-4)
scheduler = optim.lr_scheduler.ExponentialLR(optimizer, gamma=0.9)
criterion = nn.MSELoss()

# === Training Loop ===
training_loss = []
testing_loss = []
best_val_auc = 0.0

# Define loss - using MSE for autoencoder reconstruction
criterion = nn.MSELoss(reduction='none')
for epoch in range(config["num_epochs"]):
    # Train
    model.train()
    epoch_train_loss = 0  # Initialize loss for the epoch
    total_batches = 0
    if sys.stdout.isatty():
        # Use tqdm if outputting to terminal
        pbar = tqdm(trainloader)
    else:
        # Otherwise just iterate normally
        pbar = trainloader

    for i, (inputs, labels) in enumerate(pbar):
        inputs = inputs.to(device)
        optimizer.zero_grad()
        output = model(inputs)
        loss = criterion(output, inputs).mean()
        loss.backward()
        optimizer.step()

        epoch_train_loss += loss.item()
        total_batches += 1

        if sys.stdout.isatty():
            pbar.set_postfix(loss=loss.item(), lr=optimizer.param_groups[0]['lr'])

    
    average_train_loss = epoch_train_loss / total_batches
    training_loss.append(average_train_loss)  # Record the average training loss

    # Validation
    model.eval()
    val_loss_diff = 0

    y_pred_by_id_str = defaultdict(list)
    y_true_by_id_str = defaultdict(list)

    with torch.no_grad():
        if sys.stdout.isatty():
            # Use tqdm if outputting to terminal
            pbar = tqdm(testloader)
        else:
            # Otherwise just iterate normally
            pbar = testloader

        for i, (inputs, labels) in enumerate(pbar):

                y_trues, _ids = labels[:, 0], labels[:, 1]

                orig_shape = inputs.shape
                inputs_reshaped = inputs.to(device).reshape(-1, orig_shape[-1])
                output = model(inputs_reshaped).reshape(orig_shape)
                error = torch.mean(torch.square(inputs - output), axis=(1, 2))

                for _id, y_true, err in zip(_ids.cpu().numpy(), y_trues.cpu().numpy(), error.cpu().numpy()):
                    y_pred_by_id_str[_id].append(err)
                    y_true_by_id_str[_id].append(int(y_true))
                
                val_loss_diff += ((2 * y_trues - 1) * criterion(output, inputs).mean(dim=(1, 2))).mean().item()
                
    val_loss_diff /= len(testloader)
    testing_loss.append(val_loss_diff)

    # Calculate AUC
    auc_list = []
    p_auc_list = []
    for _id in y_true_by_id_str.keys():
        y_true = y_true_by_id_str[_id]
        y_pred = y_pred_by_id_str[_id]

        auc = roc_auc_score(y_true, y_pred) if len(y_true) > 1 else 0.0
        p_auc = roc_auc_score(y_true, y_pred, max_fpr=0.1) if len(y_true) > 1 else 0.0
        logging.info(f"Val AUC for {_id}: {auc:.4f} | pAUC: {p_auc:.4f}")

        auc_list.append(auc)
        p_auc_list.append(p_auc)

    auc = np.mean(auc_list)
    p_auc = np.mean(p_auc_list)

    print(f"Epoch {epoch + 1:02d} | Val Loss Diff: {val_loss_diff:.4f} | Val avg AUC: {auc:.4f} | Val avg pAUC: {p_auc:.4f}")

    best_val_auc = max(best_val_auc, auc)

    # Update learning rate
    scheduler.step()

    logging.info(
        f"Epoch {epoch + 1:02d} | "
        f"Train Loss: {average_train_loss:.4f} | "
        f"Val Loss Diff: {val_loss_diff:.4f} | "
        f"Val avg AUC: {auc:.4f} | "
        f"Val avg pAUC: {p_auc:.4f} | "
    )

    # === Save Checkpoint for each epoch ===
    print("Best AUC:", best_val_auc)