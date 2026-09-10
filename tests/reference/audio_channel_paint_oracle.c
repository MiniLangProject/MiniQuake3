/* Host for unchanged S_PaintChannelFrom16 from client/snd_mix.c. */
#define _CRT_SECURE_NO_WARNINGS
#define idppc_altivec 0
#include <stdio.h>
#include <string.h>

#define SND_CHUNK_SIZE 1024
#define PAINTBUFFER_SIZE 4096
typedef struct { int left; int right; } portable_samplepair_t;
typedef struct sndBuffer_s { short sndChunk[SND_CHUNK_SIZE]; struct sndBuffer_s *next; int size; } sndBuffer;
typedef struct sfx_s { sndBuffer *soundData; } sfx_t;
typedef struct { int leftvol,rightvol; float dopplerScale,oldDopplerScale; int doppler; } channel_t;
static portable_samplepair_t paintbuffer[PAINTBUFFER_SIZE];
static int snd_vol;

#include "audio_channel_paint_under_test.inc"

static sndBuffer chunks[2];
static sfx_t sound;
static channel_t channel;

static void fixture(void) {
  int i;
  memset(paintbuffer,0,sizeof(paintbuffer));
  for(i=0;i<PAINTBUFFER_SIZE;i++){paintbuffer[i].left=100+i*3;paintbuffer[i].right=-200-i*5;}
  for(i=0;i<SND_CHUNK_SIZE;i++){
    chunks[0].sndChunk[i]=(short)((i*97+13)%65536-32768);
    chunks[1].sndChunk[i]=(short)((i*193+71)%65536-32768);
  }
  chunks[0].next=&chunks[1];chunks[1].next=&chunks[0];sound.soundData=&chunks[0];
}
static void show(const char *label,int offset,int count){
  int i;printf("%s",label);for(i=offset;i<offset+count;i++)printf("|%d|%d",paintbuffer[i].left,paintbuffer[i].right);putchar('\n');
}
static void run(const char *label,int count,int sampleOffset,int bufferOffset,int left,int right,int volume,int doppler,float scale,float oldScale){
  fixture();channel.leftvol=left;channel.rightvol=right;channel.doppler=doppler;channel.dopplerScale=scale;channel.oldDopplerScale=oldScale;snd_vol=volume;
  S_PaintChannelFrom16(&channel,&sound,count,sampleOffset,bufferOffset);show(label,bufferOffset,count);
}
int main(void){
  run("linear",6,0,2,255,128,255,0,1.0f,1.0f);
  run("chunk-cross",7,1021,0,200,75,128,0,1.0f,1.0f);
  run("initial-wrap",5,2050,1,64,192,255,0,1.0f,1.0f);
  run("silent-left",4,77,3,0,255,200,0,1.0f,1.0f);
  run("doppler-one",5,1019,0,180,90,220,1,1.0f,1.25f);
  run("doppler-fast",8,1018,2,210,111,240,1,1.5f,1.0f);
  run("doppler-old",6,20,0,155,233,199,1,0.75f,1.5f);
  return 0;
}
