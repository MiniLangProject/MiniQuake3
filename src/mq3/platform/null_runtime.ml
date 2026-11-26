// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Exact headless/null platform surface for dedicated-server builds.
package mq3.platform.null_runtime

/// Data record for `mq3.platform.null_runtime.Address`; groups `type`, `host`, `port`.
struct Address
  /// Network address kind selecting loopback, IPv4, broadcast, or another supported transport.
  type
  /// Host address or host-service adapter associated with the operation.
  host
  /// Transport port number associated with the endpoint.
  port
end struct
/// Data record for `mq3.platform.null_runtime.Packet`; groups `destination`, `data`.
struct Packet
  /// Network endpoint to which the packet will be sent.
  destination
  /// Payload bytes carried by the queued headless-platform packet.
  data
end struct
/// Data record for `mq3.platform.null_runtime.State`; groups `clientInitialized`, `inputInitialized`, `glInitialized`, `qglInitialized`, `logging`, `frames`, and 8 further fields.
struct State
  /// Whether client-side platform services have initialized.
  clientInitialized
  /// Whether native input processing has initialized.
  inputInitialized
  /// Whether the platform graphics context has initialized.
  glInitialized
  /// Whether graphics entry-point binding has initialized.
  qglInitialized
  /// Whether graphics or platform call logging is enabled.
  logging
  /// Number of headless platform frames processed.
  frames
  /// Number of input-frame updates processed by the platform adapter.
  inputFrames
  /// Number of graphics-frame updates processed by the platform adapter.
  glFrames
  /// Sound resource registrations recorded by the platform adapter.
  soundRegistrations
  /// Local sound playback requests recorded by the platform adapter.
  localSounds
  /// Network packets submitted through the platform adapter.
  sentPackets
  /// Text accumulated in the platform console buffer.
  consoleText
  /// Whether application shutdown has been requested.
  quitRequested
  /// Errors recorded by this subsystem or its host callbacks.
  errors
end struct

/// Network-address sentinel identifying an invalid or unresolved address.
const NA_BAD=1
/// Network-address type for in-process loopback transport.
const NA_LOOPBACK=2

/// Lists the 3 declared names for `mq3.platform.null_runtime.macNetSymbols`, including `NET_StringToAdr`, `Sys_GetPacket`, `Sys_SendPacket`.
function macNetSymbols() return ["NET_StringToAdr","Sys_GetPacket","Sys_SendPacket"] end function
/// Lists the 21 declared names for `mq3.platform.null_runtime.nullClientSymbols`, including `CL_CDDialog`, `CL_CDKeyValidate`, `CL_CharEvent`, `CL_ConsolePrint`.
function nullClientSymbols() return ["CL_CDDialog","CL_CDKeyValidate","CL_CharEvent","CL_ConsolePrint","CL_Disconnect","CL_FlushMemory","CL_ForwardCommandToServer","CL_Frame","CL_GameCommand","CL_Init","CL_InitKeyCommands","CL_JoystickEvent","CL_KeyEvent","CL_MapLoading","CL_MouseEvent","CL_PacketEvent","CL_Shutdown","CL_ShutdownAll","CL_StartHunkUsers","Key_WriteBindings","UI_GameCommand"] end function
/// Lists the 7 declared names for `mq3.platform.null_runtime.nullGlimpSymbols`, including `GLimp_EnableLogging`, `GLimp_EndFrame`, `GLimp_Init`, `GLimp_LogComment`.
function nullGlimpSymbols() return ["GLimp_EnableLogging","GLimp_EndFrame","GLimp_Init","GLimp_LogComment","GLimp_Shutdown","QGL_Init","QGL_Shutdown"] end function
/// Lists the 4 declared names for `mq3.platform.null_runtime.nullInputSymbols`, including `IN_Frame`, `IN_Init`, `IN_Shutdown`, `Sys_SendKeyEvents`.
function nullInputSymbols() return ["IN_Frame","IN_Init","IN_Shutdown","Sys_SendKeyEvents"] end function
/// Lists the 18 declared names for `mq3.platform.null_runtime.nullMainSymbols`, including `Sys_BeginStreamedFile`, `Sys_EarlyOutput`, `Sys_EndStreamedFile`, `Sys_Error`.
function nullMainSymbols() return ["Sys_BeginStreamedFile","Sys_EarlyOutput","Sys_EndStreamedFile","Sys_Error","Sys_FindClose","Sys_FindFirst","Sys_FindNext","Sys_GetClipboardData","Sys_GetGameAPI","Sys_Init","Sys_Milliseconds","Sys_Mkdir","Sys_Quit","Sys_StreamSeek","Sys_StreamedRead","Sys_UnloadGame","Sys_mkdir","main"] end function
/// Lists the 3 declared names for `mq3.platform.null_runtime.nullNetSymbols`, including `NET_StringToAdr`, `Sys_GetPacket`, `Sys_SendPacket`.
function nullNetSymbols() return ["NET_StringToAdr","Sys_GetPacket","Sys_SendPacket"] end function
/// Lists the 8 declared names for `mq3.platform.null_runtime.nullSoundSymbols`, including `SNDDMA_BeginPainting`, `SNDDMA_GetDMAPos`, `SNDDMA_Init`, `SNDDMA_Shutdown`.
function nullSoundSymbols() return ["SNDDMA_BeginPainting","SNDDMA_GetDMAPos","SNDDMA_Init","SNDDMA_Shutdown","SNDDMA_Submit","S_ClearSoundBuffer","S_RegisterSound","S_StartLocalSound"] end function

/// Constructs `mq3.platform.null_runtime.State` with `clientInitialized` = `false`, `inputInitialized` = `false`, `glInitialized` = `false`, `qglInitialized` = `false` and the supplied remaining values.
function create() return State(false,false,false,false,false,0,0,0,0,0,[],"",false,[]) end function

/// Updates `state.clientInitialized` in `mq3.platform.null_runtime.CL_Init`.
/// @param state Mutable record or buffer; this call updates `state.clientInitialized`.
function CL_Init(state) state.clientInitialized=true;return void end function
/// Updates `state.clientInitialized` in `mq3.platform.null_runtime.CL_Shutdown`.
/// @param state Mutable record or buffer; this call updates `state.clientInitialized`.
function CL_Shutdown(state) state.clientInitialized=false;return void end function
/// Calls `mq3.platform.null_runtime.CL_Shutdown` with `(state)` and returns its result.
/// @param state Value forwarded as `state` to `mq3.platform.null_runtime.CL_Shutdown`.
function CL_ShutdownAll(state) return CL_Shutdown(state) end function
/// Updates `state.frames` in `mq3.platform.null_runtime.CL_Frame`.
/// @param state Mutable record or buffer; this call updates `state.frames`.
/// @param msec Unused compatibility argument retained by this entry point.
function CL_Frame(state,msec) state.frames=state.frames+1;return void end function
/// Returns `false` for the `mq3.platform.null_runtime.CL_GameCommand` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function CL_GameCommand(state) return false end function
/// Returns `false` for the `mq3.platform.null_runtime.UI_GameCommand` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function UI_GameCommand(state) return false end function
/// Returns `true` for the `mq3.platform.null_runtime.CL_CDKeyValidate` compatibility entry point.
/// @param key Unused compatibility argument retained by this entry point.
/// @param checksum Unused compatibility argument retained by this entry point.
function CL_CDKeyValidate(key,checksum) return true end function
/// Updates `state.consoleText` in `mq3.platform.null_runtime.CL_ConsolePrint`.
/// @param state Mutable record or buffer; this call updates `state.consoleText`.
/// @param text Input used by `state.consoleText=state.consoleText+text`.
function CL_ConsolePrint(state,text) state.consoleText=state.consoleText+text;return void end function
/// Returns `void` for the `mq3.platform.null_runtime.CL_PacketEvent` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param source Unused compatibility argument retained by this entry point.
/// @param message Unused compatibility argument retained by this entry point.
function CL_PacketEvent(state,source,message) return void end function
/// Returns `void` for the `mq3.platform.null_runtime.CL_CharEvent` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param key Unused compatibility argument retained by this entry point.
function CL_CharEvent(state,key) return void end function
/// Returns `void` for the `mq3.platform.null_runtime.CL_Disconnect` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param showMainMenu Unused compatibility argument retained by this entry point.
function CL_Disconnect(state,showMainMenu) return void end function
/// Returns `void` for the `mq3.platform.null_runtime.CL_MapLoading` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function CL_MapLoading(state) return void end function
/// Returns `void` for the `mq3.platform.null_runtime.CL_KeyEvent` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param key Unused compatibility argument retained by this entry point.
/// @param down Unused compatibility argument retained by this entry point.
/// @param time Unused compatibility argument retained by this entry point.
function CL_KeyEvent(state,key,down,time) return void end function
/// Returns `void` for the `mq3.platform.null_runtime.CL_MouseEvent` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param dx Unused compatibility argument retained by this entry point.
/// @param dy Unused compatibility argument retained by this entry point.
/// @param time Unused compatibility argument retained by this entry point.
function CL_MouseEvent(state,dx,dy,time) return void end function
/// Returns `void` for the `mq3.platform.null_runtime.CL_JoystickEvent` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param axis Unused compatibility argument retained by this entry point.
/// @param value Unused compatibility argument retained by this entry point.
/// @param time Unused compatibility argument retained by this entry point.
function CL_JoystickEvent(state,axis,value,time) return void end function
/// Returns `void` for the `mq3.platform.null_runtime.CL_ForwardCommandToServer` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param text Unused compatibility argument retained by this entry point.
function CL_ForwardCommandToServer(state,text) return void end function
/// Returns `void` for the `mq3.platform.null_runtime.CL_InitKeyCommands` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function CL_InitKeyCommands(state) return void end function
/// Returns `void` for the `mq3.platform.null_runtime.CL_CDDialog` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function CL_CDDialog(state) return void end function
/// Returns `void` for the `mq3.platform.null_runtime.CL_FlushMemory` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function CL_FlushMemory(state) return void end function
/// Returns `void` for the `mq3.platform.null_runtime.CL_StartHunkUsers` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function CL_StartHunkUsers(state) return void end function
/// Returns `void` for the `mq3.platform.null_runtime.Key_WriteBindings` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param file Unused compatibility argument retained by this entry point.
function Key_WriteBindings(state,file) return void end function

/// Updates `state.glInitialized` in `mq3.platform.null_runtime.GLimp_Init`; returns `0`.
/// @param state Mutable record or buffer; this call updates `state.glInitialized`.
function GLimp_Init(state) state.glInitialized=true;return 0 end function
/// Updates `state.glInitialized` in `mq3.platform.null_runtime.GLimp_Shutdown`.
/// @param state Mutable record or buffer; this call updates `state.glInitialized`.
function GLimp_Shutdown(state) state.glInitialized=false;return void end function
/// Updates `state.glFrames` in `mq3.platform.null_runtime.GLimp_EndFrame`.
/// @param state Mutable record or buffer; this call updates `state.glFrames`.
function GLimp_EndFrame(state) state.glFrames=state.glFrames+1;return void end function
/// Updates `state.logging` in `mq3.platform.null_runtime.GLimp_EnableLogging`.
/// @param state Mutable record or buffer; this call updates `state.logging`.
/// @param enabled Value assigned to `state.logging`.
function GLimp_EnableLogging(state,enabled) state.logging=enabled;return void end function
/// Updates `state.consoleText` in `mq3.platform.null_runtime.GLimp_LogComment`.
/// @param state Mutable record or buffer; this call updates `state.consoleText`.
/// @param comment Input tested by `state.logging`.
function GLimp_LogComment(state,comment) if state.logging then state.consoleText=state.consoleText+comment end if;return void end function
/// Updates `state.qglInitialized` in `mq3.platform.null_runtime.QGL_Init`; returns `true`.
/// @param state Mutable record or buffer; this call updates `state.qglInitialized`.
/// @param dllname Unused compatibility argument retained by this entry point.
function QGL_Init(state,dllname) state.qglInitialized=true;return true end function
/// Updates `state.qglInitialized` in `mq3.platform.null_runtime.QGL_Shutdown`.
/// @param state Mutable record or buffer; this call updates `state.qglInitialized`.
function QGL_Shutdown(state) state.qglInitialized=false;return void end function

/// Updates `state.inputInitialized` in `mq3.platform.null_runtime.IN_Init`.
/// @param state Mutable record or buffer; this call updates `state.inputInitialized`.
function IN_Init(state) state.inputInitialized=true;return void end function
/// Updates `state.inputFrames` in `mq3.platform.null_runtime.IN_Frame`.
/// @param state Mutable record or buffer; this call updates `state.inputFrames`.
function IN_Frame(state) state.inputFrames=state.inputFrames+1;return void end function
/// Updates `state.inputInitialized` in `mq3.platform.null_runtime.IN_Shutdown`.
/// @param state Mutable record or buffer; this call updates `state.inputInitialized`.
function IN_Shutdown(state) state.inputInitialized=false;return void end function
/// Returns `void` for the `mq3.platform.null_runtime.Sys_SendKeyEvents` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function Sys_SendKeyEvents(state) return void end function

/// Returns `void` from `mq3.platform.null_runtime.NET_StringToAdr`; earlier branches return `Address(NA_LOOPBACK,"localhost",0)`.
/// @param text Input tested by `text=="localhost"`.
function NET_StringToAdr(text)
  if text=="localhost" then return Address(NA_LOOPBACK,"localhost",0) end if
  return void
end function
/// Updates `state.sentPackets` in `mq3.platform.null_runtime.Sys_SendPacket`.
/// @param state Mutable record or buffer; this call updates `state.sentPackets`.
/// @param length Input used by `count=length`.
/// @param data Argument 1 supplied to `slice`.
/// @param destination Value used for `mq3.platform.null_runtime.Packet.destination`.
function Sys_SendPacket(state,length,data,destination)
  count=length;if count<0 then count=0 end if;if count>len(data) then count=len(data) end if
  state.sentPackets=state.sentPackets+[Packet(destination,slice(data,0,count))];return void
end function
/// Returns `void` for the `mq3.platform.null_runtime.Sys_GetPacket` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function Sys_GetPacket(state) return void end function

/// Returns `false` for the `mq3.platform.null_runtime.SNDDMA_Init` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function SNDDMA_Init(state) return false end function
/// Returns `0` for the `mq3.platform.null_runtime.SNDDMA_GetDMAPos` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function SNDDMA_GetDMAPos(state) return 0 end function
/// Returns `void` for the `mq3.platform.null_runtime.SNDDMA_Shutdown` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function SNDDMA_Shutdown(state) return void end function
/// Returns `void` for the `mq3.platform.null_runtime.SNDDMA_BeginPainting` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function SNDDMA_BeginPainting(state) return void end function
/// Returns `void` for the `mq3.platform.null_runtime.SNDDMA_Submit` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function SNDDMA_Submit(state) return void end function
/// Updates `state.soundRegistrations` in `mq3.platform.null_runtime.S_RegisterSound`; returns `0`.
/// @param state Mutable record or buffer; this call updates `state.soundRegistrations`.
/// @param name Unused compatibility argument retained by this entry point.
/// @param compressed Unused compatibility argument retained by this entry point.
function S_RegisterSound(state,name,compressed) state.soundRegistrations=state.soundRegistrations+1;return 0 end function
/// Updates `state.localSounds` in `mq3.platform.null_runtime.S_StartLocalSound`.
/// @param state Mutable record or buffer; this call updates `state.localSounds`.
/// @param handle Unused compatibility argument retained by this entry point.
/// @param channel Unused compatibility argument retained by this entry point.
function S_StartLocalSound(state,handle,channel) state.localSounds=state.localSounds+1;return void end function
/// Returns `void` for the `mq3.platform.null_runtime.S_ClearSoundBuffer` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function S_ClearSoundBuffer(state) return void end function

/// Returns `void` for the `mq3.platform.null_runtime.Sys_BeginStreamedFile` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param file Unused compatibility argument retained by this entry point.
/// @param readAhead Unused compatibility argument retained by this entry point.
function Sys_BeginStreamedFile(state,file,readAhead) return void end function
/// Returns `void` for the `mq3.platform.null_runtime.Sys_EndStreamedFile` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param file Unused compatibility argument retained by this entry point.
function Sys_EndStreamedFile(state,file) return void end function
/// Returns `0` for the `mq3.platform.null_runtime.Sys_StreamedRead` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param buffer Unused compatibility argument retained by this entry point.
/// @param size Unused compatibility argument retained by this entry point.
/// @param count Unused compatibility argument retained by this entry point.
/// @param file Unused compatibility argument retained by this entry point.
function Sys_StreamedRead(state,buffer,size,count,file) return 0 end function
/// Returns `void` for the `mq3.platform.null_runtime.Sys_StreamSeek` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param file Unused compatibility argument retained by this entry point.
/// @param offset Unused compatibility argument retained by this entry point.
/// @param origin Unused compatibility argument retained by this entry point.
function Sys_StreamSeek(state,file,offset,origin) return void end function
/// Returns `void` for the `mq3.platform.null_runtime.Sys_mkdir` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param path Unused compatibility argument retained by this entry point.
function Sys_mkdir(state,path) return void end function
/// Returns `void` for the `mq3.platform.null_runtime.Sys_Mkdir` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param path Unused compatibility argument retained by this entry point.
function Sys_Mkdir(state,path) return void end function
/// Updates `state.errors` in `mq3.platform.null_runtime.Sys_Error`; returns `error(7979,"Sys_Error: "+message)`.
/// @param state Mutable record or buffer; this call updates `state.errors`.
/// @param message Input used by `state.errors=state.errors+[message]`.
function Sys_Error(state,message) state.errors=state.errors+[message];return error(7979,"Sys_Error: "+message) end function
/// Updates `state.quitRequested` in `mq3.platform.null_runtime.Sys_Quit`.
/// @param state Mutable record or buffer; this call updates `state.quitRequested`.
function Sys_Quit(state) state.quitRequested=true;return void end function
/// Returns `void` for the `mq3.platform.null_runtime.Sys_UnloadGame` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function Sys_UnloadGame(state) return void end function
/// Returns `void` for the `mq3.platform.null_runtime.Sys_GetGameAPI` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param parameters Unused compatibility argument retained by this entry point.
function Sys_GetGameAPI(state,parameters) return void end function
/// Returns `void` for the `mq3.platform.null_runtime.Sys_GetClipboardData` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function Sys_GetClipboardData(state) return void end function
/// Returns `0` for the `mq3.platform.null_runtime.Sys_Milliseconds` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function Sys_Milliseconds(state) return 0 end function
/// Returns `void` for the `mq3.platform.null_runtime.Sys_FindFirst` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param path Unused compatibility argument retained by this entry point.
/// @param mustHave Unused compatibility argument retained by this entry point.
/// @param cantHave Unused compatibility argument retained by this entry point.
function Sys_FindFirst(state,path,mustHave,cantHave) return void end function
/// Returns `void` for the `mq3.platform.null_runtime.Sys_FindNext` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param mustHave Unused compatibility argument retained by this entry point.
/// @param cantHave Unused compatibility argument retained by this entry point.
function Sys_FindNext(state,mustHave,cantHave) return void end function
/// Returns `void` for the `mq3.platform.null_runtime.Sys_FindClose` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function Sys_FindClose(state) return void end function
/// Computes `state` for `mq3.platform.null_runtime.Sys_Init`.
/// @param state Input used in the result expression `state`.
function Sys_Init(state) return state end function
/// Updates `state.consoleText` in `mq3.platform.null_runtime.Sys_EarlyOutput`.
/// @param state Mutable record or buffer; this call updates `state.consoleText`.
/// @param text Input used by `state.consoleText=state.consoleText+text`.
function Sys_EarlyOutput(state,text) state.consoleText=state.consoleText+text;return void end function

// Bounded equivalent of the original endless headless main loop.
/// @param state Record providing `state.quitRequested`, `state.frames`.
/// @param frameCount Input tested by `state==void or frameCount<0 or frameFn==void`.
/// @param frameFn Input tested by `state==void or frameCount<0 or frameFn==void`.
/// @param context Argument 1 supplied to `frameFn`.
function headlessMain(state,frameCount,frameFn,context)
  if state==void or frameCount<0 or frameFn==void then return error(7979,"invalid null main loop") end if
  for index=0 to frameCount-1 frameFn(context);CL_Frame(state,0);if state.quitRequested then break end if end for
  return state.frames
end function
