#include <stdint.h>
#include <stdio.h>

// if we want to extract bits, then we use & 

uint32_t six_middle_bits(int32_t value) {
    // 10000000 00000000 01011011 10100000 = 23456
    // 00000000 00000111 11100000 00000000
    // 00000000 00000000 00000000 00000010

    int mask = 0x7E000;
    return (value >> 13) & mask;
}

int main() {
    printf("the six middle bits are %x\n", six_middle_bits(23456));
}