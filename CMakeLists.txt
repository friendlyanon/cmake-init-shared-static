cmake_minimum_required(VERSION 3.14)

include(cmake/in-source-guard.cmake)

project(
    shared
    VERSION 0.1.0
    DESCRIPTION "Short description"
    HOMEPAGE_URL "https://example.com/"
    LANGUAGES CXX
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(
    shared_shared
    source/shared.cpp
)
add_library(shared::shared ALIAS shared_shared)

include(GenerateExportHeader)
generate_export_header(
    shared_shared
    BASE_NAME shared
    EXPORT_FILE_NAME include/shared/shared_export.h
)

if(NOT BUILD_SHARED_LIBS)
  target_compile_definitions(shared_shared PUBLIC SHARED_STATIC_DEFINE)
endif()

set_target_properties(
    shared_shared PROPERTIES
    CXX_VISIBILITY_PRESET hidden
    VISIBILITY_INLINES_HIDDEN YES
    VERSION "${PROJECT_VERSION}"
    SOVERSION "${PROJECT_VERSION_MAJOR}"
    EXPORT_NAME shared
    OUTPUT_NAME shared
)

target_include_directories(
    shared_shared
    ${shared_warning_guard}
    PUBLIC
    "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>"
    "$<BUILD_INTERFACE:${PROJECT_BINARY_DIR}/include>"
)

target_compile_features(shared_shared PUBLIC cxx_std_17)

# ---- Install rules ----

include(cmake/install-rules.cmake)

# ---- Developer mode ----

if(NOT shared_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of shared"
  )
endif()

include(CTest)
if(BUILD_TESTING)
  add_subdirectory(test)
endif()
