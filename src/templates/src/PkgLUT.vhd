library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package PkgLUT is
    constant LUT_SIZE : positive := {{LUT_SIZE}}; --LUT size
    constant LUT_ADDR_WIDTH : positive := {{LUT_ADDR_WIDTH}}; --LUT address width = log2(LUT_SIZE)
    constant LUT_DATA_WIDTH : positive := {{LUT_DATA_WIDTH}}; --LUT data width (=LUT address width in our case)
    
    subtype lut_output_t is signed(LUT_ADDR_WIDTH-1 downto 0);
    subtype lut_input_t is signed(LUT_ADDR_WIDTH-1 downto 0);

end package;