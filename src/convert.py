import os, json, sys, shutil
import torch

sys.path.append('../../src')
import KANFPGA 

device = "cuda" if torch.cuda.is_available() else "cpu"

model_tag = "20250827_123148"

# --- 1. List all model files and find the one with best accuracy ---
model_dir = f"models/{model_tag}"
files = [f for f in os.listdir(model_dir) if f.endswith(".pt")]

if not files:
    raise FileNotFoundError(f"No model checkpoint files found in '{model_dir}' folder.")

# Sort files by accuracy descending
files.sort(key=lambda x: float(x.split('_acc')[1].split('_epoch')[0]), reverse=True)

#Load the config
with open(os.path.join(model_dir, "config.json"), "r") as f: config = json.load(f)

# Load the model with the best accuracy
checkpoint = torch.load(os.path.join(model_dir, files[0]), map_location=torch.device(device))
state_dict = checkpoint["model_state_dict"]

# --- 2. Handle hardware folder ---
hardware_dir = f"models/{model_tag}/hardware"
if os.path.exists(hardware_dir):
    choice = input(f"'{hardware_dir}' already exists. Overwrite? (y/n): ").strip().lower()
    if choice == "y":
        shutil.rmtree(hardware_dir)
        print(f"Deleted '{hardware_dir}' folder.")
    else:
        print("Exiting without changes.")
        exit()
os.makedirs(hardware_dir, exist_ok=True)
print(f"Created '{hardware_dir}' folder.")

print(f"Loaded model from {files[0]}")
print(f"Remaining fraction: {checkpoint['remaining_fraction']}")
print(f"Epoch: {checkpoint['epoch']}")
print(f"Val Accuracy: {checkpoint['val_accuracy']}")


# ---- 3. Convert model to hardware-specific format ----
KANFPGA.converter(state_dict, remaining_fraction=checkpoint['remaining_fraction'], config=config, output_dir=hardware_dir)