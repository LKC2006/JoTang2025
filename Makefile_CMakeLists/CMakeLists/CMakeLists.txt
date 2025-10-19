cmake_minimum_required (VERSION 3.18.4)

project(primera)

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)

aux_source_directory (lib SRC)

set(SOURCES ${SRC} hello.c)

include_directories(include)

add_executable(hello ${SOURCES})
