#include <stddef.h>
#include <stdio.h>
#include <string.h>

#define MAX_STRINGFIELD 80
#define MAX_CLIENTS 64

typedef struct projectileinfo_s {
  char name[MAX_STRINGFIELD]; char model[MAX_STRINGFIELD]; int flags; float gravity; int damage; float radius;
  int visdamage; int damagetype; int healthinc; float push; float detonation; float bounce; float bouncefric; float bouncestop;
} projectileinfo_t;
typedef struct weaponinfo_s {
  int valid; int number; char name[MAX_STRINGFIELD]; char model[MAX_STRINGFIELD]; int level; int weaponindex; int flags;
  char projectile[MAX_STRINGFIELD]; int numprojectiles; float hspread; float vspread; float speed; float acceleration;
  float recoil[3]; float offset[3]; float angleoffset[3]; float extrazvelocity; int ammoamount; int ammoindex;
  float activate; float reload; float spinup; float spindown; projectileinfo_t proj;
} weaponinfo_t;
typedef struct { int numweapons; weaponinfo_t weaponinfo[32]; } weaponconfig_t;
typedef struct { void *weaponweightconfig; int *weaponweightindex; } bot_weaponstate_t;

static weaponconfig_t config_storage;
static weaponconfig_t *weaponconfig;
static bot_weaponstate_t state;
static bot_weaponstate_t *states[MAX_CLIENTS+1];
static float FuzzyWeight(int *inventory, void *config, int index) { (void)config; return (float)inventory[index]; }
static int BotChooseBestFightWeapon(int weaponstate, int *inventory) {
  int i,index,bestweapon; float weight,bestweight; weaponconfig_t *wc; bot_weaponstate_t *ws;
  ws=(weaponstate>0&&weaponstate<=MAX_CLIENTS)?states[weaponstate]:NULL;if(!ws)return 0;wc=weaponconfig;if(!wc)return 0;if(!ws->weaponweightconfig)return 0;
  bestweight=0;bestweapon=0;
  for(i=0;i<wc->numweapons;i++){if(!wc->weaponinfo[i].valid)continue;index=ws->weaponweightindex[i];if(index<0)continue;weight=FuzzyWeight(inventory,ws->weaponweightconfig,index);if(weight>bestweight){bestweight=weight;bestweapon=i;}}
  return bestweapon;
}
static void BotGetWeaponInfo(int weaponstate,int weapon,weaponinfo_t *info) {
  bot_weaponstate_t *ws;if(weapon<=0||!weaponconfig||weapon>=weaponconfig->numweapons)return;
  ws=(weaponstate>0&&weaponstate<=MAX_CLIENTS)?states[weaponstate]:NULL;if(!ws)return;
  memcpy(info,&weaponconfig->weaponinfo[weapon],sizeof(*info));
}

int main(void) {
  int index[32],inventory[256]={0},i,bad=0;weaponinfo_t output;
  memset(&config_storage,0,sizeof(config_storage));weaponconfig=&config_storage;config_storage.numweapons=32;for(i=0;i<32;i++)index[i]=-1;
  config_storage.weaponinfo[1].valid=1;config_storage.weaponinfo[1].number=1;memcpy(config_storage.weaponinfo[1].name,"First",6);config_storage.weaponinfo[2].valid=1;index[1]=7;index[2]=3;state.weaponweightconfig=&state;state.weaponweightindex=index;states[1]=&state;
  inventory[7]=10;inventory[3]=20;bad+=BotChooseBestFightWeapon(1,inventory)!=2;
  inventory[7]=20;bad+=BotChooseBestFightWeapon(1,inventory)!=1;
  inventory[7]=0;inventory[3]=-1;bad+=BotChooseBestFightWeapon(1,inventory)!=0;bad+=BotChooseBestFightWeapon(0,inventory)!=0;
  state.weaponweightconfig=NULL;bad+=BotChooseBestFightWeapon(1,inventory)!=0;state.weaponweightconfig=&state;
  bad+=sizeof(projectileinfo_t)!=208;bad+=sizeof(weaponinfo_t)!=552;
  bad+=offsetof(weaponinfo_t,name)!=8;bad+=offsetof(weaponinfo_t,projectile)!=180;bad+=offsetof(weaponinfo_t,recoil)!=280;bad+=offsetof(weaponinfo_t,proj)!=344;
  bad+=offsetof(projectileinfo_t,damage)!=168;bad+=offsetof(projectileinfo_t,bouncestop)!=204;
  memset(&output,0xA5,sizeof(output));BotGetWeaponInfo(1,1,&output);bad+=memcmp(&output,&config_storage.weaponinfo[1],sizeof(output))!=0;
  memset(&output,0xA5,sizeof(output));BotGetWeaponInfo(1,0,&output);bad+=((unsigned char *)&output)[0]!=0xA5;
  if(bad){printf("FAIL: %d\n",bad);return 1;}puts("PASS: 15 native weapon-combat ABI observations");return 0;
}
