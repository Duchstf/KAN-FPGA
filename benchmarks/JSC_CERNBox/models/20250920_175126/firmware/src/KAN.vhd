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
  -- Layer 0 (16->12)
  signal act_0_0_0, act_0_0_2, act_0_0_3, act_0_0_4, act_0_0_5, act_0_0_7, act_0_0_9, act_0_0_10, act_0_0_11, act_0_1_2, act_0_1_3, act_0_1_4, act_0_1_5, act_0_1_8, act_0_1_9, act_0_1_10 : lut_output_t_0;
  signal act_0_1_11, act_0_2_0, act_0_2_1, act_0_2_2, act_0_2_3, act_0_2_4, act_0_2_5, act_0_2_6, act_0_2_7, act_0_2_8, act_0_2_9, act_0_2_10, act_0_2_11, act_0_3_0, act_0_3_1, act_0_3_2 : lut_output_t_0;
  signal act_0_3_3, act_0_3_4, act_0_3_5, act_0_3_6, act_0_3_7, act_0_3_8, act_0_3_9, act_0_3_10, act_0_3_11, act_0_4_0, act_0_4_1, act_0_4_2, act_0_4_3, act_0_4_4, act_0_4_5, act_0_4_6 : lut_output_t_0;
  signal act_0_4_7, act_0_4_8, act_0_4_9, act_0_4_10, act_0_4_11, act_0_5_0, act_0_5_1, act_0_5_2, act_0_5_3, act_0_5_5, act_0_5_6, act_0_5_7, act_0_5_8, act_0_5_9, act_0_5_10, act_0_5_11 : lut_output_t_0;
  signal act_0_6_3, act_0_6_7, act_0_6_9, act_0_6_10, act_0_7_1, act_0_7_3, act_0_7_5, act_0_7_7, act_0_7_8, act_0_7_9, act_0_7_10, act_0_8_1, act_0_8_5, act_0_8_11, act_0_9_1, act_0_9_3 : lut_output_t_0;
  signal act_0_9_7, act_0_9_8, act_0_10_0, act_0_10_1, act_0_10_5, act_0_10_7, act_0_10_8, act_0_10_9, act_0_11_1, act_0_11_3, act_0_11_5, act_0_11_6, act_0_11_7, act_0_11_8, act_0_11_10, act_0_12_0 : lut_output_t_0;
  signal act_0_12_1, act_0_12_5, act_0_12_7, act_0_13_0, act_0_13_1, act_0_13_5, act_0_13_7, act_0_13_10, act_0_14_0, act_0_14_1, act_0_14_2, act_0_14_3, act_0_14_4, act_0_14_5, act_0_14_6, act_0_14_7 : lut_output_t_0;
  signal act_0_14_8, act_0_14_9, act_0_14_10, act_0_14_11, act_0_15_0, act_0_15_1, act_0_15_3, act_0_15_4, act_0_15_5, act_0_15_6, act_0_15_7, act_0_15_8, act_0_15_11 : lut_output_t_0;
  signal out0_0, out0_1, out0_2, out0_3, out0_4, out0_5, out0_6, out0_7, out0_8, out0_9, out0_10, out0_11 : lut_output_t_0;
  signal out0_0_reg, out0_1_reg, out0_2_reg, out0_3_reg, out0_4_reg, out0_5_reg, out0_6_reg, out0_7_reg, out0_8_reg, out0_9_reg, out0_10_reg, out0_11_reg : lut_output_t_0;

-- Layer 1 (12->5)
  signal act_1_0_0, act_1_0_1, act_1_0_2, act_1_0_3, act_1_0_4, act_1_1_0, act_1_1_1, act_1_1_2, act_1_1_3, act_1_1_4, act_1_2_0, act_1_2_1, act_1_2_2, act_1_2_3, act_1_2_4, act_1_3_0 : lut_output_t_1;
  signal act_1_3_1, act_1_3_2, act_1_3_3, act_1_3_4, act_1_4_0, act_1_4_1, act_1_4_2, act_1_4_3, act_1_4_4, act_1_5_0, act_1_5_1, act_1_5_2, act_1_5_3, act_1_5_4, act_1_6_0, act_1_6_1 : lut_output_t_1;
  signal act_1_6_2, act_1_6_3, act_1_6_4, act_1_7_0, act_1_7_1, act_1_7_2, act_1_7_4, act_1_8_0, act_1_8_1, act_1_8_2, act_1_8_3, act_1_8_4, act_1_9_0, act_1_9_1, act_1_9_2, act_1_9_3 : lut_output_t_1;
  signal act_1_9_4, act_1_10_0, act_1_10_1, act_1_10_2, act_1_10_3, act_1_10_4, act_1_11_0, act_1_11_1, act_1_11_2, act_1_11_3, act_1_11_4 : lut_output_t_1;
begin

  -- === auto: layer blocks ===
  -- LAYER 0, ch 0
  gen_l0c0 : block
  signal s1_0, s1_1, s1_2 : sum_t_0_0;
  signal sum_0_0 : sum_t_0_0;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_0.mem") port map (clk, input(0), act_0_0_0);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_0.mem") port map (clk, input(2), act_0_2_0);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_0.mem") port map (clk, input(3), act_0_3_0);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_0.mem") port map (clk, input(4), act_0_4_0);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_0.mem") port map (clk, input(5), act_0_5_0);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_0.mem") port map (clk, input(10), act_0_10_0);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_0.mem") port map (clk, input(12), act_0_12_0);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_0.mem") port map (clk, input(13), act_0_13_0);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_0.mem") port map (clk, input(14), act_0_14_0);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_0.mem") port map (clk, input(15), act_0_15_0);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_0, SUM_WIDTH_0_0) + resize(act_0_2_0, SUM_WIDTH_0_0) + resize(act_0_3_0, SUM_WIDTH_0_0) + resize(act_0_4_0, SUM_WIDTH_0_0);
        s1_1 <= resize(act_0_5_0, SUM_WIDTH_0_0) + resize(act_0_10_0, SUM_WIDTH_0_0) + resize(act_0_12_0, SUM_WIDTH_0_0) + resize(act_0_13_0, SUM_WIDTH_0_0);
        s1_2 <= resize(act_0_14_0, SUM_WIDTH_0_0) + resize(act_0_15_0, SUM_WIDTH_0_0);
        -- Stage 2
        sum_0_0 <= s1_0 + s1_1 + s1_2;
      end if;
    end process;
    out0_0 <= saturate(sum_0_0, 8);
  end block;

  -- LAYER 0, ch 1
  gen_l0c1 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_1;
  signal sum_0_1 : sum_t_0_1;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_1.mem") port map (clk, input(2), act_0_2_1);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_1.mem") port map (clk, input(3), act_0_3_1);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_1.mem") port map (clk, input(4), act_0_4_1);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_1.mem") port map (clk, input(5), act_0_5_1);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_1.mem") port map (clk, input(7), act_0_7_1);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_1.mem") port map (clk, input(8), act_0_8_1);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_1.mem") port map (clk, input(9), act_0_9_1);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_1.mem") port map (clk, input(10), act_0_10_1);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_1.mem") port map (clk, input(11), act_0_11_1);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_1.mem") port map (clk, input(12), act_0_12_1);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_1.mem") port map (clk, input(13), act_0_13_1);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_1.mem") port map (clk, input(14), act_0_14_1);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_1.mem") port map (clk, input(15), act_0_15_1);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_2_1, SUM_WIDTH_0_1) + resize(act_0_3_1, SUM_WIDTH_0_1) + resize(act_0_4_1, SUM_WIDTH_0_1) + resize(act_0_5_1, SUM_WIDTH_0_1);
        s1_1 <= resize(act_0_7_1, SUM_WIDTH_0_1) + resize(act_0_8_1, SUM_WIDTH_0_1) + resize(act_0_9_1, SUM_WIDTH_0_1) + resize(act_0_10_1, SUM_WIDTH_0_1);
        s1_2 <= resize(act_0_11_1, SUM_WIDTH_0_1) + resize(act_0_12_1, SUM_WIDTH_0_1) + resize(act_0_13_1, SUM_WIDTH_0_1) + resize(act_0_14_1, SUM_WIDTH_0_1);
        s1_3 <= resize(act_0_15_1, SUM_WIDTH_0_1);
        -- Stage 2
        sum_0_1 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_1 <= saturate(sum_0_1, 8);
  end block;

  -- LAYER 0, ch 2
  gen_l0c2 : block
  signal s1_0, s1_1 : sum_t_0_2;
  signal sum_0_2 : sum_t_0_2;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_2.mem") port map (clk, input(0), act_0_0_2);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_2.mem") port map (clk, input(1), act_0_1_2);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_2.mem") port map (clk, input(2), act_0_2_2);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_2.mem") port map (clk, input(3), act_0_3_2);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_2.mem") port map (clk, input(4), act_0_4_2);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_2.mem") port map (clk, input(5), act_0_5_2);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_2.mem") port map (clk, input(14), act_0_14_2);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_2, SUM_WIDTH_0_2) + resize(act_0_1_2, SUM_WIDTH_0_2) + resize(act_0_2_2, SUM_WIDTH_0_2) + resize(act_0_3_2, SUM_WIDTH_0_2);
        s1_1 <= resize(act_0_4_2, SUM_WIDTH_0_2) + resize(act_0_5_2, SUM_WIDTH_0_2) + resize(act_0_14_2, SUM_WIDTH_0_2);
        -- Stage 2
        sum_0_2 <= s1_0 + s1_1;
      end if;
    end process;
    out0_2 <= saturate(sum_0_2, 8);
  end block;

  -- LAYER 0, ch 3
  gen_l0c3 : block
  signal s1_0, s1_1, s1_2 : sum_t_0_3;
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
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_3.mem") port map (clk, input(9), act_0_9_3);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_3.mem") port map (clk, input(11), act_0_11_3);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_3.mem") port map (clk, input(14), act_0_14_3);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_3.mem") port map (clk, input(15), act_0_15_3);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_3, SUM_WIDTH_0_3) + resize(act_0_1_3, SUM_WIDTH_0_3) + resize(act_0_2_3, SUM_WIDTH_0_3) + resize(act_0_3_3, SUM_WIDTH_0_3);
        s1_1 <= resize(act_0_4_3, SUM_WIDTH_0_3) + resize(act_0_5_3, SUM_WIDTH_0_3) + resize(act_0_6_3, SUM_WIDTH_0_3) + resize(act_0_7_3, SUM_WIDTH_0_3);
        s1_2 <= resize(act_0_9_3, SUM_WIDTH_0_3) + resize(act_0_11_3, SUM_WIDTH_0_3) + resize(act_0_14_3, SUM_WIDTH_0_3) + resize(act_0_15_3, SUM_WIDTH_0_3);
        -- Stage 2
        sum_0_3 <= s1_0 + s1_1 + s1_2;
      end if;
    end process;
    out0_3 <= saturate(sum_0_3, 8);
  end block;

  -- LAYER 0, ch 4
  gen_l0c4 : block
  signal s1_0, s1_1 : sum_t_0_4;
  signal sum_0_4 : sum_t_0_4;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_4.mem") port map (clk, input(0), act_0_0_4);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_4.mem") port map (clk, input(1), act_0_1_4);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_4.mem") port map (clk, input(2), act_0_2_4);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_4.mem") port map (clk, input(3), act_0_3_4);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_4.mem") port map (clk, input(4), act_0_4_4);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_4.mem") port map (clk, input(14), act_0_14_4);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_4.mem") port map (clk, input(15), act_0_15_4);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_4, SUM_WIDTH_0_4) + resize(act_0_1_4, SUM_WIDTH_0_4) + resize(act_0_2_4, SUM_WIDTH_0_4) + resize(act_0_3_4, SUM_WIDTH_0_4);
        s1_1 <= resize(act_0_4_4, SUM_WIDTH_0_4) + resize(act_0_14_4, SUM_WIDTH_0_4) + resize(act_0_15_4, SUM_WIDTH_0_4);
        -- Stage 2
        sum_0_4 <= s1_0 + s1_1;
      end if;
    end process;
    out0_4 <= saturate(sum_0_4, 8);
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
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_5.mem") port map (clk, input(7), act_0_7_5);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_5.mem") port map (clk, input(8), act_0_8_5);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_5.mem") port map (clk, input(10), act_0_10_5);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_5.mem") port map (clk, input(11), act_0_11_5);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_5.mem") port map (clk, input(12), act_0_12_5);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_5.mem") port map (clk, input(13), act_0_13_5);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_5.mem") port map (clk, input(14), act_0_14_5);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_5.mem") port map (clk, input(15), act_0_15_5);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_5, SUM_WIDTH_0_5) + resize(act_0_1_5, SUM_WIDTH_0_5) + resize(act_0_2_5, SUM_WIDTH_0_5) + resize(act_0_3_5, SUM_WIDTH_0_5);
        s1_1 <= resize(act_0_4_5, SUM_WIDTH_0_5) + resize(act_0_5_5, SUM_WIDTH_0_5) + resize(act_0_7_5, SUM_WIDTH_0_5) + resize(act_0_8_5, SUM_WIDTH_0_5);
        s1_2 <= resize(act_0_10_5, SUM_WIDTH_0_5) + resize(act_0_11_5, SUM_WIDTH_0_5) + resize(act_0_12_5, SUM_WIDTH_0_5) + resize(act_0_13_5, SUM_WIDTH_0_5);
        s1_3 <= resize(act_0_14_5, SUM_WIDTH_0_5) + resize(act_0_15_5, SUM_WIDTH_0_5);
        -- Stage 2
        sum_0_5 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_5 <= saturate(sum_0_5, 8);
  end block;

  -- LAYER 0, ch 6
  gen_l0c6 : block
  signal s1_0, s1_1 : sum_t_0_6;
  signal sum_0_6 : sum_t_0_6;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_6.mem") port map (clk, input(2), act_0_2_6);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_6.mem") port map (clk, input(3), act_0_3_6);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_6.mem") port map (clk, input(4), act_0_4_6);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_6.mem") port map (clk, input(5), act_0_5_6);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_6.mem") port map (clk, input(11), act_0_11_6);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_6.mem") port map (clk, input(14), act_0_14_6);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_6.mem") port map (clk, input(15), act_0_15_6);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_2_6, SUM_WIDTH_0_6) + resize(act_0_3_6, SUM_WIDTH_0_6) + resize(act_0_4_6, SUM_WIDTH_0_6) + resize(act_0_5_6, SUM_WIDTH_0_6);
        s1_1 <= resize(act_0_11_6, SUM_WIDTH_0_6) + resize(act_0_14_6, SUM_WIDTH_0_6) + resize(act_0_15_6, SUM_WIDTH_0_6);
        -- Stage 2
        sum_0_6 <= s1_0 + s1_1;
      end if;
    end process;
    out0_6 <= saturate(sum_0_6, 8);
  end block;

  -- LAYER 0, ch 7
  gen_l0c7 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_0_7;
  signal sum_0_7 : sum_t_0_7;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_7.mem") port map (clk, input(0), act_0_0_7);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_7.mem") port map (clk, input(2), act_0_2_7);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_7.mem") port map (clk, input(3), act_0_3_7);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_7.mem") port map (clk, input(4), act_0_4_7);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_7.mem") port map (clk, input(5), act_0_5_7);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_7.mem") port map (clk, input(6), act_0_6_7);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_7.mem") port map (clk, input(7), act_0_7_7);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_7.mem") port map (clk, input(9), act_0_9_7);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_7.mem") port map (clk, input(10), act_0_10_7);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_7.mem") port map (clk, input(11), act_0_11_7);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_7.mem") port map (clk, input(12), act_0_12_7);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_7.mem") port map (clk, input(13), act_0_13_7);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_7.mem") port map (clk, input(14), act_0_14_7);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_7.mem") port map (clk, input(15), act_0_15_7);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_7, SUM_WIDTH_0_7) + resize(act_0_2_7, SUM_WIDTH_0_7) + resize(act_0_3_7, SUM_WIDTH_0_7) + resize(act_0_4_7, SUM_WIDTH_0_7);
        s1_1 <= resize(act_0_5_7, SUM_WIDTH_0_7) + resize(act_0_6_7, SUM_WIDTH_0_7) + resize(act_0_7_7, SUM_WIDTH_0_7) + resize(act_0_9_7, SUM_WIDTH_0_7);
        s1_2 <= resize(act_0_10_7, SUM_WIDTH_0_7) + resize(act_0_11_7, SUM_WIDTH_0_7) + resize(act_0_12_7, SUM_WIDTH_0_7) + resize(act_0_13_7, SUM_WIDTH_0_7);
        s1_3 <= resize(act_0_14_7, SUM_WIDTH_0_7) + resize(act_0_15_7, SUM_WIDTH_0_7);
        -- Stage 2
        sum_0_7 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out0_7 <= saturate(sum_0_7, 8);
  end block;

  -- LAYER 0, ch 8
  gen_l0c8 : block
  signal s1_0, s1_1, s1_2 : sum_t_0_8;
  signal sum_0_8 : sum_t_0_8;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_8.mem") port map (clk, input(1), act_0_1_8);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_8.mem") port map (clk, input(2), act_0_2_8);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_8.mem") port map (clk, input(3), act_0_3_8);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_8.mem") port map (clk, input(4), act_0_4_8);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_8.mem") port map (clk, input(5), act_0_5_8);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_8.mem") port map (clk, input(7), act_0_7_8);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_8.mem") port map (clk, input(9), act_0_9_8);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_8.mem") port map (clk, input(10), act_0_10_8);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_8.mem") port map (clk, input(11), act_0_11_8);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_8.mem") port map (clk, input(14), act_0_14_8);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_8.mem") port map (clk, input(15), act_0_15_8);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_1_8, SUM_WIDTH_0_8) + resize(act_0_2_8, SUM_WIDTH_0_8) + resize(act_0_3_8, SUM_WIDTH_0_8) + resize(act_0_4_8, SUM_WIDTH_0_8);
        s1_1 <= resize(act_0_5_8, SUM_WIDTH_0_8) + resize(act_0_7_8, SUM_WIDTH_0_8) + resize(act_0_9_8, SUM_WIDTH_0_8) + resize(act_0_10_8, SUM_WIDTH_0_8);
        s1_2 <= resize(act_0_11_8, SUM_WIDTH_0_8) + resize(act_0_14_8, SUM_WIDTH_0_8) + resize(act_0_15_8, SUM_WIDTH_0_8);
        -- Stage 2
        sum_0_8 <= s1_0 + s1_1 + s1_2;
      end if;
    end process;
    out0_8 <= saturate(sum_0_8, 8);
  end block;

  -- LAYER 0, ch 9
  gen_l0c9 : block
  signal s1_0, s1_1, s1_2 : sum_t_0_9;
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
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_9.mem") port map (clk, input(10), act_0_10_9);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_9.mem") port map (clk, input(14), act_0_14_9);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_9, SUM_WIDTH_0_9) + resize(act_0_1_9, SUM_WIDTH_0_9) + resize(act_0_2_9, SUM_WIDTH_0_9) + resize(act_0_3_9, SUM_WIDTH_0_9);
        s1_1 <= resize(act_0_4_9, SUM_WIDTH_0_9) + resize(act_0_5_9, SUM_WIDTH_0_9) + resize(act_0_6_9, SUM_WIDTH_0_9) + resize(act_0_7_9, SUM_WIDTH_0_9);
        s1_2 <= resize(act_0_10_9, SUM_WIDTH_0_9) + resize(act_0_14_9, SUM_WIDTH_0_9);
        -- Stage 2
        sum_0_9 <= s1_0 + s1_1 + s1_2;
      end if;
    end process;
    out0_9 <= saturate(sum_0_9, 8);
  end block;

  -- LAYER 0, ch 10
  gen_l0c10 : block
  signal s1_0, s1_1, s1_2 : sum_t_0_10;
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
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_10.mem") port map (clk, input(11), act_0_11_10);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_10.mem") port map (clk, input(13), act_0_13_10);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_10.mem") port map (clk, input(14), act_0_14_10);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_10, SUM_WIDTH_0_10) + resize(act_0_1_10, SUM_WIDTH_0_10) + resize(act_0_2_10, SUM_WIDTH_0_10) + resize(act_0_3_10, SUM_WIDTH_0_10);
        s1_1 <= resize(act_0_4_10, SUM_WIDTH_0_10) + resize(act_0_5_10, SUM_WIDTH_0_10) + resize(act_0_6_10, SUM_WIDTH_0_10) + resize(act_0_7_10, SUM_WIDTH_0_10);
        s1_2 <= resize(act_0_11_10, SUM_WIDTH_0_10) + resize(act_0_13_10, SUM_WIDTH_0_10) + resize(act_0_14_10, SUM_WIDTH_0_10);
        -- Stage 2
        sum_0_10 <= s1_0 + s1_1 + s1_2;
      end if;
    end process;
    out0_10 <= saturate(sum_0_10, 8);
  end block;

  -- LAYER 0, ch 11
  gen_l0c11 : block
  signal s1_0, s1_1, s1_2 : sum_t_0_11;
  signal sum_0_11 : sum_t_0_11;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_11.mem") port map (clk, input(0), act_0_0_11);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_11.mem") port map (clk, input(1), act_0_1_11);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_11.mem") port map (clk, input(2), act_0_2_11);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_11.mem") port map (clk, input(3), act_0_3_11);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_11.mem") port map (clk, input(4), act_0_4_11);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_11.mem") port map (clk, input(5), act_0_5_11);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_11.mem") port map (clk, input(8), act_0_8_11);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_11.mem") port map (clk, input(14), act_0_14_11);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_11.mem") port map (clk, input(15), act_0_15_11);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_11, SUM_WIDTH_0_11) + resize(act_0_1_11, SUM_WIDTH_0_11) + resize(act_0_2_11, SUM_WIDTH_0_11) + resize(act_0_3_11, SUM_WIDTH_0_11);
        s1_1 <= resize(act_0_4_11, SUM_WIDTH_0_11) + resize(act_0_5_11, SUM_WIDTH_0_11) + resize(act_0_8_11, SUM_WIDTH_0_11) + resize(act_0_14_11, SUM_WIDTH_0_11);
        s1_2 <= resize(act_0_15_11, SUM_WIDTH_0_11);
        -- Stage 2
        sum_0_11 <= s1_0 + s1_1 + s1_2;
      end if;
    end process;
    out0_11 <= saturate(sum_0_11, 8);
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
      end if;
  end process;

  -- LAYER 1, ch 0
  gen_l1c0 : block
  signal s1_0, s1_1, s1_2 : sum_t_1_0;
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
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_1_0_0, SUM_WIDTH_1_0) + resize(act_1_1_0, SUM_WIDTH_1_0) + resize(act_1_2_0, SUM_WIDTH_1_0) + resize(act_1_3_0, SUM_WIDTH_1_0);
        s1_1 <= resize(act_1_4_0, SUM_WIDTH_1_0) + resize(act_1_5_0, SUM_WIDTH_1_0) + resize(act_1_6_0, SUM_WIDTH_1_0) + resize(act_1_7_0, SUM_WIDTH_1_0);
        s1_2 <= resize(act_1_8_0, SUM_WIDTH_1_0) + resize(act_1_9_0, SUM_WIDTH_1_0) + resize(act_1_10_0, SUM_WIDTH_1_0) + resize(act_1_11_0, SUM_WIDTH_1_0);
        -- Stage 2
        sum_1_0 <= s1_0 + s1_1 + s1_2;
      end if;
    end process;
    output(0) <= saturate(sum_1_0, 6);
  end block;

  -- LAYER 1, ch 1
  gen_l1c1 : block
  signal s1_0, s1_1, s1_2 : sum_t_1_1;
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
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_1_0_1, SUM_WIDTH_1_1) + resize(act_1_1_1, SUM_WIDTH_1_1) + resize(act_1_2_1, SUM_WIDTH_1_1) + resize(act_1_3_1, SUM_WIDTH_1_1);
        s1_1 <= resize(act_1_4_1, SUM_WIDTH_1_1) + resize(act_1_5_1, SUM_WIDTH_1_1) + resize(act_1_6_1, SUM_WIDTH_1_1) + resize(act_1_7_1, SUM_WIDTH_1_1);
        s1_2 <= resize(act_1_8_1, SUM_WIDTH_1_1) + resize(act_1_9_1, SUM_WIDTH_1_1) + resize(act_1_10_1, SUM_WIDTH_1_1) + resize(act_1_11_1, SUM_WIDTH_1_1);
        -- Stage 2
        sum_1_1 <= s1_0 + s1_1 + s1_2;
      end if;
    end process;
    output(1) <= saturate(sum_1_1, 6);
  end block;

  -- LAYER 1, ch 2
  gen_l1c2 : block
  signal s1_0, s1_1, s1_2 : sum_t_1_2;
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
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_1_0_2, SUM_WIDTH_1_2) + resize(act_1_1_2, SUM_WIDTH_1_2) + resize(act_1_2_2, SUM_WIDTH_1_2) + resize(act_1_3_2, SUM_WIDTH_1_2);
        s1_1 <= resize(act_1_4_2, SUM_WIDTH_1_2) + resize(act_1_5_2, SUM_WIDTH_1_2) + resize(act_1_6_2, SUM_WIDTH_1_2) + resize(act_1_7_2, SUM_WIDTH_1_2);
        s1_2 <= resize(act_1_8_2, SUM_WIDTH_1_2) + resize(act_1_9_2, SUM_WIDTH_1_2) + resize(act_1_10_2, SUM_WIDTH_1_2) + resize(act_1_11_2, SUM_WIDTH_1_2);
        -- Stage 2
        sum_1_2 <= s1_0 + s1_1 + s1_2;
      end if;
    end process;
    output(2) <= saturate(sum_1_2, 6);
  end block;

  -- LAYER 1, ch 3
  gen_l1c3 : block
  signal s1_0, s1_1, s1_2 : sum_t_1_3;
  signal sum_1_3 : sum_t_1_3;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_3.mem") port map (clk, out0_0_reg, act_1_0_3);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_3.mem") port map (clk, out0_1_reg, act_1_1_3);
    i02 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_2_3.mem") port map (clk, out0_2_reg, act_1_2_3);
    i03 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_3.mem") port map (clk, out0_3_reg, act_1_3_3);
    i04 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_4_3.mem") port map (clk, out0_4_reg, act_1_4_3);
    i05 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_5_3.mem") port map (clk, out0_5_reg, act_1_5_3);
    i06 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_6_3.mem") port map (clk, out0_6_reg, act_1_6_3);
    i07 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_8_3.mem") port map (clk, out0_8_reg, act_1_8_3);
    i08 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_9_3.mem") port map (clk, out0_9_reg, act_1_9_3);
    i09 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_10_3.mem") port map (clk, out0_10_reg, act_1_10_3);
    i10 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_11_3.mem") port map (clk, out0_11_reg, act_1_11_3);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_1_0_3, SUM_WIDTH_1_3) + resize(act_1_1_3, SUM_WIDTH_1_3) + resize(act_1_2_3, SUM_WIDTH_1_3) + resize(act_1_3_3, SUM_WIDTH_1_3);
        s1_1 <= resize(act_1_4_3, SUM_WIDTH_1_3) + resize(act_1_5_3, SUM_WIDTH_1_3) + resize(act_1_6_3, SUM_WIDTH_1_3) + resize(act_1_8_3, SUM_WIDTH_1_3);
        s1_2 <= resize(act_1_9_3, SUM_WIDTH_1_3) + resize(act_1_10_3, SUM_WIDTH_1_3) + resize(act_1_11_3, SUM_WIDTH_1_3);
        -- Stage 2
        sum_1_3 <= s1_0 + s1_1 + s1_2;
      end if;
    end process;
    output(3) <= saturate(sum_1_3, 6);
  end block;

  -- LAYER 1, ch 4
  gen_l1c4 : block
  signal s1_0, s1_1, s1_2 : sum_t_1_4;
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
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_1_0_4, SUM_WIDTH_1_4) + resize(act_1_1_4, SUM_WIDTH_1_4) + resize(act_1_2_4, SUM_WIDTH_1_4) + resize(act_1_3_4, SUM_WIDTH_1_4);
        s1_1 <= resize(act_1_4_4, SUM_WIDTH_1_4) + resize(act_1_5_4, SUM_WIDTH_1_4) + resize(act_1_6_4, SUM_WIDTH_1_4) + resize(act_1_7_4, SUM_WIDTH_1_4);
        s1_2 <= resize(act_1_8_4, SUM_WIDTH_1_4) + resize(act_1_9_4, SUM_WIDTH_1_4) + resize(act_1_10_4, SUM_WIDTH_1_4) + resize(act_1_11_4, SUM_WIDTH_1_4);
        -- Stage 2
        sum_1_4 <= s1_0 + s1_1 + s1_2;
      end if;
    end process;
    output(4) <= saturate(sum_1_4, 6);
  end block;

end architecture;