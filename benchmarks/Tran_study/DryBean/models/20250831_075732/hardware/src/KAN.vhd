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
  -- Layer 0 (16->2)
  signal act_0_0_0, act_0_0_1, act_0_1_0, act_0_1_1, act_0_2_0, act_0_2_1, act_0_3_0, act_0_3_1, act_0_4_0, act_0_4_1, act_0_5_0, act_0_5_1, act_0_6_0, act_0_6_1, act_0_7_0, act_0_7_1 : lut_output_t_0;
  signal act_0_8_0, act_0_8_1, act_0_9_0, act_0_9_1, act_0_10_0, act_0_10_1, act_0_11_0, act_0_11_1, act_0_12_0, act_0_12_1, act_0_13_0, act_0_13_1, act_0_14_0, act_0_14_1, act_0_15_0, act_0_15_1 : lut_output_t_0;
  signal out0_0, out0_1 : lut_output_t_0;

-- Layer 1 (2->7)
  signal act_1_0_0, act_1_0_1, act_1_0_2, act_1_0_3, act_1_0_4, act_1_0_5, act_1_0_6, act_1_1_0, act_1_1_1, act_1_1_2, act_1_1_3, act_1_1_4, act_1_1_5, act_1_1_6 : lut_output_t_1;
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
    out0_0 <= act_0_0_0 + act_0_1_0 + act_0_2_0 + act_0_3_0 + act_0_4_0 + act_0_5_0 + act_0_6_0 + act_0_7_0 + act_0_8_0 + act_0_9_0 + act_0_10_0 + act_0_11_0 + act_0_12_0 + act_0_13_0 + act_0_14_0 + act_0_15_0;
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
    out0_1 <= act_0_0_1 + act_0_1_1 + act_0_2_1 + act_0_3_1 + act_0_4_1 + act_0_5_1 + act_0_6_1 + act_0_7_1 + act_0_8_1 + act_0_9_1 + act_0_10_1 + act_0_11_1 + act_0_12_1 + act_0_13_1 + act_0_14_1 + act_0_15_1;
  end block;

  -- LAYER 1, ch 0
  gen_l1c0 : block
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_0.mem") port map (clk, out0_0, act_1_0_0);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_0.mem") port map (clk, out0_1, act_1_1_0);
    output(0) <= act_1_0_0 + act_1_1_0;
  end block;

  -- LAYER 1, ch 1
  gen_l1c1 : block
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_1.mem") port map (clk, out0_0, act_1_0_1);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_1.mem") port map (clk, out0_1, act_1_1_1);
    output(1) <= act_1_0_1 + act_1_1_1;
  end block;

  -- LAYER 1, ch 2
  gen_l1c2 : block
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_2.mem") port map (clk, out0_0, act_1_0_2);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_2.mem") port map (clk, out0_1, act_1_1_2);
    output(2) <= act_1_0_2 + act_1_1_2;
  end block;

  -- LAYER 1, ch 3
  gen_l1c3 : block
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_3.mem") port map (clk, out0_0, act_1_0_3);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_3.mem") port map (clk, out0_1, act_1_1_3);
    output(3) <= act_1_0_3 + act_1_1_3;
  end block;

  -- LAYER 1, ch 4
  gen_l1c4 : block
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_4.mem") port map (clk, out0_0, act_1_0_4);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_4.mem") port map (clk, out0_1, act_1_1_4);
    output(4) <= act_1_0_4 + act_1_1_4;
  end block;

  -- LAYER 1, ch 5
  gen_l1c5 : block
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_5.mem") port map (clk, out0_0, act_1_0_5);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_5.mem") port map (clk, out0_1, act_1_1_5);
    output(5) <= act_1_0_5 + act_1_1_5;
  end block;

  -- LAYER 1, ch 6
  gen_l1c6 : block
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_6.mem") port map (clk, out0_0, act_1_0_6);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_6.mem") port map (clk, out0_1, act_1_1_6);
    output(6) <= act_1_0_6 + act_1_1_6;
  end block;

end architecture;
