// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 CheckTournament and its TeamCount dependency.
package mq3.game.tournament
import mq3.game.constants as c
import mq3.game.spawn_values as values
import mq3.compat.numeric as n

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

function setWarmup(level,value,writeLog)
  level.spawner.warmupTime = n.i32(value); values.setConfig(level.spawner,5,str(level.spawner.warmupTime))
  if writeLog then
    if level.gameLogFn == void then return error(488,"Tournament requires game-log delivery") end if
    level.gameLogFn(level,"Warmup:\n")
  end if
  return void
end function

function restart(level)
  level.spawner.warmupTime = n.add32(level.spawner.warmupTime,10000)
  if level.cvarSetFn == void then return error(488,"Tournament restart requires Cvar delivery") end if
  if level.consoleCommandFn == void then return error(488,"Tournament restart requires console-command delivery") end if
  level.cvarSetFn(level,"g_restarted","1"); level.consoleCommandFn(level,2,"map_restart 0\n"); level.restarted = true
  return void
end function

function check(level)
  if level.spawner == void then return error(488,"CheckTournament requires game spawn state") end if
  if level.numPlayingClients == 0 then return void end if
  gametype = level.spawner.gametype
  if gametype == 1 then
    if level.numPlayingClients < 2 then
      if level.tournamentAddFn == void then return error(488,"Tournament requires player promotion") end if
      level.tournamentAddFn(level)
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
