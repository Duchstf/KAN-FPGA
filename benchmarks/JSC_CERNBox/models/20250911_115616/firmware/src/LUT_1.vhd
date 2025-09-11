library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.PkgLUT.all;

entity LUT_1 is
    generic (
        INPUT_WIDTH  : positive;
        OUTPUT_WIDTH : positive;
        LUT_TABLE    : lut_array_t_1 
    );
    port (
        clk : in std_logic;
        d : in  signed(INPUT_WIDTH-1 downto 0);
        q : out signed(OUTPUT_WIDTH-1 downto 0)
    );
end entity;

architecture rtl of LUT_1 is
    begin
        process(clk)
        variable index : unsigned(INPUT_WIDTH-1 downto 0);
        begin
            if rising_edge(clk) then
                index := unsigned(d); -- Bit patterns still the same
                index(INPUT_WIDTH-1) := not index(INPUT_WIDTH-1);
                q <= LUT_TABLE(to_integer(index));
            end if;
        end process;
end architecture;