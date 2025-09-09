-- tb_kan.vhd (template)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity tb_kan is end;
architecture sim of tb_kan is
  constant N_INPUT   : integer := {{N_INPUT}};
  constant N_OUTPUT  : integer := {{N_OUTPUT}};
  constant IN_WIDTH  : integer := {{IN_WIDTH}};
  constant OUT_WIDTH : integer := {{OUT_WIDTH}};

  component {{TOP_NAME}} is
    port(
      ap_clk   : in  std_logic;
      ap_rst   : in  std_logic;
      ap_start : in  std_logic;
      ap_done  : out std_logic;
{{PORT_DECL_INPUTS}}
{{PORT_DECL_OUTPUTS}}
    );
  end component;

  signal clk   : std_logic := '0';
  signal rst   : std_logic := '1';
  signal start : std_logic := '0';
  signal done  : std_logic;

{{INPUT_SIGNAL_DECLS}}
{{OUTPUT_SIGNAL_DECLS}}

  type in_vec_t  is array (natural range <>) of unsigned(IN_WIDTH-1 downto 0);
  type out_vec_t is array (natural range <>) of signed(OUT_WIDTH-1 downto 0);
  signal in_bus  : in_vec_t (0 to N_INPUT-1);
  signal out_bus : out_vec_t(0 to N_OUTPUT-1);

begin
  clk <= not clk after 5 ns;
  process begin rst <= '1'; wait for 50 ns; rst <= '0'; wait; end process;

{{INPUT_ASSIGNMENTS}}
{{OUTPUT_ASSIGNMENTS}}

  UUT: {{TOP_NAME}} port map(
    ap_clk=>clk, ap_rst=>rst, ap_start=>start, ap_done=>done,
{{PORTMAP_INPUTS}}
{{PORTMAP_OUTPUTS}}
  );

  file fin  : text open read_mode  is "vectors_in.txt";
  file fout : text open read_mode  is "vectors_out.txt";

  procedure read_in_line(signal v: out in_vec_t; L: inout line) is
    variable val: integer;
  begin
    for i in v'range loop read(L,val); v(i) <= to_unsigned(val, IN_WIDTH); end loop;
  end;

  procedure read_out_line(signal v: out out_vec_t; L: inout line) is
    variable val: integer;
  begin
    for i in v'range loop read(L,val); v(i) <= to_signed(val, OUT_WIDTH); end loop;
  end;

  stim: process
    variable l_in  : line;
    variable l_out : line;
    variable expv  : out_vec_t(0 to N_OUTPUT-1);
    variable total, errs : integer := 0;
  begin
    wait until rst='0'; wait until rising_edge(clk);
    while not endfile(fin) loop
      readline(fin,  l_in);  read_in_line(in_bus, l_in);
      readline(fout, l_out); read_out_line(expv,   l_out);

      start <= '1'; wait until rising_edge(clk); start <= '0';
      wait until rising_edge(clk) and done='1';

      for i in 0 to N_OUTPUT-1 loop
        if out_bus(i) /= expv(i) then
          errs := errs + 1;
          report "Mismatch vec=" & integer'image(total) &
                 " out[" & integer'image(i) & "] got=" &
                 integer'image(to_integer(out_bus(i))) &
                 " exp=" & integer'image(to_integer(expv(i))) severity warning;
        end if;
      end loop;
      total := total + 1;
    end loop;

    if errs = 0 then
      report "ALL TESTS PASSED (" & integer'image(total) & " vectors)" severity note;
    else
      assert false report "TEST FAILED: " & integer'image(errs) severity failure;
    end if;
    wait;
  end process;
end;
