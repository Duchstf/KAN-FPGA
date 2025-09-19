# plot.py
import os
import numpy as np
import pandas as pd
import matplotlib as mpl
import matplotlib.pyplot as plt

LOGS_BASE_DIR = "logs"
WINDOW = 50  # moving average window

# ---------- keep your original calculation helpers ----------
def moving_average(x, w=50):
    return np.convolve(x, np.ones(w), "valid") / w

# ---------- aesthetics only ----------
def setup_paper_style(single_column: bool = True):
    # Nature-ish sizes: single col ≈ 90 mm, double ≈ 185 mm
    width_in = 3.54 if single_column else 7.28
    height_in = 2.4 if single_column else 3.5
    mpl.rcParams.update({
        "figure.figsize": (width_in, height_in),
        "figure.dpi": 300,
        "savefig.bbox": "tight",
        "savefig.pad_inches": 0.02,
        "pdf.fonttype": 42, "ps.fonttype": 42,  # embed fonts properly

        # Typography
        "font.size": 8,
        "font.family": "sans-serif",
        "font.sans-serif": ["Helvetica", "Arial", "DejaVu Sans"],
        "axes.titlesize": 8,
        "axes.labelsize": 8,
        "xtick.labelsize": 7,
        "ytick.labelsize": 7,
        "legend.fontsize": 7,

        # Lines & axes
        "lines.linewidth": 1.2,
        "axes.linewidth": 0.8,
        "axes.spines.top": False,
        "axes.spines.right": False,

        # Grid
        "axes.grid": True,
        "grid.linestyle": "-",
        "grid.linewidth": 0.4,
        "grid.alpha": 0.25,
    })
    # Pleasant, colorblind-friendly cycle
    mpl.rcParams["axes.prop_cycle"] = mpl.cycler(color=[
        "#1f77b4", "#ff7f0e", "#2ca02c", "#d62728",
        "#9467bd", "#8c564b", "#e377c2", "#7f7f7f",
        "#bcbd22", "#17becf",
    ])

def plot_training_results(log_folder: str, env_name="HalfCheetah-v4",
                          label="MLP [17, 64, 64, 6]", single_column=True):
    setup_paper_style(single_column)

    runs = []
    if not os.path.isdir(log_folder):
        print(f"No log files in '{log_folder}'"); return

    # ---------- load exactly like you did ----------
    for subdir in sorted(os.listdir(log_folder)):
        f = os.path.join(log_folder, subdir, "monitor.csv")
        if os.path.exists(f):
            df = pd.read_csv(f, skiprows=1)
            df["timesteps"] = df["l"].cumsum()
            runs.append(df[["timesteps", "r"]].rename(columns={"r": "reward"}))

    if not runs:
        print(f"No log files in '{log_folder}'"); return

    # Align to shortest length, average across runs to a single series
    min_len = min(len(r) for r in runs)
    x = runs[0]["timesteps"].values[:min_len]
    y = np.stack([r["reward"].values[:min_len] for r in runs]).mean(axis=0)

    # ---------- keep your original uncertainty definition ----------
    ma_x = moving_average(x, WINDOW)
    ma_y = moving_average(y, WINDOW)
    band = y.std() / 2.0  # constant-width band

    # ---------- pretty plotting only ----------
    fig, ax = plt.subplots()
    ax.plot(ma_x, ma_y, label=label)                         # color from cycle
    ax.fill_between(ma_x, ma_y - band, ma_y + band, alpha=0.2)

    ax.set_xlabel("Training steps")
    ax.set_ylabel("Average return")
    ax.set_title(env_name, pad=4)

    # Ticks & spines polish
    ax.xaxis.set_major_locator(mpl.ticker.MaxNLocator(5))
    ax.yaxis.set_major_locator(mpl.ticker.MaxNLocator(5))
    ax.tick_params(direction="out", length=3, width=0.8)
    ax.legend(frameon=False, loc="upper left")

    os.makedirs("plots", exist_ok=True)
    base = f"plots/{env_name.lower().replace(' ', '_')}"
    plt.savefig(base + ".pdf")
    plt.show()

if __name__ == "__main__":
    plot_training_results(LOGS_BASE_DIR)
