#include <stdio.h>
#include <string.h>
#include "q_shared.h"
#include "cg_public.h"

#define MAX_KEYS 256
typedef struct { int down; const char *binding; } key_t;
static key_t keys[MAX_KEYS];
static int catcher;

static int Key_IsDown(int keynum) {
  if (keynum < 0 || keynum >= MAX_KEYS) return 0;
  return keys[keynum].down;
}
static int Key_GetCatcher(void) { return catcher; }
static void Key_SetCatcher(int value) { catcher = value; }
static int Key_GetKey(const char *binding) {
  int i;
  if (!binding) return -1;
  for (i = 0; i < MAX_KEYS; i++) {
    if (keys[i].binding && !_stricmp(binding, keys[i].binding)) return i;
  }
  return -1;
}

int main(void) {
  printf("abi|%d|%d|%d|%d|%d\n", CG_KEY_ISDOWN, CG_KEY_GETCATCHER,
    CG_KEY_SETCATCHER, CG_KEY_GETKEY, MAX_KEYS);
  keys[13].down = 1;
  printf("down|%d|%d|%d\n", Key_IsDown(13), Key_IsDown(12), Key_IsDown(256));
  printf("catcher|%d|0|", Key_GetCatcher()); Key_SetCatcher(5);
  printf("%d\n", Key_GetCatcher());
  keys[178].binding = "+attack"; keys[32].binding = "+moveup";
  printf("binding|%d|%d\n", Key_GetKey("+ATTACK"), Key_GetKey("missing"));
  keys[15].binding = "+attack";
  printf("first|%d\n", Key_GetKey("+ATTACK"));
  keys[200].binding = "";
  printf("empty|%d\n", Key_GetKey(""));
  return 0;
}
