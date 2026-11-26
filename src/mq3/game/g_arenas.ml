// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete code/game/g_arenas.c surface over the productive arena runtime.
package mq3.game.g_arenas
import mq3.game.arenas as runtime

/// Forward `UpdateTournamentInfo` to `mq3.game.arenas.updateTournamentInfo` and return the delegated result.
/// @param level Game-level state; accesses `maxclients`, `entities`, `clients`, `spawner` and `numNonSpectatorClients` and related fields.
function UpdateTournamentInfo(level) return runtime.updateTournamentInfo(level) end function
/// Forward `SpawnModelOnVictoryPad` to `mq3.game.arenas.spawnModelOnVictoryPad` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param pad Podium record; accesses `r`.
/// @param offset Offset into the buffer or sequence used by this operation.
/// @param ent Game entity; accesses `client`, `s` and `r`.
/// @param place Value used by `spawnModelOnVictoryPad` in `body.count = place`.
function SpawnModelOnVictoryPad(level,pad,offset,ent,place) return runtime.spawnModelOnVictoryPad(level,pad,offset,ent,place) end function
/// Forward `CelebrateStop` to `mq3.game.arenas.celebrateStop` and return the delegated result.
/// @param level Value passed as argument 1 to `mq3.game.arenas.celebrateStop`.
/// @param player Player entity; accesses `s`. May update `player.s.torsoAnim` in place.
function CelebrateStop(level,player) return runtime.celebrateStop(level,player) end function
/// Forward `CelebrateStart` to `mq3.game.arenas.celebrateStart` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param player Player entity; accesses `s`, `nextthink` and `think`. May update `player.s.torsoAnim`, `player.nextthink` and `player.think` in place.
function CelebrateStart(level,player) return runtime.celebrateStart(level,player) end function
/// Forward `PodiumPlacementThink` to `mq3.game.arenas.podiumPlacementThink` and return the delegated result.
/// @param level Game-level state; accesses `time`, `intermission_angle`, `intermission_origin`, `podium1` and `podium2` and related fields.
/// @param podium Podium record; accesses `nextthink`. May update `podium.nextthink` in place.
function PodiumPlacementThink(level,podium) return runtime.podiumPlacementThink(level,podium) end function
/// Forward `SpawnPodium` to `mq3.game.arenas.spawnPodium` and return the delegated result.
/// @param level Game-level state; accesses `spawner`, `intermission_angle`, `intermission_origin` and `time`.
function SpawnPodium(level) return runtime.spawnPodium(level) end function
/// Forward `SpawnModelsOnVictoryPads` to `mq3.game.arenas.spawnModelsOnVictoryPads` and return the delegated result.
/// @param level Game-level state; accesses `podium1`, `podium2`, `podium3`, `sortedClients` and `entities` and related fields. May update `level.podium1`, `level.podium2` and `level.podium3` in place.
function SpawnModelsOnVictoryPads(level) return runtime.spawnModelsOnVictoryPads(level) end function
/// Forward `Svcmd_AbortPodium_f` to `mq3.game.arenas.abortPodium` and return the delegated result.
/// @param level Game-level state; accesses `spawner`, `podium1` and `time`. May update `level.podium1.nextthink` and `level.podium1.think` in place.
/// @param argv Command argument strings in their original order.
function Svcmd_AbortPodium_f(level,argv) return runtime.abortPodium(level,argv) end function
