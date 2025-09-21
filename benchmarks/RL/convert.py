import os, json, sys, shutil
import torch
import torch.nn as nn
import torchvision
import torchvision.transforms as transforms
from torch.utils.data import DataLoader

# Local imports
sys.path.append('../../src')
from KAN_LUT import KAN_LUT
from quant import ScalarBiasScale, QuantBrevitasActivation

#For quantization
from brevitas.nn import QuantHardTanh
from brevitas.core.scaling import ParameterScaling
from brevitas.core.quant import QuantType

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
is_cuda = device == "cuda"

model_dir = 'logs_kan_quant'

#Load the config
with open(os.path.join(model_dir, "config.json"), "r") as f: config = json.load(f)

# Load the model with the best accuracy
checkpoint = torch.load(os.path.join(model_dir, 'kan_model_4.pt'), map_location=torch.device(device))

#Build the input layer
input_layer = QuantBrevitasActivation(
    QuantHardTanh(bit_width = config["layers_bitwidth"][0],
    max_val=2.0,
    min_val=-2.0,
    act_scaling_impl=ParameterScaling(1.33),
    quant_type=QuantType.INT,
    return_quant_tensor = False),
    pre_transforms=[],
    cuda=device.type == "cuda").to(device)

# Build the KAN LUT
kan_lut = KAN_LUT(model_dir, checkpoint, config, input_layer, device)
kan_lut.quick_match_check() #Test matching of LUT implementation with the base model KAN

#Generate the firmware
kan_lut.generate_firmware(clock_period=1.0, n_add=4)

#Simulate the firmware
kan_lut.simulate_firmware(n_vectors = 10)