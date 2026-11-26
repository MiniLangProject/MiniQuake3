// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native MiniLang wrapper ABI for code/cgame/cg_syscalls.c.
package mq3.client.cgame_syscalls

import mq3.compat.numeric as numeric
import mq3.vm.syscall_cgame as syscallCgame

/// CG engine-syscall ordinal used to print text through the engine console.
const CG_PRINT=0
/// CG engine-syscall ordinal used to raise an engine error.
const CG_ERROR=1
/// CG engine-syscall ordinal used to query the engine millisecond timer.
const CG_MILLISECONDS=2
/// CG engine-syscall ordinal used to register a configuration variable.
const CG_CVAR_REGISTER=3
/// CG engine-syscall ordinal used to refresh a mirrored configuration variable.
const CG_CVAR_UPDATE=4
/// CG engine-syscall ordinal used to set a configuration variable.
const CG_CVAR_SET=5
/// CG engine-syscall ordinal used to read a configuration variable as text.
const CG_CVAR_VARIABLESTRINGBUFFER=6
/// CG engine-syscall ordinal used to query the number of console-command arguments.
const CG_ARGC=7
/// CG engine-syscall ordinal used to read a console-command argument.
const CG_ARGV=8
/// CG engine-syscall ordinal used to read the remaining console-command argument text.
const CG_ARGS=9
/// CG engine-syscall ordinal used to open a file in the virtual filesystem.
const CG_FS_FOPENFILE=10
/// CG engine-syscall ordinal used to read bytes from a virtual file.
const CG_FS_READ=11
/// CG engine-syscall ordinal used to write bytes to a virtual file.
const CG_FS_WRITE=12
/// CG engine-syscall ordinal used to close a virtual file.
const CG_FS_FCLOSEFILE=13
/// CG engine-syscall ordinal used to queue an engine console command.
const CG_SENDCONSOLECOMMAND=14
/// CG engine-syscall ordinal used to register a console-command name.
const CG_ADDCOMMAND=15
/// CG engine-syscall ordinal used to send a reliable client command to the server.
const CG_SENDCLIENTCOMMAND=16
/// CG engine-syscall ordinal used to request an immediate screen update.
const CG_UPDATESCREEN=17
/// CG engine-syscall ordinal used to load the map's collision world.
const CG_CM_LOADMAP=18
/// CG engine-syscall ordinal used to query the number of inline collision models.
const CG_CM_NUMINLINEMODELS=19
/// CG engine-syscall ordinal used to resolve an inline collision-model handle.
const CG_CM_INLINEMODEL=20
/// CG engine-syscall ordinal used to load a collision model.
const CG_CM_LOADMODEL=21
/// CG engine-syscall ordinal used to construct a temporary box collision model.
const CG_CM_TEMPBOXMODEL=22
/// CG engine-syscall ordinal used to query collision contents at a world position.
const CG_CM_POINTCONTENTS=23
/// CG engine-syscall ordinal used to query point contents in a transformed model.
const CG_CM_TRANSFORMEDPOINTCONTENTS=24
/// CG engine-syscall ordinal used to sweep a box through the collision world.
const CG_CM_BOXTRACE=25
/// CG engine-syscall ordinal used to sweep a box against a transformed collision model.
const CG_CM_TRANSFORMEDBOXTRACE=26
/// CG engine-syscall ordinal used to clip decal geometry against world surfaces.
const CG_CM_MARKFRAGMENTS=27
/// CG engine-syscall ordinal used to play a positional sound event.
const CG_S_STARTSOUND=28
/// CG engine-syscall ordinal used to play a non-positional local sound.
const CG_S_STARTLOCALSOUND=29
/// CG engine-syscall ordinal used to clear the frame's looping-sound submissions.
const CG_S_CLEARLOOPINGSOUNDS=30
/// CG engine-syscall ordinal used to submit an entity's looping positional sound.
const CG_S_ADDLOOPINGSOUND=31
/// CG engine-syscall ordinal used to update an entity position used for sound spatialization.
const CG_S_UPDATEENTITYPOSITION=32
/// CG engine-syscall ordinal used to update the listener origin and orientation.
const CG_S_RESPATIALIZE=33
/// CG engine-syscall ordinal used to register a sound resource.
const CG_S_REGISTERSOUND=34
/// CG engine-syscall ordinal used to start the background music introduction and loop tracks.
const CG_S_STARTBACKGROUNDTRACK=35
/// CG engine-syscall ordinal used to load the level's renderer world data.
const CG_R_LOADWORLDMAP=36
/// CG engine-syscall ordinal used to register a model resource.
const CG_R_REGISTERMODEL=37
/// CG engine-syscall ordinal used to register a skin resource.
const CG_R_REGISTERSKIN=38
/// CG engine-syscall ordinal used to register a shader resource.
const CG_R_REGISTERSHADER=39
/// CG engine-syscall ordinal used to clear the renderer's pending scene.
const CG_R_CLEARSCENE=40
/// CG engine-syscall ordinal used to append a renderer entity to the pending scene.
const CG_R_ADDREFENTITYTOSCENE=41
/// CG engine-syscall ordinal used to append a polygon to the pending scene.
const CG_R_ADDPOLYTOSCENE=42
/// CG engine-syscall ordinal used to append a dynamic light to the pending scene.
const CG_R_ADDLIGHTTOSCENE=43
/// CG engine-syscall ordinal used to render the accumulated scene through a view definition.
const CG_R_RENDERSCENE=44
/// CG engine-syscall ordinal used to set the color modulation used by subsequent 2D drawing.
const CG_R_SETCOLOR=45
/// CG engine-syscall ordinal used to draw a shader-backed rectangle with texture coordinates.
const CG_R_DRAWSTRETCHPIC=46
/// CG engine-syscall ordinal used to query a model's axis-aligned bounds.
const CG_R_MODELBOUNDS=47
/// CG engine-syscall ordinal used to interpolate an attachment tag between model animation frames.
const CG_R_LERPTAG=48
/// CG engine-syscall ordinal used to read the renderer configuration.
const CG_GETGLCONFIG=49
/// CG engine-syscall ordinal used to read server configuration strings.
const CG_GETGAMESTATE=50
/// CG engine-syscall ordinal used to query the latest available snapshot sequence and server time.
const CG_GETCURRENTSNAPSHOTNUMBER=51
/// CG engine-syscall ordinal used to read a server snapshot.
const CG_GETSNAPSHOT=52
/// CG engine-syscall ordinal used to read a reliable server command.
const CG_GETSERVERCOMMAND=53
/// CG engine-syscall ordinal used to query the latest local user-command sequence.
const CG_GETCURRENTCMDNUMBER=54
/// CG engine-syscall ordinal used to read a local user command.
const CG_GETUSERCMD=55
/// CG engine-syscall ordinal used to set the CGame value and sensitivity multiplier attached to user
/// commands.
const CG_SETUSERCMDVALUE=56
/// CG engine-syscall ordinal used to register a shader without mipmapped image sampling.
const CG_R_REGISTERSHADERNOMIP=57
/// CG engine-syscall ordinal used to query remaining VM memory.
const CG_MEMORY_REMAINING=58
/// CG engine-syscall ordinal used to register a font resource and its glyph metrics.
const CG_R_REGISTERFONT=59
/// CG engine-syscall ordinal used to query whether an engine key is currently pressed.
const CG_KEY_ISDOWN=60
/// CG engine-syscall ordinal used to read the active input-capture bitmask.
const CG_KEY_GETCATCHER=61
/// CG engine-syscall ordinal used to replace the active input-capture bitmask.
const CG_KEY_SETCATCHER=62
/// CG engine-syscall ordinal used to find a key bound to a command.
const CG_KEY_GETKEY=63
/// CG engine-syscall ordinal used to add a preprocessor definition to the script parser.
const CG_PC_ADD_GLOBAL_DEFINE=64
/// CG engine-syscall ordinal used to open a script-parser source handle.
const CG_PC_LOAD_SOURCE=65
/// CG engine-syscall ordinal used to release a script-parser source handle.
const CG_PC_FREE_SOURCE=66
/// CG engine-syscall ordinal used to read the next preprocessed source token.
const CG_PC_READ_TOKEN=67
/// CG engine-syscall ordinal used to query the source location for a parser handle.
const CG_PC_SOURCE_FILE_AND_LINE=68
/// CG engine-syscall ordinal used to stop background music playback.
const CG_S_STOPBACKGROUNDTRACK=69
/// CG engine-syscall ordinal used to read the host calendar and clock.
const CG_REAL_TIME=70
/// CG engine-syscall ordinal used to round a vector using the native protocol convention.
const CG_SNAPVECTOR=71
/// CG engine-syscall ordinal used to unregister a console-command name.
const CG_REMOVECOMMAND=72
/// CG engine-syscall ordinal used to sample renderer lighting at a world position.
const CG_R_LIGHTFORPOINT=73
/// CG engine-syscall ordinal used to open and start a cinematic stream.
const CG_CIN_PLAYCINEMATIC=74
/// CG engine-syscall ordinal used to stop a cinematic stream.
const CG_CIN_STOPCINEMATIC=75
/// CG engine-syscall ordinal used to advance a cinematic decoder.
const CG_CIN_RUNCINEMATIC=76
/// CG engine-syscall ordinal used to draw the current cinematic frame.
const CG_CIN_DRAWCINEMATIC=77
/// CG engine-syscall ordinal used to set a cinematic's screen rectangle.
const CG_CIN_SETEXTENTS=78
/// CG engine-syscall ordinal used to remap a shader to a replacement shader and time offset.
const CG_R_REMAP_SHADER=79
/// CG engine-syscall ordinal used to submit a continuous looping positional sound.
const CG_S_ADDREALLOOPINGSOUND=80
/// CG engine-syscall ordinal used to stop the looping sound associated with an entity.
const CG_S_STOPLOOPINGSOUND=81
/// CG engine-syscall ordinal used to construct a temporary capsule collision model.
const CG_CM_TEMPCAPSULEMODEL=82
/// CG engine-syscall ordinal used to sweep a capsule through the collision world.
const CG_CM_CAPSULETRACE=83
/// CG engine-syscall ordinal used to sweep a capsule against a transformed collision model.
const CG_CM_TRANSFORMEDCAPSULETRACE=84
/// CG engine-syscall ordinal used to append an additive dynamic light to the pending scene.
const CG_R_ADDADDITIVELIGHTTOSCENE=85
/// CG engine-syscall ordinal used to read the next map-entity token.
const CG_GET_ENTITY_TOKEN=86
/// CG engine-syscall ordinal used to append several polygons to the pending scene.
const CG_R_ADDPOLYSTOSCENE=87
/// CG engine-syscall ordinal used to test renderer potential visibility between positions.
const CG_R_INPVS=88
/// CG engine-syscall ordinal used to seek within a virtual file.
const CG_FS_SEEK=89
// These three were shipped commented out in both cg_public.h and cg_syscalls.c.
// Their dormant sequential ABI slots are kept so the Ledger candidates remain callable.
const CG_LOADCAMERA=90
/// CG engine-syscall ordinal used to start playback of a scripted camera sequence.
const CG_STARTCAMERA=91
/// CG engine-syscall ordinal used to read position and view data from the camera system.
const CG_GETCAMERAINFO=92
/// CG engine-syscall ordinal used to print an integer through the VM diagnostic interface.
const CG_TESTPRINTINT=109
/// CG engine-syscall ordinal used to print a floating-point value through the VM diagnostic interface.
const CG_TESTPRINTFLOAT=110

/// Stores client game syscalls invocation record, including `opcode`, `arguments`, `result`, `dispatched`.
struct Invocation
  /// When constructing this record, `invoke` supplies `opcode` for this member.
  opcode
  /// When constructing this record, `invoke` supplies `arguments` for this member.
  arguments
  /// When constructing this record, `invoke` supplies `0` for this member.
  result
  /// True when this recorded CGame syscall invocation is dispatched through the native host gateway.
  dispatched
end struct
/// Stores client game syscalls gateway record, including `context`, `syscallFn`, `retailActive`, `calls`.
struct Gateway
  /// Caller-supplied value forwarded unchanged to the service callbacks for the CGame syscall gateway.
  context
  /// Host callback for the syscall operation; an unset callback leaves that host operation unavailable.
  syscallFn
  /// True when the retail QVM owns the CGame syscall gateway, so the native observer records requests
  /// without emitting duplicate host effects.
  retailActive
  /// When constructing this record, `dllEntry` supplies an empty list for this member. Used by `invoke`
  /// during subsequent processing.
  calls
end struct
/// Stores client game syscalls dispatcher context record, including `host`, `vm`, `base`.
struct DispatcherContext
  /// Host-adapter callbacks and context used to execute the module's engine operations.
  host
  /// When constructing this record, `qvmGateway` supplies `vm` for this member.
  vm
  /// When constructing this record, `qvmGateway` supplies `base` for this member.
  base
end struct

/// Creates the client game syscalls error `7904` with diagnostic text `"cgame syscalls: "+message`.
/// @param message Argument 2 of `error`; passed as `"cgame syscalls: "+message`.
function fail(message) return error(7904,"cgame syscalls: "+message) end function

// dllEntry
/// @param context context record passed to the client game syscalls helper calls.
/// @param syscallFn Callback invoked by `dllEntry` for syscall.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function dllEntry(context,syscallFn,retailActive)
  if syscallFn==void then return fail("missing syscall entry") end if
  return Gateway(context,syscallFn,retailActive,[])
end function

/// Updates `gateway.calls` during client game syscalls `invoke`.
/// @param gateway Mutable client game syscalls record/storage; this routine assigns `gateway.calls`.
/// @param opcode Value used by `if gateway.retailActive then gateway.calls=gateway.calls+[Invocation(opcode,arguments,0,false)]`.
/// @param arguments Value used by `if arguments==void then arguments=[] end if`.
function invoke(gateway,opcode,arguments)
  if gateway==void or gateway.syscallFn==void then return fail("uninitialized syscall entry") end if
  if arguments==void then arguments=[] end if
  if gateway.retailActive then gateway.calls=gateway.calls+[Invocation(opcode,arguments,0,false)];return 0 end if
  result=gateway.syscallFn(gateway.context,[opcode]+arguments);if result is error then return result end if
  gateway.calls=gateway.calls+[Invocation(opcode,arguments,result,true)];return result
end function

/// Calls `mq3.compat.numeric.writeU32`, `mq3.vm.syscall_cgame.dispatch` from client game syscalls `dispatchExisting`. The final path returns `syscallCgame.dispatch(context.host,context.vm,context.base)`.
/// @param context Record read through `context.vm`, `context.host`, `context.base`, `context.vm.data`.
/// @param words Sequence read at `words[index]`.
function dispatchExisting(context,words)
  if context==void or context.vm==void or context.host==void then return fail("invalid existing dispatcher context") end if
  if context.base<0 or context.base+len(words)*4>len(context.vm.data) then return fail("argument vector outside VM memory") end if
  if len(words)>0 then for index=0 to len(words)-1 numeric.writeU32(context.vm.data,context.base+index*4,words[index]) end for end if
  return syscallCgame.dispatch(context.host,context.vm,context.base)
end function
/// Adapts `mq3.client.cgame_syscalls.dllEntry` to client game syscalls `qvmGateway`, returning its result for `DispatcherContext(host,vm,base), dispatchExisting, retailActive`.
/// @param host Argument 1 of `mq3.client.cgame_syscalls.dllEntry`; passed as `DispatcherContext(host,vm,base)`.
/// @param vm Argument 1 of `mq3.client.cgame_syscalls.dllEntry`; passed as `DispatcherContext(host,vm,base)`.
/// @param base Argument 1 of `mq3.client.cgame_syscalls.dllEntry`; passed as `DispatcherContext(host,vm,base)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_syscalls.dllEntry`.
function qvmGateway(host,vm,base,retailActive) return dllEntry(DispatcherContext(host,vm,base),dispatchExisting,retailActive) end function

// PASSFLOAT
/// @param value Argument 1 of `mq3.compat.numeric.i32`; passed as `numeric.floatBits(numeric.f32(value))`.
function PASSFLOAT(value) return numeric.i32(numeric.floatBits(numeric.f32(value))) end function

// trap_Print
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param fmt Value used by `invoke(gateway,CG_PRINT,[fmt])`.
function trap_Print(gateway,fmt) invoke(gateway,CG_PRINT,[fmt]);return void end function
// trap_Error
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param fmt Value used by `invoke(gateway,CG_ERROR,[fmt])`.
function trap_Error(gateway,fmt) invoke(gateway,CG_ERROR,[fmt]);return void end function
// trap_Milliseconds
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
function trap_Milliseconds(gateway) return invoke(gateway,CG_MILLISECONDS,[]) end function
// trap_Cvar_Register
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param vmCvar Value used by `invoke(gateway,CG_CVAR_REGISTER,[vmCvar,varName,defaultValue,flags])`.
/// @param varName Value used by `invoke(gateway,CG_CVAR_REGISTER,[vmCvar,varName,defaultValue,flags])`.
/// @param defaultValue Value used by `invoke(gateway,CG_CVAR_REGISTER,[vmCvar,varName,defaultValue,flags])`.
/// @param flags Value used by `invoke(gateway,CG_CVAR_REGISTER,[vmCvar,varName,defaultValue,flags])`.
function trap_Cvar_Register(gateway,vmCvar,varName,defaultValue,flags) invoke(gateway,CG_CVAR_REGISTER,[vmCvar,varName,defaultValue,flags]);return void end function
// trap_Cvar_Update
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param vmCvar Value used by `invoke(gateway,CG_CVAR_UPDATE,[vmCvar])`.
function trap_Cvar_Update(gateway,vmCvar) invoke(gateway,CG_CVAR_UPDATE,[vmCvar]);return void end function
// trap_Cvar_Set
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param varName Value used by `invoke(gateway,CG_CVAR_SET,[varName,value])`.
/// @param value Value used by `invoke(gateway,CG_CVAR_SET,[varName,value])`.
function trap_Cvar_Set(gateway,varName,value) invoke(gateway,CG_CVAR_SET,[varName,value]);return void end function
// trap_Cvar_VariableStringBuffer
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param varName Value used by `invoke(gateway,CG_CVAR_VARIABLESTRINGBUFFER,[varName,buffer,bufsize])`.
/// @param buffer Value used by `invoke(gateway,CG_CVAR_VARIABLESTRINGBUFFER,[varName,buffer,bufsize])`.
/// @param bufsize Value used by `invoke(gateway,CG_CVAR_VARIABLESTRINGBUFFER,[varName,buffer,bufsize])`.
function trap_Cvar_VariableStringBuffer(gateway,varName,buffer,bufsize) invoke(gateway,CG_CVAR_VARIABLESTRINGBUFFER,[varName,buffer,bufsize]);return void end function
// trap_Argc
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
function trap_Argc(gateway) return invoke(gateway,CG_ARGC,[]) end function
// trap_Argv
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param index Value used by `invoke(gateway,CG_ARGV,[index,buffer,bufferLength])`.
/// @param buffer Value used by `invoke(gateway,CG_ARGV,[index,buffer,bufferLength])`.
/// @param bufferLength Value used by `invoke(gateway,CG_ARGV,[index,buffer,bufferLength])`.
function trap_Argv(gateway,index,buffer,bufferLength) invoke(gateway,CG_ARGV,[index,buffer,bufferLength]);return void end function
// trap_Args
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param buffer Value used by `invoke(gateway,CG_ARGS,[buffer,bufferLength])`.
/// @param bufferLength Value used by `invoke(gateway,CG_ARGS,[buffer,bufferLength])`.
function trap_Args(gateway,buffer,bufferLength) invoke(gateway,CG_ARGS,[buffer,bufferLength]);return void end function
// trap_FS_FOpenFile
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param qpath Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[qpath,fileHandle,mode]`.
/// @param fileHandle Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[qpath,fileHandle,mode]`.
/// @param mode Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[qpath,fileHandle,mode]`.
function trap_FS_FOpenFile(gateway,qpath,fileHandle,mode) return invoke(gateway,CG_FS_FOPENFILE,[qpath,fileHandle,mode]) end function
// trap_FS_Read
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param buffer Value used by `invoke(gateway,CG_FS_READ,[buffer,length,fileHandle])`.
/// @param length Value used by `invoke(gateway,CG_FS_READ,[buffer,length,fileHandle])`.
/// @param fileHandle Value used by `invoke(gateway,CG_FS_READ,[buffer,length,fileHandle])`.
function trap_FS_Read(gateway,buffer,length,fileHandle) invoke(gateway,CG_FS_READ,[buffer,length,fileHandle]);return void end function
// trap_FS_Write
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param buffer Value used by `invoke(gateway,CG_FS_WRITE,[buffer,length,fileHandle])`.
/// @param length Value used by `invoke(gateway,CG_FS_WRITE,[buffer,length,fileHandle])`.
/// @param fileHandle Value used by `invoke(gateway,CG_FS_WRITE,[buffer,length,fileHandle])`.
function trap_FS_Write(gateway,buffer,length,fileHandle) invoke(gateway,CG_FS_WRITE,[buffer,length,fileHandle]);return void end function
// trap_FS_FCloseFile
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param fileHandle Value used by `invoke(gateway,CG_FS_FCLOSEFILE,[fileHandle])`.
function trap_FS_FCloseFile(gateway,fileHandle) invoke(gateway,CG_FS_FCLOSEFILE,[fileHandle]);return void end function
// trap_FS_Seek
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param fileHandle Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[fileHandle,offset,origin]`.
/// @param offset Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[fileHandle,offset,origin]`.
/// @param origin World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_syscalls.invoke`.
function trap_FS_Seek(gateway,fileHandle,offset,origin) return invoke(gateway,CG_FS_SEEK,[fileHandle,offset,origin]) end function
// trap_SendConsoleCommand
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param text Text consumed or emitted by `trap_SendConsoleCommand` in the client game syscalls path.
function trap_SendConsoleCommand(gateway,text) invoke(gateway,CG_SENDCONSOLECOMMAND,[text]);return void end function
// trap_AddCommand
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param cmdName Value used by `invoke(gateway,CG_ADDCOMMAND,[cmdName])`.
function trap_AddCommand(gateway,cmdName) invoke(gateway,CG_ADDCOMMAND,[cmdName]);return void end function
// trap_RemoveCommand
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param cmdName Value used by `invoke(gateway,CG_REMOVECOMMAND,[cmdName])`.
function trap_RemoveCommand(gateway,cmdName) invoke(gateway,CG_REMOVECOMMAND,[cmdName]);return void end function
// trap_SendClientCommand
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param text Text consumed or emitted by `trap_SendClientCommand` in the client game syscalls path.
function trap_SendClientCommand(gateway,text) invoke(gateway,CG_SENDCLIENTCOMMAND,[text]);return void end function
// trap_UpdateScreen
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
function trap_UpdateScreen(gateway) invoke(gateway,CG_UPDATESCREEN,[]);return void end function
// trap_CM_LoadMap
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param mapname Value used by `invoke(gateway,CG_CM_LOADMAP,[mapname])`.
function trap_CM_LoadMap(gateway,mapname) invoke(gateway,CG_CM_LOADMAP,[mapname]);return void end function
// trap_CM_NumInlineModels
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
function trap_CM_NumInlineModels(gateway) return invoke(gateway,CG_CM_NUMINLINEMODELS,[]) end function
// trap_CM_InlineModel
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param index Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[index]`.
function trap_CM_InlineModel(gateway,index) return invoke(gateway,CG_CM_INLINEMODEL,[index]) end function
// trap_CM_TempBoxModel
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param mins Minimum X, Y and Z coordinates of the axis-aligned bounds. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param maxs Maximum X, Y and Z coordinates of the axis-aligned bounds. Forwarded to `mq3.client.cgame_syscalls.invoke`.
function trap_CM_TempBoxModel(gateway,mins,maxs) return invoke(gateway,CG_CM_TEMPBOXMODEL,[mins,maxs]) end function
// trap_CM_TempCapsuleModel
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param mins Minimum X, Y and Z coordinates of the axis-aligned bounds. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param maxs Maximum X, Y and Z coordinates of the axis-aligned bounds. Forwarded to `mq3.client.cgame_syscalls.invoke`.
function trap_CM_TempCapsuleModel(gateway,mins,maxs) return invoke(gateway,CG_CM_TEMPCAPSULEMODEL,[mins,maxs]) end function
// trap_CM_PointContents
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param point Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[point,model]`.
/// @param model Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[point,model]`.
function trap_CM_PointContents(gateway,point,model) return invoke(gateway,CG_CM_POINTCONTENTS,[point,model]) end function
// trap_CM_TransformedPointContents
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param point Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[point,model,origin,angles]`.
/// @param model Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[point,model,origin,angles]`.
/// @param origin World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param angles Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[point,model,origin,angles]`.
function trap_CM_TransformedPointContents(gateway,point,model,origin,angles) return invoke(gateway,CG_CM_TRANSFORMEDPOINTCONTENTS,[point,model,origin,angles]) end function
// trap_CM_BoxTrace
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param results Value used by `invoke(gateway,CG_CM_BOXTRACE,[results,start,endPoint,mins,maxs,model,brushmask])`.
/// @param start Value used by `invoke(gateway,CG_CM_BOXTRACE,[results,start,endPoint,mins,maxs,model,brushmask])`.
/// @param endPoint Ending world-space point of the segment or trace.
/// @param mins Minimum X, Y and Z coordinates of the axis-aligned bounds.
/// @param maxs Maximum X, Y and Z coordinates of the axis-aligned bounds.
/// @param model Model handle, asset or preview record used by this client game syscalls operation.
/// @param brushmask Value used by `invoke(gateway,CG_CM_BOXTRACE,[results,start,endPoint,mins,maxs,model,brushmask])`.
function trap_CM_BoxTrace(gateway,results,start,endPoint,mins,maxs,model,brushmask) invoke(gateway,CG_CM_BOXTRACE,[results,start,endPoint,mins,maxs,model,brushmask]);return void end function
// trap_CM_CapsuleTrace
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param results Value used by `invoke(gateway,CG_CM_CAPSULETRACE,[results,start,endPoint,mins,maxs,model,brushmask])`.
/// @param start Value used by `invoke(gateway,CG_CM_CAPSULETRACE,[results,start,endPoint,mins,maxs,model,brushmask])`.
/// @param endPoint Ending world-space point of the segment or trace.
/// @param mins Minimum X, Y and Z coordinates of the axis-aligned bounds.
/// @param maxs Maximum X, Y and Z coordinates of the axis-aligned bounds.
/// @param model Model handle, asset or preview record used by this client game syscalls operation.
/// @param brushmask Value used by `invoke(gateway,CG_CM_CAPSULETRACE,[results,start,endPoint,mins,maxs,model,brushmask])`.
function trap_CM_CapsuleTrace(gateway,results,start,endPoint,mins,maxs,model,brushmask) invoke(gateway,CG_CM_CAPSULETRACE,[results,start,endPoint,mins,maxs,model,brushmask]);return void end function
// trap_CM_TransformedBoxTrace
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param results Value used by `invoke(gateway,CG_CM_TRANSFORMEDBOXTRACE,[results,start,endPoint,mins,maxs,model,brushmask,origin,angles])`.
/// @param start Value used by `invoke(gateway,CG_CM_TRANSFORMEDBOXTRACE,[results,start,endPoint,mins,maxs,model,brushmask,origin,angles])`.
/// @param endPoint Ending world-space point of the segment or trace.
/// @param mins Minimum X, Y and Z coordinates of the axis-aligned bounds.
/// @param maxs Maximum X, Y and Z coordinates of the axis-aligned bounds.
/// @param model Model handle, asset or preview record used by this client game syscalls operation.
/// @param brushmask Value used by `invoke(gateway,CG_CM_TRANSFORMEDBOXTRACE,[results,start,endPoint,mins,maxs,model,brushmask,origin,angles])`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param angles Value used by `invoke(gateway,CG_CM_TRANSFORMEDBOXTRACE,[results,start,endPoint,mins,maxs,model,brushmask,origin,angles])`.
function trap_CM_TransformedBoxTrace(gateway,results,start,endPoint,mins,maxs,model,brushmask,origin,angles) invoke(gateway,CG_CM_TRANSFORMEDBOXTRACE,[results,start,endPoint,mins,maxs,model,brushmask,origin,angles]);return void end function
// trap_CM_TransformedCapsuleTrace
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param results Value used by `invoke(gateway,CG_CM_TRANSFORMEDCAPSULETRACE,[results,start,endPoint,mins,maxs,model,brushmask,origin,angles])`.
/// @param start Value used by `invoke(gateway,CG_CM_TRANSFORMEDCAPSULETRACE,[results,start,endPoint,mins,maxs,model,brushmask,origin,angles])`.
/// @param endPoint Ending world-space point of the segment or trace.
/// @param mins Minimum X, Y and Z coordinates of the axis-aligned bounds.
/// @param maxs Maximum X, Y and Z coordinates of the axis-aligned bounds.
/// @param model Model handle, asset or preview record used by this client game syscalls operation.
/// @param brushmask Value used by `invoke(gateway,CG_CM_TRANSFORMEDCAPSULETRACE,[results,start,endPoint,mins,maxs,model,brushmask,origin,angles])`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param angles Value used by `invoke(gateway,CG_CM_TRANSFORMEDCAPSULETRACE,[results,start,endPoint,mins,maxs,model,brushmask,origin,angles])`.
function trap_CM_TransformedCapsuleTrace(gateway,results,start,endPoint,mins,maxs,model,brushmask,origin,angles) invoke(gateway,CG_CM_TRANSFORMEDCAPSULETRACE,[results,start,endPoint,mins,maxs,model,brushmask,origin,angles]);return void end function
// trap_CM_MarkFragments
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param numPoints Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[numPoints,points,projection,maxPoints,pointBuffer,maxFragments,fragmentBuffer]`.
/// @param points Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[numPoints,points,projection,maxPoints,pointBuffer,maxFragments,fragmentBuffer]`.
/// @param projection Projection parameters used to convert camera-space geometry to screen coordinates. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param maxPoints Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[numPoints,points,projection,maxPoints,pointBuffer,maxFragments,fragmentBuffer]`.
/// @param pointBuffer Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[numPoints,points,projection,maxPoints,pointBuffer,maxFragments,fragmentBuffer]`.
/// @param maxFragments Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[numPoints,points,projection,maxPoints,pointBuffer,maxFragments,fragmentBuffer]`.
/// @param fragmentBuffer Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[numPoints,points,projection,maxPoints,pointBuffer,maxFragments,fragmentBuffer]`.
function trap_CM_MarkFragments(gateway,numPoints,points,projection,maxPoints,pointBuffer,maxFragments,fragmentBuffer) return invoke(gateway,CG_CM_MARKFRAGMENTS,[numPoints,points,projection,maxPoints,pointBuffer,maxFragments,fragmentBuffer]) end function
// trap_S_StartSound
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param entityNum Entity number identifying a world or player entity.
/// @param entityChannel Value used by `invoke(gateway,CG_S_STARTSOUND,[origin,entityNum,entityChannel,sfx])`.
/// @param sfx Value used by `invoke(gateway,CG_S_STARTSOUND,[origin,entityNum,entityChannel,sfx])`.
function trap_S_StartSound(gateway,origin,entityNum,entityChannel,sfx) invoke(gateway,CG_S_STARTSOUND,[origin,entityNum,entityChannel,sfx]);return void end function
// trap_S_StartLocalSound
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param sfx Value used by `invoke(gateway,CG_S_STARTLOCALSOUND,[sfx,channelNum])`.
/// @param channelNum Value used by `invoke(gateway,CG_S_STARTLOCALSOUND,[sfx,channelNum])`.
function trap_S_StartLocalSound(gateway,sfx,channelNum) invoke(gateway,CG_S_STARTLOCALSOUND,[sfx,channelNum]);return void end function
// trap_S_ClearLoopingSounds
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param killAll Value used by `invoke(gateway,CG_S_CLEARLOOPINGSOUNDS,[killAll])`.
function trap_S_ClearLoopingSounds(gateway,killAll) invoke(gateway,CG_S_CLEARLOOPINGSOUNDS,[killAll]);return void end function
// trap_S_AddLoopingSound
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param entityNum Entity number identifying a world or player entity.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param velocity Velocity vector used to advance or orient the effect.
/// @param sfx Value used by `invoke(gateway,CG_S_ADDLOOPINGSOUND,[entityNum,origin,velocity,sfx])`.
function trap_S_AddLoopingSound(gateway,entityNum,origin,velocity,sfx) invoke(gateway,CG_S_ADDLOOPINGSOUND,[entityNum,origin,velocity,sfx]);return void end function
// trap_S_AddRealLoopingSound
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param entityNum Entity number identifying a world or player entity.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param velocity Velocity vector used to advance or orient the effect.
/// @param sfx Value used by `invoke(gateway,CG_S_ADDREALLOOPINGSOUND,[entityNum,origin,velocity,sfx])`.
function trap_S_AddRealLoopingSound(gateway,entityNum,origin,velocity,sfx) invoke(gateway,CG_S_ADDREALLOOPINGSOUND,[entityNum,origin,velocity,sfx]);return void end function
// trap_S_StopLoopingSound
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param entityNum Entity number identifying a world or player entity.
function trap_S_StopLoopingSound(gateway,entityNum) invoke(gateway,CG_S_STOPLOOPINGSOUND,[entityNum]);return void end function
// trap_S_UpdateEntityPosition
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param entityNum Entity number identifying a world or player entity.
/// @param origin World-space origin of the entity, sound or rendered effect.
function trap_S_UpdateEntityPosition(gateway,entityNum,origin) invoke(gateway,CG_S_UPDATEENTITYPOSITION,[entityNum,origin]);return void end function
// trap_S_Respatialize
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param entityNum Entity number identifying a world or player entity.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param axis Value used by `invoke(gateway,CG_S_RESPATIALIZE,[entityNum,origin,axis,inWater])`.
/// @param inWater Value used by `invoke(gateway,CG_S_RESPATIALIZE,[entityNum,origin,axis,inWater])`.
function trap_S_Respatialize(gateway,entityNum,origin,axis,inWater) invoke(gateway,CG_S_RESPATIALIZE,[entityNum,origin,axis,inWater]);return void end function
// trap_S_RegisterSound
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param sample Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[sample,compressed]`.
/// @param compressed Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[sample,compressed]`.
function trap_S_RegisterSound(gateway,sample,compressed) return invoke(gateway,CG_S_REGISTERSOUND,[sample,compressed]) end function
// trap_S_StartBackgroundTrack
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param intro Value used by `invoke(gateway,CG_S_STARTBACKGROUNDTRACK,[intro,loopName])`.
/// @param loopName Value used by `invoke(gateway,CG_S_STARTBACKGROUNDTRACK,[intro,loopName])`.
function trap_S_StartBackgroundTrack(gateway,intro,loopName) invoke(gateway,CG_S_STARTBACKGROUNDTRACK,[intro,loopName]);return void end function
// trap_S_StopBackgroundTrack
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
function trap_S_StopBackgroundTrack(gateway) invoke(gateway,CG_S_STOPBACKGROUNDTRACK,[]);return void end function
// trap_R_LoadWorldMap
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param mapname Value used by `invoke(gateway,CG_R_LOADWORLDMAP,[mapname])`.
function trap_R_LoadWorldMap(gateway,mapname) invoke(gateway,CG_R_LOADWORLDMAP,[mapname]);return void end function
// trap_R_RegisterModel
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param name Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[name]`.
function trap_R_RegisterModel(gateway,name) return invoke(gateway,CG_R_REGISTERMODEL,[name]) end function
// trap_R_RegisterSkin
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param name Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[name]`.
function trap_R_RegisterSkin(gateway,name) return invoke(gateway,CG_R_REGISTERSKIN,[name]) end function
// trap_R_RegisterShader
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param name Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[name]`.
function trap_R_RegisterShader(gateway,name) return invoke(gateway,CG_R_REGISTERSHADER,[name]) end function
// trap_R_RegisterShaderNoMip
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param name Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[name]`.
function trap_R_RegisterShaderNoMip(gateway,name) return invoke(gateway,CG_R_REGISTERSHADERNOMIP,[name]) end function
// trap_R_RegisterFont
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param fontName Value used by `invoke(gateway,CG_R_REGISTERFONT,[fontName,pointSize,font])`.
/// @param pointSize Value used by `invoke(gateway,CG_R_REGISTERFONT,[fontName,pointSize,font])`.
/// @param font Value used by `invoke(gateway,CG_R_REGISTERFONT,[fontName,pointSize,font])`.
function trap_R_RegisterFont(gateway,fontName,pointSize,font) invoke(gateway,CG_R_REGISTERFONT,[fontName,pointSize,font]);return void end function
// trap_R_ClearScene
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
function trap_R_ClearScene(gateway) invoke(gateway,CG_R_CLEARSCENE,[]);return void end function
// trap_R_AddRefEntityToScene
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param refEntity Value used by `invoke(gateway,CG_R_ADDREFENTITYTOSCENE,[refEntity])`.
function trap_R_AddRefEntityToScene(gateway,refEntity) invoke(gateway,CG_R_ADDREFENTITYTOSCENE,[refEntity]);return void end function
// trap_R_AddPolyToScene
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param shader Shader handle or asset name selected for this draw operation.
/// @param numVerts Value used by `invoke(gateway,CG_R_ADDPOLYTOSCENE,[shader,numVerts,verts])`.
/// @param verts Value used by `invoke(gateway,CG_R_ADDPOLYTOSCENE,[shader,numVerts,verts])`.
function trap_R_AddPolyToScene(gateway,shader,numVerts,verts) invoke(gateway,CG_R_ADDPOLYTOSCENE,[shader,numVerts,verts]);return void end function
// trap_R_AddPolysToScene
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param shader Shader handle or asset name selected for this draw operation.
/// @param numVerts Value used by `invoke(gateway,CG_R_ADDPOLYSTOSCENE,[shader,numVerts,verts,num])`.
/// @param verts Value used by `invoke(gateway,CG_R_ADDPOLYSTOSCENE,[shader,numVerts,verts,num])`.
/// @param num Value used by `invoke(gateway,CG_R_ADDPOLYSTOSCENE,[shader,numVerts,verts,num])`.
function trap_R_AddPolysToScene(gateway,shader,numVerts,verts,num) invoke(gateway,CG_R_ADDPOLYSTOSCENE,[shader,numVerts,verts,num]);return void end function
// trap_R_LightForPoint
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param point Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[point,ambientLight,directedLight,lightDir]`.
/// @param ambientLight Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[point,ambientLight,directedLight,lightDir]`.
/// @param directedLight Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[point,ambientLight,directedLight,lightDir]`.
/// @param lightDir Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[point,ambientLight,directedLight,lightDir]`.
function trap_R_LightForPoint(gateway,point,ambientLight,directedLight,lightDir) return invoke(gateway,CG_R_LIGHTFORPOINT,[point,ambientLight,directedLight,lightDir]) end function
// trap_R_AddLightToScene
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param intensity Value used by `invoke(gateway,CG_R_ADDLIGHTTOSCENE,[origin,PASSFLOAT(intensity),PASSFLOAT(red),PASSFLOAT(green),PASSFLOAT(blue)])`.
/// @param red Red color component.
/// @param green Green color component.
/// @param blue Blue color component.
function trap_R_AddLightToScene(gateway,origin,intensity,red,green,blue) invoke(gateway,CG_R_ADDLIGHTTOSCENE,[origin,PASSFLOAT(intensity),PASSFLOAT(red),PASSFLOAT(green),PASSFLOAT(blue)]);return void end function
// trap_R_AddAdditiveLightToScene
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param intensity Value used by `invoke(gateway,CG_R_ADDADDITIVELIGHTTOSCENE,[origin,PASSFLOAT(intensity),PASSFLOAT(red),PASSFLOAT(green),PASSFLOAT(blue)])`.
/// @param red Red color component.
/// @param green Green color component.
/// @param blue Blue color component.
function trap_R_AddAdditiveLightToScene(gateway,origin,intensity,red,green,blue) invoke(gateway,CG_R_ADDADDITIVELIGHTTOSCENE,[origin,PASSFLOAT(intensity),PASSFLOAT(red),PASSFLOAT(green),PASSFLOAT(blue)]);return void end function
// trap_R_RenderScene
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param refdef Value used by `invoke(gateway,CG_R_RENDERSCENE,[refdef])`.
function trap_R_RenderScene(gateway,refdef) invoke(gateway,CG_R_RENDERSCENE,[refdef]);return void end function
// trap_R_SetColor
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param rgba Value used by `invoke(gateway,CG_R_SETCOLOR,[rgba])`.
function trap_R_SetColor(gateway,rgba) invoke(gateway,CG_R_SETCOLOR,[rgba]);return void end function
// trap_R_DrawStretchPic
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param x Horizontal coordinate in the coordinate space used by `trap_R_DrawStretchPic`.
/// @param y Vertical coordinate in the coordinate space used by `trap_R_DrawStretchPic`.
/// @param width Width in the coordinate space used by `trap_R_DrawStretchPic`.
/// @param height Height in the coordinate space used by `trap_R_DrawStretchPic`.
/// @param s1 Value used by `invoke(gateway,CG_R_DRAWSTRETCHPIC,[PASSFLOAT(x),PASSFLOAT(y),PASSFLOAT(width),PASSFLOAT(height),PASSFLOAT(s1),PASSFLOAT(t1),PASSFLOAT(s2),PAS...`.
/// @param t1 Value used by `invoke(gateway,CG_R_DRAWSTRETCHPIC,[PASSFLOAT(x),PASSFLOAT(y),PASSFLOAT(width),PASSFLOAT(height),PASSFLOAT(s1),PASSFLOAT(t1),PASSFLOAT(s2),PAS...`.
/// @param s2 Value used by `invoke(gateway,CG_R_DRAWSTRETCHPIC,[PASSFLOAT(x),PASSFLOAT(y),PASSFLOAT(width),PASSFLOAT(height),PASSFLOAT(s1),PASSFLOAT(t1),PASSFLOAT(s2),PAS...`.
/// @param t2 Value used by `invoke(gateway,CG_R_DRAWSTRETCHPIC,[PASSFLOAT(x),PASSFLOAT(y),PASSFLOAT(width),PASSFLOAT(height),PASSFLOAT(s1),PASSFLOAT(t1),PASSFLOAT(s2),PAS...`.
/// @param shader Shader handle or asset name selected for this draw operation.
function trap_R_DrawStretchPic(gateway,x,y,width,height,s1,t1,s2,t2,shader) invoke(gateway,CG_R_DRAWSTRETCHPIC,[PASSFLOAT(x),PASSFLOAT(y),PASSFLOAT(width),PASSFLOAT(height),PASSFLOAT(s1),PASSFLOAT(t1),PASSFLOAT(s2),PASSFLOAT(t2),shader]);return void end function
// trap_R_ModelBounds
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param model Model handle, asset or preview record used by this client game syscalls operation.
/// @param mins Minimum X, Y and Z coordinates of the axis-aligned bounds.
/// @param maxs Maximum X, Y and Z coordinates of the axis-aligned bounds.
function trap_R_ModelBounds(gateway,model,mins,maxs) invoke(gateway,CG_R_MODELBOUNDS,[model,mins,maxs]);return void end function
// trap_R_LerpTag
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param tag Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[tag,model,startFrame,endFrame,PASSFLOAT(fraction),tagName]`.
/// @param model Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[tag,model,startFrame,endFrame,PASSFLOAT(fraction),tagName]`.
/// @param startFrame Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[tag,model,startFrame,endFrame,PASSFLOAT(fraction),tagName]`.
/// @param endFrame Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[tag,model,startFrame,endFrame,PASSFLOAT(fraction),tagName]`.
/// @param fraction Interpolation or blend fraction between the endpoint values. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param tagName Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[tag,model,startFrame,endFrame,PASSFLOAT(fraction),tagName]`.
function trap_R_LerpTag(gateway,tag,model,startFrame,endFrame,fraction,tagName) return invoke(gateway,CG_R_LERPTAG,[tag,model,startFrame,endFrame,PASSFLOAT(fraction),tagName]) end function
// trap_R_RemapShader
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param oldShader Value used by `invoke(gateway,CG_R_REMAP_SHADER,[oldShader,newShader,timeOffset])`.
/// @param newShader Value used by `invoke(gateway,CG_R_REMAP_SHADER,[oldShader,newShader,timeOffset])`.
/// @param timeOffset Value used by `invoke(gateway,CG_R_REMAP_SHADER,[oldShader,newShader,timeOffset])`.
function trap_R_RemapShader(gateway,oldShader,newShader,timeOffset) invoke(gateway,CG_R_REMAP_SHADER,[oldShader,newShader,timeOffset]);return void end function
// trap_GetGlconfig
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param glconfig Value used by `invoke(gateway,CG_GETGLCONFIG,[glconfig])`.
function trap_GetGlconfig(gateway,glconfig) invoke(gateway,CG_GETGLCONFIG,[glconfig]);return void end function
// trap_GetGameState
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param gameState Value used by `invoke(gateway,CG_GETGAMESTATE,[gameState])`.
function trap_GetGameState(gateway,gameState) invoke(gateway,CG_GETGAMESTATE,[gameState]);return void end function
// trap_GetCurrentSnapshotNumber
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param snapshotNumber Value used by `invoke(gateway,CG_GETCURRENTSNAPSHOTNUMBER,[snapshotNumber,serverTime])`.
/// @param serverTime Authoritative server timestamp in milliseconds.
function trap_GetCurrentSnapshotNumber(gateway,snapshotNumber,serverTime) invoke(gateway,CG_GETCURRENTSNAPSHOTNUMBER,[snapshotNumber,serverTime]);return void end function
// trap_GetSnapshot
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param snapshotNumber Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[snapshotNumber,snapshot]`.
/// @param snapshot Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[snapshotNumber,snapshot]`.
function trap_GetSnapshot(gateway,snapshotNumber,snapshot) return invoke(gateway,CG_GETSNAPSHOT,[snapshotNumber,snapshot]) end function
// trap_GetServerCommand
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param serverCommandNumber Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[serverCommandNumber]`.
function trap_GetServerCommand(gateway,serverCommandNumber) return invoke(gateway,CG_GETSERVERCOMMAND,[serverCommandNumber]) end function
// trap_GetCurrentCmdNumber
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
function trap_GetCurrentCmdNumber(gateway) return invoke(gateway,CG_GETCURRENTCMDNUMBER,[]) end function
// trap_GetUserCmd
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param cmdNumber Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[cmdNumber,usercmd]`.
/// @param usercmd Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[cmdNumber,usercmd]`.
function trap_GetUserCmd(gateway,cmdNumber,usercmd) return invoke(gateway,CG_GETUSERCMD,[cmdNumber,usercmd]) end function
// trap_SetUserCmdValue
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param stateValue Value used by `invoke(gateway,CG_SETUSERCMDVALUE,[stateValue,PASSFLOAT(sensitivityScale)])`.
/// @param sensitivityScale Value used by `invoke(gateway,CG_SETUSERCMDVALUE,[stateValue,PASSFLOAT(sensitivityScale)])`.
function trap_SetUserCmdValue(gateway,stateValue,sensitivityScale) invoke(gateway,CG_SETUSERCMDVALUE,[stateValue,PASSFLOAT(sensitivityScale)]);return void end function
// testPrintInt
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param text Text consumed or emitted by `testPrintInt` in the client game syscalls path.
/// @param value Value used by `invoke(gateway,CG_TESTPRINTINT,[text,value])`.
function testPrintInt(gateway,text,value) invoke(gateway,CG_TESTPRINTINT,[text,value]);return void end function
// testPrintFloat
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param text Text consumed or emitted by `testPrintFloat` in the client game syscalls path.
/// @param value Value used by `invoke(gateway,CG_TESTPRINTFLOAT,[text,PASSFLOAT(value)])`.
function testPrintFloat(gateway,text,value) invoke(gateway,CG_TESTPRINTFLOAT,[text,PASSFLOAT(value)]);return void end function
// trap_MemoryRemaining
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
function trap_MemoryRemaining(gateway) return invoke(gateway,CG_MEMORY_REMAINING,[]) end function
// trap_Key_IsDown
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param keynum Quake III key number identifying the keyboard or mouse input. Forwarded to `mq3.client.cgame_syscalls.invoke`.
function trap_Key_IsDown(gateway,keynum) return invoke(gateway,CG_KEY_ISDOWN,[keynum]) end function
// trap_Key_GetCatcher
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
function trap_Key_GetCatcher(gateway) return invoke(gateway,CG_KEY_GETCATCHER,[]) end function
// trap_Key_SetCatcher
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param catcher Value used by `invoke(gateway,CG_KEY_SETCATCHER,[catcher])`.
function trap_Key_SetCatcher(gateway,catcher) invoke(gateway,CG_KEY_SETCATCHER,[catcher]);return void end function
// trap_Key_GetKey
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param binding Command text associated with an input key. Forwarded to `mq3.client.cgame_syscalls.invoke`.
function trap_Key_GetKey(gateway,binding) return invoke(gateway,CG_KEY_GETKEY,[binding]) end function
// trap_PC_AddGlobalDefine
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param defineText Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[defineText]`.
function trap_PC_AddGlobalDefine(gateway,defineText) return invoke(gateway,CG_PC_ADD_GLOBAL_DEFINE,[defineText]) end function
// trap_PC_LoadSource
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param filename File name passed to the corresponding file/asset operation. Forwarded to `mq3.client.cgame_syscalls.invoke`.
function trap_PC_LoadSource(gateway,filename) return invoke(gateway,CG_PC_LOAD_SOURCE,[filename]) end function
// trap_PC_FreeSource
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param handle Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[handle]`.
function trap_PC_FreeSource(gateway,handle) return invoke(gateway,CG_PC_FREE_SOURCE,[handle]) end function
// trap_PC_ReadToken
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param handle Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[handle,token]`.
/// @param token Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[handle,token]`.
function trap_PC_ReadToken(gateway,handle,token) return invoke(gateway,CG_PC_READ_TOKEN,[handle,token]) end function
// trap_PC_SourceFileAndLine
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param handle Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[handle,filename,line]`.
/// @param filename File name passed to the corresponding file/asset operation. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param line Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[handle,filename,line]`.
function trap_PC_SourceFileAndLine(gateway,handle,filename,line) return invoke(gateway,CG_PC_SOURCE_FILE_AND_LINE,[handle,filename,line]) end function
// trap_RealTime
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param qtime Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[qtime]`.
function trap_RealTime(gateway,qtime) return invoke(gateway,CG_REAL_TIME,[qtime]) end function
// trap_SnapVector
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param vector Value used by `invoke(gateway,CG_SNAPVECTOR,[vector])`.
function trap_SnapVector(gateway,vector) invoke(gateway,CG_SNAPVECTOR,[vector]);return void end function
// trap_CIN_PlayCinematic
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param name Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[name,x,y,width,height,bits]`.
/// @param x Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[name,x,y,width,height,bits]`.
/// @param y Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[name,x,y,width,height,bits]`.
/// @param width Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[name,x,y,width,height,bits]`.
/// @param height Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[name,x,y,width,height,bits]`.
/// @param bits Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[name,x,y,width,height,bits]`.
function trap_CIN_PlayCinematic(gateway,name,x,y,width,height,bits) return invoke(gateway,CG_CIN_PLAYCINEMATIC,[name,x,y,width,height,bits]) end function
// trap_CIN_StopCinematic
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param handle Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[handle]`.
function trap_CIN_StopCinematic(gateway,handle) return invoke(gateway,CG_CIN_STOPCINEMATIC,[handle]) end function
// trap_CIN_RunCinematic
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param handle Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[handle]`.
function trap_CIN_RunCinematic(gateway,handle) return invoke(gateway,CG_CIN_RUNCINEMATIC,[handle]) end function
// trap_CIN_DrawCinematic
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `trap_CIN_DrawCinematic`.
function trap_CIN_DrawCinematic(gateway,handle) invoke(gateway,CG_CIN_DRAWCINEMATIC,[handle]);return void end function
// trap_CIN_SetExtents
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `trap_CIN_SetExtents`.
/// @param x Horizontal coordinate in the coordinate space used by `trap_CIN_SetExtents`.
/// @param y Vertical coordinate in the coordinate space used by `trap_CIN_SetExtents`.
/// @param width Width in the coordinate space used by `trap_CIN_SetExtents`.
/// @param height Height in the coordinate space used by `trap_CIN_SetExtents`.
function trap_CIN_SetExtents(gateway,handle,x,y,width,height) invoke(gateway,CG_CIN_SETEXTENTS,[handle,x,y,width,height]);return void end function
// trap_GetEntityToken
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param buffer Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[buffer,bufferSize]`.
/// @param bufferSize Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[buffer,bufferSize]`.
function trap_GetEntityToken(gateway,buffer,bufferSize) return invoke(gateway,CG_GET_ENTITY_TOKEN,[buffer,bufferSize]) end function
// trap_R_inPVS
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param p1 Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[p1,p2]`.
/// @param p2 Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[p1,p2]`.
function trap_R_inPVS(gateway,p1,p2) return invoke(gateway,CG_R_INPVS,[p1,p2]) end function

// trap_loadCamera -- dormant in the shipped source, ordinal preserved.
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param name Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[name]`.
function trap_loadCamera(gateway,name) return invoke(gateway,CG_LOADCAMERA,[name]) end function
// trap_startCamera -- dormant in the shipped source, ordinal preserved.
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context.
/// @param time Value used by `invoke(gateway,CG_STARTCAMERA,[time])`.
function trap_startCamera(gateway,time) invoke(gateway,CG_STARTCAMERA,[time]);return void end function
// trap_getCameraInfo -- dormant in the shipped source, ordinal preserved.
/// @param gateway Native syscall gateway carrying the dispatcher callback and its host context. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param time Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[time,origin,angles]`.
/// @param origin World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_syscalls.invoke`.
/// @param angles Argument 3 of `mq3.client.cgame_syscalls.invoke`; passed as `[time,origin,angles]`.
function trap_getCameraInfo(gateway,time,origin,angles) return invoke(gateway,CG_GETCAMERAINFO,[time,origin,angles]) end function
