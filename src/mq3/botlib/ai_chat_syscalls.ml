// SPDX-License-Identifier: GPL-2.0-or-later
// QVM marshalling for initial-chat setup traps 522..524.
package mq3.botlib.ai_chat_syscalls

import mq3.botlib.ai_chat_profiles as chat
import mq3.vm.syscall_common as common

function dispatch(state,vm,base,op)
  handle=common.argument(vm,base,1)
  if op==chat.OP_LOAD_CHAT_FILE then
    filename=common.readString(vm,common.argument(vm,base,2));if filename is error then return filename end if
    name=common.readString(vm,common.argument(vm,base,3));if name is error then return name end if
    return chat.loadChatFile(state,handle,filename,name)
  end if
  if op==chat.OP_SET_CHAT_GENDER then return chat.setChatGender(state,handle,common.argument(vm,base,2)) end if
  if op==chat.OP_SET_CHAT_NAME then
    name=common.readString(vm,common.argument(vm,base,2));if name is error then return name end if
    return chat.setChatName(state,handle,name,common.argument(vm,base,3))
  end if
  return error(7571,"AI chat syscall: unsupported trap "+str(op))
end function
