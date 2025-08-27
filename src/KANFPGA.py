import os, re, shutil, json, math
import numpy as np

import torch
import torch.nn as nn
import torch.nn.functional as F

from KAN_QAT import KAN

device = 'cuda' if torch.cuda.is_available() else 'cpu'

def converter(state_dict, remaining_fraction, config, output_dir):
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
        └─ build_full.tcl       --Build script
        └─ build_ooc.tcl       --Build script
    """

    print(f"Converting KAN model to hardware ...")
    print(f"Remaining fraction: {remaining_fraction}")

    #Make the directories within output_dir
    os.makedirs(os.path.join(output_dir, "src"), exist_ok=True)
    os.makedirs(os.path.join(output_dir, "mem"), exist_ok=True)
    os.makedirs(os.path.join(output_dir, "vivado"), exist_ok=True)
    os.makedirs(os.path.join(output_dir, "testbench"), exist_ok=True)

    model = init_model(state_dict, config)

    #Copy the top file to src
    shutil.copy(os.path.join(os.path.dirname(__file__), "templates", "src", "top.vhd"), os.path.join(output_dir, "src", "top.vhd"))

    #Generate sprase cache
    cache = generate_sparse_cache(model, remaining_fraction, config)

    #Write the KAN core VHDL
    write_kan_core(model, cache, output_dir)

    #Make the PkgTypes.vhd file
    generate_pkg_types(config, output_dir)

    #Generate the LUT data files (mem files)
    generate_lut_data(model, config, cache, output_dir)
    
    #Make the PkgLUT.vhd file
    generate_pkg_lut(config, output_dir)

    #Make the LUT.vhd file
    generate_lut_vhd(config, output_dir)

    #Make the build.tcl file
    generate_build_tcl(config, output_dir)

    #Generate testbench
    generate_testbench(model, config, output_dir)


########################################################
# Helper functions
########################################################

def init_model(state_dict, config):

    model = KAN(
        config["layers"],
        config["layers_precision"],
        grid_size=config["grid_size"],
        spline_order=config["spline_order"],
        grid_eps=config["grid_eps"],
        base_activation=eval(config["base_activation"]),
        quantize=config["quantize"],
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

    #Get the quantization precision for the layer
    tp, fp = config["layers_precision"][layer_i]
    grid_range = [-2**(tp - fp - 1), 2**(tp - fp - 1)]
    resolution = int(2 ** tp)

    # Create dummy input
    array = np.linspace(grid_range[0], grid_range[1], resolution)
    stacked_array = np.hstack([[array]*layer.in_features]).T
    x = torch.from_numpy(stacked_array).float().to(device)

    #Loop through each activation function
    base_output = layer.base_activation(x)[: , inp_node] * layer.base_weight[out_node, inp_node]

    spline_output = F.linear(layer.b_splines(x)[:, inp_node, :], layer.scaled_spline_weight[out_node, inp_node, :])

    return (layer.spline_selector[out_node, inp_node] * (base_output + spline_output)).tolist()

def generate_sparse_cache(model, remaining_fraction, config):
    """
    Generate a sparse cache of the model based on the remaining fraction
    """

    cache = {}
    for i, layer in enumerate(model.layers):
        for j in range(layer.in_features):
            for k in range(layer.out_features):
                cache[f"lut_{i}_{j}_{k}"] = get_activation_values(model, i, j, k, config)

    #Then prune the dense cache based on the remaining fraction
    norms = {key: np.linalg.norm(np.array(value)) for key, value in cache.items()}
    sorted_keys = sorted(norms.keys(), key=lambda k: norms[k])
    
    # Calculate number of nodes to prune based on fraction
    num_to_prune = int(len(cache) * (1 - remaining_fraction))
    
    # Delete lowest x fraction of nodes
    for key in sorted_keys[:num_to_prune]:
        del cache[key]

    return cache

def write_kan_core(model, cache, output_dir, max_per_line=16):

    """
    Write the KAN core VHDL file
    max_per_line is the maximum number of signals per line in the VHDL file
    """
    
    #Helper function to check if a LUT exists
    def lut_exists(i,j,k): return f"lut_{i}_{j}_{k}" in cache

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
        if acts: block.append(emit(acts, f"lut_output_t_{i}"))
        if outs: block.append(emit(outs, f"lut_output_t_{i}"))
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
                    f"  i{inst_idx:02d} : entity work.LUT_{i} "
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

    with open(os.path.join(os.path.dirname(__file__), "templates", "src", "KAN.vhd"), "r") as tf:
        tpl = tf.read()
    vhdl_text = tpl.replace("{{SIGNAL_DECLS}}", SIGNAL_DECLS)
    vhdl_text = vhdl_text.replace("{{LAYER_BLOCKS}}", LAYER_BLOCKS)

    #Write the VHDL code to the file
    out_vhd = os.path.join(output_dir, "src", "KAN.vhd")
    os.makedirs(os.path.dirname(out_vhd), exist_ok=True)
    with open(out_vhd, "w") as f:
        f.write(vhdl_text)


    pass

def generate_lut_data(model, config, cache, output_dir):
    """
    Generate per-LUT memory files for VHDL 'lut_lookup' blocks.

    Output:
      output_dir/mem/lut_{i}_{j}_{k}.mem   # ASCII hex, one word per line, two's-complement
    Assumptions:
      - config has attributes: tp (or tot_precision), fp (or float_precision),
        lut_res (or resolution), grid_range ([-R, R]).
      - If a pruned cache is present, use it.
      - Else compute values with get_activation_values(model, i, j, k, configlike).
    """

    # ---- pull numeric formats from model (with safe defaults) ----

    # ---- helpers ----
    def to_fixed_int(x, tot_bits, frac_bits):
        """Quantize float x to Q format integer with clamp, then two's complement."""
        scale = 1 << frac_bits
        v = int(round(float(x) * scale))
        min_int = -(1 << (tot_bits - 1))
        max_int = (1 << (tot_bits - 1)) - 1
        if v < min_int: v = min_int
        if v > max_int: v = max_int
        return v
    
    def int_to_hex_word(v, tot_bits):
        """Two's complement as fixed-width uppercase hex (no 0x, one word)."""
        if v < 0:
            v = (1 << tot_bits) + v
        width_nibbles = (tot_bits + 3) // 4
        return f"{v:0{width_nibbles}X}"

    # ---- compute-or-read values and write .mem files ----
    written = 0
    for i, layer in enumerate(model.layers):
        in_f  = layer.in_features
        out_f = layer.out_features

        #Get the quantization precision for the layer
        tp, fp = config["layers_precision"][i]

        for j in range(in_f):
            for k in range(out_f):

                #Check if the LUT exists in the cache
                key = f"lut_{i}_{j}_{k}"
                if key not in cache: continue

                vals = cache[key]

                # quantize -> hex lines
                hex_lines = [int_to_hex_word(to_fixed_int(v, tp, fp), tp) for v in vals]

                # write file
                mem_path = os.path.join(output_dir, "mem", f"{key}.mem")
                with open(mem_path, "w") as f:
                    f.write("\n".join(hex_lines) + "\n")
                written += 1

    # Small breadcrumb
    print(f"Wrote {written} LUT .mem file(s) to {output_dir}/mem/")

def generate_pkg_types(config, output_dir):
    """
    Generate the PkgTypes.vhd file
    """

    with open(os.path.join(os.path.dirname(__file__), "templates", "src", "PkgTypes.vhd"), "r") as tf:
        tpl = tf.read()

    #Replace the placeholders with the actual values
    vhdl_text = tpl.replace("{{N_INPUT}}", str(config["layers"][0]))
    vhdl_text = vhdl_text.replace("{{N_OUTPUT}}", str(config["layers"][-1]))

    #Get the quantization precision for the input layer
    vhdl_text = vhdl_text.replace("{{INPUT_WIDTH}}", str(config["layers_precision"][0][0]))
    vhdl_text = vhdl_text.replace("{{INPUT_FRAC}}", str(config["layers_precision"][0][1]))

    #Get the quantization precision for the output layer
    vhdl_text = vhdl_text.replace("{{OUTPUT_WIDTH}}", str(config["layers_precision"][-1][0]))
    vhdl_text = vhdl_text.replace("{{OUTPUT_FRAC}}", str(config["layers_precision"][-1][1]))

    with open(os.path.join(output_dir, "src", "PkgTypes.vhd"), "w") as f:
        f.write(vhdl_text)

def generate_lut_vhd(config, output_dir):
    """
    Generate the LUT.vhd file
    """

    #Open the template file
    with open(os.path.join(os.path.dirname(__file__), "templates", "src", "LUT.vhd"), "r") as tf:
        tpl = tf.read()

    #Loop through the layers and generate the VHDL code
    for i, layer in enumerate(config["layers"][:-1]):
        vhdl_text = tpl.replace("{{LUT_LAYER_NAME}}", f"LUT_{i}")
        vhdl_text = vhdl_text.replace("{{LUT_ADDR_WIDTH}}", f"LUT_ADDR_WIDTH_{i}")
        vhdl_text = vhdl_text.replace("{{LUT_DATA_WIDTH}}", f"LUT_DATA_WIDTH_{i}")
        vhdl_text = vhdl_text.replace("{{LUT_SIZE}}", f"LUT_SIZE_{i}")
        vhdl_text = vhdl_text.replace("{{LUT_INPUT_TYPE}}", f"lut_input_t_{i}")
        vhdl_text = vhdl_text.replace("{{LUT_OUTPUT_TYPE}}", f"lut_output_t_{i}")

        #Write the VHDL code to the file
        out_path = os.path.join(output_dir, "src", f"LUT_{i}.vhd")
        os.makedirs(os.path.dirname(out_path), exist_ok=True)
        with open(out_path, "w") as f:
            f.write(vhdl_text)


def generate_pkg_lut(config, output_dir):
    """
    Generate the PkgLUT.vhd file
    """

    tpl_path = os.path.join(os.path.dirname(__file__), "templates", "src", "PkgLUT.vhd")
    with open(tpl_path, "r") as tf:
        tpl = tf.read()

    n_layers = max(0, len(config["layers"]) - 1)
    blocks = []

    assert len(config["layers_precision"]) - 1 == n_layers , "There is one less LUT implementable layer than the number of layers in the model"

    for i in range(1, len(config["layers_precision"])):

        layer_idx = i - 1
        prev_tp = config["layers_precision"][i - 1][0]
        curr_tp = config["layers_precision"][i][0]

        blocks.append(
            "\n".join([
                f"  -- Layer {layer_idx}",
                f"  constant LUT_SIZE_{layer_idx}        : integer := {1 << prev_tp};",
                f"  constant LUT_ADDR_WIDTH_{layer_idx}  : integer := {prev_tp};",
                f"  constant LUT_DATA_WIDTH_{layer_idx}  : integer := {curr_tp};",
                f"  subtype  lut_input_t_{layer_idx}  is signed(LUT_ADDR_WIDTH_{layer_idx}-1 downto 0);",
                f"  subtype  lut_output_t_{layer_idx} is signed(LUT_DATA_WIDTH_{layer_idx}-1 downto 0);",
            ])
        )

    vhdl_text = tpl.replace("{{LAYER_TYPES_BLOCK}}", "\n\n".join(blocks) or "  -- (no layers)")

    out_path = os.path.join(output_dir, "src", "PkgLUT.vhd")
    os.makedirs(os.path.dirname(out_path), exist_ok=True)
    with open(out_path, "w") as f:
        f.write(vhdl_text)

def generate_build_tcl(config, output_dir):
    """
    Generate the build.tcl file
    """

    #Just copy the template file
    shutil.copy(os.path.join(os.path.dirname(__file__), "templates", "vivado", "build_full.tcl"), os.path.join(output_dir, "vivado", "build_full.tcl"))
    shutil.copy(os.path.join(os.path.dirname(__file__), "templates", "vivado", "build_ooc.tcl"), os.path.join(output_dir, "vivado", "build_ooc.tcl"))

def generate_testbench(model, config, output_dir):

    #Copy over the testbench template
    shutil.copy(os.path.join(os.path.dirname(__file__), "templates", "testbench", "tb_top.vhd"), os.path.join(output_dir, "testbench", "tb_top.vhd"))

    #Copy over the sim.tcl file
    shutil.copy(os.path.join(os.path.dirname(__file__), "templates", "vivado", "sim.tcl"), os.path.join(output_dir, "vivado", "sim.tcl"))


    
