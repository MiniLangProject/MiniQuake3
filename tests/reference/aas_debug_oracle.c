/* Copyright (C) 1999-2005 Id Software, Inc.
 * SPDX-License-Identifier: GPL-2.0-or-later
 * Harness for unchanged geometry helpers extracted from be_aas_debug.c. */
#include <math.h>
#include <stdio.h>
#include <string.h>
typedef float vec3_t[3];
#define qtrue 1
#define qfalse 0
#define MAX_DEBUGLINES 1024
#define LINECOLOR_RED 1
#define LINECOLOR_GREEN 2
#define LINECOLOR_BLUE 3
#define LINECOLOR_YELLOW 4
#define VectorCopy(a,b) memcpy((b),(a),sizeof(vec3_t))
#define VectorSubtract(a,b,c) do{(c)[0]=(a)[0]-(b)[0];(c)[1]=(a)[1]-(b)[1];(c)[2]=(a)[2]-(b)[2];}while(0)
#define VectorSet(a,x,y,z) do{(a)[0]=(x);(a)[1]=(y);(a)[2]=(z);}while(0)
#define VectorMA(a,s,b,c) do{(c)[0]=(a)[0]+(s)*(b)[0];(c)[1]=(a)[1]+(s)*(b)[1];(c)[2]=(a)[2]+(s)*(b)[2];}while(0)
#define DotProduct(a,b) ((a)[0]*(b)[0]+(a)[1]*(b)[1]+(a)[2]*(b)[2])
#define CrossProduct(a,b,c) do{(c)[0]=(a)[1]*(b)[2]-(a)[2]*(b)[1];(c)[1]=(a)[2]*(b)[0]-(a)[0]*(b)[2];(c)[2]=(a)[0]*(b)[1]-(a)[1]*(b)[0];}while(0)
static float VectorNormalize(vec3_t v){float l=sqrtf(DotProduct(v,v));if(l){v[0]/=l;v[1]/=l;v[2]/=l;}return l;}

typedef struct { int color;vec3_t start,end; } record_t;
static record_t records[64];static int recordCount,nextId=1;
int debuglines[MAX_DEBUGLINES],debuglinevisible[MAX_DEBUGLINES],numdebuglines;
static int createLine(void){return nextId++;}
static void showLine(int id,vec3_t start,vec3_t end,int color){(void)id;records[recordCount].color=color;VectorCopy(start,records[recordCount].start);VectorCopy(end,records[recordCount].end);recordCount++;}
struct {int (*DebugLineCreate)(void);void (*DebugLineShow)(int,vec3_t,vec3_t,int);} botimport={createLine,showLine};
void AAS_DebugLine(vec3_t start,vec3_t end,int color){showLine(0,start,end,color);}

#include "aas_debug_under_test.inc"

static void dump(const char *name){int i;printf("%s %d\n",name,recordCount);for(i=0;i<recordCount;i++)printf("%d %d %d %d %d %d %d\n",records[i].color,(int)records[i].start[0],(int)records[i].start[1],(int)records[i].start[2],(int)records[i].end[0],(int)records[i].end[1],(int)records[i].end[2]);recordCount=0;}
int main(void){
 vec3_t a={1,2,3},b={13,2,3},normal={1,0,0};
 AAS_DrawCross(a,2,LINECOLOR_GREEN);dump("cross");
 AAS_DrawArrow(a,b,LINECOLOR_BLUE,LINECOLOR_YELLOW);dump("arrow");
 AAS_DrawPlaneCross(a,normal,5,0,LINECOLOR_RED);dump("plane");
 AAS_DrawPermanentCross(a,1,LINECOLOR_BLUE);dump("permanent");
 AAS_PermanentLine(a,b,LINECOLOR_YELLOW);dump("line");
 return 0;
}
