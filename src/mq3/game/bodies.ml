// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Body queue/death helpers; G_RunItem's non-item corpse physics path.
package mq3.game.bodies
import mq3.game.entities as game
import mq3.game.entitystate as es
import mq3.game.constants as c
import mq3.game.movement as movement
import mq3.game.events as events
import mq3.game.combat as combat
import mq3.game.trajectory as trajectory
import mq3.game.snapshot as snapshot
import mq3.shared.math as q
import mq3.server.world as sv
import mq3.compat.numeric as n
function vectorYaw(vector)
  yaw = 0.0
  if vector[1] != 0 or vector[0] != 0 then
    if vector[0] != 0 then yaw = q.atanDegrees(vector[1],vector[0])
    else if vector[1] > 0 then yaw = 90.0 else yaw = 270.0 end if
    if yaw < 0 then yaw = n.fadd(yaw,360.0) end if
  end if
  return yaw
end function
function lookAtKiller(level,self,inflictor,attacker)
  if self.client == void then return error(494,"LookAtKiller requires a client") end if
  source = void
  if attacker != void and attacker != self then source = attacker
  else if inflictor != void and inflictor != self then source = inflictor end if
  if source == void then self.client.ps.stats[c.STAT_DEAD_YAW] = n.trunc32(self.s.angles[1]); return void end if
  dir = [0.0,0.0,0.0]
  for axis = 0 to 2
    dir[axis] = n.fsub(source.s.pos.trBase[axis],self.s.pos.trBase[axis])
  end for
  self.client.ps.stats[c.STAT_DEAD_YAW] = n.trunc32(vectorYaw(dir))
  return void
end function
function gib(level,self,killer)
  if (self.s.eFlags & 512) != 0 then
    for i = 0 to 1023
      ent = level.entities[i]
      if ent.inuse and ent.activator == self and ent.classname == "kamikaze timer" then game.free(level,ent); break end if
    end for
  end if
  events.add(level,self,c.EV_GIB_PLAYER,killer); self.takedamage = false; self.s.eType = c.ET_INVISIBLE; self.r.contents = 0
  return void
end function
function die(level,self,inflictor,attacker,damage,meansOfDeath)
  if self.health > -40 then return void end if
  if level.blood == 0 then self.health = -39; return void end if
  return gib(level,self,0)
end function
function initQueue(level)
  level.bodyQueIndex = 0; level.bodyQue = []
  for i = 0 to 7
    ent = game.spawn(level); ent.classname = "bodyque"; ent.neverFree = true
    level.bodyQue = level.bodyQue+[ent]
  end for
  return void
end function
function sink(level,ent)
  if n.i32(level.time-ent.timestamp) > 6500 then game.unlink(level,ent); ent.physicsObject = false; return void end if
  ent.nextthink = n.add32(level.time,100); ent.s.pos.trBase[2] = n.fsub(ent.s.pos.trBase[2],1.0)
  return void
end function
function copyToQueue(level,ent)
  game.unlink(level,ent)
  if (sv.pointContents(level.scene,ent.s.origin,-1) & 0x80000000) != 0 then return void end if
  if len(level.bodyQue) != 8 or level.bodyQueIndex < 0 or level.bodyQueIndex >= 8 then return error(494,"Body queue is not initialized") end if
  body = level.bodyQue[level.bodyQueIndex]; level.bodyQueIndex = (level.bodyQueIndex+1) % 8
  game.unlink(level,body)
  body.s = es.copy(ent.s); body.s.eFlags = 1; body.s.powerups = 0; body.s.loopSound = 0; body.s.number = body.slot
  body.timestamp = level.time; body.physicsObject = true; body.physicsBounce = 0.0
  if body.s.groundEntityNum == 1023 then
    if ent.client == void then return error(494,"Airborne body requires a client velocity") end if
    body.s.pos.trType = c.TR_GRAVITY; body.s.pos.trTime = level.time; body.s.pos.trDelta = movement.copy(ent.client.ps.velocity)
  else
    body.s.pos.trType = c.TR_STATIONARY
  end if
  body.s.event = 0; anim = body.s.legsAnim & n.i32(~128); dead = c.BOTH_DEAD3
  if anim == c.BOTH_DEATH1 or anim == c.BOTH_DEAD1 then dead = c.BOTH_DEAD1
  else if anim == c.BOTH_DEATH2 or anim == c.BOTH_DEAD2 then dead = c.BOTH_DEAD2 end if
  body.s.legsAnim = dead; body.s.torsoAnim = dead
  body.r.svFlags = ent.r.svFlags; body.r.mins = movement.copy(ent.r.mins); body.r.maxs = movement.copy(ent.r.maxs)
  body.r.absmin = movement.copy(ent.r.absmin); body.r.absmax = movement.copy(ent.r.absmax)
  body.clipmask = 0x10001; body.r.contents = 0x4000000; body.r.ownerNum = ent.s.number
  body.nextthink = n.add32(level.time,5000); body.think = sink; body.die = die; body.takedamage = ent.health > -40
  // The original leaves body.health and other private fields from the reused slot.
  body.r.currentOrigin = movement.copy(body.s.pos.trBase)
  return game.link(level,body)
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
  if ent.classname != "bodyque" or ent.s.eType == c.ET_ITEM then return error(494,"Only body queue physics is implemented here") end if
  if ent.s.groundEntityNum == -1 and ent.s.pos.trType != c.TR_GRAVITY then ent.s.pos.trType = c.TR_GRAVITY; ent.s.pos.trTime = level.time end if
  if ent.s.pos.trType == c.TR_STATIONARY then return game.runThink(level,ent) end if
  origin = trajectory.evaluate(ent.s.pos,level.time); mask = ent.clipmask
  if mask == 0 then mask = 0x10001 end if
  hit = combat.shotTrace(level,ent.r.currentOrigin,origin,ent.r.mins,ent.r.maxs,ent.r.ownerNum,mask)
  ent.r.currentOrigin = movement.copy(hit.endpos)
  if hit.trace.startsolid then hit.trace.fraction = 0.0 end if
  game.link(level,ent); game.runThink(level,ent)
  if hit.trace.fraction == 1 then return void end if
  if (sv.pointContents(level.scene,ent.r.currentOrigin,-1) & 0x80000000) != 0 then return game.free(level,ent) end if
  return bounce(level,ent,hit)
end function
