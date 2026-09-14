// SPDX-License-Identifier: GPL-2.0-or-later
// QVM ABI for BotGetNextCampSpotGoal and BotGetMapLocationGoal.
package mq3.botlib.ai_map_goal_syscalls

import mq3.botlib.ai_map_goals as mapGoals
import mq3.compat.numeric as n
import mq3.vm.syscall_common as common

const BOT_GOAL_SIZE=56
function writeVector(data,address,value) for axis=0 to 2 n.writeU32(data,address+axis*4,n.floatBits(value[axis])) end for;return void end function
function writeSelectedGoal(vm,address,goal)
  at=common.pointer(vm,address,BOT_GOAL_SIZE,"bot_goal_t output");if at is error then return at end if
  // The released functions leave number, flags and iteminfo untouched.
  writeVector(vm.data,at,goal.origin);n.writeU32(vm.data,at+12,goal.areaNum);writeVector(vm.data,at+16,goal.mins);writeVector(vm.data,at+28,goal.maxs);n.writeU32(vm.data,at+40,goal.entityNum);return 0
end function
function dispatch(state,vm,base,op)
  if op==mapGoals.OP_GET_NEXT_CAMP_SPOT_GOAL then result=mapGoals.nextCampSpotGoal(state,common.argument(vm,base,1));if result.next==0 then return 0 end if;written=writeSelectedGoal(vm,common.argument(vm,base,2),result.goal);if written is error then return written end if;return result.next end if
  if op==mapGoals.OP_GET_MAP_LOCATION_GOAL then name=common.readString(vm,common.argument(vm,base,1));if name is error then return name end if;goal=mapGoals.mapLocationGoal(state,name);if goal==void then return 0 end if;written=writeSelectedGoal(vm,common.argument(vm,base,2),goal);if written is error then return written end if;return 1 end if
  return error(7603,"AI map-goal syscall: unsupported trap "+str(op))
end function
