/* SPDX-License-Identifier: GPL-2.0-or-later */
/* Focused native oracle directly transcribing ai_main.c client-resource order. */
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <string.h>

typedef struct { char characterfile[144]; float skill; char team[144]; } bot_settings_t;
typedef struct {
  int inuse, client, entitynum, character, gs, ws, cs, ms, setupcount;
  float entergame_time, walker; void *checkpoints, *patrolpoints; bot_settings_t settings;
} bot_state_t;

static bot_state_t storage[64], *botstates[64];
static int events[256], event_count, numbots, bot_interbreed;
static int aas_ok=1, character_result=77, item_result, weapon_result, chat_result, chat_exit;
static void ev(int value) { events[event_count++]=value; }
static int AAS_Initialized(void){ev(1);return aas_ok;}
static int BotLoadCharacter(const char*f,float s){(void)f;(void)s;ev(2);return character_result;}
static int BotAllocGoalState(int c){(void)c;ev(3);return 101;}
static void Characteristic_String(int c,int i,char*out,int n){(void)c;(void)n;ev(i==40?4:i==3?8:i==21?12:i==22?13:16);strcpy(out,i==40?"items.c":i==3?"weapons.c":i==21?"chat.c":i==22?"Ranger":"Female");}
static int BotLoadItemWeights(int h,const char*f){(void)h;(void)f;ev(5);return item_result;}
static void BotFreeGoalState(int h){(void)h;ev(6);}
static int BotAllocWeaponState(void){ev(7);return 102;}
static int BotLoadWeaponWeights(int h,const char*f){(void)h;(void)f;ev(9);return weapon_result;}
static void BotFreeWeaponState(int h){(void)h;ev(10);}
static int BotAllocChatState(void){ev(11);return 103;}
static int BotLoadChatFile(int h,const char*f,const char*n){(void)h;(void)f;(void)n;ev(14);return chat_result;}
static void BotFreeChatState(int h){(void)h;ev(15);}
static void BotSetChatGender(int h,int g){(void)h;(void)g;ev(17);}
static float FloatTime(void){ev(18);return 12.5f;}
static int BotAllocMoveState(void){ev(19);return 104;}
static float Characteristic_BFloat(int c,int i,float a,float b){(void)c;(void)i;(void)a;(void)b;ev(20);return .75f;}
static int Cvar_Integer(const char*n){(void)n;ev(21);return 1;}
static void BotLibVarSet(const char*n,const char*v){(void)n;(void)v;ev(22);}
static void BotChatTest(bot_state_t*b){(void)b;ev(23);}
static void BotScheduleBotThink(void){ev(24);}
static void BotMutateGoalFuzzyLogic(int h,float a){(void)h;(void)a;ev(25);}
static void BotReadSessionData(bot_state_t*b){(void)b;ev(26);}
static void BotWriteSessionData(bot_state_t*b){(void)b;ev(30);}
static int BotChat_ExitGame(bot_state_t*b){(void)b;ev(31);return chat_exit;}
static void BotEnterChat(int h,int c,int t){(void)h;(void)c;(void)t;ev(32);}
static void BotFreeMoveState(int h){(void)h;ev(33);}
static void BotFreeCharacter(int h){(void)h;ev(37);}
static void BotFreeWaypoints(void*p){(void)p;ev(38);}
static void BotClearActivateGoalStack(bot_state_t*b){(void)b;ev(39);}

static int BotAISetupClient(int client, bot_settings_t *settings, int restart) {
  char filename[144], name[144], gender[144]; bot_state_t *bs; int errnum;
  if (!botstates[client]) botstates[client] = &storage[client]; bs = botstates[client];
  if (bs && bs->inuse) return 0;
  if (!AAS_Initialized()) return 0;
  bs->character=BotLoadCharacter(settings->characterfile,settings->skill); if(!bs->character)return 0;
  memcpy(&bs->settings,settings,sizeof(*settings)); bs->gs=BotAllocGoalState(client);
  Characteristic_String(bs->character,40,filename,144); errnum=BotLoadItemWeights(bs->gs,filename);
  if(errnum){BotFreeGoalState(bs->gs);return 0;}
  bs->ws=BotAllocWeaponState(); Characteristic_String(bs->character,3,filename,144);
  errnum=BotLoadWeaponWeights(bs->ws,filename); if(errnum){BotFreeGoalState(bs->gs);BotFreeWeaponState(bs->ws);return 0;}
  bs->cs=BotAllocChatState(); Characteristic_String(bs->character,21,filename,144); Characteristic_String(bs->character,22,name,144);
  errnum=BotLoadChatFile(bs->cs,filename,name); if(errnum){BotFreeChatState(bs->cs);BotFreeGoalState(bs->gs);BotFreeWeaponState(bs->ws);return 0;}
  Characteristic_String(bs->character,1,gender,144); BotSetChatGender(bs->cs,(gender[0]=='f'||gender[0]=='F')?1:(gender[0]=='m'||gender[0]=='M')?2:0);
  bs->inuse=1;bs->client=client;bs->entitynum=client;bs->setupcount=4;bs->entergame_time=FloatTime();bs->ms=BotAllocMoveState();bs->walker=Characteristic_BFloat(bs->character,48,0,1);numbots++;
  if(Cvar_Integer("bot_testichat")){BotLibVarSet("bot_testichat","1");BotChatTest(bs);} BotScheduleBotThink();
  if(bot_interbreed)BotMutateGoalFuzzyLogic(bs->gs,1);if(restart)BotReadSessionData(bs);return 1;
}
static int BotAIShutdownClient(int client,int restart){
  bot_state_t*bs=botstates[client];if(!bs||!bs->inuse)return 0;if(restart)BotWriteSessionData(bs);
  if(BotChat_ExitGame(bs))BotEnterChat(bs->cs,bs->client,0);BotFreeMoveState(bs->ms);BotFreeGoalState(bs->gs);BotFreeChatState(bs->cs);BotFreeWeaponState(bs->ws);BotFreeCharacter(bs->character);
  BotFreeWaypoints(bs->checkpoints);BotFreeWaypoints(bs->patrolpoints);BotClearActivateGoalStack(bs);memset(bs,0,sizeof(*bs));bs->inuse=0;numbots--;return 1;
}
static void reset_case(void){memset(storage,0,sizeof(storage));memset(botstates,0,sizeof(botstates));event_count=0;numbots=0;bot_interbreed=0;aas_ok=1;character_result=77;item_result=weapon_result=chat_result=chat_exit=0;}
static int tail(const int*v,int n){int i;if(event_count<n)return 0;for(i=0;i<n;i++)if(events[event_count-n+i]!=v[i])return 0;return 1;}
#define CHECK(x) do{if(!(x)){fprintf(stderr,"oracle check failed at line %d\n",__LINE__);return 1;}}while(0)
int main(void){bot_settings_t s={{0},3.0f,{0}};const int item[]={4,5,6},weapon[]={8,9,6,10},chat[]={12,13,14,15,6,10},down[]={30,31,32,33,6,15,10,37,38,38,39};strcpy(s.characterfile,"bots/sarge_c.c");strcpy(s.team,"red");
  reset_case();bot_interbreed=1;CHECK(BotAISetupClient(4,&s,1));CHECK(numbots==1&&storage[4].ms==104&&storage[4].walker==.75f&&events[event_count-2]==25&&events[event_count-1]==26);
  reset_case();item_result=9;CHECK(!BotAISetupClient(2,&s,0)&&tail(item,3)&&storage[2].character==77);
  reset_case();weapon_result=9;CHECK(!BotAISetupClient(2,&s,0)&&tail(weapon,4));
  reset_case();chat_result=9;CHECK(!BotAISetupClient(2,&s,0)&&tail(chat,6));
  reset_case();aas_ok=0;CHECK(!BotAISetupClient(2,&s,0)&&event_count==1);
  reset_case();character_result=0;CHECK(!BotAISetupClient(2,&s,0)&&event_count==2);
  reset_case();CHECK(BotAISetupClient(6,&s,0));storage[6].checkpoints=(void*)1;storage[6].patrolpoints=(void*)2;chat_exit=1;event_count=0;CHECK(BotAIShutdownClient(6,1)&&tail(down,11)&&numbots==0&&!storage[6].inuse&&storage[6].character==0);
  CHECK(!BotAIShutdownClient(6,0));puts("PASS: 8 native bot client resource scenarios");return 0;
}
