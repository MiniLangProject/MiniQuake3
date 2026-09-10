/* Copyright (C) 1999-2005 Id Software, Inc. GPL-2.0-or-later. */
#include <stdio.h>
#include <string.h>
typedef int qboolean; typedef float vec3_t[3];
#define qfalse 0
#define qtrue 1
#define LTG_TEAMHELP 1
#define LTG_TEAMACCOMPANY 2
#define LTG_DEFENDKEYAREA 3
#define LTG_GETFLAG 4
#define LTG_RUSHBASE 5
#define LTG_CAMP 7
#define LTG_CAMPORDER 8
#define LTG_PATROL 9
#define INVENTORY_ROCKETLAUNCHER 8
#define INVENTORY_RAILGUN 10
#define INVENTORY_BFG10K 13
#define INVENTORY_ROCKETS 23
#define INVENTORY_SLUGS 24
#define INVENTORY_BFGAMMO 25
#define CHARACTERISTIC_CAMPER 44
#define TFL_DEFAULT 0x011c0fbe
typedef struct{int areanum,entitynum,iteminfo,number,flags;vec3_t origin,mins,maxs;}bot_goal_t;
typedef struct{int client,character,ltgtype,teammate,decisionmaker,ordered,areanum,tfl,gs;float teammessage_time,teamgoal_time,camp_time,arrive_time,ltg_time;vec3_t origin;bot_goal_t teamgoal;int inventory[204];}bot_state_t;
static float camper=.5f,now_value=20,random_value=.25f,aggression=60;static int travel_result=100,remove_count,removed[32],item_calls;
static int scenarios,observations;
#define SCENARIO() (++scenarios)
#define OBS(x) do{++observations;if(!(x)){printf("FAIL line %d\n",__LINE__);return 1;}}while(0)
static float FloatTime(void){return now_value;}static float random(void){return random_value;}
static float trap_Characteristic_BFloat(int c,int ch,float l,float h){(void)c;(void)ch;(void)l;(void)h;return camper;}
static float BotAggression(bot_state_t*b){(void)b;return aggression;}
static int trap_BotGetNextCampSpotGoal(int cursor,bot_goal_t*g){if(cursor)return 0;memset(g,0,sizeof(*g));g->areanum=10;g->number=1;g->origin[0]=10;return 1;}
static int trap_AAS_AreaTravelTimeToGoalArea(int a,vec3_t o,int g,int t){(void)a;(void)o;(void)g;(void)t;return travel_result;}
static int trap_BotGetLevelItemGoal(int n,char*name,bot_goal_t*g){(void)name;item_calls++;if(n>=0)return -1;memset(g,0,sizeof(*g));g->number=100;return 0;}
static void trap_BotRemoveFromAvoidGoals(int gs,int n){(void)gs;removed[remove_count++]=n;}

void BotGoCamp(bot_state_t *bs, bot_goal_t *goal) {float c;bs->decisionmaker=bs->client;bs->teammessage_time=0;bs->ltgtype=LTG_CAMP;memcpy(&bs->teamgoal,goal,sizeof(bot_goal_t));c=trap_Characteristic_BFloat(bs->character,CHARACTERISTIC_CAMPER,0,1);if(c>0.99)bs->teamgoal_time=FloatTime()+99999;else bs->teamgoal_time=FloatTime()+120+180*c+random()*15;bs->camp_time=FloatTime();bs->teammate=0;bs->arrive_time=1;}
int BotWantsToCamp(bot_state_t *bs) {float c;int cs,traveltime,besttraveltime;bot_goal_t goal,bestgoal;c=trap_Characteristic_BFloat(bs->character,CHARACTERISTIC_CAMPER,0,1);if(c<0.1)return qfalse;if(bs->ltgtype==LTG_TEAMHELP||bs->ltgtype==LTG_TEAMACCOMPANY||bs->ltgtype==LTG_DEFENDKEYAREA||bs->ltgtype==LTG_GETFLAG||bs->ltgtype==LTG_RUSHBASE||bs->ltgtype==LTG_CAMP||bs->ltgtype==LTG_CAMPORDER||bs->ltgtype==LTG_PATROL)return qfalse;if(bs->camp_time>FloatTime()-60+300*(1-c))return qfalse;if(random()>c){bs->camp_time=FloatTime();return qfalse;}if(BotAggression(bs)<50)return qfalse;if((bs->inventory[INVENTORY_ROCKETLAUNCHER]<=0||bs->inventory[INVENTORY_ROCKETS<10])&&(bs->inventory[INVENTORY_RAILGUN]<=0||bs->inventory[INVENTORY_SLUGS]<10)&&(bs->inventory[INVENTORY_BFG10K]<=0||bs->inventory[INVENTORY_BFGAMMO]<10))return qfalse;besttraveltime=99999;for(cs=trap_BotGetNextCampSpotGoal(0,&goal);cs;cs=trap_BotGetNextCampSpotGoal(cs,&goal)){traveltime=trap_AAS_AreaTravelTimeToGoalArea(bs->areanum,bs->origin,goal.areanum,TFL_DEFAULT);if(traveltime&&traveltime<besttraveltime){besttraveltime=traveltime;memcpy(&bestgoal,&goal,sizeof(bot_goal_t));}}if(besttraveltime>150)return qfalse;BotGoCamp(bs,&bestgoal);bs->ordered=qfalse;return qtrue;}
void BotDontAvoid(bot_state_t *bs,char *itemname){bot_goal_t goal;int num;num=trap_BotGetLevelItemGoal(-1,itemname,&goal);while(num>=0){trap_BotRemoveFromAvoidGoals(bs->gs,goal.number);num=trap_BotGetLevelItemGoal(num,itemname,&goal);}}
void BotGoForPowerups(bot_state_t *bs){BotDontAvoid(bs,"Quad Damage");BotDontAvoid(bs,"Regeneration");BotDontAvoid(bs,"Battle Suit");BotDontAvoid(bs,"Speed");BotDontAvoid(bs,"Invisibility");bs->ltg_time=0;}
static void reset(bot_state_t*b){memset(b,0,sizeof(*b));b->client=8;b->camp_time=-1000;b->ordered=1;camper=.5f;now_value=20;random_value=.25f;aggression=60;travel_result=100;remove_count=item_calls=0;}
int main(void){bot_state_t b;bot_goal_t g;memset(&g,0,sizeof(g));g.areanum=10;g.origin[0]=1;
 reset(&b);SCENARIO();BotGoCamp(&b,&g);OBS(b.decisionmaker==8);OBS(b.ltgtype==LTG_CAMP);OBS(b.teamgoal.origin[0]==1);OBS(b.teamgoal_time==233.75f);OBS(b.camp_time==20);OBS(b.arrive_time==1);
 reset(&b);camper=1;SCENARIO();BotGoCamp(&b,&g);OBS(b.teamgoal_time==100019);OBS(b.teammate==0);
 reset(&b);camper=.05f;SCENARIO();OBS(!BotWantsToCamp(&b));reset(&b);b.ltgtype=LTG_GETFLAG;SCENARIO();OBS(!BotWantsToCamp(&b));reset(&b);b.camp_time=0;SCENARIO();OBS(!BotWantsToCamp(&b));
 reset(&b);random_value=.75f;SCENARIO();OBS(!BotWantsToCamp(&b));OBS(b.camp_time==20);reset(&b);aggression=49;SCENARIO();OBS(!BotWantsToCamp(&b));reset(&b);SCENARIO();OBS(!BotWantsToCamp(&b));
 reset(&b);b.inventory[INVENTORY_RAILGUN]=1;b.inventory[INVENTORY_SLUGS]=10;SCENARIO();OBS(BotWantsToCamp(&b));OBS(b.teamgoal.areanum==10);OBS(b.ltgtype==LTG_CAMP);OBS(!b.ordered);OBS(b.teamgoal_time==233.75f);
 reset(&b);SCENARIO();BotDontAvoid(&b,"Quad Damage");OBS(remove_count==1);OBS(removed[0]==100);OBS(item_calls==2);OBS(b.ltg_time==0);
 reset(&b);b.ltg_time=9;SCENARIO();BotGoForPowerups(&b);OBS(remove_count==5);OBS(item_calls==10);OBS(b.ltg_time==0);
 printf("PASS: %d native Baseq3 item-goal scenarios / %d exact observations\n",scenarios,observations);return 0;}
