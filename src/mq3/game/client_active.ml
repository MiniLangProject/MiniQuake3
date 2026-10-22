// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 ClientThink, G_RunClient and their closed helpers from g_active.c.
package mq3.game.client_active
import mq3.game.constants as c
import mq3.game.entities as game
import mq3.game.pmove as pmove
import mq3.game.movement as movement
import mq3.game.snapshot as snapshot
import mq3.game.client_frame as clientFrame
import mq3.game.triggers as triggers
import mq3.game.events as events
import mq3.game.combat as combat
import mq3.game.g_items as gItems
import mq3.game.player_spawns as spawns
import mq3.game.teleport as teleport
import mq3.game.missiles as missiles
import mq3.game.follow_commands as followCommands
import mq3.game.weapons as activeWeapons
import mq3.game.g_weapon as completeWeapons
import mq3.game.g_misc as gMisc
import mq3.collision.brush as brush
import mq3.server.world as sv
import mq3.compat.numeric as n
import mq3.compat.textnumbers as textnum

const BUTTON_ATTACK = 1
const BUTTON_TALK = 2
const BUTTON_USE_HOLDABLE = 4
const BUTTON_GESTURE = 8
const EF_FIRING = 0x00000100
const EF_TALK = 0x00001000
const AWARD_MASK = 0x00038848
const FL_FORCE_GESTURE = 0x00008000
const SVF_BOT = 0x00000008
const CONTENTS_BODY = 0x02000000
const CONTENTS_BOTCLIP = 0x00400000
const MASK_PLAYERSOLID = 0x02010001
const DF_NO_FALLING = 8
const DF_NO_FOOTSTEPS = 32
const SPECTATOR_FOLLOW = 2
const SPECTATOR_SCOREBOARD = 3
const STAT_PERSISTANT_POWERUP = 7
const PMF_INVULEXPAND = 0x00004000
const GT_HARVESTER = 7

function missionpack(level)
  return level.spawner != void and level.spawner.missionpack
end function

function persistentTag(level,client)
  if not missionpack(level) then return c.PW_NONE end if
  index = client.ps.stats[STAT_PERSISTANT_POWERUP]
  if index < 0 or index >= 52 then return c.PW_NONE end if
  return c.missionpackItemTag(index)
end function

function command(client)
  return pmove.Command(client.cmdServerTime,[client.cmdAngles[0],client.cmdAngles[1],client.cmdAngles[2]],client.cmdButtons,client.cmdWeapon,client.cmdForwardmove,client.cmdRightmove,client.cmdUpmove)
end function

function intermissionThink(client)
  client.ps.eFlags = client.ps.eFlags & ~EF_TALK; client.ps.eFlags = client.ps.eFlags & ~EF_FIRING
  client.oldbuttons = client.buttons; client.buttons = client.cmdButtons
  if (client.buttons & (BUTTON_ATTACK | BUTTON_USE_HOLDABLE) & (client.oldbuttons ^ client.buttons)) != 0 then client.readyToExit = true end if
  return void
end function

function inactivityTimer(level,client,slot)
  if level.inactivity == 0 then
    client.inactivityTime = n.add32(level.time,60000); client.inactivityWarning = false
  else if client.cmdForwardmove != 0 or client.cmdRightmove != 0 or client.cmdUpmove != 0 or (client.cmdButtons & BUTTON_ATTACK) != 0 then
    client.inactivityTime = n.add32(level.time,n.mul32(level.inactivity,1000)); client.inactivityWarning = false
  else if not client.localClient then
    if level.time > client.inactivityTime then
      if level.dropClientFn == void then return error(499,"ClientThink requires client-drop delivery") end if
      level.dropClientFn(level,slot,"Dropped due to inactivity"); return false
    end if
    if level.time > n.add32(client.inactivityTime,-10000) and not client.inactivityWarning then
      client.inactivityWarning = true
      if level.serverCommandFn == void then return error(499,"ClientThink requires server-command delivery") end if
      level.serverCommandFn(level,slot,"cp \"Ten seconds until inactivity drop!\n\"")
    end if
  end if
  return true
end function

function timerActions(level,ent,msec)
  client = ent.client; client.timeResidual = n.add32(client.timeResidual,msec)
  while client.timeResidual >= 1000
    client.timeResidual = n.add32(client.timeResidual,-1000); maximum = client.ps.stats[c.STAT_MAX_HEALTH]; regenMaximum = 0
    if missionpack(level) and persistentTag(level,client) == c.PW_GUARD then regenMaximum = n.quotient(maximum,2)
    else if client.ps.powerups[c.PW_REGEN] != 0 then regenMaximum = maximum end if
    if regenMaximum != 0 then
      if ent.health < regenMaximum then
        ent.health = n.add32(ent.health,15); cap = textnum.truncDouble32(regenMaximum*1.1)
        if ent.health > cap then ent.health = cap end if
        events.add(level,ent,c.EV_POWERUP_REGEN,0)
      else if ent.health < n.mul32(regenMaximum,2) then
        ent.health = n.add32(ent.health,5); cap = n.mul32(regenMaximum,2)
        if ent.health > cap then ent.health = cap end if
        events.add(level,ent,c.EV_POWERUP_REGEN,0)
      end if
    else if ent.health > maximum then ent.health = n.add32(ent.health,-1) end if
    if client.ps.stats[c.STAT_ARMOR] > maximum then client.ps.stats[c.STAT_ARMOR] = n.add32(client.ps.stats[c.STAT_ARMOR],-1) end if
  end while
  if missionpack(level) and persistentTag(level,client) == c.PW_AMMOREGEN then
    weapons = [c.WP_MACHINEGUN,c.WP_SHOTGUN,c.WP_GRENADE_LAUNCHER,c.WP_ROCKET_LAUNCHER,c.WP_LIGHTNING,c.WP_RAILGUN,c.WP_PLASMAGUN,c.WP_BFG,11,12,13]
    maximums = [50,10,10,10,50,10,50,10,10,5,100]; increments = [4,1,1,1,5,1,5,1,1,1,5]
    periods = [1000,1500,2000,1750,1500,1750,1500,4000,1250,2000,1000]
    for index = 0 to len(weapons)-1
      weapon = weapons[index]; client.ammoTimes[weapon] = n.add32(client.ammoTimes[weapon],msec)
      if client.ps.ammo[weapon] >= maximums[index] then client.ammoTimes[weapon] = 0 end if
      if client.ammoTimes[weapon] >= periods[index] then
        while client.ammoTimes[weapon] >= periods[index] client.ammoTimes[weapon] = n.add32(client.ammoTimes[weapon],-periods[index]) end while
        client.ps.ammo[weapon] = n.add32(client.ps.ammo[weapon],increments[index])
        if client.ps.ammo[weapon] > maximums[index] then client.ps.ammo[weapon] = maximums[index] end if
      end if
    end for
  end if
  return void
end function

function impacts(level,ent,p)
  trace = movement.Collision(brush.Trace(0.0,[0.0,0.0,0.0],0.0,0,0,false,false,0),[0.0,0.0,0.0],0)
  seen = []
  for each number in p.k.touches
    duplicate = false
    for each previous in seen
      if previous == number then duplicate = true; break end if
    end for
    if duplicate then continue end if
    seen = seen+[number]
    other = level.entities[number]
    if (ent.r.svFlags & SVF_BOT) != 0 and ent.touch != void then ent.touch(level,ent,other,trace) end if
    if other.touch != void then other.touch(level,other,ent,trace) end if
  end for
  return void
end function

function droppedFlag(level,ent,powerup,item)
  if item < 0 then return void end if
  drop = void
  if level.itemDropFn != void then drop = level.itemDropFn(level,ent,item,0.0) else drop = gItems.Drop_Item(level,ent,item,0.0) end if
  drop.count = n.quotient(n.i32(ent.client.ps.powerups[powerup]-level.time),1000)
  if drop.count < 1 then drop.count = 1 end if
  ent.client.ps.powerups[powerup] = 0
  return void
end function

function clientEvents(level,ent,oldEventSequence)
  client = ent.client
  if oldEventSequence < client.ps.eventSequence-2 then oldEventSequence = client.ps.eventSequence-2 end if
  while oldEventSequence < client.ps.eventSequence
    event = client.ps.events[oldEventSequence & 1]
    if event == c.EV_FALL_MEDIUM or event == c.EV_FALL_FAR then
      if ent.s.eType == c.ET_PLAYER and (level.dmflags & DF_NO_FALLING) == 0 then
        damage = 5; if event == c.EV_FALL_FAR then damage = 10 end if
        ent.pain_debounce_time = n.add32(level.time,200)
        combat.damage(level,ent,void,void,void,void,damage,0,c.MOD_FALLING)
      end if
    else if event == c.EV_FIRE_WEAPON then
      if level.fireWeaponFn != void then level.fireWeaponFn(level,ent)
      else if missionpack(level) then completeWeapons.FireWeapon(level,ent,true,persistentTag(level,client)==c.PW_DOUBLER)
      else activeWeapons.fire(level,ent) end if
    else if event == c.EV_USE_ITEM1 then
      if client.ps.powerups[c.PW_REDFLAG] != 0 then droppedFlag(level,ent,c.PW_REDFLAG,34)
      else if client.ps.powerups[c.PW_BLUEFLAG] != 0 then droppedFlag(level,ent,c.PW_BLUEFLAG,35)
      else if client.ps.powerups[c.PW_NEUTRALFLAG] != 0 then droppedFlag(level,ent,c.PW_NEUTRALFLAG,-1) end if
      if missionpack(level) and level.spawner.gametype == GT_HARVESTER and client.ps.generic1 > 0 then
        item = 47; team = c.TEAM_RED
        if client.team == c.TEAM_RED then item = 48; team = c.TEAM_BLUE end if
        for cube = 0 to client.ps.generic1-1
          drop = void; if level.itemDropFn != void then drop = level.itemDropFn(level,ent,item,0.0) else drop = gItems.Drop_Item(level,ent,item,0.0) end if
          drop.spawnflags = team
        end for
        client.ps.generic1 = 0
      end if
      origin = [0.0,0.0,0.0]; angles = [0.0,0.0,0.0]
      spawns.selectSpawn(level,client.ps.origin,origin,angles); teleport.player(level,ent,origin,angles)
    else if event == c.EV_USE_ITEM2 then ent.health = n.add32(client.ps.stats[c.STAT_MAX_HEALTH],25) end if
    if missionpack(level) and event == c.EV_USE_ITEM3 then client.invulnerabilityTime = 0; completeWeapons.G_StartKamikaze(level,ent)
    else if missionpack(level) and event == c.EV_USE_ITEM4 then gMisc.UsePortalHoldable(level,ent)
    else if missionpack(level) and event == c.EV_USE_ITEM5 then client.invulnerabilityTime = n.add32(level.time,10000) end if
    oldEventSequence = oldEventSequence+1
  end while
  return void
end function

function configureMove(level,ent,cmd)
  client = ent.client; p = pmove.create(client.ps,sv.pmoveTrace,sv.pmoveContents,level.scene)
  // C copies *ucmd into pm.cmd. Pmove can clear attack/movement while talking;
  // subsequent game button latching and respawn still read the original ucmd.
  p.cmd = pmove.Command(cmd.serverTime,[cmd.angles[0],cmd.angles[1],cmd.angles[2]],cmd.buttons,cmd.weapon,cmd.forwardmove,cmd.rightmove,cmd.upmove)
  // ClientThink zeroes pmove_t before Pmove; normal/dead/spectator movement
  // fills these bounds in PM_CheckDuck, while noclip deliberately leaves zeroes.
  p.k.mins = [0.0,0.0,0.0]; p.k.maxs = [0.0,0.0,0.0]
  if client.ps.pm_type == c.PM_DEAD then p.k.mask = MASK_PLAYERSOLID & ~CONTENTS_BODY
  else if (ent.r.svFlags & SVF_BOT) != 0 then p.k.mask = MASK_PLAYERSOLID | CONTENTS_BOTCLIP
  else p.k.mask = MASK_PLAYERSOLID end if
  p.noFootsteps = (level.dmflags & DF_NO_FOOTSTEPS) != 0
  p.fixed = level.pmoveFixed or client.pmoveFixed; p.fixedMsec = level.pmoveMsec; p.missionpack = missionpack(level)
  return p
end function

function stuckInOtherClient(level,ent)
  limit = level.maxclients; if limit <= 0 or limit > 64 then limit = 64 end if
  for index = 0 to limit-1
    other = level.entities[index]
    if other == ent or not other.inuse or other.client == void or other.health <= 0 then continue end if
    if other.r.absmin[0] > ent.r.absmax[0] or other.r.absmin[1] > ent.r.absmax[1] or other.r.absmin[2] > ent.r.absmax[2] then continue end if
    if other.r.absmax[0] < ent.r.absmin[0] or other.r.absmax[1] < ent.r.absmin[1] or other.r.absmax[2] < ent.r.absmin[2] then continue end if
    return true
  end for
  return false
end function

function spectatorThink(level,ent,cmd)
  client = ent.client
  if client.spectatorState != SPECTATOR_FOLLOW then
    client.ps.pm_type = c.PM_SPECTATOR; client.ps.speed = 400
    p = configureMove(level,ent,cmd); p.k.mask = MASK_PLAYERSOLID & ~CONTENTS_BODY; p.fixed = false; pmove.move(p)
    ent.s.origin = movement.copy(client.ps.origin); triggers.touch(level,ent); game.unlink(level,ent)
  end if
  client.oldbuttons = client.buttons; client.buttons = cmd.buttons
  if (client.buttons & BUTTON_ATTACK) != 0 and (client.oldbuttons & BUTTON_ATTACK) == 0 then
    if level.followCycleFn != void then level.followCycleFn(level,ent,1)
    else followCommands.cycle(level,ent,1) end if
  end if
  return void
end function

function realThink(level,ent)
  client = ent.client
  if client.connected != 2 then return void end if
  if client.cmdServerTime > n.add32(level.time,200) then client.cmdServerTime = n.add32(level.time,200) end if
  if client.cmdServerTime < n.add32(level.time,-1000) then client.cmdServerTime = n.add32(level.time,-1000) end if
  msec = n.i32(client.cmdServerTime-client.ps.commandTime)
  if msec < 1 and client.spectatorState != SPECTATOR_FOLLOW then return void end if
  if msec > 200 then msec = 200 end if
  if level.pmoveMsec < 8 then
    if level.cvarSetFn == void then return error(499,"ClientThink requires cvar-set delivery") end if
    level.cvarSetFn(level,"pmove_msec","8")
  else if level.pmoveMsec > 33 then
    if level.cvarSetFn == void then return error(499,"ClientThink requires cvar-set delivery") end if
    level.cvarSetFn(level,"pmove_msec","33")
  end if
  if level.pmoveFixed or client.pmoveFixed then client.cmdServerTime = n.quotient(client.cmdServerTime+level.pmoveMsec-1,level.pmoveMsec)*level.pmoveMsec end if
  cmd = command(client)
  if level.intermissiontime != 0 then intermissionThink(client); return void end if
  if client.team == c.TEAM_SPECTATOR then
    if client.spectatorState == SPECTATOR_SCOREBOARD then return void end if
    spectatorThink(level,ent,cmd); return void
  end if
  if not inactivityTimer(level,client,ent.slot) then return void end if
  if level.time > client.rewardTime then client.ps.eFlags = client.ps.eFlags & ~AWARD_MASK end if
  if client.noclip then client.ps.pm_type = c.PM_NOCLIP
  else if client.ps.stats[c.STAT_HEALTH] <= 0 then client.ps.pm_type = c.PM_DEAD
  else client.ps.pm_type = c.PM_NORMAL end if
  client.ps.gravity = n.trunc32(level.gravity); client.ps.speed = n.trunc32(level.playerSpeed)
  if missionpack(level) and persistentTag(level,client) == c.PW_SCOUT then client.ps.speed = textnum.truncDouble32(client.ps.speed*1.5)
  else if client.ps.powerups[c.PW_HASTE] != 0 then client.ps.speed = textnum.truncDouble32(client.ps.speed*1.3) end if
  if client.ps.weapon == c.WP_GRAPPLING_HOOK and client.hook != void and (cmd.buttons & BUTTON_ATTACK) == 0 then missiles.hookFree(level,client.hook) end if
  oldEventSequence = client.ps.eventSequence
  gauntletHit = false
  if client.ps.weapon == c.WP_GAUNTLET and (cmd.buttons & BUTTON_TALK) == 0 and (cmd.buttons & BUTTON_ATTACK) != 0 and client.ps.weaponTime <= 0 then
    if level.gauntletAttackFn != void then gauntletHit = level.gauntletAttackFn(level,ent)
    else gauntletHit = activeWeapons.checkGauntlet(level,ent) end if
  end if
  if (ent.flags & FL_FORCE_GESTURE) != 0 then ent.flags = ent.flags & ~FL_FORCE_GESTURE; client.cmdButtons = client.cmdButtons | BUTTON_GESTURE; cmd.buttons = client.cmdButtons end if
  if missionpack(level) and client.ps.powerups[c.PW_INVULNERABILITY] != 0 and (client.ps.pm_flags & PMF_INVULEXPAND) == 0 then
    oldmins = movement.copy(ent.r.mins); oldmaxs = movement.copy(ent.r.maxs)
    ent.r.mins = [-42.0,-42.0,-42.0]; ent.r.maxs = [42.0,42.0,42.0]; game.link(level,ent)
    if not stuckInOtherClient(level,ent) then client.ps.pm_flags = client.ps.pm_flags | PMF_INVULEXPAND end if
    ent.r.mins = oldmins; ent.r.maxs = oldmaxs; game.link(level,ent)
  end if
  p = configureMove(level,ent,cmd); p.gauntletHit = gauntletHit
  client.oldOrigin = movement.copy(client.ps.origin)
  if missionpack(level) and level.spawner.singlePlayer and level.intermissionQueued != 0 and n.i32(level.time-level.intermissionQueued) >= 1000 then
    p.cmd.buttons = 0; p.cmd.forwardmove = 0; p.cmd.rightmove = 0; p.cmd.upmove = 0
    elapsed = n.i32(level.time-level.intermissionQueued)
    if elapsed >= 2000 and elapsed <= 2500 and level.consoleCommandFn != void then level.consoleCommandFn(level,2,"centerview\n") end if
    client.ps.pm_type = c.PM_SPINTERMISSION
  end if
  pmove.move(p)
  if client.ps.eventSequence != oldEventSequence then ent.eventTime = level.time end if
  if level.smoothClients then snapshot.extrapolate(client.ps,ent.s,client.ps.commandTime,true) else snapshot.fromPlayer(client.ps,ent.s,true) end if
  clientFrame.sendPendingPredictableEvents(level,client.ps)
  if (client.ps.eFlags & EF_FIRING) == 0 then client.fireHeld = false end if
  ent.r.currentOrigin = movement.copy(ent.s.pos.trBase); ent.r.mins = movement.copy(p.k.mins); ent.r.maxs = movement.copy(p.k.maxs)
  ent.waterlevel = p.k.waterlevel; ent.watertype = p.watertype
  clientEvents(level,ent,oldEventSequence); game.link(level,ent)
  if not client.noclip then triggers.touch(level,ent) end if
  ent.r.currentOrigin = movement.copy(client.ps.origin)
  if level.botTestAasFn != void then level.botTestAasFn(level,ent.r.currentOrigin) end if
  impacts(level,ent,p)
  if client.ps.eventSequence != oldEventSequence then ent.eventTime = level.time end if
  client.oldbuttons = client.buttons; client.buttons = cmd.buttons; client.latched_buttons = client.latched_buttons | (client.buttons & ~client.oldbuttons)
  if client.ps.stats[c.STAT_HEALTH] <= 0 then
    if level.time > client.respawnTime then
      forced = level.forceRespawn > 0 and n.i32(level.time-client.respawnTime) > n.mul32(level.forceRespawn,1000)
      if forced or (cmd.buttons & (BUTTON_ATTACK | BUTTON_USE_HOLDABLE)) != 0 then
        if level.respawnFn == void then return error(499,"ClientThink requires respawn delivery") end if
        level.respawnFn(level,ent)
      end if
    end if
    return void
  end if
  timerActions(level,ent,msec)
  return void
end function

function think(level,clientNum)
  ent = level.entities[clientNum]
  if level.usercmdFn == void then return error(499,"ClientThink requires user-command delivery") end if
  level.usercmdFn(level,clientNum,ent.client); ent.client.lastCmdTime = level.time
  if (ent.r.svFlags & SVF_BOT) == 0 and not level.synchronousClients then realThink(level,ent) end if
  return void
end function

function runClient(level,ent)
  if (ent.r.svFlags & SVF_BOT) == 0 and not level.synchronousClients then return void end if
  ent.client.cmdServerTime = level.time; return realThink(level,ent)
end function
