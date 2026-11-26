// SPDX-License-Identifier: GPL-2.0-or-later
// Deterministic Baseq3 shotgun pattern for the standalone playable preview.
package mq3.client.playable_shotgun

import mq3.collision.world as collision
import mq3.client.playable_targets as shotgunTargets
import mq3.shared.math as qmath
import mq3.shared.directions as directions
import mq3.compat.numeric as numeric

// code/game/bg_public.h and code/game/g_weapon.c.
const SHOT_MASK=0x6000001
/// Fallback shotgun spread setting used when constructing the native client simulation or effect
/// configuration.
const DEFAULT_SHOTGUN_SPREAD=700.0
/// Fallback shotgun count setting used when constructing the native client simulation or effect
/// configuration.
const DEFAULT_SHOTGUN_COUNT=11
/// Fallback shotgun damage setting used when constructing the native client simulation or effect
/// configuration.
const DEFAULT_SHOTGUN_DAMAGE=10
/// Forward ray distance used to construct the deterministic shotgun pellet pattern.
const PATTERN_RANGE=131072.0

/// Stores playable shotgun pellet record, including `start`, `endPoint`, `intended`, `hit`, `normal`, `distance` and additional values.
struct Pellet
  /// When constructing this record, `tracePellets` supplies `copyPoint(origin)` for this member.
  start
  /// World-space endpoint of the trace, beam, or projectile presentation segment.
  endPoint
  /// When constructing this record, `tracePellets` supplies `copyPoint(intended)` for this member.
  intended
  /// When constructing this record, `tracePellets` supplies `worldHit` for this member.
  hit
  /// World-surface normal at this pellet's trace impact, used to orient its hit effect.
  normal
  /// When constructing this record, `tracePellets` supplies `qmath.VectorLength(delta)` for this
  /// member.
  distance
  /// When constructing this record, `tracePellets` supplies `fraction` for this member.
  fraction
  /// Index identifying the selected target in the owning target collection.
  targetIndex
  /// Damage amount applied or reported by the weapon, projectile, or hit result.
  damage
  /// When constructing this record, `tracePellets` supplies `false` for this member. Used by
  /// `fireWithTrace` during subsequent processing.
  killed
end struct
/// Stores playable shotgun blast record, including `pellets`, `hits`, `totalDamage`, `kills`, `awardedScore`, `accuracyHit` and additional values.
struct Blast
  /// When constructing this record, `fireWithTrace` supplies `pellets` for this member.
  pellets
  /// When constructing this record, `fireWithTrace` supplies `hits` for this member.
  hits
  /// When constructing this record, `fireWithTrace` supplies `totalDamage` for this member.
  totalDamage
  /// When constructing this record, `fireWithTrace` supplies `kills` for this member.
  kills
  /// When constructing this record, `fireWithTrace` supplies `awardedScore` for this member.
  awardedScore
  /// When constructing this record, `fireWithTrace` supplies `accuracyHit` for this member.
  accuracyHit
  /// When constructing this record, `fireWithTrace` supplies `numeric.i32(seed)` for this member.
  seed
  /// When constructing this record, `fireWithTrace` supplies `pattern[1]` for this member.
  seedEnd
end struct

/// Creates the playable shotgun error `7595` with diagnostic text `"playable shotgun: "+message`.
/// @param message Argument 2 of `error`; passed as `"playable shotgun: "+message`.
function fail(message) return error(7595,"playable shotgun: "+message) end function
/// Computes `value!=void and typeof(value)=="array" and len(value)==3` for playable shotgun `validPoint`.
/// @param value Sequence whose length/content is inspected by `validPoint`.
function validPoint(value) return value!=void and typeof(value)=="array" and len(value)==3 end function
/// Copies three vector components with float32 rounding for playable shotgun.
/// @param value Sequence read at `value[0]`, `value[1]`, `value[2]`.
function copyPoint(value) return [numeric.f32(value[0]),numeric.f32(value[1]),numeric.f32(value[2])] end function

/// Adapts `mq3.collision.world.boxTrace` to playable shotgun `worldPointTrace`, returning its result for `context, startPoint, endPoint, [0.0,0.0,0.0], [0.0,0.0,0.0], 0, SHOT_MASK, false`.
/// @param context Argument 1 of `mq3.collision.world.boxTrace`.
/// @param startPoint Starting world-space point of the segment or trace. Forwarded to `mq3.collision.world.boxTrace`.
/// @param endPoint Ending world-space point of the segment or trace. Forwarded to `mq3.collision.world.boxTrace`.
function worldPointTrace(context,startPoint,endPoint)
  return collision.boxTrace(context,startPoint,endPoint,[0.0,0.0,0.0],[0.0,0.0,0.0],0,SHOT_MASK,false)
end function

// This is ShotgunPattern's client/server-shared deterministic spread loop.
// origin2 is normalized exactly as in g_weapon.c before the basis is derived.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param origin2 Second world-space endpoint of the effect.
/// @param seed Value used by `randomState=qmath.RandomState(numeric.i32(seed))`.
function patternEndpoints(origin,origin2,seed)
  if not validPoint(origin) or not validPoint(origin2) then return fail("origin and direction need three axes") end if
  forward=qmath.VectorNormalize2(origin2)
  if qmath.VectorLength(forward)==0.0 then return fail("direction cannot be zero") end if
  right=directions.perpendicular(forward);up=qmath.CrossProduct(forward,right)
  randomState=qmath.RandomState(numeric.i32(seed));result=[]
  for index=0 to DEFAULT_SHOTGUN_COUNT-1
    horizontal=numeric.fmul(numeric.fmul(qmath.Q_crandom(randomState),DEFAULT_SHOTGUN_SPREAD),16.0)
    vertical=numeric.fmul(numeric.fmul(qmath.Q_crandom(randomState),DEFAULT_SHOTGUN_SPREAD),16.0)
    finish=qmath.VectorMA(origin,PATTERN_RANGE,forward)
    finish=qmath.VectorMA(finish,horizontal,right);finish=qmath.VectorMA(finish,vertical,up)
    result=result+[finish]
  end for
  return [result,randomState.seed]
end function

/// Calls `traceFn`, `mq3.client.playable_shotgun.copyPoint`, `mq3.client.playable_shotgun.Pellet` and additional helpers from playable shotgun `tracePellets`. The final path returns `tracedPellets`.
/// @param traceFn Collision-trace callback used to test the requested movement or visibility segment.
/// @param context context record passed to the playable shotgun helper calls.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param endpoints Value used by `for each intended in endpoints`.
function tracePellets(traceFn,context,origin,endpoints)
  tracedPellets=[]
  for each intended in endpoints
    traced=traceFn(context,origin,intended);if traced is error then return traced end if
    fraction=traced.trace.fraction;worldHit=fraction<1.0;normal=[0.0,0.0,0.0]
    if worldHit then normal=copyPoint(traced.trace.normal) end if
    delta=[traced.endpos[0]-origin[0],traced.endpos[1]-origin[1],traced.endpos[2]-origin[2]]
    tracedPellets=tracedPellets+[Pellet(copyPoint(origin),copyPoint(traced.endpos),copyPoint(intended),worldHit,normal,qmath.VectorLength(delta),fraction,-1,0,false)]
  end for
  return tracedPellets
end function

// The BSP endpoint bounds playableTargets.applyShot, so a wall always shields
// a target behind it. Damage is applied one pellet at a time like g_weapon.c.
/// @param traceFn Collision-trace callback used to test the requested movement or visibility segment.
/// @param context context record passed to the playable shotgun helper calls.
/// @param targetState targetState record passed to the playable shotgun helper calls.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param origin2 Second world-space endpoint of the effect.
/// @param seed Value used by `pattern=patternEndpoints(origin,origin2,seed)`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function fireWithTrace(traceFn,context,targetState,origin,origin2,seed,now)
  if traceFn==void or targetState==void then return fail("trace and targets are required") end if
  if now<0 then return fail("time cannot be negative") end if
  pattern=patternEndpoints(origin,origin2,seed);if pattern is error then return pattern end if
  pellets=tracePellets(traceFn,context,origin,pattern[0]);if pellets is error then return pellets end if
  hits=[];totalDamage=0;kills=0;awardedScore=0;accuracyHit=false
  for each pellet in pellets
    targetHit=shotgunTargets.applyShot(targetState,pellet,DEFAULT_SHOTGUN_DAMAGE,now);if targetHit is error then return targetHit end if
    if targetHit!=void then
      pellet.targetIndex=targetHit.targetIndex;pellet.damage=targetHit.damage;pellet.killed=targetHit.killed
      hits=hits+[targetHit];totalDamage=totalDamage+targetHit.damage;awardedScore=awardedScore+targetHit.awardedScore
      if targetHit.killed then kills=kills+1 end if
      // Baseq3 records at most one accuracy hit for the complete blast.
      if not accuracyHit then accuracyHit=true end if
    end if
  end for
  return Blast(pellets,hits,totalDamage,kills,awardedScore,accuracyHit,numeric.i32(seed),pattern[1])
end function

/// Calls `mq3.client.playable_shotgun.fireWithTrace` from playable shotgun `fire`. The final path returns `fireWithTrace(worldPointTrace,world,targetState,origin,origin2,seed,now)`.
/// @param world world record passed to the playable shotgun helper calls.
/// @param targetState targetState record passed to the playable shotgun helper calls.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param origin2 Second world-space endpoint of the effect.
/// @param seed Value used by `return fireWithTrace(worldPointTrace,world,targetState,origin,origin2,seed,now)`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function fire(world,targetState,origin,origin2,seed,now)
  if world==void then return fail("collision world is required") end if
  return fireWithTrace(worldPointTrace,world,targetState,origin,origin2,seed,now)
end function
