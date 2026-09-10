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

struct Result origin delta blocked stepped grounded end struct

function fail(message) return error(7550,"preview enemy movement: "+message) end function
function validVector(value) return typeof(value)=="array" and len(value)==3 end function

function worldTrace(state,startPoint,endPoint)
  hit=collision.boxTrace(state.context,startPoint,endPoint,state.mins,state.maxs,0,state.mask,false)
  if hit is error then return hit end if
  entity=1023;if hit.trace.fraction<1.0 then entity=1022 end if
  return movement.Collision(hit.trace,hit.endpos,entity)
end function

function configure(traceFn,context,origin)
  state=movement.create(traceFn,context)
  state.origin=[numeric.f32(origin[0]),numeric.f32(origin[1]),numeric.f32(origin[2])]
  state.mins=[-15.0,-15.0,-24.0];state.maxs=[15.0,15.0,32.0]
  state.mask=PLAYER_MASK;state.frametime=1.0;state.gravity=800
  return state
end function

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

function moveOrigin(world,origin,desiredDelta)
  if world==void then return fail("collision world is required") end if
  return moveOriginWithTrace(worldTrace,world,origin,desiredDelta)
end function

// Adapter used by preview code: target only needs a three-component origin.
function moveTargetWithTrace(traceFn,context,target,desiredDelta)
  if target==void or not validVector(target.origin) then return fail("target origin is required") end if
  result=moveOriginWithTrace(traceFn,context,target.origin,desiredDelta);if result is error then return result end if
  target.origin=[result.origin[0],result.origin[1],result.origin[2]]
  return result
end function

function moveTarget(world,target,desiredDelta)
  if world==void then return fail("collision world is required") end if
  return moveTargetWithTrace(worldTrace,world,target,desiredDelta)
end function
