/* Host for unchanged RB_AddQuadStampExt/RB_AddQuadStamp/RB_SurfaceSprite. */
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
typedef unsigned char byte;
typedef float vec3_t[3];
#define M_PI 3.14159265358979323846f
#define SHADER_MAX_VERTEXES 16
#define SHADER_MAX_INDEXES 48
typedef struct { vec3_t origin;float radius,rotation;byte shaderRGBA[4]; } refEntity_t;
typedef struct { refEntity_t e; } trRefEntity_t;
typedef struct { vec3_t axis[3]; } orientationr_t;
typedef struct { orientationr_t or;int isMirror; } viewParms_t;
typedef struct { trRefEntity_t *currentEntity;viewParms_t viewParms; } backEndState_t;
typedef struct { int numVertexes,numIndexes;float xyz[SHADER_MAX_VERTEXES][4],normal[SHADER_MAX_VERTEXES][4],texCoords[SHADER_MAX_VERTEXES][2][2];byte vertexColors[SHADER_MAX_VERTEXES][4];int indexes[SHADER_MAX_INDEXES]; } shaderCommands_t;
static shaderCommands_t tess;
static backEndState_t backEnd;
static int flushes;
#define VectorScale(v,s,o) ((o)[0]=(v)[0]*(s),(o)[1]=(v)[1]*(s),(o)[2]=(v)[2]*(s))
#define VectorMA(v,s,b,o) ((o)[0]=(v)[0]+(s)*(b)[0],(o)[1]=(v)[1]+(s)*(b)[1],(o)[2]=(v)[2]+(s)*(b)[2])
#define VectorSubtract(a,b,o) ((o)[0]=(a)[0]-(b)[0],(o)[1]=(a)[1]-(b)[1],(o)[2]=(a)[2]-(b)[2])
static const vec3_t vec3_origin={0,0,0};
static void RB_CheckOverflow(int verts,int indexes){if(tess.numVertexes+verts<SHADER_MAX_VERTEXES&&tess.numIndexes+indexes<SHADER_MAX_INDEXES)return;memset(&tess,0,sizeof(tess));flushes++;}
#define RB_CHECKOVERFLOW(v,i) RB_CheckOverflow((v),(i))
#include "surface_entities_under_test.inc"
static uint32_t bits(float f){uint32_t u;memcpy(&u,&f,4);return u;}
static void emit(const char *name,int firstV,int firstI){int i;if(flushes){firstV=0;firstI=0;}printf("%s|V%d|I%d|F%d",name,tess.numVertexes,tess.numIndexes,flushes);for(i=firstV;i<tess.numVertexes;i++)printf("|P%08x,%08x,%08x|N%08x,%08x,%08x|T%08x,%08x,%08x,%08x|C%d,%d,%d,%d",bits(tess.xyz[i][0]),bits(tess.xyz[i][1]),bits(tess.xyz[i][2]),bits(tess.normal[i][0]),bits(tess.normal[i][1]),bits(tess.normal[i][2]),bits(tess.texCoords[i][0][0]),bits(tess.texCoords[i][0][1]),bits(tess.texCoords[i][1][0]),bits(tess.texCoords[i][1][1]),tess.vertexColors[i][0],tess.vertexColors[i][1],tess.vertexColors[i][2],tess.vertexColors[i][3]);printf("|X");for(i=firstI;i<tess.numIndexes;i++)printf("%s%d",i==firstI?"":",",tess.indexes[i]);puts("");}
static void setup(trRefEntity_t *entity){memset(&tess,0,sizeof(tess));memset(&backEnd,0,sizeof(backEnd));memset(entity,0,sizeof(*entity));backEnd.currentEntity=entity;backEnd.viewParms.or.axis[0][0]=1;backEnd.viewParms.or.axis[1][1]=1;backEnd.viewParms.or.axis[2][2]=1;entity->e.origin[0]=10;entity->e.origin[1]=20;entity->e.origin[2]=30;entity->e.radius=2;entity->e.shaderRGBA[0]=11;entity->e.shaderRGBA[1]=22;entity->e.shaderRGBA[2]=33;entity->e.shaderRGBA[3]=44;flushes=0;}
static void run(const char *name,float rotation,int mirror,int baseV,int baseI){trRefEntity_t entity;setup(&entity);entity.e.rotation=rotation;backEnd.viewParms.isMirror=mirror;tess.numVertexes=baseV;tess.numIndexes=baseI;RB_SurfaceSprite();emit(name,baseV,baseI);}
int main(void){trRefEntity_t entity;run("plain",0,0,0,0);run("rot90",90,0,0,0);run("mirror",0,1,0,0);run("rot33",33,0,2,3);run("overflow",15,1,13,43);setup(&entity);{vec3_t o={1,2,3},l={4,5,6},u={-1,-2,-3};byte c[4]={250,128,1,255};RB_AddQuadStampExt(o,l,u,c,-.25f,.125f,1.5f,2.0f);emit("extended",0,0);}return 0;}
