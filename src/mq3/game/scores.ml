// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 score/rank/scoreboard and match-exit decisions. Beginning intermission
// and switching levels remain explicit integration boundaries.
package mq3.game.scores
import mq3.game.entities as game
import mq3.game.constants as c
import mq3.game.spawn_values as values
import mq3.game.rank_sort as rankSort
import mq3.compat.numeric as n
function clientLimit(limit)
  if limit < 0 or limit > 64 then return error(495,"Invalid score client limit") end if
  return limit
end function
function clientAt(level,slot)
  if slot < 0 or slot >= 64 then return error(495,"Invalid score client slot") end if
  return level.clients[slot]
end function
function integerDivide(a,b)
  a = n.i32(a); b = n.i32(b)
  if b == 0 or (a == -2147483648 and b == -1) then return error(495,"Undefined score integer division") end if
  negative = (a < 0) != (b < 0)
  if a < 0 then a = -a end if
  if b < 0 then b = -b end if
  result = n.quotient(a,b)
  if negative then result = -result end if
  return result
end function
function send(level,slot,message)
  if level.serverCommandFn == void then return error(495,"Score message requires a server-command sink") end if
  level.serverCommandFn(level,slot,message)
  return void
end function
function logLine(level,message)
  if level.gameLogFn == void then return error(495,"Score log requires a game-log sink") end if
  level.gameLogFn(level,message)
  return void
end function
function matchBoundary(level,kind)
  if level.matchTransitionFn == void then return error(495,"Intermission or level transition is not connected") end if
  level.matchTransitionFn(level,kind)
  return void
end function
function compareRanks(level,a,b)
  ca = clientAt(level,a); cb = clientAt(level,b)
  if ca.spectatorState == 3 or ca.spectatorClient < 0 then return 1 end if
  if cb.spectatorState == 3 or cb.spectatorClient < 0 then return -1 end if
  if ca.connected == 1 then return 1 end if
  if cb.connected == 1 then return -1 end if
  if ca.team == 3 and cb.team == 3 then
    if ca.spectatorTime < cb.spectatorTime then return -1 end if
    if ca.spectatorTime > cb.spectatorTime then return 1 end if
    return 0
  end if
  if ca.team == 3 then return 1 end if
  if cb.team == 3 then return -1 end if
  if ca.ps.persistant[c.PERS_SCORE] > cb.ps.persistant[c.PERS_SCORE] then return -1 end if
  if ca.ps.persistant[c.PERS_SCORE] < cb.ps.persistant[c.PERS_SCORE] then return 1 end if
  return 0
end function
function scoreboard(level,ent)
  count = clientLimit(level.numConnectedClients); message = ""; index = 0
  while index < count
    slot = level.sortedClients[index]; cl = clientAt(level,slot); ping = cl.ps.ping
    if cl.connected == 1 then ping = -1 else if ping >= 999 then ping = 999 end if
    accuracy = 0
    if cl.accuracy_shots != 0 then accuracy = integerDivide(n.mul32(cl.accuracy_hits,100),cl.accuracy_shots) end if
    perfect = 0
    if cl.ps.persistant[c.PERS_RANK] == 0 and cl.ps.persistant[c.PERS_KILLED] == 0 then perfect = 1 end if
    entry = ""
    for each value in [slot,cl.ps.persistant[c.PERS_SCORE],ping,integerDivide(n.i32(level.time-cl.enterTime),60000),0,level.entities[slot].s.powerups,accuracy,cl.ps.persistant[c.PERS_IMPRESSIVE_COUNT],cl.ps.persistant[c.PERS_EXCELLENT_COUNT],cl.ps.persistant[c.PERS_GAUNTLET_FRAG_COUNT],cl.ps.persistant[c.PERS_DEFEND_COUNT],cl.ps.persistant[c.PERS_ASSIST_COUNT],perfect,cl.ps.persistant[c.PERS_CAPTURES]]
      entry = entry+" "+str(value)
    end for
    if len(bytes(message))+len(bytes(entry)) > 1024 then break end if
    message = message+entry; index = index+1
  end while
  return send(level,ent.slot,"scores "+str(index)+" "+str(level.teamScores[1])+" "+str(level.teamScores[2])+message)
end function
function commandScore(level,ent)
  return scoreboard(level,ent)
end function
function sendAll(level)
  count = clientLimit(level.maxclients); index = 0
  while index < count
    if level.clients[index].connected == 2 then scoreboard(level,level.entities[index]) end if
    index = index+1
  end while
  return void
end function
function scoreIsTied(level)
  if level.numPlayingClients < 2 then return false end if
  if level.spawner.gametype >= 3 then return level.teamScores[1] == level.teamScores[2] end if
  return clientAt(level,level.sortedClients[0]).ps.persistant[c.PERS_SCORE] == clientAt(level,level.sortedClients[1]).ps.persistant[c.PERS_SCORE]
end function
function logExit(level,reason)
  logLine(level,"Exit: "+reason+"\n"); level.intermissionQueued = level.time; values.setConfig(level.spawner,22,"1")
  count = clientLimit(level.numConnectedClients)
  if count > 32 then count = 32 end if
  if level.spawner.gametype >= 3 then logLine(level,"red:"+str(level.teamScores[1])+"  blue:"+str(level.teamScores[2])+"\n") end if
  index = 0
  while index < count
    slot = level.sortedClients[index]; cl = clientAt(level,slot); index = index+1
    if cl.team == 3 or cl.connected == 1 then continue end if
    ping = cl.ps.ping
    if ping >= 999 then ping = 999 end if
    logLine(level,"score: "+str(cl.ps.persistant[c.PERS_SCORE])+"  ping: "+str(ping)+"  client: "+str(slot)+" "+cl.netname+"\n")
  end while
  return void
end function
function checkIntermissionExit(level)
  if level.spawner.gametype == 2 then return void end if
  ready = 0; notReady = 0; readyMask = 0; count = clientLimit(level.maxclientsCvar); index = 0
  while index < count
    slot = index; index = index+1; cl = level.clients[slot]
    if cl.connected != 2 then continue end if
    if cl.ps.clientNum < 0 or cl.ps.clientNum >= 1024 then return error(495,"Invalid ready client entity number") end if
    if (level.entities[cl.ps.clientNum].r.svFlags & 8) != 0 then continue end if
    if cl.readyToExit then
      ready = ready+1
      if slot < 16 then readyMask = readyMask | (1 << slot) end if
    else notReady = notReady+1 end if
  end while
  index = 0
  while index < count
    cl = level.clients[index]; index = index+1
    if cl.connected == 2 then cl.ps.stats[c.STAT_CLIENTS_READY] = readyMask end if
  end while
  if level.time < n.add32(level.intermissiontime,5000) then return void end if
  if ready == 0 then level.readyToExit = false; return void end if
  if notReady == 0 then return matchBoundary(level,2) end if
  if not level.readyToExit then level.readyToExit = true; level.exitTime = level.time end if
  if level.time < n.add32(level.exitTime,10000) then return void end if
  return matchBoundary(level,2)
end function
function checkExitRules(level)
  if level.intermissiontime != 0 then return checkIntermissionExit(level) end if
  if level.intermissionQueued != 0 then
    if n.i32(level.time-level.intermissionQueued) >= 1000 then level.intermissionQueued = 0; matchBoundary(level,1) end if
    return void
  end if
  if scoreIsTied(level) then return void end if
  if level.timelimit != 0 and level.spawner.warmupTime == 0 then
    if n.i32(level.time-level.startTime) >= n.mul32(level.timelimit,60000) then
      send(level,-1,"print \"Timelimit hit.\n\""); logExit(level,"Timelimit hit."); return void
    end if
  end if
  if level.numPlayingClients < 2 then return void end if
  if level.spawner.gametype < 4 and level.fraglimit != 0 then
    if level.teamScores[1] >= level.fraglimit then send(level,-1,"print \"Red hit the fraglimit.\n\""); logExit(level,"Fraglimit hit."); return void end if
    if level.teamScores[2] >= level.fraglimit then send(level,-1,"print \"Blue hit the fraglimit.\n\""); logExit(level,"Fraglimit hit."); return void end if
    count = clientLimit(level.maxclientsCvar); index = 0
    while index < count
      cl = level.clients[index]; index = index+1
      if cl.connected != 2 or cl.team != 0 then continue end if
      if cl.ps.persistant[c.PERS_SCORE] >= level.fraglimit then
        logExit(level,"Fraglimit hit."); send(level,-1,"print \""+cl.netname+"^7 hit the fraglimit.\n\""); return void
      end if
    end while
  end if
  if level.spawner.gametype >= 4 and level.capturelimit != 0 then
    if level.teamScores[1] >= level.capturelimit then send(level,-1,"print \"Red hit the capturelimit.\n\""); logExit(level,"Capturelimit hit."); return void end if
    if level.teamScores[2] >= level.capturelimit then send(level,-1,"print \"Blue hit the capturelimit.\n\""); logExit(level,"Capturelimit hit."); return void end if
  end if
  return void
end function
function calculateRanks(level)
  count = clientLimit(level.maxclients)
  level.follow1 = -1; level.follow2 = -1; level.numConnectedClients = 0; level.numNonSpectatorClients = 0; level.numPlayingClients = 0; level.numVotingClients = 0
  level.numteamVotingClients = array(2,0)
  // The pinned native C reset loops over TEAM_NUM_TEAMS (4), although the
  // voting array has only 2 elements. Its next writes clear spawning and
  // numSpawnVars. Preserve these observed effects through safe field writes.
  level.spawner.spawning = false; level.spawner.vars = []; index = 0
  while index < count
    slot = index; index = index+1; cl = level.clients[slot]
    if cl.connected == 0 then continue end if
    level.sortedClients[level.numConnectedClients] = slot; level.numConnectedClients = level.numConnectedClients+1
    if cl.team == 3 then continue end if
    level.numNonSpectatorClients = level.numNonSpectatorClients+1
    if cl.connected != 2 then continue end if
    level.numPlayingClients = level.numPlayingClients+1
    if (level.entities[slot].r.svFlags & 8) == 0 then
      level.numVotingClients = level.numVotingClients+1
      if cl.team == 1 then level.numteamVotingClients[0] = level.numteamVotingClients[0]+1
      else if cl.team == 2 then level.numteamVotingClients[1] = level.numteamVotingClients[1]+1 end if
    end if
    if level.follow1 == -1 then level.follow1 = slot else if level.follow2 == -1 then level.follow2 = slot end if
  end while
  rankSort.sortIndices(level,level.sortedClients,level.numConnectedClients,compareRanks)
  if level.spawner.gametype >= 3 then
    index = 0; rank = 2
    if level.teamScores[1] > level.teamScores[2] then rank = 0 else if level.teamScores[1] < level.teamScores[2] then rank = 1 end if
    while index < level.numConnectedClients
      clientAt(level,level.sortedClients[index]).ps.persistant[c.PERS_RANK] = rank; index = index+1
    end while
  else
    rank = -1; score = 0; index = 0
    while index < level.numPlayingClients
      cl = clientAt(level,level.sortedClients[index]); newScore = cl.ps.persistant[c.PERS_SCORE]
      if index == 0 or newScore != score then rank = index; cl.ps.persistant[c.PERS_RANK] = rank
      else
        clientAt(level,level.sortedClients[index-1]).ps.persistant[c.PERS_RANK] = rank | 16384; cl.ps.persistant[c.PERS_RANK] = rank | 16384
      end if
      score = newScore
      if level.spawner.gametype == 2 and level.numPlayingClients == 1 then cl.ps.persistant[c.PERS_RANK] = rank | 16384 end if
      index = index+1
    end while
  end if
  first = -9999; second = -9999
  if level.spawner.gametype >= 3 then first = level.teamScores[1]; second = level.teamScores[2]
  else
    if level.numConnectedClients > 0 then first = clientAt(level,level.sortedClients[0]).ps.persistant[c.PERS_SCORE] end if
    if level.numConnectedClients > 1 then second = clientAt(level,level.sortedClients[1]).ps.persistant[c.PERS_SCORE] end if
  end if
  values.setConfig(level.spawner,6,str(first)); values.setConfig(level.spawner,7,str(second)); checkExitRules(level)
  if level.intermissiontime != 0 then sendAll(level) end if
  return void
end function
function scorePlum(level,ent,origin,score)
  plum = game.tempEntity(level,origin,c.EV_SCOREPLUM)
  plum.r.svFlags = plum.r.svFlags | 256; plum.r.singleClient = ent.s.number
  plum.s.otherEntityNum = ent.s.number; plum.s.time = score
  return void
end function
function addScore(level,ent,origin,score)
  if ent.client == void or level.spawner.warmupTime != 0 then return void end if
  scorePlum(level,ent,origin,score); ent.client.ps.persistant[c.PERS_SCORE] = n.add32(ent.client.ps.persistant[c.PERS_SCORE],score)
  if level.spawner.gametype == 3 then
    team = ent.client.ps.persistant[c.PERS_TEAM]
    if team < 0 or team >= 4 then return error(495,"Invalid score team index") end if
    level.teamScores[team] = n.add32(level.teamScores[team],score)
  end if
  return calculateRanks(level)
end function
