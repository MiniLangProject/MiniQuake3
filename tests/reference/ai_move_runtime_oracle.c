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
#define ACTION_NONE 0
#define ACTION_JUMP 1
#define ACTION_DELAYEDJUMP 2
#define MOVERESULT_MOVEMENTVIEW 1

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

static float normalize(vec3_t value) {
    const float length=sqrtf(value[0]*value[0]+value[1]*value[1]+value[2]*value[2]);
    if (length>0.0f) { value[0]/=length; value[1]/=length; value[2]/=length; }
    return length;
}
static void crouch_move(const vec3_t origin, const vec3_t end, vec3_t dir, float *speed) {
    dir[0]=end[0]-origin[0]; dir[1]=end[1]-origin[1]; dir[2]=0.0f;
    (void)normalize(dir); *speed=400.0f;
}
static float dot(const vec3_t a,const vec3_t b) {
    return a[0]*b[0]+a[1]*b[1]+a[2]*b[2];
}
/* Focused BotTravel_Jump extraction. run_distance is the result of its
 * ten-unit AAS_PointAreaNum gap scan (0..80). */
static void jump_move(const vec3_t start,const vec3_t end,const vec3_t origin,
                      float run_distance,vec3_t movedir,float *speed,int *action) {
    vec3_t run_dir={start[0]-end[0],start[1]-end[1],0.0f};
    vec3_t run_start,dir1,dir2;
    float dist1,dist2;
    (void)normalize(run_dir);
    run_start[0]=start[0]+run_distance*run_dir[0];
    run_start[1]=start[1]+run_distance*run_dir[1]; run_start[2]=start[2];
    dir1[0]=origin[0]-start[0]; dir1[1]=origin[1]-start[1]; dir1[2]=0.0f;
    dist1=normalize(dir1);
    dir2[0]=origin[0]-run_start[0]; dir2[1]=origin[1]-run_start[1]; dir2[2]=0.0f;
    dist2=normalize(dir2); *action=ACTION_NONE;
    if (dot(dir1,dir2)<-0.8f || dist2<5.0f) {
        movedir[0]=end[0]-origin[0]; movedir[1]=end[1]-origin[1]; movedir[2]=0.0f;
        (void)normalize(movedir); *speed=600.0f;
        if (dist1<24.0f) *action=ACTION_JUMP;
        else if (dist1<32.0f) *action=ACTION_DELAYEDJUMP;
    } else {
        movedir[0]=run_start[0]-origin[0]; movedir[1]=run_start[1]-origin[1]; movedir[2]=0.0f;
        (void)normalize(movedir); if (dist2>80.0f) dist2=80.0f; *speed=5.0f*dist2;
    }
}
static int finish_jump(const vec3_t start,const vec3_t end,const vec3_t origin,
                       int jump_reach,vec3_t movedir,float *speed) {
    vec3_t reachdir; float dist;
    memset(movedir,0,sizeof(vec3_t)); *speed=0.0f; if (!jump_reach) return 0;
    movedir[0]=end[0]-origin[0]; movedir[1]=end[1]-origin[1]; movedir[2]=0.0f;
    dist=normalize(movedir);
    reachdir[0]=end[0]-start[0]; reachdir[1]=end[1]-start[1]; reachdir[2]=0.0f;
    (void)normalize(reachdir);
    if (dot(movedir,reachdir)<-0.5f && dist<24.0f) { memset(movedir,0,sizeof(vec3_t)); return 0; }
    *speed=800.0f; return 1;
}
static void vector_to_angles(const vec3_t value,vec3_t angles) {
    float forward,yaw,pitch;
    if (value[1]==0.0f && value[0]==0.0f) { yaw=0.0f; pitch=value[2]>0.0f ? 90.0f : 270.0f; }
    else {
        if (value[0]!=0.0f) yaw=(float)(atan2(value[1],value[0])*180.0/3.14159265358979323846);
        else yaw=value[1]>0.0f ? 90.0f : 270.0f;
        if (yaw<0.0f) yaw+=360.0f;
        forward=sqrtf(value[0]*value[0]+value[1]*value[1]);
        pitch=(float)(atan2(value[2],forward)*180.0/3.14159265358979323846);
        if (pitch<0.0f) pitch+=360.0f;
    }
    angles[0]=-pitch; angles[1]=yaw; angles[2]=0.0f;
}
static void ladder_move(const vec3_t origin,const vec3_t end,bot_moveresult_t *result) {
    vec3_t viewdir;
    memset(result,0,sizeof(*result));
    result->movedir[0]=end[0]-origin[0]; result->movedir[1]=end[1]-origin[1]; result->movedir[2]=end[2]-origin[2];
    (void)normalize(result->movedir);
    viewdir[0]=result->movedir[0]; viewdir[1]=result->movedir[1]; viewdir[2]=3.0f*result->movedir[2];
    vector_to_angles(viewdir,result->ideal_viewangles); result->flags|=MOVERESULT_MOVEMENTVIEW;
}
static void barrier_jump(const vec3_t origin,const vec3_t start,vec3_t movedir,float *speed,int *action) {
    float dist;
    movedir[0]=start[0]-origin[0]; movedir[1]=start[1]-origin[1]; movedir[2]=0.0f;
    dist=normalize(movedir); *speed=0.0f; *action=ACTION_NONE;
    if (dist<9.0f) *action=ACTION_JUMP;
    else { if (dist>60.0f) dist=60.0f; *speed=6.0f*dist; }
}
static int finish_barrier_jump(const vec3_t origin,const vec3_t velocity,const vec3_t end,
                               vec3_t movedir,float *speed) {
    memset(movedir,0,sizeof(vec3_t)); *speed=0.0f; if (velocity[2]>=250.0f) return 0;
    movedir[0]=end[0]-origin[0]; movedir[1]=end[1]-origin[1]; movedir[2]=0.0f;
    (void)normalize(movedir); *speed=400.0f; return 1;
}
static int horizontal_velocity_for_jump(float zvel,const vec3_t start,const vec3_t end,float *velocity) {
    const float gravity=800.0f,maxvelocity=320.0f;
    const float maxjump=0.5f*gravity*(zvel/gravity)*(zvel/gravity);
    const float height2fall=start[2]+maxjump-end[2];
    float t,denominator,dx,dy;
    if (height2fall<0.0f) { *velocity=maxvelocity; return 0; }
    t=sqrtf(height2fall/(0.5f*gravity)); denominator=t+zvel/gravity;
    if (denominator==0.0f) { *velocity=maxvelocity; return 0; }
    dx=end[0]-start[0]; dy=end[1]-start[1]; *velocity=sqrtf(dx*dx+dy*dy)/denominator;
    if (*velocity>maxvelocity) { *velocity=maxvelocity; return 0; }
    return 1;
}
static void walk_off_ledge(const vec3_t origin,const vec3_t start,const vec3_t end,
                           vec3_t movedir,float *speed) {
    vec3_t reachdir={end[0]-start[0],end[1]-start[1],0.0f};
    float reachdist=normalize(reachdir),dist;
    movedir[0]=start[0]-origin[0]; movedir[1]=start[1]-origin[1]; movedir[2]=0.0f;
    dist=normalize(movedir);
    if (dist<48.0f) {
        movedir[0]=end[0]-origin[0]; movedir[1]=end[1]-origin[1]; movedir[2]=0.0f;
        (void)normalize(movedir);
        if (reachdist<20.0f) *speed=100.0f;
        else if (!horizontal_velocity_for_jump(0.0f,start,end,speed)) *speed=400.0f;
    } else if (reachdist<20.0f) {
        if (dist>64.0f) dist=64.0f; *speed=144.0f+4.0f*dist;
    } else *speed=400.0f;
}
static int air_control(const vec3_t origin,const vec3_t velocity,const vec3_t goal,
                       vec3_t movedir,float *speed) {
    vec3_t org={origin[0],origin[1],origin[2]};
    vec3_t vel={velocity[0]*0.1f,velocity[1]*0.1f,velocity[2]*0.1f};
    int i,j; float scale,dist;
    for (i=0;i<50;i++) {
        vel[2]-=800.0f*0.01f;
        if (vel[2]<0.0f && org[2]+vel[2]<goal[2]) {
            scale=(goal[2]-org[2])/vel[2];
            for (j=0;j<3;j++) { vel[j]*=scale; org[j]+=vel[j]; }
            for (j=0;j<3;j++) movedir[j]=goal[j]-org[j];
            dist=normalize(movedir); if (dist>32.0f) dist=32.0f; *speed=13.0f*dist; return 1;
        }
        for (j=0;j<3;j++) org[j]+=vel[j];
    }
    memset(movedir,0,sizeof(vec3_t)); *speed=400.0f; return 0;
}
static void finish_walk_off_ledge(const vec3_t origin,const vec3_t velocity,const vec3_t end,
                                  vec3_t movedir,float *speed) {
    vec3_t full={end[0]-origin[0],end[1]-origin[1],end[2]-origin[2]};
    vec3_t horizontal={full[0],full[1],0.0f},target;
    float dist=normalize(horizontal); int i;
    memcpy(target,end,sizeof(vec3_t));
    if (dist>16.0f) for (i=0;i<3;i++) target[i]=end[i]+16.0f*horizontal[i];
    if (!air_control(origin,velocity,target,movedir,speed)) {
        movedir[0]=full[0]; movedir[1]=full[1]; movedir[2]=0.0f; (void)normalize(movedir); *speed=400.0f;
    }
}

int main(void) {
    bot_initmove_t value={{1,2,3},{4,5,6},{7,8,9},17,5,0.05f,2,{10,20,30},MFL_ONGROUND|MFL_WALK};
    move_prefix_t state;
    vec3_t start={0,0,0},end={3,4,0},target={9,9,9};
    float dist;
    float speed;
    int action;
    bot_moveresult_t move_result;
    vec3_t jump_start={0,0,0},jump_end={10,0,0},jump_origin,movedir;
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

    crouch_move(start,end,movedir,&speed);
    CHECK(speed==400.0f && movedir[0]==0.6f && movedir[1]==0.8f && movedir[2]==0.0f);

    jump_origin[0]=1.0f; jump_origin[1]=0.0f; jump_origin[2]=0.0f;
    jump_move(jump_start,jump_end,jump_origin,0.0f,movedir,&speed,&action);
    CHECK(action==ACTION_JUMP && speed==600.0f && movedir[0]==1.0f);
    jump_origin[0]=-28.0f; jump_move(jump_start,jump_end,jump_origin,80.0f,movedir,&speed,&action);
    CHECK(action==ACTION_DELAYEDJUMP && speed==600.0f && movedir[0]==1.0f);
    jump_origin[0]=-100.0f; jump_move(jump_start,jump_end,jump_origin,80.0f,movedir,&speed,&action);
    CHECK(action==ACTION_NONE && speed==100.0f && movedir[0]==1.0f);

    jump_origin[0]=5.0f; CHECK(finish_jump(jump_start,jump_end,jump_origin,1,movedir,&speed));
    CHECK(speed==800.0f && movedir[0]==1.0f);
    jump_origin[0]=20.0f; CHECK(!finish_jump(jump_start,jump_end,jump_origin,1,movedir,&speed));
    CHECK(speed==0.0f && movedir[0]==0.0f);

    jump_end[2]=10.0f; ladder_move(jump_start,jump_end,&move_result);
    CHECK((move_result.flags&MOVERESULT_MOVEMENTVIEW)!=0);
    CHECK(fabsf(move_result.movedir[0]-0.70710677f)<0.00001f && fabsf(move_result.movedir[2]-0.70710677f)<0.00001f);
    CHECK(fabsf(move_result.ideal_viewangles[0]-(-71.56505f))<0.0001f && move_result.ideal_viewangles[1]==0.0f);

    jump_end[2]=0.0f; jump_origin[0]=1.0f; jump_origin[2]=0.0f;
    barrier_jump(jump_origin,jump_start,movedir,&speed,&action);
    CHECK(action==ACTION_JUMP && speed==0.0f && movedir[0]==-1.0f);
    jump_origin[0]=-10.0f; barrier_jump(jump_origin,jump_start,movedir,&speed,&action);
    CHECK(action==ACTION_NONE && speed==60.0f && movedir[0]==1.0f);
    jump_origin[0]=5.0f; jump_origin[2]=5.0f; jump_end[0]=10.0f;
    { vec3_t velocity={0,0,300}; CHECK(!finish_barrier_jump(jump_origin,velocity,jump_end,movedir,&speed) && speed==0.0f); }
    { vec3_t velocity={0,0,200}; CHECK(finish_barrier_jump(jump_origin,velocity,jump_end,movedir,&speed) && speed==400.0f && movedir[0]==1.0f); }

    jump_origin[0]=1.0f; jump_origin[2]=0.0f;
    walk_off_ledge(jump_origin,jump_start,jump_end,movedir,&speed);
    CHECK(speed==100.0f && movedir[0]==1.0f);
    jump_origin[0]=-100.0f; walk_off_ledge(jump_origin,jump_start,jump_end,movedir,&speed);
    CHECK(speed==400.0f && movedir[0]==1.0f);
    jump_origin[0]=-5.0f; jump_end[0]=40.0f; jump_end[2]=-20.0f;
    walk_off_ledge(jump_origin,jump_start,jump_end,movedir,&speed);
    CHECK(fabsf(speed-178.88544f)<0.001f && movedir[0]==1.0f);
    jump_origin[0]=5.0f; jump_origin[2]=10.0f; jump_end[0]=10.0f; jump_end[2]=0.0f;
    { vec3_t velocity={0,0,-100}; finish_walk_off_ledge(jump_origin,velocity,jump_end,movedir,&speed); }
    CHECK(speed==65.0f && movedir[0]==1.0f && movedir[2]==0.0f);

    printf("PASS: 20 native Baseq3 move-runtime scenarios / %d exact observations\n",observations);
    return 0;
}
