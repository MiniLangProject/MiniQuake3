/* SPDX-License-Identifier: GPL-2.0-or-later
 * Direct ai_dmq3.c oracle. Function bodies are unchanged Baseq3 bodies;
 * only the surrounding game/botlib ABI is reduced to deterministic stubs.
 */
#include <stdio.h>
#include <string.h>
#include <math.h>
#define qtrue 1
#define qfalse 0
#define MAX_CLIENTS 64
#define GT_TEAM 3
#define GT_CTF 4
#define PM_NORMAL 0
#define PM_DEAD 3
#define PM_FREEZE 4
#define PM_INTERMISSION 5
#define WP_GAUNTLET 1
#define WP_MACHINEGUN 2
#define EF_TELEPORT_BIT 4
#define EF_FIRING 0x100
#define EF_TALK 0x1000
#define PW_QUAD 1
#define PW_INVIS 4
#define PW_REDFLAG 7
#define PW_BLUEFLAG 8
#define CONTENTS_LAVA 8
#define CONTENTS_SLIME 16
#define LTG_GETFLAG 4
#define INVENTORY_ARMOR 1
#define INVENTORY_SHOTGUN 5
#define INVENTORY_GRENADELAUNCHER 7
#define INVENTORY_ROCKETLAUNCHER 8
#define INVENTORY_LIGHTNING 9
#define INVENTORY_RAILGUN 10
#define INVENTORY_PLASMAGUN 11
#define INVENTORY_BFG10K 13
#define INVENTORY_SHELLS 18
#define INVENTORY_GRENADES 20
#define INVENTORY_CELLS 21
#define INVENTORY_LIGHTNINGAMMO 22
#define INVENTORY_ROCKETS 23
#define INVENTORY_SLUGS 24
#define INVENTORY_BFGAMMO 25
#define INVENTORY_HEALTH 29
#define INVENTORY_QUAD 35
#define INVENTORY_REDFLAG 45
#define INVENTORY_BLUEFLAG 46
#define ENEMY_HORIZONTAL_DIST 200
#define ENEMY_HEIGHT 201
#define CHARACTERISTIC_WEAPONJUMPING 43
#define VectorCopy(a,b) memcpy((b),(a),sizeof(vec3_t))
#define AngleMod(a) ((360.0f/65536) * ((int)((a)*(65536/360.0f)) & 65535))
typedef int qboolean; typedef float vec3_t[3];
typedef struct {int number,powerups,flags;} aas_entityinfo_t;
typedef struct {int pm_type,eFlags;} playerState_t;
typedef struct {int inventory[204],weaponnum,enemy,ltgtype,character,last_eFlags;float teleport_time;vec3_t origin;playerState_t cur_ps;} bot_state_t;
typedef struct {int integer;} vmCvar_t;
typedef struct {int intermissiontime;} level_locals_t;
static int gametype,pointcontents; static float now,weaponjump; static aas_entityinfo_t enemyinfo; static vmCvar_t bot_rocketjump; static level_locals_t level;
static float FloatTime(void){return now;} static int trap_AAS_PointContents(vec3_t p){(void)p;return pointcontents;}
static float trap_Characteristic_BFloat(int c,int i,float lo,float hi){(void)c;(void)i;(void)lo;(void)hi;return weaponjump;}
static void BotEntityInfo(int n,aas_entityinfo_t *e){(void)n;*e=enemyinfo;}

/* Unchanged from code/game/ai_dmq3.c. */
int BotCTFCarryingFlag(bot_state_t *bs) {
	if (gametype != GT_CTF) return 0;
	if (bs->inventory[INVENTORY_REDFLAG] > 0) return 1;
	else if (bs->inventory[INVENTORY_BLUEFLAG] > 0) return 2;
	return 0;
}
qboolean EntityCarriesFlag(aas_entityinfo_t *entinfo) {
	if ( entinfo->powerups & ( 1 << PW_REDFLAG ) ) return qtrue;
	if ( entinfo->powerups & ( 1 << PW_BLUEFLAG ) ) return qtrue;
	return qfalse;
}
qboolean EntityIsInvisible(aas_entityinfo_t *entinfo) {
	if (EntityCarriesFlag(entinfo)) return qfalse;
	if (entinfo->powerups & (1 << PW_INVIS)) return qtrue;
	return qfalse;
}
qboolean EntityIsShooting(aas_entityinfo_t *entinfo) { if (entinfo->flags & EF_FIRING) return qtrue; return qfalse; }
qboolean EntityIsChatting(aas_entityinfo_t *entinfo) { if (entinfo->flags & EF_TALK) return qtrue; return qfalse; }
qboolean EntityHasQuad(aas_entityinfo_t *entinfo) { if (entinfo->powerups & (1 << PW_QUAD)) return qtrue; return qfalse; }
void BotSetTeleportTime(bot_state_t *bs) {
	if ((bs->cur_ps.eFlags ^ bs->last_eFlags) & EF_TELEPORT_BIT) bs->teleport_time = FloatTime();
	bs->last_eFlags = bs->cur_ps.eFlags;
}
qboolean BotIsDead(bot_state_t *bs) { return (bs->cur_ps.pm_type == PM_DEAD); }
qboolean BotIntermission(bot_state_t *bs) { if (level.intermissiontime) return qtrue; return (bs->cur_ps.pm_type == PM_FREEZE || bs->cur_ps.pm_type == PM_INTERMISSION); }
qboolean BotInLavaOrSlime(bot_state_t *bs) { vec3_t feet; VectorCopy(bs->origin, feet); feet[2] -= 23; return (trap_AAS_PointContents(feet) & (CONTENTS_LAVA|CONTENTS_SLIME)); }
int TeamPlayIsOn(void) { return ( gametype >= GT_TEAM ); }
float BotAggression(bot_state_t *bs) {
	if (bs->inventory[INVENTORY_QUAD]) { if (bs->weaponnum != WP_GAUNTLET || bs->inventory[ENEMY_HORIZONTAL_DIST] < 80) return 70; }
	if (bs->inventory[ENEMY_HEIGHT] > 200) return 0;
	if (bs->inventory[INVENTORY_HEALTH] < 60) return 0;
	if (bs->inventory[INVENTORY_HEALTH] < 80) { if (bs->inventory[INVENTORY_ARMOR] < 40) return 0; }
	if (bs->inventory[INVENTORY_BFG10K] > 0 && bs->inventory[INVENTORY_BFGAMMO] > 7) return 100;
	if (bs->inventory[INVENTORY_RAILGUN] > 0 && bs->inventory[INVENTORY_SLUGS] > 5) return 95;
	if (bs->inventory[INVENTORY_LIGHTNING] > 0 && bs->inventory[INVENTORY_LIGHTNINGAMMO] > 50) return 90;
	if (bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 && bs->inventory[INVENTORY_ROCKETS] > 5) return 90;
	if (bs->inventory[INVENTORY_PLASMAGUN] > 0 && bs->inventory[INVENTORY_CELLS] > 40) return 85;
	if (bs->inventory[INVENTORY_GRENADELAUNCHER] > 0 && bs->inventory[INVENTORY_GRENADES] > 10) return 80;
	if (bs->inventory[INVENTORY_SHOTGUN] > 0 && bs->inventory[INVENTORY_SHELLS] > 10) return 50;
	return 0;
}
float BotFeelingBad(bot_state_t *bs) { if (bs->weaponnum == WP_GAUNTLET) return 100; if (bs->inventory[INVENTORY_HEALTH] < 40) return 100; if (bs->weaponnum == WP_MACHINEGUN) return 90; if (bs->inventory[INVENTORY_HEALTH] < 60) return 80; return 0; }
int BotWantsToRetreat(bot_state_t *bs) {
	aas_entityinfo_t entinfo; if (gametype == GT_CTF) { if (BotCTFCarryingFlag(bs)) return qtrue; }
	if (bs->enemy >= 0) { BotEntityInfo(bs->enemy, &entinfo); if (EntityCarriesFlag(&entinfo)) return qfalse; }
	if (bs->ltgtype == LTG_GETFLAG) return qtrue; if (BotAggression(bs) < 50) return qtrue; return qfalse;
}
int BotWantsToChase(bot_state_t *bs) {
	aas_entityinfo_t entinfo; if (gametype == GT_CTF) { if (BotCTFCarryingFlag(bs)) return qfalse; BotEntityInfo(bs->enemy, &entinfo); if (EntityCarriesFlag(&entinfo)) return qtrue; }
	if (bs->ltgtype == LTG_GETFLAG) return qfalse; if (BotAggression(bs) > 50) return qtrue; return qfalse;
}
int BotCanAndWantsToRocketJump(bot_state_t *bs) {
	float rocketjumper; if (!bot_rocketjump.integer) return qfalse; if (bs->inventory[INVENTORY_ROCKETLAUNCHER] <= 0) return qfalse; if (bs->inventory[INVENTORY_ROCKETS] < 3) return qfalse; if (bs->inventory[INVENTORY_QUAD]) return qfalse; if (bs->inventory[INVENTORY_HEALTH] < 60) return qfalse; if (bs->inventory[INVENTORY_HEALTH] < 90) { if (bs->inventory[INVENTORY_ARMOR] < 40) return qfalse; }
	rocketjumper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_WEAPONJUMPING, 0, 1); if (rocketjumper < 0.5) return qfalse; return qtrue;
}
qboolean InFieldOfVision(vec3_t viewangles, float fov, vec3_t angles) {
	int i; float diff, angle; for (i = 0; i < 2; i++) { angle = AngleMod(viewangles[i]); angles[i] = AngleMod(angles[i]); diff = angles[i] - angle; if (angles[i] > angle) { if (diff > 180.0) diff -= 360.0; } else { if (diff < -180.0) diff += 360.0; } if (diff > 0) { if (diff > fov * 0.5) return qfalse; } else { if (diff < -fov * 0.5) return qfalse; } } return qtrue;
}

static int observations;
#define OBS(x) do{observations++;if(!(x)){fprintf(stderr,"failure line %d\n",__LINE__);return 1;}}while(0)
static void reset(bot_state_t*b){memset(b,0,sizeof(*b));b->enemy=-1;b->inventory[INVENTORY_HEALTH]=100;}
int main(void){bot_state_t b;aas_entityinfo_t e;vec3_t v,a;
 reset(&b);memset(&e,0,sizeof(e));OBS(!EntityCarriesFlag(&e));e.powerups=1<<PW_REDFLAG;OBS(EntityCarriesFlag(&e));e.powerups=(1<<PW_REDFLAG)|(1<<PW_INVIS);OBS(!EntityIsInvisible(&e));e.powerups=1<<PW_INVIS;OBS(EntityIsInvisible(&e));e.flags=EF_FIRING|EF_TALK;OBS(EntityIsShooting(&e));OBS(EntityIsChatting(&e));e.powerups=1<<PW_QUAD;OBS(EntityHasQuad(&e));
 reset(&b);gametype=0;b.inventory[INVENTORY_REDFLAG]=1;OBS(BotCTFCarryingFlag(&b)==0);gametype=GT_CTF;OBS(BotCTFCarryingFlag(&b)==1);b.inventory[INVENTORY_REDFLAG]=0;b.inventory[INVENTORY_BLUEFLAG]=2;OBS(BotCTFCarryingFlag(&b)==2);b.inventory[INVENTORY_BLUEFLAG]=0;OBS(BotCTFCarryingFlag(&b)==0);
 reset(&b);now=12.5f;b.cur_ps.eFlags=4;BotSetTeleportTime(&b);OBS(b.teleport_time==12.5f);OBS(b.last_eFlags==4);now=20;BotSetTeleportTime(&b);OBS(b.teleport_time==12.5f);b.cur_ps.pm_type=PM_DEAD;OBS(BotIsDead(&b));
 level.intermissiontime=0;b.cur_ps.pm_type=PM_NORMAL;OBS(!BotIntermission(&b));b.cur_ps.pm_type=PM_FREEZE;OBS(BotIntermission(&b));level.intermissiontime=1;b.cur_ps.pm_type=PM_NORMAL;OBS(BotIntermission(&b));pointcontents=CONTENTS_SLIME;OBS(BotInLavaOrSlime(&b));
 reset(&b);b.inventory[INVENTORY_QUAD]=1;b.weaponnum=WP_GAUNTLET;b.inventory[ENEMY_HORIZONTAL_DIST]=100;OBS(BotAggression(&b)==0);b.inventory[ENEMY_HORIZONTAL_DIST]=79;OBS(BotAggression(&b)==70);b.inventory[INVENTORY_QUAD]=0;b.inventory[INVENTORY_BFG10K]=1;b.inventory[INVENTORY_BFGAMMO]=8;OBS(BotAggression(&b)==100);b.inventory[INVENTORY_BFG10K]=0;b.inventory[INVENTORY_RAILGUN]=1;b.inventory[INVENTORY_SLUGS]=6;OBS(BotAggression(&b)==95);b.inventory[INVENTORY_RAILGUN]=0;b.inventory[INVENTORY_LIGHTNING]=1;b.inventory[INVENTORY_LIGHTNINGAMMO]=51;OBS(BotAggression(&b)==90);b.inventory[INVENTORY_LIGHTNING]=0;b.inventory[INVENTORY_ROCKETLAUNCHER]=1;b.inventory[INVENTORY_ROCKETS]=6;OBS(BotAggression(&b)==90);b.inventory[INVENTORY_ROCKETLAUNCHER]=0;b.inventory[INVENTORY_PLASMAGUN]=1;b.inventory[INVENTORY_CELLS]=41;OBS(BotAggression(&b)==85);b.inventory[INVENTORY_PLASMAGUN]=0;b.inventory[INVENTORY_GRENADELAUNCHER]=1;b.inventory[INVENTORY_GRENADES]=11;OBS(BotAggression(&b)==80);b.inventory[INVENTORY_GRENADELAUNCHER]=0;b.inventory[INVENTORY_SHOTGUN]=1;b.inventory[INVENTORY_SHELLS]=11;OBS(BotAggression(&b)==50);b.inventory[INVENTORY_HEALTH]=59;OBS(BotAggression(&b)==0);
 reset(&b);b.weaponnum=WP_GAUNTLET;OBS(BotFeelingBad(&b)==100);b.weaponnum=0;b.inventory[INVENTORY_HEALTH]=39;OBS(BotFeelingBad(&b)==100);b.inventory[INVENTORY_HEALTH]=100;b.weaponnum=WP_MACHINEGUN;OBS(BotFeelingBad(&b)==90);b.weaponnum=0;b.inventory[INVENTORY_HEALTH]=59;OBS(BotFeelingBad(&b)==80);b.inventory[INVENTORY_HEALTH]=60;OBS(BotFeelingBad(&b)==0);
 reset(&b);gametype=GT_CTF;b.inventory[INVENTORY_REDFLAG]=1;OBS(BotWantsToRetreat(&b));b.inventory[INVENTORY_REDFLAG]=0;b.enemy=2;enemyinfo.powerups=1<<PW_BLUEFLAG;OBS(!BotWantsToRetreat(&b));enemyinfo.powerups=0;b.ltgtype=LTG_GETFLAG;OBS(BotWantsToRetreat(&b));b.ltgtype=0;b.inventory[INVENTORY_ROCKETLAUNCHER]=1;b.inventory[INVENTORY_ROCKETS]=6;OBS(!BotWantsToRetreat(&b));b.inventory[INVENTORY_ROCKETS]=0;OBS(BotWantsToRetreat(&b));
 reset(&b);gametype=GT_CTF;b.inventory[INVENTORY_BLUEFLAG]=1;OBS(!BotWantsToChase(&b));b.inventory[INVENTORY_BLUEFLAG]=0;enemyinfo.powerups=1<<PW_REDFLAG;OBS(BotWantsToChase(&b));enemyinfo.powerups=0;b.ltgtype=LTG_GETFLAG;OBS(!BotWantsToChase(&b));b.ltgtype=0;b.inventory[INVENTORY_ROCKETLAUNCHER]=1;b.inventory[INVENTORY_ROCKETS]=6;OBS(BotWantsToChase(&b));b.inventory[INVENTORY_ROCKETS]=0;OBS(!BotWantsToChase(&b));
 reset(&b);bot_rocketjump.integer=0;OBS(!BotCanAndWantsToRocketJump(&b));bot_rocketjump.integer=1;b.inventory[INVENTORY_ROCKETLAUNCHER]=1;b.inventory[INVENTORY_ROCKETS]=2;OBS(!BotCanAndWantsToRocketJump(&b));b.inventory[INVENTORY_ROCKETS]=3;b.inventory[INVENTORY_HEALTH]=89;b.inventory[INVENTORY_ARMOR]=39;OBS(!BotCanAndWantsToRocketJump(&b));b.inventory[INVENTORY_ARMOR]=40;weaponjump=.49f;OBS(!BotCanAndWantsToRocketJump(&b));weaponjump=.5f;OBS(BotCanAndWantsToRocketJump(&b));b.inventory[INVENTORY_QUAD]=1;OBS(!BotCanAndWantsToRocketJump(&b));
 v[0]=350;v[1]=10;v[2]=0;a[0]=10;a[1]=350;a[2]=0;OBS(InFieldOfVision(v,45,a));a[0]=40;OBS(!InFieldOfVision(v,45,a));a[0]=350;a[1]=32.5f;OBS(InFieldOfVision(v,45,a));a[1]=32.6f;OBS(!InFieldOfVision(v,45,a));a[0]=-10;a[1]=370;OBS(InFieldOfVision(v,1,a));a[0]=170;OBS(!InFieldOfVision(v,359,a));a[0]=169.9f;OBS(InFieldOfVision(v,360,a));OBS(a[1]>=9.99f&&a[1]<=10.01f);
 gametype=2;OBS(!TeamPlayIsOn());gametype=GT_TEAM;OBS(TeamPlayIsOn());gametype=GT_CTF;OBS(TeamPlayIsOn());gametype=99;OBS(TeamPlayIsOn());
 reset(&b);b.inventory[ENEMY_HEIGHT]=201;b.inventory[INVENTORY_BFG10K]=1;b.inventory[INVENTORY_BFGAMMO]=99;OBS(BotAggression(&b)==0);b.inventory[ENEMY_HEIGHT]=0;b.inventory[INVENTORY_HEALTH]=79;b.inventory[INVENTORY_ARMOR]=39;OBS(BotAggression(&b)==0);b.inventory[INVENTORY_ARMOR]=40;OBS(BotAggression(&b)==100);b.inventory[INVENTORY_BFGAMMO]=7;OBS(BotAggression(&b)==0);b.inventory[INVENTORY_SHOTGUN]=1;b.inventory[INVENTORY_SHELLS]=10;OBS(BotAggression(&b)==0);b.inventory[INVENTORY_SHELLS]=11;OBS(BotAggression(&b)==50);
 if(observations!=68){fprintf(stderr,"observation count %d\n",observations);return 1;}printf("PASS: 12 native Baseq3 bot combat scenarios / 68 exact observations\n");return 0;}
