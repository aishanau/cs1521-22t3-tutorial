#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

int main(int argc, char *argv[]) {

    for (int i = 1; i < argc; i++) {
        // check the perms of the file i.e. check if publically writable 
        struct stat s;
        stat(argv[i], &s);

        // check publically writable perm 
        if (s.st_mode & S_IWOTH) {
            // remove the perm 
            mode_t new_permission = s.st_mode & ~S_IWOTH;
            // mode =     0b010101010
            //~S_IWOTH =  0b111111101
            // newmode =  0b010101000
            // mode_t new_permission = s.st_mode ^ S_IWOTH;
            if (chmod(argv[i], new_permission)) {
                perror(argv[i]);
                exit(1);
            }
            printf("removing publically writable permission from %s\n", argv[i]);
        } else {
            // print out filename is not publically writable 
            printf("%s is not publically writeable\n", argv[i]);
        }
    }

    return 0;
}
