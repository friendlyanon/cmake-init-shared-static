#include <string>

#include "shared/shared.hpp"

auto main() -> int
{
  auto const exported = exported_class {};

  return std::string("shared") == exported.name() ? 0 : 1;
}
