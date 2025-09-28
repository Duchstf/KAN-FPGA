# === Imports ===
import sys, os, logging
from datetime import datetime

sys.path.append('../../src')
from KANQuant import KANQuant
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
from dataset import get_train_AD_data, get_test_AD_data

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
    "layers": [64, 16, 8, 16, 64],  
    "grid_range": [-2, 2],
    "layers_bitwidth": [7, 7, 7, 7, 7],  

    "min_val": -1,
    "max_val": 1,

    "grid_size": 30,
    "spline_order": 10,
    "grid_eps": 0.05,

    "base_activation": "nn.SiLU",
    
    "batch_size": 32,
    "num_epochs": 200,

    "learning_rate": 5e-4,
    "weight_decay": 1e-4,

    "prune_threshold": 0.1,
    "warmup_epochs": 100,
    "target_epoch": 300,
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
    max_val=config["max_val"],
    min_val=config["min_val"],
    act_scaling_impl=ParameterScaling(1.33),
    quant_type=QuantType.INT,
    return_quant_tensor = False),
    pre_transforms=[bn_in, input_bias],
    cuda=device.type == "cuda").to(device)

# === Load Data ===

X_train, y_train = get_train_AD_data()
X_test, y_test = get_test_AD_data()


X_train = torch.from_numpy(X_train).float().to(device)
X_test = torch.from_numpy(X_test).float().to(device)
y_train = torch.from_numpy(y_train).int().to(device)
y_test = torch.from_numpy(y_test).int().to(device)

print(y_test[0].shape)
print(X_train[0].shape)
print(X_test[0].shape)
print(y_train[0].shape)

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
best_remaining_fraction = 1.0

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

    # Prune the model
    remaining_fraction = model.prune_below_threshold(threshold=config["prune_threshold"], epoch=epoch, target_epoch=config["target_epoch"], warmup_epochs=config["warmup_epochs"])
    print(f"Epoch {epoch + 1:02d} | Train Loss: {average_train_loss:.4f} | Remaining Fraction: {remaining_fraction}")

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

    print(f"Epoch {epoch + 1:02d} | Val Loss Diff: {val_loss_diff:.4f} | Val avg AUC: {auc:.4f} | Val avg pAUC: {p_auc:.4f} | Remaining Fraction: {remaining_fraction:.4f}")

    # Update learning rate
    scheduler.step()

    logging.info(
        f"Epoch {epoch + 1:02d} | "
        f"Train Loss: {average_train_loss:.4f} | "
        f"Val Loss Diff: {val_loss_diff:.4f} | "
        f"Val avg AUC: {auc:.4f} | "
        f"Val avg pAUC: {p_auc:.4f} | "
        f"Remaining Fraction: {remaining_fraction:.4f}"
    )

    # === Save Checkpoint for each epoch ===
    checkpoint_path = f'{model_dir}/Anomaly_Detection_auc{auc:.4f}_epoch{epoch + 1}_remaining{remaining_fraction:.4f}.pt'
    torch.save({
        'epoch': epoch + 1,
        'model_state_dict': model.state_dict(),
        'optimizer_state_dict': optimizer.state_dict(),
        'val_auc': auc,
        'val_loss_diff': val_loss_diff,
        'remaining_fraction': remaining_fraction,
    }, checkpoint_path)
    logging.info(f"New best model saved with val AUC: {auc:.4f} and remaining fraction: {remaining_fraction:.4f}")