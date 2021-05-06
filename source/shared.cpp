#include <string>

#include <shared/shared.h>

exported_class::exported_class() : name_("shared") {}

const char* exported_class::name() {
  return name_.c_str();
}
