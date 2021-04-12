cmake_minimum_required(VERSION 3.14)

project(sharedTests LANGUAGES CXX)

include(../cmake/project-is-top-level.cmake)
include(../cmake/windows-set-path.cmake)

if(PROJECT_IS_TOP_LEVEL)
  find_package(shared REQUIRED)
  enable_testing()
endif()

add_executable(shared_test source/shared_test.cpp)
target_link_libraries(shared_test PRIVATE shared::shared)
target_compile_features(shared_test PRIVATE cxx_std_17)

add_test(NAME shared_test COMMAND shared_test)
windows_set_path(shared_test shared::shared)
