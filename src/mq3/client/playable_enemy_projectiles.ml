// SPDX-License-Identifier: GPL-2.0-or-later
// Deterministic visible enemy projectiles for the standalone preview.
package mq3.client.playable_enemy_projectiles

import mq3.collision.world as collision
import mq3.shared.math as qmath
import mq3.compat.numeric as numeric

const SHOT_MASK=0x6000001
const DEFAULT_SPEED=420.0
const DEFAULT_LIFETIME_MILLISECONDS=2500
const DEFAULT_RADIUS=3.0
const PLAYER_AABB=0
const PLAYER_SPHERE=1

/// Stores playable enemy projectiles projectile record, including `id`, `attacker`, `origin`, `velocity`, `spawnedAt`, `expiresAt` and additional values.
struct Projectile id attacker origin velocity spawnedAt expiresAt damage side radius end struct
/// Stores playable enemy projectiles trail record, including `projectileId`, `start`, `endPoint`, `fromTime`, `toTime`.
struct Trail projectileId start endPoint fromTime toTime end struct
/// Stores playable enemy projectiles impact record, including `projectileId`, `attacker`, `kind`, `point`, `normal`, `damage` and additional values.
struct Impact projectileId attacker kind point normal damage side at end struct
/// Stores playable enemy projectiles state, including `projectiles`, `trails`, `impacts`, `nextId`, `lastTime`, `lastSpawnTime` and additional values.
struct State projectiles trails impacts nextId lastTime lastSpawnTime speed lifetime radius playerShape playerMins playerMaxs playerRadius damageThisFrame end struct

/// Creates the playable enemy projectiles error `7560` with diagnostic text `"preview enemy projectiles: "+message`.
/// @param message Argument 2 of `error`; passed as `"preview enemy projectiles: "+message`.
function fail(message) return error(7560,"preview enemy projectiles: "+message) end function
/// Computes `typeof(value)=="array" and len(value)==3` for playable enemy projectiles `validVector`.
/// @param value Sequence whose length/content is inspected by `validVector`.
function validVector(value) return typeof(value)=="array" and len(value)==3 end function
/// Copies the X, Y and Z components into a fresh playable enemy projectiles vector.
/// @param value Sequence read at `value[0]`, `value[1]`, `value[2]`.
function copyPoint(value) return [value[0],value[1],value[2]] end function

/// Calls `mq3.client.playable_enemy_projectiles.validVector`, `mq3.client.playable_enemy_projectiles.State`, `mq3.compat.numeric.f32` and additional helpers from playable enemy projectiles `create`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param speed Value used by `if now<0 or speed<=0.0 or lifetime<=0 or radius<0.0 then return fail("time and projectile dimensions are invalid") end if`.
/// @param lifetime Value used by `if now<0 or speed<=0.0 or lifetime<=0 or radius<0.0 then return fail("time and projectile dimensions are invalid") end if`.
/// @param radius Radius used by the spatial or visual calculation.
/// @param playerShape Value used by `if playerShape!=PLAYER_AABB and playerShape!=PLAYER_SPHERE then return fail("unknown player collision shape") end if`.
/// @param playerMins Sequence read at `playerMins[axis]`.
/// @param playerMaxs Sequence read at `playerMaxs[axis]`.
/// @param playerRadius Value used by `if not validVector(playerMins) or not validVector(playerMaxs) or playerRadius<=0.0 then return fail("player bounds are invalid") end if`.
function create(now,speed,lifetime,radius,playerShape,playerMins,playerMaxs,playerRadius)
  if now<0 or speed<=0.0 or lifetime<=0 or radius<0.0 then return fail("time and projectile dimensions are invalid") end if
  if playerShape!=PLAYER_AABB and playerShape!=PLAYER_SPHERE then return fail("unknown player collision shape") end if
  if not validVector(playerMins) or not validVector(playerMaxs) or playerRadius<=0.0 then return fail("player bounds are invalid") end if
  for axis=0 to 2 if playerMins[axis]>playerMaxs[axis] then return fail("player bounds are inverted") end if end for
  return State([],[],[],0,now,-1,numeric.f32(speed),lifetime,numeric.f32(radius),playerShape,copyPoint(playerMins),copyPoint(playerMaxs),numeric.f32(playerRadius),0)
end function

/// Adapts `mq3.client.playable_enemy_projectiles.create` to playable enemy projectiles `createAabb`, returning its result for `now, DEFAULT_SPEED, DEFAULT_LIFETIME_MILLISECONDS, DEFAULT_RADIUS, PLAYER_AABB, [-15.0,-15.0,-24.0], [15.0,15.0,32.0], 18.0`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps. Forwarded to `mq3.client.playable_enemy_projectiles.create`.
function createAabb(now)
  return create(now,DEFAULT_SPEED,DEFAULT_LIFETIME_MILLISECONDS,DEFAULT_RADIUS,PLAYER_AABB,[-15.0,-15.0,-24.0],[15.0,15.0,32.0],18.0)
end function

/// Adapts `mq3.client.playable_enemy_projectiles.create` to playable enemy projectiles `createSphere`, returning its result for `now, DEFAULT_SPEED, DEFAULT_LIFETIME_MILLISECONDS, DEFAULT_RADIUS, PLAYER_SPHERE, [-radius,-radius,-radius], [radius,radius,radius], radius`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps. Forwarded to `mq3.client.playable_enemy_projectiles.create`.
/// @param radius Radius used by the spatial or visual calculation. Forwarded to `mq3.client.playable_enemy_projectiles.create`.
function createSphere(now,radius)
  return create(now,DEFAULT_SPEED,DEFAULT_LIFETIME_MILLISECONDS,DEFAULT_RADIUS,PLAYER_SPHERE,[-radius,-radius,-radius],[radius,radius,radius],radius)
end function

/// Adapts `mq3.collision.world.boxTrace` to playable enemy projectiles `worldPointTrace`, returning its result for `context, startPoint, endPoint, [0.0,0.0,0.0], [0.0,0.0,0.0], 0, SHOT_MASK, false`.
/// @param context Argument 1 of `mq3.collision.world.boxTrace`.
/// @param startPoint Starting world-space point of the segment or trace. Forwarded to `mq3.collision.world.boxTrace`.
/// @param endPoint Ending world-space point of the segment or trace. Forwarded to `mq3.collision.world.boxTrace`.
function worldPointTrace(context,startPoint,endPoint)
  return collision.boxTrace(context,startPoint,endPoint,[0.0,0.0,0.0],[0.0,0.0,0.0],0,SHOT_MASK,false)
end function

/// Updates `state.nextId`, `state.projectiles` during playable enemy projectiles `spawnOne`.
/// @param state Mutable playable enemy projectiles record/storage; this routine assigns `state.nextId`, `state.projectiles`.
/// @param attacker Value used by `projectile=Projectile(state.nextId,attacker,copyPoint(origin),velocity,now,now+state.lifetime,damage,side,state.radius)`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param target Sequence read at `target[0]`, `target[1]`, `target[2]`.
/// @param damage Value used by `projectile=Projectile(state.nextId,attacker,copyPoint(origin),velocity,now,now+state.lifetime,damage,side,state.radius)`.
/// @param side Value used by `if side<0 then direction[0]=-1.0 end if`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function spawnOne(state,attacker,origin,target,damage,side,now)
  direction=[target[0]-origin[0],target[1]-origin[1],target[2]-origin[2]]
  if qmath.VectorNormalize(direction)==0.0 then
    direction=[1.0,0.0,0.0];if side<0 then direction[0]=-1.0 end if
  end if
  velocity=[numeric.fmul(direction[0],state.speed),numeric.fmul(direction[1],state.speed),numeric.fmul(direction[2],state.speed)]
  projectile=Projectile(state.nextId,attacker,copyPoint(origin),velocity,now,now+state.lifetime,damage,side,state.radius)
  state.nextId=state.nextId+1;state.projectiles=state.projectiles+[projectile]
  return projectile
end function

// Consume one AI event batch once. Repeating this call at the same timestamp is
// idempotent, which prevents duplicate shots if rendering samples a frame twice.
/// @param state Mutable playable enemy projectiles record/storage; this routine assigns `state.lastSpawnTime`.
/// @param ai Record read through `ai.events`.
/// @param targetState Record read through `targetState.targets`.
/// @param playerPosition Value used by `if state==void or ai==void or targetState==void or not validVector(playerPosition) then return fail("state, AI, targets and player position ar...`.
/// @param muzzleOrigins Sequence read at `muzzleOrigins[event.attacker]`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function spawnAttacksFromMuzzles(state,ai,targetState,playerPosition,muzzleOrigins,now)
  if state==void or ai==void or targetState==void or not validVector(playerPosition) then return fail("state, AI, targets and player position are required") end if
  if muzzleOrigins!=void and len(muzzleOrigins)!=len(targetState.targets) then return fail("muzzle and target counts differ") end if
  if now<state.lastTime then return fail("spawn time moved backwards") end if
  if now==state.lastSpawnTime then return [] end if
  spawned=[]
  for each event in ai.events
    if event.attacker<0 or event.attacker>=len(targetState.targets) then return fail("AI attacker is outside targets") end if
    if event.damage<=0 then return fail("AI projectile damage must be positive") end if
    target=targetState.targets[event.attacker]
    if target.alive then
      muzzle=[target.origin[0],target.origin[1],target.origin[2]+20.0]
      if muzzleOrigins!=void and muzzleOrigins[event.attacker]!=void then
        if not validVector(muzzleOrigins[event.attacker]) then return fail("projectile muzzle is invalid") end if
        muzzle=muzzleOrigins[event.attacker]
      end if
      spawned=spawned+[spawnOne(state,event.attacker,muzzle,playerPosition,event.damage,event.side,now)]
    end if
  end for
  state.lastSpawnTime=now
  return spawned
end function

/// Adapts `mq3.client.playable_enemy_projectiles.spawnAttacksFromMuzzles` to playable enemy projectiles `spawnAttacks`, returning its result for `state, ai, targetState, playerPosition, void, now`.
/// @param state Argument 1 of `mq3.client.playable_enemy_projectiles.spawnAttacksFromMuzzles`.
/// @param ai Argument 2 of `mq3.client.playable_enemy_projectiles.spawnAttacksFromMuzzles`.
/// @param targetState Argument 3 of `mq3.client.playable_enemy_projectiles.spawnAttacksFromMuzzles`.
/// @param playerPosition Argument 4 of `mq3.client.playable_enemy_projectiles.spawnAttacksFromMuzzles`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps. Forwarded to `mq3.client.playable_enemy_projectiles.spawnAttacksFromMuzzles`.
function spawnAttacks(state,ai,targetState,playerPosition,now)
  return spawnAttacksFromMuzzles(state,ai,targetState,playerPosition,void,now)
end function

// Slab intersection against player-local bounds expanded by projectile radius.
/// @param startPoint Starting world-space point of the segment or trace.
/// @param endPoint Ending world-space point of the segment or trace.
/// @param center Sequence read at `center[axis]`.
/// @param mins Minimum X, Y and Z coordinates of the axis-aligned bounds.
/// @param maxs Maximum X, Y and Z coordinates of the axis-aligned bounds.
/// @param radius Radius used by the spatial or visual calculation.
function aabbFraction(startPoint,endPoint,center,mins,maxs,radius)
  first=0.0;last=1.0
  for axis=0 to 2
    low=center[axis]+mins[axis]-radius;high=center[axis]+maxs[axis]+radius
    delta=endPoint[axis]-startPoint[axis]
    absolute=delta;if absolute<0.0 then absolute=0.0-absolute end if
    if absolute<0.000001 then
      if startPoint[axis]<low or startPoint[axis]>high then return -1.0 end if
    else
      enter=(low-startPoint[axis])/delta;leave=(high-startPoint[axis])/delta
      if enter>leave then swap=enter;enter=leave;leave=swap end if
      if enter>first then first=enter end if;if leave<last then last=leave end if
      if first>last then return -1.0 end if
    end if
  end for
  if last<0.0 or first>1.0 then return -1.0 end if
  if first<0.0 then return 0.0 end if
  return first
end function

/// Calls `mq3.shared.math.DotProduct`, `mq3.compat.numeric.fsqrt` from playable enemy projectiles `sphereFraction`. The final path returns `fraction`.
/// @param startPoint Starting world-space point of the segment or trace.
/// @param endPoint Ending world-space point of the segment or trace.
/// @param center Sequence read at `center[0]`, `center[1]`, `center[2]`.
/// @param radius Radius used by the spatial or visual calculation.
function sphereFraction(startPoint,endPoint,center,radius)
  delta=[endPoint[0]-startPoint[0],endPoint[1]-startPoint[1],endPoint[2]-startPoint[2]]
  offset=[startPoint[0]-center[0],startPoint[1]-center[1],startPoint[2]-center[2]]
  a=qmath.DotProduct(delta,delta);c=qmath.DotProduct(offset,offset)-radius*radius
  if c<=0.0 then return 0.0 end if
  if a<=0.000001 then return -1.0 end if
  b=qmath.DotProduct(offset,delta);discriminant=b*b-a*c
  if discriminant<0.0 then return -1.0 end if
  fraction=(0.0-b-numeric.fsqrt(discriminant))/a
  if fraction<0.0 or fraction>1.0 then return -1.0 end if
  return fraction
end function

/// Calls `mq3.client.playable_enemy_projectiles.sphereFraction`, `mq3.client.playable_enemy_projectiles.aabbFraction` from playable enemy projectiles `playerFraction`.
/// @param state Record read through `state.playerShape`, `state.playerRadius`, `state.playerMins`, `state.playerMaxs`.
/// @param projectile Record read through `projectile.radius`.
/// @param startPoint Starting world-space point of the segment or trace.
/// @param endPoint Ending world-space point of the segment or trace.
/// @param playerPosition Value used by `if state.playerShape==PLAYER_SPHERE then return sphereFraction(startPoint,endPoint,playerPosition,state.playerRadius+projectile.radius) end if`.
function playerFraction(state,projectile,startPoint,endPoint,playerPosition)
  if state.playerShape==PLAYER_SPHERE then return sphereFraction(startPoint,endPoint,playerPosition,state.playerRadius+projectile.radius) end if
  return aabbFraction(startPoint,endPoint,playerPosition,state.playerMins,state.playerMaxs,projectile.radius)
end function

/// Builds the playable enemy projectiles `pointOnSegment` sequence from `[startPoint[0]+(endPoint[0]-startPoint[0])*fraction,startPoint[1]+(endPoint[1]-startPoint[1])*fraction,startPoint[2]+(endPoint[2]-startPoint[2])*fraction]`.
/// @param startPoint Starting world-space point of the segment or trace.
/// @param endPoint Ending world-space point of the segment or trace.
/// @param fraction Interpolation or blend fraction between the endpoint values.
function pointOnSegment(startPoint,endPoint,fraction)
  return [startPoint[0]+(endPoint[0]-startPoint[0])*fraction,startPoint[1]+(endPoint[1]-startPoint[1])*fraction,startPoint[2]+(endPoint[2]-startPoint[2])*fraction]
end function

/// Updates `state.impacts`, `state.damageThisFrame` during playable enemy projectiles `appendImpact`.
/// @param state Mutable playable enemy projectiles record/storage; this routine assigns `state.impacts`, `state.damageThisFrame`.
/// @param projectile Record read through `projectile.id`, `projectile.attacker`, `projectile.side`.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param point Value used by `state.impacts=state.impacts+[Impact(projectile.id,projectile.attacker,kind,copyPoint(point),copyPoint(normal),damage,projectile.side,now)]`.
/// @param normal Surface-normal vector used to orient or offset the effect.
/// @param damage Value used by `state.impacts=state.impacts+[Impact(projectile.id,projectile.attacker,kind,copyPoint(point),copyPoint(normal),damage,projectile.side,now)]`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function appendImpact(state,projectile,kind,point,normal,damage,now)
  state.impacts=state.impacts+[Impact(projectile.id,projectile.attacker,kind,copyPoint(point),copyPoint(normal),damage,projectile.side,now)]
  if damage>0 then state.damageThisFrame=state.damageThisFrame+damage end if
  return void
end function

// traceFn must perform a BSP point trace and return { trace.fraction,
// trace.normal, endpos }. Projectiles disappear immediately on their first hit.
/// @param traceFn Collision-trace callback used to test the requested movement or visibility segment.
/// @param context context record passed to the playable enemy projectiles helper calls.
/// @param state Mutable playable enemy projectiles record/storage; this routine assigns `state.trails`, `state.impacts`, `state.damageThisFrame`, `state.projectiles` and additional values.
/// @param playerPosition Value used by `if traceFn==void or state==void or not validVector(playerPosition) then return fail("trace, state and player position are required") end if`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function updateWithTrace(traceFn,context,state,playerPosition,now)
  if traceFn==void or state==void or not validVector(playerPosition) then return fail("trace, state and player position are required") end if
  if now<state.lastTime then return fail("update time moved backwards") end if
  state.trails=[];state.impacts=[];state.damageThisFrame=0;survivors=[]
  for each projectile in state.projectiles
    kind=""
    fromTime=state.lastTime;if projectile.spawnedAt>fromTime then fromTime=projectile.spawnedAt end if
    toTime=now;if toTime>projectile.expiresAt then toTime=projectile.expiresAt end if
    startPoint=copyPoint(projectile.origin);endPoint=copyPoint(startPoint)
    if toTime>fromTime then
      seconds=(toTime-fromTime)/1000.0
      endPoint=[startPoint[0]+projectile.velocity[0]*seconds,startPoint[1]+projectile.velocity[1]*seconds,startPoint[2]+projectile.velocity[2]*seconds]
      traced=traceFn(context,startPoint,endPoint);if traced is error then return traced end if
      worldFraction=traced.trace.fraction;hitFraction=playerFraction(state,projectile,startPoint,endPoint,playerPosition)
      fraction=1.0
      // A world hit wins an exact tie, so a wall can shield the player.
      if worldFraction<1.0 then kind="world";fraction=worldFraction end if
      if hitFraction>=0.0 and hitFraction<fraction then kind="player";fraction=hitFraction end if
      finalPoint=pointOnSegment(startPoint,endPoint,fraction)
      hitTime=toTime
      if kind!="" then hitTime=fromTime+numeric.trunc32((toTime-fromTime)*fraction) end if
      state.trails=state.trails+[Trail(projectile.id,startPoint,finalPoint,fromTime,hitTime)]
      if kind=="player" then
        appendImpact(state,projectile,kind,finalPoint,[0.0,0.0,0.0],projectile.damage,hitTime)
      else if kind=="world" then
        appendImpact(state,projectile,kind,finalPoint,traced.trace.normal,0,hitTime)
      else
        projectile.origin=endPoint
      end if
    end if
    if kind=="" then
      if now>=projectile.expiresAt then appendImpact(state,projectile,"expired",projectile.origin,[0.0,0.0,0.0],0,projectile.expiresAt)
      else survivors=survivors+[projectile] end if
    end if
  end for
  state.projectiles=survivors;state.lastTime=now
  return state.damageThisFrame
end function

/// Calls `mq3.client.playable_enemy_projectiles.updateWithTrace` from playable enemy projectiles `update`. The final path returns `updateWithTrace(worldPointTrace,world,state,playerPosition,now)`.
/// @param world world record passed to the playable enemy projectiles helper calls.
/// @param state Shared playable enemy projectiles state passed to the helper calls in `update`.
/// @param playerPosition Value used by `return updateWithTrace(worldPointTrace,world,state,playerPosition,now)`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function update(world,state,playerPosition,now)
  if world==void then return fail("collision world is required") end if
  return updateWithTrace(worldPointTrace,world,state,playerPosition,now)
end function

/// Evaluates playable enemy projectiles `activeCount` and returns `0`, `len(state.projectiles)` according to its guard/selection conditions.
/// @param state Record read through `state.projectiles`.
function activeCount(state) if state==void then return 0 end if;return len(state.projectiles) end function
