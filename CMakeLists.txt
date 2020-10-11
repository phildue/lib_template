cmake_minimum_required(VERSION 3.8)
project(MyLibrary VERSION 0.0.1)
include(tools/Macros.cmake)

# Dependencies
find_package( OpenCV REQUIRED )


set(sources
		src/MyLibrary/MyAlgorithm/MyAlgorithm.cpp
		)

set(headers
		src/MyLibrary/MyAlgorithm/MyAlgorithm.h
		src/MyLibrary/MyLibrary.h
		)

dnae_setup_library(${PROJECT_NAME} ${PROJECT_VERSION} ${sources} ${headers})

target_link_libraries(${PROJECT_NAME} ${OpenCV_LIBS})
# Add tests
add_subdirectory(test)



