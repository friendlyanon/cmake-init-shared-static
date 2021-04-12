#pragma once

#include <string>

#include <shared/shared_export.h>

class SHARED_EXPORT exported_class {
public:
  exported_class();

  std::string name();

private:
  std::string name_;
};
