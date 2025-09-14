import sys, os, random, json
import numpy as np
import torch
import torch.nn as nn
from datetime import datetime
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.datasets import make_moons
from torch.utils.data import TensorDataset, DataLoader
import logging
from tqdm import tqdm
import torch.optim as optim

sys.path.append('../../../src')
from KANQuant import KANQuant
from quant import QuantBrevitasActivation, ScalarBiasScale

#For quantization
from brevitas.nn import QuantHardTanh
from brevitas.core.scaling import ParameterScaling
from brevitas.core.quant import QuantType

# -------------------------------
# Reproducibility & Device
# -------------------------------
SEED = 420
random.seed(SEED)
np.random.seed(SEED)
torch.manual_seed(SEED)
if torch.cuda.is_available():
    torch.cuda.manual_seed_all(SEED)

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
print("Device:", device)

# -------------------------------
# Configuration
# -------------------------------
config = {
    "layers": [2, 2, 1],
    "grid_range": [-8, 8],
    "layers_bitwidth": [6, 5, 8],

    "grid_size": 6,
    "spline_order": 3,
    "grid_eps": 0.05,

    "base_activation": "nn.GELU",
    
    "batch_size": 64,
    "num_epochs": 200,

    "learning_rate": 1e-2,
    "weight_decay": 1e-4,

    "prune_threshold": 0,
    "target_epoch": 50,
    "warmup_epochs": 10,
    "random_seed": SEED,
}

model_dir = f'models/{datetime.now().strftime("%Y%m%d_%H%M%S")}'
os.makedirs(model_dir, exist_ok=True)
with open(f'{model_dir}/config.json', 'w') as f: json.dump(config, f)

# -------------------------------
# Data: Two-Moons (binary), split FIRST, scale on TRAIN
# -------------------------------
X_all, y_all = make_moons(n_samples=10000, noise=0.2, random_state=SEED)
X_tr_raw, X_te_raw, y_tr, y_te = train_test_split(
    X_all, y_all, test_size=0.2, random_state=SEED, shuffle=True, stratify=y_all
)

scaler = StandardScaler()
X_tr = scaler.fit_transform(X_tr_raw); X_te = scaler.transform(X_te_raw)

X_tr_t = torch.from_numpy(X_tr).float().to(device)
X_te_t = torch.from_numpy(X_te).float().to(device)
y_tr_t = torch.from_numpy(y_tr).float().unsqueeze(1).to(device)  # for BCEWithLogits
y_te_t = torch.from_numpy(y_te).float().unsqueeze(1).to(device)

dataset = {
    "train_input": X_tr_t,
    "train_label": y_tr_t,
    "test_input":  X_te_t,
    "test_label":  y_te_t,
}
print(f"in_features={X_tr_t.shape[1]}, trainN={len(y_tr)}, testN={len(y_te)}")

# === Data Loaders ===
trainloader = DataLoader(TensorDataset(X_tr_t, y_tr_t), batch_size=config["batch_size"], shuffle=True)
testloader  = DataLoader(TensorDataset(X_te_t, y_te_t), batch_size=config["batch_size"], shuffle=False)

# -------------------------------
# Model
# -------------------------------

#Build the input layer
bn_in = nn.BatchNorm1d(config["layers"][0])
nn.init.constant_(bn_in.weight.data, 1)
nn.init.constant_(bn_in.bias.data, 0)
input_bias = ScalarBiasScale(scale=False, bias_init=-0.25)
Moons_input_layer = QuantBrevitasActivation(
    QuantHardTanh(bit_width = config["layers_bitwidth"][0],
    max_val=1.0,
    min_val=-1.0,
    act_scaling_impl=ParameterScaling(1.33),
    quant_type=QuantType.INT,
    return_quant_tensor = False),
    pre_transforms=[bn_in, input_bias],
    cuda=device.type == "cuda").to(device)

#Define the model
model = KANQuant(config, Moons_input_layer, device).to(device)

optimizer = optim.AdamW(model.parameters(), lr=config["learning_rate"], weight_decay=config["weight_decay"])
scheduler = optim.lr_scheduler.ExponentialLR(optimizer, gamma=0.9)
criterion = nn.BCEWithLogitsLoss()

# -------------------------------
# Metrics (sigmoid -> probability)
# -------------------------------
@torch.no_grad()
def train_acc():
    model.eval()
    logits = model(dataset["train_input"]).squeeze(-1)   # [Ntr]
    p = torch.sigmoid(logits)
    preds = (p > 0.5).long()
    labels = dataset["train_label"].long().squeeze(-1)
    return (preds == labels).float().mean()

@torch.no_grad()
def test_acc():
    model.eval()
    logits = model(dataset["test_input"]).squeeze(-1)    # [Nte]
    p = torch.sigmoid(logits)
    preds = (p > 0.5).long()
    labels = dataset["test_label"].long().squeeze(-1)
    return (preds == labels).float().mean()

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
            logits = model(inputs)               # [B,1]
            loss = criterion(logits, targets)
            loss.backward(); optimizer.step()
            epoch_train_loss += loss.item(); total_batches += 1
            with torch.no_grad():
                preds = (torch.sigmoid(logits).squeeze(-1) > 0.5).long()
                acc = (preds == targets.long().squeeze(-1)).float().mean().item()
            pbar.set_postfix(loss=loss.item(), acc=acc, lr=optimizer.param_groups[0]['lr'])

    avg_train_loss = epoch_train_loss / max(1, total_batches)
    training_loss.append(avg_train_loss)

    remaining_fraction = model.prune_below_threshold(threshold=config["prune_threshold"])
    print(f"Remaining fraction: {remaining_fraction}")

    model.eval()
    val_loss, val_acc_sum = 0.0, 0.0
    with torch.no_grad():
        for inputs, targets in testloader:
            inputs, targets = inputs.to(device), targets.to(device)
            logits = model(inputs)
            val_loss += criterion(logits, targets).item()
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
        }, f'{model_dir}/TwoMoons_bin_acc{val_acc:.4f}_epoch{epoch+1}.pt')
        logging.info(f"New best model saved with val accuracy: {val_acc:.4f}")

