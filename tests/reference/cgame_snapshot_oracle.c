#include <stdio.h>
#include <string.h>
typedef int qboolean;
#define qtrue 1
#define qfalse 0
#define EVENT_VALID_MSEC 300
#define ET_PLAYER 1
typedef float vec3_t[3];
typedef struct {int number,eType,eFlags;vec3_t origin,angles;} entityState_t;
typedef struct {int serverTime;} snapshot_t;
typedef struct {entityState_t currentState,nextState;int currentValid,interpolate,previousEvent,trailTime,snapShotTime;vec3_t lerpOrigin,lerpAngles;int playerResets,events;} centity_t;
typedef struct {int time;snapshot_t *snap;} cg_t;static cg_t cg;
#define VectorCopy(a,b) memcpy((b),(a),sizeof(vec3_t))
static void CG_ResetPlayerEntity(centity_t *c){c->playerResets++;}
static void CG_CheckEvents(centity_t *c){c->events++;}
#include "cgame_snapshot_under_test.inc"
static void row(const char *n,centity_t *c){printf("%s|%d|%d|%d|%d|%d|%.0f,%.0f,%.0f|%d|%d\n",n,c->currentState.number,c->currentValid,c->interpolate,c->previousEvent,c->trailTime,c->lerpOrigin[0],c->lerpOrigin[1],c->lerpOrigin[2],c->playerResets,c->events);}
int main(void){snapshot_t s={1000};cg.snap=&s;cg.time=1000;centity_t c={0};c.currentState.number=3;c.currentState.eType=ET_PLAYER;c.currentState.origin[0]=1;c.currentState.origin[1]=2;c.currentState.origin[2]=3;c.previousEvent=9;c.snapShotTime=600;CG_ResetEntity(&c);row("reset-old",&c);c.previousEvent=7;c.snapShotTime=900;CG_ResetEntity(&c);row("reset-live",&c);c.nextState.number=8;c.nextState.eType=0;c.nextState.origin[0]=4;c.interpolate=0;CG_TransitionEntity(&c);row("transition-reset",&c);c.nextState.number=9;c.interpolate=1;CG_TransitionEntity(&c);row("transition-interp",&c);return 0;}
