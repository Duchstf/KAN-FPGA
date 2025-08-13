#include "lut_1_2_2.h"
#include "value_to_index.h"

const lut_t lut_1_2_2[LUT_SIZE] = { 
  (lut_t)0.00000e+00, (lut_t)0.00000e+00,  (lut_t)0.00000e+00, (lut_t)0.00000e+00,
(lut_t)0.00000e+00, (lut_t)-1.25000e-01, (lut_t)-2.50000e-01, (lut_t)-2.50000e-01,
 (lut_t)0.00000e+00,  (lut_t)6.25000e-01,  (lut_t)1.25000e+00,  (lut_t)1.75000e+00,
 (lut_t)2.25000e+00,  (lut_t)2.75000e+00,  (lut_t)3.25000e+00,  (lut_t)3.87500e+00,
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

lut_t lut_lookup_1_2_2(lut_input_t input) {
  #pragma HLS BIND_STORAGE variable=lut_1_2_2 type=RAM_1P impl=LUTRAM
  return lut_1_2_2[value_to_index(input)];
}