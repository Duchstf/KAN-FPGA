library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package PkgKAN is
  -- Model parameters
  constant N_INPUT  : positive := 16;
  constant N_OUTPUT : positive := 5;

  -- bitwidths
  constant INPUT_WIDTH : positive := 6;
  constant OUTPUT_WIDTH : positive := 8;

  subtype input_t  is unsigned(INPUT_WIDTH-1 downto 0);
  subtype output_t is signed(OUTPUT_WIDTH-1 downto 0);

  type input_vec_t  is array (0 to N_INPUT-1)  of input_t;
  type output_vec_t is array (0 to N_OUTPUT-1) of output_t;

  -- For summation
  constant SUM_WIDTH_0_0: positive := 10;
  subtype sum_t_0_0 is signed(SUM_WIDTH_0_0-1 downto 0);
  constant SUM_WIDTH_0_1: positive := 10;
  subtype sum_t_0_1 is signed(SUM_WIDTH_0_1-1 downto 0);
  constant SUM_WIDTH_0_2: positive := 10;
  subtype sum_t_0_2 is signed(SUM_WIDTH_0_2-1 downto 0);
  constant SUM_WIDTH_1_0: positive := 10;
  subtype sum_t_1_0 is signed(SUM_WIDTH_1_0-1 downto 0);
  constant SUM_WIDTH_1_1: positive := 10;
  subtype sum_t_1_1 is signed(SUM_WIDTH_1_1-1 downto 0);
  constant SUM_WIDTH_1_2: positive := 10;
  subtype sum_t_1_2 is signed(SUM_WIDTH_1_2-1 downto 0);
  constant SUM_WIDTH_1_3: positive := 10;
  subtype sum_t_1_3 is signed(SUM_WIDTH_1_3-1 downto 0);
  constant SUM_WIDTH_1_4: positive := 10;
  subtype sum_t_1_4 is signed(SUM_WIDTH_1_4-1 downto 0);
  
  -- Function to saturate a signed value into W-bit signed range
  function saturate(x : signed; W : positive) return signed;
end package PkgKAN;

package body PkgKAN is
  -- Function to saturate a signed value into W-bit signed range
  function saturate(x : signed; W : positive) return signed is
      constant MAX_W_BITS : signed(W-1 downto 0) := (W-1 => '0', others => '1');
      constant MIN_W_BITS : signed(W-1 downto 0) := (W-1 => '1', others => '0');

      variable max_for_comp : signed(x'length-1 downto 0) := resize(MAX_W_BITS, x'length);
      variable min_for_comp : signed(x'length-1 downto 0) := resize(MIN_W_BITS, x'length);
      
      variable result : signed(W-1 downto 0);
  begin
      if x > max_for_comp then
          result := MAX_W_BITS;
      elsif x < min_for_comp then
          result := MIN_W_BITS;
      else
          result := resize(x, W);
      end if;

      return result;
  end function;
end package body PkgKAN;