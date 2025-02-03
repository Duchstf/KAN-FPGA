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
lut_t lut_lookup_0_0_0(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_0_0 type=RAM_1P impl=LUTRAM
    return lut_0_0_0[value_to_index(input)];
}

lut_t lut_lookup_0_0_1(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_0_1 type=RAM_1P impl=LUTRAM
    return lut_0_0_1[value_to_index(input)];
}

lut_t lut_lookup_0_0_2(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_0_2 type=RAM_1P impl=LUTRAM
    return lut_0_0_2[value_to_index(input)];
}

lut_t lut_lookup_0_0_3(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_0_3 type=RAM_1P impl=LUTRAM
    return lut_0_0_3[value_to_index(input)];
}

lut_t lut_lookup_0_1_0(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_1_0 type=RAM_1P impl=LUTRAM
    return lut_0_1_0[value_to_index(input)];
}

lut_t lut_lookup_0_1_1(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_1_1 type=RAM_1P impl=LUTRAM
    return lut_0_1_1[value_to_index(input)];
}

lut_t lut_lookup_0_1_2(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_1_2 type=RAM_1P impl=LUTRAM
    return lut_0_1_2[value_to_index(input)];
}

lut_t lut_lookup_0_1_3(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_1_3 type=RAM_1P impl=LUTRAM
    return lut_0_1_3[value_to_index(input)];
}

lut_t lut_lookup_0_2_0(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_2_0 type=RAM_1P impl=LUTRAM
    return lut_0_2_0[value_to_index(input)];
}

lut_t lut_lookup_0_2_1(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_2_1 type=RAM_1P impl=LUTRAM
    return lut_0_2_1[value_to_index(input)];
}

lut_t lut_lookup_0_2_2(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_2_2 type=RAM_1P impl=LUTRAM
    return lut_0_2_2[value_to_index(input)];
}

lut_t lut_lookup_0_2_3(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_2_3 type=RAM_1P impl=LUTRAM
    return lut_0_2_3[value_to_index(input)];
}

lut_t lut_lookup_0_3_0(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_3_0 type=RAM_1P impl=LUTRAM
    return lut_0_3_0[value_to_index(input)];
}

lut_t lut_lookup_0_3_1(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_3_1 type=RAM_1P impl=LUTRAM
    return lut_0_3_1[value_to_index(input)];
}

lut_t lut_lookup_0_3_2(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_3_2 type=RAM_1P impl=LUTRAM
    return lut_0_3_2[value_to_index(input)];
}

lut_t lut_lookup_0_3_3(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_3_3 type=RAM_1P impl=LUTRAM
    return lut_0_3_3[value_to_index(input)];
}

lut_t lut_lookup_0_4_0(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_4_0 type=RAM_1P impl=LUTRAM
    return lut_0_4_0[value_to_index(input)];
}

lut_t lut_lookup_0_4_1(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_4_1 type=RAM_1P impl=LUTRAM
    return lut_0_4_1[value_to_index(input)];
}

lut_t lut_lookup_0_4_2(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_4_2 type=RAM_1P impl=LUTRAM
    return lut_0_4_2[value_to_index(input)];
}

lut_t lut_lookup_0_4_3(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_4_3 type=RAM_1P impl=LUTRAM
    return lut_0_4_3[value_to_index(input)];
}

lut_t lut_lookup_0_5_0(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_5_0 type=RAM_1P impl=LUTRAM
    return lut_0_5_0[value_to_index(input)];
}

lut_t lut_lookup_0_5_1(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_5_1 type=RAM_1P impl=LUTRAM
    return lut_0_5_1[value_to_index(input)];
}

lut_t lut_lookup_0_5_2(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_5_2 type=RAM_1P impl=LUTRAM
    return lut_0_5_2[value_to_index(input)];
}

lut_t lut_lookup_0_5_3(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_5_3 type=RAM_1P impl=LUTRAM
    return lut_0_5_3[value_to_index(input)];
}

lut_t lut_lookup_0_6_0(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_6_0 type=RAM_1P impl=LUTRAM
    return lut_0_6_0[value_to_index(input)];
}

lut_t lut_lookup_0_6_1(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_6_1 type=RAM_1P impl=LUTRAM
    return lut_0_6_1[value_to_index(input)];
}

lut_t lut_lookup_0_6_2(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_6_2 type=RAM_1P impl=LUTRAM
    return lut_0_6_2[value_to_index(input)];
}

lut_t lut_lookup_0_6_3(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_6_3 type=RAM_1P impl=LUTRAM
    return lut_0_6_3[value_to_index(input)];
}

lut_t lut_lookup_0_7_0(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_7_0 type=RAM_1P impl=LUTRAM
    return lut_0_7_0[value_to_index(input)];
}

lut_t lut_lookup_0_7_1(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_7_1 type=RAM_1P impl=LUTRAM
    return lut_0_7_1[value_to_index(input)];
}

lut_t lut_lookup_0_7_2(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_7_2 type=RAM_1P impl=LUTRAM
    return lut_0_7_2[value_to_index(input)];
}

lut_t lut_lookup_0_7_3(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_7_3 type=RAM_1P impl=LUTRAM
    return lut_0_7_3[value_to_index(input)];
}

lut_t lut_lookup_0_8_0(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_8_0 type=RAM_1P impl=LUTRAM
    return lut_0_8_0[value_to_index(input)];
}

lut_t lut_lookup_0_8_1(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_8_1 type=RAM_1P impl=LUTRAM
    return lut_0_8_1[value_to_index(input)];
}

lut_t lut_lookup_0_8_2(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_8_2 type=RAM_1P impl=LUTRAM
    return lut_0_8_2[value_to_index(input)];
}

lut_t lut_lookup_0_8_3(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_8_3 type=RAM_1P impl=LUTRAM
    return lut_0_8_3[value_to_index(input)];
}

lut_t lut_lookup_0_9_0(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_9_0 type=RAM_1P impl=LUTRAM
    return lut_0_9_0[value_to_index(input)];
}

lut_t lut_lookup_0_9_1(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_9_1 type=RAM_1P impl=LUTRAM
    return lut_0_9_1[value_to_index(input)];
}

lut_t lut_lookup_0_9_2(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_9_2 type=RAM_1P impl=LUTRAM
    return lut_0_9_2[value_to_index(input)];
}

lut_t lut_lookup_0_9_3(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_9_3 type=RAM_1P impl=LUTRAM
    return lut_0_9_3[value_to_index(input)];
}

lut_t lut_lookup_0_10_0(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_10_0 type=RAM_1P impl=LUTRAM
    return lut_0_10_0[value_to_index(input)];
}

lut_t lut_lookup_0_10_1(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_10_1 type=RAM_1P impl=LUTRAM
    return lut_0_10_1[value_to_index(input)];
}

lut_t lut_lookup_0_10_2(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_10_2 type=RAM_1P impl=LUTRAM
    return lut_0_10_2[value_to_index(input)];
}

lut_t lut_lookup_0_10_3(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_10_3 type=RAM_1P impl=LUTRAM
    return lut_0_10_3[value_to_index(input)];
}

lut_t lut_lookup_0_11_0(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_11_0 type=RAM_1P impl=LUTRAM
    return lut_0_11_0[value_to_index(input)];
}

lut_t lut_lookup_0_11_1(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_11_1 type=RAM_1P impl=LUTRAM
    return lut_0_11_1[value_to_index(input)];
}

lut_t lut_lookup_0_11_2(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_11_2 type=RAM_1P impl=LUTRAM
    return lut_0_11_2[value_to_index(input)];
}

lut_t lut_lookup_0_11_3(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_11_3 type=RAM_1P impl=LUTRAM
    return lut_0_11_3[value_to_index(input)];
}

lut_t lut_lookup_0_12_0(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_12_0 type=RAM_1P impl=LUTRAM
    return lut_0_12_0[value_to_index(input)];
}

lut_t lut_lookup_0_12_1(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_12_1 type=RAM_1P impl=LUTRAM
    return lut_0_12_1[value_to_index(input)];
}

lut_t lut_lookup_0_12_2(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_12_2 type=RAM_1P impl=LUTRAM
    return lut_0_12_2[value_to_index(input)];
}

lut_t lut_lookup_0_12_3(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_12_3 type=RAM_1P impl=LUTRAM
    return lut_0_12_3[value_to_index(input)];
}

lut_t lut_lookup_0_13_0(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_13_0 type=RAM_1P impl=LUTRAM
    return lut_0_13_0[value_to_index(input)];
}

lut_t lut_lookup_0_13_1(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_13_1 type=RAM_1P impl=LUTRAM
    return lut_0_13_1[value_to_index(input)];
}

lut_t lut_lookup_0_13_2(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_13_2 type=RAM_1P impl=LUTRAM
    return lut_0_13_2[value_to_index(input)];
}

lut_t lut_lookup_0_13_3(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_13_3 type=RAM_1P impl=LUTRAM
    return lut_0_13_3[value_to_index(input)];
}

lut_t lut_lookup_0_14_0(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_14_0 type=RAM_1P impl=LUTRAM
    return lut_0_14_0[value_to_index(input)];
}

lut_t lut_lookup_0_14_1(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_14_1 type=RAM_1P impl=LUTRAM
    return lut_0_14_1[value_to_index(input)];
}

lut_t lut_lookup_0_14_2(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_14_2 type=RAM_1P impl=LUTRAM
    return lut_0_14_2[value_to_index(input)];
}

lut_t lut_lookup_0_14_3(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_14_3 type=RAM_1P impl=LUTRAM
    return lut_0_14_3[value_to_index(input)];
}

lut_t lut_lookup_0_15_0(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_15_0 type=RAM_1P impl=LUTRAM
    return lut_0_15_0[value_to_index(input)];
}

lut_t lut_lookup_0_15_1(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_15_1 type=RAM_1P impl=LUTRAM
    return lut_0_15_1[value_to_index(input)];
}

lut_t lut_lookup_0_15_2(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_15_2 type=RAM_1P impl=LUTRAM
    return lut_0_15_2[value_to_index(input)];
}

lut_t lut_lookup_0_15_3(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_0_15_3 type=RAM_1P impl=LUTRAM
    return lut_0_15_3[value_to_index(input)];
}

lut_t lut_lookup_1_0_0(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_0_0 type=RAM_1P impl=LUTRAM
    return lut_1_0_0[value_to_index(input)];
}

lut_t lut_lookup_1_0_1(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_0_1 type=RAM_1P impl=LUTRAM
    return lut_1_0_1[value_to_index(input)];
}

lut_t lut_lookup_1_0_2(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_0_2 type=RAM_1P impl=LUTRAM
    return lut_1_0_2[value_to_index(input)];
}

lut_t lut_lookup_1_0_3(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_0_3 type=RAM_1P impl=LUTRAM
    return lut_1_0_3[value_to_index(input)];
}

lut_t lut_lookup_1_0_4(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_0_4 type=RAM_1P impl=LUTRAM
    return lut_1_0_4[value_to_index(input)];
}

lut_t lut_lookup_1_1_0(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_1_0 type=RAM_1P impl=LUTRAM
    return lut_1_1_0[value_to_index(input)];
}

lut_t lut_lookup_1_1_1(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_1_1 type=RAM_1P impl=LUTRAM
    return lut_1_1_1[value_to_index(input)];
}

lut_t lut_lookup_1_1_2(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_1_2 type=RAM_1P impl=LUTRAM
    return lut_1_1_2[value_to_index(input)];
}

lut_t lut_lookup_1_1_3(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_1_3 type=RAM_1P impl=LUTRAM
    return lut_1_1_3[value_to_index(input)];
}

lut_t lut_lookup_1_1_4(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_1_4 type=RAM_1P impl=LUTRAM
    return lut_1_1_4[value_to_index(input)];
}

lut_t lut_lookup_1_2_0(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_2_0 type=RAM_1P impl=LUTRAM
    return lut_1_2_0[value_to_index(input)];
}

lut_t lut_lookup_1_2_1(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_2_1 type=RAM_1P impl=LUTRAM
    return lut_1_2_1[value_to_index(input)];
}

lut_t lut_lookup_1_2_2(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_2_2 type=RAM_1P impl=LUTRAM
    return lut_1_2_2[value_to_index(input)];
}

lut_t lut_lookup_1_2_3(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_2_3 type=RAM_1P impl=LUTRAM
    return lut_1_2_3[value_to_index(input)];
}

lut_t lut_lookup_1_2_4(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_2_4 type=RAM_1P impl=LUTRAM
    return lut_1_2_4[value_to_index(input)];
}

lut_t lut_lookup_1_3_0(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_3_0 type=RAM_1P impl=LUTRAM
    return lut_1_3_0[value_to_index(input)];
}

lut_t lut_lookup_1_3_1(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_3_1 type=RAM_1P impl=LUTRAM
    return lut_1_3_1[value_to_index(input)];
}

lut_t lut_lookup_1_3_2(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_3_2 type=RAM_1P impl=LUTRAM
    return lut_1_3_2[value_to_index(input)];
}

lut_t lut_lookup_1_3_3(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_3_3 type=RAM_1P impl=LUTRAM
    return lut_1_3_3[value_to_index(input)];
}

lut_t lut_lookup_1_3_4(lut_input_t input) {
    #pragma HLS BIND_STORAGE variable=lut_1_3_4 type=RAM_1P impl=LUTRAM
    return lut_1_3_4[value_to_index(input)];
}
