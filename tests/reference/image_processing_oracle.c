/* Host for unchanged CPU image processing functions from renderer/tr_image.c. */
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef unsigned char byte;
typedef int qboolean;
typedef struct { int integer; } cvar_t;
static cvar_t simpleMipMapsValue;
static cvar_t *r_simpleMipMaps=&simpleMipMapsValue;
static struct { int deviceSupportsGamma; } glConfig;
static byte s_intensitytable[256];
static unsigned char s_gammatable[256];
static void *Hunk_AllocateTempMemory(int bytes) { return malloc((size_t)bytes); }
static void Hunk_FreeTempMemory(void *memory) { free(memory); }
static void Error(int level,const char *format,...) { (void)level;(void)format;exit(76); }
static struct {
  void *(*Hunk_AllocateTempMemory)(int);
  void (*Hunk_FreeTempMemory)(void *);
  void (*Error)(int,const char *,...);
} ri={Hunk_AllocateTempMemory,Hunk_FreeTempMemory,Error};
#define ERR_DROP 1
#define Com_Memcpy memcpy

#include "image_processing_under_test.inc"

static void fixture(byte *data,int width,int height) {
  int i;for(i=0;i<width*height;i++) {
    data[i*4]=(byte)(i*37+3);data[i*4+1]=(byte)(i*61+7);
    data[i*4+2]=(byte)(i*17+101);data[i*4+3]=(byte)(i*29+211);
  }
}
static void tables(void) {
  int i;for(i=0;i<256;i++) {s_gammatable[i]=(byte)(255-i);s_intensitytable[i]=(byte)(i*2>255?255:i*2);}
}
static void show(const char *label,const byte *data,int size) {
  int i;printf("%s",label);for(i=0;i<size;i++)printf("|%u",data[i]);putchar('\n');
}
static void showResample(const char *label,int iw,int ih,int ow,int oh) {
  byte *input=(byte *)malloc((size_t)iw*ih*4),*output=(byte *)malloc((size_t)ow*oh*4);
  fixture(input,iw,ih);ResampleTexture((unsigned *)input,iw,ih,(unsigned *)output,ow,oh);
  show(label,output,ow*oh*4);free(output);free(input);
}
static void showLight(const char *label,qboolean onlyGamma,int hardware) {
  byte data[12];fixture(data,3,1);glConfig.deviceSupportsGamma=hardware;
  R_LightScaleTexture((unsigned *)data,3,1,onlyGamma);show(label,data,12);
}
static void showMip(const char *label,int width,int height,int simple) {
  int outWidth=width>>1,outHeight=height>>1,outputPixels;byte *data=(byte *)malloc((size_t)width*height*4);
  outputPixels=(outWidth&&outHeight)?outWidth*outHeight:outWidth+outHeight;
  fixture(data,width,height);simpleMipMapsValue.integer=simple;R_MipMap(data,width,height);
  show(label,data,outputPixels*4);free(data);
}
int main(void) {
  tables();
  showResample("resample-4x3-3x2",4,3,3,2);showResample("resample-2x2-4x3",2,2,4,3);
  showLight("gamma-software",1,0);showLight("gamma-hardware",1,1);
  showLight("intensity-hardware",0,1);showLight("intensity-gamma",0,0);
  showMip("mip-simple-4x4",4,4,1);showMip("mip-simple-1x4",1,4,1);
  showMip("mip-filtered-4x4",4,4,0);showMip("mip-filtered-8x4",8,4,0);
  return 0;
}
