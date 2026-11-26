// SPDX-License-Identifier: GPL-2.0-or-later
package mq3.botlib.ai_weapon_weight_syscalls
import mq3.botlib.ai_weapon_weights as weaponWeights
import mq3.vm.syscall_common as common
/// Apply `mq3.vm.syscall_common.readString`, `mq3.vm.syscall_common.argument` and `mq3.botlib.ai_weapon_weights.loadWeaponWeights` while evaluating `dispatch`.
/// @param runtime AI weapon weights runtime; accesses `fuzzyRuntime`.
/// @param pools Bot resource pools; accesses `weaponStates`.
/// @param vm VM instance owning the syscall memory and state.
/// @param base Address within the VM memory or native data buffer.
/// @param op Numeric syscall operation identifier.
function dispatch(runtime,pools,vm,base,op)
  if op==weaponWeights.OP_LOAD_WEAPON_WEIGHTS then filename=common.readString(vm,common.argument(vm,base,2));if filename is error then return filename end if;return weaponWeights.loadWeaponWeights(runtime,pools,common.argument(vm,base,1),filename) end if
  return error(7581,"unsupported AI weapon-weight trap "+str(op))
end function
