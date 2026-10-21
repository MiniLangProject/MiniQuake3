#include <stdio.h>
#include <stdint.h>
#include <math.h>
typedef int qboolean;
typedef int sfxHandle_t;
typedef int qhandle_t;
typedef float vec3_t[3];
#define qtrue 1
#define qfalse 0
#define STAT_HEALTH 0
#define STAT_WEAPONS 2
#define WP_MACHINEGUN 2
#define WP_SHOTGUN 3
#define WP_GRENADE_LAUNCHER 4
#define WP_ROCKET_LAUNCHER 5
#define WP_RAILGUN 7
#define WP_NUM_WEAPONS 11
#define DAMAGE_TIME 500
#define CHAN_LOCAL_SOUND 1
#define PITCH 0
#define YAW 1
#define ROLL 2
#define VectorSubtract(a,b,c) ((c)[0]=(a)[0]-(b)[0],(c)[1]=(a)[1]-(b)[1],(c)[2]=(a)[2]-(b)[2])
#define DotProduct(a,b) ((a)[0]*(b)[0]+(a)[1]*(b)[1]+(a)[2]*(b)[2])
#define VectorLength(v) (sqrtf(DotProduct((v),(v))))
typedef struct { int stats[16]; int ammo[16]; int weapon; } playerState_t;
typedef struct { int serverTime; playerState_t ps; } snapshot_t;
typedef struct { int noAmmoSound; } media_t;
typedef struct { media_t media; } cgs_t;
typedef struct { snapshot_t *snap; int time,lowAmmoWarning,attackerTime; float damageX,damageY,v_dmg_roll,v_dmg_pitch,damageValue; int v_dmg_time,damageTime,thisFrameTeleport,weaponSelectTime,weaponSelect; float refdef_viewaxis_padding[1]; struct { float viewaxis[3][3]; } refdef; } cg_t;
static cg_t cg; static cgs_t cgs; static vec3_t vec3_origin={0,0,0}; static int sounds;
static void trap_S_StartLocalSound(int sound,int channel){(void)sound;(void)channel;sounds++;}
static void AngleVectors(const vec3_t angles,vec3_t forward,vec3_t right,vec3_t up){
  float angle,sr,sp,sy,cr,cp,cy;angle=angles[YAW]*(3.14159265358979323846f*2/360);sy=sinf(angle);cy=cosf(angle);angle=angles[PITCH]*(3.14159265358979323846f*2/360);sp=sinf(angle);cp=cosf(angle);angle=angles[ROLL]*(3.14159265358979323846f*2/360);sr=sinf(angle);cr=cosf(angle);if(forward){forward[0]=cp*cy;forward[1]=cp*sy;forward[2]=-sp;}if(right){right[0]=(-1*sr*sp*cy+-1*cr*-sy);right[1]=(-1*sr*sp*sy+-1*cr*cy);right[2]=-1*sr*cp;}if(up){up[0]=(cr*sp*cy+-sr*-sy);up[1]=(cr*sp*sy+-sr*cy);up[2]=cr*cp;}}
#include "cgame_playerstate_under_test.inc"
static uint32_t bits(float value){union {float f;uint32_t u;} v;v.f=value;return v.u;}
static void damage_row(const char *name){printf("%s|%u|%u|%u|%u|%u|%d|%d|%d\n",name,bits(cg.damageX),bits(cg.damageY),bits(cg.v_dmg_roll),bits(cg.v_dmg_pitch),bits(cg.damageValue),cg.v_dmg_time,cg.damageTime,cg.attackerTime);}
int main(void){
 snapshot_t snap={0};cg.snap=&snap;cgs.media.noAmmoSound=7;cg.refdef.viewaxis[0][0]=1;cg.refdef.viewaxis[1][1]=1;cg.refdef.viewaxis[2][2]=1;
 snap.ps.stats[STAT_WEAPONS]=1<<WP_MACHINEGUN;snap.ps.ammo[WP_MACHINEGUN]=25;CG_CheckAmmo();printf("ammo-high|%d|%d\n",cg.lowAmmoWarning,sounds);
 snap.ps.ammo[WP_MACHINEGUN]=4;CG_CheckAmmo();printf("ammo-low|%d|%d\n",cg.lowAmmoWarning,sounds);
 snap.ps.ammo[WP_MACHINEGUN]=0;CG_CheckAmmo();printf("ammo-none|%d|%d\n",cg.lowAmmoWarning,sounds);CG_CheckAmmo();printf("ammo-repeat|%d|%d\n",cg.lowAmmoWarning,sounds);
 cg.time=1000;snap.serverTime=990;snap.ps.stats[STAT_HEALTH]=100;CG_DamageFeedback(255,255,3);damage_row("damage-center");
 cg.time=2000;snap.serverTime=1980;snap.ps.stats[STAT_HEALTH]=20;CG_DamageFeedback(64,0,20);damage_row("damage-side");
 snap.ps.weapon=7;CG_Respawn();printf("respawn|%d|%d|%d\n",cg.thisFrameTeleport,cg.weaponSelectTime,cg.weaponSelect);return 0;
}
