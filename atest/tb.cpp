#include <cstdio>
#include <ap_int.h>
#include <ap_fixed.h>

// Decls from dut.cpp
ap_uint<2> add5_sat_manual(ap_uint<2> a, ap_uint<2> b, ap_uint<2> c,
                           ap_uint<2> d, ap_uint<2> e);
ap_uint<2> add5_sat_ufixed(ap_uint<2> a, ap_uint<2> b, ap_uint<2> c,
                           ap_uint<2> d, ap_uint<2> e);

int main() {
  int errors = 0;
  int cases  = 0;

  for (int A=0; A<4; ++A)
  for (int B=0; B<4; ++B)
  for (int C=0; C<4; ++C)
  for (int D=0; D<4; ++D)
  for (int E=0; E<4; ++E) {
    ap_uint<2> a=A, b=B, c=C, d=D, e=E;

    // Ground-truth expected: saturate(sum, 3)
    int sum = A + B + C + D + E;     // 0..15
    int exp = (sum > 3) ? 3 : sum;   // clamp to [0,3]

    ap_uint<2> r_manual = add5_sat_manual(a,b,c,d,e);
    ap_uint<2> r_ufixed = add5_sat_ufixed(a,b,c,d,e);

    if ((int)r_manual != exp || (int)r_ufixed != exp) {
      ++errors;
      std::printf("Mismatch: a=%d b=%d c=%d d=%d e=%d | sum=%d exp=%d got(manual=%d, ufixed=%d)\n",
                  A,B,C,D,E,sum,exp,(int)r_manual,(int)r_ufixed);
    }
    ++cases;
  }

  if (errors == 0) {
    std::printf("PASS: %d cases checked, all matched expected saturation.\n", cases);
  } else {
    std::printf("FAIL: %d/%d cases mismatched.\n", errors, cases);
  }

  return errors ? 1 : 0;
}
