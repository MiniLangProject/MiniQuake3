// SPDX-License-Identifier: GPL-2.0-or-later
#include <stdio.h>
#include <string.h>

#define PACKET_BACKUP 32
#define CS_ACTIVE 4
#define SVF_BOT 8

typedef struct { int integer; } cvar_t;
typedef struct { int messageSent; int messageAcked; } clientSnapshot_t;
typedef struct { int svFlags; } entityShared_t;
typedef struct { entityShared_t r; } sharedEntity_t;
typedef struct {
  int state;
  int ping;
  sharedEntity_t *gentity;
  clientSnapshot_t frames[PACKET_BACKUP];
} client_t;
typedef struct { int ping; } playerState_t;
typedef struct { client_t *clients; } serverStatic_t;

static cvar_t maxclientsStorage;
cvar_t *sv_maxclients=&maxclientsStorage;
serverStatic_t svs;
static playerState_t states[8];
playerState_t *SV_GameClientNum(int clientNum) { return &states[clientNum]; }

#include "server_client_pings_under_test.inc"

static client_t clients[8];
static sharedEntity_t entities[8];

static void reset(int count) {
  memset(clients,0,sizeof(clients));
  memset(entities,0,sizeof(entities));
  memset(states,0,sizeof(states));
  maxclientsStorage.integer=count;
  svs.clients=clients;
  for (int i=0;i<count;i++) states[i].ping=-77;
}

static void dump(const char *name,int count) {
  SV_CalcPings();
  printf("%s",name);
  for (int i=0;i<count;i++) printf("|%d:%d",clients[i].ping,states[i].ping);
  putchar('\n');
}

int main(void) {
  reset(4);
  clients[0].state=0; clients[0].ping=13;
  clients[1].state=CS_ACTIVE; clients[1].ping=14;
  clients[2].state=CS_ACTIVE; clients[2].gentity=&entities[2]; entities[2].r.svFlags=SVF_BOT;
  clients[3].state=CS_ACTIVE; clients[3].gentity=&entities[3];
  dump("states",4);

  reset(1); clients[0].state=CS_ACTIVE; clients[0].gentity=&entities[0];
  clients[0].frames[0].messageSent=100; clients[0].frames[0].messageAcked=110;
  clients[0].frames[1].messageSent=200; clients[0].frames[1].messageAcked=221;
  clients[0].frames[2].messageSent=-50; clients[0].frames[2].messageAcked=1;
  dump("average",1);

  reset(1); clients[0].state=CS_ACTIVE; clients[0].gentity=&entities[0];
  clients[0].frames[0].messageSent=1; clients[0].frames[0].messageAcked=2001;
  dump("clamp",1);

  reset(1); clients[0].state=CS_ACTIVE; clients[0].gentity=&entities[0];
  clients[0].frames[0].messageSent=100; clients[0].frames[0].messageAcked=99;
  clients[0].frames[1].messageSent=100; clients[0].frames[1].messageAcked=0;
  clients[0].frames[2].messageSent=100; clients[0].frames[2].messageAcked=-1;
  dump("signed",1);
  return 0;
}
