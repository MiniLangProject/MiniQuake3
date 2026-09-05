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

function half(value)
  // C integer division truncates towards zero, including negative counts.
  value = n.i32(value)
  if value < 0 then return 0-((0-value) >> 1) end if
  return value >> 1
end function
function send(level,slot,message)
  if level.serverCommandFn == void then return error(489,"Vote requires server-command delivery") end if
  level.serverCommandFn(level,slot,message); return void
end function
function config(level,index)
  if level.spawner == void then return error(489,"Vote requires game spawn state") end if
  return values.setConfig(level.spawner,index,"")
end function
function commandText(text)
  data = bytes(text)
  if len(data) > 1023 then return error(489,"Vote command exceeds native storage") end if
  for each part in data
    if part == 0 then return error(489,"Vote command contains embedded NUL") end if
  end for
  return data
end function
function console(level,text)
  commandText(text)
  if level.consoleCommandFn == void then return error(489,"Vote requires console-command delivery") end if
  level.consoleCommandFn(level,2,text+"\n"); return void
end function
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
function clientLimit(level)
  if level.maxclients < 0 or level.maxclients > 64 then return error(489,"Invalid team-leader client limit") end if
  return void
end function
function printTeam(level,team,message)
  clientLimit(level); index = 0
  while index < level.maxclients
    slot = index; index = index+1
    // Original PrintTeam deliberately does not filter disconnected members.
    if level.clients[slot].team == team then send(level,slot,message) end if
  end while
  return void
end function
function userinfoChanged(level,slot)
  if level.clientUserinfoChangedFn != void then level.clientUserinfoChangedFn(level,slot)
  else clientInfo.changed(level,slot) end if
  return void
end function
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
