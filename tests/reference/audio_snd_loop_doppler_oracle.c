#include <stdio.h>
#include <stdarg.h>
#include <string.h>
typedef int qboolean; typedef int sfxHandle_t; typedef float vec3_t[3];
#define qfalse 0
#define qtrue 1
#define S_COLOR_YELLOW ""
#define ERR_DROP 1
#define VectorCopy(a,b) memcpy((b),(a),sizeof(vec3_t))
#define VectorLengthSquared(v) ((v)[0]*(v)[0]+(v)[1]*(v)[1]+(v)[2]*(v)[2])
#define DistanceSquared(a,b) (((a)[0]-(b)[0])*((a)[0]-(b)[0])+((a)[1]-(b)[1])*((a)[1]-(b)[1])+((a)[2]-(b)[2])*((a)[2]-(b)[2]))
#define VectorAdd(a,b,o) do{(o)[0]=(a)[0]+(b)[0];(o)[1]=(a)[1]+(b)[1];(o)[2]=(a)[2]+(b)[2];}while(0)
typedef struct { int inMemory,soundLength; char soundName[16]; } sfx_t;
typedef struct { vec3_t origin,velocity; int active,kill,doppler; float oldDopplerScale,dopplerScale; sfx_t *sfx; int framenum; } loopSound_t;
typedef struct { int integer; } cvar_t; typedef struct { int framecount; } cls_t;
int s_soundStarted=1,s_soundMuted=0,s_numSfx=2,listener_number=0; sfx_t s_knownSfx[2]; loopSound_t loopSounds[8]; cvar_t doppler={1},*s_doppler=&doppler; cls_t cls;
void S_memoryLoad(sfx_t *sfx){sfx->inMemory=1;} void Com_Printf(const char *color,const char *fmt,...){(void)color;(void)fmt;} void Com_Error(int code,const char *fmt,...){(void)code;(void)fmt;}
#include "audio_snd_loop_doppler_under_test.inc"
static int bits(float value){int result;memcpy(&result,&value,4);return result;}
static void show(const char *name,int entity){printf("%s %d %d %d\n",name,loopSounds[entity].doppler,bits(loopSounds[entity].dopplerScale),bits(loopSounds[entity].oldDopplerScale));}
int main(void){vec3_t listener={0,0,0},origin={10,0,0},fast={100,0,0},slow={1,0,0},zero={0,0,0};s_knownSfx[1].inMemory=1;s_knownSfx[1].soundLength=1024;VectorCopy(listener,loopSounds[0].origin);cls.framecount=10;S_AddLoopingSound(1,origin,fast,1);show("first",1);cls.framecount=11;S_AddLoopingSound(1,origin,fast,1);show("consecutive",1);cls.framecount=13;S_AddLoopingSound(1,origin,fast,1);show("gap",1);S_AddLoopingSound(2,origin,slow,1);show("slow",2);S_AddLoopingSound(3,origin,zero,1);show("stationary",3);return 0;}
