/* Host for unchanged S_TransferPaintBuffer functions from client/snd_mix.c. */
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <string.h>
#include <math.h>

typedef struct { int left; int right; } portable_samplepair_t;
typedef struct { int samplebits; int channels; int samples; unsigned char *buffer; } dma_t;
typedef struct { int integer; float value; } cvar_t;
#define PAINTBUFFER_SIZE 4096
static portable_samplepair_t paintbuffer[PAINTBUFFER_SIZE];
static int s_paintedtime;
static dma_t dma;
static cvar_t testSoundValue;
static cvar_t *s_testsound=&testSoundValue;
int *snd_p;
int snd_linear_count;
short *snd_out;

#include "audio_mixer_transfer_under_test.inc"

static const int sourceSamples[]={-8388864,-8388608,-65536,-256,0,255,256,65536,8388352,8388608,16777216,-16777216};
static union { short words[16]; unsigned char bytes[32]; } storage;

static void fixture(int samplebits,int channels,int samples,int initial) {
  int i;memset(paintbuffer,0,sizeof(paintbuffer));
  for(i=0;i<6;i++) {paintbuffer[i].left=sourceSamples[i*2];paintbuffer[i].right=sourceSamples[i*2+1];}
  dma.samplebits=samplebits;dma.channels=channels;dma.samples=samples;dma.buffer=storage.bytes;
  if(samplebits==16)for(i=0;i<samples;i++)storage.words[i]=(short)initial;
  else for(i=0;i<samples;i++)storage.bytes[i]=(unsigned char)initial;
  testSoundValue.integer=0;
}
static void show(const char *label,int samplebits,int samples) {
  int i;printf("%s",label);
  if(samplebits==16)for(i=0;i<samples;i++)printf("|%d",(int)storage.words[i]);
  else for(i=0;i<samples;i++)printf("|%u",(unsigned)storage.bytes[i]);
  putchar('\n');
}
static void run(const char *label,int painted,int end,int bits,int channels,int samples,int initial) {
  fixture(bits,channels,samples,initial);s_paintedtime=painted;S_TransferPaintBuffer(end);show(label,bits,samples);
}
int main(void) {
  run("s16-stereo-linear",0,6,16,2,16,1234);
  run("s16-stereo-wrap",3,9,16,2,16,1234);
  run("s16-mono-wrap",6,12,16,1,8,1234);
  run("u8-stereo-linear",0,6,8,2,16,17);
  run("u8-stereo-wrap",3,9,8,2,16,17);
  run("u8-mono-wrap",6,12,8,1,8,17);
  run("empty",4,4,16,2,8,-7);
  return 0;
}
