// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Direct harness for unchanged Baseq3 ai_dmnet.c route/goal function bodies.
#include <stdio.h>
#include <string.h>

typedef float vec3_t[3];
typedef struct { float fraction; vec3_t endpos; int startsolid; } bsp_trace_t;
typedef struct { int areanum, entitynum; vec3_t origin, mins, maxs; int iteminfo, number, flags; } bot_goal_t;
typedef struct {
  vec3_t origin, eye, viewangles; int entitynum, gs, ms, areanum, tfl, inventory[32];
  bot_goal_t teamgoal; float lastair_time, ltg_time;
} bot_state_t;
enum { qfalse=0, qtrue=1, GFL_ITEM=1, GFL_DROPPED=4, GFL_AIR=128 };
#define CONTENTS_SOLID 1
#define CONTENTS_LAVA 8
#define CONTENTS_SLIME 16
#define CONTENTS_WATER 32
#define CONTENTS_PLAYERCLIP 0x10000
#define TFL_DEFAULT 0x011c0fbe
#define VectorCopy(a,b) memcpy((b),(a),sizeof(vec3_t))

static float now;
static int trace_call, point_area, pushed, nbg_index, nbg_count, top_calls, pops, resets;
static int nbg_contents[4], carrying, travel_time, touching, invisible, swimming;
static int avoid_calls, avoid_number; static float avoid_time;
static int weapon_calls, choose_ltg, reset_reach;
static bot_goal_t top_goal, nbg_goals[4];
static bsp_trace_t traces[2];
static char order[64]; static int order_len;
static void mark(char c) { order[order_len++]=c; order[order_len]=0; }
static void BotAI_Trace(bsp_trace_t *out,const vec3_t start,const vec3_t mins,const vec3_t maxs,const vec3_t end,int pass,int mask) { (void)start;(void)mins;(void)maxs;(void)end;(void)pass;(void)mask;*out=traces[trace_call++];mark('T'); }
static int BotPointAreaNum(const vec3_t p) { (void)p;mark('A');return point_area; }
static float FloatTime(void) { mark('F');return now; }
static void trap_BotPushGoal(int gs,bot_goal_t *g) { (void)gs;top_goal=*g;pushed++;mark('P'); }
static int trap_BotChooseNBGItem(int gs,const vec3_t o,int *inv,int tfl,bot_goal_t *ltg,float range) { (void)gs;(void)o;(void)inv;(void)tfl;(void)ltg;(void)range;mark('N');if(nbg_index>=nbg_count)return 0;top_goal=nbg_goals[nbg_index++];return 1; }
static int trap_BotGetTopGoal(int gs,bot_goal_t *g) { (void)gs;top_calls++;mark('G');*g=top_goal;return top_goal.areanum!=0; }
static int trap_AAS_PointContents(const vec3_t p) { (void)p;return nbg_contents[nbg_index-1]; }
static void trap_BotPopGoal(int gs) { (void)gs;pops++;mark('O');top_goal.areanum=0; }
static void trap_BotResetAvoidGoals(int gs) { (void)gs;resets++;mark('R'); }
static int BotCTFCarryingFlag(bot_state_t *bs) { (void)bs;mark('C');return carrying; }
static int trap_AAS_AreaTravelTimeToGoalArea(int area,const vec3_t o,int goal,int tfl) { (void)area;(void)o;(void)goal;(void)tfl;mark('V');return travel_time; }
static int trap_BotTouchingGoal(const vec3_t o,bot_goal_t *g) { (void)o;(void)g;mark('H');return touching; }
static int trap_BotItemGoalInVisButNotVisible(int ent,const vec3_t eye,const vec3_t angles,bot_goal_t *g) { (void)ent;(void)eye;(void)angles;(void)g;mark('I');return invisible; }
static int trap_AAS_Swimming(const vec3_t o) { (void)o;mark('S');return swimming; }
static void trap_BotSetAvoidGoalTime(int gs,int number,float t) { (void)gs;avoid_calls++;avoid_number=number;avoid_time=t;mark('D'); }
static void BotChooseWeapon(bot_state_t *bs) { (void)bs;weapon_calls++;mark('W'); }
static int trap_BotChooseLTGItem(int gs,const vec3_t o,int *inv,int tfl) { (void)gs;(void)o;(void)inv;(void)tfl;mark('L');if(choose_ltg){top_goal.areanum=77;top_goal.number=707;}return choose_ltg; }
static void trap_BotResetAvoidReach(int ms) { (void)ms;reset_reach++;mark('E'); }

/* The following five bodies are copied unchanged from code/game/ai_dmnet.c. */
int BotGetAirGoal(bot_state_t *bs, bot_goal_t *goal) {
	bsp_trace_t bsptrace;
	vec3_t end, mins = {-15, -15, -2}, maxs = {15, 15, 2};
	int areanum;

	//trace up until we hit solid
	VectorCopy(bs->origin, end);
	end[2] += 1000;
	BotAI_Trace(&bsptrace, bs->origin, mins, maxs, end, bs->entitynum, CONTENTS_SOLID|CONTENTS_PLAYERCLIP);
	//trace down until we hit water
	VectorCopy(bsptrace.endpos, end);
	BotAI_Trace(&bsptrace, end, mins, maxs, bs->origin, bs->entitynum, CONTENTS_WATER|CONTENTS_SLIME|CONTENTS_LAVA);
	//if we found the water surface
	if (bsptrace.fraction > 0) {
		areanum = BotPointAreaNum(bsptrace.endpos);
		if (areanum) {
			VectorCopy(bsptrace.endpos, goal->origin);
			goal->origin[2] -= 2;
			goal->areanum = areanum;
			goal->mins[0] = -15;
			goal->mins[1] = -15;
			goal->mins[2] = -1;
			goal->maxs[0] = 15;
			goal->maxs[1] = 15;
			goal->maxs[2] = 1;
			goal->flags = GFL_AIR;
			goal->number = 0;
			goal->iteminfo = 0;
			goal->entitynum = 0;
			return qtrue;
		}
	}
	return qfalse;
}

int BotGoForAir(bot_state_t *bs, int tfl, bot_goal_t *ltg, float range) {
	bot_goal_t goal;
	if (bs->lastair_time < FloatTime() - 6) {
		if (BotGetAirGoal(bs, &goal)) {
			trap_BotPushGoal(bs->gs, &goal);
			return qtrue;
		}
		else {
			while(trap_BotChooseNBGItem(bs->gs, bs->origin, bs->inventory, tfl, ltg, range)) {
				trap_BotGetTopGoal(bs->gs, &goal);
				if (!(trap_AAS_PointContents(goal.origin) & (CONTENTS_WATER|CONTENTS_SLIME|CONTENTS_LAVA))) {
					return qtrue;
				}
				trap_BotPopGoal(bs->gs);
			}
			trap_BotResetAvoidGoals(bs->gs);
		}
	}
	return qfalse;
}

int BotNearbyGoal(bot_state_t *bs, int tfl, bot_goal_t *ltg, float range) {
	int ret;
	if (BotGoForAir(bs, tfl, ltg, range)) return qtrue;
	if (BotCTFCarryingFlag(bs)) {
		if (trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin,
				bs->teamgoal.areanum, TFL_DEFAULT) < 300) {
			range = 50;
		}
	}
	ret = trap_BotChooseNBGItem(bs->gs, bs->origin, bs->inventory, tfl, ltg, range);
	return ret;
}

int BotReachedGoal(bot_state_t *bs, bot_goal_t *goal) {
	if (goal->flags & GFL_ITEM) {
		if (trap_BotTouchingGoal(bs->origin, goal)) {
			if (!(goal->flags & GFL_DROPPED)) {
				trap_BotSetAvoidGoalTime(bs->gs, goal->number, -1);
			}
			return qtrue;
		}
		if (trap_BotItemGoalInVisButNotVisible(bs->entitynum, bs->eye, bs->viewangles, goal)) {
			return qtrue;
		}
		if (bs->areanum == goal->areanum) {
			if (bs->origin[0] > goal->origin[0] + goal->mins[0] && bs->origin[0] < goal->origin[0] + goal->maxs[0]) {
				if (bs->origin[1] > goal->origin[1] + goal->mins[1] && bs->origin[1] < goal->origin[1] + goal->maxs[1]) {
					if (!trap_AAS_Swimming(bs->origin)) {
						return qtrue;
					}
				}
			}
		}
	}
	else if (goal->flags & GFL_AIR) {
		if (trap_BotTouchingGoal(bs->origin, goal)) return qtrue;
		if (bs->lastair_time > FloatTime() - 1) return qtrue;
	}
	else {
		if (trap_BotTouchingGoal(bs->origin, goal)) return qtrue;
	}
	return qfalse;
}

int BotGetItemLongTermGoal(bot_state_t *bs, int tfl, bot_goal_t *goal) {
	if (!trap_BotGetTopGoal(bs->gs, goal)) {
		bs->ltg_time = 0;
	}
	else if (BotReachedGoal(bs, goal)) {
		BotChooseWeapon(bs);
		bs->ltg_time = 0;
	}
	if (bs->ltg_time < FloatTime()) {
		trap_BotPopGoal(bs->gs);
		if (trap_BotChooseLTGItem(bs->gs, bs->origin, bs->inventory, tfl)) {
			bs->ltg_time = FloatTime() + 20;
		}
		else {
			trap_BotResetAvoidGoals(bs->gs);
			trap_BotResetAvoidReach(bs->ms);
		}
		return trap_BotGetTopGoal(bs->gs, goal);
	}
	return qtrue;
}

static int scenarios, observations, failures;
#define CHECK(x) do { observations++; if(!(x)){ failures++; printf("FAIL line %d: %s\n",__LINE__,#x); } } while(0)
static void reset_all(void) { memset(traces,0,sizeof(traces));memset(&top_goal,0,sizeof(top_goal));memset(nbg_goals,0,sizeof(nbg_goals));memset(nbg_contents,0,sizeof(nbg_contents));now=20;trace_call=point_area=pushed=nbg_index=nbg_count=top_calls=pops=resets=carrying=travel_time=touching=invisible=swimming=avoid_calls=avoid_number=weapon_calls=choose_ltg=reset_reach=order_len=0;avoid_time=0;order[0]=0; }
static bot_state_t bot(void) { bot_state_t b;memset(&b,0,sizeof(b));b.origin[0]=1;b.origin[1]=2;b.origin[2]=3;b.eye[2]=24;b.entitynum=9;b.gs=4;b.ms=5;b.areanum=7;b.lastair_time=20;b.ltg_time=30;b.teamgoal.areanum=99;return b; }
static bot_goal_t goal(int flags) { bot_goal_t g;memset(&g,0,sizeof(g));g.areanum=7;g.flags=flags;g.number=42;g.mins[0]=g.mins[1]=-2;g.maxs[0]=g.maxs[1]=2;g.origin[0]=1;g.origin[1]=2;return g; }
#define SCENARIO() do { scenarios++; reset_all(); } while(0)
int main(void) {
  bot_state_t b;bot_goal_t g,ltg;int ret;
  SCENARIO();b=bot();g=goal(0);traces[1].fraction=0;ret=BotGetAirGoal(&b,&g);CHECK(!ret);CHECK(trace_call==2);CHECK(strcmp(order,"TT")==0);
  SCENARIO();b=bot();g=goal(0);traces[1].fraction=.5f;traces[1].endpos[2]=80;ret=BotGetAirGoal(&b,&g);CHECK(!ret);CHECK(strcmp(order,"TTA")==0);
  SCENARIO();b=bot();g=goal(0);traces[1].fraction=.5f;traces[1].endpos[0]=4;traces[1].endpos[1]=5;traces[1].endpos[2]=80;point_area=12;ret=BotGetAirGoal(&b,&g);CHECK(ret);CHECK(g.areanum==12&&g.flags==GFL_AIR);CHECK(g.origin[0]==4&&g.origin[1]==5&&g.origin[2]==78);CHECK(g.mins[2]==-1&&g.maxs[2]==1&&g.entitynum==0&&g.number==0);
  SCENARIO();b=bot();b.lastair_time=14;ret=BotGoForAir(&b,3,&ltg,100);CHECK(!ret);CHECK(trace_call==0);CHECK(strcmp(order,"F")==0);
  SCENARIO();b=bot();b.lastair_time=13;traces[1].fraction=.5f;point_area=2;ret=BotGoForAir(&b,3,&ltg,100);CHECK(ret);CHECK(pushed==1);CHECK(top_goal.flags==GFL_AIR);CHECK(strcmp(order,"FTTAP")==0);
  SCENARIO();b=bot();b.lastair_time=0;nbg_count=2;nbg_goals[0]=goal(0);nbg_goals[0].areanum=8;nbg_contents[0]=CONTENTS_WATER;nbg_goals[1]=goal(0);nbg_goals[1].areanum=9;ret=BotGoForAir(&b,3,&ltg,100);CHECK(ret);CHECK(pops==1&&resets==0);CHECK(top_goal.areanum==9);CHECK(strcmp(order,"FTTNGONG")==0);
  SCENARIO();b=bot();b.lastair_time=0;nbg_count=1;nbg_goals[0]=goal(0);nbg_contents[0]=CONTENTS_SLIME;ret=BotGoForAir(&b,3,&ltg,100);CHECK(!ret);CHECK(pops==1&&resets==1);CHECK(strcmp(order,"FTTNGONR")==0);
  SCENARIO();b=bot();b.lastair_time=20;nbg_count=1;nbg_goals[0]=goal(0);ret=BotNearbyGoal(&b,3,&ltg,100);CHECK(ret);CHECK(strcmp(order,"FCN")==0);CHECK(nbg_index==1);
  SCENARIO();b=bot();b.lastair_time=20;carrying=1;travel_time=299;nbg_count=1;nbg_goals[0]=goal(0);ret=BotNearbyGoal(&b,3,&ltg,100);CHECK(ret);CHECK(strcmp(order,"FCVN")==0);CHECK(nbg_index==1);
  SCENARIO();b=bot();g=goal(GFL_ITEM);touching=1;ret=BotReachedGoal(&b,&g);CHECK(ret);CHECK(avoid_calls==1&&avoid_number==42&&avoid_time==-1);CHECK(strcmp(order,"HD")==0);
  SCENARIO();b=bot();g=goal(GFL_ITEM|GFL_DROPPED);touching=1;ret=BotReachedGoal(&b,&g);CHECK(ret);CHECK(avoid_calls==0);CHECK(strcmp(order,"H")==0);
  SCENARIO();b=bot();g=goal(GFL_ITEM);invisible=1;ret=BotReachedGoal(&b,&g);CHECK(ret);CHECK(strcmp(order,"HI")==0);
  SCENARIO();b=bot();g=goal(GFL_ITEM);ret=BotReachedGoal(&b,&g);CHECK(ret);CHECK(strcmp(order,"HIS")==0);
  SCENARIO();b=bot();g=goal(GFL_ITEM);swimming=1;ret=BotReachedGoal(&b,&g);CHECK(!ret);CHECK(strcmp(order,"HIS")==0);
  SCENARIO();b=bot();g=goal(GFL_AIR);b.lastair_time=19.5f;ret=BotReachedGoal(&b,&g);CHECK(ret);CHECK(strcmp(order,"HF")==0);
  SCENARIO();b=bot();g=goal(0);touching=1;ret=BotReachedGoal(&b,&g);CHECK(ret);CHECK(strcmp(order,"H")==0);
  SCENARIO();b=bot();g=goal(0);top_goal.areanum=0;choose_ltg=1;ret=BotGetItemLongTermGoal(&b,3,&g);CHECK(ret);CHECK(g.areanum==77&&g.number==707);CHECK(b.ltg_time==40);CHECK(strcmp(order,"GFOLFG")==0);
  SCENARIO();b=bot();g=goal(0);top_goal=goal(GFL_ITEM);touching=1;choose_ltg=0;ret=BotGetItemLongTermGoal(&b,3,&g);CHECK(!ret);CHECK(weapon_calls==1&&resets==1&&reset_reach==1);CHECK(strcmp(order,"GHDWFOLREG")==0);
  SCENARIO();b=bot();g=goal(0);top_goal=goal(0);touching=0;ret=BotGetItemLongTermGoal(&b,3,&g);CHECK(ret);CHECK(b.ltg_time==30);CHECK(strcmp(order,"GHF")==0);
  if(failures)return 1;printf("PASS: %d native Baseq3 route-goal scenarios / %d exact observations\n",scenarios,observations);return 0;
}
