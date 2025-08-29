import os
import torch
import numpy as np
import matplotlib.pyplot as plt

# --- Load Data ---
device = "cuda" if torch.cuda.is_available() else "cpu"

X_train = torch.from_numpy(np.load('data/X_train_val.npy')).float().to(device)
y_train = torch.from_numpy(np.load('data/y_train_val.npy')).float().to(device).argmax(dim=1)
X_test = torch.from_numpy(np.load('data/X_test.npy')).float().to(device)
y_test = torch.from_numpy(np.load('data/y_test.npy')).float().to(device).argmax(dim=1)

# --- Convert to numpy for plotting ---
X_train_np = X_train.cpu().numpy()

n_features = X_train_np.shape[1]

# --- Create output directory ---
outdir = "t"
os.makedirs(outdir, exist_ok=True)

# --- Plot distributions of each feature ---
fig, axes = plt.subplots(nrows=int(np.ceil(n_features/4)), ncols=4, figsize=(16, 4*np.ceil(n_features/4)))
axes = axes.flatten()

for i in range(n_features):
    axes[i].hist(X_train_np[:, i], bins=50, color='steelblue', alpha=0.7, density=True)
    axes[i].set_title(f"Feature {i}")
    axes[i].set_ylabel("Density")

# Hide unused subplots if n_features not divisible by 4
for j in range(i+1, len(axes)):
    fig.delaxes(axes[j])

plt.tight_layout()

# --- Save the figure ---
save_path = os.path.join(outdir, "feature_distributions.png")
plt.savefig(save_path, dpi=200)
plt.close()

print(f"Saved feature distribution plots to {save_path}")
