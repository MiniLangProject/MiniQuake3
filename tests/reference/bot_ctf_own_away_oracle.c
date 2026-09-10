#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#define MAX_CLIENTS 64
#define MAX_NETNAME 36
#define CTFS_AGRESSIVE 1
#define VOICECHAT_GETFLAG "getflag"
#define VOICECHAT_DEFEND "defend"
typedef struct {int client,numteammates,flagcarrier,ctfstrategy;} bot_state_t;
static int source[MAX_CLIENTS],source_count,event_count;static char names[MAX_CLIENTS][MAX_NETNAME],events[64][128];
static int BotSortTeamMatesByBaseTravelTime(bot_state_t *bs,int *out,int size){int i;(void)bs;(void)size;for(i=0;i<source_count;i++)out[i]=source[i];return source_count;}
static void BotSortTeamMatesByTaskPreference(bot_state_t *bs,int *out,int count){(void)bs;(void)out;(void)count;}
static void ClientName(int client,char *name,int size){strncpy_s(name,size,names[client],_TRUNCATE);}
static void BotAI_BotInitialChat(bot_state_t *bs,const char *kind,...){va_list ap;const char *a;(void)bs;va_start(ap,kind);a=va_arg(ap,const char*);_snprintf_s(events[event_count++],128,_TRUNCATE,"C:%s:%s",kind,a);va_end(ap);}
static void BotSayTeamOrder(bot_state_t *bs,int client){(void)bs;_snprintf_s(events[event_count++],128,_TRUNCATE,"O:%d",client);}
static void BotSayVoiceTeamOrder(bot_state_t *bs,int client,const char *voice){(void)bs;(void)client;(void)voice;}
#include "bot_ctf_own_away_under_test.inc"
static void run(const char *label,int n,int aggressive){bot_state_t bs={0,n,-1,aggressive};int i;source_count=n;event_count=0;for(i=0;i<n;i++){source[i]=i;_snprintf_s(names[i],MAX_NETNAME,_TRUNCATE,"P%d",i);}BotCTFOrders_FlagNotAtBase(&bs);printf("%s=",label);for(i=0;i<event_count;i++)printf("%s%s",i?"|":"",events[i]);puts("");}
int main(void){run("p1",1,0);run("a1",1,1);run("p2",2,0);run("a2",2,1);run("p3",3,0);run("a3",3,1);run("p5",5,0);run("a5",5,1);run("p12",12,0);run("a12",12,1);return 0;}
