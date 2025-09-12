library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package PkgLUT is
  -- Layer 0
  subtype lut_output_t_0 is signed(4 downto 0);
  type range_map_t_0 is record
    start_index : integer;
    end_index : integer;
    value : lut_output_t_0;
  end record;
  type lut_map_array_t_0 is array (natural range <>) of range_map_t_0;


  -- LUT for Layer 0, Input 0, Output 0
  constant LUT_0_0_0_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 0, value => to_signed(2, 5)),
    (start_index => 1, end_index => 7, value => to_signed(3, 5)),
    (start_index => 8, end_index => 9, value => to_signed(2, 5)),
    (start_index => 10, end_index => 11, value => to_signed(1, 5)),
    (start_index => 12, end_index => 13, value => to_signed(0, 5)),
    (start_index => 14, end_index => 16, value => to_signed(-1, 5)),
    (start_index => 17, end_index => 26, value => to_signed(-2, 5)),
    (start_index => 27, end_index => 29, value => to_signed(-1, 5)),
    (start_index => 30, end_index => 31, value => to_signed(0, 5)),
    (start_index => 32, end_index => 35, value => to_signed(1, 5)),
    (start_index => 36, end_index => 49, value => to_signed(2, 5)),
    (start_index => 50, end_index => 61, value => to_signed(3, 5)),
    (start_index => 62, end_index => 63, value => to_signed(4, 5))
  );

  -- LUT for Layer 0, Input 0, Output 1
  constant LUT_0_0_1_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 4, value => to_signed(3, 5)),
    (start_index => 5, end_index => 6, value => to_signed(2, 5)),
    (start_index => 7, end_index => 7, value => to_signed(1, 5)),
    (start_index => 8, end_index => 9, value => to_signed(0, 5)),
    (start_index => 10, end_index => 10, value => to_signed(-1, 5)),
    (start_index => 11, end_index => 11, value => to_signed(-2, 5)),
    (start_index => 12, end_index => 13, value => to_signed(-3, 5)),
    (start_index => 14, end_index => 22, value => to_signed(-4, 5)),
    (start_index => 23, end_index => 25, value => to_signed(-3, 5)),
    (start_index => 26, end_index => 27, value => to_signed(-2, 5)),
    (start_index => 28, end_index => 28, value => to_signed(-1, 5)),
    (start_index => 29, end_index => 30, value => to_signed(0, 5)),
    (start_index => 31, end_index => 32, value => to_signed(1, 5)),
    (start_index => 33, end_index => 35, value => to_signed(2, 5)),
    (start_index => 36, end_index => 38, value => to_signed(3, 5)),
    (start_index => 39, end_index => 41, value => to_signed(4, 5)),
    (start_index => 42, end_index => 44, value => to_signed(5, 5)),
    (start_index => 45, end_index => 47, value => to_signed(6, 5)),
    (start_index => 48, end_index => 49, value => to_signed(7, 5)),
    (start_index => 50, end_index => 51, value => to_signed(8, 5)),
    (start_index => 52, end_index => 53, value => to_signed(9, 5)),
    (start_index => 54, end_index => 56, value => to_signed(10, 5)),
    (start_index => 57, end_index => 58, value => to_signed(11, 5)),
    (start_index => 59, end_index => 61, value => to_signed(12, 5)),
    (start_index => 62, end_index => 63, value => to_signed(13, 5))
  );

  -- LUT for Layer 0, Input 0, Output 2
  constant LUT_0_0_2_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 0, value => to_signed(5, 5)),
    (start_index => 1, end_index => 4, value => to_signed(6, 5)),
    (start_index => 5, end_index => 7, value => to_signed(5, 5)),
    (start_index => 8, end_index => 10, value => to_signed(4, 5)),
    (start_index => 11, end_index => 18, value => to_signed(3, 5)),
    (start_index => 19, end_index => 22, value => to_signed(4, 5)),
    (start_index => 23, end_index => 26, value => to_signed(3, 5)),
    (start_index => 27, end_index => 29, value => to_signed(2, 5)),
    (start_index => 30, end_index => 31, value => to_signed(1, 5)),
    (start_index => 32, end_index => 33, value => to_signed(0, 5)),
    (start_index => 34, end_index => 35, value => to_signed(-1, 5)),
    (start_index => 36, end_index => 36, value => to_signed(-2, 5)),
    (start_index => 37, end_index => 38, value => to_signed(-3, 5)),
    (start_index => 39, end_index => 40, value => to_signed(-4, 5)),
    (start_index => 41, end_index => 41, value => to_signed(-5, 5)),
    (start_index => 42, end_index => 42, value => to_signed(-6, 5)),
    (start_index => 43, end_index => 44, value => to_signed(-7, 5)),
    (start_index => 45, end_index => 45, value => to_signed(-8, 5)),
    (start_index => 46, end_index => 46, value => to_signed(-9, 5)),
    (start_index => 47, end_index => 48, value => to_signed(-10, 5)),
    (start_index => 49, end_index => 49, value => to_signed(-11, 5)),
    (start_index => 50, end_index => 51, value => to_signed(-12, 5)),
    (start_index => 52, end_index => 52, value => to_signed(-13, 5)),
    (start_index => 53, end_index => 54, value => to_signed(-14, 5)),
    (start_index => 55, end_index => 56, value => to_signed(-15, 5)),
    (start_index => 57, end_index => 63, value => to_signed(-16, 5))
  );

  -- LUT for Layer 0, Input 0, Output 3
  constant LUT_0_0_3_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 4, value => to_signed(0, 5)),
    (start_index => 5, end_index => 15, value => to_signed(-1, 5)),
    (start_index => 16, end_index => 19, value => to_signed(0, 5)),
    (start_index => 20, end_index => 23, value => to_signed(1, 5)),
    (start_index => 24, end_index => 30, value => to_signed(2, 5)),
    (start_index => 31, end_index => 34, value => to_signed(1, 5)),
    (start_index => 35, end_index => 36, value => to_signed(0, 5)),
    (start_index => 37, end_index => 39, value => to_signed(-1, 5)),
    (start_index => 40, end_index => 42, value => to_signed(-2, 5)),
    (start_index => 43, end_index => 44, value => to_signed(-3, 5)),
    (start_index => 45, end_index => 46, value => to_signed(-4, 5)),
    (start_index => 47, end_index => 48, value => to_signed(-5, 5)),
    (start_index => 49, end_index => 50, value => to_signed(-6, 5)),
    (start_index => 51, end_index => 52, value => to_signed(-7, 5)),
    (start_index => 53, end_index => 55, value => to_signed(-8, 5)),
    (start_index => 56, end_index => 61, value => to_signed(-9, 5)),
    (start_index => 62, end_index => 63, value => to_signed(-10, 5))
  );

  -- LUT for Layer 0, Input 0, Output 4
  constant LUT_0_0_4_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 1, value => to_signed(-2, 5)),
    (start_index => 2, end_index => 4, value => to_signed(-3, 5)),
    (start_index => 5, end_index => 6, value => to_signed(-4, 5)),
    (start_index => 7, end_index => 8, value => to_signed(-5, 5)),
    (start_index => 9, end_index => 10, value => to_signed(-6, 5)),
    (start_index => 11, end_index => 14, value => to_signed(-7, 5)),
    (start_index => 15, end_index => 16, value => to_signed(-8, 5)),
    (start_index => 17, end_index => 20, value => to_signed(-7, 5)),
    (start_index => 21, end_index => 23, value => to_signed(-6, 5)),
    (start_index => 24, end_index => 24, value => to_signed(-5, 5)),
    (start_index => 25, end_index => 26, value => to_signed(-4, 5)),
    (start_index => 27, end_index => 27, value => to_signed(-3, 5)),
    (start_index => 28, end_index => 29, value => to_signed(-2, 5)),
    (start_index => 30, end_index => 30, value => to_signed(-1, 5)),
    (start_index => 31, end_index => 32, value => to_signed(0, 5)),
    (start_index => 33, end_index => 33, value => to_signed(1, 5)),
    (start_index => 34, end_index => 34, value => to_signed(2, 5)),
    (start_index => 35, end_index => 36, value => to_signed(3, 5)),
    (start_index => 37, end_index => 37, value => to_signed(4, 5)),
    (start_index => 38, end_index => 38, value => to_signed(5, 5)),
    (start_index => 39, end_index => 40, value => to_signed(6, 5)),
    (start_index => 41, end_index => 41, value => to_signed(7, 5)),
    (start_index => 42, end_index => 42, value => to_signed(8, 5)),
    (start_index => 43, end_index => 43, value => to_signed(9, 5)),
    (start_index => 44, end_index => 45, value => to_signed(10, 5)),
    (start_index => 46, end_index => 46, value => to_signed(11, 5)),
    (start_index => 47, end_index => 48, value => to_signed(12, 5)),
    (start_index => 49, end_index => 50, value => to_signed(13, 5)),
    (start_index => 51, end_index => 52, value => to_signed(14, 5)),
    (start_index => 53, end_index => 63, value => to_signed(15, 5))
  );

  -- LUT for Layer 0, Input 0, Output 5
  constant LUT_0_0_5_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 11, value => to_signed(0, 5)),
    (start_index => 12, end_index => 27, value => to_signed(-1, 5)),
    (start_index => 28, end_index => 33, value => to_signed(0, 5)),
    (start_index => 34, end_index => 46, value => to_signed(1, 5)),
    (start_index => 47, end_index => 58, value => to_signed(2, 5)),
    (start_index => 59, end_index => 63, value => to_signed(1, 5))
  );

  -- LUT for Layer 0, Input 0, Output 6
  constant LUT_0_0_6_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 20, value => to_signed(0, 5)),
    (start_index => 21, end_index => 23, value => to_signed(1, 5)),
    (start_index => 24, end_index => 51, value => to_signed(0, 5)),
    (start_index => 52, end_index => 56, value => to_signed(-1, 5)),
    (start_index => 57, end_index => 63, value => to_signed(0, 5))
  );

  -- LUT for Layer 0, Input 0, Output 7
  constant LUT_0_0_7_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 7, value => to_signed(-1, 5)),
    (start_index => 8, end_index => 10, value => to_signed(0, 5)),
    (start_index => 11, end_index => 15, value => to_signed(1, 5)),
    (start_index => 16, end_index => 19, value => to_signed(2, 5)),
    (start_index => 20, end_index => 26, value => to_signed(1, 5)),
    (start_index => 27, end_index => 32, value => to_signed(0, 5)),
    (start_index => 33, end_index => 37, value => to_signed(-1, 5)),
    (start_index => 38, end_index => 42, value => to_signed(-2, 5)),
    (start_index => 43, end_index => 51, value => to_signed(-3, 5)),
    (start_index => 52, end_index => 57, value => to_signed(-4, 5)),
    (start_index => 58, end_index => 61, value => to_signed(-5, 5)),
    (start_index => 62, end_index => 63, value => to_signed(-6, 5))
  );

  -- LUT for Layer 0, Input 1, Output 0
  constant LUT_0_1_0_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 8, value => to_signed(-2, 5)),
    (start_index => 9, end_index => 31, value => to_signed(-1, 5)),
    (start_index => 32, end_index => 35, value => to_signed(0, 5)),
    (start_index => 36, end_index => 38, value => to_signed(1, 5)),
    (start_index => 39, end_index => 41, value => to_signed(2, 5)),
    (start_index => 42, end_index => 43, value => to_signed(3, 5)),
    (start_index => 44, end_index => 46, value => to_signed(4, 5)),
    (start_index => 47, end_index => 49, value => to_signed(5, 5)),
    (start_index => 50, end_index => 53, value => to_signed(6, 5)),
    (start_index => 54, end_index => 56, value => to_signed(7, 5)),
    (start_index => 57, end_index => 60, value => to_signed(8, 5)),
    (start_index => 61, end_index => 62, value => to_signed(9, 5)),
    (start_index => 63, end_index => 63, value => to_signed(10, 5))
  );

  -- LUT for Layer 0, Input 1, Output 1
  constant LUT_0_1_1_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 4, value => to_signed(-5, 5)),
    (start_index => 5, end_index => 10, value => to_signed(-4, 5)),
    (start_index => 11, end_index => 21, value => to_signed(-3, 5)),
    (start_index => 22, end_index => 26, value => to_signed(-2, 5)),
    (start_index => 27, end_index => 30, value => to_signed(-1, 5)),
    (start_index => 31, end_index => 33, value => to_signed(0, 5)),
    (start_index => 34, end_index => 35, value => to_signed(1, 5)),
    (start_index => 36, end_index => 37, value => to_signed(2, 5)),
    (start_index => 38, end_index => 39, value => to_signed(3, 5)),
    (start_index => 40, end_index => 40, value => to_signed(4, 5)),
    (start_index => 41, end_index => 42, value => to_signed(5, 5)),
    (start_index => 43, end_index => 43, value => to_signed(6, 5)),
    (start_index => 44, end_index => 45, value => to_signed(7, 5)),
    (start_index => 46, end_index => 47, value => to_signed(8, 5)),
    (start_index => 48, end_index => 50, value => to_signed(9, 5)),
    (start_index => 51, end_index => 53, value => to_signed(10, 5)),
    (start_index => 54, end_index => 56, value => to_signed(11, 5)),
    (start_index => 57, end_index => 58, value => to_signed(12, 5)),
    (start_index => 59, end_index => 60, value => to_signed(13, 5)),
    (start_index => 61, end_index => 61, value => to_signed(14, 5)),
    (start_index => 62, end_index => 63, value => to_signed(15, 5))
  );

  -- LUT for Layer 0, Input 1, Output 2
  constant LUT_0_1_2_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 25, value => to_signed(1, 5)),
    (start_index => 26, end_index => 34, value => to_signed(0, 5)),
    (start_index => 35, end_index => 39, value => to_signed(-1, 5)),
    (start_index => 40, end_index => 45, value => to_signed(0, 5)),
    (start_index => 46, end_index => 52, value => to_signed(-1, 5)),
    (start_index => 53, end_index => 56, value => to_signed(-2, 5)),
    (start_index => 57, end_index => 63, value => to_signed(-3, 5))
  );

  -- LUT for Layer 0, Input 1, Output 3
  constant LUT_0_1_3_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 46, value => to_signed(0, 5)),
    (start_index => 47, end_index => 56, value => to_signed(-1, 5)),
    (start_index => 57, end_index => 63, value => to_signed(0, 5))
  );

  -- LUT for Layer 0, Input 1, Output 4
  constant LUT_0_1_4_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 5, value => to_signed(-5, 5)),
    (start_index => 6, end_index => 10, value => to_signed(-4, 5)),
    (start_index => 11, end_index => 16, value => to_signed(-3, 5)),
    (start_index => 17, end_index => 21, value => to_signed(-2, 5)),
    (start_index => 22, end_index => 25, value => to_signed(-1, 5)),
    (start_index => 26, end_index => 29, value => to_signed(0, 5)),
    (start_index => 30, end_index => 33, value => to_signed(1, 5)),
    (start_index => 34, end_index => 35, value => to_signed(2, 5)),
    (start_index => 36, end_index => 39, value => to_signed(3, 5)),
    (start_index => 40, end_index => 53, value => to_signed(4, 5)),
    (start_index => 54, end_index => 55, value => to_signed(5, 5)),
    (start_index => 56, end_index => 57, value => to_signed(6, 5)),
    (start_index => 58, end_index => 59, value => to_signed(7, 5)),
    (start_index => 60, end_index => 61, value => to_signed(8, 5)),
    (start_index => 62, end_index => 63, value => to_signed(9, 5))
  );

  -- LUT for Layer 0, Input 1, Output 5
  constant LUT_0_1_5_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 11, value => to_signed(-1, 5)),
    (start_index => 12, end_index => 36, value => to_signed(0, 5)),
    (start_index => 37, end_index => 39, value => to_signed(1, 5)),
    (start_index => 40, end_index => 41, value => to_signed(2, 5)),
    (start_index => 42, end_index => 43, value => to_signed(3, 5)),
    (start_index => 44, end_index => 45, value => to_signed(4, 5)),
    (start_index => 46, end_index => 47, value => to_signed(5, 5)),
    (start_index => 48, end_index => 49, value => to_signed(6, 5)),
    (start_index => 50, end_index => 53, value => to_signed(7, 5)),
    (start_index => 54, end_index => 60, value => to_signed(8, 5)),
    (start_index => 61, end_index => 63, value => to_signed(9, 5))
  );

  -- LUT for Layer 0, Input 1, Output 6
  constant LUT_0_1_6_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 8, value => to_signed(0, 5)),
    (start_index => 9, end_index => 13, value => to_signed(-1, 5)),
    (start_index => 14, end_index => 43, value => to_signed(0, 5)),
    (start_index => 44, end_index => 56, value => to_signed(-1, 5)),
    (start_index => 57, end_index => 63, value => to_signed(0, 5))
  );

  -- LUT for Layer 0, Input 1, Output 7
  constant LUT_0_1_7_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 38, value => to_signed(0, 5)),
    (start_index => 39, end_index => 43, value => to_signed(1, 5)),
    (start_index => 44, end_index => 47, value => to_signed(2, 5)),
    (start_index => 48, end_index => 51, value => to_signed(3, 5)),
    (start_index => 52, end_index => 55, value => to_signed(4, 5)),
    (start_index => 56, end_index => 60, value => to_signed(5, 5)),
    (start_index => 61, end_index => 63, value => to_signed(6, 5))
  );

  -- LUT for Layer 0, Input 2, Output 0
  constant LUT_0_2_0_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 1, value => to_signed(2, 5)),
    (start_index => 2, end_index => 5, value => to_signed(3, 5)),
    (start_index => 6, end_index => 10, value => to_signed(4, 5)),
    (start_index => 11, end_index => 13, value => to_signed(5, 5)),
    (start_index => 14, end_index => 17, value => to_signed(4, 5)),
    (start_index => 18, end_index => 19, value => to_signed(3, 5)),
    (start_index => 20, end_index => 21, value => to_signed(2, 5)),
    (start_index => 22, end_index => 23, value => to_signed(1, 5)),
    (start_index => 24, end_index => 24, value => to_signed(0, 5)),
    (start_index => 25, end_index => 29, value => to_signed(-1, 5)),
    (start_index => 30, end_index => 39, value => to_signed(-2, 5)),
    (start_index => 40, end_index => 43, value => to_signed(-3, 5)),
    (start_index => 44, end_index => 47, value => to_signed(-4, 5)),
    (start_index => 48, end_index => 50, value => to_signed(-5, 5)),
    (start_index => 51, end_index => 52, value => to_signed(-6, 5)),
    (start_index => 53, end_index => 54, value => to_signed(-7, 5)),
    (start_index => 55, end_index => 56, value => to_signed(-8, 5)),
    (start_index => 57, end_index => 58, value => to_signed(-9, 5)),
    (start_index => 59, end_index => 63, value => to_signed(-10, 5))
  );

  -- LUT for Layer 0, Input 2, Output 1
  constant LUT_0_2_1_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 1, value => to_signed(1, 5)),
    (start_index => 2, end_index => 7, value => to_signed(2, 5)),
    (start_index => 8, end_index => 21, value => to_signed(3, 5)),
    (start_index => 22, end_index => 25, value => to_signed(2, 5)),
    (start_index => 26, end_index => 29, value => to_signed(1, 5)),
    (start_index => 30, end_index => 32, value => to_signed(0, 5)),
    (start_index => 33, end_index => 35, value => to_signed(-1, 5)),
    (start_index => 36, end_index => 38, value => to_signed(-2, 5)),
    (start_index => 39, end_index => 41, value => to_signed(-3, 5)),
    (start_index => 42, end_index => 43, value => to_signed(-4, 5)),
    (start_index => 44, end_index => 45, value => to_signed(-5, 5)),
    (start_index => 46, end_index => 46, value => to_signed(-6, 5)),
    (start_index => 47, end_index => 48, value => to_signed(-7, 5)),
    (start_index => 49, end_index => 49, value => to_signed(-8, 5)),
    (start_index => 50, end_index => 51, value => to_signed(-9, 5)),
    (start_index => 52, end_index => 52, value => to_signed(-10, 5)),
    (start_index => 53, end_index => 53, value => to_signed(-11, 5)),
    (start_index => 54, end_index => 55, value => to_signed(-12, 5)),
    (start_index => 56, end_index => 56, value => to_signed(-13, 5)),
    (start_index => 57, end_index => 58, value => to_signed(-14, 5)),
    (start_index => 59, end_index => 60, value => to_signed(-15, 5)),
    (start_index => 61, end_index => 63, value => to_signed(-16, 5))
  );

  -- LUT for Layer 0, Input 2, Output 2
  constant LUT_0_2_2_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 1, value => to_signed(1, 5)),
    (start_index => 2, end_index => 28, value => to_signed(2, 5)),
    (start_index => 29, end_index => 30, value => to_signed(1, 5)),
    (start_index => 31, end_index => 33, value => to_signed(0, 5)),
    (start_index => 34, end_index => 35, value => to_signed(-1, 5)),
    (start_index => 36, end_index => 37, value => to_signed(-2, 5)),
    (start_index => 38, end_index => 39, value => to_signed(-3, 5)),
    (start_index => 40, end_index => 41, value => to_signed(-4, 5)),
    (start_index => 42, end_index => 46, value => to_signed(-5, 5)),
    (start_index => 47, end_index => 54, value => to_signed(-6, 5)),
    (start_index => 55, end_index => 57, value => to_signed(-7, 5)),
    (start_index => 58, end_index => 59, value => to_signed(-8, 5)),
    (start_index => 60, end_index => 62, value => to_signed(-9, 5)),
    (start_index => 63, end_index => 63, value => to_signed(-10, 5))
  );

  -- LUT for Layer 0, Input 2, Output 3
  constant LUT_0_2_3_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 1, value => to_signed(0, 5)),
    (start_index => 2, end_index => 13, value => to_signed(1, 5)),
    (start_index => 14, end_index => 16, value => to_signed(0, 5)),
    (start_index => 17, end_index => 30, value => to_signed(-1, 5)),
    (start_index => 31, end_index => 36, value => to_signed(0, 5)),
    (start_index => 37, end_index => 40, value => to_signed(1, 5)),
    (start_index => 41, end_index => 44, value => to_signed(2, 5)),
    (start_index => 45, end_index => 46, value => to_signed(3, 5)),
    (start_index => 47, end_index => 49, value => to_signed(4, 5)),
    (start_index => 50, end_index => 52, value => to_signed(5, 5)),
    (start_index => 53, end_index => 56, value => to_signed(6, 5)),
    (start_index => 57, end_index => 63, value => to_signed(7, 5))
  );

  -- LUT for Layer 0, Input 2, Output 4
  constant LUT_0_2_4_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 6, value => to_signed(0, 5)),
    (start_index => 7, end_index => 14, value => to_signed(1, 5)),
    (start_index => 15, end_index => 21, value => to_signed(0, 5)),
    (start_index => 22, end_index => 29, value => to_signed(-1, 5)),
    (start_index => 30, end_index => 49, value => to_signed(0, 5)),
    (start_index => 50, end_index => 53, value => to_signed(1, 5)),
    (start_index => 54, end_index => 63, value => to_signed(2, 5))
  );

  -- LUT for Layer 0, Input 2, Output 5
  constant LUT_0_2_5_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 1, value => to_signed(-1, 5)),
    (start_index => 2, end_index => 7, value => to_signed(0, 5)),
    (start_index => 8, end_index => 12, value => to_signed(1, 5)),
    (start_index => 13, end_index => 17, value => to_signed(0, 5)),
    (start_index => 18, end_index => 22, value => to_signed(-1, 5)),
    (start_index => 23, end_index => 27, value => to_signed(-2, 5)),
    (start_index => 28, end_index => 32, value => to_signed(-1, 5)),
    (start_index => 33, end_index => 35, value => to_signed(0, 5)),
    (start_index => 36, end_index => 37, value => to_signed(1, 5)),
    (start_index => 38, end_index => 39, value => to_signed(2, 5)),
    (start_index => 40, end_index => 41, value => to_signed(3, 5)),
    (start_index => 42, end_index => 43, value => to_signed(4, 5)),
    (start_index => 44, end_index => 45, value => to_signed(5, 5)),
    (start_index => 46, end_index => 48, value => to_signed(6, 5)),
    (start_index => 49, end_index => 50, value => to_signed(7, 5)),
    (start_index => 51, end_index => 53, value => to_signed(8, 5)),
    (start_index => 54, end_index => 55, value => to_signed(9, 5)),
    (start_index => 56, end_index => 56, value => to_signed(10, 5)),
    (start_index => 57, end_index => 58, value => to_signed(11, 5)),
    (start_index => 59, end_index => 60, value => to_signed(12, 5)),
    (start_index => 61, end_index => 61, value => to_signed(13, 5)),
    (start_index => 62, end_index => 63, value => to_signed(14, 5))
  );

  -- LUT for Layer 0, Input 2, Output 6
  constant LUT_0_2_6_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 1, value => to_signed(-1, 5)),
    (start_index => 2, end_index => 4, value => to_signed(-2, 5)),
    (start_index => 5, end_index => 6, value => to_signed(-3, 5)),
    (start_index => 7, end_index => 8, value => to_signed(-4, 5)),
    (start_index => 9, end_index => 9, value => to_signed(-5, 5)),
    (start_index => 10, end_index => 12, value => to_signed(-6, 5)),
    (start_index => 13, end_index => 14, value => to_signed(-7, 5)),
    (start_index => 15, end_index => 18, value => to_signed(-6, 5)),
    (start_index => 19, end_index => 20, value => to_signed(-5, 5)),
    (start_index => 21, end_index => 23, value => to_signed(-4, 5)),
    (start_index => 24, end_index => 25, value => to_signed(-3, 5)),
    (start_index => 26, end_index => 28, value => to_signed(-2, 5)),
    (start_index => 29, end_index => 31, value => to_signed(-1, 5)),
    (start_index => 32, end_index => 34, value => to_signed(0, 5)),
    (start_index => 35, end_index => 37, value => to_signed(1, 5)),
    (start_index => 38, end_index => 40, value => to_signed(2, 5)),
    (start_index => 41, end_index => 43, value => to_signed(3, 5)),
    (start_index => 44, end_index => 45, value => to_signed(4, 5)),
    (start_index => 46, end_index => 47, value => to_signed(5, 5)),
    (start_index => 48, end_index => 49, value => to_signed(6, 5)),
    (start_index => 50, end_index => 50, value => to_signed(7, 5)),
    (start_index => 51, end_index => 52, value => to_signed(8, 5)),
    (start_index => 53, end_index => 53, value => to_signed(9, 5)),
    (start_index => 54, end_index => 55, value => to_signed(10, 5)),
    (start_index => 56, end_index => 58, value => to_signed(11, 5)),
    (start_index => 59, end_index => 63, value => to_signed(12, 5))
  );

  -- LUT for Layer 0, Input 2, Output 7
  constant LUT_0_2_7_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 1, value => to_signed(-2, 5)),
    (start_index => 2, end_index => 5, value => to_signed(-3, 5)),
    (start_index => 6, end_index => 20, value => to_signed(-4, 5)),
    (start_index => 21, end_index => 24, value => to_signed(-3, 5)),
    (start_index => 25, end_index => 27, value => to_signed(-2, 5)),
    (start_index => 28, end_index => 29, value => to_signed(-1, 5)),
    (start_index => 30, end_index => 31, value => to_signed(0, 5)),
    (start_index => 32, end_index => 34, value => to_signed(1, 5)),
    (start_index => 35, end_index => 36, value => to_signed(2, 5)),
    (start_index => 37, end_index => 38, value => to_signed(3, 5)),
    (start_index => 39, end_index => 40, value => to_signed(4, 5)),
    (start_index => 41, end_index => 42, value => to_signed(5, 5)),
    (start_index => 43, end_index => 43, value => to_signed(6, 5)),
    (start_index => 44, end_index => 45, value => to_signed(7, 5)),
    (start_index => 46, end_index => 46, value => to_signed(8, 5)),
    (start_index => 47, end_index => 48, value => to_signed(9, 5)),
    (start_index => 49, end_index => 49, value => to_signed(10, 5)),
    (start_index => 50, end_index => 51, value => to_signed(11, 5)),
    (start_index => 52, end_index => 53, value => to_signed(12, 5)),
    (start_index => 54, end_index => 55, value => to_signed(13, 5)),
    (start_index => 56, end_index => 57, value => to_signed(14, 5)),
    (start_index => 58, end_index => 63, value => to_signed(15, 5))
  );

  -- LUT for Layer 0, Input 3, Output 0
  constant LUT_0_3_0_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 0, value => to_signed(0, 5)),
    (start_index => 1, end_index => 6, value => to_signed(1, 5)),
    (start_index => 7, end_index => 14, value => to_signed(2, 5)),
    (start_index => 15, end_index => 18, value => to_signed(1, 5)),
    (start_index => 19, end_index => 19, value => to_signed(0, 5)),
    (start_index => 20, end_index => 21, value => to_signed(-1, 5)),
    (start_index => 22, end_index => 23, value => to_signed(-2, 5)),
    (start_index => 24, end_index => 28, value => to_signed(-3, 5)),
    (start_index => 29, end_index => 30, value => to_signed(-2, 5)),
    (start_index => 31, end_index => 32, value => to_signed(-1, 5)),
    (start_index => 33, end_index => 33, value => to_signed(0, 5)),
    (start_index => 34, end_index => 36, value => to_signed(1, 5)),
    (start_index => 37, end_index => 41, value => to_signed(2, 5)),
    (start_index => 42, end_index => 42, value => to_signed(3, 5)),
    (start_index => 43, end_index => 45, value => to_signed(2, 5)),
    (start_index => 46, end_index => 63, value => to_signed(3, 5))
  );

  -- LUT for Layer 0, Input 3, Output 1
  constant LUT_0_3_1_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 0, value => to_signed(2, 5)),
    (start_index => 1, end_index => 3, value => to_signed(3, 5)),
    (start_index => 4, end_index => 6, value => to_signed(4, 5)),
    (start_index => 7, end_index => 9, value => to_signed(5, 5)),
    (start_index => 10, end_index => 14, value => to_signed(6, 5)),
    (start_index => 15, end_index => 22, value => to_signed(7, 5)),
    (start_index => 23, end_index => 24, value => to_signed(6, 5)),
    (start_index => 25, end_index => 26, value => to_signed(5, 5)),
    (start_index => 27, end_index => 27, value => to_signed(4, 5)),
    (start_index => 28, end_index => 28, value => to_signed(2, 5)),
    (start_index => 29, end_index => 29, value => to_signed(1, 5)),
    (start_index => 30, end_index => 30, value => to_signed(0, 5)),
    (start_index => 31, end_index => 31, value => to_signed(-1, 5)),
    (start_index => 32, end_index => 32, value => to_signed(-2, 5)),
    (start_index => 33, end_index => 33, value => to_signed(-4, 5)),
    (start_index => 34, end_index => 34, value => to_signed(-5, 5)),
    (start_index => 35, end_index => 35, value => to_signed(-6, 5)),
    (start_index => 36, end_index => 37, value => to_signed(-7, 5)),
    (start_index => 38, end_index => 38, value => to_signed(-8, 5)),
    (start_index => 39, end_index => 50, value => to_signed(-9, 5)),
    (start_index => 51, end_index => 53, value => to_signed(-10, 5)),
    (start_index => 54, end_index => 55, value => to_signed(-11, 5)),
    (start_index => 56, end_index => 56, value => to_signed(-12, 5)),
    (start_index => 57, end_index => 58, value => to_signed(-13, 5)),
    (start_index => 59, end_index => 59, value => to_signed(-14, 5)),
    (start_index => 60, end_index => 61, value => to_signed(-15, 5)),
    (start_index => 62, end_index => 63, value => to_signed(-16, 5))
  );

  -- LUT for Layer 0, Input 3, Output 2
  constant LUT_0_3_2_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 1, value => to_signed(0, 5)),
    (start_index => 2, end_index => 8, value => to_signed(1, 5)),
    (start_index => 9, end_index => 14, value => to_signed(0, 5)),
    (start_index => 15, end_index => 27, value => to_signed(1, 5)),
    (start_index => 28, end_index => 36, value => to_signed(0, 5)),
    (start_index => 37, end_index => 39, value => to_signed(-1, 5)),
    (start_index => 40, end_index => 43, value => to_signed(-2, 5)),
    (start_index => 44, end_index => 63, value => to_signed(-3, 5))
  );

  -- LUT for Layer 0, Input 3, Output 3
  constant LUT_0_3_3_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 0, value => to_signed(-1, 5)),
    (start_index => 1, end_index => 10, value => to_signed(0, 5)),
    (start_index => 11, end_index => 14, value => to_signed(-1, 5)),
    (start_index => 15, end_index => 26, value => to_signed(-2, 5)),
    (start_index => 27, end_index => 31, value => to_signed(-1, 5)),
    (start_index => 32, end_index => 33, value => to_signed(0, 5)),
    (start_index => 34, end_index => 35, value => to_signed(1, 5)),
    (start_index => 36, end_index => 36, value => to_signed(2, 5)),
    (start_index => 37, end_index => 38, value => to_signed(3, 5)),
    (start_index => 39, end_index => 39, value => to_signed(4, 5)),
    (start_index => 40, end_index => 41, value => to_signed(5, 5)),
    (start_index => 42, end_index => 42, value => to_signed(6, 5)),
    (start_index => 43, end_index => 45, value => to_signed(7, 5)),
    (start_index => 46, end_index => 50, value => to_signed(8, 5)),
    (start_index => 51, end_index => 53, value => to_signed(9, 5)),
    (start_index => 54, end_index => 55, value => to_signed(10, 5)),
    (start_index => 56, end_index => 57, value => to_signed(11, 5)),
    (start_index => 58, end_index => 59, value => to_signed(12, 5)),
    (start_index => 60, end_index => 60, value => to_signed(13, 5)),
    (start_index => 61, end_index => 62, value => to_signed(14, 5)),
    (start_index => 63, end_index => 63, value => to_signed(15, 5))
  );

  -- LUT for Layer 0, Input 3, Output 4
  constant LUT_0_3_4_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 0, value => to_signed(-1, 5)),
    (start_index => 1, end_index => 12, value => to_signed(0, 5)),
    (start_index => 13, end_index => 18, value => to_signed(-1, 5)),
    (start_index => 19, end_index => 30, value => to_signed(-2, 5)),
    (start_index => 31, end_index => 34, value => to_signed(-1, 5)),
    (start_index => 35, end_index => 36, value => to_signed(0, 5)),
    (start_index => 37, end_index => 37, value => to_signed(1, 5)),
    (start_index => 38, end_index => 39, value => to_signed(2, 5)),
    (start_index => 40, end_index => 40, value => to_signed(3, 5)),
    (start_index => 41, end_index => 41, value => to_signed(4, 5)),
    (start_index => 42, end_index => 42, value => to_signed(5, 5)),
    (start_index => 43, end_index => 43, value => to_signed(6, 5)),
    (start_index => 44, end_index => 44, value => to_signed(7, 5)),
    (start_index => 45, end_index => 45, value => to_signed(8, 5)),
    (start_index => 46, end_index => 47, value => to_signed(9, 5)),
    (start_index => 48, end_index => 50, value => to_signed(10, 5)),
    (start_index => 51, end_index => 53, value => to_signed(11, 5)),
    (start_index => 54, end_index => 56, value => to_signed(12, 5)),
    (start_index => 57, end_index => 59, value => to_signed(13, 5)),
    (start_index => 60, end_index => 62, value => to_signed(14, 5)),
    (start_index => 63, end_index => 63, value => to_signed(15, 5))
  );

  -- LUT for Layer 0, Input 3, Output 5
  constant LUT_0_3_5_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 0, value => to_signed(4, 5)),
    (start_index => 1, end_index => 2, value => to_signed(5, 5)),
    (start_index => 3, end_index => 3, value => to_signed(6, 5)),
    (start_index => 4, end_index => 4, value => to_signed(7, 5)),
    (start_index => 5, end_index => 5, value => to_signed(8, 5)),
    (start_index => 6, end_index => 7, value => to_signed(9, 5)),
    (start_index => 8, end_index => 9, value => to_signed(10, 5)),
    (start_index => 10, end_index => 16, value => to_signed(11, 5)),
    (start_index => 17, end_index => 19, value => to_signed(10, 5)),
    (start_index => 20, end_index => 21, value => to_signed(9, 5)),
    (start_index => 22, end_index => 22, value => to_signed(8, 5)),
    (start_index => 23, end_index => 24, value => to_signed(7, 5)),
    (start_index => 25, end_index => 25, value => to_signed(6, 5)),
    (start_index => 26, end_index => 26, value => to_signed(4, 5)),
    (start_index => 27, end_index => 27, value => to_signed(3, 5)),
    (start_index => 28, end_index => 28, value => to_signed(2, 5)),
    (start_index => 29, end_index => 29, value => to_signed(0, 5)),
    (start_index => 30, end_index => 30, value => to_signed(-2, 5)),
    (start_index => 31, end_index => 31, value => to_signed(-3, 5)),
    (start_index => 32, end_index => 32, value => to_signed(-4, 5)),
    (start_index => 33, end_index => 33, value => to_signed(-6, 5)),
    (start_index => 34, end_index => 34, value => to_signed(-7, 5)),
    (start_index => 35, end_index => 35, value => to_signed(-8, 5)),
    (start_index => 36, end_index => 37, value => to_signed(-9, 5)),
    (start_index => 38, end_index => 38, value => to_signed(-10, 5)),
    (start_index => 39, end_index => 39, value => to_signed(-11, 5)),
    (start_index => 40, end_index => 40, value => to_signed(-12, 5)),
    (start_index => 41, end_index => 41, value => to_signed(-13, 5)),
    (start_index => 42, end_index => 43, value => to_signed(-14, 5)),
    (start_index => 44, end_index => 44, value => to_signed(-15, 5)),
    (start_index => 45, end_index => 63, value => to_signed(-16, 5))
  );

  -- LUT for Layer 0, Input 3, Output 6
  constant LUT_0_3_6_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 0, value => to_signed(-2, 5)),
    (start_index => 1, end_index => 2, value => to_signed(-3, 5)),
    (start_index => 3, end_index => 3, value => to_signed(-4, 5)),
    (start_index => 4, end_index => 4, value => to_signed(-5, 5)),
    (start_index => 5, end_index => 5, value => to_signed(-6, 5)),
    (start_index => 6, end_index => 6, value => to_signed(-7, 5)),
    (start_index => 7, end_index => 7, value => to_signed(-8, 5)),
    (start_index => 8, end_index => 8, value => to_signed(-9, 5)),
    (start_index => 9, end_index => 9, value => to_signed(-11, 5)),
    (start_index => 10, end_index => 10, value => to_signed(-12, 5)),
    (start_index => 11, end_index => 11, value => to_signed(-13, 5)),
    (start_index => 12, end_index => 12, value => to_signed(-14, 5)),
    (start_index => 13, end_index => 13, value => to_signed(-15, 5)),
    (start_index => 14, end_index => 20, value => to_signed(-16, 5)),
    (start_index => 21, end_index => 21, value => to_signed(-15, 5)),
    (start_index => 22, end_index => 22, value => to_signed(-14, 5)),
    (start_index => 23, end_index => 23, value => to_signed(-13, 5)),
    (start_index => 24, end_index => 24, value => to_signed(-12, 5)),
    (start_index => 25, end_index => 25, value => to_signed(-10, 5)),
    (start_index => 26, end_index => 26, value => to_signed(-8, 5)),
    (start_index => 27, end_index => 27, value => to_signed(-6, 5)),
    (start_index => 28, end_index => 28, value => to_signed(-4, 5)),
    (start_index => 29, end_index => 29, value => to_signed(-3, 5)),
    (start_index => 30, end_index => 30, value => to_signed(-1, 5)),
    (start_index => 31, end_index => 31, value => to_signed(1, 5)),
    (start_index => 32, end_index => 32, value => to_signed(3, 5)),
    (start_index => 33, end_index => 33, value => to_signed(4, 5)),
    (start_index => 34, end_index => 34, value => to_signed(5, 5)),
    (start_index => 35, end_index => 35, value => to_signed(7, 5)),
    (start_index => 36, end_index => 36, value => to_signed(8, 5)),
    (start_index => 37, end_index => 38, value => to_signed(9, 5)),
    (start_index => 39, end_index => 39, value => to_signed(10, 5)),
    (start_index => 40, end_index => 40, value => to_signed(11, 5)),
    (start_index => 41, end_index => 42, value => to_signed(12, 5)),
    (start_index => 43, end_index => 43, value => to_signed(13, 5)),
    (start_index => 44, end_index => 45, value => to_signed(14, 5)),
    (start_index => 46, end_index => 63, value => to_signed(15, 5))
  );

  -- LUT for Layer 0, Input 3, Output 7
  constant LUT_0_3_7_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 1, value => to_signed(0, 5)),
    (start_index => 2, end_index => 4, value => to_signed(-1, 5)),
    (start_index => 5, end_index => 8, value => to_signed(-2, 5)),
    (start_index => 9, end_index => 13, value => to_signed(-3, 5)),
    (start_index => 14, end_index => 16, value => to_signed(-4, 5)),
    (start_index => 17, end_index => 19, value => to_signed(-3, 5)),
    (start_index => 20, end_index => 20, value => to_signed(-2, 5)),
    (start_index => 21, end_index => 21, value => to_signed(-1, 5)),
    (start_index => 22, end_index => 22, value => to_signed(0, 5)),
    (start_index => 23, end_index => 24, value => to_signed(1, 5)),
    (start_index => 25, end_index => 25, value => to_signed(2, 5)),
    (start_index => 26, end_index => 32, value => to_signed(3, 5)),
    (start_index => 33, end_index => 34, value => to_signed(2, 5)),
    (start_index => 35, end_index => 36, value => to_signed(1, 5)),
    (start_index => 37, end_index => 37, value => to_signed(0, 5)),
    (start_index => 38, end_index => 39, value => to_signed(-1, 5)),
    (start_index => 40, end_index => 42, value => to_signed(-2, 5)),
    (start_index => 43, end_index => 48, value => to_signed(-3, 5)),
    (start_index => 49, end_index => 53, value => to_signed(-4, 5)),
    (start_index => 54, end_index => 56, value => to_signed(-5, 5)),
    (start_index => 57, end_index => 58, value => to_signed(-6, 5)),
    (start_index => 59, end_index => 60, value => to_signed(-7, 5)),
    (start_index => 61, end_index => 62, value => to_signed(-8, 5)),
    (start_index => 63, end_index => 63, value => to_signed(-9, 5))
  );

  -- LUT for Layer 0, Input 4, Output 0
  constant LUT_0_4_0_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 3, value => to_signed(1, 5)),
    (start_index => 4, end_index => 6, value => to_signed(2, 5)),
    (start_index => 7, end_index => 8, value => to_signed(3, 5)),
    (start_index => 9, end_index => 10, value => to_signed(4, 5)),
    (start_index => 11, end_index => 12, value => to_signed(5, 5)),
    (start_index => 13, end_index => 16, value => to_signed(6, 5)),
    (start_index => 17, end_index => 18, value => to_signed(5, 5)),
    (start_index => 19, end_index => 19, value => to_signed(4, 5)),
    (start_index => 20, end_index => 21, value => to_signed(3, 5)),
    (start_index => 22, end_index => 22, value => to_signed(2, 5)),
    (start_index => 23, end_index => 23, value => to_signed(1, 5)),
    (start_index => 24, end_index => 24, value => to_signed(0, 5)),
    (start_index => 25, end_index => 25, value => to_signed(-1, 5)),
    (start_index => 26, end_index => 28, value => to_signed(-2, 5)),
    (start_index => 29, end_index => 41, value => to_signed(-3, 5)),
    (start_index => 42, end_index => 49, value => to_signed(-4, 5)),
    (start_index => 50, end_index => 53, value => to_signed(-5, 5)),
    (start_index => 54, end_index => 57, value => to_signed(-6, 5)),
    (start_index => 58, end_index => 63, value => to_signed(-7, 5))
  );

  -- LUT for Layer 0, Input 4, Output 1
  constant LUT_0_4_1_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 4, value => to_signed(-1, 5)),
    (start_index => 5, end_index => 10, value => to_signed(0, 5)),
    (start_index => 11, end_index => 18, value => to_signed(1, 5)),
    (start_index => 19, end_index => 25, value => to_signed(0, 5)),
    (start_index => 26, end_index => 36, value => to_signed(-1, 5)),
    (start_index => 37, end_index => 38, value => to_signed(0, 5)),
    (start_index => 39, end_index => 40, value => to_signed(1, 5)),
    (start_index => 41, end_index => 42, value => to_signed(2, 5)),
    (start_index => 43, end_index => 43, value => to_signed(3, 5)),
    (start_index => 44, end_index => 45, value => to_signed(4, 5)),
    (start_index => 46, end_index => 48, value => to_signed(5, 5)),
    (start_index => 49, end_index => 63, value => to_signed(6, 5))
  );

  -- LUT for Layer 0, Input 4, Output 2
  constant LUT_0_4_2_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 6, value => to_signed(1, 5)),
    (start_index => 7, end_index => 10, value => to_signed(2, 5)),
    (start_index => 11, end_index => 21, value => to_signed(3, 5)),
    (start_index => 22, end_index => 24, value => to_signed(2, 5)),
    (start_index => 25, end_index => 28, value => to_signed(1, 5)),
    (start_index => 29, end_index => 32, value => to_signed(0, 5)),
    (start_index => 33, end_index => 34, value => to_signed(-1, 5)),
    (start_index => 35, end_index => 37, value => to_signed(-2, 5)),
    (start_index => 38, end_index => 39, value => to_signed(-3, 5)),
    (start_index => 40, end_index => 42, value => to_signed(-4, 5)),
    (start_index => 43, end_index => 46, value => to_signed(-5, 5)),
    (start_index => 47, end_index => 50, value => to_signed(-6, 5)),
    (start_index => 51, end_index => 53, value => to_signed(-7, 5)),
    (start_index => 54, end_index => 56, value => to_signed(-8, 5)),
    (start_index => 57, end_index => 58, value => to_signed(-9, 5)),
    (start_index => 59, end_index => 60, value => to_signed(-10, 5)),
    (start_index => 61, end_index => 62, value => to_signed(-11, 5)),
    (start_index => 63, end_index => 63, value => to_signed(-12, 5))
  );

  -- LUT for Layer 0, Input 4, Output 3
  constant LUT_0_4_3_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 3, value => to_signed(1, 5)),
    (start_index => 4, end_index => 8, value => to_signed(2, 5)),
    (start_index => 9, end_index => 22, value => to_signed(3, 5)),
    (start_index => 23, end_index => 27, value => to_signed(2, 5)),
    (start_index => 28, end_index => 31, value => to_signed(1, 5)),
    (start_index => 32, end_index => 34, value => to_signed(0, 5)),
    (start_index => 35, end_index => 35, value => to_signed(-1, 5)),
    (start_index => 36, end_index => 37, value => to_signed(-2, 5)),
    (start_index => 38, end_index => 39, value => to_signed(-3, 5)),
    (start_index => 40, end_index => 40, value => to_signed(-4, 5)),
    (start_index => 41, end_index => 42, value => to_signed(-5, 5)),
    (start_index => 43, end_index => 43, value => to_signed(-6, 5)),
    (start_index => 44, end_index => 45, value => to_signed(-7, 5)),
    (start_index => 46, end_index => 46, value => to_signed(-8, 5)),
    (start_index => 47, end_index => 48, value => to_signed(-9, 5)),
    (start_index => 49, end_index => 52, value => to_signed(-10, 5)),
    (start_index => 53, end_index => 60, value => to_signed(-11, 5)),
    (start_index => 61, end_index => 63, value => to_signed(-12, 5))
  );

  -- LUT for Layer 0, Input 4, Output 4
  constant LUT_0_4_4_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 12, value => to_signed(0, 5)),
    (start_index => 13, end_index => 18, value => to_signed(1, 5)),
    (start_index => 19, end_index => 48, value => to_signed(0, 5)),
    (start_index => 49, end_index => 55, value => to_signed(1, 5)),
    (start_index => 56, end_index => 61, value => to_signed(2, 5)),
    (start_index => 62, end_index => 63, value => to_signed(3, 5))
  );

  -- LUT for Layer 0, Input 4, Output 5
  constant LUT_0_4_5_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 7, value => to_signed(-1, 5)),
    (start_index => 8, end_index => 13, value => to_signed(0, 5)),
    (start_index => 14, end_index => 17, value => to_signed(-1, 5)),
    (start_index => 18, end_index => 22, value => to_signed(-2, 5)),
    (start_index => 23, end_index => 29, value => to_signed(-1, 5)),
    (start_index => 30, end_index => 35, value => to_signed(0, 5)),
    (start_index => 36, end_index => 37, value => to_signed(1, 5)),
    (start_index => 38, end_index => 40, value => to_signed(2, 5)),
    (start_index => 41, end_index => 42, value => to_signed(3, 5)),
    (start_index => 43, end_index => 44, value => to_signed(4, 5)),
    (start_index => 45, end_index => 46, value => to_signed(5, 5)),
    (start_index => 47, end_index => 49, value => to_signed(6, 5)),
    (start_index => 50, end_index => 53, value => to_signed(7, 5)),
    (start_index => 54, end_index => 56, value => to_signed(8, 5)),
    (start_index => 57, end_index => 59, value => to_signed(9, 5)),
    (start_index => 60, end_index => 61, value => to_signed(10, 5)),
    (start_index => 62, end_index => 63, value => to_signed(11, 5))
  );

  -- LUT for Layer 0, Input 4, Output 6
  constant LUT_0_4_6_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 1, value => to_signed(0, 5)),
    (start_index => 2, end_index => 6, value => to_signed(-1, 5)),
    (start_index => 7, end_index => 9, value => to_signed(-2, 5)),
    (start_index => 10, end_index => 12, value => to_signed(-3, 5)),
    (start_index => 13, end_index => 16, value => to_signed(-4, 5)),
    (start_index => 17, end_index => 20, value => to_signed(-3, 5)),
    (start_index => 21, end_index => 23, value => to_signed(-2, 5)),
    (start_index => 24, end_index => 26, value => to_signed(-1, 5)),
    (start_index => 27, end_index => 29, value => to_signed(0, 5)),
    (start_index => 30, end_index => 34, value => to_signed(1, 5)),
    (start_index => 35, end_index => 37, value => to_signed(2, 5)),
    (start_index => 38, end_index => 47, value => to_signed(1, 5)),
    (start_index => 48, end_index => 52, value => to_signed(2, 5)),
    (start_index => 53, end_index => 56, value => to_signed(3, 5)),
    (start_index => 57, end_index => 59, value => to_signed(4, 5)),
    (start_index => 60, end_index => 62, value => to_signed(5, 5)),
    (start_index => 63, end_index => 63, value => to_signed(6, 5))
  );

  -- LUT for Layer 0, Input 4, Output 7
  constant LUT_0_4_7_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 8, value => to_signed(-1, 5)),
    (start_index => 9, end_index => 16, value => to_signed(-2, 5)),
    (start_index => 17, end_index => 22, value => to_signed(-1, 5)),
    (start_index => 23, end_index => 33, value => to_signed(0, 5)),
    (start_index => 34, end_index => 39, value => to_signed(1, 5)),
    (start_index => 40, end_index => 46, value => to_signed(2, 5)),
    (start_index => 47, end_index => 49, value => to_signed(3, 5)),
    (start_index => 50, end_index => 51, value => to_signed(4, 5)),
    (start_index => 52, end_index => 54, value => to_signed(5, 5)),
    (start_index => 55, end_index => 56, value => to_signed(6, 5)),
    (start_index => 57, end_index => 58, value => to_signed(7, 5)),
    (start_index => 59, end_index => 63, value => to_signed(8, 5))
  );

  -- LUT for Layer 0, Input 5, Output 0
  constant LUT_0_5_0_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 2, value => to_signed(0, 5)),
    (start_index => 3, end_index => 7, value => to_signed(1, 5)),
    (start_index => 8, end_index => 15, value => to_signed(2, 5)),
    (start_index => 16, end_index => 19, value => to_signed(1, 5)),
    (start_index => 20, end_index => 23, value => to_signed(0, 5)),
    (start_index => 24, end_index => 33, value => to_signed(-1, 5)),
    (start_index => 34, end_index => 41, value => to_signed(0, 5)),
    (start_index => 42, end_index => 44, value => to_signed(1, 5)),
    (start_index => 45, end_index => 55, value => to_signed(0, 5)),
    (start_index => 56, end_index => 59, value => to_signed(-1, 5)),
    (start_index => 60, end_index => 63, value => to_signed(0, 5))
  );

  -- LUT for Layer 0, Input 5, Output 1
  constant LUT_0_5_1_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 5, value => to_signed(0, 5)),
    (start_index => 6, end_index => 8, value => to_signed(-1, 5)),
    (start_index => 9, end_index => 10, value => to_signed(-2, 5)),
    (start_index => 11, end_index => 17, value => to_signed(-3, 5)),
    (start_index => 18, end_index => 19, value => to_signed(-2, 5)),
    (start_index => 20, end_index => 21, value => to_signed(-1, 5)),
    (start_index => 22, end_index => 24, value => to_signed(0, 5)),
    (start_index => 25, end_index => 37, value => to_signed(1, 5)),
    (start_index => 38, end_index => 41, value => to_signed(2, 5)),
    (start_index => 42, end_index => 43, value => to_signed(3, 5)),
    (start_index => 44, end_index => 46, value => to_signed(4, 5)),
    (start_index => 47, end_index => 51, value => to_signed(5, 5)),
    (start_index => 52, end_index => 57, value => to_signed(6, 5)),
    (start_index => 58, end_index => 62, value => to_signed(7, 5)),
    (start_index => 63, end_index => 63, value => to_signed(8, 5))
  );

  -- LUT for Layer 0, Input 5, Output 2
  constant LUT_0_5_2_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 6, value => to_signed(0, 5)),
    (start_index => 7, end_index => 10, value => to_signed(1, 5)),
    (start_index => 11, end_index => 15, value => to_signed(2, 5)),
    (start_index => 16, end_index => 20, value => to_signed(1, 5)),
    (start_index => 21, end_index => 45, value => to_signed(0, 5)),
    (start_index => 46, end_index => 55, value => to_signed(1, 5)),
    (start_index => 56, end_index => 61, value => to_signed(2, 5)),
    (start_index => 62, end_index => 63, value => to_signed(3, 5))
  );

  -- LUT for Layer 0, Input 5, Output 3
  constant LUT_0_5_3_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 10, value => to_signed(0, 5)),
    (start_index => 11, end_index => 16, value => to_signed(-1, 5)),
    (start_index => 17, end_index => 24, value => to_signed(0, 5)),
    (start_index => 25, end_index => 63, value => to_signed(1, 5))
  );

  -- LUT for Layer 0, Input 5, Output 4
  constant LUT_0_5_4_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 8, value => to_signed(-1, 5)),
    (start_index => 9, end_index => 12, value => to_signed(-2, 5)),
    (start_index => 13, end_index => 20, value => to_signed(-3, 5)),
    (start_index => 21, end_index => 23, value => to_signed(-2, 5)),
    (start_index => 24, end_index => 25, value => to_signed(-1, 5)),
    (start_index => 26, end_index => 28, value => to_signed(0, 5)),
    (start_index => 29, end_index => 30, value => to_signed(1, 5)),
    (start_index => 31, end_index => 33, value => to_signed(2, 5)),
    (start_index => 34, end_index => 36, value => to_signed(3, 5)),
    (start_index => 37, end_index => 38, value => to_signed(4, 5)),
    (start_index => 39, end_index => 40, value => to_signed(5, 5)),
    (start_index => 41, end_index => 42, value => to_signed(6, 5)),
    (start_index => 43, end_index => 44, value => to_signed(7, 5)),
    (start_index => 45, end_index => 46, value => to_signed(8, 5)),
    (start_index => 47, end_index => 47, value => to_signed(9, 5)),
    (start_index => 48, end_index => 49, value => to_signed(10, 5)),
    (start_index => 50, end_index => 51, value => to_signed(11, 5)),
    (start_index => 52, end_index => 53, value => to_signed(12, 5)),
    (start_index => 54, end_index => 55, value => to_signed(13, 5)),
    (start_index => 56, end_index => 56, value => to_signed(14, 5)),
    (start_index => 57, end_index => 63, value => to_signed(15, 5))
  );

  -- LUT for Layer 0, Input 5, Output 5
  constant LUT_0_5_5_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 1, value => to_signed(-1, 5)),
    (start_index => 2, end_index => 3, value => to_signed(-2, 5)),
    (start_index => 4, end_index => 4, value => to_signed(-3, 5)),
    (start_index => 5, end_index => 5, value => to_signed(-4, 5)),
    (start_index => 6, end_index => 6, value => to_signed(-6, 5)),
    (start_index => 7, end_index => 7, value => to_signed(-7, 5)),
    (start_index => 8, end_index => 8, value => to_signed(-9, 5)),
    (start_index => 9, end_index => 9, value => to_signed(-10, 5)),
    (start_index => 10, end_index => 10, value => to_signed(-11, 5)),
    (start_index => 11, end_index => 11, value => to_signed(-12, 5)),
    (start_index => 12, end_index => 12, value => to_signed(-13, 5)),
    (start_index => 13, end_index => 14, value => to_signed(-12, 5)),
    (start_index => 15, end_index => 15, value => to_signed(-10, 5)),
    (start_index => 16, end_index => 16, value => to_signed(-9, 5)),
    (start_index => 17, end_index => 17, value => to_signed(-7, 5)),
    (start_index => 18, end_index => 18, value => to_signed(-5, 5)),
    (start_index => 19, end_index => 19, value => to_signed(-3, 5)),
    (start_index => 20, end_index => 20, value => to_signed(-2, 5)),
    (start_index => 21, end_index => 21, value => to_signed(0, 5)),
    (start_index => 22, end_index => 22, value => to_signed(1, 5)),
    (start_index => 23, end_index => 23, value => to_signed(2, 5)),
    (start_index => 24, end_index => 25, value => to_signed(3, 5)),
    (start_index => 26, end_index => 28, value => to_signed(4, 5)),
    (start_index => 29, end_index => 31, value => to_signed(3, 5)),
    (start_index => 32, end_index => 37, value => to_signed(2, 5)),
    (start_index => 38, end_index => 44, value => to_signed(1, 5)),
    (start_index => 45, end_index => 49, value => to_signed(0, 5)),
    (start_index => 50, end_index => 55, value => to_signed(-1, 5)),
    (start_index => 56, end_index => 63, value => to_signed(-2, 5))
  );

  -- LUT for Layer 0, Input 5, Output 6
  constant LUT_0_5_6_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 15, value => to_signed(0, 5)),
    (start_index => 16, end_index => 28, value => to_signed(-1, 5)),
    (start_index => 29, end_index => 32, value => to_signed(0, 5)),
    (start_index => 33, end_index => 37, value => to_signed(1, 5)),
    (start_index => 38, end_index => 41, value => to_signed(2, 5)),
    (start_index => 42, end_index => 46, value => to_signed(3, 5)),
    (start_index => 47, end_index => 51, value => to_signed(4, 5)),
    (start_index => 52, end_index => 56, value => to_signed(5, 5)),
    (start_index => 57, end_index => 60, value => to_signed(6, 5)),
    (start_index => 61, end_index => 63, value => to_signed(7, 5))
  );

  -- LUT for Layer 0, Input 5, Output 7
  constant LUT_0_5_7_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 7, value => to_signed(-1, 5)),
    (start_index => 8, end_index => 18, value => to_signed(0, 5)),
    (start_index => 19, end_index => 23, value => to_signed(-1, 5)),
    (start_index => 24, end_index => 27, value => to_signed(-2, 5)),
    (start_index => 28, end_index => 32, value => to_signed(-1, 5)),
    (start_index => 33, end_index => 35, value => to_signed(0, 5)),
    (start_index => 36, end_index => 38, value => to_signed(1, 5)),
    (start_index => 39, end_index => 41, value => to_signed(2, 5)),
    (start_index => 42, end_index => 44, value => to_signed(3, 5)),
    (start_index => 45, end_index => 47, value => to_signed(4, 5)),
    (start_index => 48, end_index => 50, value => to_signed(5, 5)),
    (start_index => 51, end_index => 52, value => to_signed(6, 5)),
    (start_index => 53, end_index => 55, value => to_signed(7, 5)),
    (start_index => 56, end_index => 58, value => to_signed(8, 5)),
    (start_index => 59, end_index => 63, value => to_signed(9, 5))
  );

  -- LUT for Layer 0, Input 6, Output 0
  constant LUT_0_6_0_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 39, value => to_signed(0, 5)),
    (start_index => 40, end_index => 43, value => to_signed(-1, 5)),
    (start_index => 44, end_index => 63, value => to_signed(0, 5))
  );

  -- LUT for Layer 0, Input 6, Output 1
  constant LUT_0_6_1_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 48, value => to_signed(0, 5)),
    (start_index => 49, end_index => 63, value => to_signed(-1, 5))
  );

  -- LUT for Layer 0, Input 6, Output 2
  constant LUT_0_6_2_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 13, value => to_signed(-1, 5)),
    (start_index => 14, end_index => 36, value => to_signed(0, 5)),
    (start_index => 37, end_index => 50, value => to_signed(1, 5)),
    (start_index => 51, end_index => 60, value => to_signed(2, 5)),
    (start_index => 61, end_index => 63, value => to_signed(3, 5))
  );

  -- LUT for Layer 0, Input 6, Output 3
  constant LUT_0_6_3_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 5, value => to_signed(0, 5)),
    (start_index => 6, end_index => 19, value => to_signed(1, 5)),
    (start_index => 20, end_index => 45, value => to_signed(0, 5)),
    (start_index => 46, end_index => 63, value => to_signed(-1, 5))
  );

  -- LUT for Layer 0, Input 6, Output 4
  constant LUT_0_6_4_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 29, value => to_signed(1, 5)),
    (start_index => 30, end_index => 35, value => to_signed(0, 5)),
    (start_index => 36, end_index => 39, value => to_signed(-1, 5)),
    (start_index => 40, end_index => 44, value => to_signed(-2, 5)),
    (start_index => 45, end_index => 51, value => to_signed(-3, 5)),
    (start_index => 52, end_index => 56, value => to_signed(-4, 5)),
    (start_index => 57, end_index => 59, value => to_signed(-5, 5)),
    (start_index => 60, end_index => 62, value => to_signed(-6, 5)),
    (start_index => 63, end_index => 63, value => to_signed(-7, 5))
  );

  -- LUT for Layer 0, Input 6, Output 5
  constant LUT_0_6_5_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 21, value => to_signed(1, 5)),
    (start_index => 22, end_index => 35, value => to_signed(0, 5)),
    (start_index => 36, end_index => 46, value => to_signed(-1, 5)),
    (start_index => 47, end_index => 58, value => to_signed(-2, 5)),
    (start_index => 59, end_index => 63, value => to_signed(-3, 5))
  );

  -- LUT for Layer 0, Input 6, Output 6
  constant LUT_0_6_6_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 54, value => to_signed(0, 5)),
    (start_index => 55, end_index => 63, value => to_signed(1, 5))
  );

  -- LUT for Layer 0, Input 6, Output 7
  constant LUT_0_6_7_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 10, value => to_signed(0, 5)),
    (start_index => 11, end_index => 16, value => to_signed(1, 5)),
    (start_index => 17, end_index => 38, value => to_signed(0, 5)),
    (start_index => 39, end_index => 49, value => to_signed(-1, 5)),
    (start_index => 50, end_index => 58, value => to_signed(-2, 5)),
    (start_index => 59, end_index => 63, value => to_signed(-3, 5))
  );

  -- LUT for Layer 0, Input 7, Output 0
  constant LUT_0_7_0_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 2, value => to_signed(-1, 5)),
    (start_index => 3, end_index => 5, value => to_signed(-2, 5)),
    (start_index => 6, end_index => 9, value => to_signed(-3, 5)),
    (start_index => 10, end_index => 13, value => to_signed(-4, 5)),
    (start_index => 14, end_index => 17, value => to_signed(-3, 5)),
    (start_index => 18, end_index => 20, value => to_signed(-2, 5)),
    (start_index => 21, end_index => 22, value => to_signed(-1, 5)),
    (start_index => 23, end_index => 26, value => to_signed(0, 5)),
    (start_index => 27, end_index => 35, value => to_signed(1, 5)),
    (start_index => 36, end_index => 45, value => to_signed(2, 5)),
    (start_index => 46, end_index => 52, value => to_signed(3, 5)),
    (start_index => 53, end_index => 59, value => to_signed(4, 5)),
    (start_index => 60, end_index => 63, value => to_signed(5, 5))
  );

  -- LUT for Layer 0, Input 7, Output 1
  constant LUT_0_7_1_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 0, value => to_signed(0, 5)),
    (start_index => 1, end_index => 4, value => to_signed(1, 5)),
    (start_index => 5, end_index => 15, value => to_signed(2, 5)),
    (start_index => 16, end_index => 18, value => to_signed(1, 5)),
    (start_index => 19, end_index => 22, value => to_signed(0, 5)),
    (start_index => 23, end_index => 31, value => to_signed(-1, 5)),
    (start_index => 32, end_index => 46, value => to_signed(0, 5)),
    (start_index => 47, end_index => 63, value => to_signed(-1, 5))
  );

  -- LUT for Layer 0, Input 7, Output 2
  constant LUT_0_7_2_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 4, value => to_signed(-1, 5)),
    (start_index => 5, end_index => 15, value => to_signed(-2, 5)),
    (start_index => 16, end_index => 22, value => to_signed(-1, 5)),
    (start_index => 23, end_index => 30, value => to_signed(0, 5)),
    (start_index => 31, end_index => 41, value => to_signed(1, 5)),
    (start_index => 42, end_index => 59, value => to_signed(2, 5)),
    (start_index => 60, end_index => 63, value => to_signed(3, 5))
  );

  -- LUT for Layer 0, Input 7, Output 3
  constant LUT_0_7_3_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 1, value => to_signed(0, 5)),
    (start_index => 2, end_index => 7, value => to_signed(-1, 5)),
    (start_index => 8, end_index => 19, value => to_signed(-2, 5)),
    (start_index => 20, end_index => 24, value => to_signed(-1, 5)),
    (start_index => 25, end_index => 29, value => to_signed(0, 5)),
    (start_index => 30, end_index => 35, value => to_signed(1, 5)),
    (start_index => 36, end_index => 43, value => to_signed(2, 5)),
    (start_index => 44, end_index => 53, value => to_signed(3, 5)),
    (start_index => 54, end_index => 61, value => to_signed(4, 5)),
    (start_index => 62, end_index => 63, value => to_signed(5, 5))
  );

  -- LUT for Layer 0, Input 7, Output 4
  constant LUT_0_7_4_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 0, value => to_signed(0, 5)),
    (start_index => 1, end_index => 7, value => to_signed(-1, 5)),
    (start_index => 8, end_index => 17, value => to_signed(-2, 5)),
    (start_index => 18, end_index => 22, value => to_signed(-1, 5)),
    (start_index => 23, end_index => 31, value => to_signed(0, 5)),
    (start_index => 32, end_index => 40, value => to_signed(1, 5)),
    (start_index => 41, end_index => 48, value => to_signed(2, 5)),
    (start_index => 49, end_index => 60, value => to_signed(3, 5)),
    (start_index => 61, end_index => 63, value => to_signed(4, 5))
  );

  -- LUT for Layer 0, Input 7, Output 5
  constant LUT_0_7_5_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 0, value => to_signed(1, 5)),
    (start_index => 1, end_index => 3, value => to_signed(2, 5)),
    (start_index => 4, end_index => 7, value => to_signed(3, 5)),
    (start_index => 8, end_index => 10, value => to_signed(4, 5)),
    (start_index => 11, end_index => 15, value => to_signed(3, 5)),
    (start_index => 16, end_index => 18, value => to_signed(2, 5)),
    (start_index => 19, end_index => 20, value => to_signed(1, 5)),
    (start_index => 21, end_index => 22, value => to_signed(0, 5)),
    (start_index => 23, end_index => 25, value => to_signed(-1, 5)),
    (start_index => 26, end_index => 30, value => to_signed(-2, 5)),
    (start_index => 31, end_index => 33, value => to_signed(-3, 5)),
    (start_index => 34, end_index => 40, value => to_signed(-2, 5)),
    (start_index => 41, end_index => 63, value => to_signed(-1, 5))
  );

  -- LUT for Layer 0, Input 7, Output 6
  constant LUT_0_7_6_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 3, value => to_signed(-1, 5)),
    (start_index => 4, end_index => 8, value => to_signed(-2, 5)),
    (start_index => 9, end_index => 13, value => to_signed(-3, 5)),
    (start_index => 14, end_index => 17, value => to_signed(-2, 5)),
    (start_index => 18, end_index => 20, value => to_signed(-1, 5)),
    (start_index => 21, end_index => 23, value => to_signed(0, 5)),
    (start_index => 24, end_index => 27, value => to_signed(1, 5)),
    (start_index => 28, end_index => 47, value => to_signed(2, 5)),
    (start_index => 48, end_index => 63, value => to_signed(3, 5))
  );

  -- LUT for Layer 0, Input 7, Output 7
  constant LUT_0_7_7_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 5, value => to_signed(0, 5)),
    (start_index => 6, end_index => 18, value => to_signed(1, 5)),
    (start_index => 19, end_index => 26, value => to_signed(0, 5)),
    (start_index => 27, end_index => 33, value => to_signed(-1, 5)),
    (start_index => 34, end_index => 47, value => to_signed(0, 5)),
    (start_index => 48, end_index => 54, value => to_signed(1, 5)),
    (start_index => 55, end_index => 62, value => to_signed(2, 5)),
    (start_index => 63, end_index => 63, value => to_signed(3, 5))
  );

  -- LUT for Layer 0, Input 8, Output 0
  constant LUT_0_8_0_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 23, value => to_signed(0, 5)),
    (start_index => 24, end_index => 27, value => to_signed(1, 5)),
    (start_index => 28, end_index => 36, value => to_signed(0, 5)),
    (start_index => 37, end_index => 62, value => to_signed(-1, 5)),
    (start_index => 63, end_index => 63, value => to_signed(-2, 5))
  );

  -- LUT for Layer 0, Input 8, Output 1
  constant LUT_0_8_1_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 52, value => to_signed(0, 5)),
    (start_index => 53, end_index => 63, value => to_signed(-1, 5))
  );

  -- LUT for Layer 0, Input 8, Output 2
  constant LUT_0_8_2_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 50, value => to_signed(0, 5)),
    (start_index => 51, end_index => 63, value => to_signed(-1, 5))
  );

  -- LUT for Layer 0, Input 8, Output 3
  constant LUT_0_8_3_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 2, value => to_signed(0, 5)),
    (start_index => 3, end_index => 29, value => to_signed(1, 5)),
    (start_index => 30, end_index => 37, value => to_signed(0, 5)),
    (start_index => 38, end_index => 42, value => to_signed(-1, 5)),
    (start_index => 43, end_index => 48, value => to_signed(-2, 5)),
    (start_index => 49, end_index => 53, value => to_signed(-3, 5)),
    (start_index => 54, end_index => 58, value => to_signed(-4, 5)),
    (start_index => 59, end_index => 63, value => to_signed(-5, 5))
  );

  -- LUT for Layer 0, Input 8, Output 4
  constant LUT_0_8_4_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 7, value => to_signed(0, 5)),
    (start_index => 8, end_index => 13, value => to_signed(-1, 5)),
    (start_index => 14, end_index => 41, value => to_signed(0, 5)),
    (start_index => 42, end_index => 46, value => to_signed(1, 5)),
    (start_index => 47, end_index => 52, value => to_signed(2, 5)),
    (start_index => 53, end_index => 63, value => to_signed(3, 5))
  );

  -- LUT for Layer 0, Input 8, Output 5
  constant LUT_0_8_5_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 1, value => to_signed(0, 5)),
    (start_index => 2, end_index => 10, value => to_signed(1, 5)),
    (start_index => 11, end_index => 46, value => to_signed(0, 5)),
    (start_index => 47, end_index => 55, value => to_signed(1, 5)),
    (start_index => 56, end_index => 63, value => to_signed(2, 5))
  );

  -- LUT for Layer 0, Input 8, Output 6
  constant LUT_0_8_6_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 2, value => to_signed(0, 5)),
    (start_index => 3, end_index => 24, value => to_signed(1, 5)),
    (start_index => 25, end_index => 34, value => to_signed(0, 5)),
    (start_index => 35, end_index => 52, value => to_signed(-1, 5)),
    (start_index => 53, end_index => 62, value => to_signed(-2, 5)),
    (start_index => 63, end_index => 63, value => to_signed(-3, 5))
  );

  -- LUT for Layer 0, Input 8, Output 7
  constant LUT_0_8_7_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 11, value => to_signed(0, 5)),
    (start_index => 12, end_index => 14, value => to_signed(1, 5)),
    (start_index => 15, end_index => 50, value => to_signed(0, 5)),
    (start_index => 51, end_index => 63, value => to_signed(-1, 5))
  );

  -- LUT for Layer 0, Input 9, Output 0
  constant LUT_0_9_0_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 22, value => to_signed(-1, 5)),
    (start_index => 23, end_index => 33, value => to_signed(0, 5)),
    (start_index => 34, end_index => 43, value => to_signed(1, 5)),
    (start_index => 44, end_index => 53, value => to_signed(2, 5)),
    (start_index => 54, end_index => 61, value => to_signed(3, 5)),
    (start_index => 62, end_index => 63, value => to_signed(4, 5))
  );

  -- LUT for Layer 0, Input 9, Output 1
  constant LUT_0_9_1_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 9, value => to_signed(-2, 5)),
    (start_index => 10, end_index => 18, value => to_signed(-1, 5)),
    (start_index => 19, end_index => 31, value => to_signed(0, 5)),
    (start_index => 32, end_index => 35, value => to_signed(1, 5)),
    (start_index => 36, end_index => 40, value => to_signed(0, 5)),
    (start_index => 41, end_index => 49, value => to_signed(1, 5)),
    (start_index => 50, end_index => 56, value => to_signed(2, 5)),
    (start_index => 57, end_index => 63, value => to_signed(3, 5))
  );

  -- LUT for Layer 0, Input 9, Output 2
  constant LUT_0_9_2_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 16, value => to_signed(1, 5)),
    (start_index => 17, end_index => 47, value => to_signed(0, 5)),
    (start_index => 48, end_index => 59, value => to_signed(-1, 5)),
    (start_index => 60, end_index => 63, value => to_signed(-2, 5))
  );

  -- LUT for Layer 0, Input 9, Output 3
  constant LUT_0_9_3_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 1, value => to_signed(0, 5)),
    (start_index => 2, end_index => 26, value => to_signed(1, 5)),
    (start_index => 27, end_index => 36, value => to_signed(0, 5)),
    (start_index => 37, end_index => 42, value => to_signed(-1, 5)),
    (start_index => 43, end_index => 47, value => to_signed(-2, 5)),
    (start_index => 48, end_index => 51, value => to_signed(-3, 5)),
    (start_index => 52, end_index => 56, value => to_signed(-4, 5)),
    (start_index => 57, end_index => 60, value => to_signed(-5, 5)),
    (start_index => 61, end_index => 63, value => to_signed(-6, 5))
  );

  -- LUT for Layer 0, Input 9, Output 4
  constant LUT_0_9_4_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 27, value => to_signed(-1, 5)),
    (start_index => 28, end_index => 33, value => to_signed(0, 5)),
    (start_index => 34, end_index => 38, value => to_signed(1, 5)),
    (start_index => 39, end_index => 41, value => to_signed(2, 5)),
    (start_index => 42, end_index => 45, value => to_signed(3, 5)),
    (start_index => 46, end_index => 48, value => to_signed(4, 5)),
    (start_index => 49, end_index => 51, value => to_signed(5, 5)),
    (start_index => 52, end_index => 54, value => to_signed(6, 5)),
    (start_index => 55, end_index => 57, value => to_signed(7, 5)),
    (start_index => 58, end_index => 59, value => to_signed(8, 5)),
    (start_index => 60, end_index => 62, value => to_signed(9, 5)),
    (start_index => 63, end_index => 63, value => to_signed(10, 5))
  );

  -- LUT for Layer 0, Input 9, Output 5
  constant LUT_0_9_5_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 10, value => to_signed(0, 5)),
    (start_index => 11, end_index => 25, value => to_signed(1, 5)),
    (start_index => 26, end_index => 36, value => to_signed(0, 5)),
    (start_index => 37, end_index => 43, value => to_signed(-1, 5)),
    (start_index => 44, end_index => 50, value => to_signed(-2, 5)),
    (start_index => 51, end_index => 55, value => to_signed(-3, 5)),
    (start_index => 56, end_index => 60, value => to_signed(-4, 5)),
    (start_index => 61, end_index => 63, value => to_signed(-5, 5))
  );

  -- LUT for Layer 0, Input 9, Output 6
  constant LUT_0_9_6_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 5, value => to_signed(0, 5)),
    (start_index => 6, end_index => 11, value => to_signed(1, 5)),
    (start_index => 12, end_index => 41, value => to_signed(0, 5)),
    (start_index => 42, end_index => 59, value => to_signed(-1, 5)),
    (start_index => 60, end_index => 63, value => to_signed(-2, 5))
  );

  -- LUT for Layer 0, Input 9, Output 7
  constant LUT_0_9_7_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 29, value => to_signed(-1, 5)),
    (start_index => 30, end_index => 35, value => to_signed(0, 5)),
    (start_index => 36, end_index => 39, value => to_signed(1, 5)),
    (start_index => 40, end_index => 50, value => to_signed(2, 5)),
    (start_index => 51, end_index => 56, value => to_signed(3, 5)),
    (start_index => 57, end_index => 61, value => to_signed(4, 5)),
    (start_index => 62, end_index => 63, value => to_signed(5, 5))
  );

  -- LUT for Layer 0, Input 10, Output 0
  constant LUT_0_10_0_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 3, value => to_signed(-1, 5)),
    (start_index => 4, end_index => 36, value => to_signed(0, 5)),
    (start_index => 37, end_index => 39, value => to_signed(1, 5)),
    (start_index => 40, end_index => 51, value => to_signed(0, 5)),
    (start_index => 52, end_index => 61, value => to_signed(-1, 5)),
    (start_index => 62, end_index => 63, value => to_signed(-2, 5))
  );

  -- LUT for Layer 0, Input 10, Output 1
  constant LUT_0_10_1_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 2, value => to_signed(-5, 5)),
    (start_index => 3, end_index => 9, value => to_signed(-6, 5)),
    (start_index => 10, end_index => 12, value => to_signed(-5, 5)),
    (start_index => 13, end_index => 14, value => to_signed(-4, 5)),
    (start_index => 15, end_index => 17, value => to_signed(-3, 5)),
    (start_index => 18, end_index => 21, value => to_signed(-2, 5)),
    (start_index => 22, end_index => 26, value => to_signed(-1, 5)),
    (start_index => 27, end_index => 29, value => to_signed(0, 5)),
    (start_index => 30, end_index => 32, value => to_signed(1, 5)),
    (start_index => 33, end_index => 35, value => to_signed(2, 5)),
    (start_index => 36, end_index => 38, value => to_signed(3, 5)),
    (start_index => 39, end_index => 42, value => to_signed(4, 5)),
    (start_index => 43, end_index => 46, value => to_signed(5, 5)),
    (start_index => 47, end_index => 49, value => to_signed(6, 5)),
    (start_index => 50, end_index => 52, value => to_signed(7, 5)),
    (start_index => 53, end_index => 54, value => to_signed(8, 5)),
    (start_index => 55, end_index => 57, value => to_signed(9, 5)),
    (start_index => 58, end_index => 59, value => to_signed(10, 5)),
    (start_index => 60, end_index => 62, value => to_signed(11, 5)),
    (start_index => 63, end_index => 63, value => to_signed(12, 5))
  );

  -- LUT for Layer 0, Input 10, Output 2
  constant LUT_0_10_2_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 2, value => to_signed(0, 5)),
    (start_index => 3, end_index => 15, value => to_signed(1, 5)),
    (start_index => 16, end_index => 23, value => to_signed(0, 5)),
    (start_index => 24, end_index => 26, value => to_signed(-1, 5)),
    (start_index => 27, end_index => 38, value => to_signed(0, 5)),
    (start_index => 39, end_index => 54, value => to_signed(1, 5)),
    (start_index => 55, end_index => 63, value => to_signed(2, 5))
  );

  -- LUT for Layer 0, Input 10, Output 3
  constant LUT_0_10_3_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 1, value => to_signed(0, 5)),
    (start_index => 2, end_index => 6, value => to_signed(1, 5)),
    (start_index => 7, end_index => 22, value => to_signed(2, 5)),
    (start_index => 23, end_index => 28, value => to_signed(1, 5)),
    (start_index => 29, end_index => 33, value => to_signed(0, 5)),
    (start_index => 34, end_index => 36, value => to_signed(-1, 5)),
    (start_index => 37, end_index => 40, value => to_signed(-2, 5)),
    (start_index => 41, end_index => 43, value => to_signed(-3, 5)),
    (start_index => 44, end_index => 47, value => to_signed(-4, 5)),
    (start_index => 48, end_index => 51, value => to_signed(-5, 5)),
    (start_index => 52, end_index => 54, value => to_signed(-6, 5)),
    (start_index => 55, end_index => 57, value => to_signed(-7, 5)),
    (start_index => 58, end_index => 60, value => to_signed(-8, 5)),
    (start_index => 61, end_index => 62, value => to_signed(-9, 5)),
    (start_index => 63, end_index => 63, value => to_signed(-10, 5))
  );

  -- LUT for Layer 0, Input 10, Output 4
  constant LUT_0_10_4_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 24, value => to_signed(-1, 5)),
    (start_index => 25, end_index => 34, value => to_signed(0, 5)),
    (start_index => 35, end_index => 43, value => to_signed(1, 5)),
    (start_index => 44, end_index => 49, value => to_signed(2, 5)),
    (start_index => 50, end_index => 54, value => to_signed(3, 5)),
    (start_index => 55, end_index => 58, value => to_signed(4, 5)),
    (start_index => 59, end_index => 63, value => to_signed(5, 5))
  );

  -- LUT for Layer 0, Input 10, Output 5
  constant LUT_0_10_5_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 5, value => to_signed(-1, 5)),
    (start_index => 6, end_index => 8, value => to_signed(-2, 5)),
    (start_index => 9, end_index => 19, value => to_signed(-1, 5)),
    (start_index => 20, end_index => 30, value => to_signed(0, 5)),
    (start_index => 31, end_index => 44, value => to_signed(1, 5)),
    (start_index => 45, end_index => 53, value => to_signed(2, 5)),
    (start_index => 54, end_index => 60, value => to_signed(3, 5)),
    (start_index => 61, end_index => 63, value => to_signed(4, 5))
  );

  -- LUT for Layer 0, Input 10, Output 6
  constant LUT_0_10_6_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 0, value => to_signed(1, 5)),
    (start_index => 1, end_index => 2, value => to_signed(2, 5)),
    (start_index => 3, end_index => 4, value => to_signed(3, 5)),
    (start_index => 5, end_index => 13, value => to_signed(4, 5)),
    (start_index => 14, end_index => 16, value => to_signed(3, 5)),
    (start_index => 17, end_index => 20, value => to_signed(2, 5)),
    (start_index => 21, end_index => 23, value => to_signed(1, 5)),
    (start_index => 24, end_index => 27, value => to_signed(0, 5)),
    (start_index => 28, end_index => 32, value => to_signed(-1, 5)),
    (start_index => 33, end_index => 43, value => to_signed(-2, 5)),
    (start_index => 44, end_index => 56, value => to_signed(-3, 5)),
    (start_index => 57, end_index => 59, value => to_signed(-4, 5)),
    (start_index => 60, end_index => 62, value => to_signed(-5, 5)),
    (start_index => 63, end_index => 63, value => to_signed(-6, 5))
  );

  -- LUT for Layer 0, Input 10, Output 7
  constant LUT_0_10_7_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 3, value => to_signed(-1, 5)),
    (start_index => 4, end_index => 7, value => to_signed(-2, 5)),
    (start_index => 8, end_index => 12, value => to_signed(-1, 5)),
    (start_index => 13, end_index => 17, value => to_signed(0, 5)),
    (start_index => 18, end_index => 29, value => to_signed(1, 5)),
    (start_index => 30, end_index => 35, value => to_signed(0, 5)),
    (start_index => 36, end_index => 46, value => to_signed(-1, 5)),
    (start_index => 47, end_index => 62, value => to_signed(-2, 5)),
    (start_index => 63, end_index => 63, value => to_signed(-3, 5))
  );

  -- LUT for Layer 0, Input 11, Output 0
  constant LUT_0_11_0_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 3, value => to_signed(0, 5)),
    (start_index => 4, end_index => 22, value => to_signed(1, 5)),
    (start_index => 23, end_index => 33, value => to_signed(0, 5)),
    (start_index => 34, end_index => 37, value => to_signed(-1, 5)),
    (start_index => 38, end_index => 40, value => to_signed(0, 5)),
    (start_index => 41, end_index => 44, value => to_signed(-1, 5)),
    (start_index => 45, end_index => 59, value => to_signed(0, 5)),
    (start_index => 60, end_index => 62, value => to_signed(1, 5)),
    (start_index => 63, end_index => 63, value => to_signed(0, 5))
  );

  -- LUT for Layer 0, Input 11, Output 1
  constant LUT_0_11_1_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 10, value => to_signed(1, 5)),
    (start_index => 11, end_index => 23, value => to_signed(2, 5)),
    (start_index => 24, end_index => 28, value => to_signed(1, 5)),
    (start_index => 29, end_index => 31, value => to_signed(0, 5)),
    (start_index => 32, end_index => 35, value => to_signed(-1, 5)),
    (start_index => 36, end_index => 38, value => to_signed(-2, 5)),
    (start_index => 39, end_index => 41, value => to_signed(-3, 5)),
    (start_index => 42, end_index => 45, value => to_signed(-4, 5)),
    (start_index => 46, end_index => 48, value => to_signed(-5, 5)),
    (start_index => 49, end_index => 50, value => to_signed(-6, 5)),
    (start_index => 51, end_index => 53, value => to_signed(-7, 5)),
    (start_index => 54, end_index => 55, value => to_signed(-8, 5)),
    (start_index => 56, end_index => 58, value => to_signed(-9, 5)),
    (start_index => 59, end_index => 60, value => to_signed(-10, 5)),
    (start_index => 61, end_index => 63, value => to_signed(-11, 5))
  );

  -- LUT for Layer 0, Input 11, Output 2
  constant LUT_0_11_2_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 2, value => to_signed(1, 5)),
    (start_index => 3, end_index => 7, value => to_signed(2, 5)),
    (start_index => 8, end_index => 18, value => to_signed(3, 5)),
    (start_index => 19, end_index => 22, value => to_signed(2, 5)),
    (start_index => 23, end_index => 25, value => to_signed(1, 5)),
    (start_index => 26, end_index => 29, value => to_signed(0, 5)),
    (start_index => 30, end_index => 34, value => to_signed(-1, 5)),
    (start_index => 35, end_index => 43, value => to_signed(-2, 5)),
    (start_index => 44, end_index => 55, value => to_signed(-3, 5)),
    (start_index => 56, end_index => 63, value => to_signed(-4, 5))
  );

  -- LUT for Layer 0, Input 11, Output 3
  constant LUT_0_11_3_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 1, value => to_signed(1, 5)),
    (start_index => 2, end_index => 3, value => to_signed(2, 5)),
    (start_index => 4, end_index => 6, value => to_signed(3, 5)),
    (start_index => 7, end_index => 9, value => to_signed(4, 5)),
    (start_index => 10, end_index => 15, value => to_signed(5, 5)),
    (start_index => 16, end_index => 18, value => to_signed(4, 5)),
    (start_index => 19, end_index => 20, value => to_signed(3, 5)),
    (start_index => 21, end_index => 23, value => to_signed(2, 5)),
    (start_index => 24, end_index => 25, value => to_signed(1, 5)),
    (start_index => 26, end_index => 28, value => to_signed(0, 5)),
    (start_index => 29, end_index => 31, value => to_signed(-1, 5)),
    (start_index => 32, end_index => 35, value => to_signed(-2, 5)),
    (start_index => 36, end_index => 44, value => to_signed(-3, 5)),
    (start_index => 45, end_index => 49, value => to_signed(-4, 5)),
    (start_index => 50, end_index => 56, value => to_signed(-3, 5)),
    (start_index => 57, end_index => 61, value => to_signed(-2, 5)),
    (start_index => 62, end_index => 63, value => to_signed(-3, 5))
  );

  -- LUT for Layer 0, Input 11, Output 4
  constant LUT_0_11_4_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 3, value => to_signed(0, 5)),
    (start_index => 4, end_index => 9, value => to_signed(1, 5)),
    (start_index => 10, end_index => 14, value => to_signed(2, 5)),
    (start_index => 15, end_index => 19, value => to_signed(1, 5)),
    (start_index => 20, end_index => 24, value => to_signed(0, 5)),
    (start_index => 25, end_index => 33, value => to_signed(-1, 5)),
    (start_index => 34, end_index => 40, value => to_signed(0, 5)),
    (start_index => 41, end_index => 47, value => to_signed(1, 5)),
    (start_index => 48, end_index => 52, value => to_signed(2, 5)),
    (start_index => 53, end_index => 56, value => to_signed(3, 5)),
    (start_index => 57, end_index => 60, value => to_signed(4, 5)),
    (start_index => 61, end_index => 63, value => to_signed(5, 5))
  );

  -- LUT for Layer 0, Input 11, Output 5
  constant LUT_0_11_5_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 4, value => to_signed(0, 5)),
    (start_index => 5, end_index => 25, value => to_signed(1, 5)),
    (start_index => 26, end_index => 35, value => to_signed(0, 5)),
    (start_index => 36, end_index => 46, value => to_signed(-1, 5)),
    (start_index => 47, end_index => 53, value => to_signed(-2, 5)),
    (start_index => 54, end_index => 61, value => to_signed(-3, 5)),
    (start_index => 62, end_index => 63, value => to_signed(-4, 5))
  );

  -- LUT for Layer 0, Input 11, Output 6
  constant LUT_0_11_6_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 0, value => to_signed(0, 5)),
    (start_index => 1, end_index => 9, value => to_signed(1, 5)),
    (start_index => 10, end_index => 15, value => to_signed(2, 5)),
    (start_index => 16, end_index => 22, value => to_signed(1, 5)),
    (start_index => 23, end_index => 28, value => to_signed(0, 5)),
    (start_index => 29, end_index => 57, value => to_signed(-1, 5)),
    (start_index => 58, end_index => 62, value => to_signed(-2, 5)),
    (start_index => 63, end_index => 63, value => to_signed(-3, 5))
  );

  -- LUT for Layer 0, Input 11, Output 7
  constant LUT_0_11_7_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 0, value => to_signed(-1, 5)),
    (start_index => 1, end_index => 7, value => to_signed(-2, 5)),
    (start_index => 8, end_index => 25, value => to_signed(-3, 5)),
    (start_index => 26, end_index => 28, value => to_signed(-2, 5)),
    (start_index => 29, end_index => 30, value => to_signed(-1, 5)),
    (start_index => 31, end_index => 32, value => to_signed(0, 5)),
    (start_index => 33, end_index => 34, value => to_signed(1, 5)),
    (start_index => 35, end_index => 37, value => to_signed(2, 5)),
    (start_index => 38, end_index => 39, value => to_signed(3, 5)),
    (start_index => 40, end_index => 41, value => to_signed(4, 5)),
    (start_index => 42, end_index => 43, value => to_signed(5, 5)),
    (start_index => 44, end_index => 46, value => to_signed(6, 5)),
    (start_index => 47, end_index => 48, value => to_signed(7, 5)),
    (start_index => 49, end_index => 51, value => to_signed(8, 5)),
    (start_index => 52, end_index => 53, value => to_signed(9, 5)),
    (start_index => 54, end_index => 56, value => to_signed(10, 5)),
    (start_index => 57, end_index => 58, value => to_signed(11, 5)),
    (start_index => 59, end_index => 60, value => to_signed(12, 5)),
    (start_index => 61, end_index => 63, value => to_signed(13, 5))
  );

  -- LUT for Layer 0, Input 12, Output 0
  constant LUT_0_12_0_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 40, value => to_signed(0, 5)),
    (start_index => 41, end_index => 49, value => to_signed(-1, 5)),
    (start_index => 50, end_index => 54, value => to_signed(-2, 5)),
    (start_index => 55, end_index => 58, value => to_signed(-3, 5)),
    (start_index => 59, end_index => 63, value => to_signed(-4, 5))
  );

  -- LUT for Layer 0, Input 12, Output 1
  constant LUT_0_12_1_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 2, value => to_signed(-1, 5)),
    (start_index => 3, end_index => 6, value => to_signed(-2, 5)),
    (start_index => 7, end_index => 22, value => to_signed(-1, 5)),
    (start_index => 23, end_index => 34, value => to_signed(0, 5)),
    (start_index => 35, end_index => 44, value => to_signed(1, 5)),
    (start_index => 45, end_index => 51, value => to_signed(2, 5)),
    (start_index => 52, end_index => 63, value => to_signed(3, 5))
  );

  -- LUT for Layer 0, Input 12, Output 2
  constant LUT_0_12_2_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 3, value => to_signed(1, 5)),
    (start_index => 4, end_index => 10, value => to_signed(2, 5)),
    (start_index => 11, end_index => 18, value => to_signed(1, 5)),
    (start_index => 19, end_index => 30, value => to_signed(0, 5)),
    (start_index => 31, end_index => 56, value => to_signed(-1, 5)),
    (start_index => 57, end_index => 61, value => to_signed(-2, 5)),
    (start_index => 62, end_index => 63, value => to_signed(-3, 5))
  );

  -- LUT for Layer 0, Input 12, Output 3
  constant LUT_0_12_3_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 2, value => to_signed(1, 5)),
    (start_index => 3, end_index => 15, value => to_signed(2, 5)),
    (start_index => 16, end_index => 24, value => to_signed(1, 5)),
    (start_index => 25, end_index => 36, value => to_signed(0, 5)),
    (start_index => 37, end_index => 43, value => to_signed(-1, 5)),
    (start_index => 44, end_index => 51, value => to_signed(-2, 5)),
    (start_index => 52, end_index => 56, value => to_signed(-1, 5)),
    (start_index => 57, end_index => 63, value => to_signed(-2, 5))
  );

  -- LUT for Layer 0, Input 12, Output 4
  constant LUT_0_12_4_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 40, value => to_signed(0, 5)),
    (start_index => 41, end_index => 48, value => to_signed(1, 5)),
    (start_index => 49, end_index => 58, value => to_signed(2, 5)),
    (start_index => 59, end_index => 63, value => to_signed(3, 5))
  );

  -- LUT for Layer 0, Input 12, Output 5
  constant LUT_0_12_5_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 27, value => to_signed(-1, 5)),
    (start_index => 28, end_index => 34, value => to_signed(0, 5)),
    (start_index => 35, end_index => 39, value => to_signed(1, 5)),
    (start_index => 40, end_index => 42, value => to_signed(2, 5)),
    (start_index => 43, end_index => 46, value => to_signed(3, 5)),
    (start_index => 47, end_index => 49, value => to_signed(4, 5)),
    (start_index => 50, end_index => 53, value => to_signed(5, 5)),
    (start_index => 54, end_index => 56, value => to_signed(6, 5)),
    (start_index => 57, end_index => 59, value => to_signed(7, 5)),
    (start_index => 60, end_index => 62, value => to_signed(8, 5)),
    (start_index => 63, end_index => 63, value => to_signed(9, 5))
  );

  -- LUT for Layer 0, Input 12, Output 6
  constant LUT_0_12_6_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 1, value => to_signed(1, 5)),
    (start_index => 2, end_index => 15, value => to_signed(2, 5)),
    (start_index => 16, end_index => 26, value => to_signed(1, 5)),
    (start_index => 27, end_index => 33, value => to_signed(0, 5)),
    (start_index => 34, end_index => 39, value => to_signed(-1, 5)),
    (start_index => 40, end_index => 43, value => to_signed(-2, 5)),
    (start_index => 44, end_index => 49, value => to_signed(-3, 5)),
    (start_index => 50, end_index => 55, value => to_signed(-4, 5)),
    (start_index => 56, end_index => 59, value => to_signed(-5, 5)),
    (start_index => 60, end_index => 63, value => to_signed(-6, 5))
  );

  -- LUT for Layer 0, Input 12, Output 7
  constant LUT_0_12_7_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 4, value => to_signed(0, 5)),
    (start_index => 5, end_index => 8, value => to_signed(1, 5)),
    (start_index => 9, end_index => 25, value => to_signed(2, 5)),
    (start_index => 26, end_index => 30, value => to_signed(1, 5)),
    (start_index => 31, end_index => 33, value => to_signed(0, 5)),
    (start_index => 34, end_index => 36, value => to_signed(-1, 5)),
    (start_index => 37, end_index => 39, value => to_signed(-2, 5)),
    (start_index => 40, end_index => 41, value => to_signed(-3, 5)),
    (start_index => 42, end_index => 43, value => to_signed(-4, 5)),
    (start_index => 44, end_index => 45, value => to_signed(-5, 5)),
    (start_index => 46, end_index => 47, value => to_signed(-6, 5)),
    (start_index => 48, end_index => 49, value => to_signed(-7, 5)),
    (start_index => 50, end_index => 51, value => to_signed(-8, 5)),
    (start_index => 52, end_index => 53, value => to_signed(-9, 5)),
    (start_index => 54, end_index => 55, value => to_signed(-10, 5)),
    (start_index => 56, end_index => 57, value => to_signed(-11, 5)),
    (start_index => 58, end_index => 59, value => to_signed(-12, 5)),
    (start_index => 60, end_index => 61, value => to_signed(-13, 5)),
    (start_index => 62, end_index => 63, value => to_signed(-14, 5))
  );

  -- LUT for Layer 0, Input 13, Output 0
  constant LUT_0_13_0_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 7, value => to_signed(0, 5)),
    (start_index => 8, end_index => 15, value => to_signed(-1, 5)),
    (start_index => 16, end_index => 53, value => to_signed(0, 5)),
    (start_index => 54, end_index => 62, value => to_signed(-1, 5)),
    (start_index => 63, end_index => 63, value => to_signed(-2, 5))
  );

  -- LUT for Layer 0, Input 13, Output 1
  constant LUT_0_13_1_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 7, value => to_signed(1, 5)),
    (start_index => 8, end_index => 13, value => to_signed(2, 5)),
    (start_index => 14, end_index => 21, value => to_signed(1, 5)),
    (start_index => 22, end_index => 31, value => to_signed(0, 5)),
    (start_index => 32, end_index => 41, value => to_signed(-1, 5)),
    (start_index => 42, end_index => 57, value => to_signed(-2, 5)),
    (start_index => 58, end_index => 63, value => to_signed(-3, 5))
  );

  -- LUT for Layer 0, Input 13, Output 2
  constant LUT_0_13_2_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 48, value => to_signed(0, 5)),
    (start_index => 49, end_index => 60, value => to_signed(1, 5)),
    (start_index => 61, end_index => 63, value => to_signed(0, 5))
  );

  -- LUT for Layer 0, Input 13, Output 3
  constant LUT_0_13_3_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 38, value => to_signed(0, 5)),
    (start_index => 39, end_index => 46, value => to_signed(1, 5)),
    (start_index => 47, end_index => 53, value => to_signed(2, 5)),
    (start_index => 54, end_index => 59, value => to_signed(3, 5)),
    (start_index => 60, end_index => 63, value => to_signed(4, 5))
  );

  -- LUT for Layer 0, Input 13, Output 4
  constant LUT_0_13_4_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 25, value => to_signed(1, 5)),
    (start_index => 26, end_index => 31, value => to_signed(0, 5)),
    (start_index => 32, end_index => 43, value => to_signed(-1, 5)),
    (start_index => 44, end_index => 50, value => to_signed(-2, 5)),
    (start_index => 51, end_index => 55, value => to_signed(-3, 5)),
    (start_index => 56, end_index => 59, value => to_signed(-4, 5)),
    (start_index => 60, end_index => 63, value => to_signed(-5, 5))
  );

  -- LUT for Layer 0, Input 13, Output 5
  constant LUT_0_13_5_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 2, value => to_signed(1, 5)),
    (start_index => 3, end_index => 16, value => to_signed(2, 5)),
    (start_index => 17, end_index => 21, value => to_signed(1, 5)),
    (start_index => 22, end_index => 29, value => to_signed(0, 5)),
    (start_index => 30, end_index => 44, value => to_signed(-1, 5)),
    (start_index => 45, end_index => 63, value => to_signed(-2, 5))
  );

  -- LUT for Layer 0, Input 13, Output 6
  constant LUT_0_13_6_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 9, value => to_signed(0, 5)),
    (start_index => 10, end_index => 11, value => to_signed(-1, 5)),
    (start_index => 12, end_index => 40, value => to_signed(0, 5)),
    (start_index => 41, end_index => 58, value => to_signed(1, 5)),
    (start_index => 59, end_index => 63, value => to_signed(2, 5))
  );

  -- LUT for Layer 0, Input 13, Output 7
  constant LUT_0_13_7_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 3, value => to_signed(0, 5)),
    (start_index => 4, end_index => 16, value => to_signed(1, 5)),
    (start_index => 17, end_index => 22, value => to_signed(0, 5)),
    (start_index => 23, end_index => 32, value => to_signed(-1, 5)),
    (start_index => 33, end_index => 41, value => to_signed(0, 5)),
    (start_index => 42, end_index => 43, value => to_signed(1, 5)),
    (start_index => 44, end_index => 51, value => to_signed(0, 5)),
    (start_index => 52, end_index => 59, value => to_signed(-1, 5)),
    (start_index => 60, end_index => 63, value => to_signed(-2, 5))
  );

  -- LUT for Layer 0, Input 14, Output 0
  constant LUT_0_14_0_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 12, value => to_signed(-2, 5)),
    (start_index => 13, end_index => 15, value => to_signed(-1, 5)),
    (start_index => 16, end_index => 19, value => to_signed(0, 5)),
    (start_index => 20, end_index => 26, value => to_signed(1, 5)),
    (start_index => 27, end_index => 28, value => to_signed(0, 5)),
    (start_index => 29, end_index => 30, value => to_signed(-1, 5)),
    (start_index => 31, end_index => 35, value => to_signed(-2, 5)),
    (start_index => 36, end_index => 37, value => to_signed(-1, 5)),
    (start_index => 38, end_index => 38, value => to_signed(0, 5)),
    (start_index => 39, end_index => 39, value => to_signed(1, 5)),
    (start_index => 40, end_index => 41, value => to_signed(2, 5)),
    (start_index => 42, end_index => 42, value => to_signed(3, 5)),
    (start_index => 43, end_index => 43, value => to_signed(4, 5)),
    (start_index => 44, end_index => 45, value => to_signed(5, 5)),
    (start_index => 46, end_index => 46, value => to_signed(6, 5)),
    (start_index => 47, end_index => 48, value => to_signed(7, 5)),
    (start_index => 49, end_index => 50, value => to_signed(8, 5)),
    (start_index => 51, end_index => 53, value => to_signed(9, 5)),
    (start_index => 54, end_index => 55, value => to_signed(10, 5)),
    (start_index => 56, end_index => 57, value => to_signed(11, 5)),
    (start_index => 58, end_index => 59, value => to_signed(12, 5)),
    (start_index => 60, end_index => 60, value => to_signed(13, 5)),
    (start_index => 61, end_index => 61, value => to_signed(14, 5)),
    (start_index => 62, end_index => 63, value => to_signed(15, 5))
  );

  -- LUT for Layer 0, Input 14, Output 1
  constant LUT_0_14_1_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 3, value => to_signed(-1, 5)),
    (start_index => 4, end_index => 7, value => to_signed(-2, 5)),
    (start_index => 8, end_index => 13, value => to_signed(-1, 5)),
    (start_index => 14, end_index => 22, value => to_signed(0, 5)),
    (start_index => 23, end_index => 28, value => to_signed(-1, 5)),
    (start_index => 29, end_index => 32, value => to_signed(-2, 5)),
    (start_index => 33, end_index => 35, value => to_signed(-1, 5)),
    (start_index => 36, end_index => 37, value => to_signed(0, 5)),
    (start_index => 38, end_index => 39, value => to_signed(1, 5)),
    (start_index => 40, end_index => 40, value => to_signed(2, 5)),
    (start_index => 41, end_index => 42, value => to_signed(3, 5)),
    (start_index => 43, end_index => 44, value => to_signed(4, 5)),
    (start_index => 45, end_index => 52, value => to_signed(5, 5)),
    (start_index => 53, end_index => 55, value => to_signed(4, 5)),
    (start_index => 56, end_index => 57, value => to_signed(3, 5)),
    (start_index => 58, end_index => 60, value => to_signed(2, 5)),
    (start_index => 61, end_index => 63, value => to_signed(3, 5))
  );

  -- LUT for Layer 0, Input 14, Output 2
  constant LUT_0_14_2_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 1, value => to_signed(-4, 5)),
    (start_index => 2, end_index => 7, value => to_signed(-5, 5)),
    (start_index => 8, end_index => 12, value => to_signed(-6, 5)),
    (start_index => 13, end_index => 14, value => to_signed(-7, 5)),
    (start_index => 15, end_index => 15, value => to_signed(-8, 5)),
    (start_index => 16, end_index => 22, value => to_signed(-9, 5)),
    (start_index => 23, end_index => 24, value => to_signed(-8, 5)),
    (start_index => 25, end_index => 25, value => to_signed(-7, 5)),
    (start_index => 26, end_index => 26, value => to_signed(-6, 5)),
    (start_index => 27, end_index => 27, value => to_signed(-5, 5)),
    (start_index => 28, end_index => 28, value => to_signed(-4, 5)),
    (start_index => 29, end_index => 29, value => to_signed(-3, 5)),
    (start_index => 30, end_index => 30, value => to_signed(-2, 5)),
    (start_index => 31, end_index => 31, value => to_signed(-1, 5)),
    (start_index => 32, end_index => 32, value => to_signed(1, 5)),
    (start_index => 33, end_index => 33, value => to_signed(2, 5)),
    (start_index => 34, end_index => 34, value => to_signed(3, 5)),
    (start_index => 35, end_index => 35, value => to_signed(4, 5)),
    (start_index => 36, end_index => 36, value => to_signed(6, 5)),
    (start_index => 37, end_index => 38, value => to_signed(7, 5)),
    (start_index => 39, end_index => 43, value => to_signed(8, 5)),
    (start_index => 44, end_index => 48, value => to_signed(7, 5)),
    (start_index => 49, end_index => 51, value => to_signed(8, 5)),
    (start_index => 52, end_index => 55, value => to_signed(9, 5)),
    (start_index => 56, end_index => 57, value => to_signed(10, 5)),
    (start_index => 58, end_index => 58, value => to_signed(11, 5)),
    (start_index => 59, end_index => 60, value => to_signed(12, 5)),
    (start_index => 61, end_index => 61, value => to_signed(13, 5)),
    (start_index => 62, end_index => 62, value => to_signed(14, 5)),
    (start_index => 63, end_index => 63, value => to_signed(15, 5))
  );

  -- LUT for Layer 0, Input 14, Output 3
  constant LUT_0_14_3_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 1, value => to_signed(-2, 5)),
    (start_index => 2, end_index => 5, value => to_signed(-1, 5)),
    (start_index => 6, end_index => 8, value => to_signed(0, 5)),
    (start_index => 9, end_index => 11, value => to_signed(1, 5)),
    (start_index => 12, end_index => 13, value => to_signed(2, 5)),
    (start_index => 14, end_index => 16, value => to_signed(3, 5)),
    (start_index => 17, end_index => 18, value => to_signed(4, 5)),
    (start_index => 19, end_index => 19, value => to_signed(5, 5)),
    (start_index => 20, end_index => 21, value => to_signed(6, 5)),
    (start_index => 22, end_index => 23, value => to_signed(7, 5)),
    (start_index => 24, end_index => 27, value => to_signed(8, 5)),
    (start_index => 28, end_index => 29, value => to_signed(7, 5)),
    (start_index => 30, end_index => 30, value => to_signed(6, 5)),
    (start_index => 31, end_index => 31, value => to_signed(4, 5)),
    (start_index => 32, end_index => 32, value => to_signed(3, 5)),
    (start_index => 33, end_index => 33, value => to_signed(1, 5)),
    (start_index => 34, end_index => 34, value => to_signed(-1, 5)),
    (start_index => 35, end_index => 35, value => to_signed(-2, 5)),
    (start_index => 36, end_index => 36, value => to_signed(-4, 5)),
    (start_index => 37, end_index => 37, value => to_signed(-5, 5)),
    (start_index => 38, end_index => 39, value => to_signed(-7, 5)),
    (start_index => 40, end_index => 41, value => to_signed(-8, 5)),
    (start_index => 42, end_index => 43, value => to_signed(-7, 5)),
    (start_index => 44, end_index => 44, value => to_signed(-6, 5)),
    (start_index => 45, end_index => 46, value => to_signed(-5, 5)),
    (start_index => 47, end_index => 48, value => to_signed(-4, 5)),
    (start_index => 49, end_index => 49, value => to_signed(-3, 5)),
    (start_index => 50, end_index => 51, value => to_signed(-2, 5)),
    (start_index => 52, end_index => 52, value => to_signed(0, 5)),
    (start_index => 53, end_index => 53, value => to_signed(1, 5)),
    (start_index => 54, end_index => 54, value => to_signed(2, 5)),
    (start_index => 55, end_index => 55, value => to_signed(4, 5)),
    (start_index => 56, end_index => 56, value => to_signed(5, 5)),
    (start_index => 57, end_index => 57, value => to_signed(6, 5)),
    (start_index => 58, end_index => 59, value => to_signed(7, 5)),
    (start_index => 60, end_index => 60, value => to_signed(6, 5)),
    (start_index => 61, end_index => 61, value => to_signed(5, 5)),
    (start_index => 62, end_index => 62, value => to_signed(4, 5)),
    (start_index => 63, end_index => 63, value => to_signed(3, 5))
  );

  -- LUT for Layer 0, Input 14, Output 4
  constant LUT_0_14_4_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 0, value => to_signed(-2, 5)),
    (start_index => 1, end_index => 11, value => to_signed(-3, 5)),
    (start_index => 12, end_index => 13, value => to_signed(-2, 5)),
    (start_index => 14, end_index => 15, value => to_signed(-1, 5)),
    (start_index => 16, end_index => 17, value => to_signed(0, 5)),
    (start_index => 18, end_index => 18, value => to_signed(1, 5)),
    (start_index => 19, end_index => 19, value => to_signed(2, 5)),
    (start_index => 20, end_index => 20, value => to_signed(3, 5)),
    (start_index => 21, end_index => 21, value => to_signed(4, 5)),
    (start_index => 22, end_index => 22, value => to_signed(5, 5)),
    (start_index => 23, end_index => 23, value => to_signed(6, 5)),
    (start_index => 24, end_index => 27, value => to_signed(7, 5)),
    (start_index => 28, end_index => 28, value => to_signed(6, 5)),
    (start_index => 29, end_index => 29, value => to_signed(5, 5)),
    (start_index => 30, end_index => 30, value => to_signed(4, 5)),
    (start_index => 31, end_index => 31, value => to_signed(3, 5)),
    (start_index => 32, end_index => 32, value => to_signed(1, 5)),
    (start_index => 33, end_index => 33, value => to_signed(0, 5)),
    (start_index => 34, end_index => 34, value => to_signed(-2, 5)),
    (start_index => 35, end_index => 35, value => to_signed(-3, 5)),
    (start_index => 36, end_index => 36, value => to_signed(-4, 5)),
    (start_index => 37, end_index => 39, value => to_signed(-5, 5)),
    (start_index => 40, end_index => 40, value => to_signed(-4, 5)),
    (start_index => 41, end_index => 41, value => to_signed(-2, 5)),
    (start_index => 42, end_index => 42, value => to_signed(0, 5)),
    (start_index => 43, end_index => 43, value => to_signed(2, 5)),
    (start_index => 44, end_index => 44, value => to_signed(4, 5)),
    (start_index => 45, end_index => 45, value => to_signed(7, 5)),
    (start_index => 46, end_index => 46, value => to_signed(9, 5)),
    (start_index => 47, end_index => 47, value => to_signed(12, 5)),
    (start_index => 48, end_index => 48, value => to_signed(14, 5)),
    (start_index => 49, end_index => 57, value => to_signed(15, 5)),
    (start_index => 58, end_index => 58, value => to_signed(14, 5)),
    (start_index => 59, end_index => 59, value => to_signed(13, 5)),
    (start_index => 60, end_index => 60, value => to_signed(12, 5)),
    (start_index => 61, end_index => 62, value => to_signed(11, 5)),
    (start_index => 63, end_index => 63, value => to_signed(10, 5))
  );

  -- LUT for Layer 0, Input 14, Output 5
  constant LUT_0_14_5_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 0, value => to_signed(7, 5)),
    (start_index => 1, end_index => 1, value => to_signed(8, 5)),
    (start_index => 2, end_index => 2, value => to_signed(9, 5)),
    (start_index => 3, end_index => 3, value => to_signed(10, 5)),
    (start_index => 4, end_index => 5, value => to_signed(11, 5)),
    (start_index => 6, end_index => 11, value => to_signed(12, 5)),
    (start_index => 12, end_index => 13, value => to_signed(11, 5)),
    (start_index => 14, end_index => 15, value => to_signed(10, 5)),
    (start_index => 16, end_index => 16, value => to_signed(9, 5)),
    (start_index => 17, end_index => 18, value => to_signed(8, 5)),
    (start_index => 19, end_index => 24, value => to_signed(7, 5)),
    (start_index => 25, end_index => 26, value => to_signed(6, 5)),
    (start_index => 27, end_index => 27, value => to_signed(5, 5)),
    (start_index => 28, end_index => 28, value => to_signed(4, 5)),
    (start_index => 29, end_index => 29, value => to_signed(3, 5)),
    (start_index => 30, end_index => 30, value => to_signed(2, 5)),
    (start_index => 31, end_index => 31, value => to_signed(1, 5)),
    (start_index => 32, end_index => 32, value => to_signed(0, 5)),
    (start_index => 33, end_index => 33, value => to_signed(-1, 5)),
    (start_index => 34, end_index => 34, value => to_signed(-3, 5)),
    (start_index => 35, end_index => 35, value => to_signed(-4, 5)),
    (start_index => 36, end_index => 36, value => to_signed(-5, 5)),
    (start_index => 37, end_index => 37, value => to_signed(-6, 5)),
    (start_index => 38, end_index => 38, value => to_signed(-7, 5)),
    (start_index => 39, end_index => 40, value => to_signed(-8, 5)),
    (start_index => 41, end_index => 42, value => to_signed(-9, 5)),
    (start_index => 43, end_index => 43, value => to_signed(-10, 5)),
    (start_index => 44, end_index => 44, value => to_signed(-11, 5)),
    (start_index => 45, end_index => 45, value => to_signed(-12, 5)),
    (start_index => 46, end_index => 46, value => to_signed(-13, 5)),
    (start_index => 47, end_index => 47, value => to_signed(-14, 5)),
    (start_index => 48, end_index => 48, value => to_signed(-15, 5)),
    (start_index => 49, end_index => 63, value => to_signed(-16, 5))
  );

  -- LUT for Layer 0, Input 14, Output 6
  constant LUT_0_14_6_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 0, value => to_signed(0, 5)),
    (start_index => 1, end_index => 1, value => to_signed(-1, 5)),
    (start_index => 2, end_index => 3, value => to_signed(-2, 5)),
    (start_index => 4, end_index => 5, value => to_signed(-3, 5)),
    (start_index => 6, end_index => 10, value => to_signed(-4, 5)),
    (start_index => 11, end_index => 11, value => to_signed(-3, 5)),
    (start_index => 12, end_index => 12, value => to_signed(-2, 5)),
    (start_index => 13, end_index => 13, value => to_signed(-1, 5)),
    (start_index => 14, end_index => 14, value => to_signed(1, 5)),
    (start_index => 15, end_index => 15, value => to_signed(3, 5)),
    (start_index => 16, end_index => 16, value => to_signed(5, 5)),
    (start_index => 17, end_index => 17, value => to_signed(8, 5)),
    (start_index => 18, end_index => 18, value => to_signed(10, 5)),
    (start_index => 19, end_index => 19, value => to_signed(12, 5)),
    (start_index => 20, end_index => 20, value => to_signed(14, 5)),
    (start_index => 21, end_index => 27, value => to_signed(15, 5)),
    (start_index => 28, end_index => 28, value => to_signed(14, 5)),
    (start_index => 29, end_index => 29, value => to_signed(13, 5)),
    (start_index => 30, end_index => 30, value => to_signed(11, 5)),
    (start_index => 31, end_index => 31, value => to_signed(8, 5)),
    (start_index => 32, end_index => 32, value => to_signed(6, 5)),
    (start_index => 33, end_index => 33, value => to_signed(4, 5)),
    (start_index => 34, end_index => 34, value => to_signed(2, 5)),
    (start_index => 35, end_index => 35, value => to_signed(-1, 5)),
    (start_index => 36, end_index => 36, value => to_signed(-3, 5)),
    (start_index => 37, end_index => 37, value => to_signed(-4, 5)),
    (start_index => 38, end_index => 38, value => to_signed(-6, 5)),
    (start_index => 39, end_index => 39, value => to_signed(-8, 5)),
    (start_index => 40, end_index => 40, value => to_signed(-9, 5)),
    (start_index => 41, end_index => 41, value => to_signed(-10, 5)),
    (start_index => 42, end_index => 43, value => to_signed(-11, 5)),
    (start_index => 44, end_index => 44, value => to_signed(-12, 5)),
    (start_index => 45, end_index => 46, value => to_signed(-13, 5)),
    (start_index => 47, end_index => 47, value => to_signed(-14, 5)),
    (start_index => 48, end_index => 48, value => to_signed(-15, 5)),
    (start_index => 49, end_index => 63, value => to_signed(-16, 5))
  );

  -- LUT for Layer 0, Input 14, Output 7
  constant LUT_0_14_7_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 0, value => to_signed(-1, 5)),
    (start_index => 1, end_index => 3, value => to_signed(-2, 5)),
    (start_index => 4, end_index => 7, value => to_signed(-3, 5)),
    (start_index => 8, end_index => 11, value => to_signed(-4, 5)),
    (start_index => 12, end_index => 12, value => to_signed(-5, 5)),
    (start_index => 13, end_index => 14, value => to_signed(-6, 5)),
    (start_index => 15, end_index => 15, value => to_signed(-7, 5)),
    (start_index => 16, end_index => 17, value => to_signed(-8, 5)),
    (start_index => 18, end_index => 21, value => to_signed(-9, 5)),
    (start_index => 22, end_index => 22, value => to_signed(-8, 5)),
    (start_index => 23, end_index => 23, value => to_signed(-7, 5)),
    (start_index => 24, end_index => 24, value => to_signed(-6, 5)),
    (start_index => 25, end_index => 25, value => to_signed(-4, 5)),
    (start_index => 26, end_index => 26, value => to_signed(-3, 5)),
    (start_index => 27, end_index => 27, value => to_signed(-1, 5)),
    (start_index => 28, end_index => 28, value => to_signed(0, 5)),
    (start_index => 29, end_index => 29, value => to_signed(2, 5)),
    (start_index => 30, end_index => 30, value => to_signed(3, 5)),
    (start_index => 31, end_index => 31, value => to_signed(4, 5)),
    (start_index => 32, end_index => 32, value => to_signed(5, 5)),
    (start_index => 33, end_index => 37, value => to_signed(6, 5)),
    (start_index => 38, end_index => 38, value => to_signed(5, 5)),
    (start_index => 39, end_index => 39, value => to_signed(4, 5)),
    (start_index => 40, end_index => 41, value => to_signed(3, 5)),
    (start_index => 42, end_index => 42, value => to_signed(2, 5)),
    (start_index => 43, end_index => 43, value => to_signed(1, 5)),
    (start_index => 44, end_index => 44, value => to_signed(0, 5)),
    (start_index => 45, end_index => 46, value => to_signed(-1, 5)),
    (start_index => 47, end_index => 49, value => to_signed(-2, 5)),
    (start_index => 50, end_index => 53, value => to_signed(-3, 5)),
    (start_index => 54, end_index => 56, value => to_signed(-4, 5)),
    (start_index => 57, end_index => 57, value => to_signed(-5, 5)),
    (start_index => 58, end_index => 58, value => to_signed(-6, 5)),
    (start_index => 59, end_index => 59, value => to_signed(-7, 5)),
    (start_index => 60, end_index => 60, value => to_signed(-8, 5)),
    (start_index => 61, end_index => 61, value => to_signed(-9, 5)),
    (start_index => 62, end_index => 62, value => to_signed(-10, 5)),
    (start_index => 63, end_index => 63, value => to_signed(-11, 5))
  );

  -- LUT for Layer 0, Input 15, Output 0
  constant LUT_0_15_0_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 1, value => to_signed(-3, 5)),
    (start_index => 2, end_index => 2, value => to_signed(-4, 5)),
    (start_index => 3, end_index => 3, value => to_signed(-5, 5)),
    (start_index => 4, end_index => 4, value => to_signed(-6, 5)),
    (start_index => 5, end_index => 6, value => to_signed(-7, 5)),
    (start_index => 7, end_index => 7, value => to_signed(-8, 5)),
    (start_index => 8, end_index => 9, value => to_signed(-9, 5)),
    (start_index => 10, end_index => 11, value => to_signed(-10, 5)),
    (start_index => 12, end_index => 16, value => to_signed(-11, 5)),
    (start_index => 17, end_index => 18, value => to_signed(-10, 5)),
    (start_index => 19, end_index => 19, value => to_signed(-9, 5)),
    (start_index => 20, end_index => 20, value => to_signed(-8, 5)),
    (start_index => 21, end_index => 21, value => to_signed(-7, 5)),
    (start_index => 22, end_index => 22, value => to_signed(-6, 5)),
    (start_index => 23, end_index => 23, value => to_signed(-5, 5)),
    (start_index => 24, end_index => 24, value => to_signed(-3, 5)),
    (start_index => 25, end_index => 25, value => to_signed(-2, 5)),
    (start_index => 26, end_index => 26, value => to_signed(-1, 5)),
    (start_index => 27, end_index => 27, value => to_signed(0, 5)),
    (start_index => 28, end_index => 29, value => to_signed(1, 5)),
    (start_index => 30, end_index => 30, value => to_signed(2, 5)),
    (start_index => 31, end_index => 33, value => to_signed(3, 5)),
    (start_index => 34, end_index => 38, value => to_signed(4, 5)),
    (start_index => 39, end_index => 41, value => to_signed(5, 5)),
    (start_index => 42, end_index => 43, value => to_signed(6, 5)),
    (start_index => 44, end_index => 45, value => to_signed(7, 5)),
    (start_index => 46, end_index => 47, value => to_signed(8, 5)),
    (start_index => 48, end_index => 50, value => to_signed(9, 5)),
    (start_index => 51, end_index => 52, value => to_signed(10, 5)),
    (start_index => 53, end_index => 55, value => to_signed(11, 5)),
    (start_index => 56, end_index => 63, value => to_signed(12, 5))
  );

  -- LUT for Layer 0, Input 15, Output 1
  constant LUT_0_15_1_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 14, value => to_signed(-1, 5)),
    (start_index => 15, end_index => 25, value => to_signed(-2, 5)),
    (start_index => 26, end_index => 30, value => to_signed(-1, 5)),
    (start_index => 31, end_index => 33, value => to_signed(0, 5)),
    (start_index => 34, end_index => 36, value => to_signed(1, 5)),
    (start_index => 37, end_index => 38, value => to_signed(2, 5)),
    (start_index => 39, end_index => 41, value => to_signed(3, 5)),
    (start_index => 42, end_index => 43, value => to_signed(4, 5)),
    (start_index => 44, end_index => 45, value => to_signed(5, 5)),
    (start_index => 46, end_index => 47, value => to_signed(6, 5)),
    (start_index => 48, end_index => 49, value => to_signed(7, 5)),
    (start_index => 50, end_index => 51, value => to_signed(8, 5)),
    (start_index => 52, end_index => 53, value => to_signed(9, 5)),
    (start_index => 54, end_index => 55, value => to_signed(10, 5)),
    (start_index => 56, end_index => 56, value => to_signed(11, 5)),
    (start_index => 57, end_index => 58, value => to_signed(12, 5)),
    (start_index => 59, end_index => 60, value => to_signed(13, 5)),
    (start_index => 61, end_index => 62, value => to_signed(14, 5)),
    (start_index => 63, end_index => 63, value => to_signed(15, 5))
  );

  -- LUT for Layer 0, Input 15, Output 2
  constant LUT_0_15_2_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 1, value => to_signed(-2, 5)),
    (start_index => 2, end_index => 3, value => to_signed(-3, 5)),
    (start_index => 4, end_index => 5, value => to_signed(-4, 5)),
    (start_index => 6, end_index => 7, value => to_signed(-5, 5)),
    (start_index => 8, end_index => 10, value => to_signed(-6, 5)),
    (start_index => 11, end_index => 15, value => to_signed(-7, 5)),
    (start_index => 16, end_index => 18, value => to_signed(-6, 5)),
    (start_index => 19, end_index => 20, value => to_signed(-5, 5)),
    (start_index => 21, end_index => 23, value => to_signed(-4, 5)),
    (start_index => 24, end_index => 25, value => to_signed(-3, 5)),
    (start_index => 26, end_index => 26, value => to_signed(-2, 5)),
    (start_index => 27, end_index => 28, value => to_signed(-1, 5)),
    (start_index => 29, end_index => 30, value => to_signed(0, 5)),
    (start_index => 31, end_index => 31, value => to_signed(1, 5)),
    (start_index => 32, end_index => 33, value => to_signed(2, 5)),
    (start_index => 34, end_index => 35, value => to_signed(3, 5)),
    (start_index => 36, end_index => 37, value => to_signed(4, 5)),
    (start_index => 38, end_index => 39, value => to_signed(5, 5)),
    (start_index => 40, end_index => 42, value => to_signed(6, 5)),
    (start_index => 43, end_index => 45, value => to_signed(7, 5)),
    (start_index => 46, end_index => 49, value => to_signed(8, 5)),
    (start_index => 50, end_index => 52, value => to_signed(9, 5)),
    (start_index => 53, end_index => 54, value => to_signed(10, 5)),
    (start_index => 55, end_index => 56, value => to_signed(11, 5)),
    (start_index => 57, end_index => 58, value => to_signed(12, 5)),
    (start_index => 59, end_index => 60, value => to_signed(13, 5)),
    (start_index => 61, end_index => 63, value => to_signed(14, 5))
  );

  -- LUT for Layer 0, Input 15, Output 3
  constant LUT_0_15_3_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 0, value => to_signed(-4, 5)),
    (start_index => 1, end_index => 1, value => to_signed(-5, 5)),
    (start_index => 2, end_index => 2, value => to_signed(-6, 5)),
    (start_index => 3, end_index => 3, value => to_signed(-7, 5)),
    (start_index => 4, end_index => 4, value => to_signed(-9, 5)),
    (start_index => 5, end_index => 5, value => to_signed(-10, 5)),
    (start_index => 6, end_index => 6, value => to_signed(-11, 5)),
    (start_index => 7, end_index => 7, value => to_signed(-12, 5)),
    (start_index => 8, end_index => 8, value => to_signed(-13, 5)),
    (start_index => 9, end_index => 10, value => to_signed(-14, 5)),
    (start_index => 11, end_index => 12, value => to_signed(-15, 5)),
    (start_index => 13, end_index => 14, value => to_signed(-14, 5)),
    (start_index => 15, end_index => 16, value => to_signed(-13, 5)),
    (start_index => 17, end_index => 17, value => to_signed(-12, 5)),
    (start_index => 18, end_index => 18, value => to_signed(-11, 5)),
    (start_index => 19, end_index => 19, value => to_signed(-10, 5)),
    (start_index => 20, end_index => 20, value => to_signed(-9, 5)),
    (start_index => 21, end_index => 21, value => to_signed(-7, 5)),
    (start_index => 22, end_index => 22, value => to_signed(-6, 5)),
    (start_index => 23, end_index => 23, value => to_signed(-5, 5)),
    (start_index => 24, end_index => 24, value => to_signed(-4, 5)),
    (start_index => 25, end_index => 26, value => to_signed(-3, 5)),
    (start_index => 27, end_index => 27, value => to_signed(-2, 5)),
    (start_index => 28, end_index => 28, value => to_signed(-1, 5)),
    (start_index => 29, end_index => 29, value => to_signed(0, 5)),
    (start_index => 30, end_index => 31, value => to_signed(1, 5)),
    (start_index => 32, end_index => 32, value => to_signed(2, 5)),
    (start_index => 33, end_index => 34, value => to_signed(3, 5)),
    (start_index => 35, end_index => 36, value => to_signed(4, 5)),
    (start_index => 37, end_index => 37, value => to_signed(5, 5)),
    (start_index => 38, end_index => 39, value => to_signed(6, 5)),
    (start_index => 40, end_index => 40, value => to_signed(7, 5)),
    (start_index => 41, end_index => 42, value => to_signed(8, 5)),
    (start_index => 43, end_index => 43, value => to_signed(9, 5)),
    (start_index => 44, end_index => 45, value => to_signed(10, 5)),
    (start_index => 46, end_index => 46, value => to_signed(11, 5)),
    (start_index => 47, end_index => 48, value => to_signed(12, 5)),
    (start_index => 49, end_index => 50, value => to_signed(13, 5)),
    (start_index => 51, end_index => 51, value => to_signed(14, 5)),
    (start_index => 52, end_index => 63, value => to_signed(15, 5))
  );

  -- LUT for Layer 0, Input 15, Output 4
  constant LUT_0_15_4_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 1, value => to_signed(-1, 5)),
    (start_index => 2, end_index => 5, value => to_signed(-2, 5)),
    (start_index => 6, end_index => 8, value => to_signed(-3, 5)),
    (start_index => 9, end_index => 11, value => to_signed(-4, 5)),
    (start_index => 12, end_index => 13, value => to_signed(-5, 5)),
    (start_index => 14, end_index => 15, value => to_signed(-6, 5)),
    (start_index => 16, end_index => 18, value => to_signed(-7, 5)),
    (start_index => 19, end_index => 19, value => to_signed(-8, 5)),
    (start_index => 20, end_index => 22, value => to_signed(-7, 5)),
    (start_index => 23, end_index => 24, value => to_signed(-6, 5)),
    (start_index => 25, end_index => 26, value => to_signed(-5, 5)),
    (start_index => 27, end_index => 27, value => to_signed(-4, 5)),
    (start_index => 28, end_index => 28, value => to_signed(-3, 5)),
    (start_index => 29, end_index => 29, value => to_signed(-2, 5)),
    (start_index => 30, end_index => 30, value => to_signed(-1, 5)),
    (start_index => 31, end_index => 31, value => to_signed(0, 5)),
    (start_index => 32, end_index => 33, value => to_signed(1, 5)),
    (start_index => 34, end_index => 34, value => to_signed(2, 5)),
    (start_index => 35, end_index => 35, value => to_signed(3, 5)),
    (start_index => 36, end_index => 36, value => to_signed(4, 5)),
    (start_index => 37, end_index => 37, value => to_signed(5, 5)),
    (start_index => 38, end_index => 38, value => to_signed(6, 5)),
    (start_index => 39, end_index => 39, value => to_signed(7, 5)),
    (start_index => 40, end_index => 40, value => to_signed(8, 5)),
    (start_index => 41, end_index => 42, value => to_signed(9, 5)),
    (start_index => 43, end_index => 43, value => to_signed(10, 5)),
    (start_index => 44, end_index => 44, value => to_signed(11, 5)),
    (start_index => 45, end_index => 46, value => to_signed(12, 5)),
    (start_index => 47, end_index => 48, value => to_signed(13, 5)),
    (start_index => 49, end_index => 50, value => to_signed(14, 5)),
    (start_index => 51, end_index => 54, value => to_signed(15, 5)),
    (start_index => 55, end_index => 60, value => to_signed(14, 5)),
    (start_index => 61, end_index => 63, value => to_signed(15, 5))
  );

  -- LUT for Layer 0, Input 15, Output 5
  constant LUT_0_15_5_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 0, value => to_signed(1, 5)),
    (start_index => 1, end_index => 3, value => to_signed(2, 5)),
    (start_index => 4, end_index => 8, value => to_signed(3, 5)),
    (start_index => 9, end_index => 15, value => to_signed(4, 5)),
    (start_index => 16, end_index => 19, value => to_signed(3, 5)),
    (start_index => 20, end_index => 23, value => to_signed(2, 5)),
    (start_index => 24, end_index => 28, value => to_signed(1, 5)),
    (start_index => 29, end_index => 32, value => to_signed(0, 5)),
    (start_index => 33, end_index => 34, value => to_signed(-1, 5)),
    (start_index => 35, end_index => 37, value => to_signed(-2, 5)),
    (start_index => 38, end_index => 40, value => to_signed(-3, 5)),
    (start_index => 41, end_index => 42, value => to_signed(-4, 5)),
    (start_index => 43, end_index => 45, value => to_signed(-5, 5)),
    (start_index => 46, end_index => 49, value => to_signed(-6, 5)),
    (start_index => 50, end_index => 52, value => to_signed(-7, 5)),
    (start_index => 53, end_index => 55, value => to_signed(-8, 5)),
    (start_index => 56, end_index => 57, value => to_signed(-9, 5)),
    (start_index => 58, end_index => 60, value => to_signed(-10, 5)),
    (start_index => 61, end_index => 62, value => to_signed(-11, 5)),
    (start_index => 63, end_index => 63, value => to_signed(-12, 5))
  );

  -- LUT for Layer 0, Input 15, Output 6
  constant LUT_0_15_6_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 3, value => to_signed(-2, 5)),
    (start_index => 4, end_index => 6, value => to_signed(-3, 5)),
    (start_index => 7, end_index => 9, value => to_signed(-4, 5)),
    (start_index => 10, end_index => 16, value => to_signed(-5, 5)),
    (start_index => 17, end_index => 19, value => to_signed(-4, 5)),
    (start_index => 20, end_index => 21, value => to_signed(-3, 5)),
    (start_index => 22, end_index => 24, value => to_signed(-2, 5)),
    (start_index => 25, end_index => 26, value => to_signed(-1, 5)),
    (start_index => 27, end_index => 28, value => to_signed(0, 5)),
    (start_index => 29, end_index => 31, value => to_signed(1, 5)),
    (start_index => 32, end_index => 34, value => to_signed(2, 5)),
    (start_index => 35, end_index => 37, value => to_signed(3, 5)),
    (start_index => 38, end_index => 40, value => to_signed(4, 5)),
    (start_index => 41, end_index => 44, value => to_signed(5, 5)),
    (start_index => 45, end_index => 47, value => to_signed(6, 5)),
    (start_index => 48, end_index => 50, value => to_signed(7, 5)),
    (start_index => 51, end_index => 53, value => to_signed(8, 5)),
    (start_index => 54, end_index => 55, value => to_signed(9, 5)),
    (start_index => 56, end_index => 57, value => to_signed(10, 5)),
    (start_index => 58, end_index => 59, value => to_signed(11, 5)),
    (start_index => 60, end_index => 61, value => to_signed(12, 5)),
    (start_index => 62, end_index => 62, value => to_signed(13, 5)),
    (start_index => 63, end_index => 63, value => to_signed(14, 5))
  );

  -- LUT for Layer 0, Input 15, Output 7
  constant LUT_0_15_7_MAP : lut_map_array_t_0 := (
    (start_index => 0, end_index => 1, value => to_signed(3, 5)),
    (start_index => 2, end_index => 2, value => to_signed(4, 5)),
    (start_index => 3, end_index => 4, value => to_signed(5, 5)),
    (start_index => 5, end_index => 5, value => to_signed(6, 5)),
    (start_index => 6, end_index => 7, value => to_signed(7, 5)),
    (start_index => 8, end_index => 11, value => to_signed(8, 5)),
    (start_index => 12, end_index => 16, value => to_signed(9, 5)),
    (start_index => 17, end_index => 19, value => to_signed(8, 5)),
    (start_index => 20, end_index => 21, value => to_signed(7, 5)),
    (start_index => 22, end_index => 22, value => to_signed(6, 5)),
    (start_index => 23, end_index => 24, value => to_signed(5, 5)),
    (start_index => 25, end_index => 25, value => to_signed(4, 5)),
    (start_index => 26, end_index => 27, value => to_signed(3, 5)),
    (start_index => 28, end_index => 28, value => to_signed(2, 5)),
    (start_index => 29, end_index => 29, value => to_signed(1, 5)),
    (start_index => 30, end_index => 31, value => to_signed(0, 5)),
    (start_index => 32, end_index => 32, value => to_signed(-1, 5)),
    (start_index => 33, end_index => 34, value => to_signed(-2, 5)),
    (start_index => 35, end_index => 35, value => to_signed(-3, 5)),
    (start_index => 36, end_index => 37, value => to_signed(-4, 5)),
    (start_index => 38, end_index => 39, value => to_signed(-5, 5)),
    (start_index => 40, end_index => 40, value => to_signed(-6, 5)),
    (start_index => 41, end_index => 41, value => to_signed(-7, 5)),
    (start_index => 42, end_index => 43, value => to_signed(-8, 5)),
    (start_index => 44, end_index => 45, value => to_signed(-9, 5)),
    (start_index => 46, end_index => 46, value => to_signed(-10, 5)),
    (start_index => 47, end_index => 48, value => to_signed(-11, 5)),
    (start_index => 49, end_index => 50, value => to_signed(-12, 5)),
    (start_index => 51, end_index => 53, value => to_signed(-13, 5)),
    (start_index => 54, end_index => 56, value => to_signed(-14, 5)),
    (start_index => 57, end_index => 60, value => to_signed(-15, 5)),
    (start_index => 61, end_index => 63, value => to_signed(-16, 5))
  );

  -- Layer 1
  subtype lut_output_t_1 is signed(7 downto 0);
  type range_map_t_1 is record
    start_index : integer;
    end_index : integer;
    value : lut_output_t_1;
  end record;
  type lut_map_array_t_1 is array (natural range <>) of range_map_t_1;


  -- LUT for Layer 1, Input 0, Output 0
  constant LUT_1_0_0_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 0, value => to_signed(-47, 8)),
    (start_index => 1, end_index => 1, value => to_signed(-46, 8)),
    (start_index => 2, end_index => 2, value => to_signed(-44, 8)),
    (start_index => 3, end_index => 3, value => to_signed(-42, 8)),
    (start_index => 4, end_index => 4, value => to_signed(-40, 8)),
    (start_index => 5, end_index => 5, value => to_signed(-37, 8)),
    (start_index => 6, end_index => 6, value => to_signed(-34, 8)),
    (start_index => 7, end_index => 7, value => to_signed(-30, 8)),
    (start_index => 8, end_index => 8, value => to_signed(-27, 8)),
    (start_index => 9, end_index => 9, value => to_signed(-25, 8)),
    (start_index => 10, end_index => 10, value => to_signed(-22, 8)),
    (start_index => 11, end_index => 11, value => to_signed(-19, 8)),
    (start_index => 12, end_index => 12, value => to_signed(-17, 8)),
    (start_index => 13, end_index => 13, value => to_signed(-15, 8)),
    (start_index => 14, end_index => 14, value => to_signed(-12, 8)),
    (start_index => 15, end_index => 15, value => to_signed(-10, 8)),
    (start_index => 16, end_index => 16, value => to_signed(-8, 8)),
    (start_index => 17, end_index => 17, value => to_signed(-6, 8)),
    (start_index => 18, end_index => 18, value => to_signed(-3, 8)),
    (start_index => 19, end_index => 19, value => to_signed(-1, 8)),
    (start_index => 20, end_index => 20, value => to_signed(2, 8)),
    (start_index => 21, end_index => 21, value => to_signed(4, 8)),
    (start_index => 22, end_index => 22, value => to_signed(7, 8)),
    (start_index => 23, end_index => 23, value => to_signed(10, 8)),
    (start_index => 24, end_index => 24, value => to_signed(13, 8)),
    (start_index => 25, end_index => 25, value => to_signed(17, 8)),
    (start_index => 26, end_index => 26, value => to_signed(21, 8)),
    (start_index => 27, end_index => 27, value => to_signed(25, 8)),
    (start_index => 28, end_index => 28, value => to_signed(30, 8)),
    (start_index => 29, end_index => 29, value => to_signed(34, 8)),
    (start_index => 30, end_index => 30, value => to_signed(38, 8)),
    (start_index => 31, end_index => 31, value => to_signed(42, 8))
  );

  -- LUT for Layer 1, Input 0, Output 1
  constant LUT_1_0_1_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 0, value => to_signed(-36, 8)),
    (start_index => 1, end_index => 1, value => to_signed(-33, 8)),
    (start_index => 2, end_index => 2, value => to_signed(-30, 8)),
    (start_index => 3, end_index => 3, value => to_signed(-26, 8)),
    (start_index => 4, end_index => 4, value => to_signed(-22, 8)),
    (start_index => 5, end_index => 5, value => to_signed(-18, 8)),
    (start_index => 6, end_index => 6, value => to_signed(-14, 8)),
    (start_index => 7, end_index => 7, value => to_signed(-10, 8)),
    (start_index => 8, end_index => 8, value => to_signed(-6, 8)),
    (start_index => 9, end_index => 9, value => to_signed(-3, 8)),
    (start_index => 10, end_index => 10, value => to_signed(0, 8)),
    (start_index => 11, end_index => 11, value => to_signed(2, 8)),
    (start_index => 12, end_index => 12, value => to_signed(4, 8)),
    (start_index => 13, end_index => 13, value => to_signed(6, 8)),
    (start_index => 14, end_index => 14, value => to_signed(8, 8)),
    (start_index => 15, end_index => 16, value => to_signed(9, 8)),
    (start_index => 17, end_index => 18, value => to_signed(10, 8)),
    (start_index => 19, end_index => 20, value => to_signed(9, 8)),
    (start_index => 21, end_index => 21, value => to_signed(8, 8)),
    (start_index => 22, end_index => 22, value => to_signed(7, 8)),
    (start_index => 23, end_index => 23, value => to_signed(6, 8)),
    (start_index => 24, end_index => 24, value => to_signed(4, 8)),
    (start_index => 25, end_index => 25, value => to_signed(3, 8)),
    (start_index => 26, end_index => 26, value => to_signed(2, 8)),
    (start_index => 27, end_index => 27, value => to_signed(1, 8)),
    (start_index => 28, end_index => 28, value => to_signed(0, 8)),
    (start_index => 29, end_index => 29, value => to_signed(-1, 8)),
    (start_index => 30, end_index => 31, value => to_signed(-3, 8))
  );

  -- LUT for Layer 1, Input 0, Output 2
  constant LUT_1_0_2_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 0, value => to_signed(23, 8)),
    (start_index => 1, end_index => 1, value => to_signed(22, 8)),
    (start_index => 2, end_index => 2, value => to_signed(21, 8)),
    (start_index => 3, end_index => 3, value => to_signed(19, 8)),
    (start_index => 4, end_index => 4, value => to_signed(18, 8)),
    (start_index => 5, end_index => 5, value => to_signed(16, 8)),
    (start_index => 6, end_index => 6, value => to_signed(14, 8)),
    (start_index => 7, end_index => 7, value => to_signed(12, 8)),
    (start_index => 8, end_index => 8, value => to_signed(10, 8)),
    (start_index => 9, end_index => 9, value => to_signed(8, 8)),
    (start_index => 10, end_index => 10, value => to_signed(6, 8)),
    (start_index => 11, end_index => 11, value => to_signed(4, 8)),
    (start_index => 12, end_index => 12, value => to_signed(1, 8)),
    (start_index => 13, end_index => 13, value => to_signed(-1, 8)),
    (start_index => 14, end_index => 14, value => to_signed(-3, 8)),
    (start_index => 15, end_index => 15, value => to_signed(-5, 8)),
    (start_index => 16, end_index => 16, value => to_signed(-7, 8)),
    (start_index => 17, end_index => 17, value => to_signed(-8, 8)),
    (start_index => 18, end_index => 18, value => to_signed(-10, 8)),
    (start_index => 19, end_index => 19, value => to_signed(-11, 8)),
    (start_index => 20, end_index => 20, value => to_signed(-13, 8)),
    (start_index => 21, end_index => 21, value => to_signed(-14, 8)),
    (start_index => 22, end_index => 22, value => to_signed(-15, 8)),
    (start_index => 23, end_index => 23, value => to_signed(-17, 8)),
    (start_index => 24, end_index => 24, value => to_signed(-19, 8)),
    (start_index => 25, end_index => 25, value => to_signed(-21, 8)),
    (start_index => 26, end_index => 26, value => to_signed(-24, 8)),
    (start_index => 27, end_index => 27, value => to_signed(-26, 8)),
    (start_index => 28, end_index => 28, value => to_signed(-29, 8)),
    (start_index => 29, end_index => 29, value => to_signed(-32, 8)),
    (start_index => 30, end_index => 30, value => to_signed(-35, 8)),
    (start_index => 31, end_index => 31, value => to_signed(-38, 8))
  );

  -- LUT for Layer 1, Input 0, Output 3
  constant LUT_1_0_3_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 0, value => to_signed(3, 8)),
    (start_index => 1, end_index => 1, value => to_signed(4, 8)),
    (start_index => 2, end_index => 3, value => to_signed(5, 8)),
    (start_index => 4, end_index => 5, value => to_signed(6, 8)),
    (start_index => 6, end_index => 13, value => to_signed(7, 8)),
    (start_index => 14, end_index => 16, value => to_signed(6, 8)),
    (start_index => 17, end_index => 18, value => to_signed(5, 8)),
    (start_index => 19, end_index => 20, value => to_signed(4, 8)),
    (start_index => 21, end_index => 21, value => to_signed(3, 8)),
    (start_index => 22, end_index => 22, value => to_signed(2, 8)),
    (start_index => 23, end_index => 23, value => to_signed(1, 8)),
    (start_index => 24, end_index => 24, value => to_signed(0, 8)),
    (start_index => 25, end_index => 25, value => to_signed(-2, 8)),
    (start_index => 26, end_index => 26, value => to_signed(-3, 8)),
    (start_index => 27, end_index => 27, value => to_signed(-5, 8)),
    (start_index => 28, end_index => 28, value => to_signed(-7, 8)),
    (start_index => 29, end_index => 29, value => to_signed(-9, 8)),
    (start_index => 30, end_index => 30, value => to_signed(-11, 8)),
    (start_index => 31, end_index => 31, value => to_signed(-13, 8))
  );

  -- LUT for Layer 1, Input 0, Output 4
  constant LUT_1_0_4_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 0, value => to_signed(-4, 8)),
    (start_index => 1, end_index => 7, value => to_signed(-5, 8)),
    (start_index => 8, end_index => 10, value => to_signed(-4, 8)),
    (start_index => 11, end_index => 12, value => to_signed(-3, 8)),
    (start_index => 13, end_index => 13, value => to_signed(-2, 8)),
    (start_index => 14, end_index => 15, value => to_signed(-1, 8)),
    (start_index => 16, end_index => 17, value => to_signed(0, 8)),
    (start_index => 18, end_index => 19, value => to_signed(1, 8)),
    (start_index => 20, end_index => 31, value => to_signed(2, 8))
  );

  -- LUT for Layer 1, Input 1, Output 0
  constant LUT_1_1_0_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 3, value => to_signed(-10, 8)),
    (start_index => 4, end_index => 6, value => to_signed(-11, 8)),
    (start_index => 7, end_index => 9, value => to_signed(-10, 8)),
    (start_index => 10, end_index => 11, value => to_signed(-9, 8)),
    (start_index => 12, end_index => 12, value => to_signed(-8, 8)),
    (start_index => 13, end_index => 13, value => to_signed(-7, 8)),
    (start_index => 14, end_index => 14, value => to_signed(-6, 8)),
    (start_index => 15, end_index => 15, value => to_signed(-5, 8)),
    (start_index => 16, end_index => 16, value => to_signed(-4, 8)),
    (start_index => 17, end_index => 17, value => to_signed(-3, 8)),
    (start_index => 18, end_index => 18, value => to_signed(-2, 8)),
    (start_index => 19, end_index => 19, value => to_signed(0, 8)),
    (start_index => 20, end_index => 20, value => to_signed(1, 8)),
    (start_index => 21, end_index => 21, value => to_signed(3, 8)),
    (start_index => 22, end_index => 22, value => to_signed(4, 8)),
    (start_index => 23, end_index => 23, value => to_signed(6, 8)),
    (start_index => 24, end_index => 24, value => to_signed(8, 8)),
    (start_index => 25, end_index => 25, value => to_signed(9, 8)),
    (start_index => 26, end_index => 26, value => to_signed(11, 8)),
    (start_index => 27, end_index => 27, value => to_signed(13, 8)),
    (start_index => 28, end_index => 28, value => to_signed(14, 8)),
    (start_index => 29, end_index => 29, value => to_signed(16, 8)),
    (start_index => 30, end_index => 30, value => to_signed(17, 8)),
    (start_index => 31, end_index => 31, value => to_signed(19, 8))
  );

  -- LUT for Layer 1, Input 1, Output 1
  constant LUT_1_1_1_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 1, value => to_signed(4, 8)),
    (start_index => 2, end_index => 4, value => to_signed(3, 8)),
    (start_index => 5, end_index => 6, value => to_signed(2, 8)),
    (start_index => 7, end_index => 8, value => to_signed(1, 8)),
    (start_index => 9, end_index => 9, value => to_signed(0, 8)),
    (start_index => 10, end_index => 11, value => to_signed(-1, 8)),
    (start_index => 12, end_index => 17, value => to_signed(-2, 8)),
    (start_index => 18, end_index => 19, value => to_signed(-1, 8)),
    (start_index => 20, end_index => 20, value => to_signed(0, 8)),
    (start_index => 21, end_index => 22, value => to_signed(1, 8)),
    (start_index => 23, end_index => 23, value => to_signed(2, 8)),
    (start_index => 24, end_index => 26, value => to_signed(3, 8)),
    (start_index => 27, end_index => 30, value => to_signed(4, 8)),
    (start_index => 31, end_index => 31, value => to_signed(3, 8))
  );

  -- LUT for Layer 1, Input 1, Output 2
  constant LUT_1_1_2_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 1, value => to_signed(-46, 8)),
    (start_index => 2, end_index => 2, value => to_signed(-44, 8)),
    (start_index => 3, end_index => 3, value => to_signed(-42, 8)),
    (start_index => 4, end_index => 4, value => to_signed(-39, 8)),
    (start_index => 5, end_index => 5, value => to_signed(-35, 8)),
    (start_index => 6, end_index => 6, value => to_signed(-31, 8)),
    (start_index => 7, end_index => 7, value => to_signed(-27, 8)),
    (start_index => 8, end_index => 8, value => to_signed(-22, 8)),
    (start_index => 9, end_index => 9, value => to_signed(-17, 8)),
    (start_index => 10, end_index => 10, value => to_signed(-12, 8)),
    (start_index => 11, end_index => 11, value => to_signed(-8, 8)),
    (start_index => 12, end_index => 12, value => to_signed(-3, 8)),
    (start_index => 13, end_index => 13, value => to_signed(1, 8)),
    (start_index => 14, end_index => 14, value => to_signed(5, 8)),
    (start_index => 15, end_index => 15, value => to_signed(8, 8)),
    (start_index => 16, end_index => 16, value => to_signed(10, 8)),
    (start_index => 17, end_index => 17, value => to_signed(11, 8)),
    (start_index => 18, end_index => 19, value => to_signed(12, 8)),
    (start_index => 20, end_index => 20, value => to_signed(11, 8)),
    (start_index => 21, end_index => 21, value => to_signed(9, 8)),
    (start_index => 22, end_index => 22, value => to_signed(7, 8)),
    (start_index => 23, end_index => 23, value => to_signed(5, 8)),
    (start_index => 24, end_index => 24, value => to_signed(2, 8)),
    (start_index => 25, end_index => 25, value => to_signed(-1, 8)),
    (start_index => 26, end_index => 26, value => to_signed(-4, 8)),
    (start_index => 27, end_index => 27, value => to_signed(-7, 8)),
    (start_index => 28, end_index => 28, value => to_signed(-10, 8)),
    (start_index => 29, end_index => 29, value => to_signed(-13, 8)),
    (start_index => 30, end_index => 30, value => to_signed(-15, 8)),
    (start_index => 31, end_index => 31, value => to_signed(-17, 8))
  );

  -- LUT for Layer 1, Input 1, Output 3
  constant LUT_1_1_3_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 0, value => to_signed(-8, 8)),
    (start_index => 1, end_index => 1, value => to_signed(-5, 8)),
    (start_index => 2, end_index => 2, value => to_signed(-3, 8)),
    (start_index => 3, end_index => 3, value => to_signed(0, 8)),
    (start_index => 4, end_index => 4, value => to_signed(3, 8)),
    (start_index => 5, end_index => 5, value => to_signed(5, 8)),
    (start_index => 6, end_index => 6, value => to_signed(8, 8)),
    (start_index => 7, end_index => 7, value => to_signed(9, 8)),
    (start_index => 8, end_index => 12, value => to_signed(11, 8)),
    (start_index => 13, end_index => 13, value => to_signed(10, 8)),
    (start_index => 14, end_index => 14, value => to_signed(9, 8)),
    (start_index => 15, end_index => 15, value => to_signed(8, 8)),
    (start_index => 16, end_index => 16, value => to_signed(6, 8)),
    (start_index => 17, end_index => 17, value => to_signed(5, 8)),
    (start_index => 18, end_index => 18, value => to_signed(3, 8)),
    (start_index => 19, end_index => 19, value => to_signed(2, 8)),
    (start_index => 20, end_index => 20, value => to_signed(0, 8)),
    (start_index => 21, end_index => 21, value => to_signed(-1, 8)),
    (start_index => 22, end_index => 22, value => to_signed(-3, 8)),
    (start_index => 23, end_index => 23, value => to_signed(-4, 8)),
    (start_index => 24, end_index => 24, value => to_signed(-6, 8)),
    (start_index => 25, end_index => 25, value => to_signed(-7, 8)),
    (start_index => 26, end_index => 26, value => to_signed(-9, 8)),
    (start_index => 27, end_index => 27, value => to_signed(-10, 8)),
    (start_index => 28, end_index => 28, value => to_signed(-11, 8)),
    (start_index => 29, end_index => 29, value => to_signed(-12, 8)),
    (start_index => 30, end_index => 30, value => to_signed(-13, 8)),
    (start_index => 31, end_index => 31, value => to_signed(-14, 8))
  );

  -- LUT for Layer 1, Input 1, Output 4
  constant LUT_1_1_4_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 0, value => to_signed(17, 8)),
    (start_index => 1, end_index => 2, value => to_signed(16, 8)),
    (start_index => 3, end_index => 3, value => to_signed(15, 8)),
    (start_index => 4, end_index => 4, value => to_signed(14, 8)),
    (start_index => 5, end_index => 5, value => to_signed(13, 8)),
    (start_index => 6, end_index => 6, value => to_signed(12, 8)),
    (start_index => 7, end_index => 7, value => to_signed(10, 8)),
    (start_index => 8, end_index => 8, value => to_signed(9, 8)),
    (start_index => 9, end_index => 9, value => to_signed(7, 8)),
    (start_index => 10, end_index => 10, value => to_signed(5, 8)),
    (start_index => 11, end_index => 11, value => to_signed(3, 8)),
    (start_index => 12, end_index => 12, value => to_signed(1, 8)),
    (start_index => 13, end_index => 13, value => to_signed(-2, 8)),
    (start_index => 14, end_index => 14, value => to_signed(-4, 8)),
    (start_index => 15, end_index => 15, value => to_signed(-6, 8)),
    (start_index => 16, end_index => 16, value => to_signed(-8, 8)),
    (start_index => 17, end_index => 17, value => to_signed(-9, 8)),
    (start_index => 18, end_index => 18, value => to_signed(-11, 8)),
    (start_index => 19, end_index => 19, value => to_signed(-13, 8)),
    (start_index => 20, end_index => 20, value => to_signed(-14, 8)),
    (start_index => 21, end_index => 21, value => to_signed(-15, 8)),
    (start_index => 22, end_index => 22, value => to_signed(-16, 8)),
    (start_index => 23, end_index => 23, value => to_signed(-17, 8)),
    (start_index => 24, end_index => 26, value => to_signed(-18, 8)),
    (start_index => 27, end_index => 28, value => to_signed(-19, 8)),
    (start_index => 29, end_index => 31, value => to_signed(-18, 8))
  );

  -- LUT for Layer 1, Input 2, Output 0
  constant LUT_1_2_0_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 0, value => to_signed(-28, 8)),
    (start_index => 1, end_index => 1, value => to_signed(-27, 8)),
    (start_index => 2, end_index => 2, value => to_signed(-26, 8)),
    (start_index => 3, end_index => 4, value => to_signed(-25, 8)),
    (start_index => 5, end_index => 5, value => to_signed(-24, 8)),
    (start_index => 6, end_index => 6, value => to_signed(-23, 8)),
    (start_index => 7, end_index => 8, value => to_signed(-22, 8)),
    (start_index => 9, end_index => 10, value => to_signed(-21, 8)),
    (start_index => 11, end_index => 11, value => to_signed(-20, 8)),
    (start_index => 12, end_index => 12, value => to_signed(-19, 8)),
    (start_index => 13, end_index => 13, value => to_signed(-18, 8)),
    (start_index => 14, end_index => 14, value => to_signed(-17, 8)),
    (start_index => 15, end_index => 15, value => to_signed(-16, 8)),
    (start_index => 16, end_index => 16, value => to_signed(-14, 8)),
    (start_index => 17, end_index => 17, value => to_signed(-11, 8)),
    (start_index => 18, end_index => 18, value => to_signed(-8, 8)),
    (start_index => 19, end_index => 19, value => to_signed(-5, 8)),
    (start_index => 20, end_index => 20, value => to_signed(-1, 8)),
    (start_index => 21, end_index => 21, value => to_signed(3, 8)),
    (start_index => 22, end_index => 22, value => to_signed(8, 8)),
    (start_index => 23, end_index => 23, value => to_signed(13, 8)),
    (start_index => 24, end_index => 24, value => to_signed(18, 8)),
    (start_index => 25, end_index => 25, value => to_signed(24, 8)),
    (start_index => 26, end_index => 26, value => to_signed(31, 8)),
    (start_index => 27, end_index => 27, value => to_signed(37, 8)),
    (start_index => 28, end_index => 28, value => to_signed(44, 8)),
    (start_index => 29, end_index => 29, value => to_signed(51, 8)),
    (start_index => 30, end_index => 30, value => to_signed(57, 8)),
    (start_index => 31, end_index => 31, value => to_signed(64, 8))
  );

  -- LUT for Layer 1, Input 2, Output 1
  constant LUT_1_2_1_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 0, value => to_signed(27, 8)),
    (start_index => 1, end_index => 1, value => to_signed(26, 8)),
    (start_index => 2, end_index => 2, value => to_signed(25, 8)),
    (start_index => 3, end_index => 3, value => to_signed(24, 8)),
    (start_index => 4, end_index => 4, value => to_signed(23, 8)),
    (start_index => 5, end_index => 5, value => to_signed(21, 8)),
    (start_index => 6, end_index => 6, value => to_signed(19, 8)),
    (start_index => 7, end_index => 7, value => to_signed(17, 8)),
    (start_index => 8, end_index => 8, value => to_signed(15, 8)),
    (start_index => 9, end_index => 9, value => to_signed(12, 8)),
    (start_index => 10, end_index => 10, value => to_signed(10, 8)),
    (start_index => 11, end_index => 11, value => to_signed(7, 8)),
    (start_index => 12, end_index => 12, value => to_signed(4, 8)),
    (start_index => 13, end_index => 13, value => to_signed(2, 8)),
    (start_index => 14, end_index => 14, value => to_signed(-1, 8)),
    (start_index => 15, end_index => 15, value => to_signed(-3, 8)),
    (start_index => 16, end_index => 16, value => to_signed(-5, 8)),
    (start_index => 17, end_index => 17, value => to_signed(-7, 8)),
    (start_index => 18, end_index => 18, value => to_signed(-9, 8)),
    (start_index => 19, end_index => 19, value => to_signed(-10, 8)),
    (start_index => 20, end_index => 20, value => to_signed(-12, 8)),
    (start_index => 21, end_index => 21, value => to_signed(-13, 8)),
    (start_index => 22, end_index => 22, value => to_signed(-14, 8)),
    (start_index => 23, end_index => 23, value => to_signed(-16, 8)),
    (start_index => 24, end_index => 24, value => to_signed(-17, 8)),
    (start_index => 25, end_index => 25, value => to_signed(-19, 8)),
    (start_index => 26, end_index => 26, value => to_signed(-20, 8)),
    (start_index => 27, end_index => 27, value => to_signed(-22, 8)),
    (start_index => 28, end_index => 28, value => to_signed(-24, 8)),
    (start_index => 29, end_index => 29, value => to_signed(-26, 8)),
    (start_index => 30, end_index => 30, value => to_signed(-29, 8)),
    (start_index => 31, end_index => 31, value => to_signed(-31, 8))
  );

  -- LUT for Layer 1, Input 2, Output 2
  constant LUT_1_2_2_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 0, value => to_signed(-11, 8)),
    (start_index => 1, end_index => 1, value => to_signed(-10, 8)),
    (start_index => 2, end_index => 2, value => to_signed(-9, 8)),
    (start_index => 3, end_index => 3, value => to_signed(-8, 8)),
    (start_index => 4, end_index => 4, value => to_signed(-6, 8)),
    (start_index => 5, end_index => 5, value => to_signed(-5, 8)),
    (start_index => 6, end_index => 6, value => to_signed(-4, 8)),
    (start_index => 7, end_index => 7, value => to_signed(-2, 8)),
    (start_index => 8, end_index => 8, value => to_signed(-1, 8)),
    (start_index => 9, end_index => 9, value => to_signed(1, 8)),
    (start_index => 10, end_index => 10, value => to_signed(2, 8)),
    (start_index => 11, end_index => 11, value => to_signed(4, 8)),
    (start_index => 12, end_index => 12, value => to_signed(5, 8)),
    (start_index => 13, end_index => 13, value => to_signed(6, 8)),
    (start_index => 14, end_index => 17, value => to_signed(7, 8)),
    (start_index => 18, end_index => 18, value => to_signed(6, 8)),
    (start_index => 19, end_index => 19, value => to_signed(4, 8)),
    (start_index => 20, end_index => 20, value => to_signed(3, 8)),
    (start_index => 21, end_index => 21, value => to_signed(1, 8)),
    (start_index => 22, end_index => 22, value => to_signed(-2, 8)),
    (start_index => 23, end_index => 23, value => to_signed(-5, 8)),
    (start_index => 24, end_index => 24, value => to_signed(-8, 8)),
    (start_index => 25, end_index => 25, value => to_signed(-12, 8)),
    (start_index => 26, end_index => 26, value => to_signed(-16, 8)),
    (start_index => 27, end_index => 27, value => to_signed(-20, 8)),
    (start_index => 28, end_index => 28, value => to_signed(-24, 8)),
    (start_index => 29, end_index => 29, value => to_signed(-29, 8)),
    (start_index => 30, end_index => 30, value => to_signed(-32, 8)),
    (start_index => 31, end_index => 31, value => to_signed(-36, 8))
  );

  -- LUT for Layer 1, Input 2, Output 3
  constant LUT_1_2_3_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 1, value => to_signed(-7, 8)),
    (start_index => 2, end_index => 2, value => to_signed(-6, 8)),
    (start_index => 3, end_index => 3, value => to_signed(-5, 8)),
    (start_index => 4, end_index => 4, value => to_signed(-4, 8)),
    (start_index => 5, end_index => 5, value => to_signed(-3, 8)),
    (start_index => 6, end_index => 6, value => to_signed(-2, 8)),
    (start_index => 7, end_index => 7, value => to_signed(0, 8)),
    (start_index => 8, end_index => 8, value => to_signed(1, 8)),
    (start_index => 9, end_index => 9, value => to_signed(2, 8)),
    (start_index => 10, end_index => 10, value => to_signed(3, 8)),
    (start_index => 11, end_index => 11, value => to_signed(4, 8)),
    (start_index => 12, end_index => 12, value => to_signed(6, 8)),
    (start_index => 13, end_index => 13, value => to_signed(7, 8)),
    (start_index => 14, end_index => 14, value => to_signed(8, 8)),
    (start_index => 15, end_index => 15, value => to_signed(9, 8)),
    (start_index => 16, end_index => 17, value => to_signed(10, 8)),
    (start_index => 18, end_index => 19, value => to_signed(11, 8)),
    (start_index => 20, end_index => 21, value => to_signed(10, 8)),
    (start_index => 22, end_index => 22, value => to_signed(8, 8)),
    (start_index => 23, end_index => 23, value => to_signed(6, 8)),
    (start_index => 24, end_index => 24, value => to_signed(3, 8)),
    (start_index => 25, end_index => 25, value => to_signed(0, 8)),
    (start_index => 26, end_index => 26, value => to_signed(-5, 8)),
    (start_index => 27, end_index => 27, value => to_signed(-10, 8)),
    (start_index => 28, end_index => 28, value => to_signed(-15, 8)),
    (start_index => 29, end_index => 29, value => to_signed(-21, 8)),
    (start_index => 30, end_index => 30, value => to_signed(-26, 8)),
    (start_index => 31, end_index => 31, value => to_signed(-31, 8))
  );

  -- LUT for Layer 1, Input 2, Output 4
  constant LUT_1_2_4_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 0, value => to_signed(5, 8)),
    (start_index => 1, end_index => 1, value => to_signed(6, 8)),
    (start_index => 2, end_index => 3, value => to_signed(7, 8)),
    (start_index => 4, end_index => 8, value => to_signed(8, 8)),
    (start_index => 9, end_index => 10, value => to_signed(7, 8)),
    (start_index => 11, end_index => 11, value => to_signed(6, 8)),
    (start_index => 12, end_index => 12, value => to_signed(5, 8)),
    (start_index => 13, end_index => 13, value => to_signed(4, 8)),
    (start_index => 14, end_index => 14, value => to_signed(3, 8)),
    (start_index => 15, end_index => 15, value => to_signed(2, 8)),
    (start_index => 16, end_index => 16, value => to_signed(1, 8)),
    (start_index => 17, end_index => 17, value => to_signed(0, 8)),
    (start_index => 18, end_index => 18, value => to_signed(-1, 8)),
    (start_index => 19, end_index => 19, value => to_signed(-2, 8)),
    (start_index => 20, end_index => 20, value => to_signed(-3, 8)),
    (start_index => 21, end_index => 22, value => to_signed(-4, 8)),
    (start_index => 23, end_index => 23, value => to_signed(-5, 8)),
    (start_index => 24, end_index => 25, value => to_signed(-6, 8)),
    (start_index => 26, end_index => 26, value => to_signed(-7, 8)),
    (start_index => 27, end_index => 28, value => to_signed(-8, 8)),
    (start_index => 29, end_index => 29, value => to_signed(-9, 8)),
    (start_index => 30, end_index => 31, value => to_signed(-10, 8))
  );

  -- LUT for Layer 1, Input 3, Output 0
  constant LUT_1_3_0_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 0, value => to_signed(-25, 8)),
    (start_index => 1, end_index => 1, value => to_signed(-23, 8)),
    (start_index => 2, end_index => 2, value => to_signed(-21, 8)),
    (start_index => 3, end_index => 3, value => to_signed(-19, 8)),
    (start_index => 4, end_index => 4, value => to_signed(-17, 8)),
    (start_index => 5, end_index => 5, value => to_signed(-14, 8)),
    (start_index => 6, end_index => 6, value => to_signed(-12, 8)),
    (start_index => 7, end_index => 7, value => to_signed(-9, 8)),
    (start_index => 8, end_index => 8, value => to_signed(-7, 8)),
    (start_index => 9, end_index => 9, value => to_signed(-5, 8)),
    (start_index => 10, end_index => 10, value => to_signed(-3, 8)),
    (start_index => 11, end_index => 11, value => to_signed(-1, 8)),
    (start_index => 12, end_index => 12, value => to_signed(1, 8)),
    (start_index => 13, end_index => 13, value => to_signed(2, 8)),
    (start_index => 14, end_index => 14, value => to_signed(3, 8)),
    (start_index => 15, end_index => 15, value => to_signed(4, 8)),
    (start_index => 16, end_index => 16, value => to_signed(5, 8)),
    (start_index => 17, end_index => 29, value => to_signed(6, 8)),
    (start_index => 30, end_index => 31, value => to_signed(7, 8))
  );

  -- LUT for Layer 1, Input 3, Output 1
  constant LUT_1_3_1_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 0, value => to_signed(17, 8)),
    (start_index => 1, end_index => 1, value => to_signed(16, 8)),
    (start_index => 2, end_index => 2, value => to_signed(15, 8)),
    (start_index => 3, end_index => 3, value => to_signed(13, 8)),
    (start_index => 4, end_index => 4, value => to_signed(12, 8)),
    (start_index => 5, end_index => 5, value => to_signed(11, 8)),
    (start_index => 6, end_index => 6, value => to_signed(9, 8)),
    (start_index => 7, end_index => 7, value => to_signed(8, 8)),
    (start_index => 8, end_index => 8, value => to_signed(6, 8)),
    (start_index => 9, end_index => 9, value => to_signed(5, 8)),
    (start_index => 10, end_index => 10, value => to_signed(4, 8)),
    (start_index => 11, end_index => 11, value => to_signed(2, 8)),
    (start_index => 12, end_index => 12, value => to_signed(1, 8)),
    (start_index => 13, end_index => 13, value => to_signed(0, 8)),
    (start_index => 14, end_index => 14, value => to_signed(-1, 8)),
    (start_index => 15, end_index => 15, value => to_signed(-2, 8)),
    (start_index => 16, end_index => 16, value => to_signed(-4, 8)),
    (start_index => 17, end_index => 17, value => to_signed(-5, 8)),
    (start_index => 18, end_index => 18, value => to_signed(-6, 8)),
    (start_index => 19, end_index => 19, value => to_signed(-7, 8)),
    (start_index => 20, end_index => 21, value => to_signed(-8, 8)),
    (start_index => 22, end_index => 22, value => to_signed(-9, 8)),
    (start_index => 23, end_index => 23, value => to_signed(-10, 8)),
    (start_index => 24, end_index => 24, value => to_signed(-11, 8)),
    (start_index => 25, end_index => 25, value => to_signed(-12, 8)),
    (start_index => 26, end_index => 26, value => to_signed(-13, 8)),
    (start_index => 27, end_index => 27, value => to_signed(-14, 8)),
    (start_index => 28, end_index => 29, value => to_signed(-16, 8)),
    (start_index => 30, end_index => 30, value => to_signed(-17, 8)),
    (start_index => 31, end_index => 31, value => to_signed(-18, 8))
  );

  -- LUT for Layer 1, Input 3, Output 2
  constant LUT_1_3_2_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 0, value => to_signed(-1, 8)),
    (start_index => 1, end_index => 1, value => to_signed(0, 8)),
    (start_index => 2, end_index => 2, value => to_signed(1, 8)),
    (start_index => 3, end_index => 3, value => to_signed(2, 8)),
    (start_index => 4, end_index => 4, value => to_signed(3, 8)),
    (start_index => 5, end_index => 5, value => to_signed(4, 8)),
    (start_index => 6, end_index => 6, value => to_signed(5, 8)),
    (start_index => 7, end_index => 8, value => to_signed(6, 8)),
    (start_index => 9, end_index => 11, value => to_signed(7, 8)),
    (start_index => 12, end_index => 13, value => to_signed(6, 8)),
    (start_index => 14, end_index => 14, value => to_signed(5, 8)),
    (start_index => 15, end_index => 15, value => to_signed(4, 8)),
    (start_index => 16, end_index => 16, value => to_signed(3, 8)),
    (start_index => 17, end_index => 17, value => to_signed(2, 8)),
    (start_index => 18, end_index => 18, value => to_signed(1, 8)),
    (start_index => 19, end_index => 19, value => to_signed(-1, 8)),
    (start_index => 20, end_index => 20, value => to_signed(-3, 8)),
    (start_index => 21, end_index => 21, value => to_signed(-5, 8)),
    (start_index => 22, end_index => 22, value => to_signed(-6, 8)),
    (start_index => 23, end_index => 23, value => to_signed(-8, 8)),
    (start_index => 24, end_index => 24, value => to_signed(-10, 8)),
    (start_index => 25, end_index => 25, value => to_signed(-12, 8)),
    (start_index => 26, end_index => 26, value => to_signed(-14, 8)),
    (start_index => 27, end_index => 27, value => to_signed(-15, 8)),
    (start_index => 28, end_index => 28, value => to_signed(-17, 8)),
    (start_index => 29, end_index => 29, value => to_signed(-18, 8)),
    (start_index => 30, end_index => 30, value => to_signed(-19, 8)),
    (start_index => 31, end_index => 31, value => to_signed(-20, 8))
  );

  -- LUT for Layer 1, Input 3, Output 3
  constant LUT_1_3_3_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 0, value => to_signed(18, 8)),
    (start_index => 1, end_index => 4, value => to_signed(17, 8)),
    (start_index => 5, end_index => 6, value => to_signed(16, 8)),
    (start_index => 7, end_index => 7, value => to_signed(15, 8)),
    (start_index => 8, end_index => 8, value => to_signed(14, 8)),
    (start_index => 9, end_index => 9, value => to_signed(13, 8)),
    (start_index => 10, end_index => 10, value => to_signed(12, 8)),
    (start_index => 11, end_index => 11, value => to_signed(11, 8)),
    (start_index => 12, end_index => 12, value => to_signed(10, 8)),
    (start_index => 13, end_index => 13, value => to_signed(8, 8)),
    (start_index => 14, end_index => 14, value => to_signed(6, 8)),
    (start_index => 15, end_index => 15, value => to_signed(4, 8)),
    (start_index => 16, end_index => 16, value => to_signed(2, 8)),
    (start_index => 17, end_index => 17, value => to_signed(0, 8)),
    (start_index => 18, end_index => 18, value => to_signed(-2, 8)),
    (start_index => 19, end_index => 19, value => to_signed(-5, 8)),
    (start_index => 20, end_index => 20, value => to_signed(-7, 8)),
    (start_index => 21, end_index => 21, value => to_signed(-10, 8)),
    (start_index => 22, end_index => 22, value => to_signed(-12, 8)),
    (start_index => 23, end_index => 23, value => to_signed(-15, 8)),
    (start_index => 24, end_index => 24, value => to_signed(-17, 8)),
    (start_index => 25, end_index => 25, value => to_signed(-19, 8)),
    (start_index => 26, end_index => 26, value => to_signed(-21, 8)),
    (start_index => 27, end_index => 27, value => to_signed(-23, 8)),
    (start_index => 28, end_index => 28, value => to_signed(-25, 8)),
    (start_index => 29, end_index => 29, value => to_signed(-27, 8)),
    (start_index => 30, end_index => 30, value => to_signed(-29, 8)),
    (start_index => 31, end_index => 31, value => to_signed(-30, 8))
  );

  -- LUT for Layer 1, Input 3, Output 4
  constant LUT_1_3_4_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 0, value => to_signed(-64, 8)),
    (start_index => 1, end_index => 1, value => to_signed(-63, 8)),
    (start_index => 2, end_index => 2, value => to_signed(-62, 8)),
    (start_index => 3, end_index => 3, value => to_signed(-60, 8)),
    (start_index => 4, end_index => 4, value => to_signed(-57, 8)),
    (start_index => 5, end_index => 5, value => to_signed(-54, 8)),
    (start_index => 6, end_index => 6, value => to_signed(-51, 8)),
    (start_index => 7, end_index => 7, value => to_signed(-47, 8)),
    (start_index => 8, end_index => 8, value => to_signed(-43, 8)),
    (start_index => 9, end_index => 9, value => to_signed(-39, 8)),
    (start_index => 10, end_index => 10, value => to_signed(-35, 8)),
    (start_index => 11, end_index => 11, value => to_signed(-30, 8)),
    (start_index => 12, end_index => 12, value => to_signed(-26, 8)),
    (start_index => 13, end_index => 13, value => to_signed(-22, 8)),
    (start_index => 14, end_index => 14, value => to_signed(-17, 8)),
    (start_index => 15, end_index => 15, value => to_signed(-13, 8)),
    (start_index => 16, end_index => 16, value => to_signed(-9, 8)),
    (start_index => 17, end_index => 17, value => to_signed(-5, 8)),
    (start_index => 18, end_index => 18, value => to_signed(0, 8)),
    (start_index => 19, end_index => 19, value => to_signed(4, 8)),
    (start_index => 20, end_index => 20, value => to_signed(8, 8)),
    (start_index => 21, end_index => 21, value => to_signed(11, 8)),
    (start_index => 22, end_index => 22, value => to_signed(15, 8)),
    (start_index => 23, end_index => 23, value => to_signed(19, 8)),
    (start_index => 24, end_index => 24, value => to_signed(22, 8)),
    (start_index => 25, end_index => 25, value => to_signed(25, 8)),
    (start_index => 26, end_index => 26, value => to_signed(28, 8)),
    (start_index => 27, end_index => 27, value => to_signed(31, 8)),
    (start_index => 28, end_index => 28, value => to_signed(33, 8)),
    (start_index => 29, end_index => 29, value => to_signed(36, 8)),
    (start_index => 30, end_index => 30, value => to_signed(38, 8)),
    (start_index => 31, end_index => 31, value => to_signed(40, 8))
  );

  -- LUT for Layer 1, Input 4, Output 0
  constant LUT_1_4_0_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 0, value => to_signed(-30, 8)),
    (start_index => 1, end_index => 1, value => to_signed(-31, 8)),
    (start_index => 2, end_index => 4, value => to_signed(-32, 8)),
    (start_index => 5, end_index => 6, value => to_signed(-31, 8)),
    (start_index => 7, end_index => 7, value => to_signed(-30, 8)),
    (start_index => 8, end_index => 8, value => to_signed(-28, 8)),
    (start_index => 9, end_index => 9, value => to_signed(-27, 8)),
    (start_index => 10, end_index => 10, value => to_signed(-25, 8)),
    (start_index => 11, end_index => 11, value => to_signed(-23, 8)),
    (start_index => 12, end_index => 12, value => to_signed(-21, 8)),
    (start_index => 13, end_index => 13, value => to_signed(-18, 8)),
    (start_index => 14, end_index => 14, value => to_signed(-16, 8)),
    (start_index => 15, end_index => 15, value => to_signed(-13, 8)),
    (start_index => 16, end_index => 16, value => to_signed(-11, 8)),
    (start_index => 17, end_index => 17, value => to_signed(-8, 8)),
    (start_index => 18, end_index => 18, value => to_signed(-5, 8)),
    (start_index => 19, end_index => 19, value => to_signed(-3, 8)),
    (start_index => 20, end_index => 20, value => to_signed(0, 8)),
    (start_index => 21, end_index => 21, value => to_signed(2, 8)),
    (start_index => 22, end_index => 22, value => to_signed(5, 8)),
    (start_index => 23, end_index => 23, value => to_signed(7, 8)),
    (start_index => 24, end_index => 24, value => to_signed(9, 8)),
    (start_index => 25, end_index => 25, value => to_signed(10, 8)),
    (start_index => 26, end_index => 26, value => to_signed(12, 8)),
    (start_index => 27, end_index => 27, value => to_signed(13, 8)),
    (start_index => 28, end_index => 28, value => to_signed(14, 8)),
    (start_index => 29, end_index => 29, value => to_signed(15, 8)),
    (start_index => 30, end_index => 31, value => to_signed(16, 8))
  );

  -- LUT for Layer 1, Input 4, Output 1
  constant LUT_1_4_1_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 1, value => to_signed(-15, 8)),
    (start_index => 2, end_index => 2, value => to_signed(-14, 8)),
    (start_index => 3, end_index => 3, value => to_signed(-13, 8)),
    (start_index => 4, end_index => 4, value => to_signed(-12, 8)),
    (start_index => 5, end_index => 5, value => to_signed(-11, 8)),
    (start_index => 6, end_index => 6, value => to_signed(-9, 8)),
    (start_index => 7, end_index => 7, value => to_signed(-8, 8)),
    (start_index => 8, end_index => 8, value => to_signed(-6, 8)),
    (start_index => 9, end_index => 9, value => to_signed(-5, 8)),
    (start_index => 10, end_index => 10, value => to_signed(-3, 8)),
    (start_index => 11, end_index => 11, value => to_signed(-2, 8)),
    (start_index => 12, end_index => 12, value => to_signed(-1, 8)),
    (start_index => 13, end_index => 13, value => to_signed(0, 8)),
    (start_index => 14, end_index => 14, value => to_signed(1, 8)),
    (start_index => 15, end_index => 18, value => to_signed(2, 8)),
    (start_index => 19, end_index => 19, value => to_signed(1, 8)),
    (start_index => 20, end_index => 21, value => to_signed(0, 8)),
    (start_index => 22, end_index => 22, value => to_signed(-1, 8)),
    (start_index => 23, end_index => 23, value => to_signed(-2, 8)),
    (start_index => 24, end_index => 24, value => to_signed(-3, 8)),
    (start_index => 25, end_index => 25, value => to_signed(-4, 8)),
    (start_index => 26, end_index => 27, value => to_signed(-5, 8)),
    (start_index => 28, end_index => 28, value => to_signed(-6, 8)),
    (start_index => 29, end_index => 30, value => to_signed(-7, 8)),
    (start_index => 31, end_index => 31, value => to_signed(-8, 8))
  );

  -- LUT for Layer 1, Input 4, Output 2
  constant LUT_1_4_2_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 1, value => to_signed(11, 8)),
    (start_index => 2, end_index => 2, value => to_signed(12, 8)),
    (start_index => 3, end_index => 3, value => to_signed(13, 8)),
    (start_index => 4, end_index => 8, value => to_signed(14, 8)),
    (start_index => 9, end_index => 9, value => to_signed(13, 8)),
    (start_index => 10, end_index => 10, value => to_signed(12, 8)),
    (start_index => 11, end_index => 11, value => to_signed(11, 8)),
    (start_index => 12, end_index => 12, value => to_signed(9, 8)),
    (start_index => 13, end_index => 13, value => to_signed(7, 8)),
    (start_index => 14, end_index => 14, value => to_signed(5, 8)),
    (start_index => 15, end_index => 15, value => to_signed(3, 8)),
    (start_index => 16, end_index => 16, value => to_signed(0, 8)),
    (start_index => 17, end_index => 17, value => to_signed(-2, 8)),
    (start_index => 18, end_index => 18, value => to_signed(-5, 8)),
    (start_index => 19, end_index => 19, value => to_signed(-8, 8)),
    (start_index => 20, end_index => 20, value => to_signed(-11, 8)),
    (start_index => 21, end_index => 21, value => to_signed(-14, 8)),
    (start_index => 22, end_index => 22, value => to_signed(-17, 8)),
    (start_index => 23, end_index => 23, value => to_signed(-19, 8)),
    (start_index => 24, end_index => 24, value => to_signed(-22, 8)),
    (start_index => 25, end_index => 25, value => to_signed(-24, 8)),
    (start_index => 26, end_index => 26, value => to_signed(-26, 8)),
    (start_index => 27, end_index => 27, value => to_signed(-27, 8)),
    (start_index => 28, end_index => 28, value => to_signed(-28, 8)),
    (start_index => 29, end_index => 29, value => to_signed(-29, 8)),
    (start_index => 30, end_index => 30, value => to_signed(-30, 8)),
    (start_index => 31, end_index => 31, value => to_signed(-31, 8))
  );

  -- LUT for Layer 1, Input 4, Output 3
  constant LUT_1_4_3_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 0, value => to_signed(35, 8)),
    (start_index => 1, end_index => 1, value => to_signed(34, 8)),
    (start_index => 2, end_index => 2, value => to_signed(33, 8)),
    (start_index => 3, end_index => 3, value => to_signed(31, 8)),
    (start_index => 4, end_index => 4, value => to_signed(30, 8)),
    (start_index => 5, end_index => 5, value => to_signed(28, 8)),
    (start_index => 6, end_index => 6, value => to_signed(25, 8)),
    (start_index => 7, end_index => 7, value => to_signed(23, 8)),
    (start_index => 8, end_index => 8, value => to_signed(20, 8)),
    (start_index => 9, end_index => 9, value => to_signed(18, 8)),
    (start_index => 10, end_index => 10, value => to_signed(15, 8)),
    (start_index => 11, end_index => 11, value => to_signed(12, 8)),
    (start_index => 12, end_index => 12, value => to_signed(9, 8)),
    (start_index => 13, end_index => 13, value => to_signed(6, 8)),
    (start_index => 14, end_index => 14, value => to_signed(3, 8)),
    (start_index => 15, end_index => 15, value => to_signed(0, 8)),
    (start_index => 16, end_index => 16, value => to_signed(-3, 8)),
    (start_index => 17, end_index => 17, value => to_signed(-6, 8)),
    (start_index => 18, end_index => 18, value => to_signed(-8, 8)),
    (start_index => 19, end_index => 19, value => to_signed(-11, 8)),
    (start_index => 20, end_index => 20, value => to_signed(-14, 8)),
    (start_index => 21, end_index => 21, value => to_signed(-16, 8)),
    (start_index => 22, end_index => 22, value => to_signed(-19, 8)),
    (start_index => 23, end_index => 23, value => to_signed(-22, 8)),
    (start_index => 24, end_index => 24, value => to_signed(-25, 8)),
    (start_index => 25, end_index => 25, value => to_signed(-28, 8)),
    (start_index => 26, end_index => 26, value => to_signed(-31, 8)),
    (start_index => 27, end_index => 27, value => to_signed(-35, 8)),
    (start_index => 28, end_index => 28, value => to_signed(-38, 8)),
    (start_index => 29, end_index => 29, value => to_signed(-42, 8)),
    (start_index => 30, end_index => 30, value => to_signed(-45, 8)),
    (start_index => 31, end_index => 31, value => to_signed(-49, 8))
  );

  -- LUT for Layer 1, Input 4, Output 4
  constant LUT_1_4_4_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 0, value => to_signed(-36, 8)),
    (start_index => 1, end_index => 1, value => to_signed(-35, 8)),
    (start_index => 2, end_index => 2, value => to_signed(-32, 8)),
    (start_index => 3, end_index => 3, value => to_signed(-29, 8)),
    (start_index => 4, end_index => 4, value => to_signed(-25, 8)),
    (start_index => 5, end_index => 5, value => to_signed(-22, 8)),
    (start_index => 6, end_index => 6, value => to_signed(-18, 8)),
    (start_index => 7, end_index => 7, value => to_signed(-13, 8)),
    (start_index => 8, end_index => 8, value => to_signed(-10, 8)),
    (start_index => 9, end_index => 9, value => to_signed(-6, 8)),
    (start_index => 10, end_index => 10, value => to_signed(-3, 8)),
    (start_index => 11, end_index => 11, value => to_signed(0, 8)),
    (start_index => 12, end_index => 12, value => to_signed(3, 8)),
    (start_index => 13, end_index => 13, value => to_signed(5, 8)),
    (start_index => 14, end_index => 14, value => to_signed(7, 8)),
    (start_index => 15, end_index => 15, value => to_signed(8, 8)),
    (start_index => 16, end_index => 16, value => to_signed(9, 8)),
    (start_index => 17, end_index => 17, value => to_signed(10, 8)),
    (start_index => 18, end_index => 19, value => to_signed(9, 8)),
    (start_index => 20, end_index => 20, value => to_signed(8, 8)),
    (start_index => 21, end_index => 21, value => to_signed(7, 8)),
    (start_index => 22, end_index => 22, value => to_signed(5, 8)),
    (start_index => 23, end_index => 23, value => to_signed(3, 8)),
    (start_index => 24, end_index => 24, value => to_signed(2, 8)),
    (start_index => 25, end_index => 25, value => to_signed(0, 8)),
    (start_index => 26, end_index => 26, value => to_signed(-2, 8)),
    (start_index => 27, end_index => 27, value => to_signed(-4, 8)),
    (start_index => 28, end_index => 28, value => to_signed(-5, 8)),
    (start_index => 29, end_index => 29, value => to_signed(-7, 8)),
    (start_index => 30, end_index => 30, value => to_signed(-9, 8)),
    (start_index => 31, end_index => 31, value => to_signed(-11, 8))
  );

  -- LUT for Layer 1, Input 5, Output 0
  constant LUT_1_5_0_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 1, value => to_signed(9, 8)),
    (start_index => 2, end_index => 2, value => to_signed(10, 8)),
    (start_index => 3, end_index => 4, value => to_signed(11, 8)),
    (start_index => 5, end_index => 9, value => to_signed(12, 8)),
    (start_index => 10, end_index => 10, value => to_signed(11, 8)),
    (start_index => 11, end_index => 11, value => to_signed(10, 8)),
    (start_index => 12, end_index => 12, value => to_signed(9, 8)),
    (start_index => 13, end_index => 13, value => to_signed(8, 8)),
    (start_index => 14, end_index => 14, value => to_signed(7, 8)),
    (start_index => 15, end_index => 15, value => to_signed(5, 8)),
    (start_index => 16, end_index => 16, value => to_signed(4, 8)),
    (start_index => 17, end_index => 17, value => to_signed(2, 8)),
    (start_index => 18, end_index => 18, value => to_signed(1, 8)),
    (start_index => 19, end_index => 19, value => to_signed(-1, 8)),
    (start_index => 20, end_index => 20, value => to_signed(-3, 8)),
    (start_index => 21, end_index => 21, value => to_signed(-4, 8)),
    (start_index => 22, end_index => 22, value => to_signed(-6, 8)),
    (start_index => 23, end_index => 23, value => to_signed(-7, 8)),
    (start_index => 24, end_index => 24, value => to_signed(-9, 8)),
    (start_index => 25, end_index => 25, value => to_signed(-10, 8)),
    (start_index => 26, end_index => 26, value => to_signed(-11, 8)),
    (start_index => 27, end_index => 27, value => to_signed(-13, 8)),
    (start_index => 28, end_index => 28, value => to_signed(-14, 8)),
    (start_index => 29, end_index => 29, value => to_signed(-15, 8)),
    (start_index => 30, end_index => 30, value => to_signed(-16, 8)),
    (start_index => 31, end_index => 31, value => to_signed(-17, 8))
  );

  -- LUT for Layer 1, Input 5, Output 1
  constant LUT_1_5_1_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 0, value => to_signed(15, 8)),
    (start_index => 1, end_index => 1, value => to_signed(14, 8)),
    (start_index => 2, end_index => 2, value => to_signed(13, 8)),
    (start_index => 3, end_index => 3, value => to_signed(12, 8)),
    (start_index => 4, end_index => 4, value => to_signed(10, 8)),
    (start_index => 5, end_index => 5, value => to_signed(9, 8)),
    (start_index => 6, end_index => 6, value => to_signed(8, 8)),
    (start_index => 7, end_index => 7, value => to_signed(6, 8)),
    (start_index => 8, end_index => 8, value => to_signed(5, 8)),
    (start_index => 9, end_index => 9, value => to_signed(3, 8)),
    (start_index => 10, end_index => 10, value => to_signed(2, 8)),
    (start_index => 11, end_index => 11, value => to_signed(0, 8)),
    (start_index => 12, end_index => 12, value => to_signed(-1, 8)),
    (start_index => 13, end_index => 13, value => to_signed(-3, 8)),
    (start_index => 14, end_index => 15, value => to_signed(-4, 8)),
    (start_index => 16, end_index => 19, value => to_signed(-5, 8)),
    (start_index => 20, end_index => 20, value => to_signed(-4, 8)),
    (start_index => 21, end_index => 22, value => to_signed(-3, 8)),
    (start_index => 23, end_index => 23, value => to_signed(-2, 8)),
    (start_index => 24, end_index => 24, value => to_signed(-1, 8)),
    (start_index => 25, end_index => 25, value => to_signed(0, 8)),
    (start_index => 26, end_index => 26, value => to_signed(1, 8)),
    (start_index => 27, end_index => 27, value => to_signed(2, 8)),
    (start_index => 28, end_index => 28, value => to_signed(3, 8)),
    (start_index => 29, end_index => 29, value => to_signed(4, 8)),
    (start_index => 30, end_index => 30, value => to_signed(5, 8)),
    (start_index => 31, end_index => 31, value => to_signed(6, 8))
  );

  -- LUT for Layer 1, Input 5, Output 2
  constant LUT_1_5_2_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 1, value => to_signed(-63, 8)),
    (start_index => 2, end_index => 2, value => to_signed(-62, 8)),
    (start_index => 3, end_index => 3, value => to_signed(-60, 8)),
    (start_index => 4, end_index => 4, value => to_signed(-58, 8)),
    (start_index => 5, end_index => 5, value => to_signed(-55, 8)),
    (start_index => 6, end_index => 6, value => to_signed(-51, 8)),
    (start_index => 7, end_index => 7, value => to_signed(-47, 8)),
    (start_index => 8, end_index => 8, value => to_signed(-42, 8)),
    (start_index => 9, end_index => 9, value => to_signed(-36, 8)),
    (start_index => 10, end_index => 10, value => to_signed(-31, 8)),
    (start_index => 11, end_index => 11, value => to_signed(-24, 8)),
    (start_index => 12, end_index => 12, value => to_signed(-18, 8)),
    (start_index => 13, end_index => 13, value => to_signed(-12, 8)),
    (start_index => 14, end_index => 14, value => to_signed(-6, 8)),
    (start_index => 15, end_index => 15, value => to_signed(0, 8)),
    (start_index => 16, end_index => 16, value => to_signed(6, 8)),
    (start_index => 17, end_index => 17, value => to_signed(11, 8)),
    (start_index => 18, end_index => 18, value => to_signed(16, 8)),
    (start_index => 19, end_index => 19, value => to_signed(20, 8)),
    (start_index => 20, end_index => 20, value => to_signed(24, 8)),
    (start_index => 21, end_index => 21, value => to_signed(27, 8)),
    (start_index => 22, end_index => 22, value => to_signed(29, 8)),
    (start_index => 23, end_index => 24, value => to_signed(31, 8)),
    (start_index => 25, end_index => 25, value => to_signed(32, 8)),
    (start_index => 26, end_index => 26, value => to_signed(31, 8)),
    (start_index => 27, end_index => 27, value => to_signed(30, 8)),
    (start_index => 28, end_index => 28, value => to_signed(28, 8)),
    (start_index => 29, end_index => 29, value => to_signed(26, 8)),
    (start_index => 30, end_index => 30, value => to_signed(25, 8)),
    (start_index => 31, end_index => 31, value => to_signed(23, 8))
  );

  -- LUT for Layer 1, Input 5, Output 3
  constant LUT_1_5_3_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 0, value => to_signed(-13, 8)),
    (start_index => 1, end_index => 1, value => to_signed(-7, 8)),
    (start_index => 2, end_index => 2, value => to_signed(-1, 8)),
    (start_index => 3, end_index => 3, value => to_signed(5, 8)),
    (start_index => 4, end_index => 4, value => to_signed(10, 8)),
    (start_index => 5, end_index => 5, value => to_signed(15, 8)),
    (start_index => 6, end_index => 6, value => to_signed(19, 8)),
    (start_index => 7, end_index => 7, value => to_signed(22, 8)),
    (start_index => 8, end_index => 8, value => to_signed(24, 8)),
    (start_index => 9, end_index => 10, value => to_signed(25, 8)),
    (start_index => 11, end_index => 11, value => to_signed(24, 8)),
    (start_index => 12, end_index => 12, value => to_signed(22, 8)),
    (start_index => 13, end_index => 13, value => to_signed(20, 8)),
    (start_index => 14, end_index => 14, value => to_signed(17, 8)),
    (start_index => 15, end_index => 15, value => to_signed(14, 8)),
    (start_index => 16, end_index => 16, value => to_signed(10, 8)),
    (start_index => 17, end_index => 17, value => to_signed(6, 8)),
    (start_index => 18, end_index => 18, value => to_signed(1, 8)),
    (start_index => 19, end_index => 19, value => to_signed(-3, 8)),
    (start_index => 20, end_index => 20, value => to_signed(-7, 8)),
    (start_index => 21, end_index => 21, value => to_signed(-11, 8)),
    (start_index => 22, end_index => 22, value => to_signed(-15, 8)),
    (start_index => 23, end_index => 23, value => to_signed(-18, 8)),
    (start_index => 24, end_index => 24, value => to_signed(-20, 8)),
    (start_index => 25, end_index => 28, value => to_signed(-22, 8)),
    (start_index => 29, end_index => 29, value => to_signed(-21, 8)),
    (start_index => 30, end_index => 30, value => to_signed(-20, 8)),
    (start_index => 31, end_index => 31, value => to_signed(-19, 8))
  );

  -- LUT for Layer 1, Input 5, Output 4
  constant LUT_1_5_4_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 0, value => to_signed(5, 8)),
    (start_index => 1, end_index => 1, value => to_signed(4, 8)),
    (start_index => 2, end_index => 2, value => to_signed(3, 8)),
    (start_index => 3, end_index => 3, value => to_signed(2, 8)),
    (start_index => 4, end_index => 4, value => to_signed(1, 8)),
    (start_index => 5, end_index => 5, value => to_signed(0, 8)),
    (start_index => 6, end_index => 6, value => to_signed(-1, 8)),
    (start_index => 7, end_index => 8, value => to_signed(-2, 8)),
    (start_index => 9, end_index => 18, value => to_signed(-3, 8)),
    (start_index => 19, end_index => 23, value => to_signed(-2, 8)),
    (start_index => 24, end_index => 29, value => to_signed(-1, 8)),
    (start_index => 30, end_index => 31, value => to_signed(-2, 8))
  );

  -- LUT for Layer 1, Input 6, Output 0
  constant LUT_1_6_0_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 1, value => to_signed(8, 8)),
    (start_index => 2, end_index => 6, value => to_signed(9, 8)),
    (start_index => 7, end_index => 7, value => to_signed(8, 8)),
    (start_index => 8, end_index => 8, value => to_signed(7, 8)),
    (start_index => 9, end_index => 9, value => to_signed(6, 8)),
    (start_index => 10, end_index => 10, value => to_signed(4, 8)),
    (start_index => 11, end_index => 11, value => to_signed(2, 8)),
    (start_index => 12, end_index => 12, value => to_signed(0, 8)),
    (start_index => 13, end_index => 13, value => to_signed(-2, 8)),
    (start_index => 14, end_index => 14, value => to_signed(-4, 8)),
    (start_index => 15, end_index => 15, value => to_signed(-6, 8)),
    (start_index => 16, end_index => 16, value => to_signed(-8, 8)),
    (start_index => 17, end_index => 17, value => to_signed(-10, 8)),
    (start_index => 18, end_index => 18, value => to_signed(-11, 8)),
    (start_index => 19, end_index => 19, value => to_signed(-12, 8)),
    (start_index => 20, end_index => 21, value => to_signed(-14, 8)),
    (start_index => 22, end_index => 25, value => to_signed(-15, 8)),
    (start_index => 26, end_index => 27, value => to_signed(-14, 8)),
    (start_index => 28, end_index => 28, value => to_signed(-13, 8)),
    (start_index => 29, end_index => 29, value => to_signed(-12, 8)),
    (start_index => 30, end_index => 30, value => to_signed(-11, 8)),
    (start_index => 31, end_index => 31, value => to_signed(-10, 8))
  );

  -- LUT for Layer 1, Input 6, Output 1
  constant LUT_1_6_1_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 0, value => to_signed(2, 8)),
    (start_index => 1, end_index => 2, value => to_signed(1, 8)),
    (start_index => 3, end_index => 3, value => to_signed(0, 8)),
    (start_index => 4, end_index => 4, value => to_signed(-1, 8)),
    (start_index => 5, end_index => 5, value => to_signed(-2, 8)),
    (start_index => 6, end_index => 6, value => to_signed(-3, 8)),
    (start_index => 7, end_index => 7, value => to_signed(-4, 8)),
    (start_index => 8, end_index => 8, value => to_signed(-5, 8)),
    (start_index => 9, end_index => 9, value => to_signed(-7, 8)),
    (start_index => 10, end_index => 10, value => to_signed(-8, 8)),
    (start_index => 11, end_index => 11, value => to_signed(-10, 8)),
    (start_index => 12, end_index => 12, value => to_signed(-11, 8)),
    (start_index => 13, end_index => 15, value => to_signed(-12, 8)),
    (start_index => 16, end_index => 16, value => to_signed(-11, 8)),
    (start_index => 17, end_index => 17, value => to_signed(-10, 8)),
    (start_index => 18, end_index => 18, value => to_signed(-8, 8)),
    (start_index => 19, end_index => 19, value => to_signed(-6, 8)),
    (start_index => 20, end_index => 20, value => to_signed(-3, 8)),
    (start_index => 21, end_index => 21, value => to_signed(0, 8)),
    (start_index => 22, end_index => 22, value => to_signed(3, 8)),
    (start_index => 23, end_index => 23, value => to_signed(6, 8)),
    (start_index => 24, end_index => 24, value => to_signed(9, 8)),
    (start_index => 25, end_index => 25, value => to_signed(11, 8)),
    (start_index => 26, end_index => 26, value => to_signed(14, 8)),
    (start_index => 27, end_index => 27, value => to_signed(16, 8)),
    (start_index => 28, end_index => 28, value => to_signed(18, 8)),
    (start_index => 29, end_index => 29, value => to_signed(19, 8)),
    (start_index => 30, end_index => 30, value => to_signed(21, 8)),
    (start_index => 31, end_index => 31, value => to_signed(22, 8))
  );

  -- LUT for Layer 1, Input 6, Output 2
  constant LUT_1_6_2_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 3, value => to_signed(-6, 8)),
    (start_index => 4, end_index => 4, value => to_signed(-5, 8)),
    (start_index => 5, end_index => 5, value => to_signed(-4, 8)),
    (start_index => 6, end_index => 6, value => to_signed(-3, 8)),
    (start_index => 7, end_index => 7, value => to_signed(-2, 8)),
    (start_index => 8, end_index => 8, value => to_signed(0, 8)),
    (start_index => 9, end_index => 9, value => to_signed(2, 8)),
    (start_index => 10, end_index => 10, value => to_signed(4, 8)),
    (start_index => 11, end_index => 11, value => to_signed(6, 8)),
    (start_index => 12, end_index => 12, value => to_signed(8, 8)),
    (start_index => 13, end_index => 13, value => to_signed(9, 8)),
    (start_index => 14, end_index => 15, value => to_signed(10, 8)),
    (start_index => 16, end_index => 16, value => to_signed(9, 8)),
    (start_index => 17, end_index => 17, value => to_signed(8, 8)),
    (start_index => 18, end_index => 18, value => to_signed(5, 8)),
    (start_index => 19, end_index => 19, value => to_signed(2, 8)),
    (start_index => 20, end_index => 20, value => to_signed(-2, 8)),
    (start_index => 21, end_index => 21, value => to_signed(-7, 8)),
    (start_index => 22, end_index => 22, value => to_signed(-12, 8)),
    (start_index => 23, end_index => 23, value => to_signed(-17, 8)),
    (start_index => 24, end_index => 24, value => to_signed(-23, 8)),
    (start_index => 25, end_index => 25, value => to_signed(-28, 8)),
    (start_index => 26, end_index => 26, value => to_signed(-34, 8)),
    (start_index => 27, end_index => 27, value => to_signed(-39, 8)),
    (start_index => 28, end_index => 28, value => to_signed(-44, 8)),
    (start_index => 29, end_index => 29, value => to_signed(-48, 8)),
    (start_index => 30, end_index => 30, value => to_signed(-52, 8)),
    (start_index => 31, end_index => 31, value => to_signed(-56, 8))
  );

  -- LUT for Layer 1, Input 6, Output 3
  constant LUT_1_6_3_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 6, value => to_signed(3, 8)),
    (start_index => 7, end_index => 8, value => to_signed(4, 8)),
    (start_index => 9, end_index => 9, value => to_signed(5, 8)),
    (start_index => 10, end_index => 10, value => to_signed(6, 8)),
    (start_index => 11, end_index => 11, value => to_signed(7, 8)),
    (start_index => 12, end_index => 12, value => to_signed(8, 8)),
    (start_index => 13, end_index => 13, value => to_signed(9, 8)),
    (start_index => 14, end_index => 14, value => to_signed(10, 8)),
    (start_index => 15, end_index => 15, value => to_signed(11, 8)),
    (start_index => 16, end_index => 17, value => to_signed(12, 8)),
    (start_index => 18, end_index => 18, value => to_signed(13, 8)),
    (start_index => 19, end_index => 20, value => to_signed(12, 8)),
    (start_index => 21, end_index => 21, value => to_signed(10, 8)),
    (start_index => 22, end_index => 22, value => to_signed(8, 8)),
    (start_index => 23, end_index => 23, value => to_signed(5, 8)),
    (start_index => 24, end_index => 24, value => to_signed(0, 8)),
    (start_index => 25, end_index => 25, value => to_signed(-6, 8)),
    (start_index => 26, end_index => 26, value => to_signed(-12, 8)),
    (start_index => 27, end_index => 27, value => to_signed(-20, 8)),
    (start_index => 28, end_index => 28, value => to_signed(-29, 8)),
    (start_index => 29, end_index => 29, value => to_signed(-37, 8)),
    (start_index => 30, end_index => 30, value => to_signed(-46, 8)),
    (start_index => 31, end_index => 31, value => to_signed(-55, 8))
  );

  -- LUT for Layer 1, Input 6, Output 4
  constant LUT_1_6_4_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 12, value => to_signed(-33, 8)),
    (start_index => 13, end_index => 13, value => to_signed(-32, 8)),
    (start_index => 14, end_index => 14, value => to_signed(-31, 8)),
    (start_index => 15, end_index => 15, value => to_signed(-29, 8)),
    (start_index => 16, end_index => 16, value => to_signed(-26, 8)),
    (start_index => 17, end_index => 17, value => to_signed(-23, 8)),
    (start_index => 18, end_index => 18, value => to_signed(-19, 8)),
    (start_index => 19, end_index => 19, value => to_signed(-14, 8)),
    (start_index => 20, end_index => 20, value => to_signed(-8, 8)),
    (start_index => 21, end_index => 21, value => to_signed(-2, 8)),
    (start_index => 22, end_index => 22, value => to_signed(3, 8)),
    (start_index => 23, end_index => 23, value => to_signed(9, 8)),
    (start_index => 24, end_index => 24, value => to_signed(15, 8)),
    (start_index => 25, end_index => 25, value => to_signed(21, 8)),
    (start_index => 26, end_index => 26, value => to_signed(26, 8)),
    (start_index => 27, end_index => 27, value => to_signed(31, 8)),
    (start_index => 28, end_index => 28, value => to_signed(36, 8)),
    (start_index => 29, end_index => 29, value => to_signed(40, 8)),
    (start_index => 30, end_index => 30, value => to_signed(44, 8)),
    (start_index => 31, end_index => 31, value => to_signed(48, 8))
  );

  -- LUT for Layer 1, Input 7, Output 0
  constant LUT_1_7_0_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 0, value => to_signed(10, 8)),
    (start_index => 1, end_index => 1, value => to_signed(11, 8)),
    (start_index => 2, end_index => 2, value => to_signed(12, 8)),
    (start_index => 3, end_index => 3, value => to_signed(13, 8)),
    (start_index => 4, end_index => 4, value => to_signed(14, 8)),
    (start_index => 5, end_index => 5, value => to_signed(15, 8)),
    (start_index => 6, end_index => 8, value => to_signed(16, 8)),
    (start_index => 9, end_index => 10, value => to_signed(15, 8)),
    (start_index => 11, end_index => 11, value => to_signed(14, 8)),
    (start_index => 12, end_index => 12, value => to_signed(12, 8)),
    (start_index => 13, end_index => 13, value => to_signed(10, 8)),
    (start_index => 14, end_index => 14, value => to_signed(8, 8)),
    (start_index => 15, end_index => 15, value => to_signed(6, 8)),
    (start_index => 16, end_index => 16, value => to_signed(4, 8)),
    (start_index => 17, end_index => 17, value => to_signed(1, 8)),
    (start_index => 18, end_index => 18, value => to_signed(-2, 8)),
    (start_index => 19, end_index => 19, value => to_signed(-6, 8)),
    (start_index => 20, end_index => 20, value => to_signed(-9, 8)),
    (start_index => 21, end_index => 21, value => to_signed(-13, 8)),
    (start_index => 22, end_index => 22, value => to_signed(-17, 8)),
    (start_index => 23, end_index => 23, value => to_signed(-21, 8)),
    (start_index => 24, end_index => 24, value => to_signed(-25, 8)),
    (start_index => 25, end_index => 25, value => to_signed(-30, 8)),
    (start_index => 26, end_index => 26, value => to_signed(-34, 8)),
    (start_index => 27, end_index => 27, value => to_signed(-38, 8)),
    (start_index => 28, end_index => 28, value => to_signed(-42, 8)),
    (start_index => 29, end_index => 29, value => to_signed(-46, 8)),
    (start_index => 30, end_index => 30, value => to_signed(-50, 8)),
    (start_index => 31, end_index => 31, value => to_signed(-54, 8))
  );

  -- LUT for Layer 1, Input 7, Output 1
  constant LUT_1_7_1_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 2, value => to_signed(14, 8)),
    (start_index => 3, end_index => 4, value => to_signed(15, 8)),
    (start_index => 5, end_index => 10, value => to_signed(16, 8)),
    (start_index => 11, end_index => 12, value => to_signed(15, 8)),
    (start_index => 13, end_index => 13, value => to_signed(13, 8)),
    (start_index => 14, end_index => 14, value => to_signed(12, 8)),
    (start_index => 15, end_index => 15, value => to_signed(10, 8)),
    (start_index => 16, end_index => 16, value => to_signed(8, 8)),
    (start_index => 17, end_index => 17, value => to_signed(4, 8)),
    (start_index => 18, end_index => 18, value => to_signed(1, 8)),
    (start_index => 19, end_index => 19, value => to_signed(-3, 8)),
    (start_index => 20, end_index => 20, value => to_signed(-8, 8)),
    (start_index => 21, end_index => 21, value => to_signed(-12, 8)),
    (start_index => 22, end_index => 22, value => to_signed(-18, 8)),
    (start_index => 23, end_index => 23, value => to_signed(-23, 8)),
    (start_index => 24, end_index => 24, value => to_signed(-28, 8)),
    (start_index => 25, end_index => 25, value => to_signed(-34, 8)),
    (start_index => 26, end_index => 26, value => to_signed(-40, 8)),
    (start_index => 27, end_index => 27, value => to_signed(-46, 8)),
    (start_index => 28, end_index => 28, value => to_signed(-52, 8)),
    (start_index => 29, end_index => 29, value => to_signed(-57, 8)),
    (start_index => 30, end_index => 30, value => to_signed(-63, 8)),
    (start_index => 31, end_index => 31, value => to_signed(-68, 8))
  );

  -- LUT for Layer 1, Input 7, Output 2
  constant LUT_1_7_2_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 0, value => to_signed(-28, 8)),
    (start_index => 1, end_index => 2, value => to_signed(-27, 8)),
    (start_index => 3, end_index => 3, value => to_signed(-26, 8)),
    (start_index => 4, end_index => 4, value => to_signed(-25, 8)),
    (start_index => 5, end_index => 5, value => to_signed(-24, 8)),
    (start_index => 6, end_index => 6, value => to_signed(-22, 8)),
    (start_index => 7, end_index => 7, value => to_signed(-21, 8)),
    (start_index => 8, end_index => 8, value => to_signed(-19, 8)),
    (start_index => 9, end_index => 9, value => to_signed(-17, 8)),
    (start_index => 10, end_index => 10, value => to_signed(-15, 8)),
    (start_index => 11, end_index => 11, value => to_signed(-13, 8)),
    (start_index => 12, end_index => 12, value => to_signed(-11, 8)),
    (start_index => 13, end_index => 13, value => to_signed(-9, 8)),
    (start_index => 14, end_index => 14, value => to_signed(-7, 8)),
    (start_index => 15, end_index => 15, value => to_signed(-5, 8)),
    (start_index => 16, end_index => 16, value => to_signed(-2, 8)),
    (start_index => 17, end_index => 17, value => to_signed(0, 8)),
    (start_index => 18, end_index => 18, value => to_signed(3, 8)),
    (start_index => 19, end_index => 19, value => to_signed(5, 8)),
    (start_index => 20, end_index => 20, value => to_signed(7, 8)),
    (start_index => 21, end_index => 21, value => to_signed(10, 8)),
    (start_index => 22, end_index => 22, value => to_signed(12, 8)),
    (start_index => 23, end_index => 23, value => to_signed(14, 8)),
    (start_index => 24, end_index => 24, value => to_signed(16, 8)),
    (start_index => 25, end_index => 25, value => to_signed(18, 8)),
    (start_index => 26, end_index => 26, value => to_signed(20, 8)),
    (start_index => 27, end_index => 27, value => to_signed(21, 8)),
    (start_index => 28, end_index => 28, value => to_signed(23, 8)),
    (start_index => 29, end_index => 29, value => to_signed(24, 8)),
    (start_index => 30, end_index => 30, value => to_signed(25, 8)),
    (start_index => 31, end_index => 31, value => to_signed(27, 8))
  );

  -- LUT for Layer 1, Input 7, Output 3
  constant LUT_1_7_3_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 4, value => to_signed(-1, 8)),
    (start_index => 5, end_index => 17, value => to_signed(0, 8)),
    (start_index => 18, end_index => 19, value => to_signed(1, 8)),
    (start_index => 20, end_index => 20, value => to_signed(2, 8)),
    (start_index => 21, end_index => 22, value => to_signed(3, 8)),
    (start_index => 23, end_index => 23, value => to_signed(4, 8)),
    (start_index => 24, end_index => 24, value => to_signed(5, 8)),
    (start_index => 25, end_index => 25, value => to_signed(6, 8)),
    (start_index => 26, end_index => 26, value => to_signed(7, 8)),
    (start_index => 27, end_index => 27, value => to_signed(8, 8)),
    (start_index => 28, end_index => 28, value => to_signed(9, 8)),
    (start_index => 29, end_index => 29, value => to_signed(10, 8)),
    (start_index => 30, end_index => 31, value => to_signed(11, 8))
  );

  -- LUT for Layer 1, Input 7, Output 4
  constant LUT_1_7_4_MAP : lut_map_array_t_1 := (
    (start_index => 0, end_index => 0, value => to_signed(-27, 8)),
    (start_index => 1, end_index => 2, value => to_signed(-28, 8)),
    (start_index => 3, end_index => 3, value => to_signed(-29, 8)),
    (start_index => 4, end_index => 5, value => to_signed(-28, 8)),
    (start_index => 6, end_index => 6, value => to_signed(-27, 8)),
    (start_index => 7, end_index => 7, value => to_signed(-26, 8)),
    (start_index => 8, end_index => 8, value => to_signed(-24, 8)),
    (start_index => 9, end_index => 9, value => to_signed(-22, 8)),
    (start_index => 10, end_index => 10, value => to_signed(-20, 8)),
    (start_index => 11, end_index => 11, value => to_signed(-17, 8)),
    (start_index => 12, end_index => 12, value => to_signed(-15, 8)),
    (start_index => 13, end_index => 13, value => to_signed(-12, 8)),
    (start_index => 14, end_index => 14, value => to_signed(-9, 8)),
    (start_index => 15, end_index => 15, value => to_signed(-6, 8)),
    (start_index => 16, end_index => 16, value => to_signed(-3, 8)),
    (start_index => 17, end_index => 17, value => to_signed(-1, 8)),
    (start_index => 18, end_index => 18, value => to_signed(1, 8)),
    (start_index => 19, end_index => 19, value => to_signed(3, 8)),
    (start_index => 20, end_index => 20, value => to_signed(5, 8)),
    (start_index => 21, end_index => 21, value => to_signed(6, 8)),
    (start_index => 22, end_index => 22, value => to_signed(8, 8)),
    (start_index => 23, end_index => 23, value => to_signed(9, 8)),
    (start_index => 24, end_index => 24, value => to_signed(10, 8)),
    (start_index => 25, end_index => 25, value => to_signed(11, 8)),
    (start_index => 26, end_index => 26, value => to_signed(12, 8)),
    (start_index => 27, end_index => 27, value => to_signed(13, 8)),
    (start_index => 28, end_index => 28, value => to_signed(14, 8)),
    (start_index => 29, end_index => 30, value => to_signed(15, 8)),
    (start_index => 31, end_index => 31, value => to_signed(16, 8))
  );
end package;