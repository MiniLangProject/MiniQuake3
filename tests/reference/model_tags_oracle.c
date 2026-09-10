/* Host for unchanged R_GetTag, R_LerpTag and R_ModelBounds from tr_model.c. */
#include <math.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
typedef unsigned char byte;
typedef int qboolean;
typedef int qhandle_t;
typedef float vec3_t[3];
#define qtrue 1
#define qfalse 0
typedef struct { char name[64]; vec3_t origin; vec3_t axis[3]; } md3Tag_t;
typedef struct { vec3_t bounds[2]; } md3Frame_t;
typedef struct { int numFrames,numTags,ofsTags,ofsFrames; } md3Header_t;
typedef struct { vec3_t bounds[2]; } bmodel_t;
typedef struct { md3Header_t *md3[1]; bmodel_t *bmodel; } model_t;
typedef struct { vec3_t origin; vec3_t axis[3]; } orientation_t;
static model_t models[3];
static model_t *R_GetModelByHandle(qhandle_t h) { return &models[h]; }
#define VectorCopy(a,b) ((b)[0]=(a)[0],(b)[1]=(a)[1],(b)[2]=(a)[2])
#define VectorClear(a) ((a)[0]=0,(a)[1]=0,(a)[2]=0)
#define AxisClear(a) (VectorClear((a)[0]),VectorClear((a)[1]),VectorClear((a)[2]),(a)[0][0]=1,(a)[1][1]=1,(a)[2][2]=1)
static float VectorNormalize(vec3_t v) { float n=sqrtf(v[0]*v[0]+v[1]*v[1]+v[2]*v[2]); if(n){float q=1.0f/n;v[0]*=q;v[1]*=q;v[2]*=q;} return n; }
#include "model_tags_under_test.inc"

typedef struct { md3Header_t h; md3Tag_t tags[4]; md3Frame_t frame; } Blob;
static uint32_t bits(float x) { uint32_t u; memcpy(&u,&x,4); return u; }
static void settag(md3Tag_t *t,const char *name,float x,float y,float z,float angle) {
 float c=cosf(angle),s=sinf(angle); memset(t,0,sizeof(*t)); strcpy(t->name,name);
 t->origin[0]=x;t->origin[1]=y;t->origin[2]=z;
 t->axis[0][0]=c;t->axis[0][1]=s;t->axis[1][0]=-s;t->axis[1][1]=c;t->axis[2][2]=1;
}
static void emit(const char *name,int ok,orientation_t *o) {
 int r,c; printf("%s|%d|%08x,%08x,%08x",name,ok,bits(o->origin[0]),bits(o->origin[1]),bits(o->origin[2]));
 for(r=0;r<3;r++)for(c=0;c<3;c++)printf(",%08x",bits(o->axis[r][c])); putchar('\n');
}
int main(void) {
 Blob b; bmodel_t brush; orientation_t o; vec3_t mins,maxs; memset(&b,0,sizeof(b));
 b.h.numFrames=2;b.h.numTags=2;b.h.ofsTags=(int)offsetof(Blob,tags);b.h.ofsFrames=(int)offsetof(Blob,frame);
 settag(&b.tags[0],"tag_weapon",0,2,4,0);settag(&b.tags[1],"tag_head",1,1,1,0);
 settag(&b.tags[2],"tag_weapon",4,6,8,1.5707963267948966f);settag(&b.tags[3],"tag_head",1,1,1,0);
 b.frame.bounds[0][0]=-4;b.frame.bounds[0][1]=-5;b.frame.bounds[0][2]=-6;b.frame.bounds[1][0]=7;b.frame.bounds[1][1]=8;b.frame.bounds[1][2]=9;
 models[0].md3[0]=&b.h;models[0].bmodel=0;
 emit("half",R_LerpTag(&o,0,0,1,.5f,"tag_weapon"),&o);
 emit("start",R_LerpTag(&o,0,0,1,0,"tag_weapon"),&o);
 emit("clamp",R_LerpTag(&o,0,9,8,.25f,"tag_weapon"),&o);
 emit("missing",R_LerpTag(&o,0,0,1,.5f,"missing"),&o);
 memset(&models[1],0,sizeof(models[1]));emit("nomodel",R_LerpTag(&o,1,0,0,0,"x"),&o);
 R_ModelBounds(0,mins,maxs);printf("md3bounds|%08x,%08x,%08x,%08x,%08x,%08x\n",bits(mins[0]),bits(mins[1]),bits(mins[2]),bits(maxs[0]),bits(maxs[1]),bits(maxs[2]));
 brush.bounds[0][0]=-1;brush.bounds[0][1]=-2;brush.bounds[0][2]=-3;brush.bounds[1][0]=1;brush.bounds[1][1]=2;brush.bounds[1][2]=3;models[2].bmodel=&brush;
 R_ModelBounds(2,mins,maxs);printf("brushbounds|%08x,%08x,%08x,%08x,%08x,%08x\n",bits(mins[0]),bits(mins[1]),bits(mins[2]),bits(maxs[0]),bits(maxs[1]),bits(maxs[2]));
 return 0;
}
