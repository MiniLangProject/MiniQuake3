/* Copyright (C) 1999-2005 Id Software, Inc. GPL-2.0-or-later. */
#include <math.h>
#include <stdio.h>
#include <string.h>
typedef int qboolean; typedef float vec3_t[3];
#define qtrue 1
#define qfalse 0
#define ENTITYNUM_NONE 1023
#define PMF_DUCKED 1
#define PMF_TIME_KNOCKBACK 64
#define PMF_TIME_WATERJUMP 256
#define PRESENCE_NORMAL 2
#define PRESENCE_CROUCH 4
#define MFL_ONGROUND 2
#define MFL_WATERJUMP 16
#define MFL_TELEPORTED 32
#define MFL_WALK 512
#define MOVE_WALK 1
#define ET_MOVER 4
#define RSE_USETRAVELTYPE 2
#define RSE_ENTERCONTENTS 4
#define AREACONTENTS_MOVER 1024
#define AREACONTENTS_MAXMODELNUM 0xff
#define AREACONTENTS_MODELNUMSHIFT 24
#define AREACONTENTS_MODELNUM (AREACONTENTS_MAXMODELNUM << AREACONTENTS_MODELNUMSHIFT)
#define TFL_BRIDGE 0x04000000
#define TEAM_RED 1
#define VectorCopy(a,b) ((b)[0]=(a)[0],(b)[1]=(a)[1],(b)[2]=(a)[2])
#define VectorClear(a) ((a)[0]=(a)[1]=(a)[2]=0)
#define VectorCompare(a,b) ((a)[0]==(b)[0]&&(a)[1]==(b)[1]&&(a)[2]==(b)[2])
#define VectorSet(a,x,y,z) ((a)[0]=(x),(a)[1]=(y),(a)[2]=(z))

typedef struct { vec3_t origin,velocity; int pm_flags,pm_time,groundEntityNum,viewheight; } playerState_t;
typedef struct { vec3_t origin,velocity,viewoffset,viewangles; int entitynum,client; float thinktime; int or_moveflags,presencetype; } bot_initmove_t;
typedef struct { int failure,blocked,type,flags,blockentity; vec3_t movedir; } bot_moveresult_t;
typedef struct { int areanum; vec3_t origin,mins,maxs; int entitynum,iteminfo,number,flags; } bot_goal_t;
typedef struct { vec3_t origin; int areanum; } aas_altroutegoal_t;
typedef struct bot_activategoal_s { int inuse; bot_goal_t goal; } bot_activategoal_t;
typedef struct { int stopevent,endcontents; } aas_predictroute_t;
typedef struct { playerState_t cur_ps; int entitynum,client,ms; float thinktime,walker; vec3_t viewangles,origin; int areanum,tfl,predictobstacles_goalareanum; float predictobstacles_time; bot_activategoal_t *activatestack; bot_goal_t altroutegoal; float reachedaltroutegoal_time; } bot_state_t;
typedef struct { int integer; } vmCvar_t;
static vmCvar_t bot_predictobstacles;
static bot_initmove_t captured_init; static int init_handle;
static vec3_t captured_dir; static int move_handle,captured_speed,captured_movetype,move_calls;
static float random_value,now_value; static int predict_calls,model_result,get_result,going_result,go_calls,enable_calls,travel_result,travel_calls;
static aas_predictroute_t route_value; static int activate_entity=88; static int stack_inuse=1;
static aas_altroutegoal_t red_altroutegoals[3],blue_altroutegoals[3]; static int red_numaltroutegoals,blue_numaltroutegoals;
static int scenarios,observations;
#define SCENARIO() (++scenarios)
#define OBS(x) do { ++observations; if (!(x)) { printf("FAIL line %d\n",__LINE__); return 1; } } while(0)
static void trap_BotInitMoveState(int h,bot_initmove_t *m){init_handle=h;captured_init=*m;}
static int trap_BotMoveInDirection(int h,vec3_t d,float speed,int type){move_handle=h;VectorCopy(d,captured_dir);captured_speed=(int)speed;captured_movetype=type;move_calls++;return 1;}
static float q_random_fn(void){return random_value;}
#define random q_random_fn
static float FloatTime(void){return now_value;}
static void trap_AAS_PredictRoute(aas_predictroute_t*r,int a,vec3_t o,int ga,int tfl,int ma,int mt,int se,int sc,int st,int sw){(void)a;(void)o;(void)ga;(void)tfl;(void)ma;(void)mt;(void)se;(void)sc;(void)st;(void)sw;predict_calls++;*r=route_value;}
static int BotModelMinsMaxs(int m,int t,int c,void*a,void*b){(void)m;(void)t;(void)c;(void)a;(void)b;return model_result;}
static int BotGetActivateGoal(bot_state_t*b,int e,bot_activategoal_t*g){(void)b;(void)e;g->goal.entitynum=activate_entity;return get_result;}
static int BotIsGoingToActivateEntity(bot_state_t*b,int e){(void)b;(void)e;return going_result;}
static int BotGoForActivateGoal(bot_state_t*b,bot_activategoal_t*g){(void)b;(void)g;go_calls++;return 1;}
static void BotEnableActivateGoalAreas(bot_activategoal_t*g,int e){(void)g;(void)e;enable_calls++;}
static int trap_AAS_AreaTravelTimeToGoalArea(int a,vec3_t o,int g,int t){(void)a;(void)o;(void)g;(void)t;travel_calls++;return travel_result;}
static void AngleVectors(vec3_t a,vec3_t f,void*r,void*u){float y=a[1]*(3.14159265358979323846f*2/360);(void)r;(void)u;f[0]=cosf(y);f[1]=sinf(y);f[2]=-sinf(a[0]*(3.14159265358979323846f*2/360));}
static vec3_t VEC_UP={0,-1,0},MOVEDIR_UP={0,0,1},VEC_DOWN={0,-2,0},MOVEDIR_DOWN={0,0,-1};

/* The following four function bodies are unchanged Baseq3 ai_dmq3.c bodies. */
void BotSetupForMovement(bot_state_t *bs) {
	bot_initmove_t initmove;
	memset(&initmove, 0, sizeof(bot_initmove_t));
	VectorCopy(bs->cur_ps.origin, initmove.origin);
	VectorCopy(bs->cur_ps.velocity, initmove.velocity);
	VectorClear(initmove.viewoffset);
	initmove.viewoffset[2] += bs->cur_ps.viewheight;
	initmove.entitynum = bs->entitynum;
	initmove.client = bs->client;
	initmove.thinktime = bs->thinktime;
	if (bs->cur_ps.groundEntityNum != ENTITYNUM_NONE) initmove.or_moveflags |= MFL_ONGROUND;
	if ((bs->cur_ps.pm_flags & PMF_TIME_KNOCKBACK) && (bs->cur_ps.pm_time > 0)) initmove.or_moveflags |= MFL_TELEPORTED;
	if ((bs->cur_ps.pm_flags & PMF_TIME_WATERJUMP) && (bs->cur_ps.pm_time > 0)) initmove.or_moveflags |= MFL_WATERJUMP;
	if (bs->cur_ps.pm_flags & PMF_DUCKED) initmove.presencetype = PRESENCE_CROUCH;
	else initmove.presencetype = PRESENCE_NORMAL;
	if (bs->walker > 0.5) initmove.or_moveflags |= MFL_WALK;
	VectorCopy(bs->viewangles, initmove.viewangles);
	trap_BotInitMoveState(bs->ms, &initmove);
}
void BotSetMovedir(vec3_t angles, vec3_t movedir) {
	if (VectorCompare(angles, VEC_UP)) VectorCopy(MOVEDIR_UP, movedir);
	else if (VectorCompare(angles, VEC_DOWN)) VectorCopy(MOVEDIR_DOWN, movedir);
	else AngleVectors(angles, movedir, NULL, NULL);
}
void BotRandomMove(bot_state_t *bs, bot_moveresult_t *moveresult) {
	vec3_t dir, angles;
	angles[0] = 0; angles[1] = random() * 360; angles[2] = 0;
	AngleVectors(angles, dir, NULL, NULL);
	trap_BotMoveInDirection(bs->ms, dir, 400, MOVE_WALK);
	moveresult->failure = qfalse;
	VectorCopy(dir, moveresult->movedir);
}
int BotAIPredictObstacles(bot_state_t *bs, bot_goal_t *goal) {
	int modelnum, entitynum, bspent; bot_activategoal_t activategoal; aas_predictroute_t route;
	if (!bot_predictobstacles.integer) return qfalse;
	if (bs->predictobstacles_goalareanum == goal->areanum && bs->predictobstacles_time > FloatTime() - 6) return qfalse;
	bs->predictobstacles_goalareanum = goal->areanum; bs->predictobstacles_time = FloatTime();
	trap_AAS_PredictRoute(&route, bs->areanum, bs->origin, goal->areanum, bs->tfl, 100, 1000, RSE_USETRAVELTYPE|RSE_ENTERCONTENTS, AREACONTENTS_MOVER, TFL_BRIDGE, 0);
	if (route.stopevent & RSE_ENTERCONTENTS) {
		if (route.endcontents & AREACONTENTS_MOVER) {
			modelnum = (route.endcontents & AREACONTENTS_MODELNUM) >> AREACONTENTS_MODELNUMSHIFT;
			if (modelnum) {
				entitynum = BotModelMinsMaxs(modelnum, ET_MOVER, 0, NULL, NULL);
				if (entitynum) {
					bspent = BotGetActivateGoal(bs, entitynum, &activategoal);
					if (bspent) {
						if (bs->activatestack && !bs->activatestack->inuse) bs->activatestack = NULL;
						if (!BotIsGoingToActivateEntity(bs, activategoal.goal.entitynum)) { BotGoForActivateGoal(bs, &activategoal); return qtrue; }
						else BotEnableActivateGoalAreas(&activategoal, qtrue);
					}
				}
			}
		}
	}
	return qfalse;
}

/* Unchanged Baseq3 ai_dmq3.c route-goal function bodies. */
bot_goal_t *BotAlternateRoute(bot_state_t *bs, bot_goal_t *goal) {
	int t;
	if (bs->altroutegoal.areanum) {
		if (bs->reachedaltroutegoal_time)
			return goal;
		t = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, bs->altroutegoal.areanum, bs->tfl);
		if (t && t < 20) {
			bs->reachedaltroutegoal_time = FloatTime();
		}
		memcpy(goal, &bs->altroutegoal, sizeof(bot_goal_t));
		return &bs->altroutegoal;
	}
	return goal;
}

int BotGetAlternateRouteGoal(bot_state_t *bs, int base) {
	aas_altroutegoal_t *altroutegoals;
	bot_goal_t *goal;
	int numaltroutegoals, rnd;
	if (base == TEAM_RED) {
		altroutegoals = red_altroutegoals;
		numaltroutegoals = red_numaltroutegoals;
	}
	else {
		altroutegoals = blue_altroutegoals;
		numaltroutegoals = blue_numaltroutegoals;
	}
	if (!numaltroutegoals)
		return qfalse;
	rnd = (float) random() * numaltroutegoals;
	if (rnd >= numaltroutegoals)
		rnd = numaltroutegoals-1;
	goal = &bs->altroutegoal;
	goal->areanum = altroutegoals[rnd].areanum;
	VectorCopy(altroutegoals[rnd].origin, goal->origin);
	VectorSet(goal->mins, -8, -8, -8);
	VectorSet(goal->maxs, 8, 8, 8);
	goal->entitynum = 0;
	goal->iteminfo = 0;
	goal->number = 0;
	goal->flags = 0;
	bs->reachedaltroutegoal_time = 0;
	return qtrue;
}

static void reset(void){memset(&captured_init,0,sizeof(captured_init));init_handle=0;move_calls=predict_calls=go_calls=enable_calls=travel_calls=0;model_result=get_result=going_result=travel_result=0;route_value.stopevent=route_value.endcontents=0;stack_inuse=1;}
int main(void){bot_state_t b;bot_goal_t g;bot_moveresult_t m;bot_activategoal_t stackgoal;vec3_t a,d;memset(&b,0,sizeof(b));memset(&m,0,sizeof(m));memset(&stackgoal,0,sizeof(stackgoal));stackgoal.inuse=1;
 reset();SCENARIO();b.cur_ps.origin[0]=1;b.cur_ps.origin[1]=2;b.cur_ps.origin[2]=3;b.cur_ps.velocity[0]=4;b.cur_ps.velocity[1]=5;b.cur_ps.velocity[2]=6;b.cur_ps.viewheight=26;b.cur_ps.groundEntityNum=7;b.cur_ps.pm_flags=PMF_DUCKED|PMF_TIME_KNOCKBACK|PMF_TIME_WATERJUMP;b.cur_ps.pm_time=1;b.entitynum=9;b.client=8;b.ms=44;b.thinktime=.125f;b.walker=.75f;b.viewangles[0]=10;b.viewangles[1]=20;b.viewangles[2]=30;BotSetupForMovement(&b);OBS(init_handle==44);OBS(captured_init.origin[2]==3);OBS(captured_init.velocity[1]==5);OBS(captured_init.viewoffset[2]==26);OBS(captured_init.entitynum==9&&captured_init.client==8);OBS(captured_init.thinktime==.125f);OBS(captured_init.or_moveflags==(MFL_ONGROUND|MFL_TELEPORTED|MFL_WATERJUMP|MFL_WALK));OBS(captured_init.presencetype==PRESENCE_CROUCH);OBS(captured_init.viewangles[1]==20);
 reset();SCENARIO();b.cur_ps.groundEntityNum=ENTITYNUM_NONE;b.cur_ps.pm_flags=PMF_TIME_KNOCKBACK;b.cur_ps.pm_time=0;b.walker=.5f;BotSetupForMovement(&b);OBS(captured_init.or_moveflags==0);OBS(captured_init.presencetype==PRESENCE_NORMAL);
 SCENARIO();a[0]=0;a[1]=-1;a[2]=0;BotSetMovedir(a,d);OBS(d[0]==0&&d[1]==0&&d[2]==1);a[1]=-2;BotSetMovedir(a,d);OBS(d[2]==-1);a[1]=90;BotSetMovedir(a,d);OBS(fabsf(d[0])<1e-6f&&fabsf(d[1]-1)<1e-6f);
 reset();SCENARIO();random_value=.25f;b.ms=55;m.failure=1;BotRandomMove(&b,&m);OBS(move_calls==1);OBS(move_handle==55);OBS(captured_speed==400&&captured_movetype==MOVE_WALK);OBS(m.failure==0);OBS(fabsf(m.movedir[1]-1)<1e-6f);
 reset();SCENARIO();bot_predictobstacles.integer=0;g.areanum=5;OBS(!BotAIPredictObstacles(&b,&g));OBS(predict_calls==0);
 reset();SCENARIO();bot_predictobstacles.integer=1;now_value=20;b.predictobstacles_goalareanum=5;b.predictobstacles_time=15;OBS(!BotAIPredictObstacles(&b,&g));OBS(predict_calls==0);OBS(b.predictobstacles_time==15);
 reset();SCENARIO();b.predictobstacles_goalareanum=0;b.predictobstacles_time=0;route_value.stopevent=RSE_ENTERCONTENTS;route_value.endcontents=3<<AREACONTENTS_MODELNUMSHIFT;OBS(!BotAIPredictObstacles(&b,&g));OBS(predict_calls==1);OBS(b.predictobstacles_goalareanum==5);OBS(b.predictobstacles_time==20);
 reset();SCENARIO();b.predictobstacles_goalareanum=0;route_value.stopevent=RSE_ENTERCONTENTS;route_value.endcontents=AREACONTENTS_MOVER|(3<<AREACONTENTS_MODELNUMSHIFT);model_result=71;get_result=4;going_result=0;stackgoal.inuse=1;b.activatestack=&stackgoal;OBS(BotAIPredictObstacles(&b,&g));OBS(predict_calls==1);OBS(go_calls==1);OBS(enable_calls==0);OBS(b.activatestack==&stackgoal);
 reset();SCENARIO();b.predictobstacles_goalareanum=0;route_value.stopevent=RSE_ENTERCONTENTS;route_value.endcontents=AREACONTENTS_MOVER|(3<<AREACONTENTS_MODELNUMSHIFT);model_result=71;get_result=4;going_result=1;stackgoal.inuse=0;b.activatestack=&stackgoal;OBS(!BotAIPredictObstacles(&b,&g));OBS(go_calls==0);OBS(enable_calls==1);OBS(b.activatestack==NULL);
 reset();SCENARIO();memset(&b.altroutegoal,0,sizeof(b.altroutegoal));g.areanum=9;OBS(BotAlternateRoute(&b,&g)==&g);OBS(travel_calls==0);
 reset();SCENARIO();b.altroutegoal.areanum=12;b.reachedaltroutegoal_time=5;g.areanum=9;OBS(BotAlternateRoute(&b,&g)==&g);OBS(g.areanum==9);OBS(travel_calls==0);
 reset();SCENARIO();b.reachedaltroutegoal_time=0;b.altroutegoal.areanum=12;b.altroutegoal.origin[0]=1;b.altroutegoal.origin[1]=2;b.altroutegoal.origin[2]=3;travel_result=30;OBS(BotAlternateRoute(&b,&g)==&b.altroutegoal);OBS(g.areanum==12);OBS(g.origin[2]==3);OBS(b.reachedaltroutegoal_time==0);OBS(travel_calls==1);
 reset();SCENARIO();b.reachedaltroutegoal_time=0;b.altroutegoal.areanum=13;travel_result=19;now_value=20;OBS(BotAlternateRoute(&b,&g)==&b.altroutegoal);OBS(b.reachedaltroutegoal_time==20);OBS(g.areanum==13);
 reset();SCENARIO();red_numaltroutegoals=0;blue_numaltroutegoals=0;OBS(!BotGetAlternateRouteGoal(&b,TEAM_RED));OBS(b.reachedaltroutegoal_time==20);
 reset();SCENARIO();red_numaltroutegoals=2;red_altroutegoals[0].areanum=21;red_altroutegoals[1].areanum=22;red_altroutegoals[1].origin[0]=20;red_altroutegoals[1].origin[1]=21;red_altroutegoals[1].origin[2]=22;random_value=.75f;b.reachedaltroutegoal_time=9;OBS(BotGetAlternateRouteGoal(&b,TEAM_RED));OBS(b.altroutegoal.areanum==22);OBS(b.altroutegoal.origin[1]==21);OBS(b.altroutegoal.mins[0]==-8&&b.altroutegoal.maxs[2]==8);OBS(b.altroutegoal.entitynum==0&&b.altroutegoal.iteminfo==0&&b.altroutegoal.number==0&&b.altroutegoal.flags==0);OBS(b.reachedaltroutegoal_time==0);
 reset();SCENARIO();blue_numaltroutegoals=1;blue_altroutegoals[0].areanum=31;blue_altroutegoals[0].origin[0]=30;random_value=1;OBS(BotGetAlternateRouteGoal(&b,2));OBS(b.altroutegoal.areanum==31);OBS(b.altroutegoal.origin[0]==30);OBS(b.altroutegoal.maxs[0]==8);
 printf("PASS: %d native Baseq3 bot navigation scenarios / %d exact observations\n",scenarios,observations);return 0;}
