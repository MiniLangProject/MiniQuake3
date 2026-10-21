/* Host for unchanged R_CullModel from renderer/tr_mesh.c. */
#include <stddef.h>
#include <stdio.h>
#include <string.h>
typedef unsigned char byte;
typedef float vec3_t[3];
typedef struct { vec3_t bounds[2],localOrigin;float radius;char name[16]; } md3Frame_t;
typedef struct { int ident,version;char name[64];int flags,numFrames,numTags,numSurfaces,numSkins,ofsFrames; } md3Header_t;
typedef struct { struct { int frame,oldframe,nonNormalizedAxes; } e; } trRefEntity_t;
typedef struct { int c_sphere_cull_md3_out,c_sphere_cull_md3_in,c_sphere_cull_md3_clip,c_box_cull_md3_out,c_box_cull_md3_in,c_box_cull_md3_clip; } counters_t;
typedef struct { counters_t pc; } trGlobals_t;
static trGlobals_t tr;static int boxResult;
#define CULL_IN 0
#define CULL_CLIP 1
#define CULL_OUT 2
static int R_CullLocalPointAndRadius(vec3_t point,float radius) {(void)radius;return (int)point[0];}
static int R_CullLocalBox(vec3_t bounds[2]) {(void)bounds;return boxResult;}
#include "md3_cull_under_test.inc"
typedef struct { md3Header_t header;md3Frame_t frames[2]; } Blob;
static void emit(const char *name,Blob *blob,int frame,int oldframe,int nonNormalized,int newResult,int oldResult,int box) {
 trRefEntity_t ent;memset(&ent,0,sizeof(ent));blob->frames[frame].localOrigin[0]=(float)newResult;blob->frames[oldframe].localOrigin[0]=(float)oldResult;ent.e.frame=frame;ent.e.oldframe=oldframe;ent.e.nonNormalizedAxes=nonNormalized;boxResult=box;
 printf("%s|C%d\n",name,R_CullModel(&blob->header,&ent));
}
int main(void) {
 Blob blob;memset(&blob,0,sizeof(blob));blob.header.ofsFrames=(int)offsetof(Blob,frames);
 emit("same-out",&blob,0,0,0,CULL_OUT,CULL_OUT,CULL_IN);
 emit("same-in",&blob,0,0,0,CULL_IN,CULL_IN,CULL_OUT);
 emit("same-clip-box-out",&blob,0,0,0,CULL_CLIP,CULL_CLIP,CULL_OUT);
 emit("pair-both-out",&blob,0,1,0,CULL_OUT,CULL_OUT,CULL_IN);
 emit("pair-disagree-box-in",&blob,0,1,0,CULL_OUT,CULL_IN,CULL_IN);
 emit("scaled-box-clip",&blob,0,0,1,CULL_OUT,CULL_OUT,CULL_CLIP);
 return 0;
}
