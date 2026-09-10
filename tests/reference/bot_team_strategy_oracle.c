#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#define MAX_CLIENTS 64
#define MAX_NETNAME 36
#define TEAM_RED 1
#define TEAM_BLUE 2
#define NULL ((void*)0)
typedef struct { int client; int redflagstatus,blueflagstatus; } bot_state_t;
static int currentTeam=TEAM_RED;static char names[MAX_CLIENTS][MAX_NETNAME];
static int BotTeam(bot_state_t *bs){(void)bs;return currentTeam;}
static void BotCTFOrders_BothFlagsAtBase(bot_state_t *bs){(void)bs;puts("both-base");}
static void BotCTFOrders_EnemyFlagNotAtBase(bot_state_t *bs){(void)bs;puts("enemy-away");}
static void BotCTFOrders_FlagNotAtBase(bot_state_t *bs){(void)bs;puts("own-away");}
static void BotCTFOrders_BothFlagsNotAtBase(bot_state_t *bs){(void)bs;puts("both-away");}
static void ClientName(int client,char *name,int size){strncpy(name,names[client],(size_t)size);name[size-1]=0;}
static void BotAI_BotInitialChat(bot_state_t *bs,const char *kind,...){(void)bs;printf("chat:%s:",kind);/* arguments are printed by wrappers below */}
static void BotSayTeamOrderAlways(bot_state_t *bs,int client){(void)bs;printf("order:%d\n",client);}
#define BotAI_BotInitialChat(bs,kind,...) PrintInitialChat((bs),(kind),__VA_ARGS__)
static void PrintInitialChat(bot_state_t *bs,const char *kind,const char *a,...){(void)bs;if(!strcmp(kind,"cmd_accompanyme"))printf("chat:%s:[%s]\n",kind,a);else{va_list ap;const char *b;va_start(ap,a);b=va_arg(ap,const char*);va_end(ap);printf("chat:%s:[%s, %s]\n",kind,a,b);}}
#include "bot_team_strategy_under_test.inc"
int main(void){bot_state_t bs={2,0,0};int r,b;int self[]={2,3,4},other[]={3,2,4};for(r=0;r<2;r++)for(b=0;b<2;b++){bs.redflagstatus=r;bs.blueflagstatus=b;BotCTFOrders(&bs);}currentTeam=TEAM_BLUE;for(r=0;r<2;r++)for(b=0;b<2;b++){bs.redflagstatus=r;bs.blueflagstatus=b;BotCTFOrders(&bs);}strcpy(names[2],"Leader");strcpy(names[3],"Three");strcpy(names[4],"Four");BotCreateGroup(&bs,self,3);BotCreateGroup(&bs,other,3);return 0;}
