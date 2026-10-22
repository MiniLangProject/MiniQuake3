#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#define qboolean int
#define qtrue 1
#define qfalse 0
#define ERR_DROP 1
#define CMD_BACKUP 64
#define CMD_MASK 63
#define MAX_PARSE_ENTITIES 2048
typedef struct { int marker; } gameState_t;
typedef struct { int marker; } glconfig_t;
typedef struct { int serverTime,angles[3],buttons; unsigned char weapon; signed char forwardmove,rightmove,upmove; } usercmd_t;
typedef struct { int number; } entityState_t;
typedef struct { int messageNum,serverTime; } clSnapshot_t;
typedef struct { gameState_t gameState; int cmdNumber; usercmd_t cmds[CMD_BACKUP]; int parseEntitiesNum; entityState_t parseEntities[MAX_PARSE_ENTITIES]; clSnapshot_t snap; int cgameUserCmdValue; float cgameSensitivity; } active_t;
typedef struct { glconfig_t glconfig; } static_t;
static active_t cl;static static_t cls;
static void Com_Error(int code,const char *fmt,...) { (void)code;(void)fmt;exit(99); }
#include "cl_cgame_complete_under_test.inc"
int main(void) {
  gameState_t gs;glconfig_t gc;usercmd_t u;entityState_t e;int sn,st;
  cl.gameState.marker=23;cls.glconfig.marker=42;CL_GetGameState(&gs);CL_GetGlconfig(&gc);printf("copies|%d|%d\n",gs.marker,gc.marker);
  cl.cmdNumber=70;cl.cmds[69&63].serverTime=321;printf("cmd|%s|",CL_GetUserCmd(69,&u)?"true":"false");printf("%d|%s|%d\n",u.serverTime,CL_GetUserCmd(6,&u)?"true":"false",CL_GetCurrentCmdNumber());
  cl.parseEntitiesNum=2100;cl.parseEntities[2099&2047].number=77;printf("entity|%s|",CL_GetParseEntityState(2099,&e)?"true":"false");printf("%d|%s\n",e.number,CL_GetParseEntityState(52,&e)?"true":"false");
  cl.snap.messageNum=11;cl.snap.serverTime=2222;CL_GetCurrentSnapshotNumber(&sn,&st);printf("snapshot|%d|%d\n",sn,st);
  CL_SetUserCmdValue(9,1.25f);printf("set|%d|%d|%d\n",cl.cgameUserCmdValue,FloatAsInt(cl.cgameSensitivity),FloatAsInt(-0.0f));return 0;
}
