#include <stdio.h>
#include <stdint.h>
#include <assert.h>



// testing
int main(void) {
    int16_t number = 0b00001111;
    // 0b 00001111 number
    // 0b 01000000 <- set mask
    // number | set_mask
    // 0b 01001111

    // 0b 00010000 << 1 <- mask

    // the way we "push" the 1 is by using << or >>

    // 0b 00001000
    // to check if a bit is set, we use & 
    // to set a bit in a number, we use |
    for (int bit = 0; bit < 16; bit++) {
        int current_bit_mask = 1 << (16 - 1 - bit);

        int current_bit = number & current_bit_mask;
        // if the bit is 1 -> print 1 
        if (current_bit != 0) {
            printf("1");
        } else {
            printf("0");
        }
    }
    printf("\n");
    return 0;
}