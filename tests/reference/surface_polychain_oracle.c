/* Host for unchanged RB_SurfacePolychain extracted from renderer/tr_surface.c. */
#include <stdio.h>
#include <string.h>
typedef unsigned char byte;
typedef float vec3_t[3];
typedef struct { vec3_t xyz; float st[2]; byte modulate[4]; } polyVert_t;
typedef struct { int surfaceType; int hShader; int fogIndex; int numVerts; polyVert_t verts[8]; } srfPoly_t;
typedef struct {
 int numVertexes, numIndexes;
 float xyz[64][4];
 float texCoords[64][2][2];
 byte vertexColors[64][4];
 int indexes[256];
} shaderCommands_t;
static shaderCommands_t tess;
#define VectorCopy(a,b) ((b)[0]=(a)[0],(b)[1]=(a)[1],(b)[2]=(a)[2])
static void RB_CheckOverflow(int vertices,int indexes) { (void)vertices; (void)indexes; }
#define RB_CHECKOVERFLOW(v,i) RB_CheckOverflow((v),(i))
#include "surface_polychain_under_test.inc"

static void add(srfPoly_t *p,int i,int x,int y,int z,int s,int t,int color) {
 p->verts[i].xyz[0]=x*.5f;p->verts[i].xyz[1]=y*.5f;p->verts[i].xyz[2]=z*.5f;
 p->verts[i].st[0]=s*.5f;p->verts[i].st[1]=t*.5f;
 p->verts[i].modulate[0]=(byte)color;p->verts[i].modulate[1]=(byte)(color+1);
 p->verts[i].modulate[2]=(byte)(color+2);p->verts[i].modulate[3]=(byte)(color+3);
}
static void emit(const char *name,int firstVertex,int firstIndex) {
 int i;printf("%s|V%d|I%d",name,tess.numVertexes,tess.numIndexes);
 for(i=firstVertex;i<tess.numVertexes;i++) printf("|P%d,%d,%d|T%d,%d|C%d,%d,%d,%d",(int)(tess.xyz[i][0]*2),(int)(tess.xyz[i][1]*2),(int)(tess.xyz[i][2]*2),(int)(tess.texCoords[i][0][0]*2),(int)(tess.texCoords[i][0][1]*2),tess.vertexColors[i][0],tess.vertexColors[i][1],tess.vertexColors[i][2],tess.vertexColors[i][3]);
 for(i=firstIndex;i<tess.numIndexes;i++) printf("|%d",tess.indexes[i]);putchar('\n');
}
int main(void) {
 srfPoly_t p;memset(&tess,0,sizeof(tess));memset(&p,0,sizeof(p));p.numVerts=3;
 add(&p,0,0,0,0,0,0,10);add(&p,1,2,0,0,2,0,20);add(&p,2,0,2,0,0,2,30);RB_SurfacePolychain(&p);emit("tri",0,0);
 memset(&tess,0,sizeof(tess));memset(&p,0,sizeof(p));p.numVerts=5;
 add(&p,0,-2,0,2,0,0,40);add(&p,1,0,-2,2,2,0,44);add(&p,2,2,0,2,4,2,48);add(&p,3,0,2,2,2,4,52);add(&p,4,-2,2,2,0,4,56);RB_SurfacePolychain(&p);emit("pent",0,0);
 memset(&tess,0,sizeof(tess));memset(&p,0,sizeof(p));p.numVerts=3;add(&p,0,0,0,0,0,0,1);add(&p,1,2,0,0,2,0,5);add(&p,2,0,2,0,0,2,9);RB_SurfacePolychain(&p);
 memset(&p,0,sizeof(p));p.numVerts=4;add(&p,0,4,0,0,0,0,70);add(&p,1,6,0,0,2,0,74);add(&p,2,6,2,0,2,2,78);add(&p,3,4,2,0,0,2,82);RB_SurfacePolychain(&p);emit("append",3,3);
 return 0;
}
