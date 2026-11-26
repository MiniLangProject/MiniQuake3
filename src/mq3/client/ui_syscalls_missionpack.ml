// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native Missionpack UI DLL trap veneer from code/ui/ui_syscalls.c.
//
// A native UI module owns pointers rather than QVM offsets.  Consequently this
// layer deliberately keeps pointer-like values opaque and forwards them in the
// exact C argument order.  The callback can be backed by CL_UISystemCalls, or by
// the existing mq3.vm.syscall_ui dispatcher through an embedding adapter.
package mq3.client.ui_syscalls_missionpack

import mq3.compat.numeric as n

/// UI engine-syscall ordinal used to raise an engine error.
const UI_ERROR=0
/// UI engine-syscall ordinal used to print text through the engine console.
const UI_PRINT=1
/// UI engine-syscall ordinal used to query the engine millisecond timer.
const UI_MILLISECONDS=2
/// UI engine-syscall ordinal used to set a configuration variable.
const UI_CVAR_SET=3
/// UI engine-syscall ordinal used to read a configuration variable as a number.
const UI_CVAR_VARIABLEVALUE=4
/// UI engine-syscall ordinal used to read a configuration variable as text.
const UI_CVAR_VARIABLESTRINGBUFFER=5
/// UI engine-syscall ordinal used to set a configuration variable from a numeric value.
const UI_CVAR_SETVALUE=6
/// UI engine-syscall ordinal used to restore a configuration variable's default value.
const UI_CVAR_RESET=7
/// UI engine-syscall ordinal used to create a configuration variable with a default value and flags.
const UI_CVAR_CREATE=8
/// UI engine-syscall ordinal used to collect configuration variables into an info string.
const UI_CVAR_INFOSTRINGBUFFER=9
/// UI engine-syscall ordinal used to query the number of console-command arguments.
const UI_ARGC=10
/// UI engine-syscall ordinal used to read a console-command argument.
const UI_ARGV=11
/// UI engine-syscall ordinal used to execute or queue console-command text.
const UI_CMD_EXECUTETEXT=12
/// UI engine-syscall ordinal used to open a file in the virtual filesystem.
const UI_FS_FOPENFILE=13
/// UI engine-syscall ordinal used to read bytes from a virtual file.
const UI_FS_READ=14
/// UI engine-syscall ordinal used to write bytes to a virtual file.
const UI_FS_WRITE=15
/// UI engine-syscall ordinal used to close a virtual file.
const UI_FS_FCLOSEFILE=16
/// UI engine-syscall ordinal used to enumerate virtual filesystem entries.
const UI_FS_GETFILELIST=17
/// UI engine-syscall ordinal used to register a model resource.
const UI_R_REGISTERMODEL=18
/// UI engine-syscall ordinal used to register a skin resource.
const UI_R_REGISTERSKIN=19
/// UI engine-syscall ordinal used to register a shader without mipmapped image sampling.
const UI_R_REGISTERSHADERNOMIP=20
/// UI engine-syscall ordinal used to clear the renderer's pending scene.
const UI_R_CLEARSCENE=21
/// UI engine-syscall ordinal used to append a renderer entity to the pending scene.
const UI_R_ADDREFENTITYTOSCENE=22
/// UI engine-syscall ordinal used to append a polygon to the pending scene.
const UI_R_ADDPOLYTOSCENE=23
/// UI engine-syscall ordinal used to append a dynamic light to the pending scene.
const UI_R_ADDLIGHTTOSCENE=24
/// UI engine-syscall ordinal used to render the accumulated scene through a view definition.
const UI_R_RENDERSCENE=25
/// UI engine-syscall ordinal used to set the color modulation used by subsequent 2D drawing.
const UI_R_SETCOLOR=26
/// UI engine-syscall ordinal used to draw a shader-backed rectangle with texture coordinates.
const UI_R_DRAWSTRETCHPIC=27
/// UI engine-syscall ordinal used to request an immediate screen update.
const UI_UPDATESCREEN=28
/// UI engine-syscall ordinal used to interpolate a model attachment tag for the UI preview.
const UI_CM_LERPTAG=29
/// UI engine-syscall ordinal used to load a collision model.
const UI_CM_LOADMODEL=30
/// UI engine-syscall ordinal used to register a sound resource.
const UI_S_REGISTERSOUND=31
/// UI engine-syscall ordinal used to play a non-positional local sound.
const UI_S_STARTLOCALSOUND=32
/// UI engine-syscall ordinal used to convert an engine key code to a display name.
const UI_KEY_KEYNUMTOSTRINGBUF=33
/// UI engine-syscall ordinal used to read the command bound to an engine key.
const UI_KEY_GETBINDINGBUF=34
/// UI engine-syscall ordinal used to set the command bound to an engine key.
const UI_KEY_SETBINDING=35
/// UI engine-syscall ordinal used to query whether an engine key is currently pressed.
const UI_KEY_ISDOWN=36
/// UI engine-syscall ordinal used to query whether text editing uses overwrite mode.
const UI_KEY_GETOVERSTRIKEMODE=37
/// UI engine-syscall ordinal used to change text-editing overwrite mode.
const UI_KEY_SETOVERSTRIKEMODE=38
/// UI engine-syscall ordinal used to release all tracked key states.
const UI_KEY_CLEARSTATES=39
/// UI engine-syscall ordinal used to read the active input-capture bitmask.
const UI_KEY_GETCATCHER=40
/// UI engine-syscall ordinal used to replace the active input-capture bitmask.
const UI_KEY_SETCATCHER=41
/// UI engine-syscall ordinal used to read available clipboard text.
const UI_GETCLIPBOARDDATA=42
/// UI engine-syscall ordinal used to read the renderer configuration.
const UI_GETGLCONFIG=43
/// UI engine-syscall ordinal used to read the engine's connection-state summary.
const UI_GETCLIENTSTATE=44
/// UI engine-syscall ordinal used to read one server configuration string.
const UI_GETCONFIGSTRING=45
/// UI server-browser syscall ordinal used to query the number of outstanding browser ping requests.
const UI_LAN_GETPINGQUEUECOUNT=46
/// UI server-browser syscall ordinal used to release a completed or canceled ping request slot.
const UI_LAN_CLEARPING=47
/// UI server-browser syscall ordinal used to read the address and latency from a ping request slot.
const UI_LAN_GETPING=48
/// UI server-browser syscall ordinal used to read server-info text returned by a ping request.
const UI_LAN_GETPINGINFO=49
/// UI engine-syscall ordinal used to register a configuration variable.
const UI_CVAR_REGISTER=50
/// UI engine-syscall ordinal used to refresh a mirrored configuration variable.
const UI_CVAR_UPDATE=51
/// UI engine-syscall ordinal used to query remaining VM memory.
const UI_MEMORY_REMAINING=52
/// UI engine-syscall ordinal used to read the configured product key.
const UI_GET_CDKEY=53
/// UI engine-syscall ordinal used to write the configured product key.
const UI_SET_CDKEY=54
/// UI engine-syscall ordinal used to register a font resource and its glyph metrics.
const UI_R_REGISTERFONT=55
/// UI engine-syscall ordinal used to query a model's axis-aligned bounds.
const UI_R_MODELBOUNDS=56
/// UI engine-syscall ordinal used to add a preprocessor definition to the script parser.
const UI_PC_ADD_GLOBAL_DEFINE=57
/// UI engine-syscall ordinal used to open a script-parser source handle.
const UI_PC_LOAD_SOURCE=58
/// UI engine-syscall ordinal used to release a script-parser source handle.
const UI_PC_FREE_SOURCE=59
/// UI engine-syscall ordinal used to read the next preprocessed source token.
const UI_PC_READ_TOKEN=60
/// UI engine-syscall ordinal used to query the source location for a parser handle.
const UI_PC_SOURCE_FILE_AND_LINE=61
/// UI engine-syscall ordinal used to stop background music playback.
const UI_S_STOPBACKGROUNDTRACK=62
/// UI engine-syscall ordinal used to start the background music introduction and loop tracks.
const UI_S_STARTBACKGROUNDTRACK=63
/// UI engine-syscall ordinal used to read the host calendar and clock.
const UI_REAL_TIME=64
/// UI server-browser syscall ordinal used to query the number of servers in a browser source list.
const UI_LAN_GETSERVERCOUNT=65
/// UI server-browser syscall ordinal used to read a browser server's network address.
const UI_LAN_GETSERVERADDRESSSTRING=66
/// UI server-browser syscall ordinal used to read a browser server's info-string properties.
const UI_LAN_GETSERVERINFO=67
/// UI server-browser syscall ordinal used to include or exclude a server from visible ping updates.
const UI_LAN_MARKSERVERVISIBLE=68
/// UI server-browser syscall ordinal used to advance pending pings for visible browser servers.
const UI_LAN_UPDATEVISIBLEPINGS=69
/// UI server-browser syscall ordinal used to clear latency results for a browser source list.
const UI_LAN_RESETPINGS=70
/// UI server-browser syscall ordinal used to restore saved browser and favorite-server lists.
const UI_LAN_LOADCACHEDSERVERS=71
/// UI server-browser syscall ordinal used to persist browser and favorite-server lists.
const UI_LAN_SAVECACHEDSERVERS=72
/// UI server-browser syscall ordinal used to add a server to a browser source list.
const UI_LAN_ADDSERVER=73
/// UI server-browser syscall ordinal used to remove a server from a browser source list.
const UI_LAN_REMOVESERVER=74
/// UI engine-syscall ordinal used to open and start a cinematic stream.
const UI_CIN_PLAYCINEMATIC=75
/// UI engine-syscall ordinal used to stop a cinematic stream.
const UI_CIN_STOPCINEMATIC=76
/// UI engine-syscall ordinal used to advance a cinematic decoder.
const UI_CIN_RUNCINEMATIC=77
/// UI engine-syscall ordinal used to draw the current cinematic frame.
const UI_CIN_DRAWCINEMATIC=78
/// UI engine-syscall ordinal used to set a cinematic's screen rectangle.
const UI_CIN_SETEXTENTS=79
/// UI engine-syscall ordinal used to remap a shader to a replacement shader and time offset.
const UI_R_REMAP_SHADER=80
/// UI engine-syscall ordinal used to validate a product key.
const UI_VERIFY_CDKEY=81
/// UI server-browser syscall ordinal used to request or read a server-status response.
const UI_LAN_SERVERSTATUS=82
/// UI server-browser syscall ordinal used to read a browser server's measured latency.
const UI_LAN_GETSERVERPING=83
/// UI server-browser syscall ordinal used to query whether a server participates in visible ping
/// updates.
const UI_LAN_SERVERISVISIBLE=84
/// UI server-browser syscall ordinal used to compare two browser servers using a selected sort key.
const UI_LAN_COMPARESERVERS=85
/// UI engine-syscall ordinal used to seek within a virtual file.
const UI_FS_SEEK=86
/// UI engine-syscall ordinal used to set the legacy client anti-cheat status flag.
const UI_SET_PBCLSTATUS=87

/// Stores UI syscalls missionpack state, including `syscallFn`, `context`, `calls`, `lastOpcode`, `lastArguments`.
struct State
  /// Host callback for the syscall operation; an unset callback leaves that host operation unavailable.
  syscallFn
  /// Caller-supplied value forwarded unchanged to the service callbacks for the Missionpack UI syscall
  /// gateway.
  context
  /// When constructing this record, `dllEntry` supplies `0` for this member. Used by `invoke` during
  /// subsequent processing.
  calls
  /// When constructing this record, `dllEntry` supplies `-1` for this member. Used by `invoke` during
  /// subsequent processing.
  lastOpcode
  /// When constructing this record, `dllEntry` supplies an empty list for this member. Used by `invoke`
  /// during subsequent processing.
  lastArguments
end struct

/// Calls `mq3.client.ui_syscalls_missionpack.State` from UI syscalls missionpack `dllEntry`. The final path returns `State(syscallptr,context,0,-1,[])`.
/// @param syscallptr Value used by `if syscallptr==void then return error(7820,"UI syscalls: missing syscall entry") end if`.
/// @param context context record passed to the UI syscalls missionpack helper calls.
function dllEntry(syscallptr,context)
  if syscallptr==void then return error(7820,"UI syscalls: missing syscall entry") end if
  return State(syscallptr,context,0,-1,[])
end function

/// Updates `state.calls`, `state.lastOpcode`, `state.lastArguments` during UI syscalls missionpack `invoke`.
/// @param state Mutable UI syscalls missionpack record/storage; this routine assigns `state.calls`, `state.lastOpcode`, `state.lastArguments`.
/// @param opcode Value assigned to `state.lastOpcode`.
/// @param arguments Value assigned to `state.lastArguments`.
function invoke(state,opcode,arguments)
  if state==void or state.syscallFn==void then return error(7820,"UI syscalls: dllEntry was not installed") end if
  state.calls=state.calls+1;state.lastOpcode=opcode;state.lastArguments=arguments
  return state.syscallFn(state.context,opcode,arguments)
end function

/// Calls `mq3.client.ui_syscalls_missionpack.invoke` from UI syscalls missionpack `callVoid`.
/// @param state Shared UI syscalls missionpack state passed to the helper calls in `callVoid`.
/// @param opcode Value used by `invoke(state,opcode,arguments)`.
/// @param arguments Value used by `invoke(state,opcode,arguments)`.
function callVoid(state,opcode,arguments) invoke(state,opcode,arguments);return void end function

/// Adapts `mq3.compat.numeric.i32` to UI syscalls missionpack `PASSFLOAT`, returning its result for `n.floatBits(x)`.
/// @param x Argument 1 of `mq3.compat.numeric.i32`; passed as `n.floatBits(x)`.
function PASSFLOAT(x) return n.i32(n.floatBits(x)) end function

/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_Print`, returning its result for `state, UI_PRINT, [string]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param string Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[string]`.
function trap_Print(state,string) return callVoid(state,UI_PRINT,[string]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_Error`, returning its result for `state, UI_ERROR, [string]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param string Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[string]`.
function trap_Error(state,string) return callVoid(state,UI_ERROR,[string]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_Milliseconds`, returning its result for `state, UI_MILLISECONDS, []`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
function trap_Milliseconds(state) return invoke(state,UI_MILLISECONDS,[]) end function

/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_Cvar_Register`, returning its result for `state, UI_CVAR_REGISTER, [cvar,varName,value,flags]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param cvar Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[cvar,varName,value,flags]`.
/// @param varName Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[cvar,varName,value,flags]`.
/// @param value Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[cvar,varName,value,flags]`.
/// @param flags Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[cvar,varName,value,flags]`.
function trap_Cvar_Register(state,cvar,varName,value,flags) return callVoid(state,UI_CVAR_REGISTER,[cvar,varName,value,flags]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_Cvar_Update`, returning its result for `state, UI_CVAR_UPDATE, [cvar]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param cvar Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[cvar]`.
function trap_Cvar_Update(state,cvar) return callVoid(state,UI_CVAR_UPDATE,[cvar]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_Cvar_Set`, returning its result for `state, UI_CVAR_SET, [varName,value]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param varName Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[varName,value]`.
/// @param value Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[varName,value]`.
function trap_Cvar_Set(state,varName,value) return callVoid(state,UI_CVAR_SET,[varName,value]) end function
/// Adapts `mq3.compat.numeric.bitsFloat` to UI syscalls missionpack `trap_Cvar_VariableValue`, returning its result for `invoke(state,UI_CVAR_VARIABLEVALUE,[varName])`.
/// @param state Argument 1 of `mq3.compat.numeric.bitsFloat`; passed as `invoke(state,UI_CVAR_VARIABLEVALUE,[varName])`.
/// @param varName Argument 1 of `mq3.compat.numeric.bitsFloat`; passed as `invoke(state,UI_CVAR_VARIABLEVALUE,[varName])`.
function trap_Cvar_VariableValue(state,varName) return n.bitsFloat(invoke(state,UI_CVAR_VARIABLEVALUE,[varName])) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_Cvar_VariableStringBuffer`, returning its result for `state, UI_CVAR_VARIABLESTRINGBUFFER, [varName,buffer,bufsize]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param varName Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[varName,buffer,bufsize]`.
/// @param buffer Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[varName,buffer,bufsize]`.
/// @param bufsize Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[varName,buffer,bufsize]`.
function trap_Cvar_VariableStringBuffer(state,varName,buffer,bufsize) return callVoid(state,UI_CVAR_VARIABLESTRINGBUFFER,[varName,buffer,bufsize]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_Cvar_SetValue`, returning its result for `state, UI_CVAR_SETVALUE, [varName,PASSFLOAT(value)]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param varName Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[varName,PASSFLOAT(value)]`.
/// @param value Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[varName,PASSFLOAT(value)]`.
function trap_Cvar_SetValue(state,varName,value) return callVoid(state,UI_CVAR_SETVALUE,[varName,PASSFLOAT(value)]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_Cvar_Reset`, returning its result for `state, UI_CVAR_RESET, [name]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param name Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[name]`.
function trap_Cvar_Reset(state,name) return callVoid(state,UI_CVAR_RESET,[name]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_Cvar_Create`, returning its result for `state, UI_CVAR_CREATE, [varName,varValue,flags]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param varName Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[varName,varValue,flags]`.
/// @param varValue Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[varName,varValue,flags]`.
/// @param flags Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[varName,varValue,flags]`.
function trap_Cvar_Create(state,varName,varValue,flags) return callVoid(state,UI_CVAR_CREATE,[varName,varValue,flags]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_Cvar_InfoStringBuffer`, returning its result for `state, UI_CVAR_INFOSTRINGBUFFER, [bit,buffer,bufsize]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param bit Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[bit,buffer,bufsize]`.
/// @param buffer Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[bit,buffer,bufsize]`.
/// @param bufsize Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[bit,buffer,bufsize]`.
function trap_Cvar_InfoStringBuffer(state,bit,buffer,bufsize) return callVoid(state,UI_CVAR_INFOSTRINGBUFFER,[bit,buffer,bufsize]) end function

/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_Argc`, returning its result for `state, UI_ARGC, []`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
function trap_Argc(state) return invoke(state,UI_ARGC,[]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_Argv`, returning its result for `state, UI_ARGV, [index,buffer,bufferLength]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param index Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[index,buffer,bufferLength]`.
/// @param buffer Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[index,buffer,bufferLength]`.
/// @param bufferLength Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[index,buffer,bufferLength]`.
function trap_Argv(state,index,buffer,bufferLength) return callVoid(state,UI_ARGV,[index,buffer,bufferLength]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_Cmd_ExecuteText`, returning its result for `state, UI_CMD_EXECUTETEXT, [execWhen,text]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param execWhen Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[execWhen,text]`.
/// @param text Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[execWhen,text]`.
function trap_Cmd_ExecuteText(state,execWhen,text) return callVoid(state,UI_CMD_EXECUTETEXT,[execWhen,text]) end function

/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_FS_FOpenFile`, returning its result for `state, UI_FS_FOPENFILE, [qpath,handle,mode]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
/// @param qpath Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[qpath,handle,mode]`.
/// @param handle Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[qpath,handle,mode]`.
/// @param mode Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[qpath,handle,mode]`.
function trap_FS_FOpenFile(state,qpath,handle,mode) return invoke(state,UI_FS_FOPENFILE,[qpath,handle,mode]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_FS_Read`, returning its result for `state, UI_FS_READ, [buffer,length,handle]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param buffer Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[buffer,length,handle]`.
/// @param length Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[buffer,length,handle]`.
/// @param handle Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[buffer,length,handle]`.
function trap_FS_Read(state,buffer,length,handle) return callVoid(state,UI_FS_READ,[buffer,length,handle]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_FS_Write`, returning its result for `state, UI_FS_WRITE, [buffer,length,handle]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param buffer Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[buffer,length,handle]`.
/// @param length Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[buffer,length,handle]`.
/// @param handle Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[buffer,length,handle]`.
function trap_FS_Write(state,buffer,length,handle) return callVoid(state,UI_FS_WRITE,[buffer,length,handle]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_FS_FCloseFile`, returning its result for `state, UI_FS_FCLOSEFILE, [handle]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param handle Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[handle]`.
function trap_FS_FCloseFile(state,handle) return callVoid(state,UI_FS_FCLOSEFILE,[handle]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_FS_GetFileList`, returning its result for `state, UI_FS_GETFILELIST, [path,extension,listbuf,bufsize]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
/// @param path File or asset path used by this operation. Forwarded to `mq3.client.ui_syscalls_missionpack.invoke`.
/// @param extension Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[path,extension,listbuf,bufsize]`.
/// @param listbuf Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[path,extension,listbuf,bufsize]`.
/// @param bufsize Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[path,extension,listbuf,bufsize]`.
function trap_FS_GetFileList(state,path,extension,listbuf,bufsize) return invoke(state,UI_FS_GETFILELIST,[path,extension,listbuf,bufsize]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_FS_Seek`, returning its result for `state, UI_FS_SEEK, [handle,offset,origin]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
/// @param handle Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[handle,offset,origin]`.
/// @param offset Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[handle,offset,origin]`.
/// @param origin World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.ui_syscalls_missionpack.invoke`.
function trap_FS_Seek(state,handle,offset,origin) return invoke(state,UI_FS_SEEK,[handle,offset,origin]) end function

/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_R_RegisterModel`, returning its result for `state, UI_R_REGISTERMODEL, [name]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
/// @param name Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[name]`.
function trap_R_RegisterModel(state,name) return invoke(state,UI_R_REGISTERMODEL,[name]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_R_RegisterSkin`, returning its result for `state, UI_R_REGISTERSKIN, [name]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
/// @param name Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[name]`.
function trap_R_RegisterSkin(state,name) return invoke(state,UI_R_REGISTERSKIN,[name]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_R_RegisterFont`, returning its result for `state, UI_R_REGISTERFONT, [fontName,pointSize,font]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param fontName Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[fontName,pointSize,font]`.
/// @param pointSize Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[fontName,pointSize,font]`.
/// @param font Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[fontName,pointSize,font]`.
function trap_R_RegisterFont(state,fontName,pointSize,font) return callVoid(state,UI_R_REGISTERFONT,[fontName,pointSize,font]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_R_RegisterShaderNoMip`, returning its result for `state, UI_R_REGISTERSHADERNOMIP, [name]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
/// @param name Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[name]`.
function trap_R_RegisterShaderNoMip(state,name) return invoke(state,UI_R_REGISTERSHADERNOMIP,[name]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_R_ClearScene`, returning its result for `state, UI_R_CLEARSCENE, []`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
function trap_R_ClearScene(state) return callVoid(state,UI_R_CLEARSCENE,[]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_R_AddRefEntityToScene`, returning its result for `state, UI_R_ADDREFENTITYTOSCENE, [entity]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param entity Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[entity]`.
function trap_R_AddRefEntityToScene(state,entity) return callVoid(state,UI_R_ADDREFENTITYTOSCENE,[entity]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_R_AddPolyToScene`, returning its result for `state, UI_R_ADDPOLYTOSCENE, [shader,numVerts,verts]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param shader Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[shader,numVerts,verts]`.
/// @param numVerts Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[shader,numVerts,verts]`.
/// @param verts Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[shader,numVerts,verts]`.
function trap_R_AddPolyToScene(state,shader,numVerts,verts) return callVoid(state,UI_R_ADDPOLYTOSCENE,[shader,numVerts,verts]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_R_AddLightToScene`, returning its result for `state, UI_R_ADDLIGHTTOSCENE, [origin,PASSFLOAT(intensity),PASSFLOAT(r),PASSFLOAT(g),PASSFLOAT(b)]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param origin World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param intensity Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[origin,PASSFLOAT(intensity),PASSFLOAT(r),PASSFLOAT(g),PASSFLOAT(b)]`.
/// @param r Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[origin,PASSFLOAT(intensity),PASSFLOAT(r),PASSFLOAT(g),PASSFLOAT(b)]`.
/// @param g Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[origin,PASSFLOAT(intensity),PASSFLOAT(r),PASSFLOAT(g),PASSFLOAT(b)]`.
/// @param b Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[origin,PASSFLOAT(intensity),PASSFLOAT(r),PASSFLOAT(g),PASSFLOAT(b)]`.
function trap_R_AddLightToScene(state,origin,intensity,r,g,b) return callVoid(state,UI_R_ADDLIGHTTOSCENE,[origin,PASSFLOAT(intensity),PASSFLOAT(r),PASSFLOAT(g),PASSFLOAT(b)]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_R_RenderScene`, returning its result for `state, UI_R_RENDERSCENE, [refdef]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param refdef Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[refdef]`.
function trap_R_RenderScene(state,refdef) return callVoid(state,UI_R_RENDERSCENE,[refdef]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_R_SetColor`, returning its result for `state, UI_R_SETCOLOR, [rgba]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param rgba Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[rgba]`.
function trap_R_SetColor(state,rgba) return callVoid(state,UI_R_SETCOLOR,[rgba]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_R_DrawStretchPic`, returning its result for `state, UI_R_DRAWSTRETCHPIC, [PASSFLOAT(x),PASSFLOAT(y),PASSFLOAT(w),PASSFLOAT(h),PASSFLOAT(s1),PASSFLOAT(t1),PASSFLOAT(s2),PASSFLOAT(t2),shader]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param x Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[PASSFLOAT(x),PASSFLOAT(y),PASSFLOAT(w),PASSFLOAT(h),PASSFLOAT(s1),PASSFLOAT(t1),PASSFLOAT(s2),PASSFLOAT(t2),shader]`.
/// @param y Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[PASSFLOAT(x),PASSFLOAT(y),PASSFLOAT(w),PASSFLOAT(h),PASSFLOAT(s1),PASSFLOAT(t1),PASSFLOAT(s2),PASSFLOAT(t2),shader]`.
/// @param w Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[PASSFLOAT(x),PASSFLOAT(y),PASSFLOAT(w),PASSFLOAT(h),PASSFLOAT(s1),PASSFLOAT(t1),PASSFLOAT(s2),PASSFLOAT(t2),shader]`.
/// @param h Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[PASSFLOAT(x),PASSFLOAT(y),PASSFLOAT(w),PASSFLOAT(h),PASSFLOAT(s1),PASSFLOAT(t1),PASSFLOAT(s2),PASSFLOAT(t2),shader]`.
/// @param s1 Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[PASSFLOAT(x),PASSFLOAT(y),PASSFLOAT(w),PASSFLOAT(h),PASSFLOAT(s1),PASSFLOAT(t1),PASSFLOAT(s2),PASSFLOAT(t2),shader]`.
/// @param t1 Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[PASSFLOAT(x),PASSFLOAT(y),PASSFLOAT(w),PASSFLOAT(h),PASSFLOAT(s1),PASSFLOAT(t1),PASSFLOAT(s2),PASSFLOAT(t2),shader]`.
/// @param s2 Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[PASSFLOAT(x),PASSFLOAT(y),PASSFLOAT(w),PASSFLOAT(h),PASSFLOAT(s1),PASSFLOAT(t1),PASSFLOAT(s2),PASSFLOAT(t2),shader]`.
/// @param t2 Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[PASSFLOAT(x),PASSFLOAT(y),PASSFLOAT(w),PASSFLOAT(h),PASSFLOAT(s1),PASSFLOAT(t1),PASSFLOAT(s2),PASSFLOAT(t2),shader]`.
/// @param shader Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[PASSFLOAT(x),PASSFLOAT(y),PASSFLOAT(w),PASSFLOAT(h),PASSFLOAT(s1),PASSFLOAT(t1),PASSFLOAT(s2),PASSFLOAT(t2),shader]`.
function trap_R_DrawStretchPic(state,x,y,w,h,s1,t1,s2,t2,shader) return callVoid(state,UI_R_DRAWSTRETCHPIC,[PASSFLOAT(x),PASSFLOAT(y),PASSFLOAT(w),PASSFLOAT(h),PASSFLOAT(s1),PASSFLOAT(t1),PASSFLOAT(s2),PASSFLOAT(t2),shader]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_R_ModelBounds`, returning its result for `state, UI_R_MODELBOUNDS, [model,mins,maxs]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param model Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[model,mins,maxs]`.
/// @param mins Minimum X, Y and Z coordinates of the axis-aligned bounds. Forwarded to `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param maxs Maximum X, Y and Z coordinates of the axis-aligned bounds. Forwarded to `mq3.client.ui_syscalls_missionpack.callVoid`.
function trap_R_ModelBounds(state,model,mins,maxs) return callVoid(state,UI_R_MODELBOUNDS,[model,mins,maxs]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_R_RemapShader`, returning its result for `state, UI_R_REMAP_SHADER, [oldShader,newShader,timeOffset]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param oldShader Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[oldShader,newShader,timeOffset]`.
/// @param newShader Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[oldShader,newShader,timeOffset]`.
/// @param timeOffset Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[oldShader,newShader,timeOffset]`.
function trap_R_RemapShader(state,oldShader,newShader,timeOffset) return callVoid(state,UI_R_REMAP_SHADER,[oldShader,newShader,timeOffset]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_UpdateScreen`, returning its result for `state, UI_UPDATESCREEN, []`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
function trap_UpdateScreen(state) return callVoid(state,UI_UPDATESCREEN,[]) end function

/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_CM_LerpTag`, returning its result for `state, UI_CM_LERPTAG, [tag,model,startFrame,endFrame,PASSFLOAT(frac),tagName]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
/// @param tag Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[tag,model,startFrame,endFrame,PASSFLOAT(frac),tagName]`.
/// @param model Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[tag,model,startFrame,endFrame,PASSFLOAT(frac),tagName]`.
/// @param startFrame Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[tag,model,startFrame,endFrame,PASSFLOAT(frac),tagName]`.
/// @param endFrame Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[tag,model,startFrame,endFrame,PASSFLOAT(frac),tagName]`.
/// @param frac Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[tag,model,startFrame,endFrame,PASSFLOAT(frac),tagName]`.
/// @param tagName Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[tag,model,startFrame,endFrame,PASSFLOAT(frac),tagName]`.
function trap_CM_LerpTag(state,tag,model,startFrame,endFrame,frac,tagName) return invoke(state,UI_CM_LERPTAG,[tag,model,startFrame,endFrame,PASSFLOAT(frac),tagName]) end function

/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_S_StartLocalSound`, returning its result for `state, UI_S_STARTLOCALSOUND, [sfx,channelNum]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param sfx Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[sfx,channelNum]`.
/// @param channelNum Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[sfx,channelNum]`.
function trap_S_StartLocalSound(state,sfx,channelNum) return callVoid(state,UI_S_STARTLOCALSOUND,[sfx,channelNum]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_S_RegisterSound`, returning its result for `state, UI_S_REGISTERSOUND, [sample,compressed]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
/// @param sample Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[sample,compressed]`.
/// @param compressed Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[sample,compressed]`.
function trap_S_RegisterSound(state,sample,compressed) return invoke(state,UI_S_REGISTERSOUND,[sample,compressed]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_S_StopBackgroundTrack`, returning its result for `state, UI_S_STOPBACKGROUNDTRACK, []`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
function trap_S_StopBackgroundTrack(state) return callVoid(state,UI_S_STOPBACKGROUNDTRACK,[]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_S_StartBackgroundTrack`, returning its result for `state, UI_S_STARTBACKGROUNDTRACK, [intro,loopName]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param intro Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[intro,loopName]`.
/// @param loopName Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[intro,loopName]`.
function trap_S_StartBackgroundTrack(state,intro,loopName) return callVoid(state,UI_S_STARTBACKGROUNDTRACK,[intro,loopName]) end function

/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_Key_KeynumToStringBuf`, returning its result for `state, UI_KEY_KEYNUMTOSTRINGBUF, [keynum,buffer,buflen]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param keynum Quake III key number identifying the keyboard or mouse input. Forwarded to `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param buffer Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[keynum,buffer,buflen]`.
/// @param buflen Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[keynum,buffer,buflen]`.
function trap_Key_KeynumToStringBuf(state,keynum,buffer,buflen) return callVoid(state,UI_KEY_KEYNUMTOSTRINGBUF,[keynum,buffer,buflen]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_Key_GetBindingBuf`, returning its result for `state, UI_KEY_GETBINDINGBUF, [keynum,buffer,buflen]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param keynum Quake III key number identifying the keyboard or mouse input. Forwarded to `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param buffer Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[keynum,buffer,buflen]`.
/// @param buflen Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[keynum,buffer,buflen]`.
function trap_Key_GetBindingBuf(state,keynum,buffer,buflen) return callVoid(state,UI_KEY_GETBINDINGBUF,[keynum,buffer,buflen]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_Key_SetBinding`, returning its result for `state, UI_KEY_SETBINDING, [keynum,binding]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param keynum Quake III key number identifying the keyboard or mouse input. Forwarded to `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param binding Command text associated with an input key. Forwarded to `mq3.client.ui_syscalls_missionpack.callVoid`.
function trap_Key_SetBinding(state,keynum,binding) return callVoid(state,UI_KEY_SETBINDING,[keynum,binding]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_Key_IsDown`, returning its result for `state, UI_KEY_ISDOWN, [keynum]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
/// @param keynum Quake III key number identifying the keyboard or mouse input. Forwarded to `mq3.client.ui_syscalls_missionpack.invoke`.
function trap_Key_IsDown(state,keynum) return invoke(state,UI_KEY_ISDOWN,[keynum]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_Key_GetOverstrikeMode`, returning its result for `state, UI_KEY_GETOVERSTRIKEMODE, []`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
function trap_Key_GetOverstrikeMode(state) return invoke(state,UI_KEY_GETOVERSTRIKEMODE,[]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_Key_SetOverstrikeMode`, returning its result for `state, UI_KEY_SETOVERSTRIKEMODE, [value]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param value Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[value]`.
function trap_Key_SetOverstrikeMode(state,value) return callVoid(state,UI_KEY_SETOVERSTRIKEMODE,[value]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_Key_ClearStates`, returning its result for `state, UI_KEY_CLEARSTATES, []`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
function trap_Key_ClearStates(state) return callVoid(state,UI_KEY_CLEARSTATES,[]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_Key_GetCatcher`, returning its result for `state, UI_KEY_GETCATCHER, []`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
function trap_Key_GetCatcher(state) return invoke(state,UI_KEY_GETCATCHER,[]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_Key_SetCatcher`, returning its result for `state, UI_KEY_SETCATCHER, [catcher]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param catcher Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[catcher]`.
function trap_Key_SetCatcher(state,catcher) return callVoid(state,UI_KEY_SETCATCHER,[catcher]) end function

/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_GetClipboardData`, returning its result for `state, UI_GETCLIPBOARDDATA, [buffer,bufsize]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param buffer Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[buffer,bufsize]`.
/// @param bufsize Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[buffer,bufsize]`.
function trap_GetClipboardData(state,buffer,bufsize) return callVoid(state,UI_GETCLIPBOARDDATA,[buffer,bufsize]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_GetClientState`, returning its result for `state, UI_GETCLIENTSTATE, [clientState]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param clientState Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[clientState]`.
function trap_GetClientState(state,clientState) return callVoid(state,UI_GETCLIENTSTATE,[clientState]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_GetGlconfig`, returning its result for `state, UI_GETGLCONFIG, [glconfig]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param glconfig Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[glconfig]`.
function trap_GetGlconfig(state,glconfig) return callVoid(state,UI_GETGLCONFIG,[glconfig]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_GetConfigString`, returning its result for `state, UI_GETCONFIGSTRING, [index,buffer,bufsize]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
/// @param index Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[index,buffer,bufsize]`.
/// @param buffer Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[index,buffer,bufsize]`.
/// @param bufsize Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[index,buffer,bufsize]`.
function trap_GetConfigString(state,index,buffer,bufsize) return invoke(state,UI_GETCONFIGSTRING,[index,buffer,bufsize]) end function

/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_LAN_GetServerCount`, returning its result for `state, UI_LAN_GETSERVERCOUNT, [source]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
/// @param source Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[source]`.
function trap_LAN_GetServerCount(state,source) return invoke(state,UI_LAN_GETSERVERCOUNT,[source]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_LAN_GetServerAddressString`, returning its result for `state, UI_LAN_GETSERVERADDRESSSTRING, [source,index,buffer,buflen]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param source Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[source,index,buffer,buflen]`.
/// @param index Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[source,index,buffer,buflen]`.
/// @param buffer Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[source,index,buffer,buflen]`.
/// @param buflen Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[source,index,buffer,buflen]`.
function trap_LAN_GetServerAddressString(state,source,index,buffer,buflen) return callVoid(state,UI_LAN_GETSERVERADDRESSSTRING,[source,index,buffer,buflen]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_LAN_GetServerInfo`, returning its result for `state, UI_LAN_GETSERVERINFO, [source,index,buffer,buflen]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param source Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[source,index,buffer,buflen]`.
/// @param index Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[source,index,buffer,buflen]`.
/// @param buffer Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[source,index,buffer,buflen]`.
/// @param buflen Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[source,index,buffer,buflen]`.
function trap_LAN_GetServerInfo(state,source,index,buffer,buflen) return callVoid(state,UI_LAN_GETSERVERINFO,[source,index,buffer,buflen]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_LAN_GetServerPing`, returning its result for `state, UI_LAN_GETSERVERPING, [source,index]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
/// @param source Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[source,index]`.
/// @param index Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[source,index]`.
function trap_LAN_GetServerPing(state,source,index) return invoke(state,UI_LAN_GETSERVERPING,[source,index]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_LAN_GetPingQueueCount`, returning its result for `state, UI_LAN_GETPINGQUEUECOUNT, []`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
function trap_LAN_GetPingQueueCount(state) return invoke(state,UI_LAN_GETPINGQUEUECOUNT,[]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_LAN_ServerStatus`, returning its result for `state, UI_LAN_SERVERSTATUS, [address,status,maxLen]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
/// @param address Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[address,status,maxLen]`.
/// @param status Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[address,status,maxLen]`.
/// @param maxLen Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[address,status,maxLen]`.
function trap_LAN_ServerStatus(state,address,status,maxLen) return invoke(state,UI_LAN_SERVERSTATUS,[address,status,maxLen]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_LAN_SaveCachedServers`, returning its result for `state, UI_LAN_SAVECACHEDSERVERS, []`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
function trap_LAN_SaveCachedServers(state) return callVoid(state,UI_LAN_SAVECACHEDSERVERS,[]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_LAN_LoadCachedServers`, returning its result for `state, UI_LAN_LOADCACHEDSERVERS, []`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
function trap_LAN_LoadCachedServers(state) return callVoid(state,UI_LAN_LOADCACHEDSERVERS,[]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_LAN_ResetPings`, returning its result for `state, UI_LAN_RESETPINGS, [index]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param index Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[index]`.
function trap_LAN_ResetPings(state,index) return callVoid(state,UI_LAN_RESETPINGS,[index]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_LAN_ClearPing`, returning its result for `state, UI_LAN_CLEARPING, [index]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param index Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[index]`.
function trap_LAN_ClearPing(state,index) return callVoid(state,UI_LAN_CLEARPING,[index]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_LAN_GetPing`, returning its result for `state, UI_LAN_GETPING, [index,buffer,buflen,pingtime]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param index Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[index,buffer,buflen,pingtime]`.
/// @param buffer Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[index,buffer,buflen,pingtime]`.
/// @param buflen Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[index,buffer,buflen,pingtime]`.
/// @param pingtime Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[index,buffer,buflen,pingtime]`.
function trap_LAN_GetPing(state,index,buffer,buflen,pingtime) return callVoid(state,UI_LAN_GETPING,[index,buffer,buflen,pingtime]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_LAN_GetPingInfo`, returning its result for `state, UI_LAN_GETPINGINFO, [index,buffer,buflen]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param index Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[index,buffer,buflen]`.
/// @param buffer Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[index,buffer,buflen]`.
/// @param buflen Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[index,buffer,buflen]`.
function trap_LAN_GetPingInfo(state,index,buffer,buflen) return callVoid(state,UI_LAN_GETPINGINFO,[index,buffer,buflen]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_LAN_MarkServerVisible`, returning its result for `state, UI_LAN_MARKSERVERVISIBLE, [source,index,visible]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param source Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[source,index,visible]`.
/// @param index Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[source,index,visible]`.
/// @param visible Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[source,index,visible]`.
function trap_LAN_MarkServerVisible(state,source,index,visible) return callVoid(state,UI_LAN_MARKSERVERVISIBLE,[source,index,visible]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_LAN_ServerIsVisible`, returning its result for `state, UI_LAN_SERVERISVISIBLE, [source,index]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
/// @param source Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[source,index]`.
/// @param index Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[source,index]`.
function trap_LAN_ServerIsVisible(state,source,index) return invoke(state,UI_LAN_SERVERISVISIBLE,[source,index]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_LAN_UpdateVisiblePings`, returning its result for `state, UI_LAN_UPDATEVISIBLEPINGS, [source]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
/// @param source Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[source]`.
function trap_LAN_UpdateVisiblePings(state,source) return invoke(state,UI_LAN_UPDATEVISIBLEPINGS,[source]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_LAN_AddServer`, returning its result for `state, UI_LAN_ADDSERVER, [source,name,address]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
/// @param source Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[source,name,address]`.
/// @param name Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[source,name,address]`.
/// @param address Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[source,name,address]`.
function trap_LAN_AddServer(state,source,name,address) return invoke(state,UI_LAN_ADDSERVER,[source,name,address]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_LAN_RemoveServer`, returning its result for `state, UI_LAN_REMOVESERVER, [source,address]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param source Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[source,address]`.
/// @param address Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[source,address]`.
function trap_LAN_RemoveServer(state,source,address) return callVoid(state,UI_LAN_REMOVESERVER,[source,address]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_LAN_CompareServers`, returning its result for `state, UI_LAN_COMPARESERVERS, [source,sortKey,sortDir,first,second]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
/// @param source Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[source,sortKey,sortDir,first,second]`.
/// @param sortKey Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[source,sortKey,sortDir,first,second]`.
/// @param sortDir Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[source,sortKey,sortDir,first,second]`.
/// @param first Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[source,sortKey,sortDir,first,second]`.
/// @param second Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[source,sortKey,sortDir,first,second]`.
function trap_LAN_CompareServers(state,source,sortKey,sortDir,first,second) return invoke(state,UI_LAN_COMPARESERVERS,[source,sortKey,sortDir,first,second]) end function

/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_MemoryRemaining`, returning its result for `state, UI_MEMORY_REMAINING, []`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
function trap_MemoryRemaining(state) return invoke(state,UI_MEMORY_REMAINING,[]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_GetCDKey`, returning its result for `state, UI_GET_CDKEY, [buffer,buflen]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param buffer Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[buffer,buflen]`.
/// @param buflen Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[buffer,buflen]`.
function trap_GetCDKey(state,buffer,buflen) return callVoid(state,UI_GET_CDKEY,[buffer,buflen]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_SetCDKey`, returning its result for `state, UI_SET_CDKEY, [buffer]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param buffer Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[buffer]`.
function trap_SetCDKey(state,buffer) return callVoid(state,UI_SET_CDKEY,[buffer]) end function

/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_PC_AddGlobalDefine`, returning its result for `state, UI_PC_ADD_GLOBAL_DEFINE, [define]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
/// @param define Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[define]`.
function trap_PC_AddGlobalDefine(state,define) return invoke(state,UI_PC_ADD_GLOBAL_DEFINE,[define]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_PC_LoadSource`, returning its result for `state, UI_PC_LOAD_SOURCE, [filename]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
/// @param filename File name passed to the corresponding file/asset operation. Forwarded to `mq3.client.ui_syscalls_missionpack.invoke`.
function trap_PC_LoadSource(state,filename) return invoke(state,UI_PC_LOAD_SOURCE,[filename]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_PC_FreeSource`, returning its result for `state, UI_PC_FREE_SOURCE, [handle]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
/// @param handle Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[handle]`.
function trap_PC_FreeSource(state,handle) return invoke(state,UI_PC_FREE_SOURCE,[handle]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_PC_ReadToken`, returning its result for `state, UI_PC_READ_TOKEN, [handle,token]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
/// @param handle Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[handle,token]`.
/// @param token Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[handle,token]`.
function trap_PC_ReadToken(state,handle,token) return invoke(state,UI_PC_READ_TOKEN,[handle,token]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_PC_SourceFileAndLine`, returning its result for `state, UI_PC_SOURCE_FILE_AND_LINE, [handle,filename,line]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
/// @param handle Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[handle,filename,line]`.
/// @param filename File name passed to the corresponding file/asset operation. Forwarded to `mq3.client.ui_syscalls_missionpack.invoke`.
/// @param line Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[handle,filename,line]`.
function trap_PC_SourceFileAndLine(state,handle,filename,line) return invoke(state,UI_PC_SOURCE_FILE_AND_LINE,[handle,filename,line]) end function

/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_RealTime`, returning its result for `state, UI_REAL_TIME, [qtime]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
/// @param qtime Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[qtime]`.
function trap_RealTime(state,qtime) return invoke(state,UI_REAL_TIME,[qtime]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_CIN_PlayCinematic`, returning its result for `state, UI_CIN_PLAYCINEMATIC, [name,x,y,w,h,bits]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
/// @param name Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[name,x,y,w,h,bits]`.
/// @param x Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[name,x,y,w,h,bits]`.
/// @param y Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[name,x,y,w,h,bits]`.
/// @param w Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[name,x,y,w,h,bits]`.
/// @param h Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[name,x,y,w,h,bits]`.
/// @param bits Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[name,x,y,w,h,bits]`.
function trap_CIN_PlayCinematic(state,name,x,y,w,h,bits) return invoke(state,UI_CIN_PLAYCINEMATIC,[name,x,y,w,h,bits]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_CIN_StopCinematic`, returning its result for `state, UI_CIN_STOPCINEMATIC, [handle]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
/// @param handle Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[handle]`.
function trap_CIN_StopCinematic(state,handle) return invoke(state,UI_CIN_STOPCINEMATIC,[handle]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_CIN_RunCinematic`, returning its result for `state, UI_CIN_RUNCINEMATIC, [handle]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
/// @param handle Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[handle]`.
function trap_CIN_RunCinematic(state,handle) return invoke(state,UI_CIN_RUNCINEMATIC,[handle]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_CIN_DrawCinematic`, returning its result for `state, UI_CIN_DRAWCINEMATIC, [handle]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param handle Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[handle]`.
function trap_CIN_DrawCinematic(state,handle) return callVoid(state,UI_CIN_DRAWCINEMATIC,[handle]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_CIN_SetExtents`, returning its result for `state, UI_CIN_SETEXTENTS, [handle,x,y,w,h]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param handle Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[handle,x,y,w,h]`.
/// @param x Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[handle,x,y,w,h]`.
/// @param y Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[handle,x,y,w,h]`.
/// @param w Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[handle,x,y,w,h]`.
/// @param h Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[handle,x,y,w,h]`.
function trap_CIN_SetExtents(state,handle,x,y,w,h) return callVoid(state,UI_CIN_SETEXTENTS,[handle,x,y,w,h]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.invoke` to UI syscalls missionpack `trap_VerifyCDKey`, returning its result for `state, UI_VERIFY_CDKEY, [key,checksum]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.invoke`.
/// @param key Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[key,checksum]`.
/// @param checksum Argument 3 of `mq3.client.ui_syscalls_missionpack.invoke`; passed as `[key,checksum]`.
function trap_VerifyCDKey(state,key,checksum) return invoke(state,UI_VERIFY_CDKEY,[key,checksum]) end function
/// Adapts `mq3.client.ui_syscalls_missionpack.callVoid` to UI syscalls missionpack `trap_SetPbClStatus`, returning its result for `state, UI_SET_PBCLSTATUS, [status]`.
/// @param state Argument 1 of `mq3.client.ui_syscalls_missionpack.callVoid`.
/// @param status Argument 3 of `mq3.client.ui_syscalls_missionpack.callVoid`; passed as `[status]`.
function trap_SetPbClStatus(state,status) return callVoid(state,UI_SET_PBCLSTATUS,[status]) end function
