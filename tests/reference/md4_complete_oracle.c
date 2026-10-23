#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void Com_Memset(void *dest, const int val, const size_t count) { memset(dest, val, count); }
void Com_Memcpy(void *dest, const void *src, const size_t count) { memcpy(dest, src, count); }

#include "md4_under_test.inc"

static void dump_bytes(const unsigned char *value, int length) {
  int index;
  for (index = 0; index < length; ++index) printf("%02x", value[index]);
  putchar('\n');
}

int main(void) {
  UINT4 words[4] = { 0, 0x12345678UL, 0x89abcdefUL, 0xffffffffUL };
  UINT4 decoded[4] = { 0 };
  unsigned char encoded[16] = { 0 };
  int index;
  Encode(encoded, words, 16);
  dump_bytes(encoded, 16);
  Decode(decoded, encoded, 16);
  for (index = 0; index < 4; ++index) printf("%08lx%s", decoded[index], index == 3 ? "\n" : ",");
  Encode(encoded, words + 1, 8);
  dump_bytes(encoded, 8);
  return 0;
}
