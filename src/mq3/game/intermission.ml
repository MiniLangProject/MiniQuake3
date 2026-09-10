// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 intermission placement, match completion and level-exit orchestration.
// Single-player victory presentation remains overrideable for oracle fixtures.
package mq3.game.intermission
import mq3.game.constants as c
import mq3.game.player_spawns as intermissionSpawns
import mq3.game.client_spawn as intermissionClientSpawn
import mq3.game.team_changes as intermissionTeamChanges
import mq3.game.tournament as intermissionTournament
import mq3.game.scores as intermissionScores
import mq3.game.session as intermissionSessions
import mq3.game.arenas as intermissionArenas
import mq3.game.bot_lifecycle as intermissionBots

function intermissionClientLimit(limit)
  if limit < 0 or limit > 64 then return error(487,"Invalid intermission client limit") end if
  return limit
end function

function intermissionMoveClient(level,ent)
  if ent == void or ent.client == void then return error(487,"Intermission placement requires a client entity") end if
  if ent.client.spectatorState == 2 then intermissionTeamChanges.stopFollowing(level,ent) end if
  for axis = 0 to 2
    ent.s.origin[axis] = level.intermission_origin[axis]
    ent.client.ps.origin[axis] = level.intermission_origin[axis]
    ent.client.ps.viewangles[axis] = level.intermission_angle[axis]
  end for
  ent.client.ps.pm_type = c.PM_INTERMISSION
  for index = 0 to 15
    ent.client.ps.powerups[index] = 0
  end for
  ent.client.ps.eFlags = 0; ent.s.eFlags = 0; ent.s.eType = c.ET_GENERAL
  ent.s.modelindex = 0; ent.s.loopSound = 0; ent.s.event = 0; ent.r.contents = 0
  return void
end function

function moveClient(level,ent)
  return intermissionMoveClient(level,ent)
end function

function begin(level)
  if level.intermissiontime != 0 then return void end if
  if level.spawner == void then return error(487,"BeginIntermission requires game spawn state") end if
  if level.spawner.gametype == 1 then intermissionTournament.adjustScores(level) end if
  level.intermissiontime = level.time; intermissionSpawns.findIntermission(level)
  if level.spawner.gametype == 2 then
    if level.updateTournamentInfoFn != void then level.updateTournamentInfoFn(level)
    else intermissionArenas.updateTournamentInfo(level) end if
    if level.spawnVictoryPadsFn != void then level.spawnVictoryPadsFn(level)
    else intermissionArenas.spawnModelsOnVictoryPads(level) end if
  end if
  count = intermissionClientLimit(level.maxclients); index = 0
  while index < count
    ent = level.entities[index]; index = index+1
    if not ent.inuse then continue end if
    if ent.health <= 0 then
      if level.respawnFn != void then level.respawnFn(level,ent)
      else intermissionClientSpawn.respawn(level,ent) end if
    end if
    if level.moveIntermissionFn != void then level.moveIntermissionFn(level,ent)
    else intermissionMoveClient(level,ent) end if
  end while
  return intermissionScores.sendAll(level)
end function

function exitLevel(level)
  if level.botInterbreedEndMatchFn != void then level.botInterbreedEndMatchFn(level)
  else
    if level.botLifecycleState == void then return error(487,"ExitLevel requires bot lifecycle state") end if
    intermissionBots.endMatch(level.botLifecycleState)
  end if
  if level.spawner == void then return error(487,"ExitLevel requires game spawn state") end if
  if level.spawner.gametype == 1 then
    if not level.restarted then
      intermissionTournament.removeLoser(level)
      if level.consoleCommandFn == void then return error(487,"ExitLevel requires console-command delivery") end if
      level.consoleCommandFn(level,2,"map_restart 0\n")
      level.restarted = true; level.changemap = void; level.intermissiontime = 0
    end if
    return void
  end if
  if level.consoleCommandFn == void then return error(487,"ExitLevel requires console-command delivery") end if
  level.consoleCommandFn(level,2,"vstr nextmap\n")
  level.changemap = void; level.intermissiontime = 0
  level.teamScores[c.TEAM_RED] = 0; level.teamScores[c.TEAM_BLUE] = 0
  count = intermissionClientLimit(level.maxclientsCvar); index = 0
  while index < count
    client = level.clients[index]; index = index+1
    if client.connected == 2 then client.ps.persistant[c.PERS_SCORE] = 0 end if
  end while
  // Session storage must observe CON_CONNECTED before reconnect state changes.
  intermissionSessions.writeWorld(level); count = intermissionClientLimit(level.maxclientsCvar); index = 0
  while index < count
    client = level.clients[index]; index = index+1
    if client.connected == 2 then client.connected = 1 end if
  end while
  return void
end function
