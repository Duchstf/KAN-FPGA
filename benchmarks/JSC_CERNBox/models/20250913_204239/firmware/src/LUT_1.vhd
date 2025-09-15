library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.PkgLUT.all;

library xpm;
use xpm.vcomponents.all;

entity LUT_1 is
    generic (
        MEMFILE          : string ;
        READ_LATENCY     : integer  := 2;
        MEMORY_PRIMITIVE : string   := "auto"
    );
    port (
        clk : in std_logic;
        d : in lut_input_t_1;
        q : out lut_output_t_1
    );
end entity;

architecture rtl of LUT_1 is
    signal idx_unregistered : unsigned(LUT_ADDR_WIDTH_1-1 downto 0);
    signal idx_registered   : unsigned(LUT_ADDR_WIDTH_1-1 downto 0);
    signal rom_q            : std_logic_vector(LUT_DATA_WIDTH_1-1 downto 0);

    begin

        -- Step 1: Combinational address calculation (use the optimized version from above)
        idx_unregistered <= unsigned( (not d(d'left)) & d(d'left-1 downto 0) );

        -- Step 2: Register the address to pipeline the logic
        process (clk)
        begin
            if rising_edge(clk) then
                idx_registered <= idx_unregistered;
            end if;
        end process;

        -- Synchronous ROM read
        rom_i : xpm_memory_sprom
        generic map (
            ADDR_WIDTH_A        => LUT_ADDR_WIDTH_1,
            AUTO_SLEEP_TIME     => 0,
            MEMORY_INIT_FILE    => MEMFILE,
            MEMORY_INIT_PARAM   => "",
            MEMORY_OPTIMIZATION => "true",
            MEMORY_PRIMITIVE    => MEMORY_PRIMITIVE,
            MEMORY_SIZE         => LUT_SIZE_1 * LUT_DATA_WIDTH_1,
            READ_DATA_WIDTH_A   => LUT_DATA_WIDTH_1,
            READ_LATENCY_A      => READ_LATENCY,
            READ_RESET_VALUE_A  => "0",
            USE_MEM_INIT        => 1
        )
        port map (
            addra  => std_logic_vector(idx_registered),
            clka   => clk,
            ena    => '1',
            regcea => '1',
            rsta   => '0',
            sleep  => '0',
            injectdbiterra => '0', -- tie off
            injectsbiterra => '0', -- tie off
            dbiterra     => open, -- unused output
            sbiterra     => open, -- unused output
            douta  => rom_q
        );

        q <= signed(rom_q);

end architecture;