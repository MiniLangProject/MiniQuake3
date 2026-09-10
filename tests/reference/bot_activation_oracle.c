/* Copyright (C) 1999-2005 Id Software, Inc. GPL-2.0-or-later. */
#include <stdio.h>
#include <string.h>
typedef int qboolean; typedef float vec3_t[3];
#define qfalse 0
#define qtrue 1
#define MAX_ACTIVATESTACK 8
#define VectorCopy(a,b) ((b)[0]=(a)[0],(b)[1]=(a)[1],(b)[2]=(a)[2])
typedef struct { int entitynum; } bot_goal_t;
typedef struct bot_activategoal_s { int inuse; float time,start_time,justused_time; vec3_t origin; bot_goal_t goal; int numareas,areas[32],areasdisabled; struct bot_activategoal_s *next; } bot_activategoal_t;
typedef struct { bot_activategoal_t activategoalheap[MAX_ACTIVATESTACK],*activatestack; } bot_state_t;
typedef struct { vec3_t origin; } aas_entityinfo_t;
static float now_value; static int route_areas[128],route_enable[128],route_count,enter_count,entity_calls;
static int scenarios,observations;
#define SCENARIO() (++scenarios)
#define OBS(x) do { ++observations; if (!(x)) { printf("FAIL line %d\n",__LINE__); return 1; } } while(0)
static float FloatTime(void){return now_value;}
static void trap_AAS_EnableRoutingArea(int area,int enable){route_areas[route_count]=area;route_enable[route_count++]=enable;}
static void BotEntityInfo(int entity,aas_entityinfo_t *info){entity_calls++;info->origin[0]=(float)entity;info->origin[1]=8;info->origin[2]=9;}
static void AIEnter_Seek_ActivateEntity(bot_state_t *bs,const char *reason){(void)bs;(void)reason;enter_count++;}
static void reset(bot_state_t *bs){memset(bs,0,sizeof(*bs));route_count=enter_count=entity_calls=0;now_value=20;}

/* The following six function bodies are unchanged Baseq3 ai_dmq3.c bodies. */
void BotEnableActivateGoalAreas(bot_activategoal_t *activategoal, int enable) {
	int i;
	if (activategoal->areasdisabled == !enable)
		return;
	for (i = 0; i < activategoal->numareas; i++)
		trap_AAS_EnableRoutingArea( activategoal->areas[i], enable );
	activategoal->areasdisabled = !enable;
}
int BotPopFromActivateGoalStack(bot_state_t *bs) {
	if (!bs->activatestack)
		return qfalse;
	BotEnableActivateGoalAreas(bs->activatestack, qtrue);
	bs->activatestack->inuse = qfalse;
	bs->activatestack->justused_time = FloatTime();
	bs->activatestack = bs->activatestack->next;
	return qtrue;
}
int BotPushOntoActivateGoalStack(bot_state_t *bs, bot_activategoal_t *activategoal) {
	int i, best;
	float besttime;
	best = -1;
	besttime = FloatTime() + 9999;
	for (i = 0; i < MAX_ACTIVATESTACK; i++) {
		if (!bs->activategoalheap[i].inuse) {
			if (bs->activategoalheap[i].justused_time < besttime) {
				besttime = bs->activategoalheap[i].justused_time;
				best = i;
			}
		}
	}
	if (best != -1) {
		memcpy(&bs->activategoalheap[best], activategoal, sizeof(bot_activategoal_t));
		bs->activategoalheap[best].inuse = qtrue;
		bs->activategoalheap[best].next = bs->activatestack;
		bs->activatestack = &bs->activategoalheap[best];
		return qtrue;
	}
	return qfalse;
}
void BotClearActivateGoalStack(bot_state_t *bs) {
	while(bs->activatestack)
		BotPopFromActivateGoalStack(bs);
}
int BotIsGoingToActivateEntity(bot_state_t *bs, int entitynum) {
	bot_activategoal_t *a;
	int i;
	for (a = bs->activatestack; a; a = a->next) {
		if (a->time < FloatTime())
			continue;
		if (a->goal.entitynum == entitynum)
			return qtrue;
	}
	for (i = 0; i < MAX_ACTIVATESTACK; i++) {
		if (bs->activategoalheap[i].inuse)
			continue;
		if (bs->activategoalheap[i].goal.entitynum == entitynum) {
			if (bs->activategoalheap[i].justused_time > FloatTime() - 2)
				return qtrue;
		}
	}
	return qfalse;
}
int BotGoForActivateGoal(bot_state_t *bs, bot_activategoal_t *activategoal) {
	aas_entityinfo_t activateinfo;
	activategoal->inuse = qtrue;
	if (!activategoal->time)
		activategoal->time = FloatTime() + 10;
	activategoal->start_time = FloatTime();
	BotEntityInfo(activategoal->goal.entitynum, &activateinfo);
	VectorCopy(activateinfo.origin, activategoal->origin);
	if (BotPushOntoActivateGoalStack(bs, activategoal)) {
		AIEnter_Seek_ActivateEntity(bs, "BotGoForActivateGoal");
		return qtrue;
	}
	else {
		BotEnableActivateGoalAreas(activategoal, qtrue);
		return qfalse;
	}
}

int main(void){bot_state_t b;bot_activategoal_t a,c;
 reset(&b);memset(&a,0,sizeof(a));a.numareas=2;a.areas[0]=3;a.areas[1]=5;SCENARIO();BotEnableActivateGoalAreas(&a,qtrue);OBS(route_count==0);OBS(a.areasdisabled==0);
 SCENARIO();BotEnableActivateGoalAreas(&a,qfalse);OBS(route_count==2);OBS(route_areas[0]==3&&route_enable[0]==0);OBS(route_areas[1]==5&&route_enable[1]==0);OBS(a.areasdisabled==1);
 SCENARIO();BotEnableActivateGoalAreas(&a,qtrue);OBS(route_count==4);OBS(route_enable[2]==1&&route_enable[3]==1);OBS(a.areasdisabled==0);
 reset(&b);memset(&a,0,sizeof(a));for(int i=0;i<8;i++)b.activategoalheap[i].justused_time=9;b.activategoalheap[0].justused_time=5;b.activategoalheap[1].justused_time=1;b.activategoalheap[2].justused_time=3;a.goal.entitynum=77;SCENARIO();OBS(BotPushOntoActivateGoalStack(&b,&a));OBS(b.activatestack==&b.activategoalheap[1]);OBS(b.activatestack->inuse);OBS(b.activatestack->goal.entitynum==77);OBS(b.activatestack->next==NULL);
 memset(&c,0,sizeof(c));c.goal.entitynum=88;SCENARIO();OBS(BotPushOntoActivateGoalStack(&b,&c));OBS(b.activatestack->goal.entitynum==88);OBS(b.activatestack->next==&b.activategoalheap[1]);now_value=30;OBS(BotPopFromActivateGoalStack(&b));OBS(b.activatestack==&b.activategoalheap[1]);OBS(b.activategoalheap[2].justused_time==30);
 SCENARIO();BotClearActivateGoalStack(&b);OBS(b.activatestack==NULL);OBS(!b.activategoalheap[1].inuse);OBS(b.activategoalheap[1].justused_time==30);OBS(!BotPopFromActivateGoalStack(&b));
 reset(&b);for(int i=0;i<8;i++)b.activategoalheap[i].inuse=1;SCENARIO();OBS(!BotPushOntoActivateGoalStack(&b,&a));
 reset(&b);b.activategoalheap[0].inuse=1;b.activategoalheap[0].time=21;b.activategoalheap[0].goal.entitynum=55;b.activatestack=&b.activategoalheap[0];SCENARIO();OBS(BotIsGoingToActivateEntity(&b,55));b.activategoalheap[0].time=19;OBS(!BotIsGoingToActivateEntity(&b,55));OBS(b.activatestack==&b.activategoalheap[0]);OBS(now_value==20);
 b.activategoalheap[0].inuse=0;b.activatestack=NULL;b.activategoalheap[0].justused_time=19;SCENARIO();OBS(BotIsGoingToActivateEntity(&b,55));b.activategoalheap[0].justused_time=18;OBS(!BotIsGoingToActivateEntity(&b,55));OBS(!b.activategoalheap[0].inuse);OBS(now_value==20);
 reset(&b);memset(&a,0,sizeof(a));a.goal.entitynum=66;SCENARIO();OBS(BotGoForActivateGoal(&b,&a));OBS(a.inuse);OBS(a.time==30);OBS(a.start_time==20);OBS(a.origin[0]==66&&a.origin[1]==8&&a.origin[2]==9);OBS(entity_calls==1);OBS(enter_count==1);
 reset(&b);for(int i=0;i<8;i++)b.activategoalheap[i].inuse=1;memset(&a,0,sizeof(a));a.goal.entitynum=12;a.numareas=1;a.areas[0]=7;a.areasdisabled=1;SCENARIO();OBS(!BotGoForActivateGoal(&b,&a));OBS(route_count==1&&route_areas[0]==7&&route_enable[0]==1);OBS(a.areasdisabled==0);OBS(enter_count==0);
 printf("PASS: %d native Baseq3 activation-stack scenarios / %d exact observations\n",scenarios,observations);return 0;}
