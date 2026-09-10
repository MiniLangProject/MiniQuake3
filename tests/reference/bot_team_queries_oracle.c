#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#define MAX_CLIENTS 64
#define MAX_INFO_STRING 1024
#define CS_PLAYERS 0
#define TEAM_FREE 0
#define TEAM_RED 1
#define TEAM_BLUE 2
#define GT_TEAM 3
#define PM_NORMAL 0
#define qfalse 0
#define qtrue 1
typedef int qboolean;
typedef struct {int client;} bot_state_t;typedef struct {int number;} aas_entityinfo_t;typedef struct {int pm_type;} playerState_t;
static char configs[MAX_CLIENTS][MAX_INFO_STRING];static int gametype=GT_TEAM;
static int trap_Cvar_VariableIntegerValue(const char *n){(void)n;return 5;}
static void trap_GetConfigstring(int i,char *b,int s){strncpy(b,configs[i],(size_t)s);b[s-1]=0;}
static char *Q_CleanStr(char *s){char *d=s;int c;while((c=(unsigned char)*s)!=0){if(c=='^'&&s[1]&&s[1]!='^')s++;else if(c>=32&&c<=126)*d++=(char)c;s++;}*d=0;return s;}
static int Q_stricmp(const char *a,const char *b){return _stricmp(a,b);}
static const char *Info_ValueForKey(const char *s,const char *key){static char v[128];while(*s){char k[128];int n=0;if(*s=='\\')s++;while(*s&&*s!='\\'&&n<127)k[n++]=*s++;k[n]=0;if(*s=='\\')s++;n=0;while(*s&&*s!='\\'&&n<127)v[n++]=*s++;v[n]=0;if(!strcmp(k,key))return v;}v[0]=0;return v;}
static void BotAI_GetClientState(int client,playerState_t *ps){ps->pm_type=client==1?0:3;}
static int BotSameTeam(bot_state_t *bs,int entnum);
#include "bot_team_queries_under_test.inc"
int main(void){bot_state_t bs={0};aas_entityinfo_t e;strcpy(configs[0],"\\n\\^1RedBot\\t\\1");strcpy(configs[1],"\\n\\BlueBot\\t\\2");strcpy(configs[2],"\\n\\Mate\\t\\1");strcpy(configs[3],"\\n\\Free\\t\\0");printf("team=%d:%d\n",BotTeam(&bs),BotOppositeTeam(&bs));bs.client=1;printf("team=%d:%d\n",BotTeam(&bs),BotOppositeTeam(&bs));bs.client=3;printf("team=%d:%d\n",BotTeam(&bs),BotOppositeTeam(&bs));bs.client=-1;printf("team=%d:%d\n",BotTeam(&bs),BotOppositeTeam(&bs));bs.client=0;printf("same=%d,%d,%d\n",BotSameTeam(&bs,2),BotSameTeam(&bs,1),BotSameTeam(&bs,64));gametype=2;printf("same=%d\n",BotSameTeam(&bs,2));gametype=3;printf("find=%d,%d,%d\n",ClientFromName("redbot"),ClientFromName("BLUEBOT"),ClientFromName("missing"));printf("teamfind=%d,%d\n",ClientOnSameTeamFromName(&bs,"Mate"),ClientOnSameTeamFromName(&bs,"BlueBot"));e.number=1;printf("dead=%d,",EntityIsDead(&e));e.number=2;printf("%d,",EntityIsDead(&e));e.number=70;printf("%d\n",EntityIsDead(&e));return 0;}
