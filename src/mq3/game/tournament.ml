// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 tournament readiness, player queue and score bookkeeping.
package mq3.game.tournament
import mq3.game.constants as c
import mq3.game.spawn_values as values
import mq3.compat.numeric as n
import mq3.game.team_changes as teamChanges
import mq3.game.votes as votes

/// Set `level.spawner.warmupTime` to `-1` in `mq3.game.tournament.addPlayer`. Return paths include `teamChanges.setTeam(level,level.entities[nextSlot],"f")`.
/// @param level Game-level state; accesses `numPlayingClients`, `intermissiontime`, `maxclients`, `clients` and `spawner` and related fields. May update `level.spawner.warmupTime` in place.
function addPlayer(level)
  if level.numPlayingClients >= 2 or level.intermissiontime != 0 then return void end if
  if level.maxclients < 0 or level.maxclients > 64 then return error(488,"Invalid tournament client limit") end if
  nextSlot = -1; index = 0
  while index < level.maxclients
    slot = index; index = index+1; client = level.clients[slot]
    if client.connected != 2 or client.team != 3 then continue end if
    if client.spectatorState == 3 or client.spectatorClient < 0 then continue end if
    if nextSlot == -1 or client.spectatorTime < level.clients[nextSlot].spectatorTime then nextSlot = slot end if
  end while
  if nextSlot == -1 then return void end if
  if level.spawner == void then return error(488,"Tournament promotion requires game spawn state") end if
  level.spawner.warmupTime = -1; return teamChanges.setTeam(level,level.entities[nextSlot],"f")
end function
/// Read a sorted tournament client slot and reject values outside persistent client storage.
/// @param level Game-level state; accesses `sortedClients`.
/// @param index Index of the entry to access.
function rankedSlot(level,index)
  slot = level.sortedClients[index]
  if slot < 0 or slot >= 64 then return error(488,"Invalid ranked tournament client slot") end if
  return slot
end function
/// Apply `mq3.game.tournament.rankedSlot` and `mq3.game.team_changes.setTeam` while evaluating `removeRanked`. Return paths include `teamChanges.setTeam(level,level.entities[slot],"s")`.
/// @param level Game-level state; accesses `numPlayingClients`, `clients` and `entities`.
/// @param index Index of the entry to access.
function removeRanked(level,index)
  if level.numPlayingClients != 2 then return void end if
  slot = rankedSlot(level,index)
  if level.clients[slot].connected != 2 then return void end if
  return teamChanges.setTeam(level,level.entities[slot],"s")
end function
/// Forward `removeLoser` to `mq3.game.tournament.removeRanked` and return the delegated result.
/// @param level Game-level state; accesses `numPlayingClients`, `clients` and `entities`.
function removeLoser(level)
  return removeRanked(level,1)
end function
/// Forward `removeWinner` to `mq3.game.tournament.removeRanked` and return the delegated result.
/// @param level Game-level state; accesses `numPlayingClients`, `clients` and `entities`.
function removeWinner(level)
  return removeRanked(level,0)
end function
/// Set `level.clients[slot].wins` to `n.add32(level.clients[slot].wins,1)` and `level.clients[slot].losses` to `n.add32(level.clients[slot].losses,1)` in `mq3.game.tournament.adjustScores`.
/// @param level Game-level state; accesses `clients`. May update `level.clients[slot].wins` and `level.clients[slot].losses` in place.
function adjustScores(level)
  slot = rankedSlot(level,0)
  if level.clients[slot].connected == 2 then
    level.clients[slot].wins = n.add32(level.clients[slot].wins,1); votes.userinfoChanged(level,slot)
  end if
  slot = rankedSlot(level,1)
  if level.clients[slot].connected == 2 then
    level.clients[slot].losses = n.add32(level.clients[slot].losses,1); votes.userinfoChanged(level,slot)
  end if
  return void
end function

/// Count connected clients on the requested team while excluding the specified client slot.
/// @param level Game-level state; accesses `maxclients` and `clients`.
/// @param ignoreClientNum Value used by `teamCount` in `if slot == ignoreClientNum then continue end if`.
/// @param team Team identifier used by the game rules.
function teamCount(level,ignoreClientNum,team)
  if level.maxclients < 0 or level.maxclients > 64 then return error(488,"Invalid tournament client limit") end if
  count = 0; index = 0
  while index < level.maxclients
    slot = index; index = index+1
    if slot == ignoreClientNum then continue end if
    client = level.clients[slot]
    if client.connected == 0 then continue end if
    if client.team == team then count = count+1 end if
  end while
  return count
end function

/// Set `level.spawner.warmupTime` to `n.i32(value)` in `mq3.game.tournament.setWarmup`.
/// @param level Game-level state; accesses `spawner` and `gameLogFn`. May update `level.spawner.warmupTime` in place.
/// @param value Value passed as argument 1 to `mq3.compat.numeric.i32`.
/// @param writeLog Value used by `setWarmup` in `if writeLog then`.
function setWarmup(level,value,writeLog)
  level.spawner.warmupTime = n.i32(value); values.setConfig(level.spawner,5,str(level.spawner.warmupTime))
  if writeLog then
    if level.gameLogFn == void then return error(488,"Tournament requires game-log delivery") end if
    level.gameLogFn(level,"Warmup:\n")
  end if
  return void
end function

/// Set `level.spawner.warmupTime` to `n.add32(level.spawner.warmupTime,10000)` and `level.restarted` to `true` in `mq3.game.tournament.restart`.
/// @param level Game-level state; accesses `spawner`, `cvarSetFn`, `consoleCommandFn` and `restarted`. May update `level.spawner.warmupTime` and `level.restarted` in place.
function restart(level)
  level.spawner.warmupTime = n.add32(level.spawner.warmupTime,10000)
  if level.cvarSetFn == void then return error(488,"Tournament restart requires Cvar delivery") end if
  if level.consoleCommandFn == void then return error(488,"Tournament restart requires console-command delivery") end if
  level.cvarSetFn(level,"g_restarted","1"); level.consoleCommandFn(level,2,"map_restart 0\n"); level.restarted = true
  return void
end function

/// Set `level.warmupModificationCount` to `level.warmupCvarModificationCount` and `level.spawner.warmupTime` to `-1` in `mq3.game.tournament.check`.
/// @param level Game-level state; accesses `spawner`, `numPlayingClients`, `tournamentAddFn`, `warmupCvarModificationCount` and `warmupModificationCount` and related fields. May update `level.warmupModificationCount` and `level.spawner.warmupTime` in place.
function check(level)
  if level.spawner == void then return error(488,"CheckTournament requires game spawn state") end if
  if level.numPlayingClients == 0 then return void end if
  gametype = level.spawner.gametype
  if gametype == 1 then
    if level.numPlayingClients < 2 then
      if level.tournamentAddFn != void then level.tournamentAddFn(level)
      else addPlayer(level) end if
    end if
    if level.numPlayingClients != 2 then
      if level.spawner.warmupTime != -1 then setWarmup(level,-1,true) end if
      return void
    end if
    if level.spawner.warmupTime == 0 then return void end if
    if level.warmupCvarModificationCount != level.warmupModificationCount then
      level.warmupModificationCount = level.warmupCvarModificationCount; level.spawner.warmupTime = -1
    end if
    if level.spawner.warmupTime < 0 then
      return setWarmup(level,n.add32(level.time,n.mul32(n.add32(level.warmup,-1),1000)),false)
    end if
    if level.time > level.spawner.warmupTime then return restart(level) end if
  else if gametype != 2 and level.spawner.warmupTime != 0 then
    notEnough = false
    if gametype > 3 then notEnough = teamCount(level,-1,c.TEAM_BLUE) < 1 or teamCount(level,-1,c.TEAM_RED) < 1
    else if level.numPlayingClients < 2 then notEnough = true end if
    if notEnough then
      if level.spawner.warmupTime != -1 then setWarmup(level,-1,true) end if
      return void
    end if
    if level.spawner.warmupTime == 0 then return void end if
    if level.warmupCvarModificationCount != level.warmupModificationCount then
      level.warmupModificationCount = level.warmupCvarModificationCount; level.spawner.warmupTime = -1
    end if
    if level.spawner.warmupTime < 0 then return setWarmup(level,n.add32(level.time,n.mul32(n.add32(level.warmup,-1),1000)),false) end if
    if level.time > level.spawner.warmupTime then return restart(level) end if
  end if
  return void
end function
