/* Host for unchanged image registry functions from renderer/tr_image.c. */
#define _CRT_SECURE_NO_WARNINGS
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef unsigned char byte;
typedef int qboolean;
#define qfalse 0
#define qtrue 1
#define FILE_HASH_SIZE 1024
#define MAX_QPATH 64
#define MAX_DRAWIMAGES 2048
#define h_low 0
#define PRINT_DEVELOPER 1
#define PRINT_ALL 2
#define ERR_DROP 1
typedef struct image_s { unsigned texnum; int width,height,uploadWidth,uploadHeight; int internalFormat; int TMU; char imgName[MAX_QPATH]; qboolean mipmap,allowPicmip; int wrapClampMode; struct image_s *next; } image_t;
static image_t *hashTable[FILE_HASH_SIZE];
static struct { int numImages; image_t *images[MAX_DRAWIMAGES]; } tr;
static void hostError(int level,const char *format,...) { (void)level;(void)format;exit(76); }
static void hostPrintf(int level,const char *format,...) { (void)level;(void)format; }
static void *hostAlloc(int size,int preference) { (void)preference;return calloc(1,(size_t)size); }
static void hostFree(void *value) { free(value); }
static struct { void (*Error)(int,const char *,...);void (*Printf)(int,const char *,...);void *(*Hunk_Alloc)(int,int);void (*Free)(void *); } ri={hostError,hostPrintf,hostAlloc,hostFree};
static int activeTexture;
#define qglActiveTextureARB activeTexture
static void GL_SelectTexture(int tmu) { (void)tmu; }
static void GL_Bind(image_t *image) { (void)image; }
static void qglTexParameterf(int target,int key,int value) { (void)target;(void)key;(void)value; }
static void qglBindTexture(int target,int value) { (void)target;(void)value; }
#define GL_TEXTURE_2D 3553
#define GL_TEXTURE_WRAP_S 10242
#define GL_TEXTURE_WRAP_T 10243
static void Upload32(unsigned *pic,int width,int height,qboolean mipmap,qboolean picmip,qboolean lightmap,int *format,int *uw,int *uh) { (void)pic;(void)mipmap;(void)picmip;*format=lightmap?3:4;*uw=width==3?4:width;*uh=height; }
static byte fixtureData[64];
static void R_LoadImage(const char *name,byte **pic,int *width,int *height) { if(!strcmp(name,"textures/fallback.TGA")){*pic=(byte *)malloc(8);memcpy(*pic,fixtureData,8);*width=2;*height=1;}else *pic=NULL; }

#include "image_registry_under_test.inc"

static void showHash(const char *name) { printf("H|%s|%ld\n",name,generateHashValue(name)); }
int main(void) {
  byte opaque[24],alpha[16];image_t *first,*second,*found;memset(opaque,255,sizeof(opaque));memset(alpha,128,sizeof(alpha));memset(fixtureData,255,sizeof(fixtureData));activeTexture=1;
  showHash("textures/base_wall/concrete.tga");showHash("TEXTURES\\BASE_WALL\\CONCRETE.JPG");showHash("*white");showHash("no_extension");showHash("a.b.c");
  first=R_CreateImage("*lightmap0",opaque,3,2,qtrue,qfalse,10497);
  printf("C|%u|%d|%d|%d|%d|%d|%d\n",first->texnum,first->TMU,first->width,first->height,first->uploadWidth,first->uploadHeight,first->internalFormat);
  second=R_CreateImage("textures/a.tga",alpha,2,2,qfalse,qtrue,10497);
  printf("C|%u|%d|%d|%d|%d|%d|%d\n",second->texnum,second->TMU,second->width,second->height,second->uploadWidth,second->uploadHeight,second->internalFormat);
  found=R_FindImageFile("textures/a.tga",qtrue,qfalse,33071);
  printf("F|%u|%d\n",found->texnum,tr.numImages);
  return 0;
}
