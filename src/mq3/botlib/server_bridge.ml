// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Engine-side bot traps from server/sv_game.c and server/sv_bot.c.
package mq3.botlib.server_bridge

import mq3.game.entitystate as entitystate
import mq3.vm.syscall_qagame_world as qworld
import mq3.vm.syscall_common as common
import mq3.compat.numeric as n
import std.ds.list as lists

const OP_GET_SNAPSHOT_ENTITY=209
const OP_GET_CONSOLE_MESSAGE=210
const OP_USER_COMMAND=211
const MAX_RELIABLE_COMMANDS=64
const USERCMD_SIZE=24

struct Client snapshotEntities reliableCommands reliableSequence reliableAcknowledge lastPacketTime userCommand pending end struct
struct State clients now lastFrameTime end struct
struct ConsoleResult available text end struct

function emptyClient() return Client([],array(MAX_RELIABLE_COMMANDS,""),0,0,0,void,false) end function
function create(maxClients)
  if maxClients<1 then return error(7580,"bot server bridge: client capacity must be positive") end if
  clients=array(maxClients,void);for index=0 to maxClients-1 clients[index]=emptyClient() end for;return State(clients,0,-1)
end function
function clientAt(state,client)
  if state==void or client<0 or client>=len(state.clients) then return void end if;return state.clients[client]
end function
function setTime(state,time) if state!=void then state.now=time end if;return 0 end function
function resetClient(state,client)
  if state==void or client<0 or client>=len(state.clients) then return error(7580,"bot server bridge: invalid reset client") end if
  state.clients[client]=emptyClient();return 0
end function
function publishSnapshot(state,client,entities)
  value=clientAt(state,client);if value==void then return error(7580,"bot server bridge: invalid snapshot client") end if
  capacity=0;if entities!=void then capacity=len(entities) end if;copied=lists.List.withCapacity(capacity)
  if entities!=void then for each entity in entities if entity==void then return error(7580,"bot server bridge: missing snapshot entity") end if;copied.add(entitystate.copy(entity)) end for end if
  value.snapshotEntities=copied.toArray();return len(value.snapshotEntities)
end function
function snapshotEntity(state,client,sequence)
  value=clientAt(state,client);if value==void or sequence<0 or sequence>=len(value.snapshotEntities) then return -1 end if
  return value.snapshotEntities[sequence].number
end function
function snapshotEntityState(state,client,sequence)
  value=clientAt(state,client);if value==void or sequence<0 or sequence>=len(value.snapshotEntities) then return void end if
  return entitystate.copy(value.snapshotEntities[sequence])
end function
function queueConsoleMessage(state,client,text)
  value=clientAt(state,client);if value==void then return error(7580,"bot server bridge: invalid console client") end if
  value.reliableSequence=value.reliableSequence+1;value.reliableCommands[value.reliableSequence&(MAX_RELIABLE_COMMANDS-1)]=text
  // SV_AddServerCommand normally disconnects a client on overflow.  The local
  // bridge retains the same finite ring while keeping the most recent entries.
  if value.reliableSequence-value.reliableAcknowledge>MAX_RELIABLE_COMMANDS then value.reliableAcknowledge=value.reliableSequence-MAX_RELIABLE_COMMANDS end if
  return value.reliableSequence
end function
function nextConsoleMessage(state,client)
  value=clientAt(state,client);if value==void then return ConsoleResult(false,"") end if;value.lastPacketTime=state.now
  if value.reliableAcknowledge==value.reliableSequence then return ConsoleResult(false,"") end if
  value.reliableAcknowledge=value.reliableAcknowledge+1;text=value.reliableCommands[value.reliableAcknowledge&(MAX_RELIABLE_COMMANDS-1)]
  if text=="" then return ConsoleResult(false,"") end if;return ConsoleResult(true,text)
end function
function signedByte(value) if value>=128 then return value-256 end if;return value end function
function readUserCommand(vm,address)
  at=common.pointer(vm,address,USERCMD_SIZE,"bot usercmd_t")
  return qworld.userCommand(n.readI32(vm.data,at),[n.readI32(vm.data,at+4),n.readI32(vm.data,at+8),n.readI32(vm.data,at+12)],n.readI32(vm.data,at+16),vm.data[at+20],signedByte(vm.data[at+21]),signedByte(vm.data[at+22]),signedByte(vm.data[at+23]))
end function
function submitUserCommand(state,client,command)
  value=clientAt(state,client);if value==void or command==void then return error(7580,"bot server bridge: invalid user command client") end if
  value.userCommand=qworld.userCommand(command.serverTime,[command.angles[0],command.angles[1],command.angles[2]],command.buttons,command.weapon,command.forwardmove,command.rightmove,command.upmove);value.pending=true;return 0
end function
function takePending(state)
  if state==void then return [] end if;result=lists.List.withCapacity(len(state.clients))
  for client=0 to len(state.clients)-1 value=state.clients[client];if value.pending then result.add([client,value.userCommand]);value.pending=false end if end for;return result.toArray()
end function
function dispatch(state,vm,base,op)
  client=common.argument(vm,base,1)
  if op==OP_GET_SNAPSHOT_ENTITY then return snapshotEntity(state,client,common.argument(vm,base,2)) end if
  if op==OP_GET_CONSOLE_MESSAGE then
    address=common.argument(vm,base,2);capacity=common.argument(vm,base,3);if capacity<=0 then return error(7581,"bot server bridge syscall: console capacity must be positive") end if
    result=nextConsoleMessage(state,client);if not result.available then return 0 end if
    written=common.writeBuffer(vm,address,capacity,result.text,"bot console message");if written is error then return written end if;return 1
  end if
  if op==OP_USER_COMMAND then command=readUserCommand(vm,common.argument(vm,base,2));if command is error then return command end if;return submitUserCommand(state,client,command) end if
  return error(7581,"bot server bridge syscall: unsupported trap "+str(op))
end function
