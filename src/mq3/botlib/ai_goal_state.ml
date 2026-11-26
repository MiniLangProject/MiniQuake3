// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Goal-stack and avoid-goal state from code/botlib/be_ai_goal.c.
package mq3.botlib.ai_goal_state

import mq3.botlib.ai_resource_pools as goalResources
import mq3.compat.numeric as goalNumeric

/// Bot-library syscall identifier for reset avoid goals.
const OP_RESET_AVOID_GOALS=526
/// Bot-library syscall identifier for push goal.
const OP_PUSH_GOAL=527
/// Bot-library syscall identifier for pop goal.
const OP_POP_GOAL=528
/// Bot-library syscall identifier for empty goal stack.
const OP_EMPTY_GOAL_STACK=529
/// Bot-library syscall identifier for dump avoid goals.
const OP_DUMP_AVOID_GOALS=530
/// Bot-library syscall identifier for dump goal stack.
const OP_DUMP_GOAL_STACK=531
/// Bot-library syscall identifier for goal name.
const OP_GOAL_NAME=532
/// Bot-library syscall identifier for get top goal.
const OP_GET_TOP_GOAL=533
/// Bot-library syscall identifier for get second goal.
const OP_GET_SECOND_GOAL=534
/// Bot-library syscall identifier for touching goal.
const OP_TOUCHING_GOAL=537
/// Bot-library syscall identifier for avoid goal time.
const OP_AVOID_GOAL_TIME=540
/// Bot-library diagnostic severity for error.
const PRT_ERROR=3

/// `Runtime` record for ai goal state, containing `pools`, `context`, `timeFn`, `goalNameFn` and `logFn` and related fields.
struct Runtime
  /// Managed pools containing bot chat, goal, movement, and weapon resources.
  pools
  /// Caller-supplied data associated with goal timing, goal-name lookup, logging, and goal-stack
  /// diagnostics.
  context
  /// Host callback that supplies the current time used by the bot runtime.
  timeFn
  /// Host callback that resolves a bot goal to its display name.
  goalNameFn
  /// Host callback that writes a bot-runtime message to the host log.
  logFn
  /// Host callback that prints goal-stack and goal-state diagnostic output.
  printFn
end struct

/// Create a `mq3.botlib.ai_goal_state.Runtime` record, initializing `pools` from `pools`, `context` from `context` and `timeFn` from `timeFn`.
/// @param pools Initial value stored in `mq3.botlib.ai_goal_state.Runtime.pools`.
/// @param context Context forwarded to the configured host callbacks.
/// @param timeFn Callback that supplies the current botlib time.
/// @param goalNameFn Initial value stored in `mq3.botlib.ai_goal_state.Runtime.goalNameFn`.
/// @param logFn Initial value stored in `mq3.botlib.ai_goal_state.Runtime.logFn`.
/// @param printFn Initial value stored in `mq3.botlib.ai_goal_state.Runtime.printFn`.
function create(pools,context,timeFn,goalNameFn,logFn,printFn)
  return Runtime(pools,context,timeFn,goalNameFn,logFn,printFn)
end function
/// Use `runtime.timeFn` to perform `currentTime`. Return paths include `runtime.timeFn(runtime.context)`.
/// @param runtime AI goal state runtime; accesses `timeFn` and `context`.
function currentTime(runtime)
  if runtime==void or runtime.timeFn==void then return 0.0 end if
  return runtime.timeFn(runtime.context)
end function
/// Copy `value[0]`, `value[1]` and `value[2]` into a new ordered array for ai goal state.
/// @param value Three-component array; components 0, 1 and 2 are used in their stored order.
function copyVector(value) return [value[0],value[1],value[2]] end function
/// Create a `mq3.botlib.ai_resource_pools.Goal` record, initializing `origin` as `copyVector(value.origin)`, `areaNum` as `value.areaNum` and `mins` as `copyVector(value.mins)`.
/// @param value Value record; accesses `origin`, `areaNum`, `mins`, `maxs` and `entityNum` and related fields.
function copyGoal(value)
  return goalResources.Goal(copyVector(value.origin),value.areaNum,copyVector(value.mins),copyVector(value.maxs),value.entityNum,value.number,value.flags,value.itemInfo)
end function
/// Use `runtime.goalNameFn` to perform `goalName`. Return paths include `runtime.goalNameFn(runtime.context,number)`.
/// @param runtime AI goal state runtime; accesses `goalNameFn` and `context`.
/// @param number Value passed as argument 2 to `runtime.goalNameFn`.
function goalName(runtime,number)
  if runtime==void or runtime.goalNameFn==void then return void end if
  return runtime.goalNameFn(runtime.context,number)
end function
/// Use `runtime.logFn` to perform `emitLog`.
/// @param runtime AI goal state runtime; accesses `logFn` and `context`.
/// @param text Text to parse, format or deliver.
function emitLog(runtime,text) if runtime!=void and runtime.logFn!=void then runtime.logFn(runtime.context,text) end if;return void end function
/// Use `runtime.printFn` to perform `emitPrint`.
/// @param runtime AI goal state runtime; accesses `printFn` and `context`.
/// @param level Value passed as argument 2 to `runtime.printFn`.
/// @param text Text to parse, format or deliver.
function emitPrint(runtime,level,text) if runtime!=void and runtime.printFn!=void then runtime.printFn(runtime.context,level,text) end if;return void end function

/// Apply `mq3.botlib.ai_resource_pools.resetAvoidGoalsState` and `mq3.botlib.ai_resource_pools.goalState` while evaluating `resetAvoidGoals`. Return paths include `goalResources.resetAvoidGoalsState(goalResources.goalState(runtime.pools,handle))`.
/// @param runtime AI goal state runtime; accesses `pools`.
/// @param handle Handle identifying the allocated bot goal state.
function resetAvoidGoals(runtime,handle)
  if runtime==void then return 0 end if;return goalResources.resetAvoidGoalsState(goalResources.goalState(runtime.pools,handle))
end function
/// Apply `mq3.botlib.ai_resource_pools.goalState` and `mq3.botlib.ai_goal_state.currentTime` while evaluating `addToAvoidGoals`.
/// @param runtime AI goal state runtime; accesses `pools`.
/// @param handle Handle identifying the allocated bot goal state.
/// @param number Value used by `addToAvoidGoals` in `if value.avoidGoals[index]==number then value.avoidGoals[index]=number`.
/// @param avoidTime Value passed as argument 2 to `mq3.compat.numeric.fadd`.
function addToAvoidGoals(runtime,handle,number,avoidTime)
  if runtime==void then return 0 end if;value=goalResources.goalState(runtime.pools,handle);if value==void then return 0 end if;now=currentTime(runtime)
  for index=0 to goalResources.MAX_AVOIDGOALS-1
    if value.avoidGoals[index]==number then value.avoidGoals[index]=number;value.avoidGoalTimes[index]=goalNumeric.fadd(now,avoidTime);return 1 end if
  end for
  for index=0 to goalResources.MAX_AVOIDGOALS-1
    if value.avoidGoalTimes[index]<now then value.avoidGoals[index]=number;value.avoidGoalTimes[index]=goalNumeric.fadd(now,avoidTime);return 1 end if
  end for
  return 0
end function
/// Apply `mq3.botlib.ai_resource_pools.goalState` and `mq3.botlib.ai_goal_state.currentTime` while evaluating `removeFromAvoidGoals`.
/// @param runtime AI goal state runtime; accesses `pools`.
/// @param handle Handle identifying the allocated bot goal state.
/// @param number Value used by `removeFromAvoidGoals` in `if value.avoidGoals[index]==number and value.avoidGoalTimes[index]>=now then value.avoidGoalTimes[index]=0.0`.
function removeFromAvoidGoals(runtime,handle,number)
  if runtime==void then return 0 end if;value=goalResources.goalState(runtime.pools,handle);if value==void then return 0 end if;now=currentTime(runtime)
  for index=0 to goalResources.MAX_AVOIDGOALS-1
    if value.avoidGoals[index]==number and value.avoidGoalTimes[index]>=now then value.avoidGoalTimes[index]=0.0;return 1 end if
  end for
  return 0
end function
/// Apply `mq3.botlib.ai_resource_pools.goalState` and `mq3.botlib.ai_goal_state.currentTime` while evaluating `avoidGoalTime`. Return paths include `0.0`.
/// @param runtime AI goal state runtime; accesses `pools`.
/// @param handle Handle identifying the allocated bot goal state.
/// @param number Value used by `avoidGoalTime` in `if value.avoidGoals[index]==number and value.avoidGoalTimes[index]>=now then return goalNumeric.fsub(value.avoid...`.
function avoidGoalTime(runtime,handle,number)
  if runtime==void then return 0.0 end if;value=goalResources.goalState(runtime.pools,handle);if value==void then return 0.0 end if;now=currentTime(runtime)
  for index=0 to goalResources.MAX_AVOIDGOALS-1
    if value.avoidGoals[index]==number and value.avoidGoalTimes[index]>=now then return goalNumeric.fsub(value.avoidGoalTimes[index],now) end if
  end for
  return 0.0
end function
/// Apply `mq3.botlib.ai_resource_pools.goalState`, `mq3.botlib.ai_goal_state.currentTime` and `mq3.botlib.ai_goal_state.goalName` while evaluating `dumpAvoidGoals`. Return paths include `count`.
/// @param runtime AI goal state runtime; accesses `pools`.
/// @param handle Handle identifying the allocated bot goal state.
function dumpAvoidGoals(runtime,handle)
  if runtime==void then return 0 end if;value=goalResources.goalState(runtime.pools,handle);if value==void then return 0 end if;now=currentTime(runtime);count=0
  for index=0 to goalResources.MAX_AVOIDGOALS-1
    if value.avoidGoalTimes[index]>=now then name=goalName(runtime,value.avoidGoals[index]);if name==void then name="" end if;emitLog(runtime,"avoid goal "+name+", number "+str(value.avoidGoals[index])+" for "+str(goalNumeric.fsub(value.avoidGoalTimes[index],now))+" seconds");count=count+1 end if
  end for;return count
end function

/// Apply `mq3.botlib.ai_resource_pools.goalState`, `mq3.botlib.ai_goal_state.goalName` and `mq3.botlib.ai_goal_state.emitLog` while evaluating `dumpGoalStack`. Return paths include `value.goalStackTop`.
/// @param runtime AI goal state runtime; accesses `pools`.
/// @param handle Handle identifying the allocated bot goal state.
function dumpGoalStack(runtime,handle)
  if runtime==void then return 0 end if;value=goalResources.goalState(runtime.pools,handle);if value==void then return 0 end if
  for index=1 to value.goalStackTop name=goalName(runtime,value.goalStack[index].number);if name==void then name="" end if;emitLog(runtime,str(index)+": "+name) end for
  return value.goalStackTop
end function
/// Push a copied goal onto the bounded goal stack, reporting stack overflow through the botlib diagnostics.
/// @param runtime AI goal state runtime; accesses `pools`.
/// @param handle Handle identifying the allocated bot goal state.
/// @param goal Value record; accesses `origin`, `areaNum`, `mins`, `maxs` and `entityNum` and related fields.
function pushGoal(runtime,handle,goal)
  if runtime==void or goal==void then return 0 end if;value=goalResources.goalState(runtime.pools,handle);if value==void then return 0 end if
  if value.goalStackTop>=goalResources.MAX_GOALSTACK-1 then emitPrint(runtime,PRT_ERROR,"goal heap overflow\n");dumpGoalStack(runtime,handle);return 0 end if
  value.goalStackTop=value.goalStackTop+1;value.goalStack[value.goalStackTop]=copyGoal(goal);return 1
end function
/// Apply `mq3.botlib.ai_resource_pools.goalState` while evaluating `popGoal`.
/// @param runtime AI goal state runtime; accesses `pools`.
/// @param handle Handle identifying the allocated bot goal state.
function popGoal(runtime,handle)
  if runtime==void then return 0 end if;value=goalResources.goalState(runtime.pools,handle);if value==void then return 0 end if;if value.goalStackTop>0 then value.goalStackTop=value.goalStackTop-1 end if;return 0
end function
/// Apply `mq3.botlib.ai_resource_pools.goalState` while evaluating `emptyGoalStack`.
/// @param runtime AI goal state runtime; accesses `pools`.
/// @param handle Handle identifying the allocated bot goal state.
function emptyGoalStack(runtime,handle)
  if runtime==void then return 0 end if;value=goalResources.goalState(runtime.pools,handle);if value!=void then value.goalStackTop=0 end if;return 0
end function
/// Apply `mq3.botlib.ai_resource_pools.goalState` and `mq3.botlib.ai_goal_state.copyGoal` while evaluating `topGoal`. Return paths include `copyGoal(value.goalStack[value.goalStackTop])`.
/// @param runtime AI goal state runtime; accesses `pools`.
/// @param handle Handle identifying the allocated bot goal state.
function topGoal(runtime,handle)
  if runtime==void then return void end if;value=goalResources.goalState(runtime.pools,handle);if value==void or value.goalStackTop==0 then return void end if;return copyGoal(value.goalStack[value.goalStackTop])
end function
/// Apply `mq3.botlib.ai_resource_pools.goalState` and `mq3.botlib.ai_goal_state.copyGoal` while evaluating `secondGoal`. Return paths include `copyGoal(value.goalStack[value.goalStackTop-1])`.
/// @param runtime AI goal state runtime; accesses `pools`.
/// @param handle Handle identifying the allocated bot goal state.
function secondGoal(runtime,handle)
  if runtime==void then return void end if;value=goalResources.goalState(runtime.pools,handle);if value==void or value.goalStackTop<=1 then return void end if;return copyGoal(value.goalStack[value.goalStackTop-1])
end function

/// Test the player origin against goal bounds expanded by the standing player bounding box.
/// @param origin World-space position as three coordinates.
/// @param goal Bot navigation goal; accesses `mins`, `origin` and `maxs`.
function touchingGoal(origin,goal)
  if origin==void or goal==void or len(origin)!=3 then return false end if
  // AAS_PresenceTypeBoundingBox(PRESENCE_NORMAL): mins {-15,-15,-24}, maxs {15,15,32}.
  playerMins=[-15.0,-15.0,-24.0];playerMaxs=[15.0,15.0,32.0]
  for axis=0 to 2
    minimum=goalNumeric.fadd(goalNumeric.fsub(goal.mins[axis],playerMaxs[axis]),goal.origin[axis]);maximum=goalNumeric.fadd(goalNumeric.fsub(goal.maxs[axis],playerMins[axis]),goal.origin[axis])
    if origin[axis]<minimum or origin[axis]>maximum then return false end if
  end for;return true
end function
/// Test `op==OP_RESET_AVOID_GOALS or op==OP_PUSH_GOAL or op==OP_POP_GOAL or op==OP_EMPTY_GOAL_STACK or op==OP_DUMP_AVOID_GOALS or op==OP_DUMP_GOAL_STACK or...` as the condition for `supportsTrap`.
/// @param op Numeric syscall operation identifier.
function supportsTrap(op)
  return op==OP_RESET_AVOID_GOALS or op==OP_PUSH_GOAL or op==OP_POP_GOAL or op==OP_EMPTY_GOAL_STACK or op==OP_DUMP_AVOID_GOALS or op==OP_DUMP_GOAL_STACK or op==OP_GOAL_NAME or op==OP_GET_TOP_GOAL or op==OP_GET_SECOND_GOAL or op==OP_TOUCHING_GOAL or op==OP_AVOID_GOAL_TIME
end function
