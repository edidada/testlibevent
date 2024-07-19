cmake_minimum_required(VERSION 3.12)
project(testlibevent)

# 拉取并以库的形式添加libevent
include(FetchContent)
FetchContent_Declare(
        libevent
        GIT_REPOSITORY    https://github.com/libevent/libevent.git
        GIT_TAG           release-2.1.12-stable
        SOURCE_DIR        ${CMAKE_CURRENT_SOURCE_DIR}/cmake_third_party/libevent
)
FetchContent_MakeAvailable(libevent)
add_executable(testlibevent src/libevent.cpp)
find_package(Libevent CONFIG REQUIRED)
target_link_libraries(testlibevent PRIVATE libevent::core libevent::extra)