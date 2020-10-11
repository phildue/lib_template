cmake_minimum_required(VERSION 3.8)
project(MyLibrary)
include(../tools/Macros.cmake)

enable_testing()

dnae_setup_tests(${PROJECT_NAME}
		test_myalgorithm.cpp
		test_myalgorithmb.cpp)