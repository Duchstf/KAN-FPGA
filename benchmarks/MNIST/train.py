import sys, os, logging
from datetime import datetime
import matplotlib.pyplot as plt
import numpy as np
import json

sys.path.append('../../src')
from KAN_QAT import KAN

# Train on MNIST
import torch
import torch.nn as nn
import torch.optim as optim
import torchvision
import torchvision.transforms as transforms
from torch.utils.data import DataLoader
from tqdm import tqdm

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

#Set the seed
seed = 420
torch.manual_seed(seed)
np.random.seed(seed)

# Load MNIST
# Transform: convert to tensor and binarize
transform = transforms.Compose([transforms.ToTensor(), transforms.Lambda(lambda x: (x > 0).float())])

trainset = torchvision.datasets.MNIST(root="./data", train=True, download=False, transform=transform)
valset = torchvision.datasets.MNIST(root="./data", train=False, download=False, transform=transform)
trainloader = DataLoader(trainset, batch_size=64, shuffle=True)
valloader = DataLoader(valset, batch_size=64, shuffle=False)

# === Configuration ===
#Model parameters
layers_precision = [(None, None), (5, 3), (16, 6)]
grid_size = 3
spline_order = 3

#Training parameters
batch_size = 64
num_epochs = 200
regularize_clipping = 1e-5

#Save to a config json file
config = {
    "layers": [28*28, 64, 10],
    "input_grid_range": [0, 1],
    "layers_precision": layers_precision, #!!!Attention: the precision is of the form (bit_width, integer_width)

    "grid_size": grid_size,
    "grid_eps": 0.03,

    "spline_order": spline_order,
    "base_activation": "nn.GELU",

    "quantize_clip": True,
    "quantize": True,
    "regularize_clipping": regularize_clipping,
}

#Create a new directory to save the config and checkpoints
model_dir = f'models/{datetime.now().strftime("%Y%m%d_%H%M%S")}'
os.makedirs(model_dir, exist_ok=True)
with open(f'{model_dir}/config.json', 'w') as f:
    json.dump(config, f)

# Define model
model = KAN(config["layers"],
            layers_precision=config["layers_precision"], 
            input_grid_range=config["input_grid_range"],
            quantize=config["quantize"], 
            quantize_clip=config["quantize_clip"],
            grid_size=config["grid_size"], 
            spline_order=config["spline_order"], 
            grid_eps=config["grid_eps"], 
            base_activation=eval(config["base_activation"])).to(device)

# Define optimizer
optimizer = optim.AdamW(model.parameters(), lr=1e-3, weight_decay=1e-4)

# Define learning rate scheduler
scheduler = optim.lr_scheduler.ExponentialLR(optimizer, gamma=0.9)

# Define loss
criterion = nn.CrossEntropyLoss()
best_val_accuracy = 0.0
for epoch in range(num_epochs):
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
    remaining_fraction = model.prune_below_threshold(threshold=0.0)

    # Validation
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
        f"Remaining Fraction: {remaining_fraction:.4f}"
    )

    # === Save Checkpoint if Best ===
    if val_accuracy > best_val_accuracy:
        best_val_accuracy = val_accuracy
        checkpoint_path = f'{model_dir}/MNIST_acc{val_accuracy:.4f}_epoch{epoch + 1}.pt'
        torch.save({
            'epoch': epoch + 1,
            'model_state_dict': model.state_dict(),
            'optimizer_state_dict': optimizer.state_dict(),
            'val_accuracy': val_accuracy,
            'val_loss': val_loss,
            'remaining_fraction': remaining_fraction,
        }, checkpoint_path)
        logging.info(f"New best model saved with val accuracy: {val_accuracy:.4f}")