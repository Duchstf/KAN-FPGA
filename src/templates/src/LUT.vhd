library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.PkgLUT.all;

entity {{LUT_NAME}} is
    generic (
        INPUT_WIDTH  : positive;
        OUTPUT_WIDTH : positive;
        LUT_MAP    : {{LUT_MAP_TYPE}} 
    );
    port (
        clk : in std_logic;
        d   : in signed(INPUT_WIDTH-1 downto 0);
        q   : out signed(OUTPUT_WIDTH-1 downto 0)
    );
end entity;

architecture rtl of  {{LUT_NAME}} is
    signal index : integer;
begin

    -- Index conversion logic
    process(d)
        variable temp_index : unsigned(INPUT_WIDTH-1 downto 0);
    begin
        temp_index := unsigned(d);
        temp_index(INPUT_WIDTH-1) := not temp_index(INPUT_WIDTH-1);
        index <= to_integer(temp_index);
    end process;

    -- Implements the generic lookup logic
    process(clk)
        variable lo, hi, mid : integer;
        variable result : signed(OUTPUT_WIDTH-1 downto 0);
    begin
    if rising_edge(clk) then
        lo := LUT_MAP'low;
        hi := LUT_MAP'high;
        result := (others => '0');

        while lo <= hi loop
            mid := (lo + hi) / 2;
            if index < LUT_MAP(mid).start_index then
                hi := mid - 1;
            elsif index > LUT_MAP(mid).end_index then
                lo := mid + 1;
            else
                result := LUT_MAP(mid).value;
                exit;
            end if;
        end loop;

        q <= result;
    end if;
    end process;

end architecture;