library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.PkgTypes.all;
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
  -- Layer 0 (16->4)
  signal act_0_0_0, act_0_0_1, act_0_0_2, act_0_0_3, act_0_1_0, act_0_1_1, act_0_1_2, act_0_1_3, act_0_2_0, act_0_2_1, act_0_2_2, act_0_2_3, act_0_3_0, act_0_3_1, act_0_3_2, act_0_3_3 : lut_output_t_0;
  signal act_0_4_0, act_0_4_1, act_0_4_2, act_0_4_3, act_0_5_0, act_0_5_1, act_0_5_2, act_0_5_3, act_0_6_0, act_0_6_1, act_0_6_2, act_0_6_3, act_0_7_0, act_0_7_1, act_0_7_2, act_0_7_3 : lut_output_t_0;
  signal act_0_8_0, act_0_8_1, act_0_8_2, act_0_8_3, act_0_9_0, act_0_9_1, act_0_9_2, act_0_9_3, act_0_10_0, act_0_10_1, act_0_10_2, act_0_10_3, act_0_11_0, act_0_11_1, act_0_11_2, act_0_11_3 : lut_output_t_0;
  signal act_0_12_0, act_0_12_1, act_0_12_2, act_0_12_3, act_0_13_0, act_0_13_1, act_0_13_2, act_0_13_3, act_0_14_0, act_0_14_1, act_0_14_2, act_0_14_3, act_0_15_0, act_0_15_1, act_0_15_2, act_0_15_3 : lut_output_t_0;
  signal out0_0, out0_1, out0_2, out0_3 : lut_output_t_0;
  signal sum_0_0, sum_0_1, sum_0_2, sum_0_3 : sum_t_0;

-- Layer 1 (4->5)
  signal act_1_0_0, act_1_0_1, act_1_0_2, act_1_0_3, act_1_0_4, act_1_1_0, act_1_1_1, act_1_1_2, act_1_1_3, act_1_1_4, act_1_2_0, act_1_2_1, act_1_2_2, act_1_2_3, act_1_2_4, act_1_3_0 : lut_output_t_1;
  signal act_1_3_1, act_1_3_2, act_1_3_3, act_1_3_4 : lut_output_t_1;
  signal sum_1_0, sum_1_1, sum_1_2, sum_1_3, sum_1_4 : sum_t_1;
begin

  -- === auto: layer blocks ===
  -- LAYER 0, ch 0
  gen_l0c0 : block
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_0.mem") port map (clk, input(0), act_0_0_0);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_0.mem") port map (clk, input(1), act_0_1_0);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_0.mem") port map (clk, input(2), act_0_2_0);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_0.mem") port map (clk, input(3), act_0_3_0);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_0.mem") port map (clk, input(4), act_0_4_0);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_0.mem") port map (clk, input(5), act_0_5_0);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_0.mem") port map (clk, input(6), act_0_6_0);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_0.mem") port map (clk, input(7), act_0_7_0);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_0.mem") port map (clk, input(8), act_0_8_0);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_0.mem") port map (clk, input(9), act_0_9_0);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_0.mem") port map (clk, input(10), act_0_10_0);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_0.mem") port map (clk, input(11), act_0_11_0);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_0.mem") port map (clk, input(12), act_0_12_0);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_0.mem") port map (clk, input(13), act_0_13_0);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_0.mem") port map (clk, input(14), act_0_14_0);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_0.mem") port map (clk, input(15), act_0_15_0);
    sum_0_0 <= resize(act_0_0_0, SUM_WIDTH_0) + resize(act_0_1_0, SUM_WIDTH_0) + resize(act_0_2_0, SUM_WIDTH_0) + resize(act_0_3_0, SUM_WIDTH_0) + resize(act_0_4_0, SUM_WIDTH_0) + resize(act_0_5_0, SUM_WIDTH_0) + resize(act_0_6_0, SUM_WIDTH_0) + resize(act_0_7_0, SUM_WIDTH_0) + resize(act_0_8_0, SUM_WIDTH_0) + resize(act_0_9_0, SUM_WIDTH_0) + resize(act_0_10_0, SUM_WIDTH_0) + resize(act_0_11_0, SUM_WIDTH_0) + resize(act_0_12_0, SUM_WIDTH_0) + resize(act_0_13_0, SUM_WIDTH_0) + resize(act_0_14_0, SUM_WIDTH_0) + resize(act_0_15_0, SUM_WIDTH_0);
    out0_0 <= saturate(sum_0_0, 8);
  end block;

  -- LAYER 0, ch 1
  gen_l0c1 : block
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_1.mem") port map (clk, input(0), act_0_0_1);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_1.mem") port map (clk, input(1), act_0_1_1);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_1.mem") port map (clk, input(2), act_0_2_1);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_1.mem") port map (clk, input(3), act_0_3_1);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_1.mem") port map (clk, input(4), act_0_4_1);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_1.mem") port map (clk, input(5), act_0_5_1);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_1.mem") port map (clk, input(6), act_0_6_1);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_1.mem") port map (clk, input(7), act_0_7_1);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_1.mem") port map (clk, input(8), act_0_8_1);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_1.mem") port map (clk, input(9), act_0_9_1);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_1.mem") port map (clk, input(10), act_0_10_1);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_1.mem") port map (clk, input(11), act_0_11_1);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_1.mem") port map (clk, input(12), act_0_12_1);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_1.mem") port map (clk, input(13), act_0_13_1);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_1.mem") port map (clk, input(14), act_0_14_1);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_1.mem") port map (clk, input(15), act_0_15_1);
    sum_0_1 <= resize(act_0_0_1, SUM_WIDTH_0) + resize(act_0_1_1, SUM_WIDTH_0) + resize(act_0_2_1, SUM_WIDTH_0) + resize(act_0_3_1, SUM_WIDTH_0) + resize(act_0_4_1, SUM_WIDTH_0) + resize(act_0_5_1, SUM_WIDTH_0) + resize(act_0_6_1, SUM_WIDTH_0) + resize(act_0_7_1, SUM_WIDTH_0) + resize(act_0_8_1, SUM_WIDTH_0) + resize(act_0_9_1, SUM_WIDTH_0) + resize(act_0_10_1, SUM_WIDTH_0) + resize(act_0_11_1, SUM_WIDTH_0) + resize(act_0_12_1, SUM_WIDTH_0) + resize(act_0_13_1, SUM_WIDTH_0) + resize(act_0_14_1, SUM_WIDTH_0) + resize(act_0_15_1, SUM_WIDTH_0);
    out0_1 <= saturate(sum_0_1, 8);
  end block;

  -- LAYER 0, ch 2
  gen_l0c2 : block
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_2.mem") port map (clk, input(0), act_0_0_2);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_2.mem") port map (clk, input(1), act_0_1_2);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_2.mem") port map (clk, input(2), act_0_2_2);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_2.mem") port map (clk, input(3), act_0_3_2);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_2.mem") port map (clk, input(4), act_0_4_2);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_2.mem") port map (clk, input(5), act_0_5_2);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_2.mem") port map (clk, input(6), act_0_6_2);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_2.mem") port map (clk, input(7), act_0_7_2);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_2.mem") port map (clk, input(8), act_0_8_2);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_2.mem") port map (clk, input(9), act_0_9_2);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_2.mem") port map (clk, input(10), act_0_10_2);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_2.mem") port map (clk, input(11), act_0_11_2);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_2.mem") port map (clk, input(12), act_0_12_2);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_2.mem") port map (clk, input(13), act_0_13_2);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_2.mem") port map (clk, input(14), act_0_14_2);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_2.mem") port map (clk, input(15), act_0_15_2);
    sum_0_2 <= resize(act_0_0_2, SUM_WIDTH_0) + resize(act_0_1_2, SUM_WIDTH_0) + resize(act_0_2_2, SUM_WIDTH_0) + resize(act_0_3_2, SUM_WIDTH_0) + resize(act_0_4_2, SUM_WIDTH_0) + resize(act_0_5_2, SUM_WIDTH_0) + resize(act_0_6_2, SUM_WIDTH_0) + resize(act_0_7_2, SUM_WIDTH_0) + resize(act_0_8_2, SUM_WIDTH_0) + resize(act_0_9_2, SUM_WIDTH_0) + resize(act_0_10_2, SUM_WIDTH_0) + resize(act_0_11_2, SUM_WIDTH_0) + resize(act_0_12_2, SUM_WIDTH_0) + resize(act_0_13_2, SUM_WIDTH_0) + resize(act_0_14_2, SUM_WIDTH_0) + resize(act_0_15_2, SUM_WIDTH_0);
    out0_2 <= saturate(sum_0_2, 8);
  end block;

  -- LAYER 0, ch 3
  gen_l0c3 : block
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_3.mem") port map (clk, input(0), act_0_0_3);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_3.mem") port map (clk, input(1), act_0_1_3);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_3.mem") port map (clk, input(2), act_0_2_3);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_3.mem") port map (clk, input(3), act_0_3_3);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_3.mem") port map (clk, input(4), act_0_4_3);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_3.mem") port map (clk, input(5), act_0_5_3);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_3.mem") port map (clk, input(6), act_0_6_3);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_3.mem") port map (clk, input(7), act_0_7_3);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_3.mem") port map (clk, input(8), act_0_8_3);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_3.mem") port map (clk, input(9), act_0_9_3);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_3.mem") port map (clk, input(10), act_0_10_3);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_3.mem") port map (clk, input(11), act_0_11_3);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_3.mem") port map (clk, input(12), act_0_12_3);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_3.mem") port map (clk, input(13), act_0_13_3);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_3.mem") port map (clk, input(14), act_0_14_3);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_3.mem") port map (clk, input(15), act_0_15_3);
    sum_0_3 <= resize(act_0_0_3, SUM_WIDTH_0) + resize(act_0_1_3, SUM_WIDTH_0) + resize(act_0_2_3, SUM_WIDTH_0) + resize(act_0_3_3, SUM_WIDTH_0) + resize(act_0_4_3, SUM_WIDTH_0) + resize(act_0_5_3, SUM_WIDTH_0) + resize(act_0_6_3, SUM_WIDTH_0) + resize(act_0_7_3, SUM_WIDTH_0) + resize(act_0_8_3, SUM_WIDTH_0) + resize(act_0_9_3, SUM_WIDTH_0) + resize(act_0_10_3, SUM_WIDTH_0) + resize(act_0_11_3, SUM_WIDTH_0) + resize(act_0_12_3, SUM_WIDTH_0) + resize(act_0_13_3, SUM_WIDTH_0) + resize(act_0_14_3, SUM_WIDTH_0) + resize(act_0_15_3, SUM_WIDTH_0);
    out0_3 <= saturate(sum_0_3, 8);
  end block;

  -- LAYER 1, ch 0
  gen_l1c0 : block
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_0.mem") port map (clk, out0_0, act_1_0_0);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_0.mem") port map (clk, out0_1, act_1_1_0);
    i02 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_2_0.mem") port map (clk, out0_2, act_1_2_0);
    i03 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_0.mem") port map (clk, out0_3, act_1_3_0);
    sum_1_0 <= resize(act_1_0_0, SUM_WIDTH_1) + resize(act_1_1_0, SUM_WIDTH_1) + resize(act_1_2_0, SUM_WIDTH_1) + resize(act_1_3_0, SUM_WIDTH_1);
    output(0) <= saturate(sum_1_0, 8);
  end block;

  -- LAYER 1, ch 1
  gen_l1c1 : block
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_1.mem") port map (clk, out0_0, act_1_0_1);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_1.mem") port map (clk, out0_1, act_1_1_1);
    i02 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_2_1.mem") port map (clk, out0_2, act_1_2_1);
    i03 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_1.mem") port map (clk, out0_3, act_1_3_1);
    sum_1_1 <= resize(act_1_0_1, SUM_WIDTH_1) + resize(act_1_1_1, SUM_WIDTH_1) + resize(act_1_2_1, SUM_WIDTH_1) + resize(act_1_3_1, SUM_WIDTH_1);
    output(1) <= saturate(sum_1_1, 8);
  end block;

  -- LAYER 1, ch 2
  gen_l1c2 : block
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_2.mem") port map (clk, out0_0, act_1_0_2);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_2.mem") port map (clk, out0_1, act_1_1_2);
    i02 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_2_2.mem") port map (clk, out0_2, act_1_2_2);
    i03 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_2.mem") port map (clk, out0_3, act_1_3_2);
    sum_1_2 <= resize(act_1_0_2, SUM_WIDTH_1) + resize(act_1_1_2, SUM_WIDTH_1) + resize(act_1_2_2, SUM_WIDTH_1) + resize(act_1_3_2, SUM_WIDTH_1);
    output(2) <= saturate(sum_1_2, 8);
  end block;

  -- LAYER 1, ch 3
  gen_l1c3 : block
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_3.mem") port map (clk, out0_0, act_1_0_3);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_3.mem") port map (clk, out0_1, act_1_1_3);
    i02 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_2_3.mem") port map (clk, out0_2, act_1_2_3);
    i03 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_3.mem") port map (clk, out0_3, act_1_3_3);
    sum_1_3 <= resize(act_1_0_3, SUM_WIDTH_1) + resize(act_1_1_3, SUM_WIDTH_1) + resize(act_1_2_3, SUM_WIDTH_1) + resize(act_1_3_3, SUM_WIDTH_1);
    output(3) <= saturate(sum_1_3, 8);
  end block;

  -- LAYER 1, ch 4
  gen_l1c4 : block
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_4.mem") port map (clk, out0_0, act_1_0_4);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_4.mem") port map (clk, out0_1, act_1_1_4);
    i02 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_2_4.mem") port map (clk, out0_2, act_1_2_4);
    i03 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_4.mem") port map (clk, out0_3, act_1_3_4);
    sum_1_4 <= resize(act_1_0_4, SUM_WIDTH_1) + resize(act_1_1_4, SUM_WIDTH_1) + resize(act_1_2_4, SUM_WIDTH_1) + resize(act_1_3_4, SUM_WIDTH_1);
    output(4) <= saturate(sum_1_4, 8);
  end block;

end architecture;