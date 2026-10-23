#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <math.h>
#define PRT_ERROR 2
#define PRT_MESSAGE 1
#define CS_MODELS 32
#define MAX_MODELS 256
#define qtrue 1
#define Q_stricmp _stricmp
#define VectorSubtract(a,b,c) do{(c)[0]=(a)[0]-(b)[0];(c)[1]=(a)[1]-(b)[1];(c)[2]=(a)[2]-(b)[2];}while(0)
#define DotProduct(a,b) ((a)[0]*(b)[0]+(a)[1]*(b)[1]+(a)[2]*(b)[2])
#define VectorMA(a,s,b,c) do{(c)[0]=(a)[0]+(s)*(b)[0];(c)[1]=(a)[1]+(s)*(b)[1];(c)[2]=(a)[2]+(s)*(b)[2];}while(0)
typedef float vec3_t[3];
static float VectorNormalize(vec3_t v){float l=sqrtf(DotProduct(v,v));if(l){v[0]/=l;v[1]/=l;v[2]/=l;}return l;}
typedef struct { int indexessetup,loaded,initialized;float time;char *configstrings[1024]; } aas_t;
static aas_t aasworld;
static void Print(int kind,const char *fmt,...){(void)kind;(void)fmt;}
static struct { void (*Print)(int,const char*,...); } botimport={Print};
static void *GetMemory(size_t n){return malloc(n);}

#include "be_aas_main_complete_under_test.inc"

static void V(const vec3_t v){printf("%.0f,%.0f,%.0f",v[0],v[1],v[2]);}
int main(void){char *values[1024]={0};vec3_t point={1,2,0},start={0,0,0},finish={4,0,0},projected;
  printf("before=%s,%d\n",AAS_StringFromIndex("x",values,1024,1),AAS_IndexFromString("x",values,1024,"none"));
  values[CS_MODELS+1]="models/mapobjects/tree.md3";values[CS_MODELS+2]="*2";AAS_UpdateStringIndexes(1024,values);
  printf("models=%s,%d,%s\n",AAS_ModelFromIndex(1),AAS_IndexFromModel("MODELS/MAPOBJECTS/TREE.MD3"),AAS_ModelFromIndex(2));
  aasworld.loaded=1;aasworld.time=3.5f;printf("state=%d,%d,%.1f\n",AAS_Loaded(),AAS_Initialized(),AAS_Time());AAS_SetInitialized();printf("initialized=%d\n",AAS_Initialized());
  AAS_ProjectPointOntoVector(point,start,finish,projected);printf("project=");V(projected);printf("\n");return 0;}
