cmake_minimum_required(VERSION 3.21.0)
project(example VERSION 0.0.0.0)
list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")


option(TEST_COVERAGE "Enable test code coverage" OFF)


add_executable(example main.cpp)
target_link_libraries(example
    PRIVATE
        $<$<BOOL:TEST_COVERAGE>:${CLANG_RT_LIB}>)


if(TEST_COVERAGE)
    include(Coverage)
    AddCoverage(example)
endif()

