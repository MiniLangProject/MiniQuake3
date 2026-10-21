#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include "q_shared.h"
#include "cg_public.h"

int main(void) {
  pc_token_t token;
  unsigned floatBits;
  memset(&token, 0, sizeof(token));
  token.type = TT_NUMBER;
  token.subtype = 0x1008;
  token.intvalue = -42;
  token.floatvalue = 3.5f;
  strcpy(token.string, "answer");
  memcpy(&floatBits, &token.floatvalue, sizeof(floatBits));
  printf("abi|%d|%d|%d|%d|%d\n", CG_PC_ADD_GLOBAL_DEFINE,
    CG_PC_LOAD_SOURCE, CG_PC_FREE_SOURCE, CG_PC_READ_TOKEN,
    CG_PC_SOURCE_FILE_AND_LINE);
  printf("layout|%u|%u|%u|%u|%u|%u\n", (unsigned)sizeof(token),
    (unsigned)offsetof(pc_token_t, type), (unsigned)offsetof(pc_token_t, subtype),
    (unsigned)offsetof(pc_token_t, intvalue), (unsigned)offsetof(pc_token_t, floatvalue),
    (unsigned)offsetof(pc_token_t, string));
  printf("token|%d|%d|%d|%u|%s\n", token.type, token.subtype,
    token.intvalue, floatBits, token.string);
  return 0;
}
