#pragma once

#include <ap_int.h>
#include <ap_fixed.h>
#include <hls_stream.h>

// Model related
#define N_INPUT 16
#define N_OUTPUT 5
typedef ap_uint<6> input_t;
typedef ap_fixed<8, 8, AP_TRN, AP_SAT> output_t;

// LUT related

//LAYER 0:
#define LUT_SIZE_0 64
typedef ap_int<8> lut_0_output_t;
typedef ap_fixed<8, 8, AP_TRN, AP_SAT> accum_0_t;

//LAYER 1:
typedef ap_fixed<8, 8, AP_TRN, AP_SAT> idx_1_t;
#define LUT_SIZE_1 256
typedef ap_int<8> lut_1_output_t;