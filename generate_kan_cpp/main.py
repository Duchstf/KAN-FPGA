from efficient_kan import KAN
import torch
import os
import math
import numpy as np
import argparse
import shutil
import torch.nn.functional as F

device = 'cuda' if torch.cuda.is_available() else 'cpu'

BASE_PATH = os.path.dirname(os.path.abspath(__file__))

# MODEL_PATH = "KAN-FPGA/mini_kan.pt"
# RESOLUTION = 256
# GRID_RANGE = [-8, 8]

# model = torch.load(MODEL_PATH, weights_only=False)

def generate_defines_h(model, resolution=256, tot_precision=16, float_precision=6):

    with open(f"{BASE_PATH}/templates/defines.txt", "r") as f:
        defines_content = f.read()

    defines_content = defines_content.replace("{TOT_BITS}", str(tot_precision)) \
                                     .replace("{FBITS}", str(float_precision)) \
                                     .replace("{LUT_SIZE}", str(resolution)) \
                                     .replace("{N_INPUT}", str(model.layers[0].in_features)) \
                                     .replace("{N_OUTPUT}", str(model.layers[-1].out_features))
    return defines_content

def generate_lookups_h(model, grid_range):
    """
    Generates `lookups.h` file.
    """

    shift_by = 1 + int(math.log(grid_range[1], 2))

    with open(f"{BASE_PATH}/templates/lookups_header.txt", "r") as f:
        lookup_file_contents = f.read().replace("{ZERO_PT}", str(grid_range[1])).replace("{SHIFT_FACTOR}", str(shift_by))
    
    with open(f"{BASE_PATH}/templates/lookup_func_template.txt", "r") as f:
        func_template = f.read()
    
    for i, layer in enumerate(model.layers):
        for j in range(layer.in_features):
            for k in range(layer.out_features):
                lookup_func = func_template.replace("{layer}", str(i)).replace("{j}", str(j)).replace("{k}", str(k))
                lookup_file_contents += "\n" + lookup_func + "\n"

    return lookup_file_contents

def get_activation_values(model, layer_i, inp_node, out_node, grid_range=[-8, 8], resolution=256):
    """
    For the ith layer in the model, get the lookup table values for activation on edge from inp_node to out_node.
    """

    layer = model.layers[layer_i]

    # Create dummy input
    array = np.linspace(grid_range[0], grid_range[1], resolution)
    stacked_array = np.hstack([[array]*layer.in_features]).T
    x = torch.from_numpy(stacked_array).float().to(device)

    #Loop through each activation function
    base_output = layer.base_activation(x)[: , inp_node] * layer.base_weight[out_node, inp_node]

    print(f"{ layer.b_splines(x).shape =}")
    print(f"{ layer.scaled_spline_weight.shape =}")

    spline_output = F.linear(layer.b_splines(x)[:, inp_node, :], layer.scaled_spline_weight[out_node, inp_node, :])

    return (base_output + spline_output).tolist()

def generate_values_h(model, grid_range, resolution):

    with open(f"{BASE_PATH}/templates/values_header.txt", "r") as f:
        values_file_contents = f.read()
    
    for i, layer in enumerate(model.layers):
        for j in range(layer.in_features):
            for k in range(layer.out_features):

                print(i, j, k)

                value_table = get_activation_values(model, i, j, k, grid_range=grid_range, resolution=resolution)

                formatted_tbl = '\n'.join(
                    ', '.join(f"{' ' if x >= 0 else ''}{x:.10e}" for x in value_table[i : i + 4]) + ","
                    for i in range(0, resolution, 4)
                )[:-1]

                values_file_contents += f"\nconst lut_t lut_0_0[LUT_SIZE] {{ \n {formatted_tbl} \n }}\n"

    return values_file_contents

def generate_kan_cpp(model):

    with open(f"{BASE_PATH}/templates/kan_header.txt", "r") as f:
        file_contents = f.read()

    for i, layer in enumerate(model.layers):

        file_contents += f"\n\n\t//// LAYER {i} ////\n"

        file_contents += "\n\t// Compute activations from LUTs\n"
        for j in range(layer.in_features):
            for k in range(layer.out_features):
                file_contents += f"\tlut_t act_{i}_{j}_{k} = lut_lookup_{i}_{j}_{k}(input[{j}]);\n"

        file_contents += "\n\t// Aggregate activations to get layer outputs\n"
        for k in range(layer.out_features):

            sum_var = f"output[{k}]" if i == len(model.layers) - 1 else f"lut_t out_{i}_{k}"
            sum_str = f"{sum_var} = " + " + ".join(f"act_{i}_{j}_{k}" for j in range(layer.in_features))
            file_contents += "\t" + sum_str + ";\n"
    
    return file_contents + "\n}"

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Generate KAN C++ files.')
    parser.add_argument('--model_path', type=str, required=True, help='Path to the model file')
    parser.add_argument('--resolution', type=int, default=256, help='Resolution for activation values')
    parser.add_argument('--grid_range', type=int, nargs=2, default=[-8, 8], help='Grid range as two integers')
    parser.add_argument('--tot_precision', type=int, default=16, help='Total bit precision')
    parser.add_argument('--float_precision', type=int, default=6, help='Floating bit precision')
    parser.add_argument('--output_dir', type=str, default='.', help='Directory to store output files')

    args = parser.parse_args()

    args.output_dir = os.path.expanduser(args.output_dir)
    args.model_path = os.path.expanduser(args.model_path)

    # Basic validity checks
    assert args.grid_range[0] == -args.grid_range[1] and len(args.grid_range) == 2 and math.log(args.grid_range[1], 2).is_integer()
    
    model = torch.load(args.model_path, weights_only=False)

    if not os.path.exists(args.output_dir):
        os.makedirs(args.output_dir)

    shutil.copy(os.path.join(BASE_PATH, 'templates', 'tcl.txt'), os.path.join(args.output_dir, 'KAN.tcl'))

    defines = generate_defines_h(model, resolution=args.resolution, tot_precision=args.tot_precision, float_precision=args.float_precision)
    with open(os.path.join(args.output_dir, 'defines.h'), 'w') as f:
        f.write(defines)
    
    lookups = generate_lookups_h(model, args.grid_range)
    with open(os.path.join(args.output_dir, 'lookups.h'), 'w') as f:
        f.write(lookups)
    
    values = generate_values_h(model, args.grid_range, args.resolution)
    with open(os.path.join(args.output_dir, 'values.h'), 'w') as f:
        f.write(values)

    kan_cpp = generate_kan_cpp(model)
    with open(os.path.join(args.output_dir, 'kan.cpp'), 'w') as f:
        f.write(kan_cpp)