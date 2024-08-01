cmake_minimum_required(VERSION 3.10)
project(testlibevent)

find_package(Libevent CONFIG REQUIRED)
add_executable(libeventmain src/libeventmain.c)
target_link_libraries(libeventmain PRIVATE libevent::core libevent::extra libevent::pthreads)

add_subdirectory(src/sample)