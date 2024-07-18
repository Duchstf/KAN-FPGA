set SynModuleInfo {
  {SRCNAME activation MODELNAME activation RTLNAME activation IS_TOP 1
    SUBMODULES {
      {MODELNAME activation_fptrunc_64ns_32_4_no_dsp_1 RTLNAME activation_fptrunc_64ns_32_4_no_dsp_1 BINDTYPE op TYPE fptrunc IMPL auto LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME activation_fpext_32ns_64_3_no_dsp_1 RTLNAME activation_fpext_32ns_64_3_no_dsp_1 BINDTYPE op TYPE fpext IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME activation_fcmp_32ns_32ns_1_3_no_dsp_1 RTLNAME activation_fcmp_32ns_32ns_1_3_no_dsp_1 BINDTYPE op TYPE fcmp IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME activation_dadd_64ns_64ns_64_14_no_dsp_1 RTLNAME activation_dadd_64ns_64ns_64_14_no_dsp_1 BINDTYPE op TYPE dadd IMPL fabric LATENCY 13 ALLOW_PRAGMA 1}
      {MODELNAME activation_dmul_64ns_64ns_64_14_med_dsp_1 RTLNAME activation_dmul_64ns_64ns_64_14_med_dsp_1 BINDTYPE op TYPE dmul IMPL meddsp LATENCY 13 ALLOW_PRAGMA 1}
      {MODELNAME activation_ddiv_64ns_64ns_64_59_no_dsp_1 RTLNAME activation_ddiv_64ns_64ns_64_59_no_dsp_1 BINDTYPE op TYPE ddiv IMPL fabric LATENCY 58 ALLOW_PRAGMA 1}
      {MODELNAME activation_lut_ROM_AUTO_1R RTLNAME activation_lut_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
