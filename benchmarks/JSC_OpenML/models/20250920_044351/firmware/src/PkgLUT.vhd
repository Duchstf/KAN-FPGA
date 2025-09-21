library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package PkgLUT is
  -- Layer 0
  constant LUT_SIZE_0        : integer := 64;
  constant LUT_ADDR_WIDTH_0  : integer := 6;
  constant LUT_DATA_WIDTH_0  : integer := 6;
  subtype  lut_input_t_0  is unsigned(LUT_ADDR_WIDTH_0-1 downto 0);
  subtype  lut_output_t_0 is signed(LUT_DATA_WIDTH_0-1 downto 0);

  -- Layer 1
  constant LUT_SIZE_1        : integer := 64;
  constant LUT_ADDR_WIDTH_1  : integer := 6;
  constant LUT_DATA_WIDTH_1  : integer := 8;
  subtype  lut_input_t_1  is signed(LUT_ADDR_WIDTH_1-1 downto 0);
  subtype  lut_output_t_1 is signed(LUT_DATA_WIDTH_1-1 downto 0);
end package;