cmake_minimum_required(VERSION 3.14)

include(cmake/prelude.cmake)

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
    EXPORT_FILE_NAME export/shared/shared_export.hpp
    CUSTOM_CONTENT_FROM_VARIABLE pragma_suppress_c4251
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
    shared_shared ${warning_guard}
    PUBLIC
    "\$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>"
)

target_include_directories(
    shared_shared SYSTEM
    PUBLIC
    "\$<BUILD_INTERFACE:${PROJECT_BINARY_DIR}/export>"
)

target_compile_features(shared_shared PUBLIC cxx_std_17)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT shared_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of shared"
  )
endif()

include(cmake/dev-mode.cmake)
