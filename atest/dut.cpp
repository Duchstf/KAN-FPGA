#include <ap_int.h>
#include <ap_fixed.h>

// Manual clamp version (pure ap_uint)
ap_uint<2> add5_sat_manual(ap_uint<2> a, ap_uint<2> b, ap_uint<2> c,
                           ap_uint<2> d, ap_uint<2> e) {
#pragma HLS INLINE
  ap_uint<5> sum = a + b + c + d + e; // 0..15 fits in 5 bits
  ap_uint<5> max2 = 3;                // max of 2-bit unsigned
  ap_uint<5> clamped = (sum > max2) ? max2 : sum;
  return (ap_uint<2>)clamped;
}

// Using ap_ufixed with saturation; shows the "direct" assignment
ap_uint<2> add5_sat_ufixed(ap_uint<2> a, ap_uint<2> b, ap_uint<2> c,
                           ap_uint<2> d, ap_uint<2> e) {
#pragma HLS INLINE
  // Directly assign expression into a saturating fixed-point value:
  ap_ufixed<2,2, AP_TRN, AP_SAT> sat = a + b + c + d + e;  // saturates to [0,3]
  return (ap_uint<2>)sat;
}
