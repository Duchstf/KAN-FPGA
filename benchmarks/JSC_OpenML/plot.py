# plot_all_resources_2x2_outer_ylabels.py
import os
import matplotlib as mpl
import matplotlib.pyplot as plt
from matplotlib.ticker import MaxNLocator, EngFormatter
import matplotlib.patheffects as pe
from typing import Tuple

# ---------- style ----------
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

def setup_paper_style(single_column: bool = False) -> Tuple[float, float]:
    """
    Use two-column width by default to keep everything readable at the same page count.
    """
    width_in = 7.28 if not single_column else 3.54
    height_in = 3.9  # taller to fit two rows
    oi_cycle = [
        "#0072B2", "#E69F00", "#009E73", "#D55E00",
        "#CC79A7", "#56B4E9", "#F0E442", "#000000",
    ]
    mpl.rcParams.update(
        {
            "figure.figsize": (width_in, height_in),
            "figure.dpi": 300,
            "savefig.bbox": "tight",
            "savefig.pad_inches": 0.01,
            "pdf.fonttype": 42,
            "ps.fonttype": 42,

            # Fonts
            "font.size": 8.6,
            "axes.titlesize": 8.6,
            "axes.labelsize": 8.6,
            "xtick.labelsize": 8.0,
            "ytick.labelsize": 8.0,
            "legend.fontsize": 8.0,
            "font.family": "sans-serif",
            "font.sans-serif": ["Helvetica", "Arial", "DejaVu Sans"],
            "mathtext.fontset": "stixsans",

            # Lines & axes
            "lines.linewidth": 1.3,
            "lines.solid_capstyle": "round",
            "axes.linewidth": 0.85,
            "axes.spines.top": True,
            "axes.spines.right": False,  # right spine shown only on twin
            "axes.grid": True,
            "axes.grid.which": "major",
            "grid.linestyle": "-",
            "grid.linewidth": 0.45,
            "grid.alpha": 0.22,

            # Ticks
            "xtick.direction": "out",
            "ytick.direction": "out",
            "xtick.major.size": 3.0,
            "ytick.major.size": 3.0,
            "xtick.major.width": 0.85,
            "ytick.major.width": 0.85,

            # Layout
            "figure.constrained_layout.use": True,
            "axes.titlepad": 2.0,
        }
    )
    mpl.rcParams["axes.prop_cycle"] = mpl.cycler(color=oi_cycle)
    _try_enable_usetex()
    return width_in, height_in

def _next_cycle_color(ax):
    tmp, = ax.plot([], [])
    c = tmp.get_color()
    tmp.remove()
    return c

def _panel_label(ax, label: str):
    ax.text(0.02, 0.96, label, transform=ax.transAxes,
            ha="left", va="top", fontweight="bold")

def _format_compact_ticks(axis):
    """
    Use engineering formatter to shorten tick labels (e.g., 61 k instead of 61297).
    Keep 0 decimals for a clean look.
    """
    axis.set_major_formatter(EngFormatter(places=0, sep="\N{THIN SPACE}"))

# ---------- one panel (with twins) ----------
def plot_panel(
    ax, x, y_lut, y_ff, xlabel,
    show_left_ylabel: bool, show_right_ylabel: bool, panel_tag: str
):
    # Left axis: LUT
    lut_color = _next_cycle_color(ax)
    l1, = ax.plot(
        x, y_lut, marker="o", label="LUT", color=lut_color,
        path_effects=[pe.Stroke(linewidth=1.8, foreground="white"), pe.Normal()],
        zorder=3,
    )
    ax.set_xlabel(xlabel)
    if show_left_ylabel:
        ax.set_ylabel("LUT", color=lut_color)
    ax.tick_params(axis="y", labelcolor=lut_color)
    ax.yaxis.set_major_locator(MaxNLocator(4))
    ax.xaxis.set_major_locator(MaxNLocator(4))
    _format_compact_ticks(ax.yaxis)
    ax.margins(x=0.05, y=0.12)

    # Right axis: FF
    ax2 = ax.twinx()
    ax2.spines["right"].set_visible(True)
    ff_color = _next_cycle_color(ax)
    l2, = ax2.plot(
        x, y_ff, marker="s", linestyle="--", label="FF", color=ff_color,
        path_effects=[pe.Stroke(linewidth=1.8, foreground="white"), pe.Normal()],
        zorder=3,
    )
    if show_right_ylabel:
        ax2.set_ylabel("FF", color=ff_color)
    ax2.tick_params(axis="y", labelcolor=ff_color)
    ax2.yaxis.set_major_locator(MaxNLocator(4))
    _format_compact_ticks(ax2.yaxis)

    # Panel tag
    _panel_label(ax, panel_tag)
    return l1, l2

# ---------- main combined figure ----------
def plot_all_four(export_png=True, out_name="resources_2x2_outer_ylabels", two_column=True):
    setup_paper_style(single_column=not two_column)

    fig, axes = plt.subplots(2, 2)

    # ---- Data ----
    # (a) Accuracy
    ACCURACY = [69.6, 73.13, 74.53, 75.27, 75.73]
    LUT_acc = [166, 403, 625, 709, 949]
    FF_acc  = [135, 342, 517, 652, 857]

    # (b) Pruned ratio
    REMAINING = [1, 0.7381, 0.4762, 0.3393, 0.1488, 0.0417]
    PRUNED = [1 - x for x in REMAINING]
    LUT_prune = [1570, 1263, 930, 668, 220, 48]
    FF_prune  = [1248, 1075, 827, 604, 296, 72]

    # (c) Width
    LAYER_WIDTH = [1, 2, 4, 8, 16, 32, 64]
    LUT_width = [158, 377, 821, 1629, 3044, 6210, 12455]
    FF_width  = [178, 319, 640, 1284, 2417, 4941, 9464]

    # (d) Bitwidth
    BITWIDTH = [12, 10, 8, 6, 4, 2]
    LUT_bw = [61297, 14403, 4025, 1496, 859, 338]
    FF_bw  = [2930, 2018, 1567, 1191, 720, 378]

    # ---- Panels (only outer y-labels per row) ----
    # Row 1: (a) left shows "LUT", (b) right shows "FF"
    h1 = plot_panel(
        axes[0, 0], ACCURACY, LUT_acc, FF_acc,
        xlabel="Accuracy (%)",
        show_left_ylabel=True, show_right_ylabel=False, panel_tag="(a)"
    )
    h2 = plot_panel(
        axes[0, 1], [p*100 for p in PRUNED], LUT_prune, FF_prune,
        xlabel="Pruned Ratio (%)",
        show_left_ylabel=False, show_right_ylabel=True, panel_tag="(b)"
    )
    # Row 2: (c) left shows "LUT", (d) right shows "FF"
    h3 = plot_panel(
        axes[1, 0], LAYER_WIDTH, LUT_width, FF_width,
        xlabel="Middle Layer Width",
        show_left_ylabel=True, show_right_ylabel=False, panel_tag="(c)"
    )
    h4 = plot_panel(
        axes[1, 1], BITWIDTH, LUT_bw, FF_bw,
        xlabel="Bitwidth",
        show_left_ylabel=False, show_right_ylabel=True, panel_tag="(d)"
    )

    # Ticks: a bit cleaner for percent panel
    axes[0, 1].xaxis.set_major_locator(MaxNLocator(5))

    # Shared legend
    handles = [h1[0], h1[1]]
    labels = ["LUT", "FF"]
    fig.legend(
        handles, labels, ncol=2, frameon=False, bbox_to_anchor=(0.5, 1.02),
        loc="lower center", columnspacing=1.0, handlelength=1.6
    )

    # Save
    os.makedirs("plots", exist_ok=True)
    base = f"plots/{out_name.lower().replace(' ', '_')}"
    fig.savefig(base + ".pdf")
    if export_png:
        fig.savefig(base + ".png", dpi=600)
    plt.show()
    return fig, axes

# ---------- script entry ----------
if __name__ == "__main__":
    # Two-column width by default; set two_column=False for single-column.
    plot_all_four(export_png=True, out_name="resources_2x2_outer_ylabels", two_column=True)
