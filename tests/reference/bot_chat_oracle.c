/* GPL-2.0-or-later. Harness for verbatim ai_chat.c helper bodies. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX_CLIENTS 64
#define MAX_INFO_STRING 1024
#define CS_PLAYERS 100
#define PERS_SCORE 0
#define qfalse 0
#define qtrue 1
#define TEAM_SPECTATOR 3
#define MOD_UNKNOWN 0
#define MOD_SHOTGUN 1
#define MOD_GAUNTLET 2
#define MOD_MACHINEGUN 3
#define MOD_GRENADE 4
#define MOD_GRENADE_SPLASH 5
#define MOD_ROCKET 6
#define MOD_ROCKET_SPLASH 7
#define MOD_PLASMA 8
#define MOD_PLASMA_SPLASH 9
#define MOD_RAILGUN 10
#define MOD_LIGHTNING 11
#define MOD_BFG 12
#define MOD_BFG_SPLASH 13
#define MOD_GRAPPLE 23
#define CHARACTERISTIC_CHAT_CPM 10
typedef struct { int persistant[16]; } playerState_t;
typedef struct { playerState_t cur_ps; int character; } bot_state_t;
static const char *configs[MAX_CLIENTS];
static int scores[MAX_CLIENTS];
static const char *names[MAX_CLIENTS];
static float random_value;
static int trap_Cvar_VariableIntegerValue(const char *name) { (void)name; return 4; }
static void trap_GetConfigstring(int key, char *buf, int size) { const char *s=configs[key-CS_PLAYERS]; strncpy(buf,s?s:"",(size_t)size-1);buf[size-1]=0; }
static const char *Info_ValueForKey(const char *s,const char *key) {
  static char out[64]; const char *p=s; out[0]=0;
  while (*p) { const char *k,*v; size_t n;if(*p=='\\')p++;k=p;while(*p&&*p!='\\')p++;n=(size_t)(p-k);if(*p)p++;v=p;while(*p&&*p!='\\')p++;if(strlen(key)==n&&!strncmp(k,key,n)){n=(size_t)(p-v);if(n>=sizeof(out))n=sizeof(out)-1;memcpy(out,v,n);out[n]=0;return out;} }
  return out;
}
static void BotAI_GetClientState(int i,playerState_t *ps){memset(ps,0,sizeof(*ps));ps->persistant[PERS_SCORE]=scores[i];}
static void EasyClientName(int i,char *out,int size){strncpy(out,names[i]?names[i]:"",(size_t)size-1);out[size-1]=0;}
static void trap_GetServerinfo(char *out,int size){strncpy(out,"\\mapname\\q3dm17",(size_t)size-1);out[size-1]=0;}
static int trap_Characteristic_BInteger(int c,int index,int min,int max){(void)c;(void)index;(void)min;(void)max;return 333;}
static float bot_random(void){return random_value;}
#define random bot_random
#include "bot_chat_under_test.inc"
int main(void) {
  bot_state_t bs; memset(&bs,0,sizeof(bs));
  configs[0]="\\n\\Ranger\\t\\0";configs[1]="\\n\\Sarge\\t\\0";configs[2]="\\n\\Spec\\t\\3";configs[3]="";
  names[0]="Ranger";names[1]="Sarge";names[2]="Spec";scores[0]=12;scores[1]=5;scores[2]=99;bs.cur_ps.persistant[0]=12;
  printf("active|%d\n",BotNumActivePlayers());
  printf("rank|%d|%d|%s|%s\n",BotIsFirstInRankings(&bs),BotIsLastInRankings(&bs),BotFirstClientInRankings(),BotLastClientInRankings());
  printf("map|%s\n",BotMapTitle());
  printf("weapon|%s|%s|%s|%s|%s\n",BotWeaponNameForMeansOfDeath(MOD_GAUNTLET),BotWeaponNameForMeansOfDeath(MOD_GRENADE_SPLASH),BotWeaponNameForMeansOfDeath(MOD_BFG),BotWeaponNameForMeansOfDeath(MOD_GRAPPLE),BotWeaponNameForMeansOfDeath(99));
  random_value=0.0f;printf("random|%s",BotRandomWeaponName());random_value=0.90f;printf("|%s\n",BotRandomWeaponName());
  printf("time|%.1f\n",BotChatTime(&bs));
  return 0;
}
