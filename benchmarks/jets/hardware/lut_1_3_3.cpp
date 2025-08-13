#include "lut_1_3_3.h"
#include "value_to_index.h"

const lut_t lut_1_3_3[LUT_SIZE] = { 
  (lut_t)0.00000e+00, (lut_t)0.00000e+00, (lut_t)0.00000e+00, (lut_t)0.00000e+00,
(lut_t)0.00000e+00,  (lut_t)2.50000e-01,  (lut_t)3.75000e-01, (lut_t)-2.50000e-01,
(lut_t)-7.50000e-01, (lut_t)-5.00000e-01, (lut_t)-1.25000e-01, (lut_t)-1.25000e-01,
(lut_t)-2.50000e-01, (lut_t)-2.50000e-01, (lut_t)-3.75000e-01, (lut_t)-3.75000e-01,
,
,
,
,
,
,
,
,
,
,
,
,
,
,
,
,
,
,
,
,
,
,
,
,
,
,
,

};

lut_t lut_lookup_1_3_3(lut_input_t input) {
  #pragma HLS BIND_STORAGE variable=lut_1_3_3 type=RAM_1P impl=LUTRAM
  return lut_1_3_3[value_to_index(input)];
}