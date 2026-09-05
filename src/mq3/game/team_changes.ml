// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 SetTeam, StopFollowing and Cmd_Team_f from g_cmds.c.
package mq3.game.team_changes
import mq3.game.constants as c
import mq3.game.session as sessions
import mq3.game.client_info as clientInfo
import mq3.game.client_spawn as clientSpawn
import mq3.game.bodies as bodies
import mq3.game.deaths as deaths
import mq3.game.votes as votes
import mq3.game.tournament as tournament
import mq3.shared.info as infoStrings
import mq3.compat.numeric as n
import std.string as strings

function setTeam(level,ent,request)
  if ent == void or ent.client == void then return error(492,"Team change requires a client entity") end if
  if level.spawner == void then return error(492,"Team change requires game spawn state") end if
  client = ent.client; clientNum = sessions.sessionSlot(level,client); clientInfo.infoClientLimit(level)
  infoStrings.textBytes(request); name = strings.toLowerAscii(request); specClient = 0; specState = 0; team = 0
  if name == "scoreboard" or name == "score" then team = 3; specState = 3
  else if name == "follow1" then team = 3; specState = 2; specClient = -1
  else if name == "follow2" then team = 3; specState = 2; specClient = -2
  else if name == "spectator" or name == "s" then team = 3; specState = 1
  else if level.spawner.gametype >= 3 then
    if name == "red" or name == "r" then team = 1
    else if name == "blue" or name == "b" then team = 2
    else team = clientInfo.pickTeam(level,clientNum) end if
    if level.teamForceBalance != 0 then
      blue = tournament.teamCount(level,client.ps.clientNum,2); red = tournament.teamCount(level,client.ps.clientNum,1)
      if team == 1 and red-blue > 1 then return votes.send(level,client.ps.clientNum,"cp \"Red team has too many players.\n\"") end if
      if team == 2 and blue-red > 1 then return votes.send(level,client.ps.clientNum,"cp \"Blue team has too many players.\n\"") end if
    end if
  else team = 0 end if
  // Capacity overrides only the team, preserving the selected spectator state.
  if level.spawner.gametype == 1 and level.numNonSpectatorClients >= 2 then team = 3
  else if level.maxGameClients > 0 and level.numNonSpectatorClients >= level.maxGameClients then team = 3 end if
  oldTeam = client.team
  if team == oldTeam and team != 3 then return void end if
  if client.ps.stats[c.STAT_HEALTH] <= 0 then bodies.copyToQueue(level,ent) end if
  client.teamStateState = 0
  if oldTeam != 3 then
    ent.flags = ent.flags & ~0x10; client.ps.stats[c.STAT_HEALTH] = 0; ent.health = 0
    deaths.playerDie(level,ent,ent,ent,100000,c.MOD_SUICIDE)
  end if
  if team == 3 then client.spectatorTime = level.time end if
  client.team = team; client.spectatorState = specState; client.spectatorClient = specClient; client.teamLeader = false
  if team == 1 or team == 2 then
    leader = clientInfo.teamLeader(level,team)
    if leader == -1 or ((level.entities[clientNum].r.svFlags & 8) == 0 and (level.entities[leader].r.svFlags & 8) != 0) then votes.setLeader(level,team,clientNum) end if
  end if
  if oldTeam == 1 or oldTeam == 2 then votes.checkTeamLeader(level,oldTeam) end if
  sessions.broadcastTeamChange(level,client,oldTeam); votes.userinfoChanged(level,clientNum)
  if level.playerDieFn == void then level.playerDieFn = deaths.playerDie end if
  if level.clientBeginFn != void then level.clientBeginFn(level,clientNum)
  else clientSpawn.clientBegin(level,clientNum) end if
  return void
end function

function stopFollowing(level,ent)
  if ent == void or ent.client == void or ent.slot < 0 or ent.slot >= 64 then return error(492,"StopFollowing requires a client entity") end if
  client = ent.client; client.ps.persistant[c.PERS_TEAM] = 3; client.team = 3; client.spectatorState = 1
  client.ps.pm_flags = client.ps.pm_flags & ~4096; ent.r.svFlags = ent.r.svFlags & ~8; client.ps.clientNum = ent.slot
  return void
end function

function commandTeam(level,ent,argv)
  if ent == void or ent.client == void then return error(492,"Team command requires a client entity") end if
  client = ent.client
  if len(argv) != 2 then
    if client.team == 0 then return votes.send(level,ent.slot,"print \"Free team\n\"") end if
    if client.team == 1 then return votes.send(level,ent.slot,"print \"Red team\n\"") end if
    if client.team == 2 then return votes.send(level,ent.slot,"print \"Blue team\n\"") end if
    if client.team == 3 then return votes.send(level,ent.slot,"print \"Spectator team\n\"") end if
    return void
  end if
  if client.switchTeamTime > level.time then return votes.send(level,ent.slot,"print \"May not switch teams more than once per 5 seconds.\n\"") end if
  if level.spawner == void then return error(492,"Team command requires game spawn state") end if
  if level.spawner.gametype == 1 and client.team == 0 then client.losses = n.add32(client.losses,1) end if
  setTeam(level,ent,infoStrings.copy(argv[1],1024)); ent.client.switchTeamTime = n.add32(level.time,5000)
  return void
end function
