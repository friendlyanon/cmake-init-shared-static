#include <string>

#include <shared/shared.h>

int main() {
  exported_class e;

  return std::string("shared") == e.name() ? 0 : 1;
}
