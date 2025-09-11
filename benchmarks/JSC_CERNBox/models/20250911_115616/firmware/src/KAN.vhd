library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.PkgKAN.all;
use work.PkgLUT.all;

entity KAN is
  port (
    clk    : in  std_logic;
    en     : in  std_logic := '1';
    input  : in  input_vec_t;
    output : out output_vec_t
  );
end entity;

architecture rtl of KAN is
  -- === auto: signal declarations ===
  -- Layer 0 (16->8)
  signal act_0_0_0, act_0_0_1, act_0_0_2, act_0_0_3, act_0_0_4, act_0_0_5, act_0_0_6, act_0_0_7, act_0_1_0, act_0_1_1, act_0_1_2, act_0_1_3, act_0_1_4, act_0_1_5, act_0_1_6, act_0_1_7 : lut_output_t_0;
  signal act_0_2_0, act_0_2_1, act_0_2_2, act_0_2_3, act_0_2_4, act_0_2_5, act_0_2_6, act_0_2_7, act_0_3_0, act_0_3_1, act_0_3_2, act_0_3_3, act_0_3_4, act_0_3_5, act_0_3_6, act_0_3_7 : lut_output_t_0;
  signal act_0_4_0, act_0_4_1, act_0_4_2, act_0_4_3, act_0_4_4, act_0_4_5, act_0_4_6, act_0_4_7, act_0_5_0, act_0_5_1, act_0_5_2, act_0_5_3, act_0_5_4, act_0_5_5, act_0_5_6, act_0_5_7 : lut_output_t_0;
  signal act_0_6_0, act_0_6_1, act_0_6_2, act_0_6_3, act_0_6_4, act_0_6_5, act_0_6_6, act_0_6_7, act_0_7_0, act_0_7_1, act_0_7_2, act_0_7_3, act_0_7_4, act_0_7_5, act_0_7_6, act_0_7_7 : lut_output_t_0;
  signal act_0_8_0, act_0_8_1, act_0_8_2, act_0_8_3, act_0_8_4, act_0_8_5, act_0_8_6, act_0_8_7, act_0_9_0, act_0_9_1, act_0_9_2, act_0_9_3, act_0_9_4, act_0_9_5, act_0_9_6, act_0_9_7 : lut_output_t_0;
  signal act_0_10_0, act_0_10_1, act_0_10_2, act_0_10_3, act_0_10_4, act_0_10_5, act_0_10_6, act_0_10_7, act_0_11_0, act_0_11_1, act_0_11_2, act_0_11_3, act_0_11_4, act_0_11_5, act_0_11_6, act_0_11_7 : lut_output_t_0;
  signal act_0_12_0, act_0_12_1, act_0_12_2, act_0_12_3, act_0_12_4, act_0_12_5, act_0_12_6, act_0_12_7, act_0_13_0, act_0_13_1, act_0_13_2, act_0_13_3, act_0_13_4, act_0_13_5, act_0_13_6, act_0_13_7 : lut_output_t_0;
  signal act_0_14_0, act_0_14_1, act_0_14_2, act_0_14_3, act_0_14_4, act_0_14_5, act_0_14_6, act_0_14_7, act_0_15_0, act_0_15_1, act_0_15_2, act_0_15_3, act_0_15_4, act_0_15_5, act_0_15_6, act_0_15_7 : lut_output_t_0;
  signal out0_0, out0_1, out0_2, out0_3, out0_4, out0_5, out0_6, out0_7 : lut_output_t_0;
  signal out0_0_q, out0_1_q, out0_2_q, out0_3_q, out0_4_q, out0_5_q, out0_6_q, out0_7_q : lut_output_t_0;
  signal sum_0_0 : sum_t_0_0;
  signal sum_0_1 : sum_t_0_1;
  signal sum_0_2 : sum_t_0_2;
  signal sum_0_3 : sum_t_0_3;
  signal sum_0_4 : sum_t_0_4;
  signal sum_0_5 : sum_t_0_5;
  signal sum_0_6 : sum_t_0_6;
  signal sum_0_7 : sum_t_0_7;

-- Layer 1 (8->5)
  signal act_1_0_0, act_1_0_1, act_1_0_2, act_1_0_3, act_1_0_4, act_1_1_0, act_1_1_1, act_1_1_2, act_1_1_3, act_1_1_4, act_1_2_0, act_1_2_1, act_1_2_2, act_1_2_3, act_1_2_4, act_1_3_0 : lut_output_t_1;
  signal act_1_3_1, act_1_3_2, act_1_3_3, act_1_3_4, act_1_4_0, act_1_4_1, act_1_4_2, act_1_4_3, act_1_4_4, act_1_5_0, act_1_5_1, act_1_5_2, act_1_5_3, act_1_5_4, act_1_6_0, act_1_6_1 : lut_output_t_1;
  signal act_1_6_2, act_1_6_3, act_1_6_4, act_1_7_0, act_1_7_1, act_1_7_2, act_1_7_3, act_1_7_4 : lut_output_t_1;
  signal sum_1_0 : sum_t_1_0;
  signal sum_1_1 : sum_t_1_1;
  signal sum_1_2 : sum_t_1_2;
  signal sum_1_3 : sum_t_1_3;
  signal sum_1_4 : sum_t_1_4;
begin

  -- === auto: layer blocks ===
  -- LAYER 0, ch 0
  gen_l0c0 : block
  begin
    i00 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_0_0_DATA) port map (clk, input(0), act_0_0_0);
    i01 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_1_0_DATA) port map (clk, input(1), act_0_1_0);
    i02 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_2_0_DATA) port map (clk, input(2), act_0_2_0);
    i03 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_3_0_DATA) port map (clk, input(3), act_0_3_0);
    i04 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_4_0_DATA) port map (clk, input(4), act_0_4_0);
    i05 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_5_0_DATA) port map (clk, input(5), act_0_5_0);
    i06 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_6_0_DATA) port map (clk, input(6), act_0_6_0);
    i07 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_7_0_DATA) port map (clk, input(7), act_0_7_0);
    i08 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_8_0_DATA) port map (clk, input(8), act_0_8_0);
    i09 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_9_0_DATA) port map (clk, input(9), act_0_9_0);
    i10 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_10_0_DATA) port map (clk, input(10), act_0_10_0);
    i11 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_11_0_DATA) port map (clk, input(11), act_0_11_0);
    i12 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_12_0_DATA) port map (clk, input(12), act_0_12_0);
    i13 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_13_0_DATA) port map (clk, input(13), act_0_13_0);
    i14 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_14_0_DATA) port map (clk, input(14), act_0_14_0);
    i15 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_15_0_DATA) port map (clk, input(15), act_0_15_0);
    sum_0_0 <= resize(act_0_0_0, SUM_WIDTH_0_0) + resize(act_0_1_0, SUM_WIDTH_0_0) + resize(act_0_2_0, SUM_WIDTH_0_0) + resize(act_0_3_0, SUM_WIDTH_0_0) + resize(act_0_4_0, SUM_WIDTH_0_0) + resize(act_0_5_0, SUM_WIDTH_0_0) + resize(act_0_6_0, SUM_WIDTH_0_0) + resize(act_0_7_0, SUM_WIDTH_0_0) + resize(act_0_8_0, SUM_WIDTH_0_0) + resize(act_0_9_0, SUM_WIDTH_0_0) + resize(act_0_10_0, SUM_WIDTH_0_0) + resize(act_0_11_0, SUM_WIDTH_0_0) + resize(act_0_12_0, SUM_WIDTH_0_0) + resize(act_0_13_0, SUM_WIDTH_0_0) + resize(act_0_14_0, SUM_WIDTH_0_0) + resize(act_0_15_0, SUM_WIDTH_0_0);
    out0_0 <= saturate(sum_0_0, 5);
  end block;

  -- LAYER 0, ch 1
  gen_l0c1 : block
  begin
    i00 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_0_1_DATA) port map (clk, input(0), act_0_0_1);
    i01 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_1_1_DATA) port map (clk, input(1), act_0_1_1);
    i02 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_2_1_DATA) port map (clk, input(2), act_0_2_1);
    i03 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_3_1_DATA) port map (clk, input(3), act_0_3_1);
    i04 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_4_1_DATA) port map (clk, input(4), act_0_4_1);
    i05 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_5_1_DATA) port map (clk, input(5), act_0_5_1);
    i06 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_6_1_DATA) port map (clk, input(6), act_0_6_1);
    i07 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_7_1_DATA) port map (clk, input(7), act_0_7_1);
    i08 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_8_1_DATA) port map (clk, input(8), act_0_8_1);
    i09 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_9_1_DATA) port map (clk, input(9), act_0_9_1);
    i10 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_10_1_DATA) port map (clk, input(10), act_0_10_1);
    i11 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_11_1_DATA) port map (clk, input(11), act_0_11_1);
    i12 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_12_1_DATA) port map (clk, input(12), act_0_12_1);
    i13 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_13_1_DATA) port map (clk, input(13), act_0_13_1);
    i14 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_14_1_DATA) port map (clk, input(14), act_0_14_1);
    i15 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_15_1_DATA) port map (clk, input(15), act_0_15_1);
    sum_0_1 <= resize(act_0_0_1, SUM_WIDTH_0_1) + resize(act_0_1_1, SUM_WIDTH_0_1) + resize(act_0_2_1, SUM_WIDTH_0_1) + resize(act_0_3_1, SUM_WIDTH_0_1) + resize(act_0_4_1, SUM_WIDTH_0_1) + resize(act_0_5_1, SUM_WIDTH_0_1) + resize(act_0_6_1, SUM_WIDTH_0_1) + resize(act_0_7_1, SUM_WIDTH_0_1) + resize(act_0_8_1, SUM_WIDTH_0_1) + resize(act_0_9_1, SUM_WIDTH_0_1) + resize(act_0_10_1, SUM_WIDTH_0_1) + resize(act_0_11_1, SUM_WIDTH_0_1) + resize(act_0_12_1, SUM_WIDTH_0_1) + resize(act_0_13_1, SUM_WIDTH_0_1) + resize(act_0_14_1, SUM_WIDTH_0_1) + resize(act_0_15_1, SUM_WIDTH_0_1);
    out0_1 <= saturate(sum_0_1, 5);
  end block;

  -- LAYER 0, ch 2
  gen_l0c2 : block
  begin
    i00 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_0_2_DATA) port map (clk, input(0), act_0_0_2);
    i01 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_1_2_DATA) port map (clk, input(1), act_0_1_2);
    i02 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_2_2_DATA) port map (clk, input(2), act_0_2_2);
    i03 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_3_2_DATA) port map (clk, input(3), act_0_3_2);
    i04 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_4_2_DATA) port map (clk, input(4), act_0_4_2);
    i05 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_5_2_DATA) port map (clk, input(5), act_0_5_2);
    i06 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_6_2_DATA) port map (clk, input(6), act_0_6_2);
    i07 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_7_2_DATA) port map (clk, input(7), act_0_7_2);
    i08 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_8_2_DATA) port map (clk, input(8), act_0_8_2);
    i09 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_9_2_DATA) port map (clk, input(9), act_0_9_2);
    i10 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_10_2_DATA) port map (clk, input(10), act_0_10_2);
    i11 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_11_2_DATA) port map (clk, input(11), act_0_11_2);
    i12 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_12_2_DATA) port map (clk, input(12), act_0_12_2);
    i13 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_13_2_DATA) port map (clk, input(13), act_0_13_2);
    i14 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_14_2_DATA) port map (clk, input(14), act_0_14_2);
    i15 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_15_2_DATA) port map (clk, input(15), act_0_15_2);
    sum_0_2 <= resize(act_0_0_2, SUM_WIDTH_0_2) + resize(act_0_1_2, SUM_WIDTH_0_2) + resize(act_0_2_2, SUM_WIDTH_0_2) + resize(act_0_3_2, SUM_WIDTH_0_2) + resize(act_0_4_2, SUM_WIDTH_0_2) + resize(act_0_5_2, SUM_WIDTH_0_2) + resize(act_0_6_2, SUM_WIDTH_0_2) + resize(act_0_7_2, SUM_WIDTH_0_2) + resize(act_0_8_2, SUM_WIDTH_0_2) + resize(act_0_9_2, SUM_WIDTH_0_2) + resize(act_0_10_2, SUM_WIDTH_0_2) + resize(act_0_11_2, SUM_WIDTH_0_2) + resize(act_0_12_2, SUM_WIDTH_0_2) + resize(act_0_13_2, SUM_WIDTH_0_2) + resize(act_0_14_2, SUM_WIDTH_0_2) + resize(act_0_15_2, SUM_WIDTH_0_2);
    out0_2 <= saturate(sum_0_2, 5);
  end block;

  -- LAYER 0, ch 3
  gen_l0c3 : block
  begin
    i00 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_0_3_DATA) port map (clk, input(0), act_0_0_3);
    i01 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_1_3_DATA) port map (clk, input(1), act_0_1_3);
    i02 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_2_3_DATA) port map (clk, input(2), act_0_2_3);
    i03 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_3_3_DATA) port map (clk, input(3), act_0_3_3);
    i04 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_4_3_DATA) port map (clk, input(4), act_0_4_3);
    i05 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_5_3_DATA) port map (clk, input(5), act_0_5_3);
    i06 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_6_3_DATA) port map (clk, input(6), act_0_6_3);
    i07 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_7_3_DATA) port map (clk, input(7), act_0_7_3);
    i08 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_8_3_DATA) port map (clk, input(8), act_0_8_3);
    i09 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_9_3_DATA) port map (clk, input(9), act_0_9_3);
    i10 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_10_3_DATA) port map (clk, input(10), act_0_10_3);
    i11 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_11_3_DATA) port map (clk, input(11), act_0_11_3);
    i12 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_12_3_DATA) port map (clk, input(12), act_0_12_3);
    i13 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_13_3_DATA) port map (clk, input(13), act_0_13_3);
    i14 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_14_3_DATA) port map (clk, input(14), act_0_14_3);
    i15 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_15_3_DATA) port map (clk, input(15), act_0_15_3);
    sum_0_3 <= resize(act_0_0_3, SUM_WIDTH_0_3) + resize(act_0_1_3, SUM_WIDTH_0_3) + resize(act_0_2_3, SUM_WIDTH_0_3) + resize(act_0_3_3, SUM_WIDTH_0_3) + resize(act_0_4_3, SUM_WIDTH_0_3) + resize(act_0_5_3, SUM_WIDTH_0_3) + resize(act_0_6_3, SUM_WIDTH_0_3) + resize(act_0_7_3, SUM_WIDTH_0_3) + resize(act_0_8_3, SUM_WIDTH_0_3) + resize(act_0_9_3, SUM_WIDTH_0_3) + resize(act_0_10_3, SUM_WIDTH_0_3) + resize(act_0_11_3, SUM_WIDTH_0_3) + resize(act_0_12_3, SUM_WIDTH_0_3) + resize(act_0_13_3, SUM_WIDTH_0_3) + resize(act_0_14_3, SUM_WIDTH_0_3) + resize(act_0_15_3, SUM_WIDTH_0_3);
    out0_3 <= saturate(sum_0_3, 5);
  end block;

  -- LAYER 0, ch 4
  gen_l0c4 : block
  begin
    i00 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_0_4_DATA) port map (clk, input(0), act_0_0_4);
    i01 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_1_4_DATA) port map (clk, input(1), act_0_1_4);
    i02 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_2_4_DATA) port map (clk, input(2), act_0_2_4);
    i03 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_3_4_DATA) port map (clk, input(3), act_0_3_4);
    i04 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_4_4_DATA) port map (clk, input(4), act_0_4_4);
    i05 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_5_4_DATA) port map (clk, input(5), act_0_5_4);
    i06 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_6_4_DATA) port map (clk, input(6), act_0_6_4);
    i07 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_7_4_DATA) port map (clk, input(7), act_0_7_4);
    i08 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_8_4_DATA) port map (clk, input(8), act_0_8_4);
    i09 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_9_4_DATA) port map (clk, input(9), act_0_9_4);
    i10 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_10_4_DATA) port map (clk, input(10), act_0_10_4);
    i11 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_11_4_DATA) port map (clk, input(11), act_0_11_4);
    i12 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_12_4_DATA) port map (clk, input(12), act_0_12_4);
    i13 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_13_4_DATA) port map (clk, input(13), act_0_13_4);
    i14 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_14_4_DATA) port map (clk, input(14), act_0_14_4);
    i15 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_15_4_DATA) port map (clk, input(15), act_0_15_4);
    sum_0_4 <= resize(act_0_0_4, SUM_WIDTH_0_4) + resize(act_0_1_4, SUM_WIDTH_0_4) + resize(act_0_2_4, SUM_WIDTH_0_4) + resize(act_0_3_4, SUM_WIDTH_0_4) + resize(act_0_4_4, SUM_WIDTH_0_4) + resize(act_0_5_4, SUM_WIDTH_0_4) + resize(act_0_6_4, SUM_WIDTH_0_4) + resize(act_0_7_4, SUM_WIDTH_0_4) + resize(act_0_8_4, SUM_WIDTH_0_4) + resize(act_0_9_4, SUM_WIDTH_0_4) + resize(act_0_10_4, SUM_WIDTH_0_4) + resize(act_0_11_4, SUM_WIDTH_0_4) + resize(act_0_12_4, SUM_WIDTH_0_4) + resize(act_0_13_4, SUM_WIDTH_0_4) + resize(act_0_14_4, SUM_WIDTH_0_4) + resize(act_0_15_4, SUM_WIDTH_0_4);
    out0_4 <= saturate(sum_0_4, 5);
  end block;

  -- LAYER 0, ch 5
  gen_l0c5 : block
  begin
    i00 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_0_5_DATA) port map (clk, input(0), act_0_0_5);
    i01 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_1_5_DATA) port map (clk, input(1), act_0_1_5);
    i02 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_2_5_DATA) port map (clk, input(2), act_0_2_5);
    i03 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_3_5_DATA) port map (clk, input(3), act_0_3_5);
    i04 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_4_5_DATA) port map (clk, input(4), act_0_4_5);
    i05 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_5_5_DATA) port map (clk, input(5), act_0_5_5);
    i06 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_6_5_DATA) port map (clk, input(6), act_0_6_5);
    i07 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_7_5_DATA) port map (clk, input(7), act_0_7_5);
    i08 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_8_5_DATA) port map (clk, input(8), act_0_8_5);
    i09 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_9_5_DATA) port map (clk, input(9), act_0_9_5);
    i10 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_10_5_DATA) port map (clk, input(10), act_0_10_5);
    i11 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_11_5_DATA) port map (clk, input(11), act_0_11_5);
    i12 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_12_5_DATA) port map (clk, input(12), act_0_12_5);
    i13 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_13_5_DATA) port map (clk, input(13), act_0_13_5);
    i14 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_14_5_DATA) port map (clk, input(14), act_0_14_5);
    i15 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_15_5_DATA) port map (clk, input(15), act_0_15_5);
    sum_0_5 <= resize(act_0_0_5, SUM_WIDTH_0_5) + resize(act_0_1_5, SUM_WIDTH_0_5) + resize(act_0_2_5, SUM_WIDTH_0_5) + resize(act_0_3_5, SUM_WIDTH_0_5) + resize(act_0_4_5, SUM_WIDTH_0_5) + resize(act_0_5_5, SUM_WIDTH_0_5) + resize(act_0_6_5, SUM_WIDTH_0_5) + resize(act_0_7_5, SUM_WIDTH_0_5) + resize(act_0_8_5, SUM_WIDTH_0_5) + resize(act_0_9_5, SUM_WIDTH_0_5) + resize(act_0_10_5, SUM_WIDTH_0_5) + resize(act_0_11_5, SUM_WIDTH_0_5) + resize(act_0_12_5, SUM_WIDTH_0_5) + resize(act_0_13_5, SUM_WIDTH_0_5) + resize(act_0_14_5, SUM_WIDTH_0_5) + resize(act_0_15_5, SUM_WIDTH_0_5);
    out0_5 <= saturate(sum_0_5, 5);
  end block;

  -- LAYER 0, ch 6
  gen_l0c6 : block
  begin
    i00 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_0_6_DATA) port map (clk, input(0), act_0_0_6);
    i01 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_1_6_DATA) port map (clk, input(1), act_0_1_6);
    i02 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_2_6_DATA) port map (clk, input(2), act_0_2_6);
    i03 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_3_6_DATA) port map (clk, input(3), act_0_3_6);
    i04 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_4_6_DATA) port map (clk, input(4), act_0_4_6);
    i05 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_5_6_DATA) port map (clk, input(5), act_0_5_6);
    i06 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_6_6_DATA) port map (clk, input(6), act_0_6_6);
    i07 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_7_6_DATA) port map (clk, input(7), act_0_7_6);
    i08 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_8_6_DATA) port map (clk, input(8), act_0_8_6);
    i09 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_9_6_DATA) port map (clk, input(9), act_0_9_6);
    i10 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_10_6_DATA) port map (clk, input(10), act_0_10_6);
    i11 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_11_6_DATA) port map (clk, input(11), act_0_11_6);
    i12 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_12_6_DATA) port map (clk, input(12), act_0_12_6);
    i13 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_13_6_DATA) port map (clk, input(13), act_0_13_6);
    i14 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_14_6_DATA) port map (clk, input(14), act_0_14_6);
    i15 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_15_6_DATA) port map (clk, input(15), act_0_15_6);
    sum_0_6 <= resize(act_0_0_6, SUM_WIDTH_0_6) + resize(act_0_1_6, SUM_WIDTH_0_6) + resize(act_0_2_6, SUM_WIDTH_0_6) + resize(act_0_3_6, SUM_WIDTH_0_6) + resize(act_0_4_6, SUM_WIDTH_0_6) + resize(act_0_5_6, SUM_WIDTH_0_6) + resize(act_0_6_6, SUM_WIDTH_0_6) + resize(act_0_7_6, SUM_WIDTH_0_6) + resize(act_0_8_6, SUM_WIDTH_0_6) + resize(act_0_9_6, SUM_WIDTH_0_6) + resize(act_0_10_6, SUM_WIDTH_0_6) + resize(act_0_11_6, SUM_WIDTH_0_6) + resize(act_0_12_6, SUM_WIDTH_0_6) + resize(act_0_13_6, SUM_WIDTH_0_6) + resize(act_0_14_6, SUM_WIDTH_0_6) + resize(act_0_15_6, SUM_WIDTH_0_6);
    out0_6 <= saturate(sum_0_6, 5);
  end block;

  -- LAYER 0, ch 7
  gen_l0c7 : block
  begin
    i00 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_0_7_DATA) port map (clk, input(0), act_0_0_7);
    i01 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_1_7_DATA) port map (clk, input(1), act_0_1_7);
    i02 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_2_7_DATA) port map (clk, input(2), act_0_2_7);
    i03 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_3_7_DATA) port map (clk, input(3), act_0_3_7);
    i04 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_4_7_DATA) port map (clk, input(4), act_0_4_7);
    i05 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_5_7_DATA) port map (clk, input(5), act_0_5_7);
    i06 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_6_7_DATA) port map (clk, input(6), act_0_6_7);
    i07 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_7_7_DATA) port map (clk, input(7), act_0_7_7);
    i08 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_8_7_DATA) port map (clk, input(8), act_0_8_7);
    i09 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_9_7_DATA) port map (clk, input(9), act_0_9_7);
    i10 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_10_7_DATA) port map (clk, input(10), act_0_10_7);
    i11 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_11_7_DATA) port map (clk, input(11), act_0_11_7);
    i12 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_12_7_DATA) port map (clk, input(12), act_0_12_7);
    i13 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_13_7_DATA) port map (clk, input(13), act_0_13_7);
    i14 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_14_7_DATA) port map (clk, input(14), act_0_14_7);
    i15 : entity work.LUT generic map (INPUT_WIDTH=>6, OUTPUT_WIDTH=>5, LUT_TABLE=>LUT_0_15_7_DATA) port map (clk, input(15), act_0_15_7);
    sum_0_7 <= resize(act_0_0_7, SUM_WIDTH_0_7) + resize(act_0_1_7, SUM_WIDTH_0_7) + resize(act_0_2_7, SUM_WIDTH_0_7) + resize(act_0_3_7, SUM_WIDTH_0_7) + resize(act_0_4_7, SUM_WIDTH_0_7) + resize(act_0_5_7, SUM_WIDTH_0_7) + resize(act_0_6_7, SUM_WIDTH_0_7) + resize(act_0_7_7, SUM_WIDTH_0_7) + resize(act_0_8_7, SUM_WIDTH_0_7) + resize(act_0_9_7, SUM_WIDTH_0_7) + resize(act_0_10_7, SUM_WIDTH_0_7) + resize(act_0_11_7, SUM_WIDTH_0_7) + resize(act_0_12_7, SUM_WIDTH_0_7) + resize(act_0_13_7, SUM_WIDTH_0_7) + resize(act_0_14_7, SUM_WIDTH_0_7) + resize(act_0_15_7, SUM_WIDTH_0_7);
    out0_7 <= saturate(sum_0_7, 5);
  end block;

  -- Register for output between layers
  out0_q_reg : process(clk) begin if rising_edge(clk) then
      out0_0_q <= out0_0;
      out0_1_q <= out0_1;
      out0_2_q <= out0_2;
      out0_3_q <= out0_3;
      out0_4_q <= out0_4;
      out0_5_q <= out0_5;
      out0_6_q <= out0_6;
      out0_7_q <= out0_7;
  end if; end process;

  -- LAYER 1, ch 0
  gen_l1c0 : block
  begin
    i00 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_0_0_DATA) port map (clk, out0_0_q, act_1_0_0);
    i01 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_1_0_DATA) port map (clk, out0_1_q, act_1_1_0);
    i02 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_2_0_DATA) port map (clk, out0_2_q, act_1_2_0);
    i03 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_3_0_DATA) port map (clk, out0_3_q, act_1_3_0);
    i04 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_4_0_DATA) port map (clk, out0_4_q, act_1_4_0);
    i05 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_5_0_DATA) port map (clk, out0_5_q, act_1_5_0);
    i06 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_6_0_DATA) port map (clk, out0_6_q, act_1_6_0);
    i07 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_7_0_DATA) port map (clk, out0_7_q, act_1_7_0);
    sum_1_0 <= resize(act_1_0_0, SUM_WIDTH_1_0) + resize(act_1_1_0, SUM_WIDTH_1_0) + resize(act_1_2_0, SUM_WIDTH_1_0) + resize(act_1_3_0, SUM_WIDTH_1_0) + resize(act_1_4_0, SUM_WIDTH_1_0) + resize(act_1_5_0, SUM_WIDTH_1_0) + resize(act_1_6_0, SUM_WIDTH_1_0) + resize(act_1_7_0, SUM_WIDTH_1_0);
    output(0) <= saturate(sum_1_0, 8);
  end block;

  -- LAYER 1, ch 1
  gen_l1c1 : block
  begin
    i00 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_0_1_DATA) port map (clk, out0_0_q, act_1_0_1);
    i01 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_1_1_DATA) port map (clk, out0_1_q, act_1_1_1);
    i02 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_2_1_DATA) port map (clk, out0_2_q, act_1_2_1);
    i03 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_3_1_DATA) port map (clk, out0_3_q, act_1_3_1);
    i04 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_4_1_DATA) port map (clk, out0_4_q, act_1_4_1);
    i05 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_5_1_DATA) port map (clk, out0_5_q, act_1_5_1);
    i06 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_6_1_DATA) port map (clk, out0_6_q, act_1_6_1);
    i07 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_7_1_DATA) port map (clk, out0_7_q, act_1_7_1);
    sum_1_1 <= resize(act_1_0_1, SUM_WIDTH_1_1) + resize(act_1_1_1, SUM_WIDTH_1_1) + resize(act_1_2_1, SUM_WIDTH_1_1) + resize(act_1_3_1, SUM_WIDTH_1_1) + resize(act_1_4_1, SUM_WIDTH_1_1) + resize(act_1_5_1, SUM_WIDTH_1_1) + resize(act_1_6_1, SUM_WIDTH_1_1) + resize(act_1_7_1, SUM_WIDTH_1_1);
    output(1) <= saturate(sum_1_1, 8);
  end block;

  -- LAYER 1, ch 2
  gen_l1c2 : block
  begin
    i00 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_0_2_DATA) port map (clk, out0_0_q, act_1_0_2);
    i01 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_1_2_DATA) port map (clk, out0_1_q, act_1_1_2);
    i02 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_2_2_DATA) port map (clk, out0_2_q, act_1_2_2);
    i03 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_3_2_DATA) port map (clk, out0_3_q, act_1_3_2);
    i04 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_4_2_DATA) port map (clk, out0_4_q, act_1_4_2);
    i05 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_5_2_DATA) port map (clk, out0_5_q, act_1_5_2);
    i06 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_6_2_DATA) port map (clk, out0_6_q, act_1_6_2);
    i07 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_7_2_DATA) port map (clk, out0_7_q, act_1_7_2);
    sum_1_2 <= resize(act_1_0_2, SUM_WIDTH_1_2) + resize(act_1_1_2, SUM_WIDTH_1_2) + resize(act_1_2_2, SUM_WIDTH_1_2) + resize(act_1_3_2, SUM_WIDTH_1_2) + resize(act_1_4_2, SUM_WIDTH_1_2) + resize(act_1_5_2, SUM_WIDTH_1_2) + resize(act_1_6_2, SUM_WIDTH_1_2) + resize(act_1_7_2, SUM_WIDTH_1_2);
    output(2) <= saturate(sum_1_2, 8);
  end block;

  -- LAYER 1, ch 3
  gen_l1c3 : block
  begin
    i00 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_0_3_DATA) port map (clk, out0_0_q, act_1_0_3);
    i01 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_1_3_DATA) port map (clk, out0_1_q, act_1_1_3);
    i02 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_2_3_DATA) port map (clk, out0_2_q, act_1_2_3);
    i03 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_3_3_DATA) port map (clk, out0_3_q, act_1_3_3);
    i04 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_4_3_DATA) port map (clk, out0_4_q, act_1_4_3);
    i05 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_5_3_DATA) port map (clk, out0_5_q, act_1_5_3);
    i06 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_6_3_DATA) port map (clk, out0_6_q, act_1_6_3);
    i07 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_7_3_DATA) port map (clk, out0_7_q, act_1_7_3);
    sum_1_3 <= resize(act_1_0_3, SUM_WIDTH_1_3) + resize(act_1_1_3, SUM_WIDTH_1_3) + resize(act_1_2_3, SUM_WIDTH_1_3) + resize(act_1_3_3, SUM_WIDTH_1_3) + resize(act_1_4_3, SUM_WIDTH_1_3) + resize(act_1_5_3, SUM_WIDTH_1_3) + resize(act_1_6_3, SUM_WIDTH_1_3) + resize(act_1_7_3, SUM_WIDTH_1_3);
    output(3) <= saturate(sum_1_3, 8);
  end block;

  -- LAYER 1, ch 4
  gen_l1c4 : block
  begin
    i00 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_0_4_DATA) port map (clk, out0_0_q, act_1_0_4);
    i01 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_1_4_DATA) port map (clk, out0_1_q, act_1_1_4);
    i02 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_2_4_DATA) port map (clk, out0_2_q, act_1_2_4);
    i03 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_3_4_DATA) port map (clk, out0_3_q, act_1_3_4);
    i04 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_4_4_DATA) port map (clk, out0_4_q, act_1_4_4);
    i05 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_5_4_DATA) port map (clk, out0_5_q, act_1_5_4);
    i06 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_6_4_DATA) port map (clk, out0_6_q, act_1_6_4);
    i07 : entity work.LUT generic map (INPUT_WIDTH=>5, OUTPUT_WIDTH=>8, LUT_TABLE=>LUT_1_7_4_DATA) port map (clk, out0_7_q, act_1_7_4);
    sum_1_4 <= resize(act_1_0_4, SUM_WIDTH_1_4) + resize(act_1_1_4, SUM_WIDTH_1_4) + resize(act_1_2_4, SUM_WIDTH_1_4) + resize(act_1_3_4, SUM_WIDTH_1_4) + resize(act_1_4_4, SUM_WIDTH_1_4) + resize(act_1_5_4, SUM_WIDTH_1_4) + resize(act_1_6_4, SUM_WIDTH_1_4) + resize(act_1_7_4, SUM_WIDTH_1_4);
    output(4) <= saturate(sum_1_4, 8);
  end block;

end architecture;