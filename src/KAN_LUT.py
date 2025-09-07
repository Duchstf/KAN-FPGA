import torch
import sys
import numpy as np
import torch.nn.functional as F
from numpy.core.fromnumeric import take
from KANQuant import KANQuant as KAN
from brevitas.core.quant import QuantType

#---------Helper functions---------
def get_int_state_space(bits: int, signed: bool, narrow_range: bool, is_cuda: bool):
    start = int(
        0 if not signed else (-(2 ** (bits - 1)) + int(narrow_range))
    )  # calculate the minimum value in the range
    end = int(
        start + 2 ** (bits) - int(narrow_range)
    )  # calculate the maximum of the range
    state_space = torch.as_tensor(range(start, end))
    if is_cuda:
        return state_space.cuda()
    return state_space

def get_float_state_space(
    bits: int,
    scale_factor: float,
    signed: bool,
    narrow_range: bool,
    quant_type: QuantType,
    is_cuda: bool,
):
    if quant_type == QuantType.INT:
        bin_state_space = get_int_state_space(bits, signed, narrow_range, is_cuda)
    elif quant_type == QuantType.BINARY:
        bin_state_space = torch.as_tensor([-1.0, 1.0])
    if is_cuda:
        bin_state_space = bin_state_space.cuda()
    state_space = scale_factor * bin_state_space
    return state_space

#---------KAN_LUT class---------
class KAN_LUT:
    def __init__(self, checkpoint, config, input_layer, device):

        self.config = config
        self.checkpoint = checkpoint
        self.input_layer = input_layer
        self.device = device
        self.is_cuda = device == "cuda"

        #Initialize the KAN QAT model
        self.KAN = KAN(self.config, self.input_layer)

        #Load the state dict
        self.KAN.load_state_dict(self.checkpoint["model_state_dict"])

        #Print some basic info about the model
        print(f"Creating KAN LUT reprentation. Quantization: {self.config['layers_bitwidth']}, Remaining sparsity: {self.checkpoint['remaining_fraction']}, Accuracy: {self.checkpoint['val_accuracy']}")

        #Put in evaluation mode
        self.KAN.eval()

        #Initialize the truth tables
        with torch.inference_mode():
            self.truth_tables = self._generate_truth_tables()

    def _generate_truth_tables(self):
        truth_tables = {}

        #Generate a random input tensor to track the LUT values
        for i, layer in enumerate(self.KAN.layers):
            in_features = layer.in_features
            out_features = layer.out_features
            in_bit_width = layer.in_precision
            out_bit_width = layer.out_precision
            input_state_space = None

            #First layer is treated differently
            if i == 0:
                input_state_space = self.input_layer.get_state_space(self.is_cuda)
            #If not first layer, need to get the state space for the previous layer
            else:
                previous_layer = self.KAN.layers[i - 1]
                input_state_space = previous_layer.output_quantizer.get_state_space(self.is_cuda)

            #Generate the truth table for each connection
            for j in range(in_features):
                for k in range(out_features):
                    truth_tables[f"{i}_{j}_{k}"] = self._get_truth_table(input_state_space, i, j, k)

    
        return truth_tables

    def _get_truth_table(self, input_state_space, layer_index, in_node, out_node):
        """
        Compute the truth table (pre-summation) for the single connection
        (in_node -> out_node) evaluated over input_state_space (1D tensor of values).
        """
        layer = self.KAN.layers[layer_index].to(self.device) 

        truth_table = {}
        truth_table['acive'] = int(layer.spline_selector[out_node, in_node].item()) #Where this LUT is pruned or not
        scale, bits = layer.output_quantizer.get_scale_factor_bits(self.is_cuda)
        
        #Create a tensor of the input state space for each input node
        x = input_state_space.unsqueeze(0).repeat(layer.in_features, 1).T.to(self.device)

        #Calculate the lookup table values
        base_output = layer.base_activation(x)[: , in_node] * layer.base_weight[out_node, in_node]
        spline_output = F.linear(layer.b_splines(x)[:, in_node, :], layer.scaled_spline_weight[out_node, in_node, :])
        
        #Store the LUT outputs as integers
        lut_output = ((layer.spline_selector[out_node, in_node] * (base_output + spline_output))/scale).round().to(torch.int).tolist()   
        truth_table['values_int'] = lut_output

        return truth_table

    @torch.inference_mode()
    def predict(self, x: torch.Tensor) -> torch.Tensor:
        """
        Evaluate the KAN using the precomputed per-connection LUTs.

        Args:
            x: Tensor of shape (batch, in_features_of_first_layer) with *float* values.

        Returns:
            Tensor of shape (batch, out_features_of_last_layer), quantized to the
            last layer's output state space.
        """
        assert x.dim() == 2, "predict expects a 2D tensor: (batch, in_features)"
        device = self.device
        x = x.to(device)

        
        return x_cur

