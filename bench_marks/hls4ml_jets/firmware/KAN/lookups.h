#ifndef LOOKUPS_H
#define LOOKUPS_H

#include "values.h"
#include "defines.h"

int value_to_index(lut_input_t value) {
    int data_round = value * LUT_SIZE >> 4;
    int index = data_round + 8 * LUT_SIZE >> 4;

    if (index < 0)
        index = 0;
    if (index > LUT_SIZE - 1)
        index = LUT_SIZE - 1;

    return index;
}

lut_t lut_lookup_0_0(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_0 type=RAM_1P impl=LUTRAM
    return lut_0_0[value_to_index(input)];
}


lut_t lut_lookup_0_1(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_1 type=RAM_1P impl=LUTRAM
    return lut_0_1[value_to_index(input)];
}


lut_t lut_lookup_0_2(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_2 type=RAM_1P impl=LUTRAM
    return lut_0_2[value_to_index(input)];
}


lut_t lut_lookup_0_3(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_3 type=RAM_1P impl=LUTRAM
    return lut_0_3[value_to_index(input)];
}


lut_t lut_lookup_0_4(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_4 type=RAM_1P impl=LUTRAM
    return lut_0_4[value_to_index(input)];
}


lut_t lut_lookup_0_5(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_5 type=RAM_1P impl=LUTRAM
    return lut_0_5[value_to_index(input)];
}


lut_t lut_lookup_0_6(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_6 type=RAM_1P impl=LUTRAM
    return lut_0_6[value_to_index(input)];
}


lut_t lut_lookup_0_7(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_7 type=RAM_1P impl=LUTRAM
    return lut_0_7[value_to_index(input)];
}


lut_t lut_lookup_0_8(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_8 type=RAM_1P impl=LUTRAM
    return lut_0_8[value_to_index(input)];
}


lut_t lut_lookup_0_9(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_9 type=RAM_1P impl=LUTRAM
    return lut_0_9[value_to_index(input)];
}


lut_t lut_lookup_0_10(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_10 type=RAM_1P impl=LUTRAM
    return lut_0_10[value_to_index(input)];
}


lut_t lut_lookup_0_11(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_11 type=RAM_1P impl=LUTRAM
    return lut_0_11[value_to_index(input)];
}


lut_t lut_lookup_0_12(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_12 type=RAM_1P impl=LUTRAM
    return lut_0_12[value_to_index(input)];
}


lut_t lut_lookup_0_13(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_13 type=RAM_1P impl=LUTRAM
    return lut_0_13[value_to_index(input)];
}


lut_t lut_lookup_0_14(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_14 type=RAM_1P impl=LUTRAM
    return lut_0_14[value_to_index(input)];
}


lut_t lut_lookup_0_15(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_15 type=RAM_1P impl=LUTRAM
    return lut_0_15[value_to_index(input)];
}


lut_t lut_lookup_0_16(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_16 type=RAM_1P impl=LUTRAM
    return lut_0_16[value_to_index(input)];
}


lut_t lut_lookup_0_17(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_17 type=RAM_1P impl=LUTRAM
    return lut_0_17[value_to_index(input)];
}


lut_t lut_lookup_0_18(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_18 type=RAM_1P impl=LUTRAM
    return lut_0_18[value_to_index(input)];
}


lut_t lut_lookup_0_19(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_19 type=RAM_1P impl=LUTRAM
    return lut_0_19[value_to_index(input)];
}


lut_t lut_lookup_0_20(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_20 type=RAM_1P impl=LUTRAM
    return lut_0_20[value_to_index(input)];
}


lut_t lut_lookup_0_21(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_21 type=RAM_1P impl=LUTRAM
    return lut_0_21[value_to_index(input)];
}


lut_t lut_lookup_0_22(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_22 type=RAM_1P impl=LUTRAM
    return lut_0_22[value_to_index(input)];
}


lut_t lut_lookup_0_23(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_23 type=RAM_1P impl=LUTRAM
    return lut_0_23[value_to_index(input)];
}


lut_t lut_lookup_0_24(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_24 type=RAM_1P impl=LUTRAM
    return lut_0_24[value_to_index(input)];
}


lut_t lut_lookup_0_25(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_25 type=RAM_1P impl=LUTRAM
    return lut_0_25[value_to_index(input)];
}


lut_t lut_lookup_0_26(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_26 type=RAM_1P impl=LUTRAM
    return lut_0_26[value_to_index(input)];
}


lut_t lut_lookup_0_27(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_27 type=RAM_1P impl=LUTRAM
    return lut_0_27[value_to_index(input)];
}


lut_t lut_lookup_0_28(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_28 type=RAM_1P impl=LUTRAM
    return lut_0_28[value_to_index(input)];
}


lut_t lut_lookup_0_29(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_29 type=RAM_1P impl=LUTRAM
    return lut_0_29[value_to_index(input)];
}


lut_t lut_lookup_0_30(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_30 type=RAM_1P impl=LUTRAM
    return lut_0_30[value_to_index(input)];
}


lut_t lut_lookup_0_31(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_31 type=RAM_1P impl=LUTRAM
    return lut_0_31[value_to_index(input)];
}


lut_t lut_lookup_0_32(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_32 type=RAM_1P impl=LUTRAM
    return lut_0_32[value_to_index(input)];
}


lut_t lut_lookup_0_33(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_33 type=RAM_1P impl=LUTRAM
    return lut_0_33[value_to_index(input)];
}


lut_t lut_lookup_0_34(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_34 type=RAM_1P impl=LUTRAM
    return lut_0_34[value_to_index(input)];
}


lut_t lut_lookup_0_35(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_35 type=RAM_1P impl=LUTRAM
    return lut_0_35[value_to_index(input)];
}


lut_t lut_lookup_0_36(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_36 type=RAM_1P impl=LUTRAM
    return lut_0_36[value_to_index(input)];
}


lut_t lut_lookup_0_37(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_37 type=RAM_1P impl=LUTRAM
    return lut_0_37[value_to_index(input)];
}


lut_t lut_lookup_0_38(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_38 type=RAM_1P impl=LUTRAM
    return lut_0_38[value_to_index(input)];
}


lut_t lut_lookup_0_39(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_39 type=RAM_1P impl=LUTRAM
    return lut_0_39[value_to_index(input)];
}


lut_t lut_lookup_0_40(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_40 type=RAM_1P impl=LUTRAM
    return lut_0_40[value_to_index(input)];
}


lut_t lut_lookup_0_41(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_41 type=RAM_1P impl=LUTRAM
    return lut_0_41[value_to_index(input)];
}


lut_t lut_lookup_0_42(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_42 type=RAM_1P impl=LUTRAM
    return lut_0_42[value_to_index(input)];
}


lut_t lut_lookup_0_43(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_43 type=RAM_1P impl=LUTRAM
    return lut_0_43[value_to_index(input)];
}


lut_t lut_lookup_0_44(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_44 type=RAM_1P impl=LUTRAM
    return lut_0_44[value_to_index(input)];
}


lut_t lut_lookup_0_45(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_45 type=RAM_1P impl=LUTRAM
    return lut_0_45[value_to_index(input)];
}


lut_t lut_lookup_0_46(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_46 type=RAM_1P impl=LUTRAM
    return lut_0_46[value_to_index(input)];
}


lut_t lut_lookup_0_47(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_47 type=RAM_1P impl=LUTRAM
    return lut_0_47[value_to_index(input)];
}


lut_t lut_lookup_0_48(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_48 type=RAM_1P impl=LUTRAM
    return lut_0_48[value_to_index(input)];
}


lut_t lut_lookup_0_49(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_49 type=RAM_1P impl=LUTRAM
    return lut_0_49[value_to_index(input)];
}


lut_t lut_lookup_0_50(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_50 type=RAM_1P impl=LUTRAM
    return lut_0_50[value_to_index(input)];
}


lut_t lut_lookup_0_51(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_51 type=RAM_1P impl=LUTRAM
    return lut_0_51[value_to_index(input)];
}


lut_t lut_lookup_0_52(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_52 type=RAM_1P impl=LUTRAM
    return lut_0_52[value_to_index(input)];
}


lut_t lut_lookup_0_53(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_53 type=RAM_1P impl=LUTRAM
    return lut_0_53[value_to_index(input)];
}


lut_t lut_lookup_0_54(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_54 type=RAM_1P impl=LUTRAM
    return lut_0_54[value_to_index(input)];
}


lut_t lut_lookup_0_55(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_55 type=RAM_1P impl=LUTRAM
    return lut_0_55[value_to_index(input)];
}


lut_t lut_lookup_0_56(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_56 type=RAM_1P impl=LUTRAM
    return lut_0_56[value_to_index(input)];
}


lut_t lut_lookup_0_57(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_57 type=RAM_1P impl=LUTRAM
    return lut_0_57[value_to_index(input)];
}


lut_t lut_lookup_0_58(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_58 type=RAM_1P impl=LUTRAM
    return lut_0_58[value_to_index(input)];
}


lut_t lut_lookup_0_59(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_59 type=RAM_1P impl=LUTRAM
    return lut_0_59[value_to_index(input)];
}


lut_t lut_lookup_0_60(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_60 type=RAM_1P impl=LUTRAM
    return lut_0_60[value_to_index(input)];
}


lut_t lut_lookup_0_61(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_61 type=RAM_1P impl=LUTRAM
    return lut_0_61[value_to_index(input)];
}


lut_t lut_lookup_0_62(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_62 type=RAM_1P impl=LUTRAM
    return lut_0_62[value_to_index(input)];
}


lut_t lut_lookup_0_63(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_63 type=RAM_1P impl=LUTRAM
    return lut_0_63[value_to_index(input)];
}


lut_t lut_lookup_1_0(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_0 type=RAM_1P impl=LUTRAM
    return lut_1_0[value_to_index(input)];
}


lut_t lut_lookup_1_1(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_1 type=RAM_1P impl=LUTRAM
    return lut_1_1[value_to_index(input)];
}


lut_t lut_lookup_1_2(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_2 type=RAM_1P impl=LUTRAM
    return lut_1_2[value_to_index(input)];
}


lut_t lut_lookup_1_3(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_3 type=RAM_1P impl=LUTRAM
    return lut_1_3[value_to_index(input)];
}


lut_t lut_lookup_1_4(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_4 type=RAM_1P impl=LUTRAM
    return lut_1_4[value_to_index(input)];
}


lut_t lut_lookup_1_5(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_5 type=RAM_1P impl=LUTRAM
    return lut_1_5[value_to_index(input)];
}


lut_t lut_lookup_1_6(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_6 type=RAM_1P impl=LUTRAM
    return lut_1_6[value_to_index(input)];
}


lut_t lut_lookup_1_7(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_7 type=RAM_1P impl=LUTRAM
    return lut_1_7[value_to_index(input)];
}


lut_t lut_lookup_1_8(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_8 type=RAM_1P impl=LUTRAM
    return lut_1_8[value_to_index(input)];
}


lut_t lut_lookup_1_9(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_9 type=RAM_1P impl=LUTRAM
    return lut_1_9[value_to_index(input)];
}


lut_t lut_lookup_1_10(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_10 type=RAM_1P impl=LUTRAM
    return lut_1_10[value_to_index(input)];
}


lut_t lut_lookup_1_11(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_11 type=RAM_1P impl=LUTRAM
    return lut_1_11[value_to_index(input)];
}


lut_t lut_lookup_1_12(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_12 type=RAM_1P impl=LUTRAM
    return lut_1_12[value_to_index(input)];
}


lut_t lut_lookup_1_13(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_13 type=RAM_1P impl=LUTRAM
    return lut_1_13[value_to_index(input)];
}


lut_t lut_lookup_1_14(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_14 type=RAM_1P impl=LUTRAM
    return lut_1_14[value_to_index(input)];
}


lut_t lut_lookup_1_15(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_15 type=RAM_1P impl=LUTRAM
    return lut_1_15[value_to_index(input)];
}


lut_t lut_lookup_1_16(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_16 type=RAM_1P impl=LUTRAM
    return lut_1_16[value_to_index(input)];
}


lut_t lut_lookup_1_17(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_17 type=RAM_1P impl=LUTRAM
    return lut_1_17[value_to_index(input)];
}


lut_t lut_lookup_1_18(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_18 type=RAM_1P impl=LUTRAM
    return lut_1_18[value_to_index(input)];
}


lut_t lut_lookup_1_19(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_19 type=RAM_1P impl=LUTRAM
    return lut_1_19[value_to_index(input)];
}


#endif