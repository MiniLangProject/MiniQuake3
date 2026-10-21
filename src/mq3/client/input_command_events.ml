// SPDX-License-Identifier: GPL-2.0-or-later
// Timestamped native-event adapter for the Baseq3 client input command core.
package mq3.client.input_command_events

import mq3.client.input_command as inputCommandCore

const INPUT_KEY=1
const INPUT_MOUSE=3
const VK_LBUTTON=1
const VK_SPACE=32
const VK_A=65
const VK_D=68
const VK_S=83
const VK_W=87

function button(state,virtualKey)
  if state==void then return void end if
  if virtualKey==VK_W then return state.forward end if;if virtualKey==VK_S then return state.back end if
  if virtualKey==VK_D then return state.moveright end if;if virtualKey==VK_A then return state.moveleft end if
  if virtualKey==VK_SPACE then return state.up end if;if virtualKey==VK_LBUTTON then return state.buttons[0] end if;return void
end function
function apply(state,time,type,value,value2)
  if state==void or typeof(time)!="int" or time<0 then return error(7702,"input event bridge: invalid event") end if
  if type==INPUT_MOUSE then return inputCommandCore.accumulateMouse(state,value,value2) end if
  if type!=INPUT_KEY then return void end if
  target=button(state,value);if target==void then return void end if
  if value2!=0 then inputCommandCore.keyDown(target,value,time) else inputCommandCore.keyUp(target,value,time,50) end if;return void
end function
function release(state,time)
  if state==void or typeof(time)!="int" or time<0 then return error(7702,"input event bridge: invalid release") end if
  for each pair in [[state.forward,VK_W],[state.back,VK_S],[state.moveright,VK_D],[state.moveleft,VK_A],[state.up,VK_SPACE],[state.buttons[0],VK_LBUTTON]]
    if pair[0].active then inputCommandCore.keyUp(pair[0],pair[1],time,50) end if
  end for
  return inputCommandCore.clearMouse(state)
end function
function anyDown(state)
  if state==void then return false end if
  return state.forward.active or state.back.active or state.moveright.active or state.moveleft.active or state.up.active or state.buttons[0].active
end function
