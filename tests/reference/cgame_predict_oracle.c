#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
typedef int qboolean;
typedef float vec3_t[3];
#define qtrue 1
#define qfalse 0
#define MAX_ENTITIES_IN_SNAPSHOT 256
#define MAX_GENTITIES 1024
#define ET_ITEM 2
#define ET_PUSH_TRIGGER 8
#define ET_TELEPORT_TRIGGER 9
typedef struct {int serverTime;int angles[3];} usercmd_t;
typedef struct {int commandTime,pm_type,bobCycle,pm_flags;vec3_t origin,velocity;int delta_angles[3];vec3_t viewangles;int stats[16];} playerState_t;
typedef struct {int number,eType,solid;} entityState_t;
typedef struct {int serverTime;playerState_t ps;int numEntities;entityState_t entities[MAX_ENTITIES_IN_SNAPSHOT];} snapshot_t;
typedef struct {entityState_t currentState,nextState;vec3_t lerpOrigin,lerpAngles;} centity_t;
typedef struct {int time;int nextFrameTeleport,thisFrameTeleport;playerState_t predictedPlayerState;snapshot_t *snap,*nextSnap;} cg_t;
static cg_t cg;static centity_t cg_entities[MAX_GENTITIES];static usercmd_t currentCmd;
static int cg_numSolidEntities,cg_numTriggerEntities;
static centity_t *cg_solidEntities[MAX_ENTITIES_IN_SNAPSHOT],*cg_triggerEntities[MAX_ENTITIES_IN_SNAPSHOT];
#define VectorCopy(a,b) memcpy((b),(a),sizeof(vec3_t))
static int trap_GetCurrentCmdNumber(void){return 7;}
static void trap_GetUserCmd(int number,usercmd_t *cmd){(void)number;*cmd=currentCmd;}
static void PM_UpdateViewAngles(playerState_t *ps,usercmd_t *cmd){for(int i=0;i<3;i++){int16_t value=(int16_t)(cmd->angles[i]+ps->delta_angles[i]);ps->viewangles[i]=(float)value*(360.0f/65536.0f);}}
static float LerpAngle(float from,float to,float frac){if(to-from>180)to-=360;if(to-from< -180)to+=360;return from+frac*(to-from);}
#include "cgame_predict_under_test.inc"
static uint32_t bits(float value){uint32_t out;memcpy(&out,&value,4);return out;}
static void emit(const char *name){playerState_t *p=&cg.predictedPlayerState;printf("%s|%d|%08x,%08x,%08x|%08x,%08x,%08x|%08x,%08x,%08x\n",name,p->bobCycle,bits(p->origin[0]),bits(p->origin[1]),bits(p->origin[2]),bits(p->velocity[0]),bits(p->velocity[1]),bits(p->velocity[2]),bits(p->viewangles[0]),bits(p->viewangles[1]),bits(p->viewangles[2]));}
int main(void){
 snapshot_t a={0},b={0};a.serverTime=1000;b.serverTime=1100;a.ps.bobCycle=250;b.ps.bobCycle=6;a.ps.stats[0]=100;b.ps.stats[0]=100;
 for(int i=0;i<3;i++){a.ps.origin[i]=(float)(i*10);b.ps.origin[i]=(float)(10+i*20);a.ps.velocity[i]=(float)(4+i*2);b.ps.velocity[i]=(float)(8+i*2);}
 a.ps.viewangles[0]=350;a.ps.viewangles[1]=10;a.ps.viewangles[2]=20;b.ps.viewangles[0]=10;b.ps.viewangles[1]=30;b.ps.viewangles[2]=40;
 cg.snap=&a;cg.nextSnap=&b;cg.time=1050;CG_InterpolatePlayerState(qfalse);emit("half");
 cg.nextFrameTeleport=1;CG_InterpolatePlayerState(qfalse);emit("teleport");cg.nextFrameTeleport=0;
 cg.nextSnap=NULL;CG_InterpolatePlayerState(qfalse);emit("missing");cg.nextSnap=&b;
 currentCmd.angles[0]=11;currentCmd.angles[1]=22;currentCmd.angles[2]=33;CG_InterpolatePlayerState(qtrue);emit("angles");
 a.numEntities=4;a.entities[0]=(entityState_t){1,ET_ITEM,0};a.entities[1]=(entityState_t){2,ET_PUSH_TRIGGER,0};a.entities[2]=(entityState_t){3,ET_TELEPORT_TRIGGER,0};a.entities[3]=(entityState_t){4,0,7};
 for(int i=0;i<4;i++){cg_entities[a.entities[i].number].currentState=a.entities[i];cg_entities[a.entities[i].number].nextState=a.entities[i];}
 cg.nextSnap=NULL;CG_BuildSolidList();printf("solid-current|%d|%d|%d|%d|%d\n",cg_numSolidEntities,cg_numTriggerEntities,cg_triggerEntities[0]->currentState.number,cg_triggerEntities[1]->currentState.number,cg_triggerEntities[2]->currentState.number);
 b.numEntities=2;b.entities[0]=(entityState_t){5,ET_ITEM,0};b.entities[1]=(entityState_t){6,0,9};for(int i=0;i<2;i++){cg_entities[b.entities[i].number].currentState=b.entities[i];cg_entities[b.entities[i].number].nextState=b.entities[i];}
 cg.nextSnap=&b;CG_BuildSolidList();printf("solid-next|%d|%d|%d|%d\n",cg_numSolidEntities,cg_numTriggerEntities,cg_solidEntities[0]->currentState.number,cg_triggerEntities[0]->currentState.number);
 return 0;
}
