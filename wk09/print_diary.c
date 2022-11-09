#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {

    char *home_path = getenv("HOME");

    //printf("%s\n", home_path);

    /// home_path + "/.diary"

    int path_size = strlen(home_path) + 7 + 1;

    //char *path_string = malloc(sizeof(char) * path_size);

    char path_string[path_size];

    snprintf(path_string, path_size, "%s/.diary", home_path);
    //printf("%s\n", path_string);

    // open the file
    FILE *stream = fopen(path_string, "r");

    if (stream == NULL) {
        perror(path_string);
        exit(1);
    }

    // print out everything in the file 
    int c;
    while ((c = fgetc(stream)) != EOF) {
        fputc(c, stdout);
    }

    fclose(stream);

    return 0;
}