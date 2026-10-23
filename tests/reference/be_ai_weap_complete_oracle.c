#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX_CLIENTS 64
#define MAX_STRINGFIELD 80
#define PRT_ERROR 3
#define PRT_FATAL 4
#define BLERR_NOERROR 0
#define BLERR_CANNOTLOADWEAPONWEIGHTS 11
#define BLERR_CANNOTLOADWEAPONCONFIG 12
#define qfalse 0
#define qtrue 1
typedef struct projectileinfo_s { char name[80],model[80];int flags;float gravity;int damage;float radius;int visdamage,damagetype,healthinc;float push,detonation,bounce,bouncefric,bouncestop; } projectileinfo_t;
typedef struct weaponinfo_s { int valid,number;char name[80],model[80];int level,weaponindex,flags;char projectile[80];int numprojectiles;float hspread,vspread,speed,acceleration,recoil[3],offset[3],angleoffset[3],extrazvelocity;int ammoamount,ammoindex;float activate,reload,spinup,spindown;projectileinfo_t proj; } weaponinfo_t;
typedef struct weaponconfig_s { int numweapons,numprojectiles;projectileinfo_t *projectileinfo;weaponinfo_t *weaponinfo; } weaponconfig_t;
typedef struct weightconfig_s { int marker; } weightconfig_t;
typedef struct bot_weaponstate_s { struct weightconfig_s *weaponweightconfig;int *weaponweightindex; } bot_weaponstate_t;
typedef struct { void (*Print)(int,const char *,...); } bot_import_t;
static bot_import_t botimport;static bot_weaponstate_t *botweaponstates[MAX_CLIENTS+1];static weaponconfig_t *weaponconfig;static int allocations;
static void print_stub(int level,const char *format,...) {(void)level;(void)format;}
static void *GetClearedMemory(size_t size){void *p=calloc(1,size);if(p)allocations++;return p;}
static void FreeMemory(void *p){if(p){allocations--;free(p);}}
static void FreeWeightConfig(weightconfig_t *p){FreeMemory(p);}
static weightconfig_t *ReadWeightConfig(char *filename){(void)filename;return (weightconfig_t *)GetClearedMemory(sizeof(weightconfig_t));}
static int FindFuzzyWeight(weightconfig_t *config,char *name){(void)config;if(!strcmp(name,"First"))return 7;if(!strcmp(name,"Second"))return 3;return -1;}
static float FuzzyWeight(int *inventory,weightconfig_t *config,int index){(void)config;return (float)inventory[index];}
#define Com_Memcpy memcpy
#include "be_ai_weap_complete_under_test.inc"
int main(void){int handle,inventory[256]={0};weaponinfo_t info;
 botimport.Print=print_stub;weaponconfig=(weaponconfig_t *)GetClearedMemory(sizeof(*weaponconfig));weaponconfig->numweapons=32;weaponconfig->weaponinfo=(weaponinfo_t *)GetClearedMemory(32*sizeof(weaponinfo_t));
 weaponconfig->weaponinfo[1].valid=1;weaponconfig->weaponinfo[1].number=1;strcpy(weaponconfig->weaponinfo[1].name,"First");weaponconfig->weaponinfo[2].valid=1;weaponconfig->weaponinfo[2].number=2;strcpy(weaponconfig->weaponinfo[2].name,"Second");
 printf("valid=%d,%d,%d\n",BotValidWeaponNumber(1),BotValidWeaponNumber(32),BotValidWeaponNumber(33));handle=BotAllocWeaponState();printf("state=%d,%d\n",handle,BotWeaponStateFromHandle(handle)!=NULL);
 printf("load=%d\n",BotLoadWeaponWeights(handle,"bots/test_w.c"));printf("map=%d,%d\n",botweaponstates[handle]->weaponweightindex[1],botweaponstates[handle]->weaponweightindex[2]);
 inventory[7]=10;inventory[3]=20;printf("choose=%d,",BotChooseBestFightWeapon(handle,inventory));inventory[7]=20;printf("%d,",BotChooseBestFightWeapon(handle,inventory));inventory[7]=0;inventory[3]=-1;printf("%d\n",BotChooseBestFightWeapon(handle,inventory));
 memset(&info,0,sizeof(info));BotGetWeaponInfo(handle,2,&info);printf("info=%d,%s\n",info.number,info.name);BotResetWeaponState(handle);printf("reset=%d\n",botweaponstates[handle]->weaponweightconfig!=NULL);
 BotFreeWeaponState(handle);printf("free=%d\n",botweaponstates[handle]==NULL);FreeMemory(weaponconfig->weaponinfo);FreeMemory(weaponconfig);weaponconfig=NULL;printf("shutdown=%d\n",allocations);return 0;}
