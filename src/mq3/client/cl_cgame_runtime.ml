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

/// Number of recent user commands retained in the command-history ring.
const CMD_BACKUP=64
/// Number of packet records retained in the client packet-history ring.
const PACKET_BACKUP=32
/// Capacity limit for the parse entities collection or bounded storage used by this client module.
const MAX_PARSE_ENTITIES=2048
/// Capacity limit for the entities in snapshot collection or bounded storage used by this client
/// module.
const MAX_ENTITIES_IN_SNAPSHOT=256
/// Capacity limit for the configstrings collection or bounded storage used by this client module.
const MAX_CONFIGSTRINGS=1024
/// Capacity of the packed server configuration-string character storage.
const MAX_GAMESTATE_CHARS=16000
/// Server configuration-string index for systeminfo; shared by the client and game protocol.
const CS_SYSTEMINFO=1

/// Stores engine client client game runtime host-service callbacks, including `context`, `addCommandFn`, `errorFn`, `loadMapFn`, `systemInfoFn`, `debugFn` and additional values.
struct Services
  /// Caller-supplied value forwarded unchanged to the service callbacks for the engine-side CGame
  /// runtime.
  context
  /// Host callback for the add command operation; an unset callback leaves that host operation
  /// unavailable.
  addCommandFn
  /// Host callback for the error operation; an unset callback leaves that host operation unavailable.
  errorFn
  /// Host callback for the load map operation; an unset callback leaves that host operation
  /// unavailable.
  loadMapFn
  /// Host callback for the system info operation; an unset callback leaves that host operation
  /// unavailable.
  systemInfoFn
  /// Host callback for the debug operation; an unset callback leaves that host operation unavailable.
  debugFn
  /// Host callback for the clear notify operation; an unset callback leaves that host operation
  /// unavailable.
  clearNotifyFn
  /// Host callback for the close console operation; an unset callback leaves that host operation
  /// unavailable.
  closeConsoleFn
  /// Host callback for the queue console operation; an unset callback leaves that host operation
  /// unavailable.
  queueConsoleFn
  /// True when a local game server is running in the same engine instance.
  serverRunning
end struct
/// Stores engine client client game runtime entity result record, including `found`, `value`.
struct EntityResult
  /// True when the requested parse-entity state is still present in the history ring.
  found
  /// Parsed entity-state record returned by a successful history lookup; absent when the requested
  /// entity has expired from the ring buffer.
  value
end struct
/// Stores engine client client game runtime state, including `host`, `gameState`, `glconfig`, `configstrings`, `commands`, `cmdNumber` and additional values.
struct State
  /// Host-adapter callbacks and context used to execute the module's engine operations.
  host
  /// Server configuration strings and associated game-state storage.
  gameState
  /// Renderer configuration reported by the engine for the current display.
  glconfig
  /// Server configuration strings indexed by the native protocol's configuration-string identifiers.
  configstrings
  /// When constructing this record, `create` supplies `commandRing.create()` for this member. Used by
  /// `CL_GetUserCmd` and `streamClearCommands` during subsequent processing.
  commands
  /// Monotonically advancing user-command sequence number for the client.
  cmdNumber
  /// Snapshot history indexed by sequence number for interpolation and delta decoding.
  snapshots
  /// When constructing this record, `create` supplies `stream` for this member. Used by
  /// `CL_GetServerCommand` during subsequent processing.
  commandStream
  /// When constructing this record, `create` supplies `cgameUsercmd.create()` for this member. Used by
  /// `CL_SetUserCmdValue` during subsequent processing.
  usercmd
  /// When constructing this record, `create` supplies `vmState` for this member. Used by
  /// `CL_ShutdownCGame` and `CL_InitCGame` during subsequent processing.
  vm
  /// When constructing this record, `create` supplies `timingState` for this member. Used by
  /// `CL_CGameRendering` and `CL_AdjustTimeDelta` during subsequent processing.
  timing
  /// When constructing this record, `create` supplies `syscallHost` for this member. Used by
  /// `CL_CgameSystemCalls` and `wireSyscalls` during subsequent processing.
  syscallHost
  /// When constructing this record, `create` supplies `syscallVm` for this member. Used by
  /// `CL_CgameSystemCalls` and `wireSyscalls` during subsequent processing.
  syscallVm
  /// Highest server network-message sequence observed by the client.
  serverMessageSequence
  /// Highest server-command sequence already retrieved or executed by the client.
  lastExecutedServerCommand
  /// Local client slot passed to the client-game VM initialization call.
  clientNum
  /// When constructing this record, `create` supplies `0` for this member. Used by `CL_InitCGame`
  /// during subsequent processing.
  connectedToPureServer
  /// When constructing this record, `create` supplies `0` for this member. Used by `CL_InitCGame`
  /// during subsequent processing.
  vmCgame
  /// True while the client receives its game data from a recorded demo.
  demoPlaying
  /// When constructing this record, `create` supplies `0` for this member. Used by `CL_CM_LoadMap`
  /// during subsequent processing.
  mapChecksum
end struct

/// Creates the engine client client game runtime error `7760` with diagnostic text `"cl_cgame: "+message`.
/// @param message Argument 2 of `error`; passed as `"cl_cgame: "+message`.
function fail(message) return error(7760,"cl_cgame: "+message) end function
/// Creates a `mq3.client.cl_cgame_runtime.Services` record. Initializes the record with the defaults written in this constructor.
function services() return Services(void,void,void,void,void,void,void,void,void,false) end function
/// Calls `copyBytes` from engine client client game runtime `copyData`. The final path returns `output`.
/// @param value Sequence whose length/content is inspected by `copyData`.
function copyData(value)
  if typeof(value)!="bytes" then return value end if
  output=bytes(len(value),0);if len(value)>0 then copyBytes(output,0,value,0,len(value)) end if;return output
end function
/// Calls `mq3.compat.numeric.writeU32` from engine client client game runtime `defaultGameState`. The final path returns `output`.
function defaultGameState() output=bytes(cgameSyscall.GAMESTATE_SIZE,0);n.writeU32(output,20096,1);return output end function

/// Calls `mq3.client.cl_cgame_runtime.services`, `mq3.client.snapshot_command.create`, `mq3.client.server_command_stream.create` and additional helpers from engine client client game runtime `create`.
/// @param host host record passed to the engine client client game runtime helper calls.
/// @param vmState Value used by `return State(host,defaultGameState(),bytes(cgameSyscall.GLCONFIG_SIZE,0),configstrings,commandRing.create(),0,snapshots,stream,cgameUsercmd.cr...`.
/// @param timingState Value used by `if timingState==void then timingState=cgameTime.create(cgameTime.services()) end if`.
/// @param syscallHost Value used by `return State(host,defaultGameState(),bytes(cgameSyscall.GLCONFIG_SIZE,0),configstrings,commandRing.create(),0,snapshots,stream,cgameUsercmd.cr...`.
/// @param syscallVm Value used by `return State(host,defaultGameState(),bytes(cgameSyscall.GLCONFIG_SIZE,0),configstrings,commandRing.create(),0,snapshots,stream,cgameUsercmd.cr...`.
function create(host,vmState,timingState,syscallHost,syscallVm)
  if host==void then host=services() end if
  configstrings=array(MAX_CONFIGSTRINGS,"");snapshots=snapshotCommand.create();stream=serverCommands.create(void,configstrings)
  if timingState==void then timingState=cgameTime.create(cgameTime.services()) end if
  return State(host,defaultGameState(),bytes(cgameSyscall.GLCONFIG_SIZE,0),configstrings,commandRing.create(),0,snapshots,stream,cgameUsercmd.create(),vmState,timingState,syscallHost,syscallVm,0,0,0,0,0,false,0)
end function

/// Calls `mq3.client.cl_cgame_runtime.copyData` from engine client client game runtime `CL_GetGameState`. The final path returns `copyData(state.gameState)`.
/// @param state Record read through `state.gameState`.
function CL_GetGameState(state) if state==void then return fail("missing state") end if;return copyData(state.gameState) end function
/// Calls `mq3.client.cl_cgame_runtime.copyData` from engine client client game runtime `CL_GetGlconfig`. The final path returns `copyData(state.glconfig)`.
/// @param state Record read through `state.glconfig`.
function CL_GetGlconfig(state) if state==void then return fail("missing state") end if;return copyData(state.glconfig) end function

/// Calls `mq3.compat.numeric.writeU32` from engine client client game runtime `usercmdBytes`. The final path returns `output`.
/// @param command Record read through `command.serverTime`, `command.angles`, `command.buttons`, `command.weapon` and additional values.
function usercmdBytes(command)
  if command==void then return bytes(0,0) end if
  output=bytes(cgameSyscall.USERCMD_SIZE,0);n.writeU32(output,0,command.serverTime)
  for axis=0 to 2 n.writeU32(output,4+axis*4,command.angles[axis]) end for
  n.writeU32(output,16,command.buttons);output[20]=command.weapon&255;output[21]=command.forwardmove&255;output[22]=command.rightmove&255;output[23]=command.upmove&255;return output
end function
/// Calls `mq3.client.command_ring.get`, `mq3.vm.syscall_cgame.BytesResult`, `mq3.client.cl_cgame_runtime.usercmdBytes` from engine client client game runtime `CL_GetUserCmd`. The final path returns `cgameSyscall.BytesResult(true,usercmdBytes(value))`.
/// @param state Record read through `state.commands`, `state.cmdNumber`.
/// @param cmdNumber Value used by `value=commandRing.get(state.commands,state.cmdNumber,cmdNumber)`.
function CL_GetUserCmd(state,cmdNumber)
  if state==void then return fail("missing state") end if
  value=commandRing.get(state.commands,state.cmdNumber,cmdNumber);if value is error then return value end if
  if value==void then return cgameSyscall.BytesResult(false,bytes(0,0)) end if
  return cgameSyscall.BytesResult(true,usercmdBytes(value))
end function
/// Evaluates engine client client game runtime `CL_GetCurrentCmdNumber` and returns `fail("missing state")`, `state.cmdNumber` according to its guard/selection conditions.
/// @param state Record read through `state.cmdNumber`.
function CL_GetCurrentCmdNumber(state) if state==void then return fail("missing state") end if;return state.cmdNumber end function

/// Calls `mq3.client.cl_cgame_runtime.EntityResult` from engine client client game runtime `CL_GetParseEntityState`. The final path returns `EntityResult(true,parsed.parseEntities[parseEntityNumber&(MAX_PARSE_ENTITIES-1)])`.
/// @param state Record read through `state.snapshots.entityState`.
/// @param parseEntityNumber Value used by `if parseEntityNumber>=parsed.parseEntitiesNum then return fail("future parse entity") end if`.
function CL_GetParseEntityState(state,parseEntityNumber)
  if state==void then return fail("missing state") end if;parsed=state.snapshots.entityState
  if parseEntityNumber>=parsed.parseEntitiesNum then return fail("future parse entity") end if
  if parseEntityNumber<=parsed.parseEntitiesNum-MAX_PARSE_ENTITIES then return EntityResult(false,void) end if
  return EntityResult(true,parsed.parseEntities[parseEntityNumber&(MAX_PARSE_ENTITIES-1)])
end function
/// Calls `mq3.vm.syscall_cgame.SnapshotNumber` from engine client client game runtime `CL_GetCurrentSnapshotNumber`. The final path returns `cgameSyscall.SnapshotNumber(state.snapshots.snap.messageNum,state.snapshots.snap.serverTime)`.
/// @param state Record read through `state.snapshots.snap.messageNum`, `state.snapshots.snap.serverTime`.
function CL_GetCurrentSnapshotNumber(state)
  if state==void then return fail("missing state") end if
  return cgameSyscall.SnapshotNumber(state.snapshots.snap.messageNum,state.snapshots.snap.serverTime)
end function
/// Calls `mq3.compat.numeric.writeU32` from engine client client game runtime `writeWords`.
/// @param output Value used by `for index=0 to len(words)-1 n.writeU32(output,offset+index*4,words[index]) end for`.
/// @param offset Value used by `for index=0 to len(words)-1 n.writeU32(output,offset+index*4,words[index]) end for`.
/// @param words Sequence read at `words[index]`.
function writeWords(output,offset,words) for index=0 to len(words)-1 n.writeU32(output,offset+index*4,words[index]) end for;return void end function
/// Calls `fillBytes`, `mq3.compat.numeric.writeU32`, `copyBytes` and additional helpers from engine client client game runtime `encodeSnapshot`. The final path returns `output`.
/// @param snapshots Record read through `snapshots.entityState.parseEntities`.
/// @param value Record read through `value.snapFlags`, `value.ping`, `value.serverTime`, `value.areaMask` and additional values.
/// @param output Sequence whose length/content is inspected by `encodeSnapshot`.
function encodeSnapshot(snapshots,value,output)
  fillBytes(output,0,len(output),0);n.writeU32(output,0,value.snapFlags);n.writeU32(output,4,value.ping);n.writeU32(output,8,value.serverTime)
  mask=value.areaMask;if mask!=void then count=len(mask);if count>32 then count=32 end if;if count>0 then copyBytes(output,12,mask,0,count) end if end if
  writeWords(output,44,playerstate.words(value.playerState));count=value.numEntities;if count>MAX_ENTITIES_IN_SNAPSHOT then count=MAX_ENTITIES_IN_SNAPSHOT end if;n.writeU32(output,512,count)
  for index=0 to count-1 entity=snapshots.entityState.parseEntities[(value.parseEntitiesNum+index)&(MAX_PARSE_ENTITIES-1)];writeWords(output,516+index*entitystate.BYTE_SIZE,entitystate.words(entity)) end for
  n.writeU32(output,53768,value.serverCommandNum);return output
end function
/// Adapts `mq3.client.cl_cgame_runtime.encodeSnapshot` to engine client client game runtime `snapshotBytes`, returning its result for `state.snapshots, value, bytes(cgameSyscall.SNAPSHOT_SIZE,0)`.
/// @param state Record read through `state.snapshots`.
/// @param value Argument 2 of `mq3.client.cl_cgame_runtime.encodeSnapshot`.
function snapshotBytes(state,value)
  return encodeSnapshot(state.snapshots,value,bytes(cgameSyscall.SNAPSHOT_SIZE,0))
end function
/// Calls `mq3.vm.syscall_cgame.BytesResult`, `mq3.client.cl_cgame_runtime.snapshotBytes` from engine client client game runtime `CL_GetSnapshot`. The final path returns `cgameSyscall.BytesResult(true,snapshotBytes(state,value))`.
/// @param state Record read through `state.snapshots.snap`, `state.snapshots.snapshots`, `state.snapshots.entityState.parseEntitiesNum`.
/// @param snapshotNumber Value used by `if snapshotNumber>current.messageNum then return fail("future snapshot") end if`.
function CL_GetSnapshot(state,snapshotNumber)
  if state==void then return fail("missing state") end if;current=state.snapshots.snap
  if snapshotNumber>current.messageNum then return fail("future snapshot") end if
  if current.messageNum-snapshotNumber>=PACKET_BACKUP then return cgameSyscall.BytesResult(false,bytes(0,0)) end if
  value=state.snapshots.snapshots[snapshotNumber&(PACKET_BACKUP-1)]
  if value==void or not value.valid then return cgameSyscall.BytesResult(false,bytes(0,0)) end if
  if state.snapshots.entityState.parseEntitiesNum-value.parseEntitiesNum>=MAX_PARSE_ENTITIES then return cgameSyscall.BytesResult(false,bytes(0,0)) end if
  return cgameSyscall.BytesResult(true,snapshotBytes(state,value))
end function

/// Calls `mq3.client.cgame_usercmd.set` from engine client client game runtime `CL_SetUserCmdValue`. The final path returns `cgameUsercmd.set(state.usercmd,userCmdValue,sensitivityScale)`.
/// @param state Record read through `state.usercmd`.
/// @param userCmdValue Value used by `return cgameUsercmd.set(state.usercmd,userCmdValue,sensitivityScale)`.
/// @param sensitivityScale Value used by `return cgameUsercmd.set(state.usercmd,userCmdValue,sensitivityScale)`.
function CL_SetUserCmdValue(state,userCmdValue,sensitivityScale) if state==void then return fail("missing state") end if;return cgameUsercmd.set(state.usercmd,userCmdValue,sensitivityScale) end function
/// Calls `state.host.addCommandFn` from engine client client game runtime `CL_AddCgameCommand`.
/// @param state Record read through `state.host.addCommandFn`, `state.host.context`.
/// @param cmdName Value used by `if state==void or cmdName==void then return fail("invalid command") end if`.
function CL_AddCgameCommand(state,cmdName) if state==void or cmdName==void then return fail("invalid command") end if;if state.host.addCommandFn!=void then state.host.addCommandFn(state.host.context,cmdName) end if;return void end function
/// Calls `state.host.errorFn` from engine client client game runtime `CL_CgameError`.
/// @param state Record read through `state.host.errorFn`, `state.host.context`.
/// @param text Text consumed or emitted by `CL_CgameError` in the engine client client game runtime path.
function CL_CgameError(state,text)
  if state!=void and state.host.errorFn!=void then state.host.errorFn(state.host.context,text) end if
  return error(7761,text)
end function

/// Updates `state.gameState` during engine client client game runtime `packGameState`.
/// @param state Mutable engine client client game runtime record/storage; this routine assigns `state.gameState`.
function packGameState(state)
  output=bytes(cgameSyscall.GAMESTATE_SIZE,0);cursor=1
  for item=0 to MAX_CONFIGSTRINGS-1
    text=state.configstrings[item]
    if text!="" then encoded=bytes(text);if cursor+len(encoded)+1>MAX_GAMESTATE_CHARS then return fail("MAX_GAMESTATE_CHARS exceeded") end if;n.writeU32(output,item*4,cursor);copyBytes(output,4096+cursor,encoded,0,len(encoded));cursor=cursor+len(encoded)+1 end if
  end for
  n.writeU32(output,20096,cursor);state.gameState=output;return void
end function
/// Updates `state.configstrings[index]` during engine client client game runtime `rebuildGameState`.
/// @param state Mutable engine client client game runtime record/storage; this routine assigns `state.configstrings[index]`.
/// @param index Value tested by `index<0 or index>=MAX_CONFIGSTRINGS`, `if state.configstrings[index]==value` and additional values before the calculation continues.
/// @param value Value tested by `if state.configstrings[index]==value` before the calculation continues.
function rebuildGameState(state,index,value)
  if index<0 or index>=MAX_CONFIGSTRINGS then return fail("configstring index") end if
  if state.configstrings[index]==value then return false end if;state.configstrings[index]=value;packed=packGameState(state);if packed is error then return packed end if
  if index==CS_SYSTEMINFO and state.host.systemInfoFn!=void then state.host.systemInfoFn(state.host.context) end if;return true
end function
/// Calls `mq3.client.cl_cgame_runtime.rebuildGameState` from engine client client game runtime `CL_ConfigstringModified`. The final path returns `rebuildGameState(state,index,value)`.
/// @param state Shared engine client client game runtime state passed to the helper calls in `CL_ConfigstringModified`.
/// @param index Value used by `return rebuildGameState(state,index,value)`.
/// @param value Value used by `return rebuildGameState(state,index,value)`.
function CL_ConfigstringModified(state,index,value) if state==void then return fail("missing state") end if;return rebuildGameState(state,index,value) end function
/// Calls `mq3.client.cl_cgame_runtime.packGameState`, `state.host.systemInfoFn` from engine client client game runtime `streamConfig`.
/// @param state Record read through `state.host.systemInfoFn`, `state.host.context`.
/// @param index Value tested by `if index==CS_SYSTEMINFO and state.host.systemInfoFn!=void` before the calculation continues.
/// @param value Accepted for compatibility with `streamConfig`; the current implementation does not read it.
function streamConfig(state,index,value)
  packed=packGameState(state);if packed is error then return packed end if
  if index==CS_SYSTEMINFO and state.host.systemInfoFn!=void then state.host.systemInfoFn(state.host.context) end if;return true
end function
/// Adapts `mq3.client.command_ring.clear` to engine client client game runtime `streamClearCommands`, returning its result for `state.commands`.
/// @param state Record read through `state.commands`.
function streamClearCommands(state) return commandRing.clear(state.commands) end function
/// Calls `state.host.clearNotifyFn` from engine client client game runtime `streamClearNotify`.
/// @param state Record read through `state.host.clearNotifyFn`, `state.host.context`.
function streamClearNotify(state)
  if state.host.clearNotifyFn!=void then state.host.clearNotifyFn(state.host.context) end if
  return void
end function
/// Calls `state.host.closeConsoleFn` from engine client client game runtime `streamCloseConsole`.
/// @param state Record read through `state.host.closeConsoleFn`, `state.host.context`.
function streamCloseConsole(state)
  if state.host.closeConsoleFn!=void then state.host.closeConsoleFn(state.host.context) end if
  return void
end function
/// Calls `state.host.queueConsoleFn` from engine client client game runtime `streamQueueConsole`.
/// @param state Record read through `state.host.queueConsoleFn`, `state.host.context`.
/// @param text Text consumed or emitted by `streamQueueConsole` in the engine client client game runtime path.
function streamQueueConsole(state,text)
  if state.host.queueConsoleFn!=void then state.host.queueConsoleFn(state.host.context,text) end if
  return void
end function
/// Updates `state.lastExecutedServerCommand` during engine client client game runtime `CL_GetServerCommand`.
/// @param state Mutable engine client client game runtime record/storage; this routine assigns `state.lastExecutedServerCommand`.
/// @param serverCommandNumber Value used by `result=serverCommands.get(state.commandStream,host,serverCommandNumber)`.
function CL_GetServerCommand(state,serverCommandNumber)
  if state==void then return fail("missing state") end if
  host=serverCommands.services();host.context=state;host.configstringFn=streamConfig;host.systemInfoFn=void
  host.clearNotifyFn=streamClearNotify;host.clearUsercmdsFn=streamClearCommands
  host.closeConsoleFn=streamCloseConsole;host.queueConsoleFn=streamQueueConsole;host.serverRunning=state.host.serverRunning
  result=serverCommands.get(state.commandStream,host,serverCommandNumber);state.lastExecutedServerCommand=state.commandStream.lastExecuted;return result
end function
/// Updates `state.mapChecksum` during engine client client game runtime `CL_CM_LoadMap`.
/// @param state Mutable engine client client game runtime record/storage; this routine assigns `state.mapChecksum`.
/// @param mapname Value used by `if state==void or mapname==void then return fail("invalid map") end if`.
function CL_CM_LoadMap(state,mapname)
  if state==void or mapname==void then return fail("invalid map") end if
  if state.host.loadMapFn!=void then state.mapChecksum=state.host.loadMapFn(state.host.context,mapname,true) end if;return state.mapChecksum
end function
/// Calls `mq3.client.cgame_vm.shutdown` from engine client client game runtime `CL_ShutdownCGame`. The final path returns `cgameVm.shutdown(state.vm)`.
/// @param state Record read through `state.vm`.
function CL_ShutdownCGame(state) if state==void then return fail("missing state") end if;if state.vm==void then return void end if;return cgameVm.shutdown(state.vm) end function
/// Adapts `mq3.compat.numeric.i32` to engine client client game runtime `FloatAsInt`, returning its result for `n.floatBits(value)`.
/// @param value Argument 1 of `mq3.compat.numeric.i32`; passed as `n.floatBits(value)`.
function FloatAsInt(value) return n.i32(n.floatBits(value)) end function
/// Calls `mq3.vm.syscall_cgame.dispatch` from engine client client game runtime `CL_CgameSystemCalls`. The final path returns `cgameSyscall.dispatch(state.syscallHost,state.syscallVm,base)`.
/// @param state Record read through `state.syscallHost`, `state.syscallVm`.
/// @param base Value used by `return cgameSyscall.dispatch(state.syscallHost,state.syscallVm,base)`.
function CL_CgameSystemCalls(state,base)
  if state==void or state.syscallHost==void or state.syscallVm==void then return fail("syscall bridge unavailable") end if
  return cgameSyscall.dispatch(state.syscallHost,state.syscallVm,base)
end function
/// Calls `mq3.client.cgame_vm.initialize` from engine client client game runtime `CL_InitCGame`.
/// @param state Record read through `state.vm`, `state.serverMessageSequence`, `state.lastExecutedServerCommand`, `state.clientNum` and additional values.
function CL_InitCGame(state)
  if state==void or state.vm==void then return fail("cgame VM unavailable") end if
  return cgameVm.initialize(state.vm,state.serverMessageSequence,state.lastExecutedServerCommand,state.clientNum,state.connectedToPureServer,state.vmCgame)
end function
/// Calls `mq3.client.cgame_vm.consoleCommand` from engine client client game runtime `CL_GameCommand`. The final path returns `cgameVm.consoleCommand(state.vm)`.
/// @param state Record read through `state.vm`.
function CL_GameCommand(state) if state==void or state.vm==void then return false end if;return cgameVm.consoleCommand(state.vm) end function
/// Calls `mq3.client.cgame_vm.drawActiveFrame` from engine client client game runtime `CL_CGameRendering`. The final path returns `cgameVm.drawActiveFrame(state.vm,state.timing.serverTime,stereo,state.demoPlaying)`.
/// @param state Record read through `state.vm`, `state.timing.serverTime`, `state.demoPlaying`.
/// @param stereo Value used by `return cgameVm.drawActiveFrame(state.vm,state.timing.serverTime,stereo,state.demoPlaying)`.
function CL_CGameRendering(state,stereo)
  if state==void or state.vm==void then return fail("cgame VM unavailable") end if
  return cgameVm.drawActiveFrame(state.vm,state.timing.serverTime,stereo,state.demoPlaying)
end function
/// Calls `mq3.client.cgame_time.adjustTimeDelta` from engine client client game runtime `CL_AdjustTimeDelta`. The final path returns `cgameTime.adjustTimeDelta(state.timing)`.
/// @param state Record read through `state.timing`.
function CL_AdjustTimeDelta(state) if state==void or state.timing==void then return fail("timing unavailable") end if;return cgameTime.adjustTimeDelta(state.timing) end function
/// Calls `mq3.client.cgame_time.firstSnapshot` from engine client client game runtime `CL_FirstSnapshot`. The final path returns `cgameTime.firstSnapshot(state.timing)`.
/// @param state Record read through `state.timing`.
function CL_FirstSnapshot(state) if state==void or state.timing==void then return fail("timing unavailable") end if;return cgameTime.firstSnapshot(state.timing) end function
/// Calls `mq3.client.cgame_time.setCGameTime` from engine client client game runtime `CL_SetCGameTime`. The final path returns `cgameTime.setCGameTime(state.timing)`.
/// @param state Record read through `state.timing`.
function CL_SetCGameTime(state) if state==void or state.timing==void then return fail("timing unavailable") end if;return cgameTime.setCGameTime(state.timing) end function

/// Adapts `mq3.client.cl_cgame_runtime.CL_GetGameState` to engine client client game runtime `syscallGameState`, returning its result for `state`.
/// @param state Argument 1 of `mq3.client.cl_cgame_runtime.CL_GetGameState`.
function syscallGameState(state) return CL_GetGameState(state) end function
/// Adapts `mq3.client.cl_cgame_runtime.CL_GetGlconfig` to engine client client game runtime `syscallGlconfig`, returning its result for `state`.
/// @param state Argument 1 of `mq3.client.cl_cgame_runtime.CL_GetGlconfig`.
function syscallGlconfig(state) return CL_GetGlconfig(state) end function
/// Adapts `mq3.client.cl_cgame_runtime.CL_GetCurrentSnapshotNumber` to engine client client game runtime `syscallSnapshotNumber`, returning its result for `state`.
/// @param state Argument 1 of `mq3.client.cl_cgame_runtime.CL_GetCurrentSnapshotNumber`.
function syscallSnapshotNumber(state) return CL_GetCurrentSnapshotNumber(state) end function
/// Adapts `mq3.client.cl_cgame_runtime.CL_GetSnapshot` to engine client client game runtime `syscallSnapshot`, returning its result for `state, number`.
/// @param state Argument 1 of `mq3.client.cl_cgame_runtime.CL_GetSnapshot`.
/// @param number Argument 2 of `mq3.client.cl_cgame_runtime.CL_GetSnapshot`.
function syscallSnapshot(state,number) return CL_GetSnapshot(state,number) end function
/// Adapts `mq3.client.cl_cgame_runtime.CL_GetServerCommand` to engine client client game runtime `syscallServerCommand`, returning its result for `state, number`.
/// @param state Argument 1 of `mq3.client.cl_cgame_runtime.CL_GetServerCommand`.
/// @param number Argument 2 of `mq3.client.cl_cgame_runtime.CL_GetServerCommand`.
function syscallServerCommand(state,number) return CL_GetServerCommand(state,number) end function
/// Adapts `mq3.client.cl_cgame_runtime.CL_GetCurrentCmdNumber` to engine client client game runtime `syscallCommandNumber`, returning its result for `state`.
/// @param state Argument 1 of `mq3.client.cl_cgame_runtime.CL_GetCurrentCmdNumber`.
function syscallCommandNumber(state) return CL_GetCurrentCmdNumber(state) end function
/// Adapts `mq3.client.cl_cgame_runtime.CL_GetUserCmd` to engine client client game runtime `syscallUserCmd`, returning its result for `state, number`.
/// @param state Argument 1 of `mq3.client.cl_cgame_runtime.CL_GetUserCmd`.
/// @param number Argument 2 of `mq3.client.cl_cgame_runtime.CL_GetUserCmd`.
function syscallUserCmd(state,number) return CL_GetUserCmd(state,number) end function
/// Adapts `mq3.client.cl_cgame_runtime.CL_SetUserCmdValue` to engine client client game runtime `syscallSetUserCmd`, returning its result for `state, value, sensitivity`.
/// @param state Argument 1 of `mq3.client.cl_cgame_runtime.CL_SetUserCmdValue`.
/// @param value Argument 2 of `mq3.client.cl_cgame_runtime.CL_SetUserCmdValue`.
/// @param sensitivity Argument 3 of `mq3.client.cl_cgame_runtime.CL_SetUserCmdValue`.
function syscallSetUserCmd(state,value,sensitivity) return CL_SetUserCmdValue(state,value,sensitivity) end function
/// Updates `host.context`, `host.getGameStateFn`, `host.getGlconfigFn`, `host.getCurrentSnapshotNumberFn` and additional values during engine client client game runtime `wireSyscalls`.
/// @param state Mutable engine client client game runtime record/storage; this routine assigns `state.syscallHost`, `state.syscallVm`.
/// @param host Mutable engine client client game runtime record/storage; this routine assigns `host.context`, `host.getGameStateFn`, `host.getGlconfigFn`, `host.getCurrentSnapshotNumberFn` and additional values.
/// @param machine Value assigned to `state.syscallVm`.
function wireSyscalls(state,host,machine)
  if state==void or host==void or machine==void then return fail("invalid syscall wiring") end if;host.context=state
  host.getGameStateFn=syscallGameState;host.getGlconfigFn=syscallGlconfig;host.getCurrentSnapshotNumberFn=syscallSnapshotNumber;host.getSnapshotFn=syscallSnapshot
  host.getServerCommandFn=syscallServerCommand;host.getCurrentCmdNumberFn=syscallCommandNumber;host.getUserCmdFn=syscallUserCmd;host.setUserCmdValueFn=syscallSetUserCmd
  state.syscallHost=host;state.syscallVm=machine;return cgameSyscall.callback(host)
end function
