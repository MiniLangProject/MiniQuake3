// SPDX-License-Identifier: GPL-2.0-or-later
// Frame-stable Win32 key edges for the polling interface used by ui.qvm.
package mq3.client.ui_input_latch

const INPUT_KEY=1

/// Stores UI input latch state, including `down`, `pulse`.
struct State down pulse end struct

/// Calls `mq3.client.ui_input_latch.State` from UI input latch `create`. The final path returns `State(array(keyCount,false),array(keyCount,false))`.
/// @param keyCount Value used by `if typeof(keyCount)!="int" or keyCount<1 then return error(7703,"UI input latch: invalid key capacity") end if`.
function create(keyCount)
  if typeof(keyCount)!="int" or keyCount<1 then return error(7703,"UI input latch: invalid key capacity") end if
  return State(array(keyCount,false),array(keyCount,false))
end function

/// Updates `state.pulse[index]` during UI input latch `beginFrame`.
/// @param state Mutable UI input latch record/storage; this routine assigns `state.pulse[index]`.
function beginFrame(state)
  if state==void then return error(7703,"UI input latch: state is required") end if
  for index=0 to len(state.pulse)-1 state.pulse[index]=false end for
  return void
end function

/// Updates `state.down[key]`, `state.pulse[key]` during UI input latch `observe`.
/// @param state Mutable UI input latch record/storage; this routine assigns `state.down[key]`, `state.pulse[key]`.
/// @param type Value used by `if type!=INPUT_KEY or key<0 or key>=len(state.down) then return false end if`.
/// @param key Key or control identifier used to select the corresponding UI input latch entry.
/// @param value Value used by `down=value!=0`.
function observe(state,type,key,value)
  if state==void then return error(7703,"UI input latch: state is required") end if
  if type!=INPUT_KEY or key<0 or key>=len(state.down) then return false end if
  down=value!=0;state.down[key]=down;if down then state.pulse[key]=true end if
  return true
end function

/// Tests the held or one-frame pulse state for a valid key; invalid keys return false.
/// @param state Record read through `state.down`, `state.pulse`.
/// @param key Key or control identifier used to select the corresponding UI input latch entry.
function keyDown(state,key)
  if state==void or key<0 or key>=len(state.down) then return false end if
  return state.down[key] or state.pulse[key]
end function
