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
  -- Layer 0 (128->8)
  signal act_0_0_4, act_0_1_1, act_0_1_4, act_0_2_4, act_0_2_5, act_0_3_4, act_0_3_5, act_0_4_1, act_0_4_4, act_0_4_5, act_0_5_4, act_0_6_1, act_0_6_4, act_0_6_5, act_0_7_4, act_0_7_5 : lut_output_t_0;
  signal act_0_8_4, act_0_9_4, act_0_10_1, act_0_10_4, act_0_11_1, act_0_12_5, act_0_13_1, act_0_14_5, act_0_15_5, act_0_16_4, act_0_17_1, act_0_17_4, act_0_17_5, act_0_18_4, act_0_18_5, act_0_19_1 : lut_output_t_0;
  signal act_0_20_4, act_0_20_5, act_0_21_1, act_0_21_4, act_0_22_4, act_0_23_4, act_0_24_1, act_0_24_4, act_0_24_5, act_0_25_4, act_0_26_1, act_0_26_4, act_0_26_5, act_0_27_1, act_0_27_4, act_0_28_4 : lut_output_t_0;
  signal act_0_29_1, act_0_29_5, act_0_30_1, act_0_30_4, act_0_31_1, act_0_31_4, act_0_32_1, act_0_32_4, act_0_32_5, act_0_33_1, act_0_33_4, act_0_33_5, act_0_34_1, act_0_34_4, act_0_35_1, act_0_35_4 : lut_output_t_0;
  signal act_0_35_5, act_0_36_1, act_0_36_4, act_0_36_5, act_0_37_4, act_0_38_4, act_0_39_1, act_0_39_4, act_0_39_5, act_0_41_4, act_0_42_5, act_0_43_1, act_0_43_4, act_0_43_5, act_0_44_1, act_0_44_4 : lut_output_t_0;
  signal act_0_44_5, act_0_45_4, act_0_45_5, act_0_46_1, act_0_46_4, act_0_46_5, act_0_47_4, act_0_47_5, act_0_48_1, act_0_48_4, act_0_48_5, act_0_49_4, act_0_49_5, act_0_50_4, act_0_50_5, act_0_51_5 : lut_output_t_0;
  signal act_0_52_1, act_0_52_4, act_0_52_5, act_0_53_4, act_0_53_5, act_0_54_5, act_0_55_1, act_0_55_4, act_0_55_5, act_0_56_1, act_0_56_4, act_0_56_5, act_0_57_1, act_0_57_4, act_0_57_5, act_0_58_1 : lut_output_t_0;
  signal act_0_58_4, act_0_58_5, act_0_59_1, act_0_59_4, act_0_59_5, act_0_60_4, act_0_60_5, act_0_61_1, act_0_61_4, act_0_61_5, act_0_62_1, act_0_62_4, act_0_62_5, act_0_63_1, act_0_63_4, act_0_63_5 : lut_output_t_0;
  signal act_0_64_4, act_0_64_5, act_0_65_4, act_0_65_5, act_0_66_1, act_0_66_4, act_0_67_1, act_0_67_4, act_0_67_5, act_0_68_1, act_0_68_4, act_0_68_5, act_0_69_4, act_0_69_5, act_0_70_1, act_0_70_5 : lut_output_t_0;
  signal act_0_71_1, act_0_71_5, act_0_72_5, act_0_73_4, act_0_73_5, act_0_74_1, act_0_74_4, act_0_74_5, act_0_75_1, act_0_75_4, act_0_75_5, act_0_76_5, act_0_77_1, act_0_77_4, act_0_77_5, act_0_78_1 : lut_output_t_0;
  signal act_0_78_4, act_0_78_5, act_0_79_1, act_0_79_4, act_0_79_5, act_0_80_1, act_0_80_4, act_0_80_5, act_0_81_4, act_0_81_5, act_0_82_1, act_0_82_4, act_0_82_5, act_0_83_1, act_0_83_4, act_0_83_5 : lut_output_t_0;
  signal act_0_84_4, act_0_84_5, act_0_85_1, act_0_85_4, act_0_86_4, act_0_86_5, act_0_87_4, act_0_87_5, act_0_88_4, act_0_88_5, act_0_89_1, act_0_89_4, act_0_89_5, act_0_90_4, act_0_91_4, act_0_92_1 : lut_output_t_0;
  signal act_0_92_4, act_0_92_5, act_0_93_1, act_0_93_4, act_0_93_5, act_0_94_1, act_0_94_4, act_0_95_4, act_0_96_1, act_0_96_4, act_0_97_4, act_0_97_5, act_0_98_4, act_0_99_4, act_0_100_1, act_0_100_4 : lut_output_t_0;
  signal act_0_101_4, act_0_102_4, act_0_103_1, act_0_103_4, act_0_104_4, act_0_105_1, act_0_105_4, act_0_106_4, act_0_107_4, act_0_108_4, act_0_109_4, act_0_110_4, act_0_110_5, act_0_112_4, act_0_112_5, act_0_113_4 : lut_output_t_0;
  signal act_0_114_4, act_0_115_4, act_0_116_1, act_0_118_1, act_0_118_4, act_0_119_1, act_0_119_4, act_0_119_5, act_0_120_1, act_0_120_4, act_0_121_4, act_0_121_5, act_0_122_1, act_0_122_4, act_0_123_4, act_0_123_5 : lut_output_t_0;
  signal act_0_124_4, act_0_125_1, act_0_125_4, act_0_125_5, act_0_126_1, act_0_126_4, act_0_127_4 : lut_output_t_0;
  signal out0_0, out0_1, out0_2, out0_3, out0_4, out0_5, out0_6, out0_7 : lut_output_t_0;
  signal out0_0_reg, out0_1_reg, out0_2_reg, out0_3_reg, out0_4_reg, out0_5_reg, out0_6_reg, out0_7_reg : lut_output_t_0;

-- Layer 1 (8->8)
  signal act_1_1_1, act_1_1_2, act_1_1_4, act_1_4_1, act_1_4_4, act_1_4_6, act_1_4_7, act_1_5_5, act_1_5_6 : lut_output_t_1;
  signal out1_0, out1_1, out1_2, out1_3, out1_4, out1_5, out1_6, out1_7 : lut_output_t_1;
  signal out1_0_reg, out1_1_reg, out1_2_reg, out1_3_reg, out1_4_reg, out1_5_reg, out1_6_reg, out1_7_reg : lut_output_t_1;

-- Layer 2 (8->8)
  signal act_2_0_4, act_2_0_6, act_2_1_1, act_2_1_5, act_2_1_6, act_2_2_0, act_2_2_4, act_2_2_5, act_2_2_7, act_2_4_4, act_2_4_5, act_2_5_0, act_2_5_1, act_2_5_5, act_2_5_6, act_2_6_4 : lut_output_t_2;
  signal act_2_6_5, act_2_6_6, act_2_7_1, act_2_7_5, act_2_7_6, act_2_7_7 : lut_output_t_2;
  signal out2_0, out2_1, out2_2, out2_3, out2_4, out2_5, out2_6, out2_7 : lut_output_t_2;
  signal out2_0_reg, out2_1_reg, out2_2_reg, out2_3_reg, out2_4_reg, out2_5_reg, out2_6_reg, out2_7_reg : lut_output_t_2;

-- Layer 3 (8->128)
  signal act_3_0_0, act_3_0_1, act_3_0_3, act_3_0_5, act_3_0_6, act_3_0_7, act_3_0_8, act_3_0_9, act_3_0_10, act_3_0_11, act_3_0_12, act_3_0_13, act_3_0_16, act_3_0_20, act_3_0_21, act_3_0_24 : lut_output_t_3;
  signal act_3_0_25, act_3_0_26, act_3_0_27, act_3_0_28, act_3_0_30, act_3_0_32, act_3_0_33, act_3_0_34, act_3_0_35, act_3_0_36, act_3_0_37, act_3_0_38, act_3_0_39, act_3_0_40, act_3_0_41, act_3_0_42 : lut_output_t_3;
  signal act_3_0_43, act_3_0_44, act_3_0_45, act_3_0_46, act_3_0_47, act_3_0_48, act_3_0_49, act_3_0_50, act_3_0_51, act_3_0_52, act_3_0_53, act_3_0_54, act_3_0_55, act_3_0_56, act_3_0_57, act_3_0_58 : lut_output_t_3;
  signal act_3_0_60, act_3_0_61, act_3_0_62, act_3_0_63, act_3_0_64, act_3_0_65, act_3_0_66, act_3_0_67, act_3_0_68, act_3_0_69, act_3_0_70, act_3_0_71, act_3_0_72, act_3_0_73, act_3_0_74, act_3_0_75 : lut_output_t_3;
  signal act_3_0_76, act_3_0_77, act_3_0_78, act_3_0_79, act_3_0_80, act_3_0_81, act_3_0_82, act_3_0_83, act_3_0_84, act_3_0_85, act_3_0_86, act_3_0_87, act_3_0_88, act_3_0_89, act_3_0_90, act_3_0_91 : lut_output_t_3;
  signal act_3_0_92, act_3_0_93, act_3_0_94, act_3_0_95, act_3_0_96, act_3_0_97, act_3_0_98, act_3_0_99, act_3_0_100, act_3_0_101, act_3_0_102, act_3_0_103, act_3_0_104, act_3_0_105, act_3_0_106, act_3_0_107 : lut_output_t_3;
  signal act_3_0_108, act_3_0_109, act_3_0_110, act_3_0_111, act_3_0_112, act_3_0_113, act_3_0_114, act_3_0_115, act_3_0_116, act_3_0_117, act_3_0_118, act_3_0_119, act_3_0_120, act_3_0_121, act_3_0_122, act_3_0_123 : lut_output_t_3;
  signal act_3_0_124, act_3_0_125, act_3_0_126, act_3_0_127, act_3_1_0, act_3_1_3, act_3_1_4, act_3_1_5, act_3_1_7, act_3_1_8, act_3_1_9, act_3_1_10, act_3_1_11, act_3_1_12, act_3_1_13, act_3_1_16 : lut_output_t_3;
  signal act_3_1_17, act_3_1_18, act_3_1_24, act_3_1_25, act_3_1_26, act_3_1_27, act_3_1_28, act_3_1_29, act_3_1_30, act_3_1_31, act_3_1_35, act_3_1_36, act_3_1_38, act_3_1_40, act_3_1_41, act_3_1_42 : lut_output_t_3;
  signal act_3_1_47, act_3_1_51, act_3_1_55, act_3_1_56, act_3_1_57, act_3_1_58, act_3_1_59, act_3_1_61, act_3_1_63, act_3_1_64, act_3_1_66, act_3_1_67, act_3_1_68, act_3_1_69, act_3_1_70, act_3_1_71 : lut_output_t_3;
  signal act_3_1_72, act_3_1_74, act_3_1_77, act_3_1_78, act_3_1_79, act_3_1_80, act_3_1_81, act_3_1_82, act_3_1_83, act_3_1_85, act_3_1_86, act_3_1_87, act_3_1_88, act_3_1_89, act_3_1_91, act_3_1_92 : lut_output_t_3;
  signal act_3_1_94, act_3_1_95, act_3_1_98, act_3_1_100, act_3_1_101, act_3_1_102, act_3_1_103, act_3_1_107, act_3_1_109, act_3_1_111, act_3_1_112, act_3_1_113, act_3_1_116, act_3_1_119, act_3_1_120, act_3_1_121 : lut_output_t_3;
  signal act_3_1_123, act_3_4_0, act_3_4_1, act_3_4_2, act_3_4_3, act_3_4_4, act_3_4_5, act_3_4_7, act_3_4_8, act_3_4_9, act_3_4_10, act_3_4_11, act_3_4_12, act_3_4_13, act_3_4_15, act_3_4_16 : lut_output_t_3;
  signal act_3_4_17, act_3_4_18, act_3_4_19, act_3_4_20, act_3_4_21, act_3_4_22, act_3_4_23, act_3_4_25, act_3_4_26, act_3_4_27, act_3_4_28, act_3_4_29, act_3_4_30, act_3_4_31, act_3_4_32, act_3_4_33 : lut_output_t_3;
  signal act_3_4_34, act_3_4_35, act_3_4_36, act_3_4_37, act_3_4_38, act_3_4_39, act_3_4_40, act_3_4_41, act_3_4_42, act_3_4_43, act_3_4_44, act_3_4_45, act_3_4_46, act_3_4_47, act_3_4_48, act_3_4_49 : lut_output_t_3;
  signal act_3_4_50, act_3_4_51, act_3_4_52, act_3_4_53, act_3_4_54, act_3_4_55, act_3_4_56, act_3_4_58, act_3_4_59, act_3_4_60, act_3_4_61, act_3_4_62, act_3_4_63, act_3_4_64, act_3_4_65, act_3_4_66 : lut_output_t_3;
  signal act_3_4_67, act_3_4_69, act_3_4_70, act_3_4_71, act_3_4_73, act_3_4_74, act_3_4_75, act_3_4_76, act_3_4_78, act_3_4_79, act_3_4_80, act_3_4_81, act_3_4_82, act_3_4_83, act_3_4_84, act_3_4_85 : lut_output_t_3;
  signal act_3_4_87, act_3_4_88, act_3_4_89, act_3_4_90, act_3_4_91, act_3_4_92, act_3_4_93, act_3_4_94, act_3_4_95, act_3_4_96, act_3_4_98, act_3_4_100, act_3_4_101, act_3_4_102, act_3_4_103, act_3_4_105 : lut_output_t_3;
  signal act_3_4_106, act_3_4_107, act_3_4_108, act_3_4_110, act_3_4_114, act_3_4_115, act_3_4_116, act_3_4_118, act_3_4_119, act_3_4_120, act_3_4_124, act_3_4_125, act_3_4_127, act_3_5_0, act_3_5_1, act_3_5_2 : lut_output_t_3;
  signal act_3_5_3, act_3_5_5, act_3_5_6, act_3_5_7, act_3_5_8, act_3_5_10, act_3_5_11, act_3_5_12, act_3_5_13, act_3_5_14, act_3_5_15, act_3_5_16, act_3_5_17, act_3_5_18, act_3_5_19, act_3_5_20 : lut_output_t_3;
  signal act_3_5_21, act_3_5_22, act_3_5_23, act_3_5_24, act_3_5_25, act_3_5_26, act_3_5_27, act_3_5_28, act_3_5_29, act_3_5_30, act_3_5_31, act_3_5_32, act_3_5_33, act_3_5_34, act_3_5_35, act_3_5_36 : lut_output_t_3;
  signal act_3_5_37, act_3_5_38, act_3_5_39, act_3_5_40, act_3_5_41, act_3_5_42, act_3_5_43, act_3_5_44, act_3_5_45, act_3_5_46, act_3_5_47, act_3_5_48, act_3_5_50, act_3_5_51, act_3_5_52, act_3_5_53 : lut_output_t_3;
  signal act_3_5_54, act_3_5_55, act_3_5_56, act_3_5_57, act_3_5_58, act_3_5_59, act_3_5_60, act_3_5_61, act_3_5_62, act_3_5_63, act_3_5_64, act_3_5_65, act_3_5_66, act_3_5_67, act_3_5_68, act_3_5_69 : lut_output_t_3;
  signal act_3_5_70, act_3_5_71, act_3_5_72, act_3_5_73, act_3_5_74, act_3_5_75, act_3_5_76, act_3_5_77, act_3_5_78, act_3_5_79, act_3_5_80, act_3_5_81, act_3_5_82, act_3_5_83, act_3_5_84, act_3_5_85 : lut_output_t_3;
  signal act_3_5_86, act_3_5_87, act_3_5_88, act_3_5_89, act_3_5_91, act_3_5_92, act_3_5_93, act_3_5_94, act_3_5_95, act_3_5_96, act_3_5_97, act_3_5_98, act_3_5_101, act_3_5_102, act_3_5_103, act_3_5_104 : lut_output_t_3;
  signal act_3_5_105, act_3_5_106, act_3_5_107, act_3_5_108, act_3_5_109, act_3_5_110, act_3_5_111, act_3_5_112, act_3_5_113, act_3_5_114, act_3_5_115, act_3_5_116, act_3_5_117, act_3_5_118, act_3_5_119, act_3_5_123 : lut_output_t_3;
  signal act_3_5_124, act_3_5_125, act_3_5_126, act_3_5_127, act_3_6_0, act_3_6_5, act_3_6_6, act_3_6_8, act_3_6_9, act_3_6_12, act_3_6_13, act_3_6_14, act_3_6_15, act_3_6_16, act_3_6_17, act_3_6_19 : lut_output_t_3;
  signal act_3_6_20, act_3_6_24, act_3_6_25, act_3_6_27, act_3_6_28, act_3_6_29, act_3_6_30, act_3_6_31, act_3_6_32, act_3_6_33, act_3_6_34, act_3_6_35, act_3_6_36, act_3_6_37, act_3_6_39, act_3_6_40 : lut_output_t_3;
  signal act_3_6_41, act_3_6_42, act_3_6_43, act_3_6_44, act_3_6_46, act_3_6_47, act_3_6_48, act_3_6_49, act_3_6_50, act_3_6_51, act_3_6_52, act_3_6_53, act_3_6_54, act_3_6_55, act_3_6_56, act_3_6_57 : lut_output_t_3;
  signal act_3_6_58, act_3_6_60, act_3_6_68, act_3_6_70, act_3_6_71, act_3_6_72, act_3_6_76, act_3_6_77, act_3_6_78, act_3_6_80, act_3_6_82, act_3_6_84, act_3_6_85, act_3_6_86, act_3_6_87, act_3_6_88 : lut_output_t_3;
  signal act_3_6_89, act_3_6_92, act_3_6_93, act_3_6_95, act_3_6_96, act_3_6_97, act_3_6_98, act_3_6_99, act_3_6_100, act_3_6_101, act_3_6_103, act_3_6_104, act_3_6_105, act_3_6_106, act_3_6_107, act_3_6_108 : lut_output_t_3;
  signal act_3_6_109, act_3_6_110, act_3_6_112, act_3_6_113, act_3_6_114, act_3_6_115, act_3_6_116, act_3_6_117, act_3_6_118, act_3_6_119, act_3_6_120, act_3_6_121, act_3_6_123, act_3_7_0, act_3_7_1, act_3_7_3 : lut_output_t_3;
  signal act_3_7_4, act_3_7_6, act_3_7_7, act_3_7_9, act_3_7_11, act_3_7_12, act_3_7_14, act_3_7_16, act_3_7_18, act_3_7_19, act_3_7_20, act_3_7_21, act_3_7_23, act_3_7_24, act_3_7_25, act_3_7_27 : lut_output_t_3;
  signal act_3_7_28, act_3_7_29, act_3_7_30, act_3_7_31, act_3_7_32, act_3_7_33, act_3_7_34, act_3_7_35, act_3_7_36, act_3_7_37, act_3_7_39, act_3_7_40, act_3_7_43, act_3_7_44, act_3_7_45, act_3_7_46 : lut_output_t_3;
  signal act_3_7_47, act_3_7_48, act_3_7_50, act_3_7_51, act_3_7_52, act_3_7_53, act_3_7_55, act_3_7_56, act_3_7_58, act_3_7_59, act_3_7_60, act_3_7_61, act_3_7_62, act_3_7_64, act_3_7_65, act_3_7_66 : lut_output_t_3;
  signal act_3_7_68, act_3_7_69, act_3_7_72, act_3_7_74, act_3_7_75, act_3_7_76, act_3_7_77, act_3_7_78, act_3_7_79, act_3_7_80, act_3_7_83, act_3_7_85, act_3_7_86, act_3_7_87, act_3_7_88, act_3_7_89 : lut_output_t_3;
  signal act_3_7_90, act_3_7_91, act_3_7_93, act_3_7_94, act_3_7_95, act_3_7_96, act_3_7_97, act_3_7_98, act_3_7_101, act_3_7_102, act_3_7_103, act_3_7_104, act_3_7_106, act_3_7_107, act_3_7_108, act_3_7_109 : lut_output_t_3;
  signal act_3_7_110, act_3_7_111, act_3_7_112, act_3_7_113, act_3_7_114, act_3_7_115, act_3_7_116, act_3_7_117, act_3_7_118, act_3_7_119, act_3_7_120, act_3_7_121, act_3_7_122, act_3_7_123, act_3_7_124, act_3_7_125 : lut_output_t_3;
  signal act_3_7_127 : lut_output_t_3;
begin

  -- === auto: layer blocks ===
  -- LAYER 0, ch 0
  gen_l0c0 : block
  
  begin
    out0_0 <= (others => '0');
  end block;

  -- LAYER 0, ch 1
  gen_l0c1 : block
  signal s1_0, s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7, s1_8, s1_9, s1_10, s1_11, s1_12, s1_13, s1_14, s1_15 : sum_t_0_1;
  signal s2_0, s2_1, s2_2, s2_3 : sum_t_0_1;
  signal s3_0 : sum_t_0_1;
  signal sum_0_1 : sum_t_0_1;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_1_1.mem") port map (clk, input(1), act_0_1_1);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_1.mem") port map (clk, input(4), act_0_4_1);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_1.mem") port map (clk, input(6), act_0_6_1);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_10_1.mem") port map (clk, input(10), act_0_10_1);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_11_1.mem") port map (clk, input(11), act_0_11_1);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_13_1.mem") port map (clk, input(13), act_0_13_1);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_17_1.mem") port map (clk, input(17), act_0_17_1);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_19_1.mem") port map (clk, input(19), act_0_19_1);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_21_1.mem") port map (clk, input(21), act_0_21_1);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_24_1.mem") port map (clk, input(24), act_0_24_1);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_26_1.mem") port map (clk, input(26), act_0_26_1);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_27_1.mem") port map (clk, input(27), act_0_27_1);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_29_1.mem") port map (clk, input(29), act_0_29_1);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_30_1.mem") port map (clk, input(30), act_0_30_1);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_31_1.mem") port map (clk, input(31), act_0_31_1);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_32_1.mem") port map (clk, input(32), act_0_32_1);
    i16 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_33_1.mem") port map (clk, input(33), act_0_33_1);
    i17 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_34_1.mem") port map (clk, input(34), act_0_34_1);
    i18 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_35_1.mem") port map (clk, input(35), act_0_35_1);
    i19 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_36_1.mem") port map (clk, input(36), act_0_36_1);
    i20 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_39_1.mem") port map (clk, input(39), act_0_39_1);
    i21 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_43_1.mem") port map (clk, input(43), act_0_43_1);
    i22 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_44_1.mem") port map (clk, input(44), act_0_44_1);
    i23 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_46_1.mem") port map (clk, input(46), act_0_46_1);
    i24 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_48_1.mem") port map (clk, input(48), act_0_48_1);
    i25 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_52_1.mem") port map (clk, input(52), act_0_52_1);
    i26 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_55_1.mem") port map (clk, input(55), act_0_55_1);
    i27 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_56_1.mem") port map (clk, input(56), act_0_56_1);
    i28 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_57_1.mem") port map (clk, input(57), act_0_57_1);
    i29 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_58_1.mem") port map (clk, input(58), act_0_58_1);
    i30 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_59_1.mem") port map (clk, input(59), act_0_59_1);
    i31 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_61_1.mem") port map (clk, input(61), act_0_61_1);
    i32 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_62_1.mem") port map (clk, input(62), act_0_62_1);
    i33 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_63_1.mem") port map (clk, input(63), act_0_63_1);
    i34 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_66_1.mem") port map (clk, input(66), act_0_66_1);
    i35 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_67_1.mem") port map (clk, input(67), act_0_67_1);
    i36 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_68_1.mem") port map (clk, input(68), act_0_68_1);
    i37 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_70_1.mem") port map (clk, input(70), act_0_70_1);
    i38 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_71_1.mem") port map (clk, input(71), act_0_71_1);
    i39 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_74_1.mem") port map (clk, input(74), act_0_74_1);
    i40 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_75_1.mem") port map (clk, input(75), act_0_75_1);
    i41 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_77_1.mem") port map (clk, input(77), act_0_77_1);
    i42 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_78_1.mem") port map (clk, input(78), act_0_78_1);
    i43 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_79_1.mem") port map (clk, input(79), act_0_79_1);
    i44 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_80_1.mem") port map (clk, input(80), act_0_80_1);
    i45 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_82_1.mem") port map (clk, input(82), act_0_82_1);
    i46 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_83_1.mem") port map (clk, input(83), act_0_83_1);
    i47 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_85_1.mem") port map (clk, input(85), act_0_85_1);
    i48 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_89_1.mem") port map (clk, input(89), act_0_89_1);
    i49 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_92_1.mem") port map (clk, input(92), act_0_92_1);
    i50 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_93_1.mem") port map (clk, input(93), act_0_93_1);
    i51 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_94_1.mem") port map (clk, input(94), act_0_94_1);
    i52 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_96_1.mem") port map (clk, input(96), act_0_96_1);
    i53 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_100_1.mem") port map (clk, input(100), act_0_100_1);
    i54 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_103_1.mem") port map (clk, input(103), act_0_103_1);
    i55 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_105_1.mem") port map (clk, input(105), act_0_105_1);
    i56 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_116_1.mem") port map (clk, input(116), act_0_116_1);
    i57 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_118_1.mem") port map (clk, input(118), act_0_118_1);
    i58 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_119_1.mem") port map (clk, input(119), act_0_119_1);
    i59 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_120_1.mem") port map (clk, input(120), act_0_120_1);
    i60 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_122_1.mem") port map (clk, input(122), act_0_122_1);
    i61 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_125_1.mem") port map (clk, input(125), act_0_125_1);
    i62 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_126_1.mem") port map (clk, input(126), act_0_126_1);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_1_1, SUM_WIDTH_0_1) + resize(act_0_4_1, SUM_WIDTH_0_1) + resize(act_0_6_1, SUM_WIDTH_0_1) + resize(act_0_10_1, SUM_WIDTH_0_1);
        s1_1 <= resize(act_0_11_1, SUM_WIDTH_0_1) + resize(act_0_13_1, SUM_WIDTH_0_1) + resize(act_0_17_1, SUM_WIDTH_0_1) + resize(act_0_19_1, SUM_WIDTH_0_1);
        s1_2 <= resize(act_0_21_1, SUM_WIDTH_0_1) + resize(act_0_24_1, SUM_WIDTH_0_1) + resize(act_0_26_1, SUM_WIDTH_0_1) + resize(act_0_27_1, SUM_WIDTH_0_1);
        s1_3 <= resize(act_0_29_1, SUM_WIDTH_0_1) + resize(act_0_30_1, SUM_WIDTH_0_1) + resize(act_0_31_1, SUM_WIDTH_0_1) + resize(act_0_32_1, SUM_WIDTH_0_1);
        s1_4 <= resize(act_0_33_1, SUM_WIDTH_0_1) + resize(act_0_34_1, SUM_WIDTH_0_1) + resize(act_0_35_1, SUM_WIDTH_0_1) + resize(act_0_36_1, SUM_WIDTH_0_1);
        s1_5 <= resize(act_0_39_1, SUM_WIDTH_0_1) + resize(act_0_43_1, SUM_WIDTH_0_1) + resize(act_0_44_1, SUM_WIDTH_0_1) + resize(act_0_46_1, SUM_WIDTH_0_1);
        s1_6 <= resize(act_0_48_1, SUM_WIDTH_0_1) + resize(act_0_52_1, SUM_WIDTH_0_1) + resize(act_0_55_1, SUM_WIDTH_0_1) + resize(act_0_56_1, SUM_WIDTH_0_1);
        s1_7 <= resize(act_0_57_1, SUM_WIDTH_0_1) + resize(act_0_58_1, SUM_WIDTH_0_1) + resize(act_0_59_1, SUM_WIDTH_0_1) + resize(act_0_61_1, SUM_WIDTH_0_1);
        s1_8 <= resize(act_0_62_1, SUM_WIDTH_0_1) + resize(act_0_63_1, SUM_WIDTH_0_1) + resize(act_0_66_1, SUM_WIDTH_0_1) + resize(act_0_67_1, SUM_WIDTH_0_1);
        s1_9 <= resize(act_0_68_1, SUM_WIDTH_0_1) + resize(act_0_70_1, SUM_WIDTH_0_1) + resize(act_0_71_1, SUM_WIDTH_0_1) + resize(act_0_74_1, SUM_WIDTH_0_1);
        s1_10 <= resize(act_0_75_1, SUM_WIDTH_0_1) + resize(act_0_77_1, SUM_WIDTH_0_1) + resize(act_0_78_1, SUM_WIDTH_0_1) + resize(act_0_79_1, SUM_WIDTH_0_1);
        s1_11 <= resize(act_0_80_1, SUM_WIDTH_0_1) + resize(act_0_82_1, SUM_WIDTH_0_1) + resize(act_0_83_1, SUM_WIDTH_0_1) + resize(act_0_85_1, SUM_WIDTH_0_1);
        s1_12 <= resize(act_0_89_1, SUM_WIDTH_0_1) + resize(act_0_92_1, SUM_WIDTH_0_1) + resize(act_0_93_1, SUM_WIDTH_0_1) + resize(act_0_94_1, SUM_WIDTH_0_1);
        s1_13 <= resize(act_0_96_1, SUM_WIDTH_0_1) + resize(act_0_100_1, SUM_WIDTH_0_1) + resize(act_0_103_1, SUM_WIDTH_0_1) + resize(act_0_105_1, SUM_WIDTH_0_1);
        s1_14 <= resize(act_0_116_1, SUM_WIDTH_0_1) + resize(act_0_118_1, SUM_WIDTH_0_1) + resize(act_0_119_1, SUM_WIDTH_0_1) + resize(act_0_120_1, SUM_WIDTH_0_1);
        s1_15 <= resize(act_0_122_1, SUM_WIDTH_0_1) + resize(act_0_125_1, SUM_WIDTH_0_1) + resize(act_0_126_1, SUM_WIDTH_0_1);
        -- Stage 2
        s2_0 <= s1_0 + s1_1 + s1_2 + s1_3;
        s2_1 <= s1_4 + s1_5 + s1_6 + s1_7;
        s2_2 <= s1_8 + s1_9 + s1_10 + s1_11;
        s2_3 <= s1_12 + s1_13 + s1_14 + s1_15;
        -- Stage 3
        s3_0 <= s2_0 + s2_1 + s2_2 + s2_3;
        -- Stage 4
        sum_0_1 <= s3_0;
      end if;
    end process;
    out0_1 <= saturate(sum_0_1, 6);
  end block;

  -- LAYER 0, ch 2
  gen_l0c2 : block
  
  begin
    out0_2 <= (others => '0');
  end block;

  -- LAYER 0, ch 3
  gen_l0c3 : block
  
  begin
    out0_3 <= (others => '0');
  end block;

  -- LAYER 0, ch 4
  gen_l0c4 : block
  signal s1_0, s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7, s1_8, s1_9, s1_10, s1_11, s1_12, s1_13, s1_14, s1_15, s1_16, s1_17, s1_18, s1_19, s1_20, s1_21, s1_22, s1_23, s1_24, s1_25, s1_26, s1_27 : sum_t_0_4;
  signal s2_0, s2_1, s2_2, s2_3, s2_4, s2_5, s2_6 : sum_t_0_4;
  signal s3_0, s3_1 : sum_t_0_4;
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
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_16_4.mem") port map (clk, input(16), act_0_16_4);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_17_4.mem") port map (clk, input(17), act_0_17_4);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_18_4.mem") port map (clk, input(18), act_0_18_4);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_20_4.mem") port map (clk, input(20), act_0_20_4);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_21_4.mem") port map (clk, input(21), act_0_21_4);
    i16 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_22_4.mem") port map (clk, input(22), act_0_22_4);
    i17 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_23_4.mem") port map (clk, input(23), act_0_23_4);
    i18 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_24_4.mem") port map (clk, input(24), act_0_24_4);
    i19 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_25_4.mem") port map (clk, input(25), act_0_25_4);
    i20 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_26_4.mem") port map (clk, input(26), act_0_26_4);
    i21 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_27_4.mem") port map (clk, input(27), act_0_27_4);
    i22 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_28_4.mem") port map (clk, input(28), act_0_28_4);
    i23 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_30_4.mem") port map (clk, input(30), act_0_30_4);
    i24 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_31_4.mem") port map (clk, input(31), act_0_31_4);
    i25 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_32_4.mem") port map (clk, input(32), act_0_32_4);
    i26 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_33_4.mem") port map (clk, input(33), act_0_33_4);
    i27 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_34_4.mem") port map (clk, input(34), act_0_34_4);
    i28 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_35_4.mem") port map (clk, input(35), act_0_35_4);
    i29 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_36_4.mem") port map (clk, input(36), act_0_36_4);
    i30 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_37_4.mem") port map (clk, input(37), act_0_37_4);
    i31 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_38_4.mem") port map (clk, input(38), act_0_38_4);
    i32 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_39_4.mem") port map (clk, input(39), act_0_39_4);
    i33 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_41_4.mem") port map (clk, input(41), act_0_41_4);
    i34 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_43_4.mem") port map (clk, input(43), act_0_43_4);
    i35 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_44_4.mem") port map (clk, input(44), act_0_44_4);
    i36 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_45_4.mem") port map (clk, input(45), act_0_45_4);
    i37 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_46_4.mem") port map (clk, input(46), act_0_46_4);
    i38 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_47_4.mem") port map (clk, input(47), act_0_47_4);
    i39 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_48_4.mem") port map (clk, input(48), act_0_48_4);
    i40 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_49_4.mem") port map (clk, input(49), act_0_49_4);
    i41 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_50_4.mem") port map (clk, input(50), act_0_50_4);
    i42 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_52_4.mem") port map (clk, input(52), act_0_52_4);
    i43 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_53_4.mem") port map (clk, input(53), act_0_53_4);
    i44 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_55_4.mem") port map (clk, input(55), act_0_55_4);
    i45 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_56_4.mem") port map (clk, input(56), act_0_56_4);
    i46 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_57_4.mem") port map (clk, input(57), act_0_57_4);
    i47 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_58_4.mem") port map (clk, input(58), act_0_58_4);
    i48 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_59_4.mem") port map (clk, input(59), act_0_59_4);
    i49 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_60_4.mem") port map (clk, input(60), act_0_60_4);
    i50 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_61_4.mem") port map (clk, input(61), act_0_61_4);
    i51 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_62_4.mem") port map (clk, input(62), act_0_62_4);
    i52 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_63_4.mem") port map (clk, input(63), act_0_63_4);
    i53 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_64_4.mem") port map (clk, input(64), act_0_64_4);
    i54 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_65_4.mem") port map (clk, input(65), act_0_65_4);
    i55 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_66_4.mem") port map (clk, input(66), act_0_66_4);
    i56 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_67_4.mem") port map (clk, input(67), act_0_67_4);
    i57 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_68_4.mem") port map (clk, input(68), act_0_68_4);
    i58 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_69_4.mem") port map (clk, input(69), act_0_69_4);
    i59 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_73_4.mem") port map (clk, input(73), act_0_73_4);
    i60 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_74_4.mem") port map (clk, input(74), act_0_74_4);
    i61 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_75_4.mem") port map (clk, input(75), act_0_75_4);
    i62 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_77_4.mem") port map (clk, input(77), act_0_77_4);
    i63 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_78_4.mem") port map (clk, input(78), act_0_78_4);
    i64 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_79_4.mem") port map (clk, input(79), act_0_79_4);
    i65 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_80_4.mem") port map (clk, input(80), act_0_80_4);
    i66 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_81_4.mem") port map (clk, input(81), act_0_81_4);
    i67 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_82_4.mem") port map (clk, input(82), act_0_82_4);
    i68 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_83_4.mem") port map (clk, input(83), act_0_83_4);
    i69 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_84_4.mem") port map (clk, input(84), act_0_84_4);
    i70 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_85_4.mem") port map (clk, input(85), act_0_85_4);
    i71 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_86_4.mem") port map (clk, input(86), act_0_86_4);
    i72 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_87_4.mem") port map (clk, input(87), act_0_87_4);
    i73 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_88_4.mem") port map (clk, input(88), act_0_88_4);
    i74 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_89_4.mem") port map (clk, input(89), act_0_89_4);
    i75 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_90_4.mem") port map (clk, input(90), act_0_90_4);
    i76 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_91_4.mem") port map (clk, input(91), act_0_91_4);
    i77 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_92_4.mem") port map (clk, input(92), act_0_92_4);
    i78 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_93_4.mem") port map (clk, input(93), act_0_93_4);
    i79 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_94_4.mem") port map (clk, input(94), act_0_94_4);
    i80 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_95_4.mem") port map (clk, input(95), act_0_95_4);
    i81 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_96_4.mem") port map (clk, input(96), act_0_96_4);
    i82 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_97_4.mem") port map (clk, input(97), act_0_97_4);
    i83 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_98_4.mem") port map (clk, input(98), act_0_98_4);
    i84 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_99_4.mem") port map (clk, input(99), act_0_99_4);
    i85 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_100_4.mem") port map (clk, input(100), act_0_100_4);
    i86 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_101_4.mem") port map (clk, input(101), act_0_101_4);
    i87 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_102_4.mem") port map (clk, input(102), act_0_102_4);
    i88 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_103_4.mem") port map (clk, input(103), act_0_103_4);
    i89 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_104_4.mem") port map (clk, input(104), act_0_104_4);
    i90 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_105_4.mem") port map (clk, input(105), act_0_105_4);
    i91 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_106_4.mem") port map (clk, input(106), act_0_106_4);
    i92 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_107_4.mem") port map (clk, input(107), act_0_107_4);
    i93 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_108_4.mem") port map (clk, input(108), act_0_108_4);
    i94 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_109_4.mem") port map (clk, input(109), act_0_109_4);
    i95 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_110_4.mem") port map (clk, input(110), act_0_110_4);
    i96 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_112_4.mem") port map (clk, input(112), act_0_112_4);
    i97 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_113_4.mem") port map (clk, input(113), act_0_113_4);
    i98 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_114_4.mem") port map (clk, input(114), act_0_114_4);
    i99 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_115_4.mem") port map (clk, input(115), act_0_115_4);
    i100 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_118_4.mem") port map (clk, input(118), act_0_118_4);
    i101 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_119_4.mem") port map (clk, input(119), act_0_119_4);
    i102 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_120_4.mem") port map (clk, input(120), act_0_120_4);
    i103 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_121_4.mem") port map (clk, input(121), act_0_121_4);
    i104 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_122_4.mem") port map (clk, input(122), act_0_122_4);
    i105 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_123_4.mem") port map (clk, input(123), act_0_123_4);
    i106 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_124_4.mem") port map (clk, input(124), act_0_124_4);
    i107 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_125_4.mem") port map (clk, input(125), act_0_125_4);
    i108 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_126_4.mem") port map (clk, input(126), act_0_126_4);
    i109 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_127_4.mem") port map (clk, input(127), act_0_127_4);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_0_4, SUM_WIDTH_0_4) + resize(act_0_1_4, SUM_WIDTH_0_4) + resize(act_0_2_4, SUM_WIDTH_0_4) + resize(act_0_3_4, SUM_WIDTH_0_4);
        s1_1 <= resize(act_0_4_4, SUM_WIDTH_0_4) + resize(act_0_5_4, SUM_WIDTH_0_4) + resize(act_0_6_4, SUM_WIDTH_0_4) + resize(act_0_7_4, SUM_WIDTH_0_4);
        s1_2 <= resize(act_0_8_4, SUM_WIDTH_0_4) + resize(act_0_9_4, SUM_WIDTH_0_4) + resize(act_0_10_4, SUM_WIDTH_0_4) + resize(act_0_16_4, SUM_WIDTH_0_4);
        s1_3 <= resize(act_0_17_4, SUM_WIDTH_0_4) + resize(act_0_18_4, SUM_WIDTH_0_4) + resize(act_0_20_4, SUM_WIDTH_0_4) + resize(act_0_21_4, SUM_WIDTH_0_4);
        s1_4 <= resize(act_0_22_4, SUM_WIDTH_0_4) + resize(act_0_23_4, SUM_WIDTH_0_4) + resize(act_0_24_4, SUM_WIDTH_0_4) + resize(act_0_25_4, SUM_WIDTH_0_4);
        s1_5 <= resize(act_0_26_4, SUM_WIDTH_0_4) + resize(act_0_27_4, SUM_WIDTH_0_4) + resize(act_0_28_4, SUM_WIDTH_0_4) + resize(act_0_30_4, SUM_WIDTH_0_4);
        s1_6 <= resize(act_0_31_4, SUM_WIDTH_0_4) + resize(act_0_32_4, SUM_WIDTH_0_4) + resize(act_0_33_4, SUM_WIDTH_0_4) + resize(act_0_34_4, SUM_WIDTH_0_4);
        s1_7 <= resize(act_0_35_4, SUM_WIDTH_0_4) + resize(act_0_36_4, SUM_WIDTH_0_4) + resize(act_0_37_4, SUM_WIDTH_0_4) + resize(act_0_38_4, SUM_WIDTH_0_4);
        s1_8 <= resize(act_0_39_4, SUM_WIDTH_0_4) + resize(act_0_41_4, SUM_WIDTH_0_4) + resize(act_0_43_4, SUM_WIDTH_0_4) + resize(act_0_44_4, SUM_WIDTH_0_4);
        s1_9 <= resize(act_0_45_4, SUM_WIDTH_0_4) + resize(act_0_46_4, SUM_WIDTH_0_4) + resize(act_0_47_4, SUM_WIDTH_0_4) + resize(act_0_48_4, SUM_WIDTH_0_4);
        s1_10 <= resize(act_0_49_4, SUM_WIDTH_0_4) + resize(act_0_50_4, SUM_WIDTH_0_4) + resize(act_0_52_4, SUM_WIDTH_0_4) + resize(act_0_53_4, SUM_WIDTH_0_4);
        s1_11 <= resize(act_0_55_4, SUM_WIDTH_0_4) + resize(act_0_56_4, SUM_WIDTH_0_4) + resize(act_0_57_4, SUM_WIDTH_0_4) + resize(act_0_58_4, SUM_WIDTH_0_4);
        s1_12 <= resize(act_0_59_4, SUM_WIDTH_0_4) + resize(act_0_60_4, SUM_WIDTH_0_4) + resize(act_0_61_4, SUM_WIDTH_0_4) + resize(act_0_62_4, SUM_WIDTH_0_4);
        s1_13 <= resize(act_0_63_4, SUM_WIDTH_0_4) + resize(act_0_64_4, SUM_WIDTH_0_4) + resize(act_0_65_4, SUM_WIDTH_0_4) + resize(act_0_66_4, SUM_WIDTH_0_4);
        s1_14 <= resize(act_0_67_4, SUM_WIDTH_0_4) + resize(act_0_68_4, SUM_WIDTH_0_4) + resize(act_0_69_4, SUM_WIDTH_0_4) + resize(act_0_73_4, SUM_WIDTH_0_4);
        s1_15 <= resize(act_0_74_4, SUM_WIDTH_0_4) + resize(act_0_75_4, SUM_WIDTH_0_4) + resize(act_0_77_4, SUM_WIDTH_0_4) + resize(act_0_78_4, SUM_WIDTH_0_4);
        s1_16 <= resize(act_0_79_4, SUM_WIDTH_0_4) + resize(act_0_80_4, SUM_WIDTH_0_4) + resize(act_0_81_4, SUM_WIDTH_0_4) + resize(act_0_82_4, SUM_WIDTH_0_4);
        s1_17 <= resize(act_0_83_4, SUM_WIDTH_0_4) + resize(act_0_84_4, SUM_WIDTH_0_4) + resize(act_0_85_4, SUM_WIDTH_0_4) + resize(act_0_86_4, SUM_WIDTH_0_4);
        s1_18 <= resize(act_0_87_4, SUM_WIDTH_0_4) + resize(act_0_88_4, SUM_WIDTH_0_4) + resize(act_0_89_4, SUM_WIDTH_0_4) + resize(act_0_90_4, SUM_WIDTH_0_4);
        s1_19 <= resize(act_0_91_4, SUM_WIDTH_0_4) + resize(act_0_92_4, SUM_WIDTH_0_4) + resize(act_0_93_4, SUM_WIDTH_0_4) + resize(act_0_94_4, SUM_WIDTH_0_4);
        s1_20 <= resize(act_0_95_4, SUM_WIDTH_0_4) + resize(act_0_96_4, SUM_WIDTH_0_4) + resize(act_0_97_4, SUM_WIDTH_0_4) + resize(act_0_98_4, SUM_WIDTH_0_4);
        s1_21 <= resize(act_0_99_4, SUM_WIDTH_0_4) + resize(act_0_100_4, SUM_WIDTH_0_4) + resize(act_0_101_4, SUM_WIDTH_0_4) + resize(act_0_102_4, SUM_WIDTH_0_4);
        s1_22 <= resize(act_0_103_4, SUM_WIDTH_0_4) + resize(act_0_104_4, SUM_WIDTH_0_4) + resize(act_0_105_4, SUM_WIDTH_0_4) + resize(act_0_106_4, SUM_WIDTH_0_4);
        s1_23 <= resize(act_0_107_4, SUM_WIDTH_0_4) + resize(act_0_108_4, SUM_WIDTH_0_4) + resize(act_0_109_4, SUM_WIDTH_0_4) + resize(act_0_110_4, SUM_WIDTH_0_4);
        s1_24 <= resize(act_0_112_4, SUM_WIDTH_0_4) + resize(act_0_113_4, SUM_WIDTH_0_4) + resize(act_0_114_4, SUM_WIDTH_0_4) + resize(act_0_115_4, SUM_WIDTH_0_4);
        s1_25 <= resize(act_0_118_4, SUM_WIDTH_0_4) + resize(act_0_119_4, SUM_WIDTH_0_4) + resize(act_0_120_4, SUM_WIDTH_0_4) + resize(act_0_121_4, SUM_WIDTH_0_4);
        s1_26 <= resize(act_0_122_4, SUM_WIDTH_0_4) + resize(act_0_123_4, SUM_WIDTH_0_4) + resize(act_0_124_4, SUM_WIDTH_0_4) + resize(act_0_125_4, SUM_WIDTH_0_4);
        s1_27 <= resize(act_0_126_4, SUM_WIDTH_0_4) + resize(act_0_127_4, SUM_WIDTH_0_4);
        -- Stage 2
        s2_0 <= s1_0 + s1_1 + s1_2 + s1_3;
        s2_1 <= s1_4 + s1_5 + s1_6 + s1_7;
        s2_2 <= s1_8 + s1_9 + s1_10 + s1_11;
        s2_3 <= s1_12 + s1_13 + s1_14 + s1_15;
        s2_4 <= s1_16 + s1_17 + s1_18 + s1_19;
        s2_5 <= s1_20 + s1_21 + s1_22 + s1_23;
        s2_6 <= s1_24 + s1_25 + s1_26 + s1_27;
        -- Stage 3
        s3_0 <= s2_0 + s2_1 + s2_2 + s2_3;
        s3_1 <= s2_4 + s2_5 + s2_6;
        -- Stage 4
        sum_0_4 <= s3_0 + s3_1;
      end if;
    end process;
    out0_4 <= saturate(sum_0_4, 6);
  end block;

  -- LAYER 0, ch 5
  gen_l0c5 : block
  signal s1_0, s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7, s1_8, s1_9, s1_10, s1_11, s1_12, s1_13, s1_14, s1_15, s1_16, s1_17, s1_18 : sum_t_0_5;
  signal s2_0, s2_1, s2_2, s2_3, s2_4 : sum_t_0_5;
  signal s3_0, s3_1 : sum_t_0_5;
  signal sum_0_5 : sum_t_0_5;
  begin
    i00 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_2_5.mem") port map (clk, input(2), act_0_2_5);
    i01 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_3_5.mem") port map (clk, input(3), act_0_3_5);
    i02 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_4_5.mem") port map (clk, input(4), act_0_4_5);
    i03 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_6_5.mem") port map (clk, input(6), act_0_6_5);
    i04 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_7_5.mem") port map (clk, input(7), act_0_7_5);
    i05 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_12_5.mem") port map (clk, input(12), act_0_12_5);
    i06 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_14_5.mem") port map (clk, input(14), act_0_14_5);
    i07 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_15_5.mem") port map (clk, input(15), act_0_15_5);
    i08 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_17_5.mem") port map (clk, input(17), act_0_17_5);
    i09 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_18_5.mem") port map (clk, input(18), act_0_18_5);
    i10 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_20_5.mem") port map (clk, input(20), act_0_20_5);
    i11 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_24_5.mem") port map (clk, input(24), act_0_24_5);
    i12 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_26_5.mem") port map (clk, input(26), act_0_26_5);
    i13 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_29_5.mem") port map (clk, input(29), act_0_29_5);
    i14 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_32_5.mem") port map (clk, input(32), act_0_32_5);
    i15 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_33_5.mem") port map (clk, input(33), act_0_33_5);
    i16 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_35_5.mem") port map (clk, input(35), act_0_35_5);
    i17 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_36_5.mem") port map (clk, input(36), act_0_36_5);
    i18 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_39_5.mem") port map (clk, input(39), act_0_39_5);
    i19 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_42_5.mem") port map (clk, input(42), act_0_42_5);
    i20 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_43_5.mem") port map (clk, input(43), act_0_43_5);
    i21 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_44_5.mem") port map (clk, input(44), act_0_44_5);
    i22 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_45_5.mem") port map (clk, input(45), act_0_45_5);
    i23 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_46_5.mem") port map (clk, input(46), act_0_46_5);
    i24 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_47_5.mem") port map (clk, input(47), act_0_47_5);
    i25 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_48_5.mem") port map (clk, input(48), act_0_48_5);
    i26 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_49_5.mem") port map (clk, input(49), act_0_49_5);
    i27 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_50_5.mem") port map (clk, input(50), act_0_50_5);
    i28 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_51_5.mem") port map (clk, input(51), act_0_51_5);
    i29 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_52_5.mem") port map (clk, input(52), act_0_52_5);
    i30 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_53_5.mem") port map (clk, input(53), act_0_53_5);
    i31 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_54_5.mem") port map (clk, input(54), act_0_54_5);
    i32 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_55_5.mem") port map (clk, input(55), act_0_55_5);
    i33 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_56_5.mem") port map (clk, input(56), act_0_56_5);
    i34 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_57_5.mem") port map (clk, input(57), act_0_57_5);
    i35 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_58_5.mem") port map (clk, input(58), act_0_58_5);
    i36 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_59_5.mem") port map (clk, input(59), act_0_59_5);
    i37 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_60_5.mem") port map (clk, input(60), act_0_60_5);
    i38 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_61_5.mem") port map (clk, input(61), act_0_61_5);
    i39 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_62_5.mem") port map (clk, input(62), act_0_62_5);
    i40 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_63_5.mem") port map (clk, input(63), act_0_63_5);
    i41 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_64_5.mem") port map (clk, input(64), act_0_64_5);
    i42 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_65_5.mem") port map (clk, input(65), act_0_65_5);
    i43 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_67_5.mem") port map (clk, input(67), act_0_67_5);
    i44 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_68_5.mem") port map (clk, input(68), act_0_68_5);
    i45 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_69_5.mem") port map (clk, input(69), act_0_69_5);
    i46 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_70_5.mem") port map (clk, input(70), act_0_70_5);
    i47 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_71_5.mem") port map (clk, input(71), act_0_71_5);
    i48 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_72_5.mem") port map (clk, input(72), act_0_72_5);
    i49 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_73_5.mem") port map (clk, input(73), act_0_73_5);
    i50 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_74_5.mem") port map (clk, input(74), act_0_74_5);
    i51 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_75_5.mem") port map (clk, input(75), act_0_75_5);
    i52 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_76_5.mem") port map (clk, input(76), act_0_76_5);
    i53 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_77_5.mem") port map (clk, input(77), act_0_77_5);
    i54 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_78_5.mem") port map (clk, input(78), act_0_78_5);
    i55 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_79_5.mem") port map (clk, input(79), act_0_79_5);
    i56 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_80_5.mem") port map (clk, input(80), act_0_80_5);
    i57 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_81_5.mem") port map (clk, input(81), act_0_81_5);
    i58 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_82_5.mem") port map (clk, input(82), act_0_82_5);
    i59 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_83_5.mem") port map (clk, input(83), act_0_83_5);
    i60 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_84_5.mem") port map (clk, input(84), act_0_84_5);
    i61 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_86_5.mem") port map (clk, input(86), act_0_86_5);
    i62 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_87_5.mem") port map (clk, input(87), act_0_87_5);
    i63 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_88_5.mem") port map (clk, input(88), act_0_88_5);
    i64 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_89_5.mem") port map (clk, input(89), act_0_89_5);
    i65 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_92_5.mem") port map (clk, input(92), act_0_92_5);
    i66 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_93_5.mem") port map (clk, input(93), act_0_93_5);
    i67 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_97_5.mem") port map (clk, input(97), act_0_97_5);
    i68 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_110_5.mem") port map (clk, input(110), act_0_110_5);
    i69 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_112_5.mem") port map (clk, input(112), act_0_112_5);
    i70 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_119_5.mem") port map (clk, input(119), act_0_119_5);
    i71 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_121_5.mem") port map (clk, input(121), act_0_121_5);
    i72 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_123_5.mem") port map (clk, input(123), act_0_123_5);
    i73 : entity work.LUT_0 generic map (MEMFILE=>"lut_0_125_5.mem") port map (clk, input(125), act_0_125_5);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_0_2_5, SUM_WIDTH_0_5) + resize(act_0_3_5, SUM_WIDTH_0_5) + resize(act_0_4_5, SUM_WIDTH_0_5) + resize(act_0_6_5, SUM_WIDTH_0_5);
        s1_1 <= resize(act_0_7_5, SUM_WIDTH_0_5) + resize(act_0_12_5, SUM_WIDTH_0_5) + resize(act_0_14_5, SUM_WIDTH_0_5) + resize(act_0_15_5, SUM_WIDTH_0_5);
        s1_2 <= resize(act_0_17_5, SUM_WIDTH_0_5) + resize(act_0_18_5, SUM_WIDTH_0_5) + resize(act_0_20_5, SUM_WIDTH_0_5) + resize(act_0_24_5, SUM_WIDTH_0_5);
        s1_3 <= resize(act_0_26_5, SUM_WIDTH_0_5) + resize(act_0_29_5, SUM_WIDTH_0_5) + resize(act_0_32_5, SUM_WIDTH_0_5) + resize(act_0_33_5, SUM_WIDTH_0_5);
        s1_4 <= resize(act_0_35_5, SUM_WIDTH_0_5) + resize(act_0_36_5, SUM_WIDTH_0_5) + resize(act_0_39_5, SUM_WIDTH_0_5) + resize(act_0_42_5, SUM_WIDTH_0_5);
        s1_5 <= resize(act_0_43_5, SUM_WIDTH_0_5) + resize(act_0_44_5, SUM_WIDTH_0_5) + resize(act_0_45_5, SUM_WIDTH_0_5) + resize(act_0_46_5, SUM_WIDTH_0_5);
        s1_6 <= resize(act_0_47_5, SUM_WIDTH_0_5) + resize(act_0_48_5, SUM_WIDTH_0_5) + resize(act_0_49_5, SUM_WIDTH_0_5) + resize(act_0_50_5, SUM_WIDTH_0_5);
        s1_7 <= resize(act_0_51_5, SUM_WIDTH_0_5) + resize(act_0_52_5, SUM_WIDTH_0_5) + resize(act_0_53_5, SUM_WIDTH_0_5) + resize(act_0_54_5, SUM_WIDTH_0_5);
        s1_8 <= resize(act_0_55_5, SUM_WIDTH_0_5) + resize(act_0_56_5, SUM_WIDTH_0_5) + resize(act_0_57_5, SUM_WIDTH_0_5) + resize(act_0_58_5, SUM_WIDTH_0_5);
        s1_9 <= resize(act_0_59_5, SUM_WIDTH_0_5) + resize(act_0_60_5, SUM_WIDTH_0_5) + resize(act_0_61_5, SUM_WIDTH_0_5) + resize(act_0_62_5, SUM_WIDTH_0_5);
        s1_10 <= resize(act_0_63_5, SUM_WIDTH_0_5) + resize(act_0_64_5, SUM_WIDTH_0_5) + resize(act_0_65_5, SUM_WIDTH_0_5) + resize(act_0_67_5, SUM_WIDTH_0_5);
        s1_11 <= resize(act_0_68_5, SUM_WIDTH_0_5) + resize(act_0_69_5, SUM_WIDTH_0_5) + resize(act_0_70_5, SUM_WIDTH_0_5) + resize(act_0_71_5, SUM_WIDTH_0_5);
        s1_12 <= resize(act_0_72_5, SUM_WIDTH_0_5) + resize(act_0_73_5, SUM_WIDTH_0_5) + resize(act_0_74_5, SUM_WIDTH_0_5) + resize(act_0_75_5, SUM_WIDTH_0_5);
        s1_13 <= resize(act_0_76_5, SUM_WIDTH_0_5) + resize(act_0_77_5, SUM_WIDTH_0_5) + resize(act_0_78_5, SUM_WIDTH_0_5) + resize(act_0_79_5, SUM_WIDTH_0_5);
        s1_14 <= resize(act_0_80_5, SUM_WIDTH_0_5) + resize(act_0_81_5, SUM_WIDTH_0_5) + resize(act_0_82_5, SUM_WIDTH_0_5) + resize(act_0_83_5, SUM_WIDTH_0_5);
        s1_15 <= resize(act_0_84_5, SUM_WIDTH_0_5) + resize(act_0_86_5, SUM_WIDTH_0_5) + resize(act_0_87_5, SUM_WIDTH_0_5) + resize(act_0_88_5, SUM_WIDTH_0_5);
        s1_16 <= resize(act_0_89_5, SUM_WIDTH_0_5) + resize(act_0_92_5, SUM_WIDTH_0_5) + resize(act_0_93_5, SUM_WIDTH_0_5) + resize(act_0_97_5, SUM_WIDTH_0_5);
        s1_17 <= resize(act_0_110_5, SUM_WIDTH_0_5) + resize(act_0_112_5, SUM_WIDTH_0_5) + resize(act_0_119_5, SUM_WIDTH_0_5) + resize(act_0_121_5, SUM_WIDTH_0_5);
        s1_18 <= resize(act_0_123_5, SUM_WIDTH_0_5) + resize(act_0_125_5, SUM_WIDTH_0_5);
        -- Stage 2
        s2_0 <= s1_0 + s1_1 + s1_2 + s1_3;
        s2_1 <= s1_4 + s1_5 + s1_6 + s1_7;
        s2_2 <= s1_8 + s1_9 + s1_10 + s1_11;
        s2_3 <= s1_12 + s1_13 + s1_14 + s1_15;
        s2_4 <= s1_16 + s1_17 + s1_18;
        -- Stage 3
        s3_0 <= s2_0 + s2_1 + s2_2 + s2_3;
        s3_1 <= s2_4;
        -- Stage 4
        sum_0_5 <= s3_0 + s3_1;
      end if;
    end process;
    out0_5 <= saturate(sum_0_5, 6);
  end block;

  -- LAYER 0, ch 6
  gen_l0c6 : block
  
  begin
    out0_6 <= (others => '0');
  end block;

  -- LAYER 0, ch 7
  gen_l0c7 : block
  
  begin
    out0_7 <= (others => '0');
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
      end if;
  end process;

  -- LAYER 1, ch 0
  gen_l1c0 : block
  
  begin
    out1_0 <= (others => '0');
  end block;

  -- LAYER 1, ch 1
  gen_l1c1 : block
  signal sum_1_1 : sum_t_1_1;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_1.mem") port map (clk, out0_1_reg, act_1_1_1);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_4_1.mem") port map (clk, out0_4_reg, act_1_4_1);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        sum_1_1 <= resize(act_1_1_1, SUM_WIDTH_1_1) + resize(act_1_4_1, SUM_WIDTH_1_1);
      end if;
    end process;
    out1_1 <= saturate(sum_1_1, 6);
  end block;

  -- LAYER 1, ch 2
  gen_l1c2 : block
  signal sum_1_2 : sum_t_1_2;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_2.mem") port map (clk, out0_1_reg, act_1_1_2);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        sum_1_2 <= resize(act_1_1_2, SUM_WIDTH_1_2);
      end if;
    end process;
    out1_2 <= saturate(sum_1_2, 6);
  end block;

  -- LAYER 1, ch 3
  gen_l1c3 : block
  
  begin
    out1_3 <= (others => '0');
  end block;

  -- LAYER 1, ch 4
  gen_l1c4 : block
  signal sum_1_4 : sum_t_1_4;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_1_4.mem") port map (clk, out0_1_reg, act_1_1_4);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_4_4.mem") port map (clk, out0_4_reg, act_1_4_4);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        sum_1_4 <= resize(act_1_1_4, SUM_WIDTH_1_4) + resize(act_1_4_4, SUM_WIDTH_1_4);
      end if;
    end process;
    out1_4 <= saturate(sum_1_4, 6);
  end block;

  -- LAYER 1, ch 5
  gen_l1c5 : block
  signal sum_1_5 : sum_t_1_5;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_5_5.mem") port map (clk, out0_5_reg, act_1_5_5);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        sum_1_5 <= resize(act_1_5_5, SUM_WIDTH_1_5);
      end if;
    end process;
    out1_5 <= saturate(sum_1_5, 6);
  end block;

  -- LAYER 1, ch 6
  gen_l1c6 : block
  signal sum_1_6 : sum_t_1_6;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_4_6.mem") port map (clk, out0_4_reg, act_1_4_6);
    i01 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_5_6.mem") port map (clk, out0_5_reg, act_1_5_6);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        sum_1_6 <= resize(act_1_4_6, SUM_WIDTH_1_6) + resize(act_1_5_6, SUM_WIDTH_1_6);
      end if;
    end process;
    out1_6 <= saturate(sum_1_6, 6);
  end block;

  -- LAYER 1, ch 7
  gen_l1c7 : block
  signal sum_1_7 : sum_t_1_7;
  begin
    i00 : entity work.LUT_1 generic map (MEMFILE=>"lut_1_4_7.mem") port map (clk, out0_4_reg, act_1_4_7);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        sum_1_7 <= resize(act_1_4_7, SUM_WIDTH_1_7);
      end if;
    end process;
    out1_7 <= saturate(sum_1_7, 6);
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
  signal s1_0 : sum_t_2_0;
  signal sum_2_0 : sum_t_2_0;
  begin
    i00 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_2_0.mem") port map (clk, out1_2_reg, act_2_2_0);
    i01 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_5_0.mem") port map (clk, out1_5_reg, act_2_5_0);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_2_2_0, SUM_WIDTH_2_0) + resize(act_2_5_0, SUM_WIDTH_2_0);
        -- Stage 2
        sum_2_0 <= s1_0;
      end if;
    end process;
    out2_0 <= saturate(sum_2_0, 6);
  end block;

  -- LAYER 2, ch 1
  gen_l2c1 : block
  signal s1_0 : sum_t_2_1;
  signal sum_2_1 : sum_t_2_1;
  begin
    i00 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_1_1.mem") port map (clk, out1_1_reg, act_2_1_1);
    i01 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_5_1.mem") port map (clk, out1_5_reg, act_2_5_1);
    i02 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_7_1.mem") port map (clk, out1_7_reg, act_2_7_1);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_2_1_1, SUM_WIDTH_2_1) + resize(act_2_5_1, SUM_WIDTH_2_1) + resize(act_2_7_1, SUM_WIDTH_2_1);
        -- Stage 2
        sum_2_1 <= s1_0;
      end if;
    end process;
    out2_1 <= saturate(sum_2_1, 6);
  end block;

  -- LAYER 2, ch 2
  gen_l2c2 : block
  
  begin
    out2_2 <= (others => '0');
  end block;

  -- LAYER 2, ch 3
  gen_l2c3 : block
  
  begin
    out2_3 <= (others => '0');
  end block;

  -- LAYER 2, ch 4
  gen_l2c4 : block
  signal s1_0 : sum_t_2_4;
  signal sum_2_4 : sum_t_2_4;
  begin
    i00 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_0_4.mem") port map (clk, out1_0_reg, act_2_0_4);
    i01 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_2_4.mem") port map (clk, out1_2_reg, act_2_2_4);
    i02 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_4_4.mem") port map (clk, out1_4_reg, act_2_4_4);
    i03 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_6_4.mem") port map (clk, out1_6_reg, act_2_6_4);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_2_0_4, SUM_WIDTH_2_4) + resize(act_2_2_4, SUM_WIDTH_2_4) + resize(act_2_4_4, SUM_WIDTH_2_4) + resize(act_2_6_4, SUM_WIDTH_2_4);
        -- Stage 2
        sum_2_4 <= s1_0;
      end if;
    end process;
    out2_4 <= saturate(sum_2_4, 6);
  end block;

  -- LAYER 2, ch 5
  gen_l2c5 : block
  signal s1_0, s1_1 : sum_t_2_5;
  signal sum_2_5 : sum_t_2_5;
  begin
    i00 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_1_5.mem") port map (clk, out1_1_reg, act_2_1_5);
    i01 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_2_5.mem") port map (clk, out1_2_reg, act_2_2_5);
    i02 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_4_5.mem") port map (clk, out1_4_reg, act_2_4_5);
    i03 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_5_5.mem") port map (clk, out1_5_reg, act_2_5_5);
    i04 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_6_5.mem") port map (clk, out1_6_reg, act_2_6_5);
    i05 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_7_5.mem") port map (clk, out1_7_reg, act_2_7_5);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_2_1_5, SUM_WIDTH_2_5) + resize(act_2_2_5, SUM_WIDTH_2_5) + resize(act_2_4_5, SUM_WIDTH_2_5) + resize(act_2_5_5, SUM_WIDTH_2_5);
        s1_1 <= resize(act_2_6_5, SUM_WIDTH_2_5) + resize(act_2_7_5, SUM_WIDTH_2_5);
        -- Stage 2
        sum_2_5 <= s1_0 + s1_1;
      end if;
    end process;
    out2_5 <= saturate(sum_2_5, 6);
  end block;

  -- LAYER 2, ch 6
  gen_l2c6 : block
  signal s1_0, s1_1 : sum_t_2_6;
  signal sum_2_6 : sum_t_2_6;
  begin
    i00 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_0_6.mem") port map (clk, out1_0_reg, act_2_0_6);
    i01 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_1_6.mem") port map (clk, out1_1_reg, act_2_1_6);
    i02 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_5_6.mem") port map (clk, out1_5_reg, act_2_5_6);
    i03 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_6_6.mem") port map (clk, out1_6_reg, act_2_6_6);
    i04 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_7_6.mem") port map (clk, out1_7_reg, act_2_7_6);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_2_0_6, SUM_WIDTH_2_6) + resize(act_2_1_6, SUM_WIDTH_2_6) + resize(act_2_5_6, SUM_WIDTH_2_6) + resize(act_2_6_6, SUM_WIDTH_2_6);
        s1_1 <= resize(act_2_7_6, SUM_WIDTH_2_6);
        -- Stage 2
        sum_2_6 <= s1_0 + s1_1;
      end if;
    end process;
    out2_6 <= saturate(sum_2_6, 6);
  end block;

  -- LAYER 2, ch 7
  gen_l2c7 : block
  signal s1_0 : sum_t_2_7;
  signal sum_2_7 : sum_t_2_7;
  begin
    i00 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_2_7.mem") port map (clk, out1_2_reg, act_2_2_7);
    i01 : entity work.LUT_2 generic map (MEMFILE=>"lut_2_7_7.mem") port map (clk, out1_7_reg, act_2_7_7);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_2_2_7, SUM_WIDTH_2_7) + resize(act_2_7_7, SUM_WIDTH_2_7);
        -- Stage 2
        sum_2_7 <= s1_0;
      end if;
    end process;
    out2_7 <= saturate(sum_2_7, 6);
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
      end if;
  end process;

  -- LAYER 3, ch 0
  gen_l3c0 : block
  signal s1_0, s1_1 : sum_t_3_0;
  signal sum_3_0 : sum_t_3_0;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_0.mem") port map (clk, out2_0_reg, act_3_0_0);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_0.mem") port map (clk, out2_1_reg, act_3_1_0);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_0.mem") port map (clk, out2_4_reg, act_3_4_0);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_0.mem") port map (clk, out2_5_reg, act_3_5_0);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_0.mem") port map (clk, out2_6_reg, act_3_6_0);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_0.mem") port map (clk, out2_7_reg, act_3_7_0);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_0, SUM_WIDTH_3_0) + resize(act_3_1_0, SUM_WIDTH_3_0) + resize(act_3_4_0, SUM_WIDTH_3_0) + resize(act_3_5_0, SUM_WIDTH_3_0);
        s1_1 <= resize(act_3_6_0, SUM_WIDTH_3_0) + resize(act_3_7_0, SUM_WIDTH_3_0);
        -- Stage 2
        sum_3_0 <= s1_0 + s1_1;
      end if;
    end process;
    output(0) <= saturate(sum_3_0, 6);
  end block;

  -- LAYER 3, ch 1
  gen_l3c1 : block
  signal s1_0 : sum_t_3_1;
  signal sum_3_1 : sum_t_3_1;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_1.mem") port map (clk, out2_0_reg, act_3_0_1);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_1.mem") port map (clk, out2_4_reg, act_3_4_1);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_1.mem") port map (clk, out2_5_reg, act_3_5_1);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_1.mem") port map (clk, out2_7_reg, act_3_7_1);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_1, SUM_WIDTH_3_1) + resize(act_3_4_1, SUM_WIDTH_3_1) + resize(act_3_5_1, SUM_WIDTH_3_1) + resize(act_3_7_1, SUM_WIDTH_3_1);
        -- Stage 2
        sum_3_1 <= s1_0;
      end if;
    end process;
    output(1) <= saturate(sum_3_1, 6);
  end block;

  -- LAYER 3, ch 2
  gen_l3c2 : block
  signal s1_0 : sum_t_3_2;
  signal sum_3_2 : sum_t_3_2;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_2.mem") port map (clk, out2_4_reg, act_3_4_2);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_2.mem") port map (clk, out2_5_reg, act_3_5_2);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_4_2, SUM_WIDTH_3_2) + resize(act_3_5_2, SUM_WIDTH_3_2);
        -- Stage 2
        sum_3_2 <= s1_0;
      end if;
    end process;
    output(2) <= saturate(sum_3_2, 6);
  end block;

  -- LAYER 3, ch 3
  gen_l3c3 : block
  signal s1_0, s1_1 : sum_t_3_3;
  signal sum_3_3 : sum_t_3_3;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_3.mem") port map (clk, out2_0_reg, act_3_0_3);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_3.mem") port map (clk, out2_1_reg, act_3_1_3);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_3.mem") port map (clk, out2_4_reg, act_3_4_3);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_3.mem") port map (clk, out2_5_reg, act_3_5_3);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_3.mem") port map (clk, out2_7_reg, act_3_7_3);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_3, SUM_WIDTH_3_3) + resize(act_3_1_3, SUM_WIDTH_3_3) + resize(act_3_4_3, SUM_WIDTH_3_3) + resize(act_3_5_3, SUM_WIDTH_3_3);
        s1_1 <= resize(act_3_7_3, SUM_WIDTH_3_3);
        -- Stage 2
        sum_3_3 <= s1_0 + s1_1;
      end if;
    end process;
    output(3) <= saturate(sum_3_3, 6);
  end block;

  -- LAYER 3, ch 4
  gen_l3c4 : block
  signal s1_0 : sum_t_3_4;
  signal sum_3_4 : sum_t_3_4;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_4.mem") port map (clk, out2_1_reg, act_3_1_4);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_4.mem") port map (clk, out2_4_reg, act_3_4_4);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_4.mem") port map (clk, out2_7_reg, act_3_7_4);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_1_4, SUM_WIDTH_3_4) + resize(act_3_4_4, SUM_WIDTH_3_4) + resize(act_3_7_4, SUM_WIDTH_3_4);
        -- Stage 2
        sum_3_4 <= s1_0;
      end if;
    end process;
    output(4) <= saturate(sum_3_4, 6);
  end block;

  -- LAYER 3, ch 5
  gen_l3c5 : block
  signal s1_0, s1_1 : sum_t_3_5;
  signal sum_3_5 : sum_t_3_5;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_5.mem") port map (clk, out2_0_reg, act_3_0_5);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_5.mem") port map (clk, out2_1_reg, act_3_1_5);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_5.mem") port map (clk, out2_4_reg, act_3_4_5);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_5.mem") port map (clk, out2_5_reg, act_3_5_5);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_5.mem") port map (clk, out2_6_reg, act_3_6_5);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_5, SUM_WIDTH_3_5) + resize(act_3_1_5, SUM_WIDTH_3_5) + resize(act_3_4_5, SUM_WIDTH_3_5) + resize(act_3_5_5, SUM_WIDTH_3_5);
        s1_1 <= resize(act_3_6_5, SUM_WIDTH_3_5);
        -- Stage 2
        sum_3_5 <= s1_0 + s1_1;
      end if;
    end process;
    output(5) <= saturate(sum_3_5, 6);
  end block;

  -- LAYER 3, ch 6
  gen_l3c6 : block
  signal s1_0 : sum_t_3_6;
  signal sum_3_6 : sum_t_3_6;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_6.mem") port map (clk, out2_0_reg, act_3_0_6);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_6.mem") port map (clk, out2_5_reg, act_3_5_6);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_6.mem") port map (clk, out2_6_reg, act_3_6_6);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_6.mem") port map (clk, out2_7_reg, act_3_7_6);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_6, SUM_WIDTH_3_6) + resize(act_3_5_6, SUM_WIDTH_3_6) + resize(act_3_6_6, SUM_WIDTH_3_6) + resize(act_3_7_6, SUM_WIDTH_3_6);
        -- Stage 2
        sum_3_6 <= s1_0;
      end if;
    end process;
    output(6) <= saturate(sum_3_6, 6);
  end block;

  -- LAYER 3, ch 7
  gen_l3c7 : block
  signal s1_0, s1_1 : sum_t_3_7;
  signal sum_3_7 : sum_t_3_7;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_7.mem") port map (clk, out2_0_reg, act_3_0_7);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_7.mem") port map (clk, out2_1_reg, act_3_1_7);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_7.mem") port map (clk, out2_4_reg, act_3_4_7);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_7.mem") port map (clk, out2_5_reg, act_3_5_7);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_7.mem") port map (clk, out2_7_reg, act_3_7_7);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_7, SUM_WIDTH_3_7) + resize(act_3_1_7, SUM_WIDTH_3_7) + resize(act_3_4_7, SUM_WIDTH_3_7) + resize(act_3_5_7, SUM_WIDTH_3_7);
        s1_1 <= resize(act_3_7_7, SUM_WIDTH_3_7);
        -- Stage 2
        sum_3_7 <= s1_0 + s1_1;
      end if;
    end process;
    output(7) <= saturate(sum_3_7, 6);
  end block;

  -- LAYER 3, ch 8
  gen_l3c8 : block
  signal s1_0, s1_1 : sum_t_3_8;
  signal sum_3_8 : sum_t_3_8;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_8.mem") port map (clk, out2_0_reg, act_3_0_8);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_8.mem") port map (clk, out2_1_reg, act_3_1_8);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_8.mem") port map (clk, out2_4_reg, act_3_4_8);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_8.mem") port map (clk, out2_5_reg, act_3_5_8);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_8.mem") port map (clk, out2_6_reg, act_3_6_8);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_8, SUM_WIDTH_3_8) + resize(act_3_1_8, SUM_WIDTH_3_8) + resize(act_3_4_8, SUM_WIDTH_3_8) + resize(act_3_5_8, SUM_WIDTH_3_8);
        s1_1 <= resize(act_3_6_8, SUM_WIDTH_3_8);
        -- Stage 2
        sum_3_8 <= s1_0 + s1_1;
      end if;
    end process;
    output(8) <= saturate(sum_3_8, 6);
  end block;

  -- LAYER 3, ch 9
  gen_l3c9 : block
  signal s1_0, s1_1 : sum_t_3_9;
  signal sum_3_9 : sum_t_3_9;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_9.mem") port map (clk, out2_0_reg, act_3_0_9);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_9.mem") port map (clk, out2_1_reg, act_3_1_9);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_9.mem") port map (clk, out2_4_reg, act_3_4_9);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_9.mem") port map (clk, out2_6_reg, act_3_6_9);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_9.mem") port map (clk, out2_7_reg, act_3_7_9);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_9, SUM_WIDTH_3_9) + resize(act_3_1_9, SUM_WIDTH_3_9) + resize(act_3_4_9, SUM_WIDTH_3_9) + resize(act_3_6_9, SUM_WIDTH_3_9);
        s1_1 <= resize(act_3_7_9, SUM_WIDTH_3_9);
        -- Stage 2
        sum_3_9 <= s1_0 + s1_1;
      end if;
    end process;
    output(9) <= saturate(sum_3_9, 6);
  end block;

  -- LAYER 3, ch 10
  gen_l3c10 : block
  signal s1_0 : sum_t_3_10;
  signal sum_3_10 : sum_t_3_10;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_10.mem") port map (clk, out2_0_reg, act_3_0_10);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_10.mem") port map (clk, out2_1_reg, act_3_1_10);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_10.mem") port map (clk, out2_4_reg, act_3_4_10);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_10.mem") port map (clk, out2_5_reg, act_3_5_10);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_10, SUM_WIDTH_3_10) + resize(act_3_1_10, SUM_WIDTH_3_10) + resize(act_3_4_10, SUM_WIDTH_3_10) + resize(act_3_5_10, SUM_WIDTH_3_10);
        -- Stage 2
        sum_3_10 <= s1_0;
      end if;
    end process;
    output(10) <= saturate(sum_3_10, 6);
  end block;

  -- LAYER 3, ch 11
  gen_l3c11 : block
  signal s1_0, s1_1 : sum_t_3_11;
  signal sum_3_11 : sum_t_3_11;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_11.mem") port map (clk, out2_0_reg, act_3_0_11);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_11.mem") port map (clk, out2_1_reg, act_3_1_11);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_11.mem") port map (clk, out2_4_reg, act_3_4_11);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_11.mem") port map (clk, out2_5_reg, act_3_5_11);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_11.mem") port map (clk, out2_7_reg, act_3_7_11);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_11, SUM_WIDTH_3_11) + resize(act_3_1_11, SUM_WIDTH_3_11) + resize(act_3_4_11, SUM_WIDTH_3_11) + resize(act_3_5_11, SUM_WIDTH_3_11);
        s1_1 <= resize(act_3_7_11, SUM_WIDTH_3_11);
        -- Stage 2
        sum_3_11 <= s1_0 + s1_1;
      end if;
    end process;
    output(11) <= saturate(sum_3_11, 6);
  end block;

  -- LAYER 3, ch 12
  gen_l3c12 : block
  signal s1_0, s1_1 : sum_t_3_12;
  signal sum_3_12 : sum_t_3_12;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_12.mem") port map (clk, out2_0_reg, act_3_0_12);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_12.mem") port map (clk, out2_1_reg, act_3_1_12);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_12.mem") port map (clk, out2_4_reg, act_3_4_12);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_12.mem") port map (clk, out2_5_reg, act_3_5_12);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_12.mem") port map (clk, out2_6_reg, act_3_6_12);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_12.mem") port map (clk, out2_7_reg, act_3_7_12);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_12, SUM_WIDTH_3_12) + resize(act_3_1_12, SUM_WIDTH_3_12) + resize(act_3_4_12, SUM_WIDTH_3_12) + resize(act_3_5_12, SUM_WIDTH_3_12);
        s1_1 <= resize(act_3_6_12, SUM_WIDTH_3_12) + resize(act_3_7_12, SUM_WIDTH_3_12);
        -- Stage 2
        sum_3_12 <= s1_0 + s1_1;
      end if;
    end process;
    output(12) <= saturate(sum_3_12, 6);
  end block;

  -- LAYER 3, ch 13
  gen_l3c13 : block
  signal s1_0, s1_1 : sum_t_3_13;
  signal sum_3_13 : sum_t_3_13;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_13.mem") port map (clk, out2_0_reg, act_3_0_13);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_13.mem") port map (clk, out2_1_reg, act_3_1_13);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_13.mem") port map (clk, out2_4_reg, act_3_4_13);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_13.mem") port map (clk, out2_5_reg, act_3_5_13);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_13.mem") port map (clk, out2_6_reg, act_3_6_13);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_13, SUM_WIDTH_3_13) + resize(act_3_1_13, SUM_WIDTH_3_13) + resize(act_3_4_13, SUM_WIDTH_3_13) + resize(act_3_5_13, SUM_WIDTH_3_13);
        s1_1 <= resize(act_3_6_13, SUM_WIDTH_3_13);
        -- Stage 2
        sum_3_13 <= s1_0 + s1_1;
      end if;
    end process;
    output(13) <= saturate(sum_3_13, 6);
  end block;

  -- LAYER 3, ch 14
  gen_l3c14 : block
  signal s1_0 : sum_t_3_14;
  signal sum_3_14 : sum_t_3_14;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_14.mem") port map (clk, out2_5_reg, act_3_5_14);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_14.mem") port map (clk, out2_6_reg, act_3_6_14);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_14.mem") port map (clk, out2_7_reg, act_3_7_14);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_5_14, SUM_WIDTH_3_14) + resize(act_3_6_14, SUM_WIDTH_3_14) + resize(act_3_7_14, SUM_WIDTH_3_14);
        -- Stage 2
        sum_3_14 <= s1_0;
      end if;
    end process;
    output(14) <= saturate(sum_3_14, 6);
  end block;

  -- LAYER 3, ch 15
  gen_l3c15 : block
  signal s1_0 : sum_t_3_15;
  signal sum_3_15 : sum_t_3_15;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_15.mem") port map (clk, out2_4_reg, act_3_4_15);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_15.mem") port map (clk, out2_5_reg, act_3_5_15);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_15.mem") port map (clk, out2_6_reg, act_3_6_15);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_4_15, SUM_WIDTH_3_15) + resize(act_3_5_15, SUM_WIDTH_3_15) + resize(act_3_6_15, SUM_WIDTH_3_15);
        -- Stage 2
        sum_3_15 <= s1_0;
      end if;
    end process;
    output(15) <= saturate(sum_3_15, 6);
  end block;

  -- LAYER 3, ch 16
  gen_l3c16 : block
  signal s1_0, s1_1 : sum_t_3_16;
  signal sum_3_16 : sum_t_3_16;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_16.mem") port map (clk, out2_0_reg, act_3_0_16);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_16.mem") port map (clk, out2_1_reg, act_3_1_16);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_16.mem") port map (clk, out2_4_reg, act_3_4_16);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_16.mem") port map (clk, out2_5_reg, act_3_5_16);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_16.mem") port map (clk, out2_6_reg, act_3_6_16);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_16.mem") port map (clk, out2_7_reg, act_3_7_16);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_16, SUM_WIDTH_3_16) + resize(act_3_1_16, SUM_WIDTH_3_16) + resize(act_3_4_16, SUM_WIDTH_3_16) + resize(act_3_5_16, SUM_WIDTH_3_16);
        s1_1 <= resize(act_3_6_16, SUM_WIDTH_3_16) + resize(act_3_7_16, SUM_WIDTH_3_16);
        -- Stage 2
        sum_3_16 <= s1_0 + s1_1;
      end if;
    end process;
    output(16) <= saturate(sum_3_16, 6);
  end block;

  -- LAYER 3, ch 17
  gen_l3c17 : block
  signal s1_0 : sum_t_3_17;
  signal sum_3_17 : sum_t_3_17;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_17.mem") port map (clk, out2_1_reg, act_3_1_17);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_17.mem") port map (clk, out2_4_reg, act_3_4_17);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_17.mem") port map (clk, out2_5_reg, act_3_5_17);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_17.mem") port map (clk, out2_6_reg, act_3_6_17);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_1_17, SUM_WIDTH_3_17) + resize(act_3_4_17, SUM_WIDTH_3_17) + resize(act_3_5_17, SUM_WIDTH_3_17) + resize(act_3_6_17, SUM_WIDTH_3_17);
        -- Stage 2
        sum_3_17 <= s1_0;
      end if;
    end process;
    output(17) <= saturate(sum_3_17, 6);
  end block;

  -- LAYER 3, ch 18
  gen_l3c18 : block
  signal s1_0 : sum_t_3_18;
  signal sum_3_18 : sum_t_3_18;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_18.mem") port map (clk, out2_1_reg, act_3_1_18);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_18.mem") port map (clk, out2_4_reg, act_3_4_18);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_18.mem") port map (clk, out2_5_reg, act_3_5_18);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_18.mem") port map (clk, out2_7_reg, act_3_7_18);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_1_18, SUM_WIDTH_3_18) + resize(act_3_4_18, SUM_WIDTH_3_18) + resize(act_3_5_18, SUM_WIDTH_3_18) + resize(act_3_7_18, SUM_WIDTH_3_18);
        -- Stage 2
        sum_3_18 <= s1_0;
      end if;
    end process;
    output(18) <= saturate(sum_3_18, 6);
  end block;

  -- LAYER 3, ch 19
  gen_l3c19 : block
  signal s1_0 : sum_t_3_19;
  signal sum_3_19 : sum_t_3_19;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_19.mem") port map (clk, out2_4_reg, act_3_4_19);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_19.mem") port map (clk, out2_5_reg, act_3_5_19);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_19.mem") port map (clk, out2_6_reg, act_3_6_19);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_19.mem") port map (clk, out2_7_reg, act_3_7_19);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_4_19, SUM_WIDTH_3_19) + resize(act_3_5_19, SUM_WIDTH_3_19) + resize(act_3_6_19, SUM_WIDTH_3_19) + resize(act_3_7_19, SUM_WIDTH_3_19);
        -- Stage 2
        sum_3_19 <= s1_0;
      end if;
    end process;
    output(19) <= saturate(sum_3_19, 6);
  end block;

  -- LAYER 3, ch 20
  gen_l3c20 : block
  signal s1_0, s1_1 : sum_t_3_20;
  signal sum_3_20 : sum_t_3_20;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_20.mem") port map (clk, out2_0_reg, act_3_0_20);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_20.mem") port map (clk, out2_4_reg, act_3_4_20);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_20.mem") port map (clk, out2_5_reg, act_3_5_20);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_20.mem") port map (clk, out2_6_reg, act_3_6_20);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_20.mem") port map (clk, out2_7_reg, act_3_7_20);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_20, SUM_WIDTH_3_20) + resize(act_3_4_20, SUM_WIDTH_3_20) + resize(act_3_5_20, SUM_WIDTH_3_20) + resize(act_3_6_20, SUM_WIDTH_3_20);
        s1_1 <= resize(act_3_7_20, SUM_WIDTH_3_20);
        -- Stage 2
        sum_3_20 <= s1_0 + s1_1;
      end if;
    end process;
    output(20) <= saturate(sum_3_20, 6);
  end block;

  -- LAYER 3, ch 21
  gen_l3c21 : block
  signal s1_0 : sum_t_3_21;
  signal sum_3_21 : sum_t_3_21;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_21.mem") port map (clk, out2_0_reg, act_3_0_21);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_21.mem") port map (clk, out2_4_reg, act_3_4_21);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_21.mem") port map (clk, out2_5_reg, act_3_5_21);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_21.mem") port map (clk, out2_7_reg, act_3_7_21);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_21, SUM_WIDTH_3_21) + resize(act_3_4_21, SUM_WIDTH_3_21) + resize(act_3_5_21, SUM_WIDTH_3_21) + resize(act_3_7_21, SUM_WIDTH_3_21);
        -- Stage 2
        sum_3_21 <= s1_0;
      end if;
    end process;
    output(21) <= saturate(sum_3_21, 6);
  end block;

  -- LAYER 3, ch 22
  gen_l3c22 : block
  signal s1_0 : sum_t_3_22;
  signal sum_3_22 : sum_t_3_22;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_22.mem") port map (clk, out2_4_reg, act_3_4_22);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_22.mem") port map (clk, out2_5_reg, act_3_5_22);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_4_22, SUM_WIDTH_3_22) + resize(act_3_5_22, SUM_WIDTH_3_22);
        -- Stage 2
        sum_3_22 <= s1_0;
      end if;
    end process;
    output(22) <= saturate(sum_3_22, 6);
  end block;

  -- LAYER 3, ch 23
  gen_l3c23 : block
  signal s1_0 : sum_t_3_23;
  signal sum_3_23 : sum_t_3_23;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_23.mem") port map (clk, out2_4_reg, act_3_4_23);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_23.mem") port map (clk, out2_5_reg, act_3_5_23);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_23.mem") port map (clk, out2_7_reg, act_3_7_23);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_4_23, SUM_WIDTH_3_23) + resize(act_3_5_23, SUM_WIDTH_3_23) + resize(act_3_7_23, SUM_WIDTH_3_23);
        -- Stage 2
        sum_3_23 <= s1_0;
      end if;
    end process;
    output(23) <= saturate(sum_3_23, 6);
  end block;

  -- LAYER 3, ch 24
  gen_l3c24 : block
  signal s1_0, s1_1 : sum_t_3_24;
  signal sum_3_24 : sum_t_3_24;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_24.mem") port map (clk, out2_0_reg, act_3_0_24);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_24.mem") port map (clk, out2_1_reg, act_3_1_24);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_24.mem") port map (clk, out2_5_reg, act_3_5_24);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_24.mem") port map (clk, out2_6_reg, act_3_6_24);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_24.mem") port map (clk, out2_7_reg, act_3_7_24);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_24, SUM_WIDTH_3_24) + resize(act_3_1_24, SUM_WIDTH_3_24) + resize(act_3_5_24, SUM_WIDTH_3_24) + resize(act_3_6_24, SUM_WIDTH_3_24);
        s1_1 <= resize(act_3_7_24, SUM_WIDTH_3_24);
        -- Stage 2
        sum_3_24 <= s1_0 + s1_1;
      end if;
    end process;
    output(24) <= saturate(sum_3_24, 6);
  end block;

  -- LAYER 3, ch 25
  gen_l3c25 : block
  signal s1_0, s1_1 : sum_t_3_25;
  signal sum_3_25 : sum_t_3_25;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_25.mem") port map (clk, out2_0_reg, act_3_0_25);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_25.mem") port map (clk, out2_1_reg, act_3_1_25);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_25.mem") port map (clk, out2_4_reg, act_3_4_25);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_25.mem") port map (clk, out2_5_reg, act_3_5_25);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_25.mem") port map (clk, out2_6_reg, act_3_6_25);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_25.mem") port map (clk, out2_7_reg, act_3_7_25);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_25, SUM_WIDTH_3_25) + resize(act_3_1_25, SUM_WIDTH_3_25) + resize(act_3_4_25, SUM_WIDTH_3_25) + resize(act_3_5_25, SUM_WIDTH_3_25);
        s1_1 <= resize(act_3_6_25, SUM_WIDTH_3_25) + resize(act_3_7_25, SUM_WIDTH_3_25);
        -- Stage 2
        sum_3_25 <= s1_0 + s1_1;
      end if;
    end process;
    output(25) <= saturate(sum_3_25, 6);
  end block;

  -- LAYER 3, ch 26
  gen_l3c26 : block
  signal s1_0 : sum_t_3_26;
  signal sum_3_26 : sum_t_3_26;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_26.mem") port map (clk, out2_0_reg, act_3_0_26);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_26.mem") port map (clk, out2_1_reg, act_3_1_26);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_26.mem") port map (clk, out2_4_reg, act_3_4_26);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_26.mem") port map (clk, out2_5_reg, act_3_5_26);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_26, SUM_WIDTH_3_26) + resize(act_3_1_26, SUM_WIDTH_3_26) + resize(act_3_4_26, SUM_WIDTH_3_26) + resize(act_3_5_26, SUM_WIDTH_3_26);
        -- Stage 2
        sum_3_26 <= s1_0;
      end if;
    end process;
    output(26) <= saturate(sum_3_26, 6);
  end block;

  -- LAYER 3, ch 27
  gen_l3c27 : block
  signal s1_0, s1_1 : sum_t_3_27;
  signal sum_3_27 : sum_t_3_27;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_27.mem") port map (clk, out2_0_reg, act_3_0_27);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_27.mem") port map (clk, out2_1_reg, act_3_1_27);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_27.mem") port map (clk, out2_4_reg, act_3_4_27);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_27.mem") port map (clk, out2_5_reg, act_3_5_27);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_27.mem") port map (clk, out2_6_reg, act_3_6_27);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_27.mem") port map (clk, out2_7_reg, act_3_7_27);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_27, SUM_WIDTH_3_27) + resize(act_3_1_27, SUM_WIDTH_3_27) + resize(act_3_4_27, SUM_WIDTH_3_27) + resize(act_3_5_27, SUM_WIDTH_3_27);
        s1_1 <= resize(act_3_6_27, SUM_WIDTH_3_27) + resize(act_3_7_27, SUM_WIDTH_3_27);
        -- Stage 2
        sum_3_27 <= s1_0 + s1_1;
      end if;
    end process;
    output(27) <= saturate(sum_3_27, 6);
  end block;

  -- LAYER 3, ch 28
  gen_l3c28 : block
  signal s1_0, s1_1 : sum_t_3_28;
  signal sum_3_28 : sum_t_3_28;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_28.mem") port map (clk, out2_0_reg, act_3_0_28);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_28.mem") port map (clk, out2_1_reg, act_3_1_28);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_28.mem") port map (clk, out2_4_reg, act_3_4_28);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_28.mem") port map (clk, out2_5_reg, act_3_5_28);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_28.mem") port map (clk, out2_6_reg, act_3_6_28);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_28.mem") port map (clk, out2_7_reg, act_3_7_28);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_28, SUM_WIDTH_3_28) + resize(act_3_1_28, SUM_WIDTH_3_28) + resize(act_3_4_28, SUM_WIDTH_3_28) + resize(act_3_5_28, SUM_WIDTH_3_28);
        s1_1 <= resize(act_3_6_28, SUM_WIDTH_3_28) + resize(act_3_7_28, SUM_WIDTH_3_28);
        -- Stage 2
        sum_3_28 <= s1_0 + s1_1;
      end if;
    end process;
    output(28) <= saturate(sum_3_28, 6);
  end block;

  -- LAYER 3, ch 29
  gen_l3c29 : block
  signal s1_0, s1_1 : sum_t_3_29;
  signal sum_3_29 : sum_t_3_29;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_29.mem") port map (clk, out2_1_reg, act_3_1_29);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_29.mem") port map (clk, out2_4_reg, act_3_4_29);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_29.mem") port map (clk, out2_5_reg, act_3_5_29);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_29.mem") port map (clk, out2_6_reg, act_3_6_29);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_29.mem") port map (clk, out2_7_reg, act_3_7_29);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_1_29, SUM_WIDTH_3_29) + resize(act_3_4_29, SUM_WIDTH_3_29) + resize(act_3_5_29, SUM_WIDTH_3_29) + resize(act_3_6_29, SUM_WIDTH_3_29);
        s1_1 <= resize(act_3_7_29, SUM_WIDTH_3_29);
        -- Stage 2
        sum_3_29 <= s1_0 + s1_1;
      end if;
    end process;
    output(29) <= saturate(sum_3_29, 6);
  end block;

  -- LAYER 3, ch 30
  gen_l3c30 : block
  signal s1_0, s1_1 : sum_t_3_30;
  signal sum_3_30 : sum_t_3_30;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_30.mem") port map (clk, out2_0_reg, act_3_0_30);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_30.mem") port map (clk, out2_1_reg, act_3_1_30);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_30.mem") port map (clk, out2_4_reg, act_3_4_30);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_30.mem") port map (clk, out2_5_reg, act_3_5_30);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_30.mem") port map (clk, out2_6_reg, act_3_6_30);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_30.mem") port map (clk, out2_7_reg, act_3_7_30);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_30, SUM_WIDTH_3_30) + resize(act_3_1_30, SUM_WIDTH_3_30) + resize(act_3_4_30, SUM_WIDTH_3_30) + resize(act_3_5_30, SUM_WIDTH_3_30);
        s1_1 <= resize(act_3_6_30, SUM_WIDTH_3_30) + resize(act_3_7_30, SUM_WIDTH_3_30);
        -- Stage 2
        sum_3_30 <= s1_0 + s1_1;
      end if;
    end process;
    output(30) <= saturate(sum_3_30, 6);
  end block;

  -- LAYER 3, ch 31
  gen_l3c31 : block
  signal s1_0, s1_1 : sum_t_3_31;
  signal sum_3_31 : sum_t_3_31;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_31.mem") port map (clk, out2_1_reg, act_3_1_31);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_31.mem") port map (clk, out2_4_reg, act_3_4_31);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_31.mem") port map (clk, out2_5_reg, act_3_5_31);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_31.mem") port map (clk, out2_6_reg, act_3_6_31);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_31.mem") port map (clk, out2_7_reg, act_3_7_31);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_1_31, SUM_WIDTH_3_31) + resize(act_3_4_31, SUM_WIDTH_3_31) + resize(act_3_5_31, SUM_WIDTH_3_31) + resize(act_3_6_31, SUM_WIDTH_3_31);
        s1_1 <= resize(act_3_7_31, SUM_WIDTH_3_31);
        -- Stage 2
        sum_3_31 <= s1_0 + s1_1;
      end if;
    end process;
    output(31) <= saturate(sum_3_31, 6);
  end block;

  -- LAYER 3, ch 32
  gen_l3c32 : block
  signal s1_0, s1_1 : sum_t_3_32;
  signal sum_3_32 : sum_t_3_32;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_32.mem") port map (clk, out2_0_reg, act_3_0_32);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_32.mem") port map (clk, out2_4_reg, act_3_4_32);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_32.mem") port map (clk, out2_5_reg, act_3_5_32);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_32.mem") port map (clk, out2_6_reg, act_3_6_32);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_32.mem") port map (clk, out2_7_reg, act_3_7_32);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_32, SUM_WIDTH_3_32) + resize(act_3_4_32, SUM_WIDTH_3_32) + resize(act_3_5_32, SUM_WIDTH_3_32) + resize(act_3_6_32, SUM_WIDTH_3_32);
        s1_1 <= resize(act_3_7_32, SUM_WIDTH_3_32);
        -- Stage 2
        sum_3_32 <= s1_0 + s1_1;
      end if;
    end process;
    output(32) <= saturate(sum_3_32, 6);
  end block;

  -- LAYER 3, ch 33
  gen_l3c33 : block
  signal s1_0, s1_1 : sum_t_3_33;
  signal sum_3_33 : sum_t_3_33;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_33.mem") port map (clk, out2_0_reg, act_3_0_33);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_33.mem") port map (clk, out2_4_reg, act_3_4_33);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_33.mem") port map (clk, out2_5_reg, act_3_5_33);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_33.mem") port map (clk, out2_6_reg, act_3_6_33);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_33.mem") port map (clk, out2_7_reg, act_3_7_33);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_33, SUM_WIDTH_3_33) + resize(act_3_4_33, SUM_WIDTH_3_33) + resize(act_3_5_33, SUM_WIDTH_3_33) + resize(act_3_6_33, SUM_WIDTH_3_33);
        s1_1 <= resize(act_3_7_33, SUM_WIDTH_3_33);
        -- Stage 2
        sum_3_33 <= s1_0 + s1_1;
      end if;
    end process;
    output(33) <= saturate(sum_3_33, 6);
  end block;

  -- LAYER 3, ch 34
  gen_l3c34 : block
  signal s1_0, s1_1 : sum_t_3_34;
  signal sum_3_34 : sum_t_3_34;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_34.mem") port map (clk, out2_0_reg, act_3_0_34);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_34.mem") port map (clk, out2_4_reg, act_3_4_34);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_34.mem") port map (clk, out2_5_reg, act_3_5_34);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_34.mem") port map (clk, out2_6_reg, act_3_6_34);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_34.mem") port map (clk, out2_7_reg, act_3_7_34);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_34, SUM_WIDTH_3_34) + resize(act_3_4_34, SUM_WIDTH_3_34) + resize(act_3_5_34, SUM_WIDTH_3_34) + resize(act_3_6_34, SUM_WIDTH_3_34);
        s1_1 <= resize(act_3_7_34, SUM_WIDTH_3_34);
        -- Stage 2
        sum_3_34 <= s1_0 + s1_1;
      end if;
    end process;
    output(34) <= saturate(sum_3_34, 6);
  end block;

  -- LAYER 3, ch 35
  gen_l3c35 : block
  signal s1_0, s1_1 : sum_t_3_35;
  signal sum_3_35 : sum_t_3_35;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_35.mem") port map (clk, out2_0_reg, act_3_0_35);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_35.mem") port map (clk, out2_1_reg, act_3_1_35);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_35.mem") port map (clk, out2_4_reg, act_3_4_35);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_35.mem") port map (clk, out2_5_reg, act_3_5_35);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_35.mem") port map (clk, out2_6_reg, act_3_6_35);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_35.mem") port map (clk, out2_7_reg, act_3_7_35);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_35, SUM_WIDTH_3_35) + resize(act_3_1_35, SUM_WIDTH_3_35) + resize(act_3_4_35, SUM_WIDTH_3_35) + resize(act_3_5_35, SUM_WIDTH_3_35);
        s1_1 <= resize(act_3_6_35, SUM_WIDTH_3_35) + resize(act_3_7_35, SUM_WIDTH_3_35);
        -- Stage 2
        sum_3_35 <= s1_0 + s1_1;
      end if;
    end process;
    output(35) <= saturate(sum_3_35, 6);
  end block;

  -- LAYER 3, ch 36
  gen_l3c36 : block
  signal s1_0, s1_1 : sum_t_3_36;
  signal sum_3_36 : sum_t_3_36;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_36.mem") port map (clk, out2_0_reg, act_3_0_36);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_36.mem") port map (clk, out2_1_reg, act_3_1_36);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_36.mem") port map (clk, out2_4_reg, act_3_4_36);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_36.mem") port map (clk, out2_5_reg, act_3_5_36);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_36.mem") port map (clk, out2_6_reg, act_3_6_36);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_36.mem") port map (clk, out2_7_reg, act_3_7_36);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_36, SUM_WIDTH_3_36) + resize(act_3_1_36, SUM_WIDTH_3_36) + resize(act_3_4_36, SUM_WIDTH_3_36) + resize(act_3_5_36, SUM_WIDTH_3_36);
        s1_1 <= resize(act_3_6_36, SUM_WIDTH_3_36) + resize(act_3_7_36, SUM_WIDTH_3_36);
        -- Stage 2
        sum_3_36 <= s1_0 + s1_1;
      end if;
    end process;
    output(36) <= saturate(sum_3_36, 6);
  end block;

  -- LAYER 3, ch 37
  gen_l3c37 : block
  signal s1_0, s1_1 : sum_t_3_37;
  signal sum_3_37 : sum_t_3_37;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_37.mem") port map (clk, out2_0_reg, act_3_0_37);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_37.mem") port map (clk, out2_4_reg, act_3_4_37);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_37.mem") port map (clk, out2_5_reg, act_3_5_37);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_37.mem") port map (clk, out2_6_reg, act_3_6_37);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_37.mem") port map (clk, out2_7_reg, act_3_7_37);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_37, SUM_WIDTH_3_37) + resize(act_3_4_37, SUM_WIDTH_3_37) + resize(act_3_5_37, SUM_WIDTH_3_37) + resize(act_3_6_37, SUM_WIDTH_3_37);
        s1_1 <= resize(act_3_7_37, SUM_WIDTH_3_37);
        -- Stage 2
        sum_3_37 <= s1_0 + s1_1;
      end if;
    end process;
    output(37) <= saturate(sum_3_37, 6);
  end block;

  -- LAYER 3, ch 38
  gen_l3c38 : block
  signal s1_0 : sum_t_3_38;
  signal sum_3_38 : sum_t_3_38;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_38.mem") port map (clk, out2_0_reg, act_3_0_38);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_38.mem") port map (clk, out2_1_reg, act_3_1_38);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_38.mem") port map (clk, out2_4_reg, act_3_4_38);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_38.mem") port map (clk, out2_5_reg, act_3_5_38);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_38, SUM_WIDTH_3_38) + resize(act_3_1_38, SUM_WIDTH_3_38) + resize(act_3_4_38, SUM_WIDTH_3_38) + resize(act_3_5_38, SUM_WIDTH_3_38);
        -- Stage 2
        sum_3_38 <= s1_0;
      end if;
    end process;
    output(38) <= saturate(sum_3_38, 6);
  end block;

  -- LAYER 3, ch 39
  gen_l3c39 : block
  signal s1_0, s1_1 : sum_t_3_39;
  signal sum_3_39 : sum_t_3_39;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_39.mem") port map (clk, out2_0_reg, act_3_0_39);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_39.mem") port map (clk, out2_4_reg, act_3_4_39);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_39.mem") port map (clk, out2_5_reg, act_3_5_39);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_39.mem") port map (clk, out2_6_reg, act_3_6_39);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_39.mem") port map (clk, out2_7_reg, act_3_7_39);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_39, SUM_WIDTH_3_39) + resize(act_3_4_39, SUM_WIDTH_3_39) + resize(act_3_5_39, SUM_WIDTH_3_39) + resize(act_3_6_39, SUM_WIDTH_3_39);
        s1_1 <= resize(act_3_7_39, SUM_WIDTH_3_39);
        -- Stage 2
        sum_3_39 <= s1_0 + s1_1;
      end if;
    end process;
    output(39) <= saturate(sum_3_39, 6);
  end block;

  -- LAYER 3, ch 40
  gen_l3c40 : block
  signal s1_0, s1_1 : sum_t_3_40;
  signal sum_3_40 : sum_t_3_40;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_40.mem") port map (clk, out2_0_reg, act_3_0_40);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_40.mem") port map (clk, out2_1_reg, act_3_1_40);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_40.mem") port map (clk, out2_4_reg, act_3_4_40);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_40.mem") port map (clk, out2_5_reg, act_3_5_40);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_40.mem") port map (clk, out2_6_reg, act_3_6_40);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_40.mem") port map (clk, out2_7_reg, act_3_7_40);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_40, SUM_WIDTH_3_40) + resize(act_3_1_40, SUM_WIDTH_3_40) + resize(act_3_4_40, SUM_WIDTH_3_40) + resize(act_3_5_40, SUM_WIDTH_3_40);
        s1_1 <= resize(act_3_6_40, SUM_WIDTH_3_40) + resize(act_3_7_40, SUM_WIDTH_3_40);
        -- Stage 2
        sum_3_40 <= s1_0 + s1_1;
      end if;
    end process;
    output(40) <= saturate(sum_3_40, 6);
  end block;

  -- LAYER 3, ch 41
  gen_l3c41 : block
  signal s1_0, s1_1 : sum_t_3_41;
  signal sum_3_41 : sum_t_3_41;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_41.mem") port map (clk, out2_0_reg, act_3_0_41);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_41.mem") port map (clk, out2_1_reg, act_3_1_41);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_41.mem") port map (clk, out2_4_reg, act_3_4_41);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_41.mem") port map (clk, out2_5_reg, act_3_5_41);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_41.mem") port map (clk, out2_6_reg, act_3_6_41);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_41, SUM_WIDTH_3_41) + resize(act_3_1_41, SUM_WIDTH_3_41) + resize(act_3_4_41, SUM_WIDTH_3_41) + resize(act_3_5_41, SUM_WIDTH_3_41);
        s1_1 <= resize(act_3_6_41, SUM_WIDTH_3_41);
        -- Stage 2
        sum_3_41 <= s1_0 + s1_1;
      end if;
    end process;
    output(41) <= saturate(sum_3_41, 6);
  end block;

  -- LAYER 3, ch 42
  gen_l3c42 : block
  signal s1_0, s1_1 : sum_t_3_42;
  signal sum_3_42 : sum_t_3_42;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_42.mem") port map (clk, out2_0_reg, act_3_0_42);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_42.mem") port map (clk, out2_1_reg, act_3_1_42);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_42.mem") port map (clk, out2_4_reg, act_3_4_42);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_42.mem") port map (clk, out2_5_reg, act_3_5_42);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_42.mem") port map (clk, out2_6_reg, act_3_6_42);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_42, SUM_WIDTH_3_42) + resize(act_3_1_42, SUM_WIDTH_3_42) + resize(act_3_4_42, SUM_WIDTH_3_42) + resize(act_3_5_42, SUM_WIDTH_3_42);
        s1_1 <= resize(act_3_6_42, SUM_WIDTH_3_42);
        -- Stage 2
        sum_3_42 <= s1_0 + s1_1;
      end if;
    end process;
    output(42) <= saturate(sum_3_42, 6);
  end block;

  -- LAYER 3, ch 43
  gen_l3c43 : block
  signal s1_0, s1_1 : sum_t_3_43;
  signal sum_3_43 : sum_t_3_43;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_43.mem") port map (clk, out2_0_reg, act_3_0_43);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_43.mem") port map (clk, out2_4_reg, act_3_4_43);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_43.mem") port map (clk, out2_5_reg, act_3_5_43);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_43.mem") port map (clk, out2_6_reg, act_3_6_43);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_43.mem") port map (clk, out2_7_reg, act_3_7_43);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_43, SUM_WIDTH_3_43) + resize(act_3_4_43, SUM_WIDTH_3_43) + resize(act_3_5_43, SUM_WIDTH_3_43) + resize(act_3_6_43, SUM_WIDTH_3_43);
        s1_1 <= resize(act_3_7_43, SUM_WIDTH_3_43);
        -- Stage 2
        sum_3_43 <= s1_0 + s1_1;
      end if;
    end process;
    output(43) <= saturate(sum_3_43, 6);
  end block;

  -- LAYER 3, ch 44
  gen_l3c44 : block
  signal s1_0, s1_1 : sum_t_3_44;
  signal sum_3_44 : sum_t_3_44;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_44.mem") port map (clk, out2_0_reg, act_3_0_44);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_44.mem") port map (clk, out2_4_reg, act_3_4_44);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_44.mem") port map (clk, out2_5_reg, act_3_5_44);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_44.mem") port map (clk, out2_6_reg, act_3_6_44);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_44.mem") port map (clk, out2_7_reg, act_3_7_44);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_44, SUM_WIDTH_3_44) + resize(act_3_4_44, SUM_WIDTH_3_44) + resize(act_3_5_44, SUM_WIDTH_3_44) + resize(act_3_6_44, SUM_WIDTH_3_44);
        s1_1 <= resize(act_3_7_44, SUM_WIDTH_3_44);
        -- Stage 2
        sum_3_44 <= s1_0 + s1_1;
      end if;
    end process;
    output(44) <= saturate(sum_3_44, 6);
  end block;

  -- LAYER 3, ch 45
  gen_l3c45 : block
  signal s1_0 : sum_t_3_45;
  signal sum_3_45 : sum_t_3_45;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_45.mem") port map (clk, out2_0_reg, act_3_0_45);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_45.mem") port map (clk, out2_4_reg, act_3_4_45);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_45.mem") port map (clk, out2_5_reg, act_3_5_45);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_45.mem") port map (clk, out2_7_reg, act_3_7_45);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_45, SUM_WIDTH_3_45) + resize(act_3_4_45, SUM_WIDTH_3_45) + resize(act_3_5_45, SUM_WIDTH_3_45) + resize(act_3_7_45, SUM_WIDTH_3_45);
        -- Stage 2
        sum_3_45 <= s1_0;
      end if;
    end process;
    output(45) <= saturate(sum_3_45, 6);
  end block;

  -- LAYER 3, ch 46
  gen_l3c46 : block
  signal s1_0, s1_1 : sum_t_3_46;
  signal sum_3_46 : sum_t_3_46;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_46.mem") port map (clk, out2_0_reg, act_3_0_46);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_46.mem") port map (clk, out2_4_reg, act_3_4_46);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_46.mem") port map (clk, out2_5_reg, act_3_5_46);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_46.mem") port map (clk, out2_6_reg, act_3_6_46);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_46.mem") port map (clk, out2_7_reg, act_3_7_46);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_46, SUM_WIDTH_3_46) + resize(act_3_4_46, SUM_WIDTH_3_46) + resize(act_3_5_46, SUM_WIDTH_3_46) + resize(act_3_6_46, SUM_WIDTH_3_46);
        s1_1 <= resize(act_3_7_46, SUM_WIDTH_3_46);
        -- Stage 2
        sum_3_46 <= s1_0 + s1_1;
      end if;
    end process;
    output(46) <= saturate(sum_3_46, 6);
  end block;

  -- LAYER 3, ch 47
  gen_l3c47 : block
  signal s1_0, s1_1 : sum_t_3_47;
  signal sum_3_47 : sum_t_3_47;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_47.mem") port map (clk, out2_0_reg, act_3_0_47);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_47.mem") port map (clk, out2_1_reg, act_3_1_47);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_47.mem") port map (clk, out2_4_reg, act_3_4_47);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_47.mem") port map (clk, out2_5_reg, act_3_5_47);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_47.mem") port map (clk, out2_6_reg, act_3_6_47);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_47.mem") port map (clk, out2_7_reg, act_3_7_47);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_47, SUM_WIDTH_3_47) + resize(act_3_1_47, SUM_WIDTH_3_47) + resize(act_3_4_47, SUM_WIDTH_3_47) + resize(act_3_5_47, SUM_WIDTH_3_47);
        s1_1 <= resize(act_3_6_47, SUM_WIDTH_3_47) + resize(act_3_7_47, SUM_WIDTH_3_47);
        -- Stage 2
        sum_3_47 <= s1_0 + s1_1;
      end if;
    end process;
    output(47) <= saturate(sum_3_47, 6);
  end block;

  -- LAYER 3, ch 48
  gen_l3c48 : block
  signal s1_0, s1_1 : sum_t_3_48;
  signal sum_3_48 : sum_t_3_48;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_48.mem") port map (clk, out2_0_reg, act_3_0_48);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_48.mem") port map (clk, out2_4_reg, act_3_4_48);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_48.mem") port map (clk, out2_5_reg, act_3_5_48);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_48.mem") port map (clk, out2_6_reg, act_3_6_48);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_48.mem") port map (clk, out2_7_reg, act_3_7_48);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_48, SUM_WIDTH_3_48) + resize(act_3_4_48, SUM_WIDTH_3_48) + resize(act_3_5_48, SUM_WIDTH_3_48) + resize(act_3_6_48, SUM_WIDTH_3_48);
        s1_1 <= resize(act_3_7_48, SUM_WIDTH_3_48);
        -- Stage 2
        sum_3_48 <= s1_0 + s1_1;
      end if;
    end process;
    output(48) <= saturate(sum_3_48, 6);
  end block;

  -- LAYER 3, ch 49
  gen_l3c49 : block
  signal s1_0 : sum_t_3_49;
  signal sum_3_49 : sum_t_3_49;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_49.mem") port map (clk, out2_0_reg, act_3_0_49);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_49.mem") port map (clk, out2_4_reg, act_3_4_49);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_49.mem") port map (clk, out2_6_reg, act_3_6_49);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_49, SUM_WIDTH_3_49) + resize(act_3_4_49, SUM_WIDTH_3_49) + resize(act_3_6_49, SUM_WIDTH_3_49);
        -- Stage 2
        sum_3_49 <= s1_0;
      end if;
    end process;
    output(49) <= saturate(sum_3_49, 6);
  end block;

  -- LAYER 3, ch 50
  gen_l3c50 : block
  signal s1_0, s1_1 : sum_t_3_50;
  signal sum_3_50 : sum_t_3_50;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_50.mem") port map (clk, out2_0_reg, act_3_0_50);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_50.mem") port map (clk, out2_4_reg, act_3_4_50);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_50.mem") port map (clk, out2_5_reg, act_3_5_50);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_50.mem") port map (clk, out2_6_reg, act_3_6_50);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_50.mem") port map (clk, out2_7_reg, act_3_7_50);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_50, SUM_WIDTH_3_50) + resize(act_3_4_50, SUM_WIDTH_3_50) + resize(act_3_5_50, SUM_WIDTH_3_50) + resize(act_3_6_50, SUM_WIDTH_3_50);
        s1_1 <= resize(act_3_7_50, SUM_WIDTH_3_50);
        -- Stage 2
        sum_3_50 <= s1_0 + s1_1;
      end if;
    end process;
    output(50) <= saturate(sum_3_50, 6);
  end block;

  -- LAYER 3, ch 51
  gen_l3c51 : block
  signal s1_0, s1_1 : sum_t_3_51;
  signal sum_3_51 : sum_t_3_51;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_51.mem") port map (clk, out2_0_reg, act_3_0_51);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_51.mem") port map (clk, out2_1_reg, act_3_1_51);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_51.mem") port map (clk, out2_4_reg, act_3_4_51);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_51.mem") port map (clk, out2_5_reg, act_3_5_51);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_51.mem") port map (clk, out2_6_reg, act_3_6_51);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_51.mem") port map (clk, out2_7_reg, act_3_7_51);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_51, SUM_WIDTH_3_51) + resize(act_3_1_51, SUM_WIDTH_3_51) + resize(act_3_4_51, SUM_WIDTH_3_51) + resize(act_3_5_51, SUM_WIDTH_3_51);
        s1_1 <= resize(act_3_6_51, SUM_WIDTH_3_51) + resize(act_3_7_51, SUM_WIDTH_3_51);
        -- Stage 2
        sum_3_51 <= s1_0 + s1_1;
      end if;
    end process;
    output(51) <= saturate(sum_3_51, 6);
  end block;

  -- LAYER 3, ch 52
  gen_l3c52 : block
  signal s1_0, s1_1 : sum_t_3_52;
  signal sum_3_52 : sum_t_3_52;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_52.mem") port map (clk, out2_0_reg, act_3_0_52);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_52.mem") port map (clk, out2_4_reg, act_3_4_52);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_52.mem") port map (clk, out2_5_reg, act_3_5_52);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_52.mem") port map (clk, out2_6_reg, act_3_6_52);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_52.mem") port map (clk, out2_7_reg, act_3_7_52);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_52, SUM_WIDTH_3_52) + resize(act_3_4_52, SUM_WIDTH_3_52) + resize(act_3_5_52, SUM_WIDTH_3_52) + resize(act_3_6_52, SUM_WIDTH_3_52);
        s1_1 <= resize(act_3_7_52, SUM_WIDTH_3_52);
        -- Stage 2
        sum_3_52 <= s1_0 + s1_1;
      end if;
    end process;
    output(52) <= saturate(sum_3_52, 6);
  end block;

  -- LAYER 3, ch 53
  gen_l3c53 : block
  signal s1_0, s1_1 : sum_t_3_53;
  signal sum_3_53 : sum_t_3_53;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_53.mem") port map (clk, out2_0_reg, act_3_0_53);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_53.mem") port map (clk, out2_4_reg, act_3_4_53);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_53.mem") port map (clk, out2_5_reg, act_3_5_53);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_53.mem") port map (clk, out2_6_reg, act_3_6_53);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_53.mem") port map (clk, out2_7_reg, act_3_7_53);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_53, SUM_WIDTH_3_53) + resize(act_3_4_53, SUM_WIDTH_3_53) + resize(act_3_5_53, SUM_WIDTH_3_53) + resize(act_3_6_53, SUM_WIDTH_3_53);
        s1_1 <= resize(act_3_7_53, SUM_WIDTH_3_53);
        -- Stage 2
        sum_3_53 <= s1_0 + s1_1;
      end if;
    end process;
    output(53) <= saturate(sum_3_53, 6);
  end block;

  -- LAYER 3, ch 54
  gen_l3c54 : block
  signal s1_0 : sum_t_3_54;
  signal sum_3_54 : sum_t_3_54;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_54.mem") port map (clk, out2_0_reg, act_3_0_54);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_54.mem") port map (clk, out2_4_reg, act_3_4_54);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_54.mem") port map (clk, out2_5_reg, act_3_5_54);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_54.mem") port map (clk, out2_6_reg, act_3_6_54);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_54, SUM_WIDTH_3_54) + resize(act_3_4_54, SUM_WIDTH_3_54) + resize(act_3_5_54, SUM_WIDTH_3_54) + resize(act_3_6_54, SUM_WIDTH_3_54);
        -- Stage 2
        sum_3_54 <= s1_0;
      end if;
    end process;
    output(54) <= saturate(sum_3_54, 6);
  end block;

  -- LAYER 3, ch 55
  gen_l3c55 : block
  signal s1_0, s1_1 : sum_t_3_55;
  signal sum_3_55 : sum_t_3_55;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_55.mem") port map (clk, out2_0_reg, act_3_0_55);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_55.mem") port map (clk, out2_1_reg, act_3_1_55);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_55.mem") port map (clk, out2_4_reg, act_3_4_55);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_55.mem") port map (clk, out2_5_reg, act_3_5_55);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_55.mem") port map (clk, out2_6_reg, act_3_6_55);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_55.mem") port map (clk, out2_7_reg, act_3_7_55);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_55, SUM_WIDTH_3_55) + resize(act_3_1_55, SUM_WIDTH_3_55) + resize(act_3_4_55, SUM_WIDTH_3_55) + resize(act_3_5_55, SUM_WIDTH_3_55);
        s1_1 <= resize(act_3_6_55, SUM_WIDTH_3_55) + resize(act_3_7_55, SUM_WIDTH_3_55);
        -- Stage 2
        sum_3_55 <= s1_0 + s1_1;
      end if;
    end process;
    output(55) <= saturate(sum_3_55, 6);
  end block;

  -- LAYER 3, ch 56
  gen_l3c56 : block
  signal s1_0, s1_1 : sum_t_3_56;
  signal sum_3_56 : sum_t_3_56;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_56.mem") port map (clk, out2_0_reg, act_3_0_56);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_56.mem") port map (clk, out2_1_reg, act_3_1_56);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_56.mem") port map (clk, out2_4_reg, act_3_4_56);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_56.mem") port map (clk, out2_5_reg, act_3_5_56);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_56.mem") port map (clk, out2_6_reg, act_3_6_56);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_56.mem") port map (clk, out2_7_reg, act_3_7_56);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_56, SUM_WIDTH_3_56) + resize(act_3_1_56, SUM_WIDTH_3_56) + resize(act_3_4_56, SUM_WIDTH_3_56) + resize(act_3_5_56, SUM_WIDTH_3_56);
        s1_1 <= resize(act_3_6_56, SUM_WIDTH_3_56) + resize(act_3_7_56, SUM_WIDTH_3_56);
        -- Stage 2
        sum_3_56 <= s1_0 + s1_1;
      end if;
    end process;
    output(56) <= saturate(sum_3_56, 6);
  end block;

  -- LAYER 3, ch 57
  gen_l3c57 : block
  signal s1_0 : sum_t_3_57;
  signal sum_3_57 : sum_t_3_57;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_57.mem") port map (clk, out2_0_reg, act_3_0_57);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_57.mem") port map (clk, out2_1_reg, act_3_1_57);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_57.mem") port map (clk, out2_5_reg, act_3_5_57);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_57.mem") port map (clk, out2_6_reg, act_3_6_57);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_57, SUM_WIDTH_3_57) + resize(act_3_1_57, SUM_WIDTH_3_57) + resize(act_3_5_57, SUM_WIDTH_3_57) + resize(act_3_6_57, SUM_WIDTH_3_57);
        -- Stage 2
        sum_3_57 <= s1_0;
      end if;
    end process;
    output(57) <= saturate(sum_3_57, 6);
  end block;

  -- LAYER 3, ch 58
  gen_l3c58 : block
  signal s1_0, s1_1 : sum_t_3_58;
  signal sum_3_58 : sum_t_3_58;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_58.mem") port map (clk, out2_0_reg, act_3_0_58);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_58.mem") port map (clk, out2_1_reg, act_3_1_58);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_58.mem") port map (clk, out2_4_reg, act_3_4_58);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_58.mem") port map (clk, out2_5_reg, act_3_5_58);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_58.mem") port map (clk, out2_6_reg, act_3_6_58);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_58.mem") port map (clk, out2_7_reg, act_3_7_58);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_58, SUM_WIDTH_3_58) + resize(act_3_1_58, SUM_WIDTH_3_58) + resize(act_3_4_58, SUM_WIDTH_3_58) + resize(act_3_5_58, SUM_WIDTH_3_58);
        s1_1 <= resize(act_3_6_58, SUM_WIDTH_3_58) + resize(act_3_7_58, SUM_WIDTH_3_58);
        -- Stage 2
        sum_3_58 <= s1_0 + s1_1;
      end if;
    end process;
    output(58) <= saturate(sum_3_58, 6);
  end block;

  -- LAYER 3, ch 59
  gen_l3c59 : block
  signal s1_0 : sum_t_3_59;
  signal sum_3_59 : sum_t_3_59;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_59.mem") port map (clk, out2_1_reg, act_3_1_59);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_59.mem") port map (clk, out2_4_reg, act_3_4_59);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_59.mem") port map (clk, out2_5_reg, act_3_5_59);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_59.mem") port map (clk, out2_7_reg, act_3_7_59);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_1_59, SUM_WIDTH_3_59) + resize(act_3_4_59, SUM_WIDTH_3_59) + resize(act_3_5_59, SUM_WIDTH_3_59) + resize(act_3_7_59, SUM_WIDTH_3_59);
        -- Stage 2
        sum_3_59 <= s1_0;
      end if;
    end process;
    output(59) <= saturate(sum_3_59, 6);
  end block;

  -- LAYER 3, ch 60
  gen_l3c60 : block
  signal s1_0, s1_1 : sum_t_3_60;
  signal sum_3_60 : sum_t_3_60;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_60.mem") port map (clk, out2_0_reg, act_3_0_60);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_60.mem") port map (clk, out2_4_reg, act_3_4_60);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_60.mem") port map (clk, out2_5_reg, act_3_5_60);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_60.mem") port map (clk, out2_6_reg, act_3_6_60);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_60.mem") port map (clk, out2_7_reg, act_3_7_60);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_60, SUM_WIDTH_3_60) + resize(act_3_4_60, SUM_WIDTH_3_60) + resize(act_3_5_60, SUM_WIDTH_3_60) + resize(act_3_6_60, SUM_WIDTH_3_60);
        s1_1 <= resize(act_3_7_60, SUM_WIDTH_3_60);
        -- Stage 2
        sum_3_60 <= s1_0 + s1_1;
      end if;
    end process;
    output(60) <= saturate(sum_3_60, 6);
  end block;

  -- LAYER 3, ch 61
  gen_l3c61 : block
  signal s1_0, s1_1 : sum_t_3_61;
  signal sum_3_61 : sum_t_3_61;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_61.mem") port map (clk, out2_0_reg, act_3_0_61);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_61.mem") port map (clk, out2_1_reg, act_3_1_61);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_61.mem") port map (clk, out2_4_reg, act_3_4_61);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_61.mem") port map (clk, out2_5_reg, act_3_5_61);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_61.mem") port map (clk, out2_7_reg, act_3_7_61);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_61, SUM_WIDTH_3_61) + resize(act_3_1_61, SUM_WIDTH_3_61) + resize(act_3_4_61, SUM_WIDTH_3_61) + resize(act_3_5_61, SUM_WIDTH_3_61);
        s1_1 <= resize(act_3_7_61, SUM_WIDTH_3_61);
        -- Stage 2
        sum_3_61 <= s1_0 + s1_1;
      end if;
    end process;
    output(61) <= saturate(sum_3_61, 6);
  end block;

  -- LAYER 3, ch 62
  gen_l3c62 : block
  signal s1_0 : sum_t_3_62;
  signal sum_3_62 : sum_t_3_62;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_62.mem") port map (clk, out2_0_reg, act_3_0_62);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_62.mem") port map (clk, out2_4_reg, act_3_4_62);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_62.mem") port map (clk, out2_5_reg, act_3_5_62);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_62.mem") port map (clk, out2_7_reg, act_3_7_62);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_62, SUM_WIDTH_3_62) + resize(act_3_4_62, SUM_WIDTH_3_62) + resize(act_3_5_62, SUM_WIDTH_3_62) + resize(act_3_7_62, SUM_WIDTH_3_62);
        -- Stage 2
        sum_3_62 <= s1_0;
      end if;
    end process;
    output(62) <= saturate(sum_3_62, 6);
  end block;

  -- LAYER 3, ch 63
  gen_l3c63 : block
  signal s1_0 : sum_t_3_63;
  signal sum_3_63 : sum_t_3_63;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_63.mem") port map (clk, out2_0_reg, act_3_0_63);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_63.mem") port map (clk, out2_1_reg, act_3_1_63);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_63.mem") port map (clk, out2_4_reg, act_3_4_63);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_63.mem") port map (clk, out2_5_reg, act_3_5_63);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_63, SUM_WIDTH_3_63) + resize(act_3_1_63, SUM_WIDTH_3_63) + resize(act_3_4_63, SUM_WIDTH_3_63) + resize(act_3_5_63, SUM_WIDTH_3_63);
        -- Stage 2
        sum_3_63 <= s1_0;
      end if;
    end process;
    output(63) <= saturate(sum_3_63, 6);
  end block;

  -- LAYER 3, ch 64
  gen_l3c64 : block
  signal s1_0, s1_1 : sum_t_3_64;
  signal sum_3_64 : sum_t_3_64;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_64.mem") port map (clk, out2_0_reg, act_3_0_64);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_64.mem") port map (clk, out2_1_reg, act_3_1_64);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_64.mem") port map (clk, out2_4_reg, act_3_4_64);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_64.mem") port map (clk, out2_5_reg, act_3_5_64);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_64.mem") port map (clk, out2_7_reg, act_3_7_64);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_64, SUM_WIDTH_3_64) + resize(act_3_1_64, SUM_WIDTH_3_64) + resize(act_3_4_64, SUM_WIDTH_3_64) + resize(act_3_5_64, SUM_WIDTH_3_64);
        s1_1 <= resize(act_3_7_64, SUM_WIDTH_3_64);
        -- Stage 2
        sum_3_64 <= s1_0 + s1_1;
      end if;
    end process;
    output(64) <= saturate(sum_3_64, 6);
  end block;

  -- LAYER 3, ch 65
  gen_l3c65 : block
  signal s1_0 : sum_t_3_65;
  signal sum_3_65 : sum_t_3_65;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_65.mem") port map (clk, out2_0_reg, act_3_0_65);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_65.mem") port map (clk, out2_4_reg, act_3_4_65);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_65.mem") port map (clk, out2_5_reg, act_3_5_65);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_65.mem") port map (clk, out2_7_reg, act_3_7_65);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_65, SUM_WIDTH_3_65) + resize(act_3_4_65, SUM_WIDTH_3_65) + resize(act_3_5_65, SUM_WIDTH_3_65) + resize(act_3_7_65, SUM_WIDTH_3_65);
        -- Stage 2
        sum_3_65 <= s1_0;
      end if;
    end process;
    output(65) <= saturate(sum_3_65, 6);
  end block;

  -- LAYER 3, ch 66
  gen_l3c66 : block
  signal s1_0, s1_1 : sum_t_3_66;
  signal sum_3_66 : sum_t_3_66;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_66.mem") port map (clk, out2_0_reg, act_3_0_66);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_66.mem") port map (clk, out2_1_reg, act_3_1_66);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_66.mem") port map (clk, out2_4_reg, act_3_4_66);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_66.mem") port map (clk, out2_5_reg, act_3_5_66);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_66.mem") port map (clk, out2_7_reg, act_3_7_66);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_66, SUM_WIDTH_3_66) + resize(act_3_1_66, SUM_WIDTH_3_66) + resize(act_3_4_66, SUM_WIDTH_3_66) + resize(act_3_5_66, SUM_WIDTH_3_66);
        s1_1 <= resize(act_3_7_66, SUM_WIDTH_3_66);
        -- Stage 2
        sum_3_66 <= s1_0 + s1_1;
      end if;
    end process;
    output(66) <= saturate(sum_3_66, 6);
  end block;

  -- LAYER 3, ch 67
  gen_l3c67 : block
  signal s1_0 : sum_t_3_67;
  signal sum_3_67 : sum_t_3_67;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_67.mem") port map (clk, out2_0_reg, act_3_0_67);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_67.mem") port map (clk, out2_1_reg, act_3_1_67);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_67.mem") port map (clk, out2_4_reg, act_3_4_67);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_67.mem") port map (clk, out2_5_reg, act_3_5_67);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_67, SUM_WIDTH_3_67) + resize(act_3_1_67, SUM_WIDTH_3_67) + resize(act_3_4_67, SUM_WIDTH_3_67) + resize(act_3_5_67, SUM_WIDTH_3_67);
        -- Stage 2
        sum_3_67 <= s1_0;
      end if;
    end process;
    output(67) <= saturate(sum_3_67, 6);
  end block;

  -- LAYER 3, ch 68
  gen_l3c68 : block
  signal s1_0, s1_1 : sum_t_3_68;
  signal sum_3_68 : sum_t_3_68;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_68.mem") port map (clk, out2_0_reg, act_3_0_68);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_68.mem") port map (clk, out2_1_reg, act_3_1_68);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_68.mem") port map (clk, out2_5_reg, act_3_5_68);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_68.mem") port map (clk, out2_6_reg, act_3_6_68);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_68.mem") port map (clk, out2_7_reg, act_3_7_68);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_68, SUM_WIDTH_3_68) + resize(act_3_1_68, SUM_WIDTH_3_68) + resize(act_3_5_68, SUM_WIDTH_3_68) + resize(act_3_6_68, SUM_WIDTH_3_68);
        s1_1 <= resize(act_3_7_68, SUM_WIDTH_3_68);
        -- Stage 2
        sum_3_68 <= s1_0 + s1_1;
      end if;
    end process;
    output(68) <= saturate(sum_3_68, 6);
  end block;

  -- LAYER 3, ch 69
  gen_l3c69 : block
  signal s1_0, s1_1 : sum_t_3_69;
  signal sum_3_69 : sum_t_3_69;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_69.mem") port map (clk, out2_0_reg, act_3_0_69);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_69.mem") port map (clk, out2_1_reg, act_3_1_69);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_69.mem") port map (clk, out2_4_reg, act_3_4_69);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_69.mem") port map (clk, out2_5_reg, act_3_5_69);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_69.mem") port map (clk, out2_7_reg, act_3_7_69);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_69, SUM_WIDTH_3_69) + resize(act_3_1_69, SUM_WIDTH_3_69) + resize(act_3_4_69, SUM_WIDTH_3_69) + resize(act_3_5_69, SUM_WIDTH_3_69);
        s1_1 <= resize(act_3_7_69, SUM_WIDTH_3_69);
        -- Stage 2
        sum_3_69 <= s1_0 + s1_1;
      end if;
    end process;
    output(69) <= saturate(sum_3_69, 6);
  end block;

  -- LAYER 3, ch 70
  gen_l3c70 : block
  signal s1_0, s1_1 : sum_t_3_70;
  signal sum_3_70 : sum_t_3_70;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_70.mem") port map (clk, out2_0_reg, act_3_0_70);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_70.mem") port map (clk, out2_1_reg, act_3_1_70);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_70.mem") port map (clk, out2_4_reg, act_3_4_70);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_70.mem") port map (clk, out2_5_reg, act_3_5_70);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_70.mem") port map (clk, out2_6_reg, act_3_6_70);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_70, SUM_WIDTH_3_70) + resize(act_3_1_70, SUM_WIDTH_3_70) + resize(act_3_4_70, SUM_WIDTH_3_70) + resize(act_3_5_70, SUM_WIDTH_3_70);
        s1_1 <= resize(act_3_6_70, SUM_WIDTH_3_70);
        -- Stage 2
        sum_3_70 <= s1_0 + s1_1;
      end if;
    end process;
    output(70) <= saturate(sum_3_70, 6);
  end block;

  -- LAYER 3, ch 71
  gen_l3c71 : block
  signal s1_0, s1_1 : sum_t_3_71;
  signal sum_3_71 : sum_t_3_71;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_71.mem") port map (clk, out2_0_reg, act_3_0_71);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_71.mem") port map (clk, out2_1_reg, act_3_1_71);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_71.mem") port map (clk, out2_4_reg, act_3_4_71);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_71.mem") port map (clk, out2_5_reg, act_3_5_71);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_71.mem") port map (clk, out2_6_reg, act_3_6_71);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_71, SUM_WIDTH_3_71) + resize(act_3_1_71, SUM_WIDTH_3_71) + resize(act_3_4_71, SUM_WIDTH_3_71) + resize(act_3_5_71, SUM_WIDTH_3_71);
        s1_1 <= resize(act_3_6_71, SUM_WIDTH_3_71);
        -- Stage 2
        sum_3_71 <= s1_0 + s1_1;
      end if;
    end process;
    output(71) <= saturate(sum_3_71, 6);
  end block;

  -- LAYER 3, ch 72
  gen_l3c72 : block
  signal s1_0, s1_1 : sum_t_3_72;
  signal sum_3_72 : sum_t_3_72;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_72.mem") port map (clk, out2_0_reg, act_3_0_72);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_72.mem") port map (clk, out2_1_reg, act_3_1_72);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_72.mem") port map (clk, out2_5_reg, act_3_5_72);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_72.mem") port map (clk, out2_6_reg, act_3_6_72);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_72.mem") port map (clk, out2_7_reg, act_3_7_72);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_72, SUM_WIDTH_3_72) + resize(act_3_1_72, SUM_WIDTH_3_72) + resize(act_3_5_72, SUM_WIDTH_3_72) + resize(act_3_6_72, SUM_WIDTH_3_72);
        s1_1 <= resize(act_3_7_72, SUM_WIDTH_3_72);
        -- Stage 2
        sum_3_72 <= s1_0 + s1_1;
      end if;
    end process;
    output(72) <= saturate(sum_3_72, 6);
  end block;

  -- LAYER 3, ch 73
  gen_l3c73 : block
  signal s1_0 : sum_t_3_73;
  signal sum_3_73 : sum_t_3_73;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_73.mem") port map (clk, out2_0_reg, act_3_0_73);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_73.mem") port map (clk, out2_4_reg, act_3_4_73);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_73.mem") port map (clk, out2_5_reg, act_3_5_73);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_73, SUM_WIDTH_3_73) + resize(act_3_4_73, SUM_WIDTH_3_73) + resize(act_3_5_73, SUM_WIDTH_3_73);
        -- Stage 2
        sum_3_73 <= s1_0;
      end if;
    end process;
    output(73) <= saturate(sum_3_73, 6);
  end block;

  -- LAYER 3, ch 74
  gen_l3c74 : block
  signal s1_0, s1_1 : sum_t_3_74;
  signal sum_3_74 : sum_t_3_74;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_74.mem") port map (clk, out2_0_reg, act_3_0_74);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_74.mem") port map (clk, out2_1_reg, act_3_1_74);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_74.mem") port map (clk, out2_4_reg, act_3_4_74);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_74.mem") port map (clk, out2_5_reg, act_3_5_74);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_74.mem") port map (clk, out2_7_reg, act_3_7_74);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_74, SUM_WIDTH_3_74) + resize(act_3_1_74, SUM_WIDTH_3_74) + resize(act_3_4_74, SUM_WIDTH_3_74) + resize(act_3_5_74, SUM_WIDTH_3_74);
        s1_1 <= resize(act_3_7_74, SUM_WIDTH_3_74);
        -- Stage 2
        sum_3_74 <= s1_0 + s1_1;
      end if;
    end process;
    output(74) <= saturate(sum_3_74, 6);
  end block;

  -- LAYER 3, ch 75
  gen_l3c75 : block
  signal s1_0 : sum_t_3_75;
  signal sum_3_75 : sum_t_3_75;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_75.mem") port map (clk, out2_0_reg, act_3_0_75);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_75.mem") port map (clk, out2_4_reg, act_3_4_75);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_75.mem") port map (clk, out2_5_reg, act_3_5_75);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_75.mem") port map (clk, out2_7_reg, act_3_7_75);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_75, SUM_WIDTH_3_75) + resize(act_3_4_75, SUM_WIDTH_3_75) + resize(act_3_5_75, SUM_WIDTH_3_75) + resize(act_3_7_75, SUM_WIDTH_3_75);
        -- Stage 2
        sum_3_75 <= s1_0;
      end if;
    end process;
    output(75) <= saturate(sum_3_75, 6);
  end block;

  -- LAYER 3, ch 76
  gen_l3c76 : block
  signal s1_0, s1_1 : sum_t_3_76;
  signal sum_3_76 : sum_t_3_76;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_76.mem") port map (clk, out2_0_reg, act_3_0_76);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_76.mem") port map (clk, out2_4_reg, act_3_4_76);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_76.mem") port map (clk, out2_5_reg, act_3_5_76);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_76.mem") port map (clk, out2_6_reg, act_3_6_76);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_76.mem") port map (clk, out2_7_reg, act_3_7_76);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_76, SUM_WIDTH_3_76) + resize(act_3_4_76, SUM_WIDTH_3_76) + resize(act_3_5_76, SUM_WIDTH_3_76) + resize(act_3_6_76, SUM_WIDTH_3_76);
        s1_1 <= resize(act_3_7_76, SUM_WIDTH_3_76);
        -- Stage 2
        sum_3_76 <= s1_0 + s1_1;
      end if;
    end process;
    output(76) <= saturate(sum_3_76, 6);
  end block;

  -- LAYER 3, ch 77
  gen_l3c77 : block
  signal s1_0, s1_1 : sum_t_3_77;
  signal sum_3_77 : sum_t_3_77;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_77.mem") port map (clk, out2_0_reg, act_3_0_77);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_77.mem") port map (clk, out2_1_reg, act_3_1_77);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_77.mem") port map (clk, out2_5_reg, act_3_5_77);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_77.mem") port map (clk, out2_6_reg, act_3_6_77);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_77.mem") port map (clk, out2_7_reg, act_3_7_77);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_77, SUM_WIDTH_3_77) + resize(act_3_1_77, SUM_WIDTH_3_77) + resize(act_3_5_77, SUM_WIDTH_3_77) + resize(act_3_6_77, SUM_WIDTH_3_77);
        s1_1 <= resize(act_3_7_77, SUM_WIDTH_3_77);
        -- Stage 2
        sum_3_77 <= s1_0 + s1_1;
      end if;
    end process;
    output(77) <= saturate(sum_3_77, 6);
  end block;

  -- LAYER 3, ch 78
  gen_l3c78 : block
  signal s1_0, s1_1 : sum_t_3_78;
  signal sum_3_78 : sum_t_3_78;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_78.mem") port map (clk, out2_0_reg, act_3_0_78);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_78.mem") port map (clk, out2_1_reg, act_3_1_78);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_78.mem") port map (clk, out2_4_reg, act_3_4_78);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_78.mem") port map (clk, out2_5_reg, act_3_5_78);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_78.mem") port map (clk, out2_6_reg, act_3_6_78);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_78.mem") port map (clk, out2_7_reg, act_3_7_78);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_78, SUM_WIDTH_3_78) + resize(act_3_1_78, SUM_WIDTH_3_78) + resize(act_3_4_78, SUM_WIDTH_3_78) + resize(act_3_5_78, SUM_WIDTH_3_78);
        s1_1 <= resize(act_3_6_78, SUM_WIDTH_3_78) + resize(act_3_7_78, SUM_WIDTH_3_78);
        -- Stage 2
        sum_3_78 <= s1_0 + s1_1;
      end if;
    end process;
    output(78) <= saturate(sum_3_78, 6);
  end block;

  -- LAYER 3, ch 79
  gen_l3c79 : block
  signal s1_0, s1_1 : sum_t_3_79;
  signal sum_3_79 : sum_t_3_79;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_79.mem") port map (clk, out2_0_reg, act_3_0_79);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_79.mem") port map (clk, out2_1_reg, act_3_1_79);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_79.mem") port map (clk, out2_4_reg, act_3_4_79);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_79.mem") port map (clk, out2_5_reg, act_3_5_79);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_79.mem") port map (clk, out2_7_reg, act_3_7_79);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_79, SUM_WIDTH_3_79) + resize(act_3_1_79, SUM_WIDTH_3_79) + resize(act_3_4_79, SUM_WIDTH_3_79) + resize(act_3_5_79, SUM_WIDTH_3_79);
        s1_1 <= resize(act_3_7_79, SUM_WIDTH_3_79);
        -- Stage 2
        sum_3_79 <= s1_0 + s1_1;
      end if;
    end process;
    output(79) <= saturate(sum_3_79, 6);
  end block;

  -- LAYER 3, ch 80
  gen_l3c80 : block
  signal s1_0, s1_1 : sum_t_3_80;
  signal sum_3_80 : sum_t_3_80;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_80.mem") port map (clk, out2_0_reg, act_3_0_80);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_80.mem") port map (clk, out2_1_reg, act_3_1_80);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_80.mem") port map (clk, out2_4_reg, act_3_4_80);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_80.mem") port map (clk, out2_5_reg, act_3_5_80);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_80.mem") port map (clk, out2_6_reg, act_3_6_80);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_80.mem") port map (clk, out2_7_reg, act_3_7_80);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_80, SUM_WIDTH_3_80) + resize(act_3_1_80, SUM_WIDTH_3_80) + resize(act_3_4_80, SUM_WIDTH_3_80) + resize(act_3_5_80, SUM_WIDTH_3_80);
        s1_1 <= resize(act_3_6_80, SUM_WIDTH_3_80) + resize(act_3_7_80, SUM_WIDTH_3_80);
        -- Stage 2
        sum_3_80 <= s1_0 + s1_1;
      end if;
    end process;
    output(80) <= saturate(sum_3_80, 6);
  end block;

  -- LAYER 3, ch 81
  gen_l3c81 : block
  signal s1_0 : sum_t_3_81;
  signal sum_3_81 : sum_t_3_81;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_81.mem") port map (clk, out2_0_reg, act_3_0_81);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_81.mem") port map (clk, out2_1_reg, act_3_1_81);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_81.mem") port map (clk, out2_4_reg, act_3_4_81);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_81.mem") port map (clk, out2_5_reg, act_3_5_81);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_81, SUM_WIDTH_3_81) + resize(act_3_1_81, SUM_WIDTH_3_81) + resize(act_3_4_81, SUM_WIDTH_3_81) + resize(act_3_5_81, SUM_WIDTH_3_81);
        -- Stage 2
        sum_3_81 <= s1_0;
      end if;
    end process;
    output(81) <= saturate(sum_3_81, 6);
  end block;

  -- LAYER 3, ch 82
  gen_l3c82 : block
  signal s1_0, s1_1 : sum_t_3_82;
  signal sum_3_82 : sum_t_3_82;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_82.mem") port map (clk, out2_0_reg, act_3_0_82);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_82.mem") port map (clk, out2_1_reg, act_3_1_82);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_82.mem") port map (clk, out2_4_reg, act_3_4_82);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_82.mem") port map (clk, out2_5_reg, act_3_5_82);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_82.mem") port map (clk, out2_6_reg, act_3_6_82);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_82, SUM_WIDTH_3_82) + resize(act_3_1_82, SUM_WIDTH_3_82) + resize(act_3_4_82, SUM_WIDTH_3_82) + resize(act_3_5_82, SUM_WIDTH_3_82);
        s1_1 <= resize(act_3_6_82, SUM_WIDTH_3_82);
        -- Stage 2
        sum_3_82 <= s1_0 + s1_1;
      end if;
    end process;
    output(82) <= saturate(sum_3_82, 6);
  end block;

  -- LAYER 3, ch 83
  gen_l3c83 : block
  signal s1_0, s1_1 : sum_t_3_83;
  signal sum_3_83 : sum_t_3_83;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_83.mem") port map (clk, out2_0_reg, act_3_0_83);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_83.mem") port map (clk, out2_1_reg, act_3_1_83);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_83.mem") port map (clk, out2_4_reg, act_3_4_83);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_83.mem") port map (clk, out2_5_reg, act_3_5_83);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_83.mem") port map (clk, out2_7_reg, act_3_7_83);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_83, SUM_WIDTH_3_83) + resize(act_3_1_83, SUM_WIDTH_3_83) + resize(act_3_4_83, SUM_WIDTH_3_83) + resize(act_3_5_83, SUM_WIDTH_3_83);
        s1_1 <= resize(act_3_7_83, SUM_WIDTH_3_83);
        -- Stage 2
        sum_3_83 <= s1_0 + s1_1;
      end if;
    end process;
    output(83) <= saturate(sum_3_83, 6);
  end block;

  -- LAYER 3, ch 84
  gen_l3c84 : block
  signal s1_0 : sum_t_3_84;
  signal sum_3_84 : sum_t_3_84;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_84.mem") port map (clk, out2_0_reg, act_3_0_84);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_84.mem") port map (clk, out2_4_reg, act_3_4_84);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_84.mem") port map (clk, out2_5_reg, act_3_5_84);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_84.mem") port map (clk, out2_6_reg, act_3_6_84);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_84, SUM_WIDTH_3_84) + resize(act_3_4_84, SUM_WIDTH_3_84) + resize(act_3_5_84, SUM_WIDTH_3_84) + resize(act_3_6_84, SUM_WIDTH_3_84);
        -- Stage 2
        sum_3_84 <= s1_0;
      end if;
    end process;
    output(84) <= saturate(sum_3_84, 6);
  end block;

  -- LAYER 3, ch 85
  gen_l3c85 : block
  signal s1_0, s1_1 : sum_t_3_85;
  signal sum_3_85 : sum_t_3_85;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_85.mem") port map (clk, out2_0_reg, act_3_0_85);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_85.mem") port map (clk, out2_1_reg, act_3_1_85);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_85.mem") port map (clk, out2_4_reg, act_3_4_85);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_85.mem") port map (clk, out2_5_reg, act_3_5_85);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_85.mem") port map (clk, out2_6_reg, act_3_6_85);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_85.mem") port map (clk, out2_7_reg, act_3_7_85);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_85, SUM_WIDTH_3_85) + resize(act_3_1_85, SUM_WIDTH_3_85) + resize(act_3_4_85, SUM_WIDTH_3_85) + resize(act_3_5_85, SUM_WIDTH_3_85);
        s1_1 <= resize(act_3_6_85, SUM_WIDTH_3_85) + resize(act_3_7_85, SUM_WIDTH_3_85);
        -- Stage 2
        sum_3_85 <= s1_0 + s1_1;
      end if;
    end process;
    output(85) <= saturate(sum_3_85, 6);
  end block;

  -- LAYER 3, ch 86
  gen_l3c86 : block
  signal s1_0, s1_1 : sum_t_3_86;
  signal sum_3_86 : sum_t_3_86;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_86.mem") port map (clk, out2_0_reg, act_3_0_86);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_86.mem") port map (clk, out2_1_reg, act_3_1_86);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_86.mem") port map (clk, out2_5_reg, act_3_5_86);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_86.mem") port map (clk, out2_6_reg, act_3_6_86);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_86.mem") port map (clk, out2_7_reg, act_3_7_86);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_86, SUM_WIDTH_3_86) + resize(act_3_1_86, SUM_WIDTH_3_86) + resize(act_3_5_86, SUM_WIDTH_3_86) + resize(act_3_6_86, SUM_WIDTH_3_86);
        s1_1 <= resize(act_3_7_86, SUM_WIDTH_3_86);
        -- Stage 2
        sum_3_86 <= s1_0 + s1_1;
      end if;
    end process;
    output(86) <= saturate(sum_3_86, 6);
  end block;

  -- LAYER 3, ch 87
  gen_l3c87 : block
  signal s1_0, s1_1 : sum_t_3_87;
  signal sum_3_87 : sum_t_3_87;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_87.mem") port map (clk, out2_0_reg, act_3_0_87);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_87.mem") port map (clk, out2_1_reg, act_3_1_87);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_87.mem") port map (clk, out2_4_reg, act_3_4_87);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_87.mem") port map (clk, out2_5_reg, act_3_5_87);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_87.mem") port map (clk, out2_6_reg, act_3_6_87);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_87.mem") port map (clk, out2_7_reg, act_3_7_87);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_87, SUM_WIDTH_3_87) + resize(act_3_1_87, SUM_WIDTH_3_87) + resize(act_3_4_87, SUM_WIDTH_3_87) + resize(act_3_5_87, SUM_WIDTH_3_87);
        s1_1 <= resize(act_3_6_87, SUM_WIDTH_3_87) + resize(act_3_7_87, SUM_WIDTH_3_87);
        -- Stage 2
        sum_3_87 <= s1_0 + s1_1;
      end if;
    end process;
    output(87) <= saturate(sum_3_87, 6);
  end block;

  -- LAYER 3, ch 88
  gen_l3c88 : block
  signal s1_0, s1_1 : sum_t_3_88;
  signal sum_3_88 : sum_t_3_88;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_88.mem") port map (clk, out2_0_reg, act_3_0_88);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_88.mem") port map (clk, out2_1_reg, act_3_1_88);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_88.mem") port map (clk, out2_4_reg, act_3_4_88);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_88.mem") port map (clk, out2_5_reg, act_3_5_88);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_88.mem") port map (clk, out2_6_reg, act_3_6_88);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_88.mem") port map (clk, out2_7_reg, act_3_7_88);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_88, SUM_WIDTH_3_88) + resize(act_3_1_88, SUM_WIDTH_3_88) + resize(act_3_4_88, SUM_WIDTH_3_88) + resize(act_3_5_88, SUM_WIDTH_3_88);
        s1_1 <= resize(act_3_6_88, SUM_WIDTH_3_88) + resize(act_3_7_88, SUM_WIDTH_3_88);
        -- Stage 2
        sum_3_88 <= s1_0 + s1_1;
      end if;
    end process;
    output(88) <= saturate(sum_3_88, 6);
  end block;

  -- LAYER 3, ch 89
  gen_l3c89 : block
  signal s1_0, s1_1 : sum_t_3_89;
  signal sum_3_89 : sum_t_3_89;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_89.mem") port map (clk, out2_0_reg, act_3_0_89);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_89.mem") port map (clk, out2_1_reg, act_3_1_89);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_89.mem") port map (clk, out2_4_reg, act_3_4_89);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_89.mem") port map (clk, out2_5_reg, act_3_5_89);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_89.mem") port map (clk, out2_6_reg, act_3_6_89);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_89.mem") port map (clk, out2_7_reg, act_3_7_89);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_89, SUM_WIDTH_3_89) + resize(act_3_1_89, SUM_WIDTH_3_89) + resize(act_3_4_89, SUM_WIDTH_3_89) + resize(act_3_5_89, SUM_WIDTH_3_89);
        s1_1 <= resize(act_3_6_89, SUM_WIDTH_3_89) + resize(act_3_7_89, SUM_WIDTH_3_89);
        -- Stage 2
        sum_3_89 <= s1_0 + s1_1;
      end if;
    end process;
    output(89) <= saturate(sum_3_89, 6);
  end block;

  -- LAYER 3, ch 90
  gen_l3c90 : block
  signal s1_0 : sum_t_3_90;
  signal sum_3_90 : sum_t_3_90;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_90.mem") port map (clk, out2_0_reg, act_3_0_90);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_90.mem") port map (clk, out2_4_reg, act_3_4_90);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_90.mem") port map (clk, out2_7_reg, act_3_7_90);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_90, SUM_WIDTH_3_90) + resize(act_3_4_90, SUM_WIDTH_3_90) + resize(act_3_7_90, SUM_WIDTH_3_90);
        -- Stage 2
        sum_3_90 <= s1_0;
      end if;
    end process;
    output(90) <= saturate(sum_3_90, 6);
  end block;

  -- LAYER 3, ch 91
  gen_l3c91 : block
  signal s1_0, s1_1 : sum_t_3_91;
  signal sum_3_91 : sum_t_3_91;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_91.mem") port map (clk, out2_0_reg, act_3_0_91);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_91.mem") port map (clk, out2_1_reg, act_3_1_91);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_91.mem") port map (clk, out2_4_reg, act_3_4_91);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_91.mem") port map (clk, out2_5_reg, act_3_5_91);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_91.mem") port map (clk, out2_7_reg, act_3_7_91);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_91, SUM_WIDTH_3_91) + resize(act_3_1_91, SUM_WIDTH_3_91) + resize(act_3_4_91, SUM_WIDTH_3_91) + resize(act_3_5_91, SUM_WIDTH_3_91);
        s1_1 <= resize(act_3_7_91, SUM_WIDTH_3_91);
        -- Stage 2
        sum_3_91 <= s1_0 + s1_1;
      end if;
    end process;
    output(91) <= saturate(sum_3_91, 6);
  end block;

  -- LAYER 3, ch 92
  gen_l3c92 : block
  signal s1_0, s1_1 : sum_t_3_92;
  signal sum_3_92 : sum_t_3_92;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_92.mem") port map (clk, out2_0_reg, act_3_0_92);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_92.mem") port map (clk, out2_1_reg, act_3_1_92);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_92.mem") port map (clk, out2_4_reg, act_3_4_92);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_92.mem") port map (clk, out2_5_reg, act_3_5_92);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_92.mem") port map (clk, out2_6_reg, act_3_6_92);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_92, SUM_WIDTH_3_92) + resize(act_3_1_92, SUM_WIDTH_3_92) + resize(act_3_4_92, SUM_WIDTH_3_92) + resize(act_3_5_92, SUM_WIDTH_3_92);
        s1_1 <= resize(act_3_6_92, SUM_WIDTH_3_92);
        -- Stage 2
        sum_3_92 <= s1_0 + s1_1;
      end if;
    end process;
    output(92) <= saturate(sum_3_92, 6);
  end block;

  -- LAYER 3, ch 93
  gen_l3c93 : block
  signal s1_0, s1_1 : sum_t_3_93;
  signal sum_3_93 : sum_t_3_93;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_93.mem") port map (clk, out2_0_reg, act_3_0_93);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_93.mem") port map (clk, out2_4_reg, act_3_4_93);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_93.mem") port map (clk, out2_5_reg, act_3_5_93);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_93.mem") port map (clk, out2_6_reg, act_3_6_93);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_93.mem") port map (clk, out2_7_reg, act_3_7_93);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_93, SUM_WIDTH_3_93) + resize(act_3_4_93, SUM_WIDTH_3_93) + resize(act_3_5_93, SUM_WIDTH_3_93) + resize(act_3_6_93, SUM_WIDTH_3_93);
        s1_1 <= resize(act_3_7_93, SUM_WIDTH_3_93);
        -- Stage 2
        sum_3_93 <= s1_0 + s1_1;
      end if;
    end process;
    output(93) <= saturate(sum_3_93, 6);
  end block;

  -- LAYER 3, ch 94
  gen_l3c94 : block
  signal s1_0, s1_1 : sum_t_3_94;
  signal sum_3_94 : sum_t_3_94;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_94.mem") port map (clk, out2_0_reg, act_3_0_94);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_94.mem") port map (clk, out2_1_reg, act_3_1_94);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_94.mem") port map (clk, out2_4_reg, act_3_4_94);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_94.mem") port map (clk, out2_5_reg, act_3_5_94);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_94.mem") port map (clk, out2_7_reg, act_3_7_94);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_94, SUM_WIDTH_3_94) + resize(act_3_1_94, SUM_WIDTH_3_94) + resize(act_3_4_94, SUM_WIDTH_3_94) + resize(act_3_5_94, SUM_WIDTH_3_94);
        s1_1 <= resize(act_3_7_94, SUM_WIDTH_3_94);
        -- Stage 2
        sum_3_94 <= s1_0 + s1_1;
      end if;
    end process;
    output(94) <= saturate(sum_3_94, 6);
  end block;

  -- LAYER 3, ch 95
  gen_l3c95 : block
  signal s1_0, s1_1 : sum_t_3_95;
  signal sum_3_95 : sum_t_3_95;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_95.mem") port map (clk, out2_0_reg, act_3_0_95);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_95.mem") port map (clk, out2_1_reg, act_3_1_95);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_95.mem") port map (clk, out2_4_reg, act_3_4_95);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_95.mem") port map (clk, out2_5_reg, act_3_5_95);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_95.mem") port map (clk, out2_6_reg, act_3_6_95);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_95.mem") port map (clk, out2_7_reg, act_3_7_95);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_95, SUM_WIDTH_3_95) + resize(act_3_1_95, SUM_WIDTH_3_95) + resize(act_3_4_95, SUM_WIDTH_3_95) + resize(act_3_5_95, SUM_WIDTH_3_95);
        s1_1 <= resize(act_3_6_95, SUM_WIDTH_3_95) + resize(act_3_7_95, SUM_WIDTH_3_95);
        -- Stage 2
        sum_3_95 <= s1_0 + s1_1;
      end if;
    end process;
    output(95) <= saturate(sum_3_95, 6);
  end block;

  -- LAYER 3, ch 96
  gen_l3c96 : block
  signal s1_0, s1_1 : sum_t_3_96;
  signal sum_3_96 : sum_t_3_96;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_96.mem") port map (clk, out2_0_reg, act_3_0_96);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_96.mem") port map (clk, out2_4_reg, act_3_4_96);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_96.mem") port map (clk, out2_5_reg, act_3_5_96);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_96.mem") port map (clk, out2_6_reg, act_3_6_96);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_96.mem") port map (clk, out2_7_reg, act_3_7_96);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_96, SUM_WIDTH_3_96) + resize(act_3_4_96, SUM_WIDTH_3_96) + resize(act_3_5_96, SUM_WIDTH_3_96) + resize(act_3_6_96, SUM_WIDTH_3_96);
        s1_1 <= resize(act_3_7_96, SUM_WIDTH_3_96);
        -- Stage 2
        sum_3_96 <= s1_0 + s1_1;
      end if;
    end process;
    output(96) <= saturate(sum_3_96, 6);
  end block;

  -- LAYER 3, ch 97
  gen_l3c97 : block
  signal s1_0 : sum_t_3_97;
  signal sum_3_97 : sum_t_3_97;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_97.mem") port map (clk, out2_0_reg, act_3_0_97);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_97.mem") port map (clk, out2_5_reg, act_3_5_97);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_97.mem") port map (clk, out2_6_reg, act_3_6_97);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_97.mem") port map (clk, out2_7_reg, act_3_7_97);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_97, SUM_WIDTH_3_97) + resize(act_3_5_97, SUM_WIDTH_3_97) + resize(act_3_6_97, SUM_WIDTH_3_97) + resize(act_3_7_97, SUM_WIDTH_3_97);
        -- Stage 2
        sum_3_97 <= s1_0;
      end if;
    end process;
    output(97) <= saturate(sum_3_97, 6);
  end block;

  -- LAYER 3, ch 98
  gen_l3c98 : block
  signal s1_0, s1_1 : sum_t_3_98;
  signal sum_3_98 : sum_t_3_98;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_98.mem") port map (clk, out2_0_reg, act_3_0_98);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_98.mem") port map (clk, out2_1_reg, act_3_1_98);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_98.mem") port map (clk, out2_4_reg, act_3_4_98);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_98.mem") port map (clk, out2_5_reg, act_3_5_98);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_98.mem") port map (clk, out2_6_reg, act_3_6_98);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_98.mem") port map (clk, out2_7_reg, act_3_7_98);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_98, SUM_WIDTH_3_98) + resize(act_3_1_98, SUM_WIDTH_3_98) + resize(act_3_4_98, SUM_WIDTH_3_98) + resize(act_3_5_98, SUM_WIDTH_3_98);
        s1_1 <= resize(act_3_6_98, SUM_WIDTH_3_98) + resize(act_3_7_98, SUM_WIDTH_3_98);
        -- Stage 2
        sum_3_98 <= s1_0 + s1_1;
      end if;
    end process;
    output(98) <= saturate(sum_3_98, 6);
  end block;

  -- LAYER 3, ch 99
  gen_l3c99 : block
  signal s1_0 : sum_t_3_99;
  signal sum_3_99 : sum_t_3_99;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_99.mem") port map (clk, out2_0_reg, act_3_0_99);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_99.mem") port map (clk, out2_6_reg, act_3_6_99);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_99, SUM_WIDTH_3_99) + resize(act_3_6_99, SUM_WIDTH_3_99);
        -- Stage 2
        sum_3_99 <= s1_0;
      end if;
    end process;
    output(99) <= saturate(sum_3_99, 6);
  end block;

  -- LAYER 3, ch 100
  gen_l3c100 : block
  signal s1_0 : sum_t_3_100;
  signal sum_3_100 : sum_t_3_100;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_100.mem") port map (clk, out2_0_reg, act_3_0_100);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_100.mem") port map (clk, out2_1_reg, act_3_1_100);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_100.mem") port map (clk, out2_4_reg, act_3_4_100);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_100.mem") port map (clk, out2_6_reg, act_3_6_100);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_100, SUM_WIDTH_3_100) + resize(act_3_1_100, SUM_WIDTH_3_100) + resize(act_3_4_100, SUM_WIDTH_3_100) + resize(act_3_6_100, SUM_WIDTH_3_100);
        -- Stage 2
        sum_3_100 <= s1_0;
      end if;
    end process;
    output(100) <= saturate(sum_3_100, 6);
  end block;

  -- LAYER 3, ch 101
  gen_l3c101 : block
  signal s1_0, s1_1 : sum_t_3_101;
  signal sum_3_101 : sum_t_3_101;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_101.mem") port map (clk, out2_0_reg, act_3_0_101);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_101.mem") port map (clk, out2_1_reg, act_3_1_101);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_101.mem") port map (clk, out2_4_reg, act_3_4_101);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_101.mem") port map (clk, out2_5_reg, act_3_5_101);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_101.mem") port map (clk, out2_6_reg, act_3_6_101);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_101.mem") port map (clk, out2_7_reg, act_3_7_101);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_101, SUM_WIDTH_3_101) + resize(act_3_1_101, SUM_WIDTH_3_101) + resize(act_3_4_101, SUM_WIDTH_3_101) + resize(act_3_5_101, SUM_WIDTH_3_101);
        s1_1 <= resize(act_3_6_101, SUM_WIDTH_3_101) + resize(act_3_7_101, SUM_WIDTH_3_101);
        -- Stage 2
        sum_3_101 <= s1_0 + s1_1;
      end if;
    end process;
    output(101) <= saturate(sum_3_101, 6);
  end block;

  -- LAYER 3, ch 102
  gen_l3c102 : block
  signal s1_0, s1_1 : sum_t_3_102;
  signal sum_3_102 : sum_t_3_102;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_102.mem") port map (clk, out2_0_reg, act_3_0_102);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_102.mem") port map (clk, out2_1_reg, act_3_1_102);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_102.mem") port map (clk, out2_4_reg, act_3_4_102);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_102.mem") port map (clk, out2_5_reg, act_3_5_102);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_102.mem") port map (clk, out2_7_reg, act_3_7_102);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_102, SUM_WIDTH_3_102) + resize(act_3_1_102, SUM_WIDTH_3_102) + resize(act_3_4_102, SUM_WIDTH_3_102) + resize(act_3_5_102, SUM_WIDTH_3_102);
        s1_1 <= resize(act_3_7_102, SUM_WIDTH_3_102);
        -- Stage 2
        sum_3_102 <= s1_0 + s1_1;
      end if;
    end process;
    output(102) <= saturate(sum_3_102, 6);
  end block;

  -- LAYER 3, ch 103
  gen_l3c103 : block
  signal s1_0, s1_1 : sum_t_3_103;
  signal sum_3_103 : sum_t_3_103;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_103.mem") port map (clk, out2_0_reg, act_3_0_103);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_103.mem") port map (clk, out2_1_reg, act_3_1_103);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_103.mem") port map (clk, out2_4_reg, act_3_4_103);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_103.mem") port map (clk, out2_5_reg, act_3_5_103);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_103.mem") port map (clk, out2_6_reg, act_3_6_103);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_103.mem") port map (clk, out2_7_reg, act_3_7_103);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_103, SUM_WIDTH_3_103) + resize(act_3_1_103, SUM_WIDTH_3_103) + resize(act_3_4_103, SUM_WIDTH_3_103) + resize(act_3_5_103, SUM_WIDTH_3_103);
        s1_1 <= resize(act_3_6_103, SUM_WIDTH_3_103) + resize(act_3_7_103, SUM_WIDTH_3_103);
        -- Stage 2
        sum_3_103 <= s1_0 + s1_1;
      end if;
    end process;
    output(103) <= saturate(sum_3_103, 6);
  end block;

  -- LAYER 3, ch 104
  gen_l3c104 : block
  signal s1_0 : sum_t_3_104;
  signal sum_3_104 : sum_t_3_104;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_104.mem") port map (clk, out2_0_reg, act_3_0_104);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_104.mem") port map (clk, out2_5_reg, act_3_5_104);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_104.mem") port map (clk, out2_6_reg, act_3_6_104);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_104.mem") port map (clk, out2_7_reg, act_3_7_104);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_104, SUM_WIDTH_3_104) + resize(act_3_5_104, SUM_WIDTH_3_104) + resize(act_3_6_104, SUM_WIDTH_3_104) + resize(act_3_7_104, SUM_WIDTH_3_104);
        -- Stage 2
        sum_3_104 <= s1_0;
      end if;
    end process;
    output(104) <= saturate(sum_3_104, 6);
  end block;

  -- LAYER 3, ch 105
  gen_l3c105 : block
  signal s1_0 : sum_t_3_105;
  signal sum_3_105 : sum_t_3_105;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_105.mem") port map (clk, out2_0_reg, act_3_0_105);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_105.mem") port map (clk, out2_4_reg, act_3_4_105);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_105.mem") port map (clk, out2_5_reg, act_3_5_105);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_105.mem") port map (clk, out2_6_reg, act_3_6_105);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_105, SUM_WIDTH_3_105) + resize(act_3_4_105, SUM_WIDTH_3_105) + resize(act_3_5_105, SUM_WIDTH_3_105) + resize(act_3_6_105, SUM_WIDTH_3_105);
        -- Stage 2
        sum_3_105 <= s1_0;
      end if;
    end process;
    output(105) <= saturate(sum_3_105, 6);
  end block;

  -- LAYER 3, ch 106
  gen_l3c106 : block
  signal s1_0, s1_1 : sum_t_3_106;
  signal sum_3_106 : sum_t_3_106;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_106.mem") port map (clk, out2_0_reg, act_3_0_106);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_106.mem") port map (clk, out2_4_reg, act_3_4_106);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_106.mem") port map (clk, out2_5_reg, act_3_5_106);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_106.mem") port map (clk, out2_6_reg, act_3_6_106);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_106.mem") port map (clk, out2_7_reg, act_3_7_106);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_106, SUM_WIDTH_3_106) + resize(act_3_4_106, SUM_WIDTH_3_106) + resize(act_3_5_106, SUM_WIDTH_3_106) + resize(act_3_6_106, SUM_WIDTH_3_106);
        s1_1 <= resize(act_3_7_106, SUM_WIDTH_3_106);
        -- Stage 2
        sum_3_106 <= s1_0 + s1_1;
      end if;
    end process;
    output(106) <= saturate(sum_3_106, 6);
  end block;

  -- LAYER 3, ch 107
  gen_l3c107 : block
  signal s1_0, s1_1 : sum_t_3_107;
  signal sum_3_107 : sum_t_3_107;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_107.mem") port map (clk, out2_0_reg, act_3_0_107);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_107.mem") port map (clk, out2_1_reg, act_3_1_107);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_107.mem") port map (clk, out2_4_reg, act_3_4_107);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_107.mem") port map (clk, out2_5_reg, act_3_5_107);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_107.mem") port map (clk, out2_6_reg, act_3_6_107);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_107.mem") port map (clk, out2_7_reg, act_3_7_107);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_107, SUM_WIDTH_3_107) + resize(act_3_1_107, SUM_WIDTH_3_107) + resize(act_3_4_107, SUM_WIDTH_3_107) + resize(act_3_5_107, SUM_WIDTH_3_107);
        s1_1 <= resize(act_3_6_107, SUM_WIDTH_3_107) + resize(act_3_7_107, SUM_WIDTH_3_107);
        -- Stage 2
        sum_3_107 <= s1_0 + s1_1;
      end if;
    end process;
    output(107) <= saturate(sum_3_107, 6);
  end block;

  -- LAYER 3, ch 108
  gen_l3c108 : block
  signal s1_0, s1_1 : sum_t_3_108;
  signal sum_3_108 : sum_t_3_108;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_108.mem") port map (clk, out2_0_reg, act_3_0_108);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_108.mem") port map (clk, out2_4_reg, act_3_4_108);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_108.mem") port map (clk, out2_5_reg, act_3_5_108);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_108.mem") port map (clk, out2_6_reg, act_3_6_108);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_108.mem") port map (clk, out2_7_reg, act_3_7_108);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_108, SUM_WIDTH_3_108) + resize(act_3_4_108, SUM_WIDTH_3_108) + resize(act_3_5_108, SUM_WIDTH_3_108) + resize(act_3_6_108, SUM_WIDTH_3_108);
        s1_1 <= resize(act_3_7_108, SUM_WIDTH_3_108);
        -- Stage 2
        sum_3_108 <= s1_0 + s1_1;
      end if;
    end process;
    output(108) <= saturate(sum_3_108, 6);
  end block;

  -- LAYER 3, ch 109
  gen_l3c109 : block
  signal s1_0, s1_1 : sum_t_3_109;
  signal sum_3_109 : sum_t_3_109;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_109.mem") port map (clk, out2_0_reg, act_3_0_109);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_109.mem") port map (clk, out2_1_reg, act_3_1_109);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_109.mem") port map (clk, out2_5_reg, act_3_5_109);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_109.mem") port map (clk, out2_6_reg, act_3_6_109);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_109.mem") port map (clk, out2_7_reg, act_3_7_109);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_109, SUM_WIDTH_3_109) + resize(act_3_1_109, SUM_WIDTH_3_109) + resize(act_3_5_109, SUM_WIDTH_3_109) + resize(act_3_6_109, SUM_WIDTH_3_109);
        s1_1 <= resize(act_3_7_109, SUM_WIDTH_3_109);
        -- Stage 2
        sum_3_109 <= s1_0 + s1_1;
      end if;
    end process;
    output(109) <= saturate(sum_3_109, 6);
  end block;

  -- LAYER 3, ch 110
  gen_l3c110 : block
  signal s1_0, s1_1 : sum_t_3_110;
  signal sum_3_110 : sum_t_3_110;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_110.mem") port map (clk, out2_0_reg, act_3_0_110);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_110.mem") port map (clk, out2_4_reg, act_3_4_110);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_110.mem") port map (clk, out2_5_reg, act_3_5_110);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_110.mem") port map (clk, out2_6_reg, act_3_6_110);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_110.mem") port map (clk, out2_7_reg, act_3_7_110);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_110, SUM_WIDTH_3_110) + resize(act_3_4_110, SUM_WIDTH_3_110) + resize(act_3_5_110, SUM_WIDTH_3_110) + resize(act_3_6_110, SUM_WIDTH_3_110);
        s1_1 <= resize(act_3_7_110, SUM_WIDTH_3_110);
        -- Stage 2
        sum_3_110 <= s1_0 + s1_1;
      end if;
    end process;
    output(110) <= saturate(sum_3_110, 6);
  end block;

  -- LAYER 3, ch 111
  gen_l3c111 : block
  signal s1_0 : sum_t_3_111;
  signal sum_3_111 : sum_t_3_111;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_111.mem") port map (clk, out2_0_reg, act_3_0_111);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_111.mem") port map (clk, out2_1_reg, act_3_1_111);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_111.mem") port map (clk, out2_5_reg, act_3_5_111);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_111.mem") port map (clk, out2_7_reg, act_3_7_111);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_111, SUM_WIDTH_3_111) + resize(act_3_1_111, SUM_WIDTH_3_111) + resize(act_3_5_111, SUM_WIDTH_3_111) + resize(act_3_7_111, SUM_WIDTH_3_111);
        -- Stage 2
        sum_3_111 <= s1_0;
      end if;
    end process;
    output(111) <= saturate(sum_3_111, 6);
  end block;

  -- LAYER 3, ch 112
  gen_l3c112 : block
  signal s1_0, s1_1 : sum_t_3_112;
  signal sum_3_112 : sum_t_3_112;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_112.mem") port map (clk, out2_0_reg, act_3_0_112);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_112.mem") port map (clk, out2_1_reg, act_3_1_112);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_112.mem") port map (clk, out2_5_reg, act_3_5_112);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_112.mem") port map (clk, out2_6_reg, act_3_6_112);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_112.mem") port map (clk, out2_7_reg, act_3_7_112);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_112, SUM_WIDTH_3_112) + resize(act_3_1_112, SUM_WIDTH_3_112) + resize(act_3_5_112, SUM_WIDTH_3_112) + resize(act_3_6_112, SUM_WIDTH_3_112);
        s1_1 <= resize(act_3_7_112, SUM_WIDTH_3_112);
        -- Stage 2
        sum_3_112 <= s1_0 + s1_1;
      end if;
    end process;
    output(112) <= saturate(sum_3_112, 6);
  end block;

  -- LAYER 3, ch 113
  gen_l3c113 : block
  signal s1_0, s1_1 : sum_t_3_113;
  signal sum_3_113 : sum_t_3_113;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_113.mem") port map (clk, out2_0_reg, act_3_0_113);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_113.mem") port map (clk, out2_1_reg, act_3_1_113);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_113.mem") port map (clk, out2_5_reg, act_3_5_113);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_113.mem") port map (clk, out2_6_reg, act_3_6_113);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_113.mem") port map (clk, out2_7_reg, act_3_7_113);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_113, SUM_WIDTH_3_113) + resize(act_3_1_113, SUM_WIDTH_3_113) + resize(act_3_5_113, SUM_WIDTH_3_113) + resize(act_3_6_113, SUM_WIDTH_3_113);
        s1_1 <= resize(act_3_7_113, SUM_WIDTH_3_113);
        -- Stage 2
        sum_3_113 <= s1_0 + s1_1;
      end if;
    end process;
    output(113) <= saturate(sum_3_113, 6);
  end block;

  -- LAYER 3, ch 114
  gen_l3c114 : block
  signal s1_0, s1_1 : sum_t_3_114;
  signal sum_3_114 : sum_t_3_114;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_114.mem") port map (clk, out2_0_reg, act_3_0_114);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_114.mem") port map (clk, out2_4_reg, act_3_4_114);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_114.mem") port map (clk, out2_5_reg, act_3_5_114);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_114.mem") port map (clk, out2_6_reg, act_3_6_114);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_114.mem") port map (clk, out2_7_reg, act_3_7_114);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_114, SUM_WIDTH_3_114) + resize(act_3_4_114, SUM_WIDTH_3_114) + resize(act_3_5_114, SUM_WIDTH_3_114) + resize(act_3_6_114, SUM_WIDTH_3_114);
        s1_1 <= resize(act_3_7_114, SUM_WIDTH_3_114);
        -- Stage 2
        sum_3_114 <= s1_0 + s1_1;
      end if;
    end process;
    output(114) <= saturate(sum_3_114, 6);
  end block;

  -- LAYER 3, ch 115
  gen_l3c115 : block
  signal s1_0, s1_1 : sum_t_3_115;
  signal sum_3_115 : sum_t_3_115;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_115.mem") port map (clk, out2_0_reg, act_3_0_115);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_115.mem") port map (clk, out2_4_reg, act_3_4_115);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_115.mem") port map (clk, out2_5_reg, act_3_5_115);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_115.mem") port map (clk, out2_6_reg, act_3_6_115);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_115.mem") port map (clk, out2_7_reg, act_3_7_115);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_115, SUM_WIDTH_3_115) + resize(act_3_4_115, SUM_WIDTH_3_115) + resize(act_3_5_115, SUM_WIDTH_3_115) + resize(act_3_6_115, SUM_WIDTH_3_115);
        s1_1 <= resize(act_3_7_115, SUM_WIDTH_3_115);
        -- Stage 2
        sum_3_115 <= s1_0 + s1_1;
      end if;
    end process;
    output(115) <= saturate(sum_3_115, 6);
  end block;

  -- LAYER 3, ch 116
  gen_l3c116 : block
  signal s1_0, s1_1 : sum_t_3_116;
  signal sum_3_116 : sum_t_3_116;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_116.mem") port map (clk, out2_0_reg, act_3_0_116);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_116.mem") port map (clk, out2_1_reg, act_3_1_116);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_116.mem") port map (clk, out2_4_reg, act_3_4_116);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_116.mem") port map (clk, out2_5_reg, act_3_5_116);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_116.mem") port map (clk, out2_6_reg, act_3_6_116);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_116.mem") port map (clk, out2_7_reg, act_3_7_116);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_116, SUM_WIDTH_3_116) + resize(act_3_1_116, SUM_WIDTH_3_116) + resize(act_3_4_116, SUM_WIDTH_3_116) + resize(act_3_5_116, SUM_WIDTH_3_116);
        s1_1 <= resize(act_3_6_116, SUM_WIDTH_3_116) + resize(act_3_7_116, SUM_WIDTH_3_116);
        -- Stage 2
        sum_3_116 <= s1_0 + s1_1;
      end if;
    end process;
    output(116) <= saturate(sum_3_116, 6);
  end block;

  -- LAYER 3, ch 117
  gen_l3c117 : block
  signal s1_0 : sum_t_3_117;
  signal sum_3_117 : sum_t_3_117;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_117.mem") port map (clk, out2_0_reg, act_3_0_117);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_117.mem") port map (clk, out2_5_reg, act_3_5_117);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_117.mem") port map (clk, out2_6_reg, act_3_6_117);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_117.mem") port map (clk, out2_7_reg, act_3_7_117);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_117, SUM_WIDTH_3_117) + resize(act_3_5_117, SUM_WIDTH_3_117) + resize(act_3_6_117, SUM_WIDTH_3_117) + resize(act_3_7_117, SUM_WIDTH_3_117);
        -- Stage 2
        sum_3_117 <= s1_0;
      end if;
    end process;
    output(117) <= saturate(sum_3_117, 6);
  end block;

  -- LAYER 3, ch 118
  gen_l3c118 : block
  signal s1_0, s1_1 : sum_t_3_118;
  signal sum_3_118 : sum_t_3_118;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_118.mem") port map (clk, out2_0_reg, act_3_0_118);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_118.mem") port map (clk, out2_4_reg, act_3_4_118);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_118.mem") port map (clk, out2_5_reg, act_3_5_118);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_118.mem") port map (clk, out2_6_reg, act_3_6_118);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_118.mem") port map (clk, out2_7_reg, act_3_7_118);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_118, SUM_WIDTH_3_118) + resize(act_3_4_118, SUM_WIDTH_3_118) + resize(act_3_5_118, SUM_WIDTH_3_118) + resize(act_3_6_118, SUM_WIDTH_3_118);
        s1_1 <= resize(act_3_7_118, SUM_WIDTH_3_118);
        -- Stage 2
        sum_3_118 <= s1_0 + s1_1;
      end if;
    end process;
    output(118) <= saturate(sum_3_118, 6);
  end block;

  -- LAYER 3, ch 119
  gen_l3c119 : block
  signal s1_0, s1_1 : sum_t_3_119;
  signal sum_3_119 : sum_t_3_119;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_119.mem") port map (clk, out2_0_reg, act_3_0_119);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_119.mem") port map (clk, out2_1_reg, act_3_1_119);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_119.mem") port map (clk, out2_4_reg, act_3_4_119);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_119.mem") port map (clk, out2_5_reg, act_3_5_119);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_119.mem") port map (clk, out2_6_reg, act_3_6_119);
    i05 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_119.mem") port map (clk, out2_7_reg, act_3_7_119);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_119, SUM_WIDTH_3_119) + resize(act_3_1_119, SUM_WIDTH_3_119) + resize(act_3_4_119, SUM_WIDTH_3_119) + resize(act_3_5_119, SUM_WIDTH_3_119);
        s1_1 <= resize(act_3_6_119, SUM_WIDTH_3_119) + resize(act_3_7_119, SUM_WIDTH_3_119);
        -- Stage 2
        sum_3_119 <= s1_0 + s1_1;
      end if;
    end process;
    output(119) <= saturate(sum_3_119, 6);
  end block;

  -- LAYER 3, ch 120
  gen_l3c120 : block
  signal s1_0, s1_1 : sum_t_3_120;
  signal sum_3_120 : sum_t_3_120;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_120.mem") port map (clk, out2_0_reg, act_3_0_120);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_120.mem") port map (clk, out2_1_reg, act_3_1_120);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_120.mem") port map (clk, out2_4_reg, act_3_4_120);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_120.mem") port map (clk, out2_6_reg, act_3_6_120);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_120.mem") port map (clk, out2_7_reg, act_3_7_120);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_120, SUM_WIDTH_3_120) + resize(act_3_1_120, SUM_WIDTH_3_120) + resize(act_3_4_120, SUM_WIDTH_3_120) + resize(act_3_6_120, SUM_WIDTH_3_120);
        s1_1 <= resize(act_3_7_120, SUM_WIDTH_3_120);
        -- Stage 2
        sum_3_120 <= s1_0 + s1_1;
      end if;
    end process;
    output(120) <= saturate(sum_3_120, 6);
  end block;

  -- LAYER 3, ch 121
  gen_l3c121 : block
  signal s1_0 : sum_t_3_121;
  signal sum_3_121 : sum_t_3_121;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_121.mem") port map (clk, out2_0_reg, act_3_0_121);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_121.mem") port map (clk, out2_1_reg, act_3_1_121);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_121.mem") port map (clk, out2_6_reg, act_3_6_121);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_121.mem") port map (clk, out2_7_reg, act_3_7_121);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_121, SUM_WIDTH_3_121) + resize(act_3_1_121, SUM_WIDTH_3_121) + resize(act_3_6_121, SUM_WIDTH_3_121) + resize(act_3_7_121, SUM_WIDTH_3_121);
        -- Stage 2
        sum_3_121 <= s1_0;
      end if;
    end process;
    output(121) <= saturate(sum_3_121, 6);
  end block;

  -- LAYER 3, ch 122
  gen_l3c122 : block
  signal s1_0 : sum_t_3_122;
  signal sum_3_122 : sum_t_3_122;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_122.mem") port map (clk, out2_0_reg, act_3_0_122);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_122.mem") port map (clk, out2_7_reg, act_3_7_122);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_122, SUM_WIDTH_3_122) + resize(act_3_7_122, SUM_WIDTH_3_122);
        -- Stage 2
        sum_3_122 <= s1_0;
      end if;
    end process;
    output(122) <= saturate(sum_3_122, 6);
  end block;

  -- LAYER 3, ch 123
  gen_l3c123 : block
  signal s1_0, s1_1 : sum_t_3_123;
  signal sum_3_123 : sum_t_3_123;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_123.mem") port map (clk, out2_0_reg, act_3_0_123);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_1_123.mem") port map (clk, out2_1_reg, act_3_1_123);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_123.mem") port map (clk, out2_5_reg, act_3_5_123);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_6_123.mem") port map (clk, out2_6_reg, act_3_6_123);
    i04 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_123.mem") port map (clk, out2_7_reg, act_3_7_123);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_123, SUM_WIDTH_3_123) + resize(act_3_1_123, SUM_WIDTH_3_123) + resize(act_3_5_123, SUM_WIDTH_3_123) + resize(act_3_6_123, SUM_WIDTH_3_123);
        s1_1 <= resize(act_3_7_123, SUM_WIDTH_3_123);
        -- Stage 2
        sum_3_123 <= s1_0 + s1_1;
      end if;
    end process;
    output(123) <= saturate(sum_3_123, 6);
  end block;

  -- LAYER 3, ch 124
  gen_l3c124 : block
  signal s1_0 : sum_t_3_124;
  signal sum_3_124 : sum_t_3_124;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_124.mem") port map (clk, out2_0_reg, act_3_0_124);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_124.mem") port map (clk, out2_4_reg, act_3_4_124);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_124.mem") port map (clk, out2_5_reg, act_3_5_124);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_124.mem") port map (clk, out2_7_reg, act_3_7_124);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_124, SUM_WIDTH_3_124) + resize(act_3_4_124, SUM_WIDTH_3_124) + resize(act_3_5_124, SUM_WIDTH_3_124) + resize(act_3_7_124, SUM_WIDTH_3_124);
        -- Stage 2
        sum_3_124 <= s1_0;
      end if;
    end process;
    output(124) <= saturate(sum_3_124, 6);
  end block;

  -- LAYER 3, ch 125
  gen_l3c125 : block
  signal s1_0 : sum_t_3_125;
  signal sum_3_125 : sum_t_3_125;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_125.mem") port map (clk, out2_0_reg, act_3_0_125);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_125.mem") port map (clk, out2_4_reg, act_3_4_125);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_125.mem") port map (clk, out2_5_reg, act_3_5_125);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_125.mem") port map (clk, out2_7_reg, act_3_7_125);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_125, SUM_WIDTH_3_125) + resize(act_3_4_125, SUM_WIDTH_3_125) + resize(act_3_5_125, SUM_WIDTH_3_125) + resize(act_3_7_125, SUM_WIDTH_3_125);
        -- Stage 2
        sum_3_125 <= s1_0;
      end if;
    end process;
    output(125) <= saturate(sum_3_125, 6);
  end block;

  -- LAYER 3, ch 126
  gen_l3c126 : block
  signal s1_0 : sum_t_3_126;
  signal sum_3_126 : sum_t_3_126;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_126.mem") port map (clk, out2_0_reg, act_3_0_126);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_126.mem") port map (clk, out2_5_reg, act_3_5_126);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_126, SUM_WIDTH_3_126) + resize(act_3_5_126, SUM_WIDTH_3_126);
        -- Stage 2
        sum_3_126 <= s1_0;
      end if;
    end process;
    output(126) <= saturate(sum_3_126, 6);
  end block;

  -- LAYER 3, ch 127
  gen_l3c127 : block
  signal s1_0 : sum_t_3_127;
  signal sum_3_127 : sum_t_3_127;
  begin
    i00 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_0_127.mem") port map (clk, out2_0_reg, act_3_0_127);
    i01 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_4_127.mem") port map (clk, out2_4_reg, act_3_4_127);
    i02 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_5_127.mem") port map (clk, out2_5_reg, act_3_5_127);
    i03 : entity work.LUT_3 generic map (MEMFILE=>"lut_3_7_127.mem") port map (clk, out2_7_reg, act_3_7_127);
    adder_tree : process(clk)
    begin
      if rising_edge(clk) then
        -- Stage 1
        s1_0 <= resize(act_3_0_127, SUM_WIDTH_3_127) + resize(act_3_4_127, SUM_WIDTH_3_127) + resize(act_3_5_127, SUM_WIDTH_3_127) + resize(act_3_7_127, SUM_WIDTH_3_127);
        -- Stage 2
        sum_3_127 <= s1_0;
      end if;
    end process;
    output(127) <= saturate(sum_3_127, 6);
  end block;

end architecture;