#include "lut_0_15_1.h"
#include "value_to_index.h"

const lut_t lut_0_15_1[LUT_SIZE] = { 
  (lut_t)0.00000e+00, (lut_t)0.00000e+00, (lut_t)0.00000e+00,  (lut_t)0.00000e+00,
(lut_t)0.00000e+00, (lut_t)0.00000e+00, (lut_t)-1.25000e-01, (lut_t)-2.50000e-01,
(lut_t)0.00000e+00,  (lut_t)5.00000e-01,  (lut_t)1.00000e+00,  (lut_t)1.25000e+00,
 (lut_t)1.62500e+00,  (lut_t)2.12500e+00,  (lut_t)2.50000e+00,  (lut_t)2.87500e+00,
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

lut_t lut_lookup_0_15_1(lut_input_t input) {
  #pragma HLS BIND_STORAGE variable=lut_0_15_1 type=RAM_1P impl=LUTRAM
  return lut_0_15_1[value_to_index(input)];
}