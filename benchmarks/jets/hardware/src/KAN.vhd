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
  -- Layer 0 (16->5)
  signal act_0_0_0, act_0_0_2, act_0_1_2, act_0_2_0, act_0_2_1, act_0_2_2, act_0_2_3, act_0_2_4, act_0_3_0, act_0_3_1, act_0_3_2, act_0_3_3, act_0_3_4, act_0_4_0, act_0_4_1, act_0_4_3 : lut_output_t_0;
  signal act_0_4_4, act_0_5_2, act_0_5_4, act_0_7_1, act_0_8_0, act_0_9_1, act_0_9_2, act_0_9_4, act_0_10_2, act_0_10_3, act_0_10_4, act_0_11_1, act_0_11_2, act_0_12_0, act_0_12_1, act_0_12_2 : lut_output_t_0;
  signal act_0_12_3, act_0_13_1, act_0_13_4, act_0_14_0, act_0_14_1, act_0_14_2, act_0_14_3, act_0_14_4, act_0_15_0, act_0_15_1, act_0_15_2, act_0_15_3, act_0_15_4 : lut_output_t_0;
  signal out0_0, out0_1, out0_2, out0_3, out0_4 : lut_output_t_0;

-- Layer 1 (5->5)
  signal act_1_0_0, act_1_0_1, act_1_0_2, act_1_0_3, act_1_0_4, act_1_1_0, act_1_1_1, act_1_1_2, act_1_1_3, act_1_1_4, act_1_2_0, act_1_2_1, act_1_2_2, act_1_2_3, act_1_2_4, act_1_3_0 : lut_output_t_1;
  signal act_1_3_1, act_1_3_2, act_1_3_3, act_1_3_4, act_1_4_0, act_1_4_1, act_1_4_2, act_1_4_3, act_1_4_4 : lut_output_t_1;
begin

  -- === auto: layer blocks ===
  -- LAYER 0, ch 0
  gen_l0c0 : block
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_0.mem") port map (clk, input(0), act_0_0_0);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_0.mem") port map (clk, input(2), act_0_2_0);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_0.mem") port map (clk, input(3), act_0_3_0);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_0.mem") port map (clk, input(4), act_0_4_0);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_0.mem") port map (clk, input(8), act_0_8_0);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_0.mem") port map (clk, input(12), act_0_12_0);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_0.mem") port map (clk, input(14), act_0_14_0);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_0.mem") port map (clk, input(15), act_0_15_0);
    out0_0 <= act_0_0_0 + act_0_2_0 + act_0_3_0 + act_0_4_0 + act_0_8_0 + act_0_12_0 + act_0_14_0 + act_0_15_0;
  end block;

  -- LAYER 0, ch 1
  gen_l0c1 : block
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_1.mem") port map (clk, input(2), act_0_2_1);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_1.mem") port map (clk, input(3), act_0_3_1);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_1.mem") port map (clk, input(4), act_0_4_1);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_1.mem") port map (clk, input(7), act_0_7_1);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_1.mem") port map (clk, input(9), act_0_9_1);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_1.mem") port map (clk, input(11), act_0_11_1);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_1.mem") port map (clk, input(12), act_0_12_1);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_1.mem") port map (clk, input(13), act_0_13_1);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_1.mem") port map (clk, input(14), act_0_14_1);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_1.mem") port map (clk, input(15), act_0_15_1);
    out0_1 <= act_0_2_1 + act_0_3_1 + act_0_4_1 + act_0_7_1 + act_0_9_1 + act_0_11_1 + act_0_12_1 + act_0_13_1 + act_0_14_1 + act_0_15_1;
  end block;

  -- LAYER 0, ch 2
  gen_l0c2 : block
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_2.mem") port map (clk, input(0), act_0_0_2);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_2.mem") port map (clk, input(1), act_0_1_2);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_2.mem") port map (clk, input(2), act_0_2_2);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_2.mem") port map (clk, input(3), act_0_3_2);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_2.mem") port map (clk, input(5), act_0_5_2);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_2.mem") port map (clk, input(9), act_0_9_2);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_2.mem") port map (clk, input(10), act_0_10_2);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_2.mem") port map (clk, input(11), act_0_11_2);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_2.mem") port map (clk, input(12), act_0_12_2);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_2.mem") port map (clk, input(14), act_0_14_2);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_2.mem") port map (clk, input(15), act_0_15_2);
    out0_2 <= act_0_0_2 + act_0_1_2 + act_0_2_2 + act_0_3_2 + act_0_5_2 + act_0_9_2 + act_0_10_2 + act_0_11_2 + act_0_12_2 + act_0_14_2 + act_0_15_2;
  end block;

  -- LAYER 0, ch 3
  gen_l0c3 : block
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_3.mem") port map (clk, input(2), act_0_2_3);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_3.mem") port map (clk, input(3), act_0_3_3);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_3.mem") port map (clk, input(4), act_0_4_3);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_3.mem") port map (clk, input(10), act_0_10_3);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_3.mem") port map (clk, input(12), act_0_12_3);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_3.mem") port map (clk, input(14), act_0_14_3);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_3.mem") port map (clk, input(15), act_0_15_3);
    out0_3 <= act_0_2_3 + act_0_3_3 + act_0_4_3 + act_0_10_3 + act_0_12_3 + act_0_14_3 + act_0_15_3;
  end block;

  -- LAYER 0, ch 4
  gen_l0c4 : block
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_4.mem") port map (clk, input(2), act_0_2_4);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_4.mem") port map (clk, input(3), act_0_3_4);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_4.mem") port map (clk, input(4), act_0_4_4);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_4.mem") port map (clk, input(5), act_0_5_4);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_4.mem") port map (clk, input(9), act_0_9_4);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_4.mem") port map (clk, input(10), act_0_10_4);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_4.mem") port map (clk, input(13), act_0_13_4);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_4.mem") port map (clk, input(14), act_0_14_4);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_4.mem") port map (clk, input(15), act_0_15_4);
    out0_4 <= act_0_2_4 + act_0_3_4 + act_0_4_4 + act_0_5_4 + act_0_9_4 + act_0_10_4 + act_0_13_4 + act_0_14_4 + act_0_15_4;
  end block;

  -- LAYER 1, ch 0
  gen_l1c0 : block
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_0.mem") port map (clk, out0_0, act_1_0_0);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_0.mem") port map (clk, out0_1, act_1_1_0);
    i02 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_2_0.mem") port map (clk, out0_2, act_1_2_0);
    i03 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_0.mem") port map (clk, out0_3, act_1_3_0);
    i04 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_4_0.mem") port map (clk, out0_4, act_1_4_0);
    output(0) <= act_1_0_0 + act_1_1_0 + act_1_2_0 + act_1_3_0 + act_1_4_0;
  end block;

  -- LAYER 1, ch 1
  gen_l1c1 : block
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_1.mem") port map (clk, out0_0, act_1_0_1);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_1.mem") port map (clk, out0_1, act_1_1_1);
    i02 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_2_1.mem") port map (clk, out0_2, act_1_2_1);
    i03 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_1.mem") port map (clk, out0_3, act_1_3_1);
    i04 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_4_1.mem") port map (clk, out0_4, act_1_4_1);
    output(1) <= act_1_0_1 + act_1_1_1 + act_1_2_1 + act_1_3_1 + act_1_4_1;
  end block;

  -- LAYER 1, ch 2
  gen_l1c2 : block
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_2.mem") port map (clk, out0_0, act_1_0_2);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_2.mem") port map (clk, out0_1, act_1_1_2);
    i02 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_2_2.mem") port map (clk, out0_2, act_1_2_2);
    i03 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_2.mem") port map (clk, out0_3, act_1_3_2);
    i04 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_4_2.mem") port map (clk, out0_4, act_1_4_2);
    output(2) <= act_1_0_2 + act_1_1_2 + act_1_2_2 + act_1_3_2 + act_1_4_2;
  end block;

  -- LAYER 1, ch 3
  gen_l1c3 : block
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_3.mem") port map (clk, out0_0, act_1_0_3);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_3.mem") port map (clk, out0_1, act_1_1_3);
    i02 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_2_3.mem") port map (clk, out0_2, act_1_2_3);
    i03 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_3.mem") port map (clk, out0_3, act_1_3_3);
    i04 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_4_3.mem") port map (clk, out0_4, act_1_4_3);
    output(3) <= act_1_0_3 + act_1_1_3 + act_1_2_3 + act_1_3_3 + act_1_4_3;
  end block;

  -- LAYER 1, ch 4
  gen_l1c4 : block
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_4.mem") port map (clk, out0_0, act_1_0_4);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_4.mem") port map (clk, out0_1, act_1_1_4);
    i02 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_2_4.mem") port map (clk, out0_2, act_1_2_4);
    i03 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_4.mem") port map (clk, out0_3, act_1_3_4);
    i04 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_4_4.mem") port map (clk, out0_4, act_1_4_4);
    output(4) <= act_1_0_4 + act_1_1_4 + act_1_2_4 + act_1_3_4 + act_1_4_4;
  end block;

end architecture;
