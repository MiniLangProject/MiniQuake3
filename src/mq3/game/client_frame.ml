// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 ClientEndFrame and its damage, environment, spectator and
// predictable-event helpers from code/game/g_active.c.
package mq3.game.client_frame
import mq3.game.game_headers as headers
import mq3.game.constants as c
import mq3.game.entities as game
import mq3.game.playerstate as playerstate
import mq3.game.snapshot as snapshot
import mq3.game.events as events
import mq3.game.combat as combat
import mq3.game.spawn_values as values
import mq3.shared.math as q
import mq3.compat.numeric as n

/// Player movement-state bit indicating follow.
const PMF_FOLLOW = 4096
/// Player movement-state bit indicating scoreboard.
const PMF_SCOREBOARD = 8192
/// Network entity-flag bit indicating player event.
const EF_PLAYER_EVENT = 0x00000010
/// Network entity-flag bit indicating connection.
const EF_CONNECTION = 0x00002000
/// Network entity-flag bit indicating voted.
const EF_VOTED = 0x00004000
/// Network entity-flag bit indicating teamvoted.
const EF_TEAMVOTED = 0x00080000
/// Game entity-flag bit enabling or marking godmode.
const FL_GODMODE = 0x00000010
/// Collision-contents bit identifying lava space or objects.
const CONTENTS_LAVA=headers.CONTENTS_LAVA
/// Collision-contents bit identifying slime space or objects.
const CONTENTS_SLIME=headers.CONTENTS_SLIME
/// Server entity-flag bit controlling notsingleclient.
const SVF_NOTSINGLECLIENT = 0x00000800
/// Damage-processing flag enabling no armor.
const DAMAGE_NO_ARMOR = 0x00000002
/// Audio channel identifier selecting voice playback.
const CHAN_VOICE = 2
/// Spectator-state identifier selecting free.
const SPECTATOR_FREE = 1
/// Spectator-state identifier selecting follow.
const SPECTATOR_FOLLOW = 2
/// Spectator-state identifier selecting scoreboard.
const SPECTATOR_SCOREBOARD = 3
/// Player-state statistics index storing persistant powerup.
const STAT_PERSISTANT_POWERUP = 7

/// Test `level.spawner != void and level.spawner.missionpack` as the condition for `missionpack`.
/// @param level Game-level state; accesses `spawner`.
function missionpack(level)
  return level.spawner != void and level.spawner.missionpack
end function

/// Apply `mq3.game.client_frame.missionpack` and `mq3.game.constants.missionpackItemTag` while evaluating `persistentTag`. Return paths include `c.missionpackItemTag(index)`.
/// @param level Game-level state; accesses `spawner`.
/// @param client Client state; accesses `ps`.
function persistentTag(level,client)
  if not missionpack(level) then return c.PW_NONE end if
  index = client.ps.stats[STAT_PERSISTANT_POWERUP]
  if index < 0 or index >= 52 then return c.PW_NONE end if
  return c.missionpackItemTag(index)
end function

/// Set `player.pain_debounce_time` to `n.add32(level.time,700)` in `mq3.game.client_frame.damageFeedback`.
/// @param level Game-level state; accesses `time`.
/// @param player Player entity; accesses `client`, `pain_debounce_time`, `flags` and `health`. May update `player.pain_debounce_time` in place.
function damageFeedback(level,player)
  client = player.client
  if client.ps.pm_type == c.PM_DEAD then return void end if
  count = n.f32(n.add32(client.damage_blood,client.damage_armor))
  if count == 0 then return void end if
  if count > 255 then count = n.f32(255) end if
  if client.damage_fromWorld then
    client.ps.damagePitch = 255; client.ps.damageYaw = 255; client.damage_fromWorld = false
  else
    angles = q.vectoangles(client.damage_from)
    client.ps.damagePitch = n.trunc32((angles[0]/360.0)*256.0)
    client.ps.damageYaw = n.trunc32((angles[1]/360.0)*256.0)
  end if
  if level.time > player.pain_debounce_time and (player.flags & FL_GODMODE) == 0 then
    player.pain_debounce_time = n.add32(level.time,700); events.add(level,player,c.EV_PAIN,player.health)
    client.ps.damageEvent = n.add32(client.ps.damageEvent,1)
  end if
  client.ps.damageCount = n.trunc32(count)
  client.damage_blood = 0; client.damage_armor = 0; client.damage_knockback = 0
  return void
end function

/// Apply `mq3.game.spawn_values.soundIndex` while evaluating `soundIndex`. Return paths include `values.soundIndex(level.spawner,name)`.
/// @param level Game-level state; accesses `spawner`.
/// @param name Name used to identify the requested entry.
function soundIndex(level,name)
  if level.spawner == void then return error(498,"ClientEndFrame requires game spawn state for sounds") end if
  return values.soundIndex(level.spawner,name)
end function

/// Update `ent.damage` and `ent.pain_debounce_time` during `worldEffects`.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `client`, `waterlevel`, `health`, `damage` and `pain_debounce_time` and related fields. May update `ent.damage` and `ent.pain_debounce_time` in place.
function worldEffects(level,ent)
  client = ent.client
  if client.noclip then client.airOutTime = n.add32(level.time,12000); return void end if
  waterlevel = ent.waterlevel; envirosuit = client.ps.powerups[c.PW_BATTLESUIT] > level.time
  if waterlevel == 3 then
    if envirosuit then client.airOutTime = n.add32(level.time,10000) end if
    if client.airOutTime < level.time then
      client.airOutTime = n.add32(client.airOutTime,1000)
      if ent.health > 0 then
        ent.damage = n.add32(ent.damage,2); if ent.damage > 15 then ent.damage = 15 end if
        index = 0
        if ent.health <= ent.damage then index = soundIndex(level,"*drown.wav")
        else if (game.random(level) & 1) != 0 then index = soundIndex(level,"sound/player/gurp1.wav")
        else index = soundIndex(level,"sound/player/gurp2.wav") end if
        events.sound(level,ent,CHAN_VOICE,index); ent.pain_debounce_time = n.add32(level.time,200)
        combat.damage(level,ent,void,void,void,void,ent.damage,DAMAGE_NO_ARMOR,c.MOD_WATER)
      end if
    end if
  else
    client.airOutTime = n.add32(level.time,12000); ent.damage = 2
  end if
  if waterlevel != 0 and (ent.watertype & (CONTENTS_LAVA | CONTENTS_SLIME)) != 0 and ent.health > 0 and ent.pain_debounce_time <= level.time then
    if envirosuit then events.add(level,ent,c.EV_POWERUP_BATTLESUIT,0)
    else
      if (ent.watertype & CONTENTS_LAVA) != 0 then combat.damage(level,ent,void,void,void,void,n.mul32(30,waterlevel),0,c.MOD_LAVA) end if
      if (ent.watertype & CONTENTS_SLIME) != 0 then combat.damage(level,ent,void,void,void,void,n.mul32(10,waterlevel),0,c.MOD_SLIME) end if
    end if
  end if
  return void
end function

/// Set `ent.client.ps.loopSound` to `level.sndFry` and `ent.client.ps.loopSound` to `0` in `mq3.game.client_frame.setClientSound`.
/// @param level Game-level state; accesses `sndFry`.
/// @param ent Game entity; accesses `waterlevel`, `watertype` and `client`. May update `ent.client.ps.loopSound` in place.
function setClientSound(level,ent)
  if ent.waterlevel != 0 and (ent.watertype & (CONTENTS_LAVA | CONTENTS_SLIME)) != 0 then ent.client.ps.loopSound = level.sndFry
  else ent.client.ps.loopSound = 0 end if
  return void
end function

/// Set `ps.externalEvent` to `0` and `ps.externalEvent` to `external` in `mq3.game.client_frame.sendPendingPredictableEvents`.
/// @param level Game-level state; accesses `time`.
/// @param ps Player movement state; accesses `entityEventSequence`, `eventSequence`, `events`, `externalEvent` and `origin` and related fields. May update `ps.externalEvent` in place.
function sendPendingPredictableEvents(level,ps)
  if ps.entityEventSequence >= ps.eventSequence then return void end if
  seq = ps.entityEventSequence & 1; event = ps.events[seq] | ((ps.entityEventSequence & 3) << 8)
  external = ps.externalEvent; ps.externalEvent = 0
  temp = game.tempEntity(level,ps.origin,event); number = temp.s.number
  snapshot.fromPlayer(ps,temp.s,true); temp.s.number = number; temp.s.eType = c.ET_EVENTS+event
  temp.s.eFlags = temp.s.eFlags | EF_PLAYER_EVENT; temp.s.otherEntityNum = ps.clientNum
  temp.r.svFlags = temp.r.svFlags | SVF_NOTSINGLECLIENT; temp.r.singleClient = ps.clientNum
  ps.externalEvent = external
  return void
end function

/// Use `level.clientBeginFn` to perform `spectatorEndFrame`.
/// @param level Game-level state; accesses `follow1`, `follow2`, `clients` and `clientBeginFn`.
/// @param ent Game entity; accesses `client` and `slot`.
function spectatorEndFrame(level,ent)
  client = ent.client
  if client.spectatorState == SPECTATOR_FOLLOW then
    clientNum = client.spectatorClient
    if clientNum == -1 then clientNum = level.follow1 else if clientNum == -2 then clientNum = level.follow2 end if
    if clientNum >= 0 then
      followed = level.clients[clientNum]
      if followed.connected == 2 and followed.team != c.TEAM_SPECTATOR then
        flags = (followed.ps.eFlags & ~(EF_VOTED | EF_TEAMVOTED)) | (client.ps.eFlags & (EF_VOTED | EF_TEAMVOTED))
        client.ps = playerstate.copy(followed.ps); client.ps.pm_flags = client.ps.pm_flags | PMF_FOLLOW; client.ps.eFlags = flags
        return void
      else if client.spectatorClient >= 0 then
        client.spectatorState = SPECTATOR_FREE
        if level.clientBeginFn == void then return error(498,"Spectator follow loss requires ClientBegin") end if
        level.clientBeginFn(level,ent.slot)
      end if
    end if
  end if
  if client.spectatorState == SPECTATOR_SCOREBOARD then client.ps.pm_flags = client.ps.pm_flags | PMF_SCOREBOARD
  else client.ps.pm_flags = client.ps.pm_flags & ~PMF_SCOREBOARD end if
  return void
end function

/// Set `ent.s.eFlags` to `ent.s.eFlags | EF_CONNECTION` and `ent.s.eFlags` to `ent.s.eFlags & ~EF_CONNECTION` in `mq3.game.client_frame.endFrame`.
/// @param level Game-level state; accesses `time`, `intermissiontime` and `smoothClients`.
/// @param ent Game entity; accesses `client`, `s` and `health`. May update `ent.s.eFlags` in place.
function endFrame(level,ent)
  client = ent.client
  if client.team == c.TEAM_SPECTATOR then return spectatorEndFrame(level,ent) end if
  for index = 0 to 15
    if client.ps.powerups[index] < level.time then client.ps.powerups[index] = 0 end if
  end for
  if missionpack(level) then
    tag = persistentTag(level,client)
    if tag == c.PW_GUARD then client.ps.powerups[c.PW_GUARD] = level.time end if
    if tag == c.PW_SCOUT then client.ps.powerups[c.PW_SCOUT] = level.time end if
    if tag == c.PW_DOUBLER then client.ps.powerups[c.PW_DOUBLER] = level.time end if
    if tag == c.PW_AMMOREGEN then client.ps.powerups[c.PW_AMMOREGEN] = level.time end if
    if client.invulnerabilityTime > level.time then client.ps.powerups[c.PW_INVULNERABILITY] = level.time end if
  end if
  if level.intermissiontime != 0 then return void end if
  worldEffects(level,ent); damageFeedback(level,ent)
  if n.i32(level.time-client.lastCmdTime) > 1000 then ent.s.eFlags = ent.s.eFlags | EF_CONNECTION
  else ent.s.eFlags = ent.s.eFlags & ~EF_CONNECTION end if
  client.ps.stats[c.STAT_HEALTH] = ent.health; setClientSound(level,ent)
  if level.smoothClients then snapshot.extrapolate(client.ps,ent.s,client.ps.commandTime,true)
  else snapshot.fromPlayer(client.ps,ent.s,true) end if
  sendPendingPredictableEvents(level,client.ps)
  return void
end function
