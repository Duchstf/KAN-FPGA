from numpy.core.fromnumeric import take
from KAN_QAT import KAN

class KAN_LUT:
    def __init__(self, checkpoint, config, input_layer):

        self.config = config
        self.checkpoint = checkpoint
        self.input_layer = input_layer

        #Initialize the KAN QAT model
        self.KAN = KAN(self.config, self.input_layer)

        #Load the state dict
        self.KAN.load_state_dict(self.checkpoint["model_state_dict"])

        #Initialize the truth tables
        self.truth_tables = self._generate_truth_tables()

    def _generate_truth_tables(self):
        truth_tables = {}

        for i, layer in enumerate(self.KAN.layers):
            in_features = layer.in_features
            out_features = layer.out_features

            for j in range(in_features):
                for k in range(out_features):
                    truth_tables[f"{i}_{j}_{k}"] = self._get_truth_table(i, j, k)

        return truth_tables

    def _get_truth_table(self, layer_index, in_feature, out_feature):
        pass

    def predict(self, x):
        return x

    def __repr__(self):
        return f"KAN_LUT(input_t={self.input_t}, input_precision={self.input_precision}, output_t={self.output_t}, output_precision={self.output_precision})"
