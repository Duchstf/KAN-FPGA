const lut_0_t lut_0_{j}_{k}[LUT_SIZE] = { 
    {FORMATTED_VALUES}
};

lut_t lookup_0_{j}_{k}(lut_0_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_{j}_{k} type=ROM_1P impl=LUTRAM
    return lut_0_{j}_{k}[input];
}