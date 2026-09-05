// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 ClientSpawn orchestration. ClientThink, ClientEndFrame and engine
// user-command/userinfo delivery remain explicit host boundaries.
package mq3.game.client_spawn
import mq3.game.constants as c
import mq3.game.entities as game
import mq3.game.playerstate as playerstate
import mq3.game.player_spawns as spawns
import mq3.game.teleport as teleport
import mq3.game.snapshot as snapshot
import mq3.game.targets as targets
import mq3.game.movement as movement
import mq3.compat.numeric as n
import mq3.compat.textnumbers as textnum
import std.string as strings

const EF_TELEPORT_BIT = 0x00000004
const EF_KAMIKAZE = 0x00000200
const EF_VOTED = 0x00004000
const EF_TEAMVOTED = 0x00080000
const PMF_TIME_KNOCKBACK = 64
const PMF_RESPAWNED = 512
const FL_NO_BOTS = 0x00002000
const FL_NO_HUMANS = 0x00004000
const SVF_BOT = 0x00000008
const CONTENTS_BODY = 0x02000000
const MASK_PLAYERSOLID = 0x02010001

function infoValue(info,key)
  if info == void then return "" end if
  fields = strings.split(info,"\\")
  index = 0
  if len(fields) > 0 and fields[0] == "" then index = 1 end if
  while index+1 < len(fields)
    if fields[index] == key then return fields[index+1] end if
    index = index+2
  end while
  return ""
end function

function clearTransient(client,savedPing,persistant,eventSequence)
  client.ps = playerstate.create(); client.ps.ping = savedPing
  for index = 0 to 15
    client.ps.persistant[index] = persistant[index]
  end for
  client.ps.eventSequence = eventSequence
  client.readyToExit = false; client.noclip = false
  client.lastCmdTime = 0; client.buttons = 0; client.oldbuttons = 0; client.latched_buttons = 0
  client.oldOrigin = [0.0,0.0,0.0]
  client.damage_armor = 0; client.damage_blood = 0; client.damage_knockback = 0
  client.damage_from = [0.0,0.0,0.0]; client.damage_fromWorld = false
  client.accurateCount = 0; client.lastkilled_client = -1; client.lasthurt_client = 0; client.lasthurt_mod = 0
  client.respawnTime = 0; client.inactivityTime = 0; client.inactivityWarning = false
  client.rewardTime = 0; client.airOutTime = 0; client.lastKillTime = 0
  client.fireHeld = false; client.hook = void; client.switchTeamTime = 0; client.timeResidual = 0
  return void
end function

function selectPoint(level,ent,client,origin,angles)
  if client.team == c.TEAM_SPECTATOR then
    spawns.spectator(level,origin,angles); return void
  end if
  if level.spawner.gametype >= 4 then return spawns.ctf(level,client.team,client.teamStateState,origin,angles) end if
  spot = void
  while true
    if not client.initialSpawn and client.localClient then
      client.initialSpawn = true; spot = spawns.initial(level,origin,angles)
    else
      spot = spawns.selectSpawn(level,client.ps.origin,origin,angles)
    end if
    if (spot.flags & FL_NO_BOTS) != 0 and (ent.r.svFlags & SVF_BOT) != 0 then continue end if
    if (spot.flags & FL_NO_HUMANS) != 0 and (ent.r.svFlags & SVF_BOT) == 0 then continue end if
    return spot
  end while
end function

function spawn(level,ent,dieFn)
  index = ent.slot
  if index < 0 or index >= len(level.clients) or ent.client == void or ent.client != level.clients[index] then return error(496,"ClientSpawn requires its persistent client slot") end if
  if level.spawner == void then return error(496,"ClientSpawn requires game spawn state") end if
  client = ent.client; spawnOrigin = [0.0,0.0,0.0]; spawnAngles = [0.0,0.0,0.0]
  spawnPoint = selectPoint(level,ent,client,spawnOrigin,spawnAngles)
  client.teamStateState = 1
  ent.s.eFlags = ent.s.eFlags & ~EF_KAMIKAZE
  flags = client.ps.eFlags & (EF_TELEPORT_BIT | EF_VOTED | EF_TEAMVOTED); flags = flags ^ EF_TELEPORT_BIT

  savedPing = client.ps.ping; accuracyHits = client.accuracy_hits; accuracyShots = client.accuracy_shots
  persistant = []
  for index = 0 to 15
    persistant = persistant+[client.ps.persistant[index]]
  end for
  eventSequence = client.ps.eventSequence
  clearTransient(client,savedPing,persistant,eventSequence)
  client.accuracy_hits = accuracyHits; client.accuracy_shots = accuracyShots
  client.ps.persistant[c.PERS_SPAWN_COUNT] = n.add32(client.ps.persistant[c.PERS_SPAWN_COUNT],1)
  client.ps.persistant[c.PERS_TEAM] = client.team
  client.airOutTime = n.add32(level.time,12000)

  if level.userinfoFn == void then return error(496,"ClientSpawn requires userinfo delivery") end if
  client.maxHealth = textnum.atoi(infoValue(level.userinfoFn(level,ent.slot),"handicap"))
  if client.maxHealth < 1 or client.maxHealth > 100 then client.maxHealth = 100 end if
  client.ps.stats[c.STAT_MAX_HEALTH] = client.maxHealth; client.ps.eFlags = flags

  ent.s.groundEntityNum = 1023; ent.client = level.clients[ent.slot]
  ent.takedamage = true; ent.inuse = true; ent.classname = "player"; ent.r.contents = CONTENTS_BODY
  ent.clipmask = MASK_PLAYERSOLID; ent.die = dieFn; ent.waterlevel = 0; ent.watertype = 0; ent.flags = 0
  ent.r.mins = [-15.0,-15.0,-24.0]; ent.r.maxs = [15.0,15.0,32.0]

  client.ps.clientNum = ent.slot; client.ps.stats[c.STAT_WEAPONS] = 1 << c.WP_MACHINEGUN
  if level.spawner.gametype == 3 then client.ps.ammo[c.WP_MACHINEGUN] = 50 else client.ps.ammo[c.WP_MACHINEGUN] = 100 end if
  client.ps.stats[c.STAT_WEAPONS] = client.ps.stats[c.STAT_WEAPONS] | (1 << c.WP_GAUNTLET)
  client.ps.ammo[c.WP_GAUNTLET] = -1; client.ps.ammo[c.WP_GRAPPLING_HOOK] = -1
  client.ps.stats[c.STAT_HEALTH] = n.add32(client.ps.stats[c.STAT_MAX_HEALTH],25); ent.health = client.ps.stats[c.STAT_HEALTH]
  game.setOrigin(ent,spawnOrigin); client.ps.origin = movement.copy(spawnOrigin); client.ps.pm_flags = client.ps.pm_flags | PMF_RESPAWNED

  if level.usercmdFn == void then return error(496,"ClientSpawn requires user-command delivery") end if
  level.usercmdFn(level,ent.slot,client); teleport.setClientViewAngle(ent,spawnAngles)
  if client.team != c.TEAM_SPECTATOR then
    teleport.killBox(level,ent); game.link(level,ent); client.ps.weapon = c.WP_MACHINEGUN; client.ps.weaponstate = c.WEAPON_READY
  end if
  client.ps.pm_flags = client.ps.pm_flags | PMF_TIME_KNOCKBACK; client.ps.pm_time = 100
  client.respawnTime = level.time; client.inactivityTime = n.add32(level.time,n.mul32(level.inactivity,1000)); client.latched_buttons = 0
  client.ps.torsoAnim = c.TORSO_STAND; client.ps.legsAnim = c.LEGS_IDLE

  if level.intermissiontime != 0 then
    if level.moveIntermissionFn == void then return error(496,"ClientSpawn requires intermission placement") end if
    level.moveIntermissionFn(level,ent)
  else
    targets.useTargets(level,spawnPoint,ent); client.ps.weapon = c.WP_GAUNTLET; weapon = c.WP_NUM_WEAPONS-1
    while weapon > 0
      if (client.ps.stats[c.STAT_WEAPONS] & (1 << weapon)) != 0 then client.ps.weapon = weapon; break end if
      weapon = weapon-1
    end while
  end if

  client.ps.commandTime = n.add32(level.time,-100); client.cmdServerTime = level.time
  if level.clientThinkFn == void then return error(496,"ClientSpawn requires ClientThink") end if
  level.clientThinkFn(level,ent.slot)
  if client.team != c.TEAM_SPECTATOR then
    snapshot.fromPlayer(client.ps,ent.s,true); ent.r.currentOrigin = movement.copy(client.ps.origin); game.link(level,ent)
  end if
  if level.clientEndFrameFn == void then return error(496,"ClientSpawn requires ClientEndFrame") end if
  level.clientEndFrameFn(level,ent); snapshot.fromPlayer(client.ps,ent.s,true)
  return void
end function
