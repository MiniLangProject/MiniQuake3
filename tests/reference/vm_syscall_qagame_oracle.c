#include <stddef.h>
#include <stdio.h>
#include "q_shared.h"
#include "g_public.h"

int main(void) {
  printf("abi|%d|%u|%u|%u\n", GAME_API_VERSION,
    (unsigned)sizeof(qboolean),(unsigned)sizeof(vec3_t),(unsigned)sizeof(float));
  printf("state|%d|%d|%d|%d|%d|%d|%d|%d|%d\n",
    G_LOCATE_GAME_DATA,G_DROP_CLIENT,G_SEND_SERVER_COMMAND,G_SET_CONFIGSTRING,
    G_GET_CONFIGSTRING,G_GET_USERINFO,G_SET_USERINFO,G_GET_SERVERINFO,G_SET_BRUSH_MODEL);
  printf("world|%d|%d|%d|%d|%d|%d|%d|%d|%d\n",
    G_IN_PVS,G_IN_PVS_IGNORE_PORTALS,G_ADJUST_AREA_PORTAL_STATE,G_AREAS_CONNECTED,
    G_LINKENTITY,G_UNLINKENTITY,G_BOT_ALLOCATE_CLIENT,G_BOT_FREE_CLIENT,G_GET_ENTITY_TOKEN);
  return 0;
}
