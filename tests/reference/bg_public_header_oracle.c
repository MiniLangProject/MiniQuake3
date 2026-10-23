#include <stdio.h>
#define WIN32 1
#include "../../Quake-III-Arena-original-source/code/game/q_shared.h"
#include "../../Quake-III-Arena-original-source/code/game/bg_public.h"
int main(void) {
  union { float f; unsigned u; } armor; armor.f = (float)ARMOR_PROTECTION;
  printf("base %d %d %u %d %d %d %d %d\n", DEFAULT_GRAVITY, GIB_HEALTH, armor.u, MAX_ITEMS, DEFAULT_SHOTGUN_SPREAD, DEFAULT_SHOTGUN_COUNT, ITEM_RADIUS, LIGHTNING_RANGE);
  printf("config %d %d %d %d %d %d %d %d\n", CS_MUSIC, CS_BOTINFO, CS_ITEMS, CS_MODELS, CS_SOUNDS, CS_PLAYERS, CS_PARTICLES, CS_MAX);
  printf("pmflags %d %d %d %d %d %d %d %d\n", PMF_DUCKED, PMF_JUMP_HELD, PMF_BACKWARDS_JUMP, PMF_TIME_LAND, PMF_TIME_WATERJUMP, PMF_GRAPPLE_PULL, PMF_SCOREBOARD, PMF_ALL_TIMES);
  printf("events %d %d %d %d %d %d\n", EF_BOUNCE, EF_AWARD_DENIED, EV_EVENT_BIT1, EV_EVENT_BIT2, EV_EVENT_BITS, EVENT_VALID_MSEC);
  printf("masks %d %d %d %d %d %d %d\n", MASK_ALL, MASK_SOLID, MASK_PLAYERSOLID, MASK_DEADSOLID, MASK_WATER, MASK_OPAQUE, MASK_SHOT);
  printf("enums %d %d %d %d %d %d %d %d\n", GT_MAX_GAME_TYPE, PM_SPINTERMISSION, WEAPON_FIRING, TEAM_NUM_TEAMS, IT_TEAM, ET_EVENTS, MOD_GRAPPLE, MAX_TOTALANIMATIONS);
  printf("sizes %u %u %u\n", (unsigned)sizeof(pmove_t), (unsigned)sizeof(animation_t), (unsigned)sizeof(gitem_t));
  return 0;
}
