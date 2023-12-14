cmake_minimum_required(VERSION 3.12)
project(testlibevent)

add_executable(testlibevent src/libevent.cpp)

target_link_libraries(testlibevent libevent)
