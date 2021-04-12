# ---- Developer mode ----

if(PROJECT_IS_TOP_LEVEL)
  option(shared_DEVELOPER_MODE "Enable developer mode" OFF)
  option(BUILD_SHARED_LIBS "Build shared libs." OFF)
  if("$ENV{CI}")
    set(shared_DEVELOPER_MODE ON CACHE INTERNAL "")
  endif()
endif()

# ---- Warning guard ----

if(NOT PROJECT_IS_TOP_LEVEL)
  option(
      shared_INCLUDE_WITHOUT_SYSTEM
      "Enable shared's warnings for dependents"
      OFF
  )
endif()
set(shared_warning_guard SYSTEM)
if(PROJECT_IS_TOP_LEVEL OR shared_INCLUDE_WITHOUT_SYSTEM)
  set(shared_warning_guard "")
endif()
