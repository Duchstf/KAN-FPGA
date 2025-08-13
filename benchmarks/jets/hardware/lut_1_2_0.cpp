#include "lut_1_2_0.h"
#include "value_to_index.h"

const lut_t lut_1_2_0[LUT_SIZE] = { 
   (lut_t)0.00000e+00, (lut_t)0.00000e+00, (lut_t)0.00000e+00, (lut_t)0.00000e+00,
(lut_t)0.00000e+00, (lut_t)-2.50000e-01, (lut_t)-6.25000e-01, (lut_t)-6.25000e-01,
(lut_t)0.00000e+00,  (lut_t)7.50000e-01,  (lut_t)1.37500e+00,  (lut_t)1.87500e+00,
 (lut_t)2.37500e+00,  (lut_t)3.00000e+00,  (lut_t)3.62500e+00,  (lut_t)4.25000e+00,
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

lut_t lut_lookup_1_2_0(lut_input_t input) {
  #pragma HLS BIND_STORAGE variable=lut_1_2_0 type=RAM_1P impl=LUTRAM
  return lut_1_2_0[value_to_index(input)];
}