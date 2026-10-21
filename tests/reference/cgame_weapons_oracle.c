#include <stdio.h>
#include <stdint.h>
#include <string.h>
typedef int qboolean;
#define qtrue 1
#define qfalse 0
#define STAT_WEAPONS 0
#define WP_GAUNTLET 1
#define PMF_FOLLOW 0x1000
#define EF_FIRING 0x100
#define TORSO_DROP 0
#define TORSO_ATTACK 1
#define TORSO_ATTACK2 2
#define SPIN_SPEED 0.9
#define COAST_TIME 1000
#define AngleMod(a) ((360.0f/65536.0f)*((int)((a)*(65536.0f/360.0f))&65535))
typedef struct { int firstFrame; } animation_t;
typedef struct { animation_t animations[32]; } clientInfo_t;
typedef struct { int ammo[16],stats[16],pm_flags; } playerState_t;
typedef struct { playerState_t ps; } snapshot_t;
typedef struct { float barrelAngle; int barrelTime,barrelSpinning; } playerEntity_t;
typedef struct { int eFlags,weapon,number; } entityState_t;
typedef struct { playerEntity_t pe; entityState_t currentState; } centity_t;
typedef struct { int time,weaponSelectTime,weaponSelect; snapshot_t *snap; } cg_t;
static cg_t cg;static snapshot_t snap;

#include "cgame_weapons_under_test.inc"

static uint32_t bits(float value){union{float f;uint32_t u;}v;v.f=value;return v.u;}
static void selection(const char *name,int selected){printf("%s|%d|%d\n",name,selected,cg.weaponSelectTime);}
int main(void){
  clientInfo_t ci;centity_t cent;float spin;memset(&ci,0,sizeof(ci));memset(&cent,0,sizeof(cent));cg.snap=&snap;cg.time=1234;
  ci.animations[0].firstFrame=100;ci.animations[1].firstFrame=200;ci.animations[2].firstFrame=300;
  printf("map|%d|%d|%d|%d|%d\n",CG_MapTorsoToWeaponFrame(&ci,100),CG_MapTorsoToWeaponFrame(&ci,108),CG_MapTorsoToWeaponFrame(&ci,203),CG_MapTorsoToWeaponFrame(&ci,305),CG_MapTorsoToWeaponFrame(&ci,500));
  snap.ps.stats[STAT_WEAPONS]=(1<<1)|(1<<2)|(1<<5)|(1<<9);snap.ps.ammo[1]=1;snap.ps.ammo[2]=1;snap.ps.ammo[5]=4;snap.ps.ammo[9]=2;
  cg.weaponSelect=2;CG_NextWeapon_f();selection("next",cg.weaponSelect);
  cg.weaponSelect=2;CG_PrevWeapon_f();selection("prev",cg.weaponSelect);
  cg.weaponSelect=5;CG_OutOfAmmoChange();selection("out",cg.weaponSelect);
  snap.ps.pm_flags=PMF_FOLLOW;cg.weaponSelect=5;cg.weaponSelectTime=77;CG_NextWeapon_f();selection("follow",cg.weaponSelect);snap.ps.pm_flags=0;
  memset(snap.ps.ammo,0,sizeof(snap.ps.ammo));cg.weaponSelect=5;CG_NextWeapon_f();selection("none",cg.weaponSelect);
  cent.pe.barrelAngle=10.0f;cent.pe.barrelTime=100;cent.pe.barrelSpinning=qtrue;cent.currentState.eFlags=EF_FIRING;cg.time=200;spin=CG_MachinegunSpinAngle(&cent);printf("spin-a|%u|%u|%d|%d\n",bits(spin),bits(cent.pe.barrelAngle),cent.pe.barrelTime,cent.pe.barrelSpinning);
  cg.time=300;cent.currentState.eFlags=0;spin=CG_MachinegunSpinAngle(&cent);printf("spin-b|%u|%u|%d|%d\n",bits(spin),bits(cent.pe.barrelAngle),cent.pe.barrelTime,cent.pe.barrelSpinning);
  cg.time=1800;spin=CG_MachinegunSpinAngle(&cent);printf("spin-c|%u|%u|%d|%d\n",bits(spin),bits(cent.pe.barrelAngle),cent.pe.barrelTime,cent.pe.barrelSpinning);
  return 0;
}
