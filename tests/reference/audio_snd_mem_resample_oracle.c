/* Host for unchanged ResampleSfxRaw from client/snd_mem.c. */
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <string.h>

typedef unsigned char byte;
typedef struct { int speed; } dma_t;
static dma_t dma;
#define LittleShort(value) (value)

#include "audio_snd_mem_resample_under_test.inc"

static void print_samples(const char *label, short *samples, int count) {
  int i;
  printf("%s|%d", label, count);
  for (i=0;i<count;i++) printf("|%d", samples[i]);
  putchar('\n');
}

static void run16(const char *label, int inputRate, int outputRate, const short *input, int count) {
  short output[256]; int result;
  memset(output,0,sizeof(output));dma.speed=outputRate;
  result=ResampleSfxRaw(output,inputRate,2,count,(byte *)input);
  print_samples(label,output,result);
}

static void run8(const char *label, int inputRate, int outputRate, const byte *input, int count) {
  short output[256]; int result;
  memset(output,0,sizeof(output));dma.speed=outputRate;
  result=ResampleSfxRaw(output,inputRate,1,count,(byte *)input);
  print_samples(label,output,result);
}

int main(void) {
  static const short ramp16[]={-32768,-20000,-1,0,1,12345,30000,32767};
  static const short odd16[]={17,-29,511,-1025,4097,-8193,16383};
  static const byte ramp8[]={0,1,64,127,128,129,192,254,255};
  run16("same16",22050,22050,ramp16,8);
  run16("up16",11025,22050,odd16,7);
  run16("down16",44100,22050,ramp16,8);
  run16("third16",32000,22050,ramp16,8);
  run16("fraction16",16000,22050,odd16,7);
  run8("same8",22050,22050,ramp8,9);
  run8("up8",8000,22050,ramp8,9);
  run8("down8",48000,22050,ramp8,9);
  return 0;
}
