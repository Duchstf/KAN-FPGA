#include "lookups.h"

void KAN(input_t input[N_INPUT], result_t output[N_OUTPUT])
{
#pragma HLS ARRAY_PARTITION variable = input complete
#pragma HLS ARRAY_PARTITION variable = output complete

#pragma HLS interface mode = ap_none port = input, output
#pragma HLS PIPELINE II = 1

	//// LAYER 0 ////

	// Compute activations from LUTs
	lut_t act_0_0_0 = lut_lookup_0_0_0(input[0]);
	lut_t act_0_0_1 = lut_lookup_0_0_1(input[0]);
	lut_t act_0_0_2 = lut_lookup_0_0_2(input[0]);
	lut_t act_0_0_3 = lut_lookup_0_0_3(input[0]);
	lut_t act_0_1_0 = lut_lookup_0_1_0(input[1]);
	lut_t act_0_1_1 = lut_lookup_0_1_1(input[1]);
	lut_t act_0_1_2 = lut_lookup_0_1_2(input[1]);
	lut_t act_0_1_3 = lut_lookup_0_1_3(input[1]);
	lut_t act_0_2_0 = lut_lookup_0_2_0(input[2]);
	lut_t act_0_2_1 = lut_lookup_0_2_1(input[2]);
	lut_t act_0_2_2 = lut_lookup_0_2_2(input[2]);
	lut_t act_0_2_3 = lut_lookup_0_2_3(input[2]);
	lut_t act_0_3_0 = lut_lookup_0_3_0(input[3]);
	lut_t act_0_3_1 = lut_lookup_0_3_1(input[3]);
	lut_t act_0_3_2 = lut_lookup_0_3_2(input[3]);
	lut_t act_0_3_3 = lut_lookup_0_3_3(input[3]);
	lut_t act_0_4_0 = lut_lookup_0_4_0(input[4]);
	lut_t act_0_4_1 = lut_lookup_0_4_1(input[4]);
	lut_t act_0_4_2 = lut_lookup_0_4_2(input[4]);
	lut_t act_0_4_3 = lut_lookup_0_4_3(input[4]);
	lut_t act_0_5_0 = lut_lookup_0_5_0(input[5]);
	lut_t act_0_5_1 = lut_lookup_0_5_1(input[5]);
	lut_t act_0_5_2 = lut_lookup_0_5_2(input[5]);
	lut_t act_0_5_3 = lut_lookup_0_5_3(input[5]);
	lut_t act_0_6_0 = lut_lookup_0_6_0(input[6]);
	lut_t act_0_6_1 = lut_lookup_0_6_1(input[6]);
	lut_t act_0_6_2 = lut_lookup_0_6_2(input[6]);
	lut_t act_0_6_3 = lut_lookup_0_6_3(input[6]);
	lut_t act_0_7_0 = lut_lookup_0_7_0(input[7]);
	lut_t act_0_7_1 = lut_lookup_0_7_1(input[7]);
	lut_t act_0_7_2 = lut_lookup_0_7_2(input[7]);
	lut_t act_0_7_3 = lut_lookup_0_7_3(input[7]);
	lut_t act_0_8_0 = lut_lookup_0_8_0(input[8]);
	lut_t act_0_8_1 = lut_lookup_0_8_1(input[8]);
	lut_t act_0_8_2 = lut_lookup_0_8_2(input[8]);
	lut_t act_0_8_3 = lut_lookup_0_8_3(input[8]);
	lut_t act_0_9_0 = lut_lookup_0_9_0(input[9]);
	lut_t act_0_9_1 = lut_lookup_0_9_1(input[9]);
	lut_t act_0_9_2 = lut_lookup_0_9_2(input[9]);
	lut_t act_0_9_3 = lut_lookup_0_9_3(input[9]);
	lut_t act_0_10_0 = lut_lookup_0_10_0(input[10]);
	lut_t act_0_10_1 = lut_lookup_0_10_1(input[10]);
	lut_t act_0_10_2 = lut_lookup_0_10_2(input[10]);
	lut_t act_0_10_3 = lut_lookup_0_10_3(input[10]);
	lut_t act_0_11_0 = lut_lookup_0_11_0(input[11]);
	lut_t act_0_11_1 = lut_lookup_0_11_1(input[11]);
	lut_t act_0_11_2 = lut_lookup_0_11_2(input[11]);
	lut_t act_0_11_3 = lut_lookup_0_11_3(input[11]);
	lut_t act_0_12_0 = lut_lookup_0_12_0(input[12]);
	lut_t act_0_12_1 = lut_lookup_0_12_1(input[12]);
	lut_t act_0_12_2 = lut_lookup_0_12_2(input[12]);
	lut_t act_0_12_3 = lut_lookup_0_12_3(input[12]);
	lut_t act_0_13_0 = lut_lookup_0_13_0(input[13]);
	lut_t act_0_13_1 = lut_lookup_0_13_1(input[13]);
	lut_t act_0_13_2 = lut_lookup_0_13_2(input[13]);
	lut_t act_0_13_3 = lut_lookup_0_13_3(input[13]);
	lut_t act_0_14_0 = lut_lookup_0_14_0(input[14]);
	lut_t act_0_14_1 = lut_lookup_0_14_1(input[14]);
	lut_t act_0_14_2 = lut_lookup_0_14_2(input[14]);
	lut_t act_0_14_3 = lut_lookup_0_14_3(input[14]);
	lut_t act_0_15_0 = lut_lookup_0_15_0(input[15]);
	lut_t act_0_15_1 = lut_lookup_0_15_1(input[15]);
	lut_t act_0_15_2 = lut_lookup_0_15_2(input[15]);
	lut_t act_0_15_3 = lut_lookup_0_15_3(input[15]);

	// Aggregate activations to get layer outputs
	lut_t out_0_0 = act_0_0_0 + act_0_1_0 + act_0_2_0 + act_0_3_0 + act_0_4_0 + act_0_5_0 + act_0_6_0 + act_0_7_0 + act_0_8_0 + act_0_9_0 + act_0_10_0 + act_0_11_0 + act_0_12_0 + act_0_13_0 + act_0_14_0 + act_0_15_0;
	lut_t out_0_1 = act_0_0_1 + act_0_1_1 + act_0_2_1 + act_0_3_1 + act_0_4_1 + act_0_5_1 + act_0_6_1 + act_0_7_1 + act_0_8_1 + act_0_9_1 + act_0_10_1 + act_0_11_1 + act_0_12_1 + act_0_13_1 + act_0_14_1 + act_0_15_1;
	lut_t out_0_2 = act_0_0_2 + act_0_1_2 + act_0_2_2 + act_0_3_2 + act_0_4_2 + act_0_5_2 + act_0_6_2 + act_0_7_2 + act_0_8_2 + act_0_9_2 + act_0_10_2 + act_0_11_2 + act_0_12_2 + act_0_13_2 + act_0_14_2 + act_0_15_2;
	lut_t out_0_3 = act_0_0_3 + act_0_1_3 + act_0_2_3 + act_0_3_3 + act_0_4_3 + act_0_5_3 + act_0_6_3 + act_0_7_3 + act_0_8_3 + act_0_9_3 + act_0_10_3 + act_0_11_3 + act_0_12_3 + act_0_13_3 + act_0_14_3 + act_0_15_3;


	//// LAYER 1 ////

	// Compute activations from LUTs
	lut_t act_1_0_0 = lut_lookup_1_0_0(input[0]);
	lut_t act_1_0_1 = lut_lookup_1_0_1(input[0]);
	lut_t act_1_0_2 = lut_lookup_1_0_2(input[0]);
	lut_t act_1_0_3 = lut_lookup_1_0_3(input[0]);
	lut_t act_1_0_4 = lut_lookup_1_0_4(input[0]);
	lut_t act_1_1_0 = lut_lookup_1_1_0(input[1]);
	lut_t act_1_1_1 = lut_lookup_1_1_1(input[1]);
	lut_t act_1_1_2 = lut_lookup_1_1_2(input[1]);
	lut_t act_1_1_3 = lut_lookup_1_1_3(input[1]);
	lut_t act_1_1_4 = lut_lookup_1_1_4(input[1]);
	lut_t act_1_2_0 = lut_lookup_1_2_0(input[2]);
	lut_t act_1_2_1 = lut_lookup_1_2_1(input[2]);
	lut_t act_1_2_2 = lut_lookup_1_2_2(input[2]);
	lut_t act_1_2_3 = lut_lookup_1_2_3(input[2]);
	lut_t act_1_2_4 = lut_lookup_1_2_4(input[2]);
	lut_t act_1_3_0 = lut_lookup_1_3_0(input[3]);
	lut_t act_1_3_1 = lut_lookup_1_3_1(input[3]);
	lut_t act_1_3_2 = lut_lookup_1_3_2(input[3]);
	lut_t act_1_3_3 = lut_lookup_1_3_3(input[3]);
	lut_t act_1_3_4 = lut_lookup_1_3_4(input[3]);

	// Aggregate activations to get layer outputs
	output[0] = act_1_0_0 + act_1_1_0 + act_1_2_0 + act_1_3_0;
	output[1] = act_1_0_1 + act_1_1_1 + act_1_2_1 + act_1_3_1;
	output[2] = act_1_0_2 + act_1_1_2 + act_1_2_2 + act_1_3_2;
	output[3] = act_1_0_3 + act_1_1_3 + act_1_2_3 + act_1_3_3;
	output[4] = act_1_0_4 + act_1_1_4 + act_1_2_4 + act_1_3_4;

}