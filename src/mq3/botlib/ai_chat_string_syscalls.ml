// SPDX-License-Identifier: GPL-2.0-or-later
// Composite QVM dispatcher for Baseq3 chat string/profile traps 520..524.
package mq3.botlib.ai_chat_string_syscalls

import mq3.botlib.ai_chat_strings as chatStrings
import mq3.botlib.ai_chat_profiles as chatProfiles
import mq3.botlib.ai_chat_syscalls as profileSyscalls
import mq3.vm.syscall_common as common

/// Apply `mq3.vm.syscall_common.pointer` and `mq3.vm.syscall_common.writeBuffer` while evaluating `mutate`. Return paths include `common.writeBuffer(vm,address,chatStrings.MAX_MESSAGE_SIZE,value,label)`.
/// @param vm VM instance owning the syscall memory and state.
/// @param address Address within the VM memory or native data buffer.
/// @param value Array or byte sequence accessed at `at+count`. Entries are written in place.
/// @param label Label retained with the diagnostic or action record.
function mutate(vm,address,value,label)
  output=common.pointer(vm,address,chatStrings.MAX_MESSAGE_SIZE,label);if output is error then return output end if
  return common.writeBuffer(vm,address,chatStrings.MAX_MESSAGE_SIZE,value,label)
end function
/// Apply `mq3.vm.syscall_common.argument`, `mq3.vm.syscall_common.readString` and `mq3.botlib.ai_chat_string_syscalls.mutate` while evaluating `dispatch`.
/// @param stringsState AI chat strings state; accesses `groups`.
/// @param profileState AI chat profiles state; accesses `pools`, `reload` and `cache`. May update `profileState.cache` in place.
/// @param vm VM instance owning the syscall memory and state.
/// @param base Address within the VM memory or native data buffer.
/// @param op Numeric syscall operation identifier.
function dispatch(stringsState,profileState,vm,base,op)
  if op==chatStrings.OP_UNIFY_WHITE_SPACES then
    address=common.argument(vm,base,1);value=common.readString(vm,address);if value is error then return value end if
    written=mutate(vm,address,chatStrings.unifyWhiteSpaces(value),"UnifyWhiteSpaces buffer");if written is error then return written end if;return 0
  end if
  if op==chatStrings.OP_REPLACE_SYNONYMS then
    address=common.argument(vm,base,1);value=common.readString(vm,address);if value is error then return value end if
    value=chatStrings.replaceSynonyms(stringsState,value,common.argument(vm,base,2));if value is error then return value end if
    written=mutate(vm,address,value,"BotReplaceSynonyms buffer");if written is error then return written end if;return 0
  end if
  if op>=chatProfiles.OP_LOAD_CHAT_FILE and op<=chatProfiles.OP_SET_CHAT_NAME then return profileSyscalls.dispatch(profileState,vm,base,op) end if
  return error(7596,"AI chat string syscall: unsupported trap "+str(op))
end function
