import matplotlib.pyplot as plt
import numpy as np
import os, argparse, json
from argparse import Namespace
import time

import sys
sys.path.append(os.path.abspath("/home/aarushg"))

import keras_model as models
import get_dataset as str_ww_data
import str_ww_util as util

from torch.utils.data import DataLoader, Dataset
import torch
from torch import nn
import torch.optim as optim
import torch.nn.functional as F

from efficient_kan import KAN

from models import *

from tqdm import tqdm
import mplhep as hep
hep.style.use("CMS")

from torch.utils.data import TensorDataset, DataLoader
torch.cuda.empty_cache()
device = 'cuda' if torch.cuda.is_available() else 'cpu'

from KAN_Conv_Impl.KANLinear import KANLinear
from KAN_Conv_Impl.KANConv import KANConv 

from sklearn.metrics import roc_curve, auc
import matplotlib.pyplot as plt

from types import SimpleNamespace

flags = SimpleNamespace(**dict(num_background_clips=50, l2_reg=0.001, min_snr_training=0.5, min_snr_validation=0.5, min_snr_test=0.5, fraction_target_training=0.2, fraction_target_validation=0.2, fraction_target_test=0.2, fraction_silent_training=0.1, fraction_silent_validation=0.1, fraction_silent_test=0.1, foreground_volume_min_training=0.25, foreground_volume_min_validation=0.25, foreground_volume_min_test=0.25, foreground_volume_max_training=1.5, foreground_volume_max_validation=1.5, foreground_volume_max_test=1.5, background_volume_training=2.0, background_volume_validation=1.5, background_volume_test=0.0, background_frequency=0.8, time_shift_ms=100.0, clip_duration_ms=1000, window_size_ms=64.0, window_stride_ms=32.0, dct_coefficient_count=40, num_classes=3, num_samples_training=100000, num_samples_validation=100000, num_samples_test=-1, batch_size=100, sample_rate=16000, learning_rate=0.001, use_qat=True, epochs=5, pretrain_epochs=3, run_test_set=True, saved_model_path='trained_models/str_ww_model.h5', model_init_path=None, lr_sched_name='reduce_on_plateau', plot_dir='./plots', speech_commands_path='/home/aarushg/KAN-FPGA/bench_marks/streaming_wakeword/data/speech_commands_v0.02', musan_path='/home/aarushg/KAN-FPGA/bench_marks/streaming_wakeword/data/musan'))


def preprocess(data):
    x, y = data[0].numpy(), data[1].numpy()
    torch_x = torch.from_numpy(x)
    # return torch_x.view(torch_x.shape[1], torch_x.shape[0], *torch_x.shape[2:]), y
    return torch_x.transpose(0, 2).transpose(1, 2), y
    # return torch_x,y

class SimpleDataset(Dataset):
    def __init__(self, data):
        self.data = data  # Store the (x, y) pairs

    def __len__(self):
        return len(self.data)  # Number of samples

    def __getitem__(self, idx):
        return self.data[idx]  # Get a single (x, y) pair


BATCH_SIZE = 32
SAVE_DIR = "/home/aarushg/KAN-FPGA/bench_marks/streaming_wakeword/datasets"

start_time = time.time()

if os.path.exists(f"{SAVE_DIR}/train_dataset.pth"):

    train_dataset = torch.load(f"{SAVE_DIR}/train_dataset.pth")
    val_dataset = torch.load(f"{SAVE_DIR}/val_dataset.pth")
    test_dataset = torch.load(f"{SAVE_DIR}/test_dataset.pth")

else:

    ds_train_tf, ds_test_tf, ds_val_tf = str_ww_data.get_all_datasets(flags)

    train_dataset = SimpleDataset(list(map(preprocess, ds_train_tf.unbatch())))
    test_dataset = SimpleDataset(list(map(preprocess, ds_test_tf.unbatch())))
    val_dataset = SimpleDataset(list(map(preprocess, ds_val_tf.unbatch())))

    torch.save(train_dataset, f"{SAVE_DIR}/train_dataset.pth")
    torch.save(val_dataset, f"{SAVE_DIR}/val_dataset.pth")
    torch.save(test_dataset, f"{SAVE_DIR}/test_dataset.pth")

end_time = time.time()  # Record the end time
elapsed_time = end_time - start_time

print(f"Elapsed time (loading dataset): {elapsed_time:.6f} seconds")

start_time = time.time() 

train_loader = DataLoader(train_dataset, batch_size = BATCH_SIZE, shuffle = True, drop_last = True)
val_loader = DataLoader(val_dataset, batch_size = BATCH_SIZE, shuffle = True, drop_last = True)
test_loader = DataLoader(test_dataset, batch_size = BATCH_SIZE, shuffle = True, drop_last = True)

end_time = time.time()  # Record the end time
elapsed_time = end_time - start_time

print(f"Elapsed time (constructing dataloader): {elapsed_time:.6f} seconds")

model = make_mini_kan_cnn()
model.to(device)
# Define optimizer
optimizer = optim.AdamW(model.parameters(), lr=1e-4, weight_decay=1e-5)
# Define learning rate scheduler
scheduler = optim.lr_scheduler.ExponentialLR(optimizer, gamma=0.9)

train_losses = []
val_losses = []

# Define loss
criterion = nn.CrossEntropyLoss()
for epoch in range(30):
    # Train
    model.train()
    epoch_train_loss = 0  # Initialize loss for the epoch
    total_batches = 0
    with tqdm(train_loader) as pbar:
        for i, (inputs, labels) in enumerate(pbar):
            inputs = inputs.to(device)
            optimizer.zero_grad()
            output = model(inputs)
            loss = criterion(output, labels.to(device))
            loss.backward()
            optimizer.step()

            epoch_train_loss += loss.item()
            total_batches += 1

            accuracy = (output.argmax(dim=1) == labels.argmax(dim=1).to(device)).float().mean()
            pbar.set_postfix(loss=loss.item(), accuracy=accuracy.item(), lr=optimizer.param_groups[0]['lr'])
    
    average_train_loss = epoch_train_loss / total_batches
    train_losses.append(average_train_loss)  # Record the average training loss

    # Validation
    model.eval()
    val_loss = 0
    val_accuracy = 0
    with torch.no_grad():
        for inputs, labels in val_loader:
            inputs = inputs.to(device)
            output = model(inputs)
            val_loss += criterion(output, labels.to(device)).item()
            val_accuracy += (
                (output.argmax(dim=1) == labels.argmax(dim=1).to(device)).float().mean().item()
            )
    val_loss /= len(val_loader)
    val_accuracy /= len(val_loader)
    val_losses.append(val_loss)

    # Update learning rate
    scheduler.step()

    print(
        f"Epoch {epoch + 1}, Val Loss: {val_loss}, Val Accuracy: {val_accuracy}"
    )
