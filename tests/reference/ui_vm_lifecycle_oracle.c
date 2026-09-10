#include <stdio.h>
#include "q_shared.h"
#include "ui_public.h"
int main(void) {
  printf("%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d\n",
    UI_GETAPIVERSION,UI_INIT,UI_SHUTDOWN,UI_KEY_EVENT,UI_MOUSE_EVENT,UI_REFRESH,
    UI_IS_FULLSCREEN,UI_SET_ACTIVE_MENU,UI_CONSOLE_COMMAND,UI_DRAW_CONNECT_SCREEN,
    UI_HASUNIQUECDKEY,KEYCATCH_UI,CA_AUTHORIZING,CA_ACTIVE);
  return 0;
}
