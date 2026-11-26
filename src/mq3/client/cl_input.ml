// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native file adapter for code/client/cl_input.c.
package mq3.client.cl_input

import mq3.client.input_command as input
import mq3.client.send_cmd as send
import mq3.client.command_ring as commandRing
import mq3.qcommon.command_buffer as command

/// UI keyboard-capture mask used when marking commands and suppressing ordinary movement input while
/// menus capture the keyboard.
const KEYCATCH_UI=2
/// Input-capture bit that routes keyboard events to the cgame subsystem.
const KEYCATCH_CGAME=8

// The callbacks are the only VM/host boundary in this module.  Supplying void
// suppresses the corresponding side effect, which makes deterministic native
// and headless clients use the same input state machine as the windowed host.
struct Host
  /// Host callback for the ui mouse operation; an unset callback leaves that host operation
  /// unavailable.
  uiMouseFn
  /// Host callback for the cgame mouse operation; an unset callback leaves that host operation
  /// unavailable.
  cgameMouseFn
  /// Host callback for the debug graph operation; an unset callback leaves that host operation
  /// unavailable.
  debugGraphFn
  /// Host callback for the print operation; an unset callback leaves that host operation unavailable.
  printFn
  /// Caller-supplied value forwarded unchanged to the service callbacks for engine input sampling and
  /// user-command construction.
  context
end struct
/// Stores engine client input state, including `inputState`, `config`, `sendState`, `sendHost`, `commandState`, `host` and additional values.
struct State
  /// When constructing this record, `create` supplies `input.create(0.0,0.0,0.0)` for this member. Used
  /// by `IN_MLookDown` and `IN_MLookUp` during subsequent processing.
  inputState
  /// When constructing this record, `create` supplies `input.defaults()` for this member. Used by
  /// `IN_MLookUp` and `CL_AdjustAngles` during subsequent processing.
  config
  /// When constructing this record, `create` supplies `sendState` for this member. Used by
  /// `CL_CreateNewCommands` and `CL_ReadyToSendPacket` during subsequent processing.
  sendState
  /// When constructing this record, `create` supplies `sendHost` for this member. Used by
  /// `CL_ReadyToSendPacket` and `CL_WritePacket` during subsequent processing.
  sendHost
  /// When constructing this record, `create` supplies `commandState` for this member. Used by
  /// `CL_InitInput` during subsequent processing.
  commandState
  /// Host-adapter callbacks and context used to execute the module's engine operations.
  host
  /// Absolute input-frame timestamp in milliseconds used to integrate held controls and construct the
  /// next user command.
  frameTime
  /// When constructing this record, `create` supplies `1` for this member. Used by `IN_KeyUp` and
  /// `CL_KeyState` during subsequent processing.
  frameMsec
  /// Current synchronized server-domain time in milliseconds used when constructing input commands.
  serverTime
  /// Requested weapon identifier copied into each generated user command with an eight-bit mask.
  weapon
  /// When constructing this record, `create` supplies `1.0` for this member. Used by `CL_MouseMove`
  /// during subsequent processing.
  cgameSensitivity
  /// Bitmask selecting which subsystems currently intercept keyboard input.
  keyCatchers
  /// When constructing this record, `create` supplies `false` for this member. Used by `CL_CmdButtons`
  /// during subsequent processing.
  anyKeyDown
  /// When constructing this record, `create` supplies `0` for this member. Used by `IN_CenterView`
  /// during subsequent processing.
  deltaPitch
  /// When constructing this record, `create` supplies `0` for this member. Used by `CL_CreateCmd`
  /// during subsequent processing.
  debugMove
  /// True after input commands and input-related cvars have been registered, preventing duplicate
  /// initialization.
  initialized
end struct

/// Creates a `mq3.client.cl_input.Host` record. Initializes the record with the defaults written in this constructor.
function hostServices() return Host(void,void,void,void,void) end function
/// Creates a `mq3.client.cl_input.State` record. Assigns `sendState` from `sendState`, `sendHost` from `sendHost`, `commandState` from `commandState`.
/// @param commandState Value used to initialize `State.commandState`.
/// @param sendState Value used to initialize `State.sendState`.
/// @param sendHost Value used to initialize `State.sendHost`.
function create(commandState,sendState,sendHost)
  return State(input.create(0.0,0.0,0.0),input.defaults(),sendState,sendHost,commandState,hostServices(),0,1,0,0,1.0,0,false,0,0,false)
end function
/// Calls `state.host.printFn` from engine client input `emit`.
/// @param state Record read through `state.host`, `state.host.printFn`, `state.host.context`.
/// @param text Text consumed or emitted by `emit` in the engine client input path.
function emit(state,text) if state.host!=void and state.host.printFn!=void then state.host.printFn(state.host.context,text) end if;return void end function
/// Calls `mq3.qcommon.command_buffer.argc`, `mq3.client.cl_input.atoi`, `mq3.qcommon.command_buffer.argv` from engine client input `parseArg`. The final path returns `atoi(command.argv(commandState,index))`.
/// @param commandState commandState record passed to the engine client input helper calls.
/// @param index Value tested by `command.argc(commandState)<=index` before the calculation continues.
/// @param fallback Value used by `if command.argc(commandState)<=index then return fallback end if`.
function parseArg(commandState,index,fallback) if command.argc(commandState)<=index then return fallback end if;return atoi(command.argv(commandState,index)) end function

/// Calls `mq3.client.input_command.keyDown`, `mq3.client.cl_input.emit` from engine client input `IN_KeyDown`. The final path returns `result`.
/// @param state Shared engine client input state passed to the helper calls in `IN_KeyDown`.
/// @param value Record read through `value.down0`, `value.down1`, `value.active`.
/// @param key Key or control identifier used to select the corresponding engine client input entry.
/// @param time Value used by `result=input.keyDown(value,key,time)`.
function IN_KeyDown(state,value,key,time)
  if state==void or value==void then return error(7740,"cl_input: missing key-down state") end if
  before0=value.down0;before1=value.down1;result=input.keyDown(value,key,time)
  if not result and value.down0==before0 and value.down1==before1 and value.active and key!=before0 and key!=before1 and before0!=0 and before1!=0 then emit(state,"Three keys down for a button!\n") end if
  return result
end function
/// Calls `mq3.client.input_command.keyUp` from engine client input `IN_KeyUp`. The final path returns `input.keyUp(value,key,time,state.frameMsec)`.
/// @param state Record read through `state.frameMsec`.
/// @param value Value tested by `state==void or value==void` before the calculation continues.
/// @param key Key or control identifier used to select the corresponding engine client input entry.
/// @param time Value used by `return input.keyUp(value,key,time,state.frameMsec)`.
function IN_KeyUp(state,value,key,time) if state==void or value==void then return error(7740,"cl_input: missing key-up state") end if;return input.keyUp(value,key,time,state.frameMsec) end function
/// Calls `mq3.client.input_command.keyState` from engine client input `CL_KeyState`. The final path returns `input.keyState(value,state.frameTime,state.frameMsec)`.
/// @param state Record read through `state.frameTime`, `state.frameMsec`.
/// @param value Value used by `return input.keyState(value,state.frameTime,state.frameMsec)`.
function CL_KeyState(state,value) if state==void then return 0.0 end if;return input.keyState(value,state.frameTime,state.frameMsec) end function

/// Updates `state.inputState.mlooking` during engine client input `IN_MLookDown`.
/// @param state Mutable engine client input record/storage; this routine assigns `state.inputState.mlooking`.
/// @param key Accepted for compatibility with `IN_MLookDown`; the current implementation does not read it.
/// @param time Accepted for compatibility with `IN_MLookDown`; the current implementation does not read it.
function IN_MLookDown(state,key,time) state.inputState.mlooking=true;return true end function
/// Updates `state.inputState.mlooking` during engine client input `IN_MLookUp`.
/// @param state Mutable engine client input record/storage; this routine assigns `state.inputState.mlooking`.
/// @param key Accepted for compatibility with `IN_MLookUp`; the current implementation does not read it.
/// @param time Accepted for compatibility with `IN_MLookUp`; the current implementation does not read it.
function IN_MLookUp(state,key,time) state.inputState.mlooking=false;if not state.config.freelook then IN_CenterView(state) end if;return true end function
/// Updates `state.inputState.viewangles[0]` during engine client input `IN_CenterView`.
/// @param state Mutable engine client input record/storage; this routine assigns `state.inputState.viewangles[0]`.
function IN_CenterView(state) state.inputState.viewangles[0]=0.0-(state.deltaPitch*360.0/65536.0);return void end function

/// Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_UpDown`, returning its result for `state, state.inputState.up, key, time`.
/// @param state Record read through `state.inputState.up`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyDown`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyDown`.
function IN_UpDown(state,key,time) return IN_KeyDown(state,state.inputState.up,key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_UpUp`, returning its result for `state, state.inputState.up, key, time`.
/// @param state Record read through `state.inputState.up`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyUp`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyUp`.
function IN_UpUp(state,key,time) return IN_KeyUp(state,state.inputState.up,key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_DownDown`, returning its result for `state, state.inputState.down, key, time`.
/// @param state Record read through `state.inputState.down`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyDown`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyDown`.
function IN_DownDown(state,key,time) return IN_KeyDown(state,state.inputState.down,key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_DownUp`, returning its result for `state, state.inputState.down, key, time`.
/// @param state Record read through `state.inputState.down`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyUp`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyUp`.
function IN_DownUp(state,key,time) return IN_KeyUp(state,state.inputState.down,key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_LeftDown`, returning its result for `state, state.inputState.left, key, time`.
/// @param state Record read through `state.inputState.left`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyDown`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyDown`.
function IN_LeftDown(state,key,time) return IN_KeyDown(state,state.inputState.left,key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_LeftUp`, returning its result for `state, state.inputState.left, key, time`.
/// @param state Record read through `state.inputState.left`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyUp`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyUp`.
function IN_LeftUp(state,key,time) return IN_KeyUp(state,state.inputState.left,key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_RightDown`, returning its result for `state, state.inputState.right, key, time`.
/// @param state Record read through `state.inputState.right`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyDown`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyDown`.
function IN_RightDown(state,key,time) return IN_KeyDown(state,state.inputState.right,key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_RightUp`, returning its result for `state, state.inputState.right, key, time`.
/// @param state Record read through `state.inputState.right`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyUp`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyUp`.
function IN_RightUp(state,key,time) return IN_KeyUp(state,state.inputState.right,key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_ForwardDown`, returning its result for `state, state.inputState.forward, key, time`.
/// @param state Record read through `state.inputState.forward`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyDown`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyDown`.
function IN_ForwardDown(state,key,time) return IN_KeyDown(state,state.inputState.forward,key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_ForwardUp`, returning its result for `state, state.inputState.forward, key, time`.
/// @param state Record read through `state.inputState.forward`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyUp`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyUp`.
function IN_ForwardUp(state,key,time) return IN_KeyUp(state,state.inputState.forward,key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_BackDown`, returning its result for `state, state.inputState.back, key, time`.
/// @param state Record read through `state.inputState.back`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyDown`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyDown`.
function IN_BackDown(state,key,time) return IN_KeyDown(state,state.inputState.back,key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_BackUp`, returning its result for `state, state.inputState.back, key, time`.
/// @param state Record read through `state.inputState.back`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyUp`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyUp`.
function IN_BackUp(state,key,time) return IN_KeyUp(state,state.inputState.back,key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_LookupDown`, returning its result for `state, state.inputState.lookup, key, time`.
/// @param state Record read through `state.inputState.lookup`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyDown`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyDown`.
function IN_LookupDown(state,key,time) return IN_KeyDown(state,state.inputState.lookup,key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_LookupUp`, returning its result for `state, state.inputState.lookup, key, time`.
/// @param state Record read through `state.inputState.lookup`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyUp`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyUp`.
function IN_LookupUp(state,key,time) return IN_KeyUp(state,state.inputState.lookup,key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_LookdownDown`, returning its result for `state, state.inputState.lookdown, key, time`.
/// @param state Record read through `state.inputState.lookdown`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyDown`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyDown`.
function IN_LookdownDown(state,key,time) return IN_KeyDown(state,state.inputState.lookdown,key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_LookdownUp`, returning its result for `state, state.inputState.lookdown, key, time`.
/// @param state Record read through `state.inputState.lookdown`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyUp`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyUp`.
function IN_LookdownUp(state,key,time) return IN_KeyUp(state,state.inputState.lookdown,key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_MoveleftDown`, returning its result for `state, state.inputState.moveleft, key, time`.
/// @param state Record read through `state.inputState.moveleft`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyDown`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyDown`.
function IN_MoveleftDown(state,key,time) return IN_KeyDown(state,state.inputState.moveleft,key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_MoveleftUp`, returning its result for `state, state.inputState.moveleft, key, time`.
/// @param state Record read through `state.inputState.moveleft`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyUp`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyUp`.
function IN_MoveleftUp(state,key,time) return IN_KeyUp(state,state.inputState.moveleft,key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_MoverightDown`, returning its result for `state, state.inputState.moveright, key, time`.
/// @param state Record read through `state.inputState.moveright`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyDown`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyDown`.
function IN_MoverightDown(state,key,time) return IN_KeyDown(state,state.inputState.moveright,key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_MoverightUp`, returning its result for `state, state.inputState.moveright, key, time`.
/// @param state Record read through `state.inputState.moveright`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyUp`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyUp`.
function IN_MoverightUp(state,key,time) return IN_KeyUp(state,state.inputState.moveright,key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_SpeedDown`, returning its result for `state, state.inputState.speed, key, time`.
/// @param state Record read through `state.inputState.speed`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyDown`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyDown`.
function IN_SpeedDown(state,key,time) return IN_KeyDown(state,state.inputState.speed,key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_SpeedUp`, returning its result for `state, state.inputState.speed, key, time`.
/// @param state Record read through `state.inputState.speed`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyUp`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyUp`.
function IN_SpeedUp(state,key,time) return IN_KeyUp(state,state.inputState.speed,key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_StrafeDown`, returning its result for `state, state.inputState.strafe, key, time`.
/// @param state Record read through `state.inputState.strafe`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyDown`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyDown`.
function IN_StrafeDown(state,key,time) return IN_KeyDown(state,state.inputState.strafe,key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_StrafeUp`, returning its result for `state, state.inputState.strafe, key, time`.
/// @param state Record read through `state.inputState.strafe`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyUp`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyUp`.
function IN_StrafeUp(state,key,time) return IN_KeyUp(state,state.inputState.strafe,key,time) end function

/// Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button0Down`, returning its result for `state, state.inputState.buttons[0], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyDown`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyDown`.
function IN_Button0Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[0],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button0Up`, returning its result for `state, state.inputState.buttons[0], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyUp`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyUp`.
function IN_Button0Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[0],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button1Down`, returning its result for `state, state.inputState.buttons[1], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyDown`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyDown`.
function IN_Button1Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[1],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button1Up`, returning its result for `state, state.inputState.buttons[1], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyUp`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyUp`.
function IN_Button1Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[1],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button2Down`, returning its result for `state, state.inputState.buttons[2], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyDown`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyDown`.
function IN_Button2Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[2],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button2Up`, returning its result for `state, state.inputState.buttons[2], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyUp`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyUp`.
function IN_Button2Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[2],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button3Down`, returning its result for `state, state.inputState.buttons[3], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyDown`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyDown`.
function IN_Button3Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[3],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button3Up`, returning its result for `state, state.inputState.buttons[3], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyUp`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyUp`.
function IN_Button3Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[3],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button4Down`, returning its result for `state, state.inputState.buttons[4], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyDown`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyDown`.
function IN_Button4Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[4],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button4Up`, returning its result for `state, state.inputState.buttons[4], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyUp`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyUp`.
function IN_Button4Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[4],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button5Down`, returning its result for `state, state.inputState.buttons[5], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyDown`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyDown`.
function IN_Button5Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[5],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button5Up`, returning its result for `state, state.inputState.buttons[5], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyUp`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyUp`.
function IN_Button5Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[5],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button6Down`, returning its result for `state, state.inputState.buttons[6], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyDown`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyDown`.
function IN_Button6Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[6],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button6Up`, returning its result for `state, state.inputState.buttons[6], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyUp`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyUp`.
function IN_Button6Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[6],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button7Down`, returning its result for `state, state.inputState.buttons[7], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyDown`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyDown`.
function IN_Button7Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[7],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button7Up`, returning its result for `state, state.inputState.buttons[7], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyUp`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyUp`.
function IN_Button7Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[7],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button8Down`, returning its result for `state, state.inputState.buttons[8], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyDown`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyDown`.
function IN_Button8Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[8],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button8Up`, returning its result for `state, state.inputState.buttons[8], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyUp`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyUp`.
function IN_Button8Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[8],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button9Down`, returning its result for `state, state.inputState.buttons[9], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyDown`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyDown`.
function IN_Button9Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[9],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button9Up`, returning its result for `state, state.inputState.buttons[9], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyUp`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyUp`.
function IN_Button9Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[9],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button10Down`, returning its result for `state, state.inputState.buttons[10], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyDown`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyDown`.
function IN_Button10Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[10],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button10Up`, returning its result for `state, state.inputState.buttons[10], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyUp`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyUp`.
function IN_Button10Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[10],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button11Down`, returning its result for `state, state.inputState.buttons[11], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyDown`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyDown`.
function IN_Button11Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[11],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button11Up`, returning its result for `state, state.inputState.buttons[11], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyUp`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyUp`.
function IN_Button11Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[11],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button12Down`, returning its result for `state, state.inputState.buttons[12], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyDown`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyDown`.
function IN_Button12Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[12],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button12Up`, returning its result for `state, state.inputState.buttons[12], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyUp`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyUp`.
function IN_Button12Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[12],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button13Down`, returning its result for `state, state.inputState.buttons[13], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyDown`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyDown`.
function IN_Button13Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[13],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button13Up`, returning its result for `state, state.inputState.buttons[13], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyUp`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyUp`.
function IN_Button13Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[13],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button14Down`, returning its result for `state, state.inputState.buttons[14], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyDown`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyDown`.
function IN_Button14Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[14],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button14Up`, returning its result for `state, state.inputState.buttons[14], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyUp`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyUp`.
function IN_Button14Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[14],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button15Down`, returning its result for `state, state.inputState.buttons[15], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyDown`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyDown`.
function IN_Button15Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[15],key,time) end function
/// Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button15Up`, returning its result for `state, state.inputState.buttons[15], key, time`.
/// @param state Record read through `state.inputState.buttons`.
/// @param key Argument 3 of `mq3.client.cl_input.IN_KeyUp`.
/// @param time Argument 4 of `mq3.client.cl_input.IN_KeyUp`.
function IN_Button15Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[15],key,time) end function
/// Adapts `mq3.client.cl_input.IN_Button1Down` to engine client input `IN_ButtonDown`, returning its result for `state, key, time`.
/// @param state Argument 1 of `mq3.client.cl_input.IN_Button1Down`.
/// @param key Argument 2 of `mq3.client.cl_input.IN_Button1Down`.
/// @param time Argument 3 of `mq3.client.cl_input.IN_Button1Down`.
function IN_ButtonDown(state,key,time) return IN_Button1Down(state,key,time) end function
/// Adapts `mq3.client.cl_input.IN_Button1Up` to engine client input `IN_ButtonUp`, returning its result for `state, key, time`.
/// @param state Argument 1 of `mq3.client.cl_input.IN_Button1Up`.
/// @param key Argument 2 of `mq3.client.cl_input.IN_Button1Up`.
/// @param time Argument 3 of `mq3.client.cl_input.IN_Button1Up`.
function IN_ButtonUp(state,key,time) return IN_Button1Up(state,key,time) end function

/// Adapts `mq3.client.input_command.adjustAngles` to engine client input `CL_AdjustAngles`, returning its result for `state.inputState, state.config, state.frameTime, state.frameMsec`.
/// @param state Record read through `state.inputState`, `state.config`, `state.frameTime`, `state.frameMsec`.
function CL_AdjustAngles(state) return input.adjustAngles(state.inputState,state.config,state.frameTime,state.frameMsec) end function
/// Adapts `mq3.client.input_command.keyMove` to engine client input `CL_KeyMove`, returning its result for `state.inputState, state.config, value, state.frameTime, state.frameMsec`.
/// @param state Record read through `state.inputState`, `state.config`, `state.frameTime`, `state.frameMsec`.
/// @param value Argument 3 of `mq3.client.input_command.keyMove`.
function CL_KeyMove(state,value) return input.keyMove(state.inputState,state.config,value,state.frameTime,state.frameMsec) end function
/// Calls `state.host.uiMouseFn`, `state.host.cgameMouseFn`, `mq3.client.input_command.accumulateMouse` from engine client input `CL_MouseEvent`. The final path returns `"game"`.
/// @param state Record read through `state.keyCatchers`, `state.host.uiMouseFn`, `state.host.context`, `state.host.cgameMouseFn` and additional values.
/// @param dx Value used by `if (state.keyCatchers&KEYCATCH_UI)!=0 then if state.host.uiMouseFn!=void then state.host.uiMouseFn(state.host.context,dx,dy) end if`.
/// @param dy Value used by `if (state.keyCatchers&KEYCATCH_UI)!=0 then if state.host.uiMouseFn!=void then state.host.uiMouseFn(state.host.context,dx,dy) end if`.
/// @param time Accepted for compatibility with `CL_MouseEvent`; the current implementation does not read it.
function CL_MouseEvent(state,dx,dy,time)
  if (state.keyCatchers&KEYCATCH_UI)!=0 then if state.host.uiMouseFn!=void then state.host.uiMouseFn(state.host.context,dx,dy) end if;return "ui" end if
  if (state.keyCatchers&KEYCATCH_CGAME)!=0 then if state.host.cgameMouseFn!=void then state.host.cgameMouseFn(state.host.context,dx,dy) end if;return "cgame" end if
  result=input.accumulateMouse(state.inputState,dx,dy);if result is error then return result end if;return "game"
end function
/// Updates `state.inputState.joystickAxis[axis]` during engine client input `CL_JoystickEvent`.
/// @param state Mutable engine client input record/storage; this routine assigns `state.inputState.joystickAxis[axis]`.
/// @param axis Value used by `if state==void or axis<0 or axis>=input.MAX_JOYSTICK_AXIS then return error(7740,"CL_JoystickEvent: bad axis "+str(axis)) end if`.
/// @param value Value used by `state.inputState.joystickAxis[axis]=value`.
/// @param time Accepted for compatibility with `CL_JoystickEvent`; the current implementation does not read it.
function CL_JoystickEvent(state,axis,value,time)
  // The original validates only the axis. Native Win32 normally supplies the
  // -127..127 range, but retaining arbitrary host values is ABI-significant.
  if state==void or axis<0 or axis>=input.MAX_JOYSTICK_AXIS then return error(7740,"CL_JoystickEvent: bad axis "+str(axis)) end if
  state.inputState.joystickAxis[axis]=value;return void
end function
/// Adapts `mq3.client.input_command.joystickMove` to engine client input `CL_JoystickMove`, returning its result for `state.inputState, state.config, value, state.frameMsec`.
/// @param state Record read through `state.inputState`, `state.config`, `state.frameMsec`.
/// @param value Argument 3 of `mq3.client.input_command.joystickMove`.
function CL_JoystickMove(state,value) return input.joystickMove(state.inputState,state.config,value,state.frameMsec) end function
/// Adapts `mq3.client.input_command.mouseMove` to engine client input `CL_MouseMove`, returning its result for `state.inputState, state.config, value, state.frameMsec, state.cgameSensitivity`.
/// @param state Record read through `state.inputState`, `state.config`, `state.frameMsec`, `state.cgameSensitivity`.
/// @param value Argument 3 of `mq3.client.input_command.mouseMove`.
function CL_MouseMove(state,value) return input.mouseMove(state.inputState,state.config,value,state.frameMsec,state.cgameSensitivity) end function
/// Adapts `mq3.client.input_command.commandButtons` to engine client input `CL_CmdButtons`, returning its result for `state.inputState, value, state.keyCatchers, state.anyKeyDown`.
/// @param state Record read through `state.inputState`, `state.keyCatchers`, `state.anyKeyDown`.
/// @param value Argument 2 of `mq3.client.input_command.commandButtons`.
function CL_CmdButtons(state,value) return input.commandButtons(state.inputState,value,state.keyCatchers,state.anyKeyDown) end function
/// Updates `value.weapon`, `value.serverTime`, `value.angles`, `value.viewangles` during engine client input `CL_FinishMove`.
/// @param state Record read through `state.weapon`, `state.serverTime`, `state.inputState.viewangles`.
/// @param value Mutable engine client input record/storage; this routine assigns `value.weapon`, `value.serverTime`, `value.angles`, `value.viewangles`.
function CL_FinishMove(state,value)
  value.weapon=state.weapon&255;value.serverTime=state.serverTime
  value.angles=[input.angleShort(state.inputState.viewangles[0]),input.angleShort(state.inputState.viewangles[1]),input.angleShort(state.inputState.viewangles[2])]
  value.viewangles=[state.inputState.viewangles[0],state.inputState.viewangles[1],state.inputState.viewangles[2]];return void
end function
/// Evaluates engine client input `magnitude` and returns `0.0-value`, `value` according to its guard/selection conditions.
/// @param value Value tested by `value<0.0` before the calculation continues.
function magnitude(value) if value<0.0 then return 0.0-value end if;return value end function
/// Updates `state.inputState.viewangles[0]` during engine client input `CL_CreateCmd`.
/// @param state Mutable engine client input record/storage; this routine assigns `state.inputState.viewangles[0]`.
function CL_CreateCmd(state)
  oldPitch=state.inputState.viewangles[0];oldYaw=state.inputState.viewangles[1];CL_AdjustAngles(state)
  value=input.Command([0,0,0],0,state.weapon&255,0,0,0,state.serverTime,[0.0,0.0,0.0]);CL_CmdButtons(state,value);CL_KeyMove(state,value);CL_MouseMove(state,value);CL_JoystickMove(state,value)
  if state.inputState.viewangles[0]-oldPitch>90.0 then state.inputState.viewangles[0]=oldPitch+90.0 else if oldPitch-state.inputState.viewangles[0]>90.0 then state.inputState.viewangles[0]=oldPitch-90.0 end if
  CL_FinishMove(state,value)
  if state.host.debugGraphFn!=void and state.debugMove==1 then state.host.debugGraphFn(state.host.context,magnitude(state.inputState.viewangles[1]-oldYaw),0) end if
  if state.host.debugGraphFn!=void and state.debugMove==2 then state.host.debugGraphFn(state.host.context,magnitude(state.inputState.viewangles[0]-oldPitch),0) end if
  return value
end function

/// Updates `state.frameTime`, `state.frameMsec`, `state.sendState.frameMsec`, `state.sendState.oldFrameTime` and additional values during engine client input `CL_CreateNewCommands`.
/// @param state Mutable engine client input record/storage; this routine assigns `state.frameTime`, `state.frameMsec`, `state.sendState.frameMsec`, `state.sendState.oldFrameTime` and additional values.
/// @param frameTime Value assigned to `state.frameTime`.
function CL_CreateNewCommands(state,frameTime)
  if state==void or state.sendState==void then return error(7740,"cl_input: missing send state") end if
  advanced=commandRing.advance(state.sendState.connectionState,frameTime,state.sendState.oldFrameTime,state.sendState.cmdNumber)
  if not advanced.created then return false end if
  state.frameTime=frameTime;state.frameMsec=advanced.frameMsec;state.sendState.frameMsec=advanced.frameMsec;state.sendState.oldFrameTime=advanced.oldFrameTime;state.sendState.cmdNumber=advanced.commandNumber
  value=CL_CreateCmd(state);commandRing.store(state.sendState.commands,state.sendState.cmdNumber,send.commandCopy(value));return true
end function
/// Adapts `mq3.client.send_cmd.ready` to engine client input `CL_ReadyToSendPacket`, returning its result for `state.sendState, state.sendHost`.
/// @param state Record read through `state.sendState`, `state.sendHost`.
function CL_ReadyToSendPacket(state) return send.ready(state.sendState,state.sendHost) end function
/// Adapts `mq3.client.send_cmd.writePacket` to engine client input `CL_WritePacket`, returning its result for `state.sendState, state.sendHost`.
/// @param state Record read through `state.sendState`, `state.sendHost`.
function CL_WritePacket(state) return send.writePacket(state.sendState,state.sendHost) end function
/// Calls `mq3.client.cl_input.CL_CreateNewCommands`, `mq3.client.cl_input.CL_ReadyToSendPacket`, `mq3.client.cl_input.CL_WritePacket` from engine client input `CL_SendCmd`. The final path returns `CL_WritePacket(state)`.
/// @param state Record read through `state.sendState`, `state.sendHost`, `state.sendState.connectionState`, `state.sendState.serverRunning` and additional values.
/// @param frameTime Value used by `created=CL_CreateNewCommands(state,frameTime)`.
function CL_SendCmd(state,frameTime)
  if state==void or state.sendState==void or state.sendHost==void then return error(7740,"cl_input: missing send services") end if
  if state.sendState.connectionState<send.CA_CONNECTED then return "disconnected" end if
  if state.sendState.serverRunning and state.sendState.serverPaused and state.sendState.clientPaused then return "paused" end if
  created=CL_CreateNewCommands(state,frameTime);if created is error then return created end if
  if not CL_ReadyToSendPacket(state) then return "choked" end if
  return CL_WritePacket(state)
end function

/// Calls `mq3.qcommon.command_buffer.argv`, `mq3.qcommon.command_buffer.sameInsensitive`, `mq3.client.cl_input.IN_CenterView` and additional helpers from engine client input `dispatchInputCommand`. The final path returns `IN_KeyUp(state,target,key,time)`.
/// @param commandState commandState record passed to the engine client input helper calls.
/// @param state Record read through `state.inputState.up`, `state.inputState.down`, `state.inputState.left`, `state.inputState.right` and additional values.
function dispatchInputCommand(commandState,state)
  name=command.argv(commandState,0);down=len(bytes(name))>0 and bytes(name)[0]==43
  if command.sameInsensitive(name,"centerview") then return IN_CenterView(state) end if
  key=parseArg(commandState,1,-1);time=parseArg(commandState,2,0);if not down and command.argc(commandState)<=1 then key=0 end if
  if command.sameInsensitive(name,"+mlook") then return IN_MLookDown(state,key,time) end if;if command.sameInsensitive(name,"-mlook") then return IN_MLookUp(state,key,time) end if
  target=void
  if command.sameInsensitive(name,"+moveup") or command.sameInsensitive(name,"-moveup") then target=state.inputState.up end if;if command.sameInsensitive(name,"+movedown") or command.sameInsensitive(name,"-movedown") then target=state.inputState.down end if
  if command.sameInsensitive(name,"+left") or command.sameInsensitive(name,"-left") then target=state.inputState.left end if;if command.sameInsensitive(name,"+right") or command.sameInsensitive(name,"-right") then target=state.inputState.right end if
  if command.sameInsensitive(name,"+forward") or command.sameInsensitive(name,"-forward") then target=state.inputState.forward end if;if command.sameInsensitive(name,"+back") or command.sameInsensitive(name,"-back") then target=state.inputState.back end if
  if command.sameInsensitive(name,"+lookup") or command.sameInsensitive(name,"-lookup") then target=state.inputState.lookup end if;if command.sameInsensitive(name,"+lookdown") or command.sameInsensitive(name,"-lookdown") then target=state.inputState.lookdown end if
  if command.sameInsensitive(name,"+strafe") or command.sameInsensitive(name,"-strafe") then target=state.inputState.strafe end if;if command.sameInsensitive(name,"+moveleft") or command.sameInsensitive(name,"-moveleft") then target=state.inputState.moveleft end if
  if command.sameInsensitive(name,"+moveright") or command.sameInsensitive(name,"-moveright") then target=state.inputState.moveright end if;if command.sameInsensitive(name,"+speed") or command.sameInsensitive(name,"-speed") then target=state.inputState.speed end if
  if command.sameInsensitive(name,"+attack") or command.sameInsensitive(name,"-attack") or command.sameInsensitive(name,"+button0") or command.sameInsensitive(name,"-button0") then target=state.inputState.buttons[0] end if
  for index=1 to 14 if command.sameInsensitive(name,"+button"+str(index)) or command.sameInsensitive(name,"-button"+str(index)) then target=state.inputState.buttons[index] end if end for
  if target==void then return false end if;if down then return IN_KeyDown(state,target,key,time) end if;return IN_KeyUp(state,target,key,time)
end function
/// Evaluates engine client input `inputCommandNames` and returns `names+["+mlook","-mlook"]` according to its guard/selection conditions.
function inputCommandNames()
  names=["centerview","+moveup","-moveup","+movedown","-movedown","+left","-left","+right","-right","+forward","-forward","+back","-back","+lookup","-lookup","+lookdown","-lookdown","+strafe","-strafe","+moveleft","-moveleft","+moveright","-moveright","+speed","-speed","+attack","-attack","+button0","-button0"]
  for index=1 to 14 names=names+["+button"+str(index),"-button"+str(index)] end for
  return names+["+mlook","-mlook"]
end function
/// Updates `state.initialized` during engine client input `CL_InitInput`.
/// @param state Mutable engine client input record/storage; this routine assigns `state.initialized`.
function CL_InitInput(state)
  if state==void or state.commandState==void then return error(7740,"cl_input: missing command state") end if
  if state.initialized then return true end if
  for each name in inputCommandNames() if not command.addContextCommand(state.commandState,name,dispatchInputCommand,state) then return error(7740,"cl_input command already registered: "+name) end if end for
  state.initialized=true;return true
end function

/// Converts a NUL-terminated decimal C string to a signed 32-bit integer using the Windows C runtime. This binding is used by engine client input.
/// @param text NUL-terminated C string containing the decimal numeric text.
/// @returns The converted integer; a string with no initial numeric conversion yields zero.
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
