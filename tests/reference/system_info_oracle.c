/* Deterministic host for the unchanged Baseq3 CL_SystemInfoChanged body. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "q_shared.h"

typedef struct { gameState_t gameState; int serverId; } clientActive_t;
typedef struct { qboolean demoplaying; } clientConnection_t;
static clientActive_t cl;
static clientConnection_t clc;
int cl_connectedToPureServer;

typedef struct { char key[128]; char value[256]; } localCvar_t;
static localCvar_t vars[64]; static int varCount;
static char events[4096];

static int same(const char *a,const char *b) {
  while (*a && *b) { if (tolower((unsigned char)*a++) != tolower((unsigned char)*b++)) return 0; }
  return *a == *b;
}
int Q_stricmp(const char *a,const char *b) { return _stricmp(a,b); }
static const char *getvar(const char *key) {
  int i; for (i=0;i<varCount;i++) if (same(vars[i].key,key)) return vars[i].value; return "";
}
static void putvar(const char *key,const char *value) {
  int i; for (i=0;i<varCount;i++) if (same(vars[i].key,key)) break;
  if (i==varCount) { strncpy(vars[i].key,key,127); vars[i].key[127]=0; varCount++; }
  strncpy(vars[i].value,value,255); vars[i].value[255]=0;
}
static void append(const char *kind,const char *a,const char *b) {
  strcat(events,kind); if (a) strcat(events,a); if (b) { strcat(events,"="); strcat(events,b); } strcat(events,";");
}
void Cvar_SetCheatState(void) { append("cheats",0,0); }
void FS_PureServerSetLoadedPaks(const char *paks,const char *names) { append("loaded:",paks,names); }
void FS_PureServerSetReferencedPaks(const char *paks,const char *names) { append("referenced:",paks,names); }
void Cvar_Set(const char *key,const char *value) { putvar(key,value); append("set:",key,value); }
const char *Cvar_VariableString(const char *key) { return getvar(key); }
float Cvar_VariableValue(const char *key) { return (float)atof(getvar(key)); }
void Com_Error(int code,const char *fmt,...) { (void)code;(void)fmt;abort(); }

#include "system_info_support_under_test.inc"
#include "system_info_under_test.inc"

static void reset(const char *fsGame,int connected) {
  memset(&cl,0,sizeof(cl)); memset(&clc,0,sizeof(clc)); memset(vars,0,sizeof(vars));
  varCount=0; events[0]=0; cl_connectedToPureServer=connected; putvar("fs_game",fsGame);
}
static void run(const char *name,const char *text) {
  memset(cl.gameState.stringData,0,sizeof(cl.gameState.stringData));
  cl.gameState.stringOffsets[CS_SYSTEMINFO]=1; strncpy(cl.gameState.stringData+1,text,MAX_GAMESTATE_CHARS-2);
  CL_SystemInfoChanged();
  printf("%s|server=%d|pure=%d|fs=%s|events=%s\n",name,cl.serverId,cl_connectedToPureServer,getvar("fs_game"),events);
}
int main(void) {
  reset("oldmod",0); run("normal","\\sv_serverid\\42\\sv_cheats\\0\\sv_paks\\1 2\\sv_pakNames\\a b\\sv_referencedPaks\\3\\sv_referencedPakNames\\c\\sv_pure\\1\\fs_game\\mymod");
  reset("keep",7); clc.demoplaying=qtrue; run("demo","\\sv_serverid\\99\\sv_cheats\\0\\sv_pure\\1\\fs_game\\ignored");
  reset("oldmod",5); run("clear","\\sv_serverid\\7\\sv_cheats\\1\\sv_pure\\0");
  reset("oldmod",0); run("case","\\sv_serverid\\8\\sv_cheats\\1\\sv_pure\\1.9\\FS_GAME\\CaseMod");
  reset("",4); run("dangling","sv_serverid\\-3\\sv_cheats\\0\\sv_pure\\0.9\\dangling");
  return 0;
}
