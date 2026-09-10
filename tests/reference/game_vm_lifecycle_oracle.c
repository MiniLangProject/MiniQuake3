// Compile directly against the unchanged Baseq3 public game ABI.
#include <stdio.h>
#include "q_shared.h"
#include "g_public.h"
int main(void) {
  printf("%d|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d\n",
    GAME_INIT,GAME_SHUTDOWN,GAME_CLIENT_CONNECT,GAME_CLIENT_BEGIN,
    GAME_CLIENT_USERINFO_CHANGED,GAME_CLIENT_DISCONNECT,GAME_CLIENT_COMMAND,
    GAME_CLIENT_THINK,GAME_RUN_FRAME,GAME_CONSOLE_COMMAND,BOTAI_START_FRAME);
  return 0;
}
