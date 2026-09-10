/* SPDX-License-Identifier: GPL-2.0-or-later
 * Direct ai_dmnet.c battle-fight oracle; engine/AI helpers are capture stubs.
 */
#include <stdio.h>
#include <string.h>
#define qtrue 1
#define qfalse 0
#define MAX_CLIENTS 64
#define INVENTORY_HEALTH 29
#define PERS_HITS 1
#define BFL_FIGHTSUICIDAL 64
#define TFL_DEFAULT 0x11c0fbe
#define TFL_GRAPPLEHOOK 0x4000
#define TFL_ROCKETJUMP 0x1000
#define TFL_LAVA 0x400000
#define TFL_SLIME 0x200000
#define VectorCopy(a,b) memcpy((b),(a),sizeof(vec3_t))
typedef float vec3_t[3];typedef int qboolean;
typedef struct {int number,valid,powerups,flags;vec3_t origin;} aas_entityinfo_t;
typedef struct {int failure;} bot_moveresult_t;
typedef struct {int persistant[16];} playerState_t;
typedef struct {int enemy,ms,flags,tfl,weaponnum,lastenemyareanum,lastkilledplayer,lasthitcount,lastframe_health,enemysuicide,inventory[204],entitynum;float enemydeath_time,stand_time,ltg_time,chase_time;vec3_t lastenemyorigin,eye,viewangles;playerState_t cur_ps;void*ainode;} bot_state_t;
static float now;static int observer,intermission,dead,findenemy,entitydead,invisible,shooting,visible=1,wantschase,wantsretreat,chatkill,chathit,movefailure,events[64],eventn;
static void ev(int n){events[eventn++]=n;}static float FloatTime(void){return now;}static int BotIsObserver(bot_state_t*b){(void)b;return observer;}static int BotIntermission(bot_state_t*b){(void)b;return intermission;}static int BotIsDead(bot_state_t*b){(void)b;return dead;}static int BotFindEnemy(bot_state_t*b,int e){(void)b;(void)e;return findenemy;}static void BotEntityInfo(int n,aas_entityinfo_t*e){memset(e,0,sizeof(*e));e->number=n;e->origin[0]=100;}static int EntityIsDead(aas_entityinfo_t*e){(void)e;return entitydead;}static int EntityIsInvisible(aas_entityinfo_t*e){(void)e;return invisible;}static int EntityIsShooting(aas_entityinfo_t*e){(void)e;return shooting;}static float random_stub(void){return 0;}
#define random random_stub
static int BotPointAreaNum(vec3_t p){(void)p;return 7;}static int trap_AAS_AreaReachability(int a){return a!=0;}static void BotUpdateBattleInventory(bot_state_t*b,int e){(void)b;(void)e;ev(10);}static int BotChat_EnemySuicide(bot_state_t*b){(void)b;ev(11);return 1;}static int BotChat_Kill(bot_state_t*b){(void)b;return chatkill;}static int BotChat_HitNoDeath(bot_state_t*b){(void)b;return chathit;}static int BotChat_HitNoKill(bot_state_t*b){(void)b;return chathit;}static float BotChatTime(bot_state_t*b){(void)b;return 2;}static float BotEntityVisible(int n,vec3_t e,vec3_t a,float f,int x){(void)n;(void)e;(void)a;(void)f;(void)x;return (float)visible;}static int BotWantsToChase(bot_state_t*b){(void)b;return wantschase;}static void BotBattleUseItems(bot_state_t*b){(void)b;ev(20);}static int BotInLavaOrSlime(bot_state_t*b){(void)b;return 0;}static int BotCanAndWantsToRocketJump(bot_state_t*b){(void)b;return 0;}static void BotChooseWeapon(bot_state_t*b){(void)b;ev(21);}static bot_moveresult_t BotAttackMove(bot_state_t*b,int t){bot_moveresult_t r;(void)b;(void)t;r.failure=movefailure;ev(22);return r;}static void trap_BotResetAvoidReach(int m){(void)m;ev(23);}static void BotAIBlocked(bot_state_t*b,bot_moveresult_t*r,int a){(void)b;(void)r;(void)a;ev(24);}static void BotAimAtEnemy(bot_state_t*b){(void)b;ev(25);}static void BotCheckAttack(bot_state_t*b){(void)b;ev(26);}static int BotWantsToRetreat(bot_state_t*b){(void)b;return wantsretreat;}static void BotRecordNodeSwitch(bot_state_t*b,const char*a,const char*c,const char*d){(void)b;(void)a;(void)c;(void)d;ev(1);}static void trap_BotResetLastAvoidReach(int m){(void)m;ev(2);}
static int AINode_Battle_Fight(bot_state_t*);static int AINode_Battle_Chase(bot_state_t*b){(void)b;return 0;}static int AINode_Seek_LTG(bot_state_t*b){(void)b;return 0;}static int AINode_Stand(bot_state_t*b){(void)b;return 0;}static int AINode_Observer(bot_state_t*b){(void)b;return 0;}static int AINode_Intermission(bot_state_t*b){(void)b;return 0;}static int AINode_Respawn(bot_state_t*b){(void)b;return 0;}
static void AIEnter_Observer(bot_state_t*b,char*s){(void)s;b->ainode=AINode_Observer;ev(30);}static void AIEnter_Intermission(bot_state_t*b,char*s){(void)s;b->ainode=AINode_Intermission;ev(31);}static void AIEnter_Respawn(bot_state_t*b,char*s){(void)s;b->ainode=AINode_Respawn;ev(32);}static void AIEnter_Seek_LTG(bot_state_t*b,char*s){(void)s;b->ainode=AINode_Seek_LTG;ev(33);}static void AIEnter_Stand(bot_state_t*b,char*s){(void)s;b->ainode=AINode_Stand;ev(34);}static void AIEnter_Battle_Retreat(bot_state_t*b,char*s){(void)b;(void)s;ev(35);}
typedef struct{int integer;}vmCvar_t;static vmCvar_t bot_grapple;

/* Unchanged from code/game/ai_dmnet.c. */
void AIEnter_Battle_Fight(bot_state_t *bs, char *s) {BotRecordNodeSwitch(bs,"battle fight","",s);trap_BotResetLastAvoidReach(bs->ms);bs->ainode=AINode_Battle_Fight;}
void AIEnter_Battle_SuicidalFight(bot_state_t *bs, char *s) {BotRecordNodeSwitch(bs,"battle fight","",s);trap_BotResetLastAvoidReach(bs->ms);bs->ainode=AINode_Battle_Fight;bs->flags|=BFL_FIGHTSUICIDAL;}
void AIEnter_Battle_Chase(bot_state_t *bs, char *s) {BotRecordNodeSwitch(bs,"battle chase","",s);bs->chase_time=FloatTime();bs->ainode=AINode_Battle_Chase;}
int AINode_Battle_Fight(bot_state_t *bs) {int areanum;vec3_t target;aas_entityinfo_t entinfo;bot_moveresult_t moveresult;
	if(BotIsObserver(bs)){AIEnter_Observer(bs,"battle fight: observer");return qfalse;}if(BotIntermission(bs)){AIEnter_Intermission(bs,"battle fight: intermission");return qfalse;}if(BotIsDead(bs)){AIEnter_Respawn(bs,"battle fight: bot dead");return qfalse;}if(BotFindEnemy(bs,bs->enemy)){}if(bs->enemy<0){AIEnter_Seek_LTG(bs,"battle fight: no enemy");return qfalse;}BotEntityInfo(bs->enemy,&entinfo);
	if(bs->enemydeath_time){if(bs->enemydeath_time<FloatTime()-1.0){bs->enemydeath_time=0;if(bs->enemysuicide)BotChat_EnemySuicide(bs);if(bs->lastkilledplayer==bs->enemy&&BotChat_Kill(bs)){bs->stand_time=FloatTime()+BotChatTime(bs);AIEnter_Stand(bs,"battle fight: enemy dead");}else{bs->ltg_time=0;AIEnter_Seek_LTG(bs,"battle fight: enemy dead");}return qfalse;}}else{if(EntityIsDead(&entinfo))bs->enemydeath_time=FloatTime();}if(EntityIsInvisible(&entinfo)&&!EntityIsShooting(&entinfo)){if(random()<0.2){AIEnter_Seek_LTG(bs,"battle fight: invisible");return qfalse;}}
	VectorCopy(entinfo.origin,target);areanum=BotPointAreaNum(target);if(areanum&&trap_AAS_AreaReachability(areanum)){VectorCopy(target,bs->lastenemyorigin);bs->lastenemyareanum=areanum;}BotUpdateBattleInventory(bs,bs->enemy);if(bs->lastframe_health>bs->inventory[INVENTORY_HEALTH]){if(BotChat_HitNoDeath(bs)){bs->stand_time=FloatTime()+BotChatTime(bs);AIEnter_Stand(bs,"battle fight: chat health decreased");return qfalse;}}if(bs->cur_ps.persistant[PERS_HITS]>bs->lasthitcount){if(BotChat_HitNoKill(bs)){bs->stand_time=FloatTime()+BotChatTime(bs);AIEnter_Stand(bs,"battle fight: chat hit someone");return qfalse;}}
	if(!BotEntityVisible(bs->entitynum,bs->eye,bs->viewangles,360,bs->enemy)){if(BotWantsToChase(bs)){AIEnter_Battle_Chase(bs,"battle fight: enemy out of sight");return qfalse;}else{AIEnter_Seek_LTG(bs,"battle fight: enemy out of sight");return qfalse;}}BotBattleUseItems(bs);bs->tfl=TFL_DEFAULT;if(bot_grapple.integer)bs->tfl|=TFL_GRAPPLEHOOK;if(BotInLavaOrSlime(bs))bs->tfl|=TFL_LAVA|TFL_SLIME;if(BotCanAndWantsToRocketJump(bs))bs->tfl|=TFL_ROCKETJUMP;BotChooseWeapon(bs);moveresult=BotAttackMove(bs,bs->tfl);if(moveresult.failure){trap_BotResetAvoidReach(bs->ms);bs->ltg_time=0;}BotAIBlocked(bs,&moveresult,qfalse);BotAimAtEnemy(bs);BotCheckAttack(bs);if(!(bs->flags&BFL_FIGHTSUICIDAL)){if(BotWantsToRetreat(bs)){AIEnter_Battle_Retreat(bs,"battle fight: wants to retreat");return qtrue;}}return qtrue;}

static int obs;
#define OBS(x) do{obs++;if(!(x)){fprintf(stderr,"failure line %d\n",__LINE__);return 1;}}while(0)
static void reset(bot_state_t*b){memset(b,0,sizeof(*b));eventn=0;observer=intermission=dead=findenemy=entitydead=invisible=shooting=wantschase=wantsretreat=chatkill=chathit=movefailure=0;visible=1;now=100;b->enemy=1;b->lastkilledplayer=-1;b->inventory[29]=100;}
int main(void){bot_state_t b;
 reset(&b);AIEnter_Battle_Fight(&b,"x");OBS(b.ainode==AINode_Battle_Fight);OBS(eventn==2&&events[0]==1&&events[1]==2);
 reset(&b);AIEnter_Battle_SuicidalFight(&b,"x");OBS(b.ainode==AINode_Battle_Fight);OBS((b.flags&BFL_FIGHTSUICIDAL)!=0);
 reset(&b);AIEnter_Battle_Chase(&b,"x");OBS(b.ainode==AINode_Battle_Chase);OBS(b.chase_time==100);
 reset(&b);observer=1;OBS(!AINode_Battle_Fight(&b));OBS(b.ainode==AINode_Observer);
 reset(&b);intermission=1;OBS(!AINode_Battle_Fight(&b));reset(&b);dead=1;OBS(!AINode_Battle_Fight(&b));reset(&b);b.enemy=-1;OBS(!AINode_Battle_Fight(&b));
 reset(&b);b.enemydeath_time=98;b.lastkilledplayer=1;chatkill=1;OBS(!AINode_Battle_Fight(&b));OBS(b.ainode==AINode_Stand);OBS(b.stand_time==102);
 reset(&b);invisible=1;OBS(!AINode_Battle_Fight(&b));
 reset(&b);visible=0;wantschase=1;OBS(!AINode_Battle_Fight(&b));OBS(b.ainode==AINode_Battle_Chase);
 reset(&b);movefailure=1;OBS(AINode_Battle_Fight(&b));OBS(b.lastenemyareanum==7);OBS(events[eventn-4]==23);OBS(events[eventn-3]==24);OBS(events[eventn-2]==25&&events[eventn-1]==26);
 reset(&b);wantsretreat=1;OBS(AINode_Battle_Fight(&b));OBS(events[eventn-1]==35);reset(&b);wantsretreat=1;b.flags=BFL_FIGHTSUICIDAL;OBS(AINode_Battle_Fight(&b));OBS(events[eventn-1]==26);
 if(obs!=26){fprintf(stderr,"count %d\n",obs);return 1;}printf("PASS: 13 native Baseq3 battle-fight scenarios / 26 exact observations\n");return 0;}
