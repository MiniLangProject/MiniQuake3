/* Host for unchanged S_SpatializeOrigin and S_AddLoopSounds from snd_dma.c. */
#define _CRT_SECURE_NO_WARNINGS
#include <math.h>
#include <stdarg.h>
#include <stdio.h>
#include <string.h>

#define MAX_GENTITIES 1024
#define MAX_CHANNELS 96
#define SOUND_FULLVOLUME 80
#define SOUND_ATTENUATE 0.0008f
typedef int qboolean;typedef float vec_t;typedef float vec3_t[3];
typedef struct sfx_s { int handle,lastTimeUsed,soundLength; } sfx_t;
typedef struct { vec3_t origin,velocity;int active,kill,doppler;float dopplerScale,oldDopplerScale;int framenum,mergeFrame;sfx_t *sfx; } loopSound_t;
typedef struct { int allocTime,startSample,entnum,entchannel,leftvol,rightvol,master_vol;float dopplerScale,oldDopplerScale;vec3_t origin;int fixed_origin;sfx_t *thesfx;int doppler; } channel_t;
typedef struct { int channels; } dma_t;
static dma_t dma={2};static vec3_t listener_origin;static vec3_t listener_axis[3];
static loopSound_t loopSounds[MAX_GENTITIES];static channel_t loop_channels[MAX_CHANNELS];static int numLoopChannels,clock_ms;
static int Com_Milliseconds(void){return clock_ms;}
#define VectorSubtract(a,b,c) do{(c)[0]=(a)[0]-(b)[0];(c)[1]=(a)[1]-(b)[1];(c)[2]=(a)[2]-(b)[2];}while(0)
#define DotProduct(a,b) ((a)[0]*(b)[0]+(a)[1]*(b)[1]+(a)[2]*(b)[2])
#define VectorRotate(in,matrix,out) do{(out)[0]=DotProduct((in),(matrix)[0]);(out)[1]=DotProduct((in),(matrix)[1]);(out)[2]=DotProduct((in),(matrix)[2]);}while(0)
static vec_t VectorNormalize(vec3_t v){float length=v[0]*v[0]+v[1]*v[1]+v[2]*v[2],inverse;length=(float)sqrt(length);if(length){inverse=1.0f/length;v[0]*=inverse;v[1]*=inverse;v[2]*=inverse;}return length;}

#include "audio_snd_loop_channels_under_test.inc"

static sfx_t sounds[128];
static void reset(void){int i;memset(loopSounds,0,sizeof(loopSounds));memset(loop_channels,0,sizeof(loop_channels));listener_origin[0]=listener_origin[1]=listener_origin[2]=0;listener_axis[0][0]=1;listener_axis[0][1]=0;listener_axis[0][2]=0;listener_axis[1][0]=0;listener_axis[1][1]=1;listener_axis[1][2]=0;listener_axis[2][0]=0;listener_axis[2][1]=0;listener_axis[2][2]=1;clock_ms=500;for(i=0;i<128;i++){sounds[i].handle=i;sounds[i].soundLength=1000;}}
static void add(int entity,int handle,float x,float y,float z,int real,int doppler){loopSound_t *v=&loopSounds[entity];v->active=1;v->kill=!real;v->doppler=doppler;v->dopplerScale=1.25f;v->oldDopplerScale=1.0f;v->origin[0]=x;v->origin[1]=y;v->origin[2]=z;v->sfx=&sounds[handle];}
static void show(const char *label){int i;printf("%s|%d",label,numLoopChannels);for(i=0;i<numLoopChannels;i++)printf("|%d|%d|%d",loop_channels[i].thesfx->handle,loop_channels[i].leftvol,loop_channels[i].rightvol);putchar('\n');}
int main(void){int i;
  reset();add(1,1,0,100,0,0,0);add(2,1,0,-100,0,0,0);S_AddLoopSounds();show("merge");
  reset();add(1,2,0,0,0,1,0);add(2,2,0,0,0,1,0);S_AddLoopSounds();show("real");
  reset();add(1,3,0,100,0,0,0);add(2,3,0,-100,0,0,1);add(3,3,0,0,0,0,0);S_AddLoopSounds();show("doppler");
  reset();for(i=0;i<4;i++)add(i,4,0,80,0,0,0);S_AddLoopSounds();show("cap");
  reset();add(1,5,2000,0,0,0,0);S_AddLoopSounds();show("inaudible");
  reset();for(i=0;i<100;i++)add(i,10+i,0,0,0,0,0);S_AddLoopSounds();show("channel-limit");
  return 0;}
