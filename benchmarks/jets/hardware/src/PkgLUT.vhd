library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.fixed_pkg.all;

package PkgLUT is
    constant LUT_SIZE : positive := 128; --LUT size
    constant LUT_ADDR_WIDTH : positive := 7; --LUT address width = log2(LUT_SIZE)
    constant LUT_DATA_WIDTH : positive := 7; --LUT data width (=LUT address width in our case)
    
    subtype lut_output_t is signed(LUT_ADDR_WIDTH-1 downto 0);
    subtype lut_input_t is signed(LUT_ADDR_WIDTH-1 downto 0);

end package;