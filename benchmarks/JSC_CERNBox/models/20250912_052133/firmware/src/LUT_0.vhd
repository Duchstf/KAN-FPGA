library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.PkgLUT.all;

library xpm;
use xpm.vcomponents.all;

entity LUT_0 is
    generic (
        MEMFILE          : string ;
        READ_LATENCY     : integer  := 0;
        MEMORY_PRIMITIVE : string   := "distributed"
    );
    port (
        clk : in std_logic;
        d : in lut_input_t_0;
        q : out lut_output_t_0
    );
end entity;

architecture rtl of LUT_0 is
    
    signal rom_q : std_logic_vector(LUT_DATA_WIDTH_0-1 downto 0);

    begin

        

        -- Synchronous ROM read
        rom_i : xpm_memory_sprom
        generic map (
            ADDR_WIDTH_A        => LUT_ADDR_WIDTH_0,
            AUTO_SLEEP_TIME     => 0,
            MEMORY_INIT_FILE    => MEMFILE,
            MEMORY_INIT_PARAM   => "",
            MEMORY_OPTIMIZATION => "true",
            MEMORY_PRIMITIVE    => MEMORY_PRIMITIVE,
            MEMORY_SIZE         => LUT_SIZE_0 * LUT_DATA_WIDTH_0,
            READ_DATA_WIDTH_A   => LUT_DATA_WIDTH_0,
            READ_LATENCY_A      => READ_LATENCY,
            READ_RESET_VALUE_A  => "0",
            USE_MEM_INIT        => 1
        )
        port map (
            addra  => std_logic_vector(d),
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