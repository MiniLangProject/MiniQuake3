#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
typedef int qboolean; typedef int qhandle_t; typedef float vec3_t[3];
#define qtrue 1
#define qfalse 0
#define P_NONE 0
#define P_WEATHER 1
#define P_FLAT 2
#define P_SMOKE 3
#define P_ROTATE 4
#define P_WEATHER_TURBULENT 5
#define P_ANIM 6
#define P_BAT 7
#define P_BLEED 8
#define P_FLAT_SCALEUP 9
#define P_FLAT_SCALEUP_FADE 10
#define P_WEATHER_FLURRY 11
#define P_SMOKE_IMPACT 12
#define P_BUBBLE 13
#define P_BUBBLE_TURBULENT 14
#define P_SPRITE 15
#define BLOODRED 2
#define EMISIVEFADE 3
#define VectorCopy(a,b) ((b)[0]=(a)[0],(b)[1]=(a)[1],(b)[2]=(a)[2])
#define VectorClear(a) ((a)[0]=0,(a)[1]=0,(a)[2]=0)
#define VectorSet(a,x,y,z) ((a)[0]=(x),(a)[1]=(y),(a)[2]=(z))
typedef struct particle_s { struct particle_s *next; float time,endtime; vec3_t org,vel,accel; int color; float colorvel,alpha,alphavel; int type; qhandle_t pshader; float height,width,endheight,endwidth,start,end,startfade; qboolean rotate; int snum; qboolean link; int shaderAnim,roll,accumroll; } cparticle_t;
typedef struct { vec3_t origin,origin2,angles,angles2; int time,time2,frame; } entityState_t;
typedef struct { entityState_t currentState; } centity_t;
typedef struct { int time; } cg_t;
typedef struct { struct { qhandle_t tracerShader; } media; } cgs_t;
static cg_t cg; static cgs_t cgs; static cparticle_t storage[4],*active_particles,*free_particles;
static char *shaderAnimNames[] = { "explode1","blacksmokeanim","twiltb2","expblue","blacksmokeanimb","blood",NULL };
static float shaderAnimSTRatio[] = { 1.405f,1.0f,1.0f,1.0f,1.0f,1.0f };
static int random_values[64],random_count,random_at;
static int next_rand(void){ return random_values[random_at++%random_count]; }
#define rand() next_rand()
#define crandom() (2.0f*((float)next_rand()/32767.0f)-1.0f)
#ifdef _MSC_VER
#define stricmp _stricmp
#endif
static void CG_Printf(const char *format,...){ (void)format; }
static void CG_Error(const char *format,...){ (void)format; exit(90); }
#include "cgame_particles_under_test.inc"
static uint32_t bits(float f){ union { float f; uint32_t u; } v;v.f=f;return v.u; }
static void reset(const int *values,int count){ int i;memset(storage,0,sizeof(storage));for(i=0;i<3;i++)storage[i].next=&storage[i+1];free_particles=&storage[0];active_particles=NULL;random_count=count;random_at=0;for(i=0;i<count;i++)random_values[i]=values[i];cg.time=1000;cgs.media.tracerShader=77; }
static void row(const char *name,cparticle_t *p){ printf("%s|%d|%u|%u|%u|%u|%u|%u|%u|%u|%u|%d|%d|%d\n",name,p->type,bits(p->org[0]),bits(p->org[1]),bits(p->org[2]),bits(p->vel[0]),bits(p->vel[1]),bits(p->vel[2]),bits(p->width),bits(p->height),bits(p->endwidth),(int)p->endtime,(int)p->startfade,p->color); }
int main(void){
 vec3_t a={10,20,100},b={0,0,0},v={4,5,6};centity_t cent;int r1[]={16384,8192,24576},r2[]={16384,8192,24576,4096,28672,100,200,300},r3[]={24576},r4[]={1},r5[]={2,17},r6[]={16384,23};
 memset(&cent,0,sizeof(cent));cent.currentState.origin[0]=10;cent.currentState.origin[1]=20;cent.currentState.origin[2]=30;cent.currentState.origin2[2]=-10;cent.currentState.time=1000;cent.currentState.time2=500;
 reset(r1,3);CG_ParticleSnow(11,a,b,0,8,7);row("snow",active_particles);
 reset(r2,8);CG_ParticleBubble(12,b,a,1,8,9);row("bubble",active_particles);
 reset(r3,1);CG_ParticleSmoke(13,&cent);row("smoke",active_particles);
 reset(r4,1);CG_ParticleBulletDebris(a,v,600);row("debris",active_particles);
 reset(r5,2);CG_ParticleImpactSmokePuff(14,a);row("impact",active_particles);
 reset(r5,2);CG_Particle_Bleed(15,a,v,1,700);row("bleed",active_particles);
 reset(r6,2);CG_ParticleMisc(16,a,8,-1,.2f);row("misc",active_particles);
 reset(r4,1);CG_ParticleExplosion("explode1",a,v,-1000,20,40);row("explosion",active_particles);
 return 0;
}
