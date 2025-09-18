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

from tqdm import tqdm
import json

#For quantization
from brevitas.nn import QuantHardTanh
from brevitas.core.scaling import ParameterScaling
from brevitas.core.quant import QuantType

#Set the seed
seed = 0
torch.manual_seed(seed)
np.random.seed(seed)

#Set the device
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

# === Load Data ===
def get_preqnt_dataset(data_file: str, split: str):
    unsw_nb15_data = np.load(data_file)
    splits = ["train", "test"]
    if not split in splits:
        print(f"Invalid dataset split: {split}")
        assert(False)
    part_data = unsw_nb15_data[split].astype(np.float32)
    part_data = torch.from_numpy(part_data)
    part_data_in = part_data[:, :-1]
    part_data_out = part_data[:, -1]
    return TensorDataset(part_data_in, part_data_out)


# Fetch the datasets
dataset = {}
dataset["train"] = get_preqnt_dataset("data/unsw_nb15_binarized.npz", split="train")
dataset["test"] = get_preqnt_dataset("data/unsw_nb15_binarized.npz", split="test")

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
config = {
    "layers": [593, 1],
    "grid_range": [-1, 1],
    "layers_bitwidth": [1, 2],

    "grid_size": 30,
    "spline_order": 3,
    "grid_eps": 0.03,

    "base_activation": "nn.SiLU",
    
    "batch_size": 64,
    "num_epochs": 200,

    "learning_rate": 1e-2,
    "weight_decay": 1e-4,

    "prune_threshold": 3,
    "target_epoch": 23,
    "warmup_epochs": 3,
    "random_seed": seed,
}

# === Data Loaders ===
trainloader = DataLoader(dataset["train"], batch_size=config["batch_size"], shuffle=True)
testloader  = DataLoader(dataset["test"], batch_size=config["batch_size"], shuffle=False)

#Create a new directory to save the config and checkpoints
model_dir = f'models/{datetime.now().strftime("%Y%m%d_%H%M%S")}'
os.makedirs(model_dir, exist_ok=True)
with open(f'{model_dir}/config.json', 'w') as f:
    json.dump(config, f)

# === Initialize Model ===

#Build the input layer
bn_in = nn.BatchNorm1d(config["layers"][0])
nn.init.constant_(bn_in.weight.data, 1)
nn.init.constant_(bn_in.bias.data, 0)
input_bias = ScalarBiasScale(scale=False, bias_init=-0.25)
NID_input_layer = QuantBrevitasActivation(
    QuantHardTanh(bit_width = config["layers_bitwidth"][0],
    max_val=1.0,
    min_val=-1.0,
    act_scaling_impl=ParameterScaling(1.33),
    quant_type=QuantType.INT,
    return_quant_tensor = False),
    pre_transforms=[bn_in, input_bias],
    cuda=device.type == "cuda").to(device)


#Define the model
model = KANQuant(config, NID_input_layer, device).to(device)

optimizer = optim.Adam(model.parameters(), lr=config["learning_rate"], weight_decay=config["weight_decay"])
scheduler = optim.lr_scheduler.ExponentialLR(optimizer, gamma=0.9)
criterion = nn.BCEWithLogitsLoss()

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

for epoch in range(config["num_epochs"]):
    model.train()
    epoch_train_loss, total_batches = 0.0, 0
    with tqdm(trainloader) as pbar:
        for inputs, targets in pbar:
            inputs, targets = inputs.to(device), targets.to(device)
            optimizer.zero_grad()
            logits = model(inputs)
            loss = criterion(logits, targets.unsqueeze(1).float())
            loss.backward(); optimizer.step()
            epoch_train_loss += loss.item(); total_batches += 1
            with torch.no_grad():
                preds = (torch.sigmoid(logits).squeeze(-1) > 0.5).long()
                acc = (preds == targets.long().squeeze(-1)).float().mean().item()
            pbar.set_postfix(loss=loss.item(), acc=acc, lr=optimizer.param_groups[0]['lr'])

    avg_train_loss = epoch_train_loss / max(1, total_batches)
    training_loss.append(avg_train_loss)

    remaining_fraction = model.prune_below_threshold(threshold=config["prune_threshold"], epoch=epoch, target_epoch=config["target_epoch"], warmup_epochs=config["warmup_epochs"])
    print(f"Remaining fraction: {remaining_fraction}")

    model.eval()
    val_loss, val_acc_sum = 0.0, 0.0
    with torch.no_grad():
        for inputs, targets in testloader:
            inputs, targets = inputs.to(device), targets.to(device)
            logits = model(inputs)
            val_loss += criterion(logits, targets.unsqueeze(1).float()).item()
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
        }, f'{model_dir}/NID_acc{val_acc:.4f}_epoch{epoch+1}.pt')
        logging.info(f"New best model saved with val accuracy: {val_acc:.4f}")

