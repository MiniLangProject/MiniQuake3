#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
typedef int qboolean; typedef int qhandle_t; typedef int sfxHandle_t; typedef float vec3_t[3];
#define qtrue 1
#define qfalse 0
#define TR_STATIONARY 0
#define RT_SPRITE 2
#define VectorCopy(a,b) ((b)[0]=(a)[0],(b)[1]=(a)[1],(b)[2]=(a)[2])
#define VectorScale(a,s,b) ((b)[0]=(a)[0]*(s),(b)[1]=(a)[1]*(s),(b)[2]=(a)[2]*(s))
#define VectorMA(a,s,b,c) ((c)[0]=(a)[0]+(s)*(b)[0],(c)[1]=(a)[1]+(s)*(b)[1],(c)[2]=(a)[2]+(s)*(b)[2])
#define VectorSubtract(a,b,c) ((c)[0]=(a)[0]-(b)[0],(c)[1]=(a)[1]-(b)[1],(c)[2]=(a)[2]-(b)[2])
#define DotProduct(a,b) ((a)[0]*(b)[0]+(a)[1]*(b)[1]+(a)[2]*(b)[2])
#define VectorLength(a) sqrtf(DotProduct((a),(a)))
#define CrossProduct(a,b,c) ((c)[0]=(a)[1]*(b)[2]-(a)[2]*(b)[1],(c)[1]=(a)[2]*(b)[0]-(a)[0]*(b)[2],(c)[2]=(a)[0]*(b)[1]-(a)[1]*(b)[0])
#define M_PI 3.14159265358979323846f
#define NUMBER_SIZE 8
typedef struct { int trType,trTime,trDuration; vec3_t trBase,trDelta; } trajectory_t;
typedef struct { vec3_t normal; } cplane_t;
typedef struct { qboolean allsolid; float fraction; vec3_t endpos; cplane_t plane; } trace_t;
typedef struct { int reType,renderfx; vec3_t origin,lightingOrigin; float axis[3][3]; qboolean nonNormalizedAxes; float radius; unsigned char shaderRGBA[4]; qhandle_t hModel,customShader; float shaderTime; } refEntity_t;
typedef struct localEntity_s { struct localEntity_s *prev,*next; int leType,leFlags,startTime,endTime,fadeInTime; float lifeRate; trajectory_t pos,angles; float bounceFactor,color[4],radius,light; vec3_t lightColor; int leMarkType,leBounceSoundType; refEntity_t refEntity; } localEntity_t;
typedef struct { qhandle_t numberShaders[11]; } media_t;
typedef struct { media_t media; } cgs_t;
typedef struct { int time,frametime; struct { vec3_t vieworg; } refdef; } cg_t;
#define MAX_LOCAL_ENTITIES 512
static localEntity_t cg_localEntities[MAX_LOCAL_ENTITIES]; static localEntity_t cg_activeLocalEntities; static localEntity_t *cg_freeLocalEntities;
static cg_t cg; static cgs_t cgs; static int refs,lights; static float lastLight,lastRadius; static int lastType,lastAlpha,shaders[16],shaderCount; static vec3_t lastOrigin;
static void CG_Error(const char *text,...){ fprintf(stderr,"%s\n",text); exit(90); }
static void BG_EvaluateTrajectoryDelta(const trajectory_t *tr,int atTime,vec3_t out){ (void)atTime; VectorCopy(tr->trDelta,out); }
static void trap_R_AddRefEntityToScene(const refEntity_t *re){ refs++;lastRadius=re->radius;lastType=re->reType;lastAlpha=re->shaderRGBA[3];VectorCopy(re->origin,lastOrigin);if(shaderCount<16)shaders[shaderCount++]=re->customShader; }
static void trap_R_AddLightToScene(const vec3_t origin,float light,float r,float g,float b){ (void)origin;(void)r;(void)g;(void)b;lights++;lastLight=light; }
static float VectorNormalize(vec3_t v){ float length=VectorLength(v);if(length){float inverse=1.0f/length;VectorScale(v,inverse,v);}return length; }
#include "cgame_localents_under_test.inc"
static uint32_t bits(float value){ union {float f;uint32_t u;} v;v.f=value;return v.u; }
int main(void){
 localEntity_t *a,*b,*again,*le;trace_t trace;int i;
 CG_InitLocalEntities();a=CG_AllocLocalEntity();b=CG_AllocLocalEntity();CG_FreeLocalEntity(a);again=CG_AllocLocalEntity();printf("pool|%d|%d|%d\n",(int)(b-cg_localEntities),(int)(again-cg_localEntities),cg_activeLocalEntities.next==again);
 le=CG_AllocLocalEntity();le->endTime=1000;le->lifeRate=.001f;le->color[0]=1;le->color[1]=.5f;le->color[2]=.25f;le->color[3]=.75f;cg.time=500;refs=0;CG_AddFadeRGB(le);printf("fade|%u|%u|%u|%u|%d\n",bits((float)le->refEntity.shaderRGBA[0]),bits((float)le->refEntity.shaderRGBA[1]),bits((float)le->refEntity.shaderRGBA[2]),bits((float)le->refEntity.shaderRGBA[3]),refs);
 memset(&trace,0,sizeof(trace));trace.fraction=.5f;trace.endpos[0]=1;trace.endpos[1]=2;trace.plane.normal[2]=1;le->pos.trType=2;le->pos.trDelta[0]=10;le->pos.trDelta[2]=-100;le->bounceFactor=.5f;cg.time=1000;cg.frametime=100;CG_ReflectVelocity(le,&trace);printf("reflect|%u|%u|%u|%d|%d\n",bits(le->pos.trDelta[0]),bits(le->pos.trDelta[1]),bits(le->pos.trDelta[2]),le->pos.trTime,le->pos.trType);
 memset(le,0,sizeof(*le));le->startTime=0;le->endTime=1000;le->light=200;le->lightColor[0]=1;le->refEntity.origin[0]=4;cg.time=750;refs=lights=0;CG_AddExplosion(le);printf("explosion|%d|%d|%u\n",refs,lights,bits(lastLight));
 memset(le,0,sizeof(*le));le->startTime=0;le->endTime=1000;le->light=200;le->refEntity.origin[0]=4;cg.time=500;refs=lights=0;CG_AddSpriteExplosion(le);printf("sprite|%d|%d|%d|%u|%d|%u\n",refs,lights,lastType,bits(lastRadius),lastAlpha,bits(lastLight));
 memset(le,0,sizeof(*le));le->startTime=0;le->endTime=1000;le->lifeRate=.001f;le->radius=52;le->pos.trBase[0]=100;cg.time=500;cg.refdef.vieworg[1]=-100;for(i=0;i<11;i++)cgs.media.numberShaders[i]=100+i;refs=shaderCount=0;CG_AddScorePlum(le);printf("plum|%d|%d|%d|%d|%d|%d\n",refs,shaders[0],shaders[1],le->refEntity.shaderRGBA[0],le->refEntity.shaderRGBA[1],le->refEntity.shaderRGBA[2]);return 0;
}
