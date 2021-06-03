#include <string>

#include <shared/shared.h>

exported_class::exported_class()
    : name_("shared")
{
}

auto exported_class::name() -> const char*
{
  return name_.c_str();
}
