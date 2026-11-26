// SPDX-License-Identifier: GPL-2.0-or-later
package mq3.botlib.ai_item_weight_syscalls

import mq3.botlib.ai_item_weights as weights
import mq3.vm.syscall_common as common

/// Apply `mq3.vm.syscall_common.argument`, `mq3.vm.syscall_common.readString` and `mq3.botlib.ai_item_weights.loadItemWeights` while evaluating `dispatch`.
/// @param runtime AI item weights runtime; accesses `reloadCharacters` and `configs`. May update `runtime.configs` in place.
/// @param pools Bot resource pools; accesses `goalStates`.
/// @param vm VM instance owning the syscall memory and state.
/// @param base Address within the VM memory or native data buffer.
/// @param op Numeric syscall operation identifier.
function dispatch(runtime,pools,vm,base,op)
  handle=common.argument(vm,base,1)
  if op==weights.OP_LOAD_ITEM_WEIGHTS then filename=common.readString(vm,common.argument(vm,base,2));if filename is error then return filename end if;return weights.loadItemWeights(runtime,pools,handle,filename) end if
  if op==weights.OP_FREE_ITEM_WEIGHTS then return weights.freeItemWeights(runtime,pools,handle) end if
  return error(7571,"unsupported AI item-weight trap "+str(op))
end function
