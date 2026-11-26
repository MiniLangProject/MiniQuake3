// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 g_session.c and BroadcastTeamChange from g_cmds.c.
package mq3.game.session
import mq3.game.client_info as clientInfo
import mq3.qcommon.cvar as cv
import mq3.shared.info as infoStrings
import mq3.compat.textnumbers as textnum

/// Locate a client record within persistent client storage and reject records not bound to a native slot.
/// @param level Game-level state; accesses `clients`.
/// @param client Value used by `sessionSlot` in `if client == void then return error(492,"Session requires a client") end if`.
function sessionSlot(level,client)
  if client == void then return error(492,"Session requires a client") end if
  for index = 0 to 63
    if level.clients[index] == client then return index end if
  end for
  return error(492,"Session client is outside persistent storage")
end function
/// Apply `mq3.qcommon.cvar.find` and `mq3.shared.info.copy` while evaluating `cvarText`. Return paths include `infoStrings.copy(variable.string,1024)`.
/// @param level Game-level state; accesses `spawner`.
/// @param name Name used to identify the requested entry.
function cvarText(level,name)
  if level.spawner == void then return error(492,"Session requires engine Cvar storage") end if
  variable = cv.find(level.spawner.cvars,name)
  if variable == void then return "" end if
  return infoStrings.copy(variable.string,1024)
end function
/// Use `level.cvarStringFn` to perform `getSessionText`. Return paths include `cvarText(level,name)`.
/// @param level Game-level state; accesses `cvarStringFn`.
/// @param name Name used to identify the requested entry.
function getSessionText(level,name)
  if level.cvarStringFn != void then return infoStrings.copy(level.cvarStringFn(level,name,1024),1024) end if
  return cvarText(level,name)
end function
/// Use `level.cvarSetFn` to perform `setSessionText`.
/// @param level Game-level state; accesses `cvarSetFn`.
/// @param name Name used to identify the requested entry.
/// @param text Text to parse, format or deliver.
function setSessionText(level,name,text)
  if level.cvarSetFn == void then return error(492,"Session requires engine Cvar set delivery") end if
  level.cvarSetFn(level,name,text); return void
end function
/// Apply `mq3.game.session.sessionSlot`, `mq3.game.client_info.leaderValue` and `mq3.game.session.setSessionText` while evaluating `writeClient`. Return paths include `setSessionText(level,"session"+str(slot),text)`.
/// @param level Game-level state; accesses `clients`.
/// @param client Client state; accesses `team`, `spectatorTime`, `spectatorState`, `spectatorClient` and `wins` and related fields.
function writeClient(level,client)
  slot = sessionSlot(level,client)
  text = str(client.team)+" "+str(client.spectatorTime)+" "+str(client.spectatorState)+" "+str(client.spectatorClient)
  text = text+" "+str(client.wins)+" "+str(client.losses)+" "+str(clientInfo.leaderValue(client))
  return setSessionText(level,"session"+str(slot),text)
end function
/// Update `client.team`, `client.spectatorTime`, `client.spectatorState` and `client.spectatorClient` and related state during `readClient`.
/// @param level Game-level state; accesses `clients`.
/// @param client Client state; accesses `team`, `spectatorTime`, `spectatorState`, `spectatorClient` and `wins` and related fields. May update `client.team`, `client.spectatorTime` and `client.spectatorState` and additional fields in place.
function readClient(level,client)
  slot = sessionSlot(level,client); values = textnum.sessionIntegers(getSessionText(level,"session"+str(slot)))
  client.team = values[0]; client.spectatorTime = values[1]; client.spectatorState = values[2]
  client.spectatorClient = values[3]; client.wins = values[4]; client.losses = values[5]; client.teamLeader = values[6]
  return void
end function
/// Use `level.serverCommandFn` to perform `broadcastTeamChange`.
/// @param level Game-level state; accesses `serverCommandFn`.
/// @param client Client state; accesses `team` and `netname`.
/// @param oldTeam Value used by `broadcastTeamChange` in `else if client.team == 3 and oldTeam != 3 then suffix = " joined the spectators.\n\""`.
function broadcastTeamChange(level,client,oldTeam)
  suffix = ""
  if client.team == 1 then suffix = " joined the red team.\n\""
  else if client.team == 2 then suffix = " joined the blue team.\n\""
  else if client.team == 3 and oldTeam != 3 then suffix = " joined the spectators.\n\""
  else if client.team == 0 then suffix = " joined the battle.\n\"" end if
  if suffix == "" then return void end if
  if level.serverCommandFn == void then return error(492,"Team change requires server-command delivery") end if
  level.serverCommandFn(level,-1,"cp \""+client.netname+"^7"+suffix); return void
end function
/// Update `client.team`, `client.spectatorState` and `client.spectatorTime` during `initClient`. Return paths include `writeClient(level,client)`.
/// @param level Game-level state; accesses `spawner`, `teamAutoJoin`, `numNonSpectatorClients`, `maxGameClients` and `time`.
/// @param client Client state; accesses `team`, `spectatorState` and `spectatorTime`. May update `client.team`, `client.spectatorState` and `client.spectatorTime` in place.
/// @param userinfo Text to parse, format or deliver.
function initClient(level,client,userinfo)
  sessionSlot(level,client)
  if level.spawner == void then return error(492,"Session requires game spawn state") end if
  gametype = level.spawner.gametype
  if gametype >= 3 then
    if level.teamAutoJoin != 0 then
      client.team = clientInfo.pickTeam(level,-1); broadcastTeamChange(level,client,-1)
    else client.team = 3 end if
  else
    team = bytes(infoStrings.value(userinfo,"team"))
    if len(team) > 0 and team[0] == 115 then client.team = 3
    else if gametype == 1 then
      if level.numNonSpectatorClients >= 2 then client.team = 3 else client.team = 0 end if
    else
      if level.maxGameClients > 0 and level.numNonSpectatorClients >= level.maxGameClients then client.team = 3
      else client.team = 0 end if
    end if
  end if
  client.spectatorState = 1; client.spectatorTime = level.time
  return writeClient(level,client)
end function
/// Set `level.newSession` to `true` in `mq3.game.session.initWorld`.
/// @param level Game-level state; accesses `spawner`, `newSession` and `gamePrintFn`. May update `level.newSession` in place.
function initWorld(level)
  if level.spawner == void then return error(492,"Session requires game spawn state") end if
  previous = textnum.atoi(getSessionText(level,"session"))
  if level.spawner.gametype != previous then
    level.newSession = true
    if level.gamePrintFn == void then return error(492,"Session reset requires game-print delivery") end if
    level.gamePrintFn(level,"Gametype changed, clearing session data.\n")
  end if
  return void
end function
/// Apply `mq3.game.client_info.infoClientLimit`, `mq3.game.session.setSessionText` and `mq3.game.session.writeClient` while evaluating `writeWorld`.
/// @param level Game-level state; accesses `spawner`, `maxclients` and `clients`.
function writeWorld(level)
  if level.spawner == void then return error(492,"Session requires game spawn state") end if
  clientInfo.infoClientLimit(level)
  setSessionText(level,"session",str(level.spawner.gametype)); index = 0
  while index < level.maxclients
    if level.clients[index].connected == 2 then writeClient(level,level.clients[index]) end if
    index = index+1
  end while
  return void
end function
