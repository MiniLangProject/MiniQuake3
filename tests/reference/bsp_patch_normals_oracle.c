/* Host for unchanged patch subdivision and normal generation from tr_curve.c. */
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
typedef int qboolean;
typedef float vec3_t[3];
typedef struct { vec3_t xyz; float st[2]; float lightmap[2]; vec3_t normal; unsigned char color[4]; } drawVert_t;
#define qfalse 0
#define qtrue 1
#define MAX_GRID_SIZE 65
#define MAX_PATCH_SIZE 32
#define MAC_STATIC static
#define Com_Memcpy memcpy
#define VectorSubtract(a,b,o) ((o)[0]=(a)[0]-(b)[0],(o)[1]=(a)[1]-(b)[1],(o)[2]=(a)[2]-(b)[2])
#define VectorLengthSquared(v) ((v)[0]*(v)[0]+(v)[1]*(v)[1]+(v)[2]*(v)[2])
#define VectorClear(v) ((v)[0]=0,(v)[1]=0,(v)[2]=0)
#define VectorCopy(a,b) ((b)[0]=(a)[0],(b)[1]=(a)[1],(b)[2]=(a)[2])
#define VectorAdd(a,b,o) ((o)[0]=(a)[0]+(b)[0],(o)[1]=(a)[1]+(b)[1],(o)[2]=(a)[2]+(b)[2])
#define DotProduct(a,b) ((a)[0]*(b)[0]+(a)[1]*(b)[1]+(a)[2]*(b)[2])
#define VectorScale(a,s,o) ((o)[0]=(a)[0]*(s),(o)[1]=(a)[1]*(s),(o)[2]=(a)[2]*(s))
#define CrossProduct(a,b,o) ((o)[0]=(a)[1]*(b)[2]-(a)[2]*(b)[1],(o)[1]=(a)[2]*(b)[0]-(a)[0]*(b)[2],(o)[2]=(a)[0]*(b)[1]-(a)[1]*(b)[0])
static float VectorNormalize2(const vec3_t in,vec3_t out){float l=sqrtf(VectorLengthSquared(in));if(l==0){VectorClear(out);return 0;}out[0]=in[0]/l;out[1]=in[1]/l;out[2]=in[2]/l;return l;}
static float VectorNormalize(vec3_t v){vec3_t t;float l=VectorNormalize2(v,t);VectorCopy(t,v);return l;}
static struct { float value; } subdivisions={4.0f}, *r_subdivisions=&subdivisions;
typedef struct { int width,height; drawVert_t verts[MAX_GRID_SIZE*MAX_GRID_SIZE]; } srfGridMesh_t;
static srfGridMesh_t captured;
static srfGridMesh_t *R_CreateSurfaceGridMesh(int width,int height,drawVert_t ctrl[MAX_GRID_SIZE][MAX_GRID_SIZE],float errors[2][MAX_GRID_SIZE]){
    (void)errors;
    captured.width=width;
    captured.height=height;
    for(int y=0;y<height;y++) memcpy(&captured.verts[y*width],ctrl[y],width*sizeof(drawVert_t));
    return &captured;
}
#pragma warning(push)
/* Original subdivision narrows sqrt(double) and shadows the axis index. */
#pragma warning(disable: 4244 4456)
#include "bsp_patch_normals_under_test.inc"
#pragma warning(pop)
static int quantized(float f){return f>=0.0f?(int)floorf(f*1000000.0f+0.5f):(int)ceilf(f*1000000.0f-0.5f);}
static void emitPatch(int curved){
    drawVert_t points[MAX_PATCH_SIZE*MAX_PATCH_SIZE]={0};
    for(int y=0;y<5;y++) for(int x=0;x<5;x++){
        drawVert_t *p=&points[y*5+x];
        p->xyz[0]=(float)x;
        p->xyz[1]=(float)y;
        p->xyz[2]=(curved && x==3 && y==3)?32.0f:0.0f;
        p->st[0]=(float)(y*5+x);
        p->color[0]=(unsigned char)(10+y*5+x);
    }
    srfGridMesh_t *mesh=R_SubdividePatchToGrid(5,5,points);
    printf("G%d|%d|%d\n",curved,mesh->width,mesh->height);
    for(int i=0;i<mesh->width*mesh->height;i++){
        const drawVert_t *p=&mesh->verts[i];
        printf("P%d|%d|%d|%d|%d|%d\n",curved,quantized(p->xyz[0]),quantized(p->xyz[1]),quantized(p->xyz[2]),quantized(p->st[0]),p->color[0]);
    }
}
int main(void){
 drawVert_t grid[MAX_GRID_SIZE][MAX_GRID_SIZE];memset(grid,0,sizeof(grid));
 for(int y=0;y<5;y++)for(int x=0;x<5;x++){
  float u=x*.25f,v=y*.25f;
  grid[y][x].xyz[0]=u*2.0f;grid[y][x].xyz[1]=v*2.0f;
  grid[y][x].xyz[2]=32.0f*(2.0f*u*(1.0f-u))*(2.0f*v*(1.0f-v));
 }
 MakeMeshNormals(5,5,grid);
 for(int y=0;y<5;y++)for(int x=0;x<5;x++)printf("N%d%d|%d|%d|%d\n",y,x,quantized(grid[y][x].normal[0]),quantized(grid[y][x].normal[1]),quantized(grid[y][x].normal[2]));
 {
  static const float cx[5]={1,0,-1,0,1},cz[5]={0,1,0,-1,0};memset(grid,0,sizeof(grid));
  for(int y=0;y<5;y++)for(int x=0;x<5;x++){grid[y][x].xyz[0]=cx[x];grid[y][x].xyz[1]=(float)y;grid[y][x].xyz[2]=cz[x];}
  MakeMeshNormals(5,5,grid);
  for(int y=0;y<5;y++)for(int x=0;x<5;x++)printf("W%d%d|%d|%d|%d\n",y,x,quantized(grid[y][x].normal[0]),quantized(grid[y][x].normal[1]),quantized(grid[y][x].normal[2]));
 }
 {
  static const float p[5]={0,0,1,2,2};memset(grid,0,sizeof(grid));
  for(int y=0;y<5;y++)for(int x=0;x<5;x++){grid[y][x].xyz[0]=p[x];grid[y][x].xyz[1]=p[y];grid[y][x].xyz[2]=0;}
  MakeMeshNormals(5,5,grid);
  for(int y=0;y<5;y++)for(int x=0;x<5;x++)printf("D%d%d|%d|%d|%d\n",y,x,quantized(grid[y][x].normal[0]),quantized(grid[y][x].normal[1]),quantized(grid[y][x].normal[2]));
 }
 emitPatch(0);
 emitPatch(1);
 return 0;
}
