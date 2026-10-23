// SPDX-License-Identifier: GPL-2.0-or-later
#include <stdio.h>
#include <stdint.h>
#include <stdarg.h>
#include <string.h>

typedef unsigned char byte;
typedef float vec3_t[3];
typedef int qboolean;
#define qfalse 0
#define qtrue 1
#define ERR_DROP 1
#define MAX_GENTITIES 1024
#define SS_GAME 2
#define CVAR_SERVERINFO 4
#define GAME_CONSOLE_COMMAND 9

typedef struct { int number; } entityState_t;
typedef struct { entityState_t s; } sharedEntity_t;
typedef struct { int marker; } playerState_t;
typedef struct { int serverTime, marker; } usercmd_t;
typedef struct { int areanum, areanum2; } svEntity_t;
typedef struct { usercmd_t lastUsercmd; } client_t;
typedef struct { int integer; } cvar_t;
typedef struct {
  byte *gentities; int gentitySize, num_entities;
  byte *gameClients; int gameClientSize; svEntity_t svEntities[MAX_GENTITIES]; int state;
} server_t;
typedef struct { client_t *clients; } serverStatic_t;

static server_t sv; static serverStatic_t svs; static cvar_t maxclients_store;
static cvar_t *sv_maxclients=&maxclients_store; static char eventLog[256]; static int vmResult;
static byte pvsMask[2];
static void append(const char *format,...) { va_list ap;size_t n=strlen(eventLog);va_start(ap,format);vsnprintf(eventLog+n,sizeof(eventLog)-n,format,ap);va_end(ap); }
static void Com_Error(int code,const char *format,...) { (void)code;(void)format;append("error;"); }
static void Com_Printf(const char *format,...) { va_list ap;char text[64];va_start(ap,format);vsnprintf(text,sizeof(text),format,ap);va_end(ap);append("print:%s;",text); }
static void SV_SendServerCommand(client_t *client,const char *format,...) { va_list ap;char text[64];va_start(ap,format);vsnprintf(text,sizeof(text),format,ap);va_end(ap);append("send:%d:%s;",client?(int)(client-svs.clients):-1,text); }
static void SV_DropClient(client_t *client,const char *reason) { append("drop:%d:%s;",(int)(client-svs.clients),reason); }
static int CM_PointLeafnum(const vec3_t point) { return (int)point[0]; }
static int CM_LeafCluster(int leaf) { return leaf; }
static int CM_LeafArea(int leaf) { return leaf+10; }
static byte *CM_ClusterPVS(int cluster) { (void)cluster;return pvsMask; }
static void CM_AdjustAreaPortalState(int a,int b,qboolean open) { append("portal:%d:%d:%d;",a,b,open); }
static const char *Cvar_InfoString(int flags) { (void)flags;return "\\sv_hostname\\MiniQuake3"; }
static void Q_strncpyz(char *dst,const char *src,int size) { if(size<=0)return;strncpy(dst,src,(size_t)size-1);dst[size-1]=0; }
static int VM_Call(void *vm,int call,...) { (void)vm;(void)call;return vmResult; }
static void *gvm=(void*)1;

#include "sv_game_interface_under_test.inc"

int main(void) {
  byte entities[4*32]={0};byte players[4*16]={0};client_t clients[4]={{0}};svs.clients=clients;maxclients_store.integer=4;
  SV_LocateGameData((sharedEntity_t*)entities,4,32,(playerState_t*)players,16);
  ((sharedEntity_t*)(entities+64))->s.number=2;sv.svEntities[2].areanum=3;sv.svEntities[2].areanum2=7;
  printf("layout|%d|%td|%td|%td|%td\n",SV_NumForGentity((sharedEntity_t*)(entities+96)),(byte*)SV_GentityNum(2)-entities,(byte*)SV_GameClientNum(3)-players,(byte*)SV_SvEntityForGentity((sharedEntity_t*)(entities+64))-(byte*)sv.svEntities,(byte*)SV_GEntityForSvEntity(&sv.svEntities[2])-entities);
  SV_GamePrint("hello");SV_GameSendServerCommand(-1,"broadcast");SV_GameSendServerCommand(2,"direct");SV_GameSendServerCommand(9,"ignored");SV_GameDropClient(1,"bye");SV_GameDropClient(-1,"ignored");printf("events|%s\n",eventLog);
  pvsMask[0]=(1<<2);vec3_t a={1,0,0},visible={2,0,0},hidden={3,0,0};printf("pvs|%d|%d\n",SV_inPVSIgnorePortals(a,visible),SV_inPVSIgnorePortals(a,hidden));
  eventLog[0]=0;SV_AdjustAreaPortalState((sharedEntity_t*)(entities+64),qtrue);sv.svEntities[2].areanum2=-1;SV_AdjustAreaPortalState((sharedEntity_t*)(entities+64),qfalse);printf("portal|%s\n",eventLog);
  char info[12];SV_GetServerinfo(info,sizeof(info));clients[3].lastUsercmd.serverTime=1234;clients[3].lastUsercmd.marker=77;usercmd_t cmd={0};SV_GetUsercmd(3,&cmd);printf("data|%s|%d|%d\n",info,cmd.serverTime,cmd.marker);
  union { uint32_t u;float f; } bits;bits.u=0x80000000u;printf("float|%d|%d\n",FloatAsInt(1.0f),FloatAsInt(bits.f));
  sv.state=1;vmResult=9;printf("command|%d|",SV_GameCommand());sv.state=SS_GAME;vmResult=0;printf("%d|",SV_GameCommand());vmResult=5;printf("%d\n",SV_GameCommand());
  return 0;
}
