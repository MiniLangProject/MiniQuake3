#include <stdio.h>
#include <string.h>
#define qfalse 0
#define qtrue 1
#define INVENTORY_HEALTH 0
typedef struct { int client,cs,ms,gs,chatto,enemy,respawn_wait,lastframe_health,inventory[4]; float stand_time,standfindenemy_time,respawn_time,respawnchat_time; int (*ainode)(void*); } bot_state_t;
static float now=100,randv=.5f;static int observer,intermission,dead,findenemy,endchat,startchat,hitchat,deathchat,events[64],eventn,scenarios,observations;
static void ev(int x){events[eventn++]=x;}static void reset(bot_state_t*b){memset(b,0,sizeof(*b));b->client=1;b->cs=2;b->ms=3;b->gs=4;b->enemy=9;b->lastframe_health=b->inventory[0]=100;observer=intermission=dead=findenemy=endchat=startchat=hitchat=deathchat=0;randv=.5f;eventn=0;}
#define SC() scenarios++
#define OBS(x) do{observations++;if(!(x)){printf("FAIL:%d\n",__LINE__);return 1;}}while(0)
static float FloatTime(void){return now;}static float qrandom(void){return randv;}
#define random qrandom
static int AINode_Battle_Fight(bot_state_t*b){(void)b;return 0;}static int AINode_Seek_LTG(bot_state_t*b){(void)b;return 0;}
int AINode_Intermission(bot_state_t*);int AINode_Observer(bot_state_t*);int AINode_Stand(bot_state_t*);int AINode_Respawn(bot_state_t*);void AIEnter_Stand(bot_state_t*,char*);
static void BotRecordNodeSwitch(bot_state_t*b,char*a,char*c,char*d){(void)b;(void)a;(void)c;(void)d;ev(1);}static void BotResetState(bot_state_t*b){(void)b;ev(2);}static int BotChat_EndLevel(bot_state_t*b){(void)b;return endchat;}static void trap_BotEnterChat(int cs,int target,int mode){(void)cs;(void)target;(void)mode;ev(3);}static int BotIntermission(bot_state_t*b){(void)b;return intermission;}static int BotChat_StartLevel(bot_state_t*b){(void)b;return startchat;}static float BotChatTime(bot_state_t*b){(void)b;return 2;}static int BotIsObserver(bot_state_t*b){(void)b;return observer;}static int BotChat_HitTalking(bot_state_t*b){(void)b;return hitchat;}static int BotFindEnemy(bot_state_t*b,int x){(void)x;if(findenemy)b->enemy=7;return findenemy;}static void AIEnter_Battle_Fight(bot_state_t*b,char*s){(void)s;b->ainode=(void*)AINode_Battle_Fight;ev(4);}static void trap_EA_Talk(int c){(void)c;ev(5);}static void AIEnter_Seek_LTG(bot_state_t*b,char*s){(void)s;b->ainode=(void*)AINode_Seek_LTG;ev(6);}static void trap_BotResetMoveState(int x){(void)x;ev(7);}static void trap_BotResetGoalState(int x){(void)x;ev(8);}static void trap_BotResetAvoidGoals(int x){(void)x;ev(9);}static void trap_BotResetAvoidReach(int x){(void)x;ev(10);}static int BotChat_Death(bot_state_t*b){(void)b;return deathchat;}static int BotIsDead(bot_state_t*b){(void)b;return dead;}static void trap_EA_Respawn(int c){(void)c;ev(11);}
#include "bot_idle_nodes_original.inc"
int main(void){bot_state_t b;
 reset(&b);SC();AIEnter_Observer(&b,"x");OBS(eventn==2);OBS(b.ainode==(void*)AINode_Observer);
 reset(&b);observer=1;AIEnter_Observer(&b,"x");SC();OBS(AINode_Observer(&b));OBS(b.ainode==(void*)AINode_Observer);
 reset(&b);AIEnter_Observer(&b,"x");SC();OBS(AINode_Observer(&b));OBS(b.ainode==(void*)AINode_Stand);
 reset(&b);intermission=1;SC();AIEnter_Intermission(&b,"x");OBS(b.ainode==(void*)AINode_Intermission);OBS(AINode_Intermission(&b));
 reset(&b);AIEnter_Intermission(&b,"x");SC();OBS(AINode_Intermission(&b));OBS(b.ainode==(void*)AINode_Stand);OBS(b.stand_time==102);
 reset(&b);startchat=1;AIEnter_Intermission(&b,"x");SC();OBS(AINode_Intermission(&b));OBS(b.stand_time==102);
 reset(&b);SC();AIEnter_Stand(&b,"x");OBS(b.standfindenemy_time==101);OBS(b.ainode==(void*)AINode_Stand);
 reset(&b);b.standfindenemy_time=99;b.stand_time=110;findenemy=1;SC();OBS(!AINode_Stand(&b));OBS(b.ainode==(void*)AINode_Battle_Fight);
 reset(&b);b.standfindenemy_time=110;b.stand_time=99;SC();OBS(!AINode_Stand(&b));OBS(b.ainode==(void*)AINode_Seek_LTG);OBS(events[eventn-2]==3);
 reset(&b);deathchat=1;SC();AIEnter_Respawn(&b,"x");OBS(b.respawn_time==102&&b.respawnchat_time==100&&!b.respawn_wait);OBS(events[1]==7&&events[4]==10);
 reset(&b);SC();AIEnter_Respawn(&b,"x");OBS(b.respawn_time==101.5f&&b.respawnchat_time==0);OBS(!b.respawn_wait);
 reset(&b);dead=1;b.respawn_wait=1;SC();OBS(AINode_Respawn(&b));OBS(events[eventn-1]==11);
 reset(&b);b.respawn_wait=1;SC();OBS(AINode_Respawn(&b));OBS(b.ainode==(void*)AINode_Seek_LTG);
 reset(&b);dead=1;b.respawn_time=99;b.respawnchat_time=99;SC();OBS(AINode_Respawn(&b));OBS(b.respawn_wait&&b.enemy==-1);OBS(events[eventn-3]==11&&events[eventn-2]==3&&events[eventn-1]==5);
 printf("PASS: %d native Baseq3 idle-node scenarios / %d exact observations\n",scenarios,observations);return 0;}
