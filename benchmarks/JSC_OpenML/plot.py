import matplotlib.pyplot as plt
import numpy as np
import matplotlib.ticker as mticker

# --- Set Style for Academic Publications ---
# Using a common style sheet for consistency.
# 'seaborn-v0_8-paper' is a good choice for papers.
plt.style.use('seaborn-v0_8-paper')
# You can also set font properties globally
plt.rcParams.update({
    'font.family': 'serif',  # Or 'sans-serif'
    'font.size': 10,         # Adjust as needed
    'axes.labelsize': 10,
    'axes.titlesize': 12,
    'xtick.labelsize': 8,
    'ytick.labelsize': 8,
    'legend.fontsize': 8,
    'figure.titlesize': 14
})


# --- Data for Plots ---

# Data for Plot 1
ACCURACY = [69.6, 73.13, 74.53, 75.27, 76.0]
LUT_1 = [166, 403, 625, 709, 1232]
FF_1 = [135, 342, 517, 652, 900]

# Data for Plot 2
REMAINING = [1, 0.7381, 0.4762, 0.3393, 0.1488, 0.0417]
# Calculate the percentage of pruned weights for a more intuitive x-axis
PRUNED = [(1 - x) * 100 for x in REMAINING]
LUT_2 = [1570, 1263, 930, 668, 220, 48]
FF_2 = [1248, 1075, 827, 604, 296, 72]

# Data for Plot 3
LAYER_WIDTH = [1, 2, 4, 8, 16, 32, 64]
LUT_3 = [158, 377, 821, 1629, 3044, 6210, 12455]
FF_3 = [178, 319, 640, 1284, 2417, 4941, 9464]

# Data for Plot 4
BITWIDTH = [12, 10, 8, 6, 4, 2]
LUT_4 = [61297, 14403, 4025, 1496, 859, 338]
FF_4 = [2930, 2018, 1567, 1191, 720, 378]


# --- Create the Figure and Subplots ---
# Create a figure with 1 row and 4 columns of subplots.
# `figsize` is set to be wide and short, suitable for a paper's width. (width, height in inches)
# `sharey=True` so that all plots share the same y-axis labels.
fig, axes = plt.subplots(1, 4, figsize=(12, 3), sharey=False)

# --- Plot 1: Accuracy vs. Resources ---
ax1 = axes[0]
ax1.plot(ACCURACY, LUT_1, marker='o', linestyle='-', label='LUT')
ax1.plot(ACCURACY, FF_1, marker='^', linestyle='--', label='FF')
ax1.set_title('(a)')
ax1.set_xlabel('Accuracy (%)', fontsize=12)
ax1.set_ylabel('Resource Count', fontsize=14)
ax1.legend(fontsize=10)
ax1.grid(True, linestyle='--', alpha=0.6)

# --- Plot 2: Pruning vs. Resources ---
ax2 = axes[1]
ax2.plot(PRUNED, LUT_2, marker='o', linestyle='-', label='LUT')
ax2.plot(PRUNED, FF_2, marker='^', linestyle='--', label='FF')
ax2.set_title('(b)')
ax2.set_xlabel('Pruning Percentage (%)', fontsize=12)
ax2.legend(fontsize=10)
ax2.grid(True, linestyle='--', alpha=0.6)

# --- Plot 3: Layer Width vs. Resources ---
ax3 = axes[2]
ax3.plot(LAYER_WIDTH, LUT_3, marker='o', linestyle='-', label='LUT')
ax3.plot(LAYER_WIDTH, FF_3, marker='^', linestyle='--', label='FF')
ax3.set_title('(c)')
ax3.set_xlabel('Hidden Layer Width', fontsize=12)
# Ensure all x-ticks are shown
# ax3.set_xticks(LAYER_WIDTH)
ax3.get_xaxis().set_major_formatter(plt.ScalarFormatter()) # show numbers instead of scientific notation
ax3.yaxis.set_major_formatter(mticker.EngFormatter())
ax3.legend(fontsize=10)
ax3.grid(True, linestyle='--', alpha=0.6)

# --- Plot 4: Bitwidth vs. Resources ---
ax4 = axes[3]
ax4.plot(BITWIDTH, LUT_4, marker='o', linestyle='-', label='LUT')
ax4.plot(BITWIDTH, FF_4, marker='^', linestyle='--', label='FF')
ax4.set_title('(d)')
ax4.set_xlabel('Model Bitwidth', fontsize=12)
# Invert x-axis to show decreasing bitwidth from left to right, which is standard
ax4.invert_xaxis()
ax4.yaxis.set_major_formatter(mticker.EngFormatter())
ax4.legend(fontsize=10)
ax4.grid(True, linestyle='--', alpha=0.6)

# --- Final Adjustments & Saving ---
# Adjust layout to prevent labels from overlapping.
plt.tight_layout()

# Save the figure to a file.
# Using a vector format like PDF or SVG is recommended for publications.
# You can also use a high-DPI PNG.
plt.savefig('plots/ablation_plots.pdf', format='pdf', bbox_inches='tight')
plt.savefig('plots/ablation_plots.png', format='png', dpi=300, bbox_inches='tight')


