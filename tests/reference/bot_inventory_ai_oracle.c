#include <stdio.h>
#include <string.h>
#include <math.h>
#define WEAPON_RAISING 1
#define WEAPON_DROPPING 2
#define ENEMY_HORIZONTAL_DIST 200
#define ENEMY_HEIGHT 201
typedef float vec3_t[3];typedef struct{int weaponstate;}playerState_t;typedef struct{vec3_t origin;}aas_entityinfo_t;typedef struct{int client,ws,weaponnum;float weaponchange_time;int inventory[204];vec3_t origin;playerState_t cur_ps;}bot_state_t;
static int best=7;static float now=12.5f;static vec3_t enemyorigin={13.9f,-0.1f,9.9f};
static void trap_EA_SelectWeapon(int client,int weapon){printf("select:%d:%d\n",client,weapon);}
static int trap_BotChooseBestFightWeapon(int ws,int *inventory){(void)inventory;printf("choose:%d\n",ws);return best;}
static float FloatTime(void){puts("time");return now;}
static void BotEntityInfo(int enemy,aas_entityinfo_t *ent){printf("entity:%d\n",enemy);memcpy(ent->origin,enemyorigin,sizeof(vec3_t));}
#define VectorSubtract(a,b,c) do{(c)[0]=(a)[0]-(b)[0];(c)[1]=(a)[1]-(b)[1];(c)[2]=(a)[2]-(b)[2];}while(0)
#define VectorLength(v) sqrtf((v)[0]*(v)[0]+(v)[1]*(v)[1]+(v)[2]*(v)[2])
#include "bot_inventory_ai_under_test.inc"
static void dump(bot_state_t*b){if(b->weaponchange_time==0)printf("weapon=%d:0.\n",b->weaponnum);else printf("weapon=%d:%g\n",b->weaponnum,b->weaponchange_time);}
int main(void){bot_state_t b;memset(&b,0,sizeof(b));b.client=2;b.ws=4;b.weaponnum=5;b.cur_ps.weaponstate=WEAPON_RAISING;BotChooseWeapon(&b);dump(&b);b.cur_ps.weaponstate=WEAPON_DROPPING;BotChooseWeapon(&b);dump(&b);b.cur_ps.weaponstate=0;best=5;BotChooseWeapon(&b);dump(&b);best=7;BotChooseWeapon(&b);dump(&b);b.origin[0]=1.4f;b.origin[1]=-4.1f;b.origin[2]=2.2f;BotUpdateBattleInventory(&b,9);printf("battle=%d:%d\n",b.inventory[200],b.inventory[201]);return 0;}
