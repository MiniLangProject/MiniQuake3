#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <stdint.h>

typedef int qboolean;
#define qfalse 0
#define qtrue 1
#define MAX_TOTALANIMATIONS 36
#define ANIM_TOGGLEBIT 128
typedef struct { int firstFrame,numFrames,loopFrames,frameLerp,initialLerp; qboolean reversed,flipflop; } animation_t;
typedef struct { int oldFrame,oldFrameTime,frame,frameTime; float backlerp; int animationNumber; animation_t *animation; int animationTime; } lerpFrame_t;
typedef struct { animation_t animations[MAX_TOTALANIMATIONS]; } clientInfo_t;
typedef struct { int integer; } cvar_t;
static struct { int time,frametime; } cg;
static cvar_t cg_debugAnim={0},cg_animSpeed={1};
static void CG_Error(const char *fmt,...) { (void)fmt; exit(90); }
static void CG_Printf(const char *fmt,...) { (void)fmt; }
#include "cgame_player_lerp_under_test.inc"
static uint32_t bits(float value) { uint32_t result; memcpy(&result,&value,4); return result; }
static void emit(const char *name,lerpFrame_t *lf) { printf("%s|%d,%d,%d,%d,%08x,%d,%d\n",name,lf->oldFrame,lf->frame,lf->oldFrameTime,lf->frameTime,bits(lf->backlerp),lf->animationNumber,lf->animationTime); }
static void run(clientInfo_t *ci,lerpFrame_t *lf,const char *name,int anim,float scale,int now) { cg.time=now;CG_RunLerpFrame(ci,lf,anim,scale);emit(name,lf); }
int main(void) {
  clientInfo_t ci;lerpFrame_t lf;memset(&ci,0,sizeof(ci));memset(&lf,0,sizeof(lf));
  ci.animations[1]=(animation_t){100,5,2,50,75,qfalse,qfalse};
  ci.animations[2]=(animation_t){200,4,0,40,40,qtrue,qfalse};
  ci.animations[3]=(animation_t){300,3,0,60,60,qfalse,qtrue};
  run(&ci,&lf,"n0",1,1.0f,0);run(&ci,&lf,"n25",1,1.0f,25);run(&ci,&lf,"n75",1,1.0f,75);run(&ci,&lf,"n100",1,1.0f,100);run(&ci,&lf,"n160",1,1.0f,160);run(&ci,&lf,"n500",1,1.0f,500);
  run(&ci,&lf,"toggle",129,1.0f,520);run(&ci,&lf,"toggle2",129,1.0f,595);
  memset(&lf,0,sizeof(lf));run(&ci,&lf,"reverse",2,1.0f,120);run(&ci,&lf,"reverseEnd",2,1.0f,500);
  memset(&lf,0,sizeof(lf));run(&ci,&lf,"flip",3,1.0f,60);run(&ci,&lf,"flip2",3,1.0f,120);run(&ci,&lf,"flipEnd",3,1.0f,600);
  memset(&lf,0,sizeof(lf));run(&ci,&lf,"haste",1,1.5f,200);run(&ci,&lf,"haste2",1,1.5f,250);
  cg_animSpeed.integer=0;run(&ci,&lf,"disabled",1,1.0f,300);
  return 0;
}
