cmake_minimum_required(VERSION 3.8)
project(MyLibraryTests)

find_package(GTest MODULE REQUIRED)

if(NOT TARGET MyLibrary)
	find_package(MyLibrary CONFIG REQUIRED PATHS ../install/)
endif()
enable_testing()

add_executable(${PROJECT_NAME} test_myalgorithm.cpp)

target_link_libraries(${PROJECT_NAME}
	PRIVATE
		Dnae::MyLibrary
		GTest::Main
)

add_test(NAME MyLibrary.UnitTests
	COMMAND MyLibraryTests
)
