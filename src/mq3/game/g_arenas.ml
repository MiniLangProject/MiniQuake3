// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete code/game/g_arenas.c surface over the productive arena runtime.
package mq3.game.g_arenas
import mq3.game.arenas as runtime

function UpdateTournamentInfo(level) return runtime.updateTournamentInfo(level) end function
function SpawnModelOnVictoryPad(level,pad,offset,ent,place) return runtime.spawnModelOnVictoryPad(level,pad,offset,ent,place) end function
function CelebrateStop(level,player) return runtime.celebrateStop(level,player) end function
function CelebrateStart(level,player) return runtime.celebrateStart(level,player) end function
function PodiumPlacementThink(level,podium) return runtime.podiumPlacementThink(level,podium) end function
function SpawnPodium(level) return runtime.spawnPodium(level) end function
function SpawnModelsOnVictoryPads(level) return runtime.spawnModelsOnVictoryPads(level) end function
function Svcmd_AbortPodium_f(level,argv) return runtime.abortPodium(level,argv) end function
