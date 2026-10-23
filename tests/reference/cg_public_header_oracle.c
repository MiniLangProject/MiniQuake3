#include <stddef.h>
#include <stdio.h>
#define WIN32 1
#include "../../Quake-III-Arena-original-source/code/game/q_shared.h"
#include "../../Quake-III-Arena-original-source/code/cgame/cg_public.h"

int main(void) {
  printf("limits %d %d %d %d\n", CMD_BACKUP, CMD_MASK, MAX_ENTITIES_IN_SNAPSHOT, CGAME_IMPORT_API_VERSION);
  printf("events %d %d %d %d\n", CGAME_EVENT_NONE, CGAME_EVENT_TEAMMENU, CGAME_EVENT_SCOREBOARD, CGAME_EVENT_EDITHUD);
  printf("imports0 %d %d %d %d %d %d %d %d %d %d\n", CG_PRINT, CG_ARGS, CG_FS_FOPENFILE, CG_UPDATESCREEN, CG_CM_LOADMAP, CG_CM_MARKFRAGMENTS, CG_S_STARTSOUND, CG_S_STARTBACKGROUNDTRACK, CG_R_LOADWORLDMAP, CG_R_REGISTERSHADER);
  printf("imports1 %d %d %d %d %d %d %d %d %d %d\n", CG_R_CLEARSCENE, CG_R_LERPTAG, CG_GETGLCONFIG, CG_GETGAMESTATE, CG_GETSNAPSHOT, CG_GETUSERCMD, CG_R_REGISTERSHADERNOMIP, CG_MEMORY_REMAINING, CG_R_REGISTERFONT, CG_KEY_GETKEY);
  printf("imports2 %d %d %d %d %d %d %d %d %d %d\n", CG_PC_ADD_GLOBAL_DEFINE, CG_PC_SOURCE_FILE_AND_LINE, CG_S_STOPBACKGROUNDTRACK, CG_REAL_TIME, CG_SNAPVECTOR, CG_REMOVECOMMAND, CG_R_LIGHTFORPOINT, CG_CIN_PLAYCINEMATIC, CG_CIN_SETEXTENTS, CG_R_REMAP_SHADER);
  printf("imports3 %d %d %d %d %d %d %d %d %d %d\n", CG_S_ADDREALLOOPINGSOUND, CG_S_STOPLOOPINGSOUND, CG_CM_TEMPCAPSULEMODEL, CG_CM_CAPSULETRACE, CG_CM_TRANSFORMEDCAPSULETRACE, CG_R_ADDADDITIVELIGHTTOSCENE, CG_GET_ENTITY_TOKEN, CG_R_ADDPOLYSTOSCENE, CG_R_INPVS, CG_FS_SEEK);
  printf("builtins %d %d %d %d %d %d %d %d %d %d %d %d\n", CG_MEMSET, CG_MEMCPY, CG_STRNCPY, CG_SIN, CG_COS, CG_ATAN2, CG_SQRT, CG_FLOOR, CG_CEIL, CG_TESTPRINTINT, CG_TESTPRINTFLOAT, CG_ACOS);
  printf("exports %d %d %d %d %d %d %d %d %d\n", CG_INIT, CG_SHUTDOWN, CG_CONSOLE_COMMAND, CG_DRAW_ACTIVE_FRAME, CG_CROSSHAIR_PLAYER, CG_LAST_ATTACKER, CG_KEY_EVENT, CG_MOUSE_EVENT, CG_EVENT_HANDLING);
  printf("snapshot %u %u %u %u %u %u %u %u %u %u\n", (unsigned)sizeof(snapshot_t), (unsigned)offsetof(snapshot_t,snapFlags), (unsigned)offsetof(snapshot_t,ping), (unsigned)offsetof(snapshot_t,serverTime), (unsigned)offsetof(snapshot_t,areamask), (unsigned)offsetof(snapshot_t,ps), (unsigned)offsetof(snapshot_t,numEntities), (unsigned)offsetof(snapshot_t,entities), (unsigned)offsetof(snapshot_t,numServerCommands), (unsigned)offsetof(snapshot_t,serverCommandSequence));
  return 0;
}
