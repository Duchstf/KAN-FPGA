# plot.py
import os
import glob
import numpy as np
import pandas as pd
import matplotlib as mpl
import matplotlib.pyplot as plt
from matplotlib.ticker import EngFormatter, MaxNLocator
import matplotlib.patheffects as pe

WINDOW = 50  # moving average window


# ---------- keep your original calculation helpers ----------
def moving_average(x, w=50):
    return np.convolve(x, np.ones(w), "valid") / w


# ---------- small utilities for nicer visuals ----------
def _desaturate(hex_color, factor=0.25):
    rgb = mpl.colors.to_rgb(hex_color)
    return tuple(1 - factor * (1 - c) for c in rgb)


def _try_enable_usetex():
    try:
        import shutil
        if shutil.which("latex") and shutil.which("dvipng"):
            mpl.rcParams.update(
                {
                    "text.usetex": True,
                    "text.latex.preamble": r"\usepackage{amsmath,amssymb}",
                }
            )
    except Exception:
        pass


# ---------- aesthetics only ----------
def setup_paper_style(single_column: bool = True):
    width_in = 3.54 if single_column else 7.28
    height_in = 2.3 if single_column else 3.6
    oi_cycle = [
        "#0072B2", "#E69F00", "#009E73", "#D55E00",
        "#CC79A7", "#56B4E9", "#F0E442", "#000000",
    ]
    mpl.rcParams.update(
        {
            "figure.figsize": (width_in, height_in),
            "figure.dpi": 300,
            "savefig.bbox": "tight",
            "savefig.pad_inches": 0.02,
            "savefig.transparent": False,
            "pdf.fonttype": 42,
            "ps.fonttype": 42,
            "font.size": 8,
            "font.family": "sans-serif",
            "font.sans-serif": ["Helvetica", "Arial", "DejaVu Sans"],
            "mathtext.fontset": "stixsans",
            "axes.titlesize": 8,
            "axes.labelsize": 8,
            "xtick.labelsize": 7,
            "ytick.labelsize": 7,
            "legend.fontsize": 7,
            "lines.linewidth": 1.3,
            "lines.solid_capstyle": "round",
            "lines.solid_joinstyle": "round",
            "axes.linewidth": 0.8,
            "axes.spines.top": False,
            "axes.spines.right": False,
            "axes.grid": True,
            "axes.grid.which": "major",
            "grid.linestyle": "-",
            "grid.linewidth": 0.4,
            "grid.alpha": 0.25,
            "xtick.direction": "out",
            "ytick.direction": "out",
            "xtick.major.size": 3,
            "ytick.major.size": 3,
            "xtick.major.width": 0.8,
            "ytick.major.width": 0.8,
            "xtick.minor.size": 2,
            "ytick.minor.size": 2,
            "xtick.minor.width": 0.6,
            "ytick.minor.width": 0.6,
            "figure.constrained_layout.use": True,
            "axes.titlepad": 4,
        }
    )
    mpl.rcParams["axes.prop_cycle"] = mpl.cycler(color=oi_cycle)
    _try_enable_usetex()


# ---------- IO helpers ----------
def _collect_monitor_files(path_like: str):
    """
    Accepts:
      - a direct file path to monitor.csv
      - a directory containing subdirs each with monitor.csv
      - a glob pattern to monitor files or run dirs
    Returns list of absolute monitor.csv file paths.
    """
    paths = []
    # Glob first so users can pass wildcards
    for p in glob.glob(path_like):
        p = os.path.abspath(p)
        if os.path.isfile(p):
            # file might be monitor.csv or any csv with same schema
            if p.endswith(".csv"):
                paths.append(p)
        elif os.path.isdir(p):
            # either the dir itself has monitor.csv, or its subdirs do
            direct_csv = os.path.join(p, "monitor.csv")
            if os.path.exists(direct_csv):
                paths.append(direct_csv)
            else:
                for sub in sorted(os.listdir(p)):
                    candidate = os.path.join(p, sub, "monitor.csv")
                    if os.path.exists(candidate):
                        paths.append(candidate)
    return paths


def _load_runs(monitor_paths):
    """Load runs as (timesteps, reward) DataFrames."""
    runs = []
    for f in monitor_paths:
        try:
            df = pd.read_csv(f, skiprows=1)
            df["timesteps"] = df["l"].cumsum()
            runs.append(df[["timesteps", "r"]].rename(columns={"r": "reward"}))
        except Exception:
            # Skip malformed files; keep plotting robust
            continue
    return runs


# ---------- core plotting ----------
def _plot_one_model(ax, runs, label, window=WINDOW):
    if not runs:
        return

    # Align to shortest run length
    min_len = min(len(r) for r in runs)
    x = runs[0]["timesteps"].values[:min_len]
    y_stack = np.stack([r["reward"].values[:min_len] for r in runs])
    y_mean = y_stack.mean(axis=0)

    ma_x = moving_average(x, window)
    ma_y = moving_average(y_mean, window)

    # constant-width band per model (from across-run variability)
    band = y_mean.std() / 2.0

    # pick color from cycle by asking for next color via plotting an empty line
    tmp, = ax.plot([], [])
    line_color = tmp.get_color()
    tmp.remove()
    fill_color = _desaturate(line_color, factor=0.15)

    line, = ax.plot(
        ma_x,
        ma_y,
        label=label,
        color=line_color,
        path_effects=[pe.Stroke(linewidth=1.9, foreground="white"), pe.Normal()],
        zorder=3,
    )
    ax.fill_between(
        ma_x,
        ma_y - band,
        ma_y + band,
        facecolor=fill_color,
        alpha=0.35,
        linewidth=0,
        zorder=1,
    )

    try:
        ax.annotate(
            f"{ma_y[-1]:.1f}",
            xy=(ma_x[-1], ma_y[-1]),
            xytext=(6, 0),
            textcoords="offset points",
            va="center",
            ha="left",
            fontsize=7,
            color=line_color,
            path_effects=[pe.Stroke(linewidth=1.5, foreground="white"), pe.Normal()],
        )
    except Exception:
        pass


def plot_models(
    models,
    env_name="HalfCheetah-v4",
    single_column=True,
    export_png=True,
    window=WINDOW,
    out_name=None,
):
    """
    Plot multiple models in one figure.

    models: list of tuples (path_like, label)
      - path_like can be:
          * direct path to a monitor.csv
          * directory with subdirs each containing monitor.csv
          * glob pattern
    """
    setup_paper_style(single_column)
    fig, ax = plt.subplots()

    # Draw each model
    for path_like, label in models:
        files = _collect_monitor_files(path_like)
        runs = _load_runs(files)
        _plot_one_model(ax, runs, label=label, window=window)

    # Axes labels/title & cosmetics (unchanged)
    ax.set_xlabel("Training steps")
    ax.set_ylabel("Average return")
    ax.set_title(env_name)
    ax.xaxis.set_major_locator(MaxNLocator(5))
    ax.yaxis.set_major_locator(MaxNLocator(5))
    ax.xaxis.set_minor_locator(MaxNLocator(10))
    ax.yaxis.set_minor_locator(MaxNLocator(10))
    ax.xaxis.set_major_formatter(EngFormatter(sep="\N{THIN SPACE}"))
    ax.grid(True, which="minor", linewidth=0.3, alpha=0.15)
    ax.legend(frameon=False, loc="upper left", handlelength=1.6, borderaxespad=0.5, labelspacing=0.4)
    ax.margins(x=0.02, y=0.05)

    # Save
    os.makedirs("plots", exist_ok=True)
    base = (
        f"plots/{(out_name or env_name).lower().replace(' ', '_')}"
    )
    plt.savefig(base + ".pdf")
    if export_png:
        plt.savefig(base + ".png", dpi=600)
    plt.show()
    return fig, ax


# ---------- legacy single-model convenience (kept API-compatible) ----------
def plot_training_results(
    log_folder: str,
    env_name="HalfCheetah-v4",
    label="MLP [17, 64, 64, 6]",
    single_column=True,
    export_png=True,
):
    return plot_models(
        models=[(log_folder, label)],
        env_name=env_name,
        single_column=single_column,
        export_png=export_png,
        out_name=env_name,
    )


if __name__ == "__main__":
    # EXAMPLES:
    # 1) Single model from a directory of runs
    # plot_training_results("logs/MLP_runs", env_name="HalfCheetah-v4", label="MLP")

    # 2) Multiple models: mix of directory, glob, and direct file
    plot_models(
        models=[
            ("logs/HalfCheetah-v4_seed_42", "MLP FP: [17, 64, 64, 6]"),
            ("logs_kan_direct/monitor.csv", "KAN FP: [17, 6]"),
        ],
        env_name="HalfCheetah-v4",
        out_name="halfcheetah_comparison",
    )
    pass
