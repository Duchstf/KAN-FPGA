#ifndef DEFINES_H_
#define DEFINES_H_

#include <ap_int.h>
#include <ap_fixed.h>
#include <hls_stream.h>

#define N_INPUT 16
#define N_OUTPUT 5

#define LUT_SIZE 128

// Model related
typedef ap_fixed<7,4> input_t;
typedef ap_fixed<7,4> result_t;

// LUT related
typedef ap_fixed<7,4> lut_t;
typedef ap_fixed<7,4> lut_input_t;

#endif