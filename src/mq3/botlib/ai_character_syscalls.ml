// SPDX-License-Identifier: GPL-2.0-or-later
// QVM marshalling for BOTLIB_AI character traps 500..506.
package mq3.botlib.ai_character_syscalls

import mq3.botlib.ai_characters as characters
import mq3.vm.syscall_common as common
import mq3.compat.numeric as n

/// Return the result of `n.bitsFloat(common.argument(vm,base,index))` for `farg`.
/// @param vm VM instance owning the syscall memory and state.
/// @param base Address within the VM memory or native data buffer.
/// @param index Index of the entry to access.
function farg(vm,base,index) return n.bitsFloat(common.argument(vm,base,index)) end function
/// Apply `mq3.vm.syscall_common.readString`, `mq3.vm.syscall_common.argument` and `mq3.botlib.ai_characters.loadCharacter` while evaluating `dispatch`.
/// @param state AI characters state; accesses `readFn`.
/// @param vm VM instance owning the syscall memory and state.
/// @param base Address within the VM memory or native data buffer.
/// @param op Numeric syscall operation identifier.
function dispatch(state,vm,base,op)
  if op==characters.OP_LOAD_CHARACTER then filename=common.readString(vm,common.argument(vm,base,1));if filename is error then return filename end if;return characters.loadCharacter(state,filename,farg(vm,base,2)) end if
  handle=common.argument(vm,base,1)
  if op==characters.OP_FREE_CHARACTER then return characters.freeCharacter(state,handle) end if
  if op==characters.OP_CHARACTERISTIC_FLOAT then return n.floatBits(characters.characteristicFloat(state,handle,common.argument(vm,base,2))) end if
  if op==characters.OP_CHARACTERISTIC_BFLOAT then return n.floatBits(characters.characteristicBFloat(state,handle,common.argument(vm,base,2),farg(vm,base,3),farg(vm,base,4))) end if
  if op==characters.OP_CHARACTERISTIC_INTEGER then return characters.characteristicInteger(state,handle,common.argument(vm,base,2)) end if
  if op==characters.OP_CHARACTERISTIC_BINTEGER then return characters.characteristicBInteger(state,handle,common.argument(vm,base,2),common.argument(vm,base,3),common.argument(vm,base,4)) end if
  if op==characters.OP_CHARACTERISTIC_STRING then
    size=common.argument(vm,base,4);if size<=0 then return error(7551,"characteristic string capacity must be positive") end if
    output=common.pointer(vm,common.argument(vm,base,3),size,"characteristic string output");if output is error then return output end if
    value=characters.characteristicString(state,handle,common.argument(vm,base,2));if value==void then return 0 end if
    written=common.writeBuffer(vm,common.argument(vm,base,3),size,value,"characteristic string output");if written is error then return written end if;return 0
  end if
  return error(7552,"unsupported AI character trap "+str(op))
end function
