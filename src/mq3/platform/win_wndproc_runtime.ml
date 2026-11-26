// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Deterministic state model of code/win32/win_wndproc.c.
package mq3.platform.win_wndproc_runtime

const SE_KEY=1
const SE_CHAR=2
const K_BACKSPACE=127
const K_CAPSLOCK=129
const K_PAUSE=131
const K_UPARROW=132
const K_DOWNARROW=133
const K_LEFTARROW=134
const K_RIGHTARROW=135
const K_ALT=136
const K_CTRL=137
const K_SHIFT=138
const K_INS=139
const K_DEL=140
const K_PGDN=141
const K_PGUP=142
const K_HOME=143
const K_END=144
const K_F1=145
const K_F2=146
const K_F3=147
const K_F4=148
const K_F5=149
const K_F6=150
const K_F7=151
const K_F8=152
const K_F9=153
const K_F10=154
const K_F11=155
const K_F12=156
const K_KP_HOME=160
const K_KP_UPARROW=161
const K_KP_PGUP=162
const K_KP_LEFTARROW=163
const K_KP_5=164
const K_KP_RIGHTARROW=165
const K_KP_END=166
const K_KP_DOWNARROW=167
const K_KP_PGDN=168
const K_KP_ENTER=169
const K_KP_INS=170
const K_KP_DEL=171
const K_KP_SLASH=172
const K_KP_MINUS=173
const K_KP_PLUS=174
const K_KP_NUMLOCK=175
const K_KP_STAR=176
const K_MWHEELDOWN=183
const K_MWHEELUP=184

const WM_CREATE=1
const WM_DESTROY=2
const WM_MOVE=3
const WM_CLOSE=16
const WM_ACTIVATE=6
const WM_KEYDOWN=256
const WM_KEYUP=257
const WM_CHAR=258
const WM_SYSKEYDOWN=260
const WM_SYSKEYUP=261
const WM_SYSCOMMAND=274
const WM_MOUSEMOVE=512
const WM_LBUTTONDOWN=513
const WM_LBUTTONUP=514
const WM_RBUTTONDOWN=516
const WM_RBUTTONUP=517
const WM_MBUTTONDOWN=519
const WM_MBUTTONUP=520
const WM_MOUSEWHEEL=522
const SC_SCREENSAVE=0xF140
const MK_LBUTTON=1
const MK_RBUTTON=2
const MK_MBUTTON=16

/// Data record for `mq3.platform.win_wndproc_runtime.Event`; groups `time`, `type`, `value`, `value2`.
struct Event time type value value2 end struct
/// Data record for `mq3.platform.win_wndproc_runtime.Runtime`; groups `activeApp`, `isMinimized`, `fullscreen`, `altTabDisabled`, `windowCreated`, `inputActive`, and 9 further fields.
struct Runtime activeApp isMinimized fullscreen altTabDisabled windowCreated inputActive vidX vidY mouseButtons logitechFlip quitRequested videoRestart soundActivations clearStateCount events end struct

/// Constructs `mq3.platform.win_wndproc_runtime.Runtime` with `activeApp` = `false`, `isMinimized` = `false`, `altTabDisabled` = `false`, `windowCreated` = `false` and the supplied remaining values.
/// @param fullscreen Initial value for `mq3.platform.win_wndproc_runtime.Runtime.fullscreen`.
function create(fullscreen)
  return Runtime(false,false,fullscreen,false,false,false,3,22,0,true,false,false,0,0,[])
end function
/// Updates `state.events` in `mq3.platform.win_wndproc_runtime.queue`.
/// @param state Mutable record or buffer; this call updates `state.events`.
/// @param time Value used for `mq3.platform.win_wndproc_runtime.Event.time`.
/// @param type Value used for `mq3.platform.win_wndproc_runtime.Event.type`.
/// @param value Value used for `mq3.platform.win_wndproc_runtime.Event.value`.
/// @param value2 Value used for `mq3.platform.win_wndproc_runtime.Event.value2`.
function queue(state,time,type,value,value2) state.events=state.events+[Event(time,type,value,value2)];return void end function
/// Updates `state.altTabDisabled` in `mq3.platform.win_wndproc_runtime.WIN_DisableAltTab`.
/// @param state Mutable record or buffer; this call updates `state.altTabDisabled`.
function WIN_DisableAltTab(state) if not state.altTabDisabled then state.altTabDisabled=true end if;return void end function
/// Updates `state.altTabDisabled` in `mq3.platform.win_wndproc_runtime.WIN_EnableAltTab`.
/// @param state Mutable record or buffer; this call updates `state.altTabDisabled`.
function WIN_EnableAltTab(state) state.altTabDisabled=false;return void end function
/// Updates `state.isMinimized`, `state.clearStateCount`, `state.activeApp`, `state.inputActive` in `mq3.platform.win_wndproc_runtime.VID_AppActivate`; returns `state.activeApp`.
/// @param state Mutable record or buffer; this call updates `state.isMinimized`, `state.clearStateCount`, `state.activeApp`, `state.inputActive`.
/// @param active Input used by `state.activeApp=active and not minimized`.
/// @param minimized Value assigned to `state.isMinimized`.
function VID_AppActivate(state,active,minimized)
  state.isMinimized=minimized;state.clearStateCount=state.clearStateCount+1
  state.activeApp=active and not minimized;state.inputActive=state.activeApp;return state.activeApp
end function

/// Builds the 130-element result for `mq3.platform.win_wndproc_runtime.scanTable` from `0`, `27`, `49`, `50`, `51`.
function scanTable()
  return [0,27,49,50,51,52,53,54,55,56,57,48,45,61,K_BACKSPACE,9,113,119,101,114,116,121,117,105,111,112,91,93,13,K_CTRL,97,115,100,102,103,104,106,107,108,59,39,96,K_SHIFT,92,122,120,99,118,98,110,109,44,46,47,K_SHIFT,K_KP_STAR,K_ALT,32,K_CAPSLOCK,K_F1,K_F2,K_F3,K_F4,K_F5,K_F6,K_F7,K_F8,K_F9,K_F10,K_PAUSE,0,K_HOME,K_UPARROW,K_PGUP,K_KP_MINUS,K_LEFTARROW,K_KP_5,K_RIGHTARROW,K_KP_PLUS,K_END,K_DOWNARROW,K_PGDN,K_INS,K_DEL,0,0,0,K_F11,K_F12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
end function
/// Computes `MapKey` from `scanTable()[modified]` using `mq3.platform.win_wndproc_runtime.scanTable`.
/// @param key Input used by `modified=(key>>16)&255`.
function MapKey(key)
  modified=(key>>16)&255;if modified>127 then return 0 end if
  result=scanTable()[modified];extended=(key&(1<<24))!=0
  if not extended then
    if result==K_HOME then return K_KP_HOME end if;if result==K_UPARROW then return K_KP_UPARROW end if;if result==K_PGUP then return K_KP_PGUP end if
    if result==K_LEFTARROW then return K_KP_LEFTARROW end if;if result==K_RIGHTARROW then return K_KP_RIGHTARROW end if;if result==K_END then return K_KP_END end if
    if result==K_DOWNARROW then return K_KP_DOWNARROW end if;if result==K_PGDN then return K_KP_PGDN end if;if result==K_INS then return K_KP_INS end if;if result==K_DEL then return K_KP_DEL end if
    return result
  end if
  if result==K_PAUSE then return K_KP_NUMLOCK end if;if result==13 then return K_KP_ENTER end if;if result==47 then return K_KP_SLASH end if;if result==175 then return K_KP_PLUS end if
  return result
end function

/// Updates `state.logitechFlip` in `mq3.platform.win_wndproc_runtime.wheel`; returns `steps`.
/// @param state Mutable record or buffer; this call updates `state.logitechFlip`.
/// @param time Value forwarded as `time` to `mq3.platform.win_wndproc_runtime.queue`.
/// @param delta Input tested by `delta>0`.
/// @param logitechBug Input tested by `logitechBug`.
function wheel(state,time,delta,logitechBug)
  key=K_MWHEELDOWN;if delta>0 then key=K_MWHEELUP end if;steps=delta/120;if steps<0 then steps=0-steps end if
  for i=0 to steps-1
    if logitechBug then queue(state,time,SE_KEY,key,state.logitechFlip);state.logitechFlip=not state.logitechFlip
    else queue(state,time,SE_KEY,key,true);queue(state,time,SE_KEY,key,false) end if
  end for;return steps
end function
/// Returns `result` from `mq3.platform.win_wndproc_runtime.mouseState`.
/// @param wParam Input tested by `(wParam&MK_LBUTTON)!=0`.
function mouseState(wParam) result=0;if (wParam&MK_LBUTTON)!=0 then result=result|1 end if;if (wParam&MK_RBUTTON)!=0 then result=result|2 end if;if (wParam&MK_MBUTTON)!=0 then result=result|4 end if;return result end function

/// Updates `state.windowCreated`, `state.quitRequested`, `state.soundActivations`, `state.vidX`, `state.vidY` in `mq3.platform.win_wndproc_runtime.MainWndProc`; returns `0`.
/// @param state Mutable record or buffer; this call updates `state.windowCreated`, `state.quitRequested`, `state.soundActivations`, `state.vidX`, `state.vidY`.
/// @param message Input tested by `inMouse!=1 and message==legacyWheelMessage`.
/// @param wParam Value forwarded as `wParam` to `mq3.platform.win_wndproc_runtime.mouseState`.
/// @param lParam Value forwarded as `key` to `mq3.platform.win_wndproc_runtime.MapKey`.
/// @param time Value forwarded as `time` to `mq3.platform.win_wndproc_runtime.wheel`.
/// @param inMouse Input tested by `inMouse!=1 and message==legacyWheelMessage`.
/// @param consoleCatcher Input tested by `inMouse!=1 or (not state.fullscreen and consoleCatcher)`.
/// @param logitechBug Value forwarded as `logitechBug` to `mq3.platform.win_wndproc_runtime.wheel`.
/// @param legacyWheelMessage Input tested by `inMouse!=1 and message==legacyWheelMessage`.
function MainWndProc(state,message,wParam,lParam,time,inMouse,consoleCatcher,logitechBug,legacyWheelMessage)
  if inMouse!=1 and message==legacyWheelMessage then delta=-120;if wParam>0 then delta=120 end if;wheel(state,time,delta,false);return 1 end if
  if message==WM_MOUSEWHEEL then
    if inMouse!=1 or (not state.fullscreen and consoleCatcher) then signed=(wParam>>16)&65535;if signed>=32768 then signed=signed-65536 end if;wheel(state,time,signed,logitechBug);return 1 end if
    return 0
  end if
  if message==WM_CREATE then state.windowCreated=true;if state.fullscreen then WIN_DisableAltTab(state) else WIN_EnableAltTab(state) end if;return 0 end if
  if message==WM_DESTROY then state.windowCreated=false;if state.fullscreen then WIN_EnableAltTab(state) end if;return 0 end if
  if message==WM_CLOSE then state.quitRequested=true;return 1 end if
  if message==WM_ACTIVATE then active=(wParam&65535)!=0;minimized=((wParam>>16)&65535)!=0;VID_AppActivate(state,active,minimized);state.soundActivations=state.soundActivations+1;return 0 end if
  if message==WM_MOVE then if not state.fullscreen then x=lParam&65535;y=(lParam>>16)&65535;if x>=32768 then x=x-65536 end if;if y>=32768 then y=y-65536 end if;state.vidX=x;state.vidY=y end if;return 0 end if
  if message==WM_LBUTTONDOWN or message==WM_LBUTTONUP or message==WM_RBUTTONDOWN or message==WM_RBUTTONUP or message==WM_MBUTTONDOWN or message==WM_MBUTTONUP or message==WM_MOUSEMOVE then state.mouseButtons=mouseState(wParam);return 0 end if
  if message==WM_SYSCOMMAND and (wParam&0xFFF0)==SC_SCREENSAVE then return 1 end if
  if message==WM_SYSKEYDOWN and wParam==13 then state.fullscreen=not state.fullscreen;state.videoRestart=true;return 1 end if
  if message==WM_SYSKEYDOWN or message==WM_KEYDOWN then queue(state,time,SE_KEY,MapKey(lParam),true);return 0 end if
  if message==WM_SYSKEYUP or message==WM_KEYUP then queue(state,time,SE_KEY,MapKey(lParam),false);return 0 end if
  if message==WM_CHAR then queue(state,time,SE_CHAR,wParam,0);return 0 end if
  return 0
end function
