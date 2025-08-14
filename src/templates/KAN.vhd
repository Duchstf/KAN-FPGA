library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.types_pkg.all;

entity KAN is
  port (
    clk    : in  std_logic;
    en     : in  std_logic := '1';
    input  : in  input_vec_t;
    output : out result_vec_t
  );
end entity;

architecture rtl of KAN is
  -- === auto: signal declarations ===
  {{SIGNAL_DECLS}}
begin

  -- === auto: layer blocks ===
  {{LAYER_BLOCKS}}

end architecture;
