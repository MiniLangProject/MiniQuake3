/* Host for unchanged Baseq3 S_RawSamples conversion and resampling. */
#include <stdarg.h>
#include <stdio.h>
#include <string.h>
#define MAX_RAW_SAMPLES 16384
typedef unsigned char byte;
typedef struct { int left,right; } portable_samplepair_t;
typedef struct { int speed; } dma_t;
static dma_t dma;
static int s_soundStarted,s_soundMuted,s_soundtime,s_rawend;
static portable_samplepair_t s_rawsamples[MAX_RAW_SAMPLES];
static void Com_DPrintf(const char *format,...) {(void)format;}
#include "audio_snd_raw_stream_under_test.inc"
static void reset(int speed,int soundtime,int rawend) { memset(s_rawsamples,0,sizeof(s_rawsamples));dma.speed=speed;s_soundStarted=1;s_soundMuted=0;s_soundtime=soundtime;s_rawend=rawend; }
static void show(const char *name,int first) { int i;printf("%s|%d",name,s_rawend);for(i=first;i<s_rawend;i++){int at=i&(MAX_RAW_SAMPLES-1);printf("|%d,%d",s_rawsamples[at].left,s_rawsamples[at].right);}putchar('\n'); }
int main(void) {
  short stereo16[]={1000,-2000,3000,-4000,5000,-6000};
  short mono16[]={1000,-2000};
  byte stereo8[]={255,128,127,0};
  byte mono8[]={0,64,128,255};
  reset(22050,0,0);S_RawSamples(3,22050,2,2,(const byte*)stereo16,1.0f);show("stereo16",0);
  reset(22050,0,0);S_RawSamples(2,11025,2,1,(const byte*)mono16,0.5f);show("mono16-half-rate",0);
  reset(22050,0,0);S_RawSamples(2,22050,1,2,stereo8,0.25f);show("stereo8",0);
  reset(22050,0,0);S_RawSamples(4,44100,1,1,mono8,1.0f);show("mono8-double-rate",0);
  reset(22050,5,2);S_RawSamples(1,22050,2,1,(const byte*)mono16,1.0f);show("reset-minimum",5);
  return 0;
}
