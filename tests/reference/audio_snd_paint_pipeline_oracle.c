/* Host for unchanged S_PaintChannelFrom16 and S_PaintChannels. */
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <string.h>

#define SND_CHUNK_SIZE 1024
#define PAINTBUFFER_SIZE 4096
#define MAX_CHANNELS 96
#define MAX_RAW_SAMPLES 16384
typedef struct { int left,right; } portable_samplepair_t;
typedef struct sndBuffer_s { short sndChunk[SND_CHUNK_SIZE];struct sndBuffer_s *next;int size; } sndBuffer;
typedef struct sfx_s { sndBuffer *soundData;int soundLength,soundCompressionMethod; } sfx_t;
typedef struct { int allocTime,startSample,entnum,entchannel,leftvol,rightvol,master_vol;float dopplerScale,oldDopplerScale;float origin[3];int fixed_origin;sfx_t *thesfx;int doppler; } channel_t;
typedef struct { float value; } cvar_t;
static portable_samplepair_t paintbuffer[PAINTBUFFER_SIZE],s_rawsamples[MAX_RAW_SAMPLES],captured[PAINTBUFFER_SIZE];
static channel_t s_channels[MAX_CHANNELS],loop_channels[MAX_CHANNELS];static int numLoopChannels,s_paintedtime,s_rawend,snd_vol;
static cvar_t volumeValue={0.8f};static cvar_t *s_volume=&volumeValue;
#define Com_Memset memset
static void S_PaintChannelFromADPCM(channel_t*a,const sfx_t*b,int c,int d,int e){(void)a;(void)b;(void)c;(void)d;(void)e;}
static void S_PaintChannelFromWavelet(channel_t*a,const sfx_t*b,int c,int d,int e){(void)a;(void)b;(void)c;(void)d;(void)e;}
static void S_PaintChannelFromMuLaw(channel_t*a,const sfx_t*b,int c,int d,int e){(void)a;(void)b;(void)c;(void)d;(void)e;}
static void S_TransferPaintBuffer(int end){int i,count=end-s_paintedtime;for(i=0;i<count;i++)captured[i]=paintbuffer[i];}

#include "audio_snd_paint_pipeline_under_test.inc"

static sndBuffer oneChunk,loopChunk,otherChunk;static sfx_t oneSound,loopSound,otherSound;
static void setup(int painted){int i;memset(s_channels,0,sizeof(s_channels));memset(loop_channels,0,sizeof(loop_channels));memset(captured,0,sizeof(captured));memset(s_rawsamples,0,sizeof(s_rawsamples));s_paintedtime=painted;s_rawend=0;
  for(i=0;i<SND_CHUNK_SIZE;i++){oneChunk.sndChunk[i]=0;loopChunk.sndChunk[i]=0;otherChunk.sndChunk[i]=0;}oneChunk.next=&oneChunk;loopChunk.next=&loopChunk;otherChunk.next=&otherChunk;
  oneChunk.sndChunk[0]=1000;oneChunk.sndChunk[1]=-2000;oneChunk.sndChunk[2]=3000;oneChunk.sndChunk[3]=-4000;oneChunk.sndChunk[4]=5000;oneChunk.sndChunk[5]=-6000;
  loopChunk.sndChunk[0]=100;loopChunk.sndChunk[1]=200;loopChunk.sndChunk[2]=300;loopChunk.sndChunk[3]=400;
  otherChunk.sndChunk[0]=-500;otherChunk.sndChunk[1]=750;otherChunk.sndChunk[2]=-1000;
  oneSound.soundData=&oneChunk;oneSound.soundLength=6;oneSound.soundCompressionMethod=0;loopSound.soundData=&loopChunk;loopSound.soundLength=4;loopSound.soundCompressionMethod=0;otherSound.soundData=&otherChunk;otherSound.soundLength=3;otherSound.soundCompressionMethod=0;}
static void show(const char *label,int count){int i;printf("%s",label);for(i=0;i<count;i++)printf("|%d|%d",captured[i].left,captured[i].right);putchar('\n');}
int main(void){
  setup(0);s_channels[0].thesfx=&oneSound;s_channels[0].startSample=0;s_channels[0].leftvol=127;s_channels[0].rightvol=63;loop_channels[0].thesfx=&loopSound;loop_channels[0].leftvol=40;loop_channels[0].rightvol=80;numLoopChannels=1;S_PaintChannels(8);show("one-loop",8);
  setup(3);s_channels[0].thesfx=&oneSound;s_channels[0].startSample=1;s_channels[0].leftvol=100;s_channels[0].rightvol=120;loop_channels[0].thesfx=&loopSound;loop_channels[0].leftvol=70;loop_channels[0].rightvol=30;numLoopChannels=1;S_PaintChannels(7);show("offset",4);
  setup(0);s_channels[0].thesfx=&oneSound;s_channels[0].startSample=0;s_channels[0].leftvol=255;s_channels[0].rightvol=255;s_channels[1].thesfx=&otherSound;s_channels[1].startSample=0;s_channels[1].leftvol=200;s_channels[1].rightvol=50;S_PaintChannels(6);show("two-shots",6);
  return 0;}
