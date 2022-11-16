#include <stdio.h>
#include <stdbool.h>
#include <pthread.h>


void *thread_run(void *data) {
    char *message = (char *)data;
    while (true) {
        printf("%s", message);
    }
}

int main(void) {
    pthread_t pthread;

    char *message = "there!\n";
    pthread_create(&pthread, NULL, thread_run, message);

    while (true) {
        printf("Hello\n");
    }

    return 0;
}