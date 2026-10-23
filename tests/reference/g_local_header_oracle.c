#include <stddef.h>
#include <stdio.h>
#define WIN32 1
#include "../../Quake-III-Arena-original-source/code/game/g_local.h"

#define U(value) ((unsigned)(value))
#define OFF(type, field) U(offsetof(type, field))

int main(void) {
  printf("strings %s|%s\n", GAMEVERSION, SP_PODIUM_MODEL);
  printf("timing %d %d %d %d %d %d %d\n", BODY_QUEUE_SIZE, INFINITE, FRAMETIME, CARNAGE_REWARD_TIME, REWARD_SPRITE_TIME, INTERMISSION_DELAY_TIME, SP_INTERMISSION_DELAY_TIME);
  printf("flags %d %d %d %d %d %d %d %d\n", FL_GODMODE, FL_NOTARGET, FL_TEAMSLAVE, FL_NO_KNOCKBACK, FL_DROPPED_ITEM, FL_NO_BOTS, FL_NO_HUMANS, FL_FORCE_GESTURE);
  printf("enums %d %d %d %d|%d %d %d|%d %d %d %d|%d %d\n", MOVER_POS1, MOVER_POS2, MOVER_1TO2, MOVER_2TO1, CON_DISCONNECTED, CON_CONNECTING, CON_CONNECTED, SPECTATOR_NOT, SPECTATOR_FREE, SPECTATOR_FOLLOW, SPECTATOR_SCOREBOARD, TEAM_BEGIN, TEAM_ACTIVE);
  printf("limits %d %d %d %d %d %d %d\n", FOLLOW_ACTIVE1, FOLLOW_ACTIVE2, MAX_NETNAME, MAX_VOTE_COUNT, MAX_SPAWN_VARS, MAX_SPAWN_VARS_CHARS, MAX_FILEPATH);
  printf("damage %d %d %d %d\n", DAMAGE_RADIUS, DAMAGE_NO_ARMOR, DAMAGE_NO_KNOCKBACK, DAMAGE_NO_PROTECTION);
  printf("sizes %u %u %u %u %u %u %u\n", U(sizeof(playerTeamState_t)), U(sizeof(clientSession_t)), U(sizeof(clientPersistant_t)), U(sizeof(gclient_t)), U(sizeof(gentity_t)), U(sizeof(level_locals_t)), U(sizeof(bot_settings_t)));
  printf("entity %u %u %u %u %u %u\n", OFF(gentity_t, s), OFF(gentity_t, r), OFF(gentity_t, client), OFF(gentity_t, inuse), OFF(gentity_t, moverState), OFF(gentity_t, item));
  printf("client %u %u %u %u %u\n", OFF(gclient_t, ps), OFF(gclient_t, pers), OFF(gclient_t, sess), OFF(gclient_t, readyToExit), OFF(gclient_t, areabits));
  printf("level %u %u %u %u %u %u %u %u %u %u\n", OFF(level_locals_t, clients), OFF(level_locals_t, gentities), OFF(level_locals_t, gentitySize), OFF(level_locals_t, num_entities), OFF(level_locals_t, warmupTime), OFF(level_locals_t, numSpawnVars), OFF(level_locals_t, spawnVars), OFF(level_locals_t, intermissionQueued), OFF(level_locals_t, bodyQueIndex), OFF(level_locals_t, bodyQue));
  return 0;
}
