#include "lookups.h"

void KAN(input_t input[N_INPUT], result_t output[N_OUTPUT])
{
#pragma HLS ARRAY_PARTITION variable = input complete
#pragma HLS ARRAY_PARTITION variable = output complete

#pragma HLS interface mode = ap_none port = input, output
#pragma HLS PIPELINE II = 1

    // First layer
    lut_t output_0_0 = lut_lookup_0_0(input[0]);
    lut_t output_0_1 = lut_lookup_0_1(input[0]);
    lut_t output_0_2 = lut_lookup_0_2(input[0]);
    lut_t output_0_3 = lut_lookup_0_3(input[0]);
    lut_t output_0_4 = lut_lookup_0_4(input[1]);
    lut_t output_0_5 = lut_lookup_0_5(input[1]);
    lut_t output_0_6 = lut_lookup_0_6(input[1]);
    lut_t output_0_7 = lut_lookup_0_7(input[1]);
    lut_t output_0_8 = lut_lookup_0_8(input[2]);
    lut_t output_0_9 = lut_lookup_0_9(input[2]);
    lut_t output_0_10 = lut_lookup_0_10(input[2]);
    lut_t output_0_11 = lut_lookup_0_11(input[2]);
    lut_t output_0_12 = lut_lookup_0_12(input[3]);
    lut_t output_0_13 = lut_lookup_0_13(input[3]);
    lut_t output_0_14 = lut_lookup_0_14(input[3]);
    lut_t output_0_15 = lut_lookup_0_15(input[3]);
    lut_t output_0_16 = lut_lookup_0_16(input[4]);
    lut_t output_0_17 = lut_lookup_0_17(input[4]);
    lut_t output_0_18 = lut_lookup_0_18(input[4]);
    lut_t output_0_19 = lut_lookup_0_19(input[4]);
    lut_t output_0_20 = lut_lookup_0_20(input[5]);
    lut_t output_0_21 = lut_lookup_0_21(input[5]);
    lut_t output_0_22 = lut_lookup_0_22(input[5]);
    lut_t output_0_23 = lut_lookup_0_23(input[5]);
    lut_t output_0_24 = lut_lookup_0_24(input[6]);
    lut_t output_0_25 = lut_lookup_0_25(input[6]);
    lut_t output_0_26 = lut_lookup_0_26(input[6]);
    lut_t output_0_27 = lut_lookup_0_27(input[6]);
    lut_t output_0_28 = lut_lookup_0_28(input[7]);
    lut_t output_0_29 = lut_lookup_0_29(input[7]);
    lut_t output_0_30 = lut_lookup_0_30(input[7]);
    lut_t output_0_31 = lut_lookup_0_31(input[7]);
    lut_t output_0_32 = lut_lookup_0_32(input[8]);
    lut_t output_0_33 = lut_lookup_0_33(input[8]);
    lut_t output_0_34 = lut_lookup_0_34(input[8]);
    lut_t output_0_35 = lut_lookup_0_35(input[8]);
    lut_t output_0_36 = lut_lookup_0_36(input[9]);
    lut_t output_0_37 = lut_lookup_0_37(input[9]);
    lut_t output_0_38 = lut_lookup_0_38(input[9]);
    lut_t output_0_39 = lut_lookup_0_39(input[9]);
    lut_t output_0_40 = lut_lookup_0_40(input[10]);
    lut_t output_0_41 = lut_lookup_0_41(input[10]);
    lut_t output_0_42 = lut_lookup_0_42(input[10]);
    lut_t output_0_43 = lut_lookup_0_43(input[10]);
    lut_t output_0_44 = lut_lookup_0_44(input[11]);
    lut_t output_0_45 = lut_lookup_0_45(input[11]);
    lut_t output_0_46 = lut_lookup_0_46(input[11]);
    lut_t output_0_47 = lut_lookup_0_47(input[11]);
    lut_t output_0_48 = lut_lookup_0_48(input[12]);
    lut_t output_0_49 = lut_lookup_0_49(input[12]);
    lut_t output_0_50 = lut_lookup_0_50(input[12]);
    lut_t output_0_51 = lut_lookup_0_51(input[12]);
    lut_t output_0_52 = lut_lookup_0_52(input[13]);
    lut_t output_0_53 = lut_lookup_0_53(input[13]);
    lut_t output_0_54 = lut_lookup_0_54(input[13]);
    lut_t output_0_55 = lut_lookup_0_55(input[13]);
    lut_t output_0_56 = lut_lookup_0_56(input[14]);
    lut_t output_0_57 = lut_lookup_0_57(input[14]);
    lut_t output_0_58 = lut_lookup_0_58(input[14]);
    lut_t output_0_59 = lut_lookup_0_59(input[14]);
    lut_t output_0_60 = lut_lookup_0_60(input[15]);
    lut_t output_0_61 = lut_lookup_0_61(input[15]);
    lut_t output_0_62 = lut_lookup_0_62(input[15]);
    lut_t output_0_63 = lut_lookup_0_63(input[15]);

    // Sum these up for the second layer
    lut_t med_0_0 = output_0_0 + output_0_4 + output_0_8 + output_0_12 + output_0_16 + output_0_20 + output_0_24 + output_0_28 + output_0_32 + output_0_36 + output_0_40 + output_0_44 + output_0_48 + output_0_52 + output_0_56 + output_0_60;
    lut_t med_0_1 = output_0_1 + output_0_5 + output_0_9 + output_0_13 + output_0_17 + output_0_21 + output_0_25 + output_0_29 + output_0_33 + output_0_37 + output_0_41 + output_0_45 + output_0_49 + output_0_53 + output_0_57 + output_0_61;
    lut_t med_0_2 = output_0_2 + output_0_6 + output_0_10 + output_0_14 + output_0_18 + output_0_22 + output_0_26 + output_0_30 + output_0_34 + output_0_38 + output_0_42 + output_0_46 + output_0_50 + output_0_54 + output_0_58 + output_0_62;
    lut_t med_0_3 = output_0_3 + output_0_7 + output_0_11 + output_0_15 + output_0_19 + output_0_23 + output_0_27 + output_0_31 + output_0_35 + output_0_39 + output_0_43 + output_0_47 + output_0_51 + output_0_55 + output_0_59 + output_0_63;

    // Second layer
    lut_t output_1_0 = lut_lookup_1_0(med_0_0);
    lut_t output_1_1 = lut_lookup_1_1(med_0_0);
    lut_t output_1_2 = lut_lookup_1_2(med_0_0);
    lut_t output_1_3 = lut_lookup_1_3(med_0_0);
    lut_t output_1_4 = lut_lookup_1_4(med_0_0);
    lut_t output_1_5 = lut_lookup_1_5(med_0_1);
    lut_t output_1_6 = lut_lookup_1_6(med_0_1);
    lut_t output_1_7 = lut_lookup_1_7(med_0_1);
    lut_t output_1_8 = lut_lookup_1_8(med_0_1);
    lut_t output_1_9 = lut_lookup_1_9(med_0_1);
    lut_t output_1_10 = lut_lookup_1_10(med_0_2);
    lut_t output_1_11 = lut_lookup_1_11(med_0_2);
    lut_t output_1_12 = lut_lookup_1_12(med_0_2);
    lut_t output_1_13 = lut_lookup_1_13(med_0_2);
    lut_t output_1_14 = lut_lookup_1_14(med_0_2);
    lut_t output_1_15 = lut_lookup_1_15(med_0_3);
    lut_t output_1_16 = lut_lookup_1_16(med_0_3);
    lut_t output_1_17 = lut_lookup_1_17(med_0_3);
    lut_t output_1_18 = lut_lookup_1_18(med_0_3);
    lut_t output_1_19 = lut_lookup_1_19(med_0_3);

    // Sum up for results
    output[0] = output_1_0 + output_1_5 + output_1_10 + output_1_15;
    output[1] = output_1_1 + output_1_6 + output_1_11 + output_1_16;
    output[2] = output_1_2 + output_1_7 + output_1_12 + output_1_17;
    output[3] = output_1_3 + output_1_8 + output_1_13 + output_1_18;
    output[4] = output_1_4 + output_1_9 + output_1_14 + output_1_19;
}