cmake_minimum_required(VERSION 3.12)
project(testlibevent)

add_executable(testlibevent src/libevent.cpp)
# 链接libevent库
find_package(libevent REQUIRED)
target_link_libraries(testlibevent PRIVATE libevent::core)
