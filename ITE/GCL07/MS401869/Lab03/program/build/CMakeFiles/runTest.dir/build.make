# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /usr/src/project

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /usr/src/build

# Include any dependencies generated for this target.
include CMakeFiles/runTest.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/runTest.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/runTest.dir/flags.make

CMakeFiles/runTest.dir/hello_test.cc.o: CMakeFiles/runTest.dir/flags.make
CMakeFiles/runTest.dir/hello_test.cc.o: /usr/src/project/hello_test.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/usr/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/runTest.dir/hello_test.cc.o"
	/usr/local/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/runTest.dir/hello_test.cc.o -c /usr/src/project/hello_test.cc

CMakeFiles/runTest.dir/hello_test.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/runTest.dir/hello_test.cc.i"
	/usr/local/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /usr/src/project/hello_test.cc > CMakeFiles/runTest.dir/hello_test.cc.i

CMakeFiles/runTest.dir/hello_test.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/runTest.dir/hello_test.cc.s"
	/usr/local/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /usr/src/project/hello_test.cc -o CMakeFiles/runTest.dir/hello_test.cc.s

# Object files for target runTest
runTest_OBJECTS = \
"CMakeFiles/runTest.dir/hello_test.cc.o"

# External object files for target runTest
runTest_EXTERNAL_OBJECTS =

runTest: CMakeFiles/runTest.dir/hello_test.cc.o
runTest: CMakeFiles/runTest.dir/build.make
runTest: lib/libgtest_main.a
runTest: /usr/src/project/include/alg.h
runTest: /usr/src/project/src/alg.c
runTest: lib/libgtest.a
runTest: CMakeFiles/runTest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/usr/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable runTest"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/runTest.dir/link.txt --verbose=$(VERBOSE)
	/usr/bin/cmake -D TEST_TARGET=runTest -D TEST_EXECUTABLE=/usr/src/build/runTest -D TEST_EXECUTOR= -D TEST_WORKING_DIR=/usr/src/build -D TEST_EXTRA_ARGS= -D TEST_PROPERTIES= -D TEST_PREFIX= -D TEST_SUFFIX= -D NO_PRETTY_TYPES=FALSE -D NO_PRETTY_VALUES=FALSE -D TEST_LIST=runTest_TESTS -D CTEST_FILE=/usr/src/build/runTest[1]_tests.cmake -D TEST_DISCOVERY_TIMEOUT=5 -D TEST_XML_OUTPUT_DIR= -P /usr/share/cmake-3.18/Modules/GoogleTestAddTests.cmake

# Rule to build all files generated by this target.
CMakeFiles/runTest.dir/build: runTest

.PHONY : CMakeFiles/runTest.dir/build

CMakeFiles/runTest.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/runTest.dir/cmake_clean.cmake
.PHONY : CMakeFiles/runTest.dir/clean

CMakeFiles/runTest.dir/depend:
	cd /usr/src/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /usr/src/project /usr/src/project /usr/src/build /usr/src/build /usr/src/build/CMakeFiles/runTest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/runTest.dir/depend

