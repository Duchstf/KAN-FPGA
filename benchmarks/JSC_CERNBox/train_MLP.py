# === Imports ===
import sys, os, logging
from datetime import datetime

sys.path.append('../../src')
from KAN_OG import KAN
from helpers import quantize_dataset
from dataset import JetSubstructureDataset

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

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

# === Configuration ===
layers_precision = [(6, 3), (6, 4), (6, 4)]

#Training parameters
batch_size = 64
num_epochs = 50

# Fetch the test set
dataset = {}
dataset["test"] = JetSubstructureDataset(
    "data/processed-pythia82-lhc13-all-pt1-50k-r1_h022_e0175_t220_nonu_truth.z",
    "config.yml",
    split="test"
)
dataset["train"] = JetSubstructureDataset(
    "data/processed-pythia82-lhc13-all-pt1-50k-r1_h022_e0175_t220_nonu_truth.z",
    "config.yml",
    split="train"
)

#Plot the distribution of the training data
os.makedirs("plots", exist_ok=True)
n_feat = dataset["train"].X.shape[1]
cols = 4
rows = math.ceil(n_feat / cols)

plt.figure(figsize=(4*cols, 3*rows))
for i in range(n_feat):
    plt.subplot(rows, cols, i+1)
    plt.hist(dataset["train"].X[:, i].cpu().numpy(), bins=50, alpha=0.7)
    plt.title(f"Feature {i}", fontsize=8)
    plt.tight_layout()

plt.savefig("plots/features_grid.png")
plt.close()

# === Load Data ===
X_train = dataset["train"].X.to(device)
y_train = dataset["train"].y.float().argmax(dim=1).to(device)
X_test = dataset["test"].X.to(device)
y_test = dataset["test"].y.float().argmax(dim=1).to(device)

#Quantize the data
# X_train_q, X_test_q = quantize_dataset(X_train, X_test, layers_precision[0], rounding="nearest")

# === Create Data Loaders ===
train_dataset = TensorDataset(X_train, y_train)
test_dataset = TensorDataset(X_test, y_test)
trainloader = DataLoader(train_dataset, batch_size=batch_size, shuffle=True)
testloader = DataLoader(test_dataset, batch_size=batch_size, shuffle=False)

# === Initialize Model ===
# MLP (same size as KAN)
model = nn.Sequential(
    nn.Linear(16, 8), nn.ReLU(),
    nn.Linear(8, 10)
).to(device)

optimizer = optim.AdamW(model.parameters(), lr=1e-3, weight_decay=1e-4)
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
