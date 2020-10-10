//
// Created by phil on 10.10.20.
//

#include <gtest/gtest.h>
#include "MyLibrary/MyLibrary.h"
using namespace testing;
using namespace dnae;
using namespace dnae::MyLibrary;
TEST(MyAlgorithmUnit,Compute)
{
    MyAlgorithm myAlgorithm;
    
    EXPECT_EQ(2,myAlgorithm.compute(1));
}