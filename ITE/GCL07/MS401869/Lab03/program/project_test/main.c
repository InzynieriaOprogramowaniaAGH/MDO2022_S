#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <unistd.h>
#include "include/alg.h"

static const facNumber nToCompare = 1e4;
static const unsigned int loopN = 1e5;
int main() {
    double time;

    facNumber n = 3;
    printf("[loop]%d! = %d\n", n, factorialRec(n));
    printf("[rec ]%d! = %d\n", n, factorialRec(n));

    time = clock();
    for (int i = 0; i < loopN; i++)
        factorialLoop(nToCompare);
    time = (double)(clock() - time) / CLOCKS_PER_SEC;
    printf("time = %.10lf\n", time);

    time = clock();
    for (int i = 0; i < loopN; i++)
        factorialRec(nToCompare);
    time = (double)(clock() - time) / CLOCKS_PER_SEC;
    printf("time = %.10lf\n", time);

    return 0;
}

