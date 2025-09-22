import sys, os, random
import numpy as np
import torch
import torch.nn as nn

# === Use YOUR original KAN class ===
# (with grid_size, spline_order, grid_eps, base_activation, grid_range)
sys.path.append('../../../src')
device = "cuda" if torch.cuda.is_available() else "cpu"

from sklearn.datasets import load_wine
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler

# --- replace the KAN import + model block with this MLP ---

import torch.nn as nn

class MLP(nn.Module):
    def __init__(self, widths, activation=nn.GELU):
        """
        widths: list like [in_dim, h1, ..., out_dim]
        """
        super().__init__()
        assert len(widths) >= 2
        layers = []
        self.activation = activation()
        for i in range(len(widths) - 1):
            layers.append(nn.Linear(widths[i], widths[i+1], bias=True))
        self.layers = nn.ModuleList(layers)
        self._init_weights()

    def _init_weights(self):
        # Kaiming for GELU works well; biases to zero
        for i, layer in enumerate(self.layers):
            if isinstance(layer, nn.Linear):
                nn.init.kaiming_uniform_(layer.weight, a=0.0, nonlinearity='relu')
                nn.init.zeros_(layer.bias)

    def forward(self, x):
        # activation between all but the last layer
        for i, layer in enumerate(self.layers):
            x = layer(x)
            if i < len(self.layers) - 1:
                x = self.activation(x)
        return x  # raw logits for CE

# build the MLP with the SAME width as your KAN example: [13, 4, 3]
model_check = MLP([13, 4, 3], activation=nn.GELU).to(device)

# (optional) sanity: show parameter counts
def count_params(m): return sum(p.numel() for p in m.parameters())
print("MLP params:", count_params(model_check))

# -------------------------------
# Reproducibility & Device
# -------------------------------
SEED = 42
random.seed(SEED)
np.random.seed(SEED)
torch.manual_seed(SEED)
if torch.cuda.is_available():
    torch.cuda.manual_seed_all(SEED)


# -------------------------------
# Data: split FIRST, scale on TRAIN only
# -------------------------------
wine = load_wine()
X = wine.data           # [N, 13]
y = wine.target         # {0,1,2}

X_tr_raw, X_te_raw, y_tr, y_te = train_test_split(
    X, y, test_size=0.3, random_state=40, stratify=y
)

scaler = StandardScaler()
X_tr = scaler.fit_transform(X_tr_raw)
X_te = scaler.transform(X_te_raw)

# Torch tensors on device
X_tr_t = torch.from_numpy(X_tr).float().to(device)
X_te_t = torch.from_numpy(X_te).float().to(device)
y_tr_t = torch.from_numpy(y_tr).long().to(device)
y_te_t = torch.from_numpy(y_te).long().to(device)

# Dataset dict to match your metric signatures
dataset = {
    "train_input": X_tr_t,
    "train_label": y_tr_t,
    "test_input":  X_te_t,
    "test_label":  y_te_t,
}

# -------------------------------
# Metrics (multi-class CE)
# -------------------------------
def train_acc():
    model_check.eval()
    with torch.no_grad():
        logits = model_check(dataset["train_input"])        # [Ntr, 3] logits
        preds = logits.argmax(dim=1)
        labels = dataset["train_label"]
        return (preds == labels).float().mean()

def test_acc():
    model_check.eval()
    with torch.no_grad():
        logits = model_check(dataset["test_input"])         # [Nte, 3] logits
        preds = logits.argmax(dim=1)
        labels = dataset["test_label"]
        return (preds == labels).float().mean()

# -------------------------------
# LBFGS training wrapper to REPLICATE your “.train(..., opt='LBFGS', steps=..., metrics=...)”
# -------------------------------
def kan_train_lbfgs(model, dataset, steps, loss_fn, lr, metrics):
    """
    Mimics your KAN.train(...) behavior for LBFGS:
      - full-batch LBFGS with closure
      - tracks metrics history
      - returns dict with 'loss', and one entry per metric name (train_acc, test_acc)
    """
    model.train()
    optimizer = torch.optim.LBFGS(
        model.parameters(),
        lr=lr,
        max_iter=1,            # we'll call step() 'steps' times with one LBFGS inner iter each
        history_size=10,
        line_search_fn="strong_wolfe",
    )

    train_inputs = dataset["train_input"]
    train_labels = dataset["train_label"]

    history = {
        "loss": [],
        "train_acc": [],
        "test_acc": [],
    }

    def closure():
        optimizer.zero_grad(set_to_none=True)
        logits = model(train_inputs)           # [Ntr, C]
        loss = loss_fn(logits, train_labels)   # CE expects logits + int64 labels
        loss.backward()
        return loss

    for step in range(steps):
        loss = optimizer.step(closure)

        # Evaluate metrics (like your code)
        ta = metrics[0]().detach().float().item() if metrics and metrics[0] else None
        va = metrics[1]().detach().float().item() if metrics and len(metrics) > 1 and metrics[1] else None

        history["loss"].append(loss.detach().item())
        history["train_acc"].append(ta)
        history["test_acc"].append(va)

        # Optional: print progress every, say, 10 steps
        if (step + 1) % 10 == 0 or step == 0 or (step + 1) == steps:
            print(f"Step {step+1}/{steps} | Loss: {history['loss'][-1]:.6f} | "
                  f"Train acc: {ta:.4f} | Test acc: {va:.4f}")

    return history

# -------------------------------
# Train (replicating your call style/args)
# -------------------------------
loss_fn = nn.CrossEntropyLoss()  # model must output raw logits (no softmax)
results = kan_train_lbfgs(
    model=model_check,
    dataset=dataset,
    steps=200,
    loss_fn=loss_fn,
    lr=2e-4,                 # 0.0002 as in your snippet
    metrics=(train_acc, test_acc),
)

print("Train accuracy:", results['train_acc'][-1], " - Test accuracy:", results['test_acc'][-1])

# (Optional) a check helper in the same spirit as your last function name
def check_accuracy(model: MLP, dataset: dict):
    model.eval()
    with torch.no_grad():
        tr_logits = model(dataset['train_input'])
        te_logits = model(dataset['test_input'])
        tr_pred = tr_logits.argmax(dim=1)
        te_pred = te_logits.argmax(dim=1)
        tr_acc = (tr_pred == dataset['train_label']).float().mean().item()
        te_acc = (te_pred == dataset['test_label']).float().mean().item()
    return tr_acc, te_acc

tr_a, te_a = check_accuracy(model_check, dataset)
print("check_accuracy -> Train:", tr_a, " Test:", te_a)
