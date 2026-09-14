// SPDX-License-Identifier: GPL-2.0-or-later
package mq3.botlib.ai_goal_selection_syscalls

import mq3.botlib.ai_goal_selection as goalSelection
import mq3.botlib.ai_goal_state_syscalls as goalAbi
import mq3.vm.syscall_common as common
import mq3.compat.numeric as n

const INVENTORY_COUNT=256
function readInventory(vm,address)
  at=common.pointer(vm,address,INVENTORY_COUNT*4,"bot inventory input");if at is error then return at end if;result=[];for index=0 to INVENTORY_COUNT-1 result=result+[n.readI32(vm.data,at+index*4)] end for;return result
end function
function dispatch(runtime,vm,base,op)
  if op==goalSelection.OP_CHOOSE_LTG_ITEM or op==goalSelection.OP_CHOOSE_NBG_ITEM then
    origin=common.readFloatVector(vm,common.argument(vm,base,2),3,"goal choice origin");if origin is error then return origin end if;inventory=readInventory(vm,common.argument(vm,base,3));if inventory is error then return inventory end if
    if op==goalSelection.OP_CHOOSE_LTG_ITEM then return goalSelection.chooseLTGItem(runtime,common.argument(vm,base,1),origin,inventory,common.argument(vm,base,4)) end if
    longTerm=void;longAddress=common.argument(vm,base,5);if longAddress!=0 then longTerm=goalAbi.readGoal(vm,longAddress);if longTerm is error then return longTerm end if end if
    return goalSelection.chooseNBGItem(runtime,common.argument(vm,base,1),origin,inventory,common.argument(vm,base,4),longTerm,n.bitsFloat(common.argument(vm,base,6)))
  end if
  if op==goalSelection.OP_ITEM_GOAL_IN_VIS_BUT_NOT_VISIBLE then
    eye=common.readFloatVector(vm,common.argument(vm,base,2),3,"goal visibility eye");if eye is error then return eye end if;angles=common.readFloatVector(vm,common.argument(vm,base,3),3,"goal visibility angles");if angles is error then return angles end if;goal=goalAbi.readGoal(vm,common.argument(vm,base,4));if goal is error then return goal end if
    result=goalSelection.itemGoalInVisButNotVisible(runtime,common.argument(vm,base,1),eye,angles,goal);if result is error then return result end if;if result then return 1 else return 0 end if
  end if
  if op==goalSelection.OP_GET_LEVEL_ITEM_GOAL then
    name=common.readString(vm,common.argument(vm,base,2));if name is error then return name end if;goal=goalAbi.readGoal(vm,common.argument(vm,base,3));if goal is error then return goal end if;result=goalSelection.getLevelItemGoal(runtime,common.argument(vm,base,1),name,goal);if result<0 then return result end if;written=goalAbi.writeGoal(vm,common.argument(vm,base,3),goal);if written is error then return written end if;return result
  end if
  if op==goalSelection.OP_INTERBREED_GOAL_FUZZY_LOGIC then return goalSelection.interbreedGoalFuzzyLogic(runtime,common.argument(vm,base,1),common.argument(vm,base,2),common.argument(vm,base,3)) end if
  return error(7595,"unsupported AI goal-selection trap "+str(op))
end function
