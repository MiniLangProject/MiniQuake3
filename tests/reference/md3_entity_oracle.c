/* Host for unchanged ProjectRadius and R_ComputeLOD from renderer/tr_mesh.c. */
#include <math.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
typedef unsigned char byte;
typedef float vec3_t[3];
typedef struct { vec3_t bounds[2],localOrigin;float radius;char name[16]; } md3Frame_t;
typedef struct { int ident,version;char name[64];int flags,numFrames,numTags,numSurfaces,numSkins,ofsFrames; } md3Header_t;
typedef struct { int numLods;md3Header_t *md3[4]; } model_t;
typedef struct { vec3_t origin;vec3_t axis[3]; } orientation_t;
typedef struct { orientation_t or;float projectionMatrix[16]; } viewParms_t;
typedef struct { model_t *currentModel;viewParms_t viewParms; } trGlobals_t;
typedef struct { float value;int integer; } cvar_t;
typedef struct { struct { int frame,oldframe;vec3_t origin;int renderfx; } e; } trRefEntity_t;
static trGlobals_t tr;
static cvar_t lodscaleValue,lodbiasValue;
static cvar_t *r_lodscale=&lodscaleValue,*r_lodbias=&lodbiasValue;
#define DotProduct(a,b) ((a)[0]*(b)[0]+(a)[1]*(b)[1]+(a)[2]*(b)[2])
#define myftol(x) ((int)(x))
static float RadiusFromBounds(const vec3_t mins,const vec3_t maxs) {
 vec3_t corner;int i;for(i=0;i<3;i++){float a=fabsf(mins[i]),b=fabsf(maxs[i]);corner[i]=a>b?a:b;}
 return sqrtf(DotProduct(corner,corner));
}
#include "md3_entity_under_test.inc"

typedef struct { md3Header_t header;md3Frame_t frames[2]; } Blob;
typedef struct { int frame,oldframe,wrapped,repaired; } Frames;
static Frames normalize(int count,int frame,int oldframe,int renderfx) {
 Frames out;if(renderfx&512){frame%=count;oldframe%=count;out.wrapped=1;}else out.wrapped=0;
 out.repaired=0;if(frame>=count||frame<0||oldframe>=count||oldframe<0){frame=oldframe=0;out.repaired=1;}
 out.frame=frame;out.oldframe=oldframe;return out;
}
static uint32_t bits(float x){uint32_t u;memcpy(&u,&x,4);return u;}
static void emit(const char *name,Blob *blob,int lods,float x,float scale,int bias,int frame,int oldframe,int flags) {
 trRefEntity_t e;Frames f;float p;memset(&e,0,sizeof(e));tr.currentModel->numLods=lods;e.e.frame=0;e.e.origin[0]=x;
 r_lodscale->value=scale;r_lodbias->integer=bias;
 p=ProjectRadius(RadiusFromBounds(blob->frames[0].bounds[0],blob->frames[0].bounds[1]),e.e.origin);
 f=normalize(blob->header.numFrames,frame,oldframe,flags);
 printf("%s|P%08x|L%d|F%d,%d,%d,%d\n",name,bits(p),R_ComputeLOD(&e),f.frame,f.oldframe,f.wrapped,f.repaired);
}
int main(void) {
 Blob blob;model_t model;memset(&blob,0,sizeof(blob));memset(&model,0,sizeof(model));memset(&tr,0,sizeof(tr));
 blob.header.numFrames=2;blob.header.ofsFrames=(int)offsetof(Blob,frames);blob.frames[0].bounds[0][0]=-3;blob.frames[0].bounds[0][1]=-4;blob.frames[0].bounds[1][0]=3;blob.frames[0].bounds[1][1]=4;
 model.md3[0]=&blob.header;tr.currentModel=&model;tr.viewParms.or.axis[0][0]=1;tr.viewParms.projectionMatrix[5]=1;tr.viewParms.projectionMatrix[11]=-1;
 emit("far",&blob,3,100,5,0,5,4,512);
 emit("middle",&blob,3,25,2,0,1,0,0);
 emit("near",&blob,3,2,5,0,2,1,512);
 emit("behind",&blob,3,-20,5,1,-1,8,512);
 emit("scale-cap",&blob,4,100,99,-1,7,6,0);
 emit("single",&blob,1,100,5,9,8,-2,0);
 return 0;
}
