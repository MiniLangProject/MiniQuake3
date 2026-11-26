// SPDX-License-Identifier: GPL-2.0-or-later
// Deterministic hostile-opponent controller for the standalone preview.
package mq3.client.playable_enemy_ai

import mq3.collision.world as collision
import mq3.shared.math as qmath
import mq3.compat.transcendental as trans
import mq3.compat.numeric as numeric

const SIGHT_MASK=0x6000001
const THINK_MILLISECONDS=100
const ATTACK_COOLDOWN_MILLISECONDS=100
const ATTACK_RANGE=900.0
const CHASE_DISTANCE=280.0
const MOVE_SPEED=105.0
const STRAFE_SPEED=72.0
const PATROL_RADIUS=30.0
const DEFAULT_DAMAGE=7

/// Stores playable enemy ai brain record, including `mode`, `nextThink`, `nextAttack`, `strafeSide`, `lastSeen`, `visible`.
struct Brain mode nextThink nextAttack strafeSide lastSeen visible end struct
/// Stores playable enemy ai state, including `brains`, `lastTime`, `events`, `visibleCount`.
struct State brains lastTime events visibleCount end struct
/// Stores playable enemy ai event record, including `damage`, `side`, `attacker`.
struct Event damage side attacker end struct

/// Creates the playable enemy ai error `7540` with diagnostic text `"preview enemy AI: "+message`.
/// @param message Argument 2 of `error`; passed as `"preview enemy AI: "+message`.
function fail(message) return error(7540,"preview enemy AI: "+message) end function
/// Computes `typeof(value)=="array" and len(value)==3` for playable enemy ai `validVector`.
/// @param value Sequence whose length/content is inspected by `validVector`.
function validVector(value) return typeof(value)=="array" and len(value)==3 end function

// A separate state object keeps AI timing out of playable_targets' combat data.
/// @param targetState Record read through `targetState.targets`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function state(targetState,now)
  if targetState==void or now<0 then return fail("targets and non-negative time are required") end if
  brains=[]
  for index=0 to len(targetState.targets)-1
    side=1;if (targetState.targets[index].spawnIndex & 1)==0 then side=-1 end if
    brains=brains+[Brain("patrol",now+(index%3)*17,now+350+(index%4)*90,side,[0.0,0.0,0.0],false)]
  end for
  return State(brains,now,[],0)
end function

/// Adapts `mq3.collision.world.boxTrace` to playable enemy ai `worldPointTrace`, returning its result for `context, startPoint, endPoint, [0.0,0.0,0.0], [0.0,0.0,0.0], 0, SIGHT_MASK, false`.
/// @param context Argument 1 of `mq3.collision.world.boxTrace`.
/// @param startPoint Starting world-space point of the segment or trace. Forwarded to `mq3.collision.world.boxTrace`.
/// @param endPoint Ending world-space point of the segment or trace. Forwarded to `mq3.collision.world.boxTrace`.
function worldPointTrace(context,startPoint,endPoint)
  return collision.boxTrace(context,startPoint,endPoint,[0.0,0.0,0.0],[0.0,0.0,0.0],0,SIGHT_MASK,false)
end function

/// Calls `traceFn` from playable enemy ai `lineVisible`. The final path returns `result.trace.fraction>=0.9999`.
/// @param traceFn Collision-trace callback used to test the requested movement or visibility segment.
/// @param context context record passed to the playable enemy ai helper calls.
/// @param startPoint Starting world-space point of the segment or trace.
/// @param endPoint Ending world-space point of the segment or trace.
function lineVisible(traceFn,context,startPoint,endPoint)
  result=traceFn(context,startPoint,endPoint);if result is error then return result end if
  return result.trace.fraction>=0.9999
end function

/// Calls `mq3.compat.numeric.fsub`, `mq3.shared.math.VectorLength`, `mq3.shared.math.VectorNormalize` from playable enemy ai `horizontalDirection`. The final path returns `[value,length]`.
/// @param fromPoint Sequence read at `fromPoint[0]`, `fromPoint[1]`.
/// @param toPoint Sequence read at `toPoint[0]`, `toPoint[1]`.
function horizontalDirection(fromPoint,toPoint)
  value=[numeric.fsub(toPoint[0],fromPoint[0]),numeric.fsub(toPoint[1],fromPoint[1]),0.0]
  length=qmath.VectorLength(value)
  if length>0.0001 then qmath.VectorNormalize(value) end if
  return [value,length]
end function

/// Updates `target.origin[0]`, `target.origin[1]`, `target.origin[2]` during playable enemy ai `moveTarget`.
/// @param target Mutable playable enemy ai record/storage; this routine assigns `target.origin[0]`, `target.origin[1]`, `target.origin[2]`.
/// @param brain Record read through `brain.mode`, `brain.strafeSide`.
/// @param playerPosition Value used by `direction=horizontalDirection(target.origin,playerPosition)[0]`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param deltaMilliseconds Elapsed simulation interval in milliseconds.
function moveTarget(target,brain,playerPosition,now,deltaMilliseconds)
  seconds=numeric.fdiv(deltaMilliseconds,1000.0)
  if brain.mode=="chase" then
    direction=horizontalDirection(target.origin,playerPosition)[0]
    target.origin[0]=numeric.fadd(target.origin[0],numeric.fmul(direction[0],numeric.fmul(MOVE_SPEED,seconds)))
    target.origin[1]=numeric.fadd(target.origin[1],numeric.fmul(direction[1],numeric.fmul(MOVE_SPEED,seconds)))
  else if brain.mode=="strafe" then
    direction=horizontalDirection(target.origin,playerPosition)[0]
    target.origin[0]=numeric.fadd(target.origin[0],numeric.fmul(0.0-direction[1],numeric.fmul(STRAFE_SPEED*brain.strafeSide,seconds)))
    target.origin[1]=numeric.fadd(target.origin[1],numeric.fmul(direction[0],numeric.fmul(STRAFE_SPEED*brain.strafeSide,seconds)))
  else
    phase=now*0.0007+target.spawnIndex*1.61803398875
    target.origin[0]=target.spawnOrigin[0]+trans.cos(phase)*PATROL_RADIUS
    target.origin[1]=target.spawnOrigin[1]+trans.sin(phase)*PATROL_RADIUS
  end if
  target.origin[2]=target.spawnOrigin[2]
  return void
end function

// Injectable trace entry point used by contracts. Events are rebuilt per frame.
/// @param traceFn Collision-trace callback used to test the requested movement or visibility segment.
/// @param context context record passed to the playable enemy ai helper calls.
/// @param ai Mutable playable enemy ai record/storage; this routine assigns `ai.events`, `ai.visibleCount`, `ai.lastTime`.
/// @param targetState Record read through `targetState.targets`.
/// @param playerPosition Sequence read at `playerPosition[0]`, `playerPosition[1]`, `playerPosition[2]`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param deltaMilliseconds Elapsed simulation interval in milliseconds.
function stepWithTrace(traceFn,context,ai,targetState,playerPosition,now,deltaMilliseconds)
  if traceFn==void or ai==void or targetState==void or not validVector(playerPosition) then return fail("trace, state, targets and player position are required") end if
  if now<0 or deltaMilliseconds<0 then return fail("time values cannot be negative") end if
  if len(ai.brains)!=len(targetState.targets) then return fail("AI and target counts differ") end if
  ai.events=[];ai.visibleCount=0;ai.lastTime=now
  for index=0 to len(targetState.targets)-1
    target=targetState.targets[index];brain=ai.brains[index]
    if not target.alive then brain.mode="dead";brain.visible=false;continue end if
    eye=[target.origin[0],target.origin[1],target.origin[2]+20.0]
    visible=lineVisible(traceFn,context,eye,playerPosition);if visible is error then return visible end if
    brain.visible=visible
    relation=horizontalDirection(target.origin,playerPosition);distance=relation[1]
    if visible then
      ai.visibleCount=ai.visibleCount+1;brain.lastSeen=[playerPosition[0],playerPosition[1],playerPosition[2]]
    end if
    if now>=brain.nextThink then
      brain.nextThink=now+THINK_MILLISECONDS
      if visible and distance>CHASE_DISTANCE then brain.mode="chase"
      else if visible then brain.mode="strafe"
      else brain.mode="patrol" end if
      // Alternate direction predictably so opponents do not orbit forever.
      if ((now/1000)+target.spawnIndex)%4==0 then brain.strafeSide=0-brain.strafeSide end if
    end if
    moveTarget(target,brain,playerPosition,now,deltaMilliseconds)
    if visible and distance<=ATTACK_RANGE and now>=brain.nextAttack then
      brain.nextAttack=now+ATTACK_COOLDOWN_MILLISECONDS
      ai.events=ai.events+[Event(DEFAULT_DAMAGE,brain.strafeSide,index)]
    end if
  end for
  return ai.events
end function

// Public BSP-world entry point: sight is a zero-sized CM_BoxTrace.
/// @param world world record passed to the playable enemy ai helper calls.
/// @param ai Value used by `return stepWithTrace(worldPointTrace,world,ai,targetState,playerPosition,now,deltaMilliseconds)`.
/// @param targetState targetState record passed to the playable enemy ai helper calls.
/// @param playerPosition Value used by `return stepWithTrace(worldPointTrace,world,ai,targetState,playerPosition,now,deltaMilliseconds)`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param deltaMilliseconds Elapsed simulation interval in milliseconds.
function step(world,ai,targetState,playerPosition,now,deltaMilliseconds)
  if world==void then return fail("collision world is required") end if
  return stepWithTrace(worldPointTrace,world,ai,targetState,playerPosition,now,deltaMilliseconds)
end function
