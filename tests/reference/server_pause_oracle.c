// SPDX-License-Identifier: GPL-2.0-or-later
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef int qboolean;
#define qfalse 0
#define qtrue 1

enum { NA_BOT, NA_BAD, NA_LOOPBACK, NA_BROADCAST, NA_IP, NA_IPX, NA_BROADCAST_IPX };
enum { CS_FREE, CS_ZOMBIE, CS_CONNECTED, CS_PRIMED, CS_ACTIVE };

typedef struct { int type; } netadr_t;
typedef struct { netadr_t remoteAddress; } netchan_t;
typedef struct { int state; netchan_t netchan; } client_t;
typedef struct { int integer; } cvar_t;
typedef struct { client_t *clients; } serverStatic_t;

static cvar_t maxclientsStorage,clientPausedStorage,serverPausedStorage;
cvar_t *sv_maxclients=&maxclientsStorage;
cvar_t *cl_paused=&clientPausedStorage;
cvar_t *sv_paused=&serverPausedStorage;
serverStatic_t svs;
static int setCount;

void Cvar_Set(const char *name,const char *value) {
  if (strcmp(name,"sv_paused")!=0) abort();
  sv_paused->integer=atoi(value);
  setCount++;
}

#include "server_pause_under_test.inc"

static client_t clients[8];

static void run(const char *name,int clPaused,int svPaused,int count,const int *states,const int *types) {
  memset(clients,0,sizeof(clients));
  svs.clients=clients;sv_maxclients->integer=count;
  cl_paused->integer=clPaused;sv_paused->integer=svPaused;setCount=0;
  for (int i=0;i<count;i++) { clients[i].state=states[i];clients[i].netchan.remoteAddress.type=types[i]; }
  int paused=SV_CheckPaused();
  printf("%s|%d|%d|%d\n",name,paused,sv_paused->integer,setCount);
}

int main(void) {
  const int none[1]={0};
  const int loop[5]={NA_LOOPBACK,NA_LOOPBACK,NA_LOOPBACK,NA_LOOPBACK,NA_LOOPBACK};
  const int bot[5]={NA_BOT,NA_BOT,NA_BOT,NA_BOT,NA_BOT};
  const int allStates[5]={CS_FREE,CS_ZOMBIE,CS_CONNECTED,CS_PRIMED,CS_ACTIVE};
  const int freeActive[2]={CS_FREE,CS_ACTIVE};
  const int zombieActive[2]={CS_ZOMBIE,CS_ACTIVE};
  const int connectedActive[2]={CS_CONNECTED,CS_ACTIVE};
  const int primedActive[2]={CS_PRIMED,CS_ACTIVE};
  const int activeActive[2]={CS_ACTIVE,CS_ACTIVE};
  const int twoConnected[2]={CS_CONNECTED,CS_ACTIVE};
  const int mixedTypes[2]={NA_LOOPBACK,NA_IP};
  const int oneActive[1]={CS_ACTIVE};
  const int oneLoop[1]={NA_LOOPBACK};
  const int twoBots[2]={CS_CONNECTED,CS_ACTIVE};
  const int botTypes[2]={NA_BOT,NA_BOT};
  const int botHumanStates[3]={CS_CONNECTED,CS_PRIMED,CS_ACTIVE};
  const int botHumanTypes[3]={NA_BOT,NA_IP,NA_BOT};
  run("client-off-keeps-one",0,1,0,none,none);
  run("client-off-keeps-zero",0,0,2,twoConnected,mixedTypes);
  run("empty",1,0,0,none,none);
  run("all-states",1,1,5,allStates,loop);
  run("free-plus-human",1,0,2,freeActive,loop);
  run("zombie-plus-human",1,0,2,zombieActive,loop);
  run("connected-plus-human",1,1,2,connectedActive,loop);
  run("primed-plus-human",1,1,2,primedActive,loop);
  run("active-plus-human",1,1,2,activeActive,loop);
  run("all-bot-states",1,0,5,allStates,bot);
  run("two-humans-clear",1,1,2,twoConnected,mixedTypes);
  run("two-humans-already-clear",1,0,2,twoConnected,mixedTypes);
  run("one-human-set",1,0,1,oneActive,oneLoop);
  run("one-human-already-set",1,1,1,oneActive,oneLoop);
  run("two-bots",1,0,2,twoBots,botTypes);
  run("bot-human-bot",1,0,3,botHumanStates,botHumanTypes);
  run("truthy-client-negative",-1,0,0,none,none);
  run("truthy-server-retained",1,7,0,none,none);
  run("truthy-server-cleared",1,-3,2,twoConnected,mixedTypes);
  run("listen-lan",1,0,1,oneActive,oneLoop);
  run("listen-internet",1,0,1,oneActive,oneLoop);
  run("dedicated-lan",1,0,1,oneActive,oneLoop);
  run("dedicated-internet",1,0,1,oneActive,oneLoop);
  return 0;
}
