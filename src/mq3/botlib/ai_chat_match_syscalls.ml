// SPDX-License-Identifier: GPL-2.0-or-later
// QVM ABI adapter for BOTLIB_AI_STRING_CONTAINS/FIND_MATCH/MATCH_VARIABLE.
package mq3.botlib.ai_chat_match_syscalls

import mq3.botlib.ai_chat_matches as matches
import mq3.compat.numeric as n
import mq3.vm.syscall_common as common

function signedByte(value) if value>=128 then return value-256 end if;return value end function
function writeMatch(vm,address,match)
  at=common.pointer(vm,address,matches.MATCH_ABI_SIZE,"bot_match_t");if at is error then return at end if
  for index=0 to matches.MATCH_ABI_SIZE-1 vm.data[at+index]=0 end for
  text=bytes(match.string);count=len(text);if count>=matches.MAX_MESSAGE_SIZE then count=matches.MAX_MESSAGE_SIZE-1 end if;if count>0 then copyBytes(vm.data,at,text,0,count) end if
  n.writeU32(vm.data,at+256,match.type);n.writeU32(vm.data,at+260,match.subtype)
  for index=0 to matches.MAX_MATCH_VARIABLES-1 vm.data[at+264+index*8]=match.offsets[index]&255;n.writeU32(vm.data,at+268+index*8,match.lengths[index]) end for;return 0
end function
function readMatch(vm,address)
  at=common.pointer(vm,address,matches.MATCH_ABI_SIZE,"bot_match_t");if at is error then return at end if
  stop=at;while stop<at+matches.MAX_MESSAGE_SIZE and vm.data[stop]!=0 stop=stop+1 end while;text=decode(slice(vm.data,at,stop-at));offsets=[];lengths=[]
  for index=0 to matches.MAX_MATCH_VARIABLES-1 offsets=offsets+[signedByte(vm.data[at+264+index*8])];lengths=lengths+[n.readI32(vm.data,at+268+index*8)] end for
  return matches.Match(text,n.readI32(vm.data,at+256),n.readI32(vm.data,at+260),offsets,lengths)
end function
function dispatch(state,vm,base,op)
  if op==matches.OP_STRING_CONTAINS then left=common.readString(vm,common.argument(vm,base,1));if left is error then return left end if;right=common.readString(vm,common.argument(vm,base,2));if right is error then return right end if;return matches.stringContains(left,right,common.argument(vm,base,3)!=0) end if
  if op==matches.OP_FIND_MATCH then
    value=common.readString(vm,common.argument(vm,base,1));if value is error then return value end if;result=matches.findMatch(state,value,common.argument(vm,base,3));if result is error then return result end if;if result==void then return 0 end if
    written=writeMatch(vm,common.argument(vm,base,2),result);if written is error then return written end if;return 1
  end if
  if op==matches.OP_MATCH_VARIABLE then
    match=readMatch(vm,common.argument(vm,base,1));if match is error then return match end if;size=common.argument(vm,base,4);if size<=0 then return 0 end if
    written=common.writeBuffer(vm,common.argument(vm,base,3),size,matches.matchVariable(match,common.argument(vm,base,2),size),"BotMatchVariable output");if written is error then return written end if;return 0
  end if
  return error(7598,"AI chat match syscall: unsupported trap "+str(op))
end function
