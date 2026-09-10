#include <stdio.h>
#include <string.h>
#define MAX_ITEMS 204
#define STAT_HEALTH 0
#define STAT_HOLDABLE_ITEM 1
#define STAT_WEAPONS 2
#define STAT_ARMOR 3
#define WP_GAUNTLET 1
#define WP_MACHINEGUN 2
#define WP_SHOTGUN 3
#define WP_GRENADE_LAUNCHER 4
#define WP_ROCKET_LAUNCHER 5
#define WP_LIGHTNING 6
#define WP_RAILGUN 7
#define WP_PLASMAGUN 8
#define WP_BFG 9
#define WP_GRAPPLING_HOOK 10
#define PW_QUAD 1
#define PW_BATTLESUIT 2
#define PW_HASTE 3
#define PW_INVIS 4
#define PW_REGEN 5
#define PW_FLIGHT 6
#define PW_REDFLAG 7
#define PW_BLUEFLAG 8
#define INVENTORY_ARMOR 1
#define INVENTORY_GAUNTLET 4
#define INVENTORY_SHOTGUN 5
#define INVENTORY_MACHINEGUN 6
#define INVENTORY_GRENADELAUNCHER 7
#define INVENTORY_ROCKETLAUNCHER 8
#define INVENTORY_LIGHTNING 9
#define INVENTORY_RAILGUN 10
#define INVENTORY_PLASMAGUN 11
#define INVENTORY_BFG10K 13
#define INVENTORY_GRAPPLINGHOOK 14
#define INVENTORY_SHELLS 18
#define INVENTORY_BULLETS 19
#define INVENTORY_GRENADES 20
#define INVENTORY_CELLS 21
#define INVENTORY_LIGHTNINGAMMO 22
#define INVENTORY_ROCKETS 23
#define INVENTORY_SLUGS 24
#define INVENTORY_BFGAMMO 25
#define INVENTORY_HEALTH 29
#define INVENTORY_TELEPORTER 30
#define INVENTORY_MEDKIT 31
#define INVENTORY_QUAD 35
#define INVENTORY_ENVIRONMENTSUIT 36
#define INVENTORY_HASTE 37
#define INVENTORY_INVISIBILITY 38
#define INVENTORY_REGEN 39
#define INVENTORY_FLIGHT 40
#define INVENTORY_REDFLAG 45
#define INVENTORY_BLUEFLAG 46
#define MODELINDEX_TELEPORTER 26
#define MODELINDEX_MEDKIT 27
typedef struct{int stats[16],powerups[16],ammo[16];}playerState_t;typedef struct{int inventory[MAX_ITEMS];playerState_t cur_ps;}bot_state_t;
static void BotCheckItemPickup(bot_state_t *bs,int *old){(void)bs;printf("pickup-old=%d\n",old[1]);}
#include "bot_inventory_update_under_test.inc"
static void dump(bot_state_t*b){int i,idx[]={1,4,5,6,7,8,9,10,11,13,14,18,19,20,21,22,23,24,25,29,30,31,35,36,37,38,39,40,45,46};for(i=0;i<30;i++)printf("%s%d",i?",":"",b->inventory[idx[i]]);puts("");}
int main(void){bot_state_t b;int i;memset(&b,0,sizeof(b));b.inventory[1]=77;b.cur_ps.stats[0]=91;b.cur_ps.stats[3]=42;b.cur_ps.stats[2]=(1<<1)|(1<<3)|(1<<5)|(1<<9);b.cur_ps.stats[1]=26;for(i=0;i<16;i++)b.cur_ps.ammo[i]=i*3;b.cur_ps.powerups[1]=100;b.cur_ps.powerups[4]=200;b.cur_ps.powerups[7]=300;BotUpdateInventory(&b);dump(&b);b.cur_ps.stats[1]=27;b.cur_ps.powerups[1]=0;b.cur_ps.powerups[8]=1;BotUpdateInventory(&b);dump(&b);return 0;}
