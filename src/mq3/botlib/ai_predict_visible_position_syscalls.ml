// SPDX-License-Identifier: GPL-2.0-or-later
// QVM ABI for BOTLIB_AI_PREDICT_VISIBLE_POSITION/op572.
package mq3.botlib.ai_predict_visible_position_syscalls

import mq3.botlib.ai_predict_visible_position as prediction
import mq3.botlib.ai_goal_state_syscalls as goalAbi
import mq3.compat.numeric as n
import mq3.vm.syscall_common as common

function writeVector(data,address,value) for axis=0 to 2 n.writeU32(data,address+axis*4,n.floatBits(value[axis])) end for;return void end function
function dispatch(runtime,vm,base,op)
  if op!=prediction.OP_PREDICT_VISIBLE_POSITION then return error(7601,"AI visible-position syscall: unsupported trap "+str(op)) end if
  origin=common.readFloatVector(vm,common.argument(vm,base,1),3,"BotPredictVisiblePosition origin");if origin is error then return origin end if
  goal=goalAbi.readGoal(vm,common.argument(vm,base,3));if goal is error then return goal end if
  result=prediction.predict(runtime,origin,common.argument(vm,base,2),goal,common.argument(vm,base,4));if not result.found then return 0 end if
  at=common.pointer(vm,common.argument(vm,base,5),12,"BotPredictVisiblePosition target");if at is error then return at end if;writeVector(vm.data,at,result.target);return 1
end function
