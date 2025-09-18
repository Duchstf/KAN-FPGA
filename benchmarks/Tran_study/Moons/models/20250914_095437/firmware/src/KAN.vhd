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
  -- Layer 0 (2->2)
  signal act_0_0_0, act_0_0_1, act_0_1_0, act_0_1_1 : lut_output_t_0;
  signal out0_0, out0_1 : lut_output_t_0;
  signal out0_0_reg, out0_1_reg : lut_output_t_0;

-- Layer 1 (2->1)
  signal act_1_0_0, act_1_1_0 : lut_output_t_1;
begin

  -- === auto: layer blocks ===
  -- LAYER 0, ch 0
  gen_l0c0 : block
  signal sum_0_0 : sum_t_0_0;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_0.mem") port map (clk, input(0), act_0_0_0);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_0.mem") port map (clk, input(1), act_0_1_0);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        sum_0_0 <= resize(act_0_0_0, SUM_WIDTH_0_0) + resize(act_0_1_0, SUM_WIDTH_0_0);
      end if;
    end process;
    out0_0 <= saturate(sum_0_0, 5);
  end block;

  -- LAYER 0, ch 1
  gen_l0c1 : block
  signal sum_0_1 : sum_t_0_1;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_1.mem") port map (clk, input(0), act_0_0_1);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_1.mem") port map (clk, input(1), act_0_1_1);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        sum_0_1 <= resize(act_0_0_1, SUM_WIDTH_0_1) + resize(act_0_1_1, SUM_WIDTH_0_1);
      end if;
    end process;
    out0_1 <= saturate(sum_0_1, 5);
  end block;

  -- Register block for layer 0
  out_layer0_reg : process(clk)
    begin
      if rising_edge(clk) then
        out0_0_reg <= out0_0;
        out0_1_reg <= out0_1;
      end if;
  end process;

  -- LAYER 1, ch 0
  gen_l1c0 : block
  signal sum_1_0 : sum_t_1_0;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_0.mem") port map (clk, out0_0_reg, act_1_0_0);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_0.mem") port map (clk, out0_1_reg, act_1_1_0);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        sum_1_0 <= resize(act_1_0_0, SUM_WIDTH_1_0) + resize(act_1_1_0, SUM_WIDTH_1_0);
      end if;
    end process;
    output(0) <= saturate(sum_1_0, 8);
  end block;

end architecture;