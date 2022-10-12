#include <stdio.h>
#include <stdint.h>
#include <assert.h>

typedef unsigned int Word;

#define NUM_BITS 32
#define BASE_MASK 1u
// 0100 0000 0000 0000 0000 0000 0000 0000
// 0000 0001 0010 0011 0100 0101 0110 0111
// 
// 0000 0000 0000 0000 0000 0000 0000 0010 = 1

// 1110 0110 1010 0010 1100 0100 1000 0000
Word reverse_bits(Word w) {
    Word result = 0;
    for (int i = 0; i < NUM_BITS; i++) {
        // 1. check the value of the current bit
        //     a. create a mask
        Word current_bit_mask = BASE_MASK << (NUM_BITS - 1 - i);
        // 2. if the current bit is 1
        if (current_bit_mask & w) {
            // 3. set the bit in the opposite location 
            Word return_value_mask = BASE_MASK << i;
            result = result | return_value_mask;
        }
    }
    return result;
}

// testing
int main(void) {
    Word w1 = 0x01234567;
    // 0000 => 0000 = 0
    // 0001 => 1000 = 8
    // 0010 => 0100 = 4
    // 0011 => 1100 = C
    // 0100 => 0010 = 2
    // 0101 => 1010 = A
    // 0110 => 0110 = 6
    // 0111 => 1110 = E

    assert(reverse_bits(w1) == 0xE6A2C480);
    puts("All tests passed!");
    return 0;
}