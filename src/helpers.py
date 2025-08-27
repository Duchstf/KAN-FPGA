import torch
from typing import Tuple

def quantize_tensor(t: torch.Tensor, W: int, F: int, rounding: str = "nearest"):
    """
    Quantize tensor t to ap_fixed<W, W-F> (signed, two's-complement).
    Returns (q, r_int) where:
      q     : quantized tensor in float (same device/dtype as t)
      r_int : integer tensor of the fixed-point scaled values (int32)
    """

    if not (isinstance(W, int) and isinstance(F, int) and W > 0 and 0 < F <= W):
        raise ValueError("Require integers W>0, F>0, and F <= W.")
    
    scale = 1 << F

    # Integer range in scaled domain
    min_int = -(1 << (W - 1))             # -2^(W-1)
    max_int =  (1 << (W - 1)) - 1         #  2^(W-1) - 1

    # Handle NaN/Inf: NaN→0, ±Inf→saturate after rounding path
    t = t.clone()
    nan_mask = torch.isnan(t)
    if nan_mask.any():
        t[nan_mask] = 0.0

    # Scale
    y = t * float(scale)

    # Rounding
    if rounding == "nearest":
        # PyTorch round is banker's rounding (ties to even), like many QAT setups
        r = torch.round(y)
    elif rounding == "floor":
        r = torch.floor(y)
    elif rounding == "ceil":
        r = torch.ceil(y)
    elif rounding == "toward_zero":
        r = torch.trunc(y)
    elif rounding == "stochastic":
        fl = torch.floor(y)
        frac = y - fl
        # Bernoulli on [0,1) with prob=frac
        r = fl + (torch.rand_like(frac) < frac).to(fl)
    else:
        raise ValueError("rounding must be one of: nearest, floor, ceil, toward_zero, stochastic")

    # Saturate to representable integer range
    r = torch.clamp(r, min=min_int, max=max_int)

    # Back to float domain on same dtype/device
    q = (r / float(scale)).to(t.dtype)

    # Provide integer tensor as int32 for inspection/export if needed
    r_int = r.to(torch.int32)

    return q, r_int

# -------------------------
# Convenience for datasets
# -------------------------
def quantize_dataset(X_train, X_test, precision: Tuple[int, int], rounding: str = "nearest"):
    X_train_q, _ = quantize_tensor(X_train, precision[0], precision[1], rounding)
    X_test_q,  _ = quantize_tensor(X_test,  precision[0], precision[1], rounding)
    return X_train_q, X_test_q
