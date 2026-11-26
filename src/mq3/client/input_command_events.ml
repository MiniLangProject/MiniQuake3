// SPDX-License-Identifier: GPL-2.0-or-later
// Timestamped native-event adapter for the Baseq3 client input command core.
package mq3.client.input_command_events

import mq3.client.input_command as inputCommandCore
import mq3.client.key_binding_dispatch as eventBindingDispatch

/// Platform input-event tag selecting a key press or release.
const INPUT_KEY=1
/// Platform input-event tag selecting relative mouse motion.
const INPUT_MOUSE=3
/// Windows virtual-key code for the lbutton input before translation to engine key codes.
const VK_LBUTTON=1
/// Windows virtual-key code for the rbutton input before translation to engine key codes.
const VK_RBUTTON=2
/// Windows virtual-key code for the mbutton input before translation to engine key codes.
const VK_MBUTTON=4
/// Windows virtual-key code for the xbutton1 input before translation to engine key codes.
const VK_XBUTTON1=5
/// Windows virtual-key code for the xbutton2 input before translation to engine key codes.
const VK_XBUTTON2=6
/// Windows virtual-key code for the space input before translation to engine key codes.
const VK_SPACE=32
/// Windows virtual-key code for the a input before translation to engine key codes.
const VK_A=65
/// Windows virtual-key code for the d input before translation to engine key codes.
const VK_D=68
/// Windows virtual-key code for the s input before translation to engine key codes.
const VK_S=83
/// Windows virtual-key code for the w input before translation to engine key codes.
const VK_W=87

/// Evaluates input command events `quakeKey` and returns `virtualKey+32`, `178`, `179` and additional values according to its guard/selection conditions.
/// @param virtualKey Value used by `if virtualKey>=65 and virtualKey<=90 then return virtualKey+32 end if`.
function quakeKey(virtualKey)
  if virtualKey>=65 and virtualKey<=90 then return virtualKey+32 end if
  if virtualKey==VK_LBUTTON then return 178 end if
  if virtualKey==VK_RBUTTON then return 179 end if
  if virtualKey==VK_MBUTTON then return 180 end if
  if virtualKey==VK_XBUTTON1 then return 181 end if
  if virtualKey==VK_XBUTTON2 then return 182 end if
  if virtualKey==8 then return 127 end if
  if virtualKey==20 then return 129 end if
  if virtualKey==19 then return 131 end if
  if virtualKey==38 then return 132 end if
  if virtualKey==40 then return 133 end if
  if virtualKey==37 then return 134 end if
  if virtualKey==39 then return 135 end if
  if virtualKey==18 then return 136 end if
  if virtualKey==17 then return 137 end if
  if virtualKey==16 then return 138 end if
  if virtualKey==45 then return 139 end if
  if virtualKey==46 then return 140 end if
  if virtualKey==34 then return 141 end if
  if virtualKey==33 then return 142 end if
  if virtualKey==36 then return 143 end if
  if virtualKey==35 then return 144 end if
  if virtualKey>=112 and virtualKey<=126 then return 145+virtualKey-112 end if
  return virtualKey
end function
/// Evaluates input command events `defaultBinding` and returns `"+forward"`, `"+back"`, `"+moveright"` and additional values according to its guard/selection conditions.
/// @param key Key or control identifier used to select the corresponding input command events entry.
function defaultBinding(key)
  if key==119 then return "+forward" end if;if key==115 then return "+back" end if
  if key==100 then return "+moveright" end if;if key==97 then return "+moveleft" end if
  if key==32 then return "+moveup" end if;if key==178 then return "+attack" end if;return ""
end function
/// Evaluates input command events `actionButton` and returns `void`, `state.left`, `state.right` and additional values according to its guard/selection conditions.
/// @param state Record read through `state.left`, `state.right`, `state.forward`, `state.back` and additional values.
/// @param action Value used by `if action=="left" then return state.left end if`.
function actionButton(state,action)
  if state==void then return void end if
  if action=="left" then return state.left end if;if action=="right" then return state.right end if
  if action=="forward" then return state.forward end if;if action=="back" then return state.back end if
  if action=="lookup" then return state.lookup end if;if action=="lookdown" then return state.lookdown end if
  if action=="moveleft" then return state.moveleft end if;if action=="moveright" then return state.moveright end if
  if action=="strafe" then return state.strafe end if;if action=="speed" then return state.speed end if
  if action=="moveup" then return state.up end if;if action=="movedown" then return state.down end if
  if action=="attack" then return state.buttons[0] end if
  for index=0 to 15 if action=="button"+str(index) then return state.buttons[index] end if end for
  return void
end function
/// Updates `state.mlooking` during input command events `execute`.
/// @param state Mutable input command events record/storage; this routine assigns `state.mlooking`.
/// @param command Record read through `command.button`, `command.action`, `command.down`, `command.key` and additional values.
function execute(state,command)
  if not command.button then return void end if
  if command.action=="mlook" then state.mlooking=command.down;return void end if
  target=actionButton(state,command.action);if target==void then return void end if
  if command.down then return inputCommandCore.keyDown(target,command.key,command.time) end if
  return inputCommandCore.keyUp(target,command.key,command.time,50)
end function
// Productive Sys_QueEvent records already contain Quake keynums. Do not map
// them through Win32 again: lowercase p..z overlap the VK_F1..VK_F11 range.
/// @param state Shared input command events state passed to the helper calls in `applyBoundQuake`.
/// @param time Value used by `if state==void or typeof(time)!="int" or time<0 then return error(7702,"input event bridge: invalid event") end if`.
/// @param type Value used by `if type==INPUT_MOUSE then accumulated=inputCommandCore.accumulateMouse(state,value,value2)`.
/// @param value Value used by `if type==INPUT_MOUSE then accumulated=inputCommandCore.accumulateMouse(state,value,value2)`.
/// @param value2 Value used by `if type==INPUT_MOUSE then accumulated=inputCommandCore.accumulateMouse(state,value,value2)`.
/// @param binding Command text associated with an input key.
function applyBoundQuake(state,time,type,value,value2,binding)
  if state==void or typeof(time)!="int" or time<0 then return error(7702,"input event bridge: invalid event") end if
  if type==INPUT_MOUSE then accumulated=inputCommandCore.accumulateMouse(state,value,value2);if accumulated is error then return accumulated end if;return [] end if
  if type!=INPUT_KEY then return [] end if
  expanded=eventBindingDispatch.commands(binding,value,value2!=0,time);if expanded is error then return expanded end if
  for each command in expanded applied=execute(state,command);if applied is error then return applied end if end for
  return expanded
end function
// Preserve the virtual-key input API used by offline probes and older hosts.
/// @param state Shared input command events state passed to the helper calls in `applyBound`.
/// @param time Value used by `return applyBoundQuake(state,time,type,value,value2,binding)`.
/// @param type Value used by `if type==INPUT_KEY then value=quakeKey(value) end if`.
/// @param value Value used by `if type==INPUT_KEY then value=quakeKey(value) end if`.
/// @param value2 Value used by `return applyBoundQuake(state,time,type,value,value2,binding)`.
/// @param binding Command text associated with an input key.
function applyBound(state,time,type,value,value2,binding)
  if type==INPUT_KEY then value=quakeKey(value) end if
  return applyBoundQuake(state,time,type,value,value2,binding)
end function
/// Calls `mq3.client.input_command_events.quakeKey`, `mq3.client.input_command_events.applyBound`, `mq3.client.input_command_events.defaultBinding` from input command events `apply`.
/// @param state Shared input command events state passed to the helper calls in `apply`.
/// @param time Value used by `applied=applyBound(state,time,type,value,value2,defaultBinding(key))`.
/// @param type Value used by `applied=applyBound(state,time,type,value,value2,defaultBinding(key))`.
/// @param value Value used by `key=quakeKey(value)`.
/// @param value2 Value used by `applied=applyBound(state,time,type,value,value2,defaultBinding(key))`.
function apply(state,time,type,value,value2)
  key=quakeKey(value);applied=applyBound(state,time,type,value,value2,defaultBinding(key))
  if applied is error then return applied end if
  return void
end function
/// Calls `mq3.client.input_command.keyUp` from input command events `releaseButton`.
/// @param value Record read through `value.down0`, `value.down1`.
/// @param time Value used by `if value.down0!=0 then released=inputCommandCore.keyUp(value,value.down0,time,50)`.
function releaseButton(value,time)
  if value.down0!=0 then released=inputCommandCore.keyUp(value,value.down0,time,50);if released is error then return released end if end if
  if value.down1!=0 then released=inputCommandCore.keyUp(value,value.down1,time,50);if released is error then return released end if end if
  return void
end function
/// Updates `state.mlooking` during input command events `release`.
/// @param state Mutable input command events record/storage; this routine assigns `state.mlooking`.
/// @param time Value used by `if state==void or typeof(time)!="int" or time<0 then return error(7702,"input event bridge: invalid release") end if`.
function release(state,time)
  if state==void or typeof(time)!="int" or time<0 then return error(7702,"input event bridge: invalid release") end if
  for each value in [state.left,state.right,state.forward,state.back,state.lookup,state.lookdown,state.moveleft,state.moveright,state.strafe,state.speed,state.up,state.down] released=releaseButton(value,time);if released is error then return released end if end for
  for each value in state.buttons released=releaseButton(value,time);if released is error then return released end if end for
  state.mlooking=false
  return inputCommandCore.clearMouse(state)
end function
/// Evaluates input command events `anyDown` and returns `false`, `true` according to its guard/selection conditions.
/// @param state Record read through `state.left.active`, `state.right.active`, `state.forward.active`, `state.back.active` and additional values.
function anyDown(state)
  if state==void then return false end if
  if state.left.active or state.right.active or state.forward.active or state.back.active or state.lookup.active or state.lookdown.active or state.moveleft.active or state.moveright.active or state.strafe.active or state.speed.active or state.up.active or state.down.active then return true end if
  for each value in state.buttons if value.active then return true end if end for;return false
end function
