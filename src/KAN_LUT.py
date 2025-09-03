import torch
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
    def __init__(self, checkpoint, config, input_layer):

        self.config = config
        self.checkpoint = checkpoint
        self.input_layer = input_layer

        #Initialize the KAN QAT model
        self.KAN = KAN(self.config, self.input_layer)

        #Load the state dict
        self.KAN.load_state_dict(self.checkpoint["model_state_dict"])

        #Put in evaluation mode
        self.KAN.eval()

        #Initialize the truth tables
        self.truth_tables = self._generate_truth_tables()

    def _generate_truth_tables(self):
        truth_tables = {}

        #Generate a random input tensor to track the LUT values

        for i, layer in enumerate(self.KAN.layers):
            in_features = layer.in_features
            out_features = layer.out_features
            in_bit_width = layer.in_precision
            out_bit_width = layer.out_precision

            print(f"Generating truth table for LAYER {i}", 
            f"in_features: {in_features}, out_features: {out_features}, in_bit_width: {in_bit_width}, out_bit_width: {out_bit_width}")

            # if i == 0:
            #     #First layer after the input layer is treated differently
            #     #First, generate a random input tensor
            #     input_tensor = torch.randn(in_features)

            #     #Then, pass it through the input layer
            # for j in range(in_features):
            #     for k in range(out_features):


        return truth_tables

    def _get_truth_table(self, layer_index, in_feature, out_feature):
        pass

    def predict(self, x):
        return x

    def __repr__(self):
        return f"KAN_LUT(input_t={self.input_t}, input_precision={self.input_precision}, output_t={self.output_t}, output_precision={self.output_precision})"
