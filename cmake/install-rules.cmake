if(PROJECT_IS_TOP_LEVEL)
  set(CMAKE_INSTALL_INCLUDEDIR include/shared CACHE PATH "")
endif()

include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

install(
    DIRECTORY
    "${PROJECT_SOURCE_DIR}/include/"
    "${PROJECT_BINARY_DIR}/include/"
    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
    COMPONENT shared_Development
)

install(
    TARGETS shared_shared
    EXPORT sharedTargets
    RUNTIME #
    COMPONENT shared_Runtime
    LIBRARY #
    COMPONENT shared_Runtime
    NAMELINK_COMPONENT shared_Development
    ARCHIVE #
    COMPONENT shared_Development
    INCLUDES #
    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
)

write_basic_package_version_file(
    sharedConfigVersion.cmake
    COMPATIBILITY SameMajorVersion
)

set(
    shared_INSTALL_CMAKEDIR "${CMAKE_INSTALL_LIBDIR}/cmake/shared"
    CACHE STRING "CMake package config location relative to the install prefix"
)

mark_as_advanced(shared_INSTALL_CMAKEDIR)

install(
    FILES
    "${PROJECT_SOURCE_DIR}/cmake/sharedConfig.cmake"
    "${PROJECT_BINARY_DIR}/sharedConfigVersion.cmake"
    DESTINATION "${shared_INSTALL_CMAKEDIR}"
    COMPONENT shared_Development
)

install(
    EXPORT sharedTargets
    NAMESPACE shared::
    DESTINATION "${shared_INSTALL_CMAKEDIR}"
    COMPONENT shared_Development
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
