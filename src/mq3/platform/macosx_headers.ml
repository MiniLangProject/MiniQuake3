// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Portable ownership facade for the eight runtime-counted macOS headers.
package mq3.platform.macosx_headers

import mq3.renderer.qgl_linked as linked

/// Lists the 2 declared names for `mq3.platform.macosx_headers.mouseDeltaSymbols`, including `CGFix_Initialize`, `CGFix_GetLastMouseDelta`.
function mouseDeltaSymbols() return ["CGFix_Initialize","CGFix_GetLastMouseDelta"] end function
/// Returns `[]` for the `mq3.platform.macosx_headers.privateApiSymbols` compatibility entry point.
function privateApiSymbols() return [] end function
/// Lists the 4 declared names for `mq3.platform.macosx_headers.controllerSymbols`, including `paste`, `requestTerminate`, `showBanner`, `quakeMain`.
function controllerSymbols() return ["paste","requestTerminate","showBanner","quakeMain"] end function
/// Lists the 9 declared names for `mq3.platform.macosx_headers.displaySymbols`, including `Sys_GetMatchingDisplayMode`, `Sys_StoreGammaTables`, `Sys_GetGammaTable`, `Sys_SetScreenFade`.
function displaySymbols() return ["Sys_GetMatchingDisplayMode","Sys_StoreGammaTables","Sys_GetGammaTable","Sys_SetScreenFade","Sys_FadeScreens","Sys_FadeScreen","Sys_UnfadeScreens","Sys_UnfadeScreen","Sys_ReleaseAllDisplays"] end function
/// Returns `[]` for the `mq3.platform.macosx_headers.glimpHeaderSymbols` compatibility entry point.
function glimpHeaderSymbols() return [] end function
/// Lists the 12 declared names for `mq3.platform.macosx_headers.localSymbols`, including `Sys_InitInput`, `Sys_ShutdownInput`, `Sys_SetMouseInputRect`, `Sys_DisplayToUse`.
function localSymbols() return ["Sys_InitInput","Sys_ShutdownInput","Sys_SetMouseInputRect","Sys_DisplayToUse","Sys_QueEvent","Sys_AnnoyingBanner","Sys_IsHidden","Sys_Hide","Sys_Unhide","glw_state","Sys_PauseGL","Sys_ResumeGL"] end function
/// Returns `result` from `mq3.platform.macosx_headers.qglSymbols`.
function qglSymbols()
  result=["_glGetError"]
  for each name in linked.qglNames()
    result=result+[name]
    if name=="qglGetString" then result=result+["qglGetTexEnvfv","qglGetTexEnviv"] end if
  end for
  return result
end function
/// Lists the 19 declared names for `mq3.platform.macosx_headers.timerSymbols`, including `rootNode`, `markFragmentsNode1`, `markFragmentsNode2`, `markFragmentsGrid`.
function timerSymbols() return ["rootNode","markFragmentsNode1","markFragmentsNode2","markFragmentsGrid","markFragmentsNode4","addMarkFragmentsNode","chopPolyNode","boxTraceNode","boxOnPlaneSideNode","recursiveWorldNode","surfaceAnimNode","surfaceFaceNode","surfaceMeshNode","surfaceEndNode","shadowEndNode","stageIteratorGenericNode","computeColorAndTexNode","mp3DecodeNode","InitializeTimers"] end function

/// Core Graphics Services notification identifier for mouse movement.
const kCGSEventNotificationMouseMoved=715
/// Core Graphics Services notification identifier for dragging with the left mouse button.
const kCGSEventNotificationLeftMouseDragged=716
/// Core Graphics Services notification identifier for dragging with the right mouse button.
const kCGSEventNotificationRightMouseDragged=717
/// Core Graphics Services notification identifier for dragging with another mouse button.
const kCGSEventNotificationOtherMouseDragged=737

/// Data record for `mq3.platform.macosx_headers.GammaTable`; groups `display`, `tableSize`, `red`, `blue`, `green`.
struct GammaTable
  /// Display identifier used for video and gamma operations.
  display
  /// Number of samples in each gamma-ramp channel.
  tableSize
  /// Red-channel gamma-ramp samples.
  red
  /// Blue-channel gamma-ramp samples.
  blue
  /// Green-channel gamma-ramp samples.
  green
end struct
/// Data record for `mq3.platform.macosx_headers.Event`; groups `time`, `kind`, `value1`, `value2`, `payload`.
struct Event
  /// Millisecond timestamp carried by the macOS platform event adapter.
  time
  /// System-event category selecting how the accompanying values are interpreted.
  kind
  /// Primary event value: a key or character code, horizontal motion, or joystick-axis selector.
  value1
  /// Secondary event value: key press state, vertical motion, or joystick-axis magnitude.
  value2
  /// Operation-specific data interpreted according to the record's command or event type.
  payload
end struct
/// Data record for `mq3.platform.macosx_headers.State`; groups `mouseInitialized`, `mouseDelta`, `notifications`, `bannerVisible`, `terminateRequested`, `quakeFrames`, and 21 further fields.
struct State
  /// Whether the native mouse subsystem has initialized.
  mouseInitialized
  /// Accumulated relative mouse movement waiting for the next frame.
  mouseDelta
  /// Native input or display notifications registered by the platform layer.
  notifications
  /// Whether the platform startup banner is visible.
  bannerVisible
  /// Whether the native application requested termination.
  terminateRequested
  /// Number of engine frame callbacks processed by the platform layer.
  quakeFrames
  /// Text currently available through the platform clipboard adapter.
  clipboard
  /// Display modes enumerated from the native video subsystem.
  displayModes
  /// Display modes configured to stretch the rendering surface.
  stretchedModes
  /// Displays currently affected by a fade transition.
  fadedDisplays
  /// Saved or current gamma ramps indexed by display.
  gammaTables
  /// Interpolation fraction of the current display fade.
  fadeFraction
  /// Whether native input processing has initialized.
  inputInitialized
  /// Rectangle to which native mouse movement is constrained.
  mouseRect
  /// Display identifier used for video and gamma operations.
  display
  /// Whether the native window or application is hidden.
  hidden
  /// Pending input or system events awaiting delivery.
  events
  /// Native NSOpenGL context retained alongside its CGL context handle.
  context
  /// Native macOS OpenGL context handle.
  cglContext
  /// Whether the graphics context is current on the calling thread.
  contextCurrent
  /// Number of nested platform pause requests.
  pauseCount
  /// Graphics calls recorded by the platform OpenGL adapter.
  qglCalls
  /// Errors recorded while dispatching graphics calls.
  qglErrors
  /// Whether an immediate-mode graphics primitive is open.
  qglBeginStarted
  /// Named timing measurements collected by the platform adapter.
  timers
  /// Stack of currently active timing scopes.
  timerStack
  /// Clock samples associated with the timing measurements.
  timerStamps
end struct

/// Constructs `mq3.platform.macosx_headers.State` with `mouseInitialized` = `false`, `mouseDelta` = `[0,0]`, `notifications` = `[]`, `bannerVisible` = `false` and the supplied remaining values.
function create()
  return State(false,[0,0],[],false,false,0,"",[],[],[],[],1.0,false,[0,0,0,0],0,false,[],void,0,false,0,[],[],0,false,[],[])
end function

/// Updates `state.mouseInitialized`, `state.mouseDelta` in `mq3.platform.macosx_headers.CGFix_Initialize`.
/// @param state Mutable record or buffer; this call updates `state.mouseInitialized`, `state.mouseDelta`.
function CGFix_Initialize(state) state.mouseInitialized=true;state.mouseDelta=[0,0];return void end function
/// Updates `state.mouseDelta` in `mq3.platform.macosx_headers.CGFix_RecordMouseDelta`.
/// @param state Mutable record or buffer; this call updates `state.mouseDelta`.
/// @param dx Input tested by `state.mouseInitialized`.
/// @param dy Input tested by `state.mouseInitialized`.
function CGFix_RecordMouseDelta(state,dx,dy) if state.mouseInitialized then state.mouseDelta=[dx,dy] end if;return void end function
/// Returns `[state.mouseDelta[0],state.mouseDelta[1]]` for `mq3.platform.macosx_headers.CGFix_GetLastMouseDelta`.
/// @param state Record providing `state.mouseDelta`.
function CGFix_GetLastMouseDelta(state) return [state.mouseDelta[0],state.mouseDelta[1]] end function

/// Updates `state.notifications` in `mq3.platform.macosx_headers.CGSNotify`; returns `0`.
/// @param state Mutable record or buffer; this call updates `state.notifications`.
/// @param type Input used by `state.notifications=state.notifications+[[type,data,dataLength,argument]]`.
/// @param data Input used by `state.notifications=state.notifications+[[type,data,dataLength,argument]]`.
/// @param dataLength Input used by `state.notifications=state.notifications+[[type,data,dataLength,argument]]`.
/// @param argument Input used by `state.notifications=state.notifications+[[type,data,dataLength,argument]]`.
function CGSNotify(state,type,data,dataLength,argument) state.notifications=state.notifications+[[type,data,dataLength,argument]];return 0 end function
/// Returns `[type,time,location,flags,data]` for `mq3.platform.macosx_headers.eventRecord`.
/// @param type Input used in the result expression `[type,time,location,flags,data]`.
/// @param time Input used in the result expression `[type,time,location,flags,data]`.
/// @param location Input used in the result expression `[type,time,location,flags,data]`.
/// @param flags Input used in the result expression `[type,time,location,flags,data]`.
/// @param data Input used in the result expression `[type,time,location,flags,data]`.
function eventRecord(type,time,location,flags,data) return [type,time,location,flags,data] end function

/// Updates `state.clipboard`, `state.events` in `mq3.platform.macosx_headers.paste`.
/// @param state Mutable record or buffer; this call updates `state.clipboard`, `state.events`.
/// @param text Value assigned to `state.clipboard`.
function paste(state,text) state.clipboard=text;state.events=state.events+[Event(0,"paste",0,0,text)];return void end function
/// Updates `state.terminateRequested` in `mq3.platform.macosx_headers.requestTerminate`.
/// @param state Mutable record or buffer; this call updates `state.terminateRequested`.
function requestTerminate(state) state.terminateRequested=true;return void end function
/// Updates `state.bannerVisible` in `mq3.platform.macosx_headers.showBanner`.
/// @param state Mutable record or buffer; this call updates `state.bannerVisible`.
function showBanner(state) state.bannerVisible=true;return void end function
/// Updates `state.quakeFrames` in `mq3.platform.macosx_headers.quakeMain`; returns `state.quakeFrames`.
/// @param state Mutable record or buffer; this call updates `state.quakeFrames`.
/// @param frames Input used by `state.quakeFrames=state.quakeFrames+frames`.
function quakeMain(state,frames) if state.terminateRequested then return state.quakeFrames end if;state.quakeFrames=state.quakeFrames+frames;return state.quakeFrames end function

/// Selects the first allowed display mode, optionally permitting stretched modes; returns void when none matches.
/// @param state Record providing `state.displayModes`, `state.stretchedModes`.
/// @param allowStretchedModes Input tested by `allowStretchedModes`.
function Sys_GetMatchingDisplayMode(state,allowStretchedModes)
  if len(state.displayModes)==0 then return void end if
  if allowStretchedModes then return state.displayModes[0] end if
  for index=0 to len(state.displayModes)-1
    if index>=len(state.stretchedModes) or not state.stretchedModes[index] then return state.displayModes[index] end if
  end for
  return void
end function
/// Updates `state.gammaTables` in `mq3.platform.macosx_headers.Sys_StoreGammaTables`.
/// @param state Mutable record or buffer; this call updates `state.gammaTables`.
/// @param tables Value assigned to `state.gammaTables`.
function Sys_StoreGammaTables(state,tables) state.gammaTables=tables;return void end function
/// Returns `void` from `mq3.platform.macosx_headers.Sys_GetGammaTable`; earlier branches return `table`.
/// @param state Record providing `state.gammaTables`.
/// @param display Input used by `for each table in state.gammaTables if table.display==display then return table`.
function Sys_GetGammaTable(state,display) for each table in state.gammaTables if table.display==display then return table end if end for;return void end function
/// Updates `state.fadeFraction` in `mq3.platform.macosx_headers.Sys_SetScreenFade`; returns `table`.
/// @param state Mutable record or buffer; this call updates `state.fadeFraction`.
/// @param table Input used in the result expression `table`.
/// @param fraction Value assigned to `state.fadeFraction`.
function Sys_SetScreenFade(state,table,fraction) if fraction<0.0 then fraction=0.0 end if;if fraction>1.0 then fraction=1.0 end if;state.fadeFraction=fraction;return table end function
/// Updates `state.fadedDisplays` in `mq3.platform.macosx_headers.Sys_FadeScreen`.
/// @param state Mutable record or buffer; this call updates `state.fadedDisplays`.
/// @param display Value forwarded as `needle` to `mq3.platform.macosx_headers.contains`.
function Sys_FadeScreen(state,display) if not contains(state.fadedDisplays,display) then state.fadedDisplays=state.fadedDisplays+[display] end if;return void end function
/// Returns `void` from `mq3.platform.macosx_headers.Sys_FadeScreens`.
/// @param state Record providing `state.displayModes`.
function Sys_FadeScreens(state) for each mode in state.displayModes Sys_FadeScreen(state,mode[0]) end for;return void end function
/// Updates `state.fadedDisplays` in `mq3.platform.macosx_headers.Sys_UnfadeScreen`; returns `table`.
/// @param state Mutable record or buffer; this call updates `state.fadedDisplays`.
/// @param display Input used by `for each value in state.fadedDisplays if value!=display then kept=kept+[value]`.
/// @param table Input used in the result expression `table`.
function Sys_UnfadeScreen(state,display,table) kept=[];for each value in state.fadedDisplays if value!=display then kept=kept+[value] end if end for;state.fadedDisplays=kept;return table end function
/// Updates `state.fadedDisplays` in `mq3.platform.macosx_headers.Sys_UnfadeScreens`.
/// @param state Mutable record or buffer; this call updates `state.fadedDisplays`.
function Sys_UnfadeScreens(state) state.fadedDisplays=[];return void end function
/// Updates `state.fadedDisplays`, `state.displayModes` in `mq3.platform.macosx_headers.Sys_ReleaseAllDisplays`.
/// @param state Mutable record or buffer; this call updates `state.fadedDisplays`, `state.displayModes`.
function Sys_ReleaseAllDisplays(state) state.fadedDisplays=[];state.displayModes=[];return void end function

/// Updates `state.inputInitialized` in `mq3.platform.macosx_headers.Sys_InitInput`.
/// @param state Mutable record or buffer; this call updates `state.inputInitialized`.
function Sys_InitInput(state) state.inputInitialized=true;return void end function
/// Updates `state.inputInitialized` in `mq3.platform.macosx_headers.Sys_ShutdownInput`.
/// @param state Mutable record or buffer; this call updates `state.inputInitialized`.
function Sys_ShutdownInput(state) state.inputInitialized=false;return void end function
/// Updates `state.mouseRect` in `mq3.platform.macosx_headers.Sys_SetMouseInputRect`.
/// @param state Mutable record or buffer; this call updates `state.mouseRect`.
/// @param rect Value assigned to `state.mouseRect`.
function Sys_SetMouseInputRect(state,rect) state.mouseRect=rect;return void end function
/// Computes `state.display` for `mq3.platform.macosx_headers.Sys_DisplayToUse`.
/// @param state Record providing `state.display`.
function Sys_DisplayToUse(state) return state.display end function
/// Updates `state.events` in `mq3.platform.macosx_headers.Sys_QueEvent`.
/// @param state Mutable record or buffer; this call updates `state.events`.
/// @param time Value used for `mq3.platform.macosx_headers.Event.time`.
/// @param kind Value used for `mq3.platform.macosx_headers.Event.kind`.
/// @param value1 Value used for `mq3.platform.macosx_headers.Event.value1`.
/// @param value2 Value used for `mq3.platform.macosx_headers.Event.value2`.
/// @param payload Value used for `mq3.platform.macosx_headers.Event.payload`.
function Sys_QueEvent(state,time,kind,value1,value2,payload) state.events=state.events+[Event(time,kind,value1,value2,payload)];return void end function
/// Calls `mq3.platform.macosx_headers.showBanner` with `(state)` and returns its result.
/// @param state Value forwarded as `state` to `mq3.platform.macosx_headers.showBanner`.
function Sys_AnnoyingBanner(state) return showBanner(state) end function
/// Computes `state.hidden` for `mq3.platform.macosx_headers.Sys_IsHidden`.
/// @param state Record providing `state.hidden`.
function Sys_IsHidden(state) return state.hidden end function
/// Updates `state.hidden` in `mq3.platform.macosx_headers.Sys_Hide`; returns `true`.
/// @param state Mutable record or buffer; this call updates `state.hidden`.
function Sys_Hide(state) state.hidden=true;return true end function
/// Updates `state.hidden` in `mq3.platform.macosx_headers.Sys_Unhide`; returns `true`.
/// @param state Mutable record or buffer; this call updates `state.hidden`.
function Sys_Unhide(state) state.hidden=false;return true end function
/// Updates `state.context`, `state.cglContext` in `mq3.platform.macosx_headers.OSX_SetGLContext`.
/// @param state Mutable record or buffer; this call updates `state.context`, `state.cglContext`.
/// @param context Value assigned to `state.context`.
/// @param cglContext Value assigned to `state.cglContext`.
function OSX_SetGLContext(state,context,cglContext) state.context=context;state.cglContext=cglContext;return void end function
/// Computes `state.context` for `mq3.platform.macosx_headers.OSX_GetNSGLContext`.
/// @param state Record providing `state.context`.
function OSX_GetNSGLContext(state) return state.context end function
/// Computes `state.cglContext` for `mq3.platform.macosx_headers.OSX_GetCGLContext`.
/// @param state Record providing `state.cglContext`.
function OSX_GetCGLContext(state) return state.cglContext end function
/// Computes `state.contextCurrent` for `mq3.platform.macosx_headers.OSX_GLContextIsCurrent`.
/// @param state Record providing `state.contextCurrent`.
function OSX_GLContextIsCurrent(state) return state.contextCurrent end function
/// Updates `state.contextCurrent` in `mq3.platform.macosx_headers.OSX_GLContextSetCurrent`; returns `state.contextCurrent`.
/// @param state Mutable record or buffer; this call updates `state.contextCurrent`.
function OSX_GLContextSetCurrent(state) state.contextCurrent=state.context!=void;return state.contextCurrent end function
/// Updates `state.contextCurrent` in `mq3.platform.macosx_headers.OSX_GLContextClearCurrent`.
/// @param state Mutable record or buffer; this call updates `state.contextCurrent`.
function OSX_GLContextClearCurrent(state) state.contextCurrent=false;return void end function
/// Updates `state.pauseCount`, `state.contextCurrent` in `mq3.platform.macosx_headers.Sys_PauseGL`; returns `state.pauseCount`.
/// @param state Mutable record or buffer; this call updates `state.pauseCount`, `state.contextCurrent`.
function Sys_PauseGL(state) state.pauseCount=state.pauseCount+1;state.contextCurrent=false;return state.pauseCount end function
/// Updates `state.pauseCount` in `mq3.platform.macosx_headers.Sys_ResumeGL`; returns `state.pauseCount`.
/// @param state Mutable record or buffer; this call updates `state.pauseCount`.
function Sys_ResumeGL(state) if state.pauseCount>0 then state.pauseCount=state.pauseCount-1 end if;if state.pauseCount==0 then OSX_GLContextSetCurrent(state) end if;return state.pauseCount end function

/// Returns `false` from `mq3.platform.macosx_headers.contains`; earlier branches return `true`.
/// @param values Sequence traversed as `value` while producing this result.
/// @param needle Input used by `for each value in values if value==needle then return true`.
function contains(values,needle) for each value in values if value==needle then return true end if end for;return false end function
/// Updates `state.qglBeginStarted`, `state.qglCalls` in `mq3.platform.macosx_headers.qglCall`; returns `true`.
/// @param state Mutable record or buffer; this call updates `state.qglBeginStarted`, `state.qglCalls`.
/// @param name Value forwarded as `needle` to `mq3.platform.macosx_headers.contains`.
/// @param arguments Input used by `state.qglCalls=state.qglCalls+[[name,arguments]]`.
function qglCall(state,name,arguments)
  if not contains(qglSymbols(),name) then return false end if
  if name=="qglBegin" then state.qglBeginStarted=state.qglBeginStarted+1 end if
  if name=="qglEnd" and state.qglBeginStarted>0 then state.qglBeginStarted=state.qglBeginStarted-1 end if
  state.qglCalls=state.qglCalls+[[name,arguments]]
  return true
end function
/// Updates `state.qglErrors` in `mq3.platform.macosx_headers.QGLRaiseError`.
/// @param state Mutable record or buffer; this call updates `state.qglErrors`.
/// @param code Input used by `state.qglErrors=state.qglErrors+[code]`.
function QGLRaiseError(state,code) state.qglErrors=state.qglErrors+[code];return void end function
/// Updates `state.qglErrors` in `mq3.platform.macosx_headers._glGetError`; returns `code`.
/// @param state Mutable record or buffer; this call updates `state.qglErrors`.
function _glGetError(state) if len(state.qglErrors)==0 then return 0 end if;code=state.qglErrors[0];kept=[];if len(state.qglErrors)>1 then for index=1 to len(state.qglErrors)-1 kept=kept+[state.qglErrors[index]] end for end if;state.qglErrors=kept;return code end function
/// Updates `state.events` in `mq3.platform.macosx_headers.QGLCheckError`; returns `code`.
/// @param state Mutable record or buffer; this call updates `state.events`.
/// @param message Value used for `mq3.platform.macosx_headers.Event.payload`.
function QGLCheckError(state,message) if state.qglBeginStarted>0 then return 0 end if;code=_glGetError(state);if code!=0 then state.events=state.events+[Event(0,"qgl-error",code,0,message)] end if;return code end function

/// Updates `state.timers`, `state.timerStack`, `state.timerStamps` in `mq3.platform.macosx_headers.InitializeTimers`.
/// @param state Mutable record or buffer; this call updates `state.timers`, `state.timerStack`, `state.timerStamps`.
function InitializeTimers(state) state.timers=true;state.timerStack=[];state.timerStamps=[];return void end function
/// Updates `state.timerStack` in `mq3.platform.macosx_headers.OTSTART`.
/// @param state Mutable record or buffer; this call updates `state.timerStack`.
/// @param node Input tested by `state.timers`.
function OTSTART(state,node) if state.timers then state.timerStack=state.timerStack+[node] end if;return void end function
/// Updates `state.timerStack` in `mq3.platform.macosx_headers.OTSTOP`.
/// @param state Mutable record or buffer; this call updates `state.timerStack`.
function OTSTOP(state) if not state.timers or len(state.timerStack)==0 then return void end if;if len(state.timerStack)==1 then state.timerStack=[] else state.timerStack=slice(state.timerStack,0,len(state.timerStack)-1) end if;return void end function
/// Updates `state.timerStamps` in `mq3.platform.macosx_headers.GLSTAMP`.
/// @param state Mutable record or buffer; this call updates `state.timerStamps`.
/// @param name Input tested by `state.timers`.
/// @param data Input tested by `state.timers`.
function GLSTAMP(state,name,data) if state.timers then state.timerStamps=state.timerStamps+[[name,data]] end if;return void end function
