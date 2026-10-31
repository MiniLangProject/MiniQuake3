// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Exact headless/null platform surface for dedicated-server builds.
package mq3.platform.null_runtime

struct Address type host port end struct
struct Packet destination data end struct
struct State clientInitialized inputInitialized glInitialized qglInitialized logging frames inputFrames glFrames soundRegistrations localSounds sentPackets consoleText quitRequested errors end struct

const NA_BAD=1
const NA_LOOPBACK=2

function macNetSymbols() return ["NET_StringToAdr","Sys_GetPacket","Sys_SendPacket"] end function
function nullClientSymbols() return ["CL_CDDialog","CL_CDKeyValidate","CL_CharEvent","CL_ConsolePrint","CL_Disconnect","CL_FlushMemory","CL_ForwardCommandToServer","CL_Frame","CL_GameCommand","CL_Init","CL_InitKeyCommands","CL_JoystickEvent","CL_KeyEvent","CL_MapLoading","CL_MouseEvent","CL_PacketEvent","CL_Shutdown","CL_ShutdownAll","CL_StartHunkUsers","Key_WriteBindings","UI_GameCommand"] end function
function nullGlimpSymbols() return ["GLimp_EnableLogging","GLimp_EndFrame","GLimp_Init","GLimp_LogComment","GLimp_Shutdown","QGL_Init","QGL_Shutdown"] end function
function nullInputSymbols() return ["IN_Frame","IN_Init","IN_Shutdown","Sys_SendKeyEvents"] end function
function nullMainSymbols() return ["Sys_BeginStreamedFile","Sys_EarlyOutput","Sys_EndStreamedFile","Sys_Error","Sys_FindClose","Sys_FindFirst","Sys_FindNext","Sys_GetClipboardData","Sys_GetGameAPI","Sys_Init","Sys_Milliseconds","Sys_Mkdir","Sys_Quit","Sys_StreamSeek","Sys_StreamedRead","Sys_UnloadGame","Sys_mkdir","main"] end function
function nullNetSymbols() return ["NET_StringToAdr","Sys_GetPacket","Sys_SendPacket"] end function
function nullSoundSymbols() return ["SNDDMA_BeginPainting","SNDDMA_GetDMAPos","SNDDMA_Init","SNDDMA_Shutdown","SNDDMA_Submit","S_ClearSoundBuffer","S_RegisterSound","S_StartLocalSound"] end function

function create() return State(false,false,false,false,false,0,0,0,0,0,[],"",false,[]) end function

function CL_Init(state) state.clientInitialized=true;return void end function
function CL_Shutdown(state) state.clientInitialized=false;return void end function
function CL_ShutdownAll(state) return CL_Shutdown(state) end function
function CL_Frame(state,msec) state.frames=state.frames+1;return void end function
function CL_GameCommand(state) return false end function
function UI_GameCommand(state) return false end function
function CL_CDKeyValidate(key,checksum) return true end function
function CL_ConsolePrint(state,text) state.consoleText=state.consoleText+text;return void end function
function CL_PacketEvent(state,source,message) return void end function
function CL_CharEvent(state,key) return void end function
function CL_Disconnect(state,showMainMenu) return void end function
function CL_MapLoading(state) return void end function
function CL_KeyEvent(state,key,down,time) return void end function
function CL_MouseEvent(state,dx,dy,time) return void end function
function CL_JoystickEvent(state,axis,value,time) return void end function
function CL_ForwardCommandToServer(state,text) return void end function
function CL_InitKeyCommands(state) return void end function
function CL_CDDialog(state) return void end function
function CL_FlushMemory(state) return void end function
function CL_StartHunkUsers(state) return void end function
function Key_WriteBindings(state,file) return void end function

function GLimp_Init(state) state.glInitialized=true;return 0 end function
function GLimp_Shutdown(state) state.glInitialized=false;return void end function
function GLimp_EndFrame(state) state.glFrames=state.glFrames+1;return void end function
function GLimp_EnableLogging(state,enabled) state.logging=enabled;return void end function
function GLimp_LogComment(state,comment) if state.logging then state.consoleText=state.consoleText+comment end if;return void end function
function QGL_Init(state,dllname) state.qglInitialized=true;return true end function
function QGL_Shutdown(state) state.qglInitialized=false;return void end function

function IN_Init(state) state.inputInitialized=true;return void end function
function IN_Frame(state) state.inputFrames=state.inputFrames+1;return void end function
function IN_Shutdown(state) state.inputInitialized=false;return void end function
function Sys_SendKeyEvents(state) return void end function

function NET_StringToAdr(text)
  if text=="localhost" then return Address(NA_LOOPBACK,"localhost",0) end if
  return void
end function
function Sys_SendPacket(state,length,data,destination)
  count=length;if count<0 then count=0 end if;if count>len(data) then count=len(data) end if
  state.sentPackets=state.sentPackets+[Packet(destination,slice(data,0,count))];return void
end function
function Sys_GetPacket(state) return void end function

function SNDDMA_Init(state) return false end function
function SNDDMA_GetDMAPos(state) return 0 end function
function SNDDMA_Shutdown(state) return void end function
function SNDDMA_BeginPainting(state) return void end function
function SNDDMA_Submit(state) return void end function
function S_RegisterSound(state,name,compressed) state.soundRegistrations=state.soundRegistrations+1;return 0 end function
function S_StartLocalSound(state,handle,channel) state.localSounds=state.localSounds+1;return void end function
function S_ClearSoundBuffer(state) return void end function

function Sys_BeginStreamedFile(state,file,readAhead) return void end function
function Sys_EndStreamedFile(state,file) return void end function
function Sys_StreamedRead(state,buffer,size,count,file) return 0 end function
function Sys_StreamSeek(state,file,offset,origin) return void end function
function Sys_mkdir(state,path) return void end function
function Sys_Mkdir(state,path) return void end function
function Sys_Error(state,message) state.errors=state.errors+[message];return error(7979,"Sys_Error: "+message) end function
function Sys_Quit(state) state.quitRequested=true;return void end function
function Sys_UnloadGame(state) return void end function
function Sys_GetGameAPI(state,parameters) return void end function
function Sys_GetClipboardData(state) return void end function
function Sys_Milliseconds(state) return 0 end function
function Sys_FindFirst(state,path,mustHave,cantHave) return void end function
function Sys_FindNext(state,mustHave,cantHave) return void end function
function Sys_FindClose(state) return void end function
function Sys_Init(state) return state end function
function Sys_EarlyOutput(state,text) state.consoleText=state.consoleText+text;return void end function

// Bounded equivalent of the original endless headless main loop.
function headlessMain(state,frameCount,frameFn,context)
  if state==void or frameCount<0 or frameFn==void then return error(7979,"invalid null main loop") end if
  for index=0 to frameCount-1 frameFn(context);CL_Frame(state,0);if state.quitRequested then break end if end for
  return state.frames
end function
