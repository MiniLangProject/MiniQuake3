/* SPDX-License-Identifier: GPL-2.0-or-later */
#include <stdio.h>
#include <string.h>
#define MAX_CLIENTS 64
#define qtrue 1
#define qfalse 0
typedef struct { int marker; } gclient_t;
typedef struct { float absmin[3], absmax[3]; } entityShared_t;
typedef struct { entityShared_t r; int inuse; gclient_t *client; int health; } gentity_t;
static gentity_t g_entities[MAX_CLIENTS];
#include "g_active_stuck_under_test.inc"

static void reset(void) {
  memset(g_entities,0,sizeof(g_entities));
  g_entities[0].inuse=1;g_entities[0].client=(gclient_t*)1;g_entities[0].health=100;
  for(int i=0;i<3;i++){g_entities[0].r.absmin[i]=-42;g_entities[0].r.absmax[i]=42;}
}
static void overlap(int live,int client,float lo,float hi) {
  g_entities[1].inuse=1;g_entities[1].health=live?100:0;g_entities[1].client=client?(gclient_t*)1:0;
  for(int i=0;i<3;i++){g_entities[1].r.absmin[i]=lo;g_entities[1].r.absmax[i]=hi;}
}
int main(void) {
  reset();printf("empty:%d\n",StuckInOtherClient(&g_entities[0]));
  reset();overlap(1,1,43,80);printf("apart:%d\n",StuckInOtherClient(&g_entities[0]));
  reset();overlap(0,1,-5,5);printf("dead:%d\n",StuckInOtherClient(&g_entities[0]));
  reset();overlap(1,0,-5,5);printf("nonclient:%d\n",StuckInOtherClient(&g_entities[0]));
  reset();overlap(1,1,-5,5);printf("overlap:%d\n",StuckInOtherClient(&g_entities[0]));
  return 0;
}
