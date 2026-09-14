// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// QVM ABI for focused Baseq3 movement-AI traps.
package mq3.botlib.ai_move_syscalls

import mq3.botlib.ai_move_runtime as moveSyscallRuntime
import mq3.botlib.ai_goal_state_syscalls as goalAbi
import mq3.vm.syscall_common as common
import mq3.compat.numeric as n

const INIT_MOVE_SIZE=68
const MOVE_RESULT_SIZE=52
function writeMoveVector(data,address,value) for axis=0 to 2 n.writeU32(data,address+axis*4,n.floatBits(value[axis])) end for;return void end function
function readInitMove(vm,address)
  at=common.pointer(vm,address,INIT_MOVE_SIZE,"bot_initmove_t input");if at is error then return at end if
  origin=common.readFloatVector(vm,at,3,"init-move origin");velocity=common.readFloatVector(vm,at+12,3,"init-move velocity");viewOffset=common.readFloatVector(vm,at+24,3,"init-move view offset");viewAngles=common.readFloatVector(vm,at+52,3,"init-move view angles")
  if origin is error then return origin end if;if velocity is error then return velocity end if;if viewOffset is error then return viewOffset end if;if viewAngles is error then return viewAngles end if
  return moveSyscallRuntime.InitMove(origin,velocity,viewOffset,n.readI32(vm.data,at+36),n.readI32(vm.data,at+40),n.bitsFloat(n.readU32(vm.data,at+44)),n.readI32(vm.data,at+48),viewAngles,n.readI32(vm.data,at+64))
end function
function writeMoveResult(vm,address,value)
  at=common.pointer(vm,address,MOVE_RESULT_SIZE,"bot_moveresult_t output");if at is error then return at end if
  failure=0;if value.failure then failure=1 end if;blocked=0;if value.blocked then blocked=1 end if;n.writeU32(vm.data,at,failure);n.writeU32(vm.data,at+4,value.type);n.writeU32(vm.data,at+8,blocked);n.writeU32(vm.data,at+12,value.blockEntity);n.writeU32(vm.data,at+16,value.travelType);n.writeU32(vm.data,at+20,value.flags);n.writeU32(vm.data,at+24,value.weapon);writeMoveVector(vm.data,at+28,value.moveDir);writeMoveVector(vm.data,at+40,value.idealViewAngles);return 0
end function
function dispatch(runtime,vm,base,op)
  if op==moveSyscallRuntime.OP_MOVE_TO_GOAL then goal=goalAbi.readGoal(vm,common.argument(vm,base,3));if goal is error then return goal end if;result=moveSyscallRuntime.moveToGoal(runtime,common.argument(vm,base,2),goal,common.argument(vm,base,4));return writeMoveResult(vm,common.argument(vm,base,1),result) end if
  if op==moveSyscallRuntime.OP_MOVE_IN_DIRECTION then direction=common.readFloatVector(vm,common.argument(vm,base,2),3,"BotMoveInDirection direction");if direction is error then return direction end if;result=moveSyscallRuntime.moveInDirection(runtime,common.argument(vm,base,1),direction,n.bitsFloat(common.argument(vm,base,3)),common.argument(vm,base,4));if result then return 1 else return 0 end if end if
  if op==moveSyscallRuntime.OP_REACHABILITY_AREA then origin=common.readFloatVector(vm,common.argument(vm,base,1),3,"BotReachabilityArea origin");if origin is error then return origin end if;return moveSyscallRuntime.reachabilityArea(runtime,origin,common.argument(vm,base,2)) end if
  if op==moveSyscallRuntime.OP_MOVEMENT_VIEW_TARGET then
    goal=goalAbi.readGoal(vm,common.argument(vm,base,2));if goal is error then return goal end if;targetAddress=common.argument(vm,base,5);target=common.readFloatVector(vm,targetAddress,3,"BotMovementViewTarget output");if target is error then return target end if
    result=moveSyscallRuntime.movementViewTarget(runtime,common.argument(vm,base,1),goal,common.argument(vm,base,3),n.bitsFloat(common.argument(vm,base,4)),target);at=common.pointer(vm,targetAddress,12,"BotMovementViewTarget output");if at is error then return at end if;writeMoveVector(vm.data,at,result.target);if result.found then return 1 else return 0 end if
  end if
  if op==moveSyscallRuntime.OP_INIT_MOVE_STATE then value=readInitMove(vm,common.argument(vm,base,2));if value is error then return value end if;return moveSyscallRuntime.initMoveState(runtime,common.argument(vm,base,1),value) end if
  return error(7545,"unsupported Baseq3 movement-AI trap "+str(op))
end function
