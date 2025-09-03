import os, json, sys, shutil
import torch
import torch.nn as nn

# Local imports
sys.path.append('../../src')
import KANFPGA
from KAN_LUT import KAN_LUT
from quant import QuantBrevitas, ScalarBiasScale

#For quantization
from brevitas.nn import QuantHardTanh
from brevitas.core.scaling import ParameterScaling
from brevitas.core.quant import QuantType

device = "cuda" if torch.cuda.is_available() else "cpu"

model_tag = "20250903_113724"

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

#Rebuild the input layer
bn_in = nn.BatchNorm1d(config["layers"][0])
nn.init.constant_(bn_in.weight.data, 1)
nn.init.constant_(bn_in.bias.data, 0)
input_bias = ScalarBiasScale(scale=False, bias_init=-0.25)
MNIST_input_layer = QuantBrevitas(
    QuantHardTanh(bit_width = config["layers_bitwidth"][0],
    max_val=1.0,
    min_val=-1.0,
    act_scaling_impl=ParameterScaling(1.33),
    quant_type=QuantType.INT,
    return_quant_tensor = False),
    pre_transforms=[bn_in, input_bias]).to(device)

# Build the KAN LUT
kan_lut = KAN_LUT(checkpoint, config, MNIST_input_layer)

x = torch.randn(1, config["layers"][0], device=device)  # test input
kan_lut.input_layer.return_quant_tensor = True
qt = kan_lut.input_layer(x)

print("type(qt):", type(qt))
# print(dir(qt))

# q_int = qt.int()      # integer codes
# # scale = qt.scale      # quantization scale

# print("x:", x)
# print("q_int:", q_int)
# print("qt:", qt)
# print("qt.scale:", qt.scale)
# print("scale:", scale)
