#include <stdio.h>
#include <errno.h>
#include <stdlib.h>

// Write a C program, first_line.c, which is given one command-line argument, 
// the name of a file, and which prints the first line of that file to stdout. 
// If given an incorrect number of arguments, or if there was an error opening 
// the file, it should print a suitable error message.

int main(int argc, char* argv[]) {

    if (argc != 2) {
        fprintf(stderr, "you supplied an incprrect number of arguments\n");
        exit(1);
    }

    FILE *stream = fopen(argv[1], "r");
    if (stream == NULL) {
        perror("");
    }

    int c;
    while((c = fgetc(stream)) != EOF) {
        // printf("in the loop\n");
        fputc(c, stdout);
        if (c == '\n') break;
    }

    fclose(stream);
    return 0;
}