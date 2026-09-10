/* Host for unchanged RB_SurfaceTriangles and RB_SurfaceFace from tr_surface.c. */
#include <stdint.h>
#include <stdio.h>
#include <string.h>
typedef unsigned char byte;typedef int qboolean;typedef float vec3_t[3];typedef int surfaceType_t;
#define SMP_FRAMES 2
#define VERTEXSIZE 8
#define SHADER_MAX_VERTEXES 8
#define SHADER_MAX_INDEXES 18
typedef struct { float normal[3],dist;byte type,signbits,pad[2]; } cplane_t;
typedef struct { vec3_t xyz;float st[2],lightmap[2];vec3_t normal;byte color[4]; } drawVert_t;
typedef struct { surfaceType_t surfaceType;int dlightBits[2];vec3_t bounds[2],localOrigin;float radius;int numIndexes,*indexes,numVerts;drawVert_t *verts; } srfTriangles_t;
typedef struct { surfaceType_t surfaceType;cplane_t plane;int dlightBits[2],numPoints,numIndices,ofsIndices;float points[1][VERTEXSIZE]; } srfSurfaceFace_t;
typedef struct { qboolean needsNormal; } shader_t;
typedef struct { int numVertexes,numIndexes;float xyz[SHADER_MAX_VERTEXES][4],normal[SHADER_MAX_VERTEXES][4],texCoords[SHADER_MAX_VERTEXES][2][2];byte vertexColors[SHADER_MAX_VERTEXES][4];int vertexDlightBits[SHADER_MAX_VERTEXES],indexes[SHADER_MAX_INDEXES],dlightBits;shader_t *shader; } shaderCommands_t;
typedef struct { int smpFrame; } backEndState_t;
static shaderCommands_t tess;static shader_t shader;static backEndState_t backEnd;static int flushes,emitV,emitI;
static void RB_CheckOverflow(int v,int i){if(tess.numVertexes+v>SHADER_MAX_VERTEXES||tess.numIndexes+i>SHADER_MAX_INDEXES){memset(&tess,0,sizeof(tess));tess.shader=&shader;flushes++;}}
#define RB_CHECKOVERFLOW(v,i) RB_CheckOverflow((v),(i))
#define VectorCopy(a,b) ((b)[0]=(a)[0],(b)[1]=(a)[1],(b)[2]=(a)[2])
#include "surface_mesh_under_test.inc"
static uint32_t color_bits(byte a,byte b,byte c,byte d){return (uint32_t)a|((uint32_t)b<<8)|((uint32_t)c<<16)|((uint32_t)d<<24);}
static void fill(drawVert_t *v,int n){v->xyz[0]=n;v->xyz[1]=n+1;v->xyz[2]=n+2;v->normal[0]=0;v->normal[1]=.5f;v->normal[2]=1;v->st[0]=n*.1f;v->st[1]=n*.2f;v->lightmap[0]=n*.3f;v->lightmap[1]=n*.4f;v->color[0]=(byte)(n+1);v->color[1]=(byte)(n+2);v->color[2]=(byte)(n+3);v->color[3]=(byte)(250+n);}
static void emit(const char *name){int i,sx=0,sn=0,st=0,col=0,vl=0,ix=0;for(i=emitV;i<tess.numVertexes;i++){sx+=(int)(tess.xyz[i][0]*10)+(int)(tess.xyz[i][1]*10)+(int)(tess.xyz[i][2]*10);sn+=(int)(tess.normal[i][0]*10)+(int)(tess.normal[i][1]*10)+(int)(tess.normal[i][2]*10);st+=(int)(tess.texCoords[i][0][0]*10)+(int)(tess.texCoords[i][0][1]*10)+(int)(tess.texCoords[i][1][0]*10)+(int)(tess.texCoords[i][1][1]*10);col+=(int)color_bits(tess.vertexColors[i][0],tess.vertexColors[i][1],tess.vertexColors[i][2],tess.vertexColors[i][3]);vl+=tess.vertexDlightBits[i];}for(i=emitI;i<tess.numIndexes;i++)ix+=tess.indexes[i];printf("%s|V%d|I%d|F%d|D%d|P%d|N%d|T%d|C%d|L%d|X%d\n",name,tess.numVertexes,tess.numIndexes,flushes,tess.dlightBits,sx,sn,st,col,vl,ix);}
static void begin(int needs,int v,int i,int dl){memset(&tess,0,sizeof(tess));shader.needsNormal=needs;tess.shader=&shader;tess.numVertexes=v;tess.numIndexes=i;tess.dlightBits=dl;flushes=0;emitV=v;emitI=i;}
int main(void){drawVert_t verts[4];int indexes[6]={0,1,2,2,3,0},i;srfTriangles_t tri;byte faceData[256];srfSurfaceFace_t *face=(srfSurfaceFace_t*)faceData;unsigned *fi;
 for(i=0;i<4;i++)fill(&verts[i],i+1);memset(&tri,0,sizeof(tri));tri.dlightBits[0]=5;tri.dlightBits[1]=9;tri.numVerts=4;tri.verts=verts;tri.numIndexes=6;tri.indexes=indexes;
 backEnd.smpFrame=0;begin(1,2,3,2);RB_SurfaceTriangles(&tri);emit("tri");backEnd.smpFrame=1;begin(0,6,15,4);RB_SurfaceTriangles(&tri);if(flushes){emitV=0;emitI=0;}emit("triOverflow");
 memset(faceData,0,sizeof(faceData));face->plane.normal[0]=.25f;face->plane.normal[1]=.5f;face->plane.normal[2]=.75f;face->dlightBits[1]=10;face->numPoints=4;face->numIndices=6;face->ofsIndices=(int)((byte*)&face->points[4]-(byte*)face);for(i=0;i<4;i++){face->points[i][0]=verts[i].xyz[0];face->points[i][1]=verts[i].xyz[1];face->points[i][2]=verts[i].xyz[2];face->points[i][3]=verts[i].st[0];face->points[i][4]=verts[i].st[1];face->points[i][5]=verts[i].lightmap[0];face->points[i][6]=verts[i].lightmap[1];memcpy(&face->points[i][7],verts[i].color,4);}fi=(unsigned*)(faceData+face->ofsIndices);for(i=0;i<6;i++)fi[i]=(unsigned)indexes[i];begin(1,6,15,4);RB_SurfaceFace(face);if(flushes){emitV=0;emitI=0;}emit("faceOverflow");return 0;}
