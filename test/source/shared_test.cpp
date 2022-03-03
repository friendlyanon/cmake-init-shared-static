#include <string>

#include "shared/shared.hpp"
auto main() -> int
{
  exported_class e;

  return std::string("shared") == e.name() ? 0 : 1;
}
