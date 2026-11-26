// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native MiniLang facade for client/cl_keys.c.
package mq3.client.cl_keys_runtime

import mq3.vm.cgame_key_traps as keys
import mq3.client.console_input as console
import mq3.client.key_binding_dispatch as dispatch
import mq3.client.key_bindings_config as config
import mq3.qcommon.command_buffer as command

/// Capacity limit for the keys collection or bounded storage used by this client module.
const MAX_KEYS=256
/// Input-capture bit that routes keyboard events to the console subsystem.
const KEYCATCH_CONSOLE=1
/// UI keyboard-capture mask used when routing key and character events to the UI rather than gameplay
/// bindings.
const KEYCATCH_UI=2
/// Input-capture bit that routes keyboard events to the message subsystem.
const KEYCATCH_MESSAGE=4
/// Input-capture bit that routes keyboard events to the cgame subsystem.
const KEYCATCH_CGAME=8
/// Engine key code for the char flag input, used by menu and client key-event handling.
const K_CHAR_FLAG=1024
/// Engine key code for the escape input, used by menu and client key-event handling.
const K_ESCAPE=27
// connstate_t is a public ABI shared with client.h and ui_public.h.  Keep the
// explicit Baseq3 ordinals here because routing below depends on the otherwise
// easy-to-confuse DISCONNECTED, PRIMED and CINEMATIC values.
const CA_UNINITIALIZED=0
/// Client connection state with no active server connection.
const CA_DISCONNECTED=1
/// Client connection state while waiting for authorization to contact the server.
const CA_AUTHORIZING=2
/// Client connection state while requesting a challenge from the server.
const CA_CONNECTING=3
/// Client connection state while replying to the server challenge and requesting connection.
const CA_CHALLENGING=4
/// Native post-handshake connection state retained by the keyboard runtime for compatibility with
/// client connection-state values.
const CA_CONNECTED=5
/// Client connection state while level media and game state are being loaded.
const CA_LOADING=6
/// Client connection state with game state loaded, awaiting a playable snapshot.
const CA_PRIMED=7
/// Connection-state value for normal gameplay after game-state loading, defined for routing escape and
/// key events according to connection progress.
const CA_ACTIVE=8
/// Client connection state used for fullscreen cinematic playback.
const CA_CINEMATIC=9
/// Smallchar font metric controlling width in virtual UI coordinates.
const SMALLCHAR_WIDTH=8
/// Bigchar font metric controlling width in virtual UI coordinates.
const BIGCHAR_WIDTH=16

/// Stores engine client keys runtime event record, including `kind`, `key`, `down`, `text`.
struct Event
  /// Keyboard-routing event category identifying the destination or action recorded for a key or
  /// character event.
  kind
  /// When constructing this record, `event` supplies `key` for this member.
  key
  /// When constructing this record, `event` supplies `down` for this member.
  down
  /// Console feedback or expanded key-binding command carried by the keyboard runtime event.
  text
end struct
/// Stores engine client keys runtime draw result record, including `text`, `x`, `y`, `size`, `cursorVisible`, `cursorX` and additional values.
struct DrawResult
  /// Visible, horizontally scrolled substring of the edited field prepared for drawing.
  text
  /// Horizontal coordinate of the visible editable text produced by the keyboard field renderer.
  x
  /// Vertical coordinate of the visible editable text produced by the keyboard field renderer.
  y
  /// When constructing this record, `Field_VariableSizeDraw` supplies `size` for this member.
  size
  /// When constructing this record, `Field_VariableSizeDraw` supplies `cursorVisible` for this member.
  cursorVisible
  /// Horizontal position of the pointer in the local display coordinate system.
  cursorX
  /// When constructing this record, `Field_VariableSizeDraw` supplies `cursorChar` for this member.
  cursorChar
  /// When constructing this record, `Field_VariableSizeDraw` supplies `prestep` for this member.
  prestep
end struct
/// Stores engine client keys runtime runtime wiring and state, including `keyState`, `consoleState`, `repeats`, `anyKeyDown`, `events`, `commandState` and additional values.
struct Runtime
  /// When constructing this record, `create` supplies `keyState` for this member. Used by `syncCatcher`
  /// and `Key_IsDown` during subsequent processing.
  keyState
  /// When constructing this record, `create` supplies `consoleState` for this member. Used by
  /// `syncCatcher` and `Key_SetOverstrikeMode` during subsequent processing.
  consoleState
  /// When constructing this record, `create` supplies `array(MAX_KEYS,0)` for this member. Used by
  /// `CL_KeyEvent` and `Key_ClearStates` during subsequent processing.
  repeats
  /// When constructing this record, `create` supplies `0` for this member. Used by `CL_KeyEvent` and
  /// `Key_ClearStates` during subsequent processing.
  anyKeyDown
  /// When constructing this record, `create` supplies an empty list for this member. Used by `event`
  /// during subsequent processing.
  events
  /// When constructing this record, `create` supplies `commandState` for this member. Used by
  /// `CL_InitKeyCommands` during subsequent processing.
  commandState
  /// When constructing this record, `create` supplies `config.create(keyState)` for this member. Used
  /// by `Key_WriteBindings` during subsequent processing.
  bindingState
  /// When constructing this record, `create` supplies `false` for this member. Used by `Key_SetBinding`
  /// during subsequent processing.
  archiveModified
  /// True while the client receives its game data from a recorded demo.
  demoPlaying
  /// When constructing this record, `create` supplies `0` for this member. Used by `CL_KeyEvent` during
  /// subsequent processing.
  cameraMode
  /// True after the keyboard runtime's commands and bindings have been initialized.
  initialized
end struct

/// Calls `mq3.vm.cgame_key_traps.create`, `mq3.client.console_input.create`, `mq3.qcommon.command_buffer.create` and additional helpers from engine client keys runtime `create`.
/// @param width Width in the coordinate space used by `create`.
/// @param services services record passed to the engine client keys runtime helper calls.
function create(width,services)
  keyState=keys.create();consoleState=console.create(width,services);commandState=command.create();command.initCommands(commandState);return Runtime(keyState,consoleState,array(MAX_KEYS,0),0,[],commandState,config.create(keyState),false,false,0,false)
end function
/// Updates `state.events` during engine client keys runtime `event`.
/// @param state Mutable engine client keys runtime record/storage; this routine assigns `state.events`.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param key Key or control identifier used to select the corresponding engine client keys runtime entry.
/// @param down Whether this event presses the key/button; false represents its release.
/// @param text Text consumed or emitted by `event` in the engine client keys runtime path.
function event(state,kind,key,down,text) state.events=state.events+[Event(kind,key,down,text)];return void end function
/// Updates `state.keyState.catcher` during engine client keys runtime `syncCatcher`.
/// @param state Mutable engine client keys runtime record/storage; this routine assigns `state.keyState.catcher`.
function syncCatcher(state) state.keyState.catcher=state.consoleState.catcher;return void end function
/// Computes `key>=0 and key<MAX_KEYS` for engine client keys runtime `valid`.
/// @param key Key or control identifier used to select the corresponding engine client keys runtime entry.
function valid(key) return key>=0 and key<MAX_KEYS end function

/// Calls `mq3.client.cl_keys_runtime.valid`, `mq3.vm.cgame_key_traps.isDown` from engine client keys runtime `Key_IsDown`. The final path returns `keys.isDown(state.keyState,keynum)`.
/// @param state Record read through `state.keyState`.
/// @param keynum Quake III key number identifying the keyboard or mouse input.
function Key_IsDown(state,keynum) if keynum==-1 or state==void or not valid(keynum) then return false end if;return keys.isDown(state.keyState,keynum) end function
/// Adapts `mq3.vm.cgame_key_traps.stringToKeynum` to engine client keys runtime `Key_StringToKeynum`, returning its result for `text`.
/// @param text Argument 1 of `mq3.vm.cgame_key_traps.stringToKeynum`.
function Key_StringToKeynum(text) return keys.stringToKeynum(text) end function
/// Adapts `mq3.vm.cgame_key_traps.keynumToString` to engine client keys runtime `Key_KeynumToString`, returning its result for `keynum`.
/// @param keynum Quake III key number identifying the keyboard or mouse input. Forwarded to `mq3.vm.cgame_key_traps.keynumToString`.
function Key_KeynumToString(keynum) return keys.keynumToString(keynum) end function
/// Updates `state.archiveModified` during engine client keys runtime `Key_SetBinding`.
/// @param state Mutable engine client keys runtime record/storage; this routine assigns `state.archiveModified`.
/// @param keynum Quake III key number identifying the keyboard or mouse input.
/// @param binding Command text associated with an input key.
function Key_SetBinding(state,keynum,binding) if state==void or keynum==-1 or not valid(keynum) then return false end if;result=keys.setBinding(state.keyState,keynum,binding);if result then state.archiveModified=true end if;return result end function
/// Calls `mq3.client.cl_keys_runtime.valid`, `mq3.vm.cgame_key_traps.getBinding` from engine client keys runtime `Key_GetBinding`. The final path returns `keys.getBinding(state.keyState,keynum)`.
/// @param state Record read through `state.keyState`.
/// @param keynum Quake III key number identifying the keyboard or mouse input.
function Key_GetBinding(state,keynum) if state==void or keynum==-1 or not valid(keynum) then return "" end if;return keys.getBinding(state.keyState,keynum) end function
/// Calls `mq3.vm.cgame_key_traps.getKey` from engine client keys runtime `Key_GetKey`. The final path returns `keys.getKey(state.keyState,binding)`.
/// @param state Record read through `state.keyState`.
/// @param binding Command text associated with an input key.
function Key_GetKey(state,binding) if state==void then return -1 end if;return keys.getKey(state.keyState,binding) end function
/// Calls `mq3.vm.cgame_key_traps.getOverstrike` from engine client keys runtime `Key_GetOverstrikeMode`. The final path returns `keys.getOverstrike(state.keyState)`.
/// @param state Record read through `state.keyState`.
function Key_GetOverstrikeMode(state) if state==void then return false end if;return keys.getOverstrike(state.keyState) end function
/// Updates `state.consoleState.overstrike` during engine client keys runtime `Key_SetOverstrikeMode`.
/// @param state Mutable engine client keys runtime record/storage; this routine assigns `state.consoleState.overstrike`.
/// @param value Value assigned to `state.consoleState.overstrike`.
function Key_SetOverstrikeMode(state,value) if state!=void then keys.setOverstrike(state.keyState,value);state.consoleState.overstrike=value end if;return void end function

/// Updates `state.consoleState.overstrike` during engine client keys runtime `Field_Paste`.
/// @param state Mutable engine client keys runtime record/storage; this routine assigns `state.consoleState.overstrike`.
/// @param edit Value used by `result=console.paste(state.consoleState,edit)`.
function Field_Paste(state,edit) if state==void then return false end if;state.consoleState.overstrike=keys.getOverstrike(state.keyState);result=console.paste(state.consoleState,edit);keys.setOverstrike(state.keyState,state.consoleState.overstrike);return result end function
/// Updates `state.consoleState.overstrike` during engine client keys runtime `Field_KeyDownEvent`.
/// @param state Mutable engine client keys runtime record/storage; this routine assigns `state.consoleState.overstrike`.
/// @param edit Value used by `result=console.fieldKeyDown(state.consoleState,edit,key,Key_IsDown(state,console.K_SHIFT),Key_IsDown(state,console.K_CTRL))`.
/// @param key Key or control identifier used to select the corresponding engine client keys runtime entry.
function Field_KeyDownEvent(state,edit,key)
  if state==void then return false end if;state.consoleState.overstrike=keys.getOverstrike(state.keyState);result=console.fieldKeyDown(state.consoleState,edit,key,Key_IsDown(state,console.K_SHIFT),Key_IsDown(state,console.K_CTRL));keys.setOverstrike(state.keyState,state.consoleState.overstrike);return result
end function
/// Updates `state.consoleState.overstrike` during engine client keys runtime `Field_CharEvent`.
/// @param state Mutable engine client keys runtime record/storage; this routine assigns `state.consoleState.overstrike`.
/// @param edit Value used by `result=console.charEvent(state.consoleState,edit,ch)`.
/// @param ch Value used by `result=console.charEvent(state.consoleState,edit,ch)`.
function Field_CharEvent(state,edit,ch)
  if state==void then return false end if;state.consoleState.overstrike=keys.getOverstrike(state.keyState);result=console.charEvent(state.consoleState,edit,ch);keys.setOverstrike(state.keyState,state.consoleState.overstrike);return result
end function
/// Counts displayed characters while skipping Quake color escape sequences.
/// @param text Text consumed or emitted by `visibleLength` in the engine client keys runtime path.
function visibleLength(text) raw=bytes(text);count=0;index=0;while index<len(raw) if raw[index]==94 and index+1<len(raw) and raw[index+1]!=94 then index=index+2 else count=count+1;index=index+1 end if end while;return count end function
/// Updates `edit.scroll` during engine client keys runtime `Field_VariableSizeDraw`.
/// @param state Shared engine client keys runtime state passed to the helper calls in `Field_VariableSizeDraw`.
/// @param edit Mutable engine client keys runtime record/storage; this routine assigns `edit.scroll`.
/// @param x Horizontal coordinate in the coordinate space used by `Field_VariableSizeDraw`.
/// @param y Vertical coordinate in the coordinate space used by `Field_VariableSizeDraw`.
/// @param width Accepted for compatibility with `Field_VariableSizeDraw`; the current implementation does not read it.
/// @param size Value used by `cursorX=x+(edit.cursor-prestep-i)*size`.
/// @param showCursor Value used by `cursorVisible=showCursor and ((realtime>>8)&1)==0`.
/// @param realtime Current client real-time clock in milliseconds.
function Field_VariableSizeDraw(state,edit,x,y,width,size,showCursor,realtime)
  drawLen=edit.widthInChars;length=len(bytes(edit.text))+1;prestep=0
  if length>drawLen then if edit.scroll+drawLen>length then edit.scroll=length-drawLen;if edit.scroll<0 then edit.scroll=0 end if end if;prestep=edit.scroll end if
  if prestep+drawLen>length then drawLen=length-prestep end if;available=len(bytes(edit.text))-prestep;if available<0 then available=0 end if;copy=drawLen;if copy>available then copy=available end if;text=decode(slice(bytes(edit.text),prestep,copy));cursorVisible=showCursor and ((realtime>>8)&1)==0;cursorChar=10;if Key_GetOverstrikeMode(state) then cursorChar=11 end if;i=drawLen-(visibleLength(text)+1);cursorX=x+(edit.cursor-prestep-i)*size;return DrawResult(text,x,y,size,cursorVisible,cursorX,cursorChar,prestep)
end function
/// Adapts `mq3.client.cl_keys_runtime.Field_VariableSizeDraw` to engine client keys runtime `Field_Draw`, returning its result for `state, edit, x, y, width, SMALLCHAR_WIDTH, showCursor, realtime`.
/// @param state Argument 1 of `mq3.client.cl_keys_runtime.Field_VariableSizeDraw`.
/// @param edit Argument 2 of `mq3.client.cl_keys_runtime.Field_VariableSizeDraw`.
/// @param x Argument 3 of `mq3.client.cl_keys_runtime.Field_VariableSizeDraw`.
/// @param y Argument 4 of `mq3.client.cl_keys_runtime.Field_VariableSizeDraw`.
/// @param width Argument 5 of `mq3.client.cl_keys_runtime.Field_VariableSizeDraw`.
/// @param showCursor Argument 7 of `mq3.client.cl_keys_runtime.Field_VariableSizeDraw`.
/// @param realtime Current client real-time clock in milliseconds. Forwarded to `mq3.client.cl_keys_runtime.Field_VariableSizeDraw`.
function Field_Draw(state,edit,x,y,width,showCursor,realtime) return Field_VariableSizeDraw(state,edit,x,y,width,SMALLCHAR_WIDTH,showCursor,realtime) end function
/// Adapts `mq3.client.cl_keys_runtime.Field_VariableSizeDraw` to engine client keys runtime `Field_BigDraw`, returning its result for `state, edit, x, y, width, BIGCHAR_WIDTH, showCursor, realtime`.
/// @param state Argument 1 of `mq3.client.cl_keys_runtime.Field_VariableSizeDraw`.
/// @param edit Argument 2 of `mq3.client.cl_keys_runtime.Field_VariableSizeDraw`.
/// @param x Argument 3 of `mq3.client.cl_keys_runtime.Field_VariableSizeDraw`.
/// @param y Argument 4 of `mq3.client.cl_keys_runtime.Field_VariableSizeDraw`.
/// @param width Argument 5 of `mq3.client.cl_keys_runtime.Field_VariableSizeDraw`.
/// @param showCursor Argument 7 of `mq3.client.cl_keys_runtime.Field_VariableSizeDraw`.
/// @param realtime Current client real-time clock in milliseconds. Forwarded to `mq3.client.cl_keys_runtime.Field_VariableSizeDraw`.
function Field_BigDraw(state,edit,x,y,width,showCursor,realtime) return Field_VariableSizeDraw(state,edit,x,y,width,BIGCHAR_WIDTH,showCursor,realtime) end function

/// Calls `mq3.client.cl_keys_runtime.event`, `mq3.client.cl_keys_runtime.Key_StringToKeynum`, `mq3.client.cl_keys_runtime.Key_SetBinding` from engine client keys runtime `Key_Unbind_f`. The final path returns `Key_SetBinding(state,key,"")`.
/// @param state Shared engine client keys runtime state passed to the helper calls in `Key_Unbind_f`.
/// @param args Sequence read at `args[1]`.
function Key_Unbind_f(state,args)
  if len(args)!=2 then event(state,"print",-1,false,"unbind <key> : remove commands from a key\n");return false end if;key=Key_StringToKeynum(args[1]);if key==-1 then event(state,"print",-1,false,"\""+args[1]+"\" isn't a valid key\n");return false end if;return Key_SetBinding(state,key,"")
end function
/// Calls `mq3.client.cl_keys_runtime.Key_GetBinding`, `mq3.client.cl_keys_runtime.Key_SetBinding` from engine client keys runtime `Key_Unbindall_f`.
/// @param state Shared engine client keys runtime state passed to the helper calls in `Key_Unbindall_f`.
/// @param args Accepted for compatibility with `Key_Unbindall_f`; the current implementation does not read it.
function Key_Unbindall_f(state,args) for key=0 to MAX_KEYS-1 value=Key_GetBinding(state,key);if value!=void then Key_SetBinding(state,key,"") end if end for;return true end function
/// Calls `mq3.client.cl_keys_runtime.event`, `mq3.client.cl_keys_runtime.Key_StringToKeynum`, `mq3.client.cl_keys_runtime.Key_GetBinding` and additional helpers from engine client keys runtime `Key_Bind_f`. The final path returns `Key_SetBinding(state,key,value)`.
/// @param state Shared engine client keys runtime state passed to the helper calls in `Key_Bind_f`.
/// @param args Sequence read at `args[1]`, `args[index]`.
function Key_Bind_f(state,args)
  if len(args)<2 then event(state,"print",-1,false,"bind <key> [command] : attach a command to a key\n");return false end if;key=Key_StringToKeynum(args[1]);if key==-1 then event(state,"print",-1,false,"\""+args[1]+"\" isn't a valid key\n");return false end if
  if len(args)==2 then value=Key_GetBinding(state,key);if value!=void and value!="" then event(state,"print",key,false,"\""+args[1]+"\" = \""+value+"\"\n") else event(state,"print",key,false,"\""+args[1]+"\" is not bound\n") end if;return true end if
  value="";for index=2 to len(args)-1 if index>2 then value=value+" " end if;value=value+args[index] end for;return Key_SetBinding(state,key,value)
end function
/// Calls `mq3.client.key_bindings_config.bindingText` from engine client keys runtime `Key_WriteBindings`. The final path returns `config.bindingText(state.bindingState)`.
/// @param state Record read through `state.bindingState`.
function Key_WriteBindings(state) if state==void then return "unbindall\n" end if;return config.bindingText(state.bindingState) end function
/// Calls `mq3.client.cl_keys_runtime.Key_GetBinding`, `mq3.client.cl_keys_runtime.event`, `mq3.client.cl_keys_runtime.Key_KeynumToString` from engine client keys runtime `Key_Bindlist_f`. The final path returns `count`.
/// @param state Shared engine client keys runtime state passed to the helper calls in `Key_Bindlist_f`.
/// @param args Accepted for compatibility with `Key_Bindlist_f`; the current implementation does not read it.
function Key_Bindlist_f(state,args) count=0;for key=0 to MAX_KEYS-1 value=Key_GetBinding(state,key);if value!=void and value!="" then event(state,"print",key,false,Key_KeynumToString(key)+" \""+value+"\"\n");count=count+1 end if end for;return count end function
/// Calls `mq3.qcommon.command_buffer.argc`, `mq3.qcommon.command_buffer.argv` from engine client keys runtime `commandArgs`. The final path returns `result`.
/// @param commandState commandState record passed to the engine client keys runtime helper calls.
function commandArgs(commandState) result=[];for index=0 to command.argc(commandState)-1 result=result+[command.argv(commandState,index)] end for;return result end function
/// Adapts `mq3.client.cl_keys_runtime.Key_Bind_f` to engine client keys runtime `bindCallback`, returning its result for `state, commandArgs(commandState)`.
/// @param commandState Argument 2 of `mq3.client.cl_keys_runtime.Key_Bind_f`; passed as `commandArgs(commandState)`.
/// @param state Argument 1 of `mq3.client.cl_keys_runtime.Key_Bind_f`.
function bindCallback(commandState,state) return Key_Bind_f(state,commandArgs(commandState)) end function
/// Adapts `mq3.client.cl_keys_runtime.Key_Unbind_f` to engine client keys runtime `unbindCallback`, returning its result for `state, commandArgs(commandState)`.
/// @param commandState Argument 2 of `mq3.client.cl_keys_runtime.Key_Unbind_f`; passed as `commandArgs(commandState)`.
/// @param state Argument 1 of `mq3.client.cl_keys_runtime.Key_Unbind_f`.
function unbindCallback(commandState,state) return Key_Unbind_f(state,commandArgs(commandState)) end function
/// Adapts `mq3.client.cl_keys_runtime.Key_Unbindall_f` to engine client keys runtime `unbindAllCallback`, returning its result for `state, commandArgs(commandState)`.
/// @param commandState Argument 2 of `mq3.client.cl_keys_runtime.Key_Unbindall_f`; passed as `commandArgs(commandState)`.
/// @param state Argument 1 of `mq3.client.cl_keys_runtime.Key_Unbindall_f`.
function unbindAllCallback(commandState,state) return Key_Unbindall_f(state,commandArgs(commandState)) end function
/// Adapts `mq3.client.cl_keys_runtime.Key_Bindlist_f` to engine client keys runtime `bindListCallback`, returning its result for `state, commandArgs(commandState)`.
/// @param commandState Argument 2 of `mq3.client.cl_keys_runtime.Key_Bindlist_f`; passed as `commandArgs(commandState)`.
/// @param state Argument 1 of `mq3.client.cl_keys_runtime.Key_Bindlist_f`.
function bindListCallback(commandState,state) return Key_Bindlist_f(state,commandArgs(commandState)) end function
/// Updates `state.initialized` during engine client keys runtime `CL_InitKeyCommands`.
/// @param state Mutable engine client keys runtime record/storage; this routine assigns `state.initialized`.
function CL_InitKeyCommands(state)
  if state==void then return false end if;if state.initialized then return true end if
  if not command.addContextCommand(state.commandState,"bind",bindCallback,state) then return error(7805,"bind command already registered") end if
  if not command.addContextCommand(state.commandState,"unbind",unbindCallback,state) then return error(7805,"unbind command already registered") end if
  if not command.addContextCommand(state.commandState,"unbindall",unbindAllCallback,state) then return error(7805,"unbindall command already registered") end if
  if not command.addContextCommand(state.commandState,"bindlist",bindListCallback,state) then return error(7805,"bindlist command already registered") end if
  state.initialized=true;return true
end function

/// Calls `mq3.client.key_binding_dispatch.commands`, `mq3.client.cl_keys_runtime.event` from engine client keys runtime `CL_AddKeyUpCommands`. The final path returns `values`.
/// @param state Shared engine client keys runtime state passed to the helper calls in `CL_AddKeyUpCommands`.
/// @param key Key or control identifier used to select the corresponding engine client keys runtime entry.
/// @param binding Command text associated with an input key.
/// @param time Value used by `values=dispatch.commands(binding,key,false,time)`.
function CL_AddKeyUpCommands(state,key,binding,time)
  values=dispatch.commands(binding,key,false,time);if values is error then return values end if;for each value in values event(state,"command",key,false,value.text) end for;return values
end function
/// Calls `mq3.client.console_input.consoleKey`, `mq3.client.cl_keys_runtime.Key_IsDown`, `mq3.client.cl_keys_runtime.syncCatcher` from engine client keys runtime `Console_Key`. The final path returns `result`.
/// @param state Record read through `state.consoleState`.
/// @param key Key or control identifier used to select the corresponding engine client keys runtime entry.
function Console_Key(state,key) result=console.consoleKey(state.consoleState,key,Key_IsDown(state,console.K_SHIFT),Key_IsDown(state,console.K_CTRL));syncCatcher(state);return result end function
/// Calls `mq3.client.console_input.messageKey`, `mq3.client.cl_keys_runtime.Key_IsDown`, `mq3.client.cl_keys_runtime.syncCatcher` from engine client keys runtime `Message_Key`. The final path returns `result`.
/// @param state Record read through `state.consoleState`.
/// @param key Key or control identifier used to select the corresponding engine client keys runtime entry.
function Message_Key(state,key) result=console.messageKey(state.consoleState,key,Key_IsDown(state,console.K_SHIFT),Key_IsDown(state,console.K_CTRL));syncCatcher(state);return result end function

/// Updates `state.repeats[key]`, `state.anyKeyDown`, `state.consoleState.catcher` during engine client keys runtime `CL_KeyEvent`.
/// @param state Mutable engine client keys runtime record/storage; this routine assigns `state.repeats[key]`, `state.anyKeyDown`, `state.consoleState.catcher`.
/// @param key Key or control identifier used to select the corresponding engine client keys runtime entry.
/// @param down Whether this event presses the key/button; false represents its release.
/// @param time Value used by `CL_AddKeyUpCommands(state,key,Key_GetBinding(state,key),time)`.
function CL_KeyEvent(state,key,down,time)
  if state==void or not valid(key) then return false end if;keys.setDown(state.keyState,key,down)
  if down then state.repeats[key]=state.repeats[key]+1;if state.repeats[key]==1 then state.anyKeyDown=state.anyKeyDown+1 end if
  else state.repeats[key]=0;state.anyKeyDown=state.anyKeyDown-1;if state.anyKeyDown<0 then state.anyKeyDown=0 end if end if
  if key==96 or key==126 then if down then console.toggleConsole(state.consoleState);syncCatcher(state);event(state,"console-toggle",key,true,"") end if;return true end if
  catcher=state.consoleState.catcher
  if down and (key<128 or key==178) and (state.demoPlaying or state.consoleState.connectionState==CA_CINEMATIC) and catcher==0 and state.cameraMode==0 then event(state,"set-nextdemo",key,true,"");key=K_ESCAPE end if
  if key==K_ESCAPE and down then
    if (catcher&KEYCATCH_MESSAGE)!=0 then Message_Key(state,key);return true end if
    if (catcher&KEYCATCH_CGAME)!=0 then state.consoleState.catcher=catcher&(~KEYCATCH_CGAME);syncCatcher(state);event(state,"cgame-event-none",key,true,"");return true end if
    if (catcher&KEYCATCH_UI)==0 then if state.consoleState.connectionState==CA_ACTIVE and not state.demoPlaying then state.consoleState.catcher=catcher|KEYCATCH_UI;event(state,"ui-menu",key,true,"ingame") else event(state,"disconnect",key,true,"");state.consoleState.catcher=catcher|KEYCATCH_UI;event(state,"ui-menu",key,true,"main") end if;syncCatcher(state);return true end if
    event(state,"ui-key",key,true,"");return true
  end if
  if not down then
    CL_AddKeyUpCommands(state,key,Key_GetBinding(state,key),time);if (catcher&KEYCATCH_UI)!=0 then event(state,"ui-key",key,false,"") else if (catcher&KEYCATCH_CGAME)!=0 then event(state,"cgame-key",key,false,"") end if;return true
  end if
  if (catcher&KEYCATCH_CONSOLE)!=0 then Console_Key(state,key)
  else if (catcher&KEYCATCH_UI)!=0 then event(state,"ui-key",key,true,"")
  else if (catcher&KEYCATCH_CGAME)!=0 then event(state,"cgame-key",key,true,"")
  else if (catcher&KEYCATCH_MESSAGE)!=0 then Message_Key(state,key)
  else if state.consoleState.connectionState==CA_DISCONNECTED then Console_Key(state,key)
  else binding=Key_GetBinding(state,key);if binding==void or binding=="" then if key>=200 then event(state,"print",key,true,Key_KeynumToString(key)+" is unbound, use controls menu to set.\n") end if else values=dispatch.commands(binding,key,true,time);if values is error then return values end if;for each value in values event(state,"command",key,true,value.text) end for end if end if
  return true
end function
/// Calls `mq3.client.cl_keys_runtime.Field_CharEvent`, `mq3.client.cl_keys_runtime.event` from engine client keys runtime `CL_CharEvent`.
/// @param state Record read through `state.consoleState.catcher`, `state.consoleState.console`, `state.consoleState.chat`, `state.consoleState.connectionState`.
/// @param key Key or control identifier used to select the corresponding engine client keys runtime entry.
function CL_CharEvent(state,key)
  if state==void or key==96 or key==126 then return false end if;catcher=state.consoleState.catcher
  if (catcher&KEYCATCH_CONSOLE)!=0 then Field_CharEvent(state,state.consoleState.console,key)
  else if (catcher&KEYCATCH_UI)!=0 then event(state,"ui-key",key|K_CHAR_FLAG,true,"")
  else if (catcher&KEYCATCH_MESSAGE)!=0 then Field_CharEvent(state,state.consoleState.chat,key)
  else if state.consoleState.connectionState==CA_DISCONNECTED then Field_CharEvent(state,state.consoleState.console,key) end if;return true
end function
/// Updates `state.anyKeyDown`, `state.repeats[key]` during engine client keys runtime `Key_ClearStates`.
/// @param state Mutable engine client keys runtime record/storage; this routine assigns `state.anyKeyDown`, `state.repeats[key]`.
function Key_ClearStates(state)
  if state==void then return void end if;state.anyKeyDown=0;for key=0 to MAX_KEYS-1 if Key_IsDown(state,key) then CL_KeyEvent(state,key,false,0) end if;keys.setDown(state.keyState,key,false);state.repeats[key]=0 end for;return void
end function
