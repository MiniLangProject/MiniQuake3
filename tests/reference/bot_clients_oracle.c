/* SPDX-License-Identifier: GPL-2.0-or-later
 * Small native behavioral oracle for the Baseq3 g_bot.c queue/client glue.
 * The function bodies below preserve the original control flow; engine and AI
 * calls are deterministic fixture services.
 */
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define DEPTH 16
#define CONNECTED 2
#define SVF_BOT 8
typedef struct { int connected, team, clientNum; } client_t;
typedef struct { int svFlags; } entity_t;
typedef struct { char characterfile[144]; float skill; char team[144]; } settings_t;
typedef struct { int clientNum, spawnTime; } queue_t;
static client_t clients[64]; static entity_t entities[1024]; static queue_t queue[DEPTH];
static int maxclients, level_time, gametype, setup_result, events[128], event_count;
static char infos[64][1024]; static settings_t captured;
static void event(int kind,int value) { events[event_count++]=kind; events[event_count++]=value; }
static const char *value(const char *info,const char *key) {
  static char result[1024]; const char *p=info; size_t wanted=strlen(key);
  while (*p) { const char *k,*v; size_t kl,vl; if (*p=='\\') ++p; k=p; while (*p && *p!='\\') ++p; kl=(size_t)(p-k); if (!*p) break; v=++p; while (*p && *p!='\\') ++p; vl=(size_t)(p-v); if (kl==wanted && !_strnicmp(k,key,kl)) { memcpy(result,v,vl); result[vl]=0; return result; } }
  return "";
}
static void copy144(char *out,const char *in) { strncpy(out,in,143); out[143]=0; }
static void ClientBegin(int clientNum) { event(1,clientNum); }
static void CheckMinimumPlayers(void) { event(2,0); }
static void PlayerIntroSound(const char *model) { event(3,(int)strlen(model)); }
static int BotAISetupClient(int clientNum,const settings_t *s,int restart) { captured=*s; event(4,clientNum); event(5,restart); return setup_result; }
static void DropClient(int clientNum,const char *message) { event(6,clientNum); event(7,(int)strlen(message)); }

static int CountHumanPlayers(int team) {
  int i,num=0; for (i=0;i<maxclients;i++) { client_t *cl=&clients[i]; if (cl->connected!=CONNECTED) continue; if (entities[cl->clientNum].svFlags&SVF_BOT) continue; if (team>=0 && cl->team!=team) continue; num++; } return num;
}
static int CountBotPlayers(int team) {
  int i,n,num=0; for (i=0;i<maxclients;i++) { client_t *cl=&clients[i]; if (cl->connected!=CONNECTED) continue; if (!(entities[cl->clientNum].svFlags&SVF_BOT)) continue; if (team>=0 && cl->team!=team) continue; num++; }
  for (n=0;n<DEPTH;n++) { if (!queue[n].spawnTime) continue; if (queue[n].spawnTime>level_time) continue; num++; } return num;
}
static void AddBotToSpawnQueue(int clientNum,int delay) {
  int n; for (n=0;n<DEPTH;n++) if (!queue[n].spawnTime) { queue[n].spawnTime=level_time+delay; queue[n].clientNum=clientNum; return; } event(8,0); ClientBegin(clientNum);
}
static void RemoveQueuedBotBegin(int clientNum) {
  int n; for (n=0;n<DEPTH;n++) if (queue[n].clientNum==clientNum) { queue[n].spawnTime=0; return; }
}
static void CheckBotSpawn(void) {
  int n; CheckMinimumPlayers(); for (n=0;n<DEPTH;n++) { if (!queue[n].spawnTime) continue; if (queue[n].spawnTime>level_time) continue; ClientBegin(queue[n].clientNum); queue[n].spawnTime=0; if (gametype==2) PlayerIntroSound(value(infos[queue[n].clientNum],"model")); }
}
static int BotConnect(int clientNum,int restart) {
  settings_t settings; copy144(settings.characterfile,value(infos[clientNum],"characterfile")); settings.skill=(float)atof(value(infos[clientNum],"skill")); copy144(settings.team,value(infos[clientNum],"team"));
  if (!BotAISetupClient(clientNum,&settings,restart)) { DropClient(clientNum,"BotAISetupClient failed"); return 0; } return 1;
}
int main(void) {
  int i; maxclients=4; level_time=1000; clients[0]=(client_t){CONNECTED,1,2}; clients[1]=(client_t){CONNECTED,2,1}; clients[3]=(client_t){CONNECTED,1,3}; entities[1].svFlags=SVF_BOT; entities[3].svFlags=SVF_BOT;
  assert(CountHumanPlayers(-1)==1 && CountHumanPlayers(1)==1); assert(CountBotPlayers(-1)==2 && CountBotPlayers(2)==1);
  AddBotToSpawnQueue(7,500); assert(queue[0].spawnTime==1500 && CountBotPlayers(-1)==2); level_time=1500; assert(CountBotPlayers(-1)==3); CheckBotSpawn(); assert(events[0]==2 && events[2]==1 && events[3]==7 && queue[0].spawnTime==0);
  memset(queue,0,sizeof(queue)); event_count=0; for (i=0;i<DEPTH;i++) AddBotToSpawnQueue(i,i+1); AddBotToSpawnQueue(19,99); assert(events[0]==8 && events[2]==1 && events[3]==19);
  queue[4]=(queue_t){5,41}; queue[7]=(queue_t){5,71}; RemoveQueuedBotBegin(5); assert(queue[4].spawnTime==0 && queue[7].spawnTime==71);
  memset(infos,0,sizeof(infos)); strcpy(infos[3],"\\characterfile\\bots/sarge_c.c\\skill\\3.75junk\\team\\red"); setup_result=1; event_count=0; assert(BotConnect(3,0)); assert(!strcmp(captured.characterfile,"bots/sarge_c.c") && captured.skill==3.75f && !strcmp(captured.team,"red")); setup_result=0; assert(!BotConnect(3,1)); assert(events[event_count-6]==5 && events[event_count-5]==1 && events[event_count-4]==6 && events[event_count-3]==3 && events[event_count-2]==7 && events[event_count-1]==23);
  gametype=2; memset(queue,0,sizeof(queue)); strcpy(infos[4],"\\model\\sarge/default"); queue[0]=(queue_t){4,2000}; level_time=2000; event_count=0; CheckBotSpawn(); assert(events[0]==2 && events[2]==1 && events[3]==4 && events[4]==3 && events[5]==13);
  puts("PASS: native Baseq3 bot client oracle"); return 0;
}
