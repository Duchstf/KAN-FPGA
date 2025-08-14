import os, re, shutil, json, math
import torch
import torch.nn as nn
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
    └─ script/             
        └─ build.tcl       --Build script
    """

    print(f"Converting KAN model to hardware ...")

    #Make the directories within output_dir
    os.makedirs(os.path.join(output_dir, "src"), exist_ok=True)
    os.makedirs(os.path.join(output_dir, "mem"), exist_ok=True)
    os.makedirs(os.path.join(output_dir, "script"), exist_ok=True)

    model = init_model(state_dict, config)

    #Copy the top file to src
    shutil.copy(os.path.join(os.path.dirname(__file__), "templates", "top.vhd"), os.path.join(output_dir, "src", "top.vhd"))

    #Write the KAN core VHDL
    write_kan_core(model, output_dir)

    # #Make the PkgTypes.vhd file
    # with open(os.path.join(output_dir, "src", "PkgTypes.vhd"), "w") as f:
    #     f.write(f"library ieee;\nuse ieee.std_logic_1164.all;\nuse ieee.numeric_std.all;\n\npackage PkgTypes is\n\n")

    # from types import SimpleNamespace



    # --- Pull config values (with a few safe defaults) ---

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
    def emit(names, typ="lut_t"):
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
                    f"  i{inst_idx:02d} : entity work.lut_lookup "
                    f'generic map (MEMFILE=>"{mem}") '
                    f"port map (clk, '1', {src}, {dst});"
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