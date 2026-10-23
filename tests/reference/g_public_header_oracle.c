#include <stdio.h>
#define WIN32 1
#include "../../Quake-III-Arena-original-source/code/game/q_shared.h"
#include "../../Quake-III-Arena-original-source/code/game/g_public.h"
int main(void) {
  printf("api %d\n", GAME_API_VERSION);
  printf("flags %d %d %d %d %d %d %d %d %d %d\n", SVF_NOCLIENT, SVF_CLIENTMASK, SVF_BOT, SVF_BROADCAST, SVF_PORTAL, SVF_USE_CURRENT_ORIGIN, SVF_SINGLECLIENT, SVF_NOSERVERINFO, SVF_CAPSULE, SVF_NOTSINGLECLIENT);
  printf("imports %d %d %d %d %d %d %d %d\n", G_PRINT, G_FS_SEEK, BOTLIB_SETUP, BOTLIB_USER_COMMAND, BOTLIB_AAS_ENABLE_ROUTING_AREA, BOTLIB_EA_SAY, BOTLIB_AI_LOAD_CHARACTER, BOTLIB_PC_SOURCE_FILE_AND_LINE);
  printf("exports %d %d %d %d %d %d %d %d %d %d %d\n", GAME_INIT, GAME_SHUTDOWN, GAME_CLIENT_CONNECT, GAME_CLIENT_BEGIN, GAME_CLIENT_USERINFO_CHANGED, GAME_CLIENT_DISCONNECT, GAME_CLIENT_COMMAND, GAME_CLIENT_THINK, GAME_RUN_FRAME, GAME_CONSOLE_COMMAND, BOTAI_START_FRAME);
  printf("sizes %u %u\n", (unsigned)sizeof(entityShared_t), (unsigned)sizeof(sharedEntity_t));
  return 0;
}
