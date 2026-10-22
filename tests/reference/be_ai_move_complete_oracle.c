#include <math.h>
#include <stdio.h>
#include <string.h>
#define qfalse 0
#define qtrue 1
#define TRAVELTYPE_MASK 0xffffff
#define TRAVEL_WALK 2
#define TRAVEL_CROUCH 3
#define TRAVEL_BARRIERJUMP 4
#define TRAVEL_JUMP 5
#define TRAVEL_LADDER 6
#define TRAVEL_WALKOFFLEDGE 7
#define TRAVEL_SWIM 8
#define TRAVEL_WATERJUMP 9
#define TRAVEL_TELEPORT 10
#define TRAVEL_ELEVATOR 11
#define TRAVEL_ROCKETJUMP 12
#define TRAVEL_BFGJUMP 13
#define TRAVEL_GRAPPLEHOOK 14
#define TRAVEL_JUMPPAD 18
#define TRAVEL_FUNCBOB 19
#define PRT_ERROR 1
typedef float vec2_t[2]; typedef float vec3_t[3];
typedef struct {int areanum,facenum,edgenum;vec3_t start,end;int traveltype,traveltime;} aas_reachability_t;
typedef struct {int failure,type,blocked,blockentity,traveltype,flags,weapon;vec3_t movedir,ideal_viewangles;} bot_moveresult_t;
static void printer(int type,const char *fmt,...){(void)type;(void)fmt;} static struct {void (*Print)(int,const char*,...);} botimport={printer};
#define VectorSubtract(a,b,c) do{(c)[0]=(a)[0]-(b)[0];(c)[1]=(a)[1]-(b)[1];(c)[2]=(a)[2]-(b)[2];}while(0)
#define VectorLengthSquared(v) ((v)[0]*(v)[0]+(v)[1]*(v)[1]+(v)[2]*(v)[2])
#define VectorCopy(a,b) memcpy((b),(a),sizeof(vec3_t))
#define VectorMA(v,s,b,o) do{(o)[0]=(v)[0]+(s)*(b)[0];(o)[1]=(v)[1]+(s)*(b)[1];(o)[2]=(v)[2]+(s)*(b)[2];}while(0)
static float VectorNormalize(vec3_t v){float l=sqrtf(VectorLengthSquared(v));if(l){v[0]/=l;v[1]/=l;v[2]/=l;}return l;}
static void AAS_ProjectPointOntoVector(const vec3_t p,const vec3_t a,const vec3_t b,vec3_t out){vec3_t d;float den,t;VectorSubtract(b,a,d);den=VectorLengthSquared(d);t=den?((p[0]-a[0])*d[0]+(p[1]-a[1])*d[1]+(p[2]-a[2])*d[2])/den:0;out[0]=a[0]+t*d[0];out[1]=a[1]+t*d[1];out[2]=a[2]+t*d[2];}
#include "be_ai_move_complete_under_test.inc"
static void reach(int type){aas_reachability_t r={0};r.traveltype=type;printf("time:%d=%d\n",type,BotReachabilityTime(&r));}
int main(void){vec3_t p={5,3,0},a={0,0,0},b={10,0,0},far={15,4,0},target={0};vec2_t i={0};float dist=0;bot_moveresult_t m={1,9,1,9,9,9,9,{7,0,0},{8,0,0}};printf("angle=%g,%g\n",AngleDiff(350,10),AngleDiff(10,350));printf("line=%g,%g\n",DistanceFromLineSquared(p,a,b),DistanceFromLineSquared(far,a,b));printf("vector=%g\n",VectorDistanceSquared(a,(vec3_t){3,4,0}));printf("intersection=%d",Intersection((vec2_t){0,0},(vec2_t){10,10},(vec2_t){0,10},(vec2_t){10,0},i));printf(",%g,%g\n",i[0],i[1]);printf("target=%d",BotAddToTarget(a,b,4,&dist,target));printf(",%g,%g\n",dist,target[0]);dist=0;printf("target2=%d",BotAddToTarget(a,b,20,&dist,target));printf(",%g,%g\n",dist,target[0]);BotClearMoveResult(&m);printf("clear=%d,%d,%d,%d,%d,%d,%g\n",m.failure,m.type,m.blocked,m.blockentity,m.traveltype,m.flags,m.movedir[0]);reach(TRAVEL_WALK);reach(TRAVEL_LADDER);reach(TRAVEL_ELEVATOR);reach(TRAVEL_GRAPPLEHOOK);reach(TRAVEL_ROCKETJUMP);reach(TRAVEL_JUMPPAD);return 0;}
