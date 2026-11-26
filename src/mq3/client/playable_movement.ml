// SPDX-License-Identifier: GPL-2.0-or-later
// Quake-style movement adapter for the standalone playable preview.
package mq3.client.playable_movement

import mq3.game.movement as movement
import mq3.collision.world as collision
import mq3.shared.math as qmath
import mq3.compat.numeric as numeric

/// Combined collision-content mask used by the native player's spatial queries.
const PLAYER_MASK=0x2010001
/// Downward acceleration used by the module's ballistic or movement integration.
const GRAVITY=800
/// Base movement speed used by the native playable movement controller.
const SPEED=320
/// Initial upward velocity applied when a player jump begins.
const JUMP_VELOCITY=270.0
/// Minimum upward surface-normal component accepted as walkable ground.
const GROUND_NORMAL=0.7
/// Downward trace distance used to establish contact with supporting ground.
const GROUND_PROBE=0.25
/// Upper duration bound in milliseconds for frame processing.
const MAX_FRAME_MILLISECONDS=100
/// Duration or scheduling interval in milliseconds controlling substep.
const SUBSTEP_MILLISECONDS=8

/// Stores playable movement controller record, including `motion`, `grounded`, `jumpHeld`.
struct Controller
  /// When constructing this record, `createWithTrace` supplies `motion` for this member. Used by
  /// `groundCheck` and `substep` during subsequent processing.
  motion
  /// When constructing this record, `createWithTrace` supplies `false` for this member. Used by
  /// `groundCheck` and `substep` during subsequent processing.
  grounded
  /// When constructing this record, `createWithTrace` supplies `false` for this member. Used by `step`
  /// during subsequent processing.
  jumpHeld
end struct

/// Calls `mq3.collision.world.boxTrace`, `mq3.game.movement.Collision` from playable movement `worldTrace`. The final path returns `movement.Collision(hit.trace,hit.endpos,entity)`.
/// @param state Record read through `state.context`, `state.mins`, `state.maxs`, `state.mask`.
/// @param startPoint Starting world-space point of the segment or trace.
/// @param endPoint Ending world-space point of the segment or trace.
function worldTrace(state,startPoint,endPoint)
  hit=collision.boxTrace(state.context,startPoint,endPoint,state.mins,state.maxs,0,state.mask,false)
  if hit is error then return hit end if
  entity=1023;if hit.trace.fraction<1.0 then entity=1022 end if
  return movement.Collision(hit.trace,hit.endpos,entity)
end function

/// Computes `typeof(position)=="array" and len(position)==3` for playable movement `validPosition`.
/// @param position Sequence whose length/content is inspected by `validPosition`.
function validPosition(position)
  return typeof(position)=="array" and len(position)==3
end function

/// Calls `mq3.client.playable_movement.validPosition`, `mq3.game.movement.create`, `mq3.compat.numeric.f32` and additional helpers from playable movement `createWithTrace`. The final path returns `Controller(motion,false,false)`.
/// @param traceFn Collision-trace callback used to test the requested movement or visibility segment.
/// @param context context record passed to the playable movement helper calls.
/// @param position Sequence read at `position[0]`, `position[1]`, `position[2]`.
function createWithTrace(traceFn,context,position)
  if traceFn==void or not validPosition(position) then return error(7490,"playable movement needs a trace function and three-component position") end if
  motion=movement.create(traceFn,context)
  motion.origin=[numeric.f32(position[0]),numeric.f32(position[1]),numeric.f32(position[2])]
  // Bounds use the camera/eye as their origin, matching playable_app's old trace.
  motion.mins=[-15.0,-15.0,-48.0];motion.maxs=[15.0,15.0,8.0]
  motion.mask=PLAYER_MASK;motion.gravity=GRAVITY;motion.speed=SPEED
  return Controller(motion,false,false)
end function

/// Calls `mq3.client.playable_movement.createWithTrace` from playable movement `create`. The final path returns `createWithTrace(worldTrace,world,position)`.
/// @param world world record passed to the playable movement helper calls.
/// @param position Value used by `return createWithTrace(worldTrace,world,position)`.
function create(world,position)
  if world==void then return error(7491,"playable movement needs a collision world") end if
  return createWithTrace(worldTrace,world,position)
end function

/// Evaluates playable movement `clampDelta` and returns `0`, `MAX_FRAME_MILLISECONDS`, `milliseconds` according to its guard/selection conditions.
/// @param milliseconds Time interval in milliseconds.
function clampDelta(milliseconds)
  if milliseconds<0 then return 0 end if
  if milliseconds>MAX_FRAME_MILLISECONDS then return MAX_FRAME_MILLISECONDS end if
  return milliseconds
end function

/// Updates `controller.grounded` during playable movement `groundCheck`.
/// @param controller Mutable playable movement record/storage; this routine assigns `controller.grounded`.
function groundCheck(controller)
  state=controller.motion
  down=[state.origin[0],state.origin[1],numeric.fsub(state.origin[2],GROUND_PROBE)]
  hit=state.traceFn(state,state.origin,down);if hit is error then return hit end if
  state.groundPlane=false;state.walking=false;state.groundNormal=[0.0,0.0,1.0];state.groundFlags=0
  if hit.trace.allsolid then
    controller.grounded=true;state.groundPlane=true;state.walking=true
    if state.velocity[2]<0.0 then state.velocity[2]=0.0 end if
    return true
  end if
  if hit.trace.fraction<1.0 then
    state.groundPlane=true;state.groundNormal=[hit.trace.normal[0],hit.trace.normal[1],hit.trace.normal[2]]
    state.groundFlags=hit.trace.surfaceFlags
    if hit.trace.normal[2]>=GROUND_NORMAL and state.velocity[2]<=10.0 then
      state.walking=true;controller.grounded=true
      if state.velocity[2]<0.0 then state.velocity[2]=0.0 end if
      return true
    end if
  end if
  controller.grounded=false
  return false
end function

/// Calls `mq3.shared.math.AngleVectors`, `mq3.compat.numeric.f32`, `mq3.compat.numeric.fadd` and additional helpers from playable movement `wishDirection`. The final path returns `[wish,numeric.fmul(SPEED,length)]`.
/// @param yaw Value used by `axes=qmath.AngleVectors([0.0,numeric.f32(yaw),0.0])`.
/// @param forwardInput Value used by `wish=[numeric.fadd(numeric.fmul(forwardInput,axes[0][0]),numeric.fmul(rightInput,axes[1][0])),numeric.fadd(numeric.fmul(forwardInput,axes[0][1...`.
/// @param rightInput Value used by `wish=[numeric.fadd(numeric.fmul(forwardInput,axes[0][0]),numeric.fmul(rightInput,axes[1][0])),numeric.fadd(numeric.fmul(forwardInput,axes[0][1...`.
function wishDirection(yaw,forwardInput,rightInput)
  axes=qmath.AngleVectors([0.0,numeric.f32(yaw),0.0])
  wish=[numeric.fadd(numeric.fmul(forwardInput,axes[0][0]),numeric.fmul(rightInput,axes[1][0])),numeric.fadd(numeric.fmul(forwardInput,axes[0][1]),numeric.fmul(rightInput,axes[1][1])),0.0]
  length=qmath.VectorLength(wish)
  if length==0.0 then return [wish,0.0] end if
  qmath.VectorNormalize(wish)
  if length>1.0 then length=1.0 end if
  return [wish,numeric.fmul(SPEED,length)]
end function

/// Updates `controller.grounded` during playable movement `substep`.
/// @param controller Mutable playable movement record/storage; this routine assigns `controller.grounded`.
/// @param yaw Value used by `wish=wishDirection(yaw,forwardInput,rightInput)`.
/// @param forwardInput Value used by `wish=wishDirection(yaw,forwardInput,rightInput)`.
/// @param rightInput Value used by `wish=wishDirection(yaw,forwardInput,rightInput)`.
/// @param jumpPressed Value used by `if jumpPressed and controller.grounded then`.
/// @param milliseconds Time interval in milliseconds.
function substep(controller,yaw,forwardInput,rightInput,jumpPressed,milliseconds)
  state=controller.motion;state.frametime=numeric.fdiv(milliseconds,1000.0)
  grounded=groundCheck(controller);if grounded is error then return grounded end if
  jumped=false
  if jumpPressed and controller.grounded then
    state.velocity[2]=JUMP_VELOCITY;controller.grounded=false;state.walking=false;state.groundPlane=false;jumped=true
  end if
  wish=wishDirection(yaw,forwardInput,rightInput)
  if controller.grounded then
    movement.friction(state)
    movement.accelerate(state,wish[0],wish[1],10.0)
  else
    movement.accelerate(state,wish[0],wish[1],1.0)
  end if
  movement.stepSlideMove(state,true)
  grounded=groundCheck(controller);if grounded is error then return grounded end if
  return jumped
end function

/// Updates `controller.jumpHeld` during playable movement `step`.
/// @param controller Mutable playable movement record/storage; this routine assigns `controller.jumpHeld`.
/// @param yaw Value used by `result=substep(controller,yaw,forwardInput,rightInput,jumpPressed,slice)`.
/// @param forwardInput Value used by `forwardInput=numeric.f32(forwardInput)`.
/// @param rightInput Value used by `rightInput=numeric.f32(rightInput)`.
/// @param jumpDown Value assigned to `controller.jumpHeld`.
/// @param deltaMilliseconds Elapsed simulation interval in milliseconds.
function step(controller,yaw,forwardInput,rightInput,jumpDown,deltaMilliseconds)
  if controller==void then return error(7492,"playable movement step needs a controller") end if
  milliseconds=clampDelta(deltaMilliseconds)
  forwardInput=numeric.f32(forwardInput);rightInput=numeric.f32(rightInput)
  if forwardInput>1.0 then forwardInput=1.0 else if forwardInput< -1.0 then forwardInput=-1.0 end if
  if rightInput>1.0 then rightInput=1.0 else if rightInput< -1.0 then rightInput=-1.0 end if
  jumpPressed=jumpDown and not controller.jumpHeld
  // A supported, motionless player has no integration work. Confirm the
  // ground once so custom trace contexts can still remove support, then avoid
  // repeating the same static BSP trace for every 8 ms substep of a slow frame.
  state=controller.motion
  idle=milliseconds>0 and controller.grounded and not jumpPressed and forwardInput==0.0 and rightInput==0.0 and state.velocity[0]==0.0 and state.velocity[1]==0.0 and state.velocity[2]==0.0
  if idle then
    grounded=groundCheck(controller);if grounded is error then return grounded end if
    if grounded then controller.jumpHeld=jumpDown;return false end if
  end if
  remaining=milliseconds;jumped=false
  while remaining>0
    slice=remaining;if slice>SUBSTEP_MILLISECONDS then slice=SUBSTEP_MILLISECONDS end if
    result=substep(controller,yaw,forwardInput,rightInput,jumpPressed,slice);if result is error then return result end if
    if result then jumped=true end if
    jumpPressed=false;remaining=remaining-slice
  end while
  controller.jumpHeld=jumpDown
  return jumped
end function

/// Reads `controller.motion.origin` for playable movement `position`.
/// @param controller Record read through `controller.motion.origin`.
function position(controller) return controller.motion.origin end function
/// Reads `controller.motion.velocity` for playable movement `velocity`.
/// @param controller Record read through `controller.motion.velocity`.
function velocity(controller) return controller.motion.velocity end function
/// Reads `controller.grounded` for playable movement `isGrounded`.
/// @param controller Record read through `controller.grounded`.
function isGrounded(controller) return controller.grounded end function
