// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 g_cmds.c vote handlers. argv is the already tokenized engine command,
// including argv[0]; client_commands supplies routing, the engine tokenization.
package mq3.game.vote_commands
import mq3.game.constants as c
import mq3.game.votes as votes
import mq3.game.spawn_values as values
import mq3.qcommon.cvar as cv
import mq3.compat.numeric as n
import mq3.compat.textnumbers as textnum
import std.string as strings
/// Network entity-flag bit indicating voted.
const EF_VOTED = 0x00004000
/// Network entity-flag bit indicating teamvoted.
const EF_TEAMVOTED = 0x00080000

/// Validate vote argument storage and reject embedded zero bytes, truncating text to leave space for the terminator.
/// @param text Text to parse, format or deliver.
/// @param capacity Maximum number of entries to allocate or retain.
function boundedText(text,capacity)
  if capacity < 1 then return error(492,"Vote argument has no native storage") end if
  data = bytes(text)
  for each part in data
    if part == 0 then return error(492,"Vote argument contains embedded NUL") end if
  end for
  if len(data) >= capacity then return decode(slice(data,0,capacity-1)) end if
  return text
end function
/// Use `level.gamePrintFn` to perform `formattedText`. Return paths include `boundedText(text,capacity)`.
/// @param level Game-level state; accesses `gamePrintFn`.
/// @param text Text to parse, format or deliver.
/// @param capacity Maximum number of entries to allocate or retain.
function formattedText(level,text,capacity)
  size = len(bytes(text))
  if size >= 32000 then return error(492,"Vote format exceeds native temporary storage") end if
  // Com_sprintf reports overflow before it copies into the destination.
  // Legacy isolated hosts can omit diagnostics; the full dispatcher observes it.
  if size >= capacity and level.gamePrintFn != void then
    level.gamePrintFn(level,"Com_sprintf: overflow of "+str(size)+" in "+str(capacity)+"\n")
  end if
  return boundedText(text,capacity)
end function
/// Apply `mq3.game.vote_commands.boundedText` while evaluating `argument`. Return paths include `boundedText(argv[index],capacity)`.
/// @param argv Command argument strings in their original order.
/// @param index Index of the entry to access.
/// @param capacity Maximum number of entries to allocate or retain.
function argument(argv,index,capacity)
  if index >= len(argv) then return "" end if
  return boundedText(argv[index],capacity)
end function
/// Apply `mq3.game.votes.clientLimit` while evaluating `voteClient`. Return paths include `ent.client`.
/// @param level Game-level state; accesses `maxclients`.
/// @param ent Game entity; accesses `slot` and `client`.
function voteClient(level,ent)
  if ent == void then return error(492,"Vote requires caller entity") end if
  if ent.slot < 0 or ent.slot >= 64 or ent.client == void then return error(492,"Vote requires client slot and binding") end if
  votes.clientLimit(level); return ent.client
end function
/// Forward `notice` to `mq3.game.votes.send` and return the delegated result.
/// @param level Game-level state; accesses `serverCommandFn`.
/// @param ent Game entity; accesses `slot`.
/// @param text Text to parse, format or deliver.
function notice(level,ent,text)
  return votes.send(level,ent.slot,"print \""+text+"\n\"")
end function
/// Apply `mq3.game.spawn_values.setConfig` while evaluating `voteConfig`. Return paths include `values.setConfig(level.spawner,index,value)`.
/// @param level Game-level state; accesses `spawner`.
/// @param index Index of the entry to access.
/// @param value Value passed as argument 5 to `state.effectFn`.
function voteConfig(level,index,value)
  if level.spawner == void then return error(492,"Vote requires spawn state") end if
  return values.setConfig(level.spawner,index,value)
end function
/// Apply `mq3.qcommon.cvar.find` and `mq3.game.vote_commands.boundedText` while evaluating `nextMap`. Return paths include `boundedText(variable.string,1024)`.
/// @param level Game-level state; accesses `spawner`.
function nextMap(level)
  if level.spawner == void then return error(492,"Vote requires engine Cvar registry") end if
  variable = cv.find(level.spawner.cvars,"nextmap")
  if variable == void then return "" end if
  return boundedText(variable.string,1024)
end function
/// Test `strings.indexOf(first,";",0) >= 0 or strings.indexOf(second,";",0) >= 0` as the condition for `invalidString`.
/// @param first Value passed as argument 1 to `std.string.indexOf`.
/// @param second Value passed as argument 1 to `std.string.indexOf`.
function invalidString(first,second)
  return strings.indexOf(first,";",0) >= 0 or strings.indexOf(second,";",0) >= 0
end function
/// Update `level.voteExecuteTime`, `level.voteString`, `level.voteDisplayString` and `level.voteTime` and related state during `callVote`.
/// @param level Game-level state; accesses `allowVote`, `voteTime`, `voteExecuteTime`, `voteString` and `voteDisplayString` and related fields. May update `level.voteExecuteTime`, `level.voteString` and `level.voteDisplayString` and additional fields in place.
/// @param ent Game entity; accesses `slot` and `client`.
/// @param argv Command argument strings in their original order.
function callVote(level,ent,argv)
  client = voteClient(level,ent)
  if level.allowVote == 0 then return notice(level,ent,"Voting not allowed here.") end if
  if level.voteTime != 0 then return notice(level,ent,"A vote is already in progress.") end if
  if client.voteCount >= 3 then return notice(level,ent,"You have called the maximum number of votes.") end if
  if client.team == c.TEAM_SPECTATOR then return notice(level,ent,"Not allowed to call a vote as spectator.") end if
  arg1 = argument(argv,1,1024); arg2 = argument(argv,2,1024)
  if invalidString(arg1,arg2) then return notice(level,ent,"Invalid vote string.") end if
  allowed = false
  for each name in ["map_restart","nextmap","map","g_gametype","kick","clientkick","g_doWarmup","timelimit","fraglimit"]
    if strings.equalsIgnoreCaseAscii(arg1,name) then allowed = true; break end if
  end for
  if not allowed then
    notice(level,ent,"Invalid vote string.")
    return notice(level,ent,"Vote commands are: map_restart, nextmap, map <mapname>, g_gametype <n>, kick <player>, clientkick <clientnum>, g_doWarmup, timelimit <time>, fraglimit <frags>.")
  end if
  // The original flushes an accepted previous vote before validating gametype
  // or the nextmap Cvar, even if that later validation rejects the new call.
  if level.voteExecuteTime != 0 then
    level.voteExecuteTime = 0; votes.console(level,level.voteString)
  end if
  if strings.equalsIgnoreCaseAscii(arg1,"g_gametype") then
    mode = textnum.atoi(arg2)
    if mode == 2 or mode < 0 or mode >= 8 then return notice(level,ent,"Invalid gametype.") end if
    names = ["Free For All","Tournament","Single Player","Team Deathmatch","Capture the Flag","One Flag CTF","Overload","Harvester"]
    level.voteString = formattedText(level,arg1+" "+str(mode),1024)
    level.voteDisplayString = formattedText(level,arg1+" "+names[mode],1024)
  else if strings.equalsIgnoreCaseAscii(arg1,"map") then
    rotation = nextMap(level); command = arg1+" "+arg2
    if rotation != "" then command = command+"; set nextmap \""+rotation+"\"" end if
    level.voteString = formattedText(level,command,1024); level.voteDisplayString = level.voteString
  else if strings.equalsIgnoreCaseAscii(arg1,"nextmap") then
    if nextMap(level) == "" then return notice(level,ent,"nextmap not set.") end if
    level.voteString = "vstr nextmap"; level.voteDisplayString = level.voteString
  else
    level.voteString = formattedText(level,arg1+" \""+arg2+"\"",1024); level.voteDisplayString = level.voteString
  end if
  votes.send(level,-1,"print \""+client.netname+" called a vote.\n\"")
  level.voteTime = level.time; level.voteYes = 1; level.voteNo = 0
  index = 0
  while index < level.maxclients
    level.clients[index].ps.eFlags = level.clients[index].ps.eFlags & ~EF_VOTED
    index = index+1
  end while
  client.ps.eFlags = client.ps.eFlags | EF_VOTED
  voteConfig(level,8,str(level.voteTime)); voteConfig(level,9,level.voteDisplayString)
  voteConfig(level,10,str(level.voteYes)); voteConfig(level,11,str(level.voteNo))
  // Neither original call handler increments pers.voteCount/teamVoteCount.
  return void
end function
/// Apply `mq3.game.vote_commands.argument` while evaluating `isYes`. Return paths include `first == 121 or second == 89 or second == 49`.
/// @param argv Command argument strings in their original order.
function isYes(argv)
  data = bytes(argument(argv,1,64)); first = 0; second = 0
  if len(data) > 0 then first = data[0] end if
  if len(data) > 1 then second = data[1] end if
  // Preserve msg[1] for uppercase Y and 1; Q_strncpyz zero-pads short args.
  return first == 121 or second == 89 or second == 49
end function
/// Set `level.voteYes` to `n.add32(level.voteYes,1)` and `level.voteNo` to `n.add32(level.voteNo,1)` in `mq3.game.vote_commands.castVote`.
/// @param level Game-level state; accesses `voteTime`, `voteYes` and `voteNo`. May update `level.voteYes` and `level.voteNo` in place.
/// @param ent Game entity; accesses `slot` and `client`.
/// @param argv Command argument strings in their original order.
function castVote(level,ent,argv)
  client = voteClient(level,ent)
  if level.voteTime == 0 then return notice(level,ent,"No vote in progress.") end if
  if (client.ps.eFlags & EF_VOTED) != 0 then return notice(level,ent,"Vote already cast.") end if
  if client.team == c.TEAM_SPECTATOR then return notice(level,ent,"Not allowed to vote as spectator.") end if
  notice(level,ent,"Vote cast."); client.ps.eFlags = client.ps.eFlags | EF_VOTED
  if isYes(argv) then
    level.voteYes = n.add32(level.voteYes,1); voteConfig(level,10,str(level.voteYes))
  else
    level.voteNo = n.add32(level.voteNo,1); voteConfig(level,11,str(level.voteNo))
  end if
  return void
end function
/// Apply `mq3.game.vote_commands.argument` while evaluating `teamArguments`. Return paths include `text`.
/// @param argv Command argument strings in their original order.
function teamArguments(argv)
  text = ""; index = 2
  while index < len(argv)
    if index > 2 then
      // Original strcat would write outside arg2 if the prior copy filled it.
      if len(bytes(text)) >= 1023 then return error(492,"Team vote argument concatenation exceeds native storage") end if
      text = text+" "
    end if
    text = text+argument(argv,index,1024-len(bytes(text))); index = index+1
  end while
  return text
end function
/// Apply `mq3.game.vote_commands.boundedText` while evaluating `cleanName`. Return paths include `decode(bytes(result))`.
/// @param text Text to parse, format or deliver.
function cleanName(text)
  data = bytes(boundedText(text,36)); result = []; index = 0
  while index < len(data)
    part = data[index]
    if part == 94 and index+1 < len(data) and data[index+1] != 94 then
      index = index+2; continue
    end if
    if part >= 32 and part <= 126 then result = result+[part] end if
    index = index+1
  end while
  return decode(bytes(result))
end function
/// Update `level.teamVoteString[offset]`, `level.teamVoteTime[offset]`, `level.teamVoteYes[offset]` and `level.teamVoteNo[offset]` during `callTeamVote`.
/// @param level Game-level state; accesses `allowVote`, `teamVoteTime`, `maxclients`, `entities` and `clients` and related fields. May update `level.teamVoteString[offset]`, `level.teamVoteTime[offset]` and `level.teamVoteYes[offset]` and additional fields in place.
/// @param ent Game entity; accesses `slot` and `client`.
/// @param argv Command argument strings in their original order.
function callTeamVote(level,ent,argv)
  client = voteClient(level,ent); team = client.team
  if team != c.TEAM_RED and team != c.TEAM_BLUE then return void end if
  offset = team-c.TEAM_RED
  if level.allowVote == 0 then return notice(level,ent,"Voting not allowed here.") end if
  if level.teamVoteTime[offset] != 0 then return notice(level,ent,"A team vote is already in progress.") end if
  if client.teamVoteCount >= 3 then return notice(level,ent,"You have called the maximum number of team votes.") end if
  arg1 = argument(argv,1,1024); arg2 = teamArguments(argv)
  if invalidString(arg1,arg2) then return notice(level,ent,"Invalid vote string.") end if
  if not strings.equalsIgnoreCaseAscii(arg1,"leader") then
    notice(level,ent,"Invalid vote string."); return notice(level,ent,"Team vote commands are: leader <player>.")
  end if
  candidate = client.ps.clientNum
  if arg2 != "" then
    data = bytes(arg2); index = 0
    while index < 3 and index < len(data)
      if data[index] < 48 or data[index] > 57 then break end if
      index = index+1
    end while
    if index >= 3 or index == len(data) then
      candidate = textnum.atoi(arg2)
      if candidate < 0 or candidate >= level.maxclients then return notice(level,ent,"Bad client slot: "+str(candidate)) end if
      if not level.entities[candidate].inuse then return notice(level,ent,"Client "+str(candidate)+" is not active") end if
    else
      leader = cleanName(arg2); candidate = 0
      while candidate < level.maxclients
        member = level.clients[candidate]
        if member.connected != 0 and member.team == team then
          if strings.equalsIgnoreCaseAscii(cleanName(member.netname),leader) then break end if
        end if
        candidate = candidate+1
      end while
      if candidate >= level.maxclients then return notice(level,ent,arg2+" is not a valid player on your team.") end if
    end if
  end if
  level.teamVoteString[offset] = formattedText(level,arg1+" "+str(candidate),1024)
  index = 0
  while index < level.maxclients
    member = level.clients[index]
    if member.connected != 0 and member.team == team then votes.send(level,index,"print \""+client.netname+" called a team vote.\n\"") end if
    index = index+1
  end while
  level.teamVoteTime[offset] = level.time; level.teamVoteYes[offset] = 1; level.teamVoteNo[offset] = 0
  index = 0
  while index < level.maxclients
    member = level.clients[index]
    if member.team == team then member.ps.eFlags = member.ps.eFlags & ~EF_TEAMVOTED end if
    index = index+1
  end while
  client.ps.eFlags = client.ps.eFlags | EF_TEAMVOTED
  voteConfig(level,12+offset,str(level.teamVoteTime[offset])); voteConfig(level,14+offset,level.teamVoteString[offset])
  voteConfig(level,16+offset,str(level.teamVoteYes[offset])); voteConfig(level,18+offset,str(level.teamVoteNo[offset]))
  return void
end function
/// Set `level.teamVoteYes[offset]` to `n.add32(level.teamVoteYes[offset],1)` and `level.teamVoteNo[offset]` to `n.add32(level.teamVoteNo[offset],1)` in `mq3.game.vote_commands.castTeamVote`.
/// @param level Game-level state; accesses `teamVoteTime`, `teamVoteYes` and `teamVoteNo`. May update `level.teamVoteYes[offset]` and `level.teamVoteNo[offset]` in place.
/// @param ent Game entity; accesses `slot` and `client`.
/// @param argv Command argument strings in their original order.
function castTeamVote(level,ent,argv)
  client = voteClient(level,ent); team = client.team
  if team != c.TEAM_RED and team != c.TEAM_BLUE then return void end if
  offset = team-c.TEAM_RED
  if level.teamVoteTime[offset] == 0 then return notice(level,ent,"No team vote in progress.") end if
  if (client.ps.eFlags & EF_TEAMVOTED) != 0 then return notice(level,ent,"Team vote already cast.") end if
  notice(level,ent,"Team vote cast."); client.ps.eFlags = client.ps.eFlags | EF_TEAMVOTED
  if isYes(argv) then
    level.teamVoteYes[offset] = n.add32(level.teamVoteYes[offset],1); voteConfig(level,16+offset,str(level.teamVoteYes[offset]))
  else
    level.teamVoteNo[offset] = n.add32(level.teamVoteNo[offset],1); voteConfig(level,18+offset,str(level.teamVoteNo[offset]))
  end if
  return void
end function
