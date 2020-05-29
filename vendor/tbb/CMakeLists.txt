CMAKE_MINIMUM_REQUIRED(VERSION 3.0)

include(ExternalProject)

ExternalProject_Add(tbb
        URL "https://github.com/01org/tbb/archive/2018_U1.tar.gz"
        PREFIX ${CMAKE_CURRENT_BINARY_DIR}
        BUILD_IN_SOURCE 1
        UPDATE_COMMAND ""
        CONFIGURE_COMMAND ""
        BUILD_COMMAND make compiler=gcc std=c++11
        INSTALL_COMMAND ""
        )

set(TBB_INCLUDE_DIRS ${CMAKE_CURRENT_BINARY_DIR}/src/tbb/include PARENT_SCOPE)
set(TBB_LINK_DIRS
        ${CMAKE_CURRENT_BINARY_DIR}/src/tbb/build/
        PARENT_SCOPE)
set(TBB_LIBRARIES
        ${CMAKE_CURRENT_BINARY_DIR}/src/tbb/build/libtbb.so
        PARENT_SCOPE)

set(TBB_BUILD_ROOT ${CMAKE_CURRENT_BINARY_DIR}/src/tbb)
message(${TBB_BUILD_ROOT})
add_custom_command(TARGET tbb POST_BUILD
        COMMAND sh ${CMAKE_SOURCE_DIR}/vendor/tbb/cp_files.sh ${TBB_BUILD_ROOT}
        WORKING_DIRECTORY ${TBB_BUILD_ROOT}
        )