#include <string>

#include <shared/shared.h>

auto main() -> int
{
  exported_class e;

  return std::string("shared") == e.name() ? 0 : 1;
}
