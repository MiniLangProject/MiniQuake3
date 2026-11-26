package mq3.client.playable_enemy_events
// SPDX-License-Identifier: GPL-2.0-or-later
// Per-opponent preview events and Q3 animation-state inputs.

const BOTH_DEATH1=0
/// Native upper-body animation slot for the gesture sequence.
const TORSO_GESTURE=6
/// Native upper-body animation slot for the attack sequence.
const TORSO_ATTACK=7
/// Native upper-body animation slot for the raise sequence.
const TORSO_RAISE=10
/// Native upper-body animation slot for the stand sequence.
const TORSO_STAND=11
/// Native lower-body animation slot for the walk sequence.
const LEGS_WALK=14
/// Native lower-body animation slot for the run sequence.
const LEGS_RUN=15
/// Native lower-body animation slot for the idle sequence.
const LEGS_IDLE=22

/// Duration or scheduling interval in milliseconds controlling pain.
const PAIN_MILLISECONDS=350
/// Duration or scheduling interval in milliseconds controlling attack.
const ATTACK_MILLISECONDS=450

/// Stores playable enemy events track record, including `health`, `alive`, `origin`, `action`, `actionSince`.
struct Track
  /// Previously observed enemy health used to detect a new hurt event.
  health
  /// True while the simulated player or target remains alive and can participate in gameplay.
  alive
  /// Previous observed enemy position, retained to detect movement between event updates.
  origin
  /// When constructing this record, `state` supplies `action` for this member.
  action
  /// When constructing this record, `state` supplies `now` for this member. Used by `beginAction` and
  /// `appendInput` during subsequent processing.
  actionSince
end struct
/// Stores playable enemy events state, including `tracks`, `lastTime`, `inputs`, `events`.
struct State
  /// When constructing this record, `state` supplies `tracks` for this member.
  tracks
  /// When constructing this record, `state` supplies `now` for this member.
  lastTime
  /// When constructing this record, `state` supplies an empty list for this member.
  inputs
  /// When constructing this record, `state` supplies an empty list for this member.
  events
end struct
/// Stores playable enemy events input record, including `targetIndex`, `lowerAnimation`, `upperAnimation`, `elapsedMilliseconds`, `action`.
struct Input
  /// Index identifying the selected target in the owning target collection.
  targetIndex
  /// When constructing this record, `appendInput` supplies `lower` for this member.
  lowerAnimation
  /// When constructing this record, `appendInput` supplies `upper` for this member.
  upperAnimation
  /// When constructing this record, `appendInput` supplies `elapsed` for this member.
  elapsedMilliseconds
  /// When constructing this record, `appendInput` supplies `track.action` for this member.
  action
end struct
/// Stores playable enemy events event record, including `kind`, `targetIndex`, `at`.
struct Event
  /// Enemy-state event category selected by comparing the current target with its previous observation.
  kind
  /// Index identifying the selected target in the owning target collection.
  targetIndex
  /// When constructing this record, `beginAction` supplies `now` for this member.
  at
end struct

/// Creates the playable enemy events error `7550` with diagnostic text `"preview enemy events: "+message`.
/// @param message Argument 2 of `error`; passed as `"preview enemy events: "+message`.
function fail(message) return error(7550,"preview enemy events: "+message) end function
/// Copies the X, Y and Z components into a fresh playable enemy events vector.
/// @param value Sequence read at `value[0]`, `value[1]`, `value[2]`.
function point(value) return [value[0],value[1],value[2]] end function

/// Calls `mq3.client.playable_enemy_events.Track`, `mq3.client.playable_enemy_events.point`, `mq3.client.playable_enemy_events.State` from playable enemy events `state`. The final path returns `State(tracks,now,[],[])`.
/// @param targetState Record read through `targetState.targets`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function state(targetState,now)
  if targetState==void or now<0 then return fail("targets and non-negative time are required") end if
  tracks=[]
  for each target in targetState.targets
    action="idle";if not target.alive then action="death" end if
    tracks=tracks+[Track(target.health,target.alive,point(target.origin),action,now)]
  end for
  return State(tracks,now,[],[])
end function

/// Evaluates playable enemy events `attacked` and returns `false`, `true` according to its guard/selection conditions.
/// @param ai Record read through `ai.events`.
/// @param index Value tested by `value.attacker==index` before the calculation continues.
function attacked(ai,index)
  if ai==void then return false end if
  for each value in ai.events
    if value.attacker==index then return true end if
  end for
  return false
end function

/// Detects chase/strafe/patrol AI modes or a changed target origin relative to the recorded track.
/// @param track Record read through `track.origin`.
/// @param target Record read through `target.origin`.
/// @param brain Record read through `brain.mode`.
function moving(track,target,brain)
  if brain!=void and (brain.mode=="chase" or brain.mode=="strafe" or brain.mode=="patrol") then return true end if
  return target.origin[0]!=track.origin[0] or target.origin[1]!=track.origin[1] or target.origin[2]!=track.origin[2]
end function

/// Evaluates playable enemy events `motionAction` and returns `"idle"`, `"run"`, `"walk"` according to its guard/selection conditions.
/// @param brain Record read through `brain.mode`.
/// @param isMoving Value used by `if not isMoving then return "idle" end if`.
function motionAction(brain,isMoving)
  if not isMoving then return "idle" end if
  if brain!=void and brain.mode=="chase" then return "run" end if
  return "walk"
end function

/// Updates `track.action`, `track.actionSince`, `result.events` during playable enemy events `beginAction`.
/// @param result Mutable playable enemy events record/storage; this routine assigns `result.events`.
/// @param track Mutable playable enemy events record/storage; this routine assigns `track.action`, `track.actionSince`.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param index Value used by `if emit then result.events=result.events+[Event(kind,index,now)] end if`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param emit Value used by `if emit then result.events=result.events+[Event(kind,index,now)] end if`.
function beginAction(result,track,kind,index,now,emit)
  if track.action!=kind then track.action=kind;track.actionSince=now end if
  if emit then result.events=result.events+[Event(kind,index,now)] end if
  return void
end function

/// Updates `result.inputs` during playable enemy events `appendInput`.
/// @param result Mutable playable enemy events record/storage; this routine assigns `result.inputs`.
/// @param track Record read through `track.actionSince`, `track.action`.
/// @param index Value used by `result.inputs=result.inputs+[Input(index,lower,upper,elapsed,track.action)]`.
/// @param lower Value used by `result.inputs=result.inputs+[Input(index,lower,upper,elapsed,track.action)]`.
/// @param upper Value used by `result.inputs=result.inputs+[Input(index,lower,upper,elapsed,track.action)]`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function appendInput(result,track,index,lower,upper,now)
  elapsed=now-track.actionSince;if elapsed<0 then elapsed=0 end if
  result.inputs=result.inputs+[Input(index,lower,upper,elapsed,track.action)]
  return void
end function

// Call after target damage/update and enemyAi.step. Events describe transitions
// observed on this call; inputs remain complete for every opponent on every call.
/// @param value Mutable playable enemy events record/storage; this routine assigns `value.lastTime`, `value.inputs`, `value.events`.
/// @param targetState Record read through `targetState.targets`.
/// @param ai Record read through `ai.brains`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function update(value,targetState,ai,now)
  if value==void or targetState==void or now<0 then return fail("state, targets and non-negative time are required") end if
  if len(value.tracks)!=len(targetState.targets) then return fail("event and target counts differ") end if
  if ai!=void and len(ai.brains)!=len(targetState.targets) then return fail("AI and target counts differ") end if
  value.lastTime=now;value.inputs=[];value.events=[]
  for index=0 to len(targetState.targets)-1
    target=targetState.targets[index];track=value.tracks[index];brain=void
    if ai!=void then brain=ai.brains[index] end if
    died=track.alive and not target.alive
    respawned=not track.alive and target.alive
    hurt=track.alive and target.alive and target.health<track.health
    fired=target.alive and attacked(ai,index)
    if died then
      beginAction(value,track,"death",index,now,true)
    else if not target.alive then
      beginAction(value,track,"death",index,now,false)
    else if respawned then
      beginAction(value,track,"respawn",index,now,true)
    else if hurt then
      beginAction(value,track,"pain",index,now,true)
    else if fired then
      beginAction(value,track,"attack",index,now,true)
    else if track.action=="pain" and now-track.actionSince<PAIN_MILLISECONDS then
      ignored=0
    else if track.action=="attack" and now-track.actionSince<ATTACK_MILLISECONDS then
      ignored=0
    else
      next=motionAction(brain,moving(track,target,brain));beginAction(value,track,next,index,now,false)
    end if

    lower=LEGS_IDLE;upper=TORSO_STAND
    if track.action=="death" then lower=BOTH_DEATH1;upper=BOTH_DEATH1
    else if track.action=="respawn" then upper=TORSO_RAISE
    else if track.action=="pain" then upper=TORSO_GESTURE
    else if track.action=="attack" then upper=TORSO_ATTACK
    else if track.action=="run" then lower=LEGS_RUN
    else if track.action=="walk" then lower=LEGS_WALK end if
    appendInput(value,track,index,lower,upper,now)
    track.health=target.health;track.alive=target.alive;track.origin=point(target.origin)
  end for
  return value.inputs
end function

/// Evaluates playable enemy events `input` and returns `fail("input index outside opponents")`, `value.inputs[index]` according to its guard/selection conditions.
/// @param value Record read through `value.inputs`.
/// @param index Value tested by `value==void or index<0 or index>=len(value.inputs)` before the calculation continues.
function input(value,index)
  if value==void or index<0 or index>=len(value.inputs) then return fail("input index outside opponents") end if
  return value.inputs[index]
end function
