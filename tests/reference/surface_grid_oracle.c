/* Host for unchanged RB_SurfaceGrid from renderer/tr_surface.c. */
#include <stdint.h>
#include <stdio.h>
#include <string.h>
typedef unsigned char byte;
typedef int qboolean;
typedef float vec3_t[3];
#define MAX_GRID_SIZE 65
#define SHADER_MAX_VERTEXES 16
#define SHADER_MAX_INDEXES 96
typedef struct { qboolean needsNormal; } shader_t;
typedef struct {
 int numVertexes,numIndexes;
 float xyz[SHADER_MAX_VERTEXES][4],normal[SHADER_MAX_VERTEXES][4],texCoords[SHADER_MAX_VERTEXES][2][2];
 byte vertexColors[SHADER_MAX_VERTEXES][4];
 int vertexDlightBits[SHADER_MAX_VERTEXES],indexes[SHADER_MAX_INDEXES],dlightBits,fogNum;
 shader_t *shader;
} shaderCommands_t;
typedef struct { vec3_t xyz;float st[2],lightmap[2];vec3_t normal;byte color[4]; } drawVert_t;
typedef struct {
 int surfaceType;int dlightBits[2];vec3_t bounds[2],localOrigin;float meshRadius;
 int width,height;float *widthLodError,*heightLodError;drawVert_t *verts;
 vec3_t lodOrigin;float lodRadius;
} srfGridMesh_t;
typedef struct { int smpFrame; } backEndState_t;
static shaderCommands_t tess,saved[8];
static backEndState_t backEnd;
static int savedCount;
static float requestedLodError;
static float LodErrorForVolume(vec3_t local,float radius) { (void)local;(void)radius;return requestedLodError; }
static void RB_EndSurface(void) { if(tess.numVertexes||tess.numIndexes) saved[savedCount++]=tess; }
static void RB_BeginSurface(shader_t *shader,int fogNum) { memset(&tess,0,sizeof(tess));tess.shader=shader;tess.fogNum=fogNum; }
#include "surface_grid_under_test.inc"

static void fill(drawVert_t *v,int row,int col) {
 int n=row*10+col;
 v->xyz[0]=n*.5f;v->xyz[1]=row*.5f;v->xyz[2]=col*.5f;
 v->normal[0]=0;v->normal[1]=0;v->normal[2]=1;
 v->st[0]=col*.5f;v->st[1]=row*.5f;v->lightmap[0]=row*.25f;v->lightmap[1]=col*.25f;
 v->color[0]=(byte)n;v->color[1]=(byte)(n+1);v->color[2]=(byte)(n+2);v->color[3]=(byte)(260+n);
}
static void emit(const char *name,const shaderCommands_t *b) {
 int i,sx=0,sy=0,sz=0,sn=0,s0=0,s1=0,l0=0,l1=0,c0=0,c1=0,c2=0,c3=0,dl=0,ix=0;
 for(i=0;i<b->numVertexes;i++) {
  sx+=(int)(b->xyz[i][0]*2);sy+=(int)(b->xyz[i][1]*2);sz+=(int)(b->xyz[i][2]*2);sn+=(int)(b->normal[i][2]*2);
  s0+=(int)(b->texCoords[i][0][0]*2);s1+=(int)(b->texCoords[i][0][1]*2);l0+=(int)(b->texCoords[i][1][0]*4);l1+=(int)(b->texCoords[i][1][1]*4);
  c0+=b->vertexColors[i][0];c1+=b->vertexColors[i][1];c2+=b->vertexColors[i][2];c3+=b->vertexColors[i][3];dl+=b->vertexDlightBits[i];
 }
 for(i=0;i<b->numIndexes;i++) ix+=b->indexes[i];
 printf("%s|V%d|I%d|D%d|P%d,%d,%d|N%d|T%d,%d,%d,%d|C%d,%d,%d,%d|L%d|X%d|E%d,%d\n",name,b->numVertexes,b->numIndexes,b->dlightBits,sx,sy,sz,sn,s0,s1,l0,l1,c0,c1,c2,c3,dl,ix,(int)(b->xyz[0][0]*2),(int)(b->xyz[b->numVertexes-1][0]*2));
}
static void run(const char *prefix,srfGridMesh_t *grid,float lod,shader_t *shader) {
 int i;char name[32];savedCount=0;requestedLodError=lod;RB_BeginSurface(shader,3);RB_SurfaceGrid(grid);RB_EndSurface();
 for(i=0;i<savedCount;i++){sprintf_s(name,sizeof(name),"%s%d",prefix,i);emit(name,&saved[i]);}
}
int main(void) {
 shader_t shader={1};drawVert_t verts[25];float wl[5]={0,10,1,10,0},hl[5]={0,0,5,0,0};srfGridMesh_t grid;int i;
 for(i=0;i<25;i++)fill(&verts[i],i/5,i%5);
 memset(&grid,0,sizeof(grid));grid.width=5;grid.height=5;grid.widthLodError=wl;grid.heightLodError=hl;grid.verts=verts;grid.dlightBits[0]=5;backEnd.smpFrame=0;
 run("filtered",&grid,2,&shader);
 grid.dlightBits[0]=9;run("full",&grid,20,&shader);
 return 0;
}
