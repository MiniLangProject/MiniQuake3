#include <stddef.h>
#include <stdio.h>
#include "q_shared.h"
#include "cg_public.h"
#include "tr_types.h"

int main(void) {
  printf("abi|%d|%u|%u|%u|%u\n", CGAME_IMPORT_API_VERSION,
    (unsigned)sizeof(gameState_t), (unsigned)sizeof(snapshot_t),
    (unsigned)sizeof(usercmd_t), (unsigned)sizeof(glconfig_t));
  printf("client|%d|%d|%d|%d|%d|%d|%d|%d\n",
    CG_GETGAMESTATE, CG_GETCURRENTSNAPSHOTNUMBER, CG_GETSNAPSHOT,
    CG_GETSERVERCOMMAND, CG_GETCURRENTCMDNUMBER, CG_GETUSERCMD,
    CG_SETUSERCMDVALUE, CG_MEMORY_REMAINING);
  printf("render|%d|%d|%d|%d|%d|%d|%d\n",
    CG_R_LOADWORLDMAP, CG_R_REGISTERMODEL, CG_R_REGISTERSKIN,
    CG_R_REGISTERSHADER, CG_R_REGISTERSHADERNOMIP, CG_R_CLEARSCENE,
    CG_GETGLCONFIG);
  printf("command|%d|%d|%d|%d\n", CG_ADDCOMMAND,
    CG_REMOVECOMMAND, CG_SENDCLIENTCOMMAND, CG_UPDATESCREEN);
  return 0;
}
