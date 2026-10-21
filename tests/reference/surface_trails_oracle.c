/* Host for unchanged DoRailCore and DoRailDiscs from renderer/tr_surface.c. */
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
typedef unsigned char byte;
typedef float vec3_t[3];
typedef struct { unsigned char shaderRGBA[4]; } refEntity_t;
typedef struct { refEntity_t e; } trRefEntity_t;
typedef struct { trRefEntity_t *currentEntity; } backEndState_t;
typedef struct { int integer;float value; } cvar_t;
typedef struct { int numVertexes,numIndexes;float xyz[128][4],texCoords[128][2][2];byte vertexColors[128][4];int indexes[256]; } tess_t;
static tess_t tess;static backEndState_t backEnd;static cvar_t railWidth;static cvar_t *r_railWidth=&railWidth;
#define M_PI 3.14159265358979323846f
#define DEG2RAD(a) (((a)*M_PI)/180.0F)
#define VectorMA(a,s,b,o) ((o)[0]=(a)[0]+(s)*(b)[0],(o)[1]=(a)[1]+(s)*(b)[1],(o)[2]=(a)[2]+(s)*(b)[2])
#define VectorAdd(a,b,o) ((o)[0]=(a)[0]+(b)[0],(o)[1]=(a)[1]+(b)[1],(o)[2]=(a)[2]+(b)[2])
#define VectorCopy(a,b) ((b)[0]=(a)[0],(b)[1]=(a)[1],(b)[2]=(a)[2])
#define RB_CHECKOVERFLOW(v,i) ((void)0)
#include "surface_trails_under_test.inc"
static uint32_t bits(float x){uint32_t u;memcpy(&u,&x,4);return u;}
static void emit(const char *name){int i;printf("%s|V%d|I%d",name,tess.numVertexes,tess.numIndexes);for(i=0;i<tess.numVertexes;i++)printf("|%08x,%08x,%08x;%08x,%08x;%u,%u,%u",bits(tess.xyz[i][0]),bits(tess.xyz[i][1]),bits(tess.xyz[i][2]),bits(tess.texCoords[i][0][0]),bits(tess.texCoords[i][0][1]),tess.vertexColors[i][0],tess.vertexColors[i][1],tess.vertexColors[i][2]);printf("|X");for(i=0;i<tess.numIndexes;i++)printf("%s%d",i?",":"",tess.indexes[i]);putchar('\n');}
int main(void){trRefEntity_t entity;vec3_t start={1,2,3},finish={9,-2,7},up={0,.6f,.8f},direction={8,0,0},right={0,1,0},ringup={0,0,1};memset(&entity,0,sizeof(entity));entity.e.shaderRGBA[0]=200;entity.e.shaderRGBA[1]=100;entity.e.shaderRGBA[2]=50;entity.e.shaderRGBA[3]=230;backEnd.currentEntity=&entity;
 memset(&tess,0,sizeof(tess));DoRailCore(start,finish,up,9,6);emit("core");
 memset(&tess,0,sizeof(tess));railWidth.integer=16;DoRailDiscs(3,start,direction,right,ringup);emit("rings");return 0;}
