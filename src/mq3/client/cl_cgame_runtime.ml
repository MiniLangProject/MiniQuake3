// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Stateful C-named facade for client/cl_cgame.c.  The facade owns the exact
// client rings and ABI layouts while delegating VM, command and clock work to
// the productive client modules.
package mq3.client.cl_cgame_runtime

import mq3.compat.numeric as n
import mq3.client.command_ring as commandRing
import mq3.client.snapshot_command as snapshotCommand
import mq3.client.snapshot_parse as snapshotParse
import mq3.client.server_command_stream as serverCommands
import mq3.client.cgame_usercmd as cgameUsercmd
import mq3.client.cgame_vm as cgameVm
import mq3.client.cgame_time as cgameTime
import mq3.vm.syscall_cgame as cgameSyscall
import mq3.game.playerstate as playerstate
import mq3.game.entitystate as entitystate

const CMD_BACKUP=64
const PACKET_BACKUP=32
const MAX_PARSE_ENTITIES=2048
const MAX_ENTITIES_IN_SNAPSHOT=256
const MAX_CONFIGSTRINGS=1024
const MAX_GAMESTATE_CHARS=16000
const CS_SYSTEMINFO=1

struct Services
  context
  addCommandFn
  errorFn
  loadMapFn
  systemInfoFn
  debugFn
  clearNotifyFn
  closeConsoleFn
  queueConsoleFn
  serverRunning
end struct
struct EntityResult found value end struct
struct State
  host
  gameState
  glconfig
  configstrings
  commands
  cmdNumber
  snapshots
  commandStream
  usercmd
  vm
  timing
  syscallHost
  syscallVm
  serverMessageSequence
  lastExecutedServerCommand
  clientNum
  connectedToPureServer
  vmCgame
  demoPlaying
  mapChecksum
end struct

function fail(message) return error(7760,"cl_cgame: "+message) end function
function services() return Services(void,void,void,void,void,void,void,void,void,false) end function
function copyData(value)
  if typeof(value)!="bytes" then return value end if
  output=bytes(len(value),0);if len(value)>0 then copyBytes(output,0,value,0,len(value)) end if;return output
end function
function defaultGameState() output=bytes(cgameSyscall.GAMESTATE_SIZE,0);n.writeU32(output,20096,1);return output end function

function create(host,vmState,timingState,syscallHost,syscallVm)
  if host==void then host=services() end if
  configstrings=array(MAX_CONFIGSTRINGS,"");snapshots=snapshotCommand.create();stream=serverCommands.create(void,configstrings)
  if timingState==void then timingState=cgameTime.create(cgameTime.services()) end if
  return State(host,defaultGameState(),bytes(cgameSyscall.GLCONFIG_SIZE,0),configstrings,commandRing.create(),0,snapshots,stream,cgameUsercmd.create(),vmState,timingState,syscallHost,syscallVm,0,0,0,0,0,false,0)
end function

function CL_GetGameState(state) if state==void then return fail("missing state") end if;return copyData(state.gameState) end function
function CL_GetGlconfig(state) if state==void then return fail("missing state") end if;return copyData(state.glconfig) end function

function usercmdBytes(command)
  if command==void then return bytes(0,0) end if
  output=bytes(cgameSyscall.USERCMD_SIZE,0);n.writeU32(output,0,command.serverTime)
  for axis=0 to 2 n.writeU32(output,4+axis*4,command.angles[axis]) end for
  n.writeU32(output,16,command.buttons);output[20]=command.weapon&255;output[21]=command.forwardmove&255;output[22]=command.rightmove&255;output[23]=command.upmove&255;return output
end function
function CL_GetUserCmd(state,cmdNumber)
  if state==void then return fail("missing state") end if
  value=commandRing.get(state.commands,state.cmdNumber,cmdNumber);if value is error then return value end if
  if value==void then return cgameSyscall.BytesResult(false,bytes(0,0)) end if
  return cgameSyscall.BytesResult(true,usercmdBytes(value))
end function
function CL_GetCurrentCmdNumber(state) if state==void then return fail("missing state") end if;return state.cmdNumber end function

function CL_GetParseEntityState(state,parseEntityNumber)
  if state==void then return fail("missing state") end if;parsed=state.snapshots.entityState
  if parseEntityNumber>=parsed.parseEntitiesNum then return fail("future parse entity") end if
  if parseEntityNumber<=parsed.parseEntitiesNum-MAX_PARSE_ENTITIES then return EntityResult(false,void) end if
  return EntityResult(true,parsed.parseEntities[parseEntityNumber&(MAX_PARSE_ENTITIES-1)])
end function
function CL_GetCurrentSnapshotNumber(state)
  if state==void then return fail("missing state") end if
  return cgameSyscall.SnapshotNumber(state.snapshots.snap.messageNum,state.snapshots.snap.serverTime)
end function
function writeWords(output,offset,words) for index=0 to len(words)-1 n.writeU32(output,offset+index*4,words[index]) end for;return void end function
function snapshotBytes(state,value)
  output=bytes(cgameSyscall.SNAPSHOT_SIZE,0);n.writeU32(output,0,value.snapFlags);n.writeU32(output,4,value.ping);n.writeU32(output,8,value.serverTime)
  mask=value.areaMask;if mask!=void then count=len(mask);if count>32 then count=32 end if;if count>0 then copyBytes(output,12,mask,0,count) end if end if
  writeWords(output,44,playerstate.words(value.playerState));count=value.numEntities;if count>MAX_ENTITIES_IN_SNAPSHOT then count=MAX_ENTITIES_IN_SNAPSHOT end if;n.writeU32(output,512,count)
  for index=0 to count-1 entity=state.snapshots.entityState.parseEntities[(value.parseEntitiesNum+index)&(MAX_PARSE_ENTITIES-1)];writeWords(output,516+index*entitystate.BYTE_SIZE,entitystate.words(entity)) end for
  n.writeU32(output,53768,value.serverCommandNum);return output
end function
function CL_GetSnapshot(state,snapshotNumber)
  if state==void then return fail("missing state") end if;current=state.snapshots.snap
  if snapshotNumber>current.messageNum then return fail("future snapshot") end if
  if current.messageNum-snapshotNumber>=PACKET_BACKUP then return cgameSyscall.BytesResult(false,bytes(0,0)) end if
  value=state.snapshots.snapshots[snapshotNumber&(PACKET_BACKUP-1)]
  if value==void or not value.valid then return cgameSyscall.BytesResult(false,bytes(0,0)) end if
  if state.snapshots.entityState.parseEntitiesNum-value.parseEntitiesNum>=MAX_PARSE_ENTITIES then return cgameSyscall.BytesResult(false,bytes(0,0)) end if
  return cgameSyscall.BytesResult(true,snapshotBytes(state,value))
end function

function CL_SetUserCmdValue(state,userCmdValue,sensitivityScale) if state==void then return fail("missing state") end if;return cgameUsercmd.set(state.usercmd,userCmdValue,sensitivityScale) end function
function CL_AddCgameCommand(state,cmdName) if state==void or cmdName==void then return fail("invalid command") end if;if state.host.addCommandFn!=void then state.host.addCommandFn(state.host.context,cmdName) end if;return void end function
function CL_CgameError(state,text)
  if state!=void and state.host.errorFn!=void then state.host.errorFn(state.host.context,text) end if
  return error(7761,text)
end function

function packGameState(state)
  output=bytes(cgameSyscall.GAMESTATE_SIZE,0);cursor=1
  for item=0 to MAX_CONFIGSTRINGS-1
    text=state.configstrings[item]
    if text!="" then encoded=bytes(text);if cursor+len(encoded)+1>MAX_GAMESTATE_CHARS then return fail("MAX_GAMESTATE_CHARS exceeded") end if;n.writeU32(output,item*4,cursor);copyBytes(output,4096+cursor,encoded,0,len(encoded));cursor=cursor+len(encoded)+1 end if
  end for
  n.writeU32(output,20096,cursor);state.gameState=output;return void
end function
function rebuildGameState(state,index,value)
  if index<0 or index>=MAX_CONFIGSTRINGS then return fail("configstring index") end if
  if state.configstrings[index]==value then return false end if;state.configstrings[index]=value;packed=packGameState(state);if packed is error then return packed end if
  if index==CS_SYSTEMINFO and state.host.systemInfoFn!=void then state.host.systemInfoFn(state.host.context) end if;return true
end function
function CL_ConfigstringModified(state,index,value) if state==void then return fail("missing state") end if;return rebuildGameState(state,index,value) end function
function streamConfig(state,index,value)
  packed=packGameState(state);if packed is error then return packed end if
  if index==CS_SYSTEMINFO and state.host.systemInfoFn!=void then state.host.systemInfoFn(state.host.context) end if;return true
end function
function streamClearCommands(state) return commandRing.clear(state.commands) end function
function streamClearNotify(state)
  if state.host.clearNotifyFn!=void then state.host.clearNotifyFn(state.host.context) end if
  return void
end function
function streamCloseConsole(state)
  if state.host.closeConsoleFn!=void then state.host.closeConsoleFn(state.host.context) end if
  return void
end function
function streamQueueConsole(state,text)
  if state.host.queueConsoleFn!=void then state.host.queueConsoleFn(state.host.context,text) end if
  return void
end function
function CL_GetServerCommand(state,serverCommandNumber)
  if state==void then return fail("missing state") end if
  host=serverCommands.services();host.context=state;host.configstringFn=streamConfig;host.systemInfoFn=void
  host.clearNotifyFn=streamClearNotify;host.clearUsercmdsFn=streamClearCommands
  host.closeConsoleFn=streamCloseConsole;host.queueConsoleFn=streamQueueConsole;host.serverRunning=state.host.serverRunning
  result=serverCommands.get(state.commandStream,host,serverCommandNumber);state.lastExecutedServerCommand=state.commandStream.lastExecuted;return result
end function
function CL_CM_LoadMap(state,mapname)
  if state==void or mapname==void then return fail("invalid map") end if
  if state.host.loadMapFn!=void then state.mapChecksum=state.host.loadMapFn(state.host.context,mapname,true) end if;return state.mapChecksum
end function
function CL_ShutdownCGame(state) if state==void then return fail("missing state") end if;if state.vm==void then return void end if;return cgameVm.shutdown(state.vm) end function
function FloatAsInt(value) return n.i32(n.floatBits(value)) end function
function CL_CgameSystemCalls(state,base)
  if state==void or state.syscallHost==void or state.syscallVm==void then return fail("syscall bridge unavailable") end if
  return cgameSyscall.dispatch(state.syscallHost,state.syscallVm,base)
end function
function CL_InitCGame(state)
  if state==void or state.vm==void then return fail("cgame VM unavailable") end if
  return cgameVm.initialize(state.vm,state.serverMessageSequence,state.lastExecutedServerCommand,state.clientNum,state.connectedToPureServer,state.vmCgame)
end function
function CL_GameCommand(state) if state==void or state.vm==void then return false end if;return cgameVm.consoleCommand(state.vm) end function
function CL_CGameRendering(state,stereo)
  if state==void or state.vm==void then return fail("cgame VM unavailable") end if
  return cgameVm.drawActiveFrame(state.vm,state.timing.serverTime,stereo,state.demoPlaying)
end function
function CL_AdjustTimeDelta(state) if state==void or state.timing==void then return fail("timing unavailable") end if;return cgameTime.adjustTimeDelta(state.timing) end function
function CL_FirstSnapshot(state) if state==void or state.timing==void then return fail("timing unavailable") end if;return cgameTime.firstSnapshot(state.timing) end function
function CL_SetCGameTime(state) if state==void or state.timing==void then return fail("timing unavailable") end if;return cgameTime.setCGameTime(state.timing) end function

function syscallGameState(state) return CL_GetGameState(state) end function
function syscallGlconfig(state) return CL_GetGlconfig(state) end function
function syscallSnapshotNumber(state) return CL_GetCurrentSnapshotNumber(state) end function
function syscallSnapshot(state,number) return CL_GetSnapshot(state,number) end function
function syscallServerCommand(state,number) return CL_GetServerCommand(state,number) end function
function syscallCommandNumber(state) return CL_GetCurrentCmdNumber(state) end function
function syscallUserCmd(state,number) return CL_GetUserCmd(state,number) end function
function syscallSetUserCmd(state,value,sensitivity) return CL_SetUserCmdValue(state,value,sensitivity) end function
function wireSyscalls(state,host,machine)
  if state==void or host==void or machine==void then return fail("invalid syscall wiring") end if;host.context=state
  host.getGameStateFn=syscallGameState;host.getGlconfigFn=syscallGlconfig;host.getCurrentSnapshotNumberFn=syscallSnapshotNumber;host.getSnapshotFn=syscallSnapshot
  host.getServerCommandFn=syscallServerCommand;host.getCurrentCmdNumberFn=syscallCommandNumber;host.getUserCmdFn=syscallUserCmd;host.setUserCmdValueFn=syscallSetUserCmd
  state.syscallHost=host;state.syscallVm=machine;return cgameSyscall.callback(host)
end function
