#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#define MAX_CLIENTS 64
#define MAX_NETNAME 36
#define CTFS_AGRESSIVE 1
#define VOICECHAT_DEFEND "defend"
#define VOICECHAT_GETFLAG "getflag"
#define VOICECHAT_OFFENSE "offense"
#define VOICECHAT_RETURNFLAG "returnflag"
#define VOICECHAT_FOLLOWME "followme"
#define VOICECHAT_FOLLOWFLAGCARRIER "followflagcarrier"
typedef struct { int client,ctfstrategy,flagcarrier,neutralflagstatus,numteammates; } bot_state_t;
static int members[MAX_CLIENTS],member_count,event_count;
static char events[256][96],names[MAX_CLIENTS][MAX_NETNAME];
int BotSortTeamMatesByBaseTravelTime(bot_state_t *bs,int *out,int max){int i;(void)bs;(void)max;for(i=0;i<member_count;i++)out[i]=members[i];return member_count;}
int BotSortTeamMatesByTaskPreference(bot_state_t *bs,int *out,int count){(void)bs;(void)out;return count;}
void ClientName(int client,char *out,int size){snprintf(out,size,"P%d",client);}
void BotSayTeamOrder(bot_state_t *bs,int client){(void)bs;snprintf(events[event_count++],96,"O:%d",client);}
void BotSayVoiceTeamOrder(bot_state_t *bs,int client,char *voice){(void)bs;(void)client;(void)voice;}
void BotAI_BotInitialChat(bot_state_t *bs,const char *kind,...){va_list ap;const char *name;(void)bs;va_start(ap,kind);name=va_arg(ap,const char *);snprintf(events[event_count++],96,"C:%s:%s",kind,name?name:"");va_end(ap);}
#include "ai_team_complete_under_test.inc"
static void run(const char *label,void (*fn)(bot_state_t *),int count,int aggressive,int carrier){bot_state_t bs={0};int i;bs.client=0;bs.ctfstrategy=aggressive?CTFS_AGRESSIVE:0;bs.flagcarrier=carrier;bs.numteammates=count;member_count=count;event_count=0;for(i=0;i<count;i++){members[i]=i;snprintf(names[i],sizeof(names[i]),"P%d",i);}fn(&bs);printf("%s=",label);for(i=0;i<event_count;i++)if(events[i][0]=='C')printf("%s%s",i?"|":"",events[i]);puts("");}
int main(void){run("center2-p",Bot1FCTFOrders_FlagAtCenter,2,0,-1);run("center3-p",Bot1FCTFOrders_FlagAtCenter,3,0,-1);run("center3-a",Bot1FCTFOrders_FlagAtCenter,3,1,-1);run("center5-p",Bot1FCTFOrders_FlagAtCenter,5,0,-1);run("center5-a",Bot1FCTFOrders_FlagAtCenter,5,1,-1);run("enemy2-p",Bot1FCTFOrders_EnemyHasFlag,2,0,-1);run("enemy3-p",Bot1FCTFOrders_EnemyHasFlag,3,0,-1);run("enemy3-a",Bot1FCTFOrders_EnemyHasFlag,3,1,-1);run("enemy5-p",Bot1FCTFOrders_EnemyHasFlag,5,0,-1);run("enemy5-a",Bot1FCTFOrders_EnemyHasFlag,5,1,-1);run("obelisk-p",BotObeliskOrders,5,0,-1);run("obelisk-a",BotObeliskOrders,5,1,-1);run("harvest-p",BotHarvesterOrders,5,0,-1);run("harvest-a",BotHarvesterOrders,5,1,-1);return 0;}
