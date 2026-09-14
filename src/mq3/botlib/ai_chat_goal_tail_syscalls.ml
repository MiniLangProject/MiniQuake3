// SPDX-License-Identifier: GPL-2.0-or-later
// QVM ABI for late Botlib chat and avoid-goal traps 569, 570, 571 and 573.
package mq3.botlib.ai_chat_goal_tail_syscalls

import mq3.botlib.ai_chat_goal_tail as tail
import mq3.compat.numeric as n
import mq3.vm.syscall_common as common

function dispatch(state,vm,base,op)
  handle=common.argument(vm,base,1)
  if op==tail.OP_NUM_INITIAL_CHATS then type=common.readString(vm,common.argument(vm,base,2));if type is error then return type end if;return tail.numInitialChats(state,handle,type) end if
  if op==tail.OP_GET_CHAT_MESSAGE then
    size=common.argument(vm,base,3);if size<=0 then return 0 end if;message=tail.getChatMessage(state,handle,size);if message==void then return 0 end if
    written=common.writeBuffer(vm,common.argument(vm,base,2),size,message,"BotGetChatMessage output");if written is error then return written end if;return 0
  end if
  if op==tail.OP_REMOVE_FROM_AVOID_GOALS then return tail.removeFromAvoidGoals(state,handle,common.argument(vm,base,2)) end if
  if op==tail.OP_SET_AVOID_GOAL_TIME then return tail.setAvoidGoalTime(state,handle,common.argument(vm,base,2),n.bitsFloat(common.argument(vm,base,3))) end if
  return error(7600,"AI chat/goal tail syscall: unsupported trap "+str(op))
end function
