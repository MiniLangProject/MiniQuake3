// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Binary and periodic movers from baseq3 g_mover.c.
package mq3.game.movers
import mq3.game.entities as game
import mq3.game.constants as c
import mq3.game.trajectory as trajectory
import mq3.game.spawn_values as values
import mq3.game.targets as targets
import mq3.game.events as events
import mq3.game.movement as movement
import mq3.game.teleport as teleport
import mq3.game.combat as combat
import mq3.game.items as items
import mq3.game.missiles as missiles
import mq3.shared.math as q
import mq3.shared.directions as dirs
import mq3.compat.numeric as n
import mq3.compat.textnumbers as textnum
import mq3.collision.world as cm
import mq3.collision.visibility as vis
import mq3.server.world as sv
import std.string as strings

const MOVER_POS1 = 0
const MOVER_POS2 = 1
const MOVER_1TO2 = 2
const MOVER_2TO1 = 3
const FL_TEAMSLAVE = 0x400
const SVF_USE_CURRENT_ORIGIN = 0x80
const EF_MOVER_STOP = 0x400

/// Update `ent.s.modelindex`, `ent.r.mins`, `ent.r.maxs` and `ent.r.bmodel` and related state during `setBrushModel`.
/// @param level Game-level state; accesses `scene`.
/// @param ent Game entity; accesses `s`, `r` and `slot`. May update `ent.s.modelindex`, `ent.r.mins` and `ent.r.maxs` and additional fields in place.
/// @param name Name used to identify the requested entry.
function setBrushModel(level,ent,name)
  if name == void or len(name) == 0 or name[0] != "*" then return error(485,"SV_SetBrushModel: invalid brush model name") end if
  ent.s.modelindex = textnum.atoi(decode(slice(bytes(name),1,len(bytes(name))-1)))
  handle = cm.inlineModel(level.scene.world,ent.s.modelindex); bounds = cm.modelBounds(level.scene.world,handle)
  ent.r.mins = bounds[0]; ent.r.maxs = bounds[1]; ent.r.bmodel = true; ent.r.contents = -1
  game.syncSpatial(ent); sv.linkEntity(level.scene,ent.slot); ent.s.solid = ent.r.solid
  return void
end function

/// Apply `mq3.game.events.add` while evaluating `addSound`.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `client`, `s` and `eventTime`. May update `ent.s.event`, `ent.s.eventParm` and `ent.eventTime` in place.
/// @param index Index of the entry to access.
function addSound(level,ent,index)
  if index != 0 then events.add(level,ent,c.EV_GENERAL_SOUND,index) end if
  return void
end function

/// Apply `mq3.collision.visibility.adjustAreaPortalState` while evaluating `adjustAreaPortal`.
/// @param level Game-level state; accesses `scene`.
/// @param ent Game entity; accesses `r`.
/// @param open Value used by `adjustAreaPortalState` in `if not open then change = -1 end if`.
function adjustAreaPortal(level,ent,open)
  if ent.r.areanum2 != -1 then vis.adjustAreaPortalState(level.scene.world.visibility,ent.r.areanum,ent.r.areanum2,open) end if
  return void
end function

/// Update `ent.moverState`, `ent.s.pos.trTime`, `ent.s.pos.trBase` and `ent.s.pos.trType` and related state during `setMoverState`.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `moverState`, `s`, `pos1`, `pos2` and `r`. May update `ent.moverState`, `ent.s.pos.trTime` and `ent.s.pos.trBase` and additional fields in place.
/// @param state Value used by `setMoverState` in `ent.moverState = state`.
/// @param time Time value in the units expected by this module.
function setMoverState(level,ent,state,time)
  ent.moverState = state; ent.s.pos.trTime = time
  if state == MOVER_POS1 then
    ent.s.pos.trBase = movement.copy(ent.pos1); ent.s.pos.trType = c.TR_STATIONARY
  else if state == MOVER_POS2 then
    ent.s.pos.trBase = movement.copy(ent.pos2); ent.s.pos.trType = c.TR_STATIONARY
  else
    start = ent.pos1; finish = ent.pos2
    if state == MOVER_2TO1 then start = ent.pos2; finish = ent.pos1 end if
    ent.s.pos.trBase = movement.copy(start)
    scale = n.fdiv(1000.0,ent.s.pos.trDuration)
    ent.s.pos.trDelta = q.VectorScale([n.fsub(finish[0],start[0]),n.fsub(finish[1],start[1]),n.fsub(finish[2],start[2])],scale)
    ent.s.pos.trType = c.TR_LINEAR_STOP
  end if
  ent.r.currentOrigin = trajectory.evaluate(ent.s.pos,level.time); game.link(level,ent)
  return void
end function

/// Apply `mq3.game.movers.setMoverState` while evaluating `matchTeam`.
/// @param level Game-level state; accesses `time`.
/// @param leader Value used by `matchTeam` in `part = leader`.
/// @param state Value used by `setMoverState` in `ent.moverState = state`.
/// @param time Time value in the units expected by this module.
function matchTeam(level,leader,state,time)
  part = leader
  while part != void
    setMoverState(level,part,state,time); part = part.teamchain
  end while
  return void
end function

/// Set `ent.s.loopSound` to `ent.soundLoop` in `mq3.game.movers.returnToPos1`.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `s`, `soundLoop` and `sound2to1`. May update `ent.s.loopSound` in place.
function returnToPos1(level,ent)
  matchTeam(level,ent,MOVER_2TO1,level.time); ent.s.loopSound = ent.soundLoop; addSound(level,ent,ent.sound2to1)
  return void
end function

/// Update `ent.s.loopSound`, `ent.think`, `ent.nextthink` and `ent.activator` during `reachedBinary`.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `s`, `soundLoop`, `moverState`, `soundPos2` and `think` and related fields. May update `ent.s.loopSound`, `ent.think` and `ent.nextthink` and additional fields in place.
function reachedBinary(level,ent)
  ent.s.loopSound = ent.soundLoop
  if ent.moverState == MOVER_1TO2 then
    setMoverState(level,ent,MOVER_POS2,level.time); addSound(level,ent,ent.soundPos2)
    ent.think = returnToPos1; ent.nextthink = n.add32(level.time,ent.wait)
    if ent.activator == void then ent.activator = ent end if
    targets.useTargets(level,ent,ent.activator)
  else if ent.moverState == MOVER_2TO1 then
    setMoverState(level,ent,MOVER_POS1,level.time); addSound(level,ent,ent.soundPos1)
    if ent.teammaster == ent or ent.teammaster == void then adjustAreaPortal(level,ent,false) end if
  else return error(488,"Reached_BinaryMover: bad moverState") end if
  return void
end function

/// Update `ent.activator`, `ent.s.loopSound` and `ent.nextthink` during `useBinary`.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `flags`, `teammaster`, `activator`, `moverState` and `sound1to2` and related fields. May update `ent.activator`, `ent.s.loopSound` and `ent.nextthink` in place.
/// @param other Value passed as argument 3 to `mq3.game.movers.useBinary`.
/// @param activator Entity responsible for activating the target.
function useBinary(level,ent,other,activator)
  if (ent.flags & FL_TEAMSLAVE) != 0 then return useBinary(level,ent.teammaster,other,activator) end if
  ent.activator = activator
  if ent.moverState == MOVER_POS1 then
    matchTeam(level,ent,MOVER_1TO2,n.add32(level.time,50)); addSound(level,ent,ent.sound1to2); ent.s.loopSound = ent.soundLoop
    if ent.teammaster == ent or ent.teammaster == void then adjustAreaPortal(level,ent,true) end if
    return void
  end if
  if ent.moverState == MOVER_POS2 then ent.nextthink = n.add32(level.time,ent.wait); return void end if
  total = ent.s.pos.trDuration; partial = n.i32(level.time-ent.s.pos.trTime)
  if partial > total then partial = total end if
  reversedTime = n.i32(level.time-(total-partial))
  if ent.moverState == MOVER_2TO1 then
    matchTeam(level,ent,MOVER_1TO2,reversedTime); addSound(level,ent,ent.sound1to2)
  else if ent.moverState == MOVER_1TO2 then
    matchTeam(level,ent,MOVER_2TO1,reversedTime); addSound(level,ent,ent.sound2to1)
  end if
  return void
end function

/// Update `ent.s.modelindex2`, `ent.s.loopSound`, `ent.s.constantLight` and `ent.use` and related state during `initMover`.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `model2`, `s`, `use`, `reached` and `moverState` and related fields. May update `ent.s.modelindex2`, `ent.s.loopSound` and `ent.s.constantLight` and additional fields in place.
function initMover(level,ent)
  if ent.model2 != void then ent.s.modelindex2 = values.modelIndex(level.spawner,ent.model2) end if
  noise = values.getString(level.spawner,"noise","100")
  if noise[0] then ent.s.loopSound = values.soundIndex(level.spawner,noise[1]) end if
  light = values.getFloat(level.spawner,"light","100"); colorText = values.getString(level.spawner,"color","1 1 1"); parsedColor = textnum.vector(colorText[1],[1.0,1.0,1.0]); color = [colorText[0],parsedColor[1]]
  if light[0] or color[0] then
    rgb = color[1]; red = n.trunc32(n.fmul(rgb[0],255)); green = n.trunc32(n.fmul(rgb[1],255)); blue = n.trunc32(n.fmul(rgb[2],255)); radius = n.trunc32(n.fdiv(light[1],4))
    if red > 255 then red = 255 end if; if green > 255 then green = 255 end if; if blue > 255 then blue = 255 end if; if radius > 255 then radius = 255 end if
    ent.s.constantLight = red | (green << 8) | (blue << 16) | (radius << 24)
  end if
  ent.use = useBinary; ent.reached = reachedBinary; ent.moverState = MOVER_POS1
  ent.r.svFlags = SVF_USE_CURRENT_ORIGIN; ent.s.eType = c.ET_MOVER; ent.r.currentOrigin = movement.copy(ent.pos1)
  // InitMover links before it writes the trajectory fields. Lifecycle observers
  // deliberately see that native intermediate state.
  game.link(level,ent)
  ent.s.pos.trType = c.TR_STATIONARY; ent.s.pos.trBase = movement.copy(ent.pos1)
  delta = [n.fsub(ent.pos2[0],ent.pos1[0]),n.fsub(ent.pos2[1],ent.pos1[1]),n.fsub(ent.pos2[2],ent.pos1[2])]
  distance = q.VectorLength(delta)
  if ent.speed == 0 then ent.speed = 100.0 end if
  ent.s.pos.trDelta = q.VectorScale(delta,ent.speed)
  ent.s.pos.trDuration = n.trunc32(n.fdiv(n.fmul(distance,1000.0),ent.speed))
  if ent.s.pos.trDuration <= 0 then ent.s.pos.trDuration = 1 end if
  return void
end function

/// Apply `mq3.game.items.itemType`, `mq3.game.items.droppedFlagThink` and `mq3.game.entities.tempEntity` while evaluating `blockedDoor`.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `damage` and `spawnflags`.
/// @param other Other record; accesses `client`, `s` and `item`.
function blockedDoor(level,ent,other)
  if other.client == void then
    if other.s.eType == c.ET_ITEM and other.item != void and items.itemType(other.item) == c.IT_TEAM then items.droppedFlagThink(level,other); return void end if
    game.tempEntity(level,other.s.origin,c.EV_ITEM_POP); game.free(level,other); return void
  end if
  if ent.damage != 0 then combat.damage(level,other,ent,ent,void,void,ent.damage,0,c.MOD_CRUSH) end if
  if (ent.spawnflags & 4) == 0 then useBinary(level,ent,ent,other) end if
  return void
end function

/// Apply `mq3.game.teleport.player` and `mq3.game.movers.useBinary` while evaluating `touchDoorTrigger`.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `parent`, `count` and `r`.
/// @param other Other record; accesses `client` and `s`.
/// @param trace Not read by this implementation; retained in the `touchDoorTrigger` signature.
function touchDoorTrigger(level,ent,other,trace)
  if other.client == void then return void end if
  if other.client.team == c.TEAM_SPECTATOR then
    if ent.parent.moverState != MOVER_1TO2 and ent.parent.moverState != MOVER_POS2 then
      axis = ent.count; origin = [0.0,0.0,0.0]; direction = [0.0,0.0,0.0]
      if q.Q_fabs(n.fsub(other.s.origin[axis],ent.r.absmax[axis])) < q.Q_fabs(n.fsub(other.s.origin[axis],ent.r.absmin[axis])) then origin[axis] = n.fsub(ent.r.absmin[axis],10); direction[axis] = -1.0
      else origin[axis] = n.fadd(ent.r.absmax[axis],10); direction[axis] = 1.0 end if
      for i = 0 to 2
        if i != axis then origin[i] = n.fmul(n.fadd(ent.r.absmin[i],ent.r.absmax[i]),0.5) end if
      end for
      teleport.player(level,other,origin,q.vectoangles(direction))
    end if
  else if ent.parent.moverState != MOVER_1TO2 then useBinary(level,ent.parent,ent,other) end if
  return void
end function

/// Forward `thinkMatchTeam` to `mq3.game.movers.matchTeam` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `moverState`.
function thinkMatchTeam(level,ent)
  return matchTeam(level,ent,ent.moverState,level.time)
end function

/// Apply `mq3.game.movement.copy`, `mq3.game.entities.spawn` and `mq3.game.entities.link` while evaluating `spawnDoorTrigger`. Return paths include `matchTeam(level,ent,ent.moverState,level.time)`.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `r` and `moverState`.
function spawnDoorTrigger(level,ent)
  part = ent; mins = movement.copy(ent.r.absmin); maxs = movement.copy(ent.r.absmax)
  while part != void
    for axis = 0 to 2
      if part.r.absmin[axis] < mins[axis] then mins[axis] = part.r.absmin[axis] end if
      if part.r.absmax[axis] > maxs[axis] then maxs[axis] = part.r.absmax[axis] end if
    end for
    part.takedamage = true; part = part.teamchain
  end while
  best = 0
  for axis = 1 to 2
    if n.fsub(maxs[axis],mins[axis]) < n.fsub(maxs[best],mins[best]) then best = axis end if
  end for
  mins[best] = n.fsub(mins[best],120); maxs[best] = n.fadd(maxs[best],120)
  trigger = game.spawn(level); trigger.classname = "door_trigger"; trigger.r.mins = mins; trigger.r.maxs = maxs
  trigger.parent = ent; trigger.r.contents = 0x40000000; trigger.touch = touchDoorTrigger; trigger.count = best; game.link(level,trigger)
  return matchTeam(level,ent,ent.moverState,level.time)
end function

/// Update `ent.sound1to2`, `ent.sound2to1`, `ent.soundPos1` and `ent.soundPos2` and related state during `spawnDoor`.
/// @param level Game-level state; accesses `spawner` and `time`.
/// @param ent Game entity; accesses `sound1to2`, `sound2to1`, `soundPos1`, `soundPos2` and `blocked` and related fields. May update `ent.sound1to2`, `ent.sound2to1` and `ent.soundPos1` and additional fields in place.
function spawnDoor(level,ent)
  ent.sound1to2 = values.soundIndex(level.spawner,"sound/movers/doors/dr1_strt.wav"); ent.sound2to1 = ent.sound1to2
  ent.soundPos1 = values.soundIndex(level.spawner,"sound/movers/doors/dr1_end.wav"); ent.soundPos2 = ent.soundPos1; ent.blocked = blockedDoor
  if ent.speed == 0 then ent.speed = 400.0 end if; if ent.wait == 0 then ent.wait = 2.0 end if; ent.wait = n.trunc32(n.fmul(ent.wait,1000))
  lip = values.getFloat(level.spawner,"lip","8")[1]; damage = values.getInt(level.spawner,"dmg","2"); ent.damage = damage[1]
  ent.pos1 = movement.copy(ent.s.origin); setBrushModel(level,ent,ent.model)
  ent.movedir = movedirVector(ent.s.angles); ent.s.angles = [0.0,0.0,0.0]
  size = [n.fsub(ent.r.maxs[0],ent.r.mins[0]),n.fsub(ent.r.maxs[1],ent.r.mins[1]),n.fsub(ent.r.maxs[2],ent.r.mins[2])]
  absolute = [q.Q_fabs(ent.movedir[0]),q.Q_fabs(ent.movedir[1]),q.Q_fabs(ent.movedir[2])]
  distance = n.fsub(q.DotProduct(absolute,size),lip); ent.pos2 = q.VectorMA(ent.pos1,distance,ent.movedir)
  if (ent.spawnflags & 1) != 0 then temp = ent.pos1; ent.pos1 = ent.pos2; ent.pos2 = temp end if
  initMover(level,ent); ent.nextthink = n.add32(level.time,100)
  if (ent.flags & FL_TEAMSLAVE) == 0 then
    if ent.targetname != void or ent.health != 0 then ent.takedamage = ent.health != 0; ent.think = thinkMatchTeam else ent.think = spawnDoorTrigger end if
  end if
  return void
end function

/// Forward `movedirVector` to `mq3.shared.directions.movedirVector` and return the delegated result.
/// @param angles Pitch, yaw and roll angles in degrees.
function movedirVector(angles)
  return dirs.movedirVector(angles)
end function

/// Set `ent.nextthink` to `n.add32(level.time,1000)` in `mq3.game.movers.touchPlat`.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `moverState` and `nextthink`. May update `ent.nextthink` in place.
/// @param other Other record; accesses `client`.
/// @param trace Not read by this implementation; retained in the `touchPlat` signature.
function touchPlat(level,ent,other,trace)
  if other.client != void and other.client.ps.stats[c.STAT_HEALTH] > 0 and ent.moverState == MOVER_POS2 then ent.nextthink = n.add32(level.time,1000) end if
  return void
end function
/// Apply `mq3.game.movers.useBinary` while evaluating `touchPlatTrigger`.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `parent`.
/// @param other Other record; accesses `client`.
/// @param trace Not read by this implementation; retained in the `touchPlatTrigger` signature.
function touchPlatTrigger(level,ent,other,trace)
  if other.client != void and ent.parent.moverState == MOVER_POS1 then useBinary(level,ent.parent,ent,other) end if
  return void
end function
/// Apply `mq3.game.entities.spawn` and `mq3.game.entities.link` while evaluating `spawnPlatTrigger`.
/// @param level Game-level state; accesses `num_entities`, `entities`, `startTime` and `time`. May update `level.num_entities` in place.
/// @param ent Game entity; accesses `pos1` and `r`.
function spawnPlatTrigger(level,ent)
  trigger = game.spawn(level); trigger.classname = "plat_trigger"; trigger.touch = touchPlatTrigger; trigger.r.contents = 0x40000000; trigger.parent = ent
  low = ent.pos1; trigger.r.mins = [n.fadd(n.fadd(low[0],ent.r.mins[0]),33),n.fadd(n.fadd(low[1],ent.r.mins[1]),33),n.fadd(low[2],ent.r.mins[2])]
  trigger.r.maxs = [n.fsub(n.fadd(low[0],ent.r.maxs[0]),33),n.fsub(n.fadd(low[1],ent.r.maxs[1]),33),n.fadd(n.fadd(low[2],ent.r.maxs[2]),8)]
  for axis = 0 to 1
    if trigger.r.maxs[axis] <= trigger.r.mins[axis] then trigger.r.mins[axis] = n.fadd(low[axis],n.fmul(n.fadd(ent.r.mins[axis],ent.r.maxs[axis]),0.5)); trigger.r.maxs[axis] = n.fadd(trigger.r.mins[axis],1) end if
  end for
  game.link(level,trigger); return void
end function
/// Update `ent.sound1to2`, `ent.sound2to1`, `ent.soundPos1` and `ent.soundPos2` and related state during `spawnPlat`.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `sound1to2`, `sound2to1`, `soundPos1`, `soundPos2` and `s` and related fields. May update `ent.sound1to2`, `ent.sound2to1` and `ent.soundPos1` and additional fields in place.
function spawnPlat(level,ent)
  ent.sound1to2 = values.soundIndex(level.spawner,"sound/movers/plats/pt1_strt.wav"); ent.sound2to1 = ent.sound1to2
  ent.soundPos1 = values.soundIndex(level.spawner,"sound/movers/plats/pt1_end.wav"); ent.soundPos2 = ent.soundPos1; ent.s.angles = [0.0,0.0,0.0]
  ent.speed = values.getFloat(level.spawner,"speed","200")[1]; ent.damage = values.getInt(level.spawner,"dmg","2")[1]; ent.wait = 1000
  lip = values.getFloat(level.spawner,"lip","8")[1]; setBrushModel(level,ent,ent.model); heightValue = values.getFloat(level.spawner,"height","0")
  height = heightValue[1]; if not heightValue[0] then height = n.fsub(n.fsub(ent.r.maxs[2],ent.r.mins[2]),lip) end if
  ent.pos2 = movement.copy(ent.s.origin); ent.pos1 = movement.copy(ent.pos2); ent.pos1[2] = n.fsub(ent.pos1[2],height)
  initMover(level,ent); ent.touch = touchPlat; ent.blocked = blockedDoor; ent.parent = ent
  if ent.targetname == void then spawnPlatTrigger(level,ent) end if; return void
end function

/// Apply `mq3.game.movers.useBinary` while evaluating `touchButton`.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `moverState`.
/// @param other Other record; accesses `client`.
/// @param trace Not read by this implementation; retained in the `touchButton` signature.
function touchButton(level,ent,other,trace)
  if other.client != void and ent.moverState == MOVER_POS1 then useBinary(level,ent,other,other) end if; return void
end function
/// Update `ent.sound1to2`, `ent.speed`, `ent.wait` and `ent.pos1` and related state during `spawnButton`. Return paths include `initMover(level,ent)`.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `sound1to2`, `speed`, `wait`, `pos1` and `s` and related fields. May update `ent.sound1to2`, `ent.speed` and `ent.wait` and additional fields in place.
function spawnButton(level,ent)
  ent.sound1to2 = values.soundIndex(level.spawner,"sound/movers/switches/butn2.wav")
  if ent.speed == 0 then ent.speed = 40.0 end if; if ent.wait == 0 then ent.wait = 1.0 end if; ent.wait = n.trunc32(n.fmul(ent.wait,1000))
  ent.pos1 = movement.copy(ent.s.origin); setBrushModel(level,ent,ent.model); lip = values.getFloat(level.spawner,"lip","4")[1]
  ent.movedir = movedirVector(ent.s.angles); ent.s.angles = [0.0,0.0,0.0]; size = [n.fsub(ent.r.maxs[0],ent.r.mins[0]),n.fsub(ent.r.maxs[1],ent.r.mins[1]),n.fsub(ent.r.maxs[2],ent.r.mins[2])]
  distance = n.fsub(n.fadd(n.fadd(n.fmul(q.Q_fabs(ent.movedir[0]),size[0]),n.fmul(q.Q_fabs(ent.movedir[1]),size[1])),n.fmul(q.Q_fabs(ent.movedir[2]),size[2])),lip)
  ent.pos2 = q.VectorMA(ent.pos1,distance,ent.movedir); if ent.health != 0 then ent.takedamage = true else ent.touch = touchButton end if
  return initMover(level,ent)
end function

/// Set `ent.s.pos.trTime` to `level.time` and `ent.s.pos.trType` to `c.TR_LINEAR_STOP` in `mq3.game.movers.beginMoving`.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `s`. May update `ent.s.pos.trTime` and `ent.s.pos.trType` in place.
function beginMoving(level,ent)
  ent.s.pos.trTime = level.time; ent.s.pos.trType = c.TR_LINEAR_STOP; return void
end function
/// Find the next active path_corner with a matching target name, beginning at the supplied entity index.
/// @param level Game-level state; accesses `num_entities` and `entities`.
/// @param name Name used to identify the requested entry.
/// @param start Value used by `findPath` in `i = start`.
function findPath(level,name,start)
  i = start
  while i < level.num_entities
    candidate = level.entities[i]; i = i+1
    if candidate.inuse and candidate.targetname != void and candidate.classname == "path_corner" and strings.equalsIgnoreCaseAscii(candidate.targetname,name) then return candidate end if
  end while
  return void
end function
/// Update `ent.nextTrain`, `ent.pos1`, `ent.pos2` and `ent.s.pos.trDuration` and related state during `reachedTrain`.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `nextTrain`, `pos1`, `pos2`, `speed` and `s` and related fields. May update `ent.nextTrain`, `ent.pos1` and `ent.pos2` and additional fields in place.
function reachedTrain(level,ent)
  next = ent.nextTrain; if next == void or next.nextTrain == void then return void end if
  targets.useTargets(level,next,void); ent.nextTrain = next.nextTrain; ent.pos1 = movement.copy(next.s.origin); ent.pos2 = movement.copy(next.nextTrain.s.origin)
  speed = ent.speed; if next.speed != 0 then speed = next.speed end if; if speed < 1 then speed = 1.0 end if
  delta = [n.fsub(ent.pos2[0],ent.pos1[0]),n.fsub(ent.pos2[1],ent.pos1[1]),n.fsub(ent.pos2[2],ent.pos1[2])]
  ent.s.pos.trDuration = n.trunc32(n.fdiv(n.fmul(q.VectorLength(delta),1000.0),speed)); if ent.s.pos.trDuration < 1 then ent.s.pos.trDuration = 1 end if
  ent.s.loopSound = next.soundLoop; setMoverState(level,ent,MOVER_1TO2,level.time)
  if next.wait != 0 then ent.nextthink = n.add32(level.time,n.trunc32(n.fmul(next.wait,1000))); ent.think = beginMoving; ent.s.pos.trType = c.TR_STATIONARY end if
  return void
end function
/// Set `ent.nextTrain` to `findPath(level,ent.target,0)` in `mq3.game.movers.setupTrain`. Return paths include `reachedTrain(level,ent)`.
/// @param level Game-level state; accesses `num_entities` and `entities`.
/// @param ent Game entity; accesses `nextTrain`, `target` and `r`. May update `ent.nextTrain` in place.
function setupTrain(level,ent)
  ent.nextTrain = findPath(level,ent.target,0)
  if ent.nextTrain == void then game.diagnostic(level,"func_train at "+game.vtos(level,ent.r.absmin)+" with an unfound target\n"); return void end if
  start = ent.nextTrain; path = start
  while true
    if path.target == void then game.diagnostic(level,"Train corner at "+game.vtos(level,path.s.origin)+" without a target\n"); return void end if
    next = findPath(level,path.target,0)
    if next == void then game.diagnostic(level,"Train corner at "+game.vtos(level,path.s.origin)+" without a target path_corner\n"); return void end if
    path.nextTrain = next; path = next; if path == start then break end if
  end while
  return reachedTrain(level,ent)
end function
/// Update `ent.s.angles`, `ent.damage`, `ent.speed` and `ent.reached` and related state during `spawnTrain`.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `s`, `spawnflags`, `damage`, `speed` and `target` and related fields. May update `ent.s.angles`, `ent.damage` and `ent.speed` and additional fields in place.
function spawnTrain(level,ent)
  ent.s.angles = [0.0,0.0,0.0]
  if (ent.spawnflags & 4) != 0 then ent.damage = 0
  else if ent.damage == 0 then ent.damage = 2 end if
  if ent.speed == 0 then ent.speed = 100.0 end if
  if ent.target == void then game.diagnostic(level,"func_train without a target at "+game.vtos(level,ent.r.absmin)+"\n"); game.free(level,ent); return void end if
  setBrushModel(level,ent,ent.model); initMover(level,ent)
  ent.reached = reachedTrain; ent.nextthink = n.add32(level.time,100); ent.think = setupTrain; return void
end function

/// Set `ent.s.pos.trBase` to `movement.copy(ent.s.origin)` and `ent.r.currentOrigin` to `movement.copy(ent.s.origin)` in `mq3.game.movers.spawnStatic`.
/// @param level Game-level state; accesses `scene`.
/// @param ent Game entity; accesses `model`, `s` and `r`. May update `ent.s.pos.trBase` and `ent.r.currentOrigin` in place.
function spawnStatic(level,ent)
  setBrushModel(level,ent,ent.model); initMover(level,ent); ent.s.pos.trBase = movement.copy(ent.s.origin); ent.r.currentOrigin = movement.copy(ent.s.origin); return void
end function
/// Update `ent.speed`, `ent.damage`, `ent.s.apos.trType` and `ent.s.apos.trDelta[2]` and related state during `spawnRotating`. Return paths include `game.link(level,ent)`.
/// @param level Game-level state; accesses `scene`.
/// @param ent Game entity; accesses `speed`, `damage`, `s`, `spawnflags` and `model` and related fields. May update `ent.speed`, `ent.damage` and `ent.s.apos.trType` and additional fields in place.
function spawnRotating(level,ent)
  if ent.speed == 0 then ent.speed = 100.0 end if; if ent.damage == 0 then ent.damage = 2 end if
  ent.s.apos.trType = c.TR_LINEAR; if (ent.spawnflags & 4) != 0 then ent.s.apos.trDelta[2] = ent.speed else if (ent.spawnflags & 8) != 0 then ent.s.apos.trDelta[0] = ent.speed else ent.s.apos.trDelta[1] = ent.speed end if
  setBrushModel(level,ent,ent.model); initMover(level,ent); ent.s.pos.trBase = movement.copy(ent.s.origin); ent.r.currentOrigin = movement.copy(ent.s.origin); ent.r.currentAngles = movement.copy(ent.s.apos.trBase); return game.link(level,ent)
end function
/// Update `ent.speed`, `ent.damage`, `ent.s.pos.trBase` and `ent.r.currentOrigin` and related state during `spawnBobbing`.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `speed`, `damage`, `model`, `s` and `r` and related fields. May update `ent.speed`, `ent.damage` and `ent.s.pos.trBase` and additional fields in place.
function spawnBobbing(level,ent)
  ent.speed = values.getFloat(level.spawner,"speed","4")[1]; height = values.getFloat(level.spawner,"height","32")[1]; ent.damage = values.getInt(level.spawner,"dmg","2")[1]; phase = values.getFloat(level.spawner,"phase","0")[1]
  setBrushModel(level,ent,ent.model); initMover(level,ent)
  ent.s.pos.trBase = movement.copy(ent.s.origin); ent.r.currentOrigin = movement.copy(ent.s.origin); ent.s.pos.trDuration = n.trunc32(n.fmul(ent.speed,1000)); if ent.s.pos.trDuration == 0 then ent.s.pos.trDuration = 1 end if
  ent.s.pos.trTime = n.trunc32(n.fmul(ent.s.pos.trDuration,phase)); ent.s.pos.trType = c.TR_SINE; ent.s.pos.trDelta = [0.0,0.0,0.0]
  if (ent.spawnflags & 1) != 0 then ent.s.pos.trDelta[0] = height else if (ent.spawnflags & 2) != 0 then ent.s.pos.trDelta[1] = height else ent.s.pos.trDelta[2] = height end if; return void
end function
/// Update `ent.damage`, `ent.s.pos.trDuration`, `ent.s.pos.trBase` and `ent.r.currentOrigin` and related state during `spawnPendulum`.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `damage`, `model`, `r` and `s`. May update `ent.damage`, `ent.s.pos.trDuration` and `ent.s.pos.trBase` and additional fields in place.
function spawnPendulum(level,ent)
  amplitude = values.getFloat(level.spawner,"speed","30")[1]; phase = values.getFloat(level.spawner,"phase","0")[1]; ent.damage = values.getInt(level.spawner,"dmg","2")[1]
  setBrushModel(level,ent,ent.model); length = q.Q_fabs(ent.r.mins[2]); if length < 8 then length = 8.0 end if
  frequency = n.fmul(n.fdiv(1.0,n.fmul(2.0,n.f32(3.14159265358979323846))),n.fsqrt(n.fdiv(level.spawner.gravity,n.fmul(3.0,length))))
  duration = n.trunc32(n.fdiv(1000.0,frequency)); if duration == 0 then duration = 1 end if
  // Baseq3 writes the physical period before InitMover. InitMover replaces the
  // stationary position period with 1, while the saved value becomes apos.
  ent.s.pos.trDuration = duration; initMover(level,ent); ent.s.pos.trBase = movement.copy(ent.s.origin); ent.r.currentOrigin = movement.copy(ent.s.origin)
  ent.s.apos.trBase = movement.copy(ent.s.angles); ent.s.apos.trDuration = duration; ent.s.apos.trTime = n.trunc32(n.fmul(duration,phase)); ent.s.apos.trType = c.TR_SINE; ent.s.apos.trDelta = [0.0,0.0,amplitude]; return void
end function

/// Apply `mq3.game.entities.diagnostic`, `mq3.game.entities.vtos` and `mq3.game.entities.free` while evaluating `spawnPathCorner`.
/// @param level Game-level state; accesses `gamePrintFn`.
/// @param ent Game entity; accesses `targetname` and `s`.
function spawnPathCorner(level,ent)
  if ent.targetname == void then
    game.diagnostic(level,"path_corner with no targetname at "+game.vtos(level,ent.s.origin)+"\n")
    game.free(level,ent)
  end if
  return void
end function

/// Apply `mq3.game.movers.spawnDoor`, `mq3.game.movers.spawnPlat` and `mq3.game.movers.spawnButton` while evaluating `dispatch`.
/// @param level Game-level state; accesses `spawner` and `time`.
/// @param ent Game entity; accesses `classname`.
function dispatch(level,ent)
  switch ent.classname
    case "func_door"
      spawnDoor(level,ent)
    end case
    case "func_plat"
      spawnPlat(level,ent)
    end case
    case "func_button"
      spawnButton(level,ent)
    end case
    case "func_train"
      spawnTrain(level,ent)
    end case
    case "func_static"
      spawnStatic(level,ent)
    end case
    case "func_rotating"
      spawnRotating(level,ent)
    end case
    case "func_bobbing"
      spawnBobbing(level,ent)
    end case
    case "func_pendulum"
      spawnPendulum(level,ent)
    end case
    case default
      return false
    end case
  end switch
  return true
end function

/// Test strict overlap of two entities' absolute collision bounds on all three axes.
/// @param first First record; accesses `r`.
/// @param second Second record; accesses `r`.
function overlaps(first,second)
  for axis = 0 to 2
    if first.r.absmin[axis] >= second.r.absmax[axis] or first.r.absmax[axis] <= second.r.absmin[axis] then return false end if
  end for
  return true
end function

/// Test `testEntityPosition(level,ent) != void` as the condition for `positionBlocked`.
/// @param level Game-level state; accesses `scene` and `entities`.
/// @param ent Game entity; accesses `s`, `client`, `clipmask` and `r`.
function positionBlocked(level,ent)
  return testEntityPosition(level,ent) != void
end function

/// Apply `mq3.server.world.trace` while evaluating `testEntityPosition`. Return paths include `level.entities[hit.entityNum]`.
/// @param level Game-level state; accesses `scene` and `entities`.
/// @param ent Game entity; accesses `s`, `client`, `clipmask` and `r`.
function testEntityPosition(level,ent)
  origin = ent.s.pos.trBase
  if ent.client != void then origin = ent.client.ps.origin end if
  mask = ent.clipmask
  if mask == 0 then mask = 1 end if
  hit = sv.trace(level.scene,origin,origin,ent.r.mins,ent.r.maxs,ent.s.number,mask,false)
  if not hit.trace.startsolid then return void end if
  if hit.entityNum < 0 or hit.entityNum >= len(level.entities) then return void end if
  return level.entities[hit.entityNum]
end function

/// Forward `createRotationMatrix` to `mq3.collision.world.rotationMatrix` and return the delegated result.
/// @param angles Pitch, yaw and roll angles in degrees.
function createRotationMatrix(angles)
  return cm.rotationMatrix(angles)
end function

/// Forward `transposeMatrix` to `mq3.collision.world.transpose` and return the delegated result.
/// @param matrix Three-component array; components 0, 1 and 2 are used in their stored order.
function transposeMatrix(matrix)
  return cm.transpose(matrix)
end function

/// Forward `rotatePoint` to `mq3.collision.world.rotatePoint` and return the delegated result.
/// @param point Three-component point used by the geometric query.
/// @param matrix Three-component array; components 0, 1 and 2 are used in their stored order.
function rotatePoint(point,matrix)
  return cm.rotatePoint(point,matrix)
end function

/// Apply `mq3.server.world.trace` while evaluating `checkProxMinePosition`. Return paths include `not hit.trace.startsolid and hit.trace.fraction == 1.0`.
/// @param level Game-level state; accesses `scene`.
/// @param check Check record; accesses `s` and `movedir`.
function checkProxMinePosition(level,check)
  start = q.VectorMA(check.s.pos.trBase,0.125,check.movedir)
  finish = q.VectorMA(check.s.pos.trBase,2.0,check.movedir)
  hit = sv.trace(level.scene,start,finish,void,void,check.s.number,1,false)
  return not hit.trace.startsolid and hit.trace.fraction == 1.0
end function

/// Update `check.s.pos.trBase[axis]` and `check.r.currentOrigin` during `tryPushingProxMine`.
/// @param level Game-level state; accesses `scene`.
/// @param check Check record; accesses `s` and `r`. May update `check.s.pos.trBase[axis]` and `check.r.currentOrigin` in place.
/// @param pusher Pusher record; accesses `r`.
/// @param move Array or byte sequence accessed at `axis`.
/// @param angleMove Three-component array; components 0, 1 and 2 are used in their stored order.
function tryPushingProxMine(level,check,pusher,move,angleMove)
  inverseAngles = [n.fneg(angleMove[0]),n.fneg(angleMove[1]),n.fneg(angleMove[2])]
  axes = q.AngleVectors(inverseAngles)
  for axis = 0 to 2
    check.s.pos.trBase[axis] = n.fadd(check.s.pos.trBase[axis],move[axis])
  end for
  relative = [n.fsub(check.s.pos.trBase[0],pusher.r.currentOrigin[0]),n.fsub(check.s.pos.trBase[1],pusher.r.currentOrigin[1]),n.fsub(check.s.pos.trBase[2],pusher.r.currentOrigin[2])]
  rotated = [q.DotProduct(relative,axes[0]),n.fneg(q.DotProduct(relative,axes[1])),q.DotProduct(relative,axes[2])]
  for axis = 0 to 2
    check.s.pos.trBase[axis] = n.fadd(check.s.pos.trBase[axis],n.fsub(rotated[axis],relative[axis]))
  end for
  if not checkProxMinePosition(level,check) then return false end if
  check.r.currentOrigin = movement.copy(check.s.pos.trBase); game.link(level,check); return true
end function

/// Set `check.s.loopSound` to `0` and `check.activator` to `void` in `mq3.game.movers.explodeProxMine`.
/// @param level Game-level state; accesses `time`.
/// @param check Check record; accesses `s` and `activator`. May update `check.s.loopSound` and `check.activator` in place.
function explodeProxMine(level,check)
  check.s.loopSound = 0; events.add(level,check,c.EV_PROXIMITY_MINE_TRIGGER,0); missiles.explode(level,check)
  if check.activator != void then game.free(level,check.activator); check.activator = void end if
  return void
end function

/// Update `check.s.pos.trBase[axis]`, `check.client.ps.origin[axis]`, `check.client.ps.delta_angles[1]` and `check.s.groundEntityNum` and related state during `tryPush`. Return paths include `[false,[check,oldOrigin,oldAngles,oldDeltaYaw]]`.
/// @param level Game-level state; accesses `scene` and `entities`.
/// @param check Check record; accesses `s`, `client` and `r`. May update `check.s.pos.trBase[axis]`, `check.client.ps.origin[axis]` and `check.client.ps.delta_angles[1]` and additional fields in place.
/// @param pusher Pusher record; accesses `s` and `r`.
/// @param move Array or byte sequence accessed at `axis`.
/// @param angleMove Pitch, yaw and roll angles in degrees.
function tryPush(level,check,pusher,move,angleMove)
  if (pusher.s.eFlags & EF_MOVER_STOP) != 0 and check.s.groundEntityNum != pusher.s.number then return [false,void] end if
  oldOrigin = movement.copy(check.s.pos.trBase); oldAngles = movement.copy(check.s.apos.trBase); oldDeltaYaw = 0
  if check.client != void then oldOrigin = movement.copy(check.client.ps.origin); oldDeltaYaw = check.client.ps.delta_angles[1] end if
  matrix = cm.transpose(cm.rotationMatrix(angleMove)); origin = oldOrigin
  relative = [n.fsub(origin[0],pusher.r.currentOrigin[0]),n.fsub(origin[1],pusher.r.currentOrigin[1]),n.fsub(origin[2],pusher.r.currentOrigin[2])]
  rotated = cm.rotatePoint(relative,matrix)
  rotateMove = [n.fsub(rotated[0],relative[0]),n.fsub(rotated[1],relative[1]),n.fsub(rotated[2],relative[2])]
  for axis = 0 to 2
    check.s.pos.trBase[axis] = n.fadd(check.s.pos.trBase[axis],move[axis]); check.s.pos.trBase[axis] = n.fadd(check.s.pos.trBase[axis],rotateMove[axis])
  end for
  if check.client != void then
    for axis = 0 to 2
      check.client.ps.origin[axis] = n.fadd(check.client.ps.origin[axis],move[axis]); check.client.ps.origin[axis] = n.fadd(check.client.ps.origin[axis],rotateMove[axis])
    end for
    shortYaw = n.trunc32(n.fdiv(n.fmul(angleMove[1],65536),360)) & 65535
    check.client.ps.delta_angles[1] = n.add32(check.client.ps.delta_angles[1],shortYaw)
  end if
  if check.s.groundEntityNum != pusher.s.number then check.s.groundEntityNum = -1 end if
  blockedNow = positionBlocked(level,check)
  if not blockedNow then
    if check.client != void then check.r.currentOrigin = movement.copy(check.client.ps.origin)
    else check.r.currentOrigin = movement.copy(check.s.pos.trBase) end if
    game.link(level,check); return [true,[check,oldOrigin,oldAngles,oldDeltaYaw]]
  end if
  check.s.pos.trBase = movement.copy(oldOrigin); check.s.apos.trBase = movement.copy(oldAngles)
  if check.client != void then check.client.ps.origin = movement.copy(oldOrigin) end if
  // Riders can remain at the old position when a sliding trapdoor moves away.
  if not positionBlocked(level,check) then check.s.groundEntityNum = -1; return [true,void] end if
  return [false,[check,oldOrigin,oldAngles,oldDeltaYaw]]
end function

/// Apply `mq3.game.movement.copy` and `mq3.game.entities.link` while evaluating `restorePush`. Return paths include `game.link(level,ent)`.
/// @param level Game-level state; accesses `scene`.
/// @param record Three-component array; components 0, 1 and 2 are used in their stored order.
function restorePush(level,record)
  ent = record[0]; ent.s.pos.trBase = movement.copy(record[1]); ent.s.apos.trBase = movement.copy(record[2])
  if ent.client != void then ent.client.ps.origin = movement.copy(record[1]); ent.client.ps.delta_angles[1] = record[3] end if
  return game.link(level,ent)
end function

/// Update `pusher.r.currentOrigin` and `pusher.r.currentAngles` during `pushPart`. Return paths include `[true,void,records]`.
/// @param level Game-level state; accesses `scene` and `entities`.
/// @param pusher Pusher record; accesses `r` and `s`. May update `pusher.r.currentOrigin` and `pusher.r.currentAngles` in place.
/// @param move Array or byte sequence accessed at `axis`.
/// @param angleMove Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param records Sequence whose length bounds the iteration or lookup in `pushPart`.
function pushPart(level,pusher,move,angleMove,records)
  oldMins = movement.copy(pusher.r.absmin); oldMaxs = movement.copy(pusher.r.absmax)
  game.unlink(level,pusher)
  totalMins = movement.copy(oldMins); totalMaxs = movement.copy(oldMaxs); destinationMins = array(3,0.0); destinationMaxs = array(3,0.0)
  rotating = pusher.r.currentAngles[0] != 0 or pusher.r.currentAngles[1] != 0 or pusher.r.currentAngles[2] != 0 or angleMove[0] != 0 or angleMove[1] != 0 or angleMove[2] != 0
  if rotating then
    corner = array(3,0.0)
    for axis = 0 to 2
      a = q.Q_fabs(pusher.r.mins[axis]); b = q.Q_fabs(pusher.r.maxs[axis]); corner[axis] = a
      if b > a then corner[axis] = b end if
    end for
    radius = q.VectorLength(corner)
    for axis = 0 to 2
      destinationMins[axis] = n.fsub(n.fadd(pusher.r.currentOrigin[axis],move[axis]),radius); destinationMaxs[axis] = n.fadd(n.fadd(pusher.r.currentOrigin[axis],move[axis]),radius)
      totalMins[axis] = n.fsub(destinationMins[axis],move[axis]); totalMaxs[axis] = n.fsub(destinationMaxs[axis],move[axis])
    end for
  else
    for axis = 0 to 2
      destinationMins[axis] = n.fadd(oldMins[axis],move[axis]); destinationMaxs[axis] = n.fadd(oldMaxs[axis],move[axis])
      if move[axis] > 0 then totalMaxs[axis] = n.fadd(totalMaxs[axis],move[axis]) else totalMins[axis] = n.fadd(totalMins[axis],move[axis]) end if
    end for
  end if
  candidates = sv.areaEntities(level.scene,totalMins,totalMaxs,1024)
  pusher.r.currentOrigin = [n.fadd(pusher.r.currentOrigin[0],move[0]),n.fadd(pusher.r.currentOrigin[1],move[1]),n.fadd(pusher.r.currentOrigin[2],move[2])]
  pusher.r.currentAngles = [n.fadd(pusher.r.currentAngles[0],angleMove[0]),n.fadd(pusher.r.currentAngles[1],angleMove[1]),n.fadd(pusher.r.currentAngles[2],angleMove[2])]
  game.link(level,pusher)
  for each number in candidates
    check = level.entities[number]
    if check.s.eType == c.ET_MISSILE and check.classname == "prox mine" then
      if check.enemy == pusher then
        if not tryPushingProxMine(level,check,pusher,move,angleMove) then explodeProxMine(level,check) end if
      else if not checkProxMinePosition(level,check) then explodeProxMine(level,check) end if
      continue
    end if
    if check == pusher or (check.s.eType != c.ET_ITEM and check.s.eType != c.ET_PLAYER and not check.physicsObject) then continue end if
    rider = check.s.groundEntityNum == pusher.s.number
    if not rider and (check.r.absmin[0] >= destinationMaxs[0] or check.r.absmin[1] >= destinationMaxs[1] or check.r.absmin[2] >= destinationMaxs[2] or check.r.absmax[0] <= destinationMins[0] or check.r.absmax[1] <= destinationMins[1] or check.r.absmax[2] <= destinationMins[2]) then continue end if
    if not rider and not positionBlocked(level,check) then continue end if
    if len(records) >= 1024 and not ((pusher.s.eFlags & EF_MOVER_STOP) != 0 and not rider) then return error(488,"pushed entity stack overflow") end if
    pushed = tryPush(level,check,pusher,move,angleMove)
    if pushed[0] then
      if pushed[1] != void then if len(records) >= 1024 then return error(488,"pushed entity stack overflow") end if; records = records+[pushed[1]] end if
      continue
    end if
    if pushed[1] != void then if len(records) >= 1024 then return error(488,"pushed entity stack overflow") end if; records = records+[pushed[1]] end if
    if pusher.s.pos.trType == c.TR_SINE or pusher.s.apos.trType == c.TR_SINE then combat.damage(level,check,pusher,pusher,void,void,99999,0,c.MOD_CRUSH); continue end if
    return [false,check,records]
  end for
  return [true,void,records]
end function

/// Apply `mq3.game.movers.restorePush`, `mq3.game.trajectory.evaluate` and `mq3.game.entities.link` while evaluating `rollbackTeam`.
/// @param level Game-level state; accesses `time` and `previousTime`.
/// @param leader Value used by `rollbackTeam` in `part = leader`.
/// @param records Array or byte sequence accessed at `index`.
function rollbackTeam(level,leader,records)
  index = len(records)-1
  while index >= 0
    restorePush(level,records[index]); index = index-1
  end while
  part = leader
  while part != void
    part.s.pos.trTime = n.add32(part.s.pos.trTime,n.i32(level.time-level.previousTime)); part.s.apos.trTime = n.add32(part.s.apos.trTime,n.i32(level.time-level.previousTime))
    part.r.currentOrigin = trajectory.evaluate(part.s.pos,level.time); part.r.currentAngles = trajectory.evaluate(part.s.apos,level.time); game.link(level,part); part = part.teamchain
  end while
  return void
end function

/// Use `leader.blocked` to perform `moveTeam`.
/// @param level Game-level state; accesses `time`.
/// @param leader Leader record; accesses `blocked`.
function moveTeam(level,leader)
  records = []; part = leader; obstacle = void
  while part != void
    destination = trajectory.evaluate(part.s.pos,level.time); angles = trajectory.evaluate(part.s.apos,level.time)
    move = [n.fsub(destination[0],part.r.currentOrigin[0]),n.fsub(destination[1],part.r.currentOrigin[1]),n.fsub(destination[2],part.r.currentOrigin[2])]
    angleMove = [n.fsub(angles[0],part.r.currentAngles[0]),n.fsub(angles[1],part.r.currentAngles[1]),n.fsub(angles[2],part.r.currentAngles[2])]
    result = pushPart(level,part,move,angleMove,records); records = result[2]
    if not result[0] then obstacle = result[1]; break end if
    part = part.teamchain
  end while
  if obstacle != void then
    rollbackTeam(level,leader,records)
    if leader.blocked != void then leader.blocked(level,leader,obstacle) end if
    return void
  end if
  part = leader
  while part != void
    if part.s.pos.trType == c.TR_LINEAR_STOP and level.time >= n.add32(part.s.pos.trTime,part.s.pos.trDuration) and part.reached != void then part.reached(level,part) end if
    part = part.teamchain
  end while
  return void
end function

/// Apply `mq3.game.movers.moveTeam` and `mq3.game.entities.runThink` while evaluating `run`. Return paths include `game.runThink(level,ent)`.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `flags` and `s`.
function run(level,ent)
  if (ent.flags & FL_TEAMSLAVE) != 0 then return void end if
  if ent.s.pos.trType != c.TR_STATIONARY or ent.s.apos.trType != c.TR_STATIONARY then moveTeam(level,ent) end if
  return game.runThink(level,ent)
end function
