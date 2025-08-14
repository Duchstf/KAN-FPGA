-- types_pkg.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package PkgTypes is

  -- tune these to match your design
  constant N_INPUT  : positive := INSERT_N_INPUT;
  constant N_OUTPUT : positive := INSERT_N_OUTPUT;

  -- fixed-point formats
  constant INPUT_WIDTH : positive := INSERT_INPUT_WIDTH;  -- signed
  constant INPUT_FRAC  : natural  := INSERT_INPUT_FRAC;   -- matches your >>4

  constant LUT_WIDTH   : positive := INSERT_LUT_WIDTH;  -- signed output of LUT
  constant LUT_FRAC    : natural  := INSERT_LUT_FRAC;  -- e.g., Q3.12

  -- LUT depth (must be power-of-two for ADDR_WIDTH)
  constant LUT_ADDR_WIDTH : positive := INSERT_LUT_ADDR_WIDTH;  -- depth = 256
  constant LUT_SIZE       : positive := 2**LUT_ADDR_WIDTH;

  subtype input_t  is signed(INPUT_WIDTH-1 downto 0);
  subtype lut_t    is signed(LUT_WIDTH-1 downto 0);
  subtype result_t is signed(LUT_WIDTH-1 downto 0);

  type input_vec_t  is array (0 to N_INPUT-1)  of input_t;
  type result_vec_t is array (0 to N_OUTPUT-1) of result_t;
end package;
