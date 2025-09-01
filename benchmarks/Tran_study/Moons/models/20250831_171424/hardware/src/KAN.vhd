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
  -- Layer 0 (2->2)
  signal act_0_0_0, act_0_0_1, act_0_1_0, act_0_1_1 : lut_output_t_0;
  signal out0_0, out0_1 : lut_output_t_0;

-- Layer 1 (2->1)
  signal act_1_0_0, act_1_1_0 : lut_output_t_1;
begin

  -- === auto: layer blocks ===
  -- LAYER 0, ch 0
  gen_l0c0 : block
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_0.mem") port map (clk, input(0), act_0_0_0);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_0.mem") port map (clk, input(1), act_0_1_0);
    out0_0 <= act_0_0_0 + act_0_1_0;
  end block;

  -- LAYER 0, ch 1
  gen_l0c1 : block
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_1.mem") port map (clk, input(0), act_0_0_1);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_1.mem") port map (clk, input(1), act_0_1_1);
    out0_1 <= act_0_0_1 + act_0_1_1;
  end block;

  -- LAYER 1, ch 0
  gen_l1c0 : block
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_0.mem") port map (clk, out0_0, act_1_0_0);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_0.mem") port map (clk, out0_1, act_1_1_0);
    output(0) <= act_1_0_0 + act_1_1_0;
  end block;

end architecture;
