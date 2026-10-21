#include <stdio.h>
#include <stdint.h>
#include <string.h>
typedef int qboolean;
typedef int qhandle_t;
typedef float vec3_t[3];
#define qtrue 1
#define qfalse 0
#define GLHW_RAGEPRO 1
#define LE_MOVE_SCALE_FADE 4
#define LE_FADE_RGB 5
#define LE_EXPLOSION 6
#define LE_SPRITE_EXPLOSION 7
#define LE_FRAGMENT 8
#define LEF_PUFF_DONT_SCALE 1
#define TR_LINEAR 2
#define TR_GRAVITY 5
#define RT_MODEL 1
#define RT_SPRITE 2
#define RF_THIRD_PERSON 2
#define LEBS_BLOOD 1
#define LEBS_BRASS 2
#define LEMT_NONE 0
#define LEMT_BLOOD 1
#define VectorCopy(a,b) ((b)[0]=(a)[0],(b)[1]=(a)[1],(b)[2]=(a)[2])
#define VectorScale(a,s,b) ((b)[0]=(a)[0]*(s),(b)[1]=(a)[1]*(s),(b)[2]=(a)[2]*(s))
#define VectorAdd(a,b,c) ((c)[0]=(a)[0]+(b)[0],(c)[1]=(a)[1]+(b)[1],(c)[2]=(a)[2]+(b)[2])
#define AxisClear(a) (memset((a),0,sizeof(a)),(a)[0][0]=(a)[1][1]=(a)[2][2]=1)
#define AxisCopy(a,b) memcpy((b),(a),sizeof(b))

typedef struct { int trType,trTime; vec3_t trBase,trDelta; } trajectory_t;
typedef struct { float shaderTime,rotation,radius; int reType,customShader,hModel,renderfx; unsigned char shaderRGBA[4]; vec3_t origin,oldorigin; float axis[3][3]; } refEntity_t;
typedef struct { int leFlags,leType,startTime,fadeInTime,endTime; float lifeRate,radius,color[4]; trajectory_t pos,angles; refEntity_t refEntity; float bounceFactor; int leBounceSoundType,leMarkType; } localEntity_t;
typedef struct { int clientNum; } playerState_t;
typedef struct { playerState_t ps; } snapshot_t;
typedef struct { int waterBubbleShader,smokePuffRageProShader,teleportEffectShader,teleportEffectModel,bloodExplosionShader; } media_t;
typedef struct { struct { int hardwareType; } glconfig; media_t media; } cgs_t;
typedef struct { int time; snapshot_t *snap; } cg_t;
static cgs_t cgs;static cg_t cg;static snapshot_t snap;static localEntity_t pool[64];static int used;
typedef struct { int integer; } cvar_t;static cvar_t cg_blood={1};
static float axisDefault[3][3]={{1,0,0},{0,1,0},{0,0,1}};
static localEntity_t *CG_AllocLocalEntity(void){localEntity_t *v=&pool[used++];memset(v,0,sizeof(*v));return v;}
static void CG_Error(const char *format,...){(void)format;}
static void RotateAroundDirection(float axis[3][3],float angle){(void)axis;(void)angle;}
static int Q_rand(int *seed){*seed=(int)((uint32_t)(*seed)*69069u+1u);return *seed;}
static float Q_random(int *seed){return (Q_rand(seed)&65535)/65536.0f;}
static int random_values[64],random_count,random_at;
static void random_set(const int *values,int count){memcpy(random_values,values,(size_t)count*sizeof(int));random_count=count;random_at=0;}
static int rand_stub(void){return random_at<random_count?random_values[random_at++]:0;}
static float qrandom_stub(void){return rand_stub()/32767.0f;}
#define rand rand_stub
#define random qrandom_stub

#include "cgame_effects_under_test.inc"

static uint32_t bits(float value){union{float f;uint32_t u;}v;v.f=value;return v.u;}
static void row(const char *name,const localEntity_t *v){printf("%s|%d|%d|%d|%u|%u|%u|%u|%d|%d|%d|%u|%u|%u|%u\n",name,v->leType,v->startTime,v->endTime,bits(v->lifeRate),bits(v->refEntity.rotation),bits(v->refEntity.origin[0]),bits(v->refEntity.origin[2]),v->refEntity.hModel,v->refEntity.customShader,v->refEntity.renderfx,bits(v->bounceFactor),bits(v->pos.trDelta[0]),bits(v->pos.trDelta[2]),bits(v->refEntity.radius));}
int main(void){
  vec3_t p={1,2,3},vel={4,5,6},dir={0,0,1};localEntity_t *v;int values[2];cg.time=1000;cg.snap=&snap;snap.ps.clientNum=2;cgs.media.smokePuffRageProShader=99;cgs.media.teleportEffectShader=11;cgs.media.teleportEffectModel=12;cgs.media.bloodExplosionShader=13;
  v=CG_SmokePuff(p,vel,12,0.1f,0.2f,0.3f,0.4f,800,900,1100,7,21);row("puff",v);
  cgs.glconfig.hardwareType=GLHW_RAGEPRO;v=CG_SmokePuff(p,vel,2,0,0,0,0,100,1000,1000,0,22);row("puff-rage",v);cgs.glconfig.hardwareType=0;
  CG_SpawnEffect(p);row("spawn",&pool[used-1]);
  values[0]=5;values[1]=42;random_set(values,2);v=CG_MakeExplosion(p,dir,31,32,600,qtrue);row("explosion-sprite",v);
  values[0]=8;values[1]=91;random_set(values,2);v=CG_MakeExplosion(p,dir,33,34,500,qfalse);row("explosion-model",v);
  values[0]=77;random_set(values,1);CG_Bleed(p,2);row("bleed",&pool[used-1]);
  values[0]=0;random_set(values,1);CG_LaunchGib(p,vel,41);row("gib",&pool[used-1]);
  values[0]=32767;random_set(values,1);CG_LaunchExplode(p,vel,42);row("fragment",&pool[used-1]);
  return 0;
}
