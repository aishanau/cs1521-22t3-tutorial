#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>
#include <spawn.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/wait.h>

extern char **environ;


// function which spawns a process and waits for it to finish
int spawn_and_wait(char *argv[]) {
    pid_t pid;
    int spawn_status = posix_spawn(&pid, argv[0], NULL, NULL, argv, environ);

    if (spawn_status) {
        perror("posix_spawn");
        exit(1);
    }

    int exit_status;
    waitpid(pid, &exit_status, 0);

    return exit_status;
}


int main(int argc, char* argv[]) {

    char *args[] = { "/bin/date", "+%d-%m-%Y", NULL };
    spawn_and_wait(args);
    return 0;
}