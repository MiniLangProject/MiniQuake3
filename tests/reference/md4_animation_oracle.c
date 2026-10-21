/* Focused host for the unchanged RB_SurfaceAnim body. */
#include <stdio.h>
#include <string.h>
typedef unsigned char byte;
#define MD4_MAX_BONES 128
typedef float vec2_t[2];
typedef float vec3_t[3];
typedef struct { float matrix[3][4]; } md4Bone_t;
typedef struct { int boneIndex; float boneWeight; vec3_t offset; } md4Weight_t;
typedef struct { vec3_t normal; vec2_t texCoords; int numWeights; md4Weight_t weights[1]; } md4Vertex_t;
typedef struct { md4Bone_t bones[1]; } md4Frame_t;
typedef struct { int numBones; int ofsFrames; int ofsLODs; } md4Header_t;
typedef struct { int numSurfaces; int ofsSurfaces; } md4LOD_t;
typedef struct { int ofsHeader; int numVerts; int numTriangles; int ofsTriangles; int ofsVerts; int shaderIndex; int ofsEnd; } md4Surface_t;
typedef struct { int oldframe,frame; float backlerp; } refEntity_t;
typedef struct { refEntity_t e; } trRefEntity_t;
static trRefEntity_t entity;
static struct { trRefEntity_t *currentEntity; } backEnd={&entity};
static struct { int numIndexes,numVertexes; int indexes[16]; float xyz[16][4],normal[16][4],texCoords[16][2][2]; } tess;
#define VectorClear(v) ((v)[0]=(v)[1]=(v)[2]=0.0f)
#define DotProduct(a,b) ((a)[0]*(b)[0]+(a)[1]*(b)[1]+(a)[2]*(b)[2])
static void RB_CheckOverflow(int verts,int indexes){(void)verts;(void)indexes;}
#include "md4_animation_under_test.inc"
int main(void){
  byte storage[1024];md4Header_t *header=(md4Header_t*)storage;header->numBones=1;header->ofsFrames=(int)sizeof(*header);
  md4Frame_t *oldFrame=(md4Frame_t*)(storage+header->ofsFrames);md4Frame_t *frame=oldFrame+1;
  memset(oldFrame,0,sizeof(*oldFrame));memset(frame,0,sizeof(*frame));
  oldFrame->bones[0].matrix[0][0]=oldFrame->bones[0].matrix[1][1]=oldFrame->bones[0].matrix[2][2]=1.0f;oldFrame->bones[0].matrix[0][3]=2.0f;
  frame->bones[0].matrix[0][0]=frame->bones[0].matrix[1][1]=frame->bones[0].matrix[2][2]=1.0f;frame->bones[0].matrix[0][3]=10.0f;
  md4Surface_t *surface=(md4Surface_t*)(frame+1);memset(surface,0,sizeof(*surface));surface->ofsHeader=(int)(storage-(byte*)surface);surface->numVerts=1;surface->numTriangles=1;surface->ofsTriangles=(int)sizeof(*surface);surface->ofsVerts=surface->ofsTriangles+3*(int)sizeof(int);
  int *triangles=(int*)((byte*)surface+surface->ofsTriangles);triangles[0]=triangles[1]=triangles[2]=0;
  md4Vertex_t *vertex=(md4Vertex_t*)((byte*)surface+surface->ofsVerts);memset(vertex,0,sizeof(*vertex));vertex->normal[0]=1.0f;vertex->texCoords[0]=0.25f;vertex->texCoords[1]=0.75f;vertex->numWeights=1;vertex->weights[0].boneIndex=0;vertex->weights[0].boneWeight=1.0f;vertex->weights[0].offset[0]=2.0f;vertex->weights[0].offset[1]=3.0f;vertex->weights[0].offset[2]=4.0f;
  entity.e.oldframe=0;entity.e.frame=1;entity.e.backlerp=0.25f;RB_SurfaceAnim(surface);
  printf("%g,%g,%g|%g,%g,%g|%g,%g|%d,%d,%d\n",tess.xyz[0][0],tess.xyz[0][1],tess.xyz[0][2],tess.normal[0][0],tess.normal[0][1],tess.normal[0][2],tess.texCoords[0][0][0],tess.texCoords[0][0][1],tess.indexes[0],tess.indexes[1],tess.indexes[2]);return 0;
}
