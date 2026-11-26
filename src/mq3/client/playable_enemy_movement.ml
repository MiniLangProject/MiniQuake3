// SPDX-License-Identifier: GPL-2.0-or-later
// BSP-collided movement adapter for standalone preview opponents.
package mq3.client.playable_enemy_movement

import mq3.game.movement as movement
import mq3.collision.world as collision
import mq3.compat.numeric as numeric

const PLAYER_MASK=0x2010001
const STEP_HEIGHT=18.0
const GROUND_PROBE=24.0
const GROUND_NORMAL=0.7

/// Stores playable enemy movement operation result, including `origin`, `delta`, `blocked`, `stepped`, `grounded`.
struct Result origin delta blocked stepped grounded end struct

/// Creates the playable enemy movement error `7550` with diagnostic text `"preview enemy movement: "+message`.
/// @param message Argument 2 of `error`; passed as `"preview enemy movement: "+message`.
function fail(message) return error(7550,"preview enemy movement: "+message) end function
/// Computes `typeof(value)=="array" and len(value)==3` for playable enemy movement `validVector`.
/// @param value Sequence whose length/content is inspected by `validVector`.
function validVector(value) return typeof(value)=="array" and len(value)==3 end function

/// Calls `mq3.collision.world.boxTrace`, `mq3.game.movement.Collision` from playable enemy movement `worldTrace`. The final path returns `movement.Collision(hit.trace,hit.endpos,entity)`.
/// @param state Record read through `state.context`, `state.mins`, `state.maxs`, `state.mask`.
/// @param startPoint Starting world-space point of the segment or trace.
/// @param endPoint Ending world-space point of the segment or trace.
function worldTrace(state,startPoint,endPoint)
  hit=collision.boxTrace(state.context,startPoint,endPoint,state.mins,state.maxs,0,state.mask,false)
  if hit is error then return hit end if
  entity=1023;if hit.trace.fraction<1.0 then entity=1022 end if
  return movement.Collision(hit.trace,hit.endpos,entity)
end function

/// Calls `mq3.game.movement.create`, `mq3.compat.numeric.f32` from playable enemy movement `configure`. The final path returns `state`.
/// @param traceFn Collision-trace callback used to test the requested movement or visibility segment.
/// @param context context record passed to the playable enemy movement helper calls.
/// @param origin World-space origin of the entity, sound or rendered effect.
function configure(traceFn,context,origin)
  state=movement.create(traceFn,context)
  state.origin=[numeric.f32(origin[0]),numeric.f32(origin[1]),numeric.f32(origin[2])]
  state.mins=[-15.0,-15.0,-24.0];state.maxs=[15.0,15.0,32.0]
  state.mask=PLAYER_MASK;state.frametime=1.0;state.gravity=800
  return state
end function

/// Updates `state.groundPlane`, `state.walking`, `state.groundNormal`, `state.groundFlags` during playable enemy movement `establishGround`.
/// @param state Mutable playable enemy movement record/storage; this routine assigns `state.groundPlane`, `state.walking`, `state.groundNormal`, `state.groundFlags`.
function establishGround(state)
  endPoint=[state.origin[0],state.origin[1],numeric.fsub(state.origin[2],0.25)]
  hit=state.traceFn(state,state.origin,endPoint);if hit is error then return hit end if
  state.groundPlane=false;state.walking=false;state.groundNormal=[0.0,0.0,1.0]
  if hit.trace.allsolid then return false end if
  if hit.trace.fraction<1.0 and hit.trace.normal[2]>=GROUND_NORMAL then
    state.groundPlane=true;state.walking=true
    state.groundNormal=[hit.trace.normal[0],hit.trace.normal[1],hit.trace.normal[2]]
    state.groundFlags=hit.trace.surfaceFlags
    return true
  end if
  return false
end function

// Move by a desired world-space displacement. The shared movement kernel slides
// along blocking planes and tries Quake's 18-unit stair step.
/// @param traceFn Collision-trace callback used to test the requested movement or visibility segment.
/// @param context context record passed to the playable enemy movement helper calls.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param desiredDelta Sequence read at `desiredDelta[0]`, `desiredDelta[1]`, `desiredDelta[2]`, `desiredDelta[axis]`.
function moveOriginWithTrace(traceFn,context,origin,desiredDelta)
  if traceFn==void or not validVector(origin) or not validVector(desiredDelta) then return fail("trace, origin and desired delta are required") end if
  state=configure(traceFn,context,origin)
  grounded=establishGround(state);if grounded is error then return grounded end if
  state.velocity=[numeric.f32(desiredDelta[0]),numeric.f32(desiredDelta[1]),numeric.f32(desiredDelta[2])]
  movement.stepSlideMove(state,false)

  // Bind walking enemies to slopes and small drops after horizontal motion.
  down=[state.origin[0],state.origin[1],numeric.fsub(state.origin[2],GROUND_PROBE)]
  groundHit=state.traceFn(state,state.origin,down);if groundHit is error then return groundHit end if
  grounded=false
  if not groundHit.trace.allsolid and groundHit.trace.fraction<1.0 and groundHit.trace.normal[2]>=GROUND_NORMAL then
    state.origin=[groundHit.endpos[0],groundHit.endpos[1],groundHit.endpos[2]];grounded=true
  end if

  actual=[numeric.fsub(state.origin[0],origin[0]),numeric.fsub(state.origin[1],origin[1]),numeric.fsub(state.origin[2],origin[2])]
  blocked=false
  for axis=0 to 2
    difference=numeric.fsub(actual[axis],desiredDelta[axis]);if difference<0.0 then difference=0.0-difference end if
    if difference>0.01 then blocked=true end if
  end for
  stepped=actual[2]>0.1
  return Result(state.origin,actual,blocked,stepped,grounded)
end function

/// Calls `mq3.client.playable_enemy_movement.moveOriginWithTrace` from playable enemy movement `moveOrigin`. The final path returns `moveOriginWithTrace(worldTrace,world,origin,desiredDelta)`.
/// @param world world record passed to the playable enemy movement helper calls.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param desiredDelta Value used by `return moveOriginWithTrace(worldTrace,world,origin,desiredDelta)`.
function moveOrigin(world,origin,desiredDelta)
  if world==void then return fail("collision world is required") end if
  return moveOriginWithTrace(worldTrace,world,origin,desiredDelta)
end function

// Adapter used by preview code: target only needs a three-component origin.
/// @param traceFn Collision-trace callback used to test the requested movement or visibility segment.
/// @param context context record passed to the playable enemy movement helper calls.
/// @param target Mutable playable enemy movement record/storage; this routine assigns `target.origin`.
/// @param desiredDelta Value used by `result=moveOriginWithTrace(traceFn,context,target.origin,desiredDelta)`.
function moveTargetWithTrace(traceFn,context,target,desiredDelta)
  if target==void or not validVector(target.origin) then return fail("target origin is required") end if
  result=moveOriginWithTrace(traceFn,context,target.origin,desiredDelta);if result is error then return result end if
  target.origin=[result.origin[0],result.origin[1],result.origin[2]]
  return result
end function

/// Calls `mq3.client.playable_enemy_movement.moveTargetWithTrace` from playable enemy movement `moveTarget`. The final path returns `moveTargetWithTrace(worldTrace,world,target,desiredDelta)`.
/// @param world world record passed to the playable enemy movement helper calls.
/// @param target Value used by `return moveTargetWithTrace(worldTrace,world,target,desiredDelta)`.
/// @param desiredDelta Value used by `return moveTargetWithTrace(worldTrace,world,target,desiredDelta)`.
function moveTarget(world,target,desiredDelta)
  if world==void then return fail("collision world is required") end if
  return moveTargetWithTrace(worldTrace,world,target,desiredDelta)
end function
