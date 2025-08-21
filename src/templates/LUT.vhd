library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.PkgLUT.all;

library xpm;
use xpm.vcomponents.all;

entity {{LUT_LAYER_NAME}} is
    generic (
        MEMFILE          : string ;
        READ_LATENCY     : integer  := 1;
        MEMORY_PRIMITIVE : string   := "distributed"
    );
    port (
        clk : in std_logic;
        d : in {{LUT_INPUT_TYPE}};
        q : out {{LUT_OUTPUT_TYPE}}
    );
end entity;

architecture rtl of {{LUT_LAYER_NAME}} is

    signal idx : unsigned({{LUT_LAYER_NAME}}_ADDR_WIDTH-1 downto 0);
    signal rom_q : std_logic_vector({{LUT_LAYER_NAME}}_DATA_WIDTH-1 downto 0);

    begin

        -- Convert signed to unsigned index 
        idx <= unsigned(d + to_signed(2**({{LUT_LAYER_NAME}}_ADDR_WIDTH-1), {{LUT_LAYER_NAME}}_ADDR_WIDTH));

        -- Synchronous ROM read
        rom_i : xpm_memory_sprom
        generic map (
            ADDR_WIDTH_A        => {{LUT_LAYER_NAME}}_ADDR_WIDTH,
            AUTO_SLEEP_TIME     => 0,
            MEMORY_INIT_FILE    => MEMFILE,
            MEMORY_INIT_PARAM   => "",
            MEMORY_OPTIMIZATION => "true",
            MEMORY_PRIMITIVE    => MEMORY_PRIMITIVE,
            MEMORY_SIZE         => {{LUT_LAYER_NAME}}_SIZE * {{LUT_LAYER_NAME}}_DATA_WIDTH,
            READ_DATA_WIDTH_A   => {{LUT_LAYER_NAME}}_DATA_WIDTH,
            READ_LATENCY_A      => READ_LATENCY,
            READ_RESET_VALUE_A  => "0",
            USE_MEM_INIT        => 1
        )
        port map (
            addra  => std_logic_vector(idx),
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