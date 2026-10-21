/* Host for unchanged R_GetPortalOrientations/R_MirrorPoint/R_MirrorVector. */
#include <assert.h>
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
typedef int qboolean;typedef float vec_t;typedef float vec3_t[3];
#define qtrue 1
#define qfalse 0
#define RT_PORTALSURFACE 7
#define ENTITYNUM_WORLD 1022
#define DotProduct(a,b) ((a)[0]*(b)[0]+(a)[1]*(b)[1]+(a)[2]*(b)[2])
#define CrossProduct(a,b,o) ((o)[0]=(a)[1]*(b)[2]-(a)[2]*(b)[1],(o)[1]=(a)[2]*(b)[0]-(a)[0]*(b)[2],(o)[2]=(a)[0]*(b)[1]-(a)[1]*(b)[0])
#define VectorCopy(a,b) ((b)[0]=(a)[0],(b)[1]=(a)[1],(b)[2]=(a)[2])
#define VectorClear(a) ((a)[0]=0,(a)[1]=0,(a)[2]=0)
#define VectorScale(a,s,o) ((o)[0]=(a)[0]*(s),(o)[1]=(a)[1]*(s),(o)[2]=(a)[2]*(s))
#define VectorAdd(a,b,o) ((o)[0]=(a)[0]+(b)[0],(o)[1]=(a)[1]+(b)[1],(o)[2]=(a)[2]+(b)[2])
#define VectorSubtract(a,b,o) ((o)[0]=(a)[0]-(b)[0],(o)[1]=(a)[1]-(b)[1],(o)[2]=(a)[2]-(b)[2])
#define VectorMA(a,s,b,o) ((o)[0]=(a)[0]+(s)*(b)[0],(o)[1]=(a)[1]+(s)*(b)[1],(o)[2]=(a)[2]+(s)*(b)[2])
#define AxisCopy(a,b) (VectorCopy((a)[0],(b)[0]),VectorCopy((a)[1],(b)[1]),VectorCopy((a)[2],(b)[2]))
#define M_PI 3.14159265358979323846f
#define DEG2RAD(a) (((a)*M_PI)/180.0F)
#define Q_fabs(a) fabsf(a)
static const vec3_t vec3_origin={0,0,0};
#include "portal_math_under_test.inc"
typedef struct { vec3_t origin;vec3_t axis[3]; } orientation_t;
typedef orientation_t orientationr_t;
typedef struct { vec3_t normal;float dist; } cplane_t;
typedef int surfaceType_t;typedef struct { surfaceType_t *surface; } drawSurf_t;
typedef struct { int reType;vec3_t origin,oldorigin;vec3_t axis[3];int oldframe,frame,skinNum; } refEntity_t;
typedef struct { refEntity_t e; } trRefEntity_t;
typedef struct { int num_entities,time;trRefEntity_t entities[4]; } refdef_t;
typedef struct { orientation_t or; } viewParms_t;
typedef struct { int currentEntityNum;trRefEntity_t *currentEntity;refdef_t refdef;viewParms_t viewParms;orientationr_t or; } trGlobals_t;
static trGlobals_t tr;static cplane_t sourcePlane;
static void R_PlaneForSurface(surfaceType_t *surface,cplane_t *plane){(void)surface;*plane=sourcePlane;}
static void R_RotateForEntity(const trRefEntity_t *entity,const viewParms_t *view,orientationr_t *out){(void)entity;(void)view;memset(out,0,sizeof(*out));out->axis[0][0]=out->axis[1][1]=out->axis[2][2]=1;}
static void R_LocalNormalToWorld(vec3_t local,vec3_t world){VectorCopy(local,world);}
#include "portal_view_under_test.inc"
static uint32_t bits(float x){uint32_t u;memcpy(&u,&x,4);return u;}
static void axisIdentity(vec3_t axis[3]){memset(axis,0,sizeof(vec3_t)*3);axis[0][0]=axis[1][1]=axis[2][2]=1;}
static void emit3(const vec3_t v){printf("%08x,%08x,%08x",bits(v[0]),bits(v[1]),bits(v[2]));}
static void run(const char *name,refEntity_t entity,int time){drawSurf_t draw;surfaceType_t type=0;orientation_t surface,camera;vec3_t pvs,point,forward;int mirror=-1,ok;memset(&tr,0,sizeof(tr));tr.refdef.num_entities=1;tr.refdef.time=time;tr.refdef.entities[0].e=entity;draw.surface=&type;ok=R_GetPortalOrientations(&draw,ENTITYNUM_WORLD,&surface,&camera,pvs,&mirror);printf("%s|O%d|M%d",name,ok,mirror);if(ok){R_MirrorPoint((vec3_t){1,2,3},&surface,&camera,point);R_MirrorVector((vec3_t){1,0,0},&surface,&camera,forward);printf("|S");emit3(surface.origin);printf("|C");emit3(camera.origin);printf("|P");emit3(pvs);printf("|V");emit3(point);printf("|F");emit3(forward);}putchar('\n');}
int main(void){refEntity_t e;memset(&sourcePlane,0,sizeof(sourcePlane));sourcePlane.normal[0]=1;sourcePlane.dist=5;memset(&e,0,sizeof(e));e.reType=RT_PORTALSURFACE;e.origin[0]=5;e.origin[1]=2;e.origin[2]=3;VectorCopy(e.origin,e.oldorigin);axisIdentity(e.axis);run("mirror",e,1000);e.origin[1]=10;e.oldorigin[0]=100;e.oldorigin[1]=20;e.oldorigin[2]=30;e.skinNum=90;run("camera",e,1000);e.origin[0]=80;run("missing",e,1000);return 0;}
