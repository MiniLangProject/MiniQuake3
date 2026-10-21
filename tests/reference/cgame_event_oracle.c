#include <stdarg.h>
#include <stdio.h>
#include <string.h>
typedef float vec3_t[3];
typedef struct { int trType,trTime,trDuration; vec3_t trBase,trDelta; } trajectory_t;
typedef struct { int number,eType,eFlags; trajectory_t pos; int event,otherEntityNum; } entityState_t;
typedef struct { entityState_t currentState; int previousEvent; vec3_t lerpOrigin; } centity_t;
typedef struct { int serverTime; } snapshot_t;
typedef struct { snapshot_t *snap; } cg_t;
static cg_t cg;
#define RANK_TIED_FLAG 0x4000
#define S_COLOR_BLUE "^4"
#define S_COLOR_RED "^1"
#define S_COLOR_YELLOW "^3"
#define S_COLOR_WHITE "^7"
#define EV_EVENT_BITS 0x300
#define ET_EVENTS 13
#define EF_PLAYER_EVENT 0x10
static int entityCalls,soundPositions;
static int Com_sprintf(char *out,size_t cap,const char *fmt,...){int n;va_list a;va_start(a,fmt);n=vsnprintf(out,cap,fmt,a);va_end(a);return n;}
static const char *va(const char *fmt,...){static char slots[4][64];static int at;char *out=slots[at++&3];va_list a;va_start(a,fmt);vsnprintf(out,64,fmt,a);va_end(a);return out;}
static void BG_EvaluateTrajectory(const trajectory_t *tr,int at,vec3_t out){(void)at;memcpy(out,tr->trBase,sizeof(vec3_t));}
static void CG_SetEntitySoundPosition(centity_t *cent){(void)cent;soundPositions++;}
static void CG_EntityEvent(centity_t *cent,vec3_t position){(void)cent;(void)position;entityCalls++;}
#include "cgame_event_under_test.inc"
static void place(int rank){printf("place|%d|%s\n",rank,CG_PlaceString(rank));}
static void row(const char *name,centity_t *cent){printf("check|%s|%d|%d|%d|%.0f.,%.0f.,%.0f.|%d|%d\n",name,cent->currentState.number,cent->currentState.event,cent->previousEvent,cent->lerpOrigin[0],cent->lerpOrigin[1],cent->lerpOrigin[2],entityCalls,soundPositions);}
int main(void){snapshot_t snap={1234};centity_t cent;cg.snap=&snap;place(1);place(2);place(3);place(11);place(12);place(13);place(21);place(22);place(23);place(0x4000|2);memset(&cent,0,sizeof(cent));cent.currentState.number=5;cent.currentState.pos.trBase[0]=1;cent.currentState.pos.trBase[1]=2;cent.currentState.pos.trBase[2]=3;CG_CheckEvents(&cent);row("zero",&cent);cent.currentState.event=14;CG_CheckEvents(&cent);row("riding",&cent);CG_CheckEvents(&cent);row("repeat",&cent);cent.currentState.event=0x100|14;CG_CheckEvents(&cent);row("sequence",&cent);memset(&cent,0,sizeof(cent));cent.currentState.number=9;cent.currentState.otherEntityNum=3;cent.currentState.eType=ET_EVENTS+42;cent.currentState.eFlags=EF_PLAYER_EVENT;cent.currentState.pos.trBase[0]=9;CG_CheckEvents(&cent);row("event-only",&cent);CG_CheckEvents(&cent);row("event-repeat",&cent);return 0;}
