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
set(EVENT__DISABLE_OPENSSL ON)
# 设置输出目录
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
add_executable(testlibevent src/libevent.cpp)
target_link_libraries(testlibevent PRIVATE event event_core event_extra)
# 添加自定义命令，复制 DLL 文件到可执行文件目录
add_custom_command(TARGET testlibevent POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
        $<TARGET_FILE:event>
        $<TARGET_FILE_DIR:testlibevent>)
