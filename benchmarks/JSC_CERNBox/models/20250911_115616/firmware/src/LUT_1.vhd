library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.PkgLUT.all;

entity LUT_1 is
    generic (
        INPUT_WIDTH  : positive;
        OUTPUT_WIDTH : positive;
        LUT_MAP    : lut_map_array_t_1 
    );
    port (
        clk : in std_logic;
        d   : in signed(INPUT_WIDTH-1 downto 0);
        q   : out signed(OUTPUT_WIDTH-1 downto 0)
    );
end entity;

architecture rtl of  LUT_1 is
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
    begin
        if rising_edge(clk) then
            q <= (others => '0');
            for i in LUT_MAP'range loop
                if index >= LUT_MAP(i).start_index and index <= LUT_MAP(i).end_index then
                    q <= resize(LUT_MAP(i).value, OUTPUT_WIDTH);
                end if;
            end loop;
        end if;
    end process;

end architecture;