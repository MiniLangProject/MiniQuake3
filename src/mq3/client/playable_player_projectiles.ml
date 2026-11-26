// SPDX-License-Identifier: GPL-2.0-or-later
// Deterministic player-fired missiles for the standalone playable preview.
package mq3.client.playable_player_projectiles

import mq3.collision.world as collision
import mq3.client.playable_targets as projectileTargets
import mq3.client.playable_projectile_view as view
import mq3.shared.math as qmath
import mq3.compat.numeric as numeric

/// Combined collision-content mask used when tracing a weapon shot.
const SHOT_MASK=0x6000001
/// Downward acceleration used by the module's ballistic or movement integration.
const GRAVITY=800.0
/// Entity-state flag selecting bounce half behavior in client presentation.
const EF_BOUNCE_HALF=0x10
/// Velocity-retention multiplier applied when a native projectile bounces.
const BOUNCE_SCALE=0.65
/// Capacity limit for the bounces per frame collection or bounded storage used by this client module.
const MAX_BOUNCES_PER_FRAME=8
/// Weapon classname used to select the rocket projectile profile.
const ROCKET="weapon_rocketlauncher"
/// Weapon classname used to select the plasma projectile profile.
const PLASMA="weapon_plasmagun"
/// Weapon classname used to select the grenade projectile profile.
const GRENADE="weapon_grenadelauncher"
/// Weapon classname used to select the BFG projectile profile.
const BFG="weapon_bfg"

/// Stores playable player projectiles profile record, including `classname`, `style`, `speed`, `lifetime`, `directDamage`, `splashDamage` and additional values.
struct Profile
  /// Weapon classname selecting the projectile's simulation and presentation profile.
  classname
  /// Projectile presentation style selected by the weapon profile and copied into trail and impact
  /// records.
  style
  /// When constructing this record, `profile` supplies `900.0` for this member.
  speed
  /// When constructing this record, `profile` supplies `15000` for this member.
  lifetime
  /// When constructing this record, `profile` supplies `100` for this member. Used by `damageAtImpact`
  /// during subsequent processing.
  directDamage
  /// When constructing this record, `profile` supplies `100` for this member. Used by `damageAtImpact`
  /// during subsequent processing.
  splashDamage
  /// When constructing this record, `profile` supplies `120.0` for this member. Used by
  /// `damageAtImpact` during subsequent processing.
  splashRadius
  /// When constructing this record, `profile` supplies `false` for this member. Used by `stepEndpoint`
  /// and `velocityAfter` during subsequent processing.
  gravity
  /// When constructing this record, `profile` supplies `0` for this member. Used by `updateWithTrace`
  /// during subsequent processing.
  eFlags
end struct
/// Stores playable player projectiles projectile record, including `id`, `profile`, `origin`, `velocity`, `spawnedAt`, `expiresAt` and additional values.
struct Projectile
  /// Stable effect identifier used to track or replace this projectile, particle, or mark.
  id
  /// When constructing this record, `spawnProfile` supplies `weaponProfile` for this member.
  profile
  /// Current world-space position from which the player's projectile advances its next movement step;
  /// updated after travel and collisions.
  origin
  /// Linear rate of change of position used by movement or effect integration.
  velocity
  /// When constructing this record, `spawnProfile` supplies `now` for this member.
  spawnedAt
  /// When constructing this record, `spawnProfile` supplies `now+weaponProfile.lifetime` for this
  /// member.
  expiresAt
  /// When constructing this record, `spawnProfile` supplies `false` for this member.
  stopped
end struct
/// Stores playable player projectiles trail record, including `projectileId`, `style`, `start`, `endPoint`, `fromTime`, `toTime`.
struct Trail
  /// Stable projectile identifier used to associate movement, trails, and impact presentation.
  projectileId
  /// Projectile style carried by this traveled segment so trail rendering can select the matching
  /// effect.
  style
  /// When constructing this record, `updateWithTrace` supplies `startPoint` for this member.
  start
  /// World-space endpoint of the trace, beam, or projectile presentation segment.
  endPoint
  /// When constructing this record, `updateWithTrace` supplies `cursorTime` for this member.
  fromTime
  /// When constructing this record, `updateWithTrace` supplies `hitTime` for this member.
  toTime
end struct
/// Stores playable player projectiles damage record, including `targetIndex`, `amount`, `direct`, `killed`, `awardedScore`.
struct Damage
  /// Index identifying the selected target in the owning target collection.
  targetIndex
  /// When constructing this record, `applyDamage` supplies `amount` for this member.
  amount
  /// When constructing this record, `applyDamage` supplies `direct` for this member.
  direct
  /// When constructing this record, `applyDamage` supplies `killed` for this member.
  killed
  /// When constructing this record, `applyDamage` supplies `awarded` for this member.
  awardedScore
end struct
/// Stores playable player projectiles impact record, including `id`, `projectileId`, `classname`, `style`, `kind`, `point` and additional values.
struct Impact
  /// Stable effect identifier used to track or replace this projectile, particle, or mark.
  id
  /// Stable projectile identifier used to associate movement, trails, and impact presentation.
  projectileId
  /// Weapon classname copied from the projectile profile into its impact result.
  classname
  /// Projectile style retained at impact to select the corresponding explosion and hit presentation.
  style
  /// Effect or media category selecting the matching geometry, texture, or presentation behavior.
  kind
  /// When constructing this record, `addImpact` supplies `copyPoint(point)` for this member.
  point
  /// Collision-plane normal at a player projectile's impact, used by its impact and explosion effects.
  normal
  /// Index identifying the selected target in the owning target collection.
  targetIndex
  /// When constructing this record, `addImpact` supplies `damages` for this member.
  damages
  /// When constructing this record, `addImpact` supplies `now` for this member.
  at
end struct
/// Stores playable player projectiles state, including `projectiles`, `trails`, `impacts`, `nextProjectileId`, `nextImpactId`, `lastTime`.
struct State
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `spawnProfile` and `updateWithTrace` during subsequent processing.
  projectiles
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `updateWithTrace` during subsequent processing.
  trails
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `addImpact` and `updateWithTrace` during subsequent processing.
  impacts
  /// When constructing this record, `create` supplies `0` for this member. Used by `spawnProfile`
  /// during subsequent processing.
  nextProjectileId
  /// When constructing this record, `create` supplies `0` for this member. Used by `addImpact` during
  /// subsequent processing.
  nextImpactId
  /// When constructing this record, `create` supplies `now` for this member. Used by `spawnProfile` and
  /// `updateWithTrace` during subsequent processing.
  lastTime
end struct

/// Creates the playable player projectiles error `7590` with diagnostic text `"player projectiles: "+message`.
/// @param message Argument 2 of `error`; passed as `"player projectiles: "+message`.
function fail(message) return error(7590,"player projectiles: "+message) end function
/// Computes `value!=void and typeof(value)=="array" and len(value)==3` for playable player projectiles `validPoint`.
/// @param value Sequence whose length/content is inspected by `validPoint`.
function validPoint(value) return value!=void and typeof(value)=="array" and len(value)==3 end function
/// Copies three vector components with float32 rounding for playable player projectiles.
/// @param value Sequence read at `value[0]`, `value[1]`, `value[2]`.
function copyPoint(value) return [numeric.f32(value[0]),numeric.f32(value[1]),numeric.f32(value[2])] end function

// Values mirror baseq3's fire_rocket, fire_plasma and fire_grenade.
/// @param classname Value used by `if classname==ROCKET then return Profile(classname,view.STYLE_ROCKET,900.0,15000,100,100,120.0,false,0) end if`.
function profile(classname)
  if classname==ROCKET then return Profile(classname,view.STYLE_ROCKET,900.0,15000,100,100,120.0,false,0) end if
  if classname==PLASMA then return Profile(classname,view.STYLE_PLASMA,2000.0,10000,20,15,20.0,false,0) end if
  if classname==GRENADE then return Profile(classname,view.STYLE_GRENADE,700.0,2500,100,100,150.0,true,EF_BOUNCE_HALF) end if
  if classname==BFG then return Profile(classname,view.STYLE_BFG,2000.0,10000,100,100,120.0,false,0) end if
  return fail("unsupported weapon "+classname)
end function

/// Calls `mq3.client.playable_player_projectiles.State` from playable player projectiles `create`. The final path returns `State([],[],[],0,0,now)`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function create(now)
  if now<0 then return fail("initial time cannot be negative") end if
  return State([],[],[],0,0,now)
end function

/// Updates `state.nextProjectileId`, `state.projectiles` during playable player projectiles `spawnProfile`.
/// @param state Mutable playable player projectiles record/storage; this routine assigns `state.nextProjectileId`, `state.projectiles`.
/// @param weaponProfile Record read through `weaponProfile.speed`, `weaponProfile.lifetime`.
/// @param muzzle Value used by `if state==void or weaponProfile==void or not validPoint(muzzle) or not validPoint(direction) then return fail("state, profile, muzzle and dire...`.
/// @param direction Direction vector used by the spatial calculation.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function spawnProfile(state,weaponProfile,muzzle,direction,now)
  if state==void or weaponProfile==void or not validPoint(muzzle) or not validPoint(direction) then return fail("state, profile, muzzle and direction are required") end if
  if now<state.lastTime then return fail("spawn time moved backwards") end if
  aim=copyPoint(direction)
  if qmath.VectorNormalize(aim)==0.0 then return fail("shot direction cannot be zero") end if
  velocity=[numeric.fmul(aim[0],weaponProfile.speed),numeric.fmul(aim[1],weaponProfile.speed),numeric.fmul(aim[2],weaponProfile.speed)]
  shot=Projectile(state.nextProjectileId,weaponProfile,copyPoint(muzzle),velocity,now,now+weaponProfile.lifetime,false)
  state.nextProjectileId=state.nextProjectileId+1;state.projectiles=state.projectiles+[shot]
  return shot
end function

/// Calls `mq3.client.playable_player_projectiles.profile`, `mq3.client.playable_player_projectiles.spawnProfile` from playable player projectiles `spawn`. The final path returns `spawnProfile(state,weaponProfile,muzzle,direction,now)`.
/// @param state Shared playable player projectiles state passed to the helper calls in `spawn`.
/// @param classname Value used by `weaponProfile=profile(classname)`.
/// @param muzzle Value used by `return spawnProfile(state,weaponProfile,muzzle,direction,now)`.
/// @param direction Direction vector used by the spatial calculation.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function spawn(state,classname,muzzle,direction,now)
  weaponProfile=profile(classname);if weaponProfile is error then return weaponProfile end if
  return spawnProfile(state,weaponProfile,muzzle,direction,now)
end function

/// Adapts `mq3.collision.world.boxTrace` to playable player projectiles `worldPointTrace`, returning its result for `context, startPoint, endPoint, [0.0,0.0,0.0], [0.0,0.0,0.0], 0, SHOT_MASK, false`.
/// @param context Argument 1 of `mq3.collision.world.boxTrace`.
/// @param startPoint Starting world-space point of the segment or trace. Forwarded to `mq3.collision.world.boxTrace`.
/// @param endPoint Ending world-space point of the segment or trace. Forwarded to `mq3.collision.world.boxTrace`.
function worldPointTrace(context,startPoint,endPoint)
  return collision.boxTrace(context,startPoint,endPoint,[0.0,0.0,0.0],[0.0,0.0,0.0],0,SHOT_MASK,false)
end function

/// Builds the playable player projectiles `pointOnSegment` sequence from `[startPoint[0]+(endPoint[0]-startPoint[0])*fraction,startPoint[1]+(endPoint[1]-startPoint[1])*fraction,startPoint[2]+(endPoint[2]-startPoint[2])*fraction]`.
/// @param startPoint Starting world-space point of the segment or trace.
/// @param endPoint Ending world-space point of the segment or trace.
/// @param fraction Interpolation or blend fraction between the endpoint values.
function pointOnSegment(startPoint,endPoint,fraction)
  return [startPoint[0]+(endPoint[0]-startPoint[0])*fraction,startPoint[1]+(endPoint[1]-startPoint[1])*fraction,startPoint[2]+(endPoint[2]-startPoint[2])*fraction]
end function

/// Calls `mq3.client.playable_targets.segmentFraction` from playable player projectiles `targetFraction`. The final path returns `[best,fraction]`.
/// @param targetState Record read through `targetState.targets`, `targetState.radius`, `targetState.minZ`, `targetState.maxZ`.
/// @param startPoint Starting world-space point of the segment or trace.
/// @param endPoint Ending world-space point of the segment or trace.
function targetFraction(targetState,startPoint,endPoint)
  best=-1;fraction=2.0
  if len(targetState.targets)>0 then
    for index=0 to len(targetState.targets)-1
      target=targetState.targets[index]
      if target.alive then
        candidate=projectileTargets.segmentFraction(startPoint,endPoint,target,targetState.radius,targetState.minZ,targetState.maxZ)
        if candidate>=0.0 and candidate<fraction then best=index;fraction=candidate end if
      end if
    end for
  end if
  return [best,fraction]
end function

/// Updates `targetState.score` during playable player projectiles `applyDamage`.
/// @param targetState Mutable playable player projectiles record/storage; this routine assigns `targetState.score`.
/// @param index Value used by `target=targetState.targets[index]`.
/// @param requested Value used by `amount=requested`.
/// @param direct Value used by `return Damage(index,amount,direct,killed,awarded)`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function applyDamage(targetState,index,requested,direct,now)
  target=targetState.targets[index];amount=requested;if amount>target.health then amount=target.health end if
  target.health=target.health-amount;killed=false;awarded=0
  if target.health<=0 then
    target.health=0;target.alive=false;target.respawnAt=now+targetState.respawnMilliseconds
    killed=true;awarded=target.score;targetState.score=targetState.score+awarded
  end if
  return Damage(index,amount,direct,killed,awarded)
end function

// Quake 3 measures splash distance from the nearest point of the target box.
/// @param targetState Record read through `targetState.radius`, `targetState.minZ`, `targetState.maxZ`.
/// @param target Record read through `target.origin`.
/// @param point Sequence read at `point[axis]`.
function distanceToBounds(targetState,target,point)
  square=0.0
  for axis=0 to 2
    low=target.origin[axis]-targetState.radius;high=target.origin[axis]+targetState.radius
    if axis==2 then low=target.origin[2]+targetState.minZ;high=target.origin[2]+targetState.maxZ end if
    delta=0.0
    if point[axis]<low then delta=low-point[axis]
    else if point[axis]>high then delta=point[axis]-high
    end if
    square=square+delta*delta
  end for
  return numeric.fsqrt(square)
end function

/// Calls `mq3.client.playable_player_projectiles.applyDamage`, `mq3.client.playable_player_projectiles.distanceToBounds`, `mq3.compat.numeric.trunc32` from playable player projectiles `damageAtImpact`. The final path returns `result`.
/// @param targetState Record read through `targetState.targets`.
/// @param shot Record read through `shot.profile.directDamage`, `shot.profile.splashRadius`, `shot.profile.splashDamage`.
/// @param point Value used by `distance=distanceToBounds(targetState,target,point)`.
/// @param directTarget Value used by `if directTarget>=0 and targetState.targets[directTarget].alive then result=result+[applyDamage(targetState,directTarget,shot.profile.directDam...`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function damageAtImpact(targetState,shot,point,directTarget,now)
  result=[]
  if directTarget>=0 and targetState.targets[directTarget].alive then result=result+[applyDamage(targetState,directTarget,shot.profile.directDamage,true,now)] end if
  if len(targetState.targets)>0 then
    for index=0 to len(targetState.targets)-1
      target=targetState.targets[index]
      // Baseq3 excludes the entity that already received direct damage.
      if index!=directTarget and target.alive then
        distance=distanceToBounds(targetState,target,point)
        if distance<shot.profile.splashRadius then
          amount=numeric.trunc32(shot.profile.splashDamage*(1.0-distance/shot.profile.splashRadius))
          if amount>0 then result=result+[applyDamage(targetState,index,amount,false,now)] end if
        end if
      end if
    end for
  end if
  return result
end function

/// Updates `state.nextImpactId`, `state.impacts` during playable player projectiles `addImpact`.
/// @param state Mutable playable player projectiles record/storage; this routine assigns `state.nextImpactId`, `state.impacts`.
/// @param shot Record read through `shot.id`, `shot.profile.classname`, `shot.profile.style`.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param point Value used by `damages=damageAtImpact(targetState,shot,point,targetIndex,now)`.
/// @param normal Surface-normal vector used to orient or offset the effect.
/// @param targetIndex Value used by `damages=damageAtImpact(targetState,shot,point,targetIndex,now)`.
/// @param targetState targetState record passed to the playable player projectiles helper calls.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function addImpact(state,shot,kind,point,normal,targetIndex,targetState,now)
  damages=damageAtImpact(targetState,shot,point,targetIndex,now)
  impact=Impact(state.nextImpactId,shot.id,shot.profile.classname,shot.profile.style,kind,copyPoint(point),copyPoint(normal),targetIndex,damages,now)
  state.nextImpactId=state.nextImpactId+1;state.impacts=state.impacts+[impact]
  return impact
end function

/// Evaluates playable player projectiles `stepEndpoint` and returns `[shot.origin[0]+shot.velocity[0]*seconds,shot.origin[1]+shot.velocity[1]*seconds,z]` according to its guard/selection conditions.
/// @param shot Record read through `shot.origin`, `shot.velocity`, `shot.profile.gravity`.
/// @param milliseconds Time interval in milliseconds.
function stepEndpoint(shot,milliseconds)
  seconds=milliseconds/1000.0
  z=shot.origin[2]+shot.velocity[2]*seconds
  if shot.profile.gravity then z=z-0.5*GRAVITY*seconds*seconds end if
  return [shot.origin[0]+shot.velocity[0]*seconds,shot.origin[1]+shot.velocity[1]*seconds,z]
end function

/// Calls `mq3.client.playable_player_projectiles.copyPoint` from playable player projectiles `velocityAfter`. The final path returns `result`.
/// @param shot Record read through `shot.velocity`, `shot.profile.gravity`.
/// @param milliseconds Time interval in milliseconds.
function velocityAfter(shot,milliseconds)
  result=copyPoint(shot.velocity)
  if shot.profile.gravity then result[2]=result[2]-GRAVITY*(milliseconds/1000.0) end if
  return result
end function

// Mirrors G_BounceMissile for grenades carrying EF_BOUNCE_HALF: reflect the
// trajectory delta around the collision plane, then retain 65 percent speed.
/// @param shot Mutable playable player projectiles record/storage; this routine assigns `shot.velocity[axis]`, `shot.origin`, `shot.velocity`, `shot.stopped`.
/// @param point Sequence read at `point[0]`, `point[1]`, `point[2]`.
/// @param normal Surface-normal vector used to orient or offset the effect.
/// @param impactVelocity Sequence read at `impactVelocity[0]`, `impactVelocity[1]`, `impactVelocity[2]`, `impactVelocity[axis]`.
function bounceHalf(shot,point,normal,impactVelocity)
  dot=impactVelocity[0]*normal[0]+impactVelocity[1]*normal[1]+impactVelocity[2]*normal[2]
  for axis=0 to 2 shot.velocity[axis]=(impactVelocity[axis]-2.0*dot*normal[axis])*BOUNCE_SCALE end for
  shot.origin=[point[0]+normal[0],point[1]+normal[1],point[2]+normal[2]]
  if normal[2]>0.2 and shot.velocity[2]<40.0 then
    shot.origin=copyPoint(point);shot.velocity=[0.0,0.0,0.0];shot.stopped=true
  end if
  return shot.stopped
end function

// traceFn(context,start,end) returns the normal baseq3 trace wrapper. A BSP hit
// wins ties so walls shield targets. Every removed projectile emits one impact.
/// @param traceFn Collision-trace callback used to test the requested movement or visibility segment.
/// @param context context record passed to the playable player projectiles helper calls.
/// @param state Mutable playable player projectiles record/storage; this routine assigns `state.trails`, `state.impacts`, `state.projectiles`, `state.lastTime`.
/// @param targetState targetState record passed to the playable player projectiles helper calls.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function updateWithTrace(traceFn,context,state,targetState,now)
  if traceFn==void or state==void or targetState==void then return fail("trace, state and targets are required") end if
  if now<state.lastTime then return fail("update time moved backwards") end if
  state.trails=[];state.impacts=[];survivors=[]
  for each shot in state.projectiles
    kind="";targetIndex=-1
    fromTime=state.lastTime;if shot.spawnedAt>fromTime then fromTime=shot.spawnedAt end if
    toTime=now;if toTime>shot.expiresAt then toTime=shot.expiresAt end if
    remaining=toTime-fromTime;cursorTime=fromTime;bounces=0
    while remaining>0 and kind=="" and not shot.stopped and bounces<MAX_BOUNCES_PER_FRAME
      startPoint=copyPoint(shot.origin);endPoint=stepEndpoint(shot,remaining)
      traced=traceFn(context,startPoint,endPoint);if traced is error then return traced end if
      worldFraction=traced.trace.fraction;targetHit=targetFraction(targetState,startPoint,endPoint);fraction=1.0;segmentKind="";targetIndex=-1
      if worldFraction<1.0 then segmentKind="world";fraction=worldFraction end if
      if targetHit[0]>=0 and targetHit[1]<fraction then segmentKind="target";targetIndex=targetHit[0];fraction=targetHit[1] end if
      finalPoint=pointOnSegment(startPoint,endPoint,fraction);travel=remaining*fraction;hitTime=cursorTime+numeric.trunc32(travel)
      state.trails=state.trails+[Trail(shot.id,shot.profile.style,startPoint,finalPoint,cursorTime,hitTime)]
      if segmentKind=="target" then
        kind=segmentKind;addImpact(state,shot,kind,finalPoint,[0.0,0.0,0.0],targetIndex,targetState,hitTime)
      else if segmentKind=="world" then
        if (shot.profile.eFlags & EF_BOUNCE_HALF)!=0 then
          impactVelocity=velocityAfter(shot,travel);stopped=bounceHalf(shot,finalPoint,traced.trace.normal,impactVelocity)
          remaining=remaining-travel;cursorTime=cursorTime+travel;bounces=bounces+1
          if stopped or remaining<0.001 then remaining=0 end if
        else
          kind=segmentKind;addImpact(state,shot,kind,finalPoint,traced.trace.normal,-1,targetState,hitTime)
        end if
      else
        shot.origin=endPoint;shot.velocity=velocityAfter(shot,remaining);remaining=0
      end if
    end while
    if kind=="" then
      if now>=shot.expiresAt then addImpact(state,shot,"expired",shot.origin,[0.0,0.0,1.0],-1,targetState,shot.expiresAt)
      else survivors=survivors+[shot] end if
    end if
  end for
  state.projectiles=survivors;state.lastTime=now
  return state.impacts
end function

/// Calls `mq3.client.playable_player_projectiles.updateWithTrace` from playable player projectiles `update`. The final path returns `updateWithTrace(worldPointTrace,world,state,targetState,now)`.
/// @param world world record passed to the playable player projectiles helper calls.
/// @param state Shared playable player projectiles state passed to the helper calls in `update`.
/// @param targetState targetState record passed to the playable player projectiles helper calls.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function update(world,state,targetState,now)
  if world==void then return fail("collision world is required") end if
  return updateWithTrace(worldPointTrace,world,state,targetState,now)
end function

/// Evaluates playable player projectiles `activeCount` and returns `0`, `len(state.projectiles)` according to its guard/selection conditions.
/// @param state Record read through `state.projectiles`.
function activeCount(state) if state==void then return 0 end if;return len(state.projectiles) end function
