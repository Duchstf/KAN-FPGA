#include "lut_0.h"
const lut_0_output_t lut_0_0_0[LUT_SIZE_0] = { -3, -4, -5, -5, -5, -5, -5, -4, -3, -2, -1, 0, 1, 2, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 3, 3, 2, 2, 1, 1, 0, -1, -1, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -3, -3, -3, -4, -5, -5, -6, -7, -7, -8, -8, -8, -8, -8, -8, -8, -8, -8, -8, -8, -9 };
lut_0_output_t lookup_0_0_0(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_0_0 type=ROM_1P impl=LUTRAM
    return lut_0_0_0[input];
}
const lut_0_output_t lut_0_0_1[LUT_SIZE_0] = { 8, 10, 11, 11, 12, 12, 12, 11, 10, 8, 7, 6, 5, 4, 3, 3, 3, 4, 4, 5, 5, 6, 6, 6, 7, 7, 7, 7, 7, 7, 6, 5, 4, 3, 2, 0, -2, -4, -6, -8, -10, -12, -14, -16, -18, -20, -22, -23, -25, -27, -28, -30, -31, -32, -32, -33, -34, -34, -35, -35, -35, -36, -37, -37 };
lut_0_output_t lookup_0_0_1(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_0_1 type=ROM_1P impl=LUTRAM
    return lut_0_0_1[input];
}
const lut_0_output_t lut_0_0_2[LUT_SIZE_0] = { 2, 2, 3, 5, 6, 8, 9, 11, 12, 13, 14, 15, 15, 14, 13, 12, 10, 9, 7, 5, 3, 1, 0, -1, -2, -3, -3, -3, -3, -3, -3, -3, -3, -3, -2, -2, -2, -1, 0, 0, 2, 3, 4, 5, 7, 8, 10, 11, 11, 12, 12, 12, 12, 11, 10, 9, 7, 6, 4, 3, 2, 0, -1, -2 };
lut_0_output_t lookup_0_0_2(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_0_2 type=ROM_1P impl=LUTRAM
    return lut_0_0_2[input];
}
const lut_0_output_t lut_0_0_3[LUT_SIZE_0] = { -4, -7, -10, -12, -15, -16, -17, -16, -15, -12, -9, -5, -1, 2, 6, 10, 13, 15, 16, 17, 18, 17, 16, 15, 14, 12, 10, 8, 6, 4, 2, 1, -1, -3, -5, -7, -9, -11, -12, -14, -16, -19, -21, -23, -25, -27, -30, -32, -34, -36, -38, -40, -41, -43, -45, -46, -48, -50, -52, -54, -56, -59, -61, -64 };
lut_0_output_t lookup_0_0_3(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_0_3 type=ROM_1P impl=LUTRAM
    return lut_0_0_3[input];
}
const lut_0_output_t lut_0_1_0[LUT_SIZE_0] = { -5, -5, -5, -5, -5, -5, -5, -5, -5, -6, -6, -6, -6, -6, -6, -6, -6, -5, -5, -5, -4, -4, -4, -3, -3, -2, -2, -1, 0, 0, 1, 1, 2, 3, 3, 4, 5, 5, 6, 6, 7, 8, 9, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 27, 28, 29, 30 };
lut_0_output_t lookup_0_1_0(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_1_0 type=ROM_1P impl=LUTRAM
    return lut_0_1_0[input];
}
const lut_0_output_t lut_0_1_1[LUT_SIZE_0] = { 12, 12, 12, 11, 11, 11, 10, 10, 9, 8, 8, 7, 7, 7, 6, 6, 5, 5, 4, 4, 3, 3, 2, 1, 0, 0, -1, -2, -2, -3, -4, -4, -4, -4, -4, -4, -3, -2, 0, 2, 4, 6, 8, 10, 12, 14, 16, 17, 19, 19, 20, 20, 20, 20, 20, 20, 20, 20, 20, 21, 21, 22, 23, 24 };
lut_0_output_t lookup_0_1_1(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_1_1 type=ROM_1P impl=LUTRAM
    return lut_0_1_1[input];
}
const lut_0_output_t lut_0_1_2[LUT_SIZE_0] = { 16, 15, 15, 14, 13, 12, 11, 10, 10, 9, 9, 8, 8, 7, 7, 7, 6, 6, 5, 5, 4, 4, 4, 3, 3, 3, 2, 2, 1, 1, 0, -1, -2, -2, -3, -4, -5, -6, -6, -7, -7, -6, -6, -6, -5, -4, -3, -2, -2, -1, -1, -2, -2, -4, -6, -8, -11, -14, -16, -19, -21, -22, -24, -25 };
lut_0_output_t lookup_0_1_2(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_1_2 type=ROM_1P impl=LUTRAM
    return lut_0_1_2[input];
}
const lut_0_output_t lut_0_1_3[LUT_SIZE_0] = { 25, 25, 25, 24, 23, 22, 21, 20, 19, 17, 16, 15, 14, 13, 12, 12, 11, 10, 10, 9, 8, 7, 7, 6, 5, 4, 3, 2, 2, 1, 0, -1, -1, -2, -3, -4, -5, -6, -8, -9, -10, -12, -13, -14, -16, -17, -18, -19, -19, -20, -21, -21, -22, -23, -24, -26, -27, -29, -30, -32, -34, -35, -37, -38 };
lut_0_output_t lookup_0_1_3(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_1_3 type=ROM_1P impl=LUTRAM
    return lut_0_1_3[input];
}
const lut_0_output_t lut_0_2_0[LUT_SIZE_0] = { -4, -5, -6, -7, -8, -10, -12, -14, -16, -18, -20, -21, -23, -23, -24, -23, -22, -21, -20, -18, -16, -13, -11, -9, -7, -6, -5, -3, -2, -2, -1, 0, 1, 2, 3, 4, 5, 6, 8, 10, 13, 15, 18, 21, 24, 28, 32, 35, 39, 43, 46, 50, 52, 55, 57, 58, 59, 60, 60, 60, 60, 60, 60, 61 };
lut_0_output_t lookup_0_2_0(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_2_0 type=ROM_1P impl=LUTRAM
    return lut_0_2_0[input];
}
const lut_0_output_t lut_0_2_1[LUT_SIZE_0] = { 6, 6, 7, 8, 8, 9, 10, 11, 11, 12, 12, 12, 13, 13, 13, 13, 13, 12, 12, 12, 11, 11, 10, 10, 10, 10, 10, 9, 9, 9, 8, 7, 5, 3, 1, -1, -4, -8, -11, -15, -19, -22, -26, -30, -34, -38, -42, -46, -50, -53, -57, -62, -66, -70, -74, -79, -83, -87, -91, -95, -99, -103, -107, -110 };
lut_0_output_t lookup_0_2_1(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_2_1 type=ROM_1P impl=LUTRAM
    return lut_0_2_1[input];
}
const lut_0_output_t lut_0_2_2[LUT_SIZE_0] = { -3, -4, -4, -5, -6, -7, -8, -8, -9, -9, -10, -10, -10, -10, -10, -9, -9, -8, -7, -6, -5, -3, -2, -1, -1, 0, 0, 0, 1, 1, 2, 4, 5, 7, 9, 11, 13, 14, 16, 17, 18, 19, 19, 20, 20, 20, 19, 19, 18, 17, 16, 16, 15, 15, 15, 15, 16, 17, 17, 18, 18, 19, 19, 20 };
lut_0_output_t lookup_0_2_2(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_2_2 type=ROM_1P impl=LUTRAM
    return lut_0_2_2[input];
}
const lut_0_output_t lut_0_2_3[LUT_SIZE_0] = { -5, -6, -6, -7, -8, -9, -10, -12, -13, -15, -16, -18, -19, -19, -20, -19, -18, -16, -13, -11, -7, -4, -2, 1, 2, 3, 4, 3, 3, 2, 2, 1, 1, 1, 2, 3, 4, 6, 8, 11, 14, 17, 20, 24, 27, 31, 34, 38, 41, 44, 47, 50, 53, 56, 59, 61, 64, 66, 69, 71, 73, 75, 77, 79 };
lut_0_output_t lookup_0_2_3(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_2_3 type=ROM_1P impl=LUTRAM
    return lut_0_2_3[input];
}
const lut_0_output_t lut_0_3_0[LUT_SIZE_0] = { 3, 3, 3, 2, 1, 0, -3, -5, -9, -12, -16, -19, -22, -25, -26, -27, -27, -26, -25, -22, -18, -14, -8, -3, 3, 8, 13, 17, 20, 22, 22, 21, 18, 15, 11, 7, 4, 0, -3, -5, -7, -9, -10, -11, -12, -13, -14, -14, -15, -16, -17, -18, -19, -20, -21, -23, -24, -26, -29, -31, -34, -37, -40, -44 };
lut_0_output_t lookup_0_3_0(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_3_0 type=ROM_1P impl=LUTRAM
    return lut_0_3_0[input];
}
const lut_0_output_t lut_0_3_1[LUT_SIZE_0] = { 9, 11, 13, 14, 16, 18, 19, 21, 22, 23, 23, 24, 24, 24, 25, 26, 27, 29, 32, 35, 39, 42, 45, 46, 47, 45, 43, 39, 33, 26, 19, 10, 1, -8, -17, -26, -35, -43, -50, -57, -63, -69, -75, -80, -85, -88, -92, -94, -96, -97, -98, -98, -98, -99, -99, -100, -101, -102, -104, -106, -109, -112, -116, -119 };
lut_0_output_t lookup_0_3_1(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_3_1 type=ROM_1P impl=LUTRAM
    return lut_0_3_1[input];
}
const lut_0_output_t lut_0_3_2[LUT_SIZE_0] = { 7, 7, 7, 7, 7, 8, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 19, 21, 23, 26, 29, 31, 33, 35, 35, 34, 32, 29, 25, 19, 13, 7, 0, -8, -15, -23, -30, -36, -42, -48, -53, -58, -62, -66, -70, -73, -77, -80, -83, -86, -88, -91, -93, -95, -98, -100, -102, -105, -107, -111, -114, -118, -122, -127 };
lut_0_output_t lookup_0_3_2(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_3_2 type=ROM_1P impl=LUTRAM
    return lut_0_3_2[input];
}
const lut_0_output_t lut_0_3_3[LUT_SIZE_0] = { -3, -4, -5, -6, -8, -9, -11, -13, -15, -16, -18, -19, -20, -20, -20, -20, -19, -18, -17, -16, -15, -13, -11, -9, -6, -3, 0, 4, 7, 10, 13, 15, 17, 18, 17, 17, 15, 13, 10, 8, 6, 5, 4, 4, 5, 6, 8, 10, 11, 13, 14, 16, 17, 18, 19, 20, 21, 22, 23, 24, 24, 25, 25, 26 };
lut_0_output_t lookup_0_3_3(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_3_3 type=ROM_1P impl=LUTRAM
    return lut_0_3_3[input];
}
const lut_0_output_t lut_0_4_0[LUT_SIZE_0] = { -1, -1, -1, -2, -2, -3, -4, -6, -7, -9, -10, -11, -12, -13, -14, -14, -14, -13, -13, -12, -10, -9, -7, -6, -4, -2, 0, 2, 4, 5, 7, 7, 8, 8, 8, 8, 7, 6, 5, 4, 4, 3, 3, 3, 4, 5, 6, 8, 9, 11, 13, 14, 16, 18, 19, 21, 22, 24, 26, 27, 29, 31, 32, 34 };
lut_0_output_t lookup_0_4_0(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_4_0 type=ROM_1P impl=LUTRAM
    return lut_0_4_0[input];
}
const lut_0_output_t lut_0_4_1[LUT_SIZE_0] = { -1, -1, -1, -1, -1, -1, 0, 0, 0, 1, 1, 2, 2, 2, 2, 3, 3, 2, 2, 2, 2, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 3, 3, 4, 4, 5, 6, 7, 8, 9, 10, 11, 12, 12, 12, 13, 13, 12, 12, 12, 11, 10, 9, 8, 7, 6, 5, 4 };
lut_0_output_t lookup_0_4_1(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_4_1 type=ROM_1P impl=LUTRAM
    return lut_0_4_1[input];
}
const lut_0_output_t lut_0_4_2[LUT_SIZE_0] = { -4, -5, -5, -5, -6, -7, -7, -8, -9, -10, -11, -13, -14, -16, -18, -19, -21, -22, -22, -22, -21, -20, -18, -16, -13, -11, -8, -4, -1, 1, 4, 7, 10, 12, 15, 17, 20, 22, 25, 28, 30, 32, 34, 36, 38, 40, 41, 43, 44, 45, 47, 48, 50, 51, 53, 55, 56, 58, 60, 62, 64, 66, 68, 70 };
lut_0_output_t lookup_0_4_2(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_4_2 type=ROM_1P impl=LUTRAM
    return lut_0_4_2[input];
}
const lut_0_output_t lut_0_4_3[LUT_SIZE_0] = { -2, -2, -2, -2, -3, -3, -3, -4, -4, -5, -5, -5, -6, -6, -6, -6, -6, -5, -5, -4, -4, -3, -2, -2, -1, -1, -1, -1, 0, 0, 0, 1, 1, 2, 3, 4, 5, 6, 7, 7, 8, 9, 9, 9, 9, 9, 9, 9, 10, 10, 11, 12, 14, 16, 17, 19, 21, 24, 26, 28, 30, 32, 34, 36 };
lut_0_output_t lookup_0_4_3(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_4_3 type=ROM_1P impl=LUTRAM
    return lut_0_4_3[input];
}
const lut_0_output_t lut_0_5_0[LUT_SIZE_0] = { -2, -3, -3, -3, -3, -3, -3, -3, -4, -4, -4, -5, -5, -6, -6, -7, -7, -8, -8, -8, -8, -8, -7, -6, -6, -5, -4, -3, -2, -1, 0, 0, 1, 1, 2, 3, 4, 5, 6, 8, 10, 12, 14, 16, 18, 21, 23, 25, 27, 29, 31, 33, 35, 36, 38, 39, 40, 41, 43, 44, 45, 46, 48, 49 };
lut_0_output_t lookup_0_5_0(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_5_0 type=ROM_1P impl=LUTRAM
    return lut_0_5_0[input];
}
const lut_0_output_t lut_0_5_1[LUT_SIZE_0] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, -2, -2, -3, -4, -4, -4, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 5, 5, 4, 3, 2, 1, 0, -2, -3, -4, -5, -6, -6, -6, -6, -5, -5, -5, -4, -4, -4, -4, -4, -4, -3, -3, -4, -4, -4, -4, -4, -5, -5, -6, -6 };
lut_0_output_t lookup_0_5_1(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_5_1 type=ROM_1P impl=LUTRAM
    return lut_0_5_1[input];
}
const lut_0_output_t lut_0_5_2[LUT_SIZE_0] = { -1, -1, -2, -2, -2, -3, -3, -4, -5, -6, -7, -8, -10, -11, -13, -14, -15, -15, -15, -14, -13, -11, -9, -7, -4, -2, 0, 2, 3, 5, 6, 6, 6, 6, 6, 5, 5, 4, 3, 3, 2, 1, 1, 1, 1, 0, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 10, 11, 12, 13, 14, 15 };
lut_0_output_t lookup_0_5_2(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_5_2 type=ROM_1P impl=LUTRAM
    return lut_0_5_2[input];
}
const lut_0_output_t lut_0_5_3[LUT_SIZE_0] = { 2, 2, 2, 2, 2, 2, 3, 3, 4, 6, 8, 11, 14, 19, 23, 28, 31, 34, 35, 35, 34, 31, 28, 24, 20, 16, 11, 7, 3, 0, -4, -7, -9, -12, -13, -14, -14, -14, -14, -14, -13, -13, -13, -13, -13, -14, -14, -15, -16, -16, -17, -17, -18, -18, -19, -20, -20, -21, -22, -23, -24, -26, -27, -29 };
lut_0_output_t lookup_0_5_3(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_5_3 type=ROM_1P impl=LUTRAM
    return lut_0_5_3[input];
}
const lut_0_output_t lut_0_6_0[LUT_SIZE_0] = { 1, 1, 1, 1, 2, 2, 2, 3, 3, 4, 4, 5, 5, 5, 6, 6, 6, 5, 5, 5, 4, 4, 3, 3, 2, 1, 1, 1, 0, 0, 0, -1, -1, -1, -2, -2, -2, -3, -3, -3, -4, -4, -5, -5, -6, -6, -7, -7, -8, -9, -9, -10, -11, -11, -12, -13, -13, -14, -14, -15, -16, -16, -17, -17 };
lut_0_output_t lookup_0_6_0(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_6_0 type=ROM_1P impl=LUTRAM
    return lut_0_6_0[input];
}
const lut_0_output_t lut_0_6_1[LUT_SIZE_0] = { -2, -2, -2, -2, -2, -2, -2, -2, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6 };
lut_0_output_t lookup_0_6_1(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_6_1 type=ROM_1P impl=LUTRAM
    return lut_0_6_1[input];
}
const lut_0_output_t lut_0_6_2[LUT_SIZE_0] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -2, -2, -1, -1, -1, -1, -1, -1, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 14, 14, 15, 15, 16, 17, 17 };
lut_0_output_t lookup_0_6_2(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_6_2 type=ROM_1P impl=LUTRAM
    return lut_0_6_2[input];
}
const lut_0_output_t lut_0_6_3[LUT_SIZE_0] = { -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -3, -3, -3, -3, -3, -3, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -1, -1, -1, -1, 0, 0, 1, 1, 1, 2, 2, 3, 3, 4, 5, 5, 6, 6, 7, 7, 8, 9, 9, 10, 11, 11, 12, 13, 14, 14, 15, 16, 17, 18, 19, 20, 20, 21 };
lut_0_output_t lookup_0_6_3(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_6_3 type=ROM_1P impl=LUTRAM
    return lut_0_6_3[input];
}
const lut_0_output_t lut_0_7_0[LUT_SIZE_0] = { 0, 1, 1, 1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, -1, -1, -1, -1, -1, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0 };
lut_0_output_t lookup_0_7_0(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_7_0 type=ROM_1P impl=LUTRAM
    return lut_0_7_0[input];
}
const lut_0_output_t lut_0_7_1[LUT_SIZE_0] = { 1, 2, 3, 3, 4, 5, 6, 7, 8, 9, 10, 11, 11, 11, 11, 10, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, 0, -1, -1, -2, -2, -3, -3, -3, -4, -4, -4, -4, -4, -5, -5, -5, -5, -5, -5, -6, -6, -6, -6, -7, -7, -8, -8, -9, -9, -9, -10, -10, -10, -11, -11, -11, -11 };
lut_0_output_t lookup_0_7_1(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_7_1 type=ROM_1P impl=LUTRAM
    return lut_0_7_1[input];
}
const lut_0_output_t lut_0_7_2[LUT_SIZE_0] = { 3, 4, 6, 7, 9, 10, 12, 14, 16, 18, 20, 21, 22, 22, 22, 22, 21, 20, 18, 17, 15, 12, 10, 8, 6, 4, 2, 0, -1, -2, -4, -5, -6, -7, -8, -8, -9, -10, -11, -11, -12, -13, -13, -14, -14, -15, -15, -16, -16, -17, -18, -18, -19, -20, -20, -21, -21, -22, -23, -24, -24, -25, -26, -27 };
lut_0_output_t lookup_0_7_2(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_7_2 type=ROM_1P impl=LUTRAM
    return lut_0_7_2[input];
}
const lut_0_output_t lut_0_7_3[LUT_SIZE_0] = { 2, 2, 2, 2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 4, 4, 4, 3, 3, 2, 2, 1, 1, 0, 0, -1, -1, -2, -3, -3, -4, -5, -6, -7, -8, -9, -10, -11, -12, -13, -14, -15, -16, -17, -18, -19, -20, -21, -22, -23, -24, -25, -26, -27, -28, -30, -31, -32 };
lut_0_output_t lookup_0_7_3(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_7_3 type=ROM_1P impl=LUTRAM
    return lut_0_7_3[input];
}
const lut_0_output_t lut_0_8_0[LUT_SIZE_0] = { 2, 2, 2, 2, 2, 3, 3, 4, 4, 5, 6, 7, 8, 8, 8, 8, 8, 8, 8, 7, 6, 5, 4, 3, 3, 2, 1, 0, 0, -1, -1, -1, -2, -2, -2, -3, -3, -3, -4, -4, -5, -5, -6, -6, -7, -8, -8, -9, -10, -11, -12, -13, -14, -15, -16, -17, -18, -19, -20, -21, -22, -23, -24, -25 };
lut_0_output_t lookup_0_8_0(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_8_0 type=ROM_1P impl=LUTRAM
    return lut_0_8_0[input];
}
const lut_0_output_t lut_0_8_1[LUT_SIZE_0] = { -3, -4, -4, -4, -4, -4, -4, -3, -3, -2, -2, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5, 5, 5, 6, 6 };
lut_0_output_t lookup_0_8_1(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_8_1 type=ROM_1P impl=LUTRAM
    return lut_0_8_1[input];
}
const lut_0_output_t lut_0_8_2[LUT_SIZE_0] = { 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1 };
lut_0_output_t lookup_0_8_2(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_8_2 type=ROM_1P impl=LUTRAM
    return lut_0_8_2[input];
}
const lut_0_output_t lut_0_8_3[LUT_SIZE_0] = { -1, -1, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 0, 0, 0, -1, -1, -2, -2, -2, -3, -3, -3, -4, -4, -4, -3, -3, -3, -3, -3, -2, -2 };
lut_0_output_t lookup_0_8_3(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_8_3 type=ROM_1P impl=LUTRAM
    return lut_0_8_3[input];
}
const lut_0_output_t lut_0_9_0[LUT_SIZE_0] = { -2, -3, -3, -4, -4, -5, -5, -6, -6, -6, -6, -6, -6, -6, -6, -5, -5, -5, -4, -4, -4, -3, -3, -3, -3, -3, -2, -2, -2, -1, -1, 0, 1, 1, 2, 3, 3, 4, 5, 5, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 12, 13, 14, 15, 16, 17, 18, 18, 19, 20, 21, 22, 23, 23 };
lut_0_output_t lookup_0_9_0(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_9_0 type=ROM_1P impl=LUTRAM
    return lut_0_9_0[input];
}
const lut_0_output_t lut_0_9_1[LUT_SIZE_0] = { -2, -2, -3, -3, -4, -4, -4, -3, -3, -3, -2, -1, -1, 0, 0, 1, 1, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -2, -2, -2, -2, -2, -2, -2, -2, -3 };
lut_0_output_t lookup_0_9_1(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_9_1 type=ROM_1P impl=LUTRAM
    return lut_0_9_1[input];
}
const lut_0_output_t lut_0_9_2[LUT_SIZE_0] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 0, 0, 0, -1, -1, -1, -2, -2, -2, -2, -3, -3, -3, -3, -3, -4, -4, -4, -4, -5, -5, -5, -6, -6, -7, -7, -8, -8, -9, -10, -10, -11 };
lut_0_output_t lookup_0_9_2(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_9_2 type=ROM_1P impl=LUTRAM
    return lut_0_9_2[input];
}
const lut_0_output_t lut_0_9_3[LUT_SIZE_0] = { 3, 4, 5, 6, 7, 8, 8, 9, 9, 10, 10, 9, 9, 8, 8, 7, 6, 5, 4, 3, 3, 2, 1, 0, 0, 0, -1, -1, -1, -1, -2, -2, -2, -2, -2, -1, -1, -2, -2, -2, -3, -4, -5, -6, -8, -10, -12, -14, -15, -17, -18, -20, -21, -22, -22, -23, -23, -24, -24, -25, -26, -26, -27, -28 };
lut_0_output_t lookup_0_9_3(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_9_3 type=ROM_1P impl=LUTRAM
    return lut_0_9_3[input];
}
const lut_0_output_t lut_0_10_0[LUT_SIZE_0] = { -3, -5, -6, -7, -9, -10, -11, -11, -11, -10, -10, -9, -7, -6, -4, -2, -1, 1, 3, 4, 5, 6, 7, 7, 7, 7, 7, 7, 6, 5, 4, 3, 2, 1, 0, -1, -3, -4, -6, -7, -8, -9, -11, -12, -13, -13, -14, -15, -15, -15, -16, -16, -16, -16, -17, -17, -18, -18, -19, -20, -21, -22, -23, -24 };
lut_0_output_t lookup_0_10_0(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_10_0 type=ROM_1P impl=LUTRAM
    return lut_0_10_0[input];
}
const lut_0_output_t lut_0_10_1[LUT_SIZE_0] = { -6, -7, -7, -8, -9, -9, -10, -10, -10, -10, -9, -9, -8, -8, -7, -7, -7, -6, -6, -5, -5, -5, -4, -4, -3, -3, -2, -1, -1, 0, 1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 21, 22, 24, 25, 26, 28, 29, 31, 32, 33, 35, 36, 38, 39, 41, 43 };
lut_0_output_t lookup_0_10_1(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_10_1 type=ROM_1P impl=LUTRAM
    return lut_0_10_1[input];
}
const lut_0_output_t lut_0_10_2[LUT_SIZE_0] = { 0, 0, 0, -1, -2, -3, -4, -5, -7, -8, -9, -10, -11, -11, -12, -12, -11, -11, -10, -9, -8, -7, -6, -4, -3, -2, -1, 0, 1, 2, 2, 3, 4, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 18, 19, 20, 22, 23, 25, 27, 28, 30, 32, 34, 36, 37, 39, 40, 42, 43, 44 };
lut_0_output_t lookup_0_10_2(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_10_2 type=ROM_1P impl=LUTRAM
    return lut_0_10_2[input];
}
const lut_0_output_t lut_0_10_3[LUT_SIZE_0] = { 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 3, 3, 3, 3, 3, 2, 2, 2, 1, 1, 0, -1, -1, -2, -3, -4, -5, -6, -7, -8, -9, -10, -11, -12, -14, -15, -16, -18, -19, -20, -22, -23, -25, -26, -27, -29, -30, -31, -33, -34, -35, -37 };
lut_0_output_t lookup_0_10_3(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_10_3 type=ROM_1P impl=LUTRAM
    return lut_0_10_3[input];
}
const lut_0_output_t lut_0_11_0[LUT_SIZE_0] = { -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -4, -4, -5, -6, -6, -7, -8, -9, -9, -10, -10, -10, -9, -8, -7, -6, -4, -2, 1, 3, 5, 8, 10, 12, 15, 17, 20, 22, 24, 26, 29, 31, 33, 35, 38, 40, 41, 43, 45, 46, 48, 49, 50, 52, 53, 54, 55 };
lut_0_output_t lookup_0_11_0(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_11_0 type=ROM_1P impl=LUTRAM
    return lut_0_11_0[input];
}
const lut_0_output_t lut_0_11_1[LUT_SIZE_0] = { 2, 2, 2, 2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 5, 5, 6, 5, 5, 5, 5, 4, 4, 3, 3, 2, 2, 1, 1, 0, 0, -1, -2, -2, -3, -3, -4, -5, -5, -6, -7, -8, -8, -9, -10, -10, -11, -11, -12, -13, -13, -14, -15, -16, -17, -18, -19, -21, -22, -23, -24, -26, -27 };
lut_0_output_t lookup_0_11_1(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_11_1 type=ROM_1P impl=LUTRAM
    return lut_0_11_1[input];
}
const lut_0_output_t lut_0_11_2[LUT_SIZE_0] = { 0, 0, 0, -1, -2, -3, -5, -7, -9, -11, -13, -15, -17, -18, -18, -18, -17, -17, -15, -14, -12, -10, -8, -6, -4, -1, 1, 3, 5, 6, 8, 9, 9, 10, 10, 10, 11, 10, 10, 10, 10, 9, 9, 9, 8, 7, 7, 6, 5, 4, 4, 3, 2, 1, 0, -1, -2, -3, -4, -5, -5, -6, -7, -7 };
lut_0_output_t lookup_0_11_2(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_11_2 type=ROM_1P impl=LUTRAM
    return lut_0_11_2[input];
}
const lut_0_output_t lut_0_11_3[LUT_SIZE_0] = { -1, -1, -1, -2, -2, -2, -2, -3, -3, -4, -4, -5, -5, -6, -7, -7, -8, -8, -9, -9, -9, -9, -9, -8, -7, -6, -5, -4, -3, -1, 1, 2, 4, 5, 7, 8, 9, 10, 11, 12, 12, 12, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 12, 12, 12, 12, 12, 13, 13, 14, 15 };
lut_0_output_t lookup_0_11_3(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_11_3 type=ROM_1P impl=LUTRAM
    return lut_0_11_3[input];
}
const lut_0_output_t lut_0_12_0[LUT_SIZE_0] = { 0, 0, 1, 1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 10, 10, 10, 10, 9, 9, 8, 8, 7, 7, 6, 5, 4, 3, 2, 1, -1, -3, -5, -7, -9, -11, -14, -16, -19, -21, -23, -26, -28, -30, -32, -34, -37, -39, -41, -43, -46, -48, -51, -54, -56, -59, -62, -65, -67, -70, -73 };
lut_0_output_t lookup_0_12_0(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_12_0 type=ROM_1P impl=LUTRAM
    return lut_0_12_0[input];
}
const lut_0_output_t lut_0_12_1[LUT_SIZE_0] = { -4, -4, -4, -4, -4, -3, -3, -3, -2, -2, -1, -1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, -1, -1, -1, -2, -2, -3, -3, -4, -4, -5, -5, -6, -6, -7, -7, -8, -9, -9, -10, -10, -10, -11, -11 };
lut_0_output_t lookup_0_12_1(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_12_1 type=ROM_1P impl=LUTRAM
    return lut_0_12_1[input];
}
const lut_0_output_t lut_0_12_2[LUT_SIZE_0] = { 1, 0, -1, -2, -3, -4, -5, -5, -6, -6, -6, -6, -6, -6, -5, -5, -4, -4, -3, -3, -3, -2, -2, -1, -1, 0, 0, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 5, 5, 5, 5, 5, 5, 4, 4, 4, 3, 3, 3 };
lut_0_output_t lookup_0_12_2(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_12_2 type=ROM_1P impl=LUTRAM
    return lut_0_12_2[input];
}
const lut_0_output_t lut_0_12_3[LUT_SIZE_0] = { 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, -1, -1, -2, -3, -3, -4, -5, -6, -7, -9, -9, -10, -11, -11, -11, -11, -11, -11, -11, -10, -10, -9, -9, -8, -8, -8, -8, -9, -9 };
lut_0_output_t lookup_0_12_3(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_12_3 type=ROM_1P impl=LUTRAM
    return lut_0_12_3[input];
}
const lut_0_output_t lut_0_13_0[LUT_SIZE_0] = { 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 8, 8, 8, 8, 7, 6, 5, 4, 3, 1, 0, -1, -2, -3, -4, -5, -5, -5, -6, -5, -5, -5, -4, -3, -2, -2, -1, 0, 1, 1, 2, 2, 3, 3, 3, 3, 2, 2, 2, 1, 1, 0, -1, -2, -3, -4, -4, -5, -6, -7, -7, -8 };
lut_0_output_t lookup_0_13_0(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_13_0 type=ROM_1P impl=LUTRAM
    return lut_0_13_0[input];
}
const lut_0_output_t lut_0_13_1[LUT_SIZE_0] = { 0, 0, 1, 1, 1, 2, 3, 4, 5, 6, 7, 8, 8, 9, 9, 9, 9, 8, 7, 7, 6, 4, 3, 2, 1, 0, -1, -2, -3, -3, -3, -3, -3, -3, -3, -3, -2, -2, -2, -2, -1, -1, -1, 0, 0, 1, 1, 2, 2, 3, 3, 3, 4, 3, 3, 3, 2, 2, 1, 1, 0, -1, -1, -2 };
lut_0_output_t lookup_0_13_1(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_13_1 type=ROM_1P impl=LUTRAM
    return lut_0_13_1[input];
}
const lut_0_output_t lut_0_13_2[LUT_SIZE_0] = { 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, -1, -1, 0, 0, 0, 0, 0, 1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 1, 0 };
lut_0_output_t lookup_0_13_2(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_13_2 type=ROM_1P impl=LUTRAM
    return lut_0_13_2[input];
}
const lut_0_output_t lut_0_13_3[LUT_SIZE_0] = { -2, -2, -2, -2, -2, -3, -3, -3, -3, -3, -3, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -3, -3, -2, -2, -1, -1, 0, 1, 2, 3, 3, 4, 5, 6, 7, 7, 8, 9, 9, 10, 11, 11, 12, 13, 14, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 26, 27, 28 };
lut_0_output_t lookup_0_13_3(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_13_3 type=ROM_1P impl=LUTRAM
    return lut_0_13_3[input];
}
const lut_0_output_t lut_0_14_0[LUT_SIZE_0] = { -1, -3, -4, -6, -9, -12, -15, -19, -22, -25, -28, -30, -31, -31, -30, -28, -25, -22, -17, -12, -6, 0, 7, 13, 20, 26, 32, 35, 38, 37, 35, 31, 24, 16, 7, -2, -11, -19, -26, -32, -36, -37, -37, -36, -32, -28, -24, -20, -16, -13, -12, -11, -12, -13, -17, -21, -26, -32, -39, -47, -55, -63, -70, -77 };
lut_0_output_t lookup_0_14_0(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_14_0 type=ROM_1P impl=LUTRAM
    return lut_0_14_0[input];
}
const lut_0_output_t lut_0_14_1[LUT_SIZE_0] = { -17, -18, -20, -21, -22, -23, -23, -24, -24, -25, -26, -27, -28, -29, -31, -33, -35, -38, -40, -41, -43, -43, -42, -39, -35, -30, -23, -16, -9, -2, 4, 9, 14, 18, 21, 25, 28, 31, 35, 39, 43, 48, 52, 57, 62, 67, 72, 77, 81, 85, 89, 93, 98, 102, 107, 113, 118, 124, 129, 134, 139, 143, 146, 149 };
lut_0_output_t lookup_0_14_1(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_14_1 type=ROM_1P impl=LUTRAM
    return lut_0_14_1[input];
}
const lut_0_output_t lut_0_14_2[LUT_SIZE_0] = { 14, 15, 15, 15, 15, 15, 15, 14, 14, 13, 12, 11, 10, 9, 8, 7, 5, 4, 3, 2, 0, -1, -2, -3, -4, -5, -5, -5, -4, -3, -2, 0, 2, 3, 4, 4, 4, 2, 0, -3, -6, -9, -13, -16, -19, -22, -25, -27, -29, -31, -31, -31, -31, -30, -28, -26, -24, -21, -19, -17, -16, -15, -14, -13 };
lut_0_output_t lookup_0_14_2(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_14_2 type=ROM_1P impl=LUTRAM
    return lut_0_14_2[input];
}
const lut_0_output_t lut_0_14_3[LUT_SIZE_0] = { 8, 9, 11, 12, 12, 12, 10, 8, 6, 3, -1, -4, -7, -9, -11, -13, -15, -18, -21, -24, -27, -29, -30, -30, -28, -25, -20, -13, -6, 3, 11, 20, 27, 34, 38, 40, 40, 38, 34, 28, 21, 14, 6, -2, -9, -16, -21, -26, -30, -33, -36, -39, -43, -47, -52, -58, -65, -72, -80, -87, -95, -103, -109, -115 };
lut_0_output_t lookup_0_14_3(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_14_3 type=ROM_1P impl=LUTRAM
    return lut_0_14_3[input];
}
const lut_0_output_t lut_0_15_0[LUT_SIZE_0] = { 7, 8, 10, 13, 16, 19, 22, 26, 29, 32, 36, 39, 41, 43, 45, 46, 46, 45, 44, 41, 38, 35, 31, 27, 23, 19, 14, 10, 6, 3, -1, -4, -7, -10, -13, -16, -19, -21, -24, -26, -28, -30, -31, -32, -33, -34, -35, -36, -36, -37, -38, -39, -40, -41, -43, -45, -47, -49, -51, -54, -56, -59, -62, -65 };
lut_0_output_t lookup_0_15_0(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_15_0 type=ROM_1P impl=LUTRAM
    return lut_0_15_0[input];
}
const lut_0_output_t lut_0_15_1[LUT_SIZE_0] = { -2, -2, -2, -3, -3, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -3, -3, -3, -2, -2, -1, -1, 0, 1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 4, 4, 5, 6, 7, 8, 9, 11, 13, 14, 16, 18, 20, 21, 23, 24, 26 };
lut_0_output_t lookup_0_15_1(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_15_1 type=ROM_1P impl=LUTRAM
    return lut_0_15_1[input];
}
const lut_0_output_t lut_0_15_2[LUT_SIZE_0] = { 14, 18, 24, 31, 38, 45, 53, 60, 68, 74, 79, 83, 85, 85, 84, 82, 78, 73, 68, 62, 55, 49, 42, 35, 29, 22, 16, 10, 5, -1, -6, -11, -16, -20, -24, -28, -31, -34, -37, -40, -42, -45, -47, -50, -52, -55, -58, -61, -64, -67, -71, -74, -77, -80, -83, -85, -87, -89, -91, -94, -95, -97, -99, -101 };
lut_0_output_t lookup_0_15_2(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_15_2 type=ROM_1P impl=LUTRAM
    return lut_0_15_2[input];
}
const lut_0_output_t lut_0_15_3[LUT_SIZE_0] = { 6, 6, 7, 7, 8, 9, 11, 12, 14, 16, 18, 20, 22, 23, 25, 26, 27, 28, 28, 27, 27, 25, 24, 22, 20, 18, 16, 14, 13, 11, 9, 7, 6, 4, 2, -1, -4, -8, -12, -17, -22, -28, -34, -40, -47, -53, -60, -66, -73, -79, -84, -89, -94, -99, -103, -106, -109, -112, -114, -116, -118, -119, -121, -122 };
lut_0_output_t lookup_0_15_3(input_t input) {
#pragma HLS BIND_STORAGE variable=lut_0_15_3 type=ROM_1P impl=LUTRAM
    return lut_0_15_3[input];
}