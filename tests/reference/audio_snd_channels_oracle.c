/* Host for unchanged channel allocator and S_StartSound from snd_dma.c. */
#define _CRT_SECURE_NO_WARNINGS
#include <stdarg.h>
#include <stdio.h>
#include <string.h>

#define MAX_CHANNELS 96
#define MAX_GENTITIES 1024
#define MAX_SFX 256
#define CHAN_ANNOUNCER 7
#define START_SAMPLE_IMMEDIATE -1
#define S_COLOR_YELLOW ""
#define ERR_DROP 1
#define qfalse 0
#define qtrue 1
typedef int qboolean;
typedef float vec3_t[3];
typedef int sfxHandle_t;
typedef struct sfx_s { int inMemory; int lastTimeUsed; char soundName[64]; } sfx_t;
typedef struct channel_s { int allocTime,startSample,entnum,entchannel,leftvol,rightvol,master_vol;float dopplerScale,oldDopplerScale;vec3_t origin;int fixed_origin;sfx_t *thesfx;int doppler; } channel_t;
typedef struct { int integer; } cvar_t;
static channel_t s_channels[MAX_CHANNELS];static channel_t *freelist;
static sfx_t s_knownSfx[MAX_SFX];static int s_numSfx=MAX_SFX;
static int s_soundStarted=1,s_soundMuted=0,listener_number=0,clock_ms=0,s_paintedtime=0;
static cvar_t show_value={0};static cvar_t *s_show=&show_value;
static int Com_Milliseconds(void){return clock_ms;}
static void Com_DPrintf(const char *format,...){(void)format;}
static void Com_Printf(const char *format,...){(void)format;}
static void Com_Error(int level,const char *format,...){(void)level;(void)format;}
static void S_memoryLoad(sfx_t *sfx){sfx->inMemory=1;}
#define Com_Memset memset
#define VectorCopy(a,b) do {(b)[0]=(a)[0];(b)[1]=(a)[1];(b)[2]=(a)[2];} while(0)

#include "audio_snd_channels_under_test.inc"

static int active(void){int i,n=0;for(i=0;i<MAX_CHANNELS;i++)if(s_channels[i].thesfx)n++;return n;}
static int slot_for(int handle){int i;for(i=0;i<MAX_CHANNELS;i++)if(s_channels[i].thesfx==&s_knownSfx[handle])return i;return -1;}
static void start(int time,int entity,int channel,int handle){clock_ms=time;S_StartSound(NULL,entity,channel,handle);}
static void show(const char *label,int handle){printf("%s|%d|%d\n",label,active(),slot_for(handle));}

int main(void){
  int i;for(i=0;i<MAX_SFX;i++){s_knownSfx[i].inMemory=1;s_knownSfx[i].soundName[0]='x';}
  S_ChannelSetup();start(100,1,0,1);show("first",1);start(120,1,0,1);show("duplicate",1);start(160,1,0,1);show("after50",1);
  S_ChannelSetup();for(i=0;i<6;i++)start(100+i*60,2,0,2);show("remote-limit",2);
  S_ChannelSetup();listener_number=3;for(i=0;i<10;i++)start(100+i*60,3,1,3);show("listener-limit",3);listener_number=0;
  S_ChannelSetup();for(i=0;i<MAX_CHANNELS;i++)start(100+i,i%12,(i==0)?CHAN_ANNOUNCER:0,10+i);show("full",105);
  start(500,5,0,200);show("same-entity-replace",200);
  start(501,77,0,201);show("global-replace",201);
  S_ChannelSetup();for(i=0;i<MAX_CHANNELS;i++)start(100,0,CHAN_ANNOUNCER,10+i);start(200,8,0,220);show("protected-full",220);
  S_ChannelSetup();start(10,9,2,9);i=slot_for(9);S_ChannelFree(&s_channels[i]);start(20,10,2,10);show("freed-reused",10);
  return 0;
}
