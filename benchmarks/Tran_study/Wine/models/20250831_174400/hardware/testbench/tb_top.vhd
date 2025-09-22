library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.PkgTypes.all;

entity tb_top is
end entity;

architecture sim of tb_top is
  signal clk  : std_logic := '0';
  signal en   : std_logic := '0';
  signal din  : input_vec_t  := (others => (others => '0'));
  signal dout : output_vec_t;

  constant CLK_PERIOD : time := 2 ns; -- 200 MHz

  -- For array-of-signed you need nested 'others'
  constant DIN_ZERO : input_vec_t := (others => (others => '0'));
  constant DIN_ONE  : input_vec_t := (others => (others => '1'));

begin
  -- 200 MHz clock
  clk <= not clk after CLK_PERIOD/2;

  -- DUT
  uut : entity work.top
    port map (
      clk  => clk,
      en   => en,
      din  => din,
      dout => dout
    );

  -- Simple stimulus to measure pipeline latency in cycles:
  -- count rising edges from the input change until dout changes from baseline.
  stim : process
    variable baseline_dout : output_vec_t := (others => (others => '0'));
    variable cycles        : integer := 0;
  begin
    -- Hold disabled a few cycles
    en <= '0';
    din <= DIN_ZERO;
    for i in 0 to 9 loop
      wait until rising_edge(clk);
    end loop;

    -- Enable and let pipeline warm up on baseline input
    en <= '1';
    for i in 0 to 9 loop
      wait until rising_edge(clk);
    end loop;

    -- Capture baseline output
    baseline_dout := dout;

    -- Change input at a clock edge
    wait until rising_edge(clk);
    din <= DIN_ONE;

    -- Count cycles until dout != baseline
    cycles := 0;
    while dout = baseline_dout loop
      wait until rising_edge(clk);
      cycles := cycles + 1;
      if cycles > 100000 then
        report "LATENCY_CYCLES=NA (no change observed)" severity note;
        wait;
      end if;
    end loop;

    report "LATENCY_CYCLES=" & integer'image(cycles) severity note;

    wait;
  end process;

end architecture;
