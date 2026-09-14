// SPDX-License-Identifier: GPL-2.0-or-later
// QVM ABI for BOTLIB_AI_ADD_AVOID_SPOT (Baseq3 opcode 574).
package mq3.botlib.ai_avoid_spot_syscalls

import mq3.botlib.ai_avoid_spots as avoidSpots
import mq3.vm.syscall_common as common
import mq3.compat.numeric as n

function dispatch(pools,vm,base)
  origin=common.readFloatVector(vm,common.argument(vm,base,2),3,"BotAddAvoidSpot origin");if origin is error then return origin end if
  return avoidSpots.add(pools,common.argument(vm,base,1),origin,n.bitsFloat(common.argument(vm,base,3)),common.argument(vm,base,4))
end function
