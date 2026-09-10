/* Host for unchanged draw-surface functions from renderer/tr_main.c. */
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define MAX_SHADERS 16384
#define MAX_DRAWSURFS 0x10000
#define DRAWSURF_MASK (MAX_DRAWSURFS-1)
#define QSORT_SHADERNUM_SHIFT 17
#define QSORT_ENTITYNUM_SHIFT 7
#define QSORT_FOGNUM_SHIFT 2
#define SWAP_DRAW_SURF(a,b) temp=((int *)a)[0];((int *)a)[0]=((int *)b)[0];((int *)b)[0]=temp; temp=((int *)a)[1];((int *)a)[1]=((int *)b)[1];((int *)b)[1]=temp;
#define CUTOFF 8
#define ERR_DROP 1

typedef int surfaceType_t;
typedef struct { unsigned sort; surfaceType_t *surface; } drawSurf_t;
typedef struct { int sortedIndex; float sort; const char *name; } shader_t;
static struct {
  struct { int numDrawSurfs; drawSurf_t *drawSurfs; } refdef;
  int shiftedEntityNum;
  shader_t *sortedShaders[MAX_SHADERS];
} tr;
static void Error(int level,const char *format,...) {(void)level;(void)format;exit(78);}
static struct { void (*Error)(int,const char *,...); } ri={Error};

#include "draw_surfs_under_test.inc"

static void packed(int shaderIndex,int entityNum,int fogNum,int dlightMap) {
  shader_t shader;surfaceType_t surface=0;int e,f,d;shader_t *decoded;
  shader.sortedIndex=shaderIndex;shader.sort=3.0f;shader.name="fixture";
  tr.sortedShaders[shaderIndex]=&shader;tr.shiftedEntityNum=entityNum<<QSORT_ENTITYNUM_SHIFT;
  tr.refdef.numDrawSurfs=0;R_AddDrawSurf(&surface,&shader,fogNum,dlightMap);
  R_DecomposeSort(tr.refdef.drawSurfs[0].sort,&e,&decoded,&f,&d);
  printf("P|%d|%d|%d|%d|%u|%d|%d|%d|%d\n",shaderIndex,entityNum,fogNum,dlightMap,
         tr.refdef.drawSurfs[0].sort,decoded->sortedIndex,e,f,d);
}

int main(void) {
  drawSurf_t storage[MAX_DRAWSURFS];surfaceType_t surfaces[12];drawSurf_t list[12];
  unsigned keys[12]={393216,0,131071,131072,15,14,2097152,524416,524288,262271,262144,4};int i;
  tr.refdef.drawSurfs=storage;
  packed(0,0,0,0);packed(1,2,3,1);packed(91,777,19,2);packed(16383,1023,31,3);
  for(i=0;i<12;i++){surfaces[i]=i;list[i].sort=keys[i];list[i].surface=&surfaces[i];}
  qsortFast(list,12,sizeof(drawSurf_t));
  printf("Q");for(i=0;i<12;i++)printf("|%u:%d",list[i].sort,*list[i].surface);putchar('\n');
  return 0;
}
