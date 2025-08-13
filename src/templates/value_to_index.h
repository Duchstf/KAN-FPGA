int value_to_index(lut_input_t value) {
    int data_round = (value * LUT_SIZE) >> {SHIFT_FACTOR};
    int index = data_round + LUT_SIZE / 2;

    return index;
}