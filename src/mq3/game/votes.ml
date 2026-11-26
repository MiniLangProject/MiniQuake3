// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 g_main.c vote resolution and team leadership.
package mq3.game.votes
import mq3.game.constants as c
import mq3.game.spawn_values as values
import mq3.game.client_info as clientInfo
import mq3.compat.numeric as n
import mq3.compat.textnumbers as textnum
import std.string as strings
const SVF_BOT = 0x00000008

/// Divide a signed 32-bit vote count by two with truncation toward zero.
/// @param value Value passed as argument 1 to `mq3.compat.numeric.i32`.
function half(value)
  // C integer division truncates towards zero, including negative counts.
  value = n.i32(value)
  if value < 0 then return 0-((0-value) >> 1) end if
  return value >> 1
end function
/// Use `level.serverCommandFn` to perform `send`.
/// @param level Game-level state; accesses `serverCommandFn`.
/// @param slot Slot in the owning table or pool.
/// @param message Message text supplied to the diagnostic or chat operation.
function send(level,slot,message)
  if level.serverCommandFn == void then return error(489,"Vote requires server-command delivery") end if
  level.serverCommandFn(level,slot,message); return void
end function
/// Apply `mq3.game.spawn_values.setConfig` while evaluating `config`. Return paths include `values.setConfig(level.spawner,index,"")`.
/// @param level Game-level state; accesses `spawner`.
/// @param index Index of the entry to access.
function config(level,index)
  if level.spawner == void then return error(489,"Vote requires game spawn state") end if
  return values.setConfig(level.spawner,index,"")
end function
/// Convert vote command text to bytes after enforcing the native length limit and rejecting embedded zero bytes.
/// @param text Text to parse, format or deliver.
function commandText(text)
  data = bytes(text)
  if len(data) > 1023 then return error(489,"Vote command exceeds native storage") end if
  for each part in data
    if part == 0 then return error(489,"Vote command contains embedded NUL") end if
  end for
  return data
end function
/// Use `level.consoleCommandFn` to perform `console`.
/// @param level Game-level state; accesses `consoleCommandFn`.
/// @param text Text to parse, format or deliver.
function console(level,text)
  commandText(text)
  if level.consoleCommandFn == void then return error(489,"Vote requires console-command delivery") end if
  level.consoleCommandFn(level,2,text+"\n"); return void
end function
/// Update `level.voteExecuteTime` and `level.voteTime` during `check`. Return paths include `config(level,8)`.
/// @param level Game-level state; accesses `voteExecuteTime`, `time`, `voteString`, `voteTime` and `voteYes` and related fields. May update `level.voteExecuteTime` and `level.voteTime` in place.
function check(level)
  if level.voteExecuteTime != 0 and level.voteExecuteTime < level.time then
    level.voteExecuteTime = 0; console(level,level.voteString)
  end if
  if level.voteTime == 0 then return void end if
  if n.i32(level.time-level.voteTime) >= 30000 then
    send(level,-1,"print \"Vote failed.\n\"")
  else
    if level.voteYes > half(level.numVotingClients) then
      send(level,-1,"print \"Vote passed.\n\""); level.voteExecuteTime = n.add32(level.time,3000)
    else if level.voteNo >= half(level.numVotingClients) then
      send(level,-1,"print \"Vote failed.\n\"")
    else
      return void
    end if
  end if
  level.voteTime = 0; return config(level,8)
end function
/// Validate the team-leader client limit against the native sixty-four-client capacity.
/// @param level Game-level state; accesses `maxclients`.
function clientLimit(level)
  if level.maxclients < 0 or level.maxclients > 64 then return error(489,"Invalid team-leader client limit") end if
  return void
end function
/// Apply `mq3.game.votes.clientLimit` and `mq3.game.votes.send` while evaluating `printTeam`.
/// @param level Game-level state; accesses `maxclients` and `clients`.
/// @param team Team identifier used by the game rules.
/// @param message Message text supplied to the diagnostic or chat operation.
function printTeam(level,team,message)
  clientLimit(level); index = 0
  while index < level.maxclients
    slot = index; index = index+1
    // Original PrintTeam deliberately does not filter disconnected members.
    if level.clients[slot].team == team then send(level,slot,message) end if
  end while
  return void
end function
/// Use `level.clientUserinfoChangedFn` to perform `userinfoChanged`.
/// @param level Game-level state; accesses `clientUserinfoChangedFn`.
/// @param slot Slot in the owning table or pool.
function userinfoChanged(level,slot)
  if level.clientUserinfoChangedFn != void then level.clientUserinfoChangedFn(level,slot)
  else clientInfo.changed(level,slot) end if
  return void
end function
/// Set `level.clients[current].teamLeader` to `false` and `level.clients[slot].teamLeader` to `true` in `mq3.game.votes.setLeader`. Return paths include `printTeam(level,team,"print \""+level.clients[slot].netname+" is the new team leader\n\"")`.
/// @param level Game-level state; accesses `clients` and `maxclients`. May update `level.clients[current].teamLeader` and `level.clients[slot].teamLeader` in place.
/// @param team Team identifier used by the game rules.
/// @param slot Slot in the owning table or pool.
function setLeader(level,team,slot)
  if slot < 0 or slot >= 64 then return error(489,"Invalid team-leader client slot") end if
  clientLimit(level); client = level.clients[slot]
  if client.connected == 0 then return printTeam(level,team,"print \""+client.netname+" is not connected\n\"") end if
  if client.team != team then return printTeam(level,team,"print \""+client.netname+" is not on the team anymore\n\"") end if
  index = 0
  while index < level.maxclients
    current = index; index = index+1
    if level.clients[current].team != team then continue end if
    if level.clients[current].teamLeader then
      level.clients[current].teamLeader = false; userinfoChanged(level,current)
    end if
  end while
  level.clients[slot].teamLeader = true; userinfoChanged(level,slot)
  return printTeam(level,team,"print \""+level.clients[slot].netname+" is the new team leader\n\"")
end function
/// Set `level.clients[index].teamLeader` to `true` in `mq3.game.votes.checkTeamLeader`.
/// @param level Game-level state; accesses `maxclients`, `clients` and `entities`. May update `level.clients[index].teamLeader` in place.
/// @param team Team identifier used by the game rules.
function checkTeamLeader(level,team)
  clientLimit(level); index = 0
  while index < level.maxclients
    if level.clients[index].team == team and level.clients[index].teamLeader then return void end if
    index = index+1
  end while
  index = 0
  while index < level.maxclients
    if level.clients[index].team == team and (level.entities[index].r.svFlags & SVF_BOT) == 0 then
      level.clients[index].teamLeader = true; break
    end if
    index = index+1
  end while
  // Preserve the second original loop: a preceding bot can also become leader.
  index = 0
  while index < level.maxclients
    if level.clients[index].team == team then level.clients[index].teamLeader = true; break end if
    index = index+1
  end while
  return void
end function
/// Set `level.teamVoteTime[offset]` to `0` in `mq3.game.votes.checkTeam`. Return paths include `config(level,12+offset)`.
/// @param level Game-level state; accesses `teamVoteTime`, `time`, `teamVoteYes`, `numteamVotingClients` and `teamVoteString` and related fields. May update `level.teamVoteTime[offset]` in place.
/// @param team Team identifier used by the game rules.
function checkTeam(level,team)
  offset = 0
  if team == c.TEAM_RED then offset = 0
  else if team == c.TEAM_BLUE then offset = 1
  else return void end if
  if level.teamVoteTime[offset] == 0 then return void end if
  if n.i32(level.time-level.teamVoteTime[offset]) >= 30000 then
    send(level,-1,"print \"Team vote failed.\n\"")
  else
    if level.teamVoteYes[offset] > half(level.numteamVotingClients[offset]) then
      send(level,-1,"print \"Team vote passed.\n\"")
      text = level.teamVoteString[offset]; data = commandText(text)
      if strings.startsWith(text,"leader") then
        // C reads byte offset 7 even for malformed prefixes; retain that offset.
        if len(data) < 7 then return error(489,"Team-leader command lacks byte offset 7") end if
        setLeader(level,team,textnum.atoi(decode(slice(data,7,len(data)-7))))
      else
        console(level,text)
      end if
    else if level.teamVoteNo[offset] >= half(level.numteamVotingClients[offset]) then
      send(level,-1,"print \"Team vote failed.\n\"")
    else
      return void
    end if
  end if
  level.teamVoteTime[offset] = 0; return config(level,12+offset)
end function
