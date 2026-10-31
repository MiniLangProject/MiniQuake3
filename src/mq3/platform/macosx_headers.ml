// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Portable ownership facade for the eight runtime-counted macOS headers.
package mq3.platform.macosx_headers

import mq3.renderer.qgl_linked as linked

function mouseDeltaSymbols() return ["CGFix_Initialize","CGFix_GetLastMouseDelta"] end function
function privateApiSymbols() return [] end function
function controllerSymbols() return ["paste","requestTerminate","showBanner","quakeMain"] end function
function displaySymbols() return ["Sys_GetMatchingDisplayMode","Sys_StoreGammaTables","Sys_GetGammaTable","Sys_SetScreenFade","Sys_FadeScreens","Sys_FadeScreen","Sys_UnfadeScreens","Sys_UnfadeScreen","Sys_ReleaseAllDisplays"] end function
function glimpHeaderSymbols() return [] end function
function localSymbols() return ["Sys_InitInput","Sys_ShutdownInput","Sys_SetMouseInputRect","Sys_DisplayToUse","Sys_QueEvent","Sys_AnnoyingBanner","Sys_IsHidden","Sys_Hide","Sys_Unhide","glw_state","Sys_PauseGL","Sys_ResumeGL"] end function
function qglSymbols()
  result=["_glGetError"]
  for each name in linked.qglNames()
    result=result+[name]
    if name=="qglGetString" then result=result+["qglGetTexEnvfv","qglGetTexEnviv"] end if
  end for
  return result
end function
function timerSymbols() return ["rootNode","markFragmentsNode1","markFragmentsNode2","markFragmentsGrid","markFragmentsNode4","addMarkFragmentsNode","chopPolyNode","boxTraceNode","boxOnPlaneSideNode","recursiveWorldNode","surfaceAnimNode","surfaceFaceNode","surfaceMeshNode","surfaceEndNode","shadowEndNode","stageIteratorGenericNode","computeColorAndTexNode","mp3DecodeNode","InitializeTimers"] end function

const kCGSEventNotificationMouseMoved=715
const kCGSEventNotificationLeftMouseDragged=716
const kCGSEventNotificationRightMouseDragged=717
const kCGSEventNotificationOtherMouseDragged=737

struct GammaTable display tableSize red blue green end struct
struct Event time kind value1 value2 payload end struct
struct State mouseInitialized mouseDelta notifications bannerVisible terminateRequested quakeFrames clipboard displayModes stretchedModes fadedDisplays gammaTables fadeFraction inputInitialized mouseRect display hidden events context cglContext contextCurrent pauseCount qglCalls qglErrors qglBeginStarted timers timerStack timerStamps end struct

function create()
  return State(false,[0,0],[],false,false,0,"",[],[],[],[],1.0,false,[0,0,0,0],0,false,[],void,0,false,0,[],[],0,false,[],[])
end function

function CGFix_Initialize(state) state.mouseInitialized=true;state.mouseDelta=[0,0];return void end function
function CGFix_RecordMouseDelta(state,dx,dy) if state.mouseInitialized then state.mouseDelta=[dx,dy] end if;return void end function
function CGFix_GetLastMouseDelta(state) return [state.mouseDelta[0],state.mouseDelta[1]] end function

function CGSNotify(state,type,data,dataLength,argument) state.notifications=state.notifications+[[type,data,dataLength,argument]];return 0 end function
function eventRecord(type,time,location,flags,data) return [type,time,location,flags,data] end function

function paste(state,text) state.clipboard=text;state.events=state.events+[Event(0,"paste",0,0,text)];return void end function
function requestTerminate(state) state.terminateRequested=true;return void end function
function showBanner(state) state.bannerVisible=true;return void end function
function quakeMain(state,frames) if state.terminateRequested then return state.quakeFrames end if;state.quakeFrames=state.quakeFrames+frames;return state.quakeFrames end function

function Sys_GetMatchingDisplayMode(state,allowStretchedModes)
  if len(state.displayModes)==0 then return void end if
  if allowStretchedModes then return state.displayModes[0] end if
  for index=0 to len(state.displayModes)-1
    if index>=len(state.stretchedModes) or not state.stretchedModes[index] then return state.displayModes[index] end if
  end for
  return void
end function
function Sys_StoreGammaTables(state,tables) state.gammaTables=tables;return void end function
function Sys_GetGammaTable(state,display) for each table in state.gammaTables if table.display==display then return table end if end for;return void end function
function Sys_SetScreenFade(state,table,fraction) if fraction<0.0 then fraction=0.0 end if;if fraction>1.0 then fraction=1.0 end if;state.fadeFraction=fraction;return table end function
function Sys_FadeScreen(state,display) if not contains(state.fadedDisplays,display) then state.fadedDisplays=state.fadedDisplays+[display] end if;return void end function
function Sys_FadeScreens(state) for each mode in state.displayModes Sys_FadeScreen(state,mode[0]) end for;return void end function
function Sys_UnfadeScreen(state,display,table) kept=[];for each value in state.fadedDisplays if value!=display then kept=kept+[value] end if end for;state.fadedDisplays=kept;return table end function
function Sys_UnfadeScreens(state) state.fadedDisplays=[];return void end function
function Sys_ReleaseAllDisplays(state) state.fadedDisplays=[];state.displayModes=[];return void end function

function Sys_InitInput(state) state.inputInitialized=true;return void end function
function Sys_ShutdownInput(state) state.inputInitialized=false;return void end function
function Sys_SetMouseInputRect(state,rect) state.mouseRect=rect;return void end function
function Sys_DisplayToUse(state) return state.display end function
function Sys_QueEvent(state,time,kind,value1,value2,payload) state.events=state.events+[Event(time,kind,value1,value2,payload)];return void end function
function Sys_AnnoyingBanner(state) return showBanner(state) end function
function Sys_IsHidden(state) return state.hidden end function
function Sys_Hide(state) state.hidden=true;return true end function
function Sys_Unhide(state) state.hidden=false;return true end function
function OSX_SetGLContext(state,context,cglContext) state.context=context;state.cglContext=cglContext;return void end function
function OSX_GetNSGLContext(state) return state.context end function
function OSX_GetCGLContext(state) return state.cglContext end function
function OSX_GLContextIsCurrent(state) return state.contextCurrent end function
function OSX_GLContextSetCurrent(state) state.contextCurrent=state.context!=void;return state.contextCurrent end function
function OSX_GLContextClearCurrent(state) state.contextCurrent=false;return void end function
function Sys_PauseGL(state) state.pauseCount=state.pauseCount+1;state.contextCurrent=false;return state.pauseCount end function
function Sys_ResumeGL(state) if state.pauseCount>0 then state.pauseCount=state.pauseCount-1 end if;if state.pauseCount==0 then OSX_GLContextSetCurrent(state) end if;return state.pauseCount end function

function contains(values,needle) for each value in values if value==needle then return true end if end for;return false end function
function qglCall(state,name,arguments)
  if not contains(qglSymbols(),name) then return false end if
  if name=="qglBegin" then state.qglBeginStarted=state.qglBeginStarted+1 end if
  if name=="qglEnd" and state.qglBeginStarted>0 then state.qglBeginStarted=state.qglBeginStarted-1 end if
  state.qglCalls=state.qglCalls+[[name,arguments]]
  return true
end function
function QGLRaiseError(state,code) state.qglErrors=state.qglErrors+[code];return void end function
function _glGetError(state) if len(state.qglErrors)==0 then return 0 end if;code=state.qglErrors[0];kept=[];if len(state.qglErrors)>1 then for index=1 to len(state.qglErrors)-1 kept=kept+[state.qglErrors[index]] end for end if;state.qglErrors=kept;return code end function
function QGLCheckError(state,message) if state.qglBeginStarted>0 then return 0 end if;code=_glGetError(state);if code!=0 then state.events=state.events+[Event(0,"qgl-error",code,0,message)] end if;return code end function

function InitializeTimers(state) state.timers=true;state.timerStack=[];state.timerStamps=[];return void end function
function OTSTART(state,node) if state.timers then state.timerStack=state.timerStack+[node] end if;return void end function
function OTSTOP(state) if not state.timers or len(state.timerStack)==0 then return void end if;if len(state.timerStack)==1 then state.timerStack=[] else state.timerStack=slice(state.timerStack,0,len(state.timerStack)-1) end if;return void end function
function GLSTAMP(state,name,data) if state.timers then state.timerStamps=state.timerStamps+[[name,data]] end if;return void end function
