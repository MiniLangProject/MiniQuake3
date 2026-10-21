#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#include <string.h>

typedef int qboolean;
typedef int sfxHandle_t;
typedef float vec3_t[3];
#define qfalse 0
#define qtrue 1
#define PM_INTERMISSION 5
#define DF_FIXED_FOV 16
#define CONTENTS_WATER 32
#define CONTENTS_SLIME 16
#define CONTENTS_LAVA 8
#define MAX_SOUNDBUFFER 20
#define CHAN_ANNOUNCER 4
#define ZOOM_TIME 150
#define WAVE_AMPLITUDE 1
#define WAVE_FREQUENCY 0.4f
#define M_PI 3.14159265358979323846f
#define VectorCopy(a,b) ((b)[0]=(a)[0],(b)[1]=(a)[1],(b)[2]=(a)[2])

typedef struct { int pm_type; } playerState_t;
typedef struct { playerState_t ps; } snapshot_t;
typedef struct { int frame,oldframe,skinNum; } refEntity_t;
typedef struct { int x,y,width,height; float fov_x,fov_y; vec3_t vieworg; } refdef_t;
typedef struct {
  int time,zoomTime,zoomed,soundBufferIn,soundBufferOut,soundTime;
  float zoomSensitivity; playerState_t predictedPlayerState; snapshot_t *snap;
  refEntity_t testModelEntity; refdef_t refdef; sfxHandle_t soundBuffer[MAX_SOUNDBUFFER];
} cg_t;
typedef struct { int vidWidth,vidHeight; } glconfig_t;
typedef struct { glconfig_t glconfig; int dmflags; } cgs_t;
typedef struct { int integer; float value; } cvar_t;

static cg_t cg; static cgs_t cgs; static snapshot_t snap;
static cvar_t cg_viewsize,cg_fov,cg_zoomFov;
static int point_contents,played_sound,played_count;
static void CG_Printf(const char *fmt,...){(void)fmt;}
static void trap_Cvar_Set(const char *name,const char *value){(void)name;cg_viewsize.integer=atoi(value);}
static int CG_PointContents(const vec3_t p,int ent){(void)p;(void)ent;return point_contents;}
static void trap_S_StartLocalSound(int sound,int channel){(void)channel;played_sound=sound;played_count++;}

#include "cgame_view_under_test.inc"

static uint32_t bits(float f){union{float f;uint32_t u;}v;v.f=f;return v.u;}
int main(void){
  int a,b,c,d,e,f; cg.snap=&snap;
  CG_TestModelNextFrame_f();a=cg.testModelEntity.frame;CG_TestModelPrevFrame_f();b=cg.testModelEntity.frame;CG_TestModelPrevFrame_f();c=cg.testModelEntity.frame;
  CG_TestModelNextSkin_f();d=cg.testModelEntity.skinNum;CG_TestModelPrevSkin_f();e=cg.testModelEntity.skinNum;CG_TestModelPrevSkin_f();f=cg.testModelEntity.skinNum;
  printf("cycles|%d|%d|%d|%d|%d|%d\n",a,b,c,d,e,f);
  cgs.glconfig.vidWidth=801;cgs.glconfig.vidHeight=601;cg_viewsize.integer=10;CG_CalcVrect();
  printf("vrect-low|%d|%d|%d|%d|%d\n",cg_viewsize.integer,cg.refdef.x,cg.refdef.y,cg.refdef.width,cg.refdef.height);
  cg_viewsize.integer=120;CG_CalcVrect();printf("vrect-high|%d|%d|%d|%d|%d\n",cg_viewsize.integer,cg.refdef.x,cg.refdef.y,cg.refdef.width,cg.refdef.height);
  cg.time=1000;CG_ZoomDown_f();a=cg.zoomed;b=cg.zoomTime;CG_ZoomDown_f();cg.time=1100;CG_ZoomUp_f();printf("zoom|%d|%d|%d|%d\n",a,b,cg.zoomed,cg.zoomTime);
  cg.predictedPlayerState.pm_type=0;cg.refdef.width=640;cg.refdef.height=480;cg_fov.value=200;cg_zoomFov.value=.5f;cg.time=2000;cg.zoomTime=0;cg.zoomed=0;point_contents=0;a=CG_CalcFov();printf("fov-clamp|%d|%u|%u|%u\n",a,bits(cg.refdef.fov_x),bits(cg.refdef.fov_y),bits(cg.zoomSensitivity));
  cg_fov.value=90;cg_zoomFov.value=30;cg.zoomed=1;cg.zoomTime=2000;cg.time=2075;a=CG_CalcFov();printf("fov-zoom|%d|%u|%u|%u\n",a,bits(cg.refdef.fov_x),bits(cg.refdef.fov_y),bits(cg.zoomSensitivity));
  cg.zoomed=0;memset(cg.soundBuffer,0,sizeof(cg.soundBuffer));cg.soundBufferIn=0;cg.soundBufferOut=0;cg.soundTime=0;cg.time=1000;CG_AddBufferedSound(0);CG_AddBufferedSound(11);CG_AddBufferedSound(12);CG_PlayBufferedSounds();a=played_sound;b=cg.soundTime;cg.time=1200;CG_PlayBufferedSounds();c=played_count;cg.time=1800;CG_PlayBufferedSounds();printf("buffer|%d|%d|%d|%d|%d|%d\n",a,b,c,played_sound,cg.soundBufferIn,cg.soundBufferOut);
  return 0;
}
