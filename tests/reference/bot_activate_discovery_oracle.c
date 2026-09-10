/* Copyright (C) 1999-2005 Id Software, Inc. GPL-2.0-or-later. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef int qboolean; typedef float vec3_t[3];
#define qfalse 0
#define qtrue 1
#define MAX_ACTIVATEAREAS 32
#define ET_MOVER 4
#define AREACONTENTS_MOVER 1024
#define VectorClear(a) ((a)[0]=(a)[1]=(a)[2]=0)
#define VectorCopy(a,b) ((b)[0]=(a)[0],(b)[1]=(a)[1],(b)[2]=(a)[2])
#define VectorCompare(a,b) ((a)[0]==(b)[0]&&(a)[1]==(b)[1]&&(a)[2]==(b)[2])
#define Com_sprintf snprintf
#define PRT_ERROR 1
typedef struct {int entitynum,areanum;vec3_t origin,mins,maxs;} bot_goal_t;
typedef struct bot_activategoal_s {int inuse;float time,start_time;bot_goal_t goal;int numareas,areas[MAX_ACTIVATEAREAS],areasdisabled;struct bot_activategoal_s*next;} bot_activategoal_t;
typedef struct {int modelindex;vec3_t origin;} aas_entityinfo_t; typedef struct {int contents;} aas_areainfo_t;
typedef struct {int areanum,tfl;vec3_t origin;bot_activategoal_t *activatestack;} bot_state_t;
typedef struct {int integer;} vmCvar_t; static vmCvar_t bot_developer;
static int case_id,door_calls,button_calls,trigger_calls,route_count,route_area[64],route_enable[64],travel_result;static float now_value=20;
static int scenarios,observations;
#define SCENARIO() (++scenarios)
#define OBS(x) do{++observations;if(!(x)){printf("FAIL line %d\n",__LINE__);return 1;}}while(0)
static float FloatTime(void){return now_value;} static void BotAI_Print(int k,const char*f,...){(void)k;(void)f;}
static void BotEntityInfo(int e,aas_entityinfo_t*i){(void)e;i->modelindex=3;VectorClear(i->origin);}
static int trap_AAS_NextBSPEntity(int e){return e<3?e+1:0;}
static int strkey(int e,const char*k,char*out){const char*v=NULL;if(e==1&&!strcmp(k,"model"))v=case_id==1?"*4":"*3";else if(e==1&&!strcmp(k,"classname"))v="func_door";else if(e==1&&!strcmp(k,"targetname"))v="A";else if(e==2&&!strcmp(k,"target"))v="A";else if(e==2&&!strcmp(k,"classname"))v=case_id==6?"target_relay":case_id==7?"func_timer":"func_button";else if(e==2&&!strcmp(k,"targetname")&&case_id==6)v="B";else if(e==3&&!strcmp(k,"target")&&case_id==6)v="B";else if(e==3&&!strcmp(k,"classname")&&case_id==6)v="trigger_multiple";if(!v)return 0;strcpy(out,v);return 1;}
static int trap_AAS_ValueForBSPEpairKey(int e,const char*k,char*out,int n){(void)n;return strkey(e,k,out);}
static int trap_AAS_FloatForBSPEpairKey(int e,const char*k,float*v){(void)e;if(case_id==2&&!strcmp(k,"health")){*v=10;return 1;}*v=0;return 0;}
static int trap_AAS_IntForBSPEpairKey(int e,const char*k,int*v){(void)e;(void)k;*v=case_id==3?1:0;return 1;}
static int trap_AAS_VectorForBSPEpairKey(int e,const char*k,vec3_t v){(void)e;(void)k;VectorClear(v);if(case_id==4)v[0]=1;return 1;}
static int BotModelMinsMaxs(int m,int t,int c,vec3_t mn,vec3_t mx){(void)m;(void)t;(void)c;mn[0]=mn[1]=mn[2]=-10;mx[0]=mx[1]=mx[2]=10;return 71;}
static int trap_AAS_BBoxAreas(vec3_t a,vec3_t b,int*out,int n){(void)a;(void)b;(void)n;out[0]=10;out[1]=11;out[2]=12;return 3;}
static int trap_AAS_AreaReachability(int a){return a!=11;}
static void trap_AAS_AreaInfo(int a,aas_areainfo_t*i){i->contents=a==12?0:AREACONTENTS_MOVER;}
static int BotFuncDoorActivateGoal(bot_state_t*b,int e,bot_activategoal_t*g){(void)b;(void)e;door_calls++;g->goal.entitynum=70;return 1;}
static int BotFuncButtonActivateGoal(bot_state_t*b,int e,bot_activategoal_t*g){(void)b;(void)e;button_calls++;g->goal.entitynum=80;g->goal.areanum=20;return 1;}
static int BotTriggerMultipleActivateGoal(bot_state_t*b,int e,bot_activategoal_t*g){(void)b;(void)e;trigger_calls++;g->goal.entitynum=90;g->goal.areanum=30;return 1;}
static void BotEnableActivateGoalAreas(bot_activategoal_t*g,int enable){if(g->areasdisabled==!enable)return;for(int i=0;i<g->numareas;i++){route_area[route_count]=g->areas[i];route_enable[route_count++]=enable;}g->areasdisabled=!enable;}
static int trap_AAS_AreaTravelTimeToGoalArea(int a,vec3_t o,int g,int t){(void)a;(void)o;(void)g;(void)t;return travel_result;}

/* Baseq3 BotGetActivateGoal control flow, unchanged apart from inactive debug text. */
int BotGetActivateGoal(bot_state_t *bs, int entitynum, bot_activategoal_t *activategoal) {
	int i, ent, cur_entities[10], spawnflags, modelindex, areas[MAX_ACTIVATEAREAS*2], numareas, t;
	char model[1024], tmpmodel[128], target[128], classname[128]; float health; char targetname[10][128];
	aas_entityinfo_t entinfo; aas_areainfo_t areainfo; vec3_t origin, angles, absmins, absmaxs;
	memset(activategoal, 0, sizeof(bot_activategoal_t)); BotEntityInfo(entitynum, &entinfo); Com_sprintf(model, sizeof(model), "*%d", entinfo.modelindex);
	for(ent=trap_AAS_NextBSPEntity(0);ent;ent=trap_AAS_NextBSPEntity(ent)){if(!trap_AAS_ValueForBSPEpairKey(ent,"model",tmpmodel,sizeof(tmpmodel)))continue;if(!strcmp(model,tmpmodel))break;}
	if(!ent){BotAI_Print(PRT_ERROR,"missing %s",model);return 0;}
	trap_AAS_ValueForBSPEpairKey(ent,"classname",classname,sizeof(classname)); if(!classname)return 0;
	if(!strcmp(classname,"func_door")){
		if(trap_AAS_FloatForBSPEpairKey(ent,"health",&health)){if(health){BotFuncDoorActivateGoal(bs,ent,activategoal);return ent;}}
		trap_AAS_IntForBSPEpairKey(ent,"spawnflags",&spawnflags);if(spawnflags&1)return 0;
		if(!trap_AAS_VectorForBSPEpairKey(ent,"origin",origin))VectorClear(origin);if(!VectorCompare(origin,entinfo.origin))return 0;
		trap_AAS_ValueForBSPEpairKey(ent,"model",model,sizeof(model));if(*model){modelindex=atoi(model+1);if(modelindex){VectorClear(angles);BotModelMinsMaxs(modelindex,ET_MOVER,0,absmins,absmaxs);numareas=trap_AAS_BBoxAreas(absmins,absmaxs,areas,MAX_ACTIVATEAREAS*2);
			for(i=0;i<numareas;i++){if(activategoal->numareas>=MAX_ACTIVATEAREAS)break;if(!trap_AAS_AreaReachability(areas[i]))continue;trap_AAS_AreaInfo(areas[i],&areainfo);if(areainfo.contents&AREACONTENTS_MOVER)activategoal->areas[activategoal->numareas++]=areas[i];}
			for(i=0;i<numareas;i++){if(activategoal->numareas>=MAX_ACTIVATEAREAS)break;if(trap_AAS_AreaReachability(areas[i]))continue;trap_AAS_AreaInfo(areas[i],&areainfo);if(areainfo.contents&AREACONTENTS_MOVER)activategoal->areas[activategoal->numareas++]=areas[i];}}}
	}
	if(!strcmp(classname,"func_button"))return 0;
	if(!trap_AAS_ValueForBSPEpairKey(ent,"targetname",targetname[0],sizeof(targetname[0])))return 0;
	cur_entities[0]=trap_AAS_NextBSPEntity(0);
	for(i=0;i>=0&&i<10;){
		for(ent=cur_entities[i];ent;ent=trap_AAS_NextBSPEntity(ent)){if(!trap_AAS_ValueForBSPEpairKey(ent,"target",target,sizeof(target)))continue;if(!strcmp(targetname[i],target)){cur_entities[i]=trap_AAS_NextBSPEntity(ent);break;}}
		if(!ent){i--;continue;}if(!trap_AAS_ValueForBSPEpairKey(ent,"classname",classname,sizeof(classname)))continue;
		if(!strcmp(classname,"func_button")){if(!BotFuncButtonActivateGoal(bs,ent,activategoal))continue;if(bs->activatestack&&bs->activatestack->inuse&&bs->activatestack->goal.entitynum==activategoal->goal.entitynum&&bs->activatestack->time>FloatTime()&&bs->activatestack->start_time<FloatTime()-2)continue;if(trap_AAS_AreaReachability(bs->areanum)){BotEnableActivateGoalAreas(activategoal,qfalse);t=trap_AAS_AreaTravelTimeToGoalArea(bs->areanum,bs->origin,activategoal->goal.areanum,bs->tfl);if(!t)continue;activategoal->time=FloatTime()+t*0.01+5;}return ent;}
		else if(!strcmp(classname,"trigger_multiple")){if(!BotTriggerMultipleActivateGoal(bs,ent,activategoal))continue;if(bs->activatestack&&bs->activatestack->inuse&&bs->activatestack->goal.entitynum==activategoal->goal.entitynum&&bs->activatestack->time>FloatTime()&&bs->activatestack->start_time<FloatTime()-2)continue;if(trap_AAS_AreaReachability(bs->areanum)){BotEnableActivateGoalAreas(activategoal,qfalse);t=trap_AAS_AreaTravelTimeToGoalArea(bs->areanum,bs->origin,activategoal->goal.areanum,bs->tfl);if(!t)continue;activategoal->time=FloatTime()+t*0.01+5;}return ent;}
		else if(!strcmp(classname,"func_timer"))continue;
		else if(!strcmp(classname,"target_relay")||!strcmp(classname,"target_delay")){if(trap_AAS_ValueForBSPEpairKey(ent,"targetname",targetname[i+1],sizeof(targetname[0]))){i++;cur_entities[i]=trap_AAS_NextBSPEntity(0);}}
	}
	return 0;
}
static void reset(bot_state_t*b){memset(b,0,sizeof(*b));door_calls=button_calls=trigger_calls=route_count=0;travel_result=30;now_value=20;}
int main(void){bot_state_t b;bot_activategoal_t g,top;
 reset(&b);case_id=1;SCENARIO();OBS(BotGetActivateGoal(&b,71,&g)==0);OBS(door_calls==0);
 reset(&b);case_id=2;SCENARIO();OBS(BotGetActivateGoal(&b,71,&g)==1);OBS(door_calls==1);OBS(g.goal.entitynum==70);
 reset(&b);case_id=3;SCENARIO();OBS(BotGetActivateGoal(&b,71,&g)==0);OBS(button_calls==0);
 reset(&b);case_id=4;SCENARIO();OBS(BotGetActivateGoal(&b,71,&g)==0);OBS(route_count==0);
 reset(&b);case_id=5;SCENARIO();OBS(BotGetActivateGoal(&b,71,&g)==2);OBS(button_calls==1);OBS(g.goal.entitynum==80);OBS(g.numareas==2);OBS(g.areas[0]==10&&g.areas[1]==11);OBS(g.areasdisabled);OBS(route_count==2&&route_area[0]==10&&route_area[1]==11);OBS(g.time>25.29f&&g.time<25.31f);
 reset(&b);case_id=6;travel_result=10;SCENARIO();OBS(BotGetActivateGoal(&b,71,&g)==3);OBS(trigger_calls==1);OBS(g.goal.entitynum==90);OBS(g.time>25.09f&&g.time<25.11f);
 reset(&b);case_id=7;SCENARIO();OBS(BotGetActivateGoal(&b,71,&g)==0);OBS(button_calls==0&&trigger_calls==0);
 reset(&b);case_id=5;memset(&top,0,sizeof(top));top.inuse=1;top.goal.entitynum=80;top.time=30;top.start_time=10;b.activatestack=&top;SCENARIO();OBS(BotGetActivateGoal(&b,71,&g)==0);OBS(button_calls==1);OBS(route_count==0);
 reset(&b);case_id=5;travel_result=0;SCENARIO();OBS(BotGetActivateGoal(&b,71,&g)==0);OBS(g.areasdisabled);OBS(route_count==2);OBS(g.time==0);
 printf("PASS: %d native Baseq3 activate-discovery scenarios / %d exact observations\n",scenarios,observations);return 0;}
