#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdarg.h>

#define MISSIONPACK 1
#define qtrue 1
#define qfalse 0
#define MAX_CLIENTS 64
#define MAX_MESSAGE_SIZE 256
#define MAX_NETNAME 36
#define SAY_ALL 0
#define SAY_TEAM 1
#define CHAT_TEAM 1
#define CHAT_TELL 2
#define TEAM_RED 1
#define TEAM_BLUE 2
#define GT_CTF 4
#define GT_1FCTF 5
#define GT_OBELISK 6
#define GT_HARVESTER 7
#define LTG_TEAMACCOMPANY 2
#define LTG_DEFENDKEYAREA 3
#define LTG_GETFLAG 4
#define LTG_RETURNFLAG 6
#define LTG_CAMPORDER 8
#define LTG_HARVEST 12
#define LTG_ATTACKENEMYBASE 13
#define TEAMTP_DEFENDER 1
#define TEAMTP_ATTACKER 2
#define ACTION_AFFIRMATIVE 0x0100000
#define TEAM_ACCOMPANY_TIME 600
#define TEAM_DEFENDKEYAREA_TIME 600
#define TEAM_CAMP_TIME 600
#define TEAM_ATTACKENEMYBASE_TIME 600
#define TEAM_HARVEST_TIME 120
#define CTF_GETFLAG_TIME 600
#define CTF_RETURNFLAG_TIME 180
#define VOICECHAT_GETFLAG "getflag"
#define VOICECHAT_OFFENSE "offense"
#define VOICECHAT_DEFEND "defend"
#define VOICECHAT_DEFENDFLAG "defendflag"
#define VOICECHAT_PATROL "patrol"
#define VOICECHAT_CAMP "camp"
#define VOICECHAT_FOLLOWME "followme"
#define VOICECHAT_FOLLOWFLAGCARRIER "followflagcarrier"
#define VOICECHAT_RETURNFLAG "returnflag"
#define VOICECHAT_STARTLEADER "startleader"
#define VOICECHAT_STOPLEADER "stopleader"
#define VOICECHAT_WHOISLEADER "whoisleader"
#define VOICECHAT_WANTONDEFENSE "wantondefense"
#define VOICECHAT_WANTONOFFENSE "wantonoffense"
#define VOICECHAT_ONPATROL "onpatrol"
#define VOICECHAT_YES "yes"
#define VectorCopy(a,b) memcpy((b),(a),sizeof(float)*3)
#define VectorSet(v,a,b,c) do {(v)[0]=(a);(v)[1]=(b);(v)[2]=(c);} while(0)
#define Q_stricmp _stricmp
#define random() TestRandom()

typedef int qboolean;
typedef struct { int entitynum,areanum; float origin[3],mins[3],maxs[3]; int tag; } bot_goal_t;
typedef struct { int valid; float origin[3]; } aas_entityinfo_t;
typedef struct bot_state_s {
 int client,cs,team,decisionmaker,ordered,ltgtype,teammate,lastgoal_ltgtype;
 float order_time,teammessage_time,teamgoal_time,harvestaway_time,attackaway_time,defendaway_time,lead_time,arrive_time,teammatevisible_time,formation_dist,rushbaseaway_time;
 char teamleader[36]; bot_goal_t teamgoal;
} bot_state_t;
typedef struct voiceCommand_s { char *cmd; void (*func)(bot_state_t *,int,int); } voiceCommand_t;

static int gametype,teamplay=1,flagcarrier=-1,timecounter;
static bot_goal_t ctf_redflag,ctf_blueflag,ctf_neutralflag,redobelisk,blueobelisk;
static int notleader[MAX_CLIENTS],preferences[MAX_CLIENTS],clientteams[MAX_CLIENTS],areas[MAX_CLIENTS];
static aas_entityinfo_t entities[MAX_CLIENTS];
static char names[MAX_CLIENTS][MAX_NETNAME],easyNames[MAX_CLIENTS][MAX_NETNAME];
static char events[1024];
static void Event(const char *fmt,...){char tmp[128];va_list ap;va_start(ap,fmt);vsnprintf(tmp,sizeof(tmp),fmt,ap);va_end(ap);strcat(events,tmp);}
static float FloatTime(void){return (float)(10+timecounter++);}
static float TestRandom(void){return 0.0f;}
static int BotTeam(bot_state_t *bs){return bs->team;}
static int BotOppositeTeam(bot_state_t *bs){return bs->team==TEAM_RED?TEAM_BLUE:TEAM_RED;}
static void BotGetAlternateRouteGoal(bot_state_t *bs,int team){(void)bs;Event("A%d",team);}
static void BotSetTeamStatus(bot_state_t *bs){(void)bs;Event("S");}
static void BotRememberLastOrderedTask(bot_state_t *bs){(void)bs;Event("M");}
static void BotAI_BotInitialChat(bot_state_t *bs,const char *type,...){va_list ap;const char *arg;(void)bs;va_start(ap,type);arg=va_arg(ap,const char *);va_end(ap);Event("C%s:%s;",type,arg?arg:"");}
static void trap_BotEnterChat(int cs,int client,int kind){(void)cs;Event("E%d:%d;",client,kind);}
static void BotVoiceChatOnly(bot_state_t *bs,int client,const char *text){(void)bs;Event("V%d:%s;",client,text);}
static void BotEntityInfo(int client,aas_entityinfo_t *out){*out=entities[client];}
static int BotPointAreaNum(float *origin){int i;for(i=0;i<MAX_CLIENTS;i++)if(entities[i].origin[0]==origin[0]&&entities[i].origin[1]==origin[1])return areas[i];return 0;}
static char *EasyClientName(int client,char *out,int size){strncpy(out,easyNames[client][0]?easyNames[client]:names[client],(size_t)size);out[size-1]=0;return out;}
static char *ClientName(int client,char *out,int size){strncpy(out,names[client],(size_t)size);out[size-1]=0;return out;}
static int TeamPlayIsOn(void){return teamplay;}
static int BotGetTeamMateTaskPreference(bot_state_t *bs,int client){(void)bs;return preferences[client];}
static void BotSetTeamMateTaskPreference(bot_state_t *bs,int client,int value){(void)bs;preferences[client]=value;}
static void trap_EA_Action(int client,int action){Event("X%d:%d;",client,action);}
static int BotTeamFlagCarrier(bot_state_t *bs){(void)bs;return flagcarrier;}
static int BotSameTeam(bot_state_t *bs,int client){return client>=0&&client<MAX_CLIENTS&&clientteams[client]==bs->team;}
static void Q_strncpyz(char *out,const char *in,int size){strncpy(out,in,(size_t)(size-1));out[size-1]=0;}

void BotVoiceChat_GetFlag(bot_state_t*,int,int); void BotVoiceChat_Offense(bot_state_t*,int,int);
void BotVoiceChat_Defend(bot_state_t*,int,int); void BotVoiceChat_DefendFlag(bot_state_t*,int,int);
void BotVoiceChat_Patrol(bot_state_t*,int,int); void BotVoiceChat_Camp(bot_state_t*,int,int);
void BotVoiceChat_FollowMe(bot_state_t*,int,int); void BotVoiceChat_FollowFlagCarrier(bot_state_t*,int,int);
void BotVoiceChat_ReturnFlag(bot_state_t*,int,int); void BotVoiceChat_StartLeader(bot_state_t*,int,int);
void BotVoiceChat_StopLeader(bot_state_t*,int,int); void BotVoiceChat_WhoIsLeader(bot_state_t*,int,int);
void BotVoiceChat_WantOnDefense(bot_state_t*,int,int); void BotVoiceChat_WantOnOffense(bot_state_t*,int,int);
void BotVoiceChat_Dummy(bot_state_t*,int,int); extern voiceCommand_t voiceCommands[];
#include "bot_voice_commands_under_test.inc"
voiceCommand_t voiceCommands[]={
 {VOICECHAT_GETFLAG,BotVoiceChat_GetFlag},{VOICECHAT_OFFENSE,BotVoiceChat_Offense},{VOICECHAT_DEFEND,BotVoiceChat_Defend},{VOICECHAT_DEFENDFLAG,BotVoiceChat_DefendFlag},
 {VOICECHAT_PATROL,BotVoiceChat_Patrol},{VOICECHAT_CAMP,BotVoiceChat_Camp},{VOICECHAT_FOLLOWME,BotVoiceChat_FollowMe},{VOICECHAT_FOLLOWFLAGCARRIER,BotVoiceChat_FollowFlagCarrier},
 {VOICECHAT_RETURNFLAG,BotVoiceChat_ReturnFlag},{VOICECHAT_STARTLEADER,BotVoiceChat_StartLeader},{VOICECHAT_STOPLEADER,BotVoiceChat_StopLeader},
 {VOICECHAT_WHOISLEADER,BotVoiceChat_WhoIsLeader},{VOICECHAT_WANTONDEFENSE,BotVoiceChat_WantOnDefense},{VOICECHAT_WANTONOFFENSE,BotVoiceChat_WantOnOffense},{NULL,BotVoiceChat_Dummy}};

static bot_state_t Fresh(void){bot_state_t b;memset(&b,0,sizeof(b));b.client=1;b.cs=9;b.team=TEAM_RED;b.teammate=-1;b.teamgoal.entitynum=-1;return b;}
static void Reset(void){memset(events,0,sizeof(events));timecounter=0;}
static const char *Bool(int value){return value?"true":"false";}
static void Dump(const char *label,bot_state_t *b){printf("%s|%d,%s,%d,%.0f,%.0f,%.0f,%d,%d,%.0f,%.0f,%s,%d,%d|%s\n",label,b->decisionmaker,Bool(b->ordered),b->ltgtype,b->order_time,b->teammessage_time,b->teamgoal_time,b->teamgoal.entitynum,b->teamgoal.areanum,b->teammatevisible_time,b->formation_dist,b->teamleader,b->teamgoal.tag,b->teammate,events);}

int main(void){bot_state_t b;int result;
 strcpy(names[1],"Ranger");strcpy(names[2],"Sarge");strcpy(easyNames[2],"Sarge");clientteams[2]=TEAM_RED;
 ctf_redflag.areanum=11;ctf_redflag.tag=101;ctf_blueflag.areanum=22;ctf_blueflag.tag=102;ctf_neutralflag.areanum=33;
 redobelisk.areanum=44;redobelisk.tag=201;blueobelisk.areanum=55;blueobelisk.tag=202;
 Reset();b=Fresh();gametype=GT_CTF;BotVoiceChat_GetFlag(&b,2,SAY_TEAM);Dump("getflag",&b);
 Reset();b=Fresh();gametype=3;BotVoiceChat_Offense(&b,2,SAY_TEAM);Dump("offense",&b);
 Reset();b=Fresh();gametype=GT_HARVESTER;BotVoiceChat_Offense(&b,2,SAY_TEAM);Dump("harvest",&b);
 Reset();b=Fresh();gametype=GT_CTF;BotVoiceChat_DefendFlag(&b,2,SAY_TEAM);Dump("defend",&b);
 Reset();b=Fresh();b.team=TEAM_BLUE;gametype=GT_OBELISK;BotVoiceChat_Defend(&b,2,SAY_TEAM);Dump("obelisk",&b);
 Reset();b=Fresh();BotVoiceChat_Patrol(&b,2,SAY_TEAM);Dump("patrol",&b);
 Reset();b=Fresh();entities[2].valid=0;BotVoiceChat_Camp(&b,2,SAY_TEAM);Dump("camp-miss",&b);
 Reset();b=Fresh();entities[2].valid=1;entities[2].origin[0]=7;entities[2].origin[1]=8;areas[2]=77;BotVoiceChat_Camp(&b,2,SAY_TEAM);Dump("camp",&b);
 Reset();b=Fresh();BotVoiceChat_FollowMe(&b,2,SAY_TEAM);Dump("follow",&b);
 Reset();b=Fresh();flagcarrier=2;BotVoiceChat_FollowFlagCarrier(&b,9,SAY_TEAM);Dump("carrier",&b);
 Reset();b=Fresh();gametype=GT_1FCTF;BotVoiceChat_ReturnFlag(&b,2,SAY_TEAM);Dump("return",&b);
 Reset();b=Fresh();BotVoiceChat_StartLeader(&b,2,SAY_TEAM);BotVoiceChat_StopLeader(&b,2,SAY_TEAM);Dump("leaders",&b);
 Reset();b=Fresh();strcpy(b.teamleader,"RANGER");BotVoiceChat_WhoIsLeader(&b,2,SAY_TEAM);Dump("who",&b);
 Reset();b=Fresh();preferences[2]=TEAMTP_ATTACKER|8;BotVoiceChat_WantOnDefense(&b,2,SAY_TEAM);Dump("wantdef",&b);printf("prefdef=%d\n",preferences[2]);
 Reset();b=Fresh();preferences[2]=TEAMTP_DEFENDER|8;BotVoiceChat_WantOnOffense(&b,2,SAY_TEAM);Dump("wantoff",&b);printf("prefoff=%d\n",preferences[2]);
 Reset();b=Fresh();gametype=3;result=BotVoiceChatCommand(&b,SAY_TEAM,"1 2 7 OfFeNsE");Dump("command",&b);printf("result=%s\n",Bool(result));
 Reset();b=Fresh();result=BotVoiceChatCommand(&b,SAY_TEAM,"0 2 0 missing");printf("unknown=%s\n",Bool(result));
 teamplay=0;result=BotVoiceChatCommand(&b,SAY_TEAM,"0 2 0 offense");printf("noteam=%s\n",Bool(result));teamplay=1;
 result=BotVoiceChatCommand(&b,SAY_ALL,"0 2 0 offense");printf("sayall=%s\n",Bool(result));
 Reset();b=Fresh();BotVoiceChat_Dummy(&b,2,SAY_TEAM);Dump("dummy",&b);
 return 0;}
