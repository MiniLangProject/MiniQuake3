/* Focused host for unchanged Baseq3 tr_font.c parsing and glyph metrics. */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
typedef unsigned char byte;
typedef union { byte fred[4]; float ffred; } poor;
typedef struct { long horiBearingX,width,horiBearingY,height,horiAdvance; } FT_Glyph_Metrics;
typedef struct FT_GlyphSlotRec_ { FT_Glyph_Metrics metrics; } FT_GlyphSlotRec,*FT_GlyphSlot;
#define qtrue 1
#define _FLOOR(x) ((x)&-64)
#define _CEIL(x) (((x)+63)&-64)
#define _TRUNC(x) ((x)>>6)
static int fdOffset;
static byte *fdFile;
static byte writtenFile[64];
static int writtenCount;
static void hostWriteFile(const char *name,const void *data,int count) { (void)name;memcpy(writtenFile,data,(size_t)count);writtenCount=count; }
static struct { void (*FS_WriteFile)(const char *,const void *,int); } ri={hostWriteFile};
#define Z_Malloc malloc
#define Z_Free free
#define Com_Memset memset
#include "tr_font_under_test.inc"
static void integers(void) {
  byte data[]={0x78,0x56,0x34,0x12,0xff,0xff,0xff,0xff};
  int a,b;fdFile=data;fdOffset=0;a=readInt();b=readInt();printf("int|%d,%d,%d\n",a,b,fdOffset);
}
static void floats(void) {
  byte data[]={0,0,0x80,0x3f,0,0,0x20,0xc0};poor a,b;
  fdFile=data;fdOffset=0;a.ffred=readFloat();b.ffred=readFloat();printf("float|%u,%u,%d\n",*(uint32_t*)&a.ffred,*(uint32_t*)&b.ffred,fdOffset);
}
static void metrics(long bx,long width,long by,long height,long advance,const char *label) {
  FT_GlyphSlotRec slot={{bx,width,by,height,advance}};int l,r,w,t,b,h,p;
  R_GetGlyphInfo(&slot,&l,&r,&w,&t,&b,&h,&p);printf("%s|%d,%d,%d,%d,%d,%d,%d\n",label,l,r,w,t,b,h,p);
}
static void tga(void) {
  byte rgba[]={1,2,3,4,10,20,30,40};int i;WriteTGA("ignored.tga",rgba,2,1);printf("tga|%d",writtenCount);for(i=0;i<writtenCount;i++)printf(",%u",writtenFile[i]);printf("\n");
}
int main(void) { integers();floats();metrics(65,130,127,129,192,"metric");metrics(-65,64,-1,64,64,"negative");tga();return 0; }
