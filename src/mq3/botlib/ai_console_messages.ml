// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Bot console-message heap and FIFO operations from be_ai_chat.c.
package mq3.botlib.ai_console_messages

import mq3.botlib.ai_resource_pools as resources
import mq3.botlib.lifecycle_runtime as botlibRuntime
import mq3.vm.syscall_common as common
import mq3.compat.numeric as n

const OP_QUEUE_CONSOLE_MESSAGE=509
const OP_REMOVE_CONSOLE_MESSAGE=510
const OP_NEXT_CONSOLE_MESSAGE=511
const OP_NUM_CONSOLE_MESSAGE=512
// be_ai_chat.c obtains this from LibVarValue("max_messages", "1024").
const DEFAULT_MAX_MESSAGES=1024
// Compatibility name for callers that used the old fixed-capacity constant.
const MAX_CONSOLE_MESSAGES=DEFAULT_MAX_MESSAGES
const MAX_MESSAGE_SIZE=256
const CONSOLE_MESSAGE_SIZE=276

struct Message slot handle time type data end struct
struct State pools nodes freeSlots time capacity end struct

function initialFreeSlots(capacity) values=[];for index=0 to capacity-1 values=values+[index] end for;return values end function
function createWithCapacity(pools,capacity)
  if capacity<=0 then return error(7591,"AI console message heap capacity must be positive") end if
  return State(pools,array(capacity,void),initialFreeSlots(capacity),0.0,capacity)
end function
function create(pools) return createWithCapacity(pools,DEFAULT_MAX_MESSAGES) end function
function setTime(state,time) if state!=void then state.time=time end if;return 0 end function
function popFree(state)
  if state==void or len(state.freeSlots)==0 then return -1 end if;slot=state.freeSlots[0]
  if len(state.freeSlots)==1 then state.freeSlots=[] else next=[];for index=1 to len(state.freeSlots)-1 next=next+[state.freeSlots[index]] end for;state.freeSlots=next end if;return slot
end function
function messageData(text)
  result=bytes(MAX_MESSAGE_SIZE,0);encoded=bytes(text);count=len(encoded);if count>MAX_MESSAGE_SIZE then count=MAX_MESSAGE_SIZE end if;if count>0 then copyBytes(result,0,encoded,0,count) end if;return result
end function
function messageText(message)
  if message==void then return "" end if;count=0;while count<MAX_MESSAGE_SIZE and message.data[count]!=0 count=count+1 end while;return decode(slice(message.data,0,count))
end function
function queue(state,chatHandle,type,text)
  chat=resources.chatState(state.pools,chatHandle);if chat==void then return 0 end if;slot=popFree(state);if slot<0 then return 0 end if
  chat.handle=chat.handle+1;if chat.handle<=0 or chat.handle>8192 then chat.handle=1 end if
  message=Message(slot,chat.handle,state.time,type,messageData(text));state.nodes[slot]=message;chat.consoleMessages=chat.consoleMessages+[slot];chat.numConsoleMessages=chat.numConsoleMessages+1;return message.handle
end function
function freeSlot(state,slot)
  if slot<0 or slot>=state.capacity or state.nodes[slot]==void then return 0 end if;state.nodes[slot]=void;state.freeSlots=[slot]+state.freeSlots;return 1
end function
function remove(state,chatHandle,messageHandle)
  chat=resources.chatState(state.pools,chatHandle);if chat==void then return 0 end if;remaining=[];removed=false
  for each slot in chat.consoleMessages message=state.nodes[slot];if not removed and message!=void and message.handle==messageHandle then freeSlot(state,slot);removed=true else remaining=remaining+[slot] end if end for
  if removed then chat.consoleMessages=remaining;chat.numConsoleMessages=chat.numConsoleMessages-1 end if;return 0
end function
function next(state,chatHandle)
  chat=resources.chatState(state.pools,chatHandle);if chat==void or len(chat.consoleMessages)==0 then return void end if
  message=state.nodes[chat.consoleMessages[0]];if message==void then return void end if
  return Message(-1,message.handle,message.time,message.type,slice(message.data,0,MAX_MESSAGE_SIZE))
end function
function count(state,chatHandle) chat=resources.chatState(state.pools,chatHandle);if chat==void then return 0 end if;return chat.numConsoleMessages end function
function clearChat(state,chatHandle)
  chat=resources.chatState(state.pools,chatHandle);if chat==void then return 0 end if;for each slot in chat.consoleMessages freeSlot(state,slot) end for;chat.consoleMessages=[];chat.numConsoleMessages=0;return 0
end function
// Mirrors InitConsoleMessageHeap: discard the previous heap and rebuild the
// free list at the max_messages capacity. Chat queues are cleared first so no
// state retains a slot from the discarded heap.
function configure(state,capacity)
  if state==void then return error(7591,"AI console message heap state missing") end if
  if capacity<=0 then return error(7591,"AI console message heap capacity must be positive") end if
  for handle=1 to resources.MAX_CLIENTS clearChat(state,handle) end for
  state.capacity=capacity;state.nodes=array(capacity,void);state.freeSlots=initialFreeSlots(capacity);return capacity
end function
function configureFromBotlib(state,botlib)
  return configure(state,botlibRuntime.integerVariable(botlib,"max_messages",DEFAULT_MAX_MESSAGES))
end function
function shutdown(state)
  if state==void then return 0 end if;for handle=1 to resources.MAX_CLIENTS clearChat(state,handle) end for;state.nodes=array(state.capacity,void);state.freeSlots=initialFreeSlots(state.capacity);return 0
end function
function writeMessage(vm,address,message)
  at=common.pointer(vm,address,CONSOLE_MESSAGE_SIZE,"bot_consolemessage_t output");n.writeU32(vm.data,at,message.handle);n.writeU32(vm.data,at+4,n.floatBits(message.time));n.writeU32(vm.data,at+8,message.type);copyBytes(vm.data,at+12,message.data,0,MAX_MESSAGE_SIZE);n.writeU32(vm.data,at+268,0);n.writeU32(vm.data,at+272,0);return message.handle
end function
function dispatch(state,vm,base,op)
  chatHandle=common.argument(vm,base,1)
  if op==OP_QUEUE_CONSOLE_MESSAGE then text=common.readString(vm,common.argument(vm,base,3));if text is error then return text end if;queue(state,chatHandle,common.argument(vm,base,2),text);return 0 end if
  if op==OP_REMOVE_CONSOLE_MESSAGE then return remove(state,chatHandle,common.argument(vm,base,2)) end if
  if op==OP_NEXT_CONSOLE_MESSAGE then message=next(state,chatHandle);if message==void then return 0 end if;return writeMessage(vm,common.argument(vm,base,2),message) end if
  if op==OP_NUM_CONSOLE_MESSAGE then return count(state,chatHandle) end if
  return error(7591,"AI console message syscall: unsupported trap "+str(op))
end function
