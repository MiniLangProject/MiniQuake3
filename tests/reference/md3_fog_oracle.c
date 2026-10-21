/* Host for unchanged R_ComputeFogNum from renderer/tr_mesh.c. */
#include <stddef.h>
#include <stdio.h>
#include <string.h>
typedef unsigned char byte;
typedef float vec3_t[3];
typedef struct { vec3_t bounds[2],localOrigin;float radius;char name[16]; } md3Frame_t;
typedef struct { int ident,version;char name[64];int flags,numFrames,numTags,numSurfaces,numSkins,ofsFrames; } md3Header_t;
typedef struct { vec3_t bounds[2]; } fog_t;
typedef struct { int numfogs;fog_t *fogs; } world_t;
typedef struct { struct { int frame;vec3_t origin; } e; } trRefEntity_t;
typedef struct { struct { int rdflags; } refdef;world_t *world; } trGlobals_t;
static trGlobals_t tr;
#define RDF_NOWORLDMODEL 1
#define VectorAdd(a,b,c) ((c)[0]=(a)[0]+(b)[0],(c)[1]=(a)[1]+(b)[1],(c)[2]=(a)[2]+(b)[2])
#include "md3_fog_under_test.inc"
typedef struct { md3Header_t header;md3Frame_t frames[2]; } Blob;
static void bounds(fog_t *fog,float minx,float miny,float minz,float maxx,float maxy,float maxz) {
 fog->bounds[0][0]=minx;fog->bounds[0][1]=miny;fog->bounds[0][2]=minz;
 fog->bounds[1][0]=maxx;fog->bounds[1][1]=maxy;fog->bounds[1][2]=maxz;
}
static void emit(const char *name,Blob *blob,int frame,float x,float y,float z,int noWorld,int fogCount) {
 trRefEntity_t ent;memset(&ent,0,sizeof(ent));ent.e.frame=frame;ent.e.origin[0]=x;ent.e.origin[1]=y;ent.e.origin[2]=z;tr.refdef.rdflags=noWorld?RDF_NOWORLDMODEL:0;tr.world->numfogs=fogCount;
 printf("%s|N%d\n",name,R_ComputeFogNum(&blob->header,&ent));
}
int main(void) {
 Blob blob;fog_t fogs[3];world_t world;memset(&blob,0,sizeof(blob));memset(fogs,0,sizeof(fogs));memset(&tr,0,sizeof(tr));
 blob.header.ofsFrames=(int)offsetof(Blob,frames);blob.frames[0].localOrigin[0]=1;blob.frames[0].localOrigin[1]=2;blob.frames[0].localOrigin[2]=3;blob.frames[0].radius=2;
 blob.frames[1].localOrigin[0]=-5;blob.frames[1].radius=1;
 bounds(&fogs[1],0,0,0,10,10,10);bounds(&fogs[2],-20,-20,-20,20,20,20);world.fogs=fogs;world.numfogs=3;tr.world=&world;
 emit("first-wins",&blob,0,0,0,0,0,3);
 emit("outside",&blob,0,30,30,30,0,3);
 emit("touch-max",&blob,0,11,-2,-3,0,2);
 emit("touch-min",&blob,0,-3,-2,-3,0,2);
 emit("frame-select",&blob,1,13,5,5,0,2);
 emit("no-world",&blob,0,0,0,0,1,3);
 return 0;
}
