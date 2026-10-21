#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
typedef int qhandle_t;
typedef float vec3_t[3];
typedef struct { vec3_t origin; vec3_t axis[3]; } orientation_t;
typedef struct { vec3_t origin,oldorigin,lightingOrigin,axis[3]; int frame,oldframe; float backlerp; } refEntity_t;
typedef struct { int trType,trTime,trDuration; vec3_t trBase,trDelta; } trajectory_t;
typedef struct { int number,eType,groundEntityNum; trajectory_t pos,apos; } entityState_t;
typedef struct { entityState_t currentState,nextState; int interpolate; vec3_t lerpOrigin,lerpAngles; } centity_t;
typedef struct { int serverTime; } snapshot_t;
typedef struct { snapshot_t *snap,*nextSnap; float frameInterpolation; int time; centity_t predictedPlayerEntity; } cg_t;
#define ET_MOVER 4
#define ENTITYNUM_MAX_NORMAL 1022
#define VectorCopy(a,b) memcpy((b),(a),sizeof(vec3_t))
#define VectorAdd(a,b,c) do{for(int vi=0;vi<3;vi++)(c)[vi]=(a)[vi]+(b)[vi];}while(0)
#define VectorSubtract(a,b,c) do{for(int vi=0;vi<3;vi++)(c)[vi]=(a)[vi]-(b)[vi];}while(0)
#define VectorMA(a,s,b,c) do{for(int vi=0;vi<3;vi++)(c)[vi]=(a)[vi]+(s)*(b)[vi];}while(0)
static void MatrixMultiply(const vec3_t in1[3],const vec3_t in2[3],vec3_t out[3]){for(int r=0;r<3;r++)for(int c=0;c<3;c++)out[r][c]=in1[r][0]*in2[0][c]+in1[r][1]*in2[1][c]+in1[r][2]*in2[2][c];}
static void trap_R_LerpTag(orientation_t *o,qhandle_t model,int oldframe,int frame,float frac,char *name){(void)model;(void)oldframe;(void)frame;(void)name;for(int i=0;i<3;i++){o->origin[i]=(float)(i+1)+2.0f*frac;for(int j=0;j<3;j++)o->axis[i][j]=i==j?1.0f:0.0f;}}
static void BG_EvaluateTrajectory(const trajectory_t *tr,int at,vec3_t out){float delta=(at-tr->trTime)*0.001f;for(int i=0;i<3;i++)out[i]=tr->trBase[i]+(tr->trType==2?delta*tr->trDelta[i]:0.0f);}
static float LerpAngle(float from,float to,float frac){if(to-from>180.0f)to-=360.0f;if(to-from<-180.0f)to+=360.0f;return from+frac*(to-from);}
static void CG_Error(const char *message){fprintf(stderr,"%s\n",message);exit(2);}
static cg_t cg;static centity_t cg_entities[1024];
#include "cgame_ents_under_test.inc"
static uint32_t bits(float value){uint32_t result;memcpy(&result,&value,4);return result;}
static void vec(const char *name,const vec3_t v){printf("%s|%08x,%08x,%08x\n",name,bits(v[0]),bits(v[1]),bits(v[2]));}
static void ident(vec3_t axis[3]){memset(axis,0,sizeof(vec3_t)*3);for(int i=0;i<3;i++)axis[i][i]=1.0f;}
int main(void){
 refEntity_t parent={0},child={0};parent.origin[0]=10;parent.origin[1]=20;parent.origin[2]=30;ident(parent.axis);parent.oldframe=0;parent.frame=1;parent.backlerp=.5f;ident(child.axis);
 CG_PositionEntityOnTag(&child,&parent,1,"tag_test");vec("tag-origin",child.origin);vec("tag-axis0",child.axis[0]);printf("tag-back|%08x\n",bits(child.backlerp));
 memset(&child,0,sizeof(child));ident(child.axis);child.axis[0][0]=0;child.axis[0][1]=-1;child.axis[1][0]=1;child.axis[1][1]=0;CG_PositionRotatedEntityOnTag(&child,&parent,1,"tag_test");vec("rot-origin",child.origin);vec("rot-axis0",child.axis[0]);
 vec3_t input={1,2,3},output;CG_AdjustPositionForMover(input,0,1000,1250,output);vec("adjust-none",output);
 centity_t *m=&cg_entities[20];m->currentState.number=20;m->currentState.eType=ET_MOVER;m->currentState.pos.trType=2;m->currentState.pos.trTime=1000;m->currentState.pos.trBase[0]=10;m->currentState.pos.trBase[1]=20;m->currentState.pos.trBase[2]=30;m->currentState.pos.trDelta[0]=10;m->currentState.pos.trDelta[1]=-20;m->currentState.pos.trDelta[2]=30;CG_AdjustPositionForMover(input,20,1000,1250,output);vec("adjust-mover",output);
 snapshot_t a={1000},b={1100};cg.snap=&a;cg.nextSnap=&b;cg.frameInterpolation=.5f;centity_t e={0};e.currentState.pos.trBase[0]=0;e.currentState.pos.trBase[1]=10;e.currentState.pos.trBase[2]=20;e.nextState.pos.trBase[0]=10;e.nextState.pos.trBase[1]=30;e.nextState.pos.trBase[2]=50;e.currentState.apos.trBase[0]=350;e.currentState.apos.trBase[1]=10;e.currentState.apos.trBase[2]=20;e.nextState.apos.trBase[0]=10;e.nextState.apos.trBase[1]=30;e.nextState.apos.trBase[2]=40;CG_InterpolateEntityPosition(&e);vec("lerp-origin",e.lerpOrigin);vec("lerp-angles",e.lerpAngles);
 return 0;
}
