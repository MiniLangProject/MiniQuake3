#include <stdio.h>
#include "client.h"
#include "ui_public.h"

int main(void) {
  printf("sound|%d|%d|%d|%d\n", UI_S_REGISTERSOUND,
    UI_S_STARTLOCALSOUND, UI_S_STOPBACKGROUNDTRACK,
    UI_S_STARTBACKGROUNDTRACK);
  printf("platform|%d|%d|%d|%d|%d|%u\n", UI_GET_CDKEY,
    UI_SET_CDKEY, UI_REAL_TIME, UI_VERIFY_CDKEY, UI_FS_SEEK,
    (unsigned)sizeof(qtime_t));
  printf("cinematic|%d|%d|%d|%d|%d\n", UI_CIN_PLAYCINEMATIC,
    UI_CIN_STOPCINEMATIC, UI_CIN_RUNCINEMATIC,
    UI_CIN_DRAWCINEMATIC, UI_CIN_SETEXTENTS);
  printf("renderer|%d\n", UI_R_REMAP_SHADER);
  printf("compat|%d\n", UI_SET_PBCLSTATUS);
  return 0;
}
