// SPDX-License-Identifier: GPL-2.0-or-later
// Harness for AIEnter_Seek_LTG/AINode_Seek_LTG extracted unchanged at test time.
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define qfalse 0
#define qtrue 1
#define CTF 1
#define GT_CTF 4
#define LTG_DEFENDKEYAREA 3
#define TFL_DEFAULT 0x11c0fbe
#define TFL_ROCKETJUMP 0x1000
#define TFL_GRAPPLEHOOK 0x4000
#define TFL_SLIME 0x200000
#define TFL_LAVA 0x400000
#define MOVERESULT_MOVEMENTVIEW 1
#define MOVERESULT_SWIMVIEW 2
#define MOVERESULT_WAITING 4
#define MOVERESULT_MOVEMENTVIEWSET 8
#define MOVERESULT_MOVEMENTWEAPON 16
#define BFL_IDEALVIEWSET 32
typedef float vec3_t[3];
typedef struct { int areanum,entitynum; vec3_t origin,mins,maxs; int iteminfo,number,flags; } bot_goal_t;
typedef struct { int failure,blocked,type,flags,blockentity; vec3_t movedir,ideal_viewangles; int weapon; } bot_moveresult_t;
typedef struct bot_state_s { int gs,ms,client,enemy,tfl,ltgtype,flags,weaponnum; float stand_time,thinktime,killedenemy_time,check_time,nbg_time,ltg_time; vec3_t origin,ideal_viewangles; void *ainode; } bot_state_t;
typedef int (*node_t)(bot_state_t*);
typedef struct { int integer; } cvar_t;
cvar_t bot_grapple={0}; int gametype=0;

static int observer,intermission,dead,randomchat,findenemy,retreat,longterm,nearby,predict,movefailure,moveflags,movementtarget,topgoal,carrying,reached;
static float now=100.0f,randomvalue=0.5f; static int events[128],eventn,scenarios,observations;
static bot_goal_t activegoal;
static void ev(int x){events[eventn++]=x;} static void reset(bot_state_t*b){memset(b,0,sizeof(*b));b->gs=3;b->ms=4;b->client=5;b->enemy=-1;b->thinktime=.1f;b->origin[0]=1;activegoal.areanum=9;activegoal.number=17;observer=intermission=dead=randomchat=findenemy=retreat=nearby=predict=movefailure=moveflags=movementtarget=topgoal=carrying=reached=0;longterm=1;bot_grapple.integer=gametype=0;randomvalue=.5f;eventn=0;}
#define SCENARIO() (scenarios++)
#define OBS(x) do{observations++;if(!(x)){fprintf(stderr,"FAIL line %d\n",__LINE__);return 1;}}while(0)
#define VectorCopy(a,b) memcpy((b),(a),sizeof(vec3_t))
#define VectorSubtract(a,b,c) do{(c)[0]=(a)[0]-(b)[0];(c)[1]=(a)[1]-(b)[1];(c)[2]=(a)[2]-(b)[2];}while(0)
static float VectorLengthSquared(vec3_t v){return v[0]*v[0]+v[1]*v[1]+v[2]*v[2];}
static void vectoangles(vec3_t v,vec3_t out){out[0]=v[2];out[1]=v[1];out[2]=20;}
static float FloatTime(void){return now;} static float qrandom(void){return randomvalue;}
#define random qrandom
static int AINode_Seek_LTG(bot_state_t*); static int AINode_Seek_NBG(bot_state_t*);
static void AIEnter_Seek_LTG(bot_state_t*,char*); static void AIEnter_Seek_NBG(bot_state_t*,char*);
static int AINode_Observer(bot_state_t*b){(void)b;return 0;} static int AINode_Intermission(bot_state_t*b){(void)b;return 0;} static int AINode_Respawn(bot_state_t*b){(void)b;return 0;} static int AINode_Stand(bot_state_t*b){(void)b;return 0;} static int AINode_Battle_Retreat(bot_state_t*b){(void)b;return 0;} static int AINode_Battle_Fight(bot_state_t*b){(void)b;return 0;} static int AINode_Battle_NBG(bot_state_t*b){(void)b;return 0;}
static int trap_BotGetTopGoal(int gs,bot_goal_t*g){(void)gs;if(topgoal)*g=activegoal;return topgoal;} static void trap_BotGoalName(int n,char*b,int z){(void)n;(void)z;strcpy(b,"rocket");}
static void BotRecordNodeSwitch(bot_state_t*b,const char*a,const char*c,const char*d){(void)b;(void)a;(void)c;(void)d;ev(1);} static int BotIsObserver(bot_state_t*b){(void)b;return observer;} static int BotIntermission(bot_state_t*b){(void)b;return intermission;} static int BotIsDead(bot_state_t*b){(void)b;return dead;} static int BotChat_Random(bot_state_t*b){(void)b;return randomchat;} static float BotChatTime(bot_state_t*b){(void)b;return 2;}
static void AIEnter_Observer(bot_state_t*b,char*s){(void)s;b->ainode=AINode_Observer;ev(2);} static void AIEnter_Intermission(bot_state_t*b,char*s){(void)s;b->ainode=AINode_Intermission;ev(3);} static void AIEnter_Respawn(bot_state_t*b,char*s){(void)s;b->ainode=AINode_Respawn;ev(4);} static void AIEnter_Stand(bot_state_t*b,char*s){(void)s;b->ainode=AINode_Stand;ev(5);} static void AIEnter_Battle_Retreat(bot_state_t*b,char*s){(void)s;b->ainode=AINode_Battle_Retreat;ev(6);} static void AIEnter_Battle_Fight(bot_state_t*b,char*s){(void)s;b->ainode=AINode_Battle_Fight;ev(7);}
static void AIEnter_Battle_NBG(bot_state_t*b,char*s){(void)s;b->ainode=AINode_Battle_NBG;ev(22);}
static int BotInLavaOrSlime(bot_state_t*b){(void)b;return 0;} static int BotCanAndWantsToRocketJump(bot_state_t*b){(void)b;return 0;} static void BotMapScripts(bot_state_t*b){(void)b;ev(9);} static void trap_EA_Gesture(int c){(void)c;ev(10);} static int BotFindEnemy(bot_state_t*b,int x){(void)x;if(findenemy)b->enemy=2;return findenemy;} static int BotWantsToRetreat(bot_state_t*b){(void)b;return retreat;} static void trap_BotResetLastAvoidReach(int x){(void)x;ev(11);} static void trap_BotEmptyGoalStack(int x){(void)x;ev(12);} static void BotTeamGoals(bot_state_t*b,int x){(void)b;(void)x;ev(13);}
static int BotLongTermGoal(bot_state_t*b,int t,int r,bot_goal_t*g){(void)b;(void)t;(void)r;*g=activegoal;return longterm;} static void BotWantsToCamp(bot_state_t*b){(void)b;ev(14);} static int BotCTFCarryingFlag(bot_state_t*b){(void)b;return carrying;} static int BotNearbyGoal(bot_state_t*b,int t,bot_goal_t*g,int range){(void)b;(void)t;(void)g;ev(100+range);return nearby;} static int BotAIPredictObstacles(bot_state_t*b,bot_goal_t*g){(void)b;(void)g;ev(15);return predict;} static void BotSetupForMovement(bot_state_t*b){(void)b;ev(16);}
static void trap_BotMoveToGoal(bot_moveresult_t*m,int ms,bot_goal_t*g,int t){(void)ms;(void)g;(void)t;memset(m,0,sizeof(*m));m->failure=movefailure;m->flags=moveflags;m->weapon=6;m->movedir[0]=2;m->ideal_viewangles[0]=10;m->ideal_viewangles[1]=20;m->ideal_viewangles[2]=30;ev(17);} static void trap_BotResetAvoidReach(int x){(void)x;ev(18);} static void BotAIBlocked(bot_state_t*b,bot_moveresult_t*m,int a){(void)b;(void)m;(void)a;ev(19);} static void BotClearPath(bot_state_t*b,bot_moveresult_t*m){(void)b;(void)m;ev(20);} static int trap_BotMovementViewTarget(int ms,bot_goal_t*g,int t,int d,vec3_t v){(void)ms;(void)g;(void)t;(void)d;v[0]=11;v[1]=3;v[2]=1;return movementtarget;} static void BotRoamGoal(bot_state_t*b,vec3_t v){(void)b;v[0]=5;v[1]=4;v[2]=3;ev(21);}
static int BotReachedGoal(bot_state_t*b,bot_goal_t*g){(void)b;(void)g;return reached;} static void BotChooseWeapon(bot_state_t*b){(void)b;ev(24);} static void trap_BotPopGoal(int gs){(void)gs;ev(25);} static int trap_BotGetSecondGoal(int gs,bot_goal_t*g){(void)gs;(void)g;return 0;}

#include "bot_seek_ltg_original.inc"

int main(void){bot_state_t b;
 reset(&b);topgoal=1;SCENARIO();AIEnter_Seek_LTG(&b,"x");OBS(b.ainode==(void*)AINode_Seek_LTG);OBS(eventn==1);
 reset(&b);SCENARIO();AIEnter_Seek_LTG(&b,"x");OBS(b.ainode==(void*)AINode_Seek_LTG);OBS(eventn==1);
 reset(&b);observer=1;SCENARIO();OBS(!AINode_Seek_LTG(&b));OBS(b.ainode==(void*)AINode_Observer);
 reset(&b);intermission=1;SCENARIO();OBS(!AINode_Seek_LTG(&b));OBS(b.ainode==(void*)AINode_Intermission);
 reset(&b);dead=1;SCENARIO();OBS(!AINode_Seek_LTG(&b));OBS(b.ainode==(void*)AINode_Respawn);
 reset(&b);randomchat=1;SCENARIO();OBS(!AINode_Seek_LTG(&b));OBS(b.stand_time==102&&b.ainode==(void*)AINode_Stand);
 reset(&b);b.killedenemy_time=99;randomvalue=.01f;SCENARIO();OBS(AINode_Seek_LTG(&b));OBS(events[1]==10);
 reset(&b);findenemy=retreat=1;SCENARIO();OBS(!AINode_Seek_LTG(&b));OBS(b.ainode==(void*)AINode_Battle_Retreat);OBS(events[eventn-1]==6);
 reset(&b);findenemy=1;SCENARIO();OBS(!AINode_Seek_LTG(&b));OBS(b.ainode==(void*)AINode_Battle_Fight);OBS(events[eventn-3]==11&&events[eventn-2]==12);
 reset(&b);longterm=0;SCENARIO();OBS(AINode_Seek_LTG(&b));OBS(events[eventn-1]==13);
 reset(&b);nearby=1;b.ltgtype=LTG_DEFENDKEYAREA;SCENARIO();OBS(!AINode_Seek_LTG(&b));OBS(b.nbg_time==108&&b.ainode==(void*)AINode_Seek_NBG);OBS(events[eventn-2]==11);
 reset(&b);nearby=1;gametype=GT_CTF;carrying=1;SCENARIO();OBS(!AINode_Seek_LTG(&b));OBS(b.nbg_time==104.5f);OBS(events[eventn-3]==150);
 reset(&b);predict=1;SCENARIO();OBS(!AINode_Seek_LTG(&b));OBS(events[eventn-1]==15);
 reset(&b);movefailure=1;SCENARIO();OBS(AINode_Seek_LTG(&b));OBS(b.ltg_time==0);OBS(events[eventn-3]==18&&events[eventn-2]==19&&events[eventn-1]==20);
 reset(&b);moveflags=MOVERESULT_MOVEMENTVIEW|MOVERESULT_MOVEMENTWEAPON;SCENARIO();OBS(AINode_Seek_LTG(&b));OBS(b.ideal_viewangles[0]==10&&b.ideal_viewangles[2]==30);OBS(b.weaponnum==6);
 reset(&b);topgoal=1;SCENARIO();AIEnter_Seek_NBG(&b,"x");OBS(b.ainode==(void*)AINode_Seek_NBG);OBS(eventn==1);
 reset(&b);b.nbg_time=99;SCENARIO();OBS(!AINode_Seek_NBG(&b));OBS(b.ainode==(void*)AINode_Seek_LTG);OBS(b.check_time==100.05f);OBS(events[eventn-2]==25);
 reset(&b);topgoal=reached=1;b.nbg_time=110;SCENARIO();OBS(!AINode_Seek_NBG(&b));OBS(events[1]==24);OBS(events[eventn-2]==25);
 reset(&b);topgoal=1;b.nbg_time=110;movefailure=1;SCENARIO();OBS(AINode_Seek_NBG(&b));OBS(b.nbg_time==0);OBS(events[eventn-3]==18);
 reset(&b);topgoal=1;b.nbg_time=110;findenemy=retreat=1;SCENARIO();OBS(AINode_Seek_NBG(&b));OBS(b.ainode==(void*)AINode_Battle_NBG);OBS(events[eventn-1]==22);
 reset(&b);topgoal=1;b.nbg_time=110;findenemy=1;SCENARIO();OBS(AINode_Seek_NBG(&b));OBS(b.ainode==(void*)AINode_Battle_Fight);OBS(events[eventn-3]==11&&events[eventn-2]==12);
 printf("PASS: %d native Baseq3 seek-state scenarios / %d exact observations\n",scenarios,observations);return 0;}
