// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 g_weapon.c bullets, shotgun patterns, railgun and lightning.
package mq3.game.weapon_hitscan
import mq3.game.game_headers as headers
import mq3.game.weapon_state as state
import mq3.game.entities as game
import mq3.game.combat as combat
import mq3.game.constants as c
import mq3.game.missiles as missiles
import mq3.game.movement as movement
import mq3.game.snapshot as snapshot
import mq3.shared.math as q
import mq3.shared.directions as directions
import mq3.compat.numeric as n
import mq3.compat.transcendental as crt

const MASK_SHOT = 0x06000001
const SURF_NOIMPACT=headers.SURF_NOIMPACT
const AWARD_MASK = 0x38848

/// Require and return a client state for hitscan weapon accuracy bookkeeping.
/// @param ent Game entity; accesses `client`.
function hitscanClient(ent)
  if ent == void or ent.client == void then return error(487,"Weapon accuracy requires a client entity") end if
  return ent.client
end function
/// Read a trace-hit entity after validating its number against native entity storage.
/// @param level Game-level state; accesses `entities`.
/// @param number Operand used to evaluate the returned expression `level.entities[number]`.
function hitscanEntity(level,number)
  if number < 0 or number >= 1024 then return error(487,"Weapon trace entity exceeds native storage") end if
  return level.entities[number]
end function
/// Set `target[axis]` to `source[axis]` in `mq3.game.weapon_hitscan.hitscanCopy`.
/// @param target Array or byte sequence accessed at `axis`. Entries are written in place.
/// @param source Array or byte sequence accessed at `axis`.
function hitscanCopy(target,source)
  for axis = 0 to 2
    target[axis] = source[axis]
  end for
  return void
end function
/// Return `2.0*(n.fdiv(game.random(level),32767.0)-0.5)` for `hitscanCenteredRandom`.
/// @param level Game-level state; accesses `randSeed`. May update `level.randSeed` in place.
function hitscanCenteredRandom(level)
  // random() divides as float; the crandom macro then uses double literals.
  return 2.0*(n.fdiv(game.random(level),32767.0)-0.5)
end function

/// Set `ent.client.accuracy_hits` to `n.add32(ent.client.accuracy_hits,1)` in `mq3.game.weapon_hitscan.bullet`.
/// @param level Game-level state; accesses `weaponState`. May update `level.weaponState` in place.
/// @param ent Game entity; accesses `s` and `client`. May update `ent.client.accuracy_hits` in place.
/// @param spread Value passed as argument 1 to `mq3.compat.numeric.f32`.
/// @param damage Damage amount before the current operation applies its rules.
function bullet(level,ent,spread,damage)
  w = state.get(level); spread = n.f32(spread)
  damage = n.trunc32(n.fmul(n.i32(damage),w.quadFactor))
  angle = n.fmul(n.fmul(n.fdiv(game.random(level),32767.0),n.f32(3.14159265358979323846)),2.0)
  // sin/cos and the crandom macro remain double until each final float store.
  // This consumes exactly three CRT random values, even at zero spread.
  vertical = n.f32(crt.sin(angle)*hitscanCenteredRandom(level)*spread*16.0)
  horizontal = n.f32(crt.cos(angle)*hitscanCenteredRandom(level)*spread*16.0)
  finish = q.VectorMA(w.muzzle,131072.0,w.forward)
  finish = q.VectorMA(finish,horizontal,w.right); finish = q.VectorMA(finish,vertical,w.up)
  // The original loop only continues for Missionpack invulnerability bounces.
  hit = combat.shotTrace(level,w.muzzle,finish,void,void,ent.s.number,MASK_SHOT)
  if (hit.trace.surfaceFlags & SURF_NOIMPACT) != 0 then return void end if
  target = hitscanEntity(level,hit.entityNum); missiles.snapTowards(hit.endpos,w.muzzle); temp = void
  if target.takedamage and target.client != void then
    temp = game.tempEntity(level,hit.endpos,c.EV_BULLET_HIT_FLESH); temp.s.eventParm = target.s.number
    if combat.logAccuracyHit(level,target,ent) then ent.client.accuracy_hits = n.add32(ent.client.accuracy_hits,1) end if
  else
    temp = game.tempEntity(level,hit.endpos,c.EV_BULLET_HIT_WALL); temp.s.eventParm = directions.dirToByte(hit.trace.normal)
  end if
  temp.s.otherEntityNum = ent.s.number
  if target.takedamage then
    // G_Damage normalizes the original global forward array in place.
    combat.damage(level,target,ent,ent,w.forward,hit.endpos,damage,0,c.MOD_MACHINEGUN)
  end if
  return void
end function

/// Apply `mq3.game.weapon_state.get`, `mq3.game.movement.copy` and `mq3.game.combat.shotTrace` while evaluating `shotgunPellet`.
/// @param level Game-level state; accesses `weaponState`. May update `level.weaponState` in place.
/// @param start Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param finish Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param ent Game entity; accesses `s`.
function shotgunPellet(level,start,finish,ent)
  w = state.get(level); traceStart = movement.copy(start); traceEnd = movement.copy(finish)
  hit = combat.shotTrace(level,traceStart,traceEnd,void,void,ent.s.number,MASK_SHOT)
  target = hitscanEntity(level,hit.entityNum)
  if (hit.trace.surfaceFlags & SURF_NOIMPACT) != 0 then return false end if
  if target.takedamage then
    damage = n.trunc32(n.fmul(10.0,w.quadFactor))
    combat.damage(level,target,ent,ent,w.forward,hit.endpos,damage,0,c.MOD_SHOTGUN)
    // A lethal pellet can fail the accuracy check because health is read now.
    if combat.logAccuracyHit(level,target,ent) then return true end if
  end if
  return false
end function
/// Set `ent.client.accuracy_hits` to `n.add32(ent.client.accuracy_hits,1)` in `mq3.game.weapon_hitscan.shotgunPattern`.
/// @param level Game-level state; accesses `weaponState`. May update `level.weaponState` in place.
/// @param origin World-space position as three coordinates.
/// @param origin2 Value passed as argument 1 to `mq3.shared.math.VectorNormalize2`.
/// @param seed State used to initialize the deterministic random sequence.
/// @param ent Game entity; accesses `client`. May update `ent.client.accuracy_hits` in place.
function shotgunPattern(level,origin,origin2,seed,ent)
  // These are local vectors in C. Pellets still pass the separate global
  // forward vector to G_Damage rather than this reconstructed pattern basis.
  patternForward = q.VectorNormalize2(origin2)
  patternRight = directions.perpendicular(patternForward); patternUp = q.CrossProduct(patternForward,patternRight)
  // Original reads an otherwise unused oldScore here, requiring a client.
  hitscanClient(ent); hitClient = false; randomState = q.RandomState(n.i32(seed))
  for index = 0 to 10
    horizontal = n.fmul(n.fmul(q.Q_crandom(randomState),700.0),16.0)
    vertical = n.fmul(n.fmul(q.Q_crandom(randomState),700.0),16.0)
    finish = q.VectorMA(origin,131072.0,patternForward)
    finish = q.VectorMA(finish,horizontal,patternRight); finish = q.VectorMA(finish,vertical,patternUp)
    // Evaluate every pellet even after the first successful accuracy hit.
    if shotgunPellet(level,origin,finish,ent) and not hitClient then
      hitClient = true; ent.client.accuracy_hits = n.add32(ent.client.accuracy_hits,1)
    end if
  end for
  return void
end function
/// Apply `mq3.game.weapon_state.get`, `mq3.game.entities.tempEntity` and `mq3.game.weapon_hitscan.hitscanCopy` while evaluating `shotgun`. Return paths include `shotgunPattern(level,temp.s.pos.trBase,temp.s.origin2,temp.s.eventParm,ent)`.
/// @param level Game-level state; accesses `weaponState`. May update `level.weaponState` in place.
/// @param ent Game entity; accesses `s`.
function shotgun(level,ent)
  w = state.get(level); temp = game.tempEntity(level,w.muzzle,c.EV_SHOTGUN)
  hitscanCopy(temp.s.origin2,q.VectorScale(w.forward,4096.0)); snapshot.snapVector(temp.s.origin2)
  temp.s.eventParm = game.random(level) & 255; temp.s.otherEntityNum = ent.s.number
  return shotgunPattern(level,temp.s.pos.trBase,temp.s.origin2,temp.s.eventParm,ent)
end function

/// Apply `mq3.game.weapon_state.get`, `mq3.game.combat.shotTrace` and `mq3.game.weapon_hitscan.hitscanEntity` while evaluating `rail`.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `s`.
function rail(level,ent)
  w = state.get(level); damage = n.trunc32(n.fmul(100.0,w.quadFactor))
  finish = q.VectorMA(w.muzzle,8192.0,w.forward); unlinked = []; hits = 0; passEntity = ent.s.number; hit = void
  while true
    hit = combat.shotTrace(level,w.muzzle,finish,void,void,passEntity,MASK_SHOT)
    if hit.entityNum >= 1022 then break end if
    target = hitscanEntity(level,hit.entityNum)
    if target.takedamage then
      if combat.logAccuracyHit(level,target,ent) then hits = hits+1 end if
      combat.damage(level,target,ent,ent,w.forward,hit.endpos,damage,0,c.MOD_RAILGUN)
    end if
    if (hit.trace.contents & 1) != 0 then break end if
    // Keep the entity pointer after damage, even when its death handler freed
    // it. The native railgun still unlinks and later relinks that same slot.
    game.unlink(level,target); unlinked = unlinked+[target]
    if len(unlinked) >= 4 then break end if
  end while
  for each target in unlinked
    game.link(level,target)
  end for
  missiles.snapTowards(hit.endpos,w.muzzle)
  temp = game.tempEntity(level,hit.endpos,c.EV_RAILTRAIL); temp.s.clientNum = ent.s.clientNum
  hitscanCopy(temp.s.origin2,w.muzzle)
  hitscanCopy(temp.s.origin2,q.VectorMA(temp.s.origin2,4.0,w.right))
  hitscanCopy(temp.s.origin2,q.VectorMA(temp.s.origin2,-1.0,w.up))
  if (hit.trace.surfaceFlags & SURF_NOIMPACT) != 0 then temp.s.eventParm = 255
  else temp.s.eventParm = directions.dirToByte(hit.trace.normal) end if
  temp.s.clientNum = ent.s.clientNum
  client = hitscanClient(ent)
  if hits == 0 then client.accurateCount = 0
  else
    client.accurateCount = n.add32(client.accurateCount,hits)
    if client.accurateCount >= 2 then
      client.accurateCount = n.add32(client.accurateCount,-2)
      client.ps.persistant[c.PERS_IMPRESSIVE_COUNT] = n.add32(client.ps.persistant[c.PERS_IMPRESSIVE_COUNT],1)
      client.ps.eFlags = (client.ps.eFlags & ~AWARD_MASK) | 0x8000
      client.rewardTime = n.add32(level.time,2000)
    end if
    client.accuracy_hits = n.add32(client.accuracy_hits,1)
  end if
  return void
end function

/// Set `ent.client.accuracy_hits` to `n.add32(ent.client.accuracy_hits,1)` in `mq3.game.weapon_hitscan.lightning`.
/// @param level Game-level state; accesses `weaponState`. May update `level.weaponState` in place.
/// @param ent Game entity; accesses `s` and `client`. May update `ent.client.accuracy_hits` in place.
function lightning(level,ent)
  w = state.get(level); damage = n.trunc32(n.fmul(8.0,w.quadFactor))
  finish = q.VectorMA(w.muzzle,768.0,w.forward)
  hit = combat.shotTrace(level,w.muzzle,finish,void,void,ent.s.number,MASK_SHOT)
  if hit.entityNum == 1023 then return void end if
  target = hitscanEntity(level,hit.entityNum)
  if target.takedamage then combat.damage(level,target,ent,ent,w.forward,hit.endpos,damage,0,c.MOD_LIGHTNING) end if
  // Damage can remove takedamage or client through death callbacks. The event
  // branch and accuracy check intentionally inspect their updated values.
  if target.takedamage and target.client != void then
    temp = game.tempEntity(level,hit.endpos,c.EV_MISSILE_HIT)
    temp.s.otherEntityNum = target.s.number; temp.s.eventParm = directions.dirToByte(hit.trace.normal); temp.s.weapon = ent.s.weapon
    if combat.logAccuracyHit(level,target,ent) then ent.client.accuracy_hits = n.add32(ent.client.accuracy_hits,1) end if
  else if (hit.trace.surfaceFlags & SURF_NOIMPACT) == 0 then
    temp = game.tempEntity(level,hit.endpos,c.EV_MISSILE_MISS); temp.s.eventParm = directions.dirToByte(hit.trace.normal)
  end if
  return void
end function
