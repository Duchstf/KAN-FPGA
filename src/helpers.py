import matplotlib.pyplot as plt

def quantize_value_unsigned(X, tot_bits=6):
    """
    Quantize a value to an unsigned integer

    Args:
        X (Tensor): Input tensor of shape (samples, features)
        tot_bits (int): Number of bits for quantization (default: 6)

    Returns:
        X_quantized (Tensor): Quantized values (uint-like in [0, 2^tot_bits - 1])
        X_min (Tensor): Min value per feature (for dequantization or reuse)
        X_max (Tensor): Max value per feature
    """
    X_min = X.min(dim=0, keepdim=True).values
    X_max = X.max(dim=0, keepdim=True).values
    X_scaled = (X - X_min) / (X_max - X_min + 1e-8)
    X_quantized = (X_scaled * (2**tot_bits - 1)).round().clamp(0, 2**tot_bits - 1)
    return X_quantized, X_min, X_max

def plot_feature_distributions(X_q, tot_bits=6, save_path="plots/feature_distributions.png"):
    X_np = X_q.cpu().numpy()
    num_features = X_np.shape[1]
    plt.figure(figsize=(15, 8))
    for i in range(num_features):
        plt.subplot((num_features + 3) // 4, 4, i + 1)
        plt.hist(X_np[:, i], bins=2**tot_bits, range=(0, 2**tot_bits - 1))
        plt.title(f"Feature {i}")
    plt.tight_layout()
    plt.savefig(save_path)
    plt.close()