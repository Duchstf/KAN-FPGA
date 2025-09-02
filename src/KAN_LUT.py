from numpy.core.fromnumeric import take
from KAN_QAT import KAN

class KAN_LUT:
    def __init__(self, checkpoint, config):

        allowed_types = {"fixed", "int"}

        if config["input_t"] not in allowed_types: raise ValueError(f"input_t must be one of {allowed_types}, got '{config['input_t']}'")
        if config["output_t"] not in allowed_types: raise ValueError(f"output_t must be one of {allowed_types}, got '{config['output_t']}'")

        self.input_t = config["input_t"]
        self.input_precision = config["layer_precision"][0]
        self.output_t = config["output_t"]
        self.output_precision = config["layer_precision"][1]

        #Initialize the KAN model
        


        self.truth_tables = {}

    def predict(self, x):
        return x

    def __repr__(self):
        return f"KAN_LUT(input_t={self.input_t}, input_precision={self.input_precision}, output_t={self.output_t}, output_precision={self.output_precision})"

    
    def predict(self, x):