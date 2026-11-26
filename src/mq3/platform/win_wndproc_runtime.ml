// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Deterministic state model of code/win32/win_wndproc.c.
package mq3.platform.win_wndproc_runtime

/// System-event type carrying a key code and its press or release state.
const SE_KEY=1
/// System-event type carrying a character for text input.
const SE_CHAR=2
/// Engine input key code for the Backspace.
const K_BACKSPACE=127
/// Engine input key code for the Caps Lock.
const K_CAPSLOCK=129
/// Engine input key code for the Pause.
const K_PAUSE=131
/// Engine input key code for the up arrow.
const K_UPARROW=132
/// Engine input key code for the down arrow.
const K_DOWNARROW=133
/// Engine input key code for the left arrow.
const K_LEFTARROW=134
/// Engine input key code for the right arrow.
const K_RIGHTARROW=135
/// Engine input key code for the Alt.
const K_ALT=136
/// Engine input key code for the Control.
const K_CTRL=137
/// Engine input key code for the Shift.
const K_SHIFT=138
/// Engine input key code for the Insert.
const K_INS=139
/// Engine input key code for the Delete.
const K_DEL=140
/// Engine input key code for the Page Down.
const K_PGDN=141
/// Engine input key code for the Page Up.
const K_PGUP=142
/// Engine input key code for the Home.
const K_HOME=143
/// Engine input key code for the End.
const K_END=144
/// Engine input key code for function key F1.
const K_F1=145
/// Engine input key code for function key F2.
const K_F2=146
/// Engine input key code for function key F3.
const K_F3=147
/// Engine input key code for function key F4.
const K_F4=148
/// Engine input key code for function key F5.
const K_F5=149
/// Engine input key code for function key F6.
const K_F6=150
/// Engine input key code for function key F7.
const K_F7=151
/// Engine input key code for function key F8.
const K_F8=152
/// Engine input key code for function key F9.
const K_F9=153
/// Engine input key code for function key F10.
const K_F10=154
/// Engine input key code for function key F11.
const K_F11=155
/// Engine input key code for function key F12.
const K_F12=156
/// Engine input key code for the numeric-keypad Home.
const K_KP_HOME=160
/// Engine input key code for the numeric-keypad up arrow.
const K_KP_UPARROW=161
/// Engine input key code for the numeric-keypad Page Up.
const K_KP_PGUP=162
/// Engine input key code for the numeric-keypad left arrow.
const K_KP_LEFTARROW=163
/// Engine input key code for the numeric-keypad center.
const K_KP_5=164
/// Engine input key code for the numeric-keypad right arrow.
const K_KP_RIGHTARROW=165
/// Engine input key code for the numeric-keypad End.
const K_KP_END=166
/// Engine input key code for the numeric-keypad down arrow.
const K_KP_DOWNARROW=167
/// Engine input key code for the numeric-keypad Page Down.
const K_KP_PGDN=168
/// Engine input key code for the numeric-keypad Enter.
const K_KP_ENTER=169
/// Engine input key code for the numeric-keypad Insert.
const K_KP_INS=170
/// Engine input key code for the numeric-keypad Delete.
const K_KP_DEL=171
/// Engine input key code for the numeric-keypad divide.
const K_KP_SLASH=172
/// Engine input key code for the numeric-keypad subtract.
const K_KP_MINUS=173
/// Engine input key code for the numeric-keypad add.
const K_KP_PLUS=174
/// Engine input key code for the Num Lock.
const K_KP_NUMLOCK=175
/// Engine input key code for the numeric-keypad multiply.
const K_KP_STAR=176
/// Engine input key code for the downward mouse-wheel step.
const K_MWHEELDOWN=183
/// Engine input key code for the upward mouse-wheel step.
const K_MWHEELUP=184

/// Windows message identifier for creation of the native window.
const WM_CREATE=1
/// Windows message identifier for destruction of the native window.
const WM_DESTROY=2
/// Windows message identifier for a change in the window position.
const WM_MOVE=3
/// Windows message identifier for a request to close the native window.
const WM_CLOSE=16
/// Windows message identifier for a change in window activation state.
const WM_ACTIVATE=6
/// Windows message identifier for a normal key press.
const WM_KEYDOWN=256
/// Windows message identifier for a normal key release.
const WM_KEYUP=257
/// Windows message identifier for a translated text-input character.
const WM_CHAR=258
/// Windows message identifier for a system-key press, such as an Alt-key combination.
const WM_SYSKEYDOWN=260
/// Windows message identifier for a system-key release.
const WM_SYSKEYUP=261
/// Windows message identifier for a window system command.
const WM_SYSCOMMAND=274
/// Windows message identifier for mouse movement within the client area.
const WM_MOUSEMOVE=512
/// Windows message identifier for a left mouse-button press.
const WM_LBUTTONDOWN=513
/// Windows message identifier for a left mouse-button release.
const WM_LBUTTONUP=514
/// Windows message identifier for a right mouse-button press.
const WM_RBUTTONDOWN=516
/// Windows message identifier for a right mouse-button release.
const WM_RBUTTONUP=517
/// Windows message identifier for a middle mouse-button press.
const WM_MBUTTONDOWN=519
/// Windows message identifier for a middle mouse-button release.
const WM_MBUTTONUP=520
/// Windows message identifier for vertical mouse-wheel movement.
const WM_MOUSEWHEEL=522
/// Windows system-command identifier for activating the screen saver.
const SC_SCREENSAVE=0xF140
/// Mouse-message flag indicating that the left button is pressed.
const MK_LBUTTON=1
/// Mouse-message flag indicating that the right button is pressed.
const MK_RBUTTON=2
/// Mouse-message flag indicating that the middle button is pressed.
const MK_MBUTTON=16

/// Data record for `mq3.platform.win_wndproc_runtime.Event`; groups `time`, `type`, `value`, `value2`.
struct Event
  /// Millisecond timestamp assigned while translating a Windows window message into engine input.
  time
  /// System-event category selecting how the accompanying values are interpreted.
  type
  /// Primary event value: a key or character code, horizontal motion, or joystick-axis selector.
  value
  /// Secondary event value: key press state, vertical motion, or joystick-axis magnitude.
  value2
end struct
/// Data record for `mq3.platform.win_wndproc_runtime.Runtime`; groups `activeApp`, `isMinimized`, `fullscreen`, `altTabDisabled`, `windowCreated`, `inputActive`, and 9 further fields.
struct Runtime
  /// Whether the application currently owns foreground input focus.
  activeApp
  /// Whether the native application window is minimized.
  isMinimized
  /// Whether the selected video mode occupies the full display.
  fullscreen
  /// Whether task switching is disabled while the window is active.
  altTabDisabled
  /// Whether the application window has been created.
  windowCreated
  /// Whether keyboard and mouse events are currently routed into the engine.
  inputActive
  /// Horizontal desktop position of the game window, in pixels.
  vidX
  /// Vertical desktop position of the game window, in pixels.
  vidY
  /// Mouse-button mask translated from the current window message.
  mouseButtons
  /// Whether the legacy Logitech wheel-direction workaround is active.
  logitechFlip
  /// Whether application shutdown has been requested.
  quitRequested
  /// Whether a native window event requested video subsystem restart.
  videoRestart
  /// Number of sound activation changes caused by window focus updates.
  soundActivations
  /// Number of times held input state was cleared after focus changes.
  clearStateCount
  /// Pending input or system events awaiting delivery.
  events
end struct

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
