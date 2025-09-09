library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package PkgTypes is
  -- Model parameters
  constant N_INPUT  : positive := {{N_INPUT}};
  constant N_OUTPUT : positive := {{N_OUTPUT}};

  -- bitwidths
  constant INPUT_WIDTH : positive := {{INPUT_WIDTH}};
  constant OUTPUT_WIDTH : positive := {{OUTPUT_WIDTH}};

  subtype input_t  is unsigned(INPUT_WIDTH-1 downto 0);
  subtype output_t is signed(OUTPUT_WIDTH-1 downto 0);

  type input_vec_t  is array (0 to N_INPUT-1)  of input_t;
  type output_vec_t is array (0 to N_OUTPUT-1) of output_t;

  -- For summation
{{SUMMATION_BLOCK}}
  
  -- Function to saturate a signed value into W-bit signed range
  function saturate(x : signed; W : positive) return signed;
end package PkgTypes;

package body PkgTypes is
  -- Function to saturate a signed value into W-bit signed range
  -- Input x can be wider than W
  function saturate(x : signed; W : positive) return signed is
      variable result : signed(W-1 downto 0);
      constant MAXVAL : signed(x'length-1 downto 0) := to_signed( 2**(W-1)-1, x'length);
      constant MINVAL : signed(x'length-1 downto 0) := to_signed(-2**(W-1),   x'length);
  begin
      if x > MAXVAL then
          result := to_signed( 2**(W-1)-1, W);
      elsif x < MINVAL then
          result := to_signed(-2**(W-1),   W);
      else
          result := resize(x, W);
      end if;

      return result;
  end function;
end package body PkgTypes;