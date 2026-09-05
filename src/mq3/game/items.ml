// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 dropped-item entities, item physics and flag reset/return rules.
package mq3.game.items
import mq3.game.constants as c
import mq3.game.entities as game
import mq3.game.events as events
import mq3.game.movement as movement
import mq3.game.trajectory as trajectory
import mq3.game.combat as combat
import mq3.game.spawn_tables as tables
import mq3.game.spawn_values as values
import mq3.game.snapshot as snapshot
import mq3.game.team_bonuses as bonuses
import mq3.server.world as sv
import mq3.shared.math as q
import mq3.compat.numeric as n
import mq3.compat.textnumbers as textnum
import mq3.qcommon.cvar as cv
import std.string as strings

const FL_DROPPED_ITEM = 0x1000
const FLAG_ATBASE = 0
const FLAG_DROPPED = 4

function validItem(index)
  return typeof(index) == "int" and index > 0 and index < len(tables.items())
end function
function requireItem(index)
  if not validItem(index) then return error(497,"Invalid baseq3 item") end if
  return index
end function
function itemName(index)
  return tables.items()[requireItem(index)]
end function
function itemType(index)
  requireItem(index); return c.itemType(index)
end function
function itemTag(index)
  requireItem(index); return c.itemTag(index)
end function
function centeredRandom(level)
  // random() divides as float; crandom() then promotes its operands to double.
  return 2.0*(n.fdiv(game.random(level),32767)-0.5)
end function
function register(level,item)
  item = requireItem(item); level.itemRegistered[item] = 1; return void
end function
function touch(level,ent,other,trace)
  return error(497,"Touch_Item is not ported yet")
end function
function setFlagStatus(level,team,status)
  if status < 0 or status > 4 then return error(497,"Invalid flag status") end if
  modified = false
  if team == c.TEAM_RED then
    if level.redFlagStatus != status then level.redFlagStatus = status; modified = true end if
  else if team == c.TEAM_BLUE then
    if level.blueFlagStatus != status then level.blueFlagStatus = status; modified = true end if
  else if team == c.TEAM_FREE then
    if level.neutralFlagStatus != status then level.neutralFlagStatus = status; modified = true end if
  end if
  if not modified then return void end if
  if level.spawner == void then return error(497,"Flag status requires game configstrings") end if
  if level.spawner.gametype == 4 then
    remap = [48,49,42,42,50]
    values.setConfig(level.spawner,23,decode(bytes([remap[level.redFlagStatus],remap[level.blueFlagStatus]])))
  else
    remap = [48,49,50,51,52]
    values.setConfig(level.spawner,23,decode(bytes([remap[level.neutralFlagStatus]])))
  end if
  return void
end function
function checkDropped(level,dropped)
  tag = itemTag(dropped.item)
  if tag == c.PW_REDFLAG then setFlagStatus(level,c.TEAM_RED,FLAG_DROPPED)
  else if tag == c.PW_BLUEFLAG then setFlagStatus(level,c.TEAM_BLUE,FLAG_DROPPED)
  else if tag == c.PW_NEUTRALFLAG then setFlagStatus(level,c.TEAM_FREE,FLAG_DROPPED) end if
  return void
end function
function respawn(level,ent)
  requireItem(ent.item)
  if ent.team != void then
    if ent.teammaster == void then return error(497,"RespawnItem: bad teammaster") end if
    chain = []; current = ent.teammaster
    while current != void
      chain = chain+[current]
      if len(chain) > 1024 then return error(497,"Invalid item team chain") end if
      current = current.teamchain
    end while
    if len(chain) == 0 then return error(497,"Empty item team chain") end if
    ent = chain[game.random(level) % len(chain)]
    requireItem(ent.item)
  end if
  ent.r.contents = 0x40000000; ent.s.eFlags = ent.s.eFlags & ~0x80; ent.r.svFlags = ent.r.svFlags & ~1
  game.link(level,ent)
  if itemType(ent.item) == c.IT_POWERUP then
    event = c.EV_GLOBAL_SOUND
    if ent.speed != 0 then event = c.EV_GENERAL_SOUND end if
    temp = game.tempEntity(level,ent.s.pos.trBase,event)
    temp.s.eventParm = values.soundIndex(level.spawner,"sound/items/poweruprespawn.wav"); temp.r.svFlags = temp.r.svFlags | 32
  end if
  events.add(level,ent,c.EV_ITEM_RESPAWN,0); ent.nextthink = 0
  return void
end function
function use(level,ent,other,activator)
  return respawn(level,ent)
end function
function finishSpawning(level,ent)
  item = requireItem(ent.item)
  ent.r.mins = [-15.0,-15.0,-15.0]; ent.r.maxs = [15.0,15.0,15.0]
  ent.s.eType = c.ET_ITEM; ent.s.modelindex = item; ent.s.modelindex2 = 0
  ent.r.contents = 0x40000000; ent.touch = touch; ent.use = use
  if (ent.spawnflags & 1) != 0 then game.setOrigin(ent,ent.s.origin)
  else
    destination = [ent.s.origin[0],ent.s.origin[1],n.fsub(ent.s.origin[2],4096.0)]
    hit = combat.shotTrace(level,ent.s.origin,destination,ent.r.mins,ent.r.maxs,ent.s.number,1)
    if hit.trace.startsolid then game.free(level,ent); return void end if
    ent.s.groundEntityNum = hit.entityNum; game.setOrigin(ent,hit.endpos)
  end if
  if (ent.flags & 0x400) != 0 or ent.targetname != void then
    ent.s.eFlags = ent.s.eFlags | 0x80; ent.r.contents = 0; return void
  end if
  if itemType(item) == c.IT_POWERUP then
    respawnTime = 45.0+centeredRandom(level)*15.0
    ent.s.eFlags = ent.s.eFlags | 0x80; ent.r.contents = 0
    ent.nextthink = textnum.truncDouble32(level.time+respawnTime*1000.0); ent.think = respawn
    return void
  end if
  return game.link(level,ent)
end function
function spawnItem(level,ent,item)
  item = requireItem(item)
  ent.random = values.getFloat(level.spawner,"random","0")[1]; ent.wait = values.getFloat(level.spawner,"wait","0")[1]
  register(level,item)
  disabled = cv.find(level.spawner.cvars,"disable_"+itemName(item))
  if disabled != void and disabled.integer != 0 then return void end if
  ent.item = item; ent.nextthink = n.add32(level.time,200); ent.think = finishSpawning; ent.physicsBounce = 0.5
  if itemType(item) == c.IT_POWERUP then
    values.soundIndex(level.spawner,"sound/items/poweruprespawn.wav")
    ent.speed = values.getFloat(level.spawner,"noglobalsound","0")[1]
  end if
  return void
end function
function findClass(level,after,name)
  index = 0
  if after != void then index = after.slot+1 end if
  while index < level.num_entities
    ent = level.entities[index]; index = index+1
    if ent.inuse and ent.classname != void and strings.equalsIgnoreCaseAscii(ent.classname,name) then return ent end if
  end while
  return void
end function
function resetFlag(level,team)
  name = void
  if team == c.TEAM_RED then name = "team_CTF_redflag"
  else if team == c.TEAM_BLUE then name = "team_CTF_blueflag"
  else if team == c.TEAM_FREE then name = "team_CTF_neutralflag"
  else return void end if
  rent = void; ent = void
  while true
    ent = findClass(level,ent,name)
    if ent == void then break end if
    if (ent.flags & FL_DROPPED_ITEM) != 0 then game.free(level,ent)
    else rent = ent; respawn(level,ent) end if
  end while
  setFlagStatus(level,team,FLAG_ATBASE)
  return rent
end function
function returnFlagSound(level,ent,team)
  if ent == void then return void end if
  temp = game.tempEntity(level,ent.s.pos.trBase,c.EV_GLOBAL_TEAM_SOUND)
  if team == c.TEAM_BLUE then temp.s.eventParm = c.GTS_RED_RETURN else temp.s.eventParm = c.GTS_BLUE_RETURN end if
  temp.r.svFlags = temp.r.svFlags | 32
  return void
end function
function returnFlag(level,team)
  returnFlagSound(level,resetFlag(level,team),team)
  if level.teamMessageFn == void then return error(497,"Team_ReturnFlag requires a PrintMsg sink") end if
  if team == c.TEAM_FREE then level.teamMessageFn(level,-1,"The flag has returned!\n")
  else level.teamMessageFn(level,-1,"The "+bonuses.teamName(team)+" flag has returned!\n") end if
  return void
end function
function teamFree(level,ent)
  tag = itemTag(ent.item)
  if tag == c.PW_REDFLAG then returnFlag(level,c.TEAM_RED)
  else if tag == c.PW_BLUEFLAG then returnFlag(level,c.TEAM_BLUE)
  else if tag == c.PW_NEUTRALFLAG then returnFlag(level,c.TEAM_FREE) end if
  return void
end function
function droppedFlagThink(level,ent)
  team = c.TEAM_FREE; tag = itemTag(ent.item)
  if tag == c.PW_REDFLAG then team = c.TEAM_RED
  else if tag == c.PW_BLUEFLAG then team = c.TEAM_BLUE end if
  return returnFlagSound(level,resetFlag(level,team),team)
end function
function launch(level,item,origin,velocity)
  item = requireItem(item); dropped = game.spawn(level)
  dropped.s.eType = c.ET_ITEM; dropped.s.modelindex = item; dropped.s.modelindex2 = 1
  dropped.classname = itemName(item); dropped.item = item
  dropped.r.mins = [-15.0,-15.0,-15.0]; dropped.r.maxs = [15.0,15.0,15.0]; dropped.r.contents = 0x40000000
  dropped.touch = touch; game.setOrigin(dropped,origin); dropped.s.pos.trType = c.TR_GRAVITY; dropped.s.pos.trTime = level.time
  dropped.s.pos.trDelta = movement.copy(velocity); dropped.s.eFlags = dropped.s.eFlags | 0x20
  if level.spawner != void and level.spawner.gametype == 4 and itemType(item) == c.IT_TEAM then
    dropped.think = droppedFlagThink; dropped.nextthink = n.add32(level.time,30000); checkDropped(level,dropped)
  else
    dropped.think = game.free; dropped.nextthink = n.add32(level.time,30000)
  end if
  dropped.flags = FL_DROPPED_ITEM; game.link(level,dropped)
  return dropped
end function
function drop(level,ent,item,angle)
  angles = movement.copy(ent.s.apos.trBase); angles[1] = n.fadd(angles[1],angle); angles[0] = 0.0
  velocity = q.AngleVectors(angles)[0]; velocity = q.VectorScale(velocity,150.0)
  velocity[2] = n.f32(velocity[2]+200.0+centeredRandom(level)*50.0)
  return launch(level,item,ent.s.pos.trBase,velocity)
end function
function bounce(level,ent,hit)
  tr = hit.trace
  hitTime = n.trunc32(n.fadd(level.previousTime,n.fmul(n.i32(level.time-level.previousTime),tr.fraction)))
  velocity = trajectory.evaluateDelta(ent.s.pos,hitTime); dot = q.DotProduct(velocity,tr.normal)
  ent.s.pos.trDelta = q.VectorMA(velocity,n.fmul(-2,dot),tr.normal)
  for axis = 0 to 2
    ent.s.pos.trDelta[axis] = n.fmul(ent.s.pos.trDelta[axis],ent.physicsBounce)
  end for
  if tr.normal[2] > 0 and ent.s.pos.trDelta[2] < 40 then
    hit.endpos[2] = n.fadd(hit.endpos[2],1.0); snapshot.snapVector(hit.endpos); game.setOrigin(ent,hit.endpos)
    ent.s.groundEntityNum = hit.entityNum; return void
  end if
  for axis = 0 to 2
    ent.r.currentOrigin[axis] = n.fadd(ent.r.currentOrigin[axis],tr.normal[axis])
  end for
  ent.s.pos.trBase = movement.copy(ent.r.currentOrigin); ent.s.pos.trTime = level.time
  return void
end function
function run(level,ent)
  requireItem(ent.item)
  if ent.s.groundEntityNum == -1 and ent.s.pos.trType != c.TR_GRAVITY then ent.s.pos.trType = c.TR_GRAVITY; ent.s.pos.trTime = level.time end if
  if ent.s.pos.trType == c.TR_STATIONARY then return game.runThink(level,ent) end if
  origin = trajectory.evaluate(ent.s.pos,level.time); mask = ent.clipmask
  if mask == 0 then mask = 0x10001 end if
  hit = combat.shotTrace(level,ent.r.currentOrigin,origin,ent.r.mins,ent.r.maxs,ent.r.ownerNum,mask)
  ent.r.currentOrigin = movement.copy(hit.endpos)
  if hit.trace.startsolid then hit.trace.fraction = 0.0 end if
  game.link(level,ent); game.runThink(level,ent)
  if hit.trace.fraction == 1 then return void end if
  if (sv.pointContents(level.scene,ent.r.currentOrigin,-1) & 0x80000000) != 0 then
    if itemType(ent.item) == c.IT_TEAM then return teamFree(level,ent) end if
    return game.free(level,ent)
  end if
  return bounce(level,ent,hit)
end function
