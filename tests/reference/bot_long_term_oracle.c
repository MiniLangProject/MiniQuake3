// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Harness for byte-for-byte extracted ai_dmnet.c BotGetLongTermGoal/BotLongTermGoal.
#include <stdio.h>
#include <string.h>
#include <math.h>
#define qtrue 1
#define qfalse 0
#define CTF 1
#define NULL ((void*)0)
#define MAX_NETNAME 36
#define MAX_MESSAGE_SIZE 256
#define CHAT_TELL 1
#define CHAT_TEAM 2
#define ACTION_AFFIRMATIVE 1
#define VOICECHAT_YES "yes"
#define VOICECHAT_ONDEFENSE "defend"
#define VOICECHAT_INPOSITION "inposition"
#define VOICECHAT_ONGETFLAG "ongetflag"
#define VOICECHAT_ONRETURNFLAG "onreturnflag"
#define MOVE_WALK 1
#define CHARACTERISTIC_CROUCHER 1
#define CONTENTS_WATER 32
#define CONTENTS_SLIME 16
#define CONTENTS_LAVA 8
#define TFL_DEFAULT 3
#define LTG_TEAMHELP 1
#define LTG_TEAMACCOMPANY 2
#define LTG_DEFENDKEYAREA 3
#define LTG_GETFLAG 4
#define LTG_RUSHBASE 5
#define LTG_RETURNFLAG 6
#define LTG_CAMP 7
#define LTG_CAMPORDER 8
#define LTG_PATROL 9
#define LTG_GETITEM 10
#define LTG_KILL 11
#define PATROL_BACK 1
#define GT_CTF 4
#define TEAM_RED 1
#define TEAM_BLUE 2
#define Square(x) ((x)*(x))
typedef float vec3_t[3];
typedef struct { int areanum,entitynum;vec3_t origin,mins,maxs;int iteminfo,number,flags; } bot_goal_t;
typedef struct { int valid;vec3_t origin,mins,maxs,angles,lastvisorigin; } aas_entityinfo_t;
typedef struct bot_waypoint_s { char name[32];bot_goal_t goal;struct bot_waypoint_s *next,*prev; } bot_waypoint_t;
typedef struct {
 vec3_t origin,eye,viewangles,ideal_viewangles;int entitynum,client,cs,ms,gs,character,areanum,tfl,inventory[32];
 int ltgtype,teammate,decisionmaker,lastkilledplayer,lastgoal_ltgtype,patrolflags,redflagstatus,blueflagstatus;
 float teammessage_time,teamgoal_time,teammatevisible_time,formation_dist,attackcrouch_time,thinktime,arrive_time,nbg_time;
 float defendaway_range,defendaway_time,camp_range,rushbaseaway_time,lead_time,leadmessage_time,leadvisible_time,leadbackup_time;
 int lead_teammate;bot_goal_t teamgoal,lead_teamgoal;bot_waypoint_t *patrolpoints,*curpatrolpoint;
} bot_state_t;
#define VectorCopy(a,b) memcpy((b),(a),sizeof(vec3_t))
#define VectorSet(a,x,y,z) do{(a)[0]=(x);(a)[1]=(y);(a)[2]=(z);}while(0)
#define VectorSubtract(a,b,c) do{(c)[0]=(a)[0]-(b)[0];(c)[1]=(a)[1]-(b)[1];(c)[2]=(a)[2]-(b)[2];}while(0)
#define VectorLengthSquared(a) ((a)[0]*(a)[0]+(a)[1]*(a)[1]+(a)[2]*(a)[2])
#define DotProduct(a,b) ((a)[0]*(b)[0]+(a)[1]*(b)[1]+(a)[2]*(b)[2])
static float now=20,random_value=.5f;static int visible,reachable=1,touching,invisible,swimming,contents,persistent,item_ret=1;
static int resets,item_calls,chats,team=TEAM_RED,carrying;static int gametype;static bot_goal_t ctf_redflag,ctf_blueflag;static aas_entityinfo_t entities[64];
static float FloatTime(void){return now;} static float random(void){return random_value;}
static char *EasyClientName(int e,char *b,int n){(void)e;(void)n;strcpy(b,"mate");return b;}
static void BotAI_BotInitialChat(bot_state_t*b,const char*k,...){(void)b;(void)k;chats++;}
static void trap_BotEnterChat(int a,int b,int c){(void)a;(void)b;(void)c;} static void BotVoiceChatOnly(bot_state_t*b,int c,const char*v){(void)b;(void)c;(void)v;}
static void trap_EA_Action(int c,int a){(void)c;(void)a;} static void BotEntityInfo(int e,aas_entityinfo_t*i){*i=entities[e];}
static int BotEntityVisible(int a,const vec3_t b,const vec3_t c,float f,int e){(void)a;(void)b;(void)c;(void)f;(void)e;return visible;}
static int BotPointAreaNum(const vec3_t p){(void)p;return 7;} static int trap_AAS_AreaReachability(int a){(void)a;return reachable;}
static void trap_BotResetAvoidReach(int m){(void)m;resets++;} static void BotSetupForMovement(bot_state_t*b){(void)b;}
static void trap_BotMoveInDirection(int m,const vec3_t d,float s,int t){(void)m;(void)d;(void)s;(void)t;} static void AngleVectors(const vec3_t a,vec3_t f,void*r,void*u){(void)a;(void)r;(void)u;f[0]=1;f[1]=f[2]=0;}
static float VectorNormalize(vec3_t a){float l=sqrtf(VectorLengthSquared(a));if(l){a[0]/=l;a[1]/=l;a[2]/=l;}return l;}
static float trap_Characteristic_BFloat(int c,int k,float a,float b){(void)c;(void)k;(void)a;(void)b;return .5f;} static int trap_AAS_Swimming(const vec3_t o){(void)o;return swimming;}
static void trap_EA_Gesture(int c){(void)c;} static void trap_EA_Crouch(int c){(void)c;} static void BotRoamGoal(bot_state_t*b,vec3_t t){(void)b;VectorSet(t,100,0,0);}
static void vectoangles(const vec3_t d,vec3_t a){(void)d;VectorSet(a,0,0,0);} static int BotGoForAir(bot_state_t*b,int t,bot_goal_t*g,float r){(void)b;(void)t;(void)g;(void)r;return 0;}
static void trap_BotResetLastAvoidReach(int m){(void)m;} static void AIEnter_Seek_NBG(bot_state_t*b,const char*s){(void)b;(void)s;}
static int trap_AAS_AreaTravelTimeToGoalArea(int a,const vec3_t o,int g,int t){(void)a;(void)o;(void)g;(void)t;return 0;}
static void trap_BotGoalName(int n,char*b,int z){(void)n;(void)z;strcpy(b,"goal");} static int BotHasPersistantPowerupAndWeapon(bot_state_t*b){(void)b;return persistent;}
static int BotGetItemLongTermGoal(bot_state_t*b,int t,bot_goal_t*g){(void)b;(void)t;(void)g;item_calls++;return item_ret;}
static int trap_BotItemGoalInVisButNotVisible(int e,const vec3_t y,const vec3_t a,bot_goal_t*g){(void)e;(void)y;(void)a;(void)g;return invisible;}
static int BotReachedGoal(bot_state_t*b,bot_goal_t*g){(void)b;(void)g;return touching;} static int trap_PointContents(const vec3_t p,int e){(void)p;(void)e;return contents;}
static int trap_BotTouchingGoal(const vec3_t o,bot_goal_t*g){(void)o;(void)g;return touching;}
static int BotTeam(bot_state_t*b){(void)b;return team;} static int BotCTFCarryingFlag(bot_state_t*b){(void)b;return carrying;}
static void BotAlternateRoute(bot_state_t*b,bot_goal_t*g){(void)b;(void)g;}
#include "bot_long_term_original.inc"
static int scenarios,observations,failures;
#define CHECK(x) do{observations++;if(!(x)){failures++;printf("FAIL line %d: %s\n",__LINE__,#x);}}while(0)
static bot_goal_t goal(int n,float x){bot_goal_t g;memset(&g,0,sizeof(g));g.areanum=n;g.number=n;g.origin[0]=x;return g;}
static bot_state_t bot(void){bot_state_t b;memset(&b,0,sizeof(b));b.entitynum=1;b.client=1;b.ms=2;b.gs=3;b.tfl=4;b.origin[0]=0;b.eye[2]=24;b.teamgoal=goal(8,200);b.teamgoal_time=100;b.teammatevisible_time=20;b.formation_dist=100;b.lastkilledplayer=-1;b.lead_teamgoal=goal(9,200);return b;}
static void reset(void){memset(entities,0,sizeof(entities));now=20;random_value=.5f;visible=touching=invisible=swimming=contents=persistent=resets=item_calls=chats=carrying=gametype=0;team=TEAM_RED;reachable=item_ret=1;ctf_redflag=goal(20,0);ctf_blueflag=goal(21,0);}
#define SCENARIO() do{scenarios++;reset();}while(0)
int main(void){bot_state_t b;bot_goal_t g;bot_waypoint_t a,z;
 SCENARIO();b=bot();CHECK(BotGetLongTermGoal(&b,4,1,&g));CHECK(item_calls==1);
 SCENARIO();b=bot();b.ltgtype=LTG_TEAMHELP;b.teammate=2;visible=1;entities[2].valid=1;entities[2].origin[0]=50;CHECK(!BotGetLongTermGoal(&b,4,0,&g));CHECK(resets==1);
 SCENARIO();b=bot();b.ltgtype=LTG_DEFENDKEYAREA;b.defendaway_range=350;b.teamgoal.origin[0]=10;CHECK(BotGetLongTermGoal(&b,4,0,&g));CHECK(b.defendaway_time==24.5f&&b.defendaway_range==350);
 SCENARIO();b=bot();b.ltgtype=LTG_KILL;b.teamgoal.entitynum=6;b.lastkilledplayer=6;CHECK(BotGetLongTermGoal(&b,4,0,&g));CHECK(b.ltgtype==0&&b.lastkilledplayer==-1&&item_calls==1);
 SCENARIO();b=bot();b.ltgtype=LTG_GETITEM;invisible=1;CHECK(BotGetLongTermGoal(&b,4,0,&g));CHECK(b.ltgtype==0&&g.areanum==8);
 SCENARIO();b=bot();b.ltgtype=LTG_CAMP;b.teamgoal.origin[0]=10;CHECK(!BotGetLongTermGoal(&b,4,0,&g));CHECK(b.arrive_time==20&&resets==1);
 SCENARIO();memset(&a,0,sizeof(a));memset(&z,0,sizeof(z));a.goal=goal(10,1);z.goal=goal(11,2);a.next=&z;z.prev=&a;b=bot();b.ltgtype=LTG_PATROL;b.curpatrolpoint=&a;touching=1;CHECK(BotGetLongTermGoal(&b,4,0,&g));CHECK(b.curpatrolpoint==&z&&g.areanum==11);
 SCENARIO();b=bot();gametype=GT_CTF;b.ltgtype=LTG_GETFLAG;touching=1;CHECK(BotGetLongTermGoal(&b,4,0,&g));CHECK(b.blueflagstatus==1&&b.ltgtype==0&&g.areanum==21);
 SCENARIO();b=bot();gametype=GT_CTF;b.ltgtype=LTG_RUSHBASE;carrying=1;touching=1;CHECK(BotGetLongTermGoal(&b,4,0,&g));CHECK(b.rushbaseaway_time==30&&resets==1&&g.areanum==20);
 SCENARIO();b=bot();gametype=GT_CTF;b.ltgtype=LTG_RETURNFLAG;touching=1;CHECK(BotGetLongTermGoal(&b,4,0,&g));CHECK(b.ltgtype==0&&g.areanum==21);
 SCENARIO();b=bot();b.lead_time=19;b.lead_teammate=2;CHECK(BotLongTermGoal(&b,4,0,&g));CHECK(b.lead_time==0&&item_calls==1);
 SCENARIO();b=bot();b.lead_time=100;b.lead_teammate=2;b.leadvisible_time=0;entities[2].valid=1;entities[2].origin[0]=200;CHECK(BotLongTermGoal(&b,4,0,&g));CHECK(b.leadbackup_time==22&&g.areanum==7);
 SCENARIO();b=bot();b.lead_time=100;b.lead_teammate=2;b.leadvisible_time=20;b.lead_teamgoal.origin[0]=600;entities[2].origin[0]=600;CHECK(!BotLongTermGoal(&b,4,0,&g));CHECK(item_calls==0);
 if(failures)return 1;printf("PASS: %d native Baseq3 long-term-goal scenarios / %d exact observations\n",scenarios,observations);return 0;}
