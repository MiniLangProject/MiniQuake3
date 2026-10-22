#include <stdint.h>
#include <stdio.h>
#include <string.h>

typedef float vec3_t[3];
typedef struct { vec3_t origin; vec3_t axis[3]; } orientationr_t;
typedef struct { orientationr_t or; } viewParms_t;
typedef struct { orientationr_t or; viewParms_t viewParms; } backEndState_t;
typedef struct { float value; } cvar_t;
static backEndState_t backEnd;
static cvar_t lodCurveError;
static cvar_t *r_lodCurveError=&lodCurveError;
#define VectorSubtract(a,b,c) do {(c)[0]=(a)[0]-(b)[0];(c)[1]=(a)[1]-(b)[1];(c)[2]=(a)[2]-(b)[2];} while(0)
#define DotProduct(a,b) ((a)[0]*(b)[0]+(a)[1]*(b)[1]+(a)[2]*(b)[2])
#include "tr_surface_complete_under_test.inc"

static uint32_t bits(float value){union{float f;uint32_t u;}cast;cast.f=value;return cast.u;}
static void identity(float axis[3][3]){memset(axis,0,9*sizeof(float));axis[0][0]=axis[1][1]=axis[2][2]=1.0f;}
static void emit(const char *name,float local[3],float radius){printf("%s|%08x\n",name,bits(LodErrorForVolume(local,radius)));}
int main(void){
 float zero[3]={0,0,0}, point[3]={2.25f,-3.5f,4.75f};
 memset(&backEnd,0,sizeof(backEnd));identity(backEnd.or.axis);identity(backEnd.viewParms.or.axis);lodCurveError.value=8.0f;
 backEnd.or.origin[0]=12.0f;emit("front",zero,2.0f);
 backEnd.or.origin[0]=-12.0f;emit("behind",zero,2.0f);
 backEnd.or.origin[0]=12.0f;emit("clamp",zero,20.0f);
 lodCurveError.value=-1.0f;emit("negative",point,2.0f);
 lodCurveError.value=13.25f;backEnd.or.origin[0]=5.5f;backEnd.or.origin[1]=-2.0f;backEnd.or.origin[2]=7.0f;
 backEnd.or.axis[0][0]=0;backEnd.or.axis[0][1]=1;backEnd.or.axis[1][0]=-1;backEnd.or.axis[1][1]=0;
 backEnd.viewParms.or.origin[0]=-10.0f;backEnd.viewParms.or.origin[1]=3.0f;backEnd.viewParms.or.origin[2]=1.0f;
 backEnd.viewParms.or.axis[0][0]=0.6f;backEnd.viewParms.or.axis[0][1]=0.8f;backEnd.viewParms.or.axis[0][2]=0.0f;
 emit("oriented",point,1.125f);
 return 0;
}
