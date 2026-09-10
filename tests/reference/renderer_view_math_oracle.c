/* Host for unchanged view/transform/culling functions from renderer/tr_main.c. */
#include <stdint.h>
#include <stdio.h>
#include <string.h>
typedef int qboolean;
typedef float vec3_t[3];
typedef float vec4_t[4];
typedef struct { vec3_t normal; float dist; } cplane_t;
typedef struct { int viewportWidth,viewportHeight; cplane_t frustum[4]; } viewParms_t;
typedef struct { vec3_t origin; vec3_t axis[3]; } orientationr_t;
typedef struct { orientationr_t or; viewParms_t viewParms; } trGlobals_t;
typedef struct { int integer; } cvar_t;
#define qfalse 0
#define qtrue 1
#define CULL_IN 0
#define CULL_CLIP 1
#define CULL_OUT 2
#define DotProduct(x,y) ((x)[0]*(y)[0]+(x)[1]*(y)[1]+(x)[2]*(y)[2])
#define VectorCopy(a,b) ((b)[0]=(a)[0],(b)[1]=(a)[1],(b)[2]=(a)[2])
#define VectorMA(v,s,b,o) ((o)[0]=(v)[0]+(s)*(b)[0],(o)[1]=(v)[1]+(s)*(b)[1],(o)[2]=(v)[2]+(s)*(b)[2])
static trGlobals_t tr;
static cvar_t nocull;
static cvar_t *r_nocull=&nocull;
void R_LocalPointToWorld(vec3_t local,vec3_t world);
int R_CullPointAndRadius(vec3_t pt,float radius);
#include "renderer_view_math_under_test.inc"
static uint32_t bits(float f){uint32_t u;memcpy(&u,&f,4);return u;}
static void v3(const char *name,const float *v){printf("%s|%08x|%08x|%08x\n",name,bits(v[0]),bits(v[1]),bits(v[2]));}
static void setup(void){
 memset(&tr,0,sizeof(tr));tr.or.origin[0]=10;tr.or.origin[1]=-5;tr.or.origin[2]=2;
 tr.or.axis[0][1]=1;tr.or.axis[1][0]=-1;tr.or.axis[2][2]=1;
 tr.viewParms.viewportWidth=640;tr.viewParms.viewportHeight=480;
 tr.viewParms.frustum[0].normal[0]=1;tr.viewParms.frustum[0].dist=-10;
 tr.viewParms.frustum[1].normal[0]=-1;tr.viewParms.frustum[1].dist=-10;
 tr.viewParms.frustum[2].normal[1]=1;tr.viewParms.frustum[2].dist=-10;
 tr.viewParms.frustum[3].normal[1]=-1;tr.viewParms.frustum[3].dist=-10;
}
int main(void){
 vec3_t p={2.5f,-3.0f,4.25f},out;vec4_t eye,clip,norm={0},win={0};
 float model[16]={1,0,0,0, 0,2,0,0, 0,0,-1,0, 3,-4,5,1};
 float projection[16]={2,0,0,0, 0,3,0,0, 0,0,.5f,1, 0,0,-2,0};
 vec4_t clipIn={-1.0f,.5f,2.0f,4.0f};vec3_t sphere;
 vec3_t inside[2]={{-1,-1,-1},{1,1,1}},edge[2]={{8,-1,-1},{12,1,1}},outside[2]={{12,-1,-1},{14,1,1}};
 setup();R_LocalNormalToWorld(p,out);v3("N",out);R_LocalPointToWorld(p,out);v3("P",out);R_WorldToLocal(p,out);v3("W",out);
 R_TransformModelToClip(p,model,projection,eye,clip);v3("E",eye);printf("C|%08x|%08x|%08x|%08x\n",bits(clip[0]),bits(clip[1]),bits(clip[2]),bits(clip[3]));
 R_TransformClipToWindow(clipIn,&tr.viewParms,norm,win);v3("Z",norm);v3("V",win);
 sphere[0]=0;sphere[1]=0;sphere[2]=0;printf("S|%d",R_CullPointAndRadius(sphere,1));sphere[0]=9.5f;printf("|%d",R_CullPointAndRadius(sphere,1));sphere[0]=12;printf("|%d\n",R_CullPointAndRadius(sphere,1));
 printf("B|%d|%d|%d\n",R_CullLocalBox(inside),R_CullLocalBox(edge),R_CullLocalBox(outside));
 sphere[0]=0;sphere[1]=0;sphere[2]=0;printf("L|%d\n",R_CullLocalPointAndRadius(sphere,1));
 nocull.integer=1;printf("X|%d|%d\n",R_CullPointAndRadius(sphere,1),R_CullLocalBox(outside));
 return 0;
}
