import sys, os, random
import numpy as np
import torch
import torch.nn as nn
import pandas as pd

from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler, LabelEncoder

# === Use YOUR original KAN class ===
# (with grid_size, spline_order, grid_eps, base_activation, grid_range)
sys.path.append('../../../src')

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
print("Device:", device)

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
model_check = MLP([16, 2, 7], activation=nn.GELU).to(device)

# -------------------------------
# Data: Dry Bean — split FIRST, scale on TRAIN only
# -------------------------------
# Requires 'openpyxl' for .xlsx; pip install openpyxl if needed
data = pd.read_excel("./data/Dry_Bean_Dataset.xlsx")  # path as you showed

X_df = data.drop(columns=["Class"])
y_ser = data["Class"]

# Encode string classes -> integers [0..C-1]
le = LabelEncoder()
y_int = le.fit_transform(y_ser)

# Stratified split
X_tr_raw, X_te_raw, y_tr, y_te = train_test_split(
    X_df.values, y_int, test_size=0.2, random_state=42, shuffle=True, stratify=y_int
)

# Standardize using TRAIN stats only
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

in_features = X_tr_t.shape[1]          # should be 16 for Dry Bean
num_classes = len(le.classes_)         # should be 7

print(f"in_features={in_features}, num_classes={num_classes}, trainN={len(y_tr)}, testN={len(y_te)}")

# -------------------------------
# Metrics (multi-class CE)
# -------------------------------
def train_acc():
    model_check.eval()
    with torch.no_grad():
        logits = model_check(dataset["train_input"])        # [Ntr, C]
        preds = logits.argmax(dim=1)
        labels = dataset["train_label"]
        return (preds == labels).float().mean()

def test_acc():
    model_check.eval()
    with torch.no_grad():
        logits = model_check(dataset["test_input"])         # [Nte, C]
        preds = logits.argmax(dim=1)
        labels = dataset["test_label"]
        return (preds == labels).float().mean()

# -------------------------------
# LBFGS training wrapper (as before)
# -------------------------------
def kan_train_lbfgs(model, dataset, steps, loss_fn, lr, metrics):
    """
    Full-batch LBFGS with closure; tracks metrics like your .train(..., opt='LBFGS', ...)
    """
    model.train()
    optimizer = torch.optim.LBFGS(
        model.parameters(),
        lr=lr,
        max_iter=1,            # one inner iter per outer "step"
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

        # Evaluate metrics
        ta = metrics[0]().detach().float().item() if metrics and metrics[0] else None
        va = metrics[1]().detach().float().item() if metrics and len(metrics) > 1 and metrics[1] else None

        history["loss"].append(loss.detach().item())
        history["train_acc"].append(ta)
        history["test_acc"].append(va)

        if (step + 1) % 10 == 0 or step == 0 or (step + 1) == steps:
            print(f"Step {step+1}/{steps} | Loss: {history['loss'][-1]:.6f} | "
                  f"Train acc: {ta:.4f} | Test acc: {va:.4f}")

    return history

# -------------------------------
# Train
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

# (Optional) Inspect label mapping:
# print(dict(enumerate(le.classes_)))
