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

# 添加 libevent 目录（如果目录已经存在，跳过此步骤）
if(NOT TARGET event_core)
    add_subdirectory(${libevent_SOURCE_DIR} ${libevent_BINARY_DIR})
endif()

add_executable(testlibevent src/libevent.cpp)
target_link_libraries(testlibevent PRIVATE event event_core event_extra)
# 添加自定义命令，复制 DLL 文件到可执行文件目录

# 添加自定义命令，复制共享库文件到可执行文件目录
if(WIN32)
    set(LIBEVENTDLL ${libevent_BINARY_DIR}/bin/Debug/event.dll)
    set(LIBEVENT_CORE_DLL ${libevent_BINARY_DIR}/bin/Debug/event_core.dll)
    set(LIBEVENT_EXTRA_DLL ${libevent_BINARY_DIR}/bin/Debug/event_extra.dll)
elseif(APPLE)
    set(LIBEVENTDLL ${libevent_BINARY_DIR}/Debug/event.dylib)
    set(LIBEVENT_CORE_DLL ${libevent_BINARY_DIR}/libevent_core.dylib)
    set(LIBEVENT_EXTRA_DLL ${libevent_BINARY_DIR}/libevent_extra.dylib)
else()
    set(LIBEVENTDLL ${libevent_BINARY_DIR}/Debug/event.so)
    set(LIBEVENT_CORE_DLL ${libevent_BINARY_DIR}/libevent_core.so)
    set(LIBEVENT_EXTRA_DLL ${libevent_BINARY_DIR}/libevent_extra.so)
endif()

add_custom_command(TARGET testlibevent POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
        ${LIBEVENT_DLL}
        $<TARGET_FILE_DIR:testlibevent>)
add_custom_command(TARGET testlibevent POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
        ${LIBEVENT_CORE_DLL}
        $<TARGET_FILE_DIR:testlibevent>)

add_custom_command(TARGET testlibevent POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
        ${LIBEVENT_EXTRA_DLL}
        $<TARGET_FILE_DIR:testlibevent>)
