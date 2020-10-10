function(dnae_setup_library name version sources headers)

    # Construct library from sources
    add_library(${name}
            ${sources}
            ${headers}
            )

    # Configure alias so there is no difference whether we link from source/from already built
    add_library(Dnae::${name} ALIAS ${name})

    # Set target features
    target_compile_features(${name} PUBLIC cxx_std_14)

    # Set include path (can be different in build/install)
    target_include_directories(${name} PUBLIC
            $<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/include>
            $<INSTALL_INTERFACE:include>
            )
    # Install everything a user of the library needs
    install(TARGETS ${name} EXPORT ${PROJECT_NAME}Targets
            LIBRARY DESTINATION lib
            ARCHIVE DESTINATION lib
            RUNTIME DESTINATION bin
            INCLUDES DESTINATION include
            )

    install(EXPORT ${name}Targets
            DESTINATION lib/cmake/${name}
            FILE ${name}Targets.cmake
            NAMESPACE Dnae::
            DESTINATION lib/cmake/${name}
            )

    install(DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/include/${name}
            DESTINATION include)

    include(CMakePackageConfigHelpers)

    write_basic_package_version_file(${name}ConfigVersion.cmake
            VERSION ${version}
            COMPATIBILITY SameMajorVersion
            )

    install(FILES ${CMAKE_CURRENT_LIST_DIR}/cmake/${name}Config.cmake ${CMAKE_CURRENT_BINARY_DIR}/${name}ConfigVersion.cmake
            DESTINATION lib/cmake/${name})
endfunction()

function(dnae_setup_tests target_name test_sources)
    find_package(GTest MODULE REQUIRED)

    if(NOT TARGET ${target_name})
        find_package(${target_name} CONFIG REQUIRED PATHS ../install/)
    endif()

    add_executable(${target_name}Tests ${test_sources})

    target_link_libraries(${target_name}Tests
            PRIVATE
            Dnae::${target_name}
            GTest::Main
            )

    add_test(NAME ${target_name}.UnitTests
            COMMAND ${target_name}Tests
            )
endfunction()