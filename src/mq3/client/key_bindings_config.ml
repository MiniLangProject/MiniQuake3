// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 cl_keys.c bind/unbind command family and Key_WriteBindings text.
package mq3.client.key_bindings_config

import mq3.qcommon.command_buffer as command
import mq3.vm.cgame_key_traps as keys

/// Stores key bindings config state, including `keys`, `printFn`, `printContext`.
struct State keys printFn printContext end struct
/// Creates a `mq3.client.key_bindings_config.State` record. Assigns `keys` from `keyState`.
/// @param keyState Value used to initialize `State.keys`.
function create(keyState) return State(keyState,void,void) end function
/// Calls `state.printFn` from key bindings config `emit`.
/// @param state Record read through `state.printFn`, `state.printContext`.
/// @param text Text consumed or emitted by `emit` in the key bindings config path.
function emit(state,text) if state.printFn!=void then state.printFn(state.printContext,text) end if;return void end function
/// Calls `mq3.vm.cgame_key_traps.getBinding`, `mq3.vm.cgame_key_traps.keynumToString` from key bindings config `bindingText`. The final path returns `output`.
/// @param state Record read through `state.keys`.
function bindingText(state)
  output="unbindall\n"
  for key=0 to 255 value=keys.getBinding(state.keys,key);if value!=void and value!="" then output=output+"bind "+keys.keynumToString(key)+" \""+value+"\"\n" end if end for
  return output
end function
/// Calls `mq3.qcommon.command_buffer.argc`, `mq3.client.key_bindings_config.emit`, `mq3.qcommon.command_buffer.argv` and additional helpers from key bindings config `bindCommand`.
/// @param commandState commandState record passed to the key bindings config helper calls.
/// @param state Record read through `state.keys`.
function bindCommand(commandState,state)
  count=command.argc(commandState);if count<2 then emit(state,"bind <key> [command] : attach a command to a key\n");return false end if
  name=command.argv(commandState,1);key=keys.stringToKeynum(name);if key==-1 then emit(state,"\""+name+"\" isn't a valid key\n");return false end if
  if count==2 then value=keys.getBinding(state.keys,key);if value!=void and value!="" then emit(state,"\""+name+"\" = \""+value+"\"\n") else emit(state,"\""+name+"\" is not bound\n") end if;return true end if
  keys.setBinding(state.keys,key,command.argsFrom(commandState,2));return true
end function
/// Calls `mq3.qcommon.command_buffer.argc`, `mq3.client.key_bindings_config.emit`, `mq3.qcommon.command_buffer.argv` and additional helpers from key bindings config `unbindCommand`.
/// @param commandState commandState record passed to the key bindings config helper calls.
/// @param state Record read through `state.keys`.
function unbindCommand(commandState,state)
  if command.argc(commandState)!=2 then emit(state,"unbind <key> : remove commands from a key\n");return false end if
  name=command.argv(commandState,1);key=keys.stringToKeynum(name);if key==-1 then emit(state,"\""+name+"\" isn't a valid key\n");return false end if
  keys.setBinding(state.keys,key,"");return true
end function
/// Calls `mq3.vm.cgame_key_traps.getBinding`, `mq3.vm.cgame_key_traps.setBinding` from key bindings config `unbindAllCommand`.
/// @param commandState Accepted for compatibility with `unbindAllCommand`; the current implementation does not read it.
/// @param state Record read through `state.keys`.
function unbindAllCommand(commandState,state) for key=0 to 255 value=keys.getBinding(state.keys,key);if value!=void and value!="" then keys.setBinding(state.keys,key,"") end if end for;return true end function
/// Calls `mq3.vm.cgame_key_traps.getBinding`, `mq3.client.key_bindings_config.emit`, `mq3.vm.cgame_key_traps.keynumToString` from key bindings config `bindListCommand`.
/// @param commandState Accepted for compatibility with `bindListCommand`; the current implementation does not read it.
/// @param state Record read through `state.keys`.
function bindListCommand(commandState,state) for key=0 to 255 value=keys.getBinding(state.keys,key);if value!=void and value!="" then emit(state,keys.keynumToString(key)+" \""+value+"\"\n") end if end for;return true end function
/// Calls `mq3.qcommon.command_buffer.addContextCommand` from key bindings config `install`.
/// @param state Record read through `state.keys`.
/// @param commandState commandState record passed to the key bindings config helper calls.
function install(state,commandState)
  if state==void or state.keys==void or commandState==void then return error(7738,"binding config requires key and command state") end if
  if not command.addContextCommand(commandState,"bind",bindCommand,state) then return error(7738,"bind command already registered") end if
  if not command.addContextCommand(commandState,"unbind",unbindCommand,state) then return error(7738,"unbind command already registered") end if
  if not command.addContextCommand(commandState,"unbindall",unbindAllCommand,state) then return error(7738,"unbindall command already registered") end if
  if not command.addContextCommand(commandState,"bindlist",bindListCommand,state) then return error(7738,"bindlist command already registered") end if
  return true
end function
/// Calls `mq3.qcommon.command_buffer.insertText`, `mq3.qcommon.command_buffer.execute` from key bindings config `loadText`.
/// @param state Shared key bindings config state passed to the helper calls in `loadText`.
/// @param commandState commandState record passed to the key bindings config helper calls.
/// @param text Text consumed or emitted by `loadText` in the key bindings config path.
function loadText(state,commandState,text)
  if state==void or commandState==void or typeof(text)!="string" then return error(7738,"binding config text is required") end if
  command.insertText(commandState,text);command.execute(commandState);return true
end function
