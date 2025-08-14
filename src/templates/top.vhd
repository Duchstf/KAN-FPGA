library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
    port (
      clk    : in  std_logic;
      en     : in  std_logic := '1';
      din    : in  input_vec_t;
      dout   : out result_vec_t
    );
end entity;

architecture rtl of top is

begin
    kan_inst : entity work.KAN
        port map (
            clk    => clk,
            en     => en,
            input  => din,
            output => dout
        );  
end architecture;