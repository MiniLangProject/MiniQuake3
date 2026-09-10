#include <math.h>
#include <stdio.h>
#include <string.h>
#define qfalse 0
#define qtrue 1
#define TFL_DEFAULT 0x11c0fbe
#define TFL_GRAPPLEHOOK 0x4000
#define TFL_SLIME 0x200000
#define TFL_LAVA 0x400000
#define MASK_SHOT 1
#define MOVERESULT_MOVEMENTVIEW 1
#define MOVERESULT_SWIMVIEW 2
#define MOVERESULT_WAITING 4
#define MOVERESULT_MOVEMENTVIEWSET 8
#define MOVERESULT_MOVEMENTWEAPON 16
#define BFL_IDEALVIEWSET 32
typedef float vec3_t[3];typedef struct{int areanum,entitynum;vec3_t origin,mins,maxs;int iteminfo,number,flags;}bot_goal_t;typedef struct ag{int inuse;bot_goal_t goal;float time,start_time,justused_time;int shoot,weapon;vec3_t target,origin;int areas[8],numareas,areasdisabled;struct ag*next;}bot_activategoal_t;typedef struct{int weapon;}playerState_t;typedef struct{int failure,flags,weapon;vec3_t movedir,ideal_viewangles;}bot_moveresult_t;typedef struct{float fraction;int ent;}bsp_trace_t;typedef struct{vec3_t origin;}aas_entityinfo_t;typedef struct{int client,entitynum,ms,gs,enemy,tfl,flags,weaponnum;float thinktime;vec3_t eye,viewangles,origin,ideal_viewangles;playerState_t cur_ps;bot_activategoal_t*activatestack;int(*ainode)(void*);}bot_state_t;typedef struct{int integer;}cvar_t;cvar_t bot_grapple={0};
static int obs,inter,dead,tracevis,touch,movefail,findenemy,retreat,moved,attack,clears,pops;static float now=100;static bot_activategoal_t goals[2];
#define VectorSubtract(a,b,c) do{for(int vi=0;vi<3;vi++)c[vi]=a[vi]-b[vi];}while(0)
#define VectorCopy(a,b) memcpy(b,a,sizeof(vec3_t))
#define VectorCompare(a,b) ((a)[0]==(b)[0]&&(a)[1]==(b)[1]&&(a)[2]==(b)[2])
static void vectoangles(vec3_t d,vec3_t a){a[0]=d[2];a[1]=d[1];a[2]=0;}static float FloatTime(void){return now;}static float qrandom(void){return .5f;}
#define random qrandom
static int AINode_Seek_ActivateEntity(bot_state_t*);static int other(bot_state_t*b){(void)b;return 0;}static void reset(bot_state_t*b){memset(b,0,sizeof(*b));memset(goals,0,sizeof(goals));b->client=1;b->entitynum=2;b->ms=3;b->gs=4;b->enemy=-1;b->thinktime=.1f;b->activatestack=&goals[0];goals[0].inuse=1;goals[0].time=110;goals[0].goal.entitynum=9;goals[0].weapon=6;goals[0].target[0]=100;b->cur_ps.weapon=6;obs=inter=dead=tracevis=touch=movefail=findenemy=retreat=moved=attack=clears=pops=0;}
static void BotRecordNodeSwitch(bot_state_t*b,char*a,char*c,char*d){(void)b;(void)a;(void)c;(void)d;}static int BotIsObserver(bot_state_t*b){(void)b;return obs;}static int BotIntermission(bot_state_t*b){(void)b;return inter;}static int BotIsDead(bot_state_t*b){(void)b;return dead;}static void BotClearActivateGoalStack(bot_state_t*b){b->activatestack=0;clears++;}static void AIEnter_Observer(bot_state_t*b,char*s){(void)s;b->ainode=other;}static void AIEnter_Intermission(bot_state_t*b,char*s){(void)s;b->ainode=other;}static void AIEnter_Respawn(bot_state_t*b,char*s){(void)s;b->ainode=other;}static int BotInLavaOrSlime(bot_state_t*b){(void)b;return 0;}static void BotMapScripts(bot_state_t*b){(void)b;}static void AIEnter_Seek_NBG(bot_state_t*b,char*s){(void)s;b->ainode=other;}static void BotAI_Trace(bsp_trace_t*t,vec3_t a,void*c,void*d,vec3_t e,int f,int g){(void)a;(void)c;(void)d;(void)e;(void)f;(void)g;t->fraction=tracevis?1:0;t->ent=-1;}static int InFieldOfVision(vec3_t a,float f,vec3_t b){(void)a;(void)f;(void)b;return 1;}static void trap_EA_Attack(int c){(void)c;attack++;}static void BotEntityInfo(int n,aas_entityinfo_t*i){(void)n;memset(i,0,sizeof(*i));}static int BotPopFromActivateGoalStack(bot_state_t*b){pops++;b->activatestack=b->activatestack->next;return 1;}static int trap_BotTouchingGoal(vec3_t p,bot_goal_t*g){(void)p;(void)g;return touch;}static int BotAIPredictObstacles(bot_state_t*b,bot_goal_t*g){(void)b;(void)g;return 0;}static void BotSetupForMovement(bot_state_t*b){(void)b;}static void trap_BotMoveToGoal(bot_moveresult_t*m,int ms,bot_goal_t*g,int t){(void)ms;(void)g;(void)t;memset(m,0,sizeof(*m));m->failure=movefail;m->movedir[0]=1;moved++;}static void trap_BotResetAvoidReach(int m){(void)m;}static void BotAIBlocked(bot_state_t*b,bot_moveresult_t*m,int a){(void)b;(void)m;(void)a;}static void BotClearPath(bot_state_t*b,bot_moveresult_t*m){(void)b;(void)m;}static int BotSelectActivateWeapon(bot_state_t*b){(void)b;return 6;}static void BotRoamGoal(bot_state_t*b,vec3_t t){(void)b;memset(t,0,sizeof(vec3_t));}static int trap_BotMovementViewTarget(int m,bot_goal_t*g,int t,int d,vec3_t x){(void)m;(void)g;(void)t;(void)d;(void)x;return 0;}static int BotFindEnemy(bot_state_t*b,int x){(void)x;if(findenemy)b->enemy=7;return findenemy;}static int BotWantsToRetreat(bot_state_t*b){(void)b;return retreat;}static void AIEnter_Battle_NBG(bot_state_t*b,char*s){(void)s;b->ainode=other;}static void trap_BotResetLastAvoidReach(int m){(void)m;}static void trap_BotEmptyGoalStack(int g){(void)g;}static void AIEnter_Battle_Fight(bot_state_t*b,char*s){(void)s;b->ainode=other;}
#include "bot_activate_node_original.inc"
#define CHECK(x) do{if(!(x)){printf("FAIL:%d\n",__LINE__);return 1;}}while(0)
int main(void){bot_state_t b;int scenarios=0,checks=0;
#define SC() scenarios++
#define C(x) do{checks++;CHECK(x);}while(0)
reset(&b);SC();AIEnter_Seek_ActivateEntity(&b,"x");C(b.ainode==(void*)AINode_Seek_ActivateEntity);
reset(&b);b.activatestack=0;SC();C(!AINode_Seek_ActivateEntity(&b));C(clears==1);
reset(&b);obs=1;SC();C(!AINode_Seek_ActivateEntity(&b));C(clears==1);
reset(&b);touch=1;SC();C(!AINode_Seek_ActivateEntity(&b));C(pops==1);
reset(&b);movefail=1;SC();C(AINode_Seek_ActivateEntity(&b));C(goals[0].time==0);
reset(&b);goals[0].shoot=1;tracevis=1;SC();C(AINode_Seek_ActivateEntity(&b));C(attack==1);C(b.weaponnum==6);
reset(&b);findenemy=1;SC();C(AINode_Seek_ActivateEntity(&b));C(clears==1);
reset(&b);findenemy=retreat=1;SC();C(AINode_Seek_ActivateEntity(&b));C(clears==1);
printf("PASS: %d native Baseq3 activate-node scenarios / %d exact observations\n",scenarios,checks);return 0;}
