library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package PkgTypes is
  -- Model parameters
  constant N_INPUT  : positive := {{N_INPUT}};
  constant N_OUTPUT : positive := {{N_OUTPUT}};

  -- Fixed-point formats
  constant INPUT_WIDTH : positive := {{INPUT_WIDTH}};
  constant INPUT_FRAC  : natural  := {{INPUT_FRAC}};  

  constant OUTPUT_WIDTH : positive := {{OUTPUT_WIDTH}};
  constant OUTPUT_FRAC  : natural  := {{OUTPUT_FRAC}};

  subtype input_t  is signed(INPUT_WIDTH-1 downto 0);
  subtype output_t is signed(OUTPUT_WIDTH-1 downto 0);

  type input_vec_t  is array (0 to N_INPUT-1)  of input_t;
  type output_vec_t is array (0 to N_OUTPUT-1) of output_t;
end package;
