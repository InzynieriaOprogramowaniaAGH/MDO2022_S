cmake_minimum_required(VERSION 3.14)
project(myApp VERSION 0.1.0)


set(CMAKE_CXX_STANDART 17)

include(FetchContent)
FetchContent_Declare(
    googletest
    URL https://github.com/google/googletest/archive/609281088cfefc76f9d0ce82e1ff6c30cc3591e5.zip
)
set(getst_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

enable_testing()
file(GLOB source001
    "include/*.h"
    "src/*.c")
set(SOURCES ${source001})

add_executable(runTest hello_test.cc)
target_link_libraries(
	runTest
	gtest_main
	${SOURCES}
)

include(GoogleTest)
gtest_discover_tests(runTest)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})

