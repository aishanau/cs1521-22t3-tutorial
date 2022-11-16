#include <stdio.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int global_total = 0;

void *add_5000_to_counter(void *data) {
    for (int i = 0; i < 5000; i++) {
        // sleep for 1 nanosecond
        nanosleep (&(struct timespec){.tv_nsec = 1}, NULL);
        
        // increment the global total by 1
        global_total++; // this operation will now consume ONE instruction 

        // global_total = global_total + 1; // this takes 3 instructions to run even though it is an atomic type
    }

    return NULL;
}

int main(void) {
    pthread_t thread1;
    pthread_create(&thread1, NULL, add_5000_to_counter, NULL);

    pthread_t thread2;
    pthread_create(&thread2, NULL, add_5000_to_counter, NULL);

    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    // if program works correctly, should print 10000
    printf("Final total: %d\n", global_total);
}


// define order : Lock B then Lock A

// thread A 
// thread B --> A then B 

// thread C which only needs A 
// thread D which only needs B