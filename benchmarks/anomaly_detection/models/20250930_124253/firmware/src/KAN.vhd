library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.PkgKAN.all;
use work.PkgLUT.all;

entity KAN is
  port (
    clk    : in  std_logic;
    en     : in  std_logic := '1';
    input  : in  input_vec_t;
    output : out output_vec_t
  );
end entity;

architecture rtl of KAN is
  -- === auto: signal declarations ===
  -- Layer 0 (64->16)
  signal act_0_0_0, act_0_0_1, act_0_0_2, act_0_0_3, act_0_0_4, act_0_0_5, act_0_0_6, act_0_0_7, act_0_0_8, act_0_0_9, act_0_0_10, act_0_0_11, act_0_0_12, act_0_0_13, act_0_0_14, act_0_0_15 : lut_output_t_0;
  signal act_0_1_0, act_0_1_1, act_0_1_2, act_0_1_3, act_0_1_4, act_0_1_5, act_0_1_6, act_0_1_7, act_0_1_8, act_0_1_9, act_0_1_10, act_0_1_11, act_0_1_12, act_0_1_13, act_0_1_14, act_0_1_15 : lut_output_t_0;
  signal act_0_2_0, act_0_2_1, act_0_2_2, act_0_2_3, act_0_2_4, act_0_2_5, act_0_2_6, act_0_2_7, act_0_2_8, act_0_2_9, act_0_2_10, act_0_2_11, act_0_2_12, act_0_2_13, act_0_2_14, act_0_2_15 : lut_output_t_0;
  signal act_0_3_0, act_0_3_1, act_0_3_2, act_0_3_3, act_0_3_4, act_0_3_5, act_0_3_6, act_0_3_7, act_0_3_8, act_0_3_9, act_0_3_10, act_0_3_11, act_0_3_12, act_0_3_13, act_0_3_14, act_0_3_15 : lut_output_t_0;
  signal act_0_4_0, act_0_4_1, act_0_4_2, act_0_4_3, act_0_4_4, act_0_4_5, act_0_4_6, act_0_4_7, act_0_4_8, act_0_4_9, act_0_4_10, act_0_4_11, act_0_4_12, act_0_4_13, act_0_4_14, act_0_4_15 : lut_output_t_0;
  signal act_0_5_0, act_0_5_1, act_0_5_2, act_0_5_3, act_0_5_4, act_0_5_5, act_0_5_6, act_0_5_7, act_0_5_8, act_0_5_9, act_0_5_10, act_0_5_11, act_0_5_12, act_0_5_13, act_0_5_14, act_0_5_15 : lut_output_t_0;
  signal act_0_6_0, act_0_6_1, act_0_6_2, act_0_6_3, act_0_6_4, act_0_6_5, act_0_6_6, act_0_6_7, act_0_6_8, act_0_6_9, act_0_6_10, act_0_6_11, act_0_6_12, act_0_6_13, act_0_6_14, act_0_6_15 : lut_output_t_0;
  signal act_0_7_0, act_0_7_1, act_0_7_2, act_0_7_3, act_0_7_4, act_0_7_5, act_0_7_6, act_0_7_7, act_0_7_8, act_0_7_9, act_0_7_10, act_0_7_11, act_0_7_12, act_0_7_13, act_0_7_14, act_0_7_15 : lut_output_t_0;
  signal act_0_8_0, act_0_8_1, act_0_8_2, act_0_8_3, act_0_8_4, act_0_8_5, act_0_8_6, act_0_8_7, act_0_8_8, act_0_8_9, act_0_8_10, act_0_8_11, act_0_8_12, act_0_8_13, act_0_8_14, act_0_8_15 : lut_output_t_0;
  signal act_0_9_0, act_0_9_1, act_0_9_2, act_0_9_3, act_0_9_4, act_0_9_5, act_0_9_6, act_0_9_7, act_0_9_8, act_0_9_9, act_0_9_10, act_0_9_11, act_0_9_12, act_0_9_13, act_0_9_14, act_0_9_15 : lut_output_t_0;
  signal act_0_10_0, act_0_10_1, act_0_10_2, act_0_10_3, act_0_10_4, act_0_10_5, act_0_10_6, act_0_10_7, act_0_10_8, act_0_10_9, act_0_10_10, act_0_10_11, act_0_10_12, act_0_10_13, act_0_10_14, act_0_10_15 : lut_output_t_0;
  signal act_0_11_0, act_0_11_1, act_0_11_2, act_0_11_3, act_0_11_4, act_0_11_5, act_0_11_6, act_0_11_7, act_0_11_8, act_0_11_9, act_0_11_10, act_0_11_11, act_0_11_12, act_0_11_13, act_0_11_14, act_0_11_15 : lut_output_t_0;
  signal act_0_12_0, act_0_12_1, act_0_12_2, act_0_12_3, act_0_12_4, act_0_12_5, act_0_12_6, act_0_12_7, act_0_12_8, act_0_12_9, act_0_12_10, act_0_12_11, act_0_12_12, act_0_12_13, act_0_12_14, act_0_12_15 : lut_output_t_0;
  signal act_0_13_0, act_0_13_1, act_0_13_2, act_0_13_3, act_0_13_4, act_0_13_5, act_0_13_6, act_0_13_7, act_0_13_8, act_0_13_9, act_0_13_10, act_0_13_11, act_0_13_12, act_0_13_13, act_0_13_14, act_0_13_15 : lut_output_t_0;
  signal act_0_14_0, act_0_14_1, act_0_14_2, act_0_14_3, act_0_14_4, act_0_14_5, act_0_14_6, act_0_14_7, act_0_14_8, act_0_14_9, act_0_14_10, act_0_14_11, act_0_14_12, act_0_14_13, act_0_14_14, act_0_14_15 : lut_output_t_0;
  signal act_0_15_0, act_0_15_1, act_0_15_2, act_0_15_3, act_0_15_4, act_0_15_5, act_0_15_6, act_0_15_7, act_0_15_8, act_0_15_9, act_0_15_10, act_0_15_11, act_0_15_12, act_0_15_13, act_0_15_14, act_0_15_15 : lut_output_t_0;
  signal act_0_16_0, act_0_16_1, act_0_16_2, act_0_16_3, act_0_16_4, act_0_16_5, act_0_16_6, act_0_16_7, act_0_16_8, act_0_16_9, act_0_16_10, act_0_16_11, act_0_16_12, act_0_16_13, act_0_16_14, act_0_16_15 : lut_output_t_0;
  signal act_0_17_0, act_0_17_1, act_0_17_2, act_0_17_3, act_0_17_4, act_0_17_5, act_0_17_6, act_0_17_7, act_0_17_8, act_0_17_9, act_0_17_10, act_0_17_11, act_0_17_12, act_0_17_13, act_0_17_14, act_0_17_15 : lut_output_t_0;
  signal act_0_18_0, act_0_18_1, act_0_18_2, act_0_18_3, act_0_18_4, act_0_18_5, act_0_18_6, act_0_18_7, act_0_18_8, act_0_18_9, act_0_18_10, act_0_18_11, act_0_18_12, act_0_18_13, act_0_18_14, act_0_18_15 : lut_output_t_0;
  signal act_0_19_0, act_0_19_1, act_0_19_2, act_0_19_3, act_0_19_4, act_0_19_5, act_0_19_6, act_0_19_7, act_0_19_8, act_0_19_9, act_0_19_10, act_0_19_11, act_0_19_12, act_0_19_13, act_0_19_14, act_0_19_15 : lut_output_t_0;
  signal act_0_20_0, act_0_20_1, act_0_20_2, act_0_20_3, act_0_20_4, act_0_20_5, act_0_20_6, act_0_20_7, act_0_20_8, act_0_20_9, act_0_20_10, act_0_20_11, act_0_20_12, act_0_20_13, act_0_20_14, act_0_20_15 : lut_output_t_0;
  signal act_0_21_0, act_0_21_1, act_0_21_2, act_0_21_3, act_0_21_4, act_0_21_5, act_0_21_6, act_0_21_7, act_0_21_8, act_0_21_9, act_0_21_10, act_0_21_11, act_0_21_12, act_0_21_13, act_0_21_14, act_0_21_15 : lut_output_t_0;
  signal act_0_22_0, act_0_22_1, act_0_22_2, act_0_22_3, act_0_22_4, act_0_22_5, act_0_22_6, act_0_22_7, act_0_22_8, act_0_22_9, act_0_22_10, act_0_22_11, act_0_22_12, act_0_22_13, act_0_22_14, act_0_22_15 : lut_output_t_0;
  signal act_0_23_0, act_0_23_1, act_0_23_2, act_0_23_3, act_0_23_4, act_0_23_5, act_0_23_6, act_0_23_7, act_0_23_8, act_0_23_9, act_0_23_10, act_0_23_11, act_0_23_12, act_0_23_13, act_0_23_14, act_0_23_15 : lut_output_t_0;
  signal act_0_24_0, act_0_24_1, act_0_24_2, act_0_24_3, act_0_24_4, act_0_24_5, act_0_24_6, act_0_24_7, act_0_24_8, act_0_24_9, act_0_24_10, act_0_24_11, act_0_24_12, act_0_24_13, act_0_24_14, act_0_24_15 : lut_output_t_0;
  signal act_0_25_0, act_0_25_1, act_0_25_2, act_0_25_3, act_0_25_4, act_0_25_5, act_0_25_6, act_0_25_7, act_0_25_8, act_0_25_9, act_0_25_10, act_0_25_11, act_0_25_12, act_0_25_13, act_0_25_14, act_0_25_15 : lut_output_t_0;
  signal act_0_26_0, act_0_26_1, act_0_26_2, act_0_26_3, act_0_26_4, act_0_26_5, act_0_26_6, act_0_26_7, act_0_26_8, act_0_26_9, act_0_26_10, act_0_26_11, act_0_26_12, act_0_26_13, act_0_26_14, act_0_26_15 : lut_output_t_0;
  signal act_0_27_0, act_0_27_1, act_0_27_2, act_0_27_3, act_0_27_4, act_0_27_5, act_0_27_6, act_0_27_7, act_0_27_8, act_0_27_9, act_0_27_10, act_0_27_11, act_0_27_12, act_0_27_13, act_0_27_14, act_0_27_15 : lut_output_t_0;
  signal act_0_28_0, act_0_28_1, act_0_28_2, act_0_28_3, act_0_28_4, act_0_28_5, act_0_28_6, act_0_28_7, act_0_28_8, act_0_28_9, act_0_28_10, act_0_28_11, act_0_28_12, act_0_28_13, act_0_28_14, act_0_28_15 : lut_output_t_0;
  signal act_0_29_0, act_0_29_1, act_0_29_2, act_0_29_3, act_0_29_4, act_0_29_5, act_0_29_6, act_0_29_7, act_0_29_8, act_0_29_9, act_0_29_10, act_0_29_11, act_0_29_12, act_0_29_13, act_0_29_14, act_0_29_15 : lut_output_t_0;
  signal act_0_30_0, act_0_30_1, act_0_30_2, act_0_30_3, act_0_30_4, act_0_30_5, act_0_30_6, act_0_30_7, act_0_30_8, act_0_30_9, act_0_30_10, act_0_30_11, act_0_30_12, act_0_30_13, act_0_30_14, act_0_30_15 : lut_output_t_0;
  signal act_0_31_0, act_0_31_1, act_0_31_2, act_0_31_3, act_0_31_4, act_0_31_5, act_0_31_6, act_0_31_7, act_0_31_8, act_0_31_9, act_0_31_10, act_0_31_11, act_0_31_12, act_0_31_13, act_0_31_14, act_0_31_15 : lut_output_t_0;
  signal act_0_32_0, act_0_32_1, act_0_32_2, act_0_32_3, act_0_32_4, act_0_32_5, act_0_32_6, act_0_32_7, act_0_32_8, act_0_32_9, act_0_32_10, act_0_32_11, act_0_32_12, act_0_32_13, act_0_32_14, act_0_32_15 : lut_output_t_0;
  signal act_0_33_0, act_0_33_1, act_0_33_2, act_0_33_3, act_0_33_4, act_0_33_5, act_0_33_6, act_0_33_7, act_0_33_8, act_0_33_9, act_0_33_10, act_0_33_11, act_0_33_12, act_0_33_13, act_0_33_14, act_0_33_15 : lut_output_t_0;
  signal act_0_34_0, act_0_34_1, act_0_34_2, act_0_34_3, act_0_34_4, act_0_34_5, act_0_34_6, act_0_34_7, act_0_34_8, act_0_34_9, act_0_34_10, act_0_34_11, act_0_34_12, act_0_34_13, act_0_34_14, act_0_34_15 : lut_output_t_0;
  signal act_0_35_0, act_0_35_1, act_0_35_2, act_0_35_3, act_0_35_4, act_0_35_5, act_0_35_6, act_0_35_7, act_0_35_8, act_0_35_9, act_0_35_10, act_0_35_11, act_0_35_12, act_0_35_13, act_0_35_14, act_0_35_15 : lut_output_t_0;
  signal act_0_36_0, act_0_36_1, act_0_36_2, act_0_36_3, act_0_36_4, act_0_36_5, act_0_36_6, act_0_36_7, act_0_36_8, act_0_36_9, act_0_36_10, act_0_36_11, act_0_36_12, act_0_36_13, act_0_36_14, act_0_36_15 : lut_output_t_0;
  signal act_0_37_0, act_0_37_1, act_0_37_2, act_0_37_3, act_0_37_4, act_0_37_5, act_0_37_6, act_0_37_7, act_0_37_8, act_0_37_9, act_0_37_10, act_0_37_11, act_0_37_12, act_0_37_13, act_0_37_14, act_0_37_15 : lut_output_t_0;
  signal act_0_38_0, act_0_38_1, act_0_38_2, act_0_38_3, act_0_38_4, act_0_38_5, act_0_38_6, act_0_38_7, act_0_38_8, act_0_38_9, act_0_38_10, act_0_38_11, act_0_38_12, act_0_38_13, act_0_38_14, act_0_38_15 : lut_output_t_0;
  signal act_0_39_0, act_0_39_1, act_0_39_2, act_0_39_3, act_0_39_4, act_0_39_5, act_0_39_6, act_0_39_7, act_0_39_8, act_0_39_9, act_0_39_10, act_0_39_11, act_0_39_12, act_0_39_13, act_0_39_14, act_0_39_15 : lut_output_t_0;
  signal act_0_40_0, act_0_40_1, act_0_40_2, act_0_40_3, act_0_40_4, act_0_40_5, act_0_40_6, act_0_40_7, act_0_40_8, act_0_40_9, act_0_40_10, act_0_40_11, act_0_40_12, act_0_40_13, act_0_40_14, act_0_40_15 : lut_output_t_0;
  signal act_0_41_0, act_0_41_1, act_0_41_2, act_0_41_3, act_0_41_4, act_0_41_5, act_0_41_6, act_0_41_7, act_0_41_8, act_0_41_9, act_0_41_10, act_0_41_11, act_0_41_12, act_0_41_13, act_0_41_14, act_0_41_15 : lut_output_t_0;
  signal act_0_42_0, act_0_42_1, act_0_42_2, act_0_42_3, act_0_42_4, act_0_42_5, act_0_42_6, act_0_42_7, act_0_42_8, act_0_42_9, act_0_42_10, act_0_42_11, act_0_42_12, act_0_42_13, act_0_42_14, act_0_42_15 : lut_output_t_0;
  signal act_0_43_0, act_0_43_1, act_0_43_2, act_0_43_3, act_0_43_4, act_0_43_5, act_0_43_6, act_0_43_7, act_0_43_8, act_0_43_9, act_0_43_10, act_0_43_11, act_0_43_12, act_0_43_13, act_0_43_14, act_0_43_15 : lut_output_t_0;
  signal act_0_44_0, act_0_44_1, act_0_44_2, act_0_44_3, act_0_44_4, act_0_44_5, act_0_44_6, act_0_44_7, act_0_44_8, act_0_44_9, act_0_44_10, act_0_44_11, act_0_44_12, act_0_44_13, act_0_44_14, act_0_44_15 : lut_output_t_0;
  signal act_0_45_0, act_0_45_1, act_0_45_2, act_0_45_3, act_0_45_4, act_0_45_5, act_0_45_6, act_0_45_7, act_0_45_8, act_0_45_9, act_0_45_10, act_0_45_11, act_0_45_12, act_0_45_13, act_0_45_14, act_0_45_15 : lut_output_t_0;
  signal act_0_46_0, act_0_46_1, act_0_46_2, act_0_46_3, act_0_46_4, act_0_46_5, act_0_46_6, act_0_46_7, act_0_46_8, act_0_46_9, act_0_46_10, act_0_46_11, act_0_46_12, act_0_46_13, act_0_46_14, act_0_46_15 : lut_output_t_0;
  signal act_0_47_0, act_0_47_1, act_0_47_2, act_0_47_3, act_0_47_4, act_0_47_5, act_0_47_6, act_0_47_7, act_0_47_8, act_0_47_9, act_0_47_10, act_0_47_11, act_0_47_12, act_0_47_13, act_0_47_14, act_0_47_15 : lut_output_t_0;
  signal act_0_48_0, act_0_48_1, act_0_48_2, act_0_48_3, act_0_48_4, act_0_48_5, act_0_48_6, act_0_48_7, act_0_48_8, act_0_48_9, act_0_48_10, act_0_48_11, act_0_48_12, act_0_48_13, act_0_48_14, act_0_48_15 : lut_output_t_0;
  signal act_0_49_0, act_0_49_1, act_0_49_2, act_0_49_3, act_0_49_4, act_0_49_5, act_0_49_6, act_0_49_7, act_0_49_8, act_0_49_9, act_0_49_10, act_0_49_11, act_0_49_12, act_0_49_13, act_0_49_14, act_0_49_15 : lut_output_t_0;
  signal act_0_50_0, act_0_50_1, act_0_50_2, act_0_50_3, act_0_50_4, act_0_50_5, act_0_50_6, act_0_50_7, act_0_50_8, act_0_50_9, act_0_50_10, act_0_50_11, act_0_50_12, act_0_50_13, act_0_50_14, act_0_50_15 : lut_output_t_0;
  signal act_0_51_0, act_0_51_1, act_0_51_2, act_0_51_3, act_0_51_4, act_0_51_5, act_0_51_6, act_0_51_7, act_0_51_8, act_0_51_9, act_0_51_10, act_0_51_11, act_0_51_12, act_0_51_13, act_0_51_14, act_0_51_15 : lut_output_t_0;
  signal act_0_52_0, act_0_52_1, act_0_52_2, act_0_52_3, act_0_52_4, act_0_52_5, act_0_52_6, act_0_52_7, act_0_52_8, act_0_52_9, act_0_52_10, act_0_52_11, act_0_52_12, act_0_52_13, act_0_52_14, act_0_52_15 : lut_output_t_0;
  signal act_0_53_0, act_0_53_1, act_0_53_2, act_0_53_3, act_0_53_4, act_0_53_5, act_0_53_6, act_0_53_7, act_0_53_8, act_0_53_9, act_0_53_10, act_0_53_11, act_0_53_12, act_0_53_13, act_0_53_14, act_0_53_15 : lut_output_t_0;
  signal act_0_54_0, act_0_54_1, act_0_54_2, act_0_54_3, act_0_54_4, act_0_54_5, act_0_54_6, act_0_54_7, act_0_54_8, act_0_54_9, act_0_54_10, act_0_54_11, act_0_54_12, act_0_54_13, act_0_54_14, act_0_54_15 : lut_output_t_0;
  signal act_0_55_0, act_0_55_1, act_0_55_2, act_0_55_3, act_0_55_4, act_0_55_5, act_0_55_6, act_0_55_7, act_0_55_8, act_0_55_9, act_0_55_10, act_0_55_11, act_0_55_12, act_0_55_13, act_0_55_14, act_0_55_15 : lut_output_t_0;
  signal act_0_56_0, act_0_56_1, act_0_56_2, act_0_56_3, act_0_56_4, act_0_56_5, act_0_56_6, act_0_56_7, act_0_56_8, act_0_56_9, act_0_56_10, act_0_56_11, act_0_56_12, act_0_56_13, act_0_56_14, act_0_56_15 : lut_output_t_0;
  signal act_0_57_0, act_0_57_1, act_0_57_2, act_0_57_3, act_0_57_4, act_0_57_5, act_0_57_6, act_0_57_7, act_0_57_8, act_0_57_9, act_0_57_10, act_0_57_11, act_0_57_12, act_0_57_13, act_0_57_14, act_0_57_15 : lut_output_t_0;
  signal act_0_58_0, act_0_58_1, act_0_58_2, act_0_58_3, act_0_58_4, act_0_58_5, act_0_58_6, act_0_58_7, act_0_58_8, act_0_58_9, act_0_58_10, act_0_58_11, act_0_58_12, act_0_58_13, act_0_58_14, act_0_58_15 : lut_output_t_0;
  signal act_0_59_0, act_0_59_1, act_0_59_2, act_0_59_3, act_0_59_4, act_0_59_5, act_0_59_6, act_0_59_7, act_0_59_8, act_0_59_9, act_0_59_10, act_0_59_11, act_0_59_12, act_0_59_13, act_0_59_14, act_0_59_15 : lut_output_t_0;
  signal act_0_60_0, act_0_60_1, act_0_60_2, act_0_60_3, act_0_60_4, act_0_60_5, act_0_60_6, act_0_60_7, act_0_60_8, act_0_60_9, act_0_60_10, act_0_60_11, act_0_60_12, act_0_60_13, act_0_60_14, act_0_60_15 : lut_output_t_0;
  signal act_0_61_0, act_0_61_1, act_0_61_2, act_0_61_3, act_0_61_4, act_0_61_5, act_0_61_6, act_0_61_7, act_0_61_8, act_0_61_9, act_0_61_10, act_0_61_11, act_0_61_12, act_0_61_13, act_0_61_14, act_0_61_15 : lut_output_t_0;
  signal act_0_62_0, act_0_62_1, act_0_62_2, act_0_62_3, act_0_62_4, act_0_62_5, act_0_62_6, act_0_62_7, act_0_62_8, act_0_62_9, act_0_62_10, act_0_62_11, act_0_62_12, act_0_62_13, act_0_62_14, act_0_62_15 : lut_output_t_0;
  signal act_0_63_0, act_0_63_1, act_0_63_2, act_0_63_3, act_0_63_4, act_0_63_5, act_0_63_6, act_0_63_7, act_0_63_8, act_0_63_9, act_0_63_10, act_0_63_11, act_0_63_12, act_0_63_13, act_0_63_14, act_0_63_15 : lut_output_t_0;
  signal out0_0, out0_1, out0_2, out0_3, out0_4, out0_5, out0_6, out0_7, out0_8, out0_9, out0_10, out0_11, out0_12, out0_13, out0_14, out0_15 : lut_output_t_0;
  signal out0_0_reg, out0_1_reg, out0_2_reg, out0_3_reg, out0_4_reg, out0_5_reg, out0_6_reg, out0_7_reg, out0_8_reg, out0_9_reg, out0_10_reg, out0_11_reg, out0_12_reg, out0_13_reg, out0_14_reg, out0_15_reg : lut_output_t_0;

-- Layer 1 (16->8)
  signal act_1_0_0, act_1_0_1, act_1_0_2, act_1_0_3, act_1_0_4, act_1_0_5, act_1_0_6, act_1_0_7, act_1_1_0, act_1_1_1, act_1_1_2, act_1_1_3, act_1_1_4, act_1_1_5, act_1_1_6, act_1_1_7 : lut_output_t_1;
  signal act_1_2_0, act_1_2_1, act_1_2_2, act_1_2_3, act_1_2_4, act_1_2_5, act_1_2_6, act_1_2_7, act_1_3_0, act_1_3_1, act_1_3_2, act_1_3_3, act_1_3_4, act_1_3_5, act_1_3_6, act_1_3_7 : lut_output_t_1;
  signal act_1_4_0, act_1_4_1, act_1_4_2, act_1_4_3, act_1_4_4, act_1_4_5, act_1_4_6, act_1_4_7, act_1_5_0, act_1_5_1, act_1_5_2, act_1_5_3, act_1_5_4, act_1_5_5, act_1_5_6, act_1_5_7 : lut_output_t_1;
  signal act_1_6_0, act_1_6_1, act_1_6_2, act_1_6_3, act_1_6_4, act_1_6_5, act_1_6_6, act_1_6_7, act_1_7_0, act_1_7_1, act_1_7_2, act_1_7_3, act_1_7_4, act_1_7_5, act_1_7_6, act_1_7_7 : lut_output_t_1;
  signal act_1_8_0, act_1_8_1, act_1_8_2, act_1_8_3, act_1_8_4, act_1_8_5, act_1_8_6, act_1_8_7, act_1_9_0, act_1_9_1, act_1_9_2, act_1_9_3, act_1_9_4, act_1_9_5, act_1_9_6, act_1_9_7 : lut_output_t_1;
  signal act_1_10_0, act_1_10_1, act_1_10_2, act_1_10_3, act_1_10_4, act_1_10_5, act_1_10_6, act_1_10_7, act_1_11_0, act_1_11_1, act_1_11_2, act_1_11_3, act_1_11_4, act_1_11_5, act_1_11_6, act_1_11_7 : lut_output_t_1;
  signal act_1_12_0, act_1_12_1, act_1_12_2, act_1_12_3, act_1_12_4, act_1_12_5, act_1_12_6, act_1_12_7, act_1_13_0, act_1_13_1, act_1_13_2, act_1_13_3, act_1_13_4, act_1_13_5, act_1_13_6, act_1_13_7 : lut_output_t_1;
  signal act_1_14_0, act_1_14_1, act_1_14_2, act_1_14_3, act_1_14_4, act_1_14_5, act_1_14_6, act_1_14_7, act_1_15_0, act_1_15_1, act_1_15_2, act_1_15_3, act_1_15_4, act_1_15_5, act_1_15_6, act_1_15_7 : lut_output_t_1;
  signal out1_0, out1_1, out1_2, out1_3, out1_4, out1_5, out1_6, out1_7 : lut_output_t_1;
  signal out1_0_reg, out1_1_reg, out1_2_reg, out1_3_reg, out1_4_reg, out1_5_reg, out1_6_reg, out1_7_reg : lut_output_t_1;

-- Layer 2 (8->16)
  signal act_2_0_0, act_2_0_1, act_2_0_2, act_2_0_3, act_2_0_4, act_2_0_5, act_2_0_6, act_2_0_7, act_2_0_8, act_2_0_9, act_2_0_10, act_2_0_11, act_2_0_12, act_2_0_13, act_2_0_14, act_2_0_15 : lut_output_t_2;
  signal act_2_1_0, act_2_1_1, act_2_1_2, act_2_1_3, act_2_1_4, act_2_1_5, act_2_1_6, act_2_1_7, act_2_1_8, act_2_1_9, act_2_1_10, act_2_1_11, act_2_1_12, act_2_1_13, act_2_1_14, act_2_1_15 : lut_output_t_2;
  signal act_2_2_0, act_2_2_1, act_2_2_2, act_2_2_3, act_2_2_4, act_2_2_5, act_2_2_6, act_2_2_7, act_2_2_8, act_2_2_9, act_2_2_10, act_2_2_11, act_2_2_12, act_2_2_13, act_2_2_14, act_2_2_15 : lut_output_t_2;
  signal act_2_3_0, act_2_3_1, act_2_3_2, act_2_3_3, act_2_3_4, act_2_3_5, act_2_3_6, act_2_3_7, act_2_3_8, act_2_3_9, act_2_3_10, act_2_3_11, act_2_3_12, act_2_3_13, act_2_3_14, act_2_3_15 : lut_output_t_2;
  signal act_2_4_0, act_2_4_1, act_2_4_2, act_2_4_3, act_2_4_4, act_2_4_5, act_2_4_6, act_2_4_7, act_2_4_8, act_2_4_9, act_2_4_10, act_2_4_11, act_2_4_12, act_2_4_13, act_2_4_14, act_2_4_15 : lut_output_t_2;
  signal act_2_5_0, act_2_5_1, act_2_5_2, act_2_5_3, act_2_5_4, act_2_5_5, act_2_5_6, act_2_5_7, act_2_5_8, act_2_5_9, act_2_5_10, act_2_5_11, act_2_5_12, act_2_5_13, act_2_5_14, act_2_5_15 : lut_output_t_2;
  signal act_2_6_0, act_2_6_1, act_2_6_2, act_2_6_3, act_2_6_4, act_2_6_5, act_2_6_6, act_2_6_7, act_2_6_8, act_2_6_9, act_2_6_10, act_2_6_11, act_2_6_12, act_2_6_13, act_2_6_14, act_2_6_15 : lut_output_t_2;
  signal act_2_7_0, act_2_7_1, act_2_7_2, act_2_7_3, act_2_7_4, act_2_7_5, act_2_7_6, act_2_7_7, act_2_7_8, act_2_7_9, act_2_7_10, act_2_7_11, act_2_7_12, act_2_7_13, act_2_7_14, act_2_7_15 : lut_output_t_2;
  signal out2_0, out2_1, out2_2, out2_3, out2_4, out2_5, out2_6, out2_7, out2_8, out2_9, out2_10, out2_11, out2_12, out2_13, out2_14, out2_15 : lut_output_t_2;
  signal out2_0_reg, out2_1_reg, out2_2_reg, out2_3_reg, out2_4_reg, out2_5_reg, out2_6_reg, out2_7_reg, out2_8_reg, out2_9_reg, out2_10_reg, out2_11_reg, out2_12_reg, out2_13_reg, out2_14_reg, out2_15_reg : lut_output_t_2;

-- Layer 3 (16->64)
  signal act_3_0_0, act_3_0_1, act_3_0_2, act_3_0_3, act_3_0_4, act_3_0_5, act_3_0_6, act_3_0_7, act_3_0_8, act_3_0_9, act_3_0_10, act_3_0_11, act_3_0_12, act_3_0_13, act_3_0_14, act_3_0_15 : lut_output_t_3;
  signal act_3_0_16, act_3_0_17, act_3_0_18, act_3_0_19, act_3_0_20, act_3_0_21, act_3_0_22, act_3_0_23, act_3_0_24, act_3_0_25, act_3_0_26, act_3_0_27, act_3_0_28, act_3_0_29, act_3_0_30, act_3_0_31 : lut_output_t_3;
  signal act_3_0_32, act_3_0_33, act_3_0_34, act_3_0_35, act_3_0_36, act_3_0_37, act_3_0_38, act_3_0_39, act_3_0_40, act_3_0_41, act_3_0_42, act_3_0_43, act_3_0_44, act_3_0_45, act_3_0_46, act_3_0_47 : lut_output_t_3;
  signal act_3_0_48, act_3_0_49, act_3_0_50, act_3_0_51, act_3_0_52, act_3_0_53, act_3_0_54, act_3_0_55, act_3_0_56, act_3_0_57, act_3_0_58, act_3_0_59, act_3_0_60, act_3_0_61, act_3_0_62, act_3_0_63 : lut_output_t_3;
  signal act_3_1_0, act_3_1_1, act_3_1_2, act_3_1_3, act_3_1_4, act_3_1_5, act_3_1_6, act_3_1_7, act_3_1_8, act_3_1_9, act_3_1_10, act_3_1_11, act_3_1_12, act_3_1_13, act_3_1_14, act_3_1_15 : lut_output_t_3;
  signal act_3_1_16, act_3_1_17, act_3_1_18, act_3_1_19, act_3_1_20, act_3_1_21, act_3_1_22, act_3_1_23, act_3_1_24, act_3_1_25, act_3_1_26, act_3_1_27, act_3_1_28, act_3_1_29, act_3_1_30, act_3_1_31 : lut_output_t_3;
  signal act_3_1_32, act_3_1_33, act_3_1_34, act_3_1_35, act_3_1_36, act_3_1_37, act_3_1_38, act_3_1_39, act_3_1_40, act_3_1_41, act_3_1_42, act_3_1_43, act_3_1_44, act_3_1_45, act_3_1_46, act_3_1_47 : lut_output_t_3;
  signal act_3_1_48, act_3_1_49, act_3_1_50, act_3_1_51, act_3_1_52, act_3_1_53, act_3_1_54, act_3_1_55, act_3_1_56, act_3_1_57, act_3_1_58, act_3_1_59, act_3_1_60, act_3_1_61, act_3_1_62, act_3_1_63 : lut_output_t_3;
  signal act_3_2_0, act_3_2_1, act_3_2_2, act_3_2_3, act_3_2_4, act_3_2_5, act_3_2_6, act_3_2_7, act_3_2_8, act_3_2_9, act_3_2_10, act_3_2_11, act_3_2_12, act_3_2_13, act_3_2_14, act_3_2_15 : lut_output_t_3;
  signal act_3_2_16, act_3_2_17, act_3_2_18, act_3_2_19, act_3_2_20, act_3_2_21, act_3_2_22, act_3_2_23, act_3_2_24, act_3_2_25, act_3_2_26, act_3_2_27, act_3_2_28, act_3_2_29, act_3_2_30, act_3_2_31 : lut_output_t_3;
  signal act_3_2_32, act_3_2_33, act_3_2_34, act_3_2_35, act_3_2_36, act_3_2_37, act_3_2_38, act_3_2_39, act_3_2_40, act_3_2_41, act_3_2_42, act_3_2_43, act_3_2_44, act_3_2_45, act_3_2_46, act_3_2_47 : lut_output_t_3;
  signal act_3_2_48, act_3_2_49, act_3_2_50, act_3_2_51, act_3_2_52, act_3_2_53, act_3_2_54, act_3_2_55, act_3_2_56, act_3_2_57, act_3_2_58, act_3_2_59, act_3_2_60, act_3_2_61, act_3_2_62, act_3_2_63 : lut_output_t_3;
  signal act_3_3_0, act_3_3_1, act_3_3_2, act_3_3_3, act_3_3_4, act_3_3_5, act_3_3_6, act_3_3_7, act_3_3_8, act_3_3_9, act_3_3_10, act_3_3_11, act_3_3_12, act_3_3_13, act_3_3_14, act_3_3_15 : lut_output_t_3;
  signal act_3_3_16, act_3_3_17, act_3_3_18, act_3_3_19, act_3_3_20, act_3_3_21, act_3_3_22, act_3_3_23, act_3_3_24, act_3_3_25, act_3_3_26, act_3_3_27, act_3_3_28, act_3_3_29, act_3_3_30, act_3_3_31 : lut_output_t_3;
  signal act_3_3_32, act_3_3_33, act_3_3_34, act_3_3_35, act_3_3_36, act_3_3_37, act_3_3_38, act_3_3_39, act_3_3_40, act_3_3_41, act_3_3_42, act_3_3_43, act_3_3_44, act_3_3_45, act_3_3_46, act_3_3_47 : lut_output_t_3;
  signal act_3_3_48, act_3_3_49, act_3_3_50, act_3_3_51, act_3_3_52, act_3_3_53, act_3_3_54, act_3_3_55, act_3_3_56, act_3_3_57, act_3_3_58, act_3_3_59, act_3_3_60, act_3_3_61, act_3_3_62, act_3_3_63 : lut_output_t_3;
  signal act_3_4_0, act_3_4_1, act_3_4_2, act_3_4_3, act_3_4_4, act_3_4_5, act_3_4_6, act_3_4_7, act_3_4_8, act_3_4_9, act_3_4_10, act_3_4_11, act_3_4_12, act_3_4_13, act_3_4_14, act_3_4_15 : lut_output_t_3;
  signal act_3_4_16, act_3_4_17, act_3_4_18, act_3_4_19, act_3_4_20, act_3_4_21, act_3_4_22, act_3_4_23, act_3_4_24, act_3_4_25, act_3_4_26, act_3_4_27, act_3_4_28, act_3_4_29, act_3_4_30, act_3_4_31 : lut_output_t_3;
  signal act_3_4_32, act_3_4_33, act_3_4_34, act_3_4_35, act_3_4_36, act_3_4_37, act_3_4_38, act_3_4_39, act_3_4_40, act_3_4_41, act_3_4_42, act_3_4_43, act_3_4_44, act_3_4_45, act_3_4_46, act_3_4_47 : lut_output_t_3;
  signal act_3_4_48, act_3_4_49, act_3_4_50, act_3_4_51, act_3_4_52, act_3_4_53, act_3_4_54, act_3_4_55, act_3_4_56, act_3_4_57, act_3_4_58, act_3_4_59, act_3_4_60, act_3_4_61, act_3_4_62, act_3_4_63 : lut_output_t_3;
  signal act_3_5_0, act_3_5_1, act_3_5_2, act_3_5_3, act_3_5_4, act_3_5_5, act_3_5_6, act_3_5_7, act_3_5_8, act_3_5_9, act_3_5_10, act_3_5_11, act_3_5_12, act_3_5_13, act_3_5_14, act_3_5_15 : lut_output_t_3;
  signal act_3_5_16, act_3_5_17, act_3_5_18, act_3_5_19, act_3_5_20, act_3_5_21, act_3_5_22, act_3_5_23, act_3_5_24, act_3_5_25, act_3_5_26, act_3_5_27, act_3_5_28, act_3_5_29, act_3_5_30, act_3_5_31 : lut_output_t_3;
  signal act_3_5_32, act_3_5_33, act_3_5_34, act_3_5_35, act_3_5_36, act_3_5_37, act_3_5_38, act_3_5_39, act_3_5_40, act_3_5_41, act_3_5_42, act_3_5_43, act_3_5_44, act_3_5_45, act_3_5_46, act_3_5_47 : lut_output_t_3;
  signal act_3_5_48, act_3_5_49, act_3_5_50, act_3_5_51, act_3_5_52, act_3_5_53, act_3_5_54, act_3_5_55, act_3_5_56, act_3_5_57, act_3_5_58, act_3_5_59, act_3_5_60, act_3_5_61, act_3_5_62, act_3_5_63 : lut_output_t_3;
  signal act_3_6_0, act_3_6_1, act_3_6_2, act_3_6_3, act_3_6_4, act_3_6_5, act_3_6_6, act_3_6_7, act_3_6_8, act_3_6_9, act_3_6_10, act_3_6_11, act_3_6_12, act_3_6_13, act_3_6_14, act_3_6_15 : lut_output_t_3;
  signal act_3_6_16, act_3_6_17, act_3_6_18, act_3_6_19, act_3_6_20, act_3_6_21, act_3_6_22, act_3_6_23, act_3_6_24, act_3_6_25, act_3_6_26, act_3_6_27, act_3_6_28, act_3_6_29, act_3_6_30, act_3_6_31 : lut_output_t_3;
  signal act_3_6_32, act_3_6_33, act_3_6_34, act_3_6_35, act_3_6_36, act_3_6_37, act_3_6_38, act_3_6_39, act_3_6_40, act_3_6_41, act_3_6_42, act_3_6_43, act_3_6_44, act_3_6_45, act_3_6_46, act_3_6_47 : lut_output_t_3;
  signal act_3_6_48, act_3_6_49, act_3_6_50, act_3_6_51, act_3_6_52, act_3_6_53, act_3_6_54, act_3_6_55, act_3_6_56, act_3_6_57, act_3_6_58, act_3_6_59, act_3_6_60, act_3_6_61, act_3_6_62, act_3_6_63 : lut_output_t_3;
  signal act_3_7_0, act_3_7_1, act_3_7_2, act_3_7_3, act_3_7_4, act_3_7_5, act_3_7_6, act_3_7_7, act_3_7_8, act_3_7_9, act_3_7_10, act_3_7_11, act_3_7_12, act_3_7_13, act_3_7_14, act_3_7_15 : lut_output_t_3;
  signal act_3_7_16, act_3_7_17, act_3_7_18, act_3_7_19, act_3_7_20, act_3_7_21, act_3_7_22, act_3_7_23, act_3_7_24, act_3_7_25, act_3_7_26, act_3_7_27, act_3_7_28, act_3_7_29, act_3_7_30, act_3_7_31 : lut_output_t_3;
  signal act_3_7_32, act_3_7_33, act_3_7_34, act_3_7_35, act_3_7_36, act_3_7_37, act_3_7_38, act_3_7_39, act_3_7_40, act_3_7_41, act_3_7_42, act_3_7_43, act_3_7_44, act_3_7_45, act_3_7_46, act_3_7_47 : lut_output_t_3;
  signal act_3_7_48, act_3_7_49, act_3_7_50, act_3_7_51, act_3_7_52, act_3_7_53, act_3_7_54, act_3_7_55, act_3_7_56, act_3_7_57, act_3_7_58, act_3_7_59, act_3_7_60, act_3_7_61, act_3_7_62, act_3_7_63 : lut_output_t_3;
  signal act_3_8_0, act_3_8_1, act_3_8_2, act_3_8_3, act_3_8_4, act_3_8_5, act_3_8_6, act_3_8_7, act_3_8_8, act_3_8_9, act_3_8_10, act_3_8_11, act_3_8_12, act_3_8_13, act_3_8_14, act_3_8_15 : lut_output_t_3;
  signal act_3_8_16, act_3_8_17, act_3_8_18, act_3_8_19, act_3_8_20, act_3_8_21, act_3_8_22, act_3_8_23, act_3_8_24, act_3_8_25, act_3_8_26, act_3_8_27, act_3_8_28, act_3_8_29, act_3_8_30, act_3_8_31 : lut_output_t_3;
  signal act_3_8_32, act_3_8_33, act_3_8_34, act_3_8_35, act_3_8_36, act_3_8_37, act_3_8_38, act_3_8_39, act_3_8_40, act_3_8_41, act_3_8_42, act_3_8_43, act_3_8_44, act_3_8_45, act_3_8_46, act_3_8_47 : lut_output_t_3;
  signal act_3_8_48, act_3_8_49, act_3_8_50, act_3_8_51, act_3_8_52, act_3_8_53, act_3_8_54, act_3_8_55, act_3_8_56, act_3_8_57, act_3_8_58, act_3_8_59, act_3_8_60, act_3_8_61, act_3_8_62, act_3_8_63 : lut_output_t_3;
  signal act_3_9_0, act_3_9_1, act_3_9_2, act_3_9_3, act_3_9_4, act_3_9_5, act_3_9_6, act_3_9_7, act_3_9_8, act_3_9_9, act_3_9_10, act_3_9_11, act_3_9_12, act_3_9_13, act_3_9_14, act_3_9_15 : lut_output_t_3;
  signal act_3_9_16, act_3_9_17, act_3_9_18, act_3_9_19, act_3_9_20, act_3_9_21, act_3_9_22, act_3_9_23, act_3_9_24, act_3_9_25, act_3_9_26, act_3_9_27, act_3_9_28, act_3_9_29, act_3_9_30, act_3_9_31 : lut_output_t_3;
  signal act_3_9_32, act_3_9_33, act_3_9_34, act_3_9_35, act_3_9_36, act_3_9_37, act_3_9_38, act_3_9_39, act_3_9_40, act_3_9_41, act_3_9_42, act_3_9_43, act_3_9_44, act_3_9_45, act_3_9_46, act_3_9_47 : lut_output_t_3;
  signal act_3_9_48, act_3_9_49, act_3_9_50, act_3_9_51, act_3_9_52, act_3_9_53, act_3_9_54, act_3_9_55, act_3_9_56, act_3_9_57, act_3_9_58, act_3_9_59, act_3_9_60, act_3_9_61, act_3_9_62, act_3_9_63 : lut_output_t_3;
  signal act_3_10_0, act_3_10_1, act_3_10_2, act_3_10_3, act_3_10_4, act_3_10_5, act_3_10_6, act_3_10_7, act_3_10_8, act_3_10_9, act_3_10_10, act_3_10_11, act_3_10_12, act_3_10_13, act_3_10_14, act_3_10_15 : lut_output_t_3;
  signal act_3_10_16, act_3_10_17, act_3_10_18, act_3_10_19, act_3_10_20, act_3_10_21, act_3_10_22, act_3_10_23, act_3_10_24, act_3_10_25, act_3_10_26, act_3_10_27, act_3_10_28, act_3_10_29, act_3_10_30, act_3_10_31 : lut_output_t_3;
  signal act_3_10_32, act_3_10_33, act_3_10_34, act_3_10_35, act_3_10_36, act_3_10_37, act_3_10_38, act_3_10_39, act_3_10_40, act_3_10_41, act_3_10_42, act_3_10_43, act_3_10_44, act_3_10_45, act_3_10_46, act_3_10_47 : lut_output_t_3;
  signal act_3_10_48, act_3_10_49, act_3_10_50, act_3_10_51, act_3_10_52, act_3_10_53, act_3_10_54, act_3_10_55, act_3_10_56, act_3_10_57, act_3_10_58, act_3_10_59, act_3_10_60, act_3_10_61, act_3_10_62, act_3_10_63 : lut_output_t_3;
  signal act_3_11_0, act_3_11_1, act_3_11_2, act_3_11_3, act_3_11_4, act_3_11_5, act_3_11_6, act_3_11_7, act_3_11_8, act_3_11_9, act_3_11_10, act_3_11_11, act_3_11_12, act_3_11_13, act_3_11_14, act_3_11_15 : lut_output_t_3;
  signal act_3_11_16, act_3_11_17, act_3_11_18, act_3_11_19, act_3_11_20, act_3_11_21, act_3_11_22, act_3_11_23, act_3_11_24, act_3_11_25, act_3_11_26, act_3_11_27, act_3_11_28, act_3_11_29, act_3_11_30, act_3_11_31 : lut_output_t_3;
  signal act_3_11_32, act_3_11_33, act_3_11_34, act_3_11_35, act_3_11_36, act_3_11_37, act_3_11_38, act_3_11_39, act_3_11_40, act_3_11_41, act_3_11_42, act_3_11_43, act_3_11_44, act_3_11_45, act_3_11_46, act_3_11_47 : lut_output_t_3;
  signal act_3_11_48, act_3_11_49, act_3_11_50, act_3_11_51, act_3_11_52, act_3_11_53, act_3_11_54, act_3_11_55, act_3_11_56, act_3_11_57, act_3_11_58, act_3_11_59, act_3_11_60, act_3_11_61, act_3_11_62, act_3_11_63 : lut_output_t_3;
  signal act_3_12_0, act_3_12_1, act_3_12_2, act_3_12_3, act_3_12_4, act_3_12_5, act_3_12_6, act_3_12_7, act_3_12_8, act_3_12_9, act_3_12_10, act_3_12_11, act_3_12_12, act_3_12_13, act_3_12_14, act_3_12_15 : lut_output_t_3;
  signal act_3_12_16, act_3_12_17, act_3_12_18, act_3_12_19, act_3_12_20, act_3_12_21, act_3_12_22, act_3_12_23, act_3_12_24, act_3_12_25, act_3_12_26, act_3_12_27, act_3_12_28, act_3_12_29, act_3_12_30, act_3_12_31 : lut_output_t_3;
  signal act_3_12_32, act_3_12_33, act_3_12_34, act_3_12_35, act_3_12_36, act_3_12_37, act_3_12_38, act_3_12_39, act_3_12_40, act_3_12_41, act_3_12_42, act_3_12_43, act_3_12_44, act_3_12_45, act_3_12_46, act_3_12_47 : lut_output_t_3;
  signal act_3_12_48, act_3_12_49, act_3_12_50, act_3_12_51, act_3_12_52, act_3_12_53, act_3_12_54, act_3_12_55, act_3_12_56, act_3_12_57, act_3_12_58, act_3_12_59, act_3_12_60, act_3_12_61, act_3_12_62, act_3_12_63 : lut_output_t_3;
  signal act_3_13_0, act_3_13_1, act_3_13_2, act_3_13_3, act_3_13_4, act_3_13_5, act_3_13_6, act_3_13_7, act_3_13_8, act_3_13_9, act_3_13_10, act_3_13_11, act_3_13_12, act_3_13_13, act_3_13_14, act_3_13_15 : lut_output_t_3;
  signal act_3_13_16, act_3_13_17, act_3_13_18, act_3_13_19, act_3_13_20, act_3_13_21, act_3_13_22, act_3_13_23, act_3_13_24, act_3_13_25, act_3_13_26, act_3_13_27, act_3_13_28, act_3_13_29, act_3_13_30, act_3_13_31 : lut_output_t_3;
  signal act_3_13_32, act_3_13_33, act_3_13_34, act_3_13_35, act_3_13_36, act_3_13_37, act_3_13_38, act_3_13_39, act_3_13_40, act_3_13_41, act_3_13_42, act_3_13_43, act_3_13_44, act_3_13_45, act_3_13_46, act_3_13_47 : lut_output_t_3;
  signal act_3_13_48, act_3_13_49, act_3_13_50, act_3_13_51, act_3_13_52, act_3_13_53, act_3_13_54, act_3_13_55, act_3_13_56, act_3_13_57, act_3_13_58, act_3_13_59, act_3_13_60, act_3_13_61, act_3_13_62, act_3_13_63 : lut_output_t_3;
  signal act_3_14_0, act_3_14_1, act_3_14_2, act_3_14_3, act_3_14_4, act_3_14_5, act_3_14_6, act_3_14_7, act_3_14_8, act_3_14_9, act_3_14_10, act_3_14_11, act_3_14_12, act_3_14_13, act_3_14_14, act_3_14_15 : lut_output_t_3;
  signal act_3_14_16, act_3_14_17, act_3_14_18, act_3_14_19, act_3_14_20, act_3_14_21, act_3_14_22, act_3_14_23, act_3_14_24, act_3_14_25, act_3_14_26, act_3_14_27, act_3_14_28, act_3_14_29, act_3_14_30, act_3_14_31 : lut_output_t_3;
  signal act_3_14_32, act_3_14_33, act_3_14_34, act_3_14_35, act_3_14_36, act_3_14_37, act_3_14_38, act_3_14_39, act_3_14_40, act_3_14_41, act_3_14_42, act_3_14_43, act_3_14_44, act_3_14_45, act_3_14_46, act_3_14_47 : lut_output_t_3;
  signal act_3_14_48, act_3_14_49, act_3_14_50, act_3_14_51, act_3_14_52, act_3_14_53, act_3_14_54, act_3_14_55, act_3_14_56, act_3_14_57, act_3_14_58, act_3_14_59, act_3_14_60, act_3_14_61, act_3_14_62, act_3_14_63 : lut_output_t_3;
  signal act_3_15_0, act_3_15_1, act_3_15_2, act_3_15_3, act_3_15_4, act_3_15_5, act_3_15_6, act_3_15_7, act_3_15_8, act_3_15_9, act_3_15_10, act_3_15_11, act_3_15_12, act_3_15_13, act_3_15_14, act_3_15_15 : lut_output_t_3;
  signal act_3_15_16, act_3_15_17, act_3_15_18, act_3_15_19, act_3_15_20, act_3_15_21, act_3_15_22, act_3_15_23, act_3_15_24, act_3_15_25, act_3_15_26, act_3_15_27, act_3_15_28, act_3_15_29, act_3_15_30, act_3_15_31 : lut_output_t_3;
  signal act_3_15_32, act_3_15_33, act_3_15_34, act_3_15_35, act_3_15_36, act_3_15_37, act_3_15_38, act_3_15_39, act_3_15_40, act_3_15_41, act_3_15_42, act_3_15_43, act_3_15_44, act_3_15_45, act_3_15_46, act_3_15_47 : lut_output_t_3;
  signal act_3_15_48, act_3_15_49, act_3_15_50, act_3_15_51, act_3_15_52, act_3_15_53, act_3_15_54, act_3_15_55, act_3_15_56, act_3_15_57, act_3_15_58, act_3_15_59, act_3_15_60, act_3_15_61, act_3_15_62, act_3_15_63 : lut_output_t_3;
begin

  -- === auto: layer blocks ===
  -- LAYER 0, ch 0
  gen_l0c0 : block
  signal s1_0, s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7, s1_8, s1_9, s1_10, s1_11, s1_12, s1_13, s1_14, s1_15 : sum_t_0_0;
  signal s2_0, s2_1, s2_2, s2_3 : sum_t_0_0;
  signal sum_0_0 : sum_t_0_0;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_0.mem") port map (clk, input(0), act_0_0_0);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_0.mem") port map (clk, input(1), act_0_1_0);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_0.mem") port map (clk, input(2), act_0_2_0);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_0.mem") port map (clk, input(3), act_0_3_0);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_0.mem") port map (clk, input(4), act_0_4_0);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_0.mem") port map (clk, input(5), act_0_5_0);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_0.mem") port map (clk, input(6), act_0_6_0);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_0.mem") port map (clk, input(7), act_0_7_0);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_0.mem") port map (clk, input(8), act_0_8_0);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_0.mem") port map (clk, input(9), act_0_9_0);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_0.mem") port map (clk, input(10), act_0_10_0);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_0.mem") port map (clk, input(11), act_0_11_0);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_0.mem") port map (clk, input(12), act_0_12_0);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_0.mem") port map (clk, input(13), act_0_13_0);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_0.mem") port map (clk, input(14), act_0_14_0);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_0.mem") port map (clk, input(15), act_0_15_0);
    i16 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_16_0.mem") port map (clk, input(16), act_0_16_0);
    i17 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_17_0.mem") port map (clk, input(17), act_0_17_0);
    i18 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_18_0.mem") port map (clk, input(18), act_0_18_0);
    i19 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_19_0.mem") port map (clk, input(19), act_0_19_0);
    i20 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_20_0.mem") port map (clk, input(20), act_0_20_0);
    i21 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_21_0.mem") port map (clk, input(21), act_0_21_0);
    i22 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_22_0.mem") port map (clk, input(22), act_0_22_0);
    i23 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_23_0.mem") port map (clk, input(23), act_0_23_0);
    i24 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_24_0.mem") port map (clk, input(24), act_0_24_0);
    i25 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_25_0.mem") port map (clk, input(25), act_0_25_0);
    i26 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_26_0.mem") port map (clk, input(26), act_0_26_0);
    i27 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_27_0.mem") port map (clk, input(27), act_0_27_0);
    i28 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_28_0.mem") port map (clk, input(28), act_0_28_0);
    i29 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_29_0.mem") port map (clk, input(29), act_0_29_0);
    i30 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_30_0.mem") port map (clk, input(30), act_0_30_0);
    i31 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_31_0.mem") port map (clk, input(31), act_0_31_0);
    i32 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_32_0.mem") port map (clk, input(32), act_0_32_0);
    i33 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_33_0.mem") port map (clk, input(33), act_0_33_0);
    i34 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_34_0.mem") port map (clk, input(34), act_0_34_0);
    i35 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_35_0.mem") port map (clk, input(35), act_0_35_0);
    i36 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_36_0.mem") port map (clk, input(36), act_0_36_0);
    i37 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_37_0.mem") port map (clk, input(37), act_0_37_0);
    i38 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_38_0.mem") port map (clk, input(38), act_0_38_0);
    i39 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_39_0.mem") port map (clk, input(39), act_0_39_0);
    i40 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_40_0.mem") port map (clk, input(40), act_0_40_0);
    i41 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_41_0.mem") port map (clk, input(41), act_0_41_0);
    i42 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_42_0.mem") port map (clk, input(42), act_0_42_0);
    i43 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_43_0.mem") port map (clk, input(43), act_0_43_0);
    i44 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_44_0.mem") port map (clk, input(44), act_0_44_0);
    i45 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_45_0.mem") port map (clk, input(45), act_0_45_0);
    i46 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_46_0.mem") port map (clk, input(46), act_0_46_0);
    i47 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_47_0.mem") port map (clk, input(47), act_0_47_0);
    i48 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_48_0.mem") port map (clk, input(48), act_0_48_0);
    i49 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_49_0.mem") port map (clk, input(49), act_0_49_0);
    i50 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_50_0.mem") port map (clk, input(50), act_0_50_0);
    i51 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_51_0.mem") port map (clk, input(51), act_0_51_0);
    i52 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_52_0.mem") port map (clk, input(52), act_0_52_0);
    i53 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_53_0.mem") port map (clk, input(53), act_0_53_0);
    i54 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_54_0.mem") port map (clk, input(54), act_0_54_0);
    i55 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_55_0.mem") port map (clk, input(55), act_0_55_0);
    i56 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_56_0.mem") port map (clk, input(56), act_0_56_0);
    i57 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_57_0.mem") port map (clk, input(57), act_0_57_0);
    i58 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_58_0.mem") port map (clk, input(58), act_0_58_0);
    i59 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_59_0.mem") port map (clk, input(59), act_0_59_0);
    i60 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_60_0.mem") port map (clk, input(60), act_0_60_0);
    i61 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_61_0.mem") port map (clk, input(61), act_0_61_0);
    i62 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_62_0.mem") port map (clk, input(62), act_0_62_0);
    i63 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_63_0.mem") port map (clk, input(63), act_0_63_0);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_0, SUM_WIDTH_0_0) + resize(act_0_1_0, SUM_WIDTH_0_0) + resize(act_0_2_0, SUM_WIDTH_0_0) + resize(act_0_3_0, SUM_WIDTH_0_0);
        s1_1 <= resize(act_0_4_0, SUM_WIDTH_0_0) + resize(act_0_5_0, SUM_WIDTH_0_0) + resize(act_0_6_0, SUM_WIDTH_0_0) + resize(act_0_7_0, SUM_WIDTH_0_0);
        s1_2 <= resize(act_0_8_0, SUM_WIDTH_0_0) + resize(act_0_9_0, SUM_WIDTH_0_0) + resize(act_0_10_0, SUM_WIDTH_0_0) + resize(act_0_11_0, SUM_WIDTH_0_0);
        s1_3 <= resize(act_0_12_0, SUM_WIDTH_0_0) + resize(act_0_13_0, SUM_WIDTH_0_0) + resize(act_0_14_0, SUM_WIDTH_0_0) + resize(act_0_15_0, SUM_WIDTH_0_0);
        s1_4 <= resize(act_0_16_0, SUM_WIDTH_0_0) + resize(act_0_17_0, SUM_WIDTH_0_0) + resize(act_0_18_0, SUM_WIDTH_0_0) + resize(act_0_19_0, SUM_WIDTH_0_0);
        s1_5 <= resize(act_0_20_0, SUM_WIDTH_0_0) + resize(act_0_21_0, SUM_WIDTH_0_0) + resize(act_0_22_0, SUM_WIDTH_0_0) + resize(act_0_23_0, SUM_WIDTH_0_0);
        s1_6 <= resize(act_0_24_0, SUM_WIDTH_0_0) + resize(act_0_25_0, SUM_WIDTH_0_0) + resize(act_0_26_0, SUM_WIDTH_0_0) + resize(act_0_27_0, SUM_WIDTH_0_0);
        s1_7 <= resize(act_0_28_0, SUM_WIDTH_0_0) + resize(act_0_29_0, SUM_WIDTH_0_0) + resize(act_0_30_0, SUM_WIDTH_0_0) + resize(act_0_31_0, SUM_WIDTH_0_0);
        s1_8 <= resize(act_0_32_0, SUM_WIDTH_0_0) + resize(act_0_33_0, SUM_WIDTH_0_0) + resize(act_0_34_0, SUM_WIDTH_0_0) + resize(act_0_35_0, SUM_WIDTH_0_0);
        s1_9 <= resize(act_0_36_0, SUM_WIDTH_0_0) + resize(act_0_37_0, SUM_WIDTH_0_0) + resize(act_0_38_0, SUM_WIDTH_0_0) + resize(act_0_39_0, SUM_WIDTH_0_0);
        s1_10 <= resize(act_0_40_0, SUM_WIDTH_0_0) + resize(act_0_41_0, SUM_WIDTH_0_0) + resize(act_0_42_0, SUM_WIDTH_0_0) + resize(act_0_43_0, SUM_WIDTH_0_0);
        s1_11 <= resize(act_0_44_0, SUM_WIDTH_0_0) + resize(act_0_45_0, SUM_WIDTH_0_0) + resize(act_0_46_0, SUM_WIDTH_0_0) + resize(act_0_47_0, SUM_WIDTH_0_0);
        s1_12 <= resize(act_0_48_0, SUM_WIDTH_0_0) + resize(act_0_49_0, SUM_WIDTH_0_0) + resize(act_0_50_0, SUM_WIDTH_0_0) + resize(act_0_51_0, SUM_WIDTH_0_0);
        s1_13 <= resize(act_0_52_0, SUM_WIDTH_0_0) + resize(act_0_53_0, SUM_WIDTH_0_0) + resize(act_0_54_0, SUM_WIDTH_0_0) + resize(act_0_55_0, SUM_WIDTH_0_0);
        s1_14 <= resize(act_0_56_0, SUM_WIDTH_0_0) + resize(act_0_57_0, SUM_WIDTH_0_0) + resize(act_0_58_0, SUM_WIDTH_0_0) + resize(act_0_59_0, SUM_WIDTH_0_0);
        s1_15 <= resize(act_0_60_0, SUM_WIDTH_0_0) + resize(act_0_61_0, SUM_WIDTH_0_0) + resize(act_0_62_0, SUM_WIDTH_0_0) + resize(act_0_63_0, SUM_WIDTH_0_0);
        -- Stage 2
        s2_0 <= s1_0 + s1_1 + s1_2 + s1_3;
        s2_1 <= s1_4 + s1_5 + s1_6 + s1_7;
        s2_2 <= s1_8 + s1_9 + s1_10 + s1_11;
        s2_3 <= s1_12 + s1_13 + s1_14 + s1_15;
        -- Stage 3
        sum_0_0 <= s2_0 + s2_1 + s2_2 + s2_3;
      end if;
    end process;
    out0_0 <= saturate(sum_0_0, 8);
  end block;

  -- LAYER 0, ch 1
  gen_l0c1 : block
  signal s1_0, s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7, s1_8, s1_9, s1_10, s1_11, s1_12, s1_13, s1_14, s1_15 : sum_t_0_1;
  signal s2_0, s2_1, s2_2, s2_3 : sum_t_0_1;
  signal sum_0_1 : sum_t_0_1;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_1.mem") port map (clk, input(0), act_0_0_1);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_1.mem") port map (clk, input(1), act_0_1_1);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_1.mem") port map (clk, input(2), act_0_2_1);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_1.mem") port map (clk, input(3), act_0_3_1);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_1.mem") port map (clk, input(4), act_0_4_1);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_1.mem") port map (clk, input(5), act_0_5_1);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_1.mem") port map (clk, input(6), act_0_6_1);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_1.mem") port map (clk, input(7), act_0_7_1);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_1.mem") port map (clk, input(8), act_0_8_1);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_1.mem") port map (clk, input(9), act_0_9_1);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_1.mem") port map (clk, input(10), act_0_10_1);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_1.mem") port map (clk, input(11), act_0_11_1);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_1.mem") port map (clk, input(12), act_0_12_1);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_1.mem") port map (clk, input(13), act_0_13_1);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_1.mem") port map (clk, input(14), act_0_14_1);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_1.mem") port map (clk, input(15), act_0_15_1);
    i16 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_16_1.mem") port map (clk, input(16), act_0_16_1);
    i17 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_17_1.mem") port map (clk, input(17), act_0_17_1);
    i18 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_18_1.mem") port map (clk, input(18), act_0_18_1);
    i19 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_19_1.mem") port map (clk, input(19), act_0_19_1);
    i20 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_20_1.mem") port map (clk, input(20), act_0_20_1);
    i21 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_21_1.mem") port map (clk, input(21), act_0_21_1);
    i22 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_22_1.mem") port map (clk, input(22), act_0_22_1);
    i23 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_23_1.mem") port map (clk, input(23), act_0_23_1);
    i24 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_24_1.mem") port map (clk, input(24), act_0_24_1);
    i25 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_25_1.mem") port map (clk, input(25), act_0_25_1);
    i26 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_26_1.mem") port map (clk, input(26), act_0_26_1);
    i27 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_27_1.mem") port map (clk, input(27), act_0_27_1);
    i28 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_28_1.mem") port map (clk, input(28), act_0_28_1);
    i29 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_29_1.mem") port map (clk, input(29), act_0_29_1);
    i30 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_30_1.mem") port map (clk, input(30), act_0_30_1);
    i31 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_31_1.mem") port map (clk, input(31), act_0_31_1);
    i32 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_32_1.mem") port map (clk, input(32), act_0_32_1);
    i33 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_33_1.mem") port map (clk, input(33), act_0_33_1);
    i34 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_34_1.mem") port map (clk, input(34), act_0_34_1);
    i35 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_35_1.mem") port map (clk, input(35), act_0_35_1);
    i36 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_36_1.mem") port map (clk, input(36), act_0_36_1);
    i37 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_37_1.mem") port map (clk, input(37), act_0_37_1);
    i38 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_38_1.mem") port map (clk, input(38), act_0_38_1);
    i39 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_39_1.mem") port map (clk, input(39), act_0_39_1);
    i40 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_40_1.mem") port map (clk, input(40), act_0_40_1);
    i41 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_41_1.mem") port map (clk, input(41), act_0_41_1);
    i42 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_42_1.mem") port map (clk, input(42), act_0_42_1);
    i43 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_43_1.mem") port map (clk, input(43), act_0_43_1);
    i44 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_44_1.mem") port map (clk, input(44), act_0_44_1);
    i45 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_45_1.mem") port map (clk, input(45), act_0_45_1);
    i46 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_46_1.mem") port map (clk, input(46), act_0_46_1);
    i47 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_47_1.mem") port map (clk, input(47), act_0_47_1);
    i48 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_48_1.mem") port map (clk, input(48), act_0_48_1);
    i49 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_49_1.mem") port map (clk, input(49), act_0_49_1);
    i50 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_50_1.mem") port map (clk, input(50), act_0_50_1);
    i51 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_51_1.mem") port map (clk, input(51), act_0_51_1);
    i52 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_52_1.mem") port map (clk, input(52), act_0_52_1);
    i53 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_53_1.mem") port map (clk, input(53), act_0_53_1);
    i54 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_54_1.mem") port map (clk, input(54), act_0_54_1);
    i55 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_55_1.mem") port map (clk, input(55), act_0_55_1);
    i56 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_56_1.mem") port map (clk, input(56), act_0_56_1);
    i57 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_57_1.mem") port map (clk, input(57), act_0_57_1);
    i58 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_58_1.mem") port map (clk, input(58), act_0_58_1);
    i59 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_59_1.mem") port map (clk, input(59), act_0_59_1);
    i60 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_60_1.mem") port map (clk, input(60), act_0_60_1);
    i61 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_61_1.mem") port map (clk, input(61), act_0_61_1);
    i62 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_62_1.mem") port map (clk, input(62), act_0_62_1);
    i63 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_63_1.mem") port map (clk, input(63), act_0_63_1);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_1, SUM_WIDTH_0_1) + resize(act_0_1_1, SUM_WIDTH_0_1) + resize(act_0_2_1, SUM_WIDTH_0_1) + resize(act_0_3_1, SUM_WIDTH_0_1);
        s1_1 <= resize(act_0_4_1, SUM_WIDTH_0_1) + resize(act_0_5_1, SUM_WIDTH_0_1) + resize(act_0_6_1, SUM_WIDTH_0_1) + resize(act_0_7_1, SUM_WIDTH_0_1);
        s1_2 <= resize(act_0_8_1, SUM_WIDTH_0_1) + resize(act_0_9_1, SUM_WIDTH_0_1) + resize(act_0_10_1, SUM_WIDTH_0_1) + resize(act_0_11_1, SUM_WIDTH_0_1);
        s1_3 <= resize(act_0_12_1, SUM_WIDTH_0_1) + resize(act_0_13_1, SUM_WIDTH_0_1) + resize(act_0_14_1, SUM_WIDTH_0_1) + resize(act_0_15_1, SUM_WIDTH_0_1);
        s1_4 <= resize(act_0_16_1, SUM_WIDTH_0_1) + resize(act_0_17_1, SUM_WIDTH_0_1) + resize(act_0_18_1, SUM_WIDTH_0_1) + resize(act_0_19_1, SUM_WIDTH_0_1);
        s1_5 <= resize(act_0_20_1, SUM_WIDTH_0_1) + resize(act_0_21_1, SUM_WIDTH_0_1) + resize(act_0_22_1, SUM_WIDTH_0_1) + resize(act_0_23_1, SUM_WIDTH_0_1);
        s1_6 <= resize(act_0_24_1, SUM_WIDTH_0_1) + resize(act_0_25_1, SUM_WIDTH_0_1) + resize(act_0_26_1, SUM_WIDTH_0_1) + resize(act_0_27_1, SUM_WIDTH_0_1);
        s1_7 <= resize(act_0_28_1, SUM_WIDTH_0_1) + resize(act_0_29_1, SUM_WIDTH_0_1) + resize(act_0_30_1, SUM_WIDTH_0_1) + resize(act_0_31_1, SUM_WIDTH_0_1);
        s1_8 <= resize(act_0_32_1, SUM_WIDTH_0_1) + resize(act_0_33_1, SUM_WIDTH_0_1) + resize(act_0_34_1, SUM_WIDTH_0_1) + resize(act_0_35_1, SUM_WIDTH_0_1);
        s1_9 <= resize(act_0_36_1, SUM_WIDTH_0_1) + resize(act_0_37_1, SUM_WIDTH_0_1) + resize(act_0_38_1, SUM_WIDTH_0_1) + resize(act_0_39_1, SUM_WIDTH_0_1);
        s1_10 <= resize(act_0_40_1, SUM_WIDTH_0_1) + resize(act_0_41_1, SUM_WIDTH_0_1) + resize(act_0_42_1, SUM_WIDTH_0_1) + resize(act_0_43_1, SUM_WIDTH_0_1);
        s1_11 <= resize(act_0_44_1, SUM_WIDTH_0_1) + resize(act_0_45_1, SUM_WIDTH_0_1) + resize(act_0_46_1, SUM_WIDTH_0_1) + resize(act_0_47_1, SUM_WIDTH_0_1);
        s1_12 <= resize(act_0_48_1, SUM_WIDTH_0_1) + resize(act_0_49_1, SUM_WIDTH_0_1) + resize(act_0_50_1, SUM_WIDTH_0_1) + resize(act_0_51_1, SUM_WIDTH_0_1);
        s1_13 <= resize(act_0_52_1, SUM_WIDTH_0_1) + resize(act_0_53_1, SUM_WIDTH_0_1) + resize(act_0_54_1, SUM_WIDTH_0_1) + resize(act_0_55_1, SUM_WIDTH_0_1);
        s1_14 <= resize(act_0_56_1, SUM_WIDTH_0_1) + resize(act_0_57_1, SUM_WIDTH_0_1) + resize(act_0_58_1, SUM_WIDTH_0_1) + resize(act_0_59_1, SUM_WIDTH_0_1);
        s1_15 <= resize(act_0_60_1, SUM_WIDTH_0_1) + resize(act_0_61_1, SUM_WIDTH_0_1) + resize(act_0_62_1, SUM_WIDTH_0_1) + resize(act_0_63_1, SUM_WIDTH_0_1);
        -- Stage 2
        s2_0 <= s1_0 + s1_1 + s1_2 + s1_3;
        s2_1 <= s1_4 + s1_5 + s1_6 + s1_7;
        s2_2 <= s1_8 + s1_9 + s1_10 + s1_11;
        s2_3 <= s1_12 + s1_13 + s1_14 + s1_15;
        -- Stage 3
        sum_0_1 <= s2_0 + s2_1 + s2_2 + s2_3;
      end if;
    end process;
    out0_1 <= saturate(sum_0_1, 8);
  end block;

  -- LAYER 0, ch 2
  gen_l0c2 : block
  signal s1_0, s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7, s1_8, s1_9, s1_10, s1_11, s1_12, s1_13, s1_14, s1_15 : sum_t_0_2;
  signal s2_0, s2_1, s2_2, s2_3 : sum_t_0_2;
  signal sum_0_2 : sum_t_0_2;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_2.mem") port map (clk, input(0), act_0_0_2);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_2.mem") port map (clk, input(1), act_0_1_2);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_2.mem") port map (clk, input(2), act_0_2_2);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_2.mem") port map (clk, input(3), act_0_3_2);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_2.mem") port map (clk, input(4), act_0_4_2);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_2.mem") port map (clk, input(5), act_0_5_2);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_2.mem") port map (clk, input(6), act_0_6_2);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_2.mem") port map (clk, input(7), act_0_7_2);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_2.mem") port map (clk, input(8), act_0_8_2);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_2.mem") port map (clk, input(9), act_0_9_2);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_2.mem") port map (clk, input(10), act_0_10_2);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_2.mem") port map (clk, input(11), act_0_11_2);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_2.mem") port map (clk, input(12), act_0_12_2);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_2.mem") port map (clk, input(13), act_0_13_2);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_2.mem") port map (clk, input(14), act_0_14_2);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_2.mem") port map (clk, input(15), act_0_15_2);
    i16 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_16_2.mem") port map (clk, input(16), act_0_16_2);
    i17 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_17_2.mem") port map (clk, input(17), act_0_17_2);
    i18 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_18_2.mem") port map (clk, input(18), act_0_18_2);
    i19 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_19_2.mem") port map (clk, input(19), act_0_19_2);
    i20 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_20_2.mem") port map (clk, input(20), act_0_20_2);
    i21 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_21_2.mem") port map (clk, input(21), act_0_21_2);
    i22 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_22_2.mem") port map (clk, input(22), act_0_22_2);
    i23 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_23_2.mem") port map (clk, input(23), act_0_23_2);
    i24 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_24_2.mem") port map (clk, input(24), act_0_24_2);
    i25 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_25_2.mem") port map (clk, input(25), act_0_25_2);
    i26 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_26_2.mem") port map (clk, input(26), act_0_26_2);
    i27 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_27_2.mem") port map (clk, input(27), act_0_27_2);
    i28 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_28_2.mem") port map (clk, input(28), act_0_28_2);
    i29 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_29_2.mem") port map (clk, input(29), act_0_29_2);
    i30 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_30_2.mem") port map (clk, input(30), act_0_30_2);
    i31 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_31_2.mem") port map (clk, input(31), act_0_31_2);
    i32 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_32_2.mem") port map (clk, input(32), act_0_32_2);
    i33 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_33_2.mem") port map (clk, input(33), act_0_33_2);
    i34 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_34_2.mem") port map (clk, input(34), act_0_34_2);
    i35 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_35_2.mem") port map (clk, input(35), act_0_35_2);
    i36 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_36_2.mem") port map (clk, input(36), act_0_36_2);
    i37 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_37_2.mem") port map (clk, input(37), act_0_37_2);
    i38 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_38_2.mem") port map (clk, input(38), act_0_38_2);
    i39 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_39_2.mem") port map (clk, input(39), act_0_39_2);
    i40 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_40_2.mem") port map (clk, input(40), act_0_40_2);
    i41 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_41_2.mem") port map (clk, input(41), act_0_41_2);
    i42 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_42_2.mem") port map (clk, input(42), act_0_42_2);
    i43 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_43_2.mem") port map (clk, input(43), act_0_43_2);
    i44 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_44_2.mem") port map (clk, input(44), act_0_44_2);
    i45 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_45_2.mem") port map (clk, input(45), act_0_45_2);
    i46 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_46_2.mem") port map (clk, input(46), act_0_46_2);
    i47 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_47_2.mem") port map (clk, input(47), act_0_47_2);
    i48 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_48_2.mem") port map (clk, input(48), act_0_48_2);
    i49 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_49_2.mem") port map (clk, input(49), act_0_49_2);
    i50 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_50_2.mem") port map (clk, input(50), act_0_50_2);
    i51 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_51_2.mem") port map (clk, input(51), act_0_51_2);
    i52 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_52_2.mem") port map (clk, input(52), act_0_52_2);
    i53 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_53_2.mem") port map (clk, input(53), act_0_53_2);
    i54 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_54_2.mem") port map (clk, input(54), act_0_54_2);
    i55 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_55_2.mem") port map (clk, input(55), act_0_55_2);
    i56 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_56_2.mem") port map (clk, input(56), act_0_56_2);
    i57 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_57_2.mem") port map (clk, input(57), act_0_57_2);
    i58 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_58_2.mem") port map (clk, input(58), act_0_58_2);
    i59 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_59_2.mem") port map (clk, input(59), act_0_59_2);
    i60 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_60_2.mem") port map (clk, input(60), act_0_60_2);
    i61 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_61_2.mem") port map (clk, input(61), act_0_61_2);
    i62 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_62_2.mem") port map (clk, input(62), act_0_62_2);
    i63 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_63_2.mem") port map (clk, input(63), act_0_63_2);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_2, SUM_WIDTH_0_2) + resize(act_0_1_2, SUM_WIDTH_0_2) + resize(act_0_2_2, SUM_WIDTH_0_2) + resize(act_0_3_2, SUM_WIDTH_0_2);
        s1_1 <= resize(act_0_4_2, SUM_WIDTH_0_2) + resize(act_0_5_2, SUM_WIDTH_0_2) + resize(act_0_6_2, SUM_WIDTH_0_2) + resize(act_0_7_2, SUM_WIDTH_0_2);
        s1_2 <= resize(act_0_8_2, SUM_WIDTH_0_2) + resize(act_0_9_2, SUM_WIDTH_0_2) + resize(act_0_10_2, SUM_WIDTH_0_2) + resize(act_0_11_2, SUM_WIDTH_0_2);
        s1_3 <= resize(act_0_12_2, SUM_WIDTH_0_2) + resize(act_0_13_2, SUM_WIDTH_0_2) + resize(act_0_14_2, SUM_WIDTH_0_2) + resize(act_0_15_2, SUM_WIDTH_0_2);
        s1_4 <= resize(act_0_16_2, SUM_WIDTH_0_2) + resize(act_0_17_2, SUM_WIDTH_0_2) + resize(act_0_18_2, SUM_WIDTH_0_2) + resize(act_0_19_2, SUM_WIDTH_0_2);
        s1_5 <= resize(act_0_20_2, SUM_WIDTH_0_2) + resize(act_0_21_2, SUM_WIDTH_0_2) + resize(act_0_22_2, SUM_WIDTH_0_2) + resize(act_0_23_2, SUM_WIDTH_0_2);
        s1_6 <= resize(act_0_24_2, SUM_WIDTH_0_2) + resize(act_0_25_2, SUM_WIDTH_0_2) + resize(act_0_26_2, SUM_WIDTH_0_2) + resize(act_0_27_2, SUM_WIDTH_0_2);
        s1_7 <= resize(act_0_28_2, SUM_WIDTH_0_2) + resize(act_0_29_2, SUM_WIDTH_0_2) + resize(act_0_30_2, SUM_WIDTH_0_2) + resize(act_0_31_2, SUM_WIDTH_0_2);
        s1_8 <= resize(act_0_32_2, SUM_WIDTH_0_2) + resize(act_0_33_2, SUM_WIDTH_0_2) + resize(act_0_34_2, SUM_WIDTH_0_2) + resize(act_0_35_2, SUM_WIDTH_0_2);
        s1_9 <= resize(act_0_36_2, SUM_WIDTH_0_2) + resize(act_0_37_2, SUM_WIDTH_0_2) + resize(act_0_38_2, SUM_WIDTH_0_2) + resize(act_0_39_2, SUM_WIDTH_0_2);
        s1_10 <= resize(act_0_40_2, SUM_WIDTH_0_2) + resize(act_0_41_2, SUM_WIDTH_0_2) + resize(act_0_42_2, SUM_WIDTH_0_2) + resize(act_0_43_2, SUM_WIDTH_0_2);
        s1_11 <= resize(act_0_44_2, SUM_WIDTH_0_2) + resize(act_0_45_2, SUM_WIDTH_0_2) + resize(act_0_46_2, SUM_WIDTH_0_2) + resize(act_0_47_2, SUM_WIDTH_0_2);
        s1_12 <= resize(act_0_48_2, SUM_WIDTH_0_2) + resize(act_0_49_2, SUM_WIDTH_0_2) + resize(act_0_50_2, SUM_WIDTH_0_2) + resize(act_0_51_2, SUM_WIDTH_0_2);
        s1_13 <= resize(act_0_52_2, SUM_WIDTH_0_2) + resize(act_0_53_2, SUM_WIDTH_0_2) + resize(act_0_54_2, SUM_WIDTH_0_2) + resize(act_0_55_2, SUM_WIDTH_0_2);
        s1_14 <= resize(act_0_56_2, SUM_WIDTH_0_2) + resize(act_0_57_2, SUM_WIDTH_0_2) + resize(act_0_58_2, SUM_WIDTH_0_2) + resize(act_0_59_2, SUM_WIDTH_0_2);
        s1_15 <= resize(act_0_60_2, SUM_WIDTH_0_2) + resize(act_0_61_2, SUM_WIDTH_0_2) + resize(act_0_62_2, SUM_WIDTH_0_2) + resize(act_0_63_2, SUM_WIDTH_0_2);
        -- Stage 2
        s2_0 <= s1_0 + s1_1 + s1_2 + s1_3;
        s2_1 <= s1_4 + s1_5 + s1_6 + s1_7;
        s2_2 <= s1_8 + s1_9 + s1_10 + s1_11;
        s2_3 <= s1_12 + s1_13 + s1_14 + s1_15;
        -- Stage 3
        sum_0_2 <= s2_0 + s2_1 + s2_2 + s2_3;
      end if;
    end process;
    out0_2 <= saturate(sum_0_2, 8);
  end block;

  -- LAYER 0, ch 3
  gen_l0c3 : block
  signal s1_0, s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7, s1_8, s1_9, s1_10, s1_11, s1_12, s1_13, s1_14, s1_15 : sum_t_0_3;
  signal s2_0, s2_1, s2_2, s2_3 : sum_t_0_3;
  signal sum_0_3 : sum_t_0_3;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_3.mem") port map (clk, input(0), act_0_0_3);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_3.mem") port map (clk, input(1), act_0_1_3);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_3.mem") port map (clk, input(2), act_0_2_3);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_3.mem") port map (clk, input(3), act_0_3_3);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_3.mem") port map (clk, input(4), act_0_4_3);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_3.mem") port map (clk, input(5), act_0_5_3);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_3.mem") port map (clk, input(6), act_0_6_3);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_3.mem") port map (clk, input(7), act_0_7_3);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_3.mem") port map (clk, input(8), act_0_8_3);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_3.mem") port map (clk, input(9), act_0_9_3);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_3.mem") port map (clk, input(10), act_0_10_3);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_3.mem") port map (clk, input(11), act_0_11_3);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_3.mem") port map (clk, input(12), act_0_12_3);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_3.mem") port map (clk, input(13), act_0_13_3);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_3.mem") port map (clk, input(14), act_0_14_3);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_3.mem") port map (clk, input(15), act_0_15_3);
    i16 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_16_3.mem") port map (clk, input(16), act_0_16_3);
    i17 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_17_3.mem") port map (clk, input(17), act_0_17_3);
    i18 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_18_3.mem") port map (clk, input(18), act_0_18_3);
    i19 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_19_3.mem") port map (clk, input(19), act_0_19_3);
    i20 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_20_3.mem") port map (clk, input(20), act_0_20_3);
    i21 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_21_3.mem") port map (clk, input(21), act_0_21_3);
    i22 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_22_3.mem") port map (clk, input(22), act_0_22_3);
    i23 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_23_3.mem") port map (clk, input(23), act_0_23_3);
    i24 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_24_3.mem") port map (clk, input(24), act_0_24_3);
    i25 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_25_3.mem") port map (clk, input(25), act_0_25_3);
    i26 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_26_3.mem") port map (clk, input(26), act_0_26_3);
    i27 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_27_3.mem") port map (clk, input(27), act_0_27_3);
    i28 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_28_3.mem") port map (clk, input(28), act_0_28_3);
    i29 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_29_3.mem") port map (clk, input(29), act_0_29_3);
    i30 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_30_3.mem") port map (clk, input(30), act_0_30_3);
    i31 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_31_3.mem") port map (clk, input(31), act_0_31_3);
    i32 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_32_3.mem") port map (clk, input(32), act_0_32_3);
    i33 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_33_3.mem") port map (clk, input(33), act_0_33_3);
    i34 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_34_3.mem") port map (clk, input(34), act_0_34_3);
    i35 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_35_3.mem") port map (clk, input(35), act_0_35_3);
    i36 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_36_3.mem") port map (clk, input(36), act_0_36_3);
    i37 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_37_3.mem") port map (clk, input(37), act_0_37_3);
    i38 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_38_3.mem") port map (clk, input(38), act_0_38_3);
    i39 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_39_3.mem") port map (clk, input(39), act_0_39_3);
    i40 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_40_3.mem") port map (clk, input(40), act_0_40_3);
    i41 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_41_3.mem") port map (clk, input(41), act_0_41_3);
    i42 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_42_3.mem") port map (clk, input(42), act_0_42_3);
    i43 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_43_3.mem") port map (clk, input(43), act_0_43_3);
    i44 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_44_3.mem") port map (clk, input(44), act_0_44_3);
    i45 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_45_3.mem") port map (clk, input(45), act_0_45_3);
    i46 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_46_3.mem") port map (clk, input(46), act_0_46_3);
    i47 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_47_3.mem") port map (clk, input(47), act_0_47_3);
    i48 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_48_3.mem") port map (clk, input(48), act_0_48_3);
    i49 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_49_3.mem") port map (clk, input(49), act_0_49_3);
    i50 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_50_3.mem") port map (clk, input(50), act_0_50_3);
    i51 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_51_3.mem") port map (clk, input(51), act_0_51_3);
    i52 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_52_3.mem") port map (clk, input(52), act_0_52_3);
    i53 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_53_3.mem") port map (clk, input(53), act_0_53_3);
    i54 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_54_3.mem") port map (clk, input(54), act_0_54_3);
    i55 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_55_3.mem") port map (clk, input(55), act_0_55_3);
    i56 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_56_3.mem") port map (clk, input(56), act_0_56_3);
    i57 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_57_3.mem") port map (clk, input(57), act_0_57_3);
    i58 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_58_3.mem") port map (clk, input(58), act_0_58_3);
    i59 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_59_3.mem") port map (clk, input(59), act_0_59_3);
    i60 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_60_3.mem") port map (clk, input(60), act_0_60_3);
    i61 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_61_3.mem") port map (clk, input(61), act_0_61_3);
    i62 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_62_3.mem") port map (clk, input(62), act_0_62_3);
    i63 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_63_3.mem") port map (clk, input(63), act_0_63_3);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_3, SUM_WIDTH_0_3) + resize(act_0_1_3, SUM_WIDTH_0_3) + resize(act_0_2_3, SUM_WIDTH_0_3) + resize(act_0_3_3, SUM_WIDTH_0_3);
        s1_1 <= resize(act_0_4_3, SUM_WIDTH_0_3) + resize(act_0_5_3, SUM_WIDTH_0_3) + resize(act_0_6_3, SUM_WIDTH_0_3) + resize(act_0_7_3, SUM_WIDTH_0_3);
        s1_2 <= resize(act_0_8_3, SUM_WIDTH_0_3) + resize(act_0_9_3, SUM_WIDTH_0_3) + resize(act_0_10_3, SUM_WIDTH_0_3) + resize(act_0_11_3, SUM_WIDTH_0_3);
        s1_3 <= resize(act_0_12_3, SUM_WIDTH_0_3) + resize(act_0_13_3, SUM_WIDTH_0_3) + resize(act_0_14_3, SUM_WIDTH_0_3) + resize(act_0_15_3, SUM_WIDTH_0_3);
        s1_4 <= resize(act_0_16_3, SUM_WIDTH_0_3) + resize(act_0_17_3, SUM_WIDTH_0_3) + resize(act_0_18_3, SUM_WIDTH_0_3) + resize(act_0_19_3, SUM_WIDTH_0_3);
        s1_5 <= resize(act_0_20_3, SUM_WIDTH_0_3) + resize(act_0_21_3, SUM_WIDTH_0_3) + resize(act_0_22_3, SUM_WIDTH_0_3) + resize(act_0_23_3, SUM_WIDTH_0_3);
        s1_6 <= resize(act_0_24_3, SUM_WIDTH_0_3) + resize(act_0_25_3, SUM_WIDTH_0_3) + resize(act_0_26_3, SUM_WIDTH_0_3) + resize(act_0_27_3, SUM_WIDTH_0_3);
        s1_7 <= resize(act_0_28_3, SUM_WIDTH_0_3) + resize(act_0_29_3, SUM_WIDTH_0_3) + resize(act_0_30_3, SUM_WIDTH_0_3) + resize(act_0_31_3, SUM_WIDTH_0_3);
        s1_8 <= resize(act_0_32_3, SUM_WIDTH_0_3) + resize(act_0_33_3, SUM_WIDTH_0_3) + resize(act_0_34_3, SUM_WIDTH_0_3) + resize(act_0_35_3, SUM_WIDTH_0_3);
        s1_9 <= resize(act_0_36_3, SUM_WIDTH_0_3) + resize(act_0_37_3, SUM_WIDTH_0_3) + resize(act_0_38_3, SUM_WIDTH_0_3) + resize(act_0_39_3, SUM_WIDTH_0_3);
        s1_10 <= resize(act_0_40_3, SUM_WIDTH_0_3) + resize(act_0_41_3, SUM_WIDTH_0_3) + resize(act_0_42_3, SUM_WIDTH_0_3) + resize(act_0_43_3, SUM_WIDTH_0_3);
        s1_11 <= resize(act_0_44_3, SUM_WIDTH_0_3) + resize(act_0_45_3, SUM_WIDTH_0_3) + resize(act_0_46_3, SUM_WIDTH_0_3) + resize(act_0_47_3, SUM_WIDTH_0_3);
        s1_12 <= resize(act_0_48_3, SUM_WIDTH_0_3) + resize(act_0_49_3, SUM_WIDTH_0_3) + resize(act_0_50_3, SUM_WIDTH_0_3) + resize(act_0_51_3, SUM_WIDTH_0_3);
        s1_13 <= resize(act_0_52_3, SUM_WIDTH_0_3) + resize(act_0_53_3, SUM_WIDTH_0_3) + resize(act_0_54_3, SUM_WIDTH_0_3) + resize(act_0_55_3, SUM_WIDTH_0_3);
        s1_14 <= resize(act_0_56_3, SUM_WIDTH_0_3) + resize(act_0_57_3, SUM_WIDTH_0_3) + resize(act_0_58_3, SUM_WIDTH_0_3) + resize(act_0_59_3, SUM_WIDTH_0_3);
        s1_15 <= resize(act_0_60_3, SUM_WIDTH_0_3) + resize(act_0_61_3, SUM_WIDTH_0_3) + resize(act_0_62_3, SUM_WIDTH_0_3) + resize(act_0_63_3, SUM_WIDTH_0_3);
        -- Stage 2
        s2_0 <= s1_0 + s1_1 + s1_2 + s1_3;
        s2_1 <= s1_4 + s1_5 + s1_6 + s1_7;
        s2_2 <= s1_8 + s1_9 + s1_10 + s1_11;
        s2_3 <= s1_12 + s1_13 + s1_14 + s1_15;
        -- Stage 3
        sum_0_3 <= s2_0 + s2_1 + s2_2 + s2_3;
      end if;
    end process;
    out0_3 <= saturate(sum_0_3, 8);
  end block;

  -- LAYER 0, ch 4
  gen_l0c4 : block
  signal s1_0, s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7, s1_8, s1_9, s1_10, s1_11, s1_12, s1_13, s1_14, s1_15 : sum_t_0_4;
  signal s2_0, s2_1, s2_2, s2_3 : sum_t_0_4;
  signal sum_0_4 : sum_t_0_4;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_4.mem") port map (clk, input(0), act_0_0_4);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_4.mem") port map (clk, input(1), act_0_1_4);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_4.mem") port map (clk, input(2), act_0_2_4);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_4.mem") port map (clk, input(3), act_0_3_4);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_4.mem") port map (clk, input(4), act_0_4_4);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_4.mem") port map (clk, input(5), act_0_5_4);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_4.mem") port map (clk, input(6), act_0_6_4);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_4.mem") port map (clk, input(7), act_0_7_4);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_4.mem") port map (clk, input(8), act_0_8_4);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_4.mem") port map (clk, input(9), act_0_9_4);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_4.mem") port map (clk, input(10), act_0_10_4);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_4.mem") port map (clk, input(11), act_0_11_4);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_4.mem") port map (clk, input(12), act_0_12_4);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_4.mem") port map (clk, input(13), act_0_13_4);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_4.mem") port map (clk, input(14), act_0_14_4);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_4.mem") port map (clk, input(15), act_0_15_4);
    i16 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_16_4.mem") port map (clk, input(16), act_0_16_4);
    i17 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_17_4.mem") port map (clk, input(17), act_0_17_4);
    i18 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_18_4.mem") port map (clk, input(18), act_0_18_4);
    i19 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_19_4.mem") port map (clk, input(19), act_0_19_4);
    i20 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_20_4.mem") port map (clk, input(20), act_0_20_4);
    i21 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_21_4.mem") port map (clk, input(21), act_0_21_4);
    i22 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_22_4.mem") port map (clk, input(22), act_0_22_4);
    i23 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_23_4.mem") port map (clk, input(23), act_0_23_4);
    i24 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_24_4.mem") port map (clk, input(24), act_0_24_4);
    i25 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_25_4.mem") port map (clk, input(25), act_0_25_4);
    i26 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_26_4.mem") port map (clk, input(26), act_0_26_4);
    i27 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_27_4.mem") port map (clk, input(27), act_0_27_4);
    i28 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_28_4.mem") port map (clk, input(28), act_0_28_4);
    i29 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_29_4.mem") port map (clk, input(29), act_0_29_4);
    i30 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_30_4.mem") port map (clk, input(30), act_0_30_4);
    i31 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_31_4.mem") port map (clk, input(31), act_0_31_4);
    i32 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_32_4.mem") port map (clk, input(32), act_0_32_4);
    i33 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_33_4.mem") port map (clk, input(33), act_0_33_4);
    i34 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_34_4.mem") port map (clk, input(34), act_0_34_4);
    i35 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_35_4.mem") port map (clk, input(35), act_0_35_4);
    i36 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_36_4.mem") port map (clk, input(36), act_0_36_4);
    i37 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_37_4.mem") port map (clk, input(37), act_0_37_4);
    i38 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_38_4.mem") port map (clk, input(38), act_0_38_4);
    i39 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_39_4.mem") port map (clk, input(39), act_0_39_4);
    i40 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_40_4.mem") port map (clk, input(40), act_0_40_4);
    i41 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_41_4.mem") port map (clk, input(41), act_0_41_4);
    i42 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_42_4.mem") port map (clk, input(42), act_0_42_4);
    i43 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_43_4.mem") port map (clk, input(43), act_0_43_4);
    i44 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_44_4.mem") port map (clk, input(44), act_0_44_4);
    i45 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_45_4.mem") port map (clk, input(45), act_0_45_4);
    i46 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_46_4.mem") port map (clk, input(46), act_0_46_4);
    i47 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_47_4.mem") port map (clk, input(47), act_0_47_4);
    i48 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_48_4.mem") port map (clk, input(48), act_0_48_4);
    i49 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_49_4.mem") port map (clk, input(49), act_0_49_4);
    i50 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_50_4.mem") port map (clk, input(50), act_0_50_4);
    i51 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_51_4.mem") port map (clk, input(51), act_0_51_4);
    i52 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_52_4.mem") port map (clk, input(52), act_0_52_4);
    i53 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_53_4.mem") port map (clk, input(53), act_0_53_4);
    i54 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_54_4.mem") port map (clk, input(54), act_0_54_4);
    i55 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_55_4.mem") port map (clk, input(55), act_0_55_4);
    i56 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_56_4.mem") port map (clk, input(56), act_0_56_4);
    i57 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_57_4.mem") port map (clk, input(57), act_0_57_4);
    i58 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_58_4.mem") port map (clk, input(58), act_0_58_4);
    i59 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_59_4.mem") port map (clk, input(59), act_0_59_4);
    i60 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_60_4.mem") port map (clk, input(60), act_0_60_4);
    i61 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_61_4.mem") port map (clk, input(61), act_0_61_4);
    i62 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_62_4.mem") port map (clk, input(62), act_0_62_4);
    i63 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_63_4.mem") port map (clk, input(63), act_0_63_4);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_4, SUM_WIDTH_0_4) + resize(act_0_1_4, SUM_WIDTH_0_4) + resize(act_0_2_4, SUM_WIDTH_0_4) + resize(act_0_3_4, SUM_WIDTH_0_4);
        s1_1 <= resize(act_0_4_4, SUM_WIDTH_0_4) + resize(act_0_5_4, SUM_WIDTH_0_4) + resize(act_0_6_4, SUM_WIDTH_0_4) + resize(act_0_7_4, SUM_WIDTH_0_4);
        s1_2 <= resize(act_0_8_4, SUM_WIDTH_0_4) + resize(act_0_9_4, SUM_WIDTH_0_4) + resize(act_0_10_4, SUM_WIDTH_0_4) + resize(act_0_11_4, SUM_WIDTH_0_4);
        s1_3 <= resize(act_0_12_4, SUM_WIDTH_0_4) + resize(act_0_13_4, SUM_WIDTH_0_4) + resize(act_0_14_4, SUM_WIDTH_0_4) + resize(act_0_15_4, SUM_WIDTH_0_4);
        s1_4 <= resize(act_0_16_4, SUM_WIDTH_0_4) + resize(act_0_17_4, SUM_WIDTH_0_4) + resize(act_0_18_4, SUM_WIDTH_0_4) + resize(act_0_19_4, SUM_WIDTH_0_4);
        s1_5 <= resize(act_0_20_4, SUM_WIDTH_0_4) + resize(act_0_21_4, SUM_WIDTH_0_4) + resize(act_0_22_4, SUM_WIDTH_0_4) + resize(act_0_23_4, SUM_WIDTH_0_4);
        s1_6 <= resize(act_0_24_4, SUM_WIDTH_0_4) + resize(act_0_25_4, SUM_WIDTH_0_4) + resize(act_0_26_4, SUM_WIDTH_0_4) + resize(act_0_27_4, SUM_WIDTH_0_4);
        s1_7 <= resize(act_0_28_4, SUM_WIDTH_0_4) + resize(act_0_29_4, SUM_WIDTH_0_4) + resize(act_0_30_4, SUM_WIDTH_0_4) + resize(act_0_31_4, SUM_WIDTH_0_4);
        s1_8 <= resize(act_0_32_4, SUM_WIDTH_0_4) + resize(act_0_33_4, SUM_WIDTH_0_4) + resize(act_0_34_4, SUM_WIDTH_0_4) + resize(act_0_35_4, SUM_WIDTH_0_4);
        s1_9 <= resize(act_0_36_4, SUM_WIDTH_0_4) + resize(act_0_37_4, SUM_WIDTH_0_4) + resize(act_0_38_4, SUM_WIDTH_0_4) + resize(act_0_39_4, SUM_WIDTH_0_4);
        s1_10 <= resize(act_0_40_4, SUM_WIDTH_0_4) + resize(act_0_41_4, SUM_WIDTH_0_4) + resize(act_0_42_4, SUM_WIDTH_0_4) + resize(act_0_43_4, SUM_WIDTH_0_4);
        s1_11 <= resize(act_0_44_4, SUM_WIDTH_0_4) + resize(act_0_45_4, SUM_WIDTH_0_4) + resize(act_0_46_4, SUM_WIDTH_0_4) + resize(act_0_47_4, SUM_WIDTH_0_4);
        s1_12 <= resize(act_0_48_4, SUM_WIDTH_0_4) + resize(act_0_49_4, SUM_WIDTH_0_4) + resize(act_0_50_4, SUM_WIDTH_0_4) + resize(act_0_51_4, SUM_WIDTH_0_4);
        s1_13 <= resize(act_0_52_4, SUM_WIDTH_0_4) + resize(act_0_53_4, SUM_WIDTH_0_4) + resize(act_0_54_4, SUM_WIDTH_0_4) + resize(act_0_55_4, SUM_WIDTH_0_4);
        s1_14 <= resize(act_0_56_4, SUM_WIDTH_0_4) + resize(act_0_57_4, SUM_WIDTH_0_4) + resize(act_0_58_4, SUM_WIDTH_0_4) + resize(act_0_59_4, SUM_WIDTH_0_4);
        s1_15 <= resize(act_0_60_4, SUM_WIDTH_0_4) + resize(act_0_61_4, SUM_WIDTH_0_4) + resize(act_0_62_4, SUM_WIDTH_0_4) + resize(act_0_63_4, SUM_WIDTH_0_4);
        -- Stage 2
        s2_0 <= s1_0 + s1_1 + s1_2 + s1_3;
        s2_1 <= s1_4 + s1_5 + s1_6 + s1_7;
        s2_2 <= s1_8 + s1_9 + s1_10 + s1_11;
        s2_3 <= s1_12 + s1_13 + s1_14 + s1_15;
        -- Stage 3
        sum_0_4 <= s2_0 + s2_1 + s2_2 + s2_3;
      end if;
    end process;
    out0_4 <= saturate(sum_0_4, 8);
  end block;

  -- LAYER 0, ch 5
  gen_l0c5 : block
  signal s1_0, s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7, s1_8, s1_9, s1_10, s1_11, s1_12, s1_13, s1_14, s1_15 : sum_t_0_5;
  signal s2_0, s2_1, s2_2, s2_3 : sum_t_0_5;
  signal sum_0_5 : sum_t_0_5;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_5.mem") port map (clk, input(0), act_0_0_5);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_5.mem") port map (clk, input(1), act_0_1_5);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_5.mem") port map (clk, input(2), act_0_2_5);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_5.mem") port map (clk, input(3), act_0_3_5);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_5.mem") port map (clk, input(4), act_0_4_5);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_5.mem") port map (clk, input(5), act_0_5_5);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_5.mem") port map (clk, input(6), act_0_6_5);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_5.mem") port map (clk, input(7), act_0_7_5);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_5.mem") port map (clk, input(8), act_0_8_5);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_5.mem") port map (clk, input(9), act_0_9_5);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_5.mem") port map (clk, input(10), act_0_10_5);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_5.mem") port map (clk, input(11), act_0_11_5);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_5.mem") port map (clk, input(12), act_0_12_5);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_5.mem") port map (clk, input(13), act_0_13_5);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_5.mem") port map (clk, input(14), act_0_14_5);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_5.mem") port map (clk, input(15), act_0_15_5);
    i16 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_16_5.mem") port map (clk, input(16), act_0_16_5);
    i17 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_17_5.mem") port map (clk, input(17), act_0_17_5);
    i18 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_18_5.mem") port map (clk, input(18), act_0_18_5);
    i19 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_19_5.mem") port map (clk, input(19), act_0_19_5);
    i20 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_20_5.mem") port map (clk, input(20), act_0_20_5);
    i21 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_21_5.mem") port map (clk, input(21), act_0_21_5);
    i22 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_22_5.mem") port map (clk, input(22), act_0_22_5);
    i23 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_23_5.mem") port map (clk, input(23), act_0_23_5);
    i24 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_24_5.mem") port map (clk, input(24), act_0_24_5);
    i25 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_25_5.mem") port map (clk, input(25), act_0_25_5);
    i26 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_26_5.mem") port map (clk, input(26), act_0_26_5);
    i27 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_27_5.mem") port map (clk, input(27), act_0_27_5);
    i28 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_28_5.mem") port map (clk, input(28), act_0_28_5);
    i29 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_29_5.mem") port map (clk, input(29), act_0_29_5);
    i30 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_30_5.mem") port map (clk, input(30), act_0_30_5);
    i31 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_31_5.mem") port map (clk, input(31), act_0_31_5);
    i32 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_32_5.mem") port map (clk, input(32), act_0_32_5);
    i33 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_33_5.mem") port map (clk, input(33), act_0_33_5);
    i34 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_34_5.mem") port map (clk, input(34), act_0_34_5);
    i35 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_35_5.mem") port map (clk, input(35), act_0_35_5);
    i36 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_36_5.mem") port map (clk, input(36), act_0_36_5);
    i37 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_37_5.mem") port map (clk, input(37), act_0_37_5);
    i38 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_38_5.mem") port map (clk, input(38), act_0_38_5);
    i39 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_39_5.mem") port map (clk, input(39), act_0_39_5);
    i40 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_40_5.mem") port map (clk, input(40), act_0_40_5);
    i41 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_41_5.mem") port map (clk, input(41), act_0_41_5);
    i42 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_42_5.mem") port map (clk, input(42), act_0_42_5);
    i43 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_43_5.mem") port map (clk, input(43), act_0_43_5);
    i44 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_44_5.mem") port map (clk, input(44), act_0_44_5);
    i45 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_45_5.mem") port map (clk, input(45), act_0_45_5);
    i46 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_46_5.mem") port map (clk, input(46), act_0_46_5);
    i47 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_47_5.mem") port map (clk, input(47), act_0_47_5);
    i48 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_48_5.mem") port map (clk, input(48), act_0_48_5);
    i49 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_49_5.mem") port map (clk, input(49), act_0_49_5);
    i50 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_50_5.mem") port map (clk, input(50), act_0_50_5);
    i51 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_51_5.mem") port map (clk, input(51), act_0_51_5);
    i52 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_52_5.mem") port map (clk, input(52), act_0_52_5);
    i53 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_53_5.mem") port map (clk, input(53), act_0_53_5);
    i54 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_54_5.mem") port map (clk, input(54), act_0_54_5);
    i55 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_55_5.mem") port map (clk, input(55), act_0_55_5);
    i56 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_56_5.mem") port map (clk, input(56), act_0_56_5);
    i57 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_57_5.mem") port map (clk, input(57), act_0_57_5);
    i58 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_58_5.mem") port map (clk, input(58), act_0_58_5);
    i59 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_59_5.mem") port map (clk, input(59), act_0_59_5);
    i60 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_60_5.mem") port map (clk, input(60), act_0_60_5);
    i61 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_61_5.mem") port map (clk, input(61), act_0_61_5);
    i62 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_62_5.mem") port map (clk, input(62), act_0_62_5);
    i63 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_63_5.mem") port map (clk, input(63), act_0_63_5);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_5, SUM_WIDTH_0_5) + resize(act_0_1_5, SUM_WIDTH_0_5) + resize(act_0_2_5, SUM_WIDTH_0_5) + resize(act_0_3_5, SUM_WIDTH_0_5);
        s1_1 <= resize(act_0_4_5, SUM_WIDTH_0_5) + resize(act_0_5_5, SUM_WIDTH_0_5) + resize(act_0_6_5, SUM_WIDTH_0_5) + resize(act_0_7_5, SUM_WIDTH_0_5);
        s1_2 <= resize(act_0_8_5, SUM_WIDTH_0_5) + resize(act_0_9_5, SUM_WIDTH_0_5) + resize(act_0_10_5, SUM_WIDTH_0_5) + resize(act_0_11_5, SUM_WIDTH_0_5);
        s1_3 <= resize(act_0_12_5, SUM_WIDTH_0_5) + resize(act_0_13_5, SUM_WIDTH_0_5) + resize(act_0_14_5, SUM_WIDTH_0_5) + resize(act_0_15_5, SUM_WIDTH_0_5);
        s1_4 <= resize(act_0_16_5, SUM_WIDTH_0_5) + resize(act_0_17_5, SUM_WIDTH_0_5) + resize(act_0_18_5, SUM_WIDTH_0_5) + resize(act_0_19_5, SUM_WIDTH_0_5);
        s1_5 <= resize(act_0_20_5, SUM_WIDTH_0_5) + resize(act_0_21_5, SUM_WIDTH_0_5) + resize(act_0_22_5, SUM_WIDTH_0_5) + resize(act_0_23_5, SUM_WIDTH_0_5);
        s1_6 <= resize(act_0_24_5, SUM_WIDTH_0_5) + resize(act_0_25_5, SUM_WIDTH_0_5) + resize(act_0_26_5, SUM_WIDTH_0_5) + resize(act_0_27_5, SUM_WIDTH_0_5);
        s1_7 <= resize(act_0_28_5, SUM_WIDTH_0_5) + resize(act_0_29_5, SUM_WIDTH_0_5) + resize(act_0_30_5, SUM_WIDTH_0_5) + resize(act_0_31_5, SUM_WIDTH_0_5);
        s1_8 <= resize(act_0_32_5, SUM_WIDTH_0_5) + resize(act_0_33_5, SUM_WIDTH_0_5) + resize(act_0_34_5, SUM_WIDTH_0_5) + resize(act_0_35_5, SUM_WIDTH_0_5);
        s1_9 <= resize(act_0_36_5, SUM_WIDTH_0_5) + resize(act_0_37_5, SUM_WIDTH_0_5) + resize(act_0_38_5, SUM_WIDTH_0_5) + resize(act_0_39_5, SUM_WIDTH_0_5);
        s1_10 <= resize(act_0_40_5, SUM_WIDTH_0_5) + resize(act_0_41_5, SUM_WIDTH_0_5) + resize(act_0_42_5, SUM_WIDTH_0_5) + resize(act_0_43_5, SUM_WIDTH_0_5);
        s1_11 <= resize(act_0_44_5, SUM_WIDTH_0_5) + resize(act_0_45_5, SUM_WIDTH_0_5) + resize(act_0_46_5, SUM_WIDTH_0_5) + resize(act_0_47_5, SUM_WIDTH_0_5);
        s1_12 <= resize(act_0_48_5, SUM_WIDTH_0_5) + resize(act_0_49_5, SUM_WIDTH_0_5) + resize(act_0_50_5, SUM_WIDTH_0_5) + resize(act_0_51_5, SUM_WIDTH_0_5);
        s1_13 <= resize(act_0_52_5, SUM_WIDTH_0_5) + resize(act_0_53_5, SUM_WIDTH_0_5) + resize(act_0_54_5, SUM_WIDTH_0_5) + resize(act_0_55_5, SUM_WIDTH_0_5);
        s1_14 <= resize(act_0_56_5, SUM_WIDTH_0_5) + resize(act_0_57_5, SUM_WIDTH_0_5) + resize(act_0_58_5, SUM_WIDTH_0_5) + resize(act_0_59_5, SUM_WIDTH_0_5);
        s1_15 <= resize(act_0_60_5, SUM_WIDTH_0_5) + resize(act_0_61_5, SUM_WIDTH_0_5) + resize(act_0_62_5, SUM_WIDTH_0_5) + resize(act_0_63_5, SUM_WIDTH_0_5);
        -- Stage 2
        s2_0 <= s1_0 + s1_1 + s1_2 + s1_3;
        s2_1 <= s1_4 + s1_5 + s1_6 + s1_7;
        s2_2 <= s1_8 + s1_9 + s1_10 + s1_11;
        s2_3 <= s1_12 + s1_13 + s1_14 + s1_15;
        -- Stage 3
        sum_0_5 <= s2_0 + s2_1 + s2_2 + s2_3;
      end if;
    end process;
    out0_5 <= saturate(sum_0_5, 8);
  end block;

  -- LAYER 0, ch 6
  gen_l0c6 : block
  signal s1_0, s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7, s1_8, s1_9, s1_10, s1_11, s1_12, s1_13, s1_14, s1_15 : sum_t_0_6;
  signal s2_0, s2_1, s2_2, s2_3 : sum_t_0_6;
  signal sum_0_6 : sum_t_0_6;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_6.mem") port map (clk, input(0), act_0_0_6);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_6.mem") port map (clk, input(1), act_0_1_6);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_6.mem") port map (clk, input(2), act_0_2_6);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_6.mem") port map (clk, input(3), act_0_3_6);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_6.mem") port map (clk, input(4), act_0_4_6);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_6.mem") port map (clk, input(5), act_0_5_6);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_6.mem") port map (clk, input(6), act_0_6_6);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_6.mem") port map (clk, input(7), act_0_7_6);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_6.mem") port map (clk, input(8), act_0_8_6);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_6.mem") port map (clk, input(9), act_0_9_6);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_6.mem") port map (clk, input(10), act_0_10_6);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_6.mem") port map (clk, input(11), act_0_11_6);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_6.mem") port map (clk, input(12), act_0_12_6);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_6.mem") port map (clk, input(13), act_0_13_6);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_6.mem") port map (clk, input(14), act_0_14_6);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_6.mem") port map (clk, input(15), act_0_15_6);
    i16 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_16_6.mem") port map (clk, input(16), act_0_16_6);
    i17 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_17_6.mem") port map (clk, input(17), act_0_17_6);
    i18 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_18_6.mem") port map (clk, input(18), act_0_18_6);
    i19 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_19_6.mem") port map (clk, input(19), act_0_19_6);
    i20 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_20_6.mem") port map (clk, input(20), act_0_20_6);
    i21 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_21_6.mem") port map (clk, input(21), act_0_21_6);
    i22 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_22_6.mem") port map (clk, input(22), act_0_22_6);
    i23 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_23_6.mem") port map (clk, input(23), act_0_23_6);
    i24 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_24_6.mem") port map (clk, input(24), act_0_24_6);
    i25 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_25_6.mem") port map (clk, input(25), act_0_25_6);
    i26 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_26_6.mem") port map (clk, input(26), act_0_26_6);
    i27 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_27_6.mem") port map (clk, input(27), act_0_27_6);
    i28 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_28_6.mem") port map (clk, input(28), act_0_28_6);
    i29 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_29_6.mem") port map (clk, input(29), act_0_29_6);
    i30 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_30_6.mem") port map (clk, input(30), act_0_30_6);
    i31 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_31_6.mem") port map (clk, input(31), act_0_31_6);
    i32 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_32_6.mem") port map (clk, input(32), act_0_32_6);
    i33 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_33_6.mem") port map (clk, input(33), act_0_33_6);
    i34 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_34_6.mem") port map (clk, input(34), act_0_34_6);
    i35 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_35_6.mem") port map (clk, input(35), act_0_35_6);
    i36 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_36_6.mem") port map (clk, input(36), act_0_36_6);
    i37 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_37_6.mem") port map (clk, input(37), act_0_37_6);
    i38 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_38_6.mem") port map (clk, input(38), act_0_38_6);
    i39 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_39_6.mem") port map (clk, input(39), act_0_39_6);
    i40 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_40_6.mem") port map (clk, input(40), act_0_40_6);
    i41 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_41_6.mem") port map (clk, input(41), act_0_41_6);
    i42 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_42_6.mem") port map (clk, input(42), act_0_42_6);
    i43 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_43_6.mem") port map (clk, input(43), act_0_43_6);
    i44 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_44_6.mem") port map (clk, input(44), act_0_44_6);
    i45 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_45_6.mem") port map (clk, input(45), act_0_45_6);
    i46 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_46_6.mem") port map (clk, input(46), act_0_46_6);
    i47 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_47_6.mem") port map (clk, input(47), act_0_47_6);
    i48 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_48_6.mem") port map (clk, input(48), act_0_48_6);
    i49 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_49_6.mem") port map (clk, input(49), act_0_49_6);
    i50 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_50_6.mem") port map (clk, input(50), act_0_50_6);
    i51 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_51_6.mem") port map (clk, input(51), act_0_51_6);
    i52 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_52_6.mem") port map (clk, input(52), act_0_52_6);
    i53 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_53_6.mem") port map (clk, input(53), act_0_53_6);
    i54 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_54_6.mem") port map (clk, input(54), act_0_54_6);
    i55 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_55_6.mem") port map (clk, input(55), act_0_55_6);
    i56 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_56_6.mem") port map (clk, input(56), act_0_56_6);
    i57 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_57_6.mem") port map (clk, input(57), act_0_57_6);
    i58 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_58_6.mem") port map (clk, input(58), act_0_58_6);
    i59 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_59_6.mem") port map (clk, input(59), act_0_59_6);
    i60 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_60_6.mem") port map (clk, input(60), act_0_60_6);
    i61 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_61_6.mem") port map (clk, input(61), act_0_61_6);
    i62 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_62_6.mem") port map (clk, input(62), act_0_62_6);
    i63 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_63_6.mem") port map (clk, input(63), act_0_63_6);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_6, SUM_WIDTH_0_6) + resize(act_0_1_6, SUM_WIDTH_0_6) + resize(act_0_2_6, SUM_WIDTH_0_6) + resize(act_0_3_6, SUM_WIDTH_0_6);
        s1_1 <= resize(act_0_4_6, SUM_WIDTH_0_6) + resize(act_0_5_6, SUM_WIDTH_0_6) + resize(act_0_6_6, SUM_WIDTH_0_6) + resize(act_0_7_6, SUM_WIDTH_0_6);
        s1_2 <= resize(act_0_8_6, SUM_WIDTH_0_6) + resize(act_0_9_6, SUM_WIDTH_0_6) + resize(act_0_10_6, SUM_WIDTH_0_6) + resize(act_0_11_6, SUM_WIDTH_0_6);
        s1_3 <= resize(act_0_12_6, SUM_WIDTH_0_6) + resize(act_0_13_6, SUM_WIDTH_0_6) + resize(act_0_14_6, SUM_WIDTH_0_6) + resize(act_0_15_6, SUM_WIDTH_0_6);
        s1_4 <= resize(act_0_16_6, SUM_WIDTH_0_6) + resize(act_0_17_6, SUM_WIDTH_0_6) + resize(act_0_18_6, SUM_WIDTH_0_6) + resize(act_0_19_6, SUM_WIDTH_0_6);
        s1_5 <= resize(act_0_20_6, SUM_WIDTH_0_6) + resize(act_0_21_6, SUM_WIDTH_0_6) + resize(act_0_22_6, SUM_WIDTH_0_6) + resize(act_0_23_6, SUM_WIDTH_0_6);
        s1_6 <= resize(act_0_24_6, SUM_WIDTH_0_6) + resize(act_0_25_6, SUM_WIDTH_0_6) + resize(act_0_26_6, SUM_WIDTH_0_6) + resize(act_0_27_6, SUM_WIDTH_0_6);
        s1_7 <= resize(act_0_28_6, SUM_WIDTH_0_6) + resize(act_0_29_6, SUM_WIDTH_0_6) + resize(act_0_30_6, SUM_WIDTH_0_6) + resize(act_0_31_6, SUM_WIDTH_0_6);
        s1_8 <= resize(act_0_32_6, SUM_WIDTH_0_6) + resize(act_0_33_6, SUM_WIDTH_0_6) + resize(act_0_34_6, SUM_WIDTH_0_6) + resize(act_0_35_6, SUM_WIDTH_0_6);
        s1_9 <= resize(act_0_36_6, SUM_WIDTH_0_6) + resize(act_0_37_6, SUM_WIDTH_0_6) + resize(act_0_38_6, SUM_WIDTH_0_6) + resize(act_0_39_6, SUM_WIDTH_0_6);
        s1_10 <= resize(act_0_40_6, SUM_WIDTH_0_6) + resize(act_0_41_6, SUM_WIDTH_0_6) + resize(act_0_42_6, SUM_WIDTH_0_6) + resize(act_0_43_6, SUM_WIDTH_0_6);
        s1_11 <= resize(act_0_44_6, SUM_WIDTH_0_6) + resize(act_0_45_6, SUM_WIDTH_0_6) + resize(act_0_46_6, SUM_WIDTH_0_6) + resize(act_0_47_6, SUM_WIDTH_0_6);
        s1_12 <= resize(act_0_48_6, SUM_WIDTH_0_6) + resize(act_0_49_6, SUM_WIDTH_0_6) + resize(act_0_50_6, SUM_WIDTH_0_6) + resize(act_0_51_6, SUM_WIDTH_0_6);
        s1_13 <= resize(act_0_52_6, SUM_WIDTH_0_6) + resize(act_0_53_6, SUM_WIDTH_0_6) + resize(act_0_54_6, SUM_WIDTH_0_6) + resize(act_0_55_6, SUM_WIDTH_0_6);
        s1_14 <= resize(act_0_56_6, SUM_WIDTH_0_6) + resize(act_0_57_6, SUM_WIDTH_0_6) + resize(act_0_58_6, SUM_WIDTH_0_6) + resize(act_0_59_6, SUM_WIDTH_0_6);
        s1_15 <= resize(act_0_60_6, SUM_WIDTH_0_6) + resize(act_0_61_6, SUM_WIDTH_0_6) + resize(act_0_62_6, SUM_WIDTH_0_6) + resize(act_0_63_6, SUM_WIDTH_0_6);
        -- Stage 2
        s2_0 <= s1_0 + s1_1 + s1_2 + s1_3;
        s2_1 <= s1_4 + s1_5 + s1_6 + s1_7;
        s2_2 <= s1_8 + s1_9 + s1_10 + s1_11;
        s2_3 <= s1_12 + s1_13 + s1_14 + s1_15;
        -- Stage 3
        sum_0_6 <= s2_0 + s2_1 + s2_2 + s2_3;
      end if;
    end process;
    out0_6 <= saturate(sum_0_6, 8);
  end block;

  -- LAYER 0, ch 7
  gen_l0c7 : block
  signal s1_0, s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7, s1_8, s1_9, s1_10, s1_11, s1_12, s1_13, s1_14, s1_15 : sum_t_0_7;
  signal s2_0, s2_1, s2_2, s2_3 : sum_t_0_7;
  signal sum_0_7 : sum_t_0_7;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_7.mem") port map (clk, input(0), act_0_0_7);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_7.mem") port map (clk, input(1), act_0_1_7);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_7.mem") port map (clk, input(2), act_0_2_7);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_7.mem") port map (clk, input(3), act_0_3_7);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_7.mem") port map (clk, input(4), act_0_4_7);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_7.mem") port map (clk, input(5), act_0_5_7);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_7.mem") port map (clk, input(6), act_0_6_7);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_7.mem") port map (clk, input(7), act_0_7_7);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_7.mem") port map (clk, input(8), act_0_8_7);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_7.mem") port map (clk, input(9), act_0_9_7);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_7.mem") port map (clk, input(10), act_0_10_7);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_7.mem") port map (clk, input(11), act_0_11_7);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_7.mem") port map (clk, input(12), act_0_12_7);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_7.mem") port map (clk, input(13), act_0_13_7);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_7.mem") port map (clk, input(14), act_0_14_7);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_7.mem") port map (clk, input(15), act_0_15_7);
    i16 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_16_7.mem") port map (clk, input(16), act_0_16_7);
    i17 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_17_7.mem") port map (clk, input(17), act_0_17_7);
    i18 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_18_7.mem") port map (clk, input(18), act_0_18_7);
    i19 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_19_7.mem") port map (clk, input(19), act_0_19_7);
    i20 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_20_7.mem") port map (clk, input(20), act_0_20_7);
    i21 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_21_7.mem") port map (clk, input(21), act_0_21_7);
    i22 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_22_7.mem") port map (clk, input(22), act_0_22_7);
    i23 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_23_7.mem") port map (clk, input(23), act_0_23_7);
    i24 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_24_7.mem") port map (clk, input(24), act_0_24_7);
    i25 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_25_7.mem") port map (clk, input(25), act_0_25_7);
    i26 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_26_7.mem") port map (clk, input(26), act_0_26_7);
    i27 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_27_7.mem") port map (clk, input(27), act_0_27_7);
    i28 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_28_7.mem") port map (clk, input(28), act_0_28_7);
    i29 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_29_7.mem") port map (clk, input(29), act_0_29_7);
    i30 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_30_7.mem") port map (clk, input(30), act_0_30_7);
    i31 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_31_7.mem") port map (clk, input(31), act_0_31_7);
    i32 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_32_7.mem") port map (clk, input(32), act_0_32_7);
    i33 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_33_7.mem") port map (clk, input(33), act_0_33_7);
    i34 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_34_7.mem") port map (clk, input(34), act_0_34_7);
    i35 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_35_7.mem") port map (clk, input(35), act_0_35_7);
    i36 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_36_7.mem") port map (clk, input(36), act_0_36_7);
    i37 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_37_7.mem") port map (clk, input(37), act_0_37_7);
    i38 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_38_7.mem") port map (clk, input(38), act_0_38_7);
    i39 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_39_7.mem") port map (clk, input(39), act_0_39_7);
    i40 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_40_7.mem") port map (clk, input(40), act_0_40_7);
    i41 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_41_7.mem") port map (clk, input(41), act_0_41_7);
    i42 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_42_7.mem") port map (clk, input(42), act_0_42_7);
    i43 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_43_7.mem") port map (clk, input(43), act_0_43_7);
    i44 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_44_7.mem") port map (clk, input(44), act_0_44_7);
    i45 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_45_7.mem") port map (clk, input(45), act_0_45_7);
    i46 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_46_7.mem") port map (clk, input(46), act_0_46_7);
    i47 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_47_7.mem") port map (clk, input(47), act_0_47_7);
    i48 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_48_7.mem") port map (clk, input(48), act_0_48_7);
    i49 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_49_7.mem") port map (clk, input(49), act_0_49_7);
    i50 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_50_7.mem") port map (clk, input(50), act_0_50_7);
    i51 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_51_7.mem") port map (clk, input(51), act_0_51_7);
    i52 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_52_7.mem") port map (clk, input(52), act_0_52_7);
    i53 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_53_7.mem") port map (clk, input(53), act_0_53_7);
    i54 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_54_7.mem") port map (clk, input(54), act_0_54_7);
    i55 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_55_7.mem") port map (clk, input(55), act_0_55_7);
    i56 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_56_7.mem") port map (clk, input(56), act_0_56_7);
    i57 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_57_7.mem") port map (clk, input(57), act_0_57_7);
    i58 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_58_7.mem") port map (clk, input(58), act_0_58_7);
    i59 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_59_7.mem") port map (clk, input(59), act_0_59_7);
    i60 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_60_7.mem") port map (clk, input(60), act_0_60_7);
    i61 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_61_7.mem") port map (clk, input(61), act_0_61_7);
    i62 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_62_7.mem") port map (clk, input(62), act_0_62_7);
    i63 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_63_7.mem") port map (clk, input(63), act_0_63_7);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_7, SUM_WIDTH_0_7) + resize(act_0_1_7, SUM_WIDTH_0_7) + resize(act_0_2_7, SUM_WIDTH_0_7) + resize(act_0_3_7, SUM_WIDTH_0_7);
        s1_1 <= resize(act_0_4_7, SUM_WIDTH_0_7) + resize(act_0_5_7, SUM_WIDTH_0_7) + resize(act_0_6_7, SUM_WIDTH_0_7) + resize(act_0_7_7, SUM_WIDTH_0_7);
        s1_2 <= resize(act_0_8_7, SUM_WIDTH_0_7) + resize(act_0_9_7, SUM_WIDTH_0_7) + resize(act_0_10_7, SUM_WIDTH_0_7) + resize(act_0_11_7, SUM_WIDTH_0_7);
        s1_3 <= resize(act_0_12_7, SUM_WIDTH_0_7) + resize(act_0_13_7, SUM_WIDTH_0_7) + resize(act_0_14_7, SUM_WIDTH_0_7) + resize(act_0_15_7, SUM_WIDTH_0_7);
        s1_4 <= resize(act_0_16_7, SUM_WIDTH_0_7) + resize(act_0_17_7, SUM_WIDTH_0_7) + resize(act_0_18_7, SUM_WIDTH_0_7) + resize(act_0_19_7, SUM_WIDTH_0_7);
        s1_5 <= resize(act_0_20_7, SUM_WIDTH_0_7) + resize(act_0_21_7, SUM_WIDTH_0_7) + resize(act_0_22_7, SUM_WIDTH_0_7) + resize(act_0_23_7, SUM_WIDTH_0_7);
        s1_6 <= resize(act_0_24_7, SUM_WIDTH_0_7) + resize(act_0_25_7, SUM_WIDTH_0_7) + resize(act_0_26_7, SUM_WIDTH_0_7) + resize(act_0_27_7, SUM_WIDTH_0_7);
        s1_7 <= resize(act_0_28_7, SUM_WIDTH_0_7) + resize(act_0_29_7, SUM_WIDTH_0_7) + resize(act_0_30_7, SUM_WIDTH_0_7) + resize(act_0_31_7, SUM_WIDTH_0_7);
        s1_8 <= resize(act_0_32_7, SUM_WIDTH_0_7) + resize(act_0_33_7, SUM_WIDTH_0_7) + resize(act_0_34_7, SUM_WIDTH_0_7) + resize(act_0_35_7, SUM_WIDTH_0_7);
        s1_9 <= resize(act_0_36_7, SUM_WIDTH_0_7) + resize(act_0_37_7, SUM_WIDTH_0_7) + resize(act_0_38_7, SUM_WIDTH_0_7) + resize(act_0_39_7, SUM_WIDTH_0_7);
        s1_10 <= resize(act_0_40_7, SUM_WIDTH_0_7) + resize(act_0_41_7, SUM_WIDTH_0_7) + resize(act_0_42_7, SUM_WIDTH_0_7) + resize(act_0_43_7, SUM_WIDTH_0_7);
        s1_11 <= resize(act_0_44_7, SUM_WIDTH_0_7) + resize(act_0_45_7, SUM_WIDTH_0_7) + resize(act_0_46_7, SUM_WIDTH_0_7) + resize(act_0_47_7, SUM_WIDTH_0_7);
        s1_12 <= resize(act_0_48_7, SUM_WIDTH_0_7) + resize(act_0_49_7, SUM_WIDTH_0_7) + resize(act_0_50_7, SUM_WIDTH_0_7) + resize(act_0_51_7, SUM_WIDTH_0_7);
        s1_13 <= resize(act_0_52_7, SUM_WIDTH_0_7) + resize(act_0_53_7, SUM_WIDTH_0_7) + resize(act_0_54_7, SUM_WIDTH_0_7) + resize(act_0_55_7, SUM_WIDTH_0_7);
        s1_14 <= resize(act_0_56_7, SUM_WIDTH_0_7) + resize(act_0_57_7, SUM_WIDTH_0_7) + resize(act_0_58_7, SUM_WIDTH_0_7) + resize(act_0_59_7, SUM_WIDTH_0_7);
        s1_15 <= resize(act_0_60_7, SUM_WIDTH_0_7) + resize(act_0_61_7, SUM_WIDTH_0_7) + resize(act_0_62_7, SUM_WIDTH_0_7) + resize(act_0_63_7, SUM_WIDTH_0_7);
        -- Stage 2
        s2_0 <= s1_0 + s1_1 + s1_2 + s1_3;
        s2_1 <= s1_4 + s1_5 + s1_6 + s1_7;
        s2_2 <= s1_8 + s1_9 + s1_10 + s1_11;
        s2_3 <= s1_12 + s1_13 + s1_14 + s1_15;
        -- Stage 3
        sum_0_7 <= s2_0 + s2_1 + s2_2 + s2_3;
      end if;
    end process;
    out0_7 <= saturate(sum_0_7, 8);
  end block;

  -- LAYER 0, ch 8
  gen_l0c8 : block
  signal s1_0, s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7, s1_8, s1_9, s1_10, s1_11, s1_12, s1_13, s1_14, s1_15 : sum_t_0_8;
  signal s2_0, s2_1, s2_2, s2_3 : sum_t_0_8;
  signal sum_0_8 : sum_t_0_8;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_8.mem") port map (clk, input(0), act_0_0_8);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_8.mem") port map (clk, input(1), act_0_1_8);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_8.mem") port map (clk, input(2), act_0_2_8);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_8.mem") port map (clk, input(3), act_0_3_8);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_8.mem") port map (clk, input(4), act_0_4_8);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_8.mem") port map (clk, input(5), act_0_5_8);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_8.mem") port map (clk, input(6), act_0_6_8);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_8.mem") port map (clk, input(7), act_0_7_8);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_8.mem") port map (clk, input(8), act_0_8_8);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_8.mem") port map (clk, input(9), act_0_9_8);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_8.mem") port map (clk, input(10), act_0_10_8);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_8.mem") port map (clk, input(11), act_0_11_8);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_8.mem") port map (clk, input(12), act_0_12_8);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_8.mem") port map (clk, input(13), act_0_13_8);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_8.mem") port map (clk, input(14), act_0_14_8);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_8.mem") port map (clk, input(15), act_0_15_8);
    i16 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_16_8.mem") port map (clk, input(16), act_0_16_8);
    i17 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_17_8.mem") port map (clk, input(17), act_0_17_8);
    i18 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_18_8.mem") port map (clk, input(18), act_0_18_8);
    i19 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_19_8.mem") port map (clk, input(19), act_0_19_8);
    i20 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_20_8.mem") port map (clk, input(20), act_0_20_8);
    i21 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_21_8.mem") port map (clk, input(21), act_0_21_8);
    i22 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_22_8.mem") port map (clk, input(22), act_0_22_8);
    i23 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_23_8.mem") port map (clk, input(23), act_0_23_8);
    i24 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_24_8.mem") port map (clk, input(24), act_0_24_8);
    i25 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_25_8.mem") port map (clk, input(25), act_0_25_8);
    i26 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_26_8.mem") port map (clk, input(26), act_0_26_8);
    i27 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_27_8.mem") port map (clk, input(27), act_0_27_8);
    i28 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_28_8.mem") port map (clk, input(28), act_0_28_8);
    i29 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_29_8.mem") port map (clk, input(29), act_0_29_8);
    i30 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_30_8.mem") port map (clk, input(30), act_0_30_8);
    i31 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_31_8.mem") port map (clk, input(31), act_0_31_8);
    i32 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_32_8.mem") port map (clk, input(32), act_0_32_8);
    i33 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_33_8.mem") port map (clk, input(33), act_0_33_8);
    i34 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_34_8.mem") port map (clk, input(34), act_0_34_8);
    i35 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_35_8.mem") port map (clk, input(35), act_0_35_8);
    i36 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_36_8.mem") port map (clk, input(36), act_0_36_8);
    i37 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_37_8.mem") port map (clk, input(37), act_0_37_8);
    i38 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_38_8.mem") port map (clk, input(38), act_0_38_8);
    i39 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_39_8.mem") port map (clk, input(39), act_0_39_8);
    i40 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_40_8.mem") port map (clk, input(40), act_0_40_8);
    i41 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_41_8.mem") port map (clk, input(41), act_0_41_8);
    i42 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_42_8.mem") port map (clk, input(42), act_0_42_8);
    i43 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_43_8.mem") port map (clk, input(43), act_0_43_8);
    i44 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_44_8.mem") port map (clk, input(44), act_0_44_8);
    i45 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_45_8.mem") port map (clk, input(45), act_0_45_8);
    i46 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_46_8.mem") port map (clk, input(46), act_0_46_8);
    i47 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_47_8.mem") port map (clk, input(47), act_0_47_8);
    i48 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_48_8.mem") port map (clk, input(48), act_0_48_8);
    i49 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_49_8.mem") port map (clk, input(49), act_0_49_8);
    i50 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_50_8.mem") port map (clk, input(50), act_0_50_8);
    i51 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_51_8.mem") port map (clk, input(51), act_0_51_8);
    i52 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_52_8.mem") port map (clk, input(52), act_0_52_8);
    i53 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_53_8.mem") port map (clk, input(53), act_0_53_8);
    i54 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_54_8.mem") port map (clk, input(54), act_0_54_8);
    i55 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_55_8.mem") port map (clk, input(55), act_0_55_8);
    i56 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_56_8.mem") port map (clk, input(56), act_0_56_8);
    i57 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_57_8.mem") port map (clk, input(57), act_0_57_8);
    i58 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_58_8.mem") port map (clk, input(58), act_0_58_8);
    i59 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_59_8.mem") port map (clk, input(59), act_0_59_8);
    i60 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_60_8.mem") port map (clk, input(60), act_0_60_8);
    i61 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_61_8.mem") port map (clk, input(61), act_0_61_8);
    i62 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_62_8.mem") port map (clk, input(62), act_0_62_8);
    i63 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_63_8.mem") port map (clk, input(63), act_0_63_8);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_8, SUM_WIDTH_0_8) + resize(act_0_1_8, SUM_WIDTH_0_8) + resize(act_0_2_8, SUM_WIDTH_0_8) + resize(act_0_3_8, SUM_WIDTH_0_8);
        s1_1 <= resize(act_0_4_8, SUM_WIDTH_0_8) + resize(act_0_5_8, SUM_WIDTH_0_8) + resize(act_0_6_8, SUM_WIDTH_0_8) + resize(act_0_7_8, SUM_WIDTH_0_8);
        s1_2 <= resize(act_0_8_8, SUM_WIDTH_0_8) + resize(act_0_9_8, SUM_WIDTH_0_8) + resize(act_0_10_8, SUM_WIDTH_0_8) + resize(act_0_11_8, SUM_WIDTH_0_8);
        s1_3 <= resize(act_0_12_8, SUM_WIDTH_0_8) + resize(act_0_13_8, SUM_WIDTH_0_8) + resize(act_0_14_8, SUM_WIDTH_0_8) + resize(act_0_15_8, SUM_WIDTH_0_8);
        s1_4 <= resize(act_0_16_8, SUM_WIDTH_0_8) + resize(act_0_17_8, SUM_WIDTH_0_8) + resize(act_0_18_8, SUM_WIDTH_0_8) + resize(act_0_19_8, SUM_WIDTH_0_8);
        s1_5 <= resize(act_0_20_8, SUM_WIDTH_0_8) + resize(act_0_21_8, SUM_WIDTH_0_8) + resize(act_0_22_8, SUM_WIDTH_0_8) + resize(act_0_23_8, SUM_WIDTH_0_8);
        s1_6 <= resize(act_0_24_8, SUM_WIDTH_0_8) + resize(act_0_25_8, SUM_WIDTH_0_8) + resize(act_0_26_8, SUM_WIDTH_0_8) + resize(act_0_27_8, SUM_WIDTH_0_8);
        s1_7 <= resize(act_0_28_8, SUM_WIDTH_0_8) + resize(act_0_29_8, SUM_WIDTH_0_8) + resize(act_0_30_8, SUM_WIDTH_0_8) + resize(act_0_31_8, SUM_WIDTH_0_8);
        s1_8 <= resize(act_0_32_8, SUM_WIDTH_0_8) + resize(act_0_33_8, SUM_WIDTH_0_8) + resize(act_0_34_8, SUM_WIDTH_0_8) + resize(act_0_35_8, SUM_WIDTH_0_8);
        s1_9 <= resize(act_0_36_8, SUM_WIDTH_0_8) + resize(act_0_37_8, SUM_WIDTH_0_8) + resize(act_0_38_8, SUM_WIDTH_0_8) + resize(act_0_39_8, SUM_WIDTH_0_8);
        s1_10 <= resize(act_0_40_8, SUM_WIDTH_0_8) + resize(act_0_41_8, SUM_WIDTH_0_8) + resize(act_0_42_8, SUM_WIDTH_0_8) + resize(act_0_43_8, SUM_WIDTH_0_8);
        s1_11 <= resize(act_0_44_8, SUM_WIDTH_0_8) + resize(act_0_45_8, SUM_WIDTH_0_8) + resize(act_0_46_8, SUM_WIDTH_0_8) + resize(act_0_47_8, SUM_WIDTH_0_8);
        s1_12 <= resize(act_0_48_8, SUM_WIDTH_0_8) + resize(act_0_49_8, SUM_WIDTH_0_8) + resize(act_0_50_8, SUM_WIDTH_0_8) + resize(act_0_51_8, SUM_WIDTH_0_8);
        s1_13 <= resize(act_0_52_8, SUM_WIDTH_0_8) + resize(act_0_53_8, SUM_WIDTH_0_8) + resize(act_0_54_8, SUM_WIDTH_0_8) + resize(act_0_55_8, SUM_WIDTH_0_8);
        s1_14 <= resize(act_0_56_8, SUM_WIDTH_0_8) + resize(act_0_57_8, SUM_WIDTH_0_8) + resize(act_0_58_8, SUM_WIDTH_0_8) + resize(act_0_59_8, SUM_WIDTH_0_8);
        s1_15 <= resize(act_0_60_8, SUM_WIDTH_0_8) + resize(act_0_61_8, SUM_WIDTH_0_8) + resize(act_0_62_8, SUM_WIDTH_0_8) + resize(act_0_63_8, SUM_WIDTH_0_8);
        -- Stage 2
        s2_0 <= s1_0 + s1_1 + s1_2 + s1_3;
        s2_1 <= s1_4 + s1_5 + s1_6 + s1_7;
        s2_2 <= s1_8 + s1_9 + s1_10 + s1_11;
        s2_3 <= s1_12 + s1_13 + s1_14 + s1_15;
        -- Stage 3
        sum_0_8 <= s2_0 + s2_1 + s2_2 + s2_3;
      end if;
    end process;
    out0_8 <= saturate(sum_0_8, 8);
  end block;

  -- LAYER 0, ch 9
  gen_l0c9 : block
  signal s1_0, s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7, s1_8, s1_9, s1_10, s1_11, s1_12, s1_13, s1_14, s1_15 : sum_t_0_9;
  signal s2_0, s2_1, s2_2, s2_3 : sum_t_0_9;
  signal sum_0_9 : sum_t_0_9;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_9.mem") port map (clk, input(0), act_0_0_9);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_9.mem") port map (clk, input(1), act_0_1_9);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_9.mem") port map (clk, input(2), act_0_2_9);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_9.mem") port map (clk, input(3), act_0_3_9);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_9.mem") port map (clk, input(4), act_0_4_9);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_9.mem") port map (clk, input(5), act_0_5_9);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_9.mem") port map (clk, input(6), act_0_6_9);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_9.mem") port map (clk, input(7), act_0_7_9);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_9.mem") port map (clk, input(8), act_0_8_9);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_9.mem") port map (clk, input(9), act_0_9_9);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_9.mem") port map (clk, input(10), act_0_10_9);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_9.mem") port map (clk, input(11), act_0_11_9);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_9.mem") port map (clk, input(12), act_0_12_9);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_9.mem") port map (clk, input(13), act_0_13_9);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_9.mem") port map (clk, input(14), act_0_14_9);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_9.mem") port map (clk, input(15), act_0_15_9);
    i16 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_16_9.mem") port map (clk, input(16), act_0_16_9);
    i17 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_17_9.mem") port map (clk, input(17), act_0_17_9);
    i18 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_18_9.mem") port map (clk, input(18), act_0_18_9);
    i19 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_19_9.mem") port map (clk, input(19), act_0_19_9);
    i20 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_20_9.mem") port map (clk, input(20), act_0_20_9);
    i21 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_21_9.mem") port map (clk, input(21), act_0_21_9);
    i22 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_22_9.mem") port map (clk, input(22), act_0_22_9);
    i23 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_23_9.mem") port map (clk, input(23), act_0_23_9);
    i24 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_24_9.mem") port map (clk, input(24), act_0_24_9);
    i25 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_25_9.mem") port map (clk, input(25), act_0_25_9);
    i26 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_26_9.mem") port map (clk, input(26), act_0_26_9);
    i27 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_27_9.mem") port map (clk, input(27), act_0_27_9);
    i28 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_28_9.mem") port map (clk, input(28), act_0_28_9);
    i29 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_29_9.mem") port map (clk, input(29), act_0_29_9);
    i30 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_30_9.mem") port map (clk, input(30), act_0_30_9);
    i31 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_31_9.mem") port map (clk, input(31), act_0_31_9);
    i32 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_32_9.mem") port map (clk, input(32), act_0_32_9);
    i33 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_33_9.mem") port map (clk, input(33), act_0_33_9);
    i34 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_34_9.mem") port map (clk, input(34), act_0_34_9);
    i35 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_35_9.mem") port map (clk, input(35), act_0_35_9);
    i36 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_36_9.mem") port map (clk, input(36), act_0_36_9);
    i37 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_37_9.mem") port map (clk, input(37), act_0_37_9);
    i38 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_38_9.mem") port map (clk, input(38), act_0_38_9);
    i39 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_39_9.mem") port map (clk, input(39), act_0_39_9);
    i40 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_40_9.mem") port map (clk, input(40), act_0_40_9);
    i41 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_41_9.mem") port map (clk, input(41), act_0_41_9);
    i42 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_42_9.mem") port map (clk, input(42), act_0_42_9);
    i43 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_43_9.mem") port map (clk, input(43), act_0_43_9);
    i44 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_44_9.mem") port map (clk, input(44), act_0_44_9);
    i45 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_45_9.mem") port map (clk, input(45), act_0_45_9);
    i46 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_46_9.mem") port map (clk, input(46), act_0_46_9);
    i47 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_47_9.mem") port map (clk, input(47), act_0_47_9);
    i48 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_48_9.mem") port map (clk, input(48), act_0_48_9);
    i49 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_49_9.mem") port map (clk, input(49), act_0_49_9);
    i50 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_50_9.mem") port map (clk, input(50), act_0_50_9);
    i51 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_51_9.mem") port map (clk, input(51), act_0_51_9);
    i52 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_52_9.mem") port map (clk, input(52), act_0_52_9);
    i53 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_53_9.mem") port map (clk, input(53), act_0_53_9);
    i54 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_54_9.mem") port map (clk, input(54), act_0_54_9);
    i55 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_55_9.mem") port map (clk, input(55), act_0_55_9);
    i56 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_56_9.mem") port map (clk, input(56), act_0_56_9);
    i57 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_57_9.mem") port map (clk, input(57), act_0_57_9);
    i58 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_58_9.mem") port map (clk, input(58), act_0_58_9);
    i59 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_59_9.mem") port map (clk, input(59), act_0_59_9);
    i60 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_60_9.mem") port map (clk, input(60), act_0_60_9);
    i61 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_61_9.mem") port map (clk, input(61), act_0_61_9);
    i62 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_62_9.mem") port map (clk, input(62), act_0_62_9);
    i63 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_63_9.mem") port map (clk, input(63), act_0_63_9);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_9, SUM_WIDTH_0_9) + resize(act_0_1_9, SUM_WIDTH_0_9) + resize(act_0_2_9, SUM_WIDTH_0_9) + resize(act_0_3_9, SUM_WIDTH_0_9);
        s1_1 <= resize(act_0_4_9, SUM_WIDTH_0_9) + resize(act_0_5_9, SUM_WIDTH_0_9) + resize(act_0_6_9, SUM_WIDTH_0_9) + resize(act_0_7_9, SUM_WIDTH_0_9);
        s1_2 <= resize(act_0_8_9, SUM_WIDTH_0_9) + resize(act_0_9_9, SUM_WIDTH_0_9) + resize(act_0_10_9, SUM_WIDTH_0_9) + resize(act_0_11_9, SUM_WIDTH_0_9);
        s1_3 <= resize(act_0_12_9, SUM_WIDTH_0_9) + resize(act_0_13_9, SUM_WIDTH_0_9) + resize(act_0_14_9, SUM_WIDTH_0_9) + resize(act_0_15_9, SUM_WIDTH_0_9);
        s1_4 <= resize(act_0_16_9, SUM_WIDTH_0_9) + resize(act_0_17_9, SUM_WIDTH_0_9) + resize(act_0_18_9, SUM_WIDTH_0_9) + resize(act_0_19_9, SUM_WIDTH_0_9);
        s1_5 <= resize(act_0_20_9, SUM_WIDTH_0_9) + resize(act_0_21_9, SUM_WIDTH_0_9) + resize(act_0_22_9, SUM_WIDTH_0_9) + resize(act_0_23_9, SUM_WIDTH_0_9);
        s1_6 <= resize(act_0_24_9, SUM_WIDTH_0_9) + resize(act_0_25_9, SUM_WIDTH_0_9) + resize(act_0_26_9, SUM_WIDTH_0_9) + resize(act_0_27_9, SUM_WIDTH_0_9);
        s1_7 <= resize(act_0_28_9, SUM_WIDTH_0_9) + resize(act_0_29_9, SUM_WIDTH_0_9) + resize(act_0_30_9, SUM_WIDTH_0_9) + resize(act_0_31_9, SUM_WIDTH_0_9);
        s1_8 <= resize(act_0_32_9, SUM_WIDTH_0_9) + resize(act_0_33_9, SUM_WIDTH_0_9) + resize(act_0_34_9, SUM_WIDTH_0_9) + resize(act_0_35_9, SUM_WIDTH_0_9);
        s1_9 <= resize(act_0_36_9, SUM_WIDTH_0_9) + resize(act_0_37_9, SUM_WIDTH_0_9) + resize(act_0_38_9, SUM_WIDTH_0_9) + resize(act_0_39_9, SUM_WIDTH_0_9);
        s1_10 <= resize(act_0_40_9, SUM_WIDTH_0_9) + resize(act_0_41_9, SUM_WIDTH_0_9) + resize(act_0_42_9, SUM_WIDTH_0_9) + resize(act_0_43_9, SUM_WIDTH_0_9);
        s1_11 <= resize(act_0_44_9, SUM_WIDTH_0_9) + resize(act_0_45_9, SUM_WIDTH_0_9) + resize(act_0_46_9, SUM_WIDTH_0_9) + resize(act_0_47_9, SUM_WIDTH_0_9);
        s1_12 <= resize(act_0_48_9, SUM_WIDTH_0_9) + resize(act_0_49_9, SUM_WIDTH_0_9) + resize(act_0_50_9, SUM_WIDTH_0_9) + resize(act_0_51_9, SUM_WIDTH_0_9);
        s1_13 <= resize(act_0_52_9, SUM_WIDTH_0_9) + resize(act_0_53_9, SUM_WIDTH_0_9) + resize(act_0_54_9, SUM_WIDTH_0_9) + resize(act_0_55_9, SUM_WIDTH_0_9);
        s1_14 <= resize(act_0_56_9, SUM_WIDTH_0_9) + resize(act_0_57_9, SUM_WIDTH_0_9) + resize(act_0_58_9, SUM_WIDTH_0_9) + resize(act_0_59_9, SUM_WIDTH_0_9);
        s1_15 <= resize(act_0_60_9, SUM_WIDTH_0_9) + resize(act_0_61_9, SUM_WIDTH_0_9) + resize(act_0_62_9, SUM_WIDTH_0_9) + resize(act_0_63_9, SUM_WIDTH_0_9);
        -- Stage 2
        s2_0 <= s1_0 + s1_1 + s1_2 + s1_3;
        s2_1 <= s1_4 + s1_5 + s1_6 + s1_7;
        s2_2 <= s1_8 + s1_9 + s1_10 + s1_11;
        s2_3 <= s1_12 + s1_13 + s1_14 + s1_15;
        -- Stage 3
        sum_0_9 <= s2_0 + s2_1 + s2_2 + s2_3;
      end if;
    end process;
    out0_9 <= saturate(sum_0_9, 8);
  end block;

  -- LAYER 0, ch 10
  gen_l0c10 : block
  signal s1_0, s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7, s1_8, s1_9, s1_10, s1_11, s1_12, s1_13, s1_14, s1_15 : sum_t_0_10;
  signal s2_0, s2_1, s2_2, s2_3 : sum_t_0_10;
  signal sum_0_10 : sum_t_0_10;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_10.mem") port map (clk, input(0), act_0_0_10);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_10.mem") port map (clk, input(1), act_0_1_10);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_10.mem") port map (clk, input(2), act_0_2_10);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_10.mem") port map (clk, input(3), act_0_3_10);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_10.mem") port map (clk, input(4), act_0_4_10);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_10.mem") port map (clk, input(5), act_0_5_10);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_10.mem") port map (clk, input(6), act_0_6_10);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_10.mem") port map (clk, input(7), act_0_7_10);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_10.mem") port map (clk, input(8), act_0_8_10);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_10.mem") port map (clk, input(9), act_0_9_10);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_10.mem") port map (clk, input(10), act_0_10_10);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_10.mem") port map (clk, input(11), act_0_11_10);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_10.mem") port map (clk, input(12), act_0_12_10);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_10.mem") port map (clk, input(13), act_0_13_10);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_10.mem") port map (clk, input(14), act_0_14_10);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_10.mem") port map (clk, input(15), act_0_15_10);
    i16 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_16_10.mem") port map (clk, input(16), act_0_16_10);
    i17 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_17_10.mem") port map (clk, input(17), act_0_17_10);
    i18 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_18_10.mem") port map (clk, input(18), act_0_18_10);
    i19 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_19_10.mem") port map (clk, input(19), act_0_19_10);
    i20 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_20_10.mem") port map (clk, input(20), act_0_20_10);
    i21 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_21_10.mem") port map (clk, input(21), act_0_21_10);
    i22 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_22_10.mem") port map (clk, input(22), act_0_22_10);
    i23 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_23_10.mem") port map (clk, input(23), act_0_23_10);
    i24 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_24_10.mem") port map (clk, input(24), act_0_24_10);
    i25 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_25_10.mem") port map (clk, input(25), act_0_25_10);
    i26 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_26_10.mem") port map (clk, input(26), act_0_26_10);
    i27 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_27_10.mem") port map (clk, input(27), act_0_27_10);
    i28 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_28_10.mem") port map (clk, input(28), act_0_28_10);
    i29 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_29_10.mem") port map (clk, input(29), act_0_29_10);
    i30 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_30_10.mem") port map (clk, input(30), act_0_30_10);
    i31 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_31_10.mem") port map (clk, input(31), act_0_31_10);
    i32 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_32_10.mem") port map (clk, input(32), act_0_32_10);
    i33 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_33_10.mem") port map (clk, input(33), act_0_33_10);
    i34 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_34_10.mem") port map (clk, input(34), act_0_34_10);
    i35 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_35_10.mem") port map (clk, input(35), act_0_35_10);
    i36 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_36_10.mem") port map (clk, input(36), act_0_36_10);
    i37 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_37_10.mem") port map (clk, input(37), act_0_37_10);
    i38 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_38_10.mem") port map (clk, input(38), act_0_38_10);
    i39 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_39_10.mem") port map (clk, input(39), act_0_39_10);
    i40 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_40_10.mem") port map (clk, input(40), act_0_40_10);
    i41 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_41_10.mem") port map (clk, input(41), act_0_41_10);
    i42 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_42_10.mem") port map (clk, input(42), act_0_42_10);
    i43 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_43_10.mem") port map (clk, input(43), act_0_43_10);
    i44 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_44_10.mem") port map (clk, input(44), act_0_44_10);
    i45 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_45_10.mem") port map (clk, input(45), act_0_45_10);
    i46 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_46_10.mem") port map (clk, input(46), act_0_46_10);
    i47 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_47_10.mem") port map (clk, input(47), act_0_47_10);
    i48 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_48_10.mem") port map (clk, input(48), act_0_48_10);
    i49 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_49_10.mem") port map (clk, input(49), act_0_49_10);
    i50 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_50_10.mem") port map (clk, input(50), act_0_50_10);
    i51 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_51_10.mem") port map (clk, input(51), act_0_51_10);
    i52 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_52_10.mem") port map (clk, input(52), act_0_52_10);
    i53 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_53_10.mem") port map (clk, input(53), act_0_53_10);
    i54 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_54_10.mem") port map (clk, input(54), act_0_54_10);
    i55 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_55_10.mem") port map (clk, input(55), act_0_55_10);
    i56 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_56_10.mem") port map (clk, input(56), act_0_56_10);
    i57 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_57_10.mem") port map (clk, input(57), act_0_57_10);
    i58 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_58_10.mem") port map (clk, input(58), act_0_58_10);
    i59 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_59_10.mem") port map (clk, input(59), act_0_59_10);
    i60 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_60_10.mem") port map (clk, input(60), act_0_60_10);
    i61 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_61_10.mem") port map (clk, input(61), act_0_61_10);
    i62 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_62_10.mem") port map (clk, input(62), act_0_62_10);
    i63 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_63_10.mem") port map (clk, input(63), act_0_63_10);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_10, SUM_WIDTH_0_10) + resize(act_0_1_10, SUM_WIDTH_0_10) + resize(act_0_2_10, SUM_WIDTH_0_10) + resize(act_0_3_10, SUM_WIDTH_0_10);
        s1_1 <= resize(act_0_4_10, SUM_WIDTH_0_10) + resize(act_0_5_10, SUM_WIDTH_0_10) + resize(act_0_6_10, SUM_WIDTH_0_10) + resize(act_0_7_10, SUM_WIDTH_0_10);
        s1_2 <= resize(act_0_8_10, SUM_WIDTH_0_10) + resize(act_0_9_10, SUM_WIDTH_0_10) + resize(act_0_10_10, SUM_WIDTH_0_10) + resize(act_0_11_10, SUM_WIDTH_0_10);
        s1_3 <= resize(act_0_12_10, SUM_WIDTH_0_10) + resize(act_0_13_10, SUM_WIDTH_0_10) + resize(act_0_14_10, SUM_WIDTH_0_10) + resize(act_0_15_10, SUM_WIDTH_0_10);
        s1_4 <= resize(act_0_16_10, SUM_WIDTH_0_10) + resize(act_0_17_10, SUM_WIDTH_0_10) + resize(act_0_18_10, SUM_WIDTH_0_10) + resize(act_0_19_10, SUM_WIDTH_0_10);
        s1_5 <= resize(act_0_20_10, SUM_WIDTH_0_10) + resize(act_0_21_10, SUM_WIDTH_0_10) + resize(act_0_22_10, SUM_WIDTH_0_10) + resize(act_0_23_10, SUM_WIDTH_0_10);
        s1_6 <= resize(act_0_24_10, SUM_WIDTH_0_10) + resize(act_0_25_10, SUM_WIDTH_0_10) + resize(act_0_26_10, SUM_WIDTH_0_10) + resize(act_0_27_10, SUM_WIDTH_0_10);
        s1_7 <= resize(act_0_28_10, SUM_WIDTH_0_10) + resize(act_0_29_10, SUM_WIDTH_0_10) + resize(act_0_30_10, SUM_WIDTH_0_10) + resize(act_0_31_10, SUM_WIDTH_0_10);
        s1_8 <= resize(act_0_32_10, SUM_WIDTH_0_10) + resize(act_0_33_10, SUM_WIDTH_0_10) + resize(act_0_34_10, SUM_WIDTH_0_10) + resize(act_0_35_10, SUM_WIDTH_0_10);
        s1_9 <= resize(act_0_36_10, SUM_WIDTH_0_10) + resize(act_0_37_10, SUM_WIDTH_0_10) + resize(act_0_38_10, SUM_WIDTH_0_10) + resize(act_0_39_10, SUM_WIDTH_0_10);
        s1_10 <= resize(act_0_40_10, SUM_WIDTH_0_10) + resize(act_0_41_10, SUM_WIDTH_0_10) + resize(act_0_42_10, SUM_WIDTH_0_10) + resize(act_0_43_10, SUM_WIDTH_0_10);
        s1_11 <= resize(act_0_44_10, SUM_WIDTH_0_10) + resize(act_0_45_10, SUM_WIDTH_0_10) + resize(act_0_46_10, SUM_WIDTH_0_10) + resize(act_0_47_10, SUM_WIDTH_0_10);
        s1_12 <= resize(act_0_48_10, SUM_WIDTH_0_10) + resize(act_0_49_10, SUM_WIDTH_0_10) + resize(act_0_50_10, SUM_WIDTH_0_10) + resize(act_0_51_10, SUM_WIDTH_0_10);
        s1_13 <= resize(act_0_52_10, SUM_WIDTH_0_10) + resize(act_0_53_10, SUM_WIDTH_0_10) + resize(act_0_54_10, SUM_WIDTH_0_10) + resize(act_0_55_10, SUM_WIDTH_0_10);
        s1_14 <= resize(act_0_56_10, SUM_WIDTH_0_10) + resize(act_0_57_10, SUM_WIDTH_0_10) + resize(act_0_58_10, SUM_WIDTH_0_10) + resize(act_0_59_10, SUM_WIDTH_0_10);
        s1_15 <= resize(act_0_60_10, SUM_WIDTH_0_10) + resize(act_0_61_10, SUM_WIDTH_0_10) + resize(act_0_62_10, SUM_WIDTH_0_10) + resize(act_0_63_10, SUM_WIDTH_0_10);
        -- Stage 2
        s2_0 <= s1_0 + s1_1 + s1_2 + s1_3;
        s2_1 <= s1_4 + s1_5 + s1_6 + s1_7;
        s2_2 <= s1_8 + s1_9 + s1_10 + s1_11;
        s2_3 <= s1_12 + s1_13 + s1_14 + s1_15;
        -- Stage 3
        sum_0_10 <= s2_0 + s2_1 + s2_2 + s2_3;
      end if;
    end process;
    out0_10 <= saturate(sum_0_10, 8);
  end block;

  -- LAYER 0, ch 11
  gen_l0c11 : block
  signal s1_0, s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7, s1_8, s1_9, s1_10, s1_11, s1_12, s1_13, s1_14, s1_15 : sum_t_0_11;
  signal s2_0, s2_1, s2_2, s2_3 : sum_t_0_11;
  signal sum_0_11 : sum_t_0_11;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_11.mem") port map (clk, input(0), act_0_0_11);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_11.mem") port map (clk, input(1), act_0_1_11);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_11.mem") port map (clk, input(2), act_0_2_11);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_11.mem") port map (clk, input(3), act_0_3_11);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_11.mem") port map (clk, input(4), act_0_4_11);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_11.mem") port map (clk, input(5), act_0_5_11);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_11.mem") port map (clk, input(6), act_0_6_11);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_11.mem") port map (clk, input(7), act_0_7_11);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_11.mem") port map (clk, input(8), act_0_8_11);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_11.mem") port map (clk, input(9), act_0_9_11);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_11.mem") port map (clk, input(10), act_0_10_11);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_11.mem") port map (clk, input(11), act_0_11_11);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_11.mem") port map (clk, input(12), act_0_12_11);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_11.mem") port map (clk, input(13), act_0_13_11);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_11.mem") port map (clk, input(14), act_0_14_11);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_11.mem") port map (clk, input(15), act_0_15_11);
    i16 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_16_11.mem") port map (clk, input(16), act_0_16_11);
    i17 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_17_11.mem") port map (clk, input(17), act_0_17_11);
    i18 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_18_11.mem") port map (clk, input(18), act_0_18_11);
    i19 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_19_11.mem") port map (clk, input(19), act_0_19_11);
    i20 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_20_11.mem") port map (clk, input(20), act_0_20_11);
    i21 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_21_11.mem") port map (clk, input(21), act_0_21_11);
    i22 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_22_11.mem") port map (clk, input(22), act_0_22_11);
    i23 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_23_11.mem") port map (clk, input(23), act_0_23_11);
    i24 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_24_11.mem") port map (clk, input(24), act_0_24_11);
    i25 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_25_11.mem") port map (clk, input(25), act_0_25_11);
    i26 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_26_11.mem") port map (clk, input(26), act_0_26_11);
    i27 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_27_11.mem") port map (clk, input(27), act_0_27_11);
    i28 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_28_11.mem") port map (clk, input(28), act_0_28_11);
    i29 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_29_11.mem") port map (clk, input(29), act_0_29_11);
    i30 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_30_11.mem") port map (clk, input(30), act_0_30_11);
    i31 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_31_11.mem") port map (clk, input(31), act_0_31_11);
    i32 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_32_11.mem") port map (clk, input(32), act_0_32_11);
    i33 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_33_11.mem") port map (clk, input(33), act_0_33_11);
    i34 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_34_11.mem") port map (clk, input(34), act_0_34_11);
    i35 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_35_11.mem") port map (clk, input(35), act_0_35_11);
    i36 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_36_11.mem") port map (clk, input(36), act_0_36_11);
    i37 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_37_11.mem") port map (clk, input(37), act_0_37_11);
    i38 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_38_11.mem") port map (clk, input(38), act_0_38_11);
    i39 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_39_11.mem") port map (clk, input(39), act_0_39_11);
    i40 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_40_11.mem") port map (clk, input(40), act_0_40_11);
    i41 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_41_11.mem") port map (clk, input(41), act_0_41_11);
    i42 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_42_11.mem") port map (clk, input(42), act_0_42_11);
    i43 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_43_11.mem") port map (clk, input(43), act_0_43_11);
    i44 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_44_11.mem") port map (clk, input(44), act_0_44_11);
    i45 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_45_11.mem") port map (clk, input(45), act_0_45_11);
    i46 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_46_11.mem") port map (clk, input(46), act_0_46_11);
    i47 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_47_11.mem") port map (clk, input(47), act_0_47_11);
    i48 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_48_11.mem") port map (clk, input(48), act_0_48_11);
    i49 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_49_11.mem") port map (clk, input(49), act_0_49_11);
    i50 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_50_11.mem") port map (clk, input(50), act_0_50_11);
    i51 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_51_11.mem") port map (clk, input(51), act_0_51_11);
    i52 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_52_11.mem") port map (clk, input(52), act_0_52_11);
    i53 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_53_11.mem") port map (clk, input(53), act_0_53_11);
    i54 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_54_11.mem") port map (clk, input(54), act_0_54_11);
    i55 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_55_11.mem") port map (clk, input(55), act_0_55_11);
    i56 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_56_11.mem") port map (clk, input(56), act_0_56_11);
    i57 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_57_11.mem") port map (clk, input(57), act_0_57_11);
    i58 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_58_11.mem") port map (clk, input(58), act_0_58_11);
    i59 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_59_11.mem") port map (clk, input(59), act_0_59_11);
    i60 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_60_11.mem") port map (clk, input(60), act_0_60_11);
    i61 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_61_11.mem") port map (clk, input(61), act_0_61_11);
    i62 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_62_11.mem") port map (clk, input(62), act_0_62_11);
    i63 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_63_11.mem") port map (clk, input(63), act_0_63_11);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_11, SUM_WIDTH_0_11) + resize(act_0_1_11, SUM_WIDTH_0_11) + resize(act_0_2_11, SUM_WIDTH_0_11) + resize(act_0_3_11, SUM_WIDTH_0_11);
        s1_1 <= resize(act_0_4_11, SUM_WIDTH_0_11) + resize(act_0_5_11, SUM_WIDTH_0_11) + resize(act_0_6_11, SUM_WIDTH_0_11) + resize(act_0_7_11, SUM_WIDTH_0_11);
        s1_2 <= resize(act_0_8_11, SUM_WIDTH_0_11) + resize(act_0_9_11, SUM_WIDTH_0_11) + resize(act_0_10_11, SUM_WIDTH_0_11) + resize(act_0_11_11, SUM_WIDTH_0_11);
        s1_3 <= resize(act_0_12_11, SUM_WIDTH_0_11) + resize(act_0_13_11, SUM_WIDTH_0_11) + resize(act_0_14_11, SUM_WIDTH_0_11) + resize(act_0_15_11, SUM_WIDTH_0_11);
        s1_4 <= resize(act_0_16_11, SUM_WIDTH_0_11) + resize(act_0_17_11, SUM_WIDTH_0_11) + resize(act_0_18_11, SUM_WIDTH_0_11) + resize(act_0_19_11, SUM_WIDTH_0_11);
        s1_5 <= resize(act_0_20_11, SUM_WIDTH_0_11) + resize(act_0_21_11, SUM_WIDTH_0_11) + resize(act_0_22_11, SUM_WIDTH_0_11) + resize(act_0_23_11, SUM_WIDTH_0_11);
        s1_6 <= resize(act_0_24_11, SUM_WIDTH_0_11) + resize(act_0_25_11, SUM_WIDTH_0_11) + resize(act_0_26_11, SUM_WIDTH_0_11) + resize(act_0_27_11, SUM_WIDTH_0_11);
        s1_7 <= resize(act_0_28_11, SUM_WIDTH_0_11) + resize(act_0_29_11, SUM_WIDTH_0_11) + resize(act_0_30_11, SUM_WIDTH_0_11) + resize(act_0_31_11, SUM_WIDTH_0_11);
        s1_8 <= resize(act_0_32_11, SUM_WIDTH_0_11) + resize(act_0_33_11, SUM_WIDTH_0_11) + resize(act_0_34_11, SUM_WIDTH_0_11) + resize(act_0_35_11, SUM_WIDTH_0_11);
        s1_9 <= resize(act_0_36_11, SUM_WIDTH_0_11) + resize(act_0_37_11, SUM_WIDTH_0_11) + resize(act_0_38_11, SUM_WIDTH_0_11) + resize(act_0_39_11, SUM_WIDTH_0_11);
        s1_10 <= resize(act_0_40_11, SUM_WIDTH_0_11) + resize(act_0_41_11, SUM_WIDTH_0_11) + resize(act_0_42_11, SUM_WIDTH_0_11) + resize(act_0_43_11, SUM_WIDTH_0_11);
        s1_11 <= resize(act_0_44_11, SUM_WIDTH_0_11) + resize(act_0_45_11, SUM_WIDTH_0_11) + resize(act_0_46_11, SUM_WIDTH_0_11) + resize(act_0_47_11, SUM_WIDTH_0_11);
        s1_12 <= resize(act_0_48_11, SUM_WIDTH_0_11) + resize(act_0_49_11, SUM_WIDTH_0_11) + resize(act_0_50_11, SUM_WIDTH_0_11) + resize(act_0_51_11, SUM_WIDTH_0_11);
        s1_13 <= resize(act_0_52_11, SUM_WIDTH_0_11) + resize(act_0_53_11, SUM_WIDTH_0_11) + resize(act_0_54_11, SUM_WIDTH_0_11) + resize(act_0_55_11, SUM_WIDTH_0_11);
        s1_14 <= resize(act_0_56_11, SUM_WIDTH_0_11) + resize(act_0_57_11, SUM_WIDTH_0_11) + resize(act_0_58_11, SUM_WIDTH_0_11) + resize(act_0_59_11, SUM_WIDTH_0_11);
        s1_15 <= resize(act_0_60_11, SUM_WIDTH_0_11) + resize(act_0_61_11, SUM_WIDTH_0_11) + resize(act_0_62_11, SUM_WIDTH_0_11) + resize(act_0_63_11, SUM_WIDTH_0_11);
        -- Stage 2
        s2_0 <= s1_0 + s1_1 + s1_2 + s1_3;
        s2_1 <= s1_4 + s1_5 + s1_6 + s1_7;
        s2_2 <= s1_8 + s1_9 + s1_10 + s1_11;
        s2_3 <= s1_12 + s1_13 + s1_14 + s1_15;
        -- Stage 3
        sum_0_11 <= s2_0 + s2_1 + s2_2 + s2_3;
      end if;
    end process;
    out0_11 <= saturate(sum_0_11, 8);
  end block;

  -- LAYER 0, ch 12
  gen_l0c12 : block
  signal s1_0, s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7, s1_8, s1_9, s1_10, s1_11, s1_12, s1_13, s1_14, s1_15 : sum_t_0_12;
  signal s2_0, s2_1, s2_2, s2_3 : sum_t_0_12;
  signal sum_0_12 : sum_t_0_12;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_12.mem") port map (clk, input(0), act_0_0_12);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_12.mem") port map (clk, input(1), act_0_1_12);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_12.mem") port map (clk, input(2), act_0_2_12);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_12.mem") port map (clk, input(3), act_0_3_12);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_12.mem") port map (clk, input(4), act_0_4_12);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_12.mem") port map (clk, input(5), act_0_5_12);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_12.mem") port map (clk, input(6), act_0_6_12);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_12.mem") port map (clk, input(7), act_0_7_12);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_12.mem") port map (clk, input(8), act_0_8_12);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_12.mem") port map (clk, input(9), act_0_9_12);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_12.mem") port map (clk, input(10), act_0_10_12);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_12.mem") port map (clk, input(11), act_0_11_12);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_12.mem") port map (clk, input(12), act_0_12_12);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_12.mem") port map (clk, input(13), act_0_13_12);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_12.mem") port map (clk, input(14), act_0_14_12);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_12.mem") port map (clk, input(15), act_0_15_12);
    i16 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_16_12.mem") port map (clk, input(16), act_0_16_12);
    i17 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_17_12.mem") port map (clk, input(17), act_0_17_12);
    i18 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_18_12.mem") port map (clk, input(18), act_0_18_12);
    i19 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_19_12.mem") port map (clk, input(19), act_0_19_12);
    i20 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_20_12.mem") port map (clk, input(20), act_0_20_12);
    i21 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_21_12.mem") port map (clk, input(21), act_0_21_12);
    i22 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_22_12.mem") port map (clk, input(22), act_0_22_12);
    i23 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_23_12.mem") port map (clk, input(23), act_0_23_12);
    i24 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_24_12.mem") port map (clk, input(24), act_0_24_12);
    i25 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_25_12.mem") port map (clk, input(25), act_0_25_12);
    i26 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_26_12.mem") port map (clk, input(26), act_0_26_12);
    i27 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_27_12.mem") port map (clk, input(27), act_0_27_12);
    i28 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_28_12.mem") port map (clk, input(28), act_0_28_12);
    i29 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_29_12.mem") port map (clk, input(29), act_0_29_12);
    i30 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_30_12.mem") port map (clk, input(30), act_0_30_12);
    i31 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_31_12.mem") port map (clk, input(31), act_0_31_12);
    i32 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_32_12.mem") port map (clk, input(32), act_0_32_12);
    i33 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_33_12.mem") port map (clk, input(33), act_0_33_12);
    i34 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_34_12.mem") port map (clk, input(34), act_0_34_12);
    i35 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_35_12.mem") port map (clk, input(35), act_0_35_12);
    i36 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_36_12.mem") port map (clk, input(36), act_0_36_12);
    i37 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_37_12.mem") port map (clk, input(37), act_0_37_12);
    i38 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_38_12.mem") port map (clk, input(38), act_0_38_12);
    i39 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_39_12.mem") port map (clk, input(39), act_0_39_12);
    i40 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_40_12.mem") port map (clk, input(40), act_0_40_12);
    i41 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_41_12.mem") port map (clk, input(41), act_0_41_12);
    i42 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_42_12.mem") port map (clk, input(42), act_0_42_12);
    i43 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_43_12.mem") port map (clk, input(43), act_0_43_12);
    i44 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_44_12.mem") port map (clk, input(44), act_0_44_12);
    i45 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_45_12.mem") port map (clk, input(45), act_0_45_12);
    i46 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_46_12.mem") port map (clk, input(46), act_0_46_12);
    i47 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_47_12.mem") port map (clk, input(47), act_0_47_12);
    i48 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_48_12.mem") port map (clk, input(48), act_0_48_12);
    i49 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_49_12.mem") port map (clk, input(49), act_0_49_12);
    i50 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_50_12.mem") port map (clk, input(50), act_0_50_12);
    i51 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_51_12.mem") port map (clk, input(51), act_0_51_12);
    i52 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_52_12.mem") port map (clk, input(52), act_0_52_12);
    i53 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_53_12.mem") port map (clk, input(53), act_0_53_12);
    i54 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_54_12.mem") port map (clk, input(54), act_0_54_12);
    i55 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_55_12.mem") port map (clk, input(55), act_0_55_12);
    i56 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_56_12.mem") port map (clk, input(56), act_0_56_12);
    i57 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_57_12.mem") port map (clk, input(57), act_0_57_12);
    i58 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_58_12.mem") port map (clk, input(58), act_0_58_12);
    i59 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_59_12.mem") port map (clk, input(59), act_0_59_12);
    i60 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_60_12.mem") port map (clk, input(60), act_0_60_12);
    i61 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_61_12.mem") port map (clk, input(61), act_0_61_12);
    i62 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_62_12.mem") port map (clk, input(62), act_0_62_12);
    i63 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_63_12.mem") port map (clk, input(63), act_0_63_12);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_12, SUM_WIDTH_0_12) + resize(act_0_1_12, SUM_WIDTH_0_12) + resize(act_0_2_12, SUM_WIDTH_0_12) + resize(act_0_3_12, SUM_WIDTH_0_12);
        s1_1 <= resize(act_0_4_12, SUM_WIDTH_0_12) + resize(act_0_5_12, SUM_WIDTH_0_12) + resize(act_0_6_12, SUM_WIDTH_0_12) + resize(act_0_7_12, SUM_WIDTH_0_12);
        s1_2 <= resize(act_0_8_12, SUM_WIDTH_0_12) + resize(act_0_9_12, SUM_WIDTH_0_12) + resize(act_0_10_12, SUM_WIDTH_0_12) + resize(act_0_11_12, SUM_WIDTH_0_12);
        s1_3 <= resize(act_0_12_12, SUM_WIDTH_0_12) + resize(act_0_13_12, SUM_WIDTH_0_12) + resize(act_0_14_12, SUM_WIDTH_0_12) + resize(act_0_15_12, SUM_WIDTH_0_12);
        s1_4 <= resize(act_0_16_12, SUM_WIDTH_0_12) + resize(act_0_17_12, SUM_WIDTH_0_12) + resize(act_0_18_12, SUM_WIDTH_0_12) + resize(act_0_19_12, SUM_WIDTH_0_12);
        s1_5 <= resize(act_0_20_12, SUM_WIDTH_0_12) + resize(act_0_21_12, SUM_WIDTH_0_12) + resize(act_0_22_12, SUM_WIDTH_0_12) + resize(act_0_23_12, SUM_WIDTH_0_12);
        s1_6 <= resize(act_0_24_12, SUM_WIDTH_0_12) + resize(act_0_25_12, SUM_WIDTH_0_12) + resize(act_0_26_12, SUM_WIDTH_0_12) + resize(act_0_27_12, SUM_WIDTH_0_12);
        s1_7 <= resize(act_0_28_12, SUM_WIDTH_0_12) + resize(act_0_29_12, SUM_WIDTH_0_12) + resize(act_0_30_12, SUM_WIDTH_0_12) + resize(act_0_31_12, SUM_WIDTH_0_12);
        s1_8 <= resize(act_0_32_12, SUM_WIDTH_0_12) + resize(act_0_33_12, SUM_WIDTH_0_12) + resize(act_0_34_12, SUM_WIDTH_0_12) + resize(act_0_35_12, SUM_WIDTH_0_12);
        s1_9 <= resize(act_0_36_12, SUM_WIDTH_0_12) + resize(act_0_37_12, SUM_WIDTH_0_12) + resize(act_0_38_12, SUM_WIDTH_0_12) + resize(act_0_39_12, SUM_WIDTH_0_12);
        s1_10 <= resize(act_0_40_12, SUM_WIDTH_0_12) + resize(act_0_41_12, SUM_WIDTH_0_12) + resize(act_0_42_12, SUM_WIDTH_0_12) + resize(act_0_43_12, SUM_WIDTH_0_12);
        s1_11 <= resize(act_0_44_12, SUM_WIDTH_0_12) + resize(act_0_45_12, SUM_WIDTH_0_12) + resize(act_0_46_12, SUM_WIDTH_0_12) + resize(act_0_47_12, SUM_WIDTH_0_12);
        s1_12 <= resize(act_0_48_12, SUM_WIDTH_0_12) + resize(act_0_49_12, SUM_WIDTH_0_12) + resize(act_0_50_12, SUM_WIDTH_0_12) + resize(act_0_51_12, SUM_WIDTH_0_12);
        s1_13 <= resize(act_0_52_12, SUM_WIDTH_0_12) + resize(act_0_53_12, SUM_WIDTH_0_12) + resize(act_0_54_12, SUM_WIDTH_0_12) + resize(act_0_55_12, SUM_WIDTH_0_12);
        s1_14 <= resize(act_0_56_12, SUM_WIDTH_0_12) + resize(act_0_57_12, SUM_WIDTH_0_12) + resize(act_0_58_12, SUM_WIDTH_0_12) + resize(act_0_59_12, SUM_WIDTH_0_12);
        s1_15 <= resize(act_0_60_12, SUM_WIDTH_0_12) + resize(act_0_61_12, SUM_WIDTH_0_12) + resize(act_0_62_12, SUM_WIDTH_0_12) + resize(act_0_63_12, SUM_WIDTH_0_12);
        -- Stage 2
        s2_0 <= s1_0 + s1_1 + s1_2 + s1_3;
        s2_1 <= s1_4 + s1_5 + s1_6 + s1_7;
        s2_2 <= s1_8 + s1_9 + s1_10 + s1_11;
        s2_3 <= s1_12 + s1_13 + s1_14 + s1_15;
        -- Stage 3
        sum_0_12 <= s2_0 + s2_1 + s2_2 + s2_3;
      end if;
    end process;
    out0_12 <= saturate(sum_0_12, 8);
  end block;

  -- LAYER 0, ch 13
  gen_l0c13 : block
  signal s1_0, s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7, s1_8, s1_9, s1_10, s1_11, s1_12, s1_13, s1_14, s1_15 : sum_t_0_13;
  signal s2_0, s2_1, s2_2, s2_3 : sum_t_0_13;
  signal sum_0_13 : sum_t_0_13;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_13.mem") port map (clk, input(0), act_0_0_13);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_13.mem") port map (clk, input(1), act_0_1_13);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_13.mem") port map (clk, input(2), act_0_2_13);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_13.mem") port map (clk, input(3), act_0_3_13);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_13.mem") port map (clk, input(4), act_0_4_13);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_13.mem") port map (clk, input(5), act_0_5_13);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_13.mem") port map (clk, input(6), act_0_6_13);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_13.mem") port map (clk, input(7), act_0_7_13);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_13.mem") port map (clk, input(8), act_0_8_13);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_13.mem") port map (clk, input(9), act_0_9_13);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_13.mem") port map (clk, input(10), act_0_10_13);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_13.mem") port map (clk, input(11), act_0_11_13);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_13.mem") port map (clk, input(12), act_0_12_13);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_13.mem") port map (clk, input(13), act_0_13_13);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_13.mem") port map (clk, input(14), act_0_14_13);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_13.mem") port map (clk, input(15), act_0_15_13);
    i16 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_16_13.mem") port map (clk, input(16), act_0_16_13);
    i17 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_17_13.mem") port map (clk, input(17), act_0_17_13);
    i18 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_18_13.mem") port map (clk, input(18), act_0_18_13);
    i19 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_19_13.mem") port map (clk, input(19), act_0_19_13);
    i20 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_20_13.mem") port map (clk, input(20), act_0_20_13);
    i21 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_21_13.mem") port map (clk, input(21), act_0_21_13);
    i22 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_22_13.mem") port map (clk, input(22), act_0_22_13);
    i23 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_23_13.mem") port map (clk, input(23), act_0_23_13);
    i24 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_24_13.mem") port map (clk, input(24), act_0_24_13);
    i25 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_25_13.mem") port map (clk, input(25), act_0_25_13);
    i26 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_26_13.mem") port map (clk, input(26), act_0_26_13);
    i27 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_27_13.mem") port map (clk, input(27), act_0_27_13);
    i28 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_28_13.mem") port map (clk, input(28), act_0_28_13);
    i29 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_29_13.mem") port map (clk, input(29), act_0_29_13);
    i30 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_30_13.mem") port map (clk, input(30), act_0_30_13);
    i31 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_31_13.mem") port map (clk, input(31), act_0_31_13);
    i32 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_32_13.mem") port map (clk, input(32), act_0_32_13);
    i33 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_33_13.mem") port map (clk, input(33), act_0_33_13);
    i34 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_34_13.mem") port map (clk, input(34), act_0_34_13);
    i35 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_35_13.mem") port map (clk, input(35), act_0_35_13);
    i36 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_36_13.mem") port map (clk, input(36), act_0_36_13);
    i37 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_37_13.mem") port map (clk, input(37), act_0_37_13);
    i38 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_38_13.mem") port map (clk, input(38), act_0_38_13);
    i39 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_39_13.mem") port map (clk, input(39), act_0_39_13);
    i40 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_40_13.mem") port map (clk, input(40), act_0_40_13);
    i41 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_41_13.mem") port map (clk, input(41), act_0_41_13);
    i42 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_42_13.mem") port map (clk, input(42), act_0_42_13);
    i43 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_43_13.mem") port map (clk, input(43), act_0_43_13);
    i44 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_44_13.mem") port map (clk, input(44), act_0_44_13);
    i45 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_45_13.mem") port map (clk, input(45), act_0_45_13);
    i46 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_46_13.mem") port map (clk, input(46), act_0_46_13);
    i47 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_47_13.mem") port map (clk, input(47), act_0_47_13);
    i48 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_48_13.mem") port map (clk, input(48), act_0_48_13);
    i49 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_49_13.mem") port map (clk, input(49), act_0_49_13);
    i50 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_50_13.mem") port map (clk, input(50), act_0_50_13);
    i51 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_51_13.mem") port map (clk, input(51), act_0_51_13);
    i52 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_52_13.mem") port map (clk, input(52), act_0_52_13);
    i53 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_53_13.mem") port map (clk, input(53), act_0_53_13);
    i54 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_54_13.mem") port map (clk, input(54), act_0_54_13);
    i55 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_55_13.mem") port map (clk, input(55), act_0_55_13);
    i56 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_56_13.mem") port map (clk, input(56), act_0_56_13);
    i57 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_57_13.mem") port map (clk, input(57), act_0_57_13);
    i58 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_58_13.mem") port map (clk, input(58), act_0_58_13);
    i59 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_59_13.mem") port map (clk, input(59), act_0_59_13);
    i60 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_60_13.mem") port map (clk, input(60), act_0_60_13);
    i61 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_61_13.mem") port map (clk, input(61), act_0_61_13);
    i62 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_62_13.mem") port map (clk, input(62), act_0_62_13);
    i63 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_63_13.mem") port map (clk, input(63), act_0_63_13);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_13, SUM_WIDTH_0_13) + resize(act_0_1_13, SUM_WIDTH_0_13) + resize(act_0_2_13, SUM_WIDTH_0_13) + resize(act_0_3_13, SUM_WIDTH_0_13);
        s1_1 <= resize(act_0_4_13, SUM_WIDTH_0_13) + resize(act_0_5_13, SUM_WIDTH_0_13) + resize(act_0_6_13, SUM_WIDTH_0_13) + resize(act_0_7_13, SUM_WIDTH_0_13);
        s1_2 <= resize(act_0_8_13, SUM_WIDTH_0_13) + resize(act_0_9_13, SUM_WIDTH_0_13) + resize(act_0_10_13, SUM_WIDTH_0_13) + resize(act_0_11_13, SUM_WIDTH_0_13);
        s1_3 <= resize(act_0_12_13, SUM_WIDTH_0_13) + resize(act_0_13_13, SUM_WIDTH_0_13) + resize(act_0_14_13, SUM_WIDTH_0_13) + resize(act_0_15_13, SUM_WIDTH_0_13);
        s1_4 <= resize(act_0_16_13, SUM_WIDTH_0_13) + resize(act_0_17_13, SUM_WIDTH_0_13) + resize(act_0_18_13, SUM_WIDTH_0_13) + resize(act_0_19_13, SUM_WIDTH_0_13);
        s1_5 <= resize(act_0_20_13, SUM_WIDTH_0_13) + resize(act_0_21_13, SUM_WIDTH_0_13) + resize(act_0_22_13, SUM_WIDTH_0_13) + resize(act_0_23_13, SUM_WIDTH_0_13);
        s1_6 <= resize(act_0_24_13, SUM_WIDTH_0_13) + resize(act_0_25_13, SUM_WIDTH_0_13) + resize(act_0_26_13, SUM_WIDTH_0_13) + resize(act_0_27_13, SUM_WIDTH_0_13);
        s1_7 <= resize(act_0_28_13, SUM_WIDTH_0_13) + resize(act_0_29_13, SUM_WIDTH_0_13) + resize(act_0_30_13, SUM_WIDTH_0_13) + resize(act_0_31_13, SUM_WIDTH_0_13);
        s1_8 <= resize(act_0_32_13, SUM_WIDTH_0_13) + resize(act_0_33_13, SUM_WIDTH_0_13) + resize(act_0_34_13, SUM_WIDTH_0_13) + resize(act_0_35_13, SUM_WIDTH_0_13);
        s1_9 <= resize(act_0_36_13, SUM_WIDTH_0_13) + resize(act_0_37_13, SUM_WIDTH_0_13) + resize(act_0_38_13, SUM_WIDTH_0_13) + resize(act_0_39_13, SUM_WIDTH_0_13);
        s1_10 <= resize(act_0_40_13, SUM_WIDTH_0_13) + resize(act_0_41_13, SUM_WIDTH_0_13) + resize(act_0_42_13, SUM_WIDTH_0_13) + resize(act_0_43_13, SUM_WIDTH_0_13);
        s1_11 <= resize(act_0_44_13, SUM_WIDTH_0_13) + resize(act_0_45_13, SUM_WIDTH_0_13) + resize(act_0_46_13, SUM_WIDTH_0_13) + resize(act_0_47_13, SUM_WIDTH_0_13);
        s1_12 <= resize(act_0_48_13, SUM_WIDTH_0_13) + resize(act_0_49_13, SUM_WIDTH_0_13) + resize(act_0_50_13, SUM_WIDTH_0_13) + resize(act_0_51_13, SUM_WIDTH_0_13);
        s1_13 <= resize(act_0_52_13, SUM_WIDTH_0_13) + resize(act_0_53_13, SUM_WIDTH_0_13) + resize(act_0_54_13, SUM_WIDTH_0_13) + resize(act_0_55_13, SUM_WIDTH_0_13);
        s1_14 <= resize(act_0_56_13, SUM_WIDTH_0_13) + resize(act_0_57_13, SUM_WIDTH_0_13) + resize(act_0_58_13, SUM_WIDTH_0_13) + resize(act_0_59_13, SUM_WIDTH_0_13);
        s1_15 <= resize(act_0_60_13, SUM_WIDTH_0_13) + resize(act_0_61_13, SUM_WIDTH_0_13) + resize(act_0_62_13, SUM_WIDTH_0_13) + resize(act_0_63_13, SUM_WIDTH_0_13);
        -- Stage 2
        s2_0 <= s1_0 + s1_1 + s1_2 + s1_3;
        s2_1 <= s1_4 + s1_5 + s1_6 + s1_7;
        s2_2 <= s1_8 + s1_9 + s1_10 + s1_11;
        s2_3 <= s1_12 + s1_13 + s1_14 + s1_15;
        -- Stage 3
        sum_0_13 <= s2_0 + s2_1 + s2_2 + s2_3;
      end if;
    end process;
    out0_13 <= saturate(sum_0_13, 8);
  end block;

  -- LAYER 0, ch 14
  gen_l0c14 : block
  signal s1_0, s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7, s1_8, s1_9, s1_10, s1_11, s1_12, s1_13, s1_14, s1_15 : sum_t_0_14;
  signal s2_0, s2_1, s2_2, s2_3 : sum_t_0_14;
  signal sum_0_14 : sum_t_0_14;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_14.mem") port map (clk, input(0), act_0_0_14);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_14.mem") port map (clk, input(1), act_0_1_14);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_14.mem") port map (clk, input(2), act_0_2_14);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_14.mem") port map (clk, input(3), act_0_3_14);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_14.mem") port map (clk, input(4), act_0_4_14);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_14.mem") port map (clk, input(5), act_0_5_14);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_14.mem") port map (clk, input(6), act_0_6_14);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_14.mem") port map (clk, input(7), act_0_7_14);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_14.mem") port map (clk, input(8), act_0_8_14);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_14.mem") port map (clk, input(9), act_0_9_14);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_14.mem") port map (clk, input(10), act_0_10_14);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_14.mem") port map (clk, input(11), act_0_11_14);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_14.mem") port map (clk, input(12), act_0_12_14);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_14.mem") port map (clk, input(13), act_0_13_14);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_14.mem") port map (clk, input(14), act_0_14_14);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_14.mem") port map (clk, input(15), act_0_15_14);
    i16 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_16_14.mem") port map (clk, input(16), act_0_16_14);
    i17 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_17_14.mem") port map (clk, input(17), act_0_17_14);
    i18 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_18_14.mem") port map (clk, input(18), act_0_18_14);
    i19 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_19_14.mem") port map (clk, input(19), act_0_19_14);
    i20 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_20_14.mem") port map (clk, input(20), act_0_20_14);
    i21 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_21_14.mem") port map (clk, input(21), act_0_21_14);
    i22 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_22_14.mem") port map (clk, input(22), act_0_22_14);
    i23 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_23_14.mem") port map (clk, input(23), act_0_23_14);
    i24 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_24_14.mem") port map (clk, input(24), act_0_24_14);
    i25 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_25_14.mem") port map (clk, input(25), act_0_25_14);
    i26 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_26_14.mem") port map (clk, input(26), act_0_26_14);
    i27 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_27_14.mem") port map (clk, input(27), act_0_27_14);
    i28 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_28_14.mem") port map (clk, input(28), act_0_28_14);
    i29 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_29_14.mem") port map (clk, input(29), act_0_29_14);
    i30 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_30_14.mem") port map (clk, input(30), act_0_30_14);
    i31 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_31_14.mem") port map (clk, input(31), act_0_31_14);
    i32 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_32_14.mem") port map (clk, input(32), act_0_32_14);
    i33 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_33_14.mem") port map (clk, input(33), act_0_33_14);
    i34 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_34_14.mem") port map (clk, input(34), act_0_34_14);
    i35 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_35_14.mem") port map (clk, input(35), act_0_35_14);
    i36 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_36_14.mem") port map (clk, input(36), act_0_36_14);
    i37 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_37_14.mem") port map (clk, input(37), act_0_37_14);
    i38 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_38_14.mem") port map (clk, input(38), act_0_38_14);
    i39 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_39_14.mem") port map (clk, input(39), act_0_39_14);
    i40 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_40_14.mem") port map (clk, input(40), act_0_40_14);
    i41 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_41_14.mem") port map (clk, input(41), act_0_41_14);
    i42 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_42_14.mem") port map (clk, input(42), act_0_42_14);
    i43 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_43_14.mem") port map (clk, input(43), act_0_43_14);
    i44 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_44_14.mem") port map (clk, input(44), act_0_44_14);
    i45 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_45_14.mem") port map (clk, input(45), act_0_45_14);
    i46 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_46_14.mem") port map (clk, input(46), act_0_46_14);
    i47 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_47_14.mem") port map (clk, input(47), act_0_47_14);
    i48 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_48_14.mem") port map (clk, input(48), act_0_48_14);
    i49 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_49_14.mem") port map (clk, input(49), act_0_49_14);
    i50 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_50_14.mem") port map (clk, input(50), act_0_50_14);
    i51 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_51_14.mem") port map (clk, input(51), act_0_51_14);
    i52 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_52_14.mem") port map (clk, input(52), act_0_52_14);
    i53 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_53_14.mem") port map (clk, input(53), act_0_53_14);
    i54 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_54_14.mem") port map (clk, input(54), act_0_54_14);
    i55 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_55_14.mem") port map (clk, input(55), act_0_55_14);
    i56 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_56_14.mem") port map (clk, input(56), act_0_56_14);
    i57 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_57_14.mem") port map (clk, input(57), act_0_57_14);
    i58 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_58_14.mem") port map (clk, input(58), act_0_58_14);
    i59 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_59_14.mem") port map (clk, input(59), act_0_59_14);
    i60 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_60_14.mem") port map (clk, input(60), act_0_60_14);
    i61 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_61_14.mem") port map (clk, input(61), act_0_61_14);
    i62 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_62_14.mem") port map (clk, input(62), act_0_62_14);
    i63 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_63_14.mem") port map (clk, input(63), act_0_63_14);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_14, SUM_WIDTH_0_14) + resize(act_0_1_14, SUM_WIDTH_0_14) + resize(act_0_2_14, SUM_WIDTH_0_14) + resize(act_0_3_14, SUM_WIDTH_0_14);
        s1_1 <= resize(act_0_4_14, SUM_WIDTH_0_14) + resize(act_0_5_14, SUM_WIDTH_0_14) + resize(act_0_6_14, SUM_WIDTH_0_14) + resize(act_0_7_14, SUM_WIDTH_0_14);
        s1_2 <= resize(act_0_8_14, SUM_WIDTH_0_14) + resize(act_0_9_14, SUM_WIDTH_0_14) + resize(act_0_10_14, SUM_WIDTH_0_14) + resize(act_0_11_14, SUM_WIDTH_0_14);
        s1_3 <= resize(act_0_12_14, SUM_WIDTH_0_14) + resize(act_0_13_14, SUM_WIDTH_0_14) + resize(act_0_14_14, SUM_WIDTH_0_14) + resize(act_0_15_14, SUM_WIDTH_0_14);
        s1_4 <= resize(act_0_16_14, SUM_WIDTH_0_14) + resize(act_0_17_14, SUM_WIDTH_0_14) + resize(act_0_18_14, SUM_WIDTH_0_14) + resize(act_0_19_14, SUM_WIDTH_0_14);
        s1_5 <= resize(act_0_20_14, SUM_WIDTH_0_14) + resize(act_0_21_14, SUM_WIDTH_0_14) + resize(act_0_22_14, SUM_WIDTH_0_14) + resize(act_0_23_14, SUM_WIDTH_0_14);
        s1_6 <= resize(act_0_24_14, SUM_WIDTH_0_14) + resize(act_0_25_14, SUM_WIDTH_0_14) + resize(act_0_26_14, SUM_WIDTH_0_14) + resize(act_0_27_14, SUM_WIDTH_0_14);
        s1_7 <= resize(act_0_28_14, SUM_WIDTH_0_14) + resize(act_0_29_14, SUM_WIDTH_0_14) + resize(act_0_30_14, SUM_WIDTH_0_14) + resize(act_0_31_14, SUM_WIDTH_0_14);
        s1_8 <= resize(act_0_32_14, SUM_WIDTH_0_14) + resize(act_0_33_14, SUM_WIDTH_0_14) + resize(act_0_34_14, SUM_WIDTH_0_14) + resize(act_0_35_14, SUM_WIDTH_0_14);
        s1_9 <= resize(act_0_36_14, SUM_WIDTH_0_14) + resize(act_0_37_14, SUM_WIDTH_0_14) + resize(act_0_38_14, SUM_WIDTH_0_14) + resize(act_0_39_14, SUM_WIDTH_0_14);
        s1_10 <= resize(act_0_40_14, SUM_WIDTH_0_14) + resize(act_0_41_14, SUM_WIDTH_0_14) + resize(act_0_42_14, SUM_WIDTH_0_14) + resize(act_0_43_14, SUM_WIDTH_0_14);
        s1_11 <= resize(act_0_44_14, SUM_WIDTH_0_14) + resize(act_0_45_14, SUM_WIDTH_0_14) + resize(act_0_46_14, SUM_WIDTH_0_14) + resize(act_0_47_14, SUM_WIDTH_0_14);
        s1_12 <= resize(act_0_48_14, SUM_WIDTH_0_14) + resize(act_0_49_14, SUM_WIDTH_0_14) + resize(act_0_50_14, SUM_WIDTH_0_14) + resize(act_0_51_14, SUM_WIDTH_0_14);
        s1_13 <= resize(act_0_52_14, SUM_WIDTH_0_14) + resize(act_0_53_14, SUM_WIDTH_0_14) + resize(act_0_54_14, SUM_WIDTH_0_14) + resize(act_0_55_14, SUM_WIDTH_0_14);
        s1_14 <= resize(act_0_56_14, SUM_WIDTH_0_14) + resize(act_0_57_14, SUM_WIDTH_0_14) + resize(act_0_58_14, SUM_WIDTH_0_14) + resize(act_0_59_14, SUM_WIDTH_0_14);
        s1_15 <= resize(act_0_60_14, SUM_WIDTH_0_14) + resize(act_0_61_14, SUM_WIDTH_0_14) + resize(act_0_62_14, SUM_WIDTH_0_14) + resize(act_0_63_14, SUM_WIDTH_0_14);
        -- Stage 2
        s2_0 <= s1_0 + s1_1 + s1_2 + s1_3;
        s2_1 <= s1_4 + s1_5 + s1_6 + s1_7;
        s2_2 <= s1_8 + s1_9 + s1_10 + s1_11;
        s2_3 <= s1_12 + s1_13 + s1_14 + s1_15;
        -- Stage 3
        sum_0_14 <= s2_0 + s2_1 + s2_2 + s2_3;
      end if;
    end process;
    out0_14 <= saturate(sum_0_14, 8);
  end block;

  -- LAYER 0, ch 15
  gen_l0c15 : block
  signal s1_0, s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7, s1_8, s1_9, s1_10, s1_11, s1_12, s1_13, s1_14, s1_15 : sum_t_0_15;
  signal s2_0, s2_1, s2_2, s2_3 : sum_t_0_15;
  signal sum_0_15 : sum_t_0_15;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_0_15.mem") port map (clk, input(0), act_0_0_15);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_15.mem") port map (clk, input(1), act_0_1_15);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_15.mem") port map (clk, input(2), act_0_2_15);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_15.mem") port map (clk, input(3), act_0_3_15);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_15.mem") port map (clk, input(4), act_0_4_15);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_5_15.mem") port map (clk, input(5), act_0_5_15);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_15.mem") port map (clk, input(6), act_0_6_15);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_15.mem") port map (clk, input(7), act_0_7_15);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_8_15.mem") port map (clk, input(8), act_0_8_15);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_9_15.mem") port map (clk, input(9), act_0_9_15);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_15.mem") port map (clk, input(10), act_0_10_15);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_15.mem") port map (clk, input(11), act_0_11_15);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_15.mem") port map (clk, input(12), act_0_12_15);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_15.mem") port map (clk, input(13), act_0_13_15);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_15.mem") port map (clk, input(14), act_0_14_15);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_15.mem") port map (clk, input(15), act_0_15_15);
    i16 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_16_15.mem") port map (clk, input(16), act_0_16_15);
    i17 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_17_15.mem") port map (clk, input(17), act_0_17_15);
    i18 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_18_15.mem") port map (clk, input(18), act_0_18_15);
    i19 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_19_15.mem") port map (clk, input(19), act_0_19_15);
    i20 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_20_15.mem") port map (clk, input(20), act_0_20_15);
    i21 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_21_15.mem") port map (clk, input(21), act_0_21_15);
    i22 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_22_15.mem") port map (clk, input(22), act_0_22_15);
    i23 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_23_15.mem") port map (clk, input(23), act_0_23_15);
    i24 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_24_15.mem") port map (clk, input(24), act_0_24_15);
    i25 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_25_15.mem") port map (clk, input(25), act_0_25_15);
    i26 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_26_15.mem") port map (clk, input(26), act_0_26_15);
    i27 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_27_15.mem") port map (clk, input(27), act_0_27_15);
    i28 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_28_15.mem") port map (clk, input(28), act_0_28_15);
    i29 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_29_15.mem") port map (clk, input(29), act_0_29_15);
    i30 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_30_15.mem") port map (clk, input(30), act_0_30_15);
    i31 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_31_15.mem") port map (clk, input(31), act_0_31_15);
    i32 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_32_15.mem") port map (clk, input(32), act_0_32_15);
    i33 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_33_15.mem") port map (clk, input(33), act_0_33_15);
    i34 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_34_15.mem") port map (clk, input(34), act_0_34_15);
    i35 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_35_15.mem") port map (clk, input(35), act_0_35_15);
    i36 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_36_15.mem") port map (clk, input(36), act_0_36_15);
    i37 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_37_15.mem") port map (clk, input(37), act_0_37_15);
    i38 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_38_15.mem") port map (clk, input(38), act_0_38_15);
    i39 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_39_15.mem") port map (clk, input(39), act_0_39_15);
    i40 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_40_15.mem") port map (clk, input(40), act_0_40_15);
    i41 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_41_15.mem") port map (clk, input(41), act_0_41_15);
    i42 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_42_15.mem") port map (clk, input(42), act_0_42_15);
    i43 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_43_15.mem") port map (clk, input(43), act_0_43_15);
    i44 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_44_15.mem") port map (clk, input(44), act_0_44_15);
    i45 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_45_15.mem") port map (clk, input(45), act_0_45_15);
    i46 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_46_15.mem") port map (clk, input(46), act_0_46_15);
    i47 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_47_15.mem") port map (clk, input(47), act_0_47_15);
    i48 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_48_15.mem") port map (clk, input(48), act_0_48_15);
    i49 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_49_15.mem") port map (clk, input(49), act_0_49_15);
    i50 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_50_15.mem") port map (clk, input(50), act_0_50_15);
    i51 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_51_15.mem") port map (clk, input(51), act_0_51_15);
    i52 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_52_15.mem") port map (clk, input(52), act_0_52_15);
    i53 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_53_15.mem") port map (clk, input(53), act_0_53_15);
    i54 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_54_15.mem") port map (clk, input(54), act_0_54_15);
    i55 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_55_15.mem") port map (clk, input(55), act_0_55_15);
    i56 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_56_15.mem") port map (clk, input(56), act_0_56_15);
    i57 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_57_15.mem") port map (clk, input(57), act_0_57_15);
    i58 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_58_15.mem") port map (clk, input(58), act_0_58_15);
    i59 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_59_15.mem") port map (clk, input(59), act_0_59_15);
    i60 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_60_15.mem") port map (clk, input(60), act_0_60_15);
    i61 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_61_15.mem") port map (clk, input(61), act_0_61_15);
    i62 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_62_15.mem") port map (clk, input(62), act_0_62_15);
    i63 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_63_15.mem") port map (clk, input(63), act_0_63_15);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_15, SUM_WIDTH_0_15) + resize(act_0_1_15, SUM_WIDTH_0_15) + resize(act_0_2_15, SUM_WIDTH_0_15) + resize(act_0_3_15, SUM_WIDTH_0_15);
        s1_1 <= resize(act_0_4_15, SUM_WIDTH_0_15) + resize(act_0_5_15, SUM_WIDTH_0_15) + resize(act_0_6_15, SUM_WIDTH_0_15) + resize(act_0_7_15, SUM_WIDTH_0_15);
        s1_2 <= resize(act_0_8_15, SUM_WIDTH_0_15) + resize(act_0_9_15, SUM_WIDTH_0_15) + resize(act_0_10_15, SUM_WIDTH_0_15) + resize(act_0_11_15, SUM_WIDTH_0_15);
        s1_3 <= resize(act_0_12_15, SUM_WIDTH_0_15) + resize(act_0_13_15, SUM_WIDTH_0_15) + resize(act_0_14_15, SUM_WIDTH_0_15) + resize(act_0_15_15, SUM_WIDTH_0_15);
        s1_4 <= resize(act_0_16_15, SUM_WIDTH_0_15) + resize(act_0_17_15, SUM_WIDTH_0_15) + resize(act_0_18_15, SUM_WIDTH_0_15) + resize(act_0_19_15, SUM_WIDTH_0_15);
        s1_5 <= resize(act_0_20_15, SUM_WIDTH_0_15) + resize(act_0_21_15, SUM_WIDTH_0_15) + resize(act_0_22_15, SUM_WIDTH_0_15) + resize(act_0_23_15, SUM_WIDTH_0_15);
        s1_6 <= resize(act_0_24_15, SUM_WIDTH_0_15) + resize(act_0_25_15, SUM_WIDTH_0_15) + resize(act_0_26_15, SUM_WIDTH_0_15) + resize(act_0_27_15, SUM_WIDTH_0_15);
        s1_7 <= resize(act_0_28_15, SUM_WIDTH_0_15) + resize(act_0_29_15, SUM_WIDTH_0_15) + resize(act_0_30_15, SUM_WIDTH_0_15) + resize(act_0_31_15, SUM_WIDTH_0_15);
        s1_8 <= resize(act_0_32_15, SUM_WIDTH_0_15) + resize(act_0_33_15, SUM_WIDTH_0_15) + resize(act_0_34_15, SUM_WIDTH_0_15) + resize(act_0_35_15, SUM_WIDTH_0_15);
        s1_9 <= resize(act_0_36_15, SUM_WIDTH_0_15) + resize(act_0_37_15, SUM_WIDTH_0_15) + resize(act_0_38_15, SUM_WIDTH_0_15) + resize(act_0_39_15, SUM_WIDTH_0_15);
        s1_10 <= resize(act_0_40_15, SUM_WIDTH_0_15) + resize(act_0_41_15, SUM_WIDTH_0_15) + resize(act_0_42_15, SUM_WIDTH_0_15) + resize(act_0_43_15, SUM_WIDTH_0_15);
        s1_11 <= resize(act_0_44_15, SUM_WIDTH_0_15) + resize(act_0_45_15, SUM_WIDTH_0_15) + resize(act_0_46_15, SUM_WIDTH_0_15) + resize(act_0_47_15, SUM_WIDTH_0_15);
        s1_12 <= resize(act_0_48_15, SUM_WIDTH_0_15) + resize(act_0_49_15, SUM_WIDTH_0_15) + resize(act_0_50_15, SUM_WIDTH_0_15) + resize(act_0_51_15, SUM_WIDTH_0_15);
        s1_13 <= resize(act_0_52_15, SUM_WIDTH_0_15) + resize(act_0_53_15, SUM_WIDTH_0_15) + resize(act_0_54_15, SUM_WIDTH_0_15) + resize(act_0_55_15, SUM_WIDTH_0_15);
        s1_14 <= resize(act_0_56_15, SUM_WIDTH_0_15) + resize(act_0_57_15, SUM_WIDTH_0_15) + resize(act_0_58_15, SUM_WIDTH_0_15) + resize(act_0_59_15, SUM_WIDTH_0_15);
        s1_15 <= resize(act_0_60_15, SUM_WIDTH_0_15) + resize(act_0_61_15, SUM_WIDTH_0_15) + resize(act_0_62_15, SUM_WIDTH_0_15) + resize(act_0_63_15, SUM_WIDTH_0_15);
        -- Stage 2
        s2_0 <= s1_0 + s1_1 + s1_2 + s1_3;
        s2_1 <= s1_4 + s1_5 + s1_6 + s1_7;
        s2_2 <= s1_8 + s1_9 + s1_10 + s1_11;
        s2_3 <= s1_12 + s1_13 + s1_14 + s1_15;
        -- Stage 3
        sum_0_15 <= s2_0 + s2_1 + s2_2 + s2_3;
      end if;
    end process;
    out0_15 <= saturate(sum_0_15, 8);
  end block;

  -- Register block for layer 0
  out_layer0_reg : process(clk)
    begin
      if rising_edge(clk) then
        out0_0_reg <= out0_0;
        out0_1_reg <= out0_1;
        out0_2_reg <= out0_2;
        out0_3_reg <= out0_3;
        out0_4_reg <= out0_4;
        out0_5_reg <= out0_5;
        out0_6_reg <= out0_6;
        out0_7_reg <= out0_7;
        out0_8_reg <= out0_8;
        out0_9_reg <= out0_9;
        out0_10_reg <= out0_10;
        out0_11_reg <= out0_11;
        out0_12_reg <= out0_12;
        out0_13_reg <= out0_13;
        out0_14_reg <= out0_14;
        out0_15_reg <= out0_15;
      end if;
  end process;

  -- LAYER 1, ch 0
  gen_l1c0 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_1_0;
  signal sum_1_0 : sum_t_1_0;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_0.mem") port map (clk, out0_0_reg, act_1_0_0);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_0.mem") port map (clk, out0_1_reg, act_1_1_0);
    i02 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_2_0.mem") port map (clk, out0_2_reg, act_1_2_0);
    i03 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_0.mem") port map (clk, out0_3_reg, act_1_3_0);
    i04 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_4_0.mem") port map (clk, out0_4_reg, act_1_4_0);
    i05 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_5_0.mem") port map (clk, out0_5_reg, act_1_5_0);
    i06 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_6_0.mem") port map (clk, out0_6_reg, act_1_6_0);
    i07 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_7_0.mem") port map (clk, out0_7_reg, act_1_7_0);
    i08 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_8_0.mem") port map (clk, out0_8_reg, act_1_8_0);
    i09 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_9_0.mem") port map (clk, out0_9_reg, act_1_9_0);
    i10 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_10_0.mem") port map (clk, out0_10_reg, act_1_10_0);
    i11 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_11_0.mem") port map (clk, out0_11_reg, act_1_11_0);
    i12 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_12_0.mem") port map (clk, out0_12_reg, act_1_12_0);
    i13 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_13_0.mem") port map (clk, out0_13_reg, act_1_13_0);
    i14 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_14_0.mem") port map (clk, out0_14_reg, act_1_14_0);
    i15 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_15_0.mem") port map (clk, out0_15_reg, act_1_15_0);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_1_0_0, SUM_WIDTH_1_0) + resize(act_1_1_0, SUM_WIDTH_1_0) + resize(act_1_2_0, SUM_WIDTH_1_0) + resize(act_1_3_0, SUM_WIDTH_1_0);
        s1_1 <= resize(act_1_4_0, SUM_WIDTH_1_0) + resize(act_1_5_0, SUM_WIDTH_1_0) + resize(act_1_6_0, SUM_WIDTH_1_0) + resize(act_1_7_0, SUM_WIDTH_1_0);
        s1_2 <= resize(act_1_8_0, SUM_WIDTH_1_0) + resize(act_1_9_0, SUM_WIDTH_1_0) + resize(act_1_10_0, SUM_WIDTH_1_0) + resize(act_1_11_0, SUM_WIDTH_1_0);
        s1_3 <= resize(act_1_12_0, SUM_WIDTH_1_0) + resize(act_1_13_0, SUM_WIDTH_1_0) + resize(act_1_14_0, SUM_WIDTH_1_0) + resize(act_1_15_0, SUM_WIDTH_1_0);
        -- Stage 2
        sum_1_0 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out1_0 <= saturate(sum_1_0, 8);
  end block;

  -- LAYER 1, ch 1
  gen_l1c1 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_1_1;
  signal sum_1_1 : sum_t_1_1;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_1.mem") port map (clk, out0_0_reg, act_1_0_1);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_1.mem") port map (clk, out0_1_reg, act_1_1_1);
    i02 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_2_1.mem") port map (clk, out0_2_reg, act_1_2_1);
    i03 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_1.mem") port map (clk, out0_3_reg, act_1_3_1);
    i04 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_4_1.mem") port map (clk, out0_4_reg, act_1_4_1);
    i05 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_5_1.mem") port map (clk, out0_5_reg, act_1_5_1);
    i06 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_6_1.mem") port map (clk, out0_6_reg, act_1_6_1);
    i07 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_7_1.mem") port map (clk, out0_7_reg, act_1_7_1);
    i08 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_8_1.mem") port map (clk, out0_8_reg, act_1_8_1);
    i09 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_9_1.mem") port map (clk, out0_9_reg, act_1_9_1);
    i10 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_10_1.mem") port map (clk, out0_10_reg, act_1_10_1);
    i11 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_11_1.mem") port map (clk, out0_11_reg, act_1_11_1);
    i12 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_12_1.mem") port map (clk, out0_12_reg, act_1_12_1);
    i13 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_13_1.mem") port map (clk, out0_13_reg, act_1_13_1);
    i14 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_14_1.mem") port map (clk, out0_14_reg, act_1_14_1);
    i15 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_15_1.mem") port map (clk, out0_15_reg, act_1_15_1);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_1_0_1, SUM_WIDTH_1_1) + resize(act_1_1_1, SUM_WIDTH_1_1) + resize(act_1_2_1, SUM_WIDTH_1_1) + resize(act_1_3_1, SUM_WIDTH_1_1);
        s1_1 <= resize(act_1_4_1, SUM_WIDTH_1_1) + resize(act_1_5_1, SUM_WIDTH_1_1) + resize(act_1_6_1, SUM_WIDTH_1_1) + resize(act_1_7_1, SUM_WIDTH_1_1);
        s1_2 <= resize(act_1_8_1, SUM_WIDTH_1_1) + resize(act_1_9_1, SUM_WIDTH_1_1) + resize(act_1_10_1, SUM_WIDTH_1_1) + resize(act_1_11_1, SUM_WIDTH_1_1);
        s1_3 <= resize(act_1_12_1, SUM_WIDTH_1_1) + resize(act_1_13_1, SUM_WIDTH_1_1) + resize(act_1_14_1, SUM_WIDTH_1_1) + resize(act_1_15_1, SUM_WIDTH_1_1);
        -- Stage 2
        sum_1_1 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out1_1 <= saturate(sum_1_1, 8);
  end block;

  -- LAYER 1, ch 2
  gen_l1c2 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_1_2;
  signal sum_1_2 : sum_t_1_2;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_2.mem") port map (clk, out0_0_reg, act_1_0_2);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_2.mem") port map (clk, out0_1_reg, act_1_1_2);
    i02 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_2_2.mem") port map (clk, out0_2_reg, act_1_2_2);
    i03 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_2.mem") port map (clk, out0_3_reg, act_1_3_2);
    i04 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_4_2.mem") port map (clk, out0_4_reg, act_1_4_2);
    i05 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_5_2.mem") port map (clk, out0_5_reg, act_1_5_2);
    i06 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_6_2.mem") port map (clk, out0_6_reg, act_1_6_2);
    i07 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_7_2.mem") port map (clk, out0_7_reg, act_1_7_2);
    i08 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_8_2.mem") port map (clk, out0_8_reg, act_1_8_2);
    i09 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_9_2.mem") port map (clk, out0_9_reg, act_1_9_2);
    i10 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_10_2.mem") port map (clk, out0_10_reg, act_1_10_2);
    i11 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_11_2.mem") port map (clk, out0_11_reg, act_1_11_2);
    i12 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_12_2.mem") port map (clk, out0_12_reg, act_1_12_2);
    i13 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_13_2.mem") port map (clk, out0_13_reg, act_1_13_2);
    i14 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_14_2.mem") port map (clk, out0_14_reg, act_1_14_2);
    i15 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_15_2.mem") port map (clk, out0_15_reg, act_1_15_2);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_1_0_2, SUM_WIDTH_1_2) + resize(act_1_1_2, SUM_WIDTH_1_2) + resize(act_1_2_2, SUM_WIDTH_1_2) + resize(act_1_3_2, SUM_WIDTH_1_2);
        s1_1 <= resize(act_1_4_2, SUM_WIDTH_1_2) + resize(act_1_5_2, SUM_WIDTH_1_2) + resize(act_1_6_2, SUM_WIDTH_1_2) + resize(act_1_7_2, SUM_WIDTH_1_2);
        s1_2 <= resize(act_1_8_2, SUM_WIDTH_1_2) + resize(act_1_9_2, SUM_WIDTH_1_2) + resize(act_1_10_2, SUM_WIDTH_1_2) + resize(act_1_11_2, SUM_WIDTH_1_2);
        s1_3 <= resize(act_1_12_2, SUM_WIDTH_1_2) + resize(act_1_13_2, SUM_WIDTH_1_2) + resize(act_1_14_2, SUM_WIDTH_1_2) + resize(act_1_15_2, SUM_WIDTH_1_2);
        -- Stage 2
        sum_1_2 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out1_2 <= saturate(sum_1_2, 8);
  end block;

  -- LAYER 1, ch 3
  gen_l1c3 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_1_3;
  signal sum_1_3 : sum_t_1_3;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_3.mem") port map (clk, out0_0_reg, act_1_0_3);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_3.mem") port map (clk, out0_1_reg, act_1_1_3);
    i02 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_2_3.mem") port map (clk, out0_2_reg, act_1_2_3);
    i03 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_3.mem") port map (clk, out0_3_reg, act_1_3_3);
    i04 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_4_3.mem") port map (clk, out0_4_reg, act_1_4_3);
    i05 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_5_3.mem") port map (clk, out0_5_reg, act_1_5_3);
    i06 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_6_3.mem") port map (clk, out0_6_reg, act_1_6_3);
    i07 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_7_3.mem") port map (clk, out0_7_reg, act_1_7_3);
    i08 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_8_3.mem") port map (clk, out0_8_reg, act_1_8_3);
    i09 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_9_3.mem") port map (clk, out0_9_reg, act_1_9_3);
    i10 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_10_3.mem") port map (clk, out0_10_reg, act_1_10_3);
    i11 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_11_3.mem") port map (clk, out0_11_reg, act_1_11_3);
    i12 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_12_3.mem") port map (clk, out0_12_reg, act_1_12_3);
    i13 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_13_3.mem") port map (clk, out0_13_reg, act_1_13_3);
    i14 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_14_3.mem") port map (clk, out0_14_reg, act_1_14_3);
    i15 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_15_3.mem") port map (clk, out0_15_reg, act_1_15_3);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_1_0_3, SUM_WIDTH_1_3) + resize(act_1_1_3, SUM_WIDTH_1_3) + resize(act_1_2_3, SUM_WIDTH_1_3) + resize(act_1_3_3, SUM_WIDTH_1_3);
        s1_1 <= resize(act_1_4_3, SUM_WIDTH_1_3) + resize(act_1_5_3, SUM_WIDTH_1_3) + resize(act_1_6_3, SUM_WIDTH_1_3) + resize(act_1_7_3, SUM_WIDTH_1_3);
        s1_2 <= resize(act_1_8_3, SUM_WIDTH_1_3) + resize(act_1_9_3, SUM_WIDTH_1_3) + resize(act_1_10_3, SUM_WIDTH_1_3) + resize(act_1_11_3, SUM_WIDTH_1_3);
        s1_3 <= resize(act_1_12_3, SUM_WIDTH_1_3) + resize(act_1_13_3, SUM_WIDTH_1_3) + resize(act_1_14_3, SUM_WIDTH_1_3) + resize(act_1_15_3, SUM_WIDTH_1_3);
        -- Stage 2
        sum_1_3 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out1_3 <= saturate(sum_1_3, 8);
  end block;

  -- LAYER 1, ch 4
  gen_l1c4 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_1_4;
  signal sum_1_4 : sum_t_1_4;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_4.mem") port map (clk, out0_0_reg, act_1_0_4);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_4.mem") port map (clk, out0_1_reg, act_1_1_4);
    i02 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_2_4.mem") port map (clk, out0_2_reg, act_1_2_4);
    i03 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_4.mem") port map (clk, out0_3_reg, act_1_3_4);
    i04 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_4_4.mem") port map (clk, out0_4_reg, act_1_4_4);
    i05 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_5_4.mem") port map (clk, out0_5_reg, act_1_5_4);
    i06 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_6_4.mem") port map (clk, out0_6_reg, act_1_6_4);
    i07 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_7_4.mem") port map (clk, out0_7_reg, act_1_7_4);
    i08 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_8_4.mem") port map (clk, out0_8_reg, act_1_8_4);
    i09 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_9_4.mem") port map (clk, out0_9_reg, act_1_9_4);
    i10 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_10_4.mem") port map (clk, out0_10_reg, act_1_10_4);
    i11 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_11_4.mem") port map (clk, out0_11_reg, act_1_11_4);
    i12 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_12_4.mem") port map (clk, out0_12_reg, act_1_12_4);
    i13 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_13_4.mem") port map (clk, out0_13_reg, act_1_13_4);
    i14 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_14_4.mem") port map (clk, out0_14_reg, act_1_14_4);
    i15 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_15_4.mem") port map (clk, out0_15_reg, act_1_15_4);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_1_0_4, SUM_WIDTH_1_4) + resize(act_1_1_4, SUM_WIDTH_1_4) + resize(act_1_2_4, SUM_WIDTH_1_4) + resize(act_1_3_4, SUM_WIDTH_1_4);
        s1_1 <= resize(act_1_4_4, SUM_WIDTH_1_4) + resize(act_1_5_4, SUM_WIDTH_1_4) + resize(act_1_6_4, SUM_WIDTH_1_4) + resize(act_1_7_4, SUM_WIDTH_1_4);
        s1_2 <= resize(act_1_8_4, SUM_WIDTH_1_4) + resize(act_1_9_4, SUM_WIDTH_1_4) + resize(act_1_10_4, SUM_WIDTH_1_4) + resize(act_1_11_4, SUM_WIDTH_1_4);
        s1_3 <= resize(act_1_12_4, SUM_WIDTH_1_4) + resize(act_1_13_4, SUM_WIDTH_1_4) + resize(act_1_14_4, SUM_WIDTH_1_4) + resize(act_1_15_4, SUM_WIDTH_1_4);
        -- Stage 2
        sum_1_4 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out1_4 <= saturate(sum_1_4, 8);
  end block;

  -- LAYER 1, ch 5
  gen_l1c5 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_1_5;
  signal sum_1_5 : sum_t_1_5;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_5.mem") port map (clk, out0_0_reg, act_1_0_5);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_5.mem") port map (clk, out0_1_reg, act_1_1_5);
    i02 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_2_5.mem") port map (clk, out0_2_reg, act_1_2_5);
    i03 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_5.mem") port map (clk, out0_3_reg, act_1_3_5);
    i04 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_4_5.mem") port map (clk, out0_4_reg, act_1_4_5);
    i05 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_5_5.mem") port map (clk, out0_5_reg, act_1_5_5);
    i06 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_6_5.mem") port map (clk, out0_6_reg, act_1_6_5);
    i07 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_7_5.mem") port map (clk, out0_7_reg, act_1_7_5);
    i08 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_8_5.mem") port map (clk, out0_8_reg, act_1_8_5);
    i09 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_9_5.mem") port map (clk, out0_9_reg, act_1_9_5);
    i10 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_10_5.mem") port map (clk, out0_10_reg, act_1_10_5);
    i11 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_11_5.mem") port map (clk, out0_11_reg, act_1_11_5);
    i12 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_12_5.mem") port map (clk, out0_12_reg, act_1_12_5);
    i13 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_13_5.mem") port map (clk, out0_13_reg, act_1_13_5);
    i14 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_14_5.mem") port map (clk, out0_14_reg, act_1_14_5);
    i15 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_15_5.mem") port map (clk, out0_15_reg, act_1_15_5);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_1_0_5, SUM_WIDTH_1_5) + resize(act_1_1_5, SUM_WIDTH_1_5) + resize(act_1_2_5, SUM_WIDTH_1_5) + resize(act_1_3_5, SUM_WIDTH_1_5);
        s1_1 <= resize(act_1_4_5, SUM_WIDTH_1_5) + resize(act_1_5_5, SUM_WIDTH_1_5) + resize(act_1_6_5, SUM_WIDTH_1_5) + resize(act_1_7_5, SUM_WIDTH_1_5);
        s1_2 <= resize(act_1_8_5, SUM_WIDTH_1_5) + resize(act_1_9_5, SUM_WIDTH_1_5) + resize(act_1_10_5, SUM_WIDTH_1_5) + resize(act_1_11_5, SUM_WIDTH_1_5);
        s1_3 <= resize(act_1_12_5, SUM_WIDTH_1_5) + resize(act_1_13_5, SUM_WIDTH_1_5) + resize(act_1_14_5, SUM_WIDTH_1_5) + resize(act_1_15_5, SUM_WIDTH_1_5);
        -- Stage 2
        sum_1_5 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out1_5 <= saturate(sum_1_5, 8);
  end block;

  -- LAYER 1, ch 6
  gen_l1c6 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_1_6;
  signal sum_1_6 : sum_t_1_6;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_6.mem") port map (clk, out0_0_reg, act_1_0_6);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_6.mem") port map (clk, out0_1_reg, act_1_1_6);
    i02 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_2_6.mem") port map (clk, out0_2_reg, act_1_2_6);
    i03 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_6.mem") port map (clk, out0_3_reg, act_1_3_6);
    i04 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_4_6.mem") port map (clk, out0_4_reg, act_1_4_6);
    i05 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_5_6.mem") port map (clk, out0_5_reg, act_1_5_6);
    i06 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_6_6.mem") port map (clk, out0_6_reg, act_1_6_6);
    i07 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_7_6.mem") port map (clk, out0_7_reg, act_1_7_6);
    i08 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_8_6.mem") port map (clk, out0_8_reg, act_1_8_6);
    i09 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_9_6.mem") port map (clk, out0_9_reg, act_1_9_6);
    i10 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_10_6.mem") port map (clk, out0_10_reg, act_1_10_6);
    i11 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_11_6.mem") port map (clk, out0_11_reg, act_1_11_6);
    i12 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_12_6.mem") port map (clk, out0_12_reg, act_1_12_6);
    i13 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_13_6.mem") port map (clk, out0_13_reg, act_1_13_6);
    i14 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_14_6.mem") port map (clk, out0_14_reg, act_1_14_6);
    i15 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_15_6.mem") port map (clk, out0_15_reg, act_1_15_6);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_1_0_6, SUM_WIDTH_1_6) + resize(act_1_1_6, SUM_WIDTH_1_6) + resize(act_1_2_6, SUM_WIDTH_1_6) + resize(act_1_3_6, SUM_WIDTH_1_6);
        s1_1 <= resize(act_1_4_6, SUM_WIDTH_1_6) + resize(act_1_5_6, SUM_WIDTH_1_6) + resize(act_1_6_6, SUM_WIDTH_1_6) + resize(act_1_7_6, SUM_WIDTH_1_6);
        s1_2 <= resize(act_1_8_6, SUM_WIDTH_1_6) + resize(act_1_9_6, SUM_WIDTH_1_6) + resize(act_1_10_6, SUM_WIDTH_1_6) + resize(act_1_11_6, SUM_WIDTH_1_6);
        s1_3 <= resize(act_1_12_6, SUM_WIDTH_1_6) + resize(act_1_13_6, SUM_WIDTH_1_6) + resize(act_1_14_6, SUM_WIDTH_1_6) + resize(act_1_15_6, SUM_WIDTH_1_6);
        -- Stage 2
        sum_1_6 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out1_6 <= saturate(sum_1_6, 8);
  end block;

  -- LAYER 1, ch 7
  gen_l1c7 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_1_7;
  signal sum_1_7 : sum_t_1_7;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_0_7.mem") port map (clk, out0_0_reg, act_1_0_7);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_7.mem") port map (clk, out0_1_reg, act_1_1_7);
    i02 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_2_7.mem") port map (clk, out0_2_reg, act_1_2_7);
    i03 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_3_7.mem") port map (clk, out0_3_reg, act_1_3_7);
    i04 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_4_7.mem") port map (clk, out0_4_reg, act_1_4_7);
    i05 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_5_7.mem") port map (clk, out0_5_reg, act_1_5_7);
    i06 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_6_7.mem") port map (clk, out0_6_reg, act_1_6_7);
    i07 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_7_7.mem") port map (clk, out0_7_reg, act_1_7_7);
    i08 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_8_7.mem") port map (clk, out0_8_reg, act_1_8_7);
    i09 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_9_7.mem") port map (clk, out0_9_reg, act_1_9_7);
    i10 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_10_7.mem") port map (clk, out0_10_reg, act_1_10_7);
    i11 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_11_7.mem") port map (clk, out0_11_reg, act_1_11_7);
    i12 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_12_7.mem") port map (clk, out0_12_reg, act_1_12_7);
    i13 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_13_7.mem") port map (clk, out0_13_reg, act_1_13_7);
    i14 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_14_7.mem") port map (clk, out0_14_reg, act_1_14_7);
    i15 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_15_7.mem") port map (clk, out0_15_reg, act_1_15_7);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_1_0_7, SUM_WIDTH_1_7) + resize(act_1_1_7, SUM_WIDTH_1_7) + resize(act_1_2_7, SUM_WIDTH_1_7) + resize(act_1_3_7, SUM_WIDTH_1_7);
        s1_1 <= resize(act_1_4_7, SUM_WIDTH_1_7) + resize(act_1_5_7, SUM_WIDTH_1_7) + resize(act_1_6_7, SUM_WIDTH_1_7) + resize(act_1_7_7, SUM_WIDTH_1_7);
        s1_2 <= resize(act_1_8_7, SUM_WIDTH_1_7) + resize(act_1_9_7, SUM_WIDTH_1_7) + resize(act_1_10_7, SUM_WIDTH_1_7) + resize(act_1_11_7, SUM_WIDTH_1_7);
        s1_3 <= resize(act_1_12_7, SUM_WIDTH_1_7) + resize(act_1_13_7, SUM_WIDTH_1_7) + resize(act_1_14_7, SUM_WIDTH_1_7) + resize(act_1_15_7, SUM_WIDTH_1_7);
        -- Stage 2
        sum_1_7 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    out1_7 <= saturate(sum_1_7, 8);
  end block;

  -- Register block for layer 1
  out_layer1_reg : process(clk)
    begin
      if rising_edge(clk) then
        out1_0_reg <= out1_0;
        out1_1_reg <= out1_1;
        out1_2_reg <= out1_2;
        out1_3_reg <= out1_3;
        out1_4_reg <= out1_4;
        out1_5_reg <= out1_5;
        out1_6_reg <= out1_6;
        out1_7_reg <= out1_7;
      end if;
  end process;

  -- LAYER 2, ch 0
  gen_l2c0 : block
  signal s1_0, s1_1 : sum_t_2_0;
  signal sum_2_0 : sum_t_2_0;
  begin
    i00 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_0_0.mem") port map (clk, out1_0_reg, act_2_0_0);
    i01 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_1_0.mem") port map (clk, out1_1_reg, act_2_1_0);
    i02 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_2_0.mem") port map (clk, out1_2_reg, act_2_2_0);
    i03 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_3_0.mem") port map (clk, out1_3_reg, act_2_3_0);
    i04 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_4_0.mem") port map (clk, out1_4_reg, act_2_4_0);
    i05 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_5_0.mem") port map (clk, out1_5_reg, act_2_5_0);
    i06 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_6_0.mem") port map (clk, out1_6_reg, act_2_6_0);
    i07 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_7_0.mem") port map (clk, out1_7_reg, act_2_7_0);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_2_0_0, SUM_WIDTH_2_0) + resize(act_2_1_0, SUM_WIDTH_2_0) + resize(act_2_2_0, SUM_WIDTH_2_0) + resize(act_2_3_0, SUM_WIDTH_2_0);
        s1_1 <= resize(act_2_4_0, SUM_WIDTH_2_0) + resize(act_2_5_0, SUM_WIDTH_2_0) + resize(act_2_6_0, SUM_WIDTH_2_0) + resize(act_2_7_0, SUM_WIDTH_2_0);
        -- Stage 2
        sum_2_0 <= s1_0 + s1_1;
      end if;
    end process;
    out2_0 <= saturate(sum_2_0, 7);
  end block;

  -- LAYER 2, ch 1
  gen_l2c1 : block
  signal s1_0, s1_1 : sum_t_2_1;
  signal sum_2_1 : sum_t_2_1;
  begin
    i00 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_0_1.mem") port map (clk, out1_0_reg, act_2_0_1);
    i01 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_1_1.mem") port map (clk, out1_1_reg, act_2_1_1);
    i02 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_2_1.mem") port map (clk, out1_2_reg, act_2_2_1);
    i03 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_3_1.mem") port map (clk, out1_3_reg, act_2_3_1);
    i04 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_4_1.mem") port map (clk, out1_4_reg, act_2_4_1);
    i05 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_5_1.mem") port map (clk, out1_5_reg, act_2_5_1);
    i06 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_6_1.mem") port map (clk, out1_6_reg, act_2_6_1);
    i07 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_7_1.mem") port map (clk, out1_7_reg, act_2_7_1);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_2_0_1, SUM_WIDTH_2_1) + resize(act_2_1_1, SUM_WIDTH_2_1) + resize(act_2_2_1, SUM_WIDTH_2_1) + resize(act_2_3_1, SUM_WIDTH_2_1);
        s1_1 <= resize(act_2_4_1, SUM_WIDTH_2_1) + resize(act_2_5_1, SUM_WIDTH_2_1) + resize(act_2_6_1, SUM_WIDTH_2_1) + resize(act_2_7_1, SUM_WIDTH_2_1);
        -- Stage 2
        sum_2_1 <= s1_0 + s1_1;
      end if;
    end process;
    out2_1 <= saturate(sum_2_1, 7);
  end block;

  -- LAYER 2, ch 2
  gen_l2c2 : block
  signal s1_0, s1_1 : sum_t_2_2;
  signal sum_2_2 : sum_t_2_2;
  begin
    i00 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_0_2.mem") port map (clk, out1_0_reg, act_2_0_2);
    i01 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_1_2.mem") port map (clk, out1_1_reg, act_2_1_2);
    i02 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_2_2.mem") port map (clk, out1_2_reg, act_2_2_2);
    i03 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_3_2.mem") port map (clk, out1_3_reg, act_2_3_2);
    i04 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_4_2.mem") port map (clk, out1_4_reg, act_2_4_2);
    i05 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_5_2.mem") port map (clk, out1_5_reg, act_2_5_2);
    i06 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_6_2.mem") port map (clk, out1_6_reg, act_2_6_2);
    i07 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_7_2.mem") port map (clk, out1_7_reg, act_2_7_2);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_2_0_2, SUM_WIDTH_2_2) + resize(act_2_1_2, SUM_WIDTH_2_2) + resize(act_2_2_2, SUM_WIDTH_2_2) + resize(act_2_3_2, SUM_WIDTH_2_2);
        s1_1 <= resize(act_2_4_2, SUM_WIDTH_2_2) + resize(act_2_5_2, SUM_WIDTH_2_2) + resize(act_2_6_2, SUM_WIDTH_2_2) + resize(act_2_7_2, SUM_WIDTH_2_2);
        -- Stage 2
        sum_2_2 <= s1_0 + s1_1;
      end if;
    end process;
    out2_2 <= saturate(sum_2_2, 7);
  end block;

  -- LAYER 2, ch 3
  gen_l2c3 : block
  signal s1_0, s1_1 : sum_t_2_3;
  signal sum_2_3 : sum_t_2_3;
  begin
    i00 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_0_3.mem") port map (clk, out1_0_reg, act_2_0_3);
    i01 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_1_3.mem") port map (clk, out1_1_reg, act_2_1_3);
    i02 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_2_3.mem") port map (clk, out1_2_reg, act_2_2_3);
    i03 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_3_3.mem") port map (clk, out1_3_reg, act_2_3_3);
    i04 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_4_3.mem") port map (clk, out1_4_reg, act_2_4_3);
    i05 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_5_3.mem") port map (clk, out1_5_reg, act_2_5_3);
    i06 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_6_3.mem") port map (clk, out1_6_reg, act_2_6_3);
    i07 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_7_3.mem") port map (clk, out1_7_reg, act_2_7_3);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_2_0_3, SUM_WIDTH_2_3) + resize(act_2_1_3, SUM_WIDTH_2_3) + resize(act_2_2_3, SUM_WIDTH_2_3) + resize(act_2_3_3, SUM_WIDTH_2_3);
        s1_1 <= resize(act_2_4_3, SUM_WIDTH_2_3) + resize(act_2_5_3, SUM_WIDTH_2_3) + resize(act_2_6_3, SUM_WIDTH_2_3) + resize(act_2_7_3, SUM_WIDTH_2_3);
        -- Stage 2
        sum_2_3 <= s1_0 + s1_1;
      end if;
    end process;
    out2_3 <= saturate(sum_2_3, 7);
  end block;

  -- LAYER 2, ch 4
  gen_l2c4 : block
  signal s1_0, s1_1 : sum_t_2_4;
  signal sum_2_4 : sum_t_2_4;
  begin
    i00 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_0_4.mem") port map (clk, out1_0_reg, act_2_0_4);
    i01 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_1_4.mem") port map (clk, out1_1_reg, act_2_1_4);
    i02 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_2_4.mem") port map (clk, out1_2_reg, act_2_2_4);
    i03 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_3_4.mem") port map (clk, out1_3_reg, act_2_3_4);
    i04 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_4_4.mem") port map (clk, out1_4_reg, act_2_4_4);
    i05 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_5_4.mem") port map (clk, out1_5_reg, act_2_5_4);
    i06 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_6_4.mem") port map (clk, out1_6_reg, act_2_6_4);
    i07 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_7_4.mem") port map (clk, out1_7_reg, act_2_7_4);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_2_0_4, SUM_WIDTH_2_4) + resize(act_2_1_4, SUM_WIDTH_2_4) + resize(act_2_2_4, SUM_WIDTH_2_4) + resize(act_2_3_4, SUM_WIDTH_2_4);
        s1_1 <= resize(act_2_4_4, SUM_WIDTH_2_4) + resize(act_2_5_4, SUM_WIDTH_2_4) + resize(act_2_6_4, SUM_WIDTH_2_4) + resize(act_2_7_4, SUM_WIDTH_2_4);
        -- Stage 2
        sum_2_4 <= s1_0 + s1_1;
      end if;
    end process;
    out2_4 <= saturate(sum_2_4, 7);
  end block;

  -- LAYER 2, ch 5
  gen_l2c5 : block
  signal s1_0, s1_1 : sum_t_2_5;
  signal sum_2_5 : sum_t_2_5;
  begin
    i00 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_0_5.mem") port map (clk, out1_0_reg, act_2_0_5);
    i01 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_1_5.mem") port map (clk, out1_1_reg, act_2_1_5);
    i02 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_2_5.mem") port map (clk, out1_2_reg, act_2_2_5);
    i03 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_3_5.mem") port map (clk, out1_3_reg, act_2_3_5);
    i04 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_4_5.mem") port map (clk, out1_4_reg, act_2_4_5);
    i05 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_5_5.mem") port map (clk, out1_5_reg, act_2_5_5);
    i06 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_6_5.mem") port map (clk, out1_6_reg, act_2_6_5);
    i07 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_7_5.mem") port map (clk, out1_7_reg, act_2_7_5);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_2_0_5, SUM_WIDTH_2_5) + resize(act_2_1_5, SUM_WIDTH_2_5) + resize(act_2_2_5, SUM_WIDTH_2_5) + resize(act_2_3_5, SUM_WIDTH_2_5);
        s1_1 <= resize(act_2_4_5, SUM_WIDTH_2_5) + resize(act_2_5_5, SUM_WIDTH_2_5) + resize(act_2_6_5, SUM_WIDTH_2_5) + resize(act_2_7_5, SUM_WIDTH_2_5);
        -- Stage 2
        sum_2_5 <= s1_0 + s1_1;
      end if;
    end process;
    out2_5 <= saturate(sum_2_5, 7);
  end block;

  -- LAYER 2, ch 6
  gen_l2c6 : block
  signal s1_0, s1_1 : sum_t_2_6;
  signal sum_2_6 : sum_t_2_6;
  begin
    i00 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_0_6.mem") port map (clk, out1_0_reg, act_2_0_6);
    i01 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_1_6.mem") port map (clk, out1_1_reg, act_2_1_6);
    i02 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_2_6.mem") port map (clk, out1_2_reg, act_2_2_6);
    i03 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_3_6.mem") port map (clk, out1_3_reg, act_2_3_6);
    i04 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_4_6.mem") port map (clk, out1_4_reg, act_2_4_6);
    i05 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_5_6.mem") port map (clk, out1_5_reg, act_2_5_6);
    i06 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_6_6.mem") port map (clk, out1_6_reg, act_2_6_6);
    i07 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_7_6.mem") port map (clk, out1_7_reg, act_2_7_6);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_2_0_6, SUM_WIDTH_2_6) + resize(act_2_1_6, SUM_WIDTH_2_6) + resize(act_2_2_6, SUM_WIDTH_2_6) + resize(act_2_3_6, SUM_WIDTH_2_6);
        s1_1 <= resize(act_2_4_6, SUM_WIDTH_2_6) + resize(act_2_5_6, SUM_WIDTH_2_6) + resize(act_2_6_6, SUM_WIDTH_2_6) + resize(act_2_7_6, SUM_WIDTH_2_6);
        -- Stage 2
        sum_2_6 <= s1_0 + s1_1;
      end if;
    end process;
    out2_6 <= saturate(sum_2_6, 7);
  end block;

  -- LAYER 2, ch 7
  gen_l2c7 : block
  signal s1_0, s1_1 : sum_t_2_7;
  signal sum_2_7 : sum_t_2_7;
  begin
    i00 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_0_7.mem") port map (clk, out1_0_reg, act_2_0_7);
    i01 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_1_7.mem") port map (clk, out1_1_reg, act_2_1_7);
    i02 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_2_7.mem") port map (clk, out1_2_reg, act_2_2_7);
    i03 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_3_7.mem") port map (clk, out1_3_reg, act_2_3_7);
    i04 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_4_7.mem") port map (clk, out1_4_reg, act_2_4_7);
    i05 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_5_7.mem") port map (clk, out1_5_reg, act_2_5_7);
    i06 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_6_7.mem") port map (clk, out1_6_reg, act_2_6_7);
    i07 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_7_7.mem") port map (clk, out1_7_reg, act_2_7_7);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_2_0_7, SUM_WIDTH_2_7) + resize(act_2_1_7, SUM_WIDTH_2_7) + resize(act_2_2_7, SUM_WIDTH_2_7) + resize(act_2_3_7, SUM_WIDTH_2_7);
        s1_1 <= resize(act_2_4_7, SUM_WIDTH_2_7) + resize(act_2_5_7, SUM_WIDTH_2_7) + resize(act_2_6_7, SUM_WIDTH_2_7) + resize(act_2_7_7, SUM_WIDTH_2_7);
        -- Stage 2
        sum_2_7 <= s1_0 + s1_1;
      end if;
    end process;
    out2_7 <= saturate(sum_2_7, 7);
  end block;

  -- LAYER 2, ch 8
  gen_l2c8 : block
  signal s1_0, s1_1 : sum_t_2_8;
  signal sum_2_8 : sum_t_2_8;
  begin
    i00 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_0_8.mem") port map (clk, out1_0_reg, act_2_0_8);
    i01 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_1_8.mem") port map (clk, out1_1_reg, act_2_1_8);
    i02 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_2_8.mem") port map (clk, out1_2_reg, act_2_2_8);
    i03 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_3_8.mem") port map (clk, out1_3_reg, act_2_3_8);
    i04 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_4_8.mem") port map (clk, out1_4_reg, act_2_4_8);
    i05 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_5_8.mem") port map (clk, out1_5_reg, act_2_5_8);
    i06 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_6_8.mem") port map (clk, out1_6_reg, act_2_6_8);
    i07 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_7_8.mem") port map (clk, out1_7_reg, act_2_7_8);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_2_0_8, SUM_WIDTH_2_8) + resize(act_2_1_8, SUM_WIDTH_2_8) + resize(act_2_2_8, SUM_WIDTH_2_8) + resize(act_2_3_8, SUM_WIDTH_2_8);
        s1_1 <= resize(act_2_4_8, SUM_WIDTH_2_8) + resize(act_2_5_8, SUM_WIDTH_2_8) + resize(act_2_6_8, SUM_WIDTH_2_8) + resize(act_2_7_8, SUM_WIDTH_2_8);
        -- Stage 2
        sum_2_8 <= s1_0 + s1_1;
      end if;
    end process;
    out2_8 <= saturate(sum_2_8, 7);
  end block;

  -- LAYER 2, ch 9
  gen_l2c9 : block
  signal s1_0, s1_1 : sum_t_2_9;
  signal sum_2_9 : sum_t_2_9;
  begin
    i00 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_0_9.mem") port map (clk, out1_0_reg, act_2_0_9);
    i01 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_1_9.mem") port map (clk, out1_1_reg, act_2_1_9);
    i02 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_2_9.mem") port map (clk, out1_2_reg, act_2_2_9);
    i03 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_3_9.mem") port map (clk, out1_3_reg, act_2_3_9);
    i04 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_4_9.mem") port map (clk, out1_4_reg, act_2_4_9);
    i05 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_5_9.mem") port map (clk, out1_5_reg, act_2_5_9);
    i06 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_6_9.mem") port map (clk, out1_6_reg, act_2_6_9);
    i07 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_7_9.mem") port map (clk, out1_7_reg, act_2_7_9);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_2_0_9, SUM_WIDTH_2_9) + resize(act_2_1_9, SUM_WIDTH_2_9) + resize(act_2_2_9, SUM_WIDTH_2_9) + resize(act_2_3_9, SUM_WIDTH_2_9);
        s1_1 <= resize(act_2_4_9, SUM_WIDTH_2_9) + resize(act_2_5_9, SUM_WIDTH_2_9) + resize(act_2_6_9, SUM_WIDTH_2_9) + resize(act_2_7_9, SUM_WIDTH_2_9);
        -- Stage 2
        sum_2_9 <= s1_0 + s1_1;
      end if;
    end process;
    out2_9 <= saturate(sum_2_9, 7);
  end block;

  -- LAYER 2, ch 10
  gen_l2c10 : block
  signal s1_0, s1_1 : sum_t_2_10;
  signal sum_2_10 : sum_t_2_10;
  begin
    i00 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_0_10.mem") port map (clk, out1_0_reg, act_2_0_10);
    i01 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_1_10.mem") port map (clk, out1_1_reg, act_2_1_10);
    i02 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_2_10.mem") port map (clk, out1_2_reg, act_2_2_10);
    i03 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_3_10.mem") port map (clk, out1_3_reg, act_2_3_10);
    i04 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_4_10.mem") port map (clk, out1_4_reg, act_2_4_10);
    i05 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_5_10.mem") port map (clk, out1_5_reg, act_2_5_10);
    i06 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_6_10.mem") port map (clk, out1_6_reg, act_2_6_10);
    i07 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_7_10.mem") port map (clk, out1_7_reg, act_2_7_10);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_2_0_10, SUM_WIDTH_2_10) + resize(act_2_1_10, SUM_WIDTH_2_10) + resize(act_2_2_10, SUM_WIDTH_2_10) + resize(act_2_3_10, SUM_WIDTH_2_10);
        s1_1 <= resize(act_2_4_10, SUM_WIDTH_2_10) + resize(act_2_5_10, SUM_WIDTH_2_10) + resize(act_2_6_10, SUM_WIDTH_2_10) + resize(act_2_7_10, SUM_WIDTH_2_10);
        -- Stage 2
        sum_2_10 <= s1_0 + s1_1;
      end if;
    end process;
    out2_10 <= saturate(sum_2_10, 7);
  end block;

  -- LAYER 2, ch 11
  gen_l2c11 : block
  signal s1_0, s1_1 : sum_t_2_11;
  signal sum_2_11 : sum_t_2_11;
  begin
    i00 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_0_11.mem") port map (clk, out1_0_reg, act_2_0_11);
    i01 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_1_11.mem") port map (clk, out1_1_reg, act_2_1_11);
    i02 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_2_11.mem") port map (clk, out1_2_reg, act_2_2_11);
    i03 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_3_11.mem") port map (clk, out1_3_reg, act_2_3_11);
    i04 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_4_11.mem") port map (clk, out1_4_reg, act_2_4_11);
    i05 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_5_11.mem") port map (clk, out1_5_reg, act_2_5_11);
    i06 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_6_11.mem") port map (clk, out1_6_reg, act_2_6_11);
    i07 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_7_11.mem") port map (clk, out1_7_reg, act_2_7_11);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_2_0_11, SUM_WIDTH_2_11) + resize(act_2_1_11, SUM_WIDTH_2_11) + resize(act_2_2_11, SUM_WIDTH_2_11) + resize(act_2_3_11, SUM_WIDTH_2_11);
        s1_1 <= resize(act_2_4_11, SUM_WIDTH_2_11) + resize(act_2_5_11, SUM_WIDTH_2_11) + resize(act_2_6_11, SUM_WIDTH_2_11) + resize(act_2_7_11, SUM_WIDTH_2_11);
        -- Stage 2
        sum_2_11 <= s1_0 + s1_1;
      end if;
    end process;
    out2_11 <= saturate(sum_2_11, 7);
  end block;

  -- LAYER 2, ch 12
  gen_l2c12 : block
  signal s1_0, s1_1 : sum_t_2_12;
  signal sum_2_12 : sum_t_2_12;
  begin
    i00 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_0_12.mem") port map (clk, out1_0_reg, act_2_0_12);
    i01 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_1_12.mem") port map (clk, out1_1_reg, act_2_1_12);
    i02 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_2_12.mem") port map (clk, out1_2_reg, act_2_2_12);
    i03 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_3_12.mem") port map (clk, out1_3_reg, act_2_3_12);
    i04 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_4_12.mem") port map (clk, out1_4_reg, act_2_4_12);
    i05 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_5_12.mem") port map (clk, out1_5_reg, act_2_5_12);
    i06 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_6_12.mem") port map (clk, out1_6_reg, act_2_6_12);
    i07 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_7_12.mem") port map (clk, out1_7_reg, act_2_7_12);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_2_0_12, SUM_WIDTH_2_12) + resize(act_2_1_12, SUM_WIDTH_2_12) + resize(act_2_2_12, SUM_WIDTH_2_12) + resize(act_2_3_12, SUM_WIDTH_2_12);
        s1_1 <= resize(act_2_4_12, SUM_WIDTH_2_12) + resize(act_2_5_12, SUM_WIDTH_2_12) + resize(act_2_6_12, SUM_WIDTH_2_12) + resize(act_2_7_12, SUM_WIDTH_2_12);
        -- Stage 2
        sum_2_12 <= s1_0 + s1_1;
      end if;
    end process;
    out2_12 <= saturate(sum_2_12, 7);
  end block;

  -- LAYER 2, ch 13
  gen_l2c13 : block
  signal s1_0, s1_1 : sum_t_2_13;
  signal sum_2_13 : sum_t_2_13;
  begin
    i00 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_0_13.mem") port map (clk, out1_0_reg, act_2_0_13);
    i01 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_1_13.mem") port map (clk, out1_1_reg, act_2_1_13);
    i02 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_2_13.mem") port map (clk, out1_2_reg, act_2_2_13);
    i03 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_3_13.mem") port map (clk, out1_3_reg, act_2_3_13);
    i04 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_4_13.mem") port map (clk, out1_4_reg, act_2_4_13);
    i05 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_5_13.mem") port map (clk, out1_5_reg, act_2_5_13);
    i06 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_6_13.mem") port map (clk, out1_6_reg, act_2_6_13);
    i07 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_7_13.mem") port map (clk, out1_7_reg, act_2_7_13);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_2_0_13, SUM_WIDTH_2_13) + resize(act_2_1_13, SUM_WIDTH_2_13) + resize(act_2_2_13, SUM_WIDTH_2_13) + resize(act_2_3_13, SUM_WIDTH_2_13);
        s1_1 <= resize(act_2_4_13, SUM_WIDTH_2_13) + resize(act_2_5_13, SUM_WIDTH_2_13) + resize(act_2_6_13, SUM_WIDTH_2_13) + resize(act_2_7_13, SUM_WIDTH_2_13);
        -- Stage 2
        sum_2_13 <= s1_0 + s1_1;
      end if;
    end process;
    out2_13 <= saturate(sum_2_13, 7);
  end block;

  -- LAYER 2, ch 14
  gen_l2c14 : block
  signal s1_0, s1_1 : sum_t_2_14;
  signal sum_2_14 : sum_t_2_14;
  begin
    i00 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_0_14.mem") port map (clk, out1_0_reg, act_2_0_14);
    i01 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_1_14.mem") port map (clk, out1_1_reg, act_2_1_14);
    i02 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_2_14.mem") port map (clk, out1_2_reg, act_2_2_14);
    i03 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_3_14.mem") port map (clk, out1_3_reg, act_2_3_14);
    i04 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_4_14.mem") port map (clk, out1_4_reg, act_2_4_14);
    i05 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_5_14.mem") port map (clk, out1_5_reg, act_2_5_14);
    i06 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_6_14.mem") port map (clk, out1_6_reg, act_2_6_14);
    i07 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_7_14.mem") port map (clk, out1_7_reg, act_2_7_14);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_2_0_14, SUM_WIDTH_2_14) + resize(act_2_1_14, SUM_WIDTH_2_14) + resize(act_2_2_14, SUM_WIDTH_2_14) + resize(act_2_3_14, SUM_WIDTH_2_14);
        s1_1 <= resize(act_2_4_14, SUM_WIDTH_2_14) + resize(act_2_5_14, SUM_WIDTH_2_14) + resize(act_2_6_14, SUM_WIDTH_2_14) + resize(act_2_7_14, SUM_WIDTH_2_14);
        -- Stage 2
        sum_2_14 <= s1_0 + s1_1;
      end if;
    end process;
    out2_14 <= saturate(sum_2_14, 7);
  end block;

  -- LAYER 2, ch 15
  gen_l2c15 : block
  signal s1_0, s1_1 : sum_t_2_15;
  signal sum_2_15 : sum_t_2_15;
  begin
    i00 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_0_15.mem") port map (clk, out1_0_reg, act_2_0_15);
    i01 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_1_15.mem") port map (clk, out1_1_reg, act_2_1_15);
    i02 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_2_15.mem") port map (clk, out1_2_reg, act_2_2_15);
    i03 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_3_15.mem") port map (clk, out1_3_reg, act_2_3_15);
    i04 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_4_15.mem") port map (clk, out1_4_reg, act_2_4_15);
    i05 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_5_15.mem") port map (clk, out1_5_reg, act_2_5_15);
    i06 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_6_15.mem") port map (clk, out1_6_reg, act_2_6_15);
    i07 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_7_15.mem") port map (clk, out1_7_reg, act_2_7_15);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_2_0_15, SUM_WIDTH_2_15) + resize(act_2_1_15, SUM_WIDTH_2_15) + resize(act_2_2_15, SUM_WIDTH_2_15) + resize(act_2_3_15, SUM_WIDTH_2_15);
        s1_1 <= resize(act_2_4_15, SUM_WIDTH_2_15) + resize(act_2_5_15, SUM_WIDTH_2_15) + resize(act_2_6_15, SUM_WIDTH_2_15) + resize(act_2_7_15, SUM_WIDTH_2_15);
        -- Stage 2
        sum_2_15 <= s1_0 + s1_1;
      end if;
    end process;
    out2_15 <= saturate(sum_2_15, 7);
  end block;

  -- Register block for layer 2
  out_layer2_reg : process(clk)
    begin
      if rising_edge(clk) then
        out2_0_reg <= out2_0;
        out2_1_reg <= out2_1;
        out2_2_reg <= out2_2;
        out2_3_reg <= out2_3;
        out2_4_reg <= out2_4;
        out2_5_reg <= out2_5;
        out2_6_reg <= out2_6;
        out2_7_reg <= out2_7;
        out2_8_reg <= out2_8;
        out2_9_reg <= out2_9;
        out2_10_reg <= out2_10;
        out2_11_reg <= out2_11;
        out2_12_reg <= out2_12;
        out2_13_reg <= out2_13;
        out2_14_reg <= out2_14;
        out2_15_reg <= out2_15;
      end if;
  end process;

  -- LAYER 3, ch 0
  gen_l3c0 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_0;
  signal sum_3_0 : sum_t_3_0;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_0.mem") port map (clk, out2_0_reg, act_3_0_0);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_0.mem") port map (clk, out2_1_reg, act_3_1_0);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_0.mem") port map (clk, out2_2_reg, act_3_2_0);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_0.mem") port map (clk, out2_3_reg, act_3_3_0);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_0.mem") port map (clk, out2_4_reg, act_3_4_0);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_0.mem") port map (clk, out2_5_reg, act_3_5_0);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_0.mem") port map (clk, out2_6_reg, act_3_6_0);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_0.mem") port map (clk, out2_7_reg, act_3_7_0);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_0.mem") port map (clk, out2_8_reg, act_3_8_0);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_0.mem") port map (clk, out2_9_reg, act_3_9_0);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_0.mem") port map (clk, out2_10_reg, act_3_10_0);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_0.mem") port map (clk, out2_11_reg, act_3_11_0);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_0.mem") port map (clk, out2_12_reg, act_3_12_0);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_0.mem") port map (clk, out2_13_reg, act_3_13_0);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_0.mem") port map (clk, out2_14_reg, act_3_14_0);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_0.mem") port map (clk, out2_15_reg, act_3_15_0);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_0, SUM_WIDTH_3_0) + resize(act_3_1_0, SUM_WIDTH_3_0) + resize(act_3_2_0, SUM_WIDTH_3_0) + resize(act_3_3_0, SUM_WIDTH_3_0);
        s1_1 <= resize(act_3_4_0, SUM_WIDTH_3_0) + resize(act_3_5_0, SUM_WIDTH_3_0) + resize(act_3_6_0, SUM_WIDTH_3_0) + resize(act_3_7_0, SUM_WIDTH_3_0);
        s1_2 <= resize(act_3_8_0, SUM_WIDTH_3_0) + resize(act_3_9_0, SUM_WIDTH_3_0) + resize(act_3_10_0, SUM_WIDTH_3_0) + resize(act_3_11_0, SUM_WIDTH_3_0);
        s1_3 <= resize(act_3_12_0, SUM_WIDTH_3_0) + resize(act_3_13_0, SUM_WIDTH_3_0) + resize(act_3_14_0, SUM_WIDTH_3_0) + resize(act_3_15_0, SUM_WIDTH_3_0);
        -- Stage 2
        sum_3_0 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(0) <= saturate(sum_3_0, 8);
  end block;

  -- LAYER 3, ch 1
  gen_l3c1 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_1;
  signal sum_3_1 : sum_t_3_1;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_1.mem") port map (clk, out2_0_reg, act_3_0_1);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_1.mem") port map (clk, out2_1_reg, act_3_1_1);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_1.mem") port map (clk, out2_2_reg, act_3_2_1);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_1.mem") port map (clk, out2_3_reg, act_3_3_1);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_1.mem") port map (clk, out2_4_reg, act_3_4_1);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_1.mem") port map (clk, out2_5_reg, act_3_5_1);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_1.mem") port map (clk, out2_6_reg, act_3_6_1);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_1.mem") port map (clk, out2_7_reg, act_3_7_1);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_1.mem") port map (clk, out2_8_reg, act_3_8_1);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_1.mem") port map (clk, out2_9_reg, act_3_9_1);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_1.mem") port map (clk, out2_10_reg, act_3_10_1);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_1.mem") port map (clk, out2_11_reg, act_3_11_1);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_1.mem") port map (clk, out2_12_reg, act_3_12_1);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_1.mem") port map (clk, out2_13_reg, act_3_13_1);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_1.mem") port map (clk, out2_14_reg, act_3_14_1);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_1.mem") port map (clk, out2_15_reg, act_3_15_1);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_1, SUM_WIDTH_3_1) + resize(act_3_1_1, SUM_WIDTH_3_1) + resize(act_3_2_1, SUM_WIDTH_3_1) + resize(act_3_3_1, SUM_WIDTH_3_1);
        s1_1 <= resize(act_3_4_1, SUM_WIDTH_3_1) + resize(act_3_5_1, SUM_WIDTH_3_1) + resize(act_3_6_1, SUM_WIDTH_3_1) + resize(act_3_7_1, SUM_WIDTH_3_1);
        s1_2 <= resize(act_3_8_1, SUM_WIDTH_3_1) + resize(act_3_9_1, SUM_WIDTH_3_1) + resize(act_3_10_1, SUM_WIDTH_3_1) + resize(act_3_11_1, SUM_WIDTH_3_1);
        s1_3 <= resize(act_3_12_1, SUM_WIDTH_3_1) + resize(act_3_13_1, SUM_WIDTH_3_1) + resize(act_3_14_1, SUM_WIDTH_3_1) + resize(act_3_15_1, SUM_WIDTH_3_1);
        -- Stage 2
        sum_3_1 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(1) <= saturate(sum_3_1, 8);
  end block;

  -- LAYER 3, ch 2
  gen_l3c2 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_2;
  signal sum_3_2 : sum_t_3_2;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_2.mem") port map (clk, out2_0_reg, act_3_0_2);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_2.mem") port map (clk, out2_1_reg, act_3_1_2);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_2.mem") port map (clk, out2_2_reg, act_3_2_2);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_2.mem") port map (clk, out2_3_reg, act_3_3_2);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_2.mem") port map (clk, out2_4_reg, act_3_4_2);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_2.mem") port map (clk, out2_5_reg, act_3_5_2);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_2.mem") port map (clk, out2_6_reg, act_3_6_2);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_2.mem") port map (clk, out2_7_reg, act_3_7_2);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_2.mem") port map (clk, out2_8_reg, act_3_8_2);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_2.mem") port map (clk, out2_9_reg, act_3_9_2);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_2.mem") port map (clk, out2_10_reg, act_3_10_2);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_2.mem") port map (clk, out2_11_reg, act_3_11_2);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_2.mem") port map (clk, out2_12_reg, act_3_12_2);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_2.mem") port map (clk, out2_13_reg, act_3_13_2);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_2.mem") port map (clk, out2_14_reg, act_3_14_2);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_2.mem") port map (clk, out2_15_reg, act_3_15_2);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_2, SUM_WIDTH_3_2) + resize(act_3_1_2, SUM_WIDTH_3_2) + resize(act_3_2_2, SUM_WIDTH_3_2) + resize(act_3_3_2, SUM_WIDTH_3_2);
        s1_1 <= resize(act_3_4_2, SUM_WIDTH_3_2) + resize(act_3_5_2, SUM_WIDTH_3_2) + resize(act_3_6_2, SUM_WIDTH_3_2) + resize(act_3_7_2, SUM_WIDTH_3_2);
        s1_2 <= resize(act_3_8_2, SUM_WIDTH_3_2) + resize(act_3_9_2, SUM_WIDTH_3_2) + resize(act_3_10_2, SUM_WIDTH_3_2) + resize(act_3_11_2, SUM_WIDTH_3_2);
        s1_3 <= resize(act_3_12_2, SUM_WIDTH_3_2) + resize(act_3_13_2, SUM_WIDTH_3_2) + resize(act_3_14_2, SUM_WIDTH_3_2) + resize(act_3_15_2, SUM_WIDTH_3_2);
        -- Stage 2
        sum_3_2 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(2) <= saturate(sum_3_2, 8);
  end block;

  -- LAYER 3, ch 3
  gen_l3c3 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_3;
  signal sum_3_3 : sum_t_3_3;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_3.mem") port map (clk, out2_0_reg, act_3_0_3);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_3.mem") port map (clk, out2_1_reg, act_3_1_3);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_3.mem") port map (clk, out2_2_reg, act_3_2_3);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_3.mem") port map (clk, out2_3_reg, act_3_3_3);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_3.mem") port map (clk, out2_4_reg, act_3_4_3);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_3.mem") port map (clk, out2_5_reg, act_3_5_3);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_3.mem") port map (clk, out2_6_reg, act_3_6_3);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_3.mem") port map (clk, out2_7_reg, act_3_7_3);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_3.mem") port map (clk, out2_8_reg, act_3_8_3);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_3.mem") port map (clk, out2_9_reg, act_3_9_3);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_3.mem") port map (clk, out2_10_reg, act_3_10_3);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_3.mem") port map (clk, out2_11_reg, act_3_11_3);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_3.mem") port map (clk, out2_12_reg, act_3_12_3);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_3.mem") port map (clk, out2_13_reg, act_3_13_3);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_3.mem") port map (clk, out2_14_reg, act_3_14_3);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_3.mem") port map (clk, out2_15_reg, act_3_15_3);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_3, SUM_WIDTH_3_3) + resize(act_3_1_3, SUM_WIDTH_3_3) + resize(act_3_2_3, SUM_WIDTH_3_3) + resize(act_3_3_3, SUM_WIDTH_3_3);
        s1_1 <= resize(act_3_4_3, SUM_WIDTH_3_3) + resize(act_3_5_3, SUM_WIDTH_3_3) + resize(act_3_6_3, SUM_WIDTH_3_3) + resize(act_3_7_3, SUM_WIDTH_3_3);
        s1_2 <= resize(act_3_8_3, SUM_WIDTH_3_3) + resize(act_3_9_3, SUM_WIDTH_3_3) + resize(act_3_10_3, SUM_WIDTH_3_3) + resize(act_3_11_3, SUM_WIDTH_3_3);
        s1_3 <= resize(act_3_12_3, SUM_WIDTH_3_3) + resize(act_3_13_3, SUM_WIDTH_3_3) + resize(act_3_14_3, SUM_WIDTH_3_3) + resize(act_3_15_3, SUM_WIDTH_3_3);
        -- Stage 2
        sum_3_3 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(3) <= saturate(sum_3_3, 8);
  end block;

  -- LAYER 3, ch 4
  gen_l3c4 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_4;
  signal sum_3_4 : sum_t_3_4;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_4.mem") port map (clk, out2_0_reg, act_3_0_4);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_4.mem") port map (clk, out2_1_reg, act_3_1_4);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_4.mem") port map (clk, out2_2_reg, act_3_2_4);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_4.mem") port map (clk, out2_3_reg, act_3_3_4);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_4.mem") port map (clk, out2_4_reg, act_3_4_4);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_4.mem") port map (clk, out2_5_reg, act_3_5_4);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_4.mem") port map (clk, out2_6_reg, act_3_6_4);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_4.mem") port map (clk, out2_7_reg, act_3_7_4);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_4.mem") port map (clk, out2_8_reg, act_3_8_4);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_4.mem") port map (clk, out2_9_reg, act_3_9_4);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_4.mem") port map (clk, out2_10_reg, act_3_10_4);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_4.mem") port map (clk, out2_11_reg, act_3_11_4);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_4.mem") port map (clk, out2_12_reg, act_3_12_4);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_4.mem") port map (clk, out2_13_reg, act_3_13_4);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_4.mem") port map (clk, out2_14_reg, act_3_14_4);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_4.mem") port map (clk, out2_15_reg, act_3_15_4);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_4, SUM_WIDTH_3_4) + resize(act_3_1_4, SUM_WIDTH_3_4) + resize(act_3_2_4, SUM_WIDTH_3_4) + resize(act_3_3_4, SUM_WIDTH_3_4);
        s1_1 <= resize(act_3_4_4, SUM_WIDTH_3_4) + resize(act_3_5_4, SUM_WIDTH_3_4) + resize(act_3_6_4, SUM_WIDTH_3_4) + resize(act_3_7_4, SUM_WIDTH_3_4);
        s1_2 <= resize(act_3_8_4, SUM_WIDTH_3_4) + resize(act_3_9_4, SUM_WIDTH_3_4) + resize(act_3_10_4, SUM_WIDTH_3_4) + resize(act_3_11_4, SUM_WIDTH_3_4);
        s1_3 <= resize(act_3_12_4, SUM_WIDTH_3_4) + resize(act_3_13_4, SUM_WIDTH_3_4) + resize(act_3_14_4, SUM_WIDTH_3_4) + resize(act_3_15_4, SUM_WIDTH_3_4);
        -- Stage 2
        sum_3_4 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(4) <= saturate(sum_3_4, 8);
  end block;

  -- LAYER 3, ch 5
  gen_l3c5 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_5;
  signal sum_3_5 : sum_t_3_5;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_5.mem") port map (clk, out2_0_reg, act_3_0_5);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_5.mem") port map (clk, out2_1_reg, act_3_1_5);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_5.mem") port map (clk, out2_2_reg, act_3_2_5);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_5.mem") port map (clk, out2_3_reg, act_3_3_5);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_5.mem") port map (clk, out2_4_reg, act_3_4_5);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_5.mem") port map (clk, out2_5_reg, act_3_5_5);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_5.mem") port map (clk, out2_6_reg, act_3_6_5);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_5.mem") port map (clk, out2_7_reg, act_3_7_5);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_5.mem") port map (clk, out2_8_reg, act_3_8_5);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_5.mem") port map (clk, out2_9_reg, act_3_9_5);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_5.mem") port map (clk, out2_10_reg, act_3_10_5);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_5.mem") port map (clk, out2_11_reg, act_3_11_5);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_5.mem") port map (clk, out2_12_reg, act_3_12_5);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_5.mem") port map (clk, out2_13_reg, act_3_13_5);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_5.mem") port map (clk, out2_14_reg, act_3_14_5);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_5.mem") port map (clk, out2_15_reg, act_3_15_5);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_5, SUM_WIDTH_3_5) + resize(act_3_1_5, SUM_WIDTH_3_5) + resize(act_3_2_5, SUM_WIDTH_3_5) + resize(act_3_3_5, SUM_WIDTH_3_5);
        s1_1 <= resize(act_3_4_5, SUM_WIDTH_3_5) + resize(act_3_5_5, SUM_WIDTH_3_5) + resize(act_3_6_5, SUM_WIDTH_3_5) + resize(act_3_7_5, SUM_WIDTH_3_5);
        s1_2 <= resize(act_3_8_5, SUM_WIDTH_3_5) + resize(act_3_9_5, SUM_WIDTH_3_5) + resize(act_3_10_5, SUM_WIDTH_3_5) + resize(act_3_11_5, SUM_WIDTH_3_5);
        s1_3 <= resize(act_3_12_5, SUM_WIDTH_3_5) + resize(act_3_13_5, SUM_WIDTH_3_5) + resize(act_3_14_5, SUM_WIDTH_3_5) + resize(act_3_15_5, SUM_WIDTH_3_5);
        -- Stage 2
        sum_3_5 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(5) <= saturate(sum_3_5, 8);
  end block;

  -- LAYER 3, ch 6
  gen_l3c6 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_6;
  signal sum_3_6 : sum_t_3_6;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_6.mem") port map (clk, out2_0_reg, act_3_0_6);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_6.mem") port map (clk, out2_1_reg, act_3_1_6);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_6.mem") port map (clk, out2_2_reg, act_3_2_6);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_6.mem") port map (clk, out2_3_reg, act_3_3_6);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_6.mem") port map (clk, out2_4_reg, act_3_4_6);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_6.mem") port map (clk, out2_5_reg, act_3_5_6);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_6.mem") port map (clk, out2_6_reg, act_3_6_6);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_6.mem") port map (clk, out2_7_reg, act_3_7_6);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_6.mem") port map (clk, out2_8_reg, act_3_8_6);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_6.mem") port map (clk, out2_9_reg, act_3_9_6);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_6.mem") port map (clk, out2_10_reg, act_3_10_6);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_6.mem") port map (clk, out2_11_reg, act_3_11_6);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_6.mem") port map (clk, out2_12_reg, act_3_12_6);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_6.mem") port map (clk, out2_13_reg, act_3_13_6);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_6.mem") port map (clk, out2_14_reg, act_3_14_6);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_6.mem") port map (clk, out2_15_reg, act_3_15_6);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_6, SUM_WIDTH_3_6) + resize(act_3_1_6, SUM_WIDTH_3_6) + resize(act_3_2_6, SUM_WIDTH_3_6) + resize(act_3_3_6, SUM_WIDTH_3_6);
        s1_1 <= resize(act_3_4_6, SUM_WIDTH_3_6) + resize(act_3_5_6, SUM_WIDTH_3_6) + resize(act_3_6_6, SUM_WIDTH_3_6) + resize(act_3_7_6, SUM_WIDTH_3_6);
        s1_2 <= resize(act_3_8_6, SUM_WIDTH_3_6) + resize(act_3_9_6, SUM_WIDTH_3_6) + resize(act_3_10_6, SUM_WIDTH_3_6) + resize(act_3_11_6, SUM_WIDTH_3_6);
        s1_3 <= resize(act_3_12_6, SUM_WIDTH_3_6) + resize(act_3_13_6, SUM_WIDTH_3_6) + resize(act_3_14_6, SUM_WIDTH_3_6) + resize(act_3_15_6, SUM_WIDTH_3_6);
        -- Stage 2
        sum_3_6 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(6) <= saturate(sum_3_6, 8);
  end block;

  -- LAYER 3, ch 7
  gen_l3c7 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_7;
  signal sum_3_7 : sum_t_3_7;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_7.mem") port map (clk, out2_0_reg, act_3_0_7);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_7.mem") port map (clk, out2_1_reg, act_3_1_7);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_7.mem") port map (clk, out2_2_reg, act_3_2_7);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_7.mem") port map (clk, out2_3_reg, act_3_3_7);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_7.mem") port map (clk, out2_4_reg, act_3_4_7);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_7.mem") port map (clk, out2_5_reg, act_3_5_7);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_7.mem") port map (clk, out2_6_reg, act_3_6_7);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_7.mem") port map (clk, out2_7_reg, act_3_7_7);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_7.mem") port map (clk, out2_8_reg, act_3_8_7);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_7.mem") port map (clk, out2_9_reg, act_3_9_7);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_7.mem") port map (clk, out2_10_reg, act_3_10_7);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_7.mem") port map (clk, out2_11_reg, act_3_11_7);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_7.mem") port map (clk, out2_12_reg, act_3_12_7);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_7.mem") port map (clk, out2_13_reg, act_3_13_7);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_7.mem") port map (clk, out2_14_reg, act_3_14_7);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_7.mem") port map (clk, out2_15_reg, act_3_15_7);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_7, SUM_WIDTH_3_7) + resize(act_3_1_7, SUM_WIDTH_3_7) + resize(act_3_2_7, SUM_WIDTH_3_7) + resize(act_3_3_7, SUM_WIDTH_3_7);
        s1_1 <= resize(act_3_4_7, SUM_WIDTH_3_7) + resize(act_3_5_7, SUM_WIDTH_3_7) + resize(act_3_6_7, SUM_WIDTH_3_7) + resize(act_3_7_7, SUM_WIDTH_3_7);
        s1_2 <= resize(act_3_8_7, SUM_WIDTH_3_7) + resize(act_3_9_7, SUM_WIDTH_3_7) + resize(act_3_10_7, SUM_WIDTH_3_7) + resize(act_3_11_7, SUM_WIDTH_3_7);
        s1_3 <= resize(act_3_12_7, SUM_WIDTH_3_7) + resize(act_3_13_7, SUM_WIDTH_3_7) + resize(act_3_14_7, SUM_WIDTH_3_7) + resize(act_3_15_7, SUM_WIDTH_3_7);
        -- Stage 2
        sum_3_7 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(7) <= saturate(sum_3_7, 8);
  end block;

  -- LAYER 3, ch 8
  gen_l3c8 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_8;
  signal sum_3_8 : sum_t_3_8;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_8.mem") port map (clk, out2_0_reg, act_3_0_8);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_8.mem") port map (clk, out2_1_reg, act_3_1_8);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_8.mem") port map (clk, out2_2_reg, act_3_2_8);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_8.mem") port map (clk, out2_3_reg, act_3_3_8);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_8.mem") port map (clk, out2_4_reg, act_3_4_8);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_8.mem") port map (clk, out2_5_reg, act_3_5_8);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_8.mem") port map (clk, out2_6_reg, act_3_6_8);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_8.mem") port map (clk, out2_7_reg, act_3_7_8);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_8.mem") port map (clk, out2_8_reg, act_3_8_8);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_8.mem") port map (clk, out2_9_reg, act_3_9_8);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_8.mem") port map (clk, out2_10_reg, act_3_10_8);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_8.mem") port map (clk, out2_11_reg, act_3_11_8);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_8.mem") port map (clk, out2_12_reg, act_3_12_8);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_8.mem") port map (clk, out2_13_reg, act_3_13_8);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_8.mem") port map (clk, out2_14_reg, act_3_14_8);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_8.mem") port map (clk, out2_15_reg, act_3_15_8);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_8, SUM_WIDTH_3_8) + resize(act_3_1_8, SUM_WIDTH_3_8) + resize(act_3_2_8, SUM_WIDTH_3_8) + resize(act_3_3_8, SUM_WIDTH_3_8);
        s1_1 <= resize(act_3_4_8, SUM_WIDTH_3_8) + resize(act_3_5_8, SUM_WIDTH_3_8) + resize(act_3_6_8, SUM_WIDTH_3_8) + resize(act_3_7_8, SUM_WIDTH_3_8);
        s1_2 <= resize(act_3_8_8, SUM_WIDTH_3_8) + resize(act_3_9_8, SUM_WIDTH_3_8) + resize(act_3_10_8, SUM_WIDTH_3_8) + resize(act_3_11_8, SUM_WIDTH_3_8);
        s1_3 <= resize(act_3_12_8, SUM_WIDTH_3_8) + resize(act_3_13_8, SUM_WIDTH_3_8) + resize(act_3_14_8, SUM_WIDTH_3_8) + resize(act_3_15_8, SUM_WIDTH_3_8);
        -- Stage 2
        sum_3_8 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(8) <= saturate(sum_3_8, 8);
  end block;

  -- LAYER 3, ch 9
  gen_l3c9 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_9;
  signal sum_3_9 : sum_t_3_9;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_9.mem") port map (clk, out2_0_reg, act_3_0_9);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_9.mem") port map (clk, out2_1_reg, act_3_1_9);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_9.mem") port map (clk, out2_2_reg, act_3_2_9);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_9.mem") port map (clk, out2_3_reg, act_3_3_9);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_9.mem") port map (clk, out2_4_reg, act_3_4_9);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_9.mem") port map (clk, out2_5_reg, act_3_5_9);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_9.mem") port map (clk, out2_6_reg, act_3_6_9);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_9.mem") port map (clk, out2_7_reg, act_3_7_9);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_9.mem") port map (clk, out2_8_reg, act_3_8_9);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_9.mem") port map (clk, out2_9_reg, act_3_9_9);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_9.mem") port map (clk, out2_10_reg, act_3_10_9);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_9.mem") port map (clk, out2_11_reg, act_3_11_9);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_9.mem") port map (clk, out2_12_reg, act_3_12_9);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_9.mem") port map (clk, out2_13_reg, act_3_13_9);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_9.mem") port map (clk, out2_14_reg, act_3_14_9);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_9.mem") port map (clk, out2_15_reg, act_3_15_9);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_9, SUM_WIDTH_3_9) + resize(act_3_1_9, SUM_WIDTH_3_9) + resize(act_3_2_9, SUM_WIDTH_3_9) + resize(act_3_3_9, SUM_WIDTH_3_9);
        s1_1 <= resize(act_3_4_9, SUM_WIDTH_3_9) + resize(act_3_5_9, SUM_WIDTH_3_9) + resize(act_3_6_9, SUM_WIDTH_3_9) + resize(act_3_7_9, SUM_WIDTH_3_9);
        s1_2 <= resize(act_3_8_9, SUM_WIDTH_3_9) + resize(act_3_9_9, SUM_WIDTH_3_9) + resize(act_3_10_9, SUM_WIDTH_3_9) + resize(act_3_11_9, SUM_WIDTH_3_9);
        s1_3 <= resize(act_3_12_9, SUM_WIDTH_3_9) + resize(act_3_13_9, SUM_WIDTH_3_9) + resize(act_3_14_9, SUM_WIDTH_3_9) + resize(act_3_15_9, SUM_WIDTH_3_9);
        -- Stage 2
        sum_3_9 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(9) <= saturate(sum_3_9, 8);
  end block;

  -- LAYER 3, ch 10
  gen_l3c10 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_10;
  signal sum_3_10 : sum_t_3_10;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_10.mem") port map (clk, out2_0_reg, act_3_0_10);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_10.mem") port map (clk, out2_1_reg, act_3_1_10);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_10.mem") port map (clk, out2_2_reg, act_3_2_10);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_10.mem") port map (clk, out2_3_reg, act_3_3_10);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_10.mem") port map (clk, out2_4_reg, act_3_4_10);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_10.mem") port map (clk, out2_5_reg, act_3_5_10);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_10.mem") port map (clk, out2_6_reg, act_3_6_10);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_10.mem") port map (clk, out2_7_reg, act_3_7_10);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_10.mem") port map (clk, out2_8_reg, act_3_8_10);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_10.mem") port map (clk, out2_9_reg, act_3_9_10);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_10.mem") port map (clk, out2_10_reg, act_3_10_10);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_10.mem") port map (clk, out2_11_reg, act_3_11_10);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_10.mem") port map (clk, out2_12_reg, act_3_12_10);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_10.mem") port map (clk, out2_13_reg, act_3_13_10);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_10.mem") port map (clk, out2_14_reg, act_3_14_10);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_10.mem") port map (clk, out2_15_reg, act_3_15_10);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_10, SUM_WIDTH_3_10) + resize(act_3_1_10, SUM_WIDTH_3_10) + resize(act_3_2_10, SUM_WIDTH_3_10) + resize(act_3_3_10, SUM_WIDTH_3_10);
        s1_1 <= resize(act_3_4_10, SUM_WIDTH_3_10) + resize(act_3_5_10, SUM_WIDTH_3_10) + resize(act_3_6_10, SUM_WIDTH_3_10) + resize(act_3_7_10, SUM_WIDTH_3_10);
        s1_2 <= resize(act_3_8_10, SUM_WIDTH_3_10) + resize(act_3_9_10, SUM_WIDTH_3_10) + resize(act_3_10_10, SUM_WIDTH_3_10) + resize(act_3_11_10, SUM_WIDTH_3_10);
        s1_3 <= resize(act_3_12_10, SUM_WIDTH_3_10) + resize(act_3_13_10, SUM_WIDTH_3_10) + resize(act_3_14_10, SUM_WIDTH_3_10) + resize(act_3_15_10, SUM_WIDTH_3_10);
        -- Stage 2
        sum_3_10 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(10) <= saturate(sum_3_10, 8);
  end block;

  -- LAYER 3, ch 11
  gen_l3c11 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_11;
  signal sum_3_11 : sum_t_3_11;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_11.mem") port map (clk, out2_0_reg, act_3_0_11);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_11.mem") port map (clk, out2_1_reg, act_3_1_11);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_11.mem") port map (clk, out2_2_reg, act_3_2_11);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_11.mem") port map (clk, out2_3_reg, act_3_3_11);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_11.mem") port map (clk, out2_4_reg, act_3_4_11);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_11.mem") port map (clk, out2_5_reg, act_3_5_11);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_11.mem") port map (clk, out2_6_reg, act_3_6_11);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_11.mem") port map (clk, out2_7_reg, act_3_7_11);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_11.mem") port map (clk, out2_8_reg, act_3_8_11);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_11.mem") port map (clk, out2_9_reg, act_3_9_11);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_11.mem") port map (clk, out2_10_reg, act_3_10_11);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_11.mem") port map (clk, out2_11_reg, act_3_11_11);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_11.mem") port map (clk, out2_12_reg, act_3_12_11);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_11.mem") port map (clk, out2_13_reg, act_3_13_11);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_11.mem") port map (clk, out2_14_reg, act_3_14_11);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_11.mem") port map (clk, out2_15_reg, act_3_15_11);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_11, SUM_WIDTH_3_11) + resize(act_3_1_11, SUM_WIDTH_3_11) + resize(act_3_2_11, SUM_WIDTH_3_11) + resize(act_3_3_11, SUM_WIDTH_3_11);
        s1_1 <= resize(act_3_4_11, SUM_WIDTH_3_11) + resize(act_3_5_11, SUM_WIDTH_3_11) + resize(act_3_6_11, SUM_WIDTH_3_11) + resize(act_3_7_11, SUM_WIDTH_3_11);
        s1_2 <= resize(act_3_8_11, SUM_WIDTH_3_11) + resize(act_3_9_11, SUM_WIDTH_3_11) + resize(act_3_10_11, SUM_WIDTH_3_11) + resize(act_3_11_11, SUM_WIDTH_3_11);
        s1_3 <= resize(act_3_12_11, SUM_WIDTH_3_11) + resize(act_3_13_11, SUM_WIDTH_3_11) + resize(act_3_14_11, SUM_WIDTH_3_11) + resize(act_3_15_11, SUM_WIDTH_3_11);
        -- Stage 2
        sum_3_11 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(11) <= saturate(sum_3_11, 8);
  end block;

  -- LAYER 3, ch 12
  gen_l3c12 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_12;
  signal sum_3_12 : sum_t_3_12;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_12.mem") port map (clk, out2_0_reg, act_3_0_12);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_12.mem") port map (clk, out2_1_reg, act_3_1_12);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_12.mem") port map (clk, out2_2_reg, act_3_2_12);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_12.mem") port map (clk, out2_3_reg, act_3_3_12);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_12.mem") port map (clk, out2_4_reg, act_3_4_12);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_12.mem") port map (clk, out2_5_reg, act_3_5_12);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_12.mem") port map (clk, out2_6_reg, act_3_6_12);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_12.mem") port map (clk, out2_7_reg, act_3_7_12);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_12.mem") port map (clk, out2_8_reg, act_3_8_12);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_12.mem") port map (clk, out2_9_reg, act_3_9_12);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_12.mem") port map (clk, out2_10_reg, act_3_10_12);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_12.mem") port map (clk, out2_11_reg, act_3_11_12);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_12.mem") port map (clk, out2_12_reg, act_3_12_12);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_12.mem") port map (clk, out2_13_reg, act_3_13_12);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_12.mem") port map (clk, out2_14_reg, act_3_14_12);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_12.mem") port map (clk, out2_15_reg, act_3_15_12);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_12, SUM_WIDTH_3_12) + resize(act_3_1_12, SUM_WIDTH_3_12) + resize(act_3_2_12, SUM_WIDTH_3_12) + resize(act_3_3_12, SUM_WIDTH_3_12);
        s1_1 <= resize(act_3_4_12, SUM_WIDTH_3_12) + resize(act_3_5_12, SUM_WIDTH_3_12) + resize(act_3_6_12, SUM_WIDTH_3_12) + resize(act_3_7_12, SUM_WIDTH_3_12);
        s1_2 <= resize(act_3_8_12, SUM_WIDTH_3_12) + resize(act_3_9_12, SUM_WIDTH_3_12) + resize(act_3_10_12, SUM_WIDTH_3_12) + resize(act_3_11_12, SUM_WIDTH_3_12);
        s1_3 <= resize(act_3_12_12, SUM_WIDTH_3_12) + resize(act_3_13_12, SUM_WIDTH_3_12) + resize(act_3_14_12, SUM_WIDTH_3_12) + resize(act_3_15_12, SUM_WIDTH_3_12);
        -- Stage 2
        sum_3_12 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(12) <= saturate(sum_3_12, 8);
  end block;

  -- LAYER 3, ch 13
  gen_l3c13 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_13;
  signal sum_3_13 : sum_t_3_13;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_13.mem") port map (clk, out2_0_reg, act_3_0_13);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_13.mem") port map (clk, out2_1_reg, act_3_1_13);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_13.mem") port map (clk, out2_2_reg, act_3_2_13);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_13.mem") port map (clk, out2_3_reg, act_3_3_13);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_13.mem") port map (clk, out2_4_reg, act_3_4_13);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_13.mem") port map (clk, out2_5_reg, act_3_5_13);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_13.mem") port map (clk, out2_6_reg, act_3_6_13);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_13.mem") port map (clk, out2_7_reg, act_3_7_13);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_13.mem") port map (clk, out2_8_reg, act_3_8_13);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_13.mem") port map (clk, out2_9_reg, act_3_9_13);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_13.mem") port map (clk, out2_10_reg, act_3_10_13);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_13.mem") port map (clk, out2_11_reg, act_3_11_13);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_13.mem") port map (clk, out2_12_reg, act_3_12_13);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_13.mem") port map (clk, out2_13_reg, act_3_13_13);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_13.mem") port map (clk, out2_14_reg, act_3_14_13);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_13.mem") port map (clk, out2_15_reg, act_3_15_13);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_13, SUM_WIDTH_3_13) + resize(act_3_1_13, SUM_WIDTH_3_13) + resize(act_3_2_13, SUM_WIDTH_3_13) + resize(act_3_3_13, SUM_WIDTH_3_13);
        s1_1 <= resize(act_3_4_13, SUM_WIDTH_3_13) + resize(act_3_5_13, SUM_WIDTH_3_13) + resize(act_3_6_13, SUM_WIDTH_3_13) + resize(act_3_7_13, SUM_WIDTH_3_13);
        s1_2 <= resize(act_3_8_13, SUM_WIDTH_3_13) + resize(act_3_9_13, SUM_WIDTH_3_13) + resize(act_3_10_13, SUM_WIDTH_3_13) + resize(act_3_11_13, SUM_WIDTH_3_13);
        s1_3 <= resize(act_3_12_13, SUM_WIDTH_3_13) + resize(act_3_13_13, SUM_WIDTH_3_13) + resize(act_3_14_13, SUM_WIDTH_3_13) + resize(act_3_15_13, SUM_WIDTH_3_13);
        -- Stage 2
        sum_3_13 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(13) <= saturate(sum_3_13, 8);
  end block;

  -- LAYER 3, ch 14
  gen_l3c14 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_14;
  signal sum_3_14 : sum_t_3_14;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_14.mem") port map (clk, out2_0_reg, act_3_0_14);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_14.mem") port map (clk, out2_1_reg, act_3_1_14);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_14.mem") port map (clk, out2_2_reg, act_3_2_14);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_14.mem") port map (clk, out2_3_reg, act_3_3_14);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_14.mem") port map (clk, out2_4_reg, act_3_4_14);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_14.mem") port map (clk, out2_5_reg, act_3_5_14);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_14.mem") port map (clk, out2_6_reg, act_3_6_14);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_14.mem") port map (clk, out2_7_reg, act_3_7_14);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_14.mem") port map (clk, out2_8_reg, act_3_8_14);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_14.mem") port map (clk, out2_9_reg, act_3_9_14);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_14.mem") port map (clk, out2_10_reg, act_3_10_14);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_14.mem") port map (clk, out2_11_reg, act_3_11_14);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_14.mem") port map (clk, out2_12_reg, act_3_12_14);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_14.mem") port map (clk, out2_13_reg, act_3_13_14);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_14.mem") port map (clk, out2_14_reg, act_3_14_14);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_14.mem") port map (clk, out2_15_reg, act_3_15_14);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_14, SUM_WIDTH_3_14) + resize(act_3_1_14, SUM_WIDTH_3_14) + resize(act_3_2_14, SUM_WIDTH_3_14) + resize(act_3_3_14, SUM_WIDTH_3_14);
        s1_1 <= resize(act_3_4_14, SUM_WIDTH_3_14) + resize(act_3_5_14, SUM_WIDTH_3_14) + resize(act_3_6_14, SUM_WIDTH_3_14) + resize(act_3_7_14, SUM_WIDTH_3_14);
        s1_2 <= resize(act_3_8_14, SUM_WIDTH_3_14) + resize(act_3_9_14, SUM_WIDTH_3_14) + resize(act_3_10_14, SUM_WIDTH_3_14) + resize(act_3_11_14, SUM_WIDTH_3_14);
        s1_3 <= resize(act_3_12_14, SUM_WIDTH_3_14) + resize(act_3_13_14, SUM_WIDTH_3_14) + resize(act_3_14_14, SUM_WIDTH_3_14) + resize(act_3_15_14, SUM_WIDTH_3_14);
        -- Stage 2
        sum_3_14 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(14) <= saturate(sum_3_14, 8);
  end block;

  -- LAYER 3, ch 15
  gen_l3c15 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_15;
  signal sum_3_15 : sum_t_3_15;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_15.mem") port map (clk, out2_0_reg, act_3_0_15);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_15.mem") port map (clk, out2_1_reg, act_3_1_15);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_15.mem") port map (clk, out2_2_reg, act_3_2_15);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_15.mem") port map (clk, out2_3_reg, act_3_3_15);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_15.mem") port map (clk, out2_4_reg, act_3_4_15);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_15.mem") port map (clk, out2_5_reg, act_3_5_15);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_15.mem") port map (clk, out2_6_reg, act_3_6_15);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_15.mem") port map (clk, out2_7_reg, act_3_7_15);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_15.mem") port map (clk, out2_8_reg, act_3_8_15);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_15.mem") port map (clk, out2_9_reg, act_3_9_15);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_15.mem") port map (clk, out2_10_reg, act_3_10_15);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_15.mem") port map (clk, out2_11_reg, act_3_11_15);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_15.mem") port map (clk, out2_12_reg, act_3_12_15);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_15.mem") port map (clk, out2_13_reg, act_3_13_15);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_15.mem") port map (clk, out2_14_reg, act_3_14_15);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_15.mem") port map (clk, out2_15_reg, act_3_15_15);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_15, SUM_WIDTH_3_15) + resize(act_3_1_15, SUM_WIDTH_3_15) + resize(act_3_2_15, SUM_WIDTH_3_15) + resize(act_3_3_15, SUM_WIDTH_3_15);
        s1_1 <= resize(act_3_4_15, SUM_WIDTH_3_15) + resize(act_3_5_15, SUM_WIDTH_3_15) + resize(act_3_6_15, SUM_WIDTH_3_15) + resize(act_3_7_15, SUM_WIDTH_3_15);
        s1_2 <= resize(act_3_8_15, SUM_WIDTH_3_15) + resize(act_3_9_15, SUM_WIDTH_3_15) + resize(act_3_10_15, SUM_WIDTH_3_15) + resize(act_3_11_15, SUM_WIDTH_3_15);
        s1_3 <= resize(act_3_12_15, SUM_WIDTH_3_15) + resize(act_3_13_15, SUM_WIDTH_3_15) + resize(act_3_14_15, SUM_WIDTH_3_15) + resize(act_3_15_15, SUM_WIDTH_3_15);
        -- Stage 2
        sum_3_15 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(15) <= saturate(sum_3_15, 8);
  end block;

  -- LAYER 3, ch 16
  gen_l3c16 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_16;
  signal sum_3_16 : sum_t_3_16;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_16.mem") port map (clk, out2_0_reg, act_3_0_16);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_16.mem") port map (clk, out2_1_reg, act_3_1_16);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_16.mem") port map (clk, out2_2_reg, act_3_2_16);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_16.mem") port map (clk, out2_3_reg, act_3_3_16);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_16.mem") port map (clk, out2_4_reg, act_3_4_16);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_16.mem") port map (clk, out2_5_reg, act_3_5_16);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_16.mem") port map (clk, out2_6_reg, act_3_6_16);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_16.mem") port map (clk, out2_7_reg, act_3_7_16);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_16.mem") port map (clk, out2_8_reg, act_3_8_16);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_16.mem") port map (clk, out2_9_reg, act_3_9_16);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_16.mem") port map (clk, out2_10_reg, act_3_10_16);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_16.mem") port map (clk, out2_11_reg, act_3_11_16);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_16.mem") port map (clk, out2_12_reg, act_3_12_16);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_16.mem") port map (clk, out2_13_reg, act_3_13_16);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_16.mem") port map (clk, out2_14_reg, act_3_14_16);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_16.mem") port map (clk, out2_15_reg, act_3_15_16);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_16, SUM_WIDTH_3_16) + resize(act_3_1_16, SUM_WIDTH_3_16) + resize(act_3_2_16, SUM_WIDTH_3_16) + resize(act_3_3_16, SUM_WIDTH_3_16);
        s1_1 <= resize(act_3_4_16, SUM_WIDTH_3_16) + resize(act_3_5_16, SUM_WIDTH_3_16) + resize(act_3_6_16, SUM_WIDTH_3_16) + resize(act_3_7_16, SUM_WIDTH_3_16);
        s1_2 <= resize(act_3_8_16, SUM_WIDTH_3_16) + resize(act_3_9_16, SUM_WIDTH_3_16) + resize(act_3_10_16, SUM_WIDTH_3_16) + resize(act_3_11_16, SUM_WIDTH_3_16);
        s1_3 <= resize(act_3_12_16, SUM_WIDTH_3_16) + resize(act_3_13_16, SUM_WIDTH_3_16) + resize(act_3_14_16, SUM_WIDTH_3_16) + resize(act_3_15_16, SUM_WIDTH_3_16);
        -- Stage 2
        sum_3_16 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(16) <= saturate(sum_3_16, 8);
  end block;

  -- LAYER 3, ch 17
  gen_l3c17 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_17;
  signal sum_3_17 : sum_t_3_17;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_17.mem") port map (clk, out2_0_reg, act_3_0_17);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_17.mem") port map (clk, out2_1_reg, act_3_1_17);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_17.mem") port map (clk, out2_2_reg, act_3_2_17);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_17.mem") port map (clk, out2_3_reg, act_3_3_17);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_17.mem") port map (clk, out2_4_reg, act_3_4_17);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_17.mem") port map (clk, out2_5_reg, act_3_5_17);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_17.mem") port map (clk, out2_6_reg, act_3_6_17);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_17.mem") port map (clk, out2_7_reg, act_3_7_17);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_17.mem") port map (clk, out2_8_reg, act_3_8_17);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_17.mem") port map (clk, out2_9_reg, act_3_9_17);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_17.mem") port map (clk, out2_10_reg, act_3_10_17);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_17.mem") port map (clk, out2_11_reg, act_3_11_17);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_17.mem") port map (clk, out2_12_reg, act_3_12_17);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_17.mem") port map (clk, out2_13_reg, act_3_13_17);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_17.mem") port map (clk, out2_14_reg, act_3_14_17);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_17.mem") port map (clk, out2_15_reg, act_3_15_17);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_17, SUM_WIDTH_3_17) + resize(act_3_1_17, SUM_WIDTH_3_17) + resize(act_3_2_17, SUM_WIDTH_3_17) + resize(act_3_3_17, SUM_WIDTH_3_17);
        s1_1 <= resize(act_3_4_17, SUM_WIDTH_3_17) + resize(act_3_5_17, SUM_WIDTH_3_17) + resize(act_3_6_17, SUM_WIDTH_3_17) + resize(act_3_7_17, SUM_WIDTH_3_17);
        s1_2 <= resize(act_3_8_17, SUM_WIDTH_3_17) + resize(act_3_9_17, SUM_WIDTH_3_17) + resize(act_3_10_17, SUM_WIDTH_3_17) + resize(act_3_11_17, SUM_WIDTH_3_17);
        s1_3 <= resize(act_3_12_17, SUM_WIDTH_3_17) + resize(act_3_13_17, SUM_WIDTH_3_17) + resize(act_3_14_17, SUM_WIDTH_3_17) + resize(act_3_15_17, SUM_WIDTH_3_17);
        -- Stage 2
        sum_3_17 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(17) <= saturate(sum_3_17, 8);
  end block;

  -- LAYER 3, ch 18
  gen_l3c18 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_18;
  signal sum_3_18 : sum_t_3_18;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_18.mem") port map (clk, out2_0_reg, act_3_0_18);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_18.mem") port map (clk, out2_1_reg, act_3_1_18);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_18.mem") port map (clk, out2_2_reg, act_3_2_18);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_18.mem") port map (clk, out2_3_reg, act_3_3_18);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_18.mem") port map (clk, out2_4_reg, act_3_4_18);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_18.mem") port map (clk, out2_5_reg, act_3_5_18);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_18.mem") port map (clk, out2_6_reg, act_3_6_18);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_18.mem") port map (clk, out2_7_reg, act_3_7_18);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_18.mem") port map (clk, out2_8_reg, act_3_8_18);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_18.mem") port map (clk, out2_9_reg, act_3_9_18);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_18.mem") port map (clk, out2_10_reg, act_3_10_18);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_18.mem") port map (clk, out2_11_reg, act_3_11_18);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_18.mem") port map (clk, out2_12_reg, act_3_12_18);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_18.mem") port map (clk, out2_13_reg, act_3_13_18);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_18.mem") port map (clk, out2_14_reg, act_3_14_18);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_18.mem") port map (clk, out2_15_reg, act_3_15_18);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_18, SUM_WIDTH_3_18) + resize(act_3_1_18, SUM_WIDTH_3_18) + resize(act_3_2_18, SUM_WIDTH_3_18) + resize(act_3_3_18, SUM_WIDTH_3_18);
        s1_1 <= resize(act_3_4_18, SUM_WIDTH_3_18) + resize(act_3_5_18, SUM_WIDTH_3_18) + resize(act_3_6_18, SUM_WIDTH_3_18) + resize(act_3_7_18, SUM_WIDTH_3_18);
        s1_2 <= resize(act_3_8_18, SUM_WIDTH_3_18) + resize(act_3_9_18, SUM_WIDTH_3_18) + resize(act_3_10_18, SUM_WIDTH_3_18) + resize(act_3_11_18, SUM_WIDTH_3_18);
        s1_3 <= resize(act_3_12_18, SUM_WIDTH_3_18) + resize(act_3_13_18, SUM_WIDTH_3_18) + resize(act_3_14_18, SUM_WIDTH_3_18) + resize(act_3_15_18, SUM_WIDTH_3_18);
        -- Stage 2
        sum_3_18 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(18) <= saturate(sum_3_18, 8);
  end block;

  -- LAYER 3, ch 19
  gen_l3c19 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_19;
  signal sum_3_19 : sum_t_3_19;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_19.mem") port map (clk, out2_0_reg, act_3_0_19);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_19.mem") port map (clk, out2_1_reg, act_3_1_19);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_19.mem") port map (clk, out2_2_reg, act_3_2_19);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_19.mem") port map (clk, out2_3_reg, act_3_3_19);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_19.mem") port map (clk, out2_4_reg, act_3_4_19);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_19.mem") port map (clk, out2_5_reg, act_3_5_19);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_19.mem") port map (clk, out2_6_reg, act_3_6_19);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_19.mem") port map (clk, out2_7_reg, act_3_7_19);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_19.mem") port map (clk, out2_8_reg, act_3_8_19);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_19.mem") port map (clk, out2_9_reg, act_3_9_19);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_19.mem") port map (clk, out2_10_reg, act_3_10_19);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_19.mem") port map (clk, out2_11_reg, act_3_11_19);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_19.mem") port map (clk, out2_12_reg, act_3_12_19);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_19.mem") port map (clk, out2_13_reg, act_3_13_19);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_19.mem") port map (clk, out2_14_reg, act_3_14_19);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_19.mem") port map (clk, out2_15_reg, act_3_15_19);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_19, SUM_WIDTH_3_19) + resize(act_3_1_19, SUM_WIDTH_3_19) + resize(act_3_2_19, SUM_WIDTH_3_19) + resize(act_3_3_19, SUM_WIDTH_3_19);
        s1_1 <= resize(act_3_4_19, SUM_WIDTH_3_19) + resize(act_3_5_19, SUM_WIDTH_3_19) + resize(act_3_6_19, SUM_WIDTH_3_19) + resize(act_3_7_19, SUM_WIDTH_3_19);
        s1_2 <= resize(act_3_8_19, SUM_WIDTH_3_19) + resize(act_3_9_19, SUM_WIDTH_3_19) + resize(act_3_10_19, SUM_WIDTH_3_19) + resize(act_3_11_19, SUM_WIDTH_3_19);
        s1_3 <= resize(act_3_12_19, SUM_WIDTH_3_19) + resize(act_3_13_19, SUM_WIDTH_3_19) + resize(act_3_14_19, SUM_WIDTH_3_19) + resize(act_3_15_19, SUM_WIDTH_3_19);
        -- Stage 2
        sum_3_19 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(19) <= saturate(sum_3_19, 8);
  end block;

  -- LAYER 3, ch 20
  gen_l3c20 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_20;
  signal sum_3_20 : sum_t_3_20;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_20.mem") port map (clk, out2_0_reg, act_3_0_20);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_20.mem") port map (clk, out2_1_reg, act_3_1_20);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_20.mem") port map (clk, out2_2_reg, act_3_2_20);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_20.mem") port map (clk, out2_3_reg, act_3_3_20);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_20.mem") port map (clk, out2_4_reg, act_3_4_20);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_20.mem") port map (clk, out2_5_reg, act_3_5_20);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_20.mem") port map (clk, out2_6_reg, act_3_6_20);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_20.mem") port map (clk, out2_7_reg, act_3_7_20);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_20.mem") port map (clk, out2_8_reg, act_3_8_20);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_20.mem") port map (clk, out2_9_reg, act_3_9_20);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_20.mem") port map (clk, out2_10_reg, act_3_10_20);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_20.mem") port map (clk, out2_11_reg, act_3_11_20);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_20.mem") port map (clk, out2_12_reg, act_3_12_20);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_20.mem") port map (clk, out2_13_reg, act_3_13_20);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_20.mem") port map (clk, out2_14_reg, act_3_14_20);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_20.mem") port map (clk, out2_15_reg, act_3_15_20);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_20, SUM_WIDTH_3_20) + resize(act_3_1_20, SUM_WIDTH_3_20) + resize(act_3_2_20, SUM_WIDTH_3_20) + resize(act_3_3_20, SUM_WIDTH_3_20);
        s1_1 <= resize(act_3_4_20, SUM_WIDTH_3_20) + resize(act_3_5_20, SUM_WIDTH_3_20) + resize(act_3_6_20, SUM_WIDTH_3_20) + resize(act_3_7_20, SUM_WIDTH_3_20);
        s1_2 <= resize(act_3_8_20, SUM_WIDTH_3_20) + resize(act_3_9_20, SUM_WIDTH_3_20) + resize(act_3_10_20, SUM_WIDTH_3_20) + resize(act_3_11_20, SUM_WIDTH_3_20);
        s1_3 <= resize(act_3_12_20, SUM_WIDTH_3_20) + resize(act_3_13_20, SUM_WIDTH_3_20) + resize(act_3_14_20, SUM_WIDTH_3_20) + resize(act_3_15_20, SUM_WIDTH_3_20);
        -- Stage 2
        sum_3_20 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(20) <= saturate(sum_3_20, 8);
  end block;

  -- LAYER 3, ch 21
  gen_l3c21 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_21;
  signal sum_3_21 : sum_t_3_21;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_21.mem") port map (clk, out2_0_reg, act_3_0_21);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_21.mem") port map (clk, out2_1_reg, act_3_1_21);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_21.mem") port map (clk, out2_2_reg, act_3_2_21);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_21.mem") port map (clk, out2_3_reg, act_3_3_21);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_21.mem") port map (clk, out2_4_reg, act_3_4_21);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_21.mem") port map (clk, out2_5_reg, act_3_5_21);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_21.mem") port map (clk, out2_6_reg, act_3_6_21);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_21.mem") port map (clk, out2_7_reg, act_3_7_21);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_21.mem") port map (clk, out2_8_reg, act_3_8_21);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_21.mem") port map (clk, out2_9_reg, act_3_9_21);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_21.mem") port map (clk, out2_10_reg, act_3_10_21);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_21.mem") port map (clk, out2_11_reg, act_3_11_21);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_21.mem") port map (clk, out2_12_reg, act_3_12_21);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_21.mem") port map (clk, out2_13_reg, act_3_13_21);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_21.mem") port map (clk, out2_14_reg, act_3_14_21);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_21.mem") port map (clk, out2_15_reg, act_3_15_21);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_21, SUM_WIDTH_3_21) + resize(act_3_1_21, SUM_WIDTH_3_21) + resize(act_3_2_21, SUM_WIDTH_3_21) + resize(act_3_3_21, SUM_WIDTH_3_21);
        s1_1 <= resize(act_3_4_21, SUM_WIDTH_3_21) + resize(act_3_5_21, SUM_WIDTH_3_21) + resize(act_3_6_21, SUM_WIDTH_3_21) + resize(act_3_7_21, SUM_WIDTH_3_21);
        s1_2 <= resize(act_3_8_21, SUM_WIDTH_3_21) + resize(act_3_9_21, SUM_WIDTH_3_21) + resize(act_3_10_21, SUM_WIDTH_3_21) + resize(act_3_11_21, SUM_WIDTH_3_21);
        s1_3 <= resize(act_3_12_21, SUM_WIDTH_3_21) + resize(act_3_13_21, SUM_WIDTH_3_21) + resize(act_3_14_21, SUM_WIDTH_3_21) + resize(act_3_15_21, SUM_WIDTH_3_21);
        -- Stage 2
        sum_3_21 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(21) <= saturate(sum_3_21, 8);
  end block;

  -- LAYER 3, ch 22
  gen_l3c22 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_22;
  signal sum_3_22 : sum_t_3_22;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_22.mem") port map (clk, out2_0_reg, act_3_0_22);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_22.mem") port map (clk, out2_1_reg, act_3_1_22);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_22.mem") port map (clk, out2_2_reg, act_3_2_22);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_22.mem") port map (clk, out2_3_reg, act_3_3_22);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_22.mem") port map (clk, out2_4_reg, act_3_4_22);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_22.mem") port map (clk, out2_5_reg, act_3_5_22);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_22.mem") port map (clk, out2_6_reg, act_3_6_22);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_22.mem") port map (clk, out2_7_reg, act_3_7_22);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_22.mem") port map (clk, out2_8_reg, act_3_8_22);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_22.mem") port map (clk, out2_9_reg, act_3_9_22);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_22.mem") port map (clk, out2_10_reg, act_3_10_22);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_22.mem") port map (clk, out2_11_reg, act_3_11_22);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_22.mem") port map (clk, out2_12_reg, act_3_12_22);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_22.mem") port map (clk, out2_13_reg, act_3_13_22);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_22.mem") port map (clk, out2_14_reg, act_3_14_22);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_22.mem") port map (clk, out2_15_reg, act_3_15_22);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_22, SUM_WIDTH_3_22) + resize(act_3_1_22, SUM_WIDTH_3_22) + resize(act_3_2_22, SUM_WIDTH_3_22) + resize(act_3_3_22, SUM_WIDTH_3_22);
        s1_1 <= resize(act_3_4_22, SUM_WIDTH_3_22) + resize(act_3_5_22, SUM_WIDTH_3_22) + resize(act_3_6_22, SUM_WIDTH_3_22) + resize(act_3_7_22, SUM_WIDTH_3_22);
        s1_2 <= resize(act_3_8_22, SUM_WIDTH_3_22) + resize(act_3_9_22, SUM_WIDTH_3_22) + resize(act_3_10_22, SUM_WIDTH_3_22) + resize(act_3_11_22, SUM_WIDTH_3_22);
        s1_3 <= resize(act_3_12_22, SUM_WIDTH_3_22) + resize(act_3_13_22, SUM_WIDTH_3_22) + resize(act_3_14_22, SUM_WIDTH_3_22) + resize(act_3_15_22, SUM_WIDTH_3_22);
        -- Stage 2
        sum_3_22 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(22) <= saturate(sum_3_22, 8);
  end block;

  -- LAYER 3, ch 23
  gen_l3c23 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_23;
  signal sum_3_23 : sum_t_3_23;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_23.mem") port map (clk, out2_0_reg, act_3_0_23);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_23.mem") port map (clk, out2_1_reg, act_3_1_23);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_23.mem") port map (clk, out2_2_reg, act_3_2_23);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_23.mem") port map (clk, out2_3_reg, act_3_3_23);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_23.mem") port map (clk, out2_4_reg, act_3_4_23);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_23.mem") port map (clk, out2_5_reg, act_3_5_23);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_23.mem") port map (clk, out2_6_reg, act_3_6_23);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_23.mem") port map (clk, out2_7_reg, act_3_7_23);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_23.mem") port map (clk, out2_8_reg, act_3_8_23);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_23.mem") port map (clk, out2_9_reg, act_3_9_23);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_23.mem") port map (clk, out2_10_reg, act_3_10_23);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_23.mem") port map (clk, out2_11_reg, act_3_11_23);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_23.mem") port map (clk, out2_12_reg, act_3_12_23);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_23.mem") port map (clk, out2_13_reg, act_3_13_23);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_23.mem") port map (clk, out2_14_reg, act_3_14_23);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_23.mem") port map (clk, out2_15_reg, act_3_15_23);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_23, SUM_WIDTH_3_23) + resize(act_3_1_23, SUM_WIDTH_3_23) + resize(act_3_2_23, SUM_WIDTH_3_23) + resize(act_3_3_23, SUM_WIDTH_3_23);
        s1_1 <= resize(act_3_4_23, SUM_WIDTH_3_23) + resize(act_3_5_23, SUM_WIDTH_3_23) + resize(act_3_6_23, SUM_WIDTH_3_23) + resize(act_3_7_23, SUM_WIDTH_3_23);
        s1_2 <= resize(act_3_8_23, SUM_WIDTH_3_23) + resize(act_3_9_23, SUM_WIDTH_3_23) + resize(act_3_10_23, SUM_WIDTH_3_23) + resize(act_3_11_23, SUM_WIDTH_3_23);
        s1_3 <= resize(act_3_12_23, SUM_WIDTH_3_23) + resize(act_3_13_23, SUM_WIDTH_3_23) + resize(act_3_14_23, SUM_WIDTH_3_23) + resize(act_3_15_23, SUM_WIDTH_3_23);
        -- Stage 2
        sum_3_23 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(23) <= saturate(sum_3_23, 8);
  end block;

  -- LAYER 3, ch 24
  gen_l3c24 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_24;
  signal sum_3_24 : sum_t_3_24;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_24.mem") port map (clk, out2_0_reg, act_3_0_24);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_24.mem") port map (clk, out2_1_reg, act_3_1_24);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_24.mem") port map (clk, out2_2_reg, act_3_2_24);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_24.mem") port map (clk, out2_3_reg, act_3_3_24);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_24.mem") port map (clk, out2_4_reg, act_3_4_24);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_24.mem") port map (clk, out2_5_reg, act_3_5_24);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_24.mem") port map (clk, out2_6_reg, act_3_6_24);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_24.mem") port map (clk, out2_7_reg, act_3_7_24);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_24.mem") port map (clk, out2_8_reg, act_3_8_24);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_24.mem") port map (clk, out2_9_reg, act_3_9_24);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_24.mem") port map (clk, out2_10_reg, act_3_10_24);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_24.mem") port map (clk, out2_11_reg, act_3_11_24);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_24.mem") port map (clk, out2_12_reg, act_3_12_24);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_24.mem") port map (clk, out2_13_reg, act_3_13_24);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_24.mem") port map (clk, out2_14_reg, act_3_14_24);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_24.mem") port map (clk, out2_15_reg, act_3_15_24);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_24, SUM_WIDTH_3_24) + resize(act_3_1_24, SUM_WIDTH_3_24) + resize(act_3_2_24, SUM_WIDTH_3_24) + resize(act_3_3_24, SUM_WIDTH_3_24);
        s1_1 <= resize(act_3_4_24, SUM_WIDTH_3_24) + resize(act_3_5_24, SUM_WIDTH_3_24) + resize(act_3_6_24, SUM_WIDTH_3_24) + resize(act_3_7_24, SUM_WIDTH_3_24);
        s1_2 <= resize(act_3_8_24, SUM_WIDTH_3_24) + resize(act_3_9_24, SUM_WIDTH_3_24) + resize(act_3_10_24, SUM_WIDTH_3_24) + resize(act_3_11_24, SUM_WIDTH_3_24);
        s1_3 <= resize(act_3_12_24, SUM_WIDTH_3_24) + resize(act_3_13_24, SUM_WIDTH_3_24) + resize(act_3_14_24, SUM_WIDTH_3_24) + resize(act_3_15_24, SUM_WIDTH_3_24);
        -- Stage 2
        sum_3_24 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(24) <= saturate(sum_3_24, 8);
  end block;

  -- LAYER 3, ch 25
  gen_l3c25 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_25;
  signal sum_3_25 : sum_t_3_25;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_25.mem") port map (clk, out2_0_reg, act_3_0_25);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_25.mem") port map (clk, out2_1_reg, act_3_1_25);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_25.mem") port map (clk, out2_2_reg, act_3_2_25);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_25.mem") port map (clk, out2_3_reg, act_3_3_25);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_25.mem") port map (clk, out2_4_reg, act_3_4_25);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_25.mem") port map (clk, out2_5_reg, act_3_5_25);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_25.mem") port map (clk, out2_6_reg, act_3_6_25);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_25.mem") port map (clk, out2_7_reg, act_3_7_25);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_25.mem") port map (clk, out2_8_reg, act_3_8_25);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_25.mem") port map (clk, out2_9_reg, act_3_9_25);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_25.mem") port map (clk, out2_10_reg, act_3_10_25);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_25.mem") port map (clk, out2_11_reg, act_3_11_25);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_25.mem") port map (clk, out2_12_reg, act_3_12_25);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_25.mem") port map (clk, out2_13_reg, act_3_13_25);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_25.mem") port map (clk, out2_14_reg, act_3_14_25);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_25.mem") port map (clk, out2_15_reg, act_3_15_25);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_25, SUM_WIDTH_3_25) + resize(act_3_1_25, SUM_WIDTH_3_25) + resize(act_3_2_25, SUM_WIDTH_3_25) + resize(act_3_3_25, SUM_WIDTH_3_25);
        s1_1 <= resize(act_3_4_25, SUM_WIDTH_3_25) + resize(act_3_5_25, SUM_WIDTH_3_25) + resize(act_3_6_25, SUM_WIDTH_3_25) + resize(act_3_7_25, SUM_WIDTH_3_25);
        s1_2 <= resize(act_3_8_25, SUM_WIDTH_3_25) + resize(act_3_9_25, SUM_WIDTH_3_25) + resize(act_3_10_25, SUM_WIDTH_3_25) + resize(act_3_11_25, SUM_WIDTH_3_25);
        s1_3 <= resize(act_3_12_25, SUM_WIDTH_3_25) + resize(act_3_13_25, SUM_WIDTH_3_25) + resize(act_3_14_25, SUM_WIDTH_3_25) + resize(act_3_15_25, SUM_WIDTH_3_25);
        -- Stage 2
        sum_3_25 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(25) <= saturate(sum_3_25, 8);
  end block;

  -- LAYER 3, ch 26
  gen_l3c26 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_26;
  signal sum_3_26 : sum_t_3_26;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_26.mem") port map (clk, out2_0_reg, act_3_0_26);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_26.mem") port map (clk, out2_1_reg, act_3_1_26);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_26.mem") port map (clk, out2_2_reg, act_3_2_26);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_26.mem") port map (clk, out2_3_reg, act_3_3_26);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_26.mem") port map (clk, out2_4_reg, act_3_4_26);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_26.mem") port map (clk, out2_5_reg, act_3_5_26);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_26.mem") port map (clk, out2_6_reg, act_3_6_26);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_26.mem") port map (clk, out2_7_reg, act_3_7_26);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_26.mem") port map (clk, out2_8_reg, act_3_8_26);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_26.mem") port map (clk, out2_9_reg, act_3_9_26);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_26.mem") port map (clk, out2_10_reg, act_3_10_26);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_26.mem") port map (clk, out2_11_reg, act_3_11_26);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_26.mem") port map (clk, out2_12_reg, act_3_12_26);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_26.mem") port map (clk, out2_13_reg, act_3_13_26);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_26.mem") port map (clk, out2_14_reg, act_3_14_26);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_26.mem") port map (clk, out2_15_reg, act_3_15_26);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_26, SUM_WIDTH_3_26) + resize(act_3_1_26, SUM_WIDTH_3_26) + resize(act_3_2_26, SUM_WIDTH_3_26) + resize(act_3_3_26, SUM_WIDTH_3_26);
        s1_1 <= resize(act_3_4_26, SUM_WIDTH_3_26) + resize(act_3_5_26, SUM_WIDTH_3_26) + resize(act_3_6_26, SUM_WIDTH_3_26) + resize(act_3_7_26, SUM_WIDTH_3_26);
        s1_2 <= resize(act_3_8_26, SUM_WIDTH_3_26) + resize(act_3_9_26, SUM_WIDTH_3_26) + resize(act_3_10_26, SUM_WIDTH_3_26) + resize(act_3_11_26, SUM_WIDTH_3_26);
        s1_3 <= resize(act_3_12_26, SUM_WIDTH_3_26) + resize(act_3_13_26, SUM_WIDTH_3_26) + resize(act_3_14_26, SUM_WIDTH_3_26) + resize(act_3_15_26, SUM_WIDTH_3_26);
        -- Stage 2
        sum_3_26 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(26) <= saturate(sum_3_26, 8);
  end block;

  -- LAYER 3, ch 27
  gen_l3c27 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_27;
  signal sum_3_27 : sum_t_3_27;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_27.mem") port map (clk, out2_0_reg, act_3_0_27);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_27.mem") port map (clk, out2_1_reg, act_3_1_27);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_27.mem") port map (clk, out2_2_reg, act_3_2_27);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_27.mem") port map (clk, out2_3_reg, act_3_3_27);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_27.mem") port map (clk, out2_4_reg, act_3_4_27);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_27.mem") port map (clk, out2_5_reg, act_3_5_27);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_27.mem") port map (clk, out2_6_reg, act_3_6_27);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_27.mem") port map (clk, out2_7_reg, act_3_7_27);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_27.mem") port map (clk, out2_8_reg, act_3_8_27);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_27.mem") port map (clk, out2_9_reg, act_3_9_27);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_27.mem") port map (clk, out2_10_reg, act_3_10_27);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_27.mem") port map (clk, out2_11_reg, act_3_11_27);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_27.mem") port map (clk, out2_12_reg, act_3_12_27);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_27.mem") port map (clk, out2_13_reg, act_3_13_27);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_27.mem") port map (clk, out2_14_reg, act_3_14_27);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_27.mem") port map (clk, out2_15_reg, act_3_15_27);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_27, SUM_WIDTH_3_27) + resize(act_3_1_27, SUM_WIDTH_3_27) + resize(act_3_2_27, SUM_WIDTH_3_27) + resize(act_3_3_27, SUM_WIDTH_3_27);
        s1_1 <= resize(act_3_4_27, SUM_WIDTH_3_27) + resize(act_3_5_27, SUM_WIDTH_3_27) + resize(act_3_6_27, SUM_WIDTH_3_27) + resize(act_3_7_27, SUM_WIDTH_3_27);
        s1_2 <= resize(act_3_8_27, SUM_WIDTH_3_27) + resize(act_3_9_27, SUM_WIDTH_3_27) + resize(act_3_10_27, SUM_WIDTH_3_27) + resize(act_3_11_27, SUM_WIDTH_3_27);
        s1_3 <= resize(act_3_12_27, SUM_WIDTH_3_27) + resize(act_3_13_27, SUM_WIDTH_3_27) + resize(act_3_14_27, SUM_WIDTH_3_27) + resize(act_3_15_27, SUM_WIDTH_3_27);
        -- Stage 2
        sum_3_27 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(27) <= saturate(sum_3_27, 8);
  end block;

  -- LAYER 3, ch 28
  gen_l3c28 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_28;
  signal sum_3_28 : sum_t_3_28;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_28.mem") port map (clk, out2_0_reg, act_3_0_28);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_28.mem") port map (clk, out2_1_reg, act_3_1_28);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_28.mem") port map (clk, out2_2_reg, act_3_2_28);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_28.mem") port map (clk, out2_3_reg, act_3_3_28);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_28.mem") port map (clk, out2_4_reg, act_3_4_28);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_28.mem") port map (clk, out2_5_reg, act_3_5_28);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_28.mem") port map (clk, out2_6_reg, act_3_6_28);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_28.mem") port map (clk, out2_7_reg, act_3_7_28);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_28.mem") port map (clk, out2_8_reg, act_3_8_28);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_28.mem") port map (clk, out2_9_reg, act_3_9_28);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_28.mem") port map (clk, out2_10_reg, act_3_10_28);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_28.mem") port map (clk, out2_11_reg, act_3_11_28);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_28.mem") port map (clk, out2_12_reg, act_3_12_28);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_28.mem") port map (clk, out2_13_reg, act_3_13_28);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_28.mem") port map (clk, out2_14_reg, act_3_14_28);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_28.mem") port map (clk, out2_15_reg, act_3_15_28);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_28, SUM_WIDTH_3_28) + resize(act_3_1_28, SUM_WIDTH_3_28) + resize(act_3_2_28, SUM_WIDTH_3_28) + resize(act_3_3_28, SUM_WIDTH_3_28);
        s1_1 <= resize(act_3_4_28, SUM_WIDTH_3_28) + resize(act_3_5_28, SUM_WIDTH_3_28) + resize(act_3_6_28, SUM_WIDTH_3_28) + resize(act_3_7_28, SUM_WIDTH_3_28);
        s1_2 <= resize(act_3_8_28, SUM_WIDTH_3_28) + resize(act_3_9_28, SUM_WIDTH_3_28) + resize(act_3_10_28, SUM_WIDTH_3_28) + resize(act_3_11_28, SUM_WIDTH_3_28);
        s1_3 <= resize(act_3_12_28, SUM_WIDTH_3_28) + resize(act_3_13_28, SUM_WIDTH_3_28) + resize(act_3_14_28, SUM_WIDTH_3_28) + resize(act_3_15_28, SUM_WIDTH_3_28);
        -- Stage 2
        sum_3_28 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(28) <= saturate(sum_3_28, 8);
  end block;

  -- LAYER 3, ch 29
  gen_l3c29 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_29;
  signal sum_3_29 : sum_t_3_29;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_29.mem") port map (clk, out2_0_reg, act_3_0_29);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_29.mem") port map (clk, out2_1_reg, act_3_1_29);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_29.mem") port map (clk, out2_2_reg, act_3_2_29);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_29.mem") port map (clk, out2_3_reg, act_3_3_29);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_29.mem") port map (clk, out2_4_reg, act_3_4_29);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_29.mem") port map (clk, out2_5_reg, act_3_5_29);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_29.mem") port map (clk, out2_6_reg, act_3_6_29);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_29.mem") port map (clk, out2_7_reg, act_3_7_29);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_29.mem") port map (clk, out2_8_reg, act_3_8_29);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_29.mem") port map (clk, out2_9_reg, act_3_9_29);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_29.mem") port map (clk, out2_10_reg, act_3_10_29);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_29.mem") port map (clk, out2_11_reg, act_3_11_29);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_29.mem") port map (clk, out2_12_reg, act_3_12_29);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_29.mem") port map (clk, out2_13_reg, act_3_13_29);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_29.mem") port map (clk, out2_14_reg, act_3_14_29);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_29.mem") port map (clk, out2_15_reg, act_3_15_29);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_29, SUM_WIDTH_3_29) + resize(act_3_1_29, SUM_WIDTH_3_29) + resize(act_3_2_29, SUM_WIDTH_3_29) + resize(act_3_3_29, SUM_WIDTH_3_29);
        s1_1 <= resize(act_3_4_29, SUM_WIDTH_3_29) + resize(act_3_5_29, SUM_WIDTH_3_29) + resize(act_3_6_29, SUM_WIDTH_3_29) + resize(act_3_7_29, SUM_WIDTH_3_29);
        s1_2 <= resize(act_3_8_29, SUM_WIDTH_3_29) + resize(act_3_9_29, SUM_WIDTH_3_29) + resize(act_3_10_29, SUM_WIDTH_3_29) + resize(act_3_11_29, SUM_WIDTH_3_29);
        s1_3 <= resize(act_3_12_29, SUM_WIDTH_3_29) + resize(act_3_13_29, SUM_WIDTH_3_29) + resize(act_3_14_29, SUM_WIDTH_3_29) + resize(act_3_15_29, SUM_WIDTH_3_29);
        -- Stage 2
        sum_3_29 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(29) <= saturate(sum_3_29, 8);
  end block;

  -- LAYER 3, ch 30
  gen_l3c30 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_30;
  signal sum_3_30 : sum_t_3_30;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_30.mem") port map (clk, out2_0_reg, act_3_0_30);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_30.mem") port map (clk, out2_1_reg, act_3_1_30);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_30.mem") port map (clk, out2_2_reg, act_3_2_30);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_30.mem") port map (clk, out2_3_reg, act_3_3_30);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_30.mem") port map (clk, out2_4_reg, act_3_4_30);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_30.mem") port map (clk, out2_5_reg, act_3_5_30);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_30.mem") port map (clk, out2_6_reg, act_3_6_30);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_30.mem") port map (clk, out2_7_reg, act_3_7_30);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_30.mem") port map (clk, out2_8_reg, act_3_8_30);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_30.mem") port map (clk, out2_9_reg, act_3_9_30);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_30.mem") port map (clk, out2_10_reg, act_3_10_30);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_30.mem") port map (clk, out2_11_reg, act_3_11_30);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_30.mem") port map (clk, out2_12_reg, act_3_12_30);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_30.mem") port map (clk, out2_13_reg, act_3_13_30);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_30.mem") port map (clk, out2_14_reg, act_3_14_30);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_30.mem") port map (clk, out2_15_reg, act_3_15_30);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_30, SUM_WIDTH_3_30) + resize(act_3_1_30, SUM_WIDTH_3_30) + resize(act_3_2_30, SUM_WIDTH_3_30) + resize(act_3_3_30, SUM_WIDTH_3_30);
        s1_1 <= resize(act_3_4_30, SUM_WIDTH_3_30) + resize(act_3_5_30, SUM_WIDTH_3_30) + resize(act_3_6_30, SUM_WIDTH_3_30) + resize(act_3_7_30, SUM_WIDTH_3_30);
        s1_2 <= resize(act_3_8_30, SUM_WIDTH_3_30) + resize(act_3_9_30, SUM_WIDTH_3_30) + resize(act_3_10_30, SUM_WIDTH_3_30) + resize(act_3_11_30, SUM_WIDTH_3_30);
        s1_3 <= resize(act_3_12_30, SUM_WIDTH_3_30) + resize(act_3_13_30, SUM_WIDTH_3_30) + resize(act_3_14_30, SUM_WIDTH_3_30) + resize(act_3_15_30, SUM_WIDTH_3_30);
        -- Stage 2
        sum_3_30 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(30) <= saturate(sum_3_30, 8);
  end block;

  -- LAYER 3, ch 31
  gen_l3c31 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_31;
  signal sum_3_31 : sum_t_3_31;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_31.mem") port map (clk, out2_0_reg, act_3_0_31);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_31.mem") port map (clk, out2_1_reg, act_3_1_31);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_31.mem") port map (clk, out2_2_reg, act_3_2_31);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_31.mem") port map (clk, out2_3_reg, act_3_3_31);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_31.mem") port map (clk, out2_4_reg, act_3_4_31);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_31.mem") port map (clk, out2_5_reg, act_3_5_31);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_31.mem") port map (clk, out2_6_reg, act_3_6_31);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_31.mem") port map (clk, out2_7_reg, act_3_7_31);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_31.mem") port map (clk, out2_8_reg, act_3_8_31);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_31.mem") port map (clk, out2_9_reg, act_3_9_31);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_31.mem") port map (clk, out2_10_reg, act_3_10_31);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_31.mem") port map (clk, out2_11_reg, act_3_11_31);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_31.mem") port map (clk, out2_12_reg, act_3_12_31);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_31.mem") port map (clk, out2_13_reg, act_3_13_31);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_31.mem") port map (clk, out2_14_reg, act_3_14_31);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_31.mem") port map (clk, out2_15_reg, act_3_15_31);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_31, SUM_WIDTH_3_31) + resize(act_3_1_31, SUM_WIDTH_3_31) + resize(act_3_2_31, SUM_WIDTH_3_31) + resize(act_3_3_31, SUM_WIDTH_3_31);
        s1_1 <= resize(act_3_4_31, SUM_WIDTH_3_31) + resize(act_3_5_31, SUM_WIDTH_3_31) + resize(act_3_6_31, SUM_WIDTH_3_31) + resize(act_3_7_31, SUM_WIDTH_3_31);
        s1_2 <= resize(act_3_8_31, SUM_WIDTH_3_31) + resize(act_3_9_31, SUM_WIDTH_3_31) + resize(act_3_10_31, SUM_WIDTH_3_31) + resize(act_3_11_31, SUM_WIDTH_3_31);
        s1_3 <= resize(act_3_12_31, SUM_WIDTH_3_31) + resize(act_3_13_31, SUM_WIDTH_3_31) + resize(act_3_14_31, SUM_WIDTH_3_31) + resize(act_3_15_31, SUM_WIDTH_3_31);
        -- Stage 2
        sum_3_31 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(31) <= saturate(sum_3_31, 8);
  end block;

  -- LAYER 3, ch 32
  gen_l3c32 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_32;
  signal sum_3_32 : sum_t_3_32;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_32.mem") port map (clk, out2_0_reg, act_3_0_32);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_32.mem") port map (clk, out2_1_reg, act_3_1_32);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_32.mem") port map (clk, out2_2_reg, act_3_2_32);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_32.mem") port map (clk, out2_3_reg, act_3_3_32);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_32.mem") port map (clk, out2_4_reg, act_3_4_32);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_32.mem") port map (clk, out2_5_reg, act_3_5_32);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_32.mem") port map (clk, out2_6_reg, act_3_6_32);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_32.mem") port map (clk, out2_7_reg, act_3_7_32);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_32.mem") port map (clk, out2_8_reg, act_3_8_32);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_32.mem") port map (clk, out2_9_reg, act_3_9_32);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_32.mem") port map (clk, out2_10_reg, act_3_10_32);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_32.mem") port map (clk, out2_11_reg, act_3_11_32);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_32.mem") port map (clk, out2_12_reg, act_3_12_32);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_32.mem") port map (clk, out2_13_reg, act_3_13_32);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_32.mem") port map (clk, out2_14_reg, act_3_14_32);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_32.mem") port map (clk, out2_15_reg, act_3_15_32);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_32, SUM_WIDTH_3_32) + resize(act_3_1_32, SUM_WIDTH_3_32) + resize(act_3_2_32, SUM_WIDTH_3_32) + resize(act_3_3_32, SUM_WIDTH_3_32);
        s1_1 <= resize(act_3_4_32, SUM_WIDTH_3_32) + resize(act_3_5_32, SUM_WIDTH_3_32) + resize(act_3_6_32, SUM_WIDTH_3_32) + resize(act_3_7_32, SUM_WIDTH_3_32);
        s1_2 <= resize(act_3_8_32, SUM_WIDTH_3_32) + resize(act_3_9_32, SUM_WIDTH_3_32) + resize(act_3_10_32, SUM_WIDTH_3_32) + resize(act_3_11_32, SUM_WIDTH_3_32);
        s1_3 <= resize(act_3_12_32, SUM_WIDTH_3_32) + resize(act_3_13_32, SUM_WIDTH_3_32) + resize(act_3_14_32, SUM_WIDTH_3_32) + resize(act_3_15_32, SUM_WIDTH_3_32);
        -- Stage 2
        sum_3_32 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(32) <= saturate(sum_3_32, 8);
  end block;

  -- LAYER 3, ch 33
  gen_l3c33 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_33;
  signal sum_3_33 : sum_t_3_33;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_33.mem") port map (clk, out2_0_reg, act_3_0_33);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_33.mem") port map (clk, out2_1_reg, act_3_1_33);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_33.mem") port map (clk, out2_2_reg, act_3_2_33);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_33.mem") port map (clk, out2_3_reg, act_3_3_33);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_33.mem") port map (clk, out2_4_reg, act_3_4_33);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_33.mem") port map (clk, out2_5_reg, act_3_5_33);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_33.mem") port map (clk, out2_6_reg, act_3_6_33);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_33.mem") port map (clk, out2_7_reg, act_3_7_33);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_33.mem") port map (clk, out2_8_reg, act_3_8_33);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_33.mem") port map (clk, out2_9_reg, act_3_9_33);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_33.mem") port map (clk, out2_10_reg, act_3_10_33);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_33.mem") port map (clk, out2_11_reg, act_3_11_33);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_33.mem") port map (clk, out2_12_reg, act_3_12_33);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_33.mem") port map (clk, out2_13_reg, act_3_13_33);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_33.mem") port map (clk, out2_14_reg, act_3_14_33);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_33.mem") port map (clk, out2_15_reg, act_3_15_33);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_33, SUM_WIDTH_3_33) + resize(act_3_1_33, SUM_WIDTH_3_33) + resize(act_3_2_33, SUM_WIDTH_3_33) + resize(act_3_3_33, SUM_WIDTH_3_33);
        s1_1 <= resize(act_3_4_33, SUM_WIDTH_3_33) + resize(act_3_5_33, SUM_WIDTH_3_33) + resize(act_3_6_33, SUM_WIDTH_3_33) + resize(act_3_7_33, SUM_WIDTH_3_33);
        s1_2 <= resize(act_3_8_33, SUM_WIDTH_3_33) + resize(act_3_9_33, SUM_WIDTH_3_33) + resize(act_3_10_33, SUM_WIDTH_3_33) + resize(act_3_11_33, SUM_WIDTH_3_33);
        s1_3 <= resize(act_3_12_33, SUM_WIDTH_3_33) + resize(act_3_13_33, SUM_WIDTH_3_33) + resize(act_3_14_33, SUM_WIDTH_3_33) + resize(act_3_15_33, SUM_WIDTH_3_33);
        -- Stage 2
        sum_3_33 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(33) <= saturate(sum_3_33, 8);
  end block;

  -- LAYER 3, ch 34
  gen_l3c34 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_34;
  signal sum_3_34 : sum_t_3_34;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_34.mem") port map (clk, out2_0_reg, act_3_0_34);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_34.mem") port map (clk, out2_1_reg, act_3_1_34);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_34.mem") port map (clk, out2_2_reg, act_3_2_34);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_34.mem") port map (clk, out2_3_reg, act_3_3_34);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_34.mem") port map (clk, out2_4_reg, act_3_4_34);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_34.mem") port map (clk, out2_5_reg, act_3_5_34);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_34.mem") port map (clk, out2_6_reg, act_3_6_34);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_34.mem") port map (clk, out2_7_reg, act_3_7_34);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_34.mem") port map (clk, out2_8_reg, act_3_8_34);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_34.mem") port map (clk, out2_9_reg, act_3_9_34);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_34.mem") port map (clk, out2_10_reg, act_3_10_34);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_34.mem") port map (clk, out2_11_reg, act_3_11_34);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_34.mem") port map (clk, out2_12_reg, act_3_12_34);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_34.mem") port map (clk, out2_13_reg, act_3_13_34);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_34.mem") port map (clk, out2_14_reg, act_3_14_34);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_34.mem") port map (clk, out2_15_reg, act_3_15_34);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_34, SUM_WIDTH_3_34) + resize(act_3_1_34, SUM_WIDTH_3_34) + resize(act_3_2_34, SUM_WIDTH_3_34) + resize(act_3_3_34, SUM_WIDTH_3_34);
        s1_1 <= resize(act_3_4_34, SUM_WIDTH_3_34) + resize(act_3_5_34, SUM_WIDTH_3_34) + resize(act_3_6_34, SUM_WIDTH_3_34) + resize(act_3_7_34, SUM_WIDTH_3_34);
        s1_2 <= resize(act_3_8_34, SUM_WIDTH_3_34) + resize(act_3_9_34, SUM_WIDTH_3_34) + resize(act_3_10_34, SUM_WIDTH_3_34) + resize(act_3_11_34, SUM_WIDTH_3_34);
        s1_3 <= resize(act_3_12_34, SUM_WIDTH_3_34) + resize(act_3_13_34, SUM_WIDTH_3_34) + resize(act_3_14_34, SUM_WIDTH_3_34) + resize(act_3_15_34, SUM_WIDTH_3_34);
        -- Stage 2
        sum_3_34 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(34) <= saturate(sum_3_34, 8);
  end block;

  -- LAYER 3, ch 35
  gen_l3c35 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_35;
  signal sum_3_35 : sum_t_3_35;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_35.mem") port map (clk, out2_0_reg, act_3_0_35);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_35.mem") port map (clk, out2_1_reg, act_3_1_35);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_35.mem") port map (clk, out2_2_reg, act_3_2_35);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_35.mem") port map (clk, out2_3_reg, act_3_3_35);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_35.mem") port map (clk, out2_4_reg, act_3_4_35);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_35.mem") port map (clk, out2_5_reg, act_3_5_35);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_35.mem") port map (clk, out2_6_reg, act_3_6_35);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_35.mem") port map (clk, out2_7_reg, act_3_7_35);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_35.mem") port map (clk, out2_8_reg, act_3_8_35);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_35.mem") port map (clk, out2_9_reg, act_3_9_35);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_35.mem") port map (clk, out2_10_reg, act_3_10_35);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_35.mem") port map (clk, out2_11_reg, act_3_11_35);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_35.mem") port map (clk, out2_12_reg, act_3_12_35);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_35.mem") port map (clk, out2_13_reg, act_3_13_35);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_35.mem") port map (clk, out2_14_reg, act_3_14_35);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_35.mem") port map (clk, out2_15_reg, act_3_15_35);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_35, SUM_WIDTH_3_35) + resize(act_3_1_35, SUM_WIDTH_3_35) + resize(act_3_2_35, SUM_WIDTH_3_35) + resize(act_3_3_35, SUM_WIDTH_3_35);
        s1_1 <= resize(act_3_4_35, SUM_WIDTH_3_35) + resize(act_3_5_35, SUM_WIDTH_3_35) + resize(act_3_6_35, SUM_WIDTH_3_35) + resize(act_3_7_35, SUM_WIDTH_3_35);
        s1_2 <= resize(act_3_8_35, SUM_WIDTH_3_35) + resize(act_3_9_35, SUM_WIDTH_3_35) + resize(act_3_10_35, SUM_WIDTH_3_35) + resize(act_3_11_35, SUM_WIDTH_3_35);
        s1_3 <= resize(act_3_12_35, SUM_WIDTH_3_35) + resize(act_3_13_35, SUM_WIDTH_3_35) + resize(act_3_14_35, SUM_WIDTH_3_35) + resize(act_3_15_35, SUM_WIDTH_3_35);
        -- Stage 2
        sum_3_35 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(35) <= saturate(sum_3_35, 8);
  end block;

  -- LAYER 3, ch 36
  gen_l3c36 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_36;
  signal sum_3_36 : sum_t_3_36;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_36.mem") port map (clk, out2_0_reg, act_3_0_36);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_36.mem") port map (clk, out2_1_reg, act_3_1_36);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_36.mem") port map (clk, out2_2_reg, act_3_2_36);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_36.mem") port map (clk, out2_3_reg, act_3_3_36);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_36.mem") port map (clk, out2_4_reg, act_3_4_36);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_36.mem") port map (clk, out2_5_reg, act_3_5_36);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_36.mem") port map (clk, out2_6_reg, act_3_6_36);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_36.mem") port map (clk, out2_7_reg, act_3_7_36);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_36.mem") port map (clk, out2_8_reg, act_3_8_36);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_36.mem") port map (clk, out2_9_reg, act_3_9_36);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_36.mem") port map (clk, out2_10_reg, act_3_10_36);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_36.mem") port map (clk, out2_11_reg, act_3_11_36);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_36.mem") port map (clk, out2_12_reg, act_3_12_36);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_36.mem") port map (clk, out2_13_reg, act_3_13_36);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_36.mem") port map (clk, out2_14_reg, act_3_14_36);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_36.mem") port map (clk, out2_15_reg, act_3_15_36);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_36, SUM_WIDTH_3_36) + resize(act_3_1_36, SUM_WIDTH_3_36) + resize(act_3_2_36, SUM_WIDTH_3_36) + resize(act_3_3_36, SUM_WIDTH_3_36);
        s1_1 <= resize(act_3_4_36, SUM_WIDTH_3_36) + resize(act_3_5_36, SUM_WIDTH_3_36) + resize(act_3_6_36, SUM_WIDTH_3_36) + resize(act_3_7_36, SUM_WIDTH_3_36);
        s1_2 <= resize(act_3_8_36, SUM_WIDTH_3_36) + resize(act_3_9_36, SUM_WIDTH_3_36) + resize(act_3_10_36, SUM_WIDTH_3_36) + resize(act_3_11_36, SUM_WIDTH_3_36);
        s1_3 <= resize(act_3_12_36, SUM_WIDTH_3_36) + resize(act_3_13_36, SUM_WIDTH_3_36) + resize(act_3_14_36, SUM_WIDTH_3_36) + resize(act_3_15_36, SUM_WIDTH_3_36);
        -- Stage 2
        sum_3_36 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(36) <= saturate(sum_3_36, 8);
  end block;

  -- LAYER 3, ch 37
  gen_l3c37 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_37;
  signal sum_3_37 : sum_t_3_37;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_37.mem") port map (clk, out2_0_reg, act_3_0_37);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_37.mem") port map (clk, out2_1_reg, act_3_1_37);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_37.mem") port map (clk, out2_2_reg, act_3_2_37);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_37.mem") port map (clk, out2_3_reg, act_3_3_37);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_37.mem") port map (clk, out2_4_reg, act_3_4_37);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_37.mem") port map (clk, out2_5_reg, act_3_5_37);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_37.mem") port map (clk, out2_6_reg, act_3_6_37);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_37.mem") port map (clk, out2_7_reg, act_3_7_37);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_37.mem") port map (clk, out2_8_reg, act_3_8_37);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_37.mem") port map (clk, out2_9_reg, act_3_9_37);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_37.mem") port map (clk, out2_10_reg, act_3_10_37);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_37.mem") port map (clk, out2_11_reg, act_3_11_37);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_37.mem") port map (clk, out2_12_reg, act_3_12_37);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_37.mem") port map (clk, out2_13_reg, act_3_13_37);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_37.mem") port map (clk, out2_14_reg, act_3_14_37);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_37.mem") port map (clk, out2_15_reg, act_3_15_37);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_37, SUM_WIDTH_3_37) + resize(act_3_1_37, SUM_WIDTH_3_37) + resize(act_3_2_37, SUM_WIDTH_3_37) + resize(act_3_3_37, SUM_WIDTH_3_37);
        s1_1 <= resize(act_3_4_37, SUM_WIDTH_3_37) + resize(act_3_5_37, SUM_WIDTH_3_37) + resize(act_3_6_37, SUM_WIDTH_3_37) + resize(act_3_7_37, SUM_WIDTH_3_37);
        s1_2 <= resize(act_3_8_37, SUM_WIDTH_3_37) + resize(act_3_9_37, SUM_WIDTH_3_37) + resize(act_3_10_37, SUM_WIDTH_3_37) + resize(act_3_11_37, SUM_WIDTH_3_37);
        s1_3 <= resize(act_3_12_37, SUM_WIDTH_3_37) + resize(act_3_13_37, SUM_WIDTH_3_37) + resize(act_3_14_37, SUM_WIDTH_3_37) + resize(act_3_15_37, SUM_WIDTH_3_37);
        -- Stage 2
        sum_3_37 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(37) <= saturate(sum_3_37, 8);
  end block;

  -- LAYER 3, ch 38
  gen_l3c38 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_38;
  signal sum_3_38 : sum_t_3_38;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_38.mem") port map (clk, out2_0_reg, act_3_0_38);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_38.mem") port map (clk, out2_1_reg, act_3_1_38);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_38.mem") port map (clk, out2_2_reg, act_3_2_38);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_38.mem") port map (clk, out2_3_reg, act_3_3_38);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_38.mem") port map (clk, out2_4_reg, act_3_4_38);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_38.mem") port map (clk, out2_5_reg, act_3_5_38);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_38.mem") port map (clk, out2_6_reg, act_3_6_38);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_38.mem") port map (clk, out2_7_reg, act_3_7_38);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_38.mem") port map (clk, out2_8_reg, act_3_8_38);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_38.mem") port map (clk, out2_9_reg, act_3_9_38);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_38.mem") port map (clk, out2_10_reg, act_3_10_38);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_38.mem") port map (clk, out2_11_reg, act_3_11_38);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_38.mem") port map (clk, out2_12_reg, act_3_12_38);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_38.mem") port map (clk, out2_13_reg, act_3_13_38);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_38.mem") port map (clk, out2_14_reg, act_3_14_38);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_38.mem") port map (clk, out2_15_reg, act_3_15_38);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_38, SUM_WIDTH_3_38) + resize(act_3_1_38, SUM_WIDTH_3_38) + resize(act_3_2_38, SUM_WIDTH_3_38) + resize(act_3_3_38, SUM_WIDTH_3_38);
        s1_1 <= resize(act_3_4_38, SUM_WIDTH_3_38) + resize(act_3_5_38, SUM_WIDTH_3_38) + resize(act_3_6_38, SUM_WIDTH_3_38) + resize(act_3_7_38, SUM_WIDTH_3_38);
        s1_2 <= resize(act_3_8_38, SUM_WIDTH_3_38) + resize(act_3_9_38, SUM_WIDTH_3_38) + resize(act_3_10_38, SUM_WIDTH_3_38) + resize(act_3_11_38, SUM_WIDTH_3_38);
        s1_3 <= resize(act_3_12_38, SUM_WIDTH_3_38) + resize(act_3_13_38, SUM_WIDTH_3_38) + resize(act_3_14_38, SUM_WIDTH_3_38) + resize(act_3_15_38, SUM_WIDTH_3_38);
        -- Stage 2
        sum_3_38 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(38) <= saturate(sum_3_38, 8);
  end block;

  -- LAYER 3, ch 39
  gen_l3c39 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_39;
  signal sum_3_39 : sum_t_3_39;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_39.mem") port map (clk, out2_0_reg, act_3_0_39);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_39.mem") port map (clk, out2_1_reg, act_3_1_39);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_39.mem") port map (clk, out2_2_reg, act_3_2_39);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_39.mem") port map (clk, out2_3_reg, act_3_3_39);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_39.mem") port map (clk, out2_4_reg, act_3_4_39);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_39.mem") port map (clk, out2_5_reg, act_3_5_39);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_39.mem") port map (clk, out2_6_reg, act_3_6_39);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_39.mem") port map (clk, out2_7_reg, act_3_7_39);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_39.mem") port map (clk, out2_8_reg, act_3_8_39);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_39.mem") port map (clk, out2_9_reg, act_3_9_39);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_39.mem") port map (clk, out2_10_reg, act_3_10_39);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_39.mem") port map (clk, out2_11_reg, act_3_11_39);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_39.mem") port map (clk, out2_12_reg, act_3_12_39);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_39.mem") port map (clk, out2_13_reg, act_3_13_39);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_39.mem") port map (clk, out2_14_reg, act_3_14_39);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_39.mem") port map (clk, out2_15_reg, act_3_15_39);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_39, SUM_WIDTH_3_39) + resize(act_3_1_39, SUM_WIDTH_3_39) + resize(act_3_2_39, SUM_WIDTH_3_39) + resize(act_3_3_39, SUM_WIDTH_3_39);
        s1_1 <= resize(act_3_4_39, SUM_WIDTH_3_39) + resize(act_3_5_39, SUM_WIDTH_3_39) + resize(act_3_6_39, SUM_WIDTH_3_39) + resize(act_3_7_39, SUM_WIDTH_3_39);
        s1_2 <= resize(act_3_8_39, SUM_WIDTH_3_39) + resize(act_3_9_39, SUM_WIDTH_3_39) + resize(act_3_10_39, SUM_WIDTH_3_39) + resize(act_3_11_39, SUM_WIDTH_3_39);
        s1_3 <= resize(act_3_12_39, SUM_WIDTH_3_39) + resize(act_3_13_39, SUM_WIDTH_3_39) + resize(act_3_14_39, SUM_WIDTH_3_39) + resize(act_3_15_39, SUM_WIDTH_3_39);
        -- Stage 2
        sum_3_39 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(39) <= saturate(sum_3_39, 8);
  end block;

  -- LAYER 3, ch 40
  gen_l3c40 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_40;
  signal sum_3_40 : sum_t_3_40;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_40.mem") port map (clk, out2_0_reg, act_3_0_40);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_40.mem") port map (clk, out2_1_reg, act_3_1_40);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_40.mem") port map (clk, out2_2_reg, act_3_2_40);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_40.mem") port map (clk, out2_3_reg, act_3_3_40);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_40.mem") port map (clk, out2_4_reg, act_3_4_40);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_40.mem") port map (clk, out2_5_reg, act_3_5_40);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_40.mem") port map (clk, out2_6_reg, act_3_6_40);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_40.mem") port map (clk, out2_7_reg, act_3_7_40);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_40.mem") port map (clk, out2_8_reg, act_3_8_40);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_40.mem") port map (clk, out2_9_reg, act_3_9_40);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_40.mem") port map (clk, out2_10_reg, act_3_10_40);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_40.mem") port map (clk, out2_11_reg, act_3_11_40);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_40.mem") port map (clk, out2_12_reg, act_3_12_40);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_40.mem") port map (clk, out2_13_reg, act_3_13_40);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_40.mem") port map (clk, out2_14_reg, act_3_14_40);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_40.mem") port map (clk, out2_15_reg, act_3_15_40);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_40, SUM_WIDTH_3_40) + resize(act_3_1_40, SUM_WIDTH_3_40) + resize(act_3_2_40, SUM_WIDTH_3_40) + resize(act_3_3_40, SUM_WIDTH_3_40);
        s1_1 <= resize(act_3_4_40, SUM_WIDTH_3_40) + resize(act_3_5_40, SUM_WIDTH_3_40) + resize(act_3_6_40, SUM_WIDTH_3_40) + resize(act_3_7_40, SUM_WIDTH_3_40);
        s1_2 <= resize(act_3_8_40, SUM_WIDTH_3_40) + resize(act_3_9_40, SUM_WIDTH_3_40) + resize(act_3_10_40, SUM_WIDTH_3_40) + resize(act_3_11_40, SUM_WIDTH_3_40);
        s1_3 <= resize(act_3_12_40, SUM_WIDTH_3_40) + resize(act_3_13_40, SUM_WIDTH_3_40) + resize(act_3_14_40, SUM_WIDTH_3_40) + resize(act_3_15_40, SUM_WIDTH_3_40);
        -- Stage 2
        sum_3_40 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(40) <= saturate(sum_3_40, 8);
  end block;

  -- LAYER 3, ch 41
  gen_l3c41 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_41;
  signal sum_3_41 : sum_t_3_41;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_41.mem") port map (clk, out2_0_reg, act_3_0_41);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_41.mem") port map (clk, out2_1_reg, act_3_1_41);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_41.mem") port map (clk, out2_2_reg, act_3_2_41);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_41.mem") port map (clk, out2_3_reg, act_3_3_41);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_41.mem") port map (clk, out2_4_reg, act_3_4_41);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_41.mem") port map (clk, out2_5_reg, act_3_5_41);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_41.mem") port map (clk, out2_6_reg, act_3_6_41);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_41.mem") port map (clk, out2_7_reg, act_3_7_41);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_41.mem") port map (clk, out2_8_reg, act_3_8_41);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_41.mem") port map (clk, out2_9_reg, act_3_9_41);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_41.mem") port map (clk, out2_10_reg, act_3_10_41);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_41.mem") port map (clk, out2_11_reg, act_3_11_41);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_41.mem") port map (clk, out2_12_reg, act_3_12_41);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_41.mem") port map (clk, out2_13_reg, act_3_13_41);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_41.mem") port map (clk, out2_14_reg, act_3_14_41);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_41.mem") port map (clk, out2_15_reg, act_3_15_41);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_41, SUM_WIDTH_3_41) + resize(act_3_1_41, SUM_WIDTH_3_41) + resize(act_3_2_41, SUM_WIDTH_3_41) + resize(act_3_3_41, SUM_WIDTH_3_41);
        s1_1 <= resize(act_3_4_41, SUM_WIDTH_3_41) + resize(act_3_5_41, SUM_WIDTH_3_41) + resize(act_3_6_41, SUM_WIDTH_3_41) + resize(act_3_7_41, SUM_WIDTH_3_41);
        s1_2 <= resize(act_3_8_41, SUM_WIDTH_3_41) + resize(act_3_9_41, SUM_WIDTH_3_41) + resize(act_3_10_41, SUM_WIDTH_3_41) + resize(act_3_11_41, SUM_WIDTH_3_41);
        s1_3 <= resize(act_3_12_41, SUM_WIDTH_3_41) + resize(act_3_13_41, SUM_WIDTH_3_41) + resize(act_3_14_41, SUM_WIDTH_3_41) + resize(act_3_15_41, SUM_WIDTH_3_41);
        -- Stage 2
        sum_3_41 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(41) <= saturate(sum_3_41, 8);
  end block;

  -- LAYER 3, ch 42
  gen_l3c42 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_42;
  signal sum_3_42 : sum_t_3_42;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_42.mem") port map (clk, out2_0_reg, act_3_0_42);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_42.mem") port map (clk, out2_1_reg, act_3_1_42);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_42.mem") port map (clk, out2_2_reg, act_3_2_42);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_42.mem") port map (clk, out2_3_reg, act_3_3_42);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_42.mem") port map (clk, out2_4_reg, act_3_4_42);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_42.mem") port map (clk, out2_5_reg, act_3_5_42);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_42.mem") port map (clk, out2_6_reg, act_3_6_42);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_42.mem") port map (clk, out2_7_reg, act_3_7_42);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_42.mem") port map (clk, out2_8_reg, act_3_8_42);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_42.mem") port map (clk, out2_9_reg, act_3_9_42);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_42.mem") port map (clk, out2_10_reg, act_3_10_42);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_42.mem") port map (clk, out2_11_reg, act_3_11_42);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_42.mem") port map (clk, out2_12_reg, act_3_12_42);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_42.mem") port map (clk, out2_13_reg, act_3_13_42);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_42.mem") port map (clk, out2_14_reg, act_3_14_42);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_42.mem") port map (clk, out2_15_reg, act_3_15_42);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_42, SUM_WIDTH_3_42) + resize(act_3_1_42, SUM_WIDTH_3_42) + resize(act_3_2_42, SUM_WIDTH_3_42) + resize(act_3_3_42, SUM_WIDTH_3_42);
        s1_1 <= resize(act_3_4_42, SUM_WIDTH_3_42) + resize(act_3_5_42, SUM_WIDTH_3_42) + resize(act_3_6_42, SUM_WIDTH_3_42) + resize(act_3_7_42, SUM_WIDTH_3_42);
        s1_2 <= resize(act_3_8_42, SUM_WIDTH_3_42) + resize(act_3_9_42, SUM_WIDTH_3_42) + resize(act_3_10_42, SUM_WIDTH_3_42) + resize(act_3_11_42, SUM_WIDTH_3_42);
        s1_3 <= resize(act_3_12_42, SUM_WIDTH_3_42) + resize(act_3_13_42, SUM_WIDTH_3_42) + resize(act_3_14_42, SUM_WIDTH_3_42) + resize(act_3_15_42, SUM_WIDTH_3_42);
        -- Stage 2
        sum_3_42 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(42) <= saturate(sum_3_42, 8);
  end block;

  -- LAYER 3, ch 43
  gen_l3c43 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_43;
  signal sum_3_43 : sum_t_3_43;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_43.mem") port map (clk, out2_0_reg, act_3_0_43);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_43.mem") port map (clk, out2_1_reg, act_3_1_43);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_43.mem") port map (clk, out2_2_reg, act_3_2_43);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_43.mem") port map (clk, out2_3_reg, act_3_3_43);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_43.mem") port map (clk, out2_4_reg, act_3_4_43);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_43.mem") port map (clk, out2_5_reg, act_3_5_43);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_43.mem") port map (clk, out2_6_reg, act_3_6_43);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_43.mem") port map (clk, out2_7_reg, act_3_7_43);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_43.mem") port map (clk, out2_8_reg, act_3_8_43);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_43.mem") port map (clk, out2_9_reg, act_3_9_43);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_43.mem") port map (clk, out2_10_reg, act_3_10_43);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_43.mem") port map (clk, out2_11_reg, act_3_11_43);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_43.mem") port map (clk, out2_12_reg, act_3_12_43);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_43.mem") port map (clk, out2_13_reg, act_3_13_43);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_43.mem") port map (clk, out2_14_reg, act_3_14_43);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_43.mem") port map (clk, out2_15_reg, act_3_15_43);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_43, SUM_WIDTH_3_43) + resize(act_3_1_43, SUM_WIDTH_3_43) + resize(act_3_2_43, SUM_WIDTH_3_43) + resize(act_3_3_43, SUM_WIDTH_3_43);
        s1_1 <= resize(act_3_4_43, SUM_WIDTH_3_43) + resize(act_3_5_43, SUM_WIDTH_3_43) + resize(act_3_6_43, SUM_WIDTH_3_43) + resize(act_3_7_43, SUM_WIDTH_3_43);
        s1_2 <= resize(act_3_8_43, SUM_WIDTH_3_43) + resize(act_3_9_43, SUM_WIDTH_3_43) + resize(act_3_10_43, SUM_WIDTH_3_43) + resize(act_3_11_43, SUM_WIDTH_3_43);
        s1_3 <= resize(act_3_12_43, SUM_WIDTH_3_43) + resize(act_3_13_43, SUM_WIDTH_3_43) + resize(act_3_14_43, SUM_WIDTH_3_43) + resize(act_3_15_43, SUM_WIDTH_3_43);
        -- Stage 2
        sum_3_43 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(43) <= saturate(sum_3_43, 8);
  end block;

  -- LAYER 3, ch 44
  gen_l3c44 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_44;
  signal sum_3_44 : sum_t_3_44;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_44.mem") port map (clk, out2_0_reg, act_3_0_44);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_44.mem") port map (clk, out2_1_reg, act_3_1_44);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_44.mem") port map (clk, out2_2_reg, act_3_2_44);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_44.mem") port map (clk, out2_3_reg, act_3_3_44);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_44.mem") port map (clk, out2_4_reg, act_3_4_44);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_44.mem") port map (clk, out2_5_reg, act_3_5_44);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_44.mem") port map (clk, out2_6_reg, act_3_6_44);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_44.mem") port map (clk, out2_7_reg, act_3_7_44);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_44.mem") port map (clk, out2_8_reg, act_3_8_44);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_44.mem") port map (clk, out2_9_reg, act_3_9_44);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_44.mem") port map (clk, out2_10_reg, act_3_10_44);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_44.mem") port map (clk, out2_11_reg, act_3_11_44);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_44.mem") port map (clk, out2_12_reg, act_3_12_44);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_44.mem") port map (clk, out2_13_reg, act_3_13_44);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_44.mem") port map (clk, out2_14_reg, act_3_14_44);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_44.mem") port map (clk, out2_15_reg, act_3_15_44);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_44, SUM_WIDTH_3_44) + resize(act_3_1_44, SUM_WIDTH_3_44) + resize(act_3_2_44, SUM_WIDTH_3_44) + resize(act_3_3_44, SUM_WIDTH_3_44);
        s1_1 <= resize(act_3_4_44, SUM_WIDTH_3_44) + resize(act_3_5_44, SUM_WIDTH_3_44) + resize(act_3_6_44, SUM_WIDTH_3_44) + resize(act_3_7_44, SUM_WIDTH_3_44);
        s1_2 <= resize(act_3_8_44, SUM_WIDTH_3_44) + resize(act_3_9_44, SUM_WIDTH_3_44) + resize(act_3_10_44, SUM_WIDTH_3_44) + resize(act_3_11_44, SUM_WIDTH_3_44);
        s1_3 <= resize(act_3_12_44, SUM_WIDTH_3_44) + resize(act_3_13_44, SUM_WIDTH_3_44) + resize(act_3_14_44, SUM_WIDTH_3_44) + resize(act_3_15_44, SUM_WIDTH_3_44);
        -- Stage 2
        sum_3_44 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(44) <= saturate(sum_3_44, 8);
  end block;

  -- LAYER 3, ch 45
  gen_l3c45 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_45;
  signal sum_3_45 : sum_t_3_45;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_45.mem") port map (clk, out2_0_reg, act_3_0_45);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_45.mem") port map (clk, out2_1_reg, act_3_1_45);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_45.mem") port map (clk, out2_2_reg, act_3_2_45);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_45.mem") port map (clk, out2_3_reg, act_3_3_45);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_45.mem") port map (clk, out2_4_reg, act_3_4_45);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_45.mem") port map (clk, out2_5_reg, act_3_5_45);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_45.mem") port map (clk, out2_6_reg, act_3_6_45);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_45.mem") port map (clk, out2_7_reg, act_3_7_45);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_45.mem") port map (clk, out2_8_reg, act_3_8_45);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_45.mem") port map (clk, out2_9_reg, act_3_9_45);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_45.mem") port map (clk, out2_10_reg, act_3_10_45);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_45.mem") port map (clk, out2_11_reg, act_3_11_45);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_45.mem") port map (clk, out2_12_reg, act_3_12_45);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_45.mem") port map (clk, out2_13_reg, act_3_13_45);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_45.mem") port map (clk, out2_14_reg, act_3_14_45);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_45.mem") port map (clk, out2_15_reg, act_3_15_45);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_45, SUM_WIDTH_3_45) + resize(act_3_1_45, SUM_WIDTH_3_45) + resize(act_3_2_45, SUM_WIDTH_3_45) + resize(act_3_3_45, SUM_WIDTH_3_45);
        s1_1 <= resize(act_3_4_45, SUM_WIDTH_3_45) + resize(act_3_5_45, SUM_WIDTH_3_45) + resize(act_3_6_45, SUM_WIDTH_3_45) + resize(act_3_7_45, SUM_WIDTH_3_45);
        s1_2 <= resize(act_3_8_45, SUM_WIDTH_3_45) + resize(act_3_9_45, SUM_WIDTH_3_45) + resize(act_3_10_45, SUM_WIDTH_3_45) + resize(act_3_11_45, SUM_WIDTH_3_45);
        s1_3 <= resize(act_3_12_45, SUM_WIDTH_3_45) + resize(act_3_13_45, SUM_WIDTH_3_45) + resize(act_3_14_45, SUM_WIDTH_3_45) + resize(act_3_15_45, SUM_WIDTH_3_45);
        -- Stage 2
        sum_3_45 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(45) <= saturate(sum_3_45, 8);
  end block;

  -- LAYER 3, ch 46
  gen_l3c46 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_46;
  signal sum_3_46 : sum_t_3_46;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_46.mem") port map (clk, out2_0_reg, act_3_0_46);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_46.mem") port map (clk, out2_1_reg, act_3_1_46);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_46.mem") port map (clk, out2_2_reg, act_3_2_46);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_46.mem") port map (clk, out2_3_reg, act_3_3_46);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_46.mem") port map (clk, out2_4_reg, act_3_4_46);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_46.mem") port map (clk, out2_5_reg, act_3_5_46);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_46.mem") port map (clk, out2_6_reg, act_3_6_46);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_46.mem") port map (clk, out2_7_reg, act_3_7_46);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_46.mem") port map (clk, out2_8_reg, act_3_8_46);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_46.mem") port map (clk, out2_9_reg, act_3_9_46);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_46.mem") port map (clk, out2_10_reg, act_3_10_46);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_46.mem") port map (clk, out2_11_reg, act_3_11_46);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_46.mem") port map (clk, out2_12_reg, act_3_12_46);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_46.mem") port map (clk, out2_13_reg, act_3_13_46);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_46.mem") port map (clk, out2_14_reg, act_3_14_46);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_46.mem") port map (clk, out2_15_reg, act_3_15_46);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_46, SUM_WIDTH_3_46) + resize(act_3_1_46, SUM_WIDTH_3_46) + resize(act_3_2_46, SUM_WIDTH_3_46) + resize(act_3_3_46, SUM_WIDTH_3_46);
        s1_1 <= resize(act_3_4_46, SUM_WIDTH_3_46) + resize(act_3_5_46, SUM_WIDTH_3_46) + resize(act_3_6_46, SUM_WIDTH_3_46) + resize(act_3_7_46, SUM_WIDTH_3_46);
        s1_2 <= resize(act_3_8_46, SUM_WIDTH_3_46) + resize(act_3_9_46, SUM_WIDTH_3_46) + resize(act_3_10_46, SUM_WIDTH_3_46) + resize(act_3_11_46, SUM_WIDTH_3_46);
        s1_3 <= resize(act_3_12_46, SUM_WIDTH_3_46) + resize(act_3_13_46, SUM_WIDTH_3_46) + resize(act_3_14_46, SUM_WIDTH_3_46) + resize(act_3_15_46, SUM_WIDTH_3_46);
        -- Stage 2
        sum_3_46 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(46) <= saturate(sum_3_46, 8);
  end block;

  -- LAYER 3, ch 47
  gen_l3c47 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_47;
  signal sum_3_47 : sum_t_3_47;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_47.mem") port map (clk, out2_0_reg, act_3_0_47);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_47.mem") port map (clk, out2_1_reg, act_3_1_47);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_47.mem") port map (clk, out2_2_reg, act_3_2_47);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_47.mem") port map (clk, out2_3_reg, act_3_3_47);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_47.mem") port map (clk, out2_4_reg, act_3_4_47);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_47.mem") port map (clk, out2_5_reg, act_3_5_47);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_47.mem") port map (clk, out2_6_reg, act_3_6_47);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_47.mem") port map (clk, out2_7_reg, act_3_7_47);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_47.mem") port map (clk, out2_8_reg, act_3_8_47);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_47.mem") port map (clk, out2_9_reg, act_3_9_47);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_47.mem") port map (clk, out2_10_reg, act_3_10_47);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_47.mem") port map (clk, out2_11_reg, act_3_11_47);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_47.mem") port map (clk, out2_12_reg, act_3_12_47);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_47.mem") port map (clk, out2_13_reg, act_3_13_47);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_47.mem") port map (clk, out2_14_reg, act_3_14_47);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_47.mem") port map (clk, out2_15_reg, act_3_15_47);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_47, SUM_WIDTH_3_47) + resize(act_3_1_47, SUM_WIDTH_3_47) + resize(act_3_2_47, SUM_WIDTH_3_47) + resize(act_3_3_47, SUM_WIDTH_3_47);
        s1_1 <= resize(act_3_4_47, SUM_WIDTH_3_47) + resize(act_3_5_47, SUM_WIDTH_3_47) + resize(act_3_6_47, SUM_WIDTH_3_47) + resize(act_3_7_47, SUM_WIDTH_3_47);
        s1_2 <= resize(act_3_8_47, SUM_WIDTH_3_47) + resize(act_3_9_47, SUM_WIDTH_3_47) + resize(act_3_10_47, SUM_WIDTH_3_47) + resize(act_3_11_47, SUM_WIDTH_3_47);
        s1_3 <= resize(act_3_12_47, SUM_WIDTH_3_47) + resize(act_3_13_47, SUM_WIDTH_3_47) + resize(act_3_14_47, SUM_WIDTH_3_47) + resize(act_3_15_47, SUM_WIDTH_3_47);
        -- Stage 2
        sum_3_47 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(47) <= saturate(sum_3_47, 8);
  end block;

  -- LAYER 3, ch 48
  gen_l3c48 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_48;
  signal sum_3_48 : sum_t_3_48;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_48.mem") port map (clk, out2_0_reg, act_3_0_48);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_48.mem") port map (clk, out2_1_reg, act_3_1_48);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_48.mem") port map (clk, out2_2_reg, act_3_2_48);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_48.mem") port map (clk, out2_3_reg, act_3_3_48);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_48.mem") port map (clk, out2_4_reg, act_3_4_48);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_48.mem") port map (clk, out2_5_reg, act_3_5_48);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_48.mem") port map (clk, out2_6_reg, act_3_6_48);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_48.mem") port map (clk, out2_7_reg, act_3_7_48);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_48.mem") port map (clk, out2_8_reg, act_3_8_48);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_48.mem") port map (clk, out2_9_reg, act_3_9_48);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_48.mem") port map (clk, out2_10_reg, act_3_10_48);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_48.mem") port map (clk, out2_11_reg, act_3_11_48);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_48.mem") port map (clk, out2_12_reg, act_3_12_48);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_48.mem") port map (clk, out2_13_reg, act_3_13_48);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_48.mem") port map (clk, out2_14_reg, act_3_14_48);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_48.mem") port map (clk, out2_15_reg, act_3_15_48);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_48, SUM_WIDTH_3_48) + resize(act_3_1_48, SUM_WIDTH_3_48) + resize(act_3_2_48, SUM_WIDTH_3_48) + resize(act_3_3_48, SUM_WIDTH_3_48);
        s1_1 <= resize(act_3_4_48, SUM_WIDTH_3_48) + resize(act_3_5_48, SUM_WIDTH_3_48) + resize(act_3_6_48, SUM_WIDTH_3_48) + resize(act_3_7_48, SUM_WIDTH_3_48);
        s1_2 <= resize(act_3_8_48, SUM_WIDTH_3_48) + resize(act_3_9_48, SUM_WIDTH_3_48) + resize(act_3_10_48, SUM_WIDTH_3_48) + resize(act_3_11_48, SUM_WIDTH_3_48);
        s1_3 <= resize(act_3_12_48, SUM_WIDTH_3_48) + resize(act_3_13_48, SUM_WIDTH_3_48) + resize(act_3_14_48, SUM_WIDTH_3_48) + resize(act_3_15_48, SUM_WIDTH_3_48);
        -- Stage 2
        sum_3_48 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(48) <= saturate(sum_3_48, 8);
  end block;

  -- LAYER 3, ch 49
  gen_l3c49 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_49;
  signal sum_3_49 : sum_t_3_49;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_49.mem") port map (clk, out2_0_reg, act_3_0_49);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_49.mem") port map (clk, out2_1_reg, act_3_1_49);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_49.mem") port map (clk, out2_2_reg, act_3_2_49);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_49.mem") port map (clk, out2_3_reg, act_3_3_49);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_49.mem") port map (clk, out2_4_reg, act_3_4_49);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_49.mem") port map (clk, out2_5_reg, act_3_5_49);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_49.mem") port map (clk, out2_6_reg, act_3_6_49);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_49.mem") port map (clk, out2_7_reg, act_3_7_49);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_49.mem") port map (clk, out2_8_reg, act_3_8_49);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_49.mem") port map (clk, out2_9_reg, act_3_9_49);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_49.mem") port map (clk, out2_10_reg, act_3_10_49);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_49.mem") port map (clk, out2_11_reg, act_3_11_49);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_49.mem") port map (clk, out2_12_reg, act_3_12_49);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_49.mem") port map (clk, out2_13_reg, act_3_13_49);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_49.mem") port map (clk, out2_14_reg, act_3_14_49);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_49.mem") port map (clk, out2_15_reg, act_3_15_49);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_49, SUM_WIDTH_3_49) + resize(act_3_1_49, SUM_WIDTH_3_49) + resize(act_3_2_49, SUM_WIDTH_3_49) + resize(act_3_3_49, SUM_WIDTH_3_49);
        s1_1 <= resize(act_3_4_49, SUM_WIDTH_3_49) + resize(act_3_5_49, SUM_WIDTH_3_49) + resize(act_3_6_49, SUM_WIDTH_3_49) + resize(act_3_7_49, SUM_WIDTH_3_49);
        s1_2 <= resize(act_3_8_49, SUM_WIDTH_3_49) + resize(act_3_9_49, SUM_WIDTH_3_49) + resize(act_3_10_49, SUM_WIDTH_3_49) + resize(act_3_11_49, SUM_WIDTH_3_49);
        s1_3 <= resize(act_3_12_49, SUM_WIDTH_3_49) + resize(act_3_13_49, SUM_WIDTH_3_49) + resize(act_3_14_49, SUM_WIDTH_3_49) + resize(act_3_15_49, SUM_WIDTH_3_49);
        -- Stage 2
        sum_3_49 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(49) <= saturate(sum_3_49, 8);
  end block;

  -- LAYER 3, ch 50
  gen_l3c50 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_50;
  signal sum_3_50 : sum_t_3_50;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_50.mem") port map (clk, out2_0_reg, act_3_0_50);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_50.mem") port map (clk, out2_1_reg, act_3_1_50);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_50.mem") port map (clk, out2_2_reg, act_3_2_50);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_50.mem") port map (clk, out2_3_reg, act_3_3_50);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_50.mem") port map (clk, out2_4_reg, act_3_4_50);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_50.mem") port map (clk, out2_5_reg, act_3_5_50);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_50.mem") port map (clk, out2_6_reg, act_3_6_50);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_50.mem") port map (clk, out2_7_reg, act_3_7_50);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_50.mem") port map (clk, out2_8_reg, act_3_8_50);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_50.mem") port map (clk, out2_9_reg, act_3_9_50);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_50.mem") port map (clk, out2_10_reg, act_3_10_50);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_50.mem") port map (clk, out2_11_reg, act_3_11_50);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_50.mem") port map (clk, out2_12_reg, act_3_12_50);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_50.mem") port map (clk, out2_13_reg, act_3_13_50);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_50.mem") port map (clk, out2_14_reg, act_3_14_50);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_50.mem") port map (clk, out2_15_reg, act_3_15_50);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_50, SUM_WIDTH_3_50) + resize(act_3_1_50, SUM_WIDTH_3_50) + resize(act_3_2_50, SUM_WIDTH_3_50) + resize(act_3_3_50, SUM_WIDTH_3_50);
        s1_1 <= resize(act_3_4_50, SUM_WIDTH_3_50) + resize(act_3_5_50, SUM_WIDTH_3_50) + resize(act_3_6_50, SUM_WIDTH_3_50) + resize(act_3_7_50, SUM_WIDTH_3_50);
        s1_2 <= resize(act_3_8_50, SUM_WIDTH_3_50) + resize(act_3_9_50, SUM_WIDTH_3_50) + resize(act_3_10_50, SUM_WIDTH_3_50) + resize(act_3_11_50, SUM_WIDTH_3_50);
        s1_3 <= resize(act_3_12_50, SUM_WIDTH_3_50) + resize(act_3_13_50, SUM_WIDTH_3_50) + resize(act_3_14_50, SUM_WIDTH_3_50) + resize(act_3_15_50, SUM_WIDTH_3_50);
        -- Stage 2
        sum_3_50 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(50) <= saturate(sum_3_50, 8);
  end block;

  -- LAYER 3, ch 51
  gen_l3c51 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_51;
  signal sum_3_51 : sum_t_3_51;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_51.mem") port map (clk, out2_0_reg, act_3_0_51);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_51.mem") port map (clk, out2_1_reg, act_3_1_51);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_51.mem") port map (clk, out2_2_reg, act_3_2_51);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_51.mem") port map (clk, out2_3_reg, act_3_3_51);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_51.mem") port map (clk, out2_4_reg, act_3_4_51);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_51.mem") port map (clk, out2_5_reg, act_3_5_51);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_51.mem") port map (clk, out2_6_reg, act_3_6_51);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_51.mem") port map (clk, out2_7_reg, act_3_7_51);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_51.mem") port map (clk, out2_8_reg, act_3_8_51);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_51.mem") port map (clk, out2_9_reg, act_3_9_51);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_51.mem") port map (clk, out2_10_reg, act_3_10_51);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_51.mem") port map (clk, out2_11_reg, act_3_11_51);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_51.mem") port map (clk, out2_12_reg, act_3_12_51);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_51.mem") port map (clk, out2_13_reg, act_3_13_51);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_51.mem") port map (clk, out2_14_reg, act_3_14_51);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_51.mem") port map (clk, out2_15_reg, act_3_15_51);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_51, SUM_WIDTH_3_51) + resize(act_3_1_51, SUM_WIDTH_3_51) + resize(act_3_2_51, SUM_WIDTH_3_51) + resize(act_3_3_51, SUM_WIDTH_3_51);
        s1_1 <= resize(act_3_4_51, SUM_WIDTH_3_51) + resize(act_3_5_51, SUM_WIDTH_3_51) + resize(act_3_6_51, SUM_WIDTH_3_51) + resize(act_3_7_51, SUM_WIDTH_3_51);
        s1_2 <= resize(act_3_8_51, SUM_WIDTH_3_51) + resize(act_3_9_51, SUM_WIDTH_3_51) + resize(act_3_10_51, SUM_WIDTH_3_51) + resize(act_3_11_51, SUM_WIDTH_3_51);
        s1_3 <= resize(act_3_12_51, SUM_WIDTH_3_51) + resize(act_3_13_51, SUM_WIDTH_3_51) + resize(act_3_14_51, SUM_WIDTH_3_51) + resize(act_3_15_51, SUM_WIDTH_3_51);
        -- Stage 2
        sum_3_51 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(51) <= saturate(sum_3_51, 8);
  end block;

  -- LAYER 3, ch 52
  gen_l3c52 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_52;
  signal sum_3_52 : sum_t_3_52;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_52.mem") port map (clk, out2_0_reg, act_3_0_52);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_52.mem") port map (clk, out2_1_reg, act_3_1_52);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_52.mem") port map (clk, out2_2_reg, act_3_2_52);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_52.mem") port map (clk, out2_3_reg, act_3_3_52);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_52.mem") port map (clk, out2_4_reg, act_3_4_52);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_52.mem") port map (clk, out2_5_reg, act_3_5_52);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_52.mem") port map (clk, out2_6_reg, act_3_6_52);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_52.mem") port map (clk, out2_7_reg, act_3_7_52);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_52.mem") port map (clk, out2_8_reg, act_3_8_52);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_52.mem") port map (clk, out2_9_reg, act_3_9_52);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_52.mem") port map (clk, out2_10_reg, act_3_10_52);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_52.mem") port map (clk, out2_11_reg, act_3_11_52);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_52.mem") port map (clk, out2_12_reg, act_3_12_52);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_52.mem") port map (clk, out2_13_reg, act_3_13_52);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_52.mem") port map (clk, out2_14_reg, act_3_14_52);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_52.mem") port map (clk, out2_15_reg, act_3_15_52);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_52, SUM_WIDTH_3_52) + resize(act_3_1_52, SUM_WIDTH_3_52) + resize(act_3_2_52, SUM_WIDTH_3_52) + resize(act_3_3_52, SUM_WIDTH_3_52);
        s1_1 <= resize(act_3_4_52, SUM_WIDTH_3_52) + resize(act_3_5_52, SUM_WIDTH_3_52) + resize(act_3_6_52, SUM_WIDTH_3_52) + resize(act_3_7_52, SUM_WIDTH_3_52);
        s1_2 <= resize(act_3_8_52, SUM_WIDTH_3_52) + resize(act_3_9_52, SUM_WIDTH_3_52) + resize(act_3_10_52, SUM_WIDTH_3_52) + resize(act_3_11_52, SUM_WIDTH_3_52);
        s1_3 <= resize(act_3_12_52, SUM_WIDTH_3_52) + resize(act_3_13_52, SUM_WIDTH_3_52) + resize(act_3_14_52, SUM_WIDTH_3_52) + resize(act_3_15_52, SUM_WIDTH_3_52);
        -- Stage 2
        sum_3_52 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(52) <= saturate(sum_3_52, 8);
  end block;

  -- LAYER 3, ch 53
  gen_l3c53 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_53;
  signal sum_3_53 : sum_t_3_53;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_53.mem") port map (clk, out2_0_reg, act_3_0_53);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_53.mem") port map (clk, out2_1_reg, act_3_1_53);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_53.mem") port map (clk, out2_2_reg, act_3_2_53);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_53.mem") port map (clk, out2_3_reg, act_3_3_53);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_53.mem") port map (clk, out2_4_reg, act_3_4_53);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_53.mem") port map (clk, out2_5_reg, act_3_5_53);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_53.mem") port map (clk, out2_6_reg, act_3_6_53);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_53.mem") port map (clk, out2_7_reg, act_3_7_53);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_53.mem") port map (clk, out2_8_reg, act_3_8_53);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_53.mem") port map (clk, out2_9_reg, act_3_9_53);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_53.mem") port map (clk, out2_10_reg, act_3_10_53);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_53.mem") port map (clk, out2_11_reg, act_3_11_53);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_53.mem") port map (clk, out2_12_reg, act_3_12_53);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_53.mem") port map (clk, out2_13_reg, act_3_13_53);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_53.mem") port map (clk, out2_14_reg, act_3_14_53);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_53.mem") port map (clk, out2_15_reg, act_3_15_53);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_53, SUM_WIDTH_3_53) + resize(act_3_1_53, SUM_WIDTH_3_53) + resize(act_3_2_53, SUM_WIDTH_3_53) + resize(act_3_3_53, SUM_WIDTH_3_53);
        s1_1 <= resize(act_3_4_53, SUM_WIDTH_3_53) + resize(act_3_5_53, SUM_WIDTH_3_53) + resize(act_3_6_53, SUM_WIDTH_3_53) + resize(act_3_7_53, SUM_WIDTH_3_53);
        s1_2 <= resize(act_3_8_53, SUM_WIDTH_3_53) + resize(act_3_9_53, SUM_WIDTH_3_53) + resize(act_3_10_53, SUM_WIDTH_3_53) + resize(act_3_11_53, SUM_WIDTH_3_53);
        s1_3 <= resize(act_3_12_53, SUM_WIDTH_3_53) + resize(act_3_13_53, SUM_WIDTH_3_53) + resize(act_3_14_53, SUM_WIDTH_3_53) + resize(act_3_15_53, SUM_WIDTH_3_53);
        -- Stage 2
        sum_3_53 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(53) <= saturate(sum_3_53, 8);
  end block;

  -- LAYER 3, ch 54
  gen_l3c54 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_54;
  signal sum_3_54 : sum_t_3_54;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_54.mem") port map (clk, out2_0_reg, act_3_0_54);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_54.mem") port map (clk, out2_1_reg, act_3_1_54);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_54.mem") port map (clk, out2_2_reg, act_3_2_54);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_54.mem") port map (clk, out2_3_reg, act_3_3_54);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_54.mem") port map (clk, out2_4_reg, act_3_4_54);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_54.mem") port map (clk, out2_5_reg, act_3_5_54);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_54.mem") port map (clk, out2_6_reg, act_3_6_54);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_54.mem") port map (clk, out2_7_reg, act_3_7_54);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_54.mem") port map (clk, out2_8_reg, act_3_8_54);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_54.mem") port map (clk, out2_9_reg, act_3_9_54);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_54.mem") port map (clk, out2_10_reg, act_3_10_54);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_54.mem") port map (clk, out2_11_reg, act_3_11_54);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_54.mem") port map (clk, out2_12_reg, act_3_12_54);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_54.mem") port map (clk, out2_13_reg, act_3_13_54);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_54.mem") port map (clk, out2_14_reg, act_3_14_54);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_54.mem") port map (clk, out2_15_reg, act_3_15_54);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_54, SUM_WIDTH_3_54) + resize(act_3_1_54, SUM_WIDTH_3_54) + resize(act_3_2_54, SUM_WIDTH_3_54) + resize(act_3_3_54, SUM_WIDTH_3_54);
        s1_1 <= resize(act_3_4_54, SUM_WIDTH_3_54) + resize(act_3_5_54, SUM_WIDTH_3_54) + resize(act_3_6_54, SUM_WIDTH_3_54) + resize(act_3_7_54, SUM_WIDTH_3_54);
        s1_2 <= resize(act_3_8_54, SUM_WIDTH_3_54) + resize(act_3_9_54, SUM_WIDTH_3_54) + resize(act_3_10_54, SUM_WIDTH_3_54) + resize(act_3_11_54, SUM_WIDTH_3_54);
        s1_3 <= resize(act_3_12_54, SUM_WIDTH_3_54) + resize(act_3_13_54, SUM_WIDTH_3_54) + resize(act_3_14_54, SUM_WIDTH_3_54) + resize(act_3_15_54, SUM_WIDTH_3_54);
        -- Stage 2
        sum_3_54 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(54) <= saturate(sum_3_54, 8);
  end block;

  -- LAYER 3, ch 55
  gen_l3c55 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_55;
  signal sum_3_55 : sum_t_3_55;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_55.mem") port map (clk, out2_0_reg, act_3_0_55);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_55.mem") port map (clk, out2_1_reg, act_3_1_55);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_55.mem") port map (clk, out2_2_reg, act_3_2_55);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_55.mem") port map (clk, out2_3_reg, act_3_3_55);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_55.mem") port map (clk, out2_4_reg, act_3_4_55);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_55.mem") port map (clk, out2_5_reg, act_3_5_55);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_55.mem") port map (clk, out2_6_reg, act_3_6_55);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_55.mem") port map (clk, out2_7_reg, act_3_7_55);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_55.mem") port map (clk, out2_8_reg, act_3_8_55);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_55.mem") port map (clk, out2_9_reg, act_3_9_55);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_55.mem") port map (clk, out2_10_reg, act_3_10_55);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_55.mem") port map (clk, out2_11_reg, act_3_11_55);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_55.mem") port map (clk, out2_12_reg, act_3_12_55);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_55.mem") port map (clk, out2_13_reg, act_3_13_55);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_55.mem") port map (clk, out2_14_reg, act_3_14_55);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_55.mem") port map (clk, out2_15_reg, act_3_15_55);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_55, SUM_WIDTH_3_55) + resize(act_3_1_55, SUM_WIDTH_3_55) + resize(act_3_2_55, SUM_WIDTH_3_55) + resize(act_3_3_55, SUM_WIDTH_3_55);
        s1_1 <= resize(act_3_4_55, SUM_WIDTH_3_55) + resize(act_3_5_55, SUM_WIDTH_3_55) + resize(act_3_6_55, SUM_WIDTH_3_55) + resize(act_3_7_55, SUM_WIDTH_3_55);
        s1_2 <= resize(act_3_8_55, SUM_WIDTH_3_55) + resize(act_3_9_55, SUM_WIDTH_3_55) + resize(act_3_10_55, SUM_WIDTH_3_55) + resize(act_3_11_55, SUM_WIDTH_3_55);
        s1_3 <= resize(act_3_12_55, SUM_WIDTH_3_55) + resize(act_3_13_55, SUM_WIDTH_3_55) + resize(act_3_14_55, SUM_WIDTH_3_55) + resize(act_3_15_55, SUM_WIDTH_3_55);
        -- Stage 2
        sum_3_55 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(55) <= saturate(sum_3_55, 8);
  end block;

  -- LAYER 3, ch 56
  gen_l3c56 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_56;
  signal sum_3_56 : sum_t_3_56;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_56.mem") port map (clk, out2_0_reg, act_3_0_56);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_56.mem") port map (clk, out2_1_reg, act_3_1_56);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_56.mem") port map (clk, out2_2_reg, act_3_2_56);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_56.mem") port map (clk, out2_3_reg, act_3_3_56);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_56.mem") port map (clk, out2_4_reg, act_3_4_56);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_56.mem") port map (clk, out2_5_reg, act_3_5_56);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_56.mem") port map (clk, out2_6_reg, act_3_6_56);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_56.mem") port map (clk, out2_7_reg, act_3_7_56);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_56.mem") port map (clk, out2_8_reg, act_3_8_56);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_56.mem") port map (clk, out2_9_reg, act_3_9_56);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_56.mem") port map (clk, out2_10_reg, act_3_10_56);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_56.mem") port map (clk, out2_11_reg, act_3_11_56);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_56.mem") port map (clk, out2_12_reg, act_3_12_56);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_56.mem") port map (clk, out2_13_reg, act_3_13_56);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_56.mem") port map (clk, out2_14_reg, act_3_14_56);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_56.mem") port map (clk, out2_15_reg, act_3_15_56);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_56, SUM_WIDTH_3_56) + resize(act_3_1_56, SUM_WIDTH_3_56) + resize(act_3_2_56, SUM_WIDTH_3_56) + resize(act_3_3_56, SUM_WIDTH_3_56);
        s1_1 <= resize(act_3_4_56, SUM_WIDTH_3_56) + resize(act_3_5_56, SUM_WIDTH_3_56) + resize(act_3_6_56, SUM_WIDTH_3_56) + resize(act_3_7_56, SUM_WIDTH_3_56);
        s1_2 <= resize(act_3_8_56, SUM_WIDTH_3_56) + resize(act_3_9_56, SUM_WIDTH_3_56) + resize(act_3_10_56, SUM_WIDTH_3_56) + resize(act_3_11_56, SUM_WIDTH_3_56);
        s1_3 <= resize(act_3_12_56, SUM_WIDTH_3_56) + resize(act_3_13_56, SUM_WIDTH_3_56) + resize(act_3_14_56, SUM_WIDTH_3_56) + resize(act_3_15_56, SUM_WIDTH_3_56);
        -- Stage 2
        sum_3_56 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(56) <= saturate(sum_3_56, 8);
  end block;

  -- LAYER 3, ch 57
  gen_l3c57 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_57;
  signal sum_3_57 : sum_t_3_57;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_57.mem") port map (clk, out2_0_reg, act_3_0_57);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_57.mem") port map (clk, out2_1_reg, act_3_1_57);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_57.mem") port map (clk, out2_2_reg, act_3_2_57);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_57.mem") port map (clk, out2_3_reg, act_3_3_57);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_57.mem") port map (clk, out2_4_reg, act_3_4_57);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_57.mem") port map (clk, out2_5_reg, act_3_5_57);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_57.mem") port map (clk, out2_6_reg, act_3_6_57);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_57.mem") port map (clk, out2_7_reg, act_3_7_57);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_57.mem") port map (clk, out2_8_reg, act_3_8_57);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_57.mem") port map (clk, out2_9_reg, act_3_9_57);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_57.mem") port map (clk, out2_10_reg, act_3_10_57);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_57.mem") port map (clk, out2_11_reg, act_3_11_57);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_57.mem") port map (clk, out2_12_reg, act_3_12_57);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_57.mem") port map (clk, out2_13_reg, act_3_13_57);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_57.mem") port map (clk, out2_14_reg, act_3_14_57);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_57.mem") port map (clk, out2_15_reg, act_3_15_57);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_57, SUM_WIDTH_3_57) + resize(act_3_1_57, SUM_WIDTH_3_57) + resize(act_3_2_57, SUM_WIDTH_3_57) + resize(act_3_3_57, SUM_WIDTH_3_57);
        s1_1 <= resize(act_3_4_57, SUM_WIDTH_3_57) + resize(act_3_5_57, SUM_WIDTH_3_57) + resize(act_3_6_57, SUM_WIDTH_3_57) + resize(act_3_7_57, SUM_WIDTH_3_57);
        s1_2 <= resize(act_3_8_57, SUM_WIDTH_3_57) + resize(act_3_9_57, SUM_WIDTH_3_57) + resize(act_3_10_57, SUM_WIDTH_3_57) + resize(act_3_11_57, SUM_WIDTH_3_57);
        s1_3 <= resize(act_3_12_57, SUM_WIDTH_3_57) + resize(act_3_13_57, SUM_WIDTH_3_57) + resize(act_3_14_57, SUM_WIDTH_3_57) + resize(act_3_15_57, SUM_WIDTH_3_57);
        -- Stage 2
        sum_3_57 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(57) <= saturate(sum_3_57, 8);
  end block;

  -- LAYER 3, ch 58
  gen_l3c58 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_58;
  signal sum_3_58 : sum_t_3_58;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_58.mem") port map (clk, out2_0_reg, act_3_0_58);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_58.mem") port map (clk, out2_1_reg, act_3_1_58);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_58.mem") port map (clk, out2_2_reg, act_3_2_58);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_58.mem") port map (clk, out2_3_reg, act_3_3_58);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_58.mem") port map (clk, out2_4_reg, act_3_4_58);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_58.mem") port map (clk, out2_5_reg, act_3_5_58);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_58.mem") port map (clk, out2_6_reg, act_3_6_58);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_58.mem") port map (clk, out2_7_reg, act_3_7_58);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_58.mem") port map (clk, out2_8_reg, act_3_8_58);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_58.mem") port map (clk, out2_9_reg, act_3_9_58);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_58.mem") port map (clk, out2_10_reg, act_3_10_58);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_58.mem") port map (clk, out2_11_reg, act_3_11_58);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_58.mem") port map (clk, out2_12_reg, act_3_12_58);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_58.mem") port map (clk, out2_13_reg, act_3_13_58);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_58.mem") port map (clk, out2_14_reg, act_3_14_58);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_58.mem") port map (clk, out2_15_reg, act_3_15_58);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_58, SUM_WIDTH_3_58) + resize(act_3_1_58, SUM_WIDTH_3_58) + resize(act_3_2_58, SUM_WIDTH_3_58) + resize(act_3_3_58, SUM_WIDTH_3_58);
        s1_1 <= resize(act_3_4_58, SUM_WIDTH_3_58) + resize(act_3_5_58, SUM_WIDTH_3_58) + resize(act_3_6_58, SUM_WIDTH_3_58) + resize(act_3_7_58, SUM_WIDTH_3_58);
        s1_2 <= resize(act_3_8_58, SUM_WIDTH_3_58) + resize(act_3_9_58, SUM_WIDTH_3_58) + resize(act_3_10_58, SUM_WIDTH_3_58) + resize(act_3_11_58, SUM_WIDTH_3_58);
        s1_3 <= resize(act_3_12_58, SUM_WIDTH_3_58) + resize(act_3_13_58, SUM_WIDTH_3_58) + resize(act_3_14_58, SUM_WIDTH_3_58) + resize(act_3_15_58, SUM_WIDTH_3_58);
        -- Stage 2
        sum_3_58 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(58) <= saturate(sum_3_58, 8);
  end block;

  -- LAYER 3, ch 59
  gen_l3c59 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_59;
  signal sum_3_59 : sum_t_3_59;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_59.mem") port map (clk, out2_0_reg, act_3_0_59);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_59.mem") port map (clk, out2_1_reg, act_3_1_59);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_59.mem") port map (clk, out2_2_reg, act_3_2_59);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_59.mem") port map (clk, out2_3_reg, act_3_3_59);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_59.mem") port map (clk, out2_4_reg, act_3_4_59);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_59.mem") port map (clk, out2_5_reg, act_3_5_59);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_59.mem") port map (clk, out2_6_reg, act_3_6_59);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_59.mem") port map (clk, out2_7_reg, act_3_7_59);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_59.mem") port map (clk, out2_8_reg, act_3_8_59);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_59.mem") port map (clk, out2_9_reg, act_3_9_59);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_59.mem") port map (clk, out2_10_reg, act_3_10_59);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_59.mem") port map (clk, out2_11_reg, act_3_11_59);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_59.mem") port map (clk, out2_12_reg, act_3_12_59);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_59.mem") port map (clk, out2_13_reg, act_3_13_59);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_59.mem") port map (clk, out2_14_reg, act_3_14_59);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_59.mem") port map (clk, out2_15_reg, act_3_15_59);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_59, SUM_WIDTH_3_59) + resize(act_3_1_59, SUM_WIDTH_3_59) + resize(act_3_2_59, SUM_WIDTH_3_59) + resize(act_3_3_59, SUM_WIDTH_3_59);
        s1_1 <= resize(act_3_4_59, SUM_WIDTH_3_59) + resize(act_3_5_59, SUM_WIDTH_3_59) + resize(act_3_6_59, SUM_WIDTH_3_59) + resize(act_3_7_59, SUM_WIDTH_3_59);
        s1_2 <= resize(act_3_8_59, SUM_WIDTH_3_59) + resize(act_3_9_59, SUM_WIDTH_3_59) + resize(act_3_10_59, SUM_WIDTH_3_59) + resize(act_3_11_59, SUM_WIDTH_3_59);
        s1_3 <= resize(act_3_12_59, SUM_WIDTH_3_59) + resize(act_3_13_59, SUM_WIDTH_3_59) + resize(act_3_14_59, SUM_WIDTH_3_59) + resize(act_3_15_59, SUM_WIDTH_3_59);
        -- Stage 2
        sum_3_59 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(59) <= saturate(sum_3_59, 8);
  end block;

  -- LAYER 3, ch 60
  gen_l3c60 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_60;
  signal sum_3_60 : sum_t_3_60;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_60.mem") port map (clk, out2_0_reg, act_3_0_60);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_60.mem") port map (clk, out2_1_reg, act_3_1_60);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_60.mem") port map (clk, out2_2_reg, act_3_2_60);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_60.mem") port map (clk, out2_3_reg, act_3_3_60);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_60.mem") port map (clk, out2_4_reg, act_3_4_60);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_60.mem") port map (clk, out2_5_reg, act_3_5_60);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_60.mem") port map (clk, out2_6_reg, act_3_6_60);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_60.mem") port map (clk, out2_7_reg, act_3_7_60);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_60.mem") port map (clk, out2_8_reg, act_3_8_60);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_60.mem") port map (clk, out2_9_reg, act_3_9_60);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_60.mem") port map (clk, out2_10_reg, act_3_10_60);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_60.mem") port map (clk, out2_11_reg, act_3_11_60);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_60.mem") port map (clk, out2_12_reg, act_3_12_60);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_60.mem") port map (clk, out2_13_reg, act_3_13_60);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_60.mem") port map (clk, out2_14_reg, act_3_14_60);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_60.mem") port map (clk, out2_15_reg, act_3_15_60);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_60, SUM_WIDTH_3_60) + resize(act_3_1_60, SUM_WIDTH_3_60) + resize(act_3_2_60, SUM_WIDTH_3_60) + resize(act_3_3_60, SUM_WIDTH_3_60);
        s1_1 <= resize(act_3_4_60, SUM_WIDTH_3_60) + resize(act_3_5_60, SUM_WIDTH_3_60) + resize(act_3_6_60, SUM_WIDTH_3_60) + resize(act_3_7_60, SUM_WIDTH_3_60);
        s1_2 <= resize(act_3_8_60, SUM_WIDTH_3_60) + resize(act_3_9_60, SUM_WIDTH_3_60) + resize(act_3_10_60, SUM_WIDTH_3_60) + resize(act_3_11_60, SUM_WIDTH_3_60);
        s1_3 <= resize(act_3_12_60, SUM_WIDTH_3_60) + resize(act_3_13_60, SUM_WIDTH_3_60) + resize(act_3_14_60, SUM_WIDTH_3_60) + resize(act_3_15_60, SUM_WIDTH_3_60);
        -- Stage 2
        sum_3_60 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(60) <= saturate(sum_3_60, 8);
  end block;

  -- LAYER 3, ch 61
  gen_l3c61 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_61;
  signal sum_3_61 : sum_t_3_61;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_61.mem") port map (clk, out2_0_reg, act_3_0_61);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_61.mem") port map (clk, out2_1_reg, act_3_1_61);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_61.mem") port map (clk, out2_2_reg, act_3_2_61);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_61.mem") port map (clk, out2_3_reg, act_3_3_61);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_61.mem") port map (clk, out2_4_reg, act_3_4_61);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_61.mem") port map (clk, out2_5_reg, act_3_5_61);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_61.mem") port map (clk, out2_6_reg, act_3_6_61);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_61.mem") port map (clk, out2_7_reg, act_3_7_61);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_61.mem") port map (clk, out2_8_reg, act_3_8_61);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_61.mem") port map (clk, out2_9_reg, act_3_9_61);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_61.mem") port map (clk, out2_10_reg, act_3_10_61);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_61.mem") port map (clk, out2_11_reg, act_3_11_61);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_61.mem") port map (clk, out2_12_reg, act_3_12_61);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_61.mem") port map (clk, out2_13_reg, act_3_13_61);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_61.mem") port map (clk, out2_14_reg, act_3_14_61);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_61.mem") port map (clk, out2_15_reg, act_3_15_61);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_61, SUM_WIDTH_3_61) + resize(act_3_1_61, SUM_WIDTH_3_61) + resize(act_3_2_61, SUM_WIDTH_3_61) + resize(act_3_3_61, SUM_WIDTH_3_61);
        s1_1 <= resize(act_3_4_61, SUM_WIDTH_3_61) + resize(act_3_5_61, SUM_WIDTH_3_61) + resize(act_3_6_61, SUM_WIDTH_3_61) + resize(act_3_7_61, SUM_WIDTH_3_61);
        s1_2 <= resize(act_3_8_61, SUM_WIDTH_3_61) + resize(act_3_9_61, SUM_WIDTH_3_61) + resize(act_3_10_61, SUM_WIDTH_3_61) + resize(act_3_11_61, SUM_WIDTH_3_61);
        s1_3 <= resize(act_3_12_61, SUM_WIDTH_3_61) + resize(act_3_13_61, SUM_WIDTH_3_61) + resize(act_3_14_61, SUM_WIDTH_3_61) + resize(act_3_15_61, SUM_WIDTH_3_61);
        -- Stage 2
        sum_3_61 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(61) <= saturate(sum_3_61, 8);
  end block;

  -- LAYER 3, ch 62
  gen_l3c62 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_62;
  signal sum_3_62 : sum_t_3_62;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_62.mem") port map (clk, out2_0_reg, act_3_0_62);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_62.mem") port map (clk, out2_1_reg, act_3_1_62);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_62.mem") port map (clk, out2_2_reg, act_3_2_62);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_62.mem") port map (clk, out2_3_reg, act_3_3_62);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_62.mem") port map (clk, out2_4_reg, act_3_4_62);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_62.mem") port map (clk, out2_5_reg, act_3_5_62);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_62.mem") port map (clk, out2_6_reg, act_3_6_62);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_62.mem") port map (clk, out2_7_reg, act_3_7_62);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_62.mem") port map (clk, out2_8_reg, act_3_8_62);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_62.mem") port map (clk, out2_9_reg, act_3_9_62);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_62.mem") port map (clk, out2_10_reg, act_3_10_62);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_62.mem") port map (clk, out2_11_reg, act_3_11_62);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_62.mem") port map (clk, out2_12_reg, act_3_12_62);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_62.mem") port map (clk, out2_13_reg, act_3_13_62);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_62.mem") port map (clk, out2_14_reg, act_3_14_62);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_62.mem") port map (clk, out2_15_reg, act_3_15_62);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_62, SUM_WIDTH_3_62) + resize(act_3_1_62, SUM_WIDTH_3_62) + resize(act_3_2_62, SUM_WIDTH_3_62) + resize(act_3_3_62, SUM_WIDTH_3_62);
        s1_1 <= resize(act_3_4_62, SUM_WIDTH_3_62) + resize(act_3_5_62, SUM_WIDTH_3_62) + resize(act_3_6_62, SUM_WIDTH_3_62) + resize(act_3_7_62, SUM_WIDTH_3_62);
        s1_2 <= resize(act_3_8_62, SUM_WIDTH_3_62) + resize(act_3_9_62, SUM_WIDTH_3_62) + resize(act_3_10_62, SUM_WIDTH_3_62) + resize(act_3_11_62, SUM_WIDTH_3_62);
        s1_3 <= resize(act_3_12_62, SUM_WIDTH_3_62) + resize(act_3_13_62, SUM_WIDTH_3_62) + resize(act_3_14_62, SUM_WIDTH_3_62) + resize(act_3_15_62, SUM_WIDTH_3_62);
        -- Stage 2
        sum_3_62 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(62) <= saturate(sum_3_62, 8);
  end block;

  -- LAYER 3, ch 63
  gen_l3c63 : block
  signal s1_0, s1_1, s1_2, s1_3 : sum_t_3_63;
  signal sum_3_63 : sum_t_3_63;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_63.mem") port map (clk, out2_0_reg, act_3_0_63);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_63.mem") port map (clk, out2_1_reg, act_3_1_63);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_2_63.mem") port map (clk, out2_2_reg, act_3_2_63);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_3_63.mem") port map (clk, out2_3_reg, act_3_3_63);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_63.mem") port map (clk, out2_4_reg, act_3_4_63);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_63.mem") port map (clk, out2_5_reg, act_3_5_63);
    i06 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_63.mem") port map (clk, out2_6_reg, act_3_6_63);
    i07 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_63.mem") port map (clk, out2_7_reg, act_3_7_63);
    i08 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_8_63.mem") port map (clk, out2_8_reg, act_3_8_63);
    i09 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_9_63.mem") port map (clk, out2_9_reg, act_3_9_63);
    i10 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_10_63.mem") port map (clk, out2_10_reg, act_3_10_63);
    i11 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_11_63.mem") port map (clk, out2_11_reg, act_3_11_63);
    i12 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_12_63.mem") port map (clk, out2_12_reg, act_3_12_63);
    i13 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_13_63.mem") port map (clk, out2_13_reg, act_3_13_63);
    i14 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_14_63.mem") port map (clk, out2_14_reg, act_3_14_63);
    i15 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_15_63.mem") port map (clk, out2_15_reg, act_3_15_63);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_63, SUM_WIDTH_3_63) + resize(act_3_1_63, SUM_WIDTH_3_63) + resize(act_3_2_63, SUM_WIDTH_3_63) + resize(act_3_3_63, SUM_WIDTH_3_63);
        s1_1 <= resize(act_3_4_63, SUM_WIDTH_3_63) + resize(act_3_5_63, SUM_WIDTH_3_63) + resize(act_3_6_63, SUM_WIDTH_3_63) + resize(act_3_7_63, SUM_WIDTH_3_63);
        s1_2 <= resize(act_3_8_63, SUM_WIDTH_3_63) + resize(act_3_9_63, SUM_WIDTH_3_63) + resize(act_3_10_63, SUM_WIDTH_3_63) + resize(act_3_11_63, SUM_WIDTH_3_63);
        s1_3 <= resize(act_3_12_63, SUM_WIDTH_3_63) + resize(act_3_13_63, SUM_WIDTH_3_63) + resize(act_3_14_63, SUM_WIDTH_3_63) + resize(act_3_15_63, SUM_WIDTH_3_63);
        -- Stage 2
        sum_3_63 <= s1_0 + s1_1 + s1_2 + s1_3;
      end if;
    end process;
    output(63) <= saturate(sum_3_63, 8);
  end block;

end architecture;