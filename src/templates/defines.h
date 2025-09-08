#pragma once

#include <ap_int.h>
#include <ap_fixed.h>
#include <hls_stream.h>

#define N_INPUT {N_INPUT}
#define N_OUTPUT {N_OUTPUT}

#define LUT_SIZE {LUT_SIZE}

// Model related
{{MODEL_RELATED_DEFINES}}
typedef ap_uint<{INPUT_BIT_WIDTH}> input_t;
typedef ap_int<{OUTPUT_BIT_WIDTH}> result_t;

// LUT related
{{LUT_RELATED_DEFINES}}