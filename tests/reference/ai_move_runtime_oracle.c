/* Copyright (C) 1999-2005 Id Software, Inc.
 * SPDX-License-Identifier: GPL-2.0-or-later
 * Focused extraction from code/botlib/be_ai_move.c and be_ai_move.h. */
#include <math.h>
#include <stddef.h>
#include <stdio.h>
#include <string.h>

#define MFL_ONGROUND 2
#define MFL_WATERJUMP 16
#define MFL_TELEPORTED 32
#define MFL_GRAPPLEPULL 64
#define MFL_WALK 512
#define TRAVEL_TELEPORT 10
#define TRAVEL_ROCKETJUMP 12
#define TRAVEL_BFGJUMP 13

typedef float vec3_t[3];
typedef struct {
    vec3_t origin, velocity, viewoffset;
    int entitynum, client;
    float thinktime;
    int presencetype;
    vec3_t viewangles;
    int or_moveflags;
} bot_initmove_t;
typedef struct {
    vec3_t origin, velocity, viewoffset;
    int entitynum, client;
    float thinktime;
    int presencetype;
    vec3_t viewangles;
    int moveflags;
} move_prefix_t;
typedef struct {
    int failure,type,blocked,blockentity,traveltype,flags,weapon;
    vec3_t movedir,ideal_viewangles;
} bot_moveresult_t;

static int observations;
#define CHECK(x) do { observations++; if (!(x)) { \
    fprintf(stderr,"FAIL line %d: %s\n",__LINE__,#x); return 1; } } while (0)

static void init_move(move_prefix_t *state, const bot_initmove_t *value) {
    memcpy(state->origin,value->origin,sizeof(vec3_t));
    memcpy(state->velocity,value->velocity,sizeof(vec3_t));
    memcpy(state->viewoffset,value->viewoffset,sizeof(vec3_t));
    state->entitynum=value->entitynum; state->client=value->client;
    state->thinktime=value->thinktime; state->presencetype=value->presencetype;
    memcpy(state->viewangles,value->viewangles,sizeof(vec3_t));
#define COPY_FLAG(flag) state->moveflags=(state->moveflags & ~(flag)) | (value->or_moveflags & (flag))
    COPY_FLAG(MFL_ONGROUND); COPY_FLAG(MFL_TELEPORTED); COPY_FLAG(MFL_WATERJUMP);
    COPY_FLAG(MFL_WALK); COPY_FLAG(MFL_GRAPPLEPULL);
#undef COPY_FLAG
}

static int add_target(const vec3_t start, const vec3_t end, float maxdist,
                      float *dist, vec3_t target) {
    vec3_t dir;
    float length;
    int i;
    for (i=0;i<3;i++) dir[i]=end[i]-start[i];
    length=sqrtf(dir[0]*dir[0]+dir[1]*dir[1]+dir[2]*dir[2]);
    if (length>0.0f) for (i=0;i<3;i++) dir[i]/=length;
    if (*dist+length<maxdist) {
        memcpy(target,end,sizeof(vec3_t)); *dist+=length; return 0;
    }
    for (i=0;i<3;i++) target[i]=start[i]+(maxdist-*dist)*dir[i];
    *dist=maxdist; return 1;
}

static int stops_at_reach_start(int traveltype) {
    return traveltype==TRAVEL_TELEPORT || traveltype==TRAVEL_ROCKETJUMP || traveltype==TRAVEL_BFGJUMP;
}
static float walk_speed(float gap, int slow) {
    if (slow) return gap>0.0f ? 20.0f+gap : 200.0f;
    return gap>0.0f ? 40.0f+2.0f*gap : 400.0f;
}
static float goal_speed(float distance) {
    float value=4.0f*(distance>100.0f ? 100.0f : distance);
    return value<10.0f ? 0.0f : value;
}

int main(void) {
    bot_initmove_t value={{1,2,3},{4,5,6},{7,8,9},17,5,0.05f,2,{10,20,30},MFL_ONGROUND|MFL_WALK};
    move_prefix_t state;
    vec3_t start={0,0,0},end={3,4,0},target={9,9,9};
    float dist;
    memset(&state,0,sizeof(state)); state.moveflags=1|4|128|MFL_TELEPORTED|MFL_WATERJUMP|MFL_GRAPPLEPULL;

    CHECK(sizeof(bot_initmove_t)==68u);
    CHECK(offsetof(bot_initmove_t,entitynum)==36u);
    CHECK(offsetof(bot_initmove_t,thinktime)==44u);
    CHECK(offsetof(bot_initmove_t,presencetype)==48u);
    CHECK(offsetof(bot_initmove_t,viewangles)==52u);
    CHECK(offsetof(bot_initmove_t,or_moveflags)==64u);

    init_move(&state,&value);
    CHECK(state.origin[0]==1.0f && state.origin[2]==3.0f);
    CHECK(state.velocity[1]==5.0f);
    CHECK(state.viewoffset[2]==9.0f);
    CHECK(state.entitynum==17 && state.client==5 && state.thinktime==0.05f && state.presencetype==2);
    CHECK(state.viewangles[0]==10.0f && state.viewangles[2]==30.0f);

    CHECK((state.moveflags&(1|4|128))==(1|4|128));
    CHECK((state.moveflags&(MFL_TELEPORTED|MFL_WATERJUMP|MFL_GRAPPLEPULL))==0);
    CHECK((state.moveflags&(MFL_ONGROUND|MFL_WALK))==(MFL_ONGROUND|MFL_WALK));

    dist=0.0f; CHECK(!add_target(start,end,10.0f,&dist,target) && dist==5.0f && target[0]==3.0f && target[1]==4.0f);
    dist=0.0f; CHECK(add_target(start,end,2.5f,&dist,target) && target[0]==1.5f && target[1]==2.0f);
    dist=5.0f; CHECK(add_target(start,end,10.0f,&dist,target) && target[0]==3.0f && target[1]==4.0f);
    dist=0.0f; CHECK(!add_target(start,start,1.0f,&dist,target) && dist==0.0f);

    CHECK(stops_at_reach_start(TRAVEL_TELEPORT));
    CHECK(stops_at_reach_start(TRAVEL_ROCKETJUMP));
    CHECK(stops_at_reach_start(TRAVEL_BFGJUMP));

    CHECK((MFL_ONGROUND|MFL_WATERJUMP|MFL_TELEPORTED|MFL_GRAPPLEPULL|MFL_WALK)==626);
    CHECK(TRAVEL_TELEPORT==10 && TRAVEL_ROCKETJUMP==12 && TRAVEL_BFGJUMP==13);
    CHECK(sizeof(vec3_t)==12u);

    CHECK(sizeof(bot_moveresult_t)==52u);
    CHECK(offsetof(bot_moveresult_t,movedir)==28u);
    CHECK(offsetof(bot_moveresult_t,ideal_viewangles)==40u);
    CHECK(walk_speed(0.0f,0)==400.0f);
    CHECK(walk_speed(20.0f,0)==80.0f);
    CHECK(walk_speed(0.0f,1)==200.0f);
    CHECK(walk_speed(20.0f,1)==40.0f);
    CHECK(goal_speed(5.0f)==20.0f);
    CHECK(goal_speed(1.0f)==0.0f);
    CHECK(goal_speed(150.0f)==400.0f);

    printf("PASS: 8 native Baseq3 move-runtime scenarios / %d exact observations\n",observations);
    return 0;
}
