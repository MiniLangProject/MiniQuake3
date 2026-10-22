/* Unchanged BotSelectActivateWeapon body from code/game/ai_dmnet.c. */
#include <stdio.h>
#include <string.h>
#define INVENTORY_SHOTGUN 5
#define INVENTORY_MACHINEGUN 6
#define INVENTORY_ROCKETLAUNCHER 8
#define INVENTORY_LIGHTNING 9
#define INVENTORY_RAILGUN 10
#define INVENTORY_PLASMAGUN 11
#define INVENTORY_BFG10K 13
#define INVENTORY_NAILGUN 15
#define INVENTORY_CHAINGUN 17
#define INVENTORY_SHELLS 18
#define INVENTORY_BULLETS 19
#define INVENTORY_CELLS 21
#define INVENTORY_LIGHTNINGAMMO 22
#define INVENTORY_ROCKETS 23
#define INVENTORY_SLUGS 24
#define INVENTORY_BFGAMMO 25
#define INVENTORY_NAILS 26
#define INVENTORY_BELT 28
#define WEAPONINDEX_MACHINEGUN 2
#define WEAPONINDEX_SHOTGUN 3
#define WEAPONINDEX_ROCKET_LAUNCHER 5
#define WEAPONINDEX_LIGHTNING 6
#define WEAPONINDEX_RAILGUN 7
#define WEAPONINDEX_PLASMAGUN 8
#define WEAPONINDEX_BFG 9
#define WEAPONINDEX_NAILGUN 11
#define WEAPONINDEX_CHAINGUN 13
#define MISSIONPACK 1
typedef struct { int inventory[64]; } bot_state_t;

int BotSelectActivateWeapon(bot_state_t *bs) {
	//
	if (bs->inventory[INVENTORY_MACHINEGUN] > 0 && bs->inventory[INVENTORY_BULLETS] > 0)
		return WEAPONINDEX_MACHINEGUN;
	else if (bs->inventory[INVENTORY_SHOTGUN] > 0 && bs->inventory[INVENTORY_SHELLS] > 0)
		return WEAPONINDEX_SHOTGUN;
	else if (bs->inventory[INVENTORY_PLASMAGUN] > 0 && bs->inventory[INVENTORY_CELLS] > 0)
		return WEAPONINDEX_PLASMAGUN;
	else if (bs->inventory[INVENTORY_LIGHTNING] > 0 && bs->inventory[INVENTORY_LIGHTNINGAMMO] > 0)
		return WEAPONINDEX_LIGHTNING;
#ifdef MISSIONPACK
	else if (bs->inventory[INVENTORY_CHAINGUN] > 0 && bs->inventory[INVENTORY_BELT] > 0)
		return WEAPONINDEX_CHAINGUN;
	else if (bs->inventory[INVENTORY_NAILGUN] > 0 && bs->inventory[INVENTORY_NAILS] > 0)
		return WEAPONINDEX_NAILGUN;
#endif
	else if (bs->inventory[INVENTORY_RAILGUN] > 0 && bs->inventory[INVENTORY_SLUGS] > 0)
		return WEAPONINDEX_RAILGUN;
	else if (bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 && bs->inventory[INVENTORY_ROCKETS] > 0)
		return WEAPONINDEX_ROCKET_LAUNCHER;
	else if (bs->inventory[INVENTORY_BFG10K] > 0 && bs->inventory[INVENTORY_BFGAMMO] > 0)
		return WEAPONINDEX_BFG;
	else {
		return -1;
	}
}

static int observations;
#define OBS(x) do { observations++; if (!(x)) return observations; } while (0)
static int check(int weapon, int ammo, int expected) {
    bot_state_t bot; memset(&bot, 0, sizeof(bot));
    if (weapon >= 0) { bot.inventory[weapon] = 1; bot.inventory[ammo] = 1; }
    return BotSelectActivateWeapon(&bot) == expected;
}
int main(void) {
    OBS(check(-1, 0, -1));
    OBS(check(INVENTORY_MACHINEGUN, INVENTORY_BULLETS, WEAPONINDEX_MACHINEGUN));
    OBS(check(INVENTORY_SHOTGUN, INVENTORY_SHELLS, WEAPONINDEX_SHOTGUN));
    OBS(check(INVENTORY_PLASMAGUN, INVENTORY_CELLS, WEAPONINDEX_PLASMAGUN));
    OBS(check(INVENTORY_LIGHTNING, INVENTORY_LIGHTNINGAMMO, WEAPONINDEX_LIGHTNING));
    OBS(check(INVENTORY_CHAINGUN, INVENTORY_BELT, WEAPONINDEX_CHAINGUN));
    OBS(check(INVENTORY_NAILGUN, INVENTORY_NAILS, WEAPONINDEX_NAILGUN));
    OBS(check(INVENTORY_RAILGUN, INVENTORY_SLUGS, WEAPONINDEX_RAILGUN));
    OBS(check(INVENTORY_ROCKETLAUNCHER, INVENTORY_ROCKETS, WEAPONINDEX_ROCKET_LAUNCHER));
    OBS(check(INVENTORY_BFG10K, INVENTORY_BFGAMMO, WEAPONINDEX_BFG));
    puts("PASS: 10 unchanged-C ai_dmnet observations");
    return 0;
}
