#include "lut_{i}_{j}_{k}.h"
#include "value_to_index.h"

const lut_t lut_{i}_{j}_{k}[LUT_SIZE] = { 
  {FORMATTED_VALUES}
};

lut_t lut_lookup_{i}_{j}_{k}(lut_input_t input) {
  #pragma HLS BIND_STORAGE variable=lut_{i}_{j}_{k} type=RAM_1P impl=LUTRAM
  return lut_{i}_{j}_{k}[value_to_index(input)];
}