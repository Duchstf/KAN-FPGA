from numpy.core.fromnumeric import take
from KAN_QAT import KAN

class KAN_LUT:
    def __init__(self, checkpoint, config,
        input_t="fixed", input_precision=None, 
        output_t="fixed", output_precision=None):

        allowed_types = {"fixed", "int"}

        if input_t not in allowed_types: raise ValueError(f"input_t must be one of {allowed_types}, got '{input_t}'")
        if output_t not in allowed_types: raise ValueError(f"output_t must be one of {allowed_types}, got '{output_t}'")

        self.KAN = KAN
        self.input_t = input_t
        self.input_precision = input_precision
        self.output_t = output_t
        self.output_precision = output_precision

    def _parse_precision(precision, name, t): 
        if precision is None: raise ValueError(f"{name} required for {take}")
        if kind == "fixed":
            if not (isinstance(prec,(list,tuple)) and len(prec)==2):
                raise ValueError(f"{name} must be [W,I] for fixed")
                W,I = map(int,prec)
                if W<1 or I<0 or I>=W: raise ValueError(f"Invalid {name}: {prec}")
                return W,I
            if isinstance(prec,(list,tuple)):
                if len(prec)!=1: raise ValueError(f"{name} must be W for int")
                prec=prec[0]
            W=int(prec); 
            if W<1: raise ValueError(f"{name}: W>=1 required")
            return W,0

    def __call__(self, x):
        return x

    def __repr__(self):
        return f"LogicalLUT(tp={self.tp}, fp={self.fp})"

    

    def predict(self, x):