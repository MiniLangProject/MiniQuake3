// SPDX-License-Identifier: GPL-2.0-or-later
// Timestamped native-event adapter for the Baseq3 client input command core.
package mq3.client.input_command_events

import mq3.client.input_command as inputCommandCore
import mq3.client.key_binding_dispatch as eventBindingDispatch

const INPUT_KEY=1
const INPUT_MOUSE=3
const VK_LBUTTON=1
const VK_SPACE=32
const VK_A=65
const VK_D=68
const VK_S=83
const VK_W=87

function quakeKey(virtualKey)
  if virtualKey>=65 and virtualKey<=90 then return virtualKey+32 end if
  if virtualKey==VK_LBUTTON then return 178 end if
  return virtualKey
end function
function defaultBinding(key)
  if key==119 then return "+forward" end if;if key==115 then return "+back" end if
  if key==100 then return "+moveright" end if;if key==97 then return "+moveleft" end if
  if key==32 then return "+moveup" end if;if key==178 then return "+attack" end if;return ""
end function
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
function execute(state,command)
  if not command.button then return void end if
  if command.action=="mlook" then state.mlooking=command.down;return void end if
  target=actionButton(state,command.action);if target==void then return void end if
  if command.down then return inputCommandCore.keyDown(target,command.key,command.time) end if
  return inputCommandCore.keyUp(target,command.key,command.time,50)
end function
function applyBound(state,time,type,value,value2,binding)
  if state==void or typeof(time)!="int" or time<0 then return error(7702,"input event bridge: invalid event") end if
  if type==INPUT_MOUSE then accumulated=inputCommandCore.accumulateMouse(state,value,value2);if accumulated is error then return accumulated end if;return [] end if
  if type!=INPUT_KEY then return [] end if
  key=quakeKey(value);expanded=eventBindingDispatch.commands(binding,key,value2!=0,time);if expanded is error then return expanded end if
  for each command in expanded applied=execute(state,command);if applied is error then return applied end if end for
  return expanded
end function
function apply(state,time,type,value,value2)
  key=quakeKey(value);applied=applyBound(state,time,type,value,value2,defaultBinding(key))
  if applied is error then return applied end if
  return void
end function
function releaseButton(value,time)
  if value.down0!=0 then released=inputCommandCore.keyUp(value,value.down0,time,50);if released is error then return released end if end if
  if value.down1!=0 then released=inputCommandCore.keyUp(value,value.down1,time,50);if released is error then return released end if end if
  return void
end function
function release(state,time)
  if state==void or typeof(time)!="int" or time<0 then return error(7702,"input event bridge: invalid release") end if
  for each value in [state.left,state.right,state.forward,state.back,state.lookup,state.lookdown,state.moveleft,state.moveright,state.strafe,state.speed,state.up,state.down] released=releaseButton(value,time);if released is error then return released end if end for
  for each value in state.buttons released=releaseButton(value,time);if released is error then return released end if end for
  state.mlooking=false
  return inputCommandCore.clearMouse(state)
end function
function anyDown(state)
  if state==void then return false end if
  if state.left.active or state.right.active or state.forward.active or state.back.active or state.lookup.active or state.lookdown.active or state.moveleft.active or state.moveright.active or state.strafe.active or state.speed.active or state.up.active or state.down.active then return true end if
  for each value in state.buttons if value.active then return true end if end for;return false
end function
