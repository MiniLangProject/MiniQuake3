// SPDX-License-Identifier: GPL-2.0-or-later
// Small hitscan weapon used by the standalone playable preview.
package mq3.client.playable_weapon

import mq3.client.playable_viewer as viewer
import mq3.collision.world as collision
import mq3.shared.math as qmath
import mq3.compat.numeric as numeric

const SHOT_MASK=0x6000001
const DEFAULT_AMMO=10
const DEFAULT_COOLDOWN_MILLISECONDS=900
const DEFAULT_RANGE=8192.0

/// Stores playable weapon weapon record, including `traceFn`, `context`, `ammo`, `capacity`, `cooldownMilliseconds`, `cooldownRemaining` and additional values.
struct Weapon
  traceFn
  context
  ammo
  capacity
  cooldownMilliseconds
  cooldownRemaining
  range
  automatic
  triggerHeld
  shotsFired
  classname
  damage
  noAmmoEvent
end struct

/// Stores playable weapon shot record, including `start`, `endPoint`, `hit`, `normal`, `distance`, `fraction`.
struct Shot
  start
  endPoint
  hit
  normal
  distance
  fraction
end struct

/// Adapts `mq3.collision.world.boxTrace` to playable weapon `worldPointTrace`, returning its result for `state.context, startPoint, endPoint, [0.0,0.0,0.0], [0.0,0.0,0.0], 0, SHOT_MASK, false`.
/// @param state Record read through `state.context`.
/// @param startPoint Starting world-space point of the segment or trace. Forwarded to `mq3.collision.world.boxTrace`.
/// @param endPoint Ending world-space point of the segment or trace. Forwarded to `mq3.collision.world.boxTrace`.
function worldPointTrace(state,startPoint,endPoint)
  return collision.boxTrace(state.context,startPoint,endPoint,[0.0,0.0,0.0],[0.0,0.0,0.0],0,SHOT_MASK,false)
end function

/// Computes `typeof(value)=="array" and len(value)==3` for playable weapon `validVector`.
/// @param value Sequence whose length/content is inspected by `validVector`.
function validVector(value)
  return typeof(value)=="array" and len(value)==3
end function

/// Calls `mq3.client.playable_weapon.Weapon`, `mq3.compat.numeric.f32` from playable weapon `createWithTrace`.
/// @param traceFn Collision-trace callback used to test the requested movement or visibility segment.
/// @param context context record passed to the playable weapon helper calls.
/// @param ammo Value used by `if ammo<0 then return error(7501,"playable weapon ammo cannot be negative") end if`.
/// @param cooldownMilliseconds Value used by `if cooldownMilliseconds<0 then return error(7502,"playable weapon cooldown cannot be negative") end if`.
/// @param range Value used by `if range<=0.0 then return error(7503,"playable weapon range must be positive") end if`.
/// @param automatic Value used by `return Weapon(traceFn,context,ammo,ammo,cooldownMilliseconds,0,numeric.f32(range),automatic,false,0,"weapon_machinegun",34,false)`.
function createWithTrace(traceFn,context,ammo,cooldownMilliseconds,range,automatic)
  if traceFn==void then return error(7500,"playable weapon needs a trace function") end if
  if ammo<0 then return error(7501,"playable weapon ammo cannot be negative") end if
  if cooldownMilliseconds<0 then return error(7502,"playable weapon cooldown cannot be negative") end if
  if range<=0.0 then return error(7503,"playable weapon range must be positive") end if
  return Weapon(traceFn,context,ammo,ammo,cooldownMilliseconds,0,numeric.f32(range),automatic,false,0,"weapon_machinegun",34,false)
end function

// Stock Baseq3 weapon timing and direct-hit damage. The playable app turns
// Rocket, Plasma and Grenade shots into predicted moving projectiles.
/// @param state Mutable playable weapon record/storage; this routine assigns `state.cooldownMilliseconds`, `state.automatic`, `state.damage`, `state.range` and additional values.
/// @param classname Value assigned to `state.classname`.
function configure(state,classname)
  if state==void then return error(7510,"playable weapon configuration needs a weapon") end if
  if classname=="weapon_gauntlet" then state.cooldownMilliseconds=400;state.automatic=true;state.damage=50;state.range=32.0
  else if classname=="weapon_machinegun" then state.cooldownMilliseconds=100;state.automatic=true;state.damage=7;state.range=DEFAULT_RANGE
  else if classname=="weapon_shotgun" then state.cooldownMilliseconds=1000;state.automatic=false;state.damage=110;state.range=DEFAULT_RANGE
  else if classname=="weapon_grenadelauncher" then state.cooldownMilliseconds=800;state.automatic=false;state.damage=100;state.range=DEFAULT_RANGE
  else if classname=="weapon_rocketlauncher" then state.cooldownMilliseconds=800;state.automatic=false;state.damage=100;state.range=DEFAULT_RANGE
  else if classname=="weapon_lightning" then state.cooldownMilliseconds=50;state.automatic=true;state.damage=8;state.range=768.0
  else if classname=="weapon_railgun" then state.cooldownMilliseconds=1500;state.automatic=false;state.damage=100;state.range=DEFAULT_RANGE
  else if classname=="weapon_plasmagun" then state.cooldownMilliseconds=100;state.automatic=true;state.damage=20;state.range=DEFAULT_RANGE
  else if classname=="weapon_bfg" then state.cooldownMilliseconds=200;state.automatic=true;state.damage=100;state.range=DEFAULT_RANGE
  else return error(7511,"unsupported playable weapon "+classname) end if
  state.classname=classname
  return state
end function

/// Calls `mq3.client.playable_weapon.createWithTrace`, `mq3.client.playable_weapon.configure` from playable weapon `create`. The final path returns `configure(state,"weapon_machinegun")`.
/// @param world world record passed to the playable weapon helper calls.
function create(world)
  if world==void then return error(7504,"playable weapon needs a collision world") end if
  state=createWithTrace(worldPointTrace,world,DEFAULT_AMMO,DEFAULT_COOLDOWN_MILLISECONDS,DEFAULT_RANGE,false)
  return configure(state,"weapon_machinegun")
end function

/// Updates `state.cooldownRemaining` during playable weapon `advance`.
/// @param state Mutable playable weapon record/storage; this routine assigns `state.cooldownRemaining`.
/// @param deltaMilliseconds Elapsed simulation interval in milliseconds.
function advance(state,deltaMilliseconds)
  if state==void then return error(7505,"playable weapon advance needs a weapon") end if
  if deltaMilliseconds<0 then deltaMilliseconds=0 end if
  state.cooldownRemaining=state.cooldownRemaining-deltaMilliseconds
  if state.cooldownRemaining<0 then state.cooldownRemaining=0 end if
  return state.cooldownRemaining
end function

/// Calls `mq3.client.playable_weapon.validVector`, `mq3.compat.numeric.f32`, `mq3.shared.math.VectorNormalize` and additional helpers from playable weapon `shootRay`.
/// @param state Record read through `state.range`, `state.traceFn`.
/// @param startPoint Starting world-space point of the segment or trace.
/// @param direction Direction vector used by the spatial calculation.
function shootRay(state,startPoint,direction)
  if state==void or not validVector(startPoint) or not validVector(direction) then return error(7506,"playable weapon shot needs weapon, start and direction") end if
  forward=[numeric.f32(direction[0]),numeric.f32(direction[1]),numeric.f32(direction[2])]
  if qmath.VectorNormalize(forward)==0.0 then return error(7507,"playable weapon direction cannot be zero") end if
  intended=qmath.VectorMA(startPoint,state.range,forward)
  traced=state.traceFn(state,startPoint,intended);if traced is error then return traced end if
  fraction=traced.trace.fraction
  hit=fraction<1.0
  normal=[0.0,0.0,0.0]
  if hit then normal=[traced.trace.normal[0],traced.trace.normal[1],traced.trace.normal[2]] end if
  delta=[numeric.fsub(traced.endpos[0],startPoint[0]),numeric.fsub(traced.endpos[1],startPoint[1]),numeric.fsub(traced.endpos[2],startPoint[2])]
  return Shot([startPoint[0],startPoint[1],startPoint[2]],[traced.endpos[0],traced.endpos[1],traced.endpos[2]],hit,normal,qmath.VectorLength(delta),fraction)
end function

// Returns a Shot only when this frame fires. A semi-automatic weapon requires a
// new trigger edge; an automatic weapon repeats whenever its cooldown expires.
/// @param state Mutable playable weapon record/storage; this routine assigns `state.noAmmoEvent`, `state.triggerHeld`, `state.cooldownRemaining`, `state.ammo` and additional values.
/// @param startPoint Starting world-space point of the segment or trace.
/// @param direction Direction vector used by the spatial calculation.
/// @param triggerDown Value assigned to `state.triggerHeld`.
/// @param deltaMilliseconds Elapsed simulation interval in milliseconds.
function stepRay(state,startPoint,direction,triggerDown,deltaMilliseconds)
  remaining=advance(state,deltaMilliseconds);if remaining is error then return remaining end if
  state.noAmmoEvent=false
  edge=triggerDown and not state.triggerHeld
  wantsShot=edge or (state.automatic and triggerDown)
  state.triggerHeld=triggerDown
  if not wantsShot or state.cooldownRemaining>0 then return void end if
  if state.ammo==0 then state.noAmmoEvent=true;state.cooldownRemaining=500;return void end if
  shot=shootRay(state,startPoint,direction);if shot is error then return shot end if
  if state.ammo>0 then state.ammo=state.ammo-1 end if
  state.shotsFired=state.shotsFired+1
  state.cooldownRemaining=state.cooldownMilliseconds
  return shot
end function

/// Calls `mq3.client.playable_viewer.cameraBasis`, `mq3.shared.math.VectorMA`, `mq3.compat.numeric.trunc32` from playable weapon `muzzlePoint`. The final path returns `muzzle`.
/// @param camera Camera state used to transform/project the scene. Record read through `camera.position`.
function muzzlePoint(camera)
  if camera==void then return error(7508,"playable weapon step needs a camera") end if
  basis=viewer.cameraBasis(camera)
  // Baseq3 CalcMuzzlePoint starts 14 units in front of the pivoting eye and
  // snaps the networked position to integer coordinates.
  muzzle=qmath.VectorMA(camera.position,14.0,basis[0])
  for axis=0 to 2 muzzle[axis]=numeric.trunc32(muzzle[axis]) end for
  return muzzle
end function

/// Calls `mq3.client.playable_weapon.muzzlePoint`, `mq3.client.playable_viewer.cameraBasis`, `mq3.client.playable_weapon.stepRay` from playable weapon `step`. The final path returns `stepRay(state,muzzle,basis[0],triggerDown,deltaMilliseconds)`.
/// @param state Shared playable weapon state passed to the helper calls in `step`.
/// @param camera Camera state used to transform/project the scene.
/// @param triggerDown Value used by `return stepRay(state,muzzle,basis[0],triggerDown,deltaMilliseconds)`.
/// @param deltaMilliseconds Elapsed simulation interval in milliseconds.
function step(state,camera,triggerDown,deltaMilliseconds)
  muzzle=muzzlePoint(camera);if muzzle is error then return muzzle end if
  basis=viewer.cameraBasis(camera)
  return stepRay(state,muzzle,basis[0],triggerDown,deltaMilliseconds)
end function

/// Updates `state.ammo` during playable weapon `reload`.
/// @param state Mutable playable weapon record/storage; this routine assigns `state.ammo`.
/// @param amount Value tested by `state==void or amount<0` before the calculation continues.
function reload(state,amount)
  if state==void or amount<0 then return error(7509,"playable weapon reload needs a weapon and non-negative amount") end if
  state.ammo=state.ammo+amount
  if state.ammo>state.capacity then state.ammo=state.capacity end if
  return state.ammo
end function
