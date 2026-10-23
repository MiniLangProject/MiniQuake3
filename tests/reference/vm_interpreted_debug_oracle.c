#include <stdarg.h>
#include <stdio.h>
#include <string.h>

typedef struct {
  int callLevel;
  unsigned char *dataBase;
} vm_t;

static char symbolText[32];

char *VM_ValueToSymbol(vm_t *vm, int value) {
  (void)vm;
  sprintf_s(symbolText, sizeof(symbolText), "sym:%d", value);
  return symbolText;
}

void Com_Printf(const char *format, ...) {
  va_list args;
  va_start(args, format);
  vprintf(format, args);
  va_end(args);
}

#include "vm_interpreted_debug_under_test.inc"

static void put32(unsigned char *data, int offset, int value) {
  memcpy(data + offset, &value, sizeof(value));
}

int main(void) {
  unsigned char data[128] = {0};
  vm_t vm = {0, data};
  const int levels[] = {0, 1, 5, 20, 21};
  int index;
  for (index = 0; index < 5; ++index) {
    vm.callLevel = levels[index];
    printf("indent:%d:[%s]\n", levels[index], VM_Indent(&vm));
  }
  put32(data, 20, 32);
  put32(data, 32, 200);
  put32(data, 36, 48);
  put32(data, 48, -1);
  VM_StackTrace(&vm, 100, 16);
  return 0;
}
