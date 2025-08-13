#include "lut_0_15_0.h"
#include "value_to_index.h"

const lut_t lut_0_15_0[LUT_SIZE] = { 
   (lut_t)0.00000e+00,  (lut_t)0.00000e+00,  (lut_t)0.00000e+00,  (lut_t)0.00000e+00,
(lut_t)0.00000e+00, (lut_t)0.00000e+00, (lut_t)-1.25000e-01, (lut_t)-2.50000e-01,
 (lut_t)1.25000e-01,  (lut_t)8.75000e-01,  (lut_t)1.62500e+00,  (lut_t)2.25000e+00,
 (lut_t)2.87500e+00,  (lut_t)3.50000e+00,  (lut_t)4.12500e+00,  (lut_t)4.75000e+00,
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

lut_t lut_lookup_0_15_0(lut_input_t input) {
  #pragma HLS BIND_STORAGE variable=lut_0_15_0 type=RAM_1P impl=LUTRAM
  return lut_0_15_0[value_to_index(input)];
}