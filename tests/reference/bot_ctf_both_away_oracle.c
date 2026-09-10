#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#define MAX_CLIENTS 64
#define MAX_NETNAME 36
#define VOICECHAT_GETFLAG "getflag"
#define VOICECHAT_FOLLOWME "followme"
#define VOICECHAT_FOLLOWFLAGCARRIER "followflagcarrier"
#define VOICECHAT_RETURNFLAG "returnflag"
typedef struct {int client,numteammates,flagcarrier;} bot_state_t;
static int source[MAX_CLIENTS],source_count,event_count;static char names[MAX_CLIENTS][MAX_NETNAME],events[64][128];
static int BotSortTeamMatesByBaseTravelTime(bot_state_t *bs,int *out,int size){int i;(void)bs;(void)size;for(i=0;i<source_count;i++)out[i]=source[i];return source_count;}
static void BotSortTeamMatesByTaskPreference(bot_state_t *bs,int *out,int count){(void)bs;(void)out;(void)count;}
static void ClientName(int client,char *name,int size){strncpy_s(name,size,names[client],_TRUNCATE);}
static void BotAI_BotInitialChat(bot_state_t *bs,const char *kind,...){va_list ap;const char *a,*b=NULL;(void)bs;va_start(ap,kind);a=va_arg(ap,const char*);if(!strcmp(kind,"cmd_accompany"))b=va_arg(ap,const char*);if(b)_snprintf_s(events[event_count++],128,_TRUNCATE,"C:%s:%s:%s",kind,a,b);else _snprintf_s(events[event_count++],128,_TRUNCATE,"C:%s:%s",kind,a);va_end(ap);}
static void BotSayTeamOrder(bot_state_t *bs,int client){(void)bs;_snprintf_s(events[event_count++],128,_TRUNCATE,"O:%d",client);}
static void BotSayVoiceTeamOrder(bot_state_t *bs,int client,const char *voice){(void)bs;(void)client;(void)voice;}
#include "bot_ctf_both_away_under_test.inc"
static void run(const char *label,int n,int carrier,int self){bot_state_t bs={self,n,carrier};int i;source_count=n;event_count=0;for(i=0;i<n;i++){source[i]=i;_snprintf_s(names[i],MAX_NETNAME,_TRUNCATE,"P%d",i);}BotCTFOrders_BothFlagsNotAtBase(&bs);printf("%s=",label);for(i=0;i<event_count;i++)printf("%s%s",i?"|":"",events[i]);puts("");}
int main(void){run("one",1,-1,0);run("two-first",2,0,0);run("two-second",2,1,0);run("three-self",3,0,0);run("three-remote",3,2,0);run("three-none",3,-1,0);run("five-self",5,2,2);run("five-remote",5,0,2);run("five-none",5,-1,2);run("twelve-cap",12,-1,6);return 0;}
