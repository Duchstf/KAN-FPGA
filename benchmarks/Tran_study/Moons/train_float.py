# === Moons + KAN_OG + LBFGS wrapper (mirrors your Wine setup) ===
import sys, os, random
import numpy as np
import torch
import torch.nn as nn

# --- Use YOUR original KAN_OG class/signature ---
# (grid_size, spline_order, grid_eps, base_activation, grid_range)
sys.path.append('../../../src')
from KAN_OG import KAN

from sklearn.datasets import make_moons
from sklearn.model_selection import train_test_split

# -------------------------------
# Reproducibility & Device
# -------------------------------
SEED = 42
random.seed(SEED)
np.random.seed(SEED)
torch.manual_seed(SEED)
if torch.cuda.is_available():
    torch.cuda.manual_seed_all(SEED)

device = "cuda" if torch.cuda.is_available() else "cpu"

# -------------------------------
# Data: split FIRST (no scaling needed)
# -------------------------------
X, y = make_moons(n_samples=10000, shuffle=True, noise=0.20, random_state=SEED)

X_tr_raw, X_te_raw, y_tr, y_te = train_test_split(
    X, y, test_size=0.30, random_state=SEED, stratify=y
)

# Torch tensors on device
X_tr_t = torch.from_numpy(X_tr_raw).float().to(device)          # [Ntr, 2]
X_te_t = torch.from_numpy(X_te_raw).float().to(device)          # [Nte, 2]
y_tr_t = torch.from_numpy(y_tr).long().to(device)               # [Ntr] int64 {0,1}
y_te_t = torch.from_numpy(y_te).long().to(device)               # [Nte] int64 {0,1}

# Dataset dict to match your metric signatures
dataset = {
    "train_input": X_tr_t,
    "train_label": y_tr_t,
    "test_input":  X_te_t,
    "test_label":  y_te_t,
}

# -------------------------------
# Model: single-output regression head
# -------------------------------
model_check = KAN(
    [2, 8, 1],              # last dim = 1
    grid_size=5,
    spline_order=3,
    grid_eps=0.01,
    base_activation=nn.GELU,
    grid_range=[-3, 3]
).to(device)

# -------------------------------
# Data: float labels in {0., 1.}
# -------------------------------
y_tr_t = torch.from_numpy(y_tr).float().to(device)  # [Ntr] float
y_te_t = torch.from_numpy(y_te).float().to(device)  # [Nte] float

dataset = {
    "train_input": X_tr_t,
    "train_label": y_tr_t,
    "test_input":  X_te_t,
    "test_label":  y_te_t,
}

# -------------------------------
# Metrics (sigmoid -> probability)
# -------------------------------
@torch.no_grad()
def train_acc():
    model_check.eval()
    logits = model_check(dataset["train_input"]).squeeze(-1)   # [Ntr]
    p = torch.sigmoid(logits)
    preds = (p > 0.5).long()
    labels = dataset["train_label"].long()
    return (preds == labels).float().mean()

@torch.no_grad()
def test_acc():
    model_check.eval()
    logits = model_check(dataset["test_input"]).squeeze(-1)    # [Nte]
    p = torch.sigmoid(logits)
    preds = (p > 0.5).long()
    labels = dataset["test_label"].long()
    return (preds == labels).float().mean()

# -------------------------------
# LBFGS training wrapper (MSE on sigmoid)
# -------------------------------
loss_fn = nn.MSELoss()

def kan_train_lbfgs(model, dataset, steps, loss_fn, lr, metrics):
    model.train()
    optimizer = torch.optim.LBFGS(
        model.parameters(),
        lr=lr,
        max_iter=1,
        history_size=10,
        line_search_fn="strong_wolfe",
    )

    train_inputs = dataset["train_input"]
    train_labels = dataset["train_label"]

    history = {"loss": [], "train_acc": [], "test_acc": []}

    def closure():
        optimizer.zero_grad(set_to_none=True)
        logits = model(train_inputs).squeeze(-1)          # [N]
        probs  = torch.sigmoid(logits)                    # constrain to [0,1]
        loss   = loss_fn(probs, train_labels)             # MSE(sigmoid(logits), y∈{0,1})
        loss.backward()
        return loss

    for step in range(steps):
        loss = optimizer.step(closure)
        ta = metrics[0]().detach().float().item()
        va = metrics[1]().detach().float().item()
        history["loss"].append(loss.detach().item())
        history["train_acc"].append(ta)
        history["test_acc"].append(va)
        if (step + 1) % 10 == 0 or step == 0 or (step + 1) == steps:
            print(f"Step {step+1}/{steps} | Loss: {history['loss'][-1]:.6f} | "
                  f"Train acc: {ta:.4f} | Test acc: {va:.4f}")
    return history

results = kan_train_lbfgs(
    model=model_check,
    dataset=dataset,
    steps=200,
    loss_fn=loss_fn,
    lr=2e-4,
    metrics=(train_acc, test_acc),
)
print("Train accuracy:", results['train_acc'][-1], " - Test accuracy:", results['test_acc'][-1])
