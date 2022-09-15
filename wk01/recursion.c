#include <stdio.h>

// factorial 
// 3! =     3 * 2 * 1 = 6
// 4! = 4 * 3 * 2 * 1 = 24
//      4 * 3!
// n! = n * (n - 1)!
// 0! = 1


// n = 4 -> 24




int factorial(int n) {
    // base case
    if (n == 0) {
        return 1;
    }
    // recursive case / general case / inductive case
    return n * factorial(n - 1);
    //return n;
}

int main(void)
{
    printf("The factorial of 4 is: %d\n", factorial(4));
    return 0;
}
