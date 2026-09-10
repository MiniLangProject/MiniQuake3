#include <stdio.h>
#include "q_shared.h"
#include "cg_public.h"
int main(void) {
  printf("%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d\n",
    CG_INIT,CG_SHUTDOWN,CG_CONSOLE_COMMAND,CG_DRAW_ACTIVE_FRAME,
    CG_CROSSHAIR_PLAYER,CG_LAST_ATTACKER,CG_KEY_EVENT,CG_MOUSE_EVENT,
    CG_EVENT_HANDLING,CA_LOADING,CA_PRIMED,KEYCATCH_CGAME);
  return 0;
}
