// SPDX-License-Identifier: GPL-2.0-or-later
// QVM ABI for the Baseq3 goal-stack and avoid-goal traps.
package mq3.botlib.ai_goal_state_syscalls

import mq3.botlib.ai_goal_state as goalRuntime
import mq3.botlib.ai_resource_pools as goalResources
import mq3.vm.syscall_common as common
import mq3.compat.numeric as n

const BOT_GOAL_SIZE=56

function vector(data,address) return [n.bitsFloat(n.readI32(data,address)),n.bitsFloat(n.readI32(data,address+4)),n.bitsFloat(n.readI32(data,address+8))] end function
function writeVector(data,address,value) for axis=0 to 2 n.writeU32(data,address+axis*4,n.floatBits(value[axis])) end for;return void end function
function readGoal(vm,address)
  at=common.pointer(vm,address,BOT_GOAL_SIZE,"bot_goal_t input");if at is error then return at end if
  return goalResources.Goal(vector(vm.data,at),n.readI32(vm.data,at+12),vector(vm.data,at+16),vector(vm.data,at+28),n.readI32(vm.data,at+40),n.readI32(vm.data,at+44),n.readI32(vm.data,at+48),n.readI32(vm.data,at+52))
end function
function writeGoal(vm,address,goal)
  at=common.pointer(vm,address,BOT_GOAL_SIZE,"bot_goal_t output");if at is error then return at end if
  writeVector(vm.data,at,goal.origin);n.writeU32(vm.data,at+12,goal.areaNum);writeVector(vm.data,at+16,goal.mins);writeVector(vm.data,at+28,goal.maxs)
  n.writeU32(vm.data,at+40,goal.entityNum);n.writeU32(vm.data,at+44,goal.number);n.writeU32(vm.data,at+48,goal.flags);n.writeU32(vm.data,at+52,goal.itemInfo);return 1
end function

function dispatch(runtime,vm,base,op)
  if op==goalRuntime.OP_RESET_AVOID_GOALS then goalRuntime.resetAvoidGoals(runtime,common.argument(vm,base,1));return 0 end if
  if op==goalRuntime.OP_PUSH_GOAL then goal=readGoal(vm,common.argument(vm,base,2));if goal is error then return goal end if;goalRuntime.pushGoal(runtime,common.argument(vm,base,1),goal);return 0 end if
  if op==goalRuntime.OP_POP_GOAL then return goalRuntime.popGoal(runtime,common.argument(vm,base,1)) end if
  if op==goalRuntime.OP_EMPTY_GOAL_STACK then return goalRuntime.emptyGoalStack(runtime,common.argument(vm,base,1)) end if
  if op==goalRuntime.OP_DUMP_AVOID_GOALS then goalRuntime.dumpAvoidGoals(runtime,common.argument(vm,base,1));return 0 end if
  if op==goalRuntime.OP_DUMP_GOAL_STACK then goalRuntime.dumpGoalStack(runtime,common.argument(vm,base,1));return 0 end if
  if op==goalRuntime.OP_GOAL_NAME then
    name=goalRuntime.goalName(runtime,common.argument(vm,base,1));if name==void then return 0 end if
    written=common.writeBuffer(vm,common.argument(vm,base,2),common.argument(vm,base,3),name,"goal name output");if written is error then return written end if;return 0
  end if
  if op==goalRuntime.OP_GET_TOP_GOAL or op==goalRuntime.OP_GET_SECOND_GOAL then
    selected=void;if op==goalRuntime.OP_GET_TOP_GOAL then selected=goalRuntime.topGoal(runtime,common.argument(vm,base,1)) else selected=goalRuntime.secondGoal(runtime,common.argument(vm,base,1)) end if
    if selected==void then return 0 end if;written=writeGoal(vm,common.argument(vm,base,2),selected);if written is error then return written end if;return 1
  end if
  if op==goalRuntime.OP_TOUCHING_GOAL then
    origin=common.readFloatVector(vm,common.argument(vm,base,1),3,"goal touch origin");if origin is error then return origin end if;goal=readGoal(vm,common.argument(vm,base,2));if goal is error then return goal end if
    if goalRuntime.touchingGoal(origin,goal) then return 1 else return 0 end if
  end if
  if op==goalRuntime.OP_AVOID_GOAL_TIME then return n.floatBits(goalRuntime.avoidGoalTime(runtime,common.argument(vm,base,1),common.argument(vm,base,2))) end if
  return error(7593,"unsupported AI goal-state trap "+str(op))
end function
