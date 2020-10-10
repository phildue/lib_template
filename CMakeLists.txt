cmake_minimum_required(VERSION 3.8)
project(MyLibrary VERSION 0.0.1)

# Construct library from sources
add_library(${PROJECT_NAME}
		src/MyLibrary/MyAlgorithm.cpp
		include/MyLibrary/MyAlgorithm.h
		include/MyLibrary/MyLibrary.h)

# Set target features
target_compile_features(MyLibrary PUBLIC cxx_std_14)

# Set include path (can be different in build/install)
target_include_directories(MyLibrary PUBLIC
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
)

# Configure alias so there is no difference whether we link from source/from already built
add_library(Dnae::${PROJECT_NAME} ALIAS ${PROJECT_NAME})

# Add tests
add_subdirectory(test)

# Install everything a user of the library needs
install(TARGETS ${PROJECT_NAME} EXPORT ${PROJECT_NAME}Targets
		LIBRARY DESTINATION lib
		ARCHIVE DESTINATION lib
		RUNTIME DESTINATION bin
		INCLUDES DESTINATION include
		)

install(EXPORT ${PROJECT_NAME}Targets
		DESTINATION lib/cmake/${PROJECT_NAME}
		FILE ${PROJECT_NAME}Targets.cmake
		NAMESPACE Dnae::
		DESTINATION lib/cmake/${PROJECT_NAME}
		)

install(DIRECTORY include/${PROJECT_NAME}
		DESTINATION include)

include(CMakePackageConfigHelpers)

write_basic_package_version_file(${PROJECT_NAME}ConfigVersion.cmake
		VERSION ${PROJECT_VERSION}
		COMPATIBILITY SameMajorVersion
		)

install(FILES ${PROJECT_NAME}Config.cmake ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
		DESTINATION lib/cmake/${PROJECT_NAME})

