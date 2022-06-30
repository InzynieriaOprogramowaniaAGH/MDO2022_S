#include <gtest/gtest.h>
#include "include/alg.h"

TEST(factorialLoopTest, HandleZeroInput) {
    EXPECT_EQ(factorialLoop(0), 1);
}

TEST(factorialLoopTest, HandlePositiveInput) {
    EXPECT_EQ(factorialLoop(1), 1);
    EXPECT_EQ(factorialLoop(2), 2);
    EXPECT_EQ(factorialLoop(3), 6);
    EXPECT_EQ(factorialLoop(4), 24);
}

TEST(factorialRecTest, HandleZeroInput) {
    EXPECT_EQ(factorialRec(0), 1);
}

TEST(factorialRecTest, HandlePositiveInput) {
    EXPECT_EQ(factorialRec(1), 1);
    EXPECT_EQ(factorialRec(2), 2);
    EXPECT_EQ(factorialRec(3), 6);
    EXPECT_EQ(factorialRec(4), 24);
}