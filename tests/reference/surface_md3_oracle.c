/* Host for unchanged LerpMeshVertexes and RB_SurfaceMesh from renderer/tr_surface.c. */
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
typedef unsigned char byte;
typedef float vec3_t[3];
typedef float vec4_t[4];
#define FUNCTABLE_SIZE 1024
#define FUNCTABLE_MASK 1023
#define MD3_XYZ_SCALE (1.0/64)
#define MAX_QPATH 64
#define SHADER_MAX_VERTEXES 16
#define SHADER_MAX_INDEXES 48
typedef struct { int ident;char name[MAX_QPATH];int flags,numFrames,numShaders,numVerts,numTriangles,ofsTriangles,ofsShaders,ofsSt,ofsXyzNormals,ofsEnd; } md3Surface_t;
typedef struct { int frame,oldframe;float backlerp; } refEntity_t;
typedef struct { refEntity_t e; } trRefEntity_t;
typedef struct { trRefEntity_t *currentEntity; } backEndState_t;
typedef struct { float sinTable[FUNCTABLE_SIZE]; } trGlobals_t;
typedef struct { int numVertexes,numIndexes;float xyz[SHADER_MAX_VERTEXES][4],normal[SHADER_MAX_VERTEXES][4],texCoords[SHADER_MAX_VERTEXES][2][2];int indexes[SHADER_MAX_INDEXES],dlightBits; } shaderCommands_t;
static shaderCommands_t tess,saved;
static backEndState_t backEnd;
static trGlobals_t tr;
static int flushes;
static int emittedBaseVertex,emittedBaseIndex;
static float Q_rsqrt(float number) { long i;float x2,y;const float threehalfs=1.5F;x2=number*.5F;y=number;i=*(long*)&y;i=0x5f3759df-(i>>1);y=*(float*)&i;y=y*(threehalfs-(x2*y*y));return y; }
#define DotProduct(x,y) ((x)[0]*(y)[0]+(x)[1]*(y)[1]+(x)[2]*(y)[2])
#define VectorNormalizeFast(v) do { float il=Q_rsqrt(DotProduct(v,v));(v)[0]*=il;(v)[1]*=il;(v)[2]*=il; } while(0)
static void RB_CheckOverflow(int verts,int indexes) { if(tess.numVertexes+verts>SHADER_MAX_VERTEXES||tess.numIndexes+indexes>SHADER_MAX_INDEXES){saved=tess;memset(&tess,0,sizeof(tess));flushes++;} }
#define RB_CHECKOVERFLOW(v,i) RB_CheckOverflow((v),(i))
#include "surface_md3_under_test.inc"

typedef struct { byte data[512]; } blob_t;
static md3Surface_t *make_surface(blob_t *blob) {
 md3Surface_t *s=(md3Surface_t*)blob->data;int *tri;float *st;short *verts;int i;
 memset(blob,0,sizeof(*blob));s->numFrames=2;s->numVerts=4;s->numTriangles=2;
 s->ofsTriangles=sizeof(*s);s->ofsSt=s->ofsTriangles+6*sizeof(int);s->ofsXyzNormals=s->ofsSt+8*sizeof(float);s->ofsEnd=s->ofsXyzNormals+2*4*4*sizeof(short);
 tri=(int*)(blob->data+s->ofsTriangles);tri[0]=0;tri[1]=1;tri[2]=2;tri[3]=2;tri[4]=3;tri[5]=0;
 st=(float*)(blob->data+s->ofsSt);for(i=0;i<4;i++){st[i*2]=(float)i*.25f;st[i*2+1]=1.0f-(float)i*.125f;}
 verts=(short*)(blob->data+s->ofsXyzNormals);
 { short f[32]={64,0,0,0x0000, 0,64,0,0x0040, -64,0,64,0x4000, 32,-32,96,0x4040,
                  128,64,0,0x0040, 64,128,64,0x4000, -128,64,128,0x4040, 96,-96,160,0x0080};memcpy(verts,f,sizeof(f)); }
 return s;
}
static uint32_t bits(float f){uint32_t u;memcpy(&u,&f,4);return u;}
static void emit(const char *name) {
 int i;printf("%s|V%d|I%d|F%d|D%d",name,tess.numVertexes,tess.numIndexes,flushes,tess.dlightBits);
 for(i=emittedBaseVertex;i<tess.numVertexes;i++)printf("|P%08x,%08x,%08x|N%08x,%08x,%08x|T%08x,%08x",bits(tess.xyz[i][0]),bits(tess.xyz[i][1]),bits(tess.xyz[i][2]),bits(tess.normal[i][0]),bits(tess.normal[i][1]),bits(tess.normal[i][2]),bits(tess.texCoords[i][0][0]),bits(tess.texCoords[i][0][1]));
 printf("|X");for(i=emittedBaseIndex;i<tess.numIndexes;i++)printf("%s%d",i==emittedBaseIndex?"":",",tess.indexes[i]);puts("");
}
static void run(const char *name,md3Surface_t *s,trRefEntity_t *entity,int oldframe,int frame,float backlerp,int basev,int basei) {
 int i;memset(&tess,0,sizeof(tess));flushes=0;tess.numVertexes=basev;tess.numIndexes=basei;tess.dlightBits=13;
 for(i=0;i<basev;i++)tess.xyz[i][0]=-99.0f;for(i=0;i<basei;i++)tess.indexes[i]=-1;
 entity->e.oldframe=oldframe;entity->e.frame=frame;entity->e.backlerp=backlerp;RB_SurfaceMesh(s);
 emittedBaseVertex=flushes?0:basev;emittedBaseIndex=flushes?0:basei;emit(name);
}
int main(void) {
 blob_t blob;md3Surface_t *s=make_surface(&blob);trRefEntity_t entity;int i;backEnd.currentEntity=&entity;
 for(i=0;i<FUNCTABLE_SIZE;i++)tr.sinTable[i]=(float)sin((((float)i*360.0f)/(float)(FUNCTABLE_SIZE-1))*3.14159265358979323846/180.0f);
 run("direct",s,&entity,0,1,.75f,2,3);
 run("sameframe",s,&entity,1,1,.75f,0,0);
 run("overflow",s,&entity,0,1,.25f,14,44);
 return 0;
}
