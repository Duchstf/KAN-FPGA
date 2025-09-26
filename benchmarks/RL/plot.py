# plot.py
import os
import glob
import json
import numpy as np
import pandas as pd
import matplotlib as mpl
import matplotlib.pyplot as plt
from matplotlib.ticker import EngFormatter, MaxNLocator
import matplotlib.patheffects as pe

WINDOW = 50  # moving-average window (episodes)


# ---------- helpers ----------
def moving_average(y: np.ndarray, w: int) -> np.ndarray:
    """Return a length-(len(y)-w+1) moving average when w>1; else y unchanged."""
    if w is None or w <= 1 or len(y) < w:
        return y
    return np.convolve(y, np.ones(w), mode="valid") / w


def _desaturate(hex_color, factor=0.25):
    rgb = mpl.colors.to_rgb(hex_color)
    return tuple(1 - factor * (1 - c) for c in rgb)


# --- Style block from the first script ---
def apply_academic_style():
    """
    Applies the plotting style from the first script for academic publications.
    """
    # Using a common style sheet for consistency.
    plt.style.use('seaborn-v0_8-paper')
    # You can also set font properties globally
    plt.rcParams.update({
        'font.family': 'serif',
        'font.size': 10,
        'axes.labelsize': 10,
        'axes.titlesize': 12,
        'xtick.labelsize': 8,
        'ytick.labelsize': 8,
        'legend.fontsize': 8,
        'figure.titlesize': 14,
        # Incorporate the grid style directly into rcParams for consistency
        'axes.grid': True,
        'grid.linestyle': '--',
        'grid.alpha': 0.3
    })


# ---------- IO & reconstruction ----------
def _is_monitor_file(path: str) -> bool:
    name = os.path.basename(path)
    return (
        name.endswith(".monitor.csv")
        or name.endswith(".monitor.csv.gz")
        or name == "monitor.csv"
        or name == "monitor.csv.gz"
    )


def _read_monitor_with_tstart(path: str) -> pd.DataFrame:
    """
    Read a single monitor file, parse the JSON header to get t_start,
    and return a DataFrame with ['r','l','t','abs_time'].
    """
    t_start = None
    opener = open
    if path.endswith(".gz"):
        import gzip
        opener = gzip.open

    with opener(path, "rt") as f:
        header = f.readline().strip()
        if header.startswith("#"):
            try:
                t_start = json.loads(header[1:]).get("t_start", None)
            except Exception:
                t_start = None

    df = pd.read_csv(path, comment="#")  # skip JSON header lines
    if not {"r", "l", "t"}.issubset(df.columns):
        raise ValueError(f"Malformed monitor file: {path}")
    if t_start is None:
        t_start = os.path.getmtime(path)

    df["abs_time"] = t_start + df["t"].astype(float)
    return df[["r", "l", "t", "abs_time"]]


def _collect_runs(path_like: str):
    """
    Returns a list of runs, where each run is a LIST of monitor-file paths.
    This version treats each monitor file in a directory as a separate run (seed).
    """
    runs = []

    for p in glob.glob(path_like):
        p = os.path.abspath(p)
        if os.path.isfile(p):
            if _is_monitor_file(p) or p.endswith(".csv"):
                runs.append([p])
        elif os.path.isdir(p):
            # Prefer subdirectories as separate runs
            subdir_runs = []
            for sub in sorted(os.listdir(p)):
                subpath = os.path.join(p, sub)
                if os.path.isdir(subpath):
                    files = [
                        os.path.join(subpath, f)
                        for f in os.listdir(subpath)
                        if os.path.isfile(os.path.join(subpath, f)) and _is_monitor_file(os.path.join(subpath, f))
                    ]
                    if files:
                        subdir_runs.append(sorted(files))
            if subdir_runs:
                runs.extend(subdir_runs)
            else:
                # No subdir runs -> treat each monitor file in this dir as a separate run.
                files = [
                    os.path.join(p, f)
                    for f in os.listdir(p)
                    if os.path.isfile(os.path.join(p, f)) and _is_monitor_file(os.path.join(p, f))
                ]
                if files:
                    for f in sorted(files):
                        runs.append([f]) # Create a new run for each file
    return runs


def _load_run(files_for_one_run):
    """
    Merge all worker monitor files of a single run:
      - read each worker file
      - compute abs_time = t_start + t
      - concat all episodes and sort by abs_time
      - timesteps = cumsum(l)  (global across workers)
    Returns DataFrame with columns: ['timesteps','reward'].
    """
    parts = []
    for f in files_for_one_run:
        try:
            parts.append(_read_monitor_with_tstart(f))
        except Exception:
            continue
    if not parts:
        return None

    df = pd.concat(parts, ignore_index=True)
    df.sort_values("abs_time", inplace=True)
    df["timesteps"] = df["l"].cumsum()
    out = df[["timesteps", "r"]].rename(columns={"r": "reward"}).reset_index(drop=True)
    return out


def _load_runs_any(path_like: str):
    """Given a path/glob, return a list of run DataFrames for that model."""
    runs = []
    for files in _collect_runs(path_like):
        run_df = _load_run(files)
        if run_df is not None and not run_df.empty:
            runs.append(run_df)
    return runs


# ---------- plotting ----------
def _plot_one_model(ax, runs, label, window=WINDOW):
    if not runs:
        return

    # Align to the shortest run length for fair averaging
    min_len = min(len(r) for r in runs)
    x = runs[0]["timesteps"].values[:min_len]
    y_stack = np.stack([r["reward"].values[:min_len] for r in runs])
    
    # Calculate mean and standard deviation across runs
    y_mean = y_stack.mean(axis=0)
    y_std = y_stack.std(axis=0)

    # Smooth the mean curve
    ma_y = moving_average(y_mean, window)
    # Adjust x-axis to match the length of the smoothed data
    ma_x = x[window - 1 :] if window > 1 else x
    
    # Pick color from the active style's color cycle
    tmp, = ax.plot([], [])
    line_color = tmp.get_color()
    tmp.remove()
    fill_color = _desaturate(line_color, factor=0.15)

    # Plot the smoothed mean line
    ax.plot(
        ma_x, ma_y, label=label, color=line_color,
        path_effects=[pe.Stroke(linewidth=1.9, foreground="white"), pe.Normal()],
        zorder=3,
    )

    # Plot the uncertainty band (mean +/- standard error of the mean)
    if len(runs) > 1:
        # 1. Calculate Standard Error of the Mean (SEM)
        y_sem = y_std / np.sqrt(len(runs))
        
        # 2. Smooth the SEM curve
        ma_sem = moving_average(y_sem, window)

        # 3. Use the smoothed SEM array directly for the band
        if len(ma_sem) == len(ma_x):
            ax.fill_between(
                ma_x, ma_y - ma_sem, ma_y + ma_sem,
                facecolor=fill_color, alpha=0.9, linewidth=0, zorder=1
            )

    # Annotate last value
    if len(ma_x) and len(ma_y):
        ax.annotate(
            f"{ma_y[-1]:.1f}",
            xy=(ma_x[-1], ma_y[-1]),
            xytext=(6, 0),
            textcoords="offset points",
            va="center", ha="left",
            fontsize=7, color=line_color,
            path_effects=[pe.Stroke(linewidth=1.5, foreground="white"), pe.Normal()],
        )


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
          * direct path to a monitor file
          * directory with *.monitor.csv (one run)
          * directory with subdirs each containing *.monitor.csv (multiple runs)
          * glob pattern
    """
    # Apply the new academic style
    apply_academic_style()
    
    # Define figure size
    width_in = 3.54 if single_column else 7.28
    height_in = 2.3 if single_column else 3.6
    fig, ax = plt.subplots(figsize=(width_in, height_in))

    for path_like, label in models:
        runs = _load_runs_any(path_like)
        print(f"Found {len(runs)} runs for '{label}' in '{path_like}'")
        _plot_one_model(ax, runs, label=label, window=window)

    ax.set_xlabel("Training Steps")
    ax.set_ylabel("Episode Reward")
    ax.set_title(env_name)
    ax.xaxis.set_major_locator(MaxNLocator(5))
    ax.yaxis.set_major_locator(MaxNLocator(5))
    ax.xaxis.set_minor_locator(MaxNLocator(10))
    ax.xaxis.set_major_formatter(EngFormatter(sep="\N{THIN SPACE}"))
    # The grid is now controlled by the rcParams set in apply_academic_style()
    ax.legend(title="Model : Dimension", frameon=False, loc="lower right", handlelength=1.6, borderaxespad=0.5, labelspacing=0.4, title_fontsize=6, fontsize=6)
    ax.margins(x=0.02, y=0.05)

    os.makedirs("plots", exist_ok=True)
    base = f"plots/{(out_name or env_name).lower().replace(' ', '_')}"
    # Using a vector format like PDF is recommended for publications.
    plt.savefig(base + ".pdf", format='pdf', bbox_inches='tight')
    if export_png:
        plt.savefig(base + ".png", format='png', dpi=300, bbox_inches='tight')
    plt.show()
    return fig, ax


# ---------- single-model convenience ----------
def plot_training_results(
    log_folder: str,
    env_name="HalfCheetah-v4",
    label="Model",
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
    # The script will now correctly identify each seed_*.monitor.csv file
    # in 'logs_mlp' as an individual run and plot the mean with SEM.
    plot_models(
        models=[
            ("logs_mlp", "MLP FP: [17, 64, 64, 6]"),
            ("logs_mlp8_quant", "MLP 8-bit: [17, 64, 64, 6]"),
            ("logs_kan_float", "KAN FP: [17, 6]"),
            ("logs_kan_quant", "KAN 8-bit: [17, 6]"),
        ],
        env_name="HalfCheetah-v5",
        out_name="halfcheetah_comparison",
        window=WINDOW,
    )