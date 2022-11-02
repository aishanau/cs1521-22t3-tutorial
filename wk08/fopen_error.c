#include <stdio.h>
#include <errno.h>
#include <stdlib.h>


int main() {
    FILE *stream = fopen("hello.txt", "r");

    if (stream == NULL) {
        perror("");
    }
    return 0;
}