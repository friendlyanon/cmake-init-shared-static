#include <shared/shared.h>

int main() {
  exported_class e;

  return e.name() == "shared" ? 0 : 1;
}
