-- tb_kan_latency.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

library work;
use work.PkgKAN.all;

entity tb_kan_latency is end entity;

architecture sim of tb_kan_latency is
  signal clk : std_logic := '0';
  constant TCLK : time := 10 ns; -- 100 MHz
  signal en  : std_logic := '1';

  signal din  : input_vec_t  := (others => (others => '0'));
  signal dout : output_vec_t;

  -- How many cycles to ensure baseline is stable, and how many to confirm the new value
  constant FLUSH_CYCLES  : natural := 32;
  constant STABLE_CONFIRM: natural := 2;  -- require this many identical samples after change

  -- Helpers to read one line of N ints into a signal of signed/unsigned elements
  function to_same_kind(val : integer; template : signed) return signed is
  begin return to_signed(val, template'length); end;
  function to_same_kind(val : integer; template : unsigned) return unsigned is
  begin return to_unsigned(val, template'length); end;

  procedure read_line_into(signal v : inout input_vec_t; L : inout line) is
    variable val : integer;
  begin
    for i in v'range loop
      read(L, val); v(i) <= to_same_kind(val, v(i));
    end loop;
  end procedure;

begin
  clk <= not clk after TCLK/2;

  UUT : entity work.KAN
    port map (
      clk    => clk,
      en     => en,
      input  => din,
      output => dout
    );

  stim : process
    file fin : text open read_mode is "vectors_in.txt";  -- uses first two lines only
    variable l_in : line;
    variable baseline, newval : output_vec_t;
    variable latency_cycles   : integer := -1;
    variable c, stable_same   : natural := 0;
    variable changed, confirmed : boolean := false;
  begin
    -- settle clocks
    for k in 0 to 3 loop wait until rising_edge(clk); end loop;

    -- Load A
    if endfile(fin) then
      assert false report "vectors_in.txt needs at least 2 lines" severity failure;
      wait;
    end if;
    readline(fin, l_in); read_line_into(din, l_in);

    -- Hold A and capture baseline after FLUSH_CYCLES
    for k in 1 to FLUSH_CYCLES loop wait until rising_edge(clk); end loop;
    wait for 1 ns; baseline := dout;

    -- Load B
    if endfile(fin) then
      assert false report "vectors_in.txt needs at least 2 lines" severity failure;
      wait;
    end if;
    readline(fin, l_in); read_line_into(din, l_in);

    -- Start counting from the cycle AFTER we apply B
    c := 0; changed := false; confirmed := false; stable_same := 0;

    while not confirmed loop
      wait until rising_edge(clk);
      c := c + 1;
      wait for 1 ns;

      if not changed then
        if dout /= baseline then
          changed := true;
          latency_cycles := c;  -- first cycle where output differs from baseline
          newval := dout;
          stable_same := 1;
        end if;
      else
        if dout = newval then
          stable_same := stable_same + 1;
          if stable_same >= STABLE_CONFIRM then
            confirmed := true;
          end if;
        else
          -- Glitch or multi-step change; restart confirmation on the new value
          newval := dout;
          stable_same := 1;
          latency_cycles := c; -- keep first-change as latency; or comment this line to require stability
        end if;
      end if;

      -- safety stop
      if c > 10000 then
        assert false report "Timeout: no stable change detected; inputs likely map to same output" severity failure;
        wait;
      end if;
    end loop;

    if latency_cycles >= 0 then
      report "Measured pipeline latency = " & integer'image(latency_cycles) & " cycles" severity note;
    else
      report "Inconclusive: output did not change (f(A)=f(B)?)" severity warning;
    end if;

    wait;
  end process;
end architecture;
