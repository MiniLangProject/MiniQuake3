// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Goal-stack and avoid-goal state from code/botlib/be_ai_goal.c.
package mq3.botlib.ai_goal_state

import mq3.botlib.ai_resource_pools as goalResources
import mq3.compat.numeric as goalNumeric

const OP_RESET_AVOID_GOALS=526
const OP_PUSH_GOAL=527
const OP_POP_GOAL=528
const OP_EMPTY_GOAL_STACK=529
const OP_DUMP_AVOID_GOALS=530
const OP_DUMP_GOAL_STACK=531
const OP_GOAL_NAME=532
const OP_GET_TOP_GOAL=533
const OP_GET_SECOND_GOAL=534
const OP_TOUCHING_GOAL=537
const OP_AVOID_GOAL_TIME=540
const PRT_ERROR=3

struct Runtime pools context timeFn goalNameFn logFn printFn end struct

function create(pools,context,timeFn,goalNameFn,logFn,printFn)
  return Runtime(pools,context,timeFn,goalNameFn,logFn,printFn)
end function
function currentTime(runtime)
  if runtime==void or runtime.timeFn==void then return 0.0 end if
  return runtime.timeFn(runtime.context)
end function
function copyVector(value) return [value[0],value[1],value[2]] end function
function copyGoal(value)
  return goalResources.Goal(copyVector(value.origin),value.areaNum,copyVector(value.mins),copyVector(value.maxs),value.entityNum,value.number,value.flags,value.itemInfo)
end function
function goalName(runtime,number)
  if runtime==void or runtime.goalNameFn==void then return void end if
  return runtime.goalNameFn(runtime.context,number)
end function
function emitLog(runtime,text) if runtime!=void and runtime.logFn!=void then runtime.logFn(runtime.context,text) end if;return void end function
function emitPrint(runtime,level,text) if runtime!=void and runtime.printFn!=void then runtime.printFn(runtime.context,level,text) end if;return void end function

function resetAvoidGoals(runtime,handle)
  if runtime==void then return 0 end if;return goalResources.resetAvoidGoalsState(goalResources.goalState(runtime.pools,handle))
end function
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
function removeFromAvoidGoals(runtime,handle,number)
  if runtime==void then return 0 end if;value=goalResources.goalState(runtime.pools,handle);if value==void then return 0 end if;now=currentTime(runtime)
  for index=0 to goalResources.MAX_AVOIDGOALS-1
    if value.avoidGoals[index]==number and value.avoidGoalTimes[index]>=now then value.avoidGoalTimes[index]=0.0;return 1 end if
  end for
  return 0
end function
function avoidGoalTime(runtime,handle,number)
  if runtime==void then return 0.0 end if;value=goalResources.goalState(runtime.pools,handle);if value==void then return 0.0 end if;now=currentTime(runtime)
  for index=0 to goalResources.MAX_AVOIDGOALS-1
    if value.avoidGoals[index]==number and value.avoidGoalTimes[index]>=now then return goalNumeric.fsub(value.avoidGoalTimes[index],now) end if
  end for
  return 0.0
end function
function dumpAvoidGoals(runtime,handle)
  if runtime==void then return 0 end if;value=goalResources.goalState(runtime.pools,handle);if value==void then return 0 end if;now=currentTime(runtime);count=0
  for index=0 to goalResources.MAX_AVOIDGOALS-1
    if value.avoidGoalTimes[index]>=now then name=goalName(runtime,value.avoidGoals[index]);if name==void then name="" end if;emitLog(runtime,"avoid goal "+name+", number "+str(value.avoidGoals[index])+" for "+str(goalNumeric.fsub(value.avoidGoalTimes[index],now))+" seconds");count=count+1 end if
  end for;return count
end function

function dumpGoalStack(runtime,handle)
  if runtime==void then return 0 end if;value=goalResources.goalState(runtime.pools,handle);if value==void then return 0 end if
  for index=1 to value.goalStackTop name=goalName(runtime,value.goalStack[index].number);if name==void then name="" end if;emitLog(runtime,str(index)+": "+name) end for
  return value.goalStackTop
end function
function pushGoal(runtime,handle,goal)
  if runtime==void or goal==void then return 0 end if;value=goalResources.goalState(runtime.pools,handle);if value==void then return 0 end if
  if value.goalStackTop>=goalResources.MAX_GOALSTACK-1 then emitPrint(runtime,PRT_ERROR,"goal heap overflow\n");dumpGoalStack(runtime,handle);return 0 end if
  value.goalStackTop=value.goalStackTop+1;value.goalStack[value.goalStackTop]=copyGoal(goal);return 1
end function
function popGoal(runtime,handle)
  if runtime==void then return 0 end if;value=goalResources.goalState(runtime.pools,handle);if value==void then return 0 end if;if value.goalStackTop>0 then value.goalStackTop=value.goalStackTop-1 end if;return 0
end function
function emptyGoalStack(runtime,handle)
  if runtime==void then return 0 end if;value=goalResources.goalState(runtime.pools,handle);if value!=void then value.goalStackTop=0 end if;return 0
end function
function topGoal(runtime,handle)
  if runtime==void then return void end if;value=goalResources.goalState(runtime.pools,handle);if value==void or value.goalStackTop==0 then return void end if;return copyGoal(value.goalStack[value.goalStackTop])
end function
function secondGoal(runtime,handle)
  if runtime==void then return void end if;value=goalResources.goalState(runtime.pools,handle);if value==void or value.goalStackTop<=1 then return void end if;return copyGoal(value.goalStack[value.goalStackTop-1])
end function

function touchingGoal(origin,goal)
  if origin==void or goal==void or len(origin)!=3 then return false end if
  // AAS_PresenceTypeBoundingBox(PRESENCE_NORMAL): mins {-15,-15,-24}, maxs {15,15,32}.
  playerMins=[-15.0,-15.0,-24.0];playerMaxs=[15.0,15.0,32.0]
  for axis=0 to 2
    minimum=goalNumeric.fadd(goalNumeric.fsub(goal.mins[axis],playerMaxs[axis]),goal.origin[axis]);maximum=goalNumeric.fadd(goalNumeric.fsub(goal.maxs[axis],playerMins[axis]),goal.origin[axis])
    if origin[axis]<minimum or origin[axis]>maximum then return false end if
  end for;return true
end function
function supportsTrap(op)
  return op==OP_RESET_AVOID_GOALS or op==OP_PUSH_GOAL or op==OP_POP_GOAL or op==OP_EMPTY_GOAL_STACK or op==OP_DUMP_AVOID_GOALS or op==OP_DUMP_GOAL_STACK or op==OP_GOAL_NAME or op==OP_GET_TOP_GOAL or op==OP_GET_SECOND_GOAL or op==OP_TOUCHING_GOAL or op==OP_AVOID_GOAL_TIME
end function
