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
  -- Layer 0 (16->32)
  signal act_0_0_0, act_0_0_1, act_0_0_2, act_0_0_3, act_0_0_4, act_0_0_5, act_0_0_6, act_0_0_7, act_0_0_8, act_0_0_9, act_0_0_10, act_0_0_11, act_0_0_12, act_0_0_13, act_0_0_14, act_0_0_15 : lut_output_t_0;
  signal act_0_0_16, act_0_0_17, act_0_0_18, act_0_0_19, act_0_0_20, act_0_0_21, act_0_0_22, act_0_0_23, act_0_0_24, act_0_0_25, act_0_0_26, act_0_0_27, act_0_0_28, act_0_0_29, act_0_0_30, act_0_0_31 : lut_output_t_0;
  signal act_0_1_0, act_0_1_1, act_0_1_2, act_0_1_3, act_0_1_4, act_0_1_5, act_0_1_6, act_0_1_7, act_0_1_8, act_0_1_9, act_0_1_10, act_0_1_11, act_0_1_12, act_0_1_13, act_0_1_14, act_0_1_15 : lut_output_t_0;
  signal act_0_1_16, act_0_1_17, act_0_1_18, act_0_1_19, act_0_1_20, act_0_1_21, act_0_1_22, act_0_1_23, act_0_1_24, act_0_1_25, act_0_1_26, act_0_1_27, act_0_1_28, act_0_1_29, act_0_1_30, act_0_1_31 : lut_output_t_0;
  signal act_0_2_0, act_0_2_1, act_0_2_2, act_0_2_3, act_0_2_4, act_0_2_5, act_0_2_6, act_0_2_7, act_0_2_8, act_0_2_9, act_0_2_10, act_0_2_11, act_0_2_12, act_0_2_13, act_0_2_14, act_0_2_15 : lut_output_t_0;
  signal act_0_2_16, act_0_2_17, act_0_2_18, act_0_2_19, act_0_2_20, act_0_2_21, act_0_2_22, act_0_2_23, act_0_2_24, act_0_2_25, act_0_2_26, act_0_2_27, act_0_2_28, act_0_2_29, act_0_2_30, act_0_2_31 : lut_output_t_0;
  signal act_0_3_0, act_0_3_1, act_0_3_2, act_0_3_3, act_0_3_4, act_0_3_5, act_0_3_6, act_0_3_7, act_0_3_8, act_0_3_9, act_0_3_10, act_0_3_11, act_0_3_12, act_0_3_13, act_0_3_14, act_0_3_15 : lut_output_t_0;
  signal act_0_3_16, act_0_3_17, act_0_3_18, act_0_3_19, act_0_3_20, act_0_3_21, act_0_3_22, act_0_3_23, act_0_3_24, act_0_3_25, act_0_3_26, act_0_3_27, act_0_3_28, act_0_3_29, act_0_3_30, act_0_3_31 : lut_output_t_0;
  signal act_0_4_0, act_0_4_1, act_0_4_2, act_0_4_3, act_0_4_4, act_0_4_5, act_0_4_6, act_0_4_7, act_0_4_8, act_0_4_9, act_0_4_10, act_0_4_11, act_0_4_12, act_0_4_13, act_0_4_14, act_0_4_15 : lut_output_t_0;
  signal act_0_4_16, act_0_4_17, act_0_4_18, act_0_4_19, act_0_4_20, act_0_4_21, act_0_4_22, act_0_4_23, act_0_4_24, act_0_4_25, act_0_4_26, act_0_4_27, act_0_4_28, act_0_4_29, act_0_4_30, act_0_4_31 : lut_output_t_0;
  signal act_0_5_0, act_0_5_1, act_0_5_2, act_0_5_3, act_0_5_4, act_0_5_5, act_0_5_6, act_0_5_7, act_0_5_8, act_0_5_9, act_0_5_10, act_0_5_11, act_0_5_12, act_0_5_13, act_0_5_14, act_0_5_15 : lut_output_t_0;
  signal act_0_5_16, act_0_5_17, act_0_5_18, act_0_5_19, act_0_5_20, act_0_5_21, act_0_5_22, act_0_5_23, act_0_5_24, act_0_5_25, act_0_5_26, act_0_5_27, act_0_5_28, act_0_5_29, act_0_5_30, act_0_5_31 : lut_output_t_0;
  signal act_0_6_0, act_0_6_1, act_0_6_2, act_0_6_3, act_0_6_4, act_0_6_5, act_0_6_6, act_0_6_7, act_0_6_8, act_0_6_9, act_0_6_10, act_0_6_11, act_0_6_12, act_0_6_13, act_0_6_14, act_0_6_15 : lut_output_t_0;
  signal act_0_6_16, act_0_6_17, act_0_6_18, act_0_6_19, act_0_6_20, act_0_6_21, act_0_6_22, act_0_6_23, act_0_6_24, act_0_6_25, act_0_6_26, act_0_6_27, act_0_6_28, act_0_6_29, act_0_6_30, act_0_6_31 : lut_output_t_0;
  signal act_0_7_0, act_0_7_1, act_0_7_2, act_0_7_3, act_0_7_4, act_0_7_5, act_0_7_6, act_0_7_7, act_0_7_8, act_0_7_9, act_0_7_10, act_0_7_11, act_0_7_12, act_0_7_13, act_0_7_14, act_0_7_15 : lut_output_t_0;
  signal act_0_7_16, act_0_7_17, act_0_7_18, act_0_7_19, act_0_7_20, act_0_7_21, act_0_7_22, act_0_7_23, act_0_7_24, act_0_7_25, act_0_7_26, act_0_7_27, act_0_7_28, act_0_7_29, act_0_7_30, act_0_7_31 : lut_output_t_0;
  signal act_0_8_0, act_0_8_1, act_0_8_2, act_0_8_3, act_0_8_4, act_0_8_5, act_0_8_6, act_0_8_7, act_0_8_8, act_0_8_9, act_0_8_10, act_0_8_11, act_0_8_12, act_0_8_13, act_0_8_14, act_0_8_15 : lut_output_t_0;
  signal act_0_8_16, act_0_8_17, act_0_8_18, act_0_8_19, act_0_8_20, act_0_8_21, act_0_8_22, act_0_8_23, act_0_8_24, act_0_8_25, act_0_8_26, act_0_8_27, act_0_8_28, act_0_8_29, act_0_8_30, act_0_8_31 : lut_output_t_0;
  signal act_0_9_0, act_0_9_1, act_0_9_2, act_0_9_3, act_0_9_4, act_0_9_5, act_0_9_6, act_0_9_7, act_0_9_8, act_0_9_9, act_0_9_10, act_0_9_11, act_0_9_12, act_0_9_13, act_0_9_14, act_0_9_15 : lut_output_t_0;
  signal act_0_9_16, act_0_9_17, act_0_9_18, act_0_9_19, act_0_9_20, act_0_9_21, act_0_9_22, act_0_9_23, act_0_9_24, act_0_9_25, act_0_9_26, act_0_9_27, act_0_9_28, act_0_9_29, act_0_9_30, act_0_9_31 : lut_output_t_0;
  signal act_0_10_0, act_0_10_1, act_0_10_2, act_0_10_3, act_0_10_4, act_0_10_5, act_0_10_6, act_0_10_7, act_0_10_8, act_0_10_9, act_0_10_10, act_0_10_11, act_0_10_12, act_0_10_13, act_0_10_14, act_0_10_15 : lut_output_t_0;
  signal act_0_10_16, act_0_10_17, act_0_10_18, act_0_10_19, act_0_10_20, act_0_10_21, act_0_10_22, act_0_10_23, act_0_10_24, act_0_10_25, act_0_10_26, act_0_10_27, act_0_10_28, act_0_10_29, act_0_10_30, act_0_10_31 : lut_output_t_0;
  signal act_0_11_0, act_0_11_1, act_0_11_2, act_0_11_3, act_0_11_4, act_0_11_5, act_0_11_6, act_0_11_7, act_0_11_8, act_0_11_9, act_0_11_10, act_0_11_11, act_0_11_12, act_0_11_13, act_0_11_14, act_0_11_15 : lut_output_t_0;
  signal act_0_11_16, act_0_11_17, act_0_11_18, act_0_11_19, act_0_11_20, act_0_11_21, act_0_11_22, act_0_11_23, act_0_11_24, act_0_11_25, act_0_11_26, act_0_11_27, act_0_11_28, act_0_11_29, act_0_11_30, act_0_11_31 : lut_output_t_0;
  signal act_0_12_0, act_0_12_1, act_0_12_2, act_0_12_3, act_0_12_4, act_0_12_5, act_0_12_6, act_0_12_7, act_0_12_8, act_0_12_9, act_0_12_10, act_0_12_11, act_0_12_12, act_0_12_13, act_0_12_14, act_0_12_15 : lut_output_t_0;
  signal act_0_12_16, act_0_12_17, act_0_12_18, act_0_12_19, act_0_12_20, act_0_12_21, act_0_12_22, act_0_12_23, act_0_12_24, act_0_12_25, act_0_12_26, act_0_12_27, act_0_12_28, act_0_12_29, act_0_12_30, act_0_12_31 : lut_output_t_0;
  signal act_0_13_0, act_0_13_1, act_0_13_2, act_0_13_3, act_0_13_4, act_0_13_5, act_0_13_6, act_0_13_7, act_0_13_8, act_0_13_9, act_0_13_10, act_0_13_11, act_0_13_12, act_0_13_13, act_0_13_14, act_0_13_15 : lut_output_t_0;
  signal act_0_13_16, act_0_13_17, act_0_13_18, act_0_13_19, act_0_13_20, act_0_13_21, act_0_13_22, act_0_13_23, act_0_13_24, act_0_13_25, act_0_13_26, act_0_13_27, act_0_13_28, act_0_13_29, act_0_13_30, act_0_13_31 : lut_output_t_0;
  signal act_0_14_0, act_0_14_1, act_0_14_2, act_0_14_3, act_0_14_4, act_0_14_5, act_0_14_6, act_0_14_7, act_0_14_8, act_0_14_9, act_0_14_10, act_0_14_11, act_0_14_12, act_0_14_13, act_0_14_14, act_0_14_15 : lut_output_t_0;
  signal act_0_14_16, act_0_14_17, act_0_14_18, act_0_14_19, act_0_14_20, act_0_14_21, act_0_14_22, act_0_14_23, act_0_14_24, act_0_14_25, act_0_14_26, act_0_14_27, act_0_14_28, act_0_14_29, act_0_14_30, act_0_14_31 : lut_output_t_0;
  signal act_0_15_0, act_0_15_1, act_0_15_2, act_0_15_3, act_0_15_4, act_0_15_5, act_0_15_6, act_0_15_7, act_0_15_8, act_0_15_9, act_0_15_10, act_0_15_11, act_0_15_12, act_0_15_13, act_0_15_14, act_0_15_15 : lut_output_t_0;
  signal act_0_15_16, act_0_15_17, act_0_15_18, act_0_15_19, act_0_15_20, act_0_15_21, act_0_15_22, act_0_15_23, act_0_15_24, act_0_15_25, act_0_15_26, act_0_15_27, act_0_15_28, act_0_15_29, act_0_15_30, act_0_15_31 : lut_output_t_0;
  signal out0_0, out0_1, out0_2, out0_3, out0_4, out0_5, out0_6, out0_7, out0_8, out0_9, out0_10, out0_11, out0_12, out0_13, out0_14, out0_15 : lut_output_t_0;
  signal out0_16, out0_17, out0_18, out0_19, out0_20, out0_21, out0_22, out0_23, out0_24, out0_25, out0_26, out0_27, out0_28, out0_29, out0_30, out0_31 : lut_output_t_0;
  signal out0_0_reg, out0_1_reg, out0_2_reg, out0_3_reg, out0_4_reg, out0_5_reg, out0_6_reg, out0_7_reg, out0_8_reg, out0_9_reg, out0_10_reg, out0_11_reg, out0_12_reg, out0_13_reg, out0_14_reg, out0_15_reg : lut_output_t_0;
  signal out0_16_reg, out0_17_reg, out0_18_reg, out0_19_reg, out0_20_reg, out0_21_reg, out0_22_reg, out0_23_reg, out0_24_reg, out0_25_reg, out0_26_reg, out0_27_reg, out0_28_reg, out0_29_reg, out0_30_reg, out0_31_reg : lut_output_t_0;

-- Layer 1 (32->5)
  signal act_1_0_0, act_1_0_1, act_1_0_2, act_1_0_3, act_1_0_4, act_1_1_0, act_1_1_1, act_1_1_2, act_1_1_3, act_1_1_4, act_1_2_0, act_1_2_1, act_1_2_2, act_1_2_3, act_1_2_4, act_1_3_0 : lut_output_t_1;
  signal act_1_3_1, act_1_3_2, act_1_3_3, act_1_3_4, act_1_4_0, act_1_4_1, act_1_4_2, act_1_4_3, act_1_4_4, act_1_5_0, act_1_5_1, act_1_5_2, act_1_5_3, act_1_5_4, act_1_6_0, act_1_6_1 : lut_output_t_1;
  signal act_1_6_2, act_1_6_3, act_1_6_4, act_1_7_0, act_1_7_1, act_1_7_2, act_1_7_3, act_1_7_4, act_1_8_0, act_1_8_1, act_1_8_2, act_1_8_3, act_1_8_4, act_1_9_0, act_1_9_1, act_1_9_2 : lut_output_t_1;
  signal act_1_9_3, act_1_9_4, act_1_10_0, act_1_10_1, act_1_10_2, act_1_10_3, act_1_10_4, act_1_11_0, act_1_11_1, act_1_11_2, act_1_11_3, act_1_11_4, act_1_12_0, act_1_12_1, act_1_12_2, act_1_12_3 : lut_output_t_1;
  signal act_1_12_4, act_1_13_0, act_1_13_1, act_1_13_2, act_1_13_3, act_1_13_4, act_1_14_0, act_1_14_1, act_1_14_2, act_1_14_3, act_1_14_4, act_1_15_0, act_1_15_1, act_1_15_2, act_1_15_3, act_1_15_4 : lut_output_t_1;
  signal act_1_16_0, act_1_16_1, act_1_16_2, act_1_16_3, act_1_16_4, act_1_17_0, act_1_17_1, act_1_17_2, act_1_17_3, act_1_17_4, act_1_18_0, act_1_18_1, act_1_18_2, act_1_18_3, act_1_18_4, act_1_19_0 : lut_output_t_1;
  signal act_1_19_1, act_1_19_2, act_1_19_3, act_1_19_4, act_1_20_0, act_1_20_1, act_1_20_2, act_1_20_3, act_1_20_4, act_1_21_0, act_1_21_1, act_1_21_2, act_1_21_3, act_1_21_4, act_1_22_0, act_1_22_1 : lut_output_t_1;
  signal act_1_22_2, act_1_22_3, act_1_22_4, act_1_23_0, act_1_23_1, act_1_23_2, act_1_23_3, act_1_23_4, act_1_24_0, act_1_24_1, act_1_24_2, act_1_24_3, act_1_24_4, act_1_25_0, act_1_25_1, act_1_25_2 : lut_output_t_1;
  signal act_1_25_3, act_1_25_4, act_1_26_0, act_1_26_1, act_1_26_2, act_1_26_3, act_1_26_4, act_1_27_0, act_1_27_1, act_1_27_2, act_1_27_3, act_1_27_4, act_1_28_0, act_1_28_1, act_1_28_2, act_1_28_3 : lut_output_t_1;
  signal act_1_28_4, act_1_29_0, act_1_29_1, act_1_29_2, act_1_29_3, act_1_29_4, act_1_30_0, act_1_30_1, act_1_30_2, act_1_30_3, act_1_30_4, act_1_31_0, act_1_31_1, act_1_31_2, act_1_31_3, act_1_31_4 : lut_output_t_1;
begin

  -- === auto: layer blocks ===
  -- LAYER 0, ch 0
  gen_l0c0 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_0;
  signal sum_0_0 : sum_t_0_0;
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
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_0, SUM_WIDTH_0_0) + resize(act_0_1_0, SUM_WIDTH_0_0) + resize(act_0_2_0, SUM_WIDTH_0_0) + resize(act_0_3_0, SUM_WIDTH_0_0);
        s1_1 <= resize(act_0_4_0, SUM_WIDTH_0_0) + resize(act_0_5_0, SUM_WIDTH_0_0) + resize(act_0_6_0, SUM_WIDTH_0_0) + resize(act_0_7_0, SUM_WIDTH_0_0);
        s1_2 <= resize(act_0_8_0, SUM_WIDTH_0_0) + resize(act_0_9_0, SUM_WIDTH_0_0) + resize(act_0_10_0, SUM_WIDTH_0_0) + resize(act_0_11_0, SUM_WIDTH_0_0);
        s1_3 <= resize(act_0_12_0, SUM_WIDTH_0_0) + resize(act_0_13_0, SUM_WIDTH_0_0) + resize(act_0_14_0, SUM_WIDTH_0_0) + resize(act_0_15_0, SUM_WIDTH_0_0);
        -- Stage 2
        sum_0_0 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_0 <= saturate(sum_0_0, 6);
  end block;

  -- LAYER 0, ch 1
  gen_l0c1 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_1;
  signal sum_0_1 : sum_t_0_1;
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
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_1, SUM_WIDTH_0_1) + resize(act_0_1_1, SUM_WIDTH_0_1) + resize(act_0_2_1, SUM_WIDTH_0_1) + resize(act_0_3_1, SUM_WIDTH_0_1);
        s1_1 <= resize(act_0_4_1, SUM_WIDTH_0_1) + resize(act_0_5_1, SUM_WIDTH_0_1) + resize(act_0_6_1, SUM_WIDTH_0_1) + resize(act_0_7_1, SUM_WIDTH_0_1);
        s1_2 <= resize(act_0_8_1, SUM_WIDTH_0_1) + resize(act_0_9_1, SUM_WIDTH_0_1) + resize(act_0_10_1, SUM_WIDTH_0_1) + resize(act_0_11_1, SUM_WIDTH_0_1);
        s1_3 <= resize(act_0_12_1, SUM_WIDTH_0_1) + resize(act_0_13_1, SUM_WIDTH_0_1) + resize(act_0_14_1, SUM_WIDTH_0_1) + resize(act_0_15_1, SUM_WIDTH_0_1);
        -- Stage 2
        sum_0_1 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_1 <= saturate(sum_0_1, 6);
  end block;

  -- LAYER 0, ch 2
  gen_l0c2 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_2;
  signal sum_0_2 : sum_t_0_2;
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
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_2, SUM_WIDTH_0_2) + resize(act_0_1_2, SUM_WIDTH_0_2) + resize(act_0_2_2, SUM_WIDTH_0_2) + resize(act_0_3_2, SUM_WIDTH_0_2);
        s1_1 <= resize(act_0_4_2, SUM_WIDTH_0_2) + resize(act_0_5_2, SUM_WIDTH_0_2) + resize(act_0_6_2, SUM_WIDTH_0_2) + resize(act_0_7_2, SUM_WIDTH_0_2);
        s1_2 <= resize(act_0_8_2, SUM_WIDTH_0_2) + resize(act_0_9_2, SUM_WIDTH_0_2) + resize(act_0_10_2, SUM_WIDTH_0_2) + resize(act_0_11_2, SUM_WIDTH_0_2);
        s1_3 <= resize(act_0_12_2, SUM_WIDTH_0_2) + resize(act_0_13_2, SUM_WIDTH_0_2) + resize(act_0_14_2, SUM_WIDTH_0_2) + resize(act_0_15_2, SUM_WIDTH_0_2);
        -- Stage 2
        sum_0_2 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_2 <= saturate(sum_0_2, 6);
  end block;

  -- LAYER 0, ch 3
  gen_l0c3 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_3;
  signal sum_0_3 : sum_t_0_3;
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
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_3, SUM_WIDTH_0_3) + resize(act_0_1_3, SUM_WIDTH_0_3) + resize(act_0_2_3, SUM_WIDTH_0_3) + resize(act_0_3_3, SUM_WIDTH_0_3);
        s1_1 <= resize(act_0_4_3, SUM_WIDTH_0_3) + resize(act_0_5_3, SUM_WIDTH_0_3) + resize(act_0_6_3, SUM_WIDTH_0_3) + resize(act_0_7_3, SUM_WIDTH_0_3);
        s1_2 <= resize(act_0_8_3, SUM_WIDTH_0_3) + resize(act_0_9_3, SUM_WIDTH_0_3) + resize(act_0_10_3, SUM_WIDTH_0_3) + resize(act_0_11_3, SUM_WIDTH_0_3);
        s1_3 <= resize(act_0_12_3, SUM_WIDTH_0_3) + resize(act_0_13_3, SUM_WIDTH_0_3) + resize(act_0_14_3, SUM_WIDTH_0_3) + resize(act_0_15_3, SUM_WIDTH_0_3);
        -- Stage 2
        sum_0_3 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_3 <= saturate(sum_0_3, 6);
  end block;

  -- LAYER 0, ch 4
  gen_l0c4 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_4;
  signal sum_0_4 : sum_t_0_4;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_4.mem") port map (clk, input(0), act_0_0_4);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_4.mem") port map (clk, input(1), act_0_1_4);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_4.mem") port map (clk, input(2), act_0_2_4);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_4.mem") port map (clk, input(3), act_0_3_4);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_4.mem") port map (clk, input(4), act_0_4_4);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_4.mem") port map (clk, input(5), act_0_5_4);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_4.mem") port map (clk, input(6), act_0_6_4);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_4.mem") port map (clk, input(7), act_0_7_4);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_4.mem") port map (clk, input(8), act_0_8_4);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_4.mem") port map (clk, input(9), act_0_9_4);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_4.mem") port map (clk, input(10), act_0_10_4);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_4.mem") port map (clk, input(11), act_0_11_4);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_4.mem") port map (clk, input(12), act_0_12_4);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_4.mem") port map (clk, input(13), act_0_13_4);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_4.mem") port map (clk, input(14), act_0_14_4);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_4.mem") port map (clk, input(15), act_0_15_4);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_4, SUM_WIDTH_0_4) + resize(act_0_1_4, SUM_WIDTH_0_4) + resize(act_0_2_4, SUM_WIDTH_0_4) + resize(act_0_3_4, SUM_WIDTH_0_4);
        s1_1 <= resize(act_0_4_4, SUM_WIDTH_0_4) + resize(act_0_5_4, SUM_WIDTH_0_4) + resize(act_0_6_4, SUM_WIDTH_0_4) + resize(act_0_7_4, SUM_WIDTH_0_4);
        s1_2 <= resize(act_0_8_4, SUM_WIDTH_0_4) + resize(act_0_9_4, SUM_WIDTH_0_4) + resize(act_0_10_4, SUM_WIDTH_0_4) + resize(act_0_11_4, SUM_WIDTH_0_4);
        s1_3 <= resize(act_0_12_4, SUM_WIDTH_0_4) + resize(act_0_13_4, SUM_WIDTH_0_4) + resize(act_0_14_4, SUM_WIDTH_0_4) + resize(act_0_15_4, SUM_WIDTH_0_4);
        -- Stage 2
        sum_0_4 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_4 <= saturate(sum_0_4, 6);
  end block;

  -- LAYER 0, ch 5
  gen_l0c5 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_5;
  signal sum_0_5 : sum_t_0_5;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_5.mem") port map (clk, input(0), act_0_0_5);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_5.mem") port map (clk, input(1), act_0_1_5);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_5.mem") port map (clk, input(2), act_0_2_5);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_5.mem") port map (clk, input(3), act_0_3_5);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_5.mem") port map (clk, input(4), act_0_4_5);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_5.mem") port map (clk, input(5), act_0_5_5);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_5.mem") port map (clk, input(6), act_0_6_5);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_5.mem") port map (clk, input(7), act_0_7_5);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_5.mem") port map (clk, input(8), act_0_8_5);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_5.mem") port map (clk, input(9), act_0_9_5);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_5.mem") port map (clk, input(10), act_0_10_5);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_5.mem") port map (clk, input(11), act_0_11_5);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_5.mem") port map (clk, input(12), act_0_12_5);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_5.mem") port map (clk, input(13), act_0_13_5);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_5.mem") port map (clk, input(14), act_0_14_5);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_5.mem") port map (clk, input(15), act_0_15_5);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_5, SUM_WIDTH_0_5) + resize(act_0_1_5, SUM_WIDTH_0_5) + resize(act_0_2_5, SUM_WIDTH_0_5) + resize(act_0_3_5, SUM_WIDTH_0_5);
        s1_1 <= resize(act_0_4_5, SUM_WIDTH_0_5) + resize(act_0_5_5, SUM_WIDTH_0_5) + resize(act_0_6_5, SUM_WIDTH_0_5) + resize(act_0_7_5, SUM_WIDTH_0_5);
        s1_2 <= resize(act_0_8_5, SUM_WIDTH_0_5) + resize(act_0_9_5, SUM_WIDTH_0_5) + resize(act_0_10_5, SUM_WIDTH_0_5) + resize(act_0_11_5, SUM_WIDTH_0_5);
        s1_3 <= resize(act_0_12_5, SUM_WIDTH_0_5) + resize(act_0_13_5, SUM_WIDTH_0_5) + resize(act_0_14_5, SUM_WIDTH_0_5) + resize(act_0_15_5, SUM_WIDTH_0_5);
        -- Stage 2
        sum_0_5 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_5 <= saturate(sum_0_5, 6);
  end block;

  -- LAYER 0, ch 6
  gen_l0c6 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_6;
  signal sum_0_6 : sum_t_0_6;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_6.mem") port map (clk, input(0), act_0_0_6);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_6.mem") port map (clk, input(1), act_0_1_6);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_6.mem") port map (clk, input(2), act_0_2_6);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_6.mem") port map (clk, input(3), act_0_3_6);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_6.mem") port map (clk, input(4), act_0_4_6);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_6.mem") port map (clk, input(5), act_0_5_6);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_6.mem") port map (clk, input(6), act_0_6_6);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_6.mem") port map (clk, input(7), act_0_7_6);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_6.mem") port map (clk, input(8), act_0_8_6);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_6.mem") port map (clk, input(9), act_0_9_6);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_6.mem") port map (clk, input(10), act_0_10_6);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_6.mem") port map (clk, input(11), act_0_11_6);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_6.mem") port map (clk, input(12), act_0_12_6);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_6.mem") port map (clk, input(13), act_0_13_6);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_6.mem") port map (clk, input(14), act_0_14_6);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_6.mem") port map (clk, input(15), act_0_15_6);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_6, SUM_WIDTH_0_6) + resize(act_0_1_6, SUM_WIDTH_0_6) + resize(act_0_2_6, SUM_WIDTH_0_6) + resize(act_0_3_6, SUM_WIDTH_0_6);
        s1_1 <= resize(act_0_4_6, SUM_WIDTH_0_6) + resize(act_0_5_6, SUM_WIDTH_0_6) + resize(act_0_6_6, SUM_WIDTH_0_6) + resize(act_0_7_6, SUM_WIDTH_0_6);
        s1_2 <= resize(act_0_8_6, SUM_WIDTH_0_6) + resize(act_0_9_6, SUM_WIDTH_0_6) + resize(act_0_10_6, SUM_WIDTH_0_6) + resize(act_0_11_6, SUM_WIDTH_0_6);
        s1_3 <= resize(act_0_12_6, SUM_WIDTH_0_6) + resize(act_0_13_6, SUM_WIDTH_0_6) + resize(act_0_14_6, SUM_WIDTH_0_6) + resize(act_0_15_6, SUM_WIDTH_0_6);
        -- Stage 2
        sum_0_6 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_6 <= saturate(sum_0_6, 6);
  end block;

  -- LAYER 0, ch 7
  gen_l0c7 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_7;
  signal sum_0_7 : sum_t_0_7;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_7.mem") port map (clk, input(0), act_0_0_7);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_7.mem") port map (clk, input(1), act_0_1_7);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_7.mem") port map (clk, input(2), act_0_2_7);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_7.mem") port map (clk, input(3), act_0_3_7);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_7.mem") port map (clk, input(4), act_0_4_7);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_7.mem") port map (clk, input(5), act_0_5_7);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_7.mem") port map (clk, input(6), act_0_6_7);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_7.mem") port map (clk, input(7), act_0_7_7);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_7.mem") port map (clk, input(8), act_0_8_7);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_7.mem") port map (clk, input(9), act_0_9_7);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_7.mem") port map (clk, input(10), act_0_10_7);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_7.mem") port map (clk, input(11), act_0_11_7);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_7.mem") port map (clk, input(12), act_0_12_7);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_7.mem") port map (clk, input(13), act_0_13_7);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_7.mem") port map (clk, input(14), act_0_14_7);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_7.mem") port map (clk, input(15), act_0_15_7);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_7, SUM_WIDTH_0_7) + resize(act_0_1_7, SUM_WIDTH_0_7) + resize(act_0_2_7, SUM_WIDTH_0_7) + resize(act_0_3_7, SUM_WIDTH_0_7);
        s1_1 <= resize(act_0_4_7, SUM_WIDTH_0_7) + resize(act_0_5_7, SUM_WIDTH_0_7) + resize(act_0_6_7, SUM_WIDTH_0_7) + resize(act_0_7_7, SUM_WIDTH_0_7);
        s1_2 <= resize(act_0_8_7, SUM_WIDTH_0_7) + resize(act_0_9_7, SUM_WIDTH_0_7) + resize(act_0_10_7, SUM_WIDTH_0_7) + resize(act_0_11_7, SUM_WIDTH_0_7);
        s1_3 <= resize(act_0_12_7, SUM_WIDTH_0_7) + resize(act_0_13_7, SUM_WIDTH_0_7) + resize(act_0_14_7, SUM_WIDTH_0_7) + resize(act_0_15_7, SUM_WIDTH_0_7);
        -- Stage 2
        sum_0_7 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_7 <= saturate(sum_0_7, 6);
  end block;

  -- LAYER 0, ch 8
  gen_l0c8 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_8;
  signal sum_0_8 : sum_t_0_8;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_8.mem") port map (clk, input(0), act_0_0_8);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_8.mem") port map (clk, input(1), act_0_1_8);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_8.mem") port map (clk, input(2), act_0_2_8);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_8.mem") port map (clk, input(3), act_0_3_8);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_8.mem") port map (clk, input(4), act_0_4_8);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_8.mem") port map (clk, input(5), act_0_5_8);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_8.mem") port map (clk, input(6), act_0_6_8);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_8.mem") port map (clk, input(7), act_0_7_8);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_8.mem") port map (clk, input(8), act_0_8_8);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_8.mem") port map (clk, input(9), act_0_9_8);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_8.mem") port map (clk, input(10), act_0_10_8);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_8.mem") port map (clk, input(11), act_0_11_8);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_8.mem") port map (clk, input(12), act_0_12_8);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_8.mem") port map (clk, input(13), act_0_13_8);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_8.mem") port map (clk, input(14), act_0_14_8);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_8.mem") port map (clk, input(15), act_0_15_8);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_8, SUM_WIDTH_0_8) + resize(act_0_1_8, SUM_WIDTH_0_8) + resize(act_0_2_8, SUM_WIDTH_0_8) + resize(act_0_3_8, SUM_WIDTH_0_8);
        s1_1 <= resize(act_0_4_8, SUM_WIDTH_0_8) + resize(act_0_5_8, SUM_WIDTH_0_8) + resize(act_0_6_8, SUM_WIDTH_0_8) + resize(act_0_7_8, SUM_WIDTH_0_8);
        s1_2 <= resize(act_0_8_8, SUM_WIDTH_0_8) + resize(act_0_9_8, SUM_WIDTH_0_8) + resize(act_0_10_8, SUM_WIDTH_0_8) + resize(act_0_11_8, SUM_WIDTH_0_8);
        s1_3 <= resize(act_0_12_8, SUM_WIDTH_0_8) + resize(act_0_13_8, SUM_WIDTH_0_8) + resize(act_0_14_8, SUM_WIDTH_0_8) + resize(act_0_15_8, SUM_WIDTH_0_8);
        -- Stage 2
        sum_0_8 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_8 <= saturate(sum_0_8, 6);
  end block;

  -- LAYER 0, ch 9
  gen_l0c9 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_9;
  signal sum_0_9 : sum_t_0_9;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_9.mem") port map (clk, input(0), act_0_0_9);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_9.mem") port map (clk, input(1), act_0_1_9);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_9.mem") port map (clk, input(2), act_0_2_9);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_9.mem") port map (clk, input(3), act_0_3_9);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_9.mem") port map (clk, input(4), act_0_4_9);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_9.mem") port map (clk, input(5), act_0_5_9);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_9.mem") port map (clk, input(6), act_0_6_9);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_9.mem") port map (clk, input(7), act_0_7_9);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_9.mem") port map (clk, input(8), act_0_8_9);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_9.mem") port map (clk, input(9), act_0_9_9);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_9.mem") port map (clk, input(10), act_0_10_9);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_9.mem") port map (clk, input(11), act_0_11_9);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_9.mem") port map (clk, input(12), act_0_12_9);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_9.mem") port map (clk, input(13), act_0_13_9);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_9.mem") port map (clk, input(14), act_0_14_9);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_9.mem") port map (clk, input(15), act_0_15_9);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_9, SUM_WIDTH_0_9) + resize(act_0_1_9, SUM_WIDTH_0_9) + resize(act_0_2_9, SUM_WIDTH_0_9) + resize(act_0_3_9, SUM_WIDTH_0_9);
        s1_1 <= resize(act_0_4_9, SUM_WIDTH_0_9) + resize(act_0_5_9, SUM_WIDTH_0_9) + resize(act_0_6_9, SUM_WIDTH_0_9) + resize(act_0_7_9, SUM_WIDTH_0_9);
        s1_2 <= resize(act_0_8_9, SUM_WIDTH_0_9) + resize(act_0_9_9, SUM_WIDTH_0_9) + resize(act_0_10_9, SUM_WIDTH_0_9) + resize(act_0_11_9, SUM_WIDTH_0_9);
        s1_3 <= resize(act_0_12_9, SUM_WIDTH_0_9) + resize(act_0_13_9, SUM_WIDTH_0_9) + resize(act_0_14_9, SUM_WIDTH_0_9) + resize(act_0_15_9, SUM_WIDTH_0_9);
        -- Stage 2
        sum_0_9 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_9 <= saturate(sum_0_9, 6);
  end block;

  -- LAYER 0, ch 10
  gen_l0c10 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_10;
  signal sum_0_10 : sum_t_0_10;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_10.mem") port map (clk, input(0), act_0_0_10);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_10.mem") port map (clk, input(1), act_0_1_10);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_10.mem") port map (clk, input(2), act_0_2_10);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_10.mem") port map (clk, input(3), act_0_3_10);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_10.mem") port map (clk, input(4), act_0_4_10);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_10.mem") port map (clk, input(5), act_0_5_10);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_10.mem") port map (clk, input(6), act_0_6_10);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_10.mem") port map (clk, input(7), act_0_7_10);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_10.mem") port map (clk, input(8), act_0_8_10);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_10.mem") port map (clk, input(9), act_0_9_10);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_10.mem") port map (clk, input(10), act_0_10_10);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_10.mem") port map (clk, input(11), act_0_11_10);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_10.mem") port map (clk, input(12), act_0_12_10);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_10.mem") port map (clk, input(13), act_0_13_10);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_10.mem") port map (clk, input(14), act_0_14_10);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_10.mem") port map (clk, input(15), act_0_15_10);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_10, SUM_WIDTH_0_10) + resize(act_0_1_10, SUM_WIDTH_0_10) + resize(act_0_2_10, SUM_WIDTH_0_10) + resize(act_0_3_10, SUM_WIDTH_0_10);
        s1_1 <= resize(act_0_4_10, SUM_WIDTH_0_10) + resize(act_0_5_10, SUM_WIDTH_0_10) + resize(act_0_6_10, SUM_WIDTH_0_10) + resize(act_0_7_10, SUM_WIDTH_0_10);
        s1_2 <= resize(act_0_8_10, SUM_WIDTH_0_10) + resize(act_0_9_10, SUM_WIDTH_0_10) + resize(act_0_10_10, SUM_WIDTH_0_10) + resize(act_0_11_10, SUM_WIDTH_0_10);
        s1_3 <= resize(act_0_12_10, SUM_WIDTH_0_10) + resize(act_0_13_10, SUM_WIDTH_0_10) + resize(act_0_14_10, SUM_WIDTH_0_10) + resize(act_0_15_10, SUM_WIDTH_0_10);
        -- Stage 2
        sum_0_10 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_10 <= saturate(sum_0_10, 6);
  end block;

  -- LAYER 0, ch 11
  gen_l0c11 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_11;
  signal sum_0_11 : sum_t_0_11;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_11.mem") port map (clk, input(0), act_0_0_11);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_11.mem") port map (clk, input(1), act_0_1_11);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_11.mem") port map (clk, input(2), act_0_2_11);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_11.mem") port map (clk, input(3), act_0_3_11);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_11.mem") port map (clk, input(4), act_0_4_11);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_11.mem") port map (clk, input(5), act_0_5_11);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_11.mem") port map (clk, input(6), act_0_6_11);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_11.mem") port map (clk, input(7), act_0_7_11);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_11.mem") port map (clk, input(8), act_0_8_11);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_11.mem") port map (clk, input(9), act_0_9_11);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_11.mem") port map (clk, input(10), act_0_10_11);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_11.mem") port map (clk, input(11), act_0_11_11);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_11.mem") port map (clk, input(12), act_0_12_11);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_11.mem") port map (clk, input(13), act_0_13_11);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_11.mem") port map (clk, input(14), act_0_14_11);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_11.mem") port map (clk, input(15), act_0_15_11);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_11, SUM_WIDTH_0_11) + resize(act_0_1_11, SUM_WIDTH_0_11) + resize(act_0_2_11, SUM_WIDTH_0_11) + resize(act_0_3_11, SUM_WIDTH_0_11);
        s1_1 <= resize(act_0_4_11, SUM_WIDTH_0_11) + resize(act_0_5_11, SUM_WIDTH_0_11) + resize(act_0_6_11, SUM_WIDTH_0_11) + resize(act_0_7_11, SUM_WIDTH_0_11);
        s1_2 <= resize(act_0_8_11, SUM_WIDTH_0_11) + resize(act_0_9_11, SUM_WIDTH_0_11) + resize(act_0_10_11, SUM_WIDTH_0_11) + resize(act_0_11_11, SUM_WIDTH_0_11);
        s1_3 <= resize(act_0_12_11, SUM_WIDTH_0_11) + resize(act_0_13_11, SUM_WIDTH_0_11) + resize(act_0_14_11, SUM_WIDTH_0_11) + resize(act_0_15_11, SUM_WIDTH_0_11);
        -- Stage 2
        sum_0_11 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_11 <= saturate(sum_0_11, 6);
  end block;

  -- LAYER 0, ch 12
  gen_l0c12 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_12;
  signal sum_0_12 : sum_t_0_12;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_12.mem") port map (clk, input(0), act_0_0_12);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_12.mem") port map (clk, input(1), act_0_1_12);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_12.mem") port map (clk, input(2), act_0_2_12);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_12.mem") port map (clk, input(3), act_0_3_12);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_12.mem") port map (clk, input(4), act_0_4_12);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_12.mem") port map (clk, input(5), act_0_5_12);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_12.mem") port map (clk, input(6), act_0_6_12);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_12.mem") port map (clk, input(7), act_0_7_12);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_12.mem") port map (clk, input(8), act_0_8_12);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_12.mem") port map (clk, input(9), act_0_9_12);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_12.mem") port map (clk, input(10), act_0_10_12);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_12.mem") port map (clk, input(11), act_0_11_12);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_12.mem") port map (clk, input(12), act_0_12_12);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_12.mem") port map (clk, input(13), act_0_13_12);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_12.mem") port map (clk, input(14), act_0_14_12);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_12.mem") port map (clk, input(15), act_0_15_12);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_12, SUM_WIDTH_0_12) + resize(act_0_1_12, SUM_WIDTH_0_12) + resize(act_0_2_12, SUM_WIDTH_0_12) + resize(act_0_3_12, SUM_WIDTH_0_12);
        s1_1 <= resize(act_0_4_12, SUM_WIDTH_0_12) + resize(act_0_5_12, SUM_WIDTH_0_12) + resize(act_0_6_12, SUM_WIDTH_0_12) + resize(act_0_7_12, SUM_WIDTH_0_12);
        s1_2 <= resize(act_0_8_12, SUM_WIDTH_0_12) + resize(act_0_9_12, SUM_WIDTH_0_12) + resize(act_0_10_12, SUM_WIDTH_0_12) + resize(act_0_11_12, SUM_WIDTH_0_12);
        s1_3 <= resize(act_0_12_12, SUM_WIDTH_0_12) + resize(act_0_13_12, SUM_WIDTH_0_12) + resize(act_0_14_12, SUM_WIDTH_0_12) + resize(act_0_15_12, SUM_WIDTH_0_12);
        -- Stage 2
        sum_0_12 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_12 <= saturate(sum_0_12, 6);
  end block;

  -- LAYER 0, ch 13
  gen_l0c13 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_13;
  signal sum_0_13 : sum_t_0_13;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_13.mem") port map (clk, input(0), act_0_0_13);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_13.mem") port map (clk, input(1), act_0_1_13);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_13.mem") port map (clk, input(2), act_0_2_13);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_13.mem") port map (clk, input(3), act_0_3_13);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_13.mem") port map (clk, input(4), act_0_4_13);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_13.mem") port map (clk, input(5), act_0_5_13);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_13.mem") port map (clk, input(6), act_0_6_13);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_13.mem") port map (clk, input(7), act_0_7_13);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_13.mem") port map (clk, input(8), act_0_8_13);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_13.mem") port map (clk, input(9), act_0_9_13);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_13.mem") port map (clk, input(10), act_0_10_13);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_13.mem") port map (clk, input(11), act_0_11_13);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_13.mem") port map (clk, input(12), act_0_12_13);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_13.mem") port map (clk, input(13), act_0_13_13);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_13.mem") port map (clk, input(14), act_0_14_13);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_13.mem") port map (clk, input(15), act_0_15_13);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_13, SUM_WIDTH_0_13) + resize(act_0_1_13, SUM_WIDTH_0_13) + resize(act_0_2_13, SUM_WIDTH_0_13) + resize(act_0_3_13, SUM_WIDTH_0_13);
        s1_1 <= resize(act_0_4_13, SUM_WIDTH_0_13) + resize(act_0_5_13, SUM_WIDTH_0_13) + resize(act_0_6_13, SUM_WIDTH_0_13) + resize(act_0_7_13, SUM_WIDTH_0_13);
        s1_2 <= resize(act_0_8_13, SUM_WIDTH_0_13) + resize(act_0_9_13, SUM_WIDTH_0_13) + resize(act_0_10_13, SUM_WIDTH_0_13) + resize(act_0_11_13, SUM_WIDTH_0_13);
        s1_3 <= resize(act_0_12_13, SUM_WIDTH_0_13) + resize(act_0_13_13, SUM_WIDTH_0_13) + resize(act_0_14_13, SUM_WIDTH_0_13) + resize(act_0_15_13, SUM_WIDTH_0_13);
        -- Stage 2
        sum_0_13 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_13 <= saturate(sum_0_13, 6);
  end block;

  -- LAYER 0, ch 14
  gen_l0c14 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_14;
  signal sum_0_14 : sum_t_0_14;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_14.mem") port map (clk, input(0), act_0_0_14);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_14.mem") port map (clk, input(1), act_0_1_14);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_14.mem") port map (clk, input(2), act_0_2_14);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_14.mem") port map (clk, input(3), act_0_3_14);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_14.mem") port map (clk, input(4), act_0_4_14);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_14.mem") port map (clk, input(5), act_0_5_14);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_14.mem") port map (clk, input(6), act_0_6_14);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_14.mem") port map (clk, input(7), act_0_7_14);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_14.mem") port map (clk, input(8), act_0_8_14);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_14.mem") port map (clk, input(9), act_0_9_14);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_14.mem") port map (clk, input(10), act_0_10_14);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_14.mem") port map (clk, input(11), act_0_11_14);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_14.mem") port map (clk, input(12), act_0_12_14);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_14.mem") port map (clk, input(13), act_0_13_14);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_14.mem") port map (clk, input(14), act_0_14_14);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_14.mem") port map (clk, input(15), act_0_15_14);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_14, SUM_WIDTH_0_14) + resize(act_0_1_14, SUM_WIDTH_0_14) + resize(act_0_2_14, SUM_WIDTH_0_14) + resize(act_0_3_14, SUM_WIDTH_0_14);
        s1_1 <= resize(act_0_4_14, SUM_WIDTH_0_14) + resize(act_0_5_14, SUM_WIDTH_0_14) + resize(act_0_6_14, SUM_WIDTH_0_14) + resize(act_0_7_14, SUM_WIDTH_0_14);
        s1_2 <= resize(act_0_8_14, SUM_WIDTH_0_14) + resize(act_0_9_14, SUM_WIDTH_0_14) + resize(act_0_10_14, SUM_WIDTH_0_14) + resize(act_0_11_14, SUM_WIDTH_0_14);
        s1_3 <= resize(act_0_12_14, SUM_WIDTH_0_14) + resize(act_0_13_14, SUM_WIDTH_0_14) + resize(act_0_14_14, SUM_WIDTH_0_14) + resize(act_0_15_14, SUM_WIDTH_0_14);
        -- Stage 2
        sum_0_14 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_14 <= saturate(sum_0_14, 6);
  end block;

  -- LAYER 0, ch 15
  gen_l0c15 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_15;
  signal sum_0_15 : sum_t_0_15;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_15.mem") port map (clk, input(0), act_0_0_15);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_15.mem") port map (clk, input(1), act_0_1_15);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_15.mem") port map (clk, input(2), act_0_2_15);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_15.mem") port map (clk, input(3), act_0_3_15);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_15.mem") port map (clk, input(4), act_0_4_15);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_15.mem") port map (clk, input(5), act_0_5_15);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_15.mem") port map (clk, input(6), act_0_6_15);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_15.mem") port map (clk, input(7), act_0_7_15);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_15.mem") port map (clk, input(8), act_0_8_15);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_15.mem") port map (clk, input(9), act_0_9_15);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_15.mem") port map (clk, input(10), act_0_10_15);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_15.mem") port map (clk, input(11), act_0_11_15);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_15.mem") port map (clk, input(12), act_0_12_15);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_15.mem") port map (clk, input(13), act_0_13_15);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_15.mem") port map (clk, input(14), act_0_14_15);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_15.mem") port map (clk, input(15), act_0_15_15);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_15, SUM_WIDTH_0_15) + resize(act_0_1_15, SUM_WIDTH_0_15) + resize(act_0_2_15, SUM_WIDTH_0_15) + resize(act_0_3_15, SUM_WIDTH_0_15);
        s1_1 <= resize(act_0_4_15, SUM_WIDTH_0_15) + resize(act_0_5_15, SUM_WIDTH_0_15) + resize(act_0_6_15, SUM_WIDTH_0_15) + resize(act_0_7_15, SUM_WIDTH_0_15);
        s1_2 <= resize(act_0_8_15, SUM_WIDTH_0_15) + resize(act_0_9_15, SUM_WIDTH_0_15) + resize(act_0_10_15, SUM_WIDTH_0_15) + resize(act_0_11_15, SUM_WIDTH_0_15);
        s1_3 <= resize(act_0_12_15, SUM_WIDTH_0_15) + resize(act_0_13_15, SUM_WIDTH_0_15) + resize(act_0_14_15, SUM_WIDTH_0_15) + resize(act_0_15_15, SUM_WIDTH_0_15);
        -- Stage 2
        sum_0_15 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_15 <= saturate(sum_0_15, 6);
  end block;

  -- LAYER 0, ch 16
  gen_l0c16 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_16;
  signal sum_0_16 : sum_t_0_16;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_16.mem") port map (clk, input(0), act_0_0_16);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_16.mem") port map (clk, input(1), act_0_1_16);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_16.mem") port map (clk, input(2), act_0_2_16);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_16.mem") port map (clk, input(3), act_0_3_16);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_16.mem") port map (clk, input(4), act_0_4_16);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_16.mem") port map (clk, input(5), act_0_5_16);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_16.mem") port map (clk, input(6), act_0_6_16);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_16.mem") port map (clk, input(7), act_0_7_16);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_16.mem") port map (clk, input(8), act_0_8_16);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_16.mem") port map (clk, input(9), act_0_9_16);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_16.mem") port map (clk, input(10), act_0_10_16);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_16.mem") port map (clk, input(11), act_0_11_16);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_16.mem") port map (clk, input(12), act_0_12_16);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_16.mem") port map (clk, input(13), act_0_13_16);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_16.mem") port map (clk, input(14), act_0_14_16);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_16.mem") port map (clk, input(15), act_0_15_16);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_16, SUM_WIDTH_0_16) + resize(act_0_1_16, SUM_WIDTH_0_16) + resize(act_0_2_16, SUM_WIDTH_0_16) + resize(act_0_3_16, SUM_WIDTH_0_16);
        s1_1 <= resize(act_0_4_16, SUM_WIDTH_0_16) + resize(act_0_5_16, SUM_WIDTH_0_16) + resize(act_0_6_16, SUM_WIDTH_0_16) + resize(act_0_7_16, SUM_WIDTH_0_16);
        s1_2 <= resize(act_0_8_16, SUM_WIDTH_0_16) + resize(act_0_9_16, SUM_WIDTH_0_16) + resize(act_0_10_16, SUM_WIDTH_0_16) + resize(act_0_11_16, SUM_WIDTH_0_16);
        s1_3 <= resize(act_0_12_16, SUM_WIDTH_0_16) + resize(act_0_13_16, SUM_WIDTH_0_16) + resize(act_0_14_16, SUM_WIDTH_0_16) + resize(act_0_15_16, SUM_WIDTH_0_16);
        -- Stage 2
        sum_0_16 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_16 <= saturate(sum_0_16, 6);
  end block;

  -- LAYER 0, ch 17
  gen_l0c17 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_17;
  signal sum_0_17 : sum_t_0_17;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_17.mem") port map (clk, input(0), act_0_0_17);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_17.mem") port map (clk, input(1), act_0_1_17);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_17.mem") port map (clk, input(2), act_0_2_17);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_17.mem") port map (clk, input(3), act_0_3_17);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_17.mem") port map (clk, input(4), act_0_4_17);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_17.mem") port map (clk, input(5), act_0_5_17);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_17.mem") port map (clk, input(6), act_0_6_17);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_17.mem") port map (clk, input(7), act_0_7_17);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_17.mem") port map (clk, input(8), act_0_8_17);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_17.mem") port map (clk, input(9), act_0_9_17);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_17.mem") port map (clk, input(10), act_0_10_17);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_17.mem") port map (clk, input(11), act_0_11_17);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_17.mem") port map (clk, input(12), act_0_12_17);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_17.mem") port map (clk, input(13), act_0_13_17);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_17.mem") port map (clk, input(14), act_0_14_17);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_17.mem") port map (clk, input(15), act_0_15_17);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_17, SUM_WIDTH_0_17) + resize(act_0_1_17, SUM_WIDTH_0_17) + resize(act_0_2_17, SUM_WIDTH_0_17) + resize(act_0_3_17, SUM_WIDTH_0_17);
        s1_1 <= resize(act_0_4_17, SUM_WIDTH_0_17) + resize(act_0_5_17, SUM_WIDTH_0_17) + resize(act_0_6_17, SUM_WIDTH_0_17) + resize(act_0_7_17, SUM_WIDTH_0_17);
        s1_2 <= resize(act_0_8_17, SUM_WIDTH_0_17) + resize(act_0_9_17, SUM_WIDTH_0_17) + resize(act_0_10_17, SUM_WIDTH_0_17) + resize(act_0_11_17, SUM_WIDTH_0_17);
        s1_3 <= resize(act_0_12_17, SUM_WIDTH_0_17) + resize(act_0_13_17, SUM_WIDTH_0_17) + resize(act_0_14_17, SUM_WIDTH_0_17) + resize(act_0_15_17, SUM_WIDTH_0_17);
        -- Stage 2
        sum_0_17 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_17 <= saturate(sum_0_17, 6);
  end block;

  -- LAYER 0, ch 18
  gen_l0c18 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_18;
  signal sum_0_18 : sum_t_0_18;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_18.mem") port map (clk, input(0), act_0_0_18);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_18.mem") port map (clk, input(1), act_0_1_18);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_18.mem") port map (clk, input(2), act_0_2_18);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_18.mem") port map (clk, input(3), act_0_3_18);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_18.mem") port map (clk, input(4), act_0_4_18);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_18.mem") port map (clk, input(5), act_0_5_18);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_18.mem") port map (clk, input(6), act_0_6_18);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_18.mem") port map (clk, input(7), act_0_7_18);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_18.mem") port map (clk, input(8), act_0_8_18);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_18.mem") port map (clk, input(9), act_0_9_18);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_18.mem") port map (clk, input(10), act_0_10_18);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_18.mem") port map (clk, input(11), act_0_11_18);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_18.mem") port map (clk, input(12), act_0_12_18);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_18.mem") port map (clk, input(13), act_0_13_18);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_18.mem") port map (clk, input(14), act_0_14_18);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_18.mem") port map (clk, input(15), act_0_15_18);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_18, SUM_WIDTH_0_18) + resize(act_0_1_18, SUM_WIDTH_0_18) + resize(act_0_2_18, SUM_WIDTH_0_18) + resize(act_0_3_18, SUM_WIDTH_0_18);
        s1_1 <= resize(act_0_4_18, SUM_WIDTH_0_18) + resize(act_0_5_18, SUM_WIDTH_0_18) + resize(act_0_6_18, SUM_WIDTH_0_18) + resize(act_0_7_18, SUM_WIDTH_0_18);
        s1_2 <= resize(act_0_8_18, SUM_WIDTH_0_18) + resize(act_0_9_18, SUM_WIDTH_0_18) + resize(act_0_10_18, SUM_WIDTH_0_18) + resize(act_0_11_18, SUM_WIDTH_0_18);
        s1_3 <= resize(act_0_12_18, SUM_WIDTH_0_18) + resize(act_0_13_18, SUM_WIDTH_0_18) + resize(act_0_14_18, SUM_WIDTH_0_18) + resize(act_0_15_18, SUM_WIDTH_0_18);
        -- Stage 2
        sum_0_18 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_18 <= saturate(sum_0_18, 6);
  end block;

  -- LAYER 0, ch 19
  gen_l0c19 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_19;
  signal sum_0_19 : sum_t_0_19;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_19.mem") port map (clk, input(0), act_0_0_19);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_19.mem") port map (clk, input(1), act_0_1_19);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_19.mem") port map (clk, input(2), act_0_2_19);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_19.mem") port map (clk, input(3), act_0_3_19);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_19.mem") port map (clk, input(4), act_0_4_19);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_19.mem") port map (clk, input(5), act_0_5_19);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_19.mem") port map (clk, input(6), act_0_6_19);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_19.mem") port map (clk, input(7), act_0_7_19);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_19.mem") port map (clk, input(8), act_0_8_19);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_19.mem") port map (clk, input(9), act_0_9_19);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_19.mem") port map (clk, input(10), act_0_10_19);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_19.mem") port map (clk, input(11), act_0_11_19);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_19.mem") port map (clk, input(12), act_0_12_19);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_19.mem") port map (clk, input(13), act_0_13_19);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_19.mem") port map (clk, input(14), act_0_14_19);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_19.mem") port map (clk, input(15), act_0_15_19);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_19, SUM_WIDTH_0_19) + resize(act_0_1_19, SUM_WIDTH_0_19) + resize(act_0_2_19, SUM_WIDTH_0_19) + resize(act_0_3_19, SUM_WIDTH_0_19);
        s1_1 <= resize(act_0_4_19, SUM_WIDTH_0_19) + resize(act_0_5_19, SUM_WIDTH_0_19) + resize(act_0_6_19, SUM_WIDTH_0_19) + resize(act_0_7_19, SUM_WIDTH_0_19);
        s1_2 <= resize(act_0_8_19, SUM_WIDTH_0_19) + resize(act_0_9_19, SUM_WIDTH_0_19) + resize(act_0_10_19, SUM_WIDTH_0_19) + resize(act_0_11_19, SUM_WIDTH_0_19);
        s1_3 <= resize(act_0_12_19, SUM_WIDTH_0_19) + resize(act_0_13_19, SUM_WIDTH_0_19) + resize(act_0_14_19, SUM_WIDTH_0_19) + resize(act_0_15_19, SUM_WIDTH_0_19);
        -- Stage 2
        sum_0_19 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_19 <= saturate(sum_0_19, 6);
  end block;

  -- LAYER 0, ch 20
  gen_l0c20 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_20;
  signal sum_0_20 : sum_t_0_20;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_20.mem") port map (clk, input(0), act_0_0_20);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_20.mem") port map (clk, input(1), act_0_1_20);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_20.mem") port map (clk, input(2), act_0_2_20);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_20.mem") port map (clk, input(3), act_0_3_20);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_20.mem") port map (clk, input(4), act_0_4_20);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_20.mem") port map (clk, input(5), act_0_5_20);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_20.mem") port map (clk, input(6), act_0_6_20);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_20.mem") port map (clk, input(7), act_0_7_20);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_20.mem") port map (clk, input(8), act_0_8_20);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_20.mem") port map (clk, input(9), act_0_9_20);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_20.mem") port map (clk, input(10), act_0_10_20);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_20.mem") port map (clk, input(11), act_0_11_20);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_20.mem") port map (clk, input(12), act_0_12_20);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_20.mem") port map (clk, input(13), act_0_13_20);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_20.mem") port map (clk, input(14), act_0_14_20);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_20.mem") port map (clk, input(15), act_0_15_20);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_20, SUM_WIDTH_0_20) + resize(act_0_1_20, SUM_WIDTH_0_20) + resize(act_0_2_20, SUM_WIDTH_0_20) + resize(act_0_3_20, SUM_WIDTH_0_20);
        s1_1 <= resize(act_0_4_20, SUM_WIDTH_0_20) + resize(act_0_5_20, SUM_WIDTH_0_20) + resize(act_0_6_20, SUM_WIDTH_0_20) + resize(act_0_7_20, SUM_WIDTH_0_20);
        s1_2 <= resize(act_0_8_20, SUM_WIDTH_0_20) + resize(act_0_9_20, SUM_WIDTH_0_20) + resize(act_0_10_20, SUM_WIDTH_0_20) + resize(act_0_11_20, SUM_WIDTH_0_20);
        s1_3 <= resize(act_0_12_20, SUM_WIDTH_0_20) + resize(act_0_13_20, SUM_WIDTH_0_20) + resize(act_0_14_20, SUM_WIDTH_0_20) + resize(act_0_15_20, SUM_WIDTH_0_20);
        -- Stage 2
        sum_0_20 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_20 <= saturate(sum_0_20, 6);
  end block;

  -- LAYER 0, ch 21
  gen_l0c21 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_21;
  signal sum_0_21 : sum_t_0_21;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_21.mem") port map (clk, input(0), act_0_0_21);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_21.mem") port map (clk, input(1), act_0_1_21);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_21.mem") port map (clk, input(2), act_0_2_21);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_21.mem") port map (clk, input(3), act_0_3_21);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_21.mem") port map (clk, input(4), act_0_4_21);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_21.mem") port map (clk, input(5), act_0_5_21);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_21.mem") port map (clk, input(6), act_0_6_21);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_21.mem") port map (clk, input(7), act_0_7_21);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_21.mem") port map (clk, input(8), act_0_8_21);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_21.mem") port map (clk, input(9), act_0_9_21);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_21.mem") port map (clk, input(10), act_0_10_21);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_21.mem") port map (clk, input(11), act_0_11_21);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_21.mem") port map (clk, input(12), act_0_12_21);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_21.mem") port map (clk, input(13), act_0_13_21);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_21.mem") port map (clk, input(14), act_0_14_21);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_21.mem") port map (clk, input(15), act_0_15_21);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_21, SUM_WIDTH_0_21) + resize(act_0_1_21, SUM_WIDTH_0_21) + resize(act_0_2_21, SUM_WIDTH_0_21) + resize(act_0_3_21, SUM_WIDTH_0_21);
        s1_1 <= resize(act_0_4_21, SUM_WIDTH_0_21) + resize(act_0_5_21, SUM_WIDTH_0_21) + resize(act_0_6_21, SUM_WIDTH_0_21) + resize(act_0_7_21, SUM_WIDTH_0_21);
        s1_2 <= resize(act_0_8_21, SUM_WIDTH_0_21) + resize(act_0_9_21, SUM_WIDTH_0_21) + resize(act_0_10_21, SUM_WIDTH_0_21) + resize(act_0_11_21, SUM_WIDTH_0_21);
        s1_3 <= resize(act_0_12_21, SUM_WIDTH_0_21) + resize(act_0_13_21, SUM_WIDTH_0_21) + resize(act_0_14_21, SUM_WIDTH_0_21) + resize(act_0_15_21, SUM_WIDTH_0_21);
        -- Stage 2
        sum_0_21 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_21 <= saturate(sum_0_21, 6);
  end block;

  -- LAYER 0, ch 22
  gen_l0c22 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_22;
  signal sum_0_22 : sum_t_0_22;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_22.mem") port map (clk, input(0), act_0_0_22);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_22.mem") port map (clk, input(1), act_0_1_22);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_22.mem") port map (clk, input(2), act_0_2_22);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_22.mem") port map (clk, input(3), act_0_3_22);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_22.mem") port map (clk, input(4), act_0_4_22);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_22.mem") port map (clk, input(5), act_0_5_22);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_22.mem") port map (clk, input(6), act_0_6_22);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_22.mem") port map (clk, input(7), act_0_7_22);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_22.mem") port map (clk, input(8), act_0_8_22);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_22.mem") port map (clk, input(9), act_0_9_22);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_22.mem") port map (clk, input(10), act_0_10_22);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_22.mem") port map (clk, input(11), act_0_11_22);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_22.mem") port map (clk, input(12), act_0_12_22);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_22.mem") port map (clk, input(13), act_0_13_22);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_22.mem") port map (clk, input(14), act_0_14_22);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_22.mem") port map (clk, input(15), act_0_15_22);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_22, SUM_WIDTH_0_22) + resize(act_0_1_22, SUM_WIDTH_0_22) + resize(act_0_2_22, SUM_WIDTH_0_22) + resize(act_0_3_22, SUM_WIDTH_0_22);
        s1_1 <= resize(act_0_4_22, SUM_WIDTH_0_22) + resize(act_0_5_22, SUM_WIDTH_0_22) + resize(act_0_6_22, SUM_WIDTH_0_22) + resize(act_0_7_22, SUM_WIDTH_0_22);
        s1_2 <= resize(act_0_8_22, SUM_WIDTH_0_22) + resize(act_0_9_22, SUM_WIDTH_0_22) + resize(act_0_10_22, SUM_WIDTH_0_22) + resize(act_0_11_22, SUM_WIDTH_0_22);
        s1_3 <= resize(act_0_12_22, SUM_WIDTH_0_22) + resize(act_0_13_22, SUM_WIDTH_0_22) + resize(act_0_14_22, SUM_WIDTH_0_22) + resize(act_0_15_22, SUM_WIDTH_0_22);
        -- Stage 2
        sum_0_22 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_22 <= saturate(sum_0_22, 6);
  end block;

  -- LAYER 0, ch 23
  gen_l0c23 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_23;
  signal sum_0_23 : sum_t_0_23;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_23.mem") port map (clk, input(0), act_0_0_23);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_23.mem") port map (clk, input(1), act_0_1_23);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_23.mem") port map (clk, input(2), act_0_2_23);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_23.mem") port map (clk, input(3), act_0_3_23);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_23.mem") port map (clk, input(4), act_0_4_23);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_23.mem") port map (clk, input(5), act_0_5_23);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_23.mem") port map (clk, input(6), act_0_6_23);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_23.mem") port map (clk, input(7), act_0_7_23);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_23.mem") port map (clk, input(8), act_0_8_23);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_23.mem") port map (clk, input(9), act_0_9_23);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_23.mem") port map (clk, input(10), act_0_10_23);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_23.mem") port map (clk, input(11), act_0_11_23);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_23.mem") port map (clk, input(12), act_0_12_23);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_23.mem") port map (clk, input(13), act_0_13_23);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_23.mem") port map (clk, input(14), act_0_14_23);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_23.mem") port map (clk, input(15), act_0_15_23);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_23, SUM_WIDTH_0_23) + resize(act_0_1_23, SUM_WIDTH_0_23) + resize(act_0_2_23, SUM_WIDTH_0_23) + resize(act_0_3_23, SUM_WIDTH_0_23);
        s1_1 <= resize(act_0_4_23, SUM_WIDTH_0_23) + resize(act_0_5_23, SUM_WIDTH_0_23) + resize(act_0_6_23, SUM_WIDTH_0_23) + resize(act_0_7_23, SUM_WIDTH_0_23);
        s1_2 <= resize(act_0_8_23, SUM_WIDTH_0_23) + resize(act_0_9_23, SUM_WIDTH_0_23) + resize(act_0_10_23, SUM_WIDTH_0_23) + resize(act_0_11_23, SUM_WIDTH_0_23);
        s1_3 <= resize(act_0_12_23, SUM_WIDTH_0_23) + resize(act_0_13_23, SUM_WIDTH_0_23) + resize(act_0_14_23, SUM_WIDTH_0_23) + resize(act_0_15_23, SUM_WIDTH_0_23);
        -- Stage 2
        sum_0_23 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_23 <= saturate(sum_0_23, 6);
  end block;

  -- LAYER 0, ch 24
  gen_l0c24 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_24;
  signal sum_0_24 : sum_t_0_24;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_24.mem") port map (clk, input(0), act_0_0_24);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_24.mem") port map (clk, input(1), act_0_1_24);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_24.mem") port map (clk, input(2), act_0_2_24);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_24.mem") port map (clk, input(3), act_0_3_24);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_24.mem") port map (clk, input(4), act_0_4_24);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_24.mem") port map (clk, input(5), act_0_5_24);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_24.mem") port map (clk, input(6), act_0_6_24);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_24.mem") port map (clk, input(7), act_0_7_24);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_24.mem") port map (clk, input(8), act_0_8_24);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_24.mem") port map (clk, input(9), act_0_9_24);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_24.mem") port map (clk, input(10), act_0_10_24);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_24.mem") port map (clk, input(11), act_0_11_24);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_24.mem") port map (clk, input(12), act_0_12_24);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_24.mem") port map (clk, input(13), act_0_13_24);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_24.mem") port map (clk, input(14), act_0_14_24);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_24.mem") port map (clk, input(15), act_0_15_24);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_24, SUM_WIDTH_0_24) + resize(act_0_1_24, SUM_WIDTH_0_24) + resize(act_0_2_24, SUM_WIDTH_0_24) + resize(act_0_3_24, SUM_WIDTH_0_24);
        s1_1 <= resize(act_0_4_24, SUM_WIDTH_0_24) + resize(act_0_5_24, SUM_WIDTH_0_24) + resize(act_0_6_24, SUM_WIDTH_0_24) + resize(act_0_7_24, SUM_WIDTH_0_24);
        s1_2 <= resize(act_0_8_24, SUM_WIDTH_0_24) + resize(act_0_9_24, SUM_WIDTH_0_24) + resize(act_0_10_24, SUM_WIDTH_0_24) + resize(act_0_11_24, SUM_WIDTH_0_24);
        s1_3 <= resize(act_0_12_24, SUM_WIDTH_0_24) + resize(act_0_13_24, SUM_WIDTH_0_24) + resize(act_0_14_24, SUM_WIDTH_0_24) + resize(act_0_15_24, SUM_WIDTH_0_24);
        -- Stage 2
        sum_0_24 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_24 <= saturate(sum_0_24, 6);
  end block;

  -- LAYER 0, ch 25
  gen_l0c25 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_25;
  signal sum_0_25 : sum_t_0_25;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_25.mem") port map (clk, input(0), act_0_0_25);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_25.mem") port map (clk, input(1), act_0_1_25);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_25.mem") port map (clk, input(2), act_0_2_25);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_25.mem") port map (clk, input(3), act_0_3_25);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_25.mem") port map (clk, input(4), act_0_4_25);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_25.mem") port map (clk, input(5), act_0_5_25);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_25.mem") port map (clk, input(6), act_0_6_25);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_25.mem") port map (clk, input(7), act_0_7_25);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_25.mem") port map (clk, input(8), act_0_8_25);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_25.mem") port map (clk, input(9), act_0_9_25);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_25.mem") port map (clk, input(10), act_0_10_25);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_25.mem") port map (clk, input(11), act_0_11_25);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_25.mem") port map (clk, input(12), act_0_12_25);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_25.mem") port map (clk, input(13), act_0_13_25);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_25.mem") port map (clk, input(14), act_0_14_25);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_25.mem") port map (clk, input(15), act_0_15_25);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_25, SUM_WIDTH_0_25) + resize(act_0_1_25, SUM_WIDTH_0_25) + resize(act_0_2_25, SUM_WIDTH_0_25) + resize(act_0_3_25, SUM_WIDTH_0_25);
        s1_1 <= resize(act_0_4_25, SUM_WIDTH_0_25) + resize(act_0_5_25, SUM_WIDTH_0_25) + resize(act_0_6_25, SUM_WIDTH_0_25) + resize(act_0_7_25, SUM_WIDTH_0_25);
        s1_2 <= resize(act_0_8_25, SUM_WIDTH_0_25) + resize(act_0_9_25, SUM_WIDTH_0_25) + resize(act_0_10_25, SUM_WIDTH_0_25) + resize(act_0_11_25, SUM_WIDTH_0_25);
        s1_3 <= resize(act_0_12_25, SUM_WIDTH_0_25) + resize(act_0_13_25, SUM_WIDTH_0_25) + resize(act_0_14_25, SUM_WIDTH_0_25) + resize(act_0_15_25, SUM_WIDTH_0_25);
        -- Stage 2
        sum_0_25 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_25 <= saturate(sum_0_25, 6);
  end block;

  -- LAYER 0, ch 26
  gen_l0c26 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_26;
  signal sum_0_26 : sum_t_0_26;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_26.mem") port map (clk, input(0), act_0_0_26);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_26.mem") port map (clk, input(1), act_0_1_26);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_26.mem") port map (clk, input(2), act_0_2_26);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_26.mem") port map (clk, input(3), act_0_3_26);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_26.mem") port map (clk, input(4), act_0_4_26);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_26.mem") port map (clk, input(5), act_0_5_26);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_26.mem") port map (clk, input(6), act_0_6_26);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_26.mem") port map (clk, input(7), act_0_7_26);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_26.mem") port map (clk, input(8), act_0_8_26);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_26.mem") port map (clk, input(9), act_0_9_26);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_26.mem") port map (clk, input(10), act_0_10_26);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_26.mem") port map (clk, input(11), act_0_11_26);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_26.mem") port map (clk, input(12), act_0_12_26);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_26.mem") port map (clk, input(13), act_0_13_26);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_26.mem") port map (clk, input(14), act_0_14_26);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_26.mem") port map (clk, input(15), act_0_15_26);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_26, SUM_WIDTH_0_26) + resize(act_0_1_26, SUM_WIDTH_0_26) + resize(act_0_2_26, SUM_WIDTH_0_26) + resize(act_0_3_26, SUM_WIDTH_0_26);
        s1_1 <= resize(act_0_4_26, SUM_WIDTH_0_26) + resize(act_0_5_26, SUM_WIDTH_0_26) + resize(act_0_6_26, SUM_WIDTH_0_26) + resize(act_0_7_26, SUM_WIDTH_0_26);
        s1_2 <= resize(act_0_8_26, SUM_WIDTH_0_26) + resize(act_0_9_26, SUM_WIDTH_0_26) + resize(act_0_10_26, SUM_WIDTH_0_26) + resize(act_0_11_26, SUM_WIDTH_0_26);
        s1_3 <= resize(act_0_12_26, SUM_WIDTH_0_26) + resize(act_0_13_26, SUM_WIDTH_0_26) + resize(act_0_14_26, SUM_WIDTH_0_26) + resize(act_0_15_26, SUM_WIDTH_0_26);
        -- Stage 2
        sum_0_26 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_26 <= saturate(sum_0_26, 6);
  end block;

  -- LAYER 0, ch 27
  gen_l0c27 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_27;
  signal sum_0_27 : sum_t_0_27;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_27.mem") port map (clk, input(0), act_0_0_27);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_27.mem") port map (clk, input(1), act_0_1_27);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_27.mem") port map (clk, input(2), act_0_2_27);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_27.mem") port map (clk, input(3), act_0_3_27);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_27.mem") port map (clk, input(4), act_0_4_27);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_27.mem") port map (clk, input(5), act_0_5_27);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_27.mem") port map (clk, input(6), act_0_6_27);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_27.mem") port map (clk, input(7), act_0_7_27);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_27.mem") port map (clk, input(8), act_0_8_27);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_27.mem") port map (clk, input(9), act_0_9_27);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_27.mem") port map (clk, input(10), act_0_10_27);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_27.mem") port map (clk, input(11), act_0_11_27);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_27.mem") port map (clk, input(12), act_0_12_27);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_27.mem") port map (clk, input(13), act_0_13_27);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_27.mem") port map (clk, input(14), act_0_14_27);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_27.mem") port map (clk, input(15), act_0_15_27);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_27, SUM_WIDTH_0_27) + resize(act_0_1_27, SUM_WIDTH_0_27) + resize(act_0_2_27, SUM_WIDTH_0_27) + resize(act_0_3_27, SUM_WIDTH_0_27);
        s1_1 <= resize(act_0_4_27, SUM_WIDTH_0_27) + resize(act_0_5_27, SUM_WIDTH_0_27) + resize(act_0_6_27, SUM_WIDTH_0_27) + resize(act_0_7_27, SUM_WIDTH_0_27);
        s1_2 <= resize(act_0_8_27, SUM_WIDTH_0_27) + resize(act_0_9_27, SUM_WIDTH_0_27) + resize(act_0_10_27, SUM_WIDTH_0_27) + resize(act_0_11_27, SUM_WIDTH_0_27);
        s1_3 <= resize(act_0_12_27, SUM_WIDTH_0_27) + resize(act_0_13_27, SUM_WIDTH_0_27) + resize(act_0_14_27, SUM_WIDTH_0_27) + resize(act_0_15_27, SUM_WIDTH_0_27);
        -- Stage 2
        sum_0_27 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_27 <= saturate(sum_0_27, 6);
  end block;

  -- LAYER 0, ch 28
  gen_l0c28 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_28;
  signal sum_0_28 : sum_t_0_28;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_28.mem") port map (clk, input(0), act_0_0_28);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_28.mem") port map (clk, input(1), act_0_1_28);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_28.mem") port map (clk, input(2), act_0_2_28);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_28.mem") port map (clk, input(3), act_0_3_28);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_28.mem") port map (clk, input(4), act_0_4_28);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_28.mem") port map (clk, input(5), act_0_5_28);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_28.mem") port map (clk, input(6), act_0_6_28);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_28.mem") port map (clk, input(7), act_0_7_28);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_28.mem") port map (clk, input(8), act_0_8_28);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_28.mem") port map (clk, input(9), act_0_9_28);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_28.mem") port map (clk, input(10), act_0_10_28);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_28.mem") port map (clk, input(11), act_0_11_28);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_28.mem") port map (clk, input(12), act_0_12_28);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_28.mem") port map (clk, input(13), act_0_13_28);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_28.mem") port map (clk, input(14), act_0_14_28);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_28.mem") port map (clk, input(15), act_0_15_28);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_28, SUM_WIDTH_0_28) + resize(act_0_1_28, SUM_WIDTH_0_28) + resize(act_0_2_28, SUM_WIDTH_0_28) + resize(act_0_3_28, SUM_WIDTH_0_28);
        s1_1 <= resize(act_0_4_28, SUM_WIDTH_0_28) + resize(act_0_5_28, SUM_WIDTH_0_28) + resize(act_0_6_28, SUM_WIDTH_0_28) + resize(act_0_7_28, SUM_WIDTH_0_28);
        s1_2 <= resize(act_0_8_28, SUM_WIDTH_0_28) + resize(act_0_9_28, SUM_WIDTH_0_28) + resize(act_0_10_28, SUM_WIDTH_0_28) + resize(act_0_11_28, SUM_WIDTH_0_28);
        s1_3 <= resize(act_0_12_28, SUM_WIDTH_0_28) + resize(act_0_13_28, SUM_WIDTH_0_28) + resize(act_0_14_28, SUM_WIDTH_0_28) + resize(act_0_15_28, SUM_WIDTH_0_28);
        -- Stage 2
        sum_0_28 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_28 <= saturate(sum_0_28, 6);
  end block;

  -- LAYER 0, ch 29
  gen_l0c29 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_29;
  signal sum_0_29 : sum_t_0_29;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_29.mem") port map (clk, input(0), act_0_0_29);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_29.mem") port map (clk, input(1), act_0_1_29);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_29.mem") port map (clk, input(2), act_0_2_29);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_29.mem") port map (clk, input(3), act_0_3_29);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_29.mem") port map (clk, input(4), act_0_4_29);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_29.mem") port map (clk, input(5), act_0_5_29);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_29.mem") port map (clk, input(6), act_0_6_29);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_29.mem") port map (clk, input(7), act_0_7_29);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_29.mem") port map (clk, input(8), act_0_8_29);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_29.mem") port map (clk, input(9), act_0_9_29);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_29.mem") port map (clk, input(10), act_0_10_29);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_29.mem") port map (clk, input(11), act_0_11_29);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_29.mem") port map (clk, input(12), act_0_12_29);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_29.mem") port map (clk, input(13), act_0_13_29);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_29.mem") port map (clk, input(14), act_0_14_29);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_29.mem") port map (clk, input(15), act_0_15_29);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_29, SUM_WIDTH_0_29) + resize(act_0_1_29, SUM_WIDTH_0_29) + resize(act_0_2_29, SUM_WIDTH_0_29) + resize(act_0_3_29, SUM_WIDTH_0_29);
        s1_1 <= resize(act_0_4_29, SUM_WIDTH_0_29) + resize(act_0_5_29, SUM_WIDTH_0_29) + resize(act_0_6_29, SUM_WIDTH_0_29) + resize(act_0_7_29, SUM_WIDTH_0_29);
        s1_2 <= resize(act_0_8_29, SUM_WIDTH_0_29) + resize(act_0_9_29, SUM_WIDTH_0_29) + resize(act_0_10_29, SUM_WIDTH_0_29) + resize(act_0_11_29, SUM_WIDTH_0_29);
        s1_3 <= resize(act_0_12_29, SUM_WIDTH_0_29) + resize(act_0_13_29, SUM_WIDTH_0_29) + resize(act_0_14_29, SUM_WIDTH_0_29) + resize(act_0_15_29, SUM_WIDTH_0_29);
        -- Stage 2
        sum_0_29 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_29 <= saturate(sum_0_29, 6);
  end block;

  -- LAYER 0, ch 30
  gen_l0c30 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_30;
  signal sum_0_30 : sum_t_0_30;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_30.mem") port map (clk, input(0), act_0_0_30);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_30.mem") port map (clk, input(1), act_0_1_30);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_30.mem") port map (clk, input(2), act_0_2_30);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_30.mem") port map (clk, input(3), act_0_3_30);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_30.mem") port map (clk, input(4), act_0_4_30);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_30.mem") port map (clk, input(5), act_0_5_30);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_30.mem") port map (clk, input(6), act_0_6_30);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_30.mem") port map (clk, input(7), act_0_7_30);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_30.mem") port map (clk, input(8), act_0_8_30);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_30.mem") port map (clk, input(9), act_0_9_30);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_30.mem") port map (clk, input(10), act_0_10_30);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_30.mem") port map (clk, input(11), act_0_11_30);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_30.mem") port map (clk, input(12), act_0_12_30);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_30.mem") port map (clk, input(13), act_0_13_30);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_30.mem") port map (clk, input(14), act_0_14_30);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_30.mem") port map (clk, input(15), act_0_15_30);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_30, SUM_WIDTH_0_30) + resize(act_0_1_30, SUM_WIDTH_0_30) + resize(act_0_2_30, SUM_WIDTH_0_30) + resize(act_0_3_30, SUM_WIDTH_0_30);
        s1_1 <= resize(act_0_4_30, SUM_WIDTH_0_30) + resize(act_0_5_30, SUM_WIDTH_0_30) + resize(act_0_6_30, SUM_WIDTH_0_30) + resize(act_0_7_30, SUM_WIDTH_0_30);
        s1_2 <= resize(act_0_8_30, SUM_WIDTH_0_30) + resize(act_0_9_30, SUM_WIDTH_0_30) + resize(act_0_10_30, SUM_WIDTH_0_30) + resize(act_0_11_30, SUM_WIDTH_0_30);
        s1_3 <= resize(act_0_12_30, SUM_WIDTH_0_30) + resize(act_0_13_30, SUM_WIDTH_0_30) + resize(act_0_14_30, SUM_WIDTH_0_30) + resize(act_0_15_30, SUM_WIDTH_0_30);
        -- Stage 2
        sum_0_30 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_30 <= saturate(sum_0_30, 6);
  end block;

  -- LAYER 0, ch 31
  gen_l0c31 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_31;
  signal sum_0_31 : sum_t_0_31;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_31.mem") port map (clk, input(0), act_0_0_31);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_31.mem") port map (clk, input(1), act_0_1_31);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_31.mem") port map (clk, input(2), act_0_2_31);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_31.mem") port map (clk, input(3), act_0_3_31);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_31.mem") port map (clk, input(4), act_0_4_31);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_31.mem") port map (clk, input(5), act_0_5_31);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_31.mem") port map (clk, input(6), act_0_6_31);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_31.mem") port map (clk, input(7), act_0_7_31);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_31.mem") port map (clk, input(8), act_0_8_31);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_31.mem") port map (clk, input(9), act_0_9_31);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_31.mem") port map (clk, input(10), act_0_10_31);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_31.mem") port map (clk, input(11), act_0_11_31);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_31.mem") port map (clk, input(12), act_0_12_31);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_31.mem") port map (clk, input(13), act_0_13_31);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_31.mem") port map (clk, input(14), act_0_14_31);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_31.mem") port map (clk, input(15), act_0_15_31);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_31, SUM_WIDTH_0_31) + resize(act_0_1_31, SUM_WIDTH_0_31) + resize(act_0_2_31, SUM_WIDTH_0_31) + resize(act_0_3_31, SUM_WIDTH_0_31);
        s1_1 <= resize(act_0_4_31, SUM_WIDTH_0_31) + resize(act_0_5_31, SUM_WIDTH_0_31) + resize(act_0_6_31, SUM_WIDTH_0_31) + resize(act_0_7_31, SUM_WIDTH_0_31);
        s1_2 <= resize(act_0_8_31, SUM_WIDTH_0_31) + resize(act_0_9_31, SUM_WIDTH_0_31) + resize(act_0_10_31, SUM_WIDTH_0_31) + resize(act_0_11_31, SUM_WIDTH_0_31);
        s1_3 <= resize(act_0_12_31, SUM_WIDTH_0_31) + resize(act_0_13_31, SUM_WIDTH_0_31) + resize(act_0_14_31, SUM_WIDTH_0_31) + resize(act_0_15_31, SUM_WIDTH_0_31);
        -- Stage 2
        sum_0_31 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_31 <= saturate(sum_0_31, 6);
  end block;

  -- Register block for layer 0
  out_layer0_reg : process(clk)
    begin
      if rising_edge(clk) then
        out0_0_reg <= out0_0;
        out0_1_reg <= out0_1;
        out0_2_reg <= out0_2;
        out0_3_reg <= out0_3;
        out0_4_reg <= out0_4;
        out0_5_reg <= out0_5;
        out0_6_reg <= out0_6;
        out0_7_reg <= out0_7;
        out0_8_reg <= out0_8;
        out0_9_reg <= out0_9;
        out0_10_reg <= out0_10;
        out0_11_reg <= out0_11;
        out0_12_reg <= out0_12;
        out0_13_reg <= out0_13;
        out0_14_reg <= out0_14;
        out0_15_reg <= out0_15;
        out0_16_reg <= out0_16;
        out0_17_reg <= out0_17;
        out0_18_reg <= out0_18;
        out0_19_reg <= out0_19;
        out0_20_reg <= out0_20;
        out0_21_reg <= out0_21;
        out0_22_reg <= out0_22;
        out0_23_reg <= out0_23;
        out0_24_reg <= out0_24;
        out0_25_reg <= out0_25;
        out0_26_reg <= out0_26;
        out0_27_reg <= out0_27;
        out0_28_reg <= out0_28;
        out0_29_reg <= out0_29;
        out0_30_reg <= out0_30;
        out0_31_reg <= out0_31;
      end if;
  end process;

  -- LAYER 1, ch 0
  gen_l1c0 : block
  signal s1_0, s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7 : sum_t_1_0;
  signal s2_0, s2_1 : sum_t_1_0;
  signal sum_1_0 : sum_t_1_0;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_0.mem") port map (clk, out0_0_reg, act_1_0_0);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_0.mem") port map (clk, out0_1_reg, act_1_1_0);
    i02 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_2_0.mem") port map (clk, out0_2_reg, act_1_2_0);
    i03 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_0.mem") port map (clk, out0_3_reg, act_1_3_0);
    i04 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_4_0.mem") port map (clk, out0_4_reg, act_1_4_0);
    i05 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_5_0.mem") port map (clk, out0_5_reg, act_1_5_0);
    i06 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_6_0.mem") port map (clk, out0_6_reg, act_1_6_0);
    i07 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_7_0.mem") port map (clk, out0_7_reg, act_1_7_0);
    i08 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_8_0.mem") port map (clk, out0_8_reg, act_1_8_0);
    i09 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_9_0.mem") port map (clk, out0_9_reg, act_1_9_0);
    i10 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_10_0.mem") port map (clk, out0_10_reg, act_1_10_0);
    i11 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_11_0.mem") port map (clk, out0_11_reg, act_1_11_0);
    i12 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_12_0.mem") port map (clk, out0_12_reg, act_1_12_0);
    i13 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_13_0.mem") port map (clk, out0_13_reg, act_1_13_0);
    i14 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_14_0.mem") port map (clk, out0_14_reg, act_1_14_0);
    i15 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_15_0.mem") port map (clk, out0_15_reg, act_1_15_0);
    i16 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_16_0.mem") port map (clk, out0_16_reg, act_1_16_0);
    i17 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_17_0.mem") port map (clk, out0_17_reg, act_1_17_0);
    i18 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_18_0.mem") port map (clk, out0_18_reg, act_1_18_0);
    i19 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_19_0.mem") port map (clk, out0_19_reg, act_1_19_0);
    i20 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_20_0.mem") port map (clk, out0_20_reg, act_1_20_0);
    i21 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_21_0.mem") port map (clk, out0_21_reg, act_1_21_0);
    i22 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_22_0.mem") port map (clk, out0_22_reg, act_1_22_0);
    i23 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_23_0.mem") port map (clk, out0_23_reg, act_1_23_0);
    i24 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_24_0.mem") port map (clk, out0_24_reg, act_1_24_0);
    i25 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_25_0.mem") port map (clk, out0_25_reg, act_1_25_0);
    i26 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_26_0.mem") port map (clk, out0_26_reg, act_1_26_0);
    i27 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_27_0.mem") port map (clk, out0_27_reg, act_1_27_0);
    i28 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_28_0.mem") port map (clk, out0_28_reg, act_1_28_0);
    i29 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_29_0.mem") port map (clk, out0_29_reg, act_1_29_0);
    i30 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_30_0.mem") port map (clk, out0_30_reg, act_1_30_0);
    i31 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_31_0.mem") port map (clk, out0_31_reg, act_1_31_0);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_1_0_0, SUM_WIDTH_1_0) + resize(act_1_1_0, SUM_WIDTH_1_0) + resize(act_1_2_0, SUM_WIDTH_1_0) + resize(act_1_3_0, SUM_WIDTH_1_0);
        s1_1 <= resize(act_1_4_0, SUM_WIDTH_1_0) + resize(act_1_5_0, SUM_WIDTH_1_0) + resize(act_1_6_0, SUM_WIDTH_1_0) + resize(act_1_7_0, SUM_WIDTH_1_0);
        s1_2 <= resize(act_1_8_0, SUM_WIDTH_1_0) + resize(act_1_9_0, SUM_WIDTH_1_0) + resize(act_1_10_0, SUM_WIDTH_1_0) + resize(act_1_11_0, SUM_WIDTH_1_0);
        s1_3 <= resize(act_1_12_0, SUM_WIDTH_1_0) + resize(act_1_13_0, SUM_WIDTH_1_0) + resize(act_1_14_0, SUM_WIDTH_1_0) + resize(act_1_15_0, SUM_WIDTH_1_0);
        s1_4 <= resize(act_1_16_0, SUM_WIDTH_1_0) + resize(act_1_17_0, SUM_WIDTH_1_0) + resize(act_1_18_0, SUM_WIDTH_1_0) + resize(act_1_19_0, SUM_WIDTH_1_0);
        s1_5 <= resize(act_1_20_0, SUM_WIDTH_1_0) + resize(act_1_21_0, SUM_WIDTH_1_0) + resize(act_1_22_0, SUM_WIDTH_1_0) + resize(act_1_23_0, SUM_WIDTH_1_0);
        s1_6 <= resize(act_1_24_0, SUM_WIDTH_1_0) + resize(act_1_25_0, SUM_WIDTH_1_0) + resize(act_1_26_0, SUM_WIDTH_1_0) + resize(act_1_27_0, SUM_WIDTH_1_0);
        s1_7 <= resize(act_1_28_0, SUM_WIDTH_1_0) + resize(act_1_29_0, SUM_WIDTH_1_0) + resize(act_1_30_0, SUM_WIDTH_1_0) + resize(act_1_31_0, SUM_WIDTH_1_0);
        -- Stage 2
        s2_0 <= s1_0 + s1_1 + s1_2 + s1_3;
        s2_1 <= s1_4 + s1_5 + s1_6 + s1_7;
        -- Stage 3
        sum_1_0 <= s2_0 + s2_1;
      end if;
    end process;
    output(0) <= saturate(sum_1_0, 8);
  end block;

  -- LAYER 1, ch 1
  gen_l1c1 : block
  signal s1_0, s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7 : sum_t_1_1;
  signal s2_0, s2_1 : sum_t_1_1;
  signal sum_1_1 : sum_t_1_1;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_1.mem") port map (clk, out0_0_reg, act_1_0_1);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_1.mem") port map (clk, out0_1_reg, act_1_1_1);
    i02 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_2_1.mem") port map (clk, out0_2_reg, act_1_2_1);
    i03 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_1.mem") port map (clk, out0_3_reg, act_1_3_1);
    i04 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_4_1.mem") port map (clk, out0_4_reg, act_1_4_1);
    i05 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_5_1.mem") port map (clk, out0_5_reg, act_1_5_1);
    i06 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_6_1.mem") port map (clk, out0_6_reg, act_1_6_1);
    i07 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_7_1.mem") port map (clk, out0_7_reg, act_1_7_1);
    i08 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_8_1.mem") port map (clk, out0_8_reg, act_1_8_1);
    i09 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_9_1.mem") port map (clk, out0_9_reg, act_1_9_1);
    i10 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_10_1.mem") port map (clk, out0_10_reg, act_1_10_1);
    i11 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_11_1.mem") port map (clk, out0_11_reg, act_1_11_1);
    i12 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_12_1.mem") port map (clk, out0_12_reg, act_1_12_1);
    i13 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_13_1.mem") port map (clk, out0_13_reg, act_1_13_1);
    i14 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_14_1.mem") port map (clk, out0_14_reg, act_1_14_1);
    i15 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_15_1.mem") port map (clk, out0_15_reg, act_1_15_1);
    i16 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_16_1.mem") port map (clk, out0_16_reg, act_1_16_1);
    i17 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_17_1.mem") port map (clk, out0_17_reg, act_1_17_1);
    i18 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_18_1.mem") port map (clk, out0_18_reg, act_1_18_1);
    i19 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_19_1.mem") port map (clk, out0_19_reg, act_1_19_1);
    i20 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_20_1.mem") port map (clk, out0_20_reg, act_1_20_1);
    i21 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_21_1.mem") port map (clk, out0_21_reg, act_1_21_1);
    i22 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_22_1.mem") port map (clk, out0_22_reg, act_1_22_1);
    i23 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_23_1.mem") port map (clk, out0_23_reg, act_1_23_1);
    i24 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_24_1.mem") port map (clk, out0_24_reg, act_1_24_1);
    i25 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_25_1.mem") port map (clk, out0_25_reg, act_1_25_1);
    i26 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_26_1.mem") port map (clk, out0_26_reg, act_1_26_1);
    i27 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_27_1.mem") port map (clk, out0_27_reg, act_1_27_1);
    i28 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_28_1.mem") port map (clk, out0_28_reg, act_1_28_1);
    i29 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_29_1.mem") port map (clk, out0_29_reg, act_1_29_1);
    i30 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_30_1.mem") port map (clk, out0_30_reg, act_1_30_1);
    i31 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_31_1.mem") port map (clk, out0_31_reg, act_1_31_1);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_1_0_1, SUM_WIDTH_1_1) + resize(act_1_1_1, SUM_WIDTH_1_1) + resize(act_1_2_1, SUM_WIDTH_1_1) + resize(act_1_3_1, SUM_WIDTH_1_1);
        s1_1 <= resize(act_1_4_1, SUM_WIDTH_1_1) + resize(act_1_5_1, SUM_WIDTH_1_1) + resize(act_1_6_1, SUM_WIDTH_1_1) + resize(act_1_7_1, SUM_WIDTH_1_1);
        s1_2 <= resize(act_1_8_1, SUM_WIDTH_1_1) + resize(act_1_9_1, SUM_WIDTH_1_1) + resize(act_1_10_1, SUM_WIDTH_1_1) + resize(act_1_11_1, SUM_WIDTH_1_1);
        s1_3 <= resize(act_1_12_1, SUM_WIDTH_1_1) + resize(act_1_13_1, SUM_WIDTH_1_1) + resize(act_1_14_1, SUM_WIDTH_1_1) + resize(act_1_15_1, SUM_WIDTH_1_1);
        s1_4 <= resize(act_1_16_1, SUM_WIDTH_1_1) + resize(act_1_17_1, SUM_WIDTH_1_1) + resize(act_1_18_1, SUM_WIDTH_1_1) + resize(act_1_19_1, SUM_WIDTH_1_1);
        s1_5 <= resize(act_1_20_1, SUM_WIDTH_1_1) + resize(act_1_21_1, SUM_WIDTH_1_1) + resize(act_1_22_1, SUM_WIDTH_1_1) + resize(act_1_23_1, SUM_WIDTH_1_1);
        s1_6 <= resize(act_1_24_1, SUM_WIDTH_1_1) + resize(act_1_25_1, SUM_WIDTH_1_1) + resize(act_1_26_1, SUM_WIDTH_1_1) + resize(act_1_27_1, SUM_WIDTH_1_1);
        s1_7 <= resize(act_1_28_1, SUM_WIDTH_1_1) + resize(act_1_29_1, SUM_WIDTH_1_1) + resize(act_1_30_1, SUM_WIDTH_1_1) + resize(act_1_31_1, SUM_WIDTH_1_1);
        -- Stage 2
        s2_0 <= s1_0 + s1_1 + s1_2 + s1_3;
        s2_1 <= s1_4 + s1_5 + s1_6 + s1_7;
        -- Stage 3
        sum_1_1 <= s2_0 + s2_1;
      end if;
    end process;
    output(1) <= saturate(sum_1_1, 8);
  end block;

  -- LAYER 1, ch 2
  gen_l1c2 : block
  signal s1_0, s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7 : sum_t_1_2;
  signal s2_0, s2_1 : sum_t_1_2;
  signal sum_1_2 : sum_t_1_2;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_2.mem") port map (clk, out0_0_reg, act_1_0_2);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_2.mem") port map (clk, out0_1_reg, act_1_1_2);
    i02 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_2_2.mem") port map (clk, out0_2_reg, act_1_2_2);
    i03 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_2.mem") port map (clk, out0_3_reg, act_1_3_2);
    i04 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_4_2.mem") port map (clk, out0_4_reg, act_1_4_2);
    i05 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_5_2.mem") port map (clk, out0_5_reg, act_1_5_2);
    i06 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_6_2.mem") port map (clk, out0_6_reg, act_1_6_2);
    i07 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_7_2.mem") port map (clk, out0_7_reg, act_1_7_2);
    i08 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_8_2.mem") port map (clk, out0_8_reg, act_1_8_2);
    i09 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_9_2.mem") port map (clk, out0_9_reg, act_1_9_2);
    i10 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_10_2.mem") port map (clk, out0_10_reg, act_1_10_2);
    i11 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_11_2.mem") port map (clk, out0_11_reg, act_1_11_2);
    i12 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_12_2.mem") port map (clk, out0_12_reg, act_1_12_2);
    i13 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_13_2.mem") port map (clk, out0_13_reg, act_1_13_2);
    i14 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_14_2.mem") port map (clk, out0_14_reg, act_1_14_2);
    i15 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_15_2.mem") port map (clk, out0_15_reg, act_1_15_2);
    i16 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_16_2.mem") port map (clk, out0_16_reg, act_1_16_2);
    i17 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_17_2.mem") port map (clk, out0_17_reg, act_1_17_2);
    i18 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_18_2.mem") port map (clk, out0_18_reg, act_1_18_2);
    i19 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_19_2.mem") port map (clk, out0_19_reg, act_1_19_2);
    i20 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_20_2.mem") port map (clk, out0_20_reg, act_1_20_2);
    i21 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_21_2.mem") port map (clk, out0_21_reg, act_1_21_2);
    i22 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_22_2.mem") port map (clk, out0_22_reg, act_1_22_2);
    i23 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_23_2.mem") port map (clk, out0_23_reg, act_1_23_2);
    i24 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_24_2.mem") port map (clk, out0_24_reg, act_1_24_2);
    i25 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_25_2.mem") port map (clk, out0_25_reg, act_1_25_2);
    i26 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_26_2.mem") port map (clk, out0_26_reg, act_1_26_2);
    i27 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_27_2.mem") port map (clk, out0_27_reg, act_1_27_2);
    i28 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_28_2.mem") port map (clk, out0_28_reg, act_1_28_2);
    i29 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_29_2.mem") port map (clk, out0_29_reg, act_1_29_2);
    i30 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_30_2.mem") port map (clk, out0_30_reg, act_1_30_2);
    i31 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_31_2.mem") port map (clk, out0_31_reg, act_1_31_2);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_1_0_2, SUM_WIDTH_1_2) + resize(act_1_1_2, SUM_WIDTH_1_2) + resize(act_1_2_2, SUM_WIDTH_1_2) + resize(act_1_3_2, SUM_WIDTH_1_2);
        s1_1 <= resize(act_1_4_2, SUM_WIDTH_1_2) + resize(act_1_5_2, SUM_WIDTH_1_2) + resize(act_1_6_2, SUM_WIDTH_1_2) + resize(act_1_7_2, SUM_WIDTH_1_2);
        s1_2 <= resize(act_1_8_2, SUM_WIDTH_1_2) + resize(act_1_9_2, SUM_WIDTH_1_2) + resize(act_1_10_2, SUM_WIDTH_1_2) + resize(act_1_11_2, SUM_WIDTH_1_2);
        s1_3 <= resize(act_1_12_2, SUM_WIDTH_1_2) + resize(act_1_13_2, SUM_WIDTH_1_2) + resize(act_1_14_2, SUM_WIDTH_1_2) + resize(act_1_15_2, SUM_WIDTH_1_2);
        s1_4 <= resize(act_1_16_2, SUM_WIDTH_1_2) + resize(act_1_17_2, SUM_WIDTH_1_2) + resize(act_1_18_2, SUM_WIDTH_1_2) + resize(act_1_19_2, SUM_WIDTH_1_2);
        s1_5 <= resize(act_1_20_2, SUM_WIDTH_1_2) + resize(act_1_21_2, SUM_WIDTH_1_2) + resize(act_1_22_2, SUM_WIDTH_1_2) + resize(act_1_23_2, SUM_WIDTH_1_2);
        s1_6 <= resize(act_1_24_2, SUM_WIDTH_1_2) + resize(act_1_25_2, SUM_WIDTH_1_2) + resize(act_1_26_2, SUM_WIDTH_1_2) + resize(act_1_27_2, SUM_WIDTH_1_2);
        s1_7 <= resize(act_1_28_2, SUM_WIDTH_1_2) + resize(act_1_29_2, SUM_WIDTH_1_2) + resize(act_1_30_2, SUM_WIDTH_1_2) + resize(act_1_31_2, SUM_WIDTH_1_2);
        -- Stage 2
        s2_0 <= s1_0 + s1_1 + s1_2 + s1_3;
        s2_1 <= s1_4 + s1_5 + s1_6 + s1_7;
        -- Stage 3
        sum_1_2 <= s2_0 + s2_1;
      end if;
    end process;
    output(2) <= saturate(sum_1_2, 8);
  end block;

  -- LAYER 1, ch 3
  gen_l1c3 : block
  signal s1_0, s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7 : sum_t_1_3;
  signal s2_0, s2_1 : sum_t_1_3;
  signal sum_1_3 : sum_t_1_3;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_3.mem") port map (clk, out0_0_reg, act_1_0_3);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_3.mem") port map (clk, out0_1_reg, act_1_1_3);
    i02 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_2_3.mem") port map (clk, out0_2_reg, act_1_2_3);
    i03 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_3.mem") port map (clk, out0_3_reg, act_1_3_3);
    i04 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_4_3.mem") port map (clk, out0_4_reg, act_1_4_3);
    i05 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_5_3.mem") port map (clk, out0_5_reg, act_1_5_3);
    i06 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_6_3.mem") port map (clk, out0_6_reg, act_1_6_3);
    i07 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_7_3.mem") port map (clk, out0_7_reg, act_1_7_3);
    i08 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_8_3.mem") port map (clk, out0_8_reg, act_1_8_3);
    i09 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_9_3.mem") port map (clk, out0_9_reg, act_1_9_3);
    i10 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_10_3.mem") port map (clk, out0_10_reg, act_1_10_3);
    i11 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_11_3.mem") port map (clk, out0_11_reg, act_1_11_3);
    i12 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_12_3.mem") port map (clk, out0_12_reg, act_1_12_3);
    i13 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_13_3.mem") port map (clk, out0_13_reg, act_1_13_3);
    i14 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_14_3.mem") port map (clk, out0_14_reg, act_1_14_3);
    i15 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_15_3.mem") port map (clk, out0_15_reg, act_1_15_3);
    i16 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_16_3.mem") port map (clk, out0_16_reg, act_1_16_3);
    i17 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_17_3.mem") port map (clk, out0_17_reg, act_1_17_3);
    i18 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_18_3.mem") port map (clk, out0_18_reg, act_1_18_3);
    i19 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_19_3.mem") port map (clk, out0_19_reg, act_1_19_3);
    i20 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_20_3.mem") port map (clk, out0_20_reg, act_1_20_3);
    i21 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_21_3.mem") port map (clk, out0_21_reg, act_1_21_3);
    i22 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_22_3.mem") port map (clk, out0_22_reg, act_1_22_3);
    i23 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_23_3.mem") port map (clk, out0_23_reg, act_1_23_3);
    i24 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_24_3.mem") port map (clk, out0_24_reg, act_1_24_3);
    i25 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_25_3.mem") port map (clk, out0_25_reg, act_1_25_3);
    i26 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_26_3.mem") port map (clk, out0_26_reg, act_1_26_3);
    i27 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_27_3.mem") port map (clk, out0_27_reg, act_1_27_3);
    i28 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_28_3.mem") port map (clk, out0_28_reg, act_1_28_3);
    i29 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_29_3.mem") port map (clk, out0_29_reg, act_1_29_3);
    i30 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_30_3.mem") port map (clk, out0_30_reg, act_1_30_3);
    i31 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_31_3.mem") port map (clk, out0_31_reg, act_1_31_3);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_1_0_3, SUM_WIDTH_1_3) + resize(act_1_1_3, SUM_WIDTH_1_3) + resize(act_1_2_3, SUM_WIDTH_1_3) + resize(act_1_3_3, SUM_WIDTH_1_3);
        s1_1 <= resize(act_1_4_3, SUM_WIDTH_1_3) + resize(act_1_5_3, SUM_WIDTH_1_3) + resize(act_1_6_3, SUM_WIDTH_1_3) + resize(act_1_7_3, SUM_WIDTH_1_3);
        s1_2 <= resize(act_1_8_3, SUM_WIDTH_1_3) + resize(act_1_9_3, SUM_WIDTH_1_3) + resize(act_1_10_3, SUM_WIDTH_1_3) + resize(act_1_11_3, SUM_WIDTH_1_3);
        s1_3 <= resize(act_1_12_3, SUM_WIDTH_1_3) + resize(act_1_13_3, SUM_WIDTH_1_3) + resize(act_1_14_3, SUM_WIDTH_1_3) + resize(act_1_15_3, SUM_WIDTH_1_3);
        s1_4 <= resize(act_1_16_3, SUM_WIDTH_1_3) + resize(act_1_17_3, SUM_WIDTH_1_3) + resize(act_1_18_3, SUM_WIDTH_1_3) + resize(act_1_19_3, SUM_WIDTH_1_3);
        s1_5 <= resize(act_1_20_3, SUM_WIDTH_1_3) + resize(act_1_21_3, SUM_WIDTH_1_3) + resize(act_1_22_3, SUM_WIDTH_1_3) + resize(act_1_23_3, SUM_WIDTH_1_3);
        s1_6 <= resize(act_1_24_3, SUM_WIDTH_1_3) + resize(act_1_25_3, SUM_WIDTH_1_3) + resize(act_1_26_3, SUM_WIDTH_1_3) + resize(act_1_27_3, SUM_WIDTH_1_3);
        s1_7 <= resize(act_1_28_3, SUM_WIDTH_1_3) + resize(act_1_29_3, SUM_WIDTH_1_3) + resize(act_1_30_3, SUM_WIDTH_1_3) + resize(act_1_31_3, SUM_WIDTH_1_3);
        -- Stage 2
        s2_0 <= s1_0 + s1_1 + s1_2 + s1_3;
        s2_1 <= s1_4 + s1_5 + s1_6 + s1_7;
        -- Stage 3
        sum_1_3 <= s2_0 + s2_1;
      end if;
    end process;
    output(3) <= saturate(sum_1_3, 8);
  end block;

  -- LAYER 1, ch 4
  gen_l1c4 : block
  signal s1_0, s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7 : sum_t_1_4;
  signal s2_0, s2_1 : sum_t_1_4;
  signal sum_1_4 : sum_t_1_4;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_4.mem") port map (clk, out0_0_reg, act_1_0_4);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_4.mem") port map (clk, out0_1_reg, act_1_1_4);
    i02 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_2_4.mem") port map (clk, out0_2_reg, act_1_2_4);
    i03 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_4.mem") port map (clk, out0_3_reg, act_1_3_4);
    i04 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_4_4.mem") port map (clk, out0_4_reg, act_1_4_4);
    i05 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_5_4.mem") port map (clk, out0_5_reg, act_1_5_4);
    i06 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_6_4.mem") port map (clk, out0_6_reg, act_1_6_4);
    i07 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_7_4.mem") port map (clk, out0_7_reg, act_1_7_4);
    i08 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_8_4.mem") port map (clk, out0_8_reg, act_1_8_4);
    i09 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_9_4.mem") port map (clk, out0_9_reg, act_1_9_4);
    i10 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_10_4.mem") port map (clk, out0_10_reg, act_1_10_4);
    i11 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_11_4.mem") port map (clk, out0_11_reg, act_1_11_4);
    i12 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_12_4.mem") port map (clk, out0_12_reg, act_1_12_4);
    i13 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_13_4.mem") port map (clk, out0_13_reg, act_1_13_4);
    i14 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_14_4.mem") port map (clk, out0_14_reg, act_1_14_4);
    i15 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_15_4.mem") port map (clk, out0_15_reg, act_1_15_4);
    i16 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_16_4.mem") port map (clk, out0_16_reg, act_1_16_4);
    i17 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_17_4.mem") port map (clk, out0_17_reg, act_1_17_4);
    i18 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_18_4.mem") port map (clk, out0_18_reg, act_1_18_4);
    i19 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_19_4.mem") port map (clk, out0_19_reg, act_1_19_4);
    i20 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_20_4.mem") port map (clk, out0_20_reg, act_1_20_4);
    i21 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_21_4.mem") port map (clk, out0_21_reg, act_1_21_4);
    i22 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_22_4.mem") port map (clk, out0_22_reg, act_1_22_4);
    i23 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_23_4.mem") port map (clk, out0_23_reg, act_1_23_4);
    i24 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_24_4.mem") port map (clk, out0_24_reg, act_1_24_4);
    i25 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_25_4.mem") port map (clk, out0_25_reg, act_1_25_4);
    i26 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_26_4.mem") port map (clk, out0_26_reg, act_1_26_4);
    i27 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_27_4.mem") port map (clk, out0_27_reg, act_1_27_4);
    i28 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_28_4.mem") port map (clk, out0_28_reg, act_1_28_4);
    i29 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_29_4.mem") port map (clk, out0_29_reg, act_1_29_4);
    i30 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_30_4.mem") port map (clk, out0_30_reg, act_1_30_4);
    i31 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_31_4.mem") port map (clk, out0_31_reg, act_1_31_4);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_1_0_4, SUM_WIDTH_1_4) + resize(act_1_1_4, SUM_WIDTH_1_4) + resize(act_1_2_4, SUM_WIDTH_1_4) + resize(act_1_3_4, SUM_WIDTH_1_4);
        s1_1 <= resize(act_1_4_4, SUM_WIDTH_1_4) + resize(act_1_5_4, SUM_WIDTH_1_4) + resize(act_1_6_4, SUM_WIDTH_1_4) + resize(act_1_7_4, SUM_WIDTH_1_4);
        s1_2 <= resize(act_1_8_4, SUM_WIDTH_1_4) + resize(act_1_9_4, SUM_WIDTH_1_4) + resize(act_1_10_4, SUM_WIDTH_1_4) + resize(act_1_11_4, SUM_WIDTH_1_4);
        s1_3 <= resize(act_1_12_4, SUM_WIDTH_1_4) + resize(act_1_13_4, SUM_WIDTH_1_4) + resize(act_1_14_4, SUM_WIDTH_1_4) + resize(act_1_15_4, SUM_WIDTH_1_4);
        s1_4 <= resize(act_1_16_4, SUM_WIDTH_1_4) + resize(act_1_17_4, SUM_WIDTH_1_4) + resize(act_1_18_4, SUM_WIDTH_1_4) + resize(act_1_19_4, SUM_WIDTH_1_4);
        s1_5 <= resize(act_1_20_4, SUM_WIDTH_1_4) + resize(act_1_21_4, SUM_WIDTH_1_4) + resize(act_1_22_4, SUM_WIDTH_1_4) + resize(act_1_23_4, SUM_WIDTH_1_4);
        s1_6 <= resize(act_1_24_4, SUM_WIDTH_1_4) + resize(act_1_25_4, SUM_WIDTH_1_4) + resize(act_1_26_4, SUM_WIDTH_1_4) + resize(act_1_27_4, SUM_WIDTH_1_4);
        s1_7 <= resize(act_1_28_4, SUM_WIDTH_1_4) + resize(act_1_29_4, SUM_WIDTH_1_4) + resize(act_1_30_4, SUM_WIDTH_1_4) + resize(act_1_31_4, SUM_WIDTH_1_4);
        -- Stage 2
        s2_0 <= s1_0 + s1_1 + s1_2 + s1_3;
        s2_1 <= s1_4 + s1_5 + s1_6 + s1_7;
        -- Stage 3
        sum_1_4 <= s2_0 + s2_1;
      end if;
    end process;
    output(4) <= saturate(sum_1_4, 8);
  end block;

end architecture;