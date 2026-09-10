/* Host for the unchanged LoadTGA implementation extracted from renderer/tr_image.c. */
#define _CRT_SECURE_NO_WARNINGS
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef unsigned char byte;
typedef struct {
  byte id_length,colormap_type,image_type;
  unsigned short colormap_index,colormap_length;
  byte colormap_size;
  unsigned short x_origin,y_origin,width,height;
  byte pixel_size,attributes;
} TargaHeader;

#define ERR_DROP 1
#define PRINT_WARNING 1
#define LittleShort

static const byte *activeData;
static int activeSize;
static int warningCount;
static int FS_ReadFile(char *name,void **buffer) { (void)name;*buffer=(void *)activeData;return activeSize; }
static void FS_FreeFile(void *buffer) { (void)buffer; }
static void *R_Malloc(int size) { return calloc(1,(size_t)size); }
static void R_Error(int level,const char *format,...) { (void)level;(void)format;exit(74); }
static void R_Printf(int level,const char *format,...) { (void)level;(void)format;warningCount++; }
typedef struct {
  int (*FS_ReadFile)(char *,void **);
  void (*FS_FreeFile)(void *);
  void *(*Malloc)(int);
  void (*Error)(int,const char *,...);
  void (*Printf)(int,const char *,...);
} rendererImport_t;
static rendererImport_t ri={FS_ReadFile,FS_FreeFile,R_Malloc,R_Error,R_Printf};

#include "tga_under_test.inc"

static const byte rgb24[]={0,0,2,0,0,0,0,0,0,0,0,0,2,0,2,0,24,0,1,2,3,4,5,6,7,8,9,10,11,12};
static const byte rgba32id[]={3,0,2,0,0,0,0,0,0,0,0,0,2,0,1,0,32,0,65,66,67,9,8,7,6,5,4,3,2};
static const byte gray[]={0,0,3,0,0,0,0,0,0,0,0,0,3,0,1,0,8,0,0,127,255};
static const byte rleRun[]={0,0,10,0,0,0,0,0,0,0,0,0,3,0,2,0,24,0,131,30,20,10,1,3,2,1,6,5,4};
static const byte rleRawCross[]={0,0,10,0,0,0,0,0,0,0,0,0,2,0,2,0,32,32,3,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};

static void show(const char *label,const byte *data,int size) {
  byte *pixels=NULL;int width=0,height=0,i;warningCount=0;activeData=data;activeSize=size;
  LoadTGA(label,&pixels,&width,&height);
  printf("%s|%d|%d|%s",label,width,height,warningCount?"true":"false");
  for(i=0;i<width*height*4;i++)printf("|%u",pixels[i]);
  putchar('\n');free(pixels);
}
int main(void) {
  show("rgb24",rgb24,sizeof(rgb24));
  show("rgba32-id",rgba32id,sizeof(rgba32id));
  show("gray",gray,sizeof(gray));
  show("rle-run",rleRun,sizeof(rleRun));
  show("rle-raw-cross",rleRawCross,sizeof(rleRawCross));
  return 0;
}
