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

struct Shot
  start
  endPoint
  hit
  normal
  distance
  fraction
end struct

function worldPointTrace(state,startPoint,endPoint)
  return collision.boxTrace(state.context,startPoint,endPoint,[0.0,0.0,0.0],[0.0,0.0,0.0],0,SHOT_MASK,false)
end function

function validVector(value)
  return typeof(value)=="array" and len(value)==3
end function

function createWithTrace(traceFn,context,ammo,cooldownMilliseconds,range,automatic)
  if traceFn==void then return error(7500,"playable weapon needs a trace function") end if
  if ammo<0 then return error(7501,"playable weapon ammo cannot be negative") end if
  if cooldownMilliseconds<0 then return error(7502,"playable weapon cooldown cannot be negative") end if
  if range<=0.0 then return error(7503,"playable weapon range must be positive") end if
  return Weapon(traceFn,context,ammo,ammo,cooldownMilliseconds,0,numeric.f32(range),automatic,false,0,"weapon_machinegun",34,false)
end function

// Stock Baseq3 weapon timing and direct-hit damage. The playable app turns
// Rocket, Plasma and Grenade shots into predicted moving projectiles.
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

function create(world)
  if world==void then return error(7504,"playable weapon needs a collision world") end if
  state=createWithTrace(worldPointTrace,world,DEFAULT_AMMO,DEFAULT_COOLDOWN_MILLISECONDS,DEFAULT_RANGE,false)
  return configure(state,"weapon_machinegun")
end function

function advance(state,deltaMilliseconds)
  if state==void then return error(7505,"playable weapon advance needs a weapon") end if
  if deltaMilliseconds<0 then deltaMilliseconds=0 end if
  state.cooldownRemaining=state.cooldownRemaining-deltaMilliseconds
  if state.cooldownRemaining<0 then state.cooldownRemaining=0 end if
  return state.cooldownRemaining
end function

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

function muzzlePoint(camera)
  if camera==void then return error(7508,"playable weapon step needs a camera") end if
  basis=viewer.cameraBasis(camera)
  // Baseq3 CalcMuzzlePoint starts 14 units in front of the pivoting eye and
  // snaps the networked position to integer coordinates.
  muzzle=qmath.VectorMA(camera.position,14.0,basis[0])
  for axis=0 to 2 muzzle[axis]=numeric.trunc32(muzzle[axis]) end for
  return muzzle
end function

function step(state,camera,triggerDown,deltaMilliseconds)
  muzzle=muzzlePoint(camera);if muzzle is error then return muzzle end if
  basis=viewer.cameraBasis(camera)
  return stepRay(state,muzzle,basis[0],triggerDown,deltaMilliseconds)
end function

function reload(state,amount)
  if state==void or amount<0 then return error(7509,"playable weapon reload needs a weapon and non-negative amount") end if
  state.ammo=state.ammo+amount
  if state.ammo>state.capacity then state.ammo=state.capacity end if
  return state.ammo
end function
