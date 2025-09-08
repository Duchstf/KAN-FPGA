import torch
import sys, os, json
import numpy as np
import torch.nn.functional as F
from numpy.core.fromnumeric import take
from KANQuant import KANQuant as KAN

#---------KAN_LUT class---------
class KAN_LUT:
    def __init__(self, model_dir, checkpoint, config, input_layer, device):

        self.model_dir = model_dir
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

        #Search for the saved truth tables, if already exists just load them
        truth_tables_path = os.path.join(self.model_dir, "truth_tables.json")
        if os.path.exists(truth_tables_path):
            with open(truth_tables_path, "r") as f:
                self.truth_tables = json.load(f)
        else:
            with torch.inference_mode():
                self.truth_tables = self._generate_truth_tables()
                with open(truth_tables_path, "w") as f:
                    json.dump(self.truth_tables, f)


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

    def _inferece_sample(self, sample):
        """
        Evaluate the KAN for a single sample
        """
        #Loop over each layer
        for i in range(len(self.KAN.layers)):

            #Loop over each connection in the layer
            for out_index in range(self.KAN.layers[i].out_features):

                #For each out feature there is an accumulator
                accumulator = 0

                for in_index in range(self.KAN.layers[i].in_features):

                    if i == 0: #simply look up the LUT value
                        truth_table = self.truth_tables[f"{i}_{in_index}_{out_index}"]
                        accumulator += truth_table['values_int'][sample[in_index]]

                        #Clamp to the right range depending on the layer quantization
                    else:
                                   
        return None

    @torch.inference_mode()
    def predict(self, x: torch.Tensor) -> torch.Tensor:
        """
        Evaluate the KAN using the precomputed per-connection LUTs.
        This is a simulation of what exactly happens on the hardware

        Args:
            x: Tensor of shape (batch, in_features_of_first_layer) with *float* values.

        Returns:
            Tensor of shape (batch, out_features_of_last_layer), quantized to the
            last layer's output state space.
        """
        assert x.dim() == 2, "predict expects a 2D tensor: (batch, in_features)"

        #Pre-process the input, quantize and round to int and use it for direct index lookup
        x = self.KAN.input_layer(x)
        input_scale, bits = self.KAN.input_layer.get_scale_factor_bits(self.is_cuda)
        x = (x/input_scale).round().to(torch.int)

        #Convert the values to unsigned int
        x = (x + (2**(bits - 1))).to(torch.int)

        #Loop over each sample in the batch
        outs_int = []
        for sample_index in range(x.shape[0]):
            outs_int.append(self._inferece_sample((x[sample_index])))
        outs_int = torch.stack(outs_int, dim=0)

        # Dequantize to floats on last layer's scale
        last_scale, _ = self.KAN.layers[-1].output_quantizer.get_scale_factor_bits(self.is_cuda)
        return outs_int.to(torch.float32) * last_scale

