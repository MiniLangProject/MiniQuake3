/* Host for unchanged R_TransformDlights/R_DlightBmodel from tr_light.c. */
#include <stdint.h>
#include <stdio.h>
#include <string.h>
typedef int qboolean;
typedef float vec3_t[3];
typedef struct { vec3_t origin,transformed; float radius; } dlight_t;
typedef struct { vec3_t origin; vec3_t axis[3]; } orientationr_t;
typedef enum { SF_BAD=0,SF_FACE=1,SF_GRID=2,SF_TRIANGLES=3 } surfaceType_t;
typedef struct { surfaceType_t surfaceType; int dlightBits[2]; } srfSurfaceFace_t;
typedef srfSurfaceFace_t srfGridMesh_t;
typedef srfSurfaceFace_t srfTriangles_t;
typedef struct { surfaceType_t *data; } msurface_t;
typedef struct { vec3_t bounds[2]; msurface_t *firstSurface; int numSurfaces; } bmodel_t;
typedef struct { qboolean needDlights; } trRefEntity_t;
typedef struct { int num_dlights; dlight_t *dlights; } trRefdef_t;
typedef struct { trRefdef_t refdef; orientationr_t or; trRefEntity_t *currentEntity; int smpFrame; } trGlobals_t;
static trGlobals_t tr;
#define VectorSubtract(a,b,o) ((o)[0]=(a)[0]-(b)[0],(o)[1]=(a)[1]-(b)[1],(o)[2]=(a)[2]-(b)[2])
#define DotProduct(a,b) ((a)[0]*(b)[0]+(a)[1]*(b)[1]+(a)[2]*(b)[2])
#include "playable_dynamic_lights_under_test.inc"
static uint32_t bits(float f){uint32_t u;memcpy(&u,&f,4);return u;}
static void run(const char *name,const orientationr_t *orientation,const vec3_t bounds[2],dlight_t *lights,int count){
 srfSurfaceFace_t face={SF_FACE,{0,0}};msurface_t surface={&face.surfaceType};bmodel_t model;trRefEntity_t entity={0};
 memset(&model,0,sizeof(model));memcpy(model.bounds,bounds,sizeof(model.bounds));model.firstSurface=&surface;model.numSurfaces=1;
 memset(&tr,0,sizeof(tr));tr.refdef.num_dlights=count;tr.refdef.dlights=lights;tr.or=*orientation;tr.currentEntity=&entity;tr.smpFrame=1;
 R_DlightBmodel(&model);printf("%s|%d|%d",name,face.dlightBits[1],entity.needDlights);
 for(int i=0;i<count;i++)printf("|%08x,%08x,%08x",bits(lights[i].transformed[0]),bits(lights[i].transformed[1]),bits(lights[i].transformed[2]));
 printf("\n");
}
int main(void){
 orientationr_t identity={0};identity.axis[0][0]=identity.axis[1][1]=identity.axis[2][2]=1;
 vec3_t bounds[2]={{-1,-1,-1},{1,1,1}};
 dlight_t first[4]={{{0,0,0},{0},1},{{2,0,0},{0},1},{{2.01f,0,0},{0},1},{{0,-2,0},{0},1}};run("I",&identity,bounds,first,4);
 orientationr_t rotated={0};rotated.origin[0]=10;rotated.origin[1]=20;rotated.axis[0][1]=1;rotated.axis[1][0]=-1;rotated.axis[2][2]=1;
 dlight_t second[3]={{{7,22,0},{0},2.0f},{{7,22,0},{0},2.01f},{{10,20,5},{0},3.99f}};run("R",&rotated,bounds,second,3);
 return 0;
}
