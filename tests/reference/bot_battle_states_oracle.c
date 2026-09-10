/* SPDX-License-Identifier: GPL-2.0-or-later
 * Harness for byte-for-byte extracted ai_dmnet.c Battle_Chase, Battle_Retreat
 * and Battle_NBG entry/state functions. The test script supplies the include.
 */
#include <stdio.h>
#include <string.h>
#include <math.h>
#define qtrue 1
#define qfalse 0
#define MAX_CLIENTS 64
#define TFL_DEFAULT 0x11c0fbe
#define TFL_GRAPPLEHOOK 0x4000
#define TFL_ROCKETJUMP 0x1000
#define TFL_LAVA 0x400000
#define TFL_SLIME 0x200000
#define MOVERESULT_MOVEMENTVIEW 1
#define MOVERESULT_SWIMVIEW 2
#define MOVERESULT_MOVEMENTVIEWSET 8
#define MOVERESULT_MOVEMENTWEAPON 16
#define BFL_IDEALVIEWSET 32
#define CHARACTERISTIC_ATTACK_SKILL 5
#define GT_CTF 4
typedef int qboolean;typedef float vec3_t[3];
typedef struct{int integer;}vmCvar_t;
typedef struct{int number,valid,powerups,flags;vec3_t origin;}aas_entityinfo_t;
typedef struct{int entitynum,areanum;vec3_t origin,mins,maxs;}bot_goal_t;
typedef struct{int failure,flags,weapon;vec3_t movedir,ideal_viewangles;}bot_moveresult_t;
typedef struct{int enemy,entitynum,ms,gs,character,tfl,flags,weaponnum,areanum,lastenemyareanum;float chase_time,check_time,nbg_time,ltg_time,enemyvisible_time;vec3_t eye,viewangles,origin,lastenemyorigin,ideal_viewangles;void*ainode;}bot_state_t;
#define VectorCopy(a,b) memcpy((b),(a),sizeof(vec3_t))
#define VectorSet(v,a,b,c) do{(v)[0]=(a);(v)[1]=(b);(v)[2]=(c);}while(0)
#define VectorSubtract(a,b,c) do{(c)[0]=(a)[0]-(b)[0];(c)[1]=(a)[1]-(b)[1];(c)[2]=(a)[2]-(b)[2];}while(0)
static float now=100,last_range;static int gametype,carrying,observer,intermission,botdead,visible,findenemy,entitydead,touching,nearby,wantschase,wantsretreat,longterm=1,topgoal=1,reached,movefailure,moveflags,moveweapon,events[128],eventn;
static bot_goal_t stored_goal;
static vmCvar_t bot_grapple;
static void ev(int n){events[eventn++]=n;}static float FloatTime(void){return now;}
static int BotIsObserver(bot_state_t*b){(void)b;return observer;}static int BotIntermission(bot_state_t*b){(void)b;return intermission;}static int BotIsDead(bot_state_t*b){(void)b;return botdead;}
static float BotEntityVisible(int n,vec3_t e,vec3_t a,float f,int x){(void)n;(void)e;(void)a;(void)f;(void)x;return (float)visible;}static int BotFindEnemy(bot_state_t*b,int e){(void)b;(void)e;return findenemy;}
static int BotInLavaOrSlime(bot_state_t*b){(void)b;return 0;}static int BotCanAndWantsToRocketJump(bot_state_t*b){(void)b;return 0;}static void BotMapScripts(bot_state_t*b){(void)b;ev(10);}
static int trap_BotTouchingGoal(vec3_t p,bot_goal_t*g){(void)p;(void)g;return touching;}static int BotNearbyGoal(bot_state_t*b,int t,bot_goal_t*g,float r){(void)b;(void)t;(void)g;last_range=r;return nearby;}static int BotCTFCarryingFlag(bot_state_t*b){(void)b;return carrying;}
static void trap_BotResetLastAvoidReach(int m){(void)m;ev(11);}static void BotUpdateBattleInventory(bot_state_t*b,int e){(void)b;(void)e;ev(12);}static void BotSetupForMovement(bot_state_t*b){(void)b;ev(13);}
static void trap_BotMoveToGoal(bot_moveresult_t*r,int m,bot_goal_t*g,int t){(void)m;(void)g;(void)t;memset(r,0,sizeof(*r));r->failure=movefailure;r->flags=moveflags;r->weapon=moveweapon;r->movedir[0]=1;r->ideal_viewangles[0]=10;ev(14);}
static void trap_BotResetAvoidReach(int m){(void)m;ev(15);}static void BotAIBlocked(bot_state_t*b,bot_moveresult_t*r,int a){(void)b;(void)r;(void)a;ev(16);}static void BotAimAtEnemy(bot_state_t*b){(void)b;ev(17);}
static int trap_BotMovementViewTarget(int m,bot_goal_t*g,int t,int d,vec3_t out){(void)m;(void)g;(void)t;(void)d;out[0]=20;out[1]=0;out[2]=0;return 1;}static void vectoangles(vec3_t d,vec3_t a){a[0]=0;a[1]=(float)(atan2(d[1],d[0])*180.0/3.141592653589793);a[2]=0;}
static int BotWantsToRetreat(bot_state_t*b){(void)b;return wantsretreat;}static int BotWantsToChase(bot_state_t*b){(void)b;return wantschase;}static void BotEntityInfo(int n,aas_entityinfo_t*e){memset(e,0,sizeof(*e));e->number=n;e->origin[0]=100;}static int EntityIsDead(aas_entityinfo_t*e){(void)e;return entitydead;}
static void trap_BotEmptyGoalStack(int g){(void)g;ev(20);}static int BotPointAreaNum(vec3_t p){(void)p;return 7;}static int trap_AAS_AreaReachability(int a){return a!=0;}static void BotTeamGoals(bot_state_t*b,int r){(void)b;(void)r;ev(21);}static void BotBattleUseItems(bot_state_t*b){(void)b;ev(22);}
static int BotLongTermGoal(bot_state_t*b,int t,int r,bot_goal_t*g){(void)b;(void)t;(void)r;memset(g,0,sizeof(*g));g->areanum=12;return longterm;}static void BotChooseWeapon(bot_state_t*b){(void)b;ev(23);}
static float trap_Characteristic_BFloat(int c,int i,float l,float h){(void)c;(void)i;(void)l;(void)h;return .8f;}static void BotCheckAttack(bot_state_t*b){(void)b;ev(24);}
static int trap_BotGetTopGoal(int gs,bot_goal_t*g){(void)gs;*g=stored_goal;return topgoal;}static int BotReachedGoal(bot_state_t*b,bot_goal_t*g){(void)b;(void)g;return reached;}static void trap_BotPopGoal(int gs){(void)gs;topgoal=0;ev(25);}
static int AINode_Battle_Fight(bot_state_t*b){(void)b;return 0;}static int AINode_Seek_LTG(bot_state_t*b){(void)b;return 0;}static int AINode_Seek_NBG(bot_state_t*b){(void)b;return 0;}static int AINode_Observer(bot_state_t*b){(void)b;return 0;}static int AINode_Intermission(bot_state_t*b){(void)b;return 0;}static int AINode_Respawn(bot_state_t*b){(void)b;return 0;}
static int AINode_Battle_Chase(bot_state_t*);static int AINode_Battle_Retreat(bot_state_t*);static int AINode_Battle_NBG(bot_state_t*);
void AIEnter_Battle_Chase(bot_state_t*,char*);void AIEnter_Battle_Retreat(bot_state_t*,char*);void AIEnter_Battle_NBG(bot_state_t*,char*);
static void BotRecordNodeSwitch(bot_state_t*b,const char*a,const char*c,const char*d){(void)b;(void)a;(void)c;(void)d;ev(1);}static void AIEnter_Observer(bot_state_t*b,char*s){(void)s;b->ainode=AINode_Observer;ev(30);}static void AIEnter_Intermission(bot_state_t*b,char*s){(void)s;b->ainode=AINode_Intermission;ev(31);}static void AIEnter_Respawn(bot_state_t*b,char*s){(void)s;b->ainode=AINode_Respawn;ev(32);}static void AIEnter_Seek_LTG(bot_state_t*b,char*s){(void)s;b->ainode=AINode_Seek_LTG;ev(33);}static void AIEnter_Seek_NBG(bot_state_t*b,char*s){(void)s;b->ainode=AINode_Seek_NBG;ev(34);}static void AIEnter_Battle_Fight(bot_state_t*b,char*s){(void)s;b->ainode=AINode_Battle_Fight;ev(35);}static void AIEnter_Battle_SuicidalFight(bot_state_t*b,char*s){(void)s;b->ainode=AINode_Battle_Fight;b->flags|=64;ev(36);}
#include "bot_battle_states_functions.inc"
static int scenarios,obs;
#define SCENARIO() (scenarios++)
#define OBS(x) do{obs++;if(!(x)){fprintf(stderr,"failure line %d\n",__LINE__);return 1;}}while(0)
static void reset(bot_state_t*b){memset(b,0,sizeof(*b));eventn=0;gametype=carrying=observer=intermission=botdead=visible=findenemy=entitydead=touching=nearby=wantschase=wantsretreat=reached=movefailure=moveflags=moveweapon=0;last_range=0;longterm=topgoal=1;now=100;b->enemy=1;b->lastenemyareanum=7;b->chase_time=100;b->enemyvisible_time=100;b->nbg_time=110;stored_goal.areanum=9;}
int main(void){bot_state_t b;
 reset(&b);SCENARIO();AIEnter_Battle_Chase(&b,"x");OBS(b.ainode==AINode_Battle_Chase);OBS(b.chase_time==100);
 reset(&b);SCENARIO();AIEnter_Battle_Retreat(&b,"x");OBS(b.ainode==AINode_Battle_Retreat);reset(&b);SCENARIO();AIEnter_Battle_NBG(&b,"x");OBS(b.ainode==AINode_Battle_NBG);
 reset(&b);observer=1;SCENARIO();OBS(!AINode_Battle_Chase(&b));OBS(b.ainode==AINode_Observer);reset(&b);visible=1;SCENARIO();OBS(!AINode_Battle_Chase(&b));OBS(b.ainode==AINode_Battle_Fight);
 reset(&b);b.lastenemyareanum=0;SCENARIO();OBS(!AINode_Battle_Chase(&b));OBS(b.ainode==AINode_Seek_LTG);reset(&b);b.chase_time=89;SCENARIO();OBS(!AINode_Battle_Chase(&b));
 reset(&b);b.check_time=99;nearby=1;SCENARIO();OBS(!AINode_Battle_Chase(&b));OBS(b.ainode==AINode_Battle_NBG);OBS(b.nbg_time==116);
 reset(&b);moveflags=MOVERESULT_MOVEMENTWEAPON;moveweapon=7;SCENARIO();OBS(AINode_Battle_Chase(&b));OBS(b.weaponnum==7);OBS(eventn>=5);
 reset(&b);entitydead=1;SCENARIO();OBS(!AINode_Battle_Retreat(&b));OBS(b.ainode==AINode_Seek_LTG);reset(&b);wantschase=1;SCENARIO();OBS(!AINode_Battle_Retreat(&b));OBS(b.ainode==AINode_Battle_Chase);OBS(events[eventn-2]==20);
 reset(&b);b.enemyvisible_time=90;SCENARIO();OBS(!AINode_Battle_Retreat(&b));OBS(b.ainode==AINode_Seek_LTG);reset(&b);visible=1;longterm=0;SCENARIO();OBS(!AINode_Battle_Retreat(&b));OBS((b.flags&64)!=0);
 reset(&b);visible=1;b.check_time=99;nearby=1;SCENARIO();OBS(!AINode_Battle_Retreat(&b));OBS(b.ainode==AINode_Battle_NBG);OBS(b.nbg_time==102.5f);
 reset(&b);visible=1;b.check_time=99;nearby=1;gametype=GT_CTF;carrying=1;SCENARIO();OBS(!AINode_Battle_Retreat(&b));OBS(last_range==50);OBS(b.nbg_time==101.5f);
 reset(&b);visible=1;moveflags=MOVERESULT_MOVEMENTVIEW;SCENARIO();OBS(AINode_Battle_Retreat(&b));OBS(b.ideal_viewangles[0]==10);OBS(events[eventn-1]==24);
 reset(&b);b.enemy=-1;SCENARIO();OBS(!AINode_Battle_NBG(&b));OBS(b.ainode==AINode_Seek_NBG);reset(&b);topgoal=0;SCENARIO();OBS(!AINode_Battle_NBG(&b));OBS(b.ainode==AINode_Battle_Fight);OBS(events[eventn-2]==25);
 reset(&b);moveflags=MOVERESULT_MOVEMENTWEAPON;moveweapon=9;SCENARIO();OBS(AINode_Battle_NBG(&b));OBS(b.weaponnum==9);OBS(events[eventn-1]==24);
 printf("PASS: %d native Baseq3 battle chase/retreat/NBG scenarios / %d exact observations\n",scenarios,obs);return 0;}
