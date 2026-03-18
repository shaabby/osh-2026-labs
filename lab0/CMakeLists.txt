cmake_minimum_required(VERSION 3.10)
project(lab0 CXX)
set(PROJECT_NAME bubble_sort)
# 添加源文件
add_executable(${PROJECT_NAME} main.cpp bubblesort.cpp bubblesort.hpp)

target_include_directories(${PROJECT_NAME} PRIVATE ${PROJECT_SOURCE_DIR})

# 设置 C++ 标准
set(CMAKE_CXX_STANDARD 23)

add_compile_definitions(DEBUG_BUBBLE)