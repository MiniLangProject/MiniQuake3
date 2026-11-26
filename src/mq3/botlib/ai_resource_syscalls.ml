// SPDX-License-Identifier: GPL-2.0-or-later
// QVM dispatcher for the implemented Botlib AI state lifecycle traps.
package mq3.botlib.ai_resource_syscalls

import mq3.botlib.ai_resource_pools as resources
import mq3.vm.syscall_common as common

/// Apply `mq3.vm.syscall_common.argument`, `mq3.botlib.ai_resource_pools.allocChatState` and `mq3.botlib.ai_resource_pools.freeChatState` while evaluating `dispatch`.
/// @param pools Bot resource pools; accesses `chatStates`. May update `pools.chatStates[handle]` in place.
/// @param vm VM instance owning the syscall memory and state.
/// @param base Address within the VM memory or native data buffer.
/// @param op Numeric syscall operation identifier.
function dispatch(pools,vm,base,op)
  handle=common.argument(vm,base,1)
  if op==resources.OP_ALLOC_CHAT_STATE then return resources.allocChatState(pools) end if
  if op==resources.OP_FREE_CHAT_STATE then return resources.freeChatState(pools,handle) end if
  if op==resources.OP_RESET_GOAL_STATE then return resources.resetGoalState(pools,handle) end if
  if op==resources.OP_ALLOC_GOAL_STATE then return resources.allocGoalState(pools,handle) end if
  if op==resources.OP_FREE_GOAL_STATE then return resources.freeGoalState(pools,handle) end if
  if op==resources.OP_RESET_MOVE_STATE then return resources.resetMoveState(pools,handle) end if
  if op==resources.OP_RESET_AVOID_REACH then return resources.resetAvoidReach(pools,handle) end if
  if op==resources.OP_RESET_LAST_AVOID_REACH then return resources.resetLastAvoidReach(pools,handle) end if
  if op==resources.OP_ALLOC_MOVE_STATE then return resources.allocMoveState(pools) end if
  if op==resources.OP_FREE_MOVE_STATE then return resources.freeMoveState(pools,handle) end if
  if op==resources.OP_ALLOC_WEAPON_STATE then return resources.allocWeaponState(pools) end if
  if op==resources.OP_FREE_WEAPON_STATE then return resources.freeWeaponState(pools,handle) end if
  if op==resources.OP_RESET_WEAPON_STATE then return resources.resetWeaponState(pools,handle) end if
  return error(7560,"unsupported AI resource trap "+str(op))
end function
