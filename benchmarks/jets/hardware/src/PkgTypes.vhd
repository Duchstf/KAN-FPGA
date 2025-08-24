library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package PkgTypes is
  -- Model parameters
  constant N_INPUT  : positive := 16;
  constant N_OUTPUT : positive := 5;

  -- Fixed-point formats
  constant INPUT_WIDTH : positive := 6;
  constant INPUT_FRAC  : natural  := 2;  

  constant OUTPUT_WIDTH : positive := 4;
  constant OUTPUT_FRAC  : natural  := 1;

  subtype input_t  is signed(INPUT_WIDTH-1 downto 0);
  subtype output_t is signed(OUTPUT_WIDTH-1 downto 0);

  type input_vec_t  is array (0 to N_INPUT-1)  of input_t;
  type output_vec_t is array (0 to N_OUTPUT-1) of output_t;
end package;
