 #include "../include/alg.h"

facNumber factorialLoop(facNumber n) {
    facNumber prod = 1;
    while(1) {
        if (n == 0) return prod;
        prod *= n--;
    }
}

facNumber factorialRec(facNumber n) {
    if (n == 0) return 1;
    return (n * factorialRec(n - 1));
}