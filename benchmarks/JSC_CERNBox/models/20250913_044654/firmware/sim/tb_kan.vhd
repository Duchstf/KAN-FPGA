-- tb_kan.vhd (always print expected & got vectors)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

library work;
use work.PkgKAN.all;

entity tb_kan is
end entity;

architecture sim of tb_kan is
  signal clk : std_logic := '0';
  constant TCLK : time := 10 ns; -- 100 MHz
  signal en  : std_logic := '1';

  -- Input and output vectors
  signal din  : input_vec_t  := (others => (others => '0'));
  signal dout : output_vec_t;

  constant LATENCY : natural := 10;

  ---------------------------------------------------------------------------
  -- Helper: integer -> same kind (signed/unsigned) as template
  ---------------------------------------------------------------------------
  function to_same_kind(val : integer; template : signed) return signed is
  begin
    return to_signed(val, template'length);
  end function;

  function to_same_kind(val : integer; template : unsigned) return unsigned is
  begin
    return to_unsigned(val, template'length);
  end function;

  ---------------------------------------------------------------------------
  -- Read a line of N integers into an array SIGNAL of signed/unsigned elements
  ---------------------------------------------------------------------------
  procedure read_line_into(signal v : inout input_vec_t; L : inout line) is
    variable val : integer;
  begin
    for i in v'range loop
      read(L, val);
      v(i) <= to_same_kind(val, v(i));
    end loop;
  end procedure;

  ---------------------------------------------------------------------------
  -- Read a line of N integers into an array VARIABLE of signed/unsigned elements
  ---------------------------------------------------------------------------
  procedure read_line_into(variable v : inout output_vec_t; L : inout line) is
    variable val : integer;
  begin
    for i in v'range loop
      read(L, val);
      v(i) := to_same_kind(val, v(i));
    end loop;
  end procedure;

  ---------------------------------------------------------------------------
  -- Pretty-print an output vector as integers
  ---------------------------------------------------------------------------
  procedure report_vec(prefix : string; vec_idx : integer; v : in output_vec_t) is
    variable L : line;
  begin
    write(L, prefix & " vec=" & integer'image(vec_idx) & " [");
    for i in v'range loop
      write(L, integer'image(to_integer(v(i))));
      if i /= v'high then
        write(L, string'(", "));
      end if;
    end loop;
    write(L, string'("]"));
    report L.all severity note;
    deallocate(L);
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
    file fin  : text open read_mode is "vectors_in.txt";
    file fout : text open read_mode is "vectors_out.txt";

    variable l_in, l_out : line;
    variable expv : output_vec_t;  -- expected output vector (variable)
    variable gotv : output_vec_t;  -- captured DUT output
    variable total       : integer := 0;
    variable errs        : integer := 0;
  begin
    -- Let clocks settle a bit
    for k in 0 to 3 loop
      wait until rising_edge(clk);
    end loop;

    -- Drive enable high
    en <= '1';

    while not endfile(fin) loop
      readline(fin,  l_in);
      read_line_into(din,  l_in);   -- drive inputs immediately
      readline(fout, l_out);
      read_line_into(expv, l_out);  -- load expected outputs

      -- Wait pipeline latency
      wait until rising_edge(clk);
      for k in 1 to LATENCY-1 loop
        wait until rising_edge(clk);
      end loop;

      -- Sample outputs one tiny delta after the last edge
      wait for 1 ns;
      gotv := dout;

      -- Always print expected and got vectors
      report_vec("EXP", total, expv);
      report_vec("GOT", total, gotv);

      -- Compare
      for i in gotv'range loop
        if gotv(i) /= expv(i) then
          errs := errs + 1;
          report "Mismatch @vec=" & integer'image(total) &
                 " out[" & integer'image(i) & "] got=" &
                 integer'image(to_integer(gotv(i))) &
                 " exp=" & integer'image(to_integer(expv(i)))
                 severity warning;
        end if;
      end loop;

      total := total + 1;
    end loop;

    if errs = 0 then
      report "ALL TESTS PASSED (" & integer'image(total) & " vectors)" severity note;
    else
      assert false
        report "TEST FAILED: " & integer'image(errs) & " mismatches out of "
               & integer'image(total) & " vectors"
        severity failure;
    end if;

    wait;
  end process;
end architecture;
