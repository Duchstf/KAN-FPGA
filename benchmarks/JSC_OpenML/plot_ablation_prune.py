# plot_accuracy_resources.py
import os
import matplotlib as mpl
import matplotlib.pyplot as plt
from matplotlib.ticker import EngFormatter, MaxNLocator, PercentFormatter
import matplotlib.patheffects as pe

# ---------- style ----------
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
            "axes.spines.top": True,
            "axes.spines.right": False,  # primary axes; we'll enable right spine only on twin
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

# ---------- plotting ----------
def _next_cycle_color(ax):
    tmp, = ax.plot([], [])
    c = tmp.get_color()
    tmp.remove()
    return c

def plot_prune_ratio_vs_lut_ff(
    prune_ratio,
    lut,
    ff,
    single_column=True,
    export_png=True,
    out_name="accuracy_resources",
):
    setup_paper_style(single_column)
    fig, ax1 = plt.subplots()

    # Primary (left) axis: LUT
    lut_color = _next_cycle_color(ax1)
    l1, = ax1.plot(
        prune_ratio, lut, marker="o", label="LUT usage", color=lut_color,
        path_effects=[pe.Stroke(linewidth=1.9, foreground="white"), pe.Normal()],
        zorder=3,
    )
    ax1.set_xlabel("Pruned Ratio")
    ax1.set_ylabel("LUT Usage", color=lut_color)
    ax1.tick_params(axis="y", labelcolor=lut_color)

    # Secondary (right) axis: FF
    ax2 = ax1.twinx()
    ax2.spines["right"].set_visible(True)  # re-enable right spine on twin

    ff_color = _next_cycle_color(ax1)
    l2, = ax2.plot(
        prune_ratio, ff, marker="s", linestyle="--", label="FF Usage", color=ff_color,
        path_effects=[pe.Stroke(linewidth=1.9, foreground="white"), pe.Normal()],
        zorder=3,
    )
    ax2.set_ylabel("FF usage", color=ff_color)
    ax2.tick_params(axis="y", labelcolor=ff_color)

    # Title and axes formatting
    ax1.xaxis.set_major_locator(MaxNLocator(5))
    ax1.xaxis.set_major_formatter(PercentFormatter(xmax=1.0, decimals=0))
    ax1.yaxis.set_major_locator(MaxNLocator(5))
    ax2.yaxis.set_major_locator(MaxNLocator(5))
    ax1.grid(True, which="minor", linewidth=0.3, alpha=0.15)
    # Add margins so lines don’t overlap with axes
    ax1.margins(x=0.05, y=0.1)   # was (0.02, 0.05)

    # Annotate last values
    # if len(accuracy):
    #     ax1.annotate(
    #         f"{lut[-1]:.0f}",
    #         xy=(accuracy[-1], lut[-1]),
    #         xytext=(-5, -16),   # <-- added vertical offset
    #         textcoords="offset points",
    #         va="bottom", ha="left",
    #         fontsize=7, color=lut_color,
    #         path_effects=[pe.Stroke(linewidth=1.5, foreground="white"), pe.Normal()],
    #     )
    #     ax2.annotate(
    #         f"{ff[-1]:.0f}",
    #         xy=(accuracy[-1], ff[-1]),
    #         xytext=(-20, 4),   # <-- shifted down instead of up
    #         textcoords="offset points",
    #         va="top", ha="left",
    #         fontsize=7, color=ff_color,
    #         path_effects=[pe.Stroke(linewidth=1.5, foreground="white"), pe.Normal()],
    #     )

    # Combined legend
    lines = [l1, l2]
    labels = [ln.get_label() for ln in lines]
    ax1.legend(lines, labels, frameon=False, loc="best", handlelength=1.6, borderaxespad=0.5, labelspacing=0.4)

    # Save
    os.makedirs("plots", exist_ok=True)
    base = f"plots/{out_name.lower().replace(' ', '_')}"
    plt.savefig(base + ".pdf")
    if export_png:
        plt.savefig(base + ".png", dpi=600)
    plt.show()
    return fig, (ax1, ax2)

# ---------- main ----------
if __name__ == "__main__":
    # Your data
    REMAINING = [1, 0.7381, 0.4762, 0.3393, 0.1488, 0.0417]
    LUT = [1570, 1263, 930, 668, 220, 48]
    FF = [1248, 1075, 827, 604, 296, 72]
    PRUNED = [1-x for x in REMAINING]
   
    plot_prune_ratio_vs_lut_ff(
        prune_ratio=PRUNED,
        lut=LUT,
        ff=FF,
        single_column=True,   # False for a wider, two-column figure
        export_png=True,
        out_name="prune_resources",
    )
