#include <string>

#include <shared/shared.h>

exported_class::exported_class() : name_("shared") {}

std::string exported_class::name() {
  return name_;
}
