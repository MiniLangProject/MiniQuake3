// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 cl_keys.c bind/unbind command family and Key_WriteBindings text.
package mq3.client.key_bindings_config

import mq3.qcommon.command_buffer as command
import mq3.vm.cgame_key_traps as keys

struct State keys printFn printContext end struct
function create(keyState) return State(keyState,void,void) end function
function emit(state,text) if state.printFn!=void then state.printFn(state.printContext,text) end if;return void end function
function bindingText(state)
  output="unbindall\n"
  for key=0 to 255 value=keys.getBinding(state.keys,key);if value!=void and value!="" then output=output+"bind "+keys.keynumToString(key)+" \""+value+"\"\n" end if end for
  return output
end function
function bindCommand(commandState,state)
  count=command.argc(commandState);if count<2 then emit(state,"bind <key> [command] : attach a command to a key\n");return false end if
  name=command.argv(commandState,1);key=keys.stringToKeynum(name);if key==-1 then emit(state,"\""+name+"\" isn't a valid key\n");return false end if
  if count==2 then value=keys.getBinding(state.keys,key);if value!=void and value!="" then emit(state,"\""+name+"\" = \""+value+"\"\n") else emit(state,"\""+name+"\" is not bound\n") end if;return true end if
  keys.setBinding(state.keys,key,command.argsFrom(commandState,2));return true
end function
function unbindCommand(commandState,state)
  if command.argc(commandState)!=2 then emit(state,"unbind <key> : remove commands from a key\n");return false end if
  name=command.argv(commandState,1);key=keys.stringToKeynum(name);if key==-1 then emit(state,"\""+name+"\" isn't a valid key\n");return false end if
  keys.setBinding(state.keys,key,"");return true
end function
function unbindAllCommand(commandState,state) for key=0 to 255 value=keys.getBinding(state.keys,key);if value!=void and value!="" then keys.setBinding(state.keys,key,"") end if end for;return true end function
function bindListCommand(commandState,state) for key=0 to 255 value=keys.getBinding(state.keys,key);if value!=void and value!="" then emit(state,keys.keynumToString(key)+" \""+value+"\"\n") end if end for;return true end function
function install(state,commandState)
  if state==void or state.keys==void or commandState==void then return error(7738,"binding config requires key and command state") end if
  if not command.addContextCommand(commandState,"bind",bindCommand,state) then return error(7738,"bind command already registered") end if
  if not command.addContextCommand(commandState,"unbind",unbindCommand,state) then return error(7738,"unbind command already registered") end if
  if not command.addContextCommand(commandState,"unbindall",unbindAllCommand,state) then return error(7738,"unbindall command already registered") end if
  if not command.addContextCommand(commandState,"bindlist",bindListCommand,state) then return error(7738,"bindlist command already registered") end if
  return true
end function
function loadText(state,commandState,text)
  if state==void or commandState==void or typeof(text)!="string" then return error(7738,"binding config text is required") end if
  command.insertText(commandState,text);command.execute(commandState);return true
end function
