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
  -- Layer 0 (16->7)
  signal act_0_0_1, act_0_0_2, act_0_0_4, act_0_0_5, act_0_1_1, act_0_1_2, act_0_1_5, act_0_1_6, act_0_2_0, act_0_2_1, act_0_2_2, act_0_2_3, act_0_2_4, act_0_2_5, act_0_2_6, act_0_3_0 : lut_output_t_0;
  signal act_0_3_1, act_0_3_3, act_0_3_4, act_0_3_5, act_0_3_6, act_0_4_0, act_0_4_2, act_0_4_4, act_0_4_5, act_0_4_6, act_0_5_1, act_0_5_5, act_0_5_6, act_0_6_5, act_0_7_5, act_0_7_6 : lut_output_t_0;
  signal act_0_8_6, act_0_10_0, act_0_10_2, act_0_11_1, act_0_11_5, act_0_12_0, act_0_12_2, act_0_12_5, act_0_14_0, act_0_14_1, act_0_14_2, act_0_14_3, act_0_14_4, act_0_14_5, act_0_14_6, act_0_15_1 : lut_output_t_0;
  signal act_0_15_2, act_0_15_3, act_0_15_5, act_0_15_6 : lut_output_t_0;
  signal out0_0, out0_1, out0_2, out0_3, out0_4, out0_5, out0_6 : lut_output_t_0;
  signal out0_0_reg, out0_1_reg, out0_2_reg, out0_3_reg, out0_4_reg, out0_5_reg, out0_6_reg : lut_output_t_0;

-- Layer 1 (7->5)
  signal act_1_0_0, act_1_0_1, act_1_0_2, act_1_0_3, act_1_0_4, act_1_1_0, act_1_1_1, act_1_1_2, act_1_1_3, act_1_1_4, act_1_2_0, act_1_2_1, act_1_2_2, act_1_2_3, act_1_2_4, act_1_3_0 : lut_output_t_1;
  signal act_1_3_1, act_1_3_2, act_1_3_3, act_1_3_4, act_1_4_0, act_1_4_1, act_1_4_2, act_1_4_3, act_1_4_4, act_1_5_0, act_1_5_1, act_1_5_2, act_1_5_3, act_1_5_4, act_1_6_0, act_1_6_1 : lut_output_t_1;
  signal act_1_6_2, act_1_6_3, act_1_6_4 : lut_output_t_1;
begin

  -- === auto: layer blocks ===
  -- LAYER 0, ch 0
  gen_l0c0 : block
  signal s1_0, s1_1 : sum_t_0_0;
  signal sum_0_0 : sum_t_0_0;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_0.mem") port map (clk, input(2), act_0_2_0);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_0.mem") port map (clk, input(3), act_0_3_0);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_0.mem") port map (clk, input(4), act_0_4_0);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_0.mem") port map (clk, input(10), act_0_10_0);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_0.mem") port map (clk, input(12), act_0_12_0);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_0.mem") port map (clk, input(14), act_0_14_0);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_2_0, SUM_WIDTH_0_0) + resize(act_0_3_0, SUM_WIDTH_0_0) + resize(act_0_4_0, SUM_WIDTH_0_0) + resize(act_0_10_0, SUM_WIDTH_0_0);
        s1_1 <= resize(act_0_12_0, SUM_WIDTH_0_0) + resize(act_0_14_0, SUM_WIDTH_0_0);
        -- Stage 2
        sum_0_0 <= s1_0 + s1_1;
      end if;
    end process;
    out0_0 <= saturate(sum_0_0, 6);
  end block;

  -- LAYER 0, ch 1
  gen_l0c1 : block
  signal s1_0, s1_1 : sum_t_0_1;
  signal sum_0_1 : sum_t_0_1;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_1.mem") port map (clk, input(0), act_0_0_1);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_1.mem") port map (clk, input(1), act_0_1_1);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_1.mem") port map (clk, input(2), act_0_2_1);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_1.mem") port map (clk, input(3), act_0_3_1);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_1.mem") port map (clk, input(5), act_0_5_1);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_1.mem") port map (clk, input(11), act_0_11_1);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_1.mem") port map (clk, input(14), act_0_14_1);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_1.mem") port map (clk, input(15), act_0_15_1);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_1, SUM_WIDTH_0_1) + resize(act_0_1_1, SUM_WIDTH_0_1) + resize(act_0_2_1, SUM_WIDTH_0_1) + resize(act_0_3_1, SUM_WIDTH_0_1);
        s1_1 <= resize(act_0_5_1, SUM_WIDTH_0_1) + resize(act_0_11_1, SUM_WIDTH_0_1) + resize(act_0_14_1, SUM_WIDTH_0_1) + resize(act_0_15_1, SUM_WIDTH_0_1);
        -- Stage 2
        sum_0_1 <= s1_0 + s1_1;
      end if;
    end process;
    out0_1 <= saturate(sum_0_1, 6);
  end block;

  -- LAYER 0, ch 2
  gen_l0c2 : block
  signal s1_0, s1_1 : sum_t_0_2;
  signal sum_0_2 : sum_t_0_2;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_2.mem") port map (clk, input(0), act_0_0_2);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_2.mem") port map (clk, input(1), act_0_1_2);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_2.mem") port map (clk, input(2), act_0_2_2);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_2.mem") port map (clk, input(4), act_0_4_2);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_2.mem") port map (clk, input(10), act_0_10_2);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_2.mem") port map (clk, input(12), act_0_12_2);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_2.mem") port map (clk, input(14), act_0_14_2);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_2.mem") port map (clk, input(15), act_0_15_2);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_2, SUM_WIDTH_0_2) + resize(act_0_1_2, SUM_WIDTH_0_2) + resize(act_0_2_2, SUM_WIDTH_0_2) + resize(act_0_4_2, SUM_WIDTH_0_2);
        s1_1 <= resize(act_0_10_2, SUM_WIDTH_0_2) + resize(act_0_12_2, SUM_WIDTH_0_2) + resize(act_0_14_2, SUM_WIDTH_0_2) + resize(act_0_15_2, SUM_WIDTH_0_2);
        -- Stage 2
        sum_0_2 <= s1_0 + s1_1;
      end if;
    end process;
    out0_2 <= saturate(sum_0_2, 6);
  end block;

  -- LAYER 0, ch 3
  gen_l0c3 : block
  signal s1_0 : sum_t_0_3;
  signal sum_0_3 : sum_t_0_3;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_3.mem") port map (clk, input(2), act_0_2_3);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_3.mem") port map (clk, input(3), act_0_3_3);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_3.mem") port map (clk, input(14), act_0_14_3);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_3.mem") port map (clk, input(15), act_0_15_3);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_2_3, SUM_WIDTH_0_3) + resize(act_0_3_3, SUM_WIDTH_0_3) + resize(act_0_14_3, SUM_WIDTH_0_3) + resize(act_0_15_3, SUM_WIDTH_0_3);
        -- Stage 2
        sum_0_3 <= s1_0;
      end if;
    end process;
    out0_3 <= saturate(sum_0_3, 6);
  end block;

  -- LAYER 0, ch 4
  gen_l0c4 : block
  signal s1_0, s1_1 : sum_t_0_4;
  signal sum_0_4 : sum_t_0_4;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_4.mem") port map (clk, input(0), act_0_0_4);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_4.mem") port map (clk, input(2), act_0_2_4);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_4.mem") port map (clk, input(3), act_0_3_4);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_4.mem") port map (clk, input(4), act_0_4_4);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_4.mem") port map (clk, input(14), act_0_14_4);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_4, SUM_WIDTH_0_4) + resize(act_0_2_4, SUM_WIDTH_0_4) + resize(act_0_3_4, SUM_WIDTH_0_4) + resize(act_0_4_4, SUM_WIDTH_0_4);
        s1_1 <= resize(act_0_14_4, SUM_WIDTH_0_4);
        -- Stage 2
        sum_0_4 <= s1_0 + s1_1;
      end if;
    end process;
    out0_4 <= saturate(sum_0_4, 6);
  end block;

  -- LAYER 0, ch 5
  gen_l0c5 : block
  signal s1_0, s1_1, s1_2 : sum_t_0_5;
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
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_5.mem") port map (clk, input(11), act_0_11_5);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_5.mem") port map (clk, input(12), act_0_12_5);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_5.mem") port map (clk, input(14), act_0_14_5);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_5.mem") port map (clk, input(15), act_0_15_5);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_5, SUM_WIDTH_0_5) + resize(act_0_1_5, SUM_WIDTH_0_5) + resize(act_0_2_5, SUM_WIDTH_0_5) + resize(act_0_3_5, SUM_WIDTH_0_5);
        s1_1 <= resize(act_0_4_5, SUM_WIDTH_0_5) + resize(act_0_5_5, SUM_WIDTH_0_5) + resize(act_0_6_5, SUM_WIDTH_0_5) + resize(act_0_7_5, SUM_WIDTH_0_5);
        s1_2 <= resize(act_0_11_5, SUM_WIDTH_0_5) + resize(act_0_12_5, SUM_WIDTH_0_5) + resize(act_0_14_5, SUM_WIDTH_0_5) + resize(act_0_15_5, SUM_WIDTH_0_5);
        -- Stage 2
        sum_0_5 <= s1_0 + s1_1 + s1_2;
      end if;
    end process;
    out0_5 <= saturate(sum_0_5, 6);
  end block;

  -- LAYER 0, ch 6
  gen_l0c6 : block
  signal s1_0, s1_1, s1_2 : sum_t_0_6;
  signal sum_0_6 : sum_t_0_6;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_6.mem") port map (clk, input(1), act_0_1_6);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_6.mem") port map (clk, input(2), act_0_2_6);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_6.mem") port map (clk, input(3), act_0_3_6);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_6.mem") port map (clk, input(4), act_0_4_6);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_6.mem") port map (clk, input(5), act_0_5_6);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_6.mem") port map (clk, input(7), act_0_7_6);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_6.mem") port map (clk, input(8), act_0_8_6);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_6.mem") port map (clk, input(14), act_0_14_6);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_6.mem") port map (clk, input(15), act_0_15_6);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_1_6, SUM_WIDTH_0_6) + resize(act_0_2_6, SUM_WIDTH_0_6) + resize(act_0_3_6, SUM_WIDTH_0_6) + resize(act_0_4_6, SUM_WIDTH_0_6);
        s1_1 <= resize(act_0_5_6, SUM_WIDTH_0_6) + resize(act_0_7_6, SUM_WIDTH_0_6) + resize(act_0_8_6, SUM_WIDTH_0_6) + resize(act_0_14_6, SUM_WIDTH_0_6);
        s1_2 <= resize(act_0_15_6, SUM_WIDTH_0_6);
        -- Stage 2
        sum_0_6 <= s1_0 + s1_1 + s1_2;
      end if;
    end process;
    out0_6 <= saturate(sum_0_6, 6);
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
      end if;
  end process;

  -- LAYER 1, ch 0
  gen_l1c0 : block
  signal s1_0, s1_1 : sum_t_1_0;
  signal sum_1_0 : sum_t_1_0;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_0.mem") port map (clk, out0_0_reg, act_1_0_0);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_0.mem") port map (clk, out0_1_reg, act_1_1_0);
    i02 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_2_0.mem") port map (clk, out0_2_reg, act_1_2_0);
    i03 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_0.mem") port map (clk, out0_3_reg, act_1_3_0);
    i04 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_4_0.mem") port map (clk, out0_4_reg, act_1_4_0);
    i05 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_5_0.mem") port map (clk, out0_5_reg, act_1_5_0);
    i06 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_6_0.mem") port map (clk, out0_6_reg, act_1_6_0);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_1_0_0, SUM_WIDTH_1_0) + resize(act_1_1_0, SUM_WIDTH_1_0) + resize(act_1_2_0, SUM_WIDTH_1_0) + resize(act_1_3_0, SUM_WIDTH_1_0);
        s1_1 <= resize(act_1_4_0, SUM_WIDTH_1_0) + resize(act_1_5_0, SUM_WIDTH_1_0) + resize(act_1_6_0, SUM_WIDTH_1_0);
        -- Stage 2
        sum_1_0 <= s1_0 + s1_1;
      end if;
    end process;
    output(0) <= saturate(sum_1_0, 8);
  end block;

  -- LAYER 1, ch 1
  gen_l1c1 : block
  signal s1_0, s1_1 : sum_t_1_1;
  signal sum_1_1 : sum_t_1_1;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_1.mem") port map (clk, out0_0_reg, act_1_0_1);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_1.mem") port map (clk, out0_1_reg, act_1_1_1);
    i02 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_2_1.mem") port map (clk, out0_2_reg, act_1_2_1);
    i03 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_1.mem") port map (clk, out0_3_reg, act_1_3_1);
    i04 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_4_1.mem") port map (clk, out0_4_reg, act_1_4_1);
    i05 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_5_1.mem") port map (clk, out0_5_reg, act_1_5_1);
    i06 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_6_1.mem") port map (clk, out0_6_reg, act_1_6_1);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_1_0_1, SUM_WIDTH_1_1) + resize(act_1_1_1, SUM_WIDTH_1_1) + resize(act_1_2_1, SUM_WIDTH_1_1) + resize(act_1_3_1, SUM_WIDTH_1_1);
        s1_1 <= resize(act_1_4_1, SUM_WIDTH_1_1) + resize(act_1_5_1, SUM_WIDTH_1_1) + resize(act_1_6_1, SUM_WIDTH_1_1);
        -- Stage 2
        sum_1_1 <= s1_0 + s1_1;
      end if;
    end process;
    output(1) <= saturate(sum_1_1, 8);
  end block;

  -- LAYER 1, ch 2
  gen_l1c2 : block
  signal s1_0, s1_1 : sum_t_1_2;
  signal sum_1_2 : sum_t_1_2;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_2.mem") port map (clk, out0_0_reg, act_1_0_2);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_2.mem") port map (clk, out0_1_reg, act_1_1_2);
    i02 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_2_2.mem") port map (clk, out0_2_reg, act_1_2_2);
    i03 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_2.mem") port map (clk, out0_3_reg, act_1_3_2);
    i04 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_4_2.mem") port map (clk, out0_4_reg, act_1_4_2);
    i05 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_5_2.mem") port map (clk, out0_5_reg, act_1_5_2);
    i06 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_6_2.mem") port map (clk, out0_6_reg, act_1_6_2);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_1_0_2, SUM_WIDTH_1_2) + resize(act_1_1_2, SUM_WIDTH_1_2) + resize(act_1_2_2, SUM_WIDTH_1_2) + resize(act_1_3_2, SUM_WIDTH_1_2);
        s1_1 <= resize(act_1_4_2, SUM_WIDTH_1_2) + resize(act_1_5_2, SUM_WIDTH_1_2) + resize(act_1_6_2, SUM_WIDTH_1_2);
        -- Stage 2
        sum_1_2 <= s1_0 + s1_1;
      end if;
    end process;
    output(2) <= saturate(sum_1_2, 8);
  end block;

  -- LAYER 1, ch 3
  gen_l1c3 : block
  signal s1_0, s1_1 : sum_t_1_3;
  signal sum_1_3 : sum_t_1_3;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_3.mem") port map (clk, out0_0_reg, act_1_0_3);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_3.mem") port map (clk, out0_1_reg, act_1_1_3);
    i02 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_2_3.mem") port map (clk, out0_2_reg, act_1_2_3);
    i03 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_3.mem") port map (clk, out0_3_reg, act_1_3_3);
    i04 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_4_3.mem") port map (clk, out0_4_reg, act_1_4_3);
    i05 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_5_3.mem") port map (clk, out0_5_reg, act_1_5_3);
    i06 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_6_3.mem") port map (clk, out0_6_reg, act_1_6_3);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_1_0_3, SUM_WIDTH_1_3) + resize(act_1_1_3, SUM_WIDTH_1_3) + resize(act_1_2_3, SUM_WIDTH_1_3) + resize(act_1_3_3, SUM_WIDTH_1_3);
        s1_1 <= resize(act_1_4_3, SUM_WIDTH_1_3) + resize(act_1_5_3, SUM_WIDTH_1_3) + resize(act_1_6_3, SUM_WIDTH_1_3);
        -- Stage 2
        sum_1_3 <= s1_0 + s1_1;
      end if;
    end process;
    output(3) <= saturate(sum_1_3, 8);
  end block;

  -- LAYER 1, ch 4
  gen_l1c4 : block
  signal s1_0, s1_1 : sum_t_1_4;
  signal sum_1_4 : sum_t_1_4;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_4.mem") port map (clk, out0_0_reg, act_1_0_4);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_4.mem") port map (clk, out0_1_reg, act_1_1_4);
    i02 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_2_4.mem") port map (clk, out0_2_reg, act_1_2_4);
    i03 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_4.mem") port map (clk, out0_3_reg, act_1_3_4);
    i04 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_4_4.mem") port map (clk, out0_4_reg, act_1_4_4);
    i05 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_5_4.mem") port map (clk, out0_5_reg, act_1_5_4);
    i06 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_6_4.mem") port map (clk, out0_6_reg, act_1_6_4);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_1_0_4, SUM_WIDTH_1_4) + resize(act_1_1_4, SUM_WIDTH_1_4) + resize(act_1_2_4, SUM_WIDTH_1_4) + resize(act_1_3_4, SUM_WIDTH_1_4);
        s1_1 <= resize(act_1_4_4, SUM_WIDTH_1_4) + resize(act_1_5_4, SUM_WIDTH_1_4) + resize(act_1_6_4, SUM_WIDTH_1_4);
        -- Stage 2
        sum_1_4 <= s1_0 + s1_1;
      end if;
    end process;
    output(4) <= saturate(sum_1_4, 8);
  end block;

end architecture;