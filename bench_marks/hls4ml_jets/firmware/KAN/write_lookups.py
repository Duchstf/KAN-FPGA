def generate_function(layer_index, index):
    return f"""lut_t lut_lookup_{layer_index}_{index}(lut_input_t input) {{
    #pragma HLS BIND_STORAGE variable=lut_{layer_index}_{index} type=RAM_1P impl=LUTRAM
    return lut_{layer_index}_{index}[value_to_index(input)];
}}
"""

val_to_index = """int value_to_index(lut_input_t value) {
    int data_round = value * LUT_SIZE >> 4;
    int index = data_round + 8 * LUT_SIZE >> 4;

    if (index < 0)
        index = 0;
    if (index > LUT_SIZE - 1)
        index = LUT_SIZE - 1;

    return index;
}"""


def main():
    output_file = "lookups.h"
    
    # Define the range of indexes you want to loop over
    indexes = {
        0:range(0,16*4),
        1:range(0,4*5)
    }
    
    # Create or overwrite the output file
    with open(output_file, 'w') as f:

        f.write('#ifndef LOOKUPS_H\n#define LOOKUPS_H')
        f.write('\n'*2)
        f.write('#include "values.h"\n')
        f.write('#include "defines.h"\n\n')
        
        f.write(val_to_index)
        f.write('\n'*2)

        for i in range(len(indexes.keys())):
            for j in indexes[i]:
                f.write(generate_function(i,j))
                f.write('\n'*2)

        f.write('#endif')
    
    print(f"Functions have been written to {output_file}")

if __name__ == "__main__":
    main()
