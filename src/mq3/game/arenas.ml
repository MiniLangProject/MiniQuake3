// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 single-player postgame reporting and victory podium from g_arenas.c.
package mq3.game.arenas
import mq3.game.game_headers as headers
import mq3.game.entities as game
import mq3.game.entitystate as entityState
import mq3.game.constants as c
import mq3.game.spawn_values as values
import mq3.game.scores as scores
import mq3.game.events as events
import mq3.shared.math as q
import mq3.qcommon.cvar as cv
import mq3.compat.numeric as n
import mq3.game.game_internal_headers as internal

const CONTENTS_SOLID=headers.CONTENTS_SOLID
const CONTENTS_PLAYERCLIP=headers.CONTENTS_PLAYERCLIP
const CONTENTS_BODY=headers.CONTENTS_BODY
const ENTITYNUM_WORLD = 1022
const ANIM_TOGGLEBIT = 128
const TIMER_GESTURE = internal.TIMER_GESTURE

function clientLimit(limit)
  if limit < 0 or limit > 64 then return error(498,"Invalid arena client limit") end if
  return limit
end function

function cvarInteger(level,name)
  if level.spawner == void then return error(498,"Arena presentation requires game spawn state") end if
  variable = cv.find(level.spawner.cvars,name)
  if variable == void then return 0 end if
  return variable.integer
end function

function updateTournamentInfo(level)
  count = clientLimit(level.maxclients); slot = 0; player = void
  while slot < count
    candidate = level.entities[slot]
    if candidate.inuse and (candidate.r.svFlags & 8) == 0 then player = candidate; break end if
    slot = slot+1
  end while
  if player == void then return void end if
  if player.client == void then return error(498,"Single-player postgame player has no client") end if
  scores.calculateRanks(level)
  client = level.clients[slot]; message = ""
  missionpack = level.spawner != void and level.spawner.missionpack
  if client.team == c.TEAM_SPECTATOR then
    if missionpack then message = "postgame "+str(level.numNonSpectatorClients)+" "+str(slot)+" 0 0 0 0 0 0 0 0 0 0 0"
    else message = "postgame "+str(level.numNonSpectatorClients)+" "+str(slot)+" 0 0 0 0 0 0" end if
  else
    accuracy = 0
    if player.client.accuracy_shots != 0 then accuracy = scores.integerDivide(n.mul32(player.client.accuracy_hits,100),player.client.accuracy_shots) end if
    perfect = 0
    if missionpack then
      won = false; score1 = 0; score2 = 0
      if level.spawner.gametype >= 4 then
        score1 = level.teamScores[c.TEAM_RED]; score2 = level.teamScores[c.TEAM_BLUE]
        if client.team == c.TEAM_RED then won = score1 > score2
        else won = score2 > score1 end if
      else
        first = level.sortedClients[0]; second = level.sortedClients[1]
        if slot == first then
          won = true; score1 = level.clients[first].ps.persistant[c.PERS_SCORE]; score2 = level.clients[second].ps.persistant[c.PERS_SCORE]
        else
          score2 = level.clients[first].ps.persistant[c.PERS_SCORE]; score1 = level.clients[second].ps.persistant[c.PERS_SCORE]
        end if
      end if
      if won and player.client.ps.persistant[c.PERS_KILLED] == 0 then perfect = 1 end if
      message = "postgame "+str(level.numNonSpectatorClients)+" "+str(slot)+" "+str(accuracy)+" "+
        str(player.client.ps.persistant[c.PERS_IMPRESSIVE_COUNT])+" "+str(player.client.ps.persistant[c.PERS_EXCELLENT_COUNT])+" "+
        str(player.client.ps.persistant[c.PERS_DEFEND_COUNT])+" "+str(player.client.ps.persistant[c.PERS_ASSIST_COUNT])+" "+
        str(player.client.ps.persistant[c.PERS_GAUNTLET_FRAG_COUNT])+" "+str(player.client.ps.persistant[c.PERS_SCORE])+" "+str(perfect)+" "+
        str(score1)+" "+str(score2)+" "+str(level.time)+" "+str(player.client.ps.persistant[c.PERS_CAPTURES])
    else
      if client.ps.persistant[c.PERS_RANK] == 0 and player.client.ps.persistant[c.PERS_KILLED] == 0 then perfect = 1 end if
      message = "postgame "+str(level.numNonSpectatorClients)+" "+str(slot)+" "+str(accuracy)+" "+
        str(player.client.ps.persistant[c.PERS_IMPRESSIVE_COUNT])+" "+str(player.client.ps.persistant[c.PERS_EXCELLENT_COUNT])+" "+
        str(player.client.ps.persistant[c.PERS_GAUNTLET_FRAG_COUNT])+" "+str(player.client.ps.persistant[c.PERS_SCORE])+" "+str(perfect)
    end if
  end if
  msglen = len(bytes(message)); index = 0
  while index < level.numNonSpectatorClients
    ranked = level.sortedClients[index]
    if ranked < 0 or ranked >= 64 then return error(498,"Invalid postgame ranked client") end if
    rankedClient = level.clients[ranked]
    part = " "+str(ranked)+" "+str(rankedClient.ps.persistant[c.PERS_RANK])+" "+str(rankedClient.ps.persistant[c.PERS_SCORE])
    partlen = len(bytes(part))
    if msglen+partlen+1 >= 1024 then break end if
    message = message+part; msglen = msglen+partlen; index = index+1
  end while
  if level.consoleCommandFn == void then return error(498,"Single-player postgame requires console-command delivery") end if
  level.consoleCommandFn(level,2,message); return void
end function

function padPoint(pad,offset,angles)
  vectors = q.AngleVectors(angles); point = q.VectorMA(pad.r.currentOrigin,offset[0],vectors[0])
  point = q.VectorMA(point,offset[1],vectors[1]); return q.VectorMA(point,offset[2],vectors[2])
end function

function faceFromPodium(level,podium,ent)
  direction = [n.fsub(level.intermission_origin[0],podium.r.currentOrigin[0]),n.fsub(level.intermission_origin[1],podium.r.currentOrigin[1]),n.fsub(level.intermission_origin[2],podium.r.currentOrigin[2])]
  angles = q.vectoangles(direction); angles[0] = 0.0; angles[2] = 0.0; ent.s.apos.trBase = angles
  return angles
end function

function spawnModelOnVictoryPad(level,pad,offset,ent,place)
  if pad == void or ent == void or ent.client == void then return error(498,"Victory-pad model requires podium and client") end if
  body = game.spawn(level); body.classname = ent.client.netname; body.client = ent.client; body.s = entityState.copy(ent.s)
  body.s.eType = c.ET_PLAYER; body.s.eFlags = 0; body.s.powerups = 0; body.s.loopSound = 0; body.s.number = body.slot
  body.timestamp = level.time; body.physicsObject = true; body.physicsBounce = 0.0; body.s.event = 0
  body.s.pos.trType = c.TR_STATIONARY; body.s.groundEntityNum = ENTITYNUM_WORLD; body.s.legsAnim = c.LEGS_IDLE; body.s.torsoAnim = c.TORSO_STAND
  if body.s.weapon == c.WP_NONE then body.s.weapon = c.WP_MACHINEGUN end if
  if body.s.weapon == c.WP_GAUNTLET then body.s.torsoAnim = c.TORSO_STAND2 end if
  body.s.event = 0; body.r.svFlags = ent.r.svFlags
  body.r.mins = [ent.r.mins[0],ent.r.mins[1],ent.r.mins[2]]; body.r.maxs = [ent.r.maxs[0],ent.r.maxs[1],ent.r.maxs[2]]
  body.r.absmin = [ent.r.absmin[0],ent.r.absmin[1],ent.r.absmin[2]]; body.r.absmax = [ent.r.absmax[0],ent.r.absmax[1],ent.r.absmax[2]]
  body.clipmask = CONTENTS_SOLID | CONTENTS_PLAYERCLIP; body.r.contents = CONTENTS_BODY; body.r.ownerNum = ent.r.ownerNum; body.takedamage = false
  angles = faceFromPodium(level,pad,body); game.setOrigin(body,padPoint(pad,offset,angles)); game.link(level,body); body.count = place
  return body
end function

function celebrateStop(level,player)
  anim = c.TORSO_STAND
  if player.s.weapon == c.WP_GAUNTLET then anim = c.TORSO_STAND2 end if
  player.s.torsoAnim = ((player.s.torsoAnim & ANIM_TOGGLEBIT)^ANIM_TOGGLEBIT)|anim
  return void
end function

function celebrateStart(level,player)
  player.s.torsoAnim = ((player.s.torsoAnim & ANIM_TOGGLEBIT)^ANIM_TOGGLEBIT)|c.TORSO_GESTURE
  player.nextthink = n.add32(level.time,TIMER_GESTURE); player.think = celebrateStop; events.add(level,player,c.EV_TAUNT,0)
  return void
end function

function podiumPlacementThink(level,podium)
  podium.nextthink = n.add32(level.time,100); vectors = q.AngleVectors(level.intermission_angle)
  origin = q.VectorMA(level.intermission_origin,cvarInteger(level,"g_podiumDist"),vectors[0]); origin[2] = n.fsub(origin[2],cvarInteger(level,"g_podiumDrop")); game.setOrigin(podium,origin)
  if level.podium1 != void then angles = faceFromPodium(level,podium,level.podium1); game.setOrigin(level.podium1,padPoint(podium,[0.0,0.0,74.0],angles)) end if
  if level.podium2 != void then angles = faceFromPodium(level,podium,level.podium2); game.setOrigin(level.podium2,padPoint(podium,[-10.0,60.0,54.0],angles)) end if
  if level.podium3 != void then angles = faceFromPodium(level,podium,level.podium3); game.setOrigin(level.podium3,padPoint(podium,[-19.0,-60.0,45.0],angles)) end if
  return void
end function

function spawnPodium(level)
  podium = game.spawn(level); podium.classname = "podium"; podium.s.eType = c.ET_GENERAL; podium.s.number = podium.slot
  podium.clipmask = CONTENTS_SOLID; podium.r.contents = CONTENTS_SOLID; podium.s.modelindex = values.modelIndex(level.spawner,"models/mapobjects/podium/podium4.md3")
  vectors = q.AngleVectors(level.intermission_angle); origin = q.VectorMA(level.intermission_origin,cvarInteger(level,"g_podiumDist"),vectors[0])
  origin[2] = n.fsub(origin[2],cvarInteger(level,"g_podiumDrop")); game.setOrigin(podium,origin)
  direction = [n.fsub(level.intermission_origin[0],podium.r.currentOrigin[0]),n.fsub(level.intermission_origin[1],podium.r.currentOrigin[1]),n.fsub(level.intermission_origin[2],podium.r.currentOrigin[2])]
  podium.s.apos.trBase[1] = q.vectoangles(direction)[1]; game.link(level,podium)
  podium.think = podiumPlacementThink; podium.nextthink = n.add32(level.time,100); return podium
end function

function spawnModelsOnVictoryPads(level)
  level.podium1 = void; level.podium2 = void; level.podium3 = void; podium = spawnPodium(level)
  first = level.sortedClients[0]; second = level.sortedClients[1]
  if first < 0 or first >= 64 or second < 0 or second >= 64 then return error(498,"Invalid victory-pad ranked client") end if
  player = spawnModelOnVictoryPad(level,podium,[0.0,0.0,74.0],level.entities[first],level.clients[first].ps.persistant[c.PERS_RANK] & ~16384)
  player.nextthink = n.add32(level.time,2000); player.think = celebrateStart; level.podium1 = player
  level.podium2 = spawnModelOnVictoryPad(level,podium,[-10.0,60.0,54.0],level.entities[second],level.clients[second].ps.persistant[c.PERS_RANK] & ~16384)
  if level.numNonSpectatorClients > 2 then
    third = level.sortedClients[2]
    if third < 0 or third >= 64 then return error(498,"Invalid third victory-pad client") end if
    level.podium3 = spawnModelOnVictoryPad(level,podium,[-19.0,-60.0,45.0],level.entities[third],level.clients[third].ps.persistant[c.PERS_RANK] & ~16384)
  end if
  return void
end function

function abortPodium(level,argv)
  if level.spawner == void then return error(498,"Podium abort requires game spawn state") end if
  if level.spawner.gametype != 2 then return void end if
  if level.podium1 != void then level.podium1.nextthink = level.time; level.podium1.think = celebrateStop end if
  return void
end function
