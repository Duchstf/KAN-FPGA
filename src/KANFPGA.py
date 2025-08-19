import os, re, shutil, json, math
import numpy as np

import torch
import torch.nn as nn
import torch.nn.functional as F

from KANLinear import KAN

device = 'cuda' if torch.cuda.is_available() else 'cpu'

def converter(state_dict, config, output_dir):
    """
    model is the state_dict of the KAN model
    config is the configuration of the KAN model
    output_dir is the directory to store the hardware files

    This function will generate the hardware VHDL files for the KAN model, with the following structure:

    output_dir/
    ├─ src/
    │  ├─ PkgTypes.vhd
    │  ├─ PkgLUT.vhd
    │  ├─ LUT_ROM_XPM.vhd
    │  ├─ LUT_LOOKUP.vhd
    │  ├─ kan_core.vhd 
    │  └─ top.vhd
    ├─ mem/                --LUTs data files
    │  ├─ lut_0_0_0.mem
    │  ├─ ...
    │  └─ lut_1_4_4.mem
    └─ vivado/             
        └─ build.tcl       --Build script
    """

    print(f"Converting KAN model to hardware ...")

    #Make the directories within output_dir
    os.makedirs(os.path.join(output_dir, "src"), exist_ok=True)
    os.makedirs(os.path.join(output_dir, "mem"), exist_ok=True)
    os.makedirs(os.path.join(output_dir, "vivado"), exist_ok=True)

    model = init_model(state_dict, config)

    #Copy the top file to src
    shutil.copy(os.path.join(os.path.dirname(__file__), "templates", "top.vhd"), os.path.join(output_dir, "src", "top.vhd"))

    #Write the KAN core VHDL
    write_kan_core(model, output_dir)

    #Generate the LUT data files (mem files
    generate_lut_data(model, config, output_dir)

    #Make the PkgTypes.vhd file
    generate_pkg_types(config, output_dir)

    #Make the PkgLUT.vhd file
    generate_pkg_lut(config, output_dir)

    #Copy the LUT.vhd file to src
    shutil.copy(os.path.join(os.path.dirname(__file__), "templates", "LUT.vhd"), os.path.join(output_dir, "src", "LUT.vhd"))

    #Make the build.tcl file
    generate_build_tcl(config, output_dir)


########################################################
# Helper functions
########################################################

def init_model(state_dict, config):

    model = KAN(
        config["layers"],
        grid_size=config["grid_size"],
        spline_order=config["spline_order"],
        grid_eps=config["grid_eps"],
        base_activation=eval(config["base_activation"]),
        grid_range=config["grid_range"],
        quantize=config["quantize"],
        tp=config["TP"],
        fp=config["FP"],
        lut_res=config["resolution"],
        quantize_clip=config["quantize_clip"]
    ).to(device)

    model.load_state_dict(state_dict)
    model.eval() #Set the model to evaluation mode

    return model

def get_activation_values(model, layer_i, inp_node, out_node, config):
    """
    Get the activation values for a given LUT
    """

    layer = model.layers[layer_i]

    # Create dummy input
    array = np.linspace(config["grid_range"][0], config["grid_range"][1], config["resolution"])
    stacked_array = np.hstack([[array]*layer.in_features]).T
    x = torch.from_numpy(stacked_array).float().to(device)

    #Loop through each activation function
    base_output = layer.base_activation(x)[: , inp_node] * layer.base_weight[out_node, inp_node]

    spline_output = F.linear(layer.b_splines(x)[:, inp_node, :], layer.scaled_spline_weight[out_node, inp_node, :])

    return (layer.spline_selector[out_node, inp_node] * (base_output + spline_output)).tolist()
    
def write_kan_core(model, output_dir, max_per_line=16):

    """
    Write the KAN core VHDL file
    max_per_line is the maximum number of signals per line in the VHDL file
    """

    # Try to load a pruned cache so we only instantiate existing LUTs
    # (falls back to "assume all exist" if no cache is found)
    cache = None
    try:
        candidates = [f for f in os.listdir(output_dir)
                      if re.match(r"values_cache_\d+\.json$", f)]
        if candidates:
            with open(os.path.join(output_dir, candidates[0]), "r") as f:
                cache = json.load(f)
    except Exception:
        cache = None
    
    #Helper function to check if a LUT exists
    def lut_exists(i,j,k): return True if cache is None else f"lut_{i}_{j}_{k}" in cache

    # ---------- Build SIGNAL_DECLS ----------

    #Helper function to emit a list of signals
    def emit(names, typ="lut_output_t"):
        lines=[]; buf=[]
        for n in names:
            buf.append(n)
            if len(buf)==max_per_line:
                lines.append(f"  signal {', '.join(buf)} : {typ};"); buf=[]
        if buf: lines.append(f"  signal {', '.join(buf)} : {typ};")
        return "\n".join(lines)

    sections=[]

    #Loop through the layers and pick up the signals that exist
    for i, layer in enumerate(model.layers):
        in_f, out_f = layer.in_features, layer.out_features
        acts=[f"act_{i}_{j}_{k}" for j in range(in_f) for k in range(out_f) if lut_exists(i,j,k)]
        outs=[f"out{i}_{k}" for k in range(out_f)] if i != len(model.layers)-1 else []
        block=[f"-- Layer {i} ({in_f}->{out_f})"]
        if acts: block.append(emit(acts))
        if outs: block.append(emit(outs))
        sections.append("\n".join(block))

    # ---------- Build LAYER_BLOCKS ----------
    num_layers = len(model.layers)
    layer_blocks = []

    for i, layer in enumerate(model.layers):
        in_f, out_f = layer.in_features, layer.out_features

        for k in range(out_f):
            blk = [f"-- LAYER {i}, ch {k}",
                f"gen_l{i}c{k} : block",
                "begin"]

            inst_idx, sum_terms = 0, []
            for j in range(in_f):
                if not lut_exists(i, j, k): 
                    continue
                mem = f"lut_{i}_{j}_{k}.mem"
                src = f"input({j})" if i == 0 else f"out{i-1}_{j}"
                dst = f"act_{i}_{j}_{k}"
                blk.append(
                    f"  i{inst_idx:02d} : entity work.LUT "
                    f'generic map (MEMFILE=>"{mem}") '
                    f"port map (clk, {src}, {dst});"
                )
                sum_terms.append(dst)
                inst_idx += 1

            target = f"output({k})" if i == num_layers - 1 else f"out{i}_{k}"
            rhs = " + ".join(sum_terms) if sum_terms else "(others => '0')  -- no surviving LUTs"
            blk.append(f"  {target} <= {rhs};")
            blk.append("end block;")

            layer_blocks.append("\n  ".join(blk))
    
    #Generate the VHDL code
    SIGNAL_DECLS = "\n\n".join(sections) if sections else "-- (no signals)"
    LAYER_BLOCKS = "\n\n  ".join(layer_blocks) if layer_blocks else "-- (no layers)"

    with open(os.path.join(os.path.dirname(__file__), "templates", "KAN.vhd"), "r") as tf:
        tpl = tf.read()
    vhdl_text = tpl.replace("{{SIGNAL_DECLS}}", SIGNAL_DECLS)
    vhdl_text = vhdl_text.replace("{{LAYER_BLOCKS}}", LAYER_BLOCKS)

    #Write the VHDL code to the file
    out_vhd = os.path.join(output_dir, "src", "KAN.vhd")
    os.makedirs(os.path.dirname(out_vhd), exist_ok=True)
    with open(out_vhd, "w") as f:
        f.write(vhdl_text)


    pass

def generate_lut_data(model, config, output_dir):
    """
    Generate per-LUT memory files for VHDL 'lut_lookup' blocks.

    Output:
      output_dir/mem/lut_{i}_{j}_{k}.mem   # ASCII hex, one word per line, two's-complement
    Assumptions:
      - config has attributes: tp (or tot_precision), fp (or float_precision),
        lut_res (or resolution), grid_range ([-R, R]).
      - If a pruned values_cache_*.json is present in output_dir, use it.
      - Else compute values with get_activation_values(model, i, j, k, configlike).
    """

    # ---- pull numeric formats from model (with safe defaults) ----
    tot_precision = config["TP"]
    float_precision = config["FP"]
    resolution = config["resolution"]
    grid_range = config["grid_range"]

    assert grid_range[0] == -grid_range[1] and len(grid_range) == 2 and math.log(grid_range[1], 2).is_integer()

    # ---- initialize cache (if any) ----
    cache = None
    try:
        candidates = [f for f in os.listdir(output_dir)
                      if re.match(r"values_cache_\d+\.json$", f)]
        if candidates:
            with open(os.path.join(output_dir, candidates[0]), "r") as f:
                cache = json.load(f)
    except Exception:
        cache = None

    # ---- helpers ----
    def to_fixed_int(x, tot_bits=tot_precision, frac_bits=float_precision):
        """Quantize float x to Q format integer with clamp, then two's complement."""
        scale = 1 << frac_bits
        v = int(round(float(x) * scale))
        min_int = -(1 << (tot_bits - 1))
        max_int = (1 << (tot_bits - 1)) - 1
        if v < min_int: v = min_int
        if v > max_int: v = max_int
        return v
    
    def int_to_hex_word(v, tot_bits=tot_precision):
        """Two's complement as fixed-width uppercase hex (no 0x, one word)."""
        if v < 0:
            v = (1 << tot_bits) + v
        width_nibbles = (tot_bits + 3) // 4
        return f"{v:0{width_nibbles}X}"

    # ---- compute-or-read values and write .mem files ----
    # Fall back config-like dict if we need to compute fresh values
    cfg_like = {"grid_range": grid_range, "resolution": resolution}

    written = 0
    for i, layer in enumerate(model.layers):
        in_f  = layer.in_features
        out_f = layer.out_features

        for j in range(in_f):
            for k in range(out_f):
                key = f"lut_{i}_{j}_{k}"

                # if we have a cache AND this LUT is not present (pruned), skip
                if cache is not None and key not in cache:
                    continue

                if cache is not None:
                    vals = cache[key]
                else:
                    vals = get_activation_values(model, i, j, k, config)

                # quantize -> hex lines
                hex_lines = [int_to_hex_word(to_fixed_int(v)) for v in vals]

                # write file
                mem_path = os.path.join(output_dir, "mem", f"{key}.mem")
                with open(mem_path, "w") as f:
                    f.write("\n".join(hex_lines) + "\n")
                written += 1

    # Small breadcrumb
    print(f"Wrote {written} LUT .mem file(s) to {output_dir}/mem/ (TP={tot_precision}, FP={float_precision}, RES={resolution}).")

def generate_pkg_types(config, output_dir):
    """
    Generate the PkgTypes.vhd file
    """

    with open(os.path.join(os.path.dirname(__file__), "templates", "PkgTypes.vhd"), "r") as tf:
        tpl = tf.read()

    #Replace the placeholders with the actual values
    vhdl_text = tpl.replace("{{N_INPUT}}", str(config["layers"][0]))
    vhdl_text = vhdl_text.replace("{{N_OUTPUT}}", str(config["layers"][-1]))

    vhdl_text = vhdl_text.replace("{{INPUT_WIDTH}}", str(config["TP"]))
    vhdl_text = vhdl_text.replace("{{INPUT_FRAC}}", str(config["FP"]))

    vhdl_text = vhdl_text.replace("{{LUT_WIDTH}}", str(config["TP"]))
    vhdl_text = vhdl_text.replace("{{LUT_FRAC}}", str(config["FP"]))
    
    vhdl_text = vhdl_text.replace("{{LUT_ADDR_WIDTH}}", str(config["resolution"]))

    with open(os.path.join(output_dir, "src", "PkgTypes.vhd"), "w") as f:
        f.write(vhdl_text)

def generate_pkg_lut(config, output_dir):
    """
    Generate the PkgLUT.vhd file
    """

    with open(os.path.join(os.path.dirname(__file__), "templates", "PkgLUT.vhd"), "r") as tf:
        tpl = tf.read()

    vhdl_text = tpl.replace("{{LUT_SIZE}}", str(config["resolution"]))
    vhdl_text = vhdl_text.replace("{{LUT_ADDR_WIDTH}}", str(config["TP"]))
    vhdl_text = vhdl_text.replace("{{LUT_DATA_WIDTH}}", str(config["TP"]))

    with open(os.path.join(output_dir, "src", "PkgLUT.vhd"), "w") as f:
        f.write(vhdl_text)

def generate_build_tcl(config, output_dir):
    """
    Generate the build.tcl file
    """

    #Just copy the template file
    shutil.copy(os.path.join(os.path.dirname(__file__), "templates", "build.tcl"), os.path.join(output_dir, "vivado", "build.tcl"))