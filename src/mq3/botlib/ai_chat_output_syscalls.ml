// SPDX-License-Identifier: GPL-2.0-or-later
// QVM marshalling for BotInitialChat/BotReplyChat/BotChatLength/BotEnterChat.
package mq3.botlib.ai_chat_output_syscalls

import mq3.botlib.ai_chat_output as chatOutput
import mq3.vm.syscall_common as common

function optionalString(vm,pointer) if pointer==0 then return void end if;return common.readString(vm,pointer) end function
function variables(vm,base,start)
  values=array(8,void);for index=0 to 7 value=optionalString(vm,common.argument(vm,base,start+index));if value is error then return value end if;values[index]=value end for;return values
end function
function dispatch(state,vm,base,op)
  handle=common.argument(vm,base,1)
  if op==chatOutput.OP_INITIAL_CHAT then type=common.readString(vm,common.argument(vm,base,2));if type is error then return type end if;values=variables(vm,base,4);if values is error then return values end if;return chatOutput.initialChat(state,handle,type,common.argument(vm,base,3),values) end if
  if op==chatOutput.OP_REPLY_CHAT then message=common.readString(vm,common.argument(vm,base,2));if message is error then return message end if;values=variables(vm,base,5);if values is error then return values end if;return chatOutput.replyChat(state,handle,message,common.argument(vm,base,3),common.argument(vm,base,4),values) end if
  if op==chatOutput.OP_CHAT_LENGTH then return chatOutput.chatLength(state,handle) end if
  if op==chatOutput.OP_ENTER_CHAT then return chatOutput.enterChat(state,handle,common.argument(vm,base,2),common.argument(vm,base,3)) end if
  return error(7575,"AI chat output syscall: unsupported trap "+str(op))
end function
