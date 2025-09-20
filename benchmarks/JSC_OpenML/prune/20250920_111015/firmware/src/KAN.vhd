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
  signal act_0_14_3 : lut_output_t_0;
  signal out0_0, out0_1, out0_2, out0_3, out0_4, out0_5, out0_6, out0_7 : lut_output_t_0;
  signal out0_0_reg, out0_1_reg, out0_2_reg, out0_3_reg, out0_4_reg, out0_5_reg, out0_6_reg, out0_7_reg : lut_output_t_0;

-- Layer 1 (8->5)
  signal act_1_1_0, act_1_1_2, act_1_1_4, act_1_3_2, act_1_3_3, act_1_3_4 : lut_output_t_1;
begin

  -- === auto: layer blocks ===
  -- LAYER 0, ch 0
  gen_l0c0 : block
  
  begin
    out0_0 <= (others => '0');
  end block;

  -- LAYER 0, ch 1
  gen_l0c1 : block
  
  begin
    out0_1 <= (others => '0');
  end block;

  -- LAYER 0, ch 2
  gen_l0c2 : block
  
  begin
    out0_2 <= (others => '0');
  end block;

  -- LAYER 0, ch 3
  gen_l0c3 : block
  signal sum_0_3 : sum_t_0_3;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_3.mem") port map (clk, input(14), act_0_14_3);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        sum_0_3 <= resize(act_0_14_3, SUM_WIDTH_0_3);
      end if;
    end process;
    out0_3 <= saturate(sum_0_3, 6);
  end block;

  -- LAYER 0, ch 4
  gen_l0c4 : block
  
  begin
    out0_4 <= (others => '0');
  end block;

  -- LAYER 0, ch 5
  gen_l0c5 : block
  
  begin
    out0_5 <= (others => '0');
  end block;

  -- LAYER 0, ch 6
  gen_l0c6 : block
  
  begin
    out0_6 <= (others => '0');
  end block;

  -- LAYER 0, ch 7
  gen_l0c7 : block
  
  begin
    out0_7 <= (others => '0');
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
      end if;
  end process;

  -- LAYER 1, ch 0
  gen_l1c0 : block
  signal sum_1_0 : sum_t_1_0;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_0.mem") port map (clk, out0_1_reg, act_1_1_0);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        sum_1_0 <= resize(act_1_1_0, SUM_WIDTH_1_0);
      end if;
    end process;
    output(0) <= saturate(sum_1_0, 8);
  end block;

  -- LAYER 1, ch 1
  gen_l1c1 : block
  
  begin
    output(1) <= (others => '0');
  end block;

  -- LAYER 1, ch 2
  gen_l1c2 : block
  signal sum_1_2 : sum_t_1_2;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_2.mem") port map (clk, out0_1_reg, act_1_1_2);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_2.mem") port map (clk, out0_3_reg, act_1_3_2);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        sum_1_2 <= resize(act_1_1_2, SUM_WIDTH_1_2) + resize(act_1_3_2, SUM_WIDTH_1_2);
      end if;
    end process;
    output(2) <= saturate(sum_1_2, 8);
  end block;

  -- LAYER 1, ch 3
  gen_l1c3 : block
  signal sum_1_3 : sum_t_1_3;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_3.mem") port map (clk, out0_3_reg, act_1_3_3);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        sum_1_3 <= resize(act_1_3_3, SUM_WIDTH_1_3);
      end if;
    end process;
    output(3) <= saturate(sum_1_3, 8);
  end block;

  -- LAYER 1, ch 4
  gen_l1c4 : block
  signal sum_1_4 : sum_t_1_4;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_4.mem") port map (clk, out0_1_reg, act_1_1_4);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_4.mem") port map (clk, out0_3_reg, act_1_3_4);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        sum_1_4 <= resize(act_1_1_4, SUM_WIDTH_1_4) + resize(act_1_3_4, SUM_WIDTH_1_4);
      end if;
    end process;
    output(4) <= saturate(sum_1_4, 8);
  end block;

end architecture;