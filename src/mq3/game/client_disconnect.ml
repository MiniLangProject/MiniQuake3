// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 ClientDisconnect: engine callback, after an engine-side disconnect.
package mq3.game.client_disconnect
import mq3.game.entities as game
import mq3.game.team_changes as teamChanges
import mq3.game.client_info as clientInfo
import mq3.game.deaths as deaths
import mq3.game.scores as scores
import mq3.game.votes as votes
import mq3.game.spawn_values as values
import mq3.game.constants as c
import mq3.compat.numeric as n
import mq3.game.bot_clients as botClients

function disconnect(level,slot)
  if slot < 0 or slot >= 64 then return error(492,"Invalid disconnecting client slot") end if
  if level.removeQueuedBotBeginFn != void then level.removeQueuedBotBeginFn(level,slot)
  else
    if level.lifecycleState == void or level.lifecycleState.botClients == void then return error(492,"Disconnect requires bot begin queue removal") end if
    botClients.removeQueuedBotBegin(level.lifecycleState.botClients,slot)
  end if
  ent = level.entities[slot]
  if ent.client == void then return void end if
  clientInfo.infoClientLimit(level); index = 0
  while index < level.maxclients
    client = level.clients[index]
    if client.team == 3 and client.spectatorState == 2 and client.spectatorClient == slot then teamChanges.stopFollowing(level,level.entities[index]) end if
    index = index+1
  end while
  if ent.client.connected == 2 and ent.client.team != 3 then
    event = game.tempEntity(level,ent.client.ps.origin,c.EV_PLAYER_TELEPORT_OUT); event.s.clientNum = ent.s.clientNum
    deaths.tossClientItems(level,ent)
  end if
  if level.gameLogFn == void then return error(492,"Disconnect requires game-log delivery") end if
  level.gameLogFn(level,"ClientDisconnect: "+str(slot)+"\n")
  if level.spawner == void then return error(492,"Disconnect requires game spawn state") end if
  if level.spawner.gametype == 1 and level.intermissiontime == 0 and level.spawner.warmupTime == 0 and level.sortedClients[1] == slot then
    winner = level.sortedClients[0]
    if winner < 0 or winner >= 64 then return error(492,"Invalid disconnect tournament winner") end if
    level.clients[winner].wins = n.add32(level.clients[winner].wins,1); votes.userinfoChanged(level,winner)
  end if
  game.unlink(level,ent); ent.s.modelindex = 0; ent.inuse = false; ent.classname = "disconnected"
  ent.client.connected = 0; ent.client.ps.persistant[c.PERS_TEAM] = 0; ent.client.team = 0
  values.setConfig(level.spawner,544+slot,""); scores.calculateRanks(level)
  if (ent.r.svFlags & 8) != 0 then
    if level.botShutdownFn != void then level.botShutdownFn(level,slot,false)
    else
      if level.lifecycleState == void or level.lifecycleState.botState == void then return error(492,"Disconnect requires bot shutdown") end if
      botState = level.lifecycleState.botState
      if botState.shutdownClientFn == void then return error(492,"Disconnect requires bot shutdown") end if
      botState.shutdownClientFn(botState,slot,false)
    end if
  end if
  return void
end function
