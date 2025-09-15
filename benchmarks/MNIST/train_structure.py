"""
Training file for structured pruning of KANQuant.
"""
import sys, os, logging
from datetime import datetime
import matplotlib.pyplot as plt
import numpy as np
import json

sys.path.append('../../src')
from KANQuant import KANQuant
from quant import QuantBrevitasActivation, ScalarBiasScale

# Train on MNIST
import torch
import torch.nn as nn
import torch.optim as optim
import torchvision
import torchvision.transforms as transforms
from torch.utils.data import DataLoader
from tqdm import tqdm

#For quantization
from brevitas.nn import QuantHardTanh
from brevitas.core.scaling import ParameterScaling
from brevitas.core.quant import QuantType

#Set the seed
seed = 420
torch.manual_seed(seed)
np.random.seed(seed)

#Set the device
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

# === Configuration ===
config = {
    "layers": [28*28, 32, 10],
    "grid_range": [-8, 8],
    "layers_bitwidth": [1, 6, 6],

    "grid_size": 30,
    "spline_order": 3,
    "grid_eps": 0.03,

    "base_activation": "nn.SiLU",
    
    "batch_size": 64,
    "num_epochs": 200,

    "learning_rate": 0.01,
    "weight_decay": 1e-4,

    "prune_threshold": 1,
    "warmup_epochs": 30,
    "random_seed": seed,

    "connections_to_keep": [32, 8],
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
MNIST_input_layer = QuantBrevitasActivation(
    QuantHardTanh(bit_width = config["layers_bitwidth"][0],
    max_val=1.0,
    min_val=-1.0,
    act_scaling_impl=ParameterScaling(1.33),
    quant_type=QuantType.INT,
    return_quant_tensor = False),
    pre_transforms=[bn_in, input_bias],
    cuda=device.type == "cuda").to(device)

#Define the model
model = KANQuant(config, MNIST_input_layer, device).to(device)

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

#Load MNIST
transform = transforms.Compose([transforms.ToTensor(), transforms.Normalize((0.1307,), (0.3081,))])
trainset = torchvision.datasets.MNIST(root="./data", train=True, download=False, transform=transform)
valset = torchvision.datasets.MNIST(root="./data", train=False, download=False, transform=transform)
trainloader = DataLoader(trainset, batch_size=config["batch_size"], shuffle=True)
valloader = DataLoader(valset, batch_size=config["batch_size"], shuffle=False)

# Define optimizer
optimizer = optim.AdamW(model.parameters(), lr=config["learning_rate"], weight_decay=config["weight_decay"])

# Define learning rate scheduler
scheduler = optim.lr_scheduler.ExponentialLR(optimizer, gamma=0.9)

# Define loss
criterion = nn.CrossEntropyLoss()
best_val_accuracy = 0.
sparsity = 1.0
for epoch in range(config["num_epochs"]):
    # Train
    model.train()
    with tqdm(trainloader) as pbar:
        for i, (images, labels) in enumerate(pbar):
            images = images.view(-1, 28 * 28).to(device)
            optimizer.zero_grad()
            output = model(images)

            loss = criterion(output, labels.to(device)) #+ model.quantization_loss(regularize_clipping=regularize_clipping)

            loss.backward()
            optimizer.step()
            accuracy = (output.argmax(dim=1) == labels.to(device)).float().mean()
            pbar.set_postfix(loss=loss.item(), accuracy=accuracy.item(), lr=optimizer.param_groups[0]['lr'])

    
    # Prune the model
    if epoch == config["warmup_epochs"]:
        print(f"--- Epoch {epoch}: Pruning network ---")
        sparsity = model.prune_connections_by_rank(config["connections_to_keep"])
        remaining_pct = sparsity * 100
        pruned_pct = (1 - sparsity) * 100
        print(f"Pruning complete. Connections remaining: {remaining_pct:.2f}% ({pruned_pct:.2f}% pruned).")
        print(f"Continuing training on the pruned network...")

    #Validation
    model.eval()
    val_loss = 0
    val_accuracy = 0
    with torch.no_grad():
        for images, labels in valloader:
            images = images.view(-1, 28 * 28).to(device)
            output = model(images)
            val_loss += criterion(output, labels.to(device)).item() #+ model.quantization_loss(regularize_clipping=regularize_clipping)
            val_accuracy += (
                (output.argmax(dim=1) == labels.to(device)).float().mean().item()
            )
    val_loss /= len(valloader)
    val_accuracy /= len(valloader)

    # Update learning rate
    scheduler.step()

    logging.info(
        f"Epoch {epoch + 1:02d} | "
        f"Train Loss: {loss:.4f} | "
        f"Val Loss: {val_loss:.4f} | "
        f"Val Accuracy: {val_accuracy:.4f} | "
        f"Remaining Fraction: {sparsity:.4f}"
    )

    # === Save Checkpoint if Best ===
    if val_accuracy > best_val_accuracy and sparsity < 0.99:
        best_val_accuracy = val_accuracy
        checkpoint_path = f'{model_dir}/MNIST_epoch{epoch + 1}_acc{val_accuracy:.4f}_remaining{sparsity:.4f}.pt'
        torch.save({
            'epoch': epoch + 1,
            'model_state_dict': model.state_dict(),
            'optimizer_state_dict': optimizer.state_dict(),
            'val_accuracy': val_accuracy,
            'val_loss': val_loss,
            'remaining_fraction': sparsity,
        }, checkpoint_path)
        logging.info(f"New model saved with val accuracy: {val_accuracy:.4f} and remaining fraction: {sparsity:.4f}")