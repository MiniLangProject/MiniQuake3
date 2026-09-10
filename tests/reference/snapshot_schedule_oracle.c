// SPDX-License-Identifier: GPL-2.0-or-later
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef int qboolean;
#define qfalse 0
#define qtrue 1
#define HEADER_RATE_BYTES 48

typedef struct { int integer; } cvar_t;
typedef struct { qboolean unsentFragments; int unsentLength; int unsentFragmentStart; } netchan_t;
typedef struct client_s { int state; int nextSnapshotTime; int rate; netchan_t netchan; int slot; } client_t;
typedef struct { client_t *clients; int time; } serverStatic_t;

static cvar_t maxclients_store, maxrate_store;
cvar_t *sv_maxclients=&maxclients_store;
cvar_t *sv_maxRate=&maxrate_store;
serverStatic_t svs;
static char actions[128];

static void append(char kind,int slot) {
  size_t n=strlen(actions);
  snprintf(actions+n,sizeof(actions)-n,"%c%d,",kind,slot);
}
static void Cvar_Set(const char *name,const char *value) { (void)name; sv_maxRate->integer=atoi(value); }
static void SV_Netchan_TransmitNextFragment(client_t *client) { append('F',client->slot); }
static void SV_SendClientSnapshot(client_t *client) { append('S',client->slot); client->nextSnapshotTime=svs.time+50+client->slot; }

#include "snapshot_schedule_under_test.inc"

static client_t clients[8];
static void reset(int count,int time,int maxRate) {
  memset(clients,0,sizeof(clients));memset(actions,0,sizeof(actions));
  svs.clients=clients;svs.time=time;sv_maxclients->integer=count;sv_maxRate->integer=maxRate;
  for(int i=0;i<count;i++){clients[i].slot=i;clients[i].rate=25000;}
}
static void dump(const char *name,int count) {
  SV_SendClientMessages();printf("%s|%s",name,actions);
  for(int i=0;i<count;i++)printf("|%d",clients[i].nextSnapshotTime);
  printf("|max=%d\n",sv_maxRate->integer);
}
int main(void) {
  reset(6,1000,0);
  clients[0].state=0;
  clients[1].state=3;clients[1].nextSnapshotTime=1001;
  clients[2].state=4;clients[2].nextSnapshotTime=1000;
  clients[3].state=4;clients[3].nextSnapshotTime=900;clients[3].rate=5000;clients[3].netchan.unsentFragments=qtrue;clients[3].netchan.unsentLength=2100;clients[3].netchan.unsentFragmentStart=100;
  clients[4].state=2;clients[4].nextSnapshotTime=0;
  clients[5].state=4;clients[5].nextSnapshotTime=1000;clients[5].rate=10000;clients[5].netchan.unsentFragments=qtrue;clients[5].netchan.unsentLength=500;clients[5].netchan.unsentFragmentStart=100;
  dump("mixed",6);

  reset(2,2000,500);
  clients[0].state=4;clients[0].rate=9000;clients[0].netchan.unsentFragments=qtrue;clients[0].netchan.unsentLength=200;clients[0].netchan.unsentFragmentStart=100;
  clients[1].state=4;clients[1].rate=500;clients[1].netchan.unsentFragments=qtrue;clients[1].netchan.unsentLength=50;clients[1].netchan.unsentFragmentStart=50;
  dump("maxrate",2);

  reset(1,3000,0);
  clients[0].state=4;clients[0].rate=1000;clients[0].netchan.unsentFragments=qtrue;clients[0].netchan.unsentLength=10000;clients[0].netchan.unsentFragmentStart=9999;
  dump("remaining",1);
  return 0;
}
