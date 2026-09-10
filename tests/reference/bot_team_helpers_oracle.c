#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX_CLIENTS 64
#define MAX_INFO_STRING 1024
#define MAX_NETNAME 36
#define TEAM_SPECTATOR 3
#define TEAMTP_ATTACKER 1
#define TEAMTP_DEFENDER 2
#define qfalse 0
#define qtrue 1
#define CS_PLAYERS 0
typedef struct { char teamleader[36]; int client; } bot_state_t;
typedef struct { char name[36]; int preference; } bot_ctftaskpreference_t;
static bot_ctftaskpreference_t ctftaskpreferences[MAX_CLIENTS];
static char configs[MAX_CLIENTS][MAX_INFO_STRING];
static char clientnames[MAX_CLIENTS][MAX_NETNAME];
static int teams[MAX_CLIENTS], configuredMaxClients=5;
static int trap_Cvar_VariableIntegerValue(const char *name) { (void)name; return configuredMaxClients; }
static void trap_GetConfigstring(int index,char *buf,int size) { strncpy(buf,configs[index],(size_t)size);buf[size-1]=0; }
static const char *Info_ValueForKey(const char *s,const char *key) { static char value[128];const char *p=s;value[0]=0;while(*p){char k[128];int n=0;if(*p=='\\')p++;while(*p&&*p!='\\'&&n<127)k[n++]=*p++;k[n]=0;if(*p=='\\')p++;n=0;while(*p&&*p!='\\'&&n<127)value[n++]=*p++;value[n]=0;if(!strcmp(k,key))return value;}value[0]=0;return value; }
static int ClientFromName(const char *name) { int i;for(i=0;i<MAX_CLIENTS;i++)if(!strcmp(clientnames[i],name))return i;return -1; }
static int BotSameTeam(bot_state_t *bs,int client) { (void)bs;return teams[client]==1; }
static void ClientName(int client,char *name,int size) { strncpy(name,clientnames[client],(size_t)size);name[size-1]=0; }
static int Q_stricmp(const char *a,const char *b) { return _stricmp(a,b); }
#include "bot_team_helpers_under_test.inc"
static void print_list(int *v,int n){int i;printf("sort=[");for(i=0;i<n;i++)printf("%s%d",i?", ":"",v[i]);puts("]");}
int main(void){bot_state_t bs;int list[]={0,1,2,3,4};memset(&bs,0,sizeof(bs));
 printf("valid=%d\n",BotValidTeamLeader(&bs));strcpy(bs.teamleader,"Missing");printf("valid=%d\n",BotValidTeamLeader(&bs));strcpy(clientnames[2],"Leader");strcpy(bs.teamleader,"Leader");printf("valid=%d\n",BotValidTeamLeader(&bs));
 strcpy(configs[0],"\\n\\One\\t\\1");strcpy(configs[1],"\\n\\Spec\\t\\3");strcpy(configs[2],"\\n\\Two\\t\\1");strcpy(configs[3],"\\t\\1");teams[0]=teams[2]=1;printf("mates=%d\n",BotNumTeamMates(&bs));
 strcpy(clientnames[1],"Alpha");BotSetTeamMateTaskPreference(&bs,1,TEAMTP_DEFENDER);{int before=BotGetTeamMateTaskPreference(&bs,1);strcpy(clientnames[1],"Other");printf("pref=%d,%d\n",before,BotGetTeamMateTaskPreference(&bs,1));}strcpy(clientnames[1],"One");
 strcpy(clientnames[0],"Zero");strcpy(clientnames[2],"Two");strcpy(clientnames[3],"Three");strcpy(clientnames[4],"Four");ctftaskpreferences[0].preference=TEAMTP_ATTACKER;strcpy(ctftaskpreferences[0].name,"Zero");ctftaskpreferences[1].preference=TEAMTP_DEFENDER;strcpy(ctftaskpreferences[1].name,"One");ctftaskpreferences[2].preference=0;ctftaskpreferences[3].preference=TEAMTP_ATTACKER;strcpy(ctftaskpreferences[3].name,"Three");ctftaskpreferences[4].preference=TEAMTP_DEFENDER|TEAMTP_ATTACKER;strcpy(ctftaskpreferences[4].name,"Four");print_list(list,BotSortTeamMatesByTaskPreference(&bs,list,5));return 0;}
