library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package PkgKAN is
  -- Model parameters
  constant N_INPUT  : positive := 16;
  constant N_OUTPUT : positive := 5;

  -- bitwidths
  constant INPUT_WIDTH : positive := 6;
  constant OUTPUT_WIDTH : positive := 8;

  subtype input_t  is unsigned(INPUT_WIDTH-1 downto 0);
  subtype output_t is signed(OUTPUT_WIDTH-1 downto 0);

  type input_vec_t  is array (0 to N_INPUT-1)  of input_t;
  type output_vec_t is array (0 to N_OUTPUT-1) of output_t;

  -- For summation
  constant SUM_WIDTH_0_0: positive := 10;
  subtype sum_t_0_0 is signed(SUM_WIDTH_0_0-1 downto 0);
  constant SUM_WIDTH_0_1: positive := 10;
  subtype sum_t_0_1 is signed(SUM_WIDTH_0_1-1 downto 0);
  constant SUM_WIDTH_0_2: positive := 10;
  subtype sum_t_0_2 is signed(SUM_WIDTH_0_2-1 downto 0);
  constant SUM_WIDTH_0_3: positive := 10;
  subtype sum_t_0_3 is signed(SUM_WIDTH_0_3-1 downto 0);
  constant SUM_WIDTH_0_4: positive := 10;
  subtype sum_t_0_4 is signed(SUM_WIDTH_0_4-1 downto 0);
  constant SUM_WIDTH_0_5: positive := 10;
  subtype sum_t_0_5 is signed(SUM_WIDTH_0_5-1 downto 0);
  constant SUM_WIDTH_0_6: positive := 10;
  subtype sum_t_0_6 is signed(SUM_WIDTH_0_6-1 downto 0);
  constant SUM_WIDTH_0_7: positive := 10;
  subtype sum_t_0_7 is signed(SUM_WIDTH_0_7-1 downto 0);
  constant SUM_WIDTH_0_8: positive := 10;
  subtype sum_t_0_8 is signed(SUM_WIDTH_0_8-1 downto 0);
  constant SUM_WIDTH_0_9: positive := 10;
  subtype sum_t_0_9 is signed(SUM_WIDTH_0_9-1 downto 0);
  constant SUM_WIDTH_0_10: positive := 10;
  subtype sum_t_0_10 is signed(SUM_WIDTH_0_10-1 downto 0);
  constant SUM_WIDTH_0_11: positive := 10;
  subtype sum_t_0_11 is signed(SUM_WIDTH_0_11-1 downto 0);
  constant SUM_WIDTH_0_12: positive := 10;
  subtype sum_t_0_12 is signed(SUM_WIDTH_0_12-1 downto 0);
  constant SUM_WIDTH_0_13: positive := 10;
  subtype sum_t_0_13 is signed(SUM_WIDTH_0_13-1 downto 0);
  constant SUM_WIDTH_0_14: positive := 10;
  subtype sum_t_0_14 is signed(SUM_WIDTH_0_14-1 downto 0);
  constant SUM_WIDTH_0_15: positive := 10;
  subtype sum_t_0_15 is signed(SUM_WIDTH_0_15-1 downto 0);
  constant SUM_WIDTH_0_16: positive := 10;
  subtype sum_t_0_16 is signed(SUM_WIDTH_0_16-1 downto 0);
  constant SUM_WIDTH_0_17: positive := 10;
  subtype sum_t_0_17 is signed(SUM_WIDTH_0_17-1 downto 0);
  constant SUM_WIDTH_0_18: positive := 10;
  subtype sum_t_0_18 is signed(SUM_WIDTH_0_18-1 downto 0);
  constant SUM_WIDTH_0_19: positive := 10;
  subtype sum_t_0_19 is signed(SUM_WIDTH_0_19-1 downto 0);
  constant SUM_WIDTH_0_20: positive := 10;
  subtype sum_t_0_20 is signed(SUM_WIDTH_0_20-1 downto 0);
  constant SUM_WIDTH_0_21: positive := 10;
  subtype sum_t_0_21 is signed(SUM_WIDTH_0_21-1 downto 0);
  constant SUM_WIDTH_0_22: positive := 10;
  subtype sum_t_0_22 is signed(SUM_WIDTH_0_22-1 downto 0);
  constant SUM_WIDTH_0_23: positive := 10;
  subtype sum_t_0_23 is signed(SUM_WIDTH_0_23-1 downto 0);
  constant SUM_WIDTH_0_24: positive := 10;
  subtype sum_t_0_24 is signed(SUM_WIDTH_0_24-1 downto 0);
  constant SUM_WIDTH_0_25: positive := 10;
  subtype sum_t_0_25 is signed(SUM_WIDTH_0_25-1 downto 0);
  constant SUM_WIDTH_0_26: positive := 10;
  subtype sum_t_0_26 is signed(SUM_WIDTH_0_26-1 downto 0);
  constant SUM_WIDTH_0_27: positive := 10;
  subtype sum_t_0_27 is signed(SUM_WIDTH_0_27-1 downto 0);
  constant SUM_WIDTH_0_28: positive := 10;
  subtype sum_t_0_28 is signed(SUM_WIDTH_0_28-1 downto 0);
  constant SUM_WIDTH_0_29: positive := 10;
  subtype sum_t_0_29 is signed(SUM_WIDTH_0_29-1 downto 0);
  constant SUM_WIDTH_0_30: positive := 10;
  subtype sum_t_0_30 is signed(SUM_WIDTH_0_30-1 downto 0);
  constant SUM_WIDTH_0_31: positive := 10;
  subtype sum_t_0_31 is signed(SUM_WIDTH_0_31-1 downto 0);
  constant SUM_WIDTH_0_32: positive := 10;
  subtype sum_t_0_32 is signed(SUM_WIDTH_0_32-1 downto 0);
  constant SUM_WIDTH_0_33: positive := 10;
  subtype sum_t_0_33 is signed(SUM_WIDTH_0_33-1 downto 0);
  constant SUM_WIDTH_0_34: positive := 10;
  subtype sum_t_0_34 is signed(SUM_WIDTH_0_34-1 downto 0);
  constant SUM_WIDTH_0_35: positive := 10;
  subtype sum_t_0_35 is signed(SUM_WIDTH_0_35-1 downto 0);
  constant SUM_WIDTH_0_36: positive := 10;
  subtype sum_t_0_36 is signed(SUM_WIDTH_0_36-1 downto 0);
  constant SUM_WIDTH_0_37: positive := 10;
  subtype sum_t_0_37 is signed(SUM_WIDTH_0_37-1 downto 0);
  constant SUM_WIDTH_0_38: positive := 10;
  subtype sum_t_0_38 is signed(SUM_WIDTH_0_38-1 downto 0);
  constant SUM_WIDTH_0_39: positive := 10;
  subtype sum_t_0_39 is signed(SUM_WIDTH_0_39-1 downto 0);
  constant SUM_WIDTH_0_40: positive := 10;
  subtype sum_t_0_40 is signed(SUM_WIDTH_0_40-1 downto 0);
  constant SUM_WIDTH_0_41: positive := 10;
  subtype sum_t_0_41 is signed(SUM_WIDTH_0_41-1 downto 0);
  constant SUM_WIDTH_0_42: positive := 10;
  subtype sum_t_0_42 is signed(SUM_WIDTH_0_42-1 downto 0);
  constant SUM_WIDTH_0_43: positive := 10;
  subtype sum_t_0_43 is signed(SUM_WIDTH_0_43-1 downto 0);
  constant SUM_WIDTH_0_44: positive := 10;
  subtype sum_t_0_44 is signed(SUM_WIDTH_0_44-1 downto 0);
  constant SUM_WIDTH_0_45: positive := 10;
  subtype sum_t_0_45 is signed(SUM_WIDTH_0_45-1 downto 0);
  constant SUM_WIDTH_0_46: positive := 10;
  subtype sum_t_0_46 is signed(SUM_WIDTH_0_46-1 downto 0);
  constant SUM_WIDTH_0_47: positive := 10;
  subtype sum_t_0_47 is signed(SUM_WIDTH_0_47-1 downto 0);
  constant SUM_WIDTH_0_48: positive := 10;
  subtype sum_t_0_48 is signed(SUM_WIDTH_0_48-1 downto 0);
  constant SUM_WIDTH_0_49: positive := 10;
  subtype sum_t_0_49 is signed(SUM_WIDTH_0_49-1 downto 0);
  constant SUM_WIDTH_0_50: positive := 10;
  subtype sum_t_0_50 is signed(SUM_WIDTH_0_50-1 downto 0);
  constant SUM_WIDTH_0_51: positive := 10;
  subtype sum_t_0_51 is signed(SUM_WIDTH_0_51-1 downto 0);
  constant SUM_WIDTH_0_52: positive := 10;
  subtype sum_t_0_52 is signed(SUM_WIDTH_0_52-1 downto 0);
  constant SUM_WIDTH_0_53: positive := 10;
  subtype sum_t_0_53 is signed(SUM_WIDTH_0_53-1 downto 0);
  constant SUM_WIDTH_0_54: positive := 10;
  subtype sum_t_0_54 is signed(SUM_WIDTH_0_54-1 downto 0);
  constant SUM_WIDTH_0_55: positive := 10;
  subtype sum_t_0_55 is signed(SUM_WIDTH_0_55-1 downto 0);
  constant SUM_WIDTH_0_56: positive := 10;
  subtype sum_t_0_56 is signed(SUM_WIDTH_0_56-1 downto 0);
  constant SUM_WIDTH_0_57: positive := 10;
  subtype sum_t_0_57 is signed(SUM_WIDTH_0_57-1 downto 0);
  constant SUM_WIDTH_0_58: positive := 10;
  subtype sum_t_0_58 is signed(SUM_WIDTH_0_58-1 downto 0);
  constant SUM_WIDTH_0_59: positive := 10;
  subtype sum_t_0_59 is signed(SUM_WIDTH_0_59-1 downto 0);
  constant SUM_WIDTH_0_60: positive := 10;
  subtype sum_t_0_60 is signed(SUM_WIDTH_0_60-1 downto 0);
  constant SUM_WIDTH_0_61: positive := 10;
  subtype sum_t_0_61 is signed(SUM_WIDTH_0_61-1 downto 0);
  constant SUM_WIDTH_0_62: positive := 10;
  subtype sum_t_0_62 is signed(SUM_WIDTH_0_62-1 downto 0);
  constant SUM_WIDTH_0_63: positive := 10;
  subtype sum_t_0_63 is signed(SUM_WIDTH_0_63-1 downto 0);
  constant SUM_WIDTH_1_0: positive := 14;
  subtype sum_t_1_0 is signed(SUM_WIDTH_1_0-1 downto 0);
  constant SUM_WIDTH_1_1: positive := 14;
  subtype sum_t_1_1 is signed(SUM_WIDTH_1_1-1 downto 0);
  constant SUM_WIDTH_1_2: positive := 14;
  subtype sum_t_1_2 is signed(SUM_WIDTH_1_2-1 downto 0);
  constant SUM_WIDTH_1_3: positive := 14;
  subtype sum_t_1_3 is signed(SUM_WIDTH_1_3-1 downto 0);
  constant SUM_WIDTH_1_4: positive := 14;
  subtype sum_t_1_4 is signed(SUM_WIDTH_1_4-1 downto 0);
  
  -- Function to saturate a signed value into W-bit signed range
  function saturate(x : signed; W : positive) return signed;
end package PkgKAN;

package body PkgKAN is
  -- Function to saturate a signed value into W-bit signed range
  function saturate(x : signed; W : positive) return signed is
      constant MAX_W_BITS : signed(W-1 downto 0) := (W-1 => '0', others => '1');
      constant MIN_W_BITS : signed(W-1 downto 0) := (W-1 => '1', others => '0');

      variable max_for_comp : signed(x'length-1 downto 0) := resize(MAX_W_BITS, x'length);
      variable min_for_comp : signed(x'length-1 downto 0) := resize(MIN_W_BITS, x'length);
      
      variable result : signed(W-1 downto 0);
  begin
      if x > max_for_comp then
          result := MAX_W_BITS;
      elsif x < min_for_comp then
          result := MIN_W_BITS;
      else
          result := resize(x, W);
      end if;

      return result;
  end function;
end package body PkgKAN;