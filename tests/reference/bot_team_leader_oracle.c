#include <stdio.h>
#include <string.h>
#define MAX_CLIENTS 64
#define MAX_NETNAME 36
#define SVF_BOT 8
#define SAY_TELL 1
#define qtrue 1
#define qfalse 0
typedef struct { int svFlags; } sharedEntity_t;
typedef struct { int inuse; sharedEntity_t r; } gentity_t;
typedef struct { char teamleader[MAX_NETNAME]; } bot_state_t;
static gentity_t g_entities[MAX_CLIENTS];static int notleader[MAX_CLIENTS],ordered;static char names[MAX_CLIENTS][MAX_NETNAME];
static int BotSameTeam(bot_state_t *bs,int client){(void)bs;return client==3||client==4;}
static void ClientName(int client,char *name,int size){strncpy(name,names[client],(size_t)size);name[size-1]=0;}
static int BotSetLastOrderedTask(bot_state_t *bs){(void)bs;puts("last");return ordered;}
static void BotVoiceChat_Defend(bot_state_t *bs,int client,int mode){(void)bs;printf("defend:%d:%d\n",client,mode);}
#include "bot_team_leader_under_test.inc"
static void run(bot_state_t *bs){int found=FindHumanTeamLeader(bs);printf("found=%d:%s\n",found,bs->teamleader);}
int main(void){bot_state_t bs={{0}};g_entities[0].inuse=1;g_entities[0].r.svFlags=SVF_BOT;g_entities[1].inuse=1;notleader[1]=1;g_entities[2].inuse=1;strcpy(names[2],"Wrong");g_entities[3].inuse=1;strcpy(names[3],"Human");run(&bs);ordered=1;bs.teamleader[0]=0;run(&bs);g_entities[3].inuse=0;g_entities[4].inuse=0;bs.teamleader[0]=0;run(&bs);return 0;}
