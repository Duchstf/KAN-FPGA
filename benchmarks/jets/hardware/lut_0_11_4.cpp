#include "lut_0_11_4.h"
#include "value_to_index.h"

const lut_t lut_0_11_4[LUT_SIZE] = { 
   (lut_t)0.00000e+00,  (lut_t)0.00000e+00,  (lut_t)0.00000e+00, (lut_t)0.00000e+00,
 (lut_t)0.00000e+00,  (lut_t)0.00000e+00,  (lut_t)0.00000e+00, (lut_t)0.00000e+00,
 (lut_t)0.00000e+00,  (lut_t)2.50000e-01,  (lut_t)3.75000e-01,  (lut_t)6.25000e-01,
 (lut_t)7.50000e-01,  (lut_t)1.00000e+00,  (lut_t)1.12500e+00,  (lut_t)1.37500e+00,
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

lut_t lut_lookup_0_11_4(lut_input_t input) {
  #pragma HLS BIND_STORAGE variable=lut_0_11_4 type=RAM_1P impl=LUTRAM
  return lut_0_11_4[value_to_index(input)];
}