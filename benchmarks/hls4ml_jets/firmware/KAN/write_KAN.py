def main():
    output_file = "kantest.cpp"
    
    # Define the range of indexes you want to loop over
    indexes = {
        0:range(0,16*4),
        1:range(0,4*5)
    }
    
    # Create or overwrite the output file
    with open(output_file, 'w') as f:

            #First layer
            for j in indexes[0]: f.write(f'lut_t output_0_{j} = lut_lookup_0_{j}(input[{j//4}]);\n')

            #Sum up
            for j in range(4):
                f.write(f'lut_t med_0_{j} = ')

                for k in range(0,15): f.write(f'output_0_{k*4 + j} + ')

                f.write(f'output_0_{4*15+j};\n')
            
            #Second layer
            for j in indexes[1]: f.write(f'lut_t output_1_{j} = lut_lookup_1_{j}(med_0_{j//5});\n')

            #Sum up
            for j in range(5):
                f.write(f'lut_t output[{j}] = ')

                for k in range(0,3): f.write(f'output_1_{k*5 + j} + ')

                f.write(f'output_1_{5*3+j};\n')



    print(f"Functions have been written to {output_file}")

if __name__ == "__main__":
    main()