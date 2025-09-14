library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package PkgKAN is
  -- Model parameters
  constant N_INPUT  : positive := 2;
  constant N_OUTPUT : positive := 1;

  -- bitwidths
  constant INPUT_WIDTH : positive := 6;
  constant OUTPUT_WIDTH : positive := 8;

  subtype input_t  is unsigned(INPUT_WIDTH-1 downto 0);
  subtype output_t is signed(OUTPUT_WIDTH-1 downto 0);

  type input_vec_t  is array (0 to N_INPUT-1)  of input_t;
  type output_vec_t is array (0 to N_OUTPUT-1) of output_t;

  -- For summation
  constant SUM_WIDTH_0_0: positive := 6;
  subtype sum_t_0_0 is signed(SUM_WIDTH_0_0-1 downto 0);
  constant SUM_WIDTH_0_1: positive := 6;
  subtype sum_t_0_1 is signed(SUM_WIDTH_0_1-1 downto 0);
  constant SUM_WIDTH_1_0: positive := 9;
  subtype sum_t_1_0 is signed(SUM_WIDTH_1_0-1 downto 0);
  
  -- Function to saturate a signed value into W-bit signed range
  function saturate(x : signed; W : positive) return signed;
end package PkgKAN;

package body PkgKAN is
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
end package body PkgKAN;