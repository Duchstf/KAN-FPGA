import json, os, math, shutil, argparse
import numpy as np

import torch
import torch.nn as nn
import torch.nn.functional as F
import matplotlib.pyplot as plt

from KANLinear import KAN

device = 'cuda' if torch.cuda.is_available() else 'cpu'


def converter(state_dict, config, output_dir):
    """
    model is the state_dict of the KAN model
    config is the configuration of the KAN model
    output_dir is the directory to store the hardware files
    """
    from types import SimpleNamespace

    print(f"Converting KAN model to hardware ...")

    # --- Pull config values (with a few safe defaults) ---
    TP = config["TP"]                        # total precision
    FP = config["FP"]                        # fractional precision
    resolution = config["resolution"]        # LUT resolution
    grid_range = config["grid_range"]        # e.g. [-8, 8]
    prune_fraction = config.get("prune_fraction", 0.0)  # optional

    # Validity checks (match CLI)
    assert grid_range[0] == -grid_range[1] and len(grid_range) == 2 and math.log(grid_range[1], 2).is_integer()

    # --- Initialize and load the KAN model ---
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
    model.eval()

    # --- Prepare output dir and helper "args" namespace used by generators ---
    output_dir = os.path.expanduser(output_dir)
    os.makedirs(output_dir, exist_ok=True)

    args_ns = SimpleNamespace(
        tot_precision=TP,
        float_precision=FP,
        resolution=resolution,
        grid_range=grid_range,
        output_dir=output_dir,
    )

    # --- Copy TCL template (for synthesis projects) ---
    shutil.copy(os.path.join(BASE_PATH, 'templates', 'tcl.template'),
                os.path.join(output_dir, 'KAN.tcl'))

    # --- Build or load the LUT cache at max internal resolution, then (optionally) prune ---
    cache_file = os.path.join(output_dir, f'values_cache_{MAX_RESOLUTION}.json')
    if not os.path.exists(cache_file):
        # generate_values_cache expects a "config-like" dict that provides grid_range & resolution
        cache = generate_values_cache(model, config)
        with open(cache_file, 'w') as f:
            json.dump(cache, f)
    else:
        with open(cache_file, 'r') as f:
            cache = json.load(f)

    if prune_fraction and prune_fraction > 0.0:
        cache = prune_cache(cache, prune_fraction=prune_fraction)

    # --- Write out the various headers and sources ---
    defines = generate_defines_h(model, args_ns)
    with open(os.path.join(output_dir, 'defines.h'), 'w') as f:
        f.write(defines)

    vti = generate_values_to_index(model, args_ns)
    with open(os.path.join(output_dir, 'values_to_index.h'), 'w') as f: f.write(vti)
    shutil.copy(os.path.join(BASE_PATH, 'templates', 'value_to_index.h'), os.path.join(output_dir, 'value_to_index.h'))

    lookup_files = generate_all_lookups(model, args_ns, cache)
    for fname, contents in lookup_files.items():
        with open(os.path.join(output_dir, fname), 'w') as f:
            f.write(contents)

    kan_cpp = generate_kan_cpp(model, cache)
    with open(os.path.join(output_dir, 'KAN.cpp'), 'w') as f:
        f.write(kan_cpp)

    print(f"Done. Files are in: {output_dir}")

#------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------
from KANLinear import KANLinear

device = 'cuda' if torch.cuda.is_available() else 'cpu'

BASE_PATH = os.path.dirname(os.path.abspath(__file__))

# MODEL_PATH = "KAN-FPGA/mini_kan.pt"
# RESOLUTION = 256
# GRID_RANGE = [-8, 8]

# model = torch.load(MODEL_PATH, weights_only=False)

MAX_RESOLUTION = 1024

def quantize_value(x, tot_precision=16, float_precision=6):

    x = round(x * (2 ** float_precision))
    range_size = 2 ** tot_precision

    unsigned_x = (x + range_size / 2) % range_size
    signed_x = unsigned_x - range_size / 2

    return signed_x / (2 ** float_precision)


def prune_cache(cache, prune_fraction=0.1):

    # Calculate norms and sort by importance
    norms = {key: np.linalg.norm(np.array(value)) for key, value in cache.items()}
    sorted_keys = sorted(norms.keys(), key=lambda k: norms[k])
    
    # Calculate number of nodes to prune based on fraction
    num_to_prune = int(len(cache) * prune_fraction)
    
    # Delete lowest x fraction of nodes
    for key in sorted_keys[:num_to_prune]:
        del cache[key]

    return cache


def generate_defines_h(model, args):

    with open(f"{BASE_PATH}/templates/defines.template", "r") as f:
        defines_content = f.read()

    defines_content = defines_content.replace("{TOT_BITS}", str(args.tot_precision)) \
                                     .replace("{IBITS}", str(args.tot_precision - args.float_precision)) \
                                     .replace("{LUT_SIZE}", str(args.resolution)) \
                                     .replace("{N_INPUT}", str(model.layers[0].in_features)) \
                                     .replace("{N_OUTPUT}", str(model.layers[-1].out_features))
    return defines_content


def generate_values_to_index(model, args):

    shift_by = 1 + int(math.log(args.grid_range[1], 2))

    with open(f"{BASE_PATH}/templates/lookup_header.template", "r") as f:
        file_contents = f.read().replace("{ZERO_PT}", str(args.grid_range[1])).replace("{SHIFT_FACTOR}", str(shift_by))
    
    return file_contents

def get_activation_values(model, layer_i, inp_node, out_node, config):
    """
    For the ith layer in the model, get the lookup table values for activation on edge from inp_node to out_node.
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

def generate_values_cache(model, args):

    cache = {}
    for i, layer in enumerate(model.layers):
        for j in range(layer.in_features):
            for k in range(layer.out_features):
                print(f"Processing lut_{i}_{j}_{k}...")
                cache[f"lut_{i}_{j}_{k}"] = get_activation_values(model, i, j, k, args)

    return cache

def generate_lookup_header_and_cpp(model, args, cache, i, j, k):

    if f"lut_{i}_{j}_{k}" not in cache:
        raise ValueError(f"lut_{i}_{j}_{k} not found in cache")

    with open(f"{BASE_PATH}/templates/lookup_header.template", "r") as f:
        lookup_header_contents = f.read()

    with open(f"{BASE_PATH}/templates/lookup_cpp.template", "r") as f:
        lookup_cpp_contents = f.read()

    lookup_header_contents = lookup_header_contents.replace("{i}", str(i)).replace("{j}", str(j)).replace("{k}", str(k))
    lookup_cpp_contents = lookup_cpp_contents.replace("{i}", str(i)).replace("{j}", str(j)).replace("{k}", str(k))

    value_table = cache[f"lut_{i}_{j}_{k}"][::MAX_RESOLUTION//args.resolution]

    formatted_tbl = '\n'.join(
        ', '.join(f"{' ' if x >= 0 else ''}(lut_t){quantize_value(x, tot_precision=args.tot_precision, float_precision=args.float_precision):.5e}" for x in value_table[i : i + 4]) + ","
        for i in range(0, args.resolution, 4)
    )[:-1] 

    lookup_cpp_contents = lookup_cpp_contents.replace("{FORMATTED_VALUES}", formatted_tbl)

    return lookup_header_contents, lookup_cpp_contents

def generate_all_lookups(model, args, cache):

    file_dict = {}

    for i, layer in enumerate(model.layers):
        for j in range(layer.in_features):
            for k in range(layer.out_features):
                if f"lut_{i}_{j}_{k}" not in cache:
                    continue

                lookup_header_contents, lookup_cpp_contents = generate_lookup_header_and_cpp(model, args, cache, i, j, k)

                file_dict[f"lut_{i}_{j}_{k}.h"] = lookup_header_contents
                file_dict[f"lut_{i}_{j}_{k}.cpp"] = lookup_cpp_contents

    return file_dict



def generate_kan_cpp(model, cache):

    file_contents = ""
    for i, layer in enumerate(model.layers):
        for j in range(layer.in_features):
            for k in range(layer.out_features):
                if f"lut_{i}_{j}_{k}" in cache:
                    file_contents += f"#include \"lut_{i}_{j}_{k}.h\"\n"
    
    file_contents += "\n"

    with open(f"{BASE_PATH}/templates/kan_header.template", "r") as f:
        file_contents += f.read() + "\n"

    for i, layer in enumerate(model.layers):

        file_contents += f"\n\n\t//// LAYER {i} ////\n"

        file_contents += "\n\t// Compute activations from LUTs\n"
        for j in range(layer.in_features):
            for k in range(layer.out_features):

                if f"lut_{i}_{j}_{k}" not in cache:
                    continue

                if i == 0:
                    file_contents += f"\tlut_t act_{i}_{j}_{k} = lut_lookup_{i}_{j}_{k}(input[{j}]);\n"
                else:
                    file_contents += f"\tlut_t act_{i}_{j}_{k} = lut_lookup_{i}_{j}_{k}(out_{i-1}_{j});\n"

        # file_contents += f"\n\t// Print activation values for layer {i} to {i + 1} edges\n"
        # for j in range(layer.in_features):
        #     for k in range(layer.out_features):
        #         file_contents += f"\tstd::cout << \"Layer {i} activation {j}->{k}: \" << act_{i}_{j}_{k} << std::endl;\n\n"

        file_contents += "\n\t// Aggregate activations to get layer outputs\n"
        for k in range(layer.out_features):

            sum_var = f"output[{k}]" if i == len(model.layers) - 1 else f"lut_t out_{i}_{k}"

            to_sum = [f"act_{i}_{j}_{k}" for j in range(layer.in_features) if f"lut_{i}_{j}_{k}" in cache]

            sum_str = f"{sum_var} = " + (" + ".join(to_sum) if to_sum else "0")

            file_contents += "\t" + sum_str + ";\n"

        # if i != len(model.layers) - 1:
        #     # Print activation values for debugging
        #     file_contents += f"\n\t// Print summed values for layer {i}:\n"
        #     file_contents += "\tstd::cout << \"Layer " + str(i) + f" outputs: \" << " + ' << \", \" << '.join(f'out_{i}_{k}' for k in range(layer.out_features)) + " << \"\\n\";"
        #     file_contents += "\n"

    
    return file_contents + "\n}"

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Generate KAN C++ files.')
    parser.add_argument('--model_path', type=str, required=True, help='Path to the model file')
    parser.add_argument('--resolution', type=int, default=256, help='Resolution for activation values')
    parser.add_argument('--grid_range', type=int, nargs=2, default=[-8, 8], help='Grid range as two integers')
    parser.add_argument('--tot_precision', type=int, default=16, help='Total bit precision')
    parser.add_argument('--float_precision', type=int, default=6, help='Floating bit precision')
    parser.add_argument('--output_dir', type=str, default='.', help='Directory to store output files')
    parser.add_argument('--prune_fraction', type=float, default=0.8, help='Fraction of LUTs to prune')

    args = parser.parse_args()

    args.output_dir = os.path.expanduser(args.output_dir)
    args.model_path = os.path.expanduser(args.model_path)

    # Basic validity checks
    assert args.grid_range[0] == -args.grid_range[1] and len(args.grid_range) == 2 and math.log(args.grid_range[1], 2).is_integer()
    
    model = torch.load(args.model_path, weights_only=False, map_location=torch.device("cpu"))

    if not os.path.exists(args.output_dir):
        os.makedirs(args.output_dir)

    shutil.copy(os.path.join(BASE_PATH, 'templates', 'tcl.txt'), os.path.join(args.output_dir, 'KAN.tcl'))
    
    cache_file = args.model_path + f'values_cache_{MAX_RESOLUTION}.json'
    if not os.path.exists(cache_file):
        cache = generate_values_cache(model, args.grid_range, tot_precision=args.tot_precision, float_precision=args.float_precision)
        with open(cache_file, 'w') as f:
            json.dump(cache, f)
    else:
        with open(cache_file, 'r') as f:
            cache = json.load(f)
    
    cache = prune_cache(cache, prune_fraction=args.prune_fraction)

    defines = generate_defines_h(model, args)
    with open(os.path.join(args.output_dir, 'defines.h'), 'w') as f:
        f.write(defines)
    
    values_to_index = generate_values_to_index(model, args)
    with open(os.path.join(args.output_dir, 'values_to_index.h'), 'w') as f:
        f.write(values_to_index)
    
    lookup_files = generate_all_lookups(model, args, cache)
    for file_name, file_contents in lookup_files.items():
        with open(os.path.join(args.output_dir, file_name), 'w') as f:
            f.write(file_contents)

    kan_cpp = generate_kan_cpp(model, cache)
    with open(os.path.join(args.output_dir, 'KAN.cpp'), 'w') as f:
        f.write(kan_cpp)