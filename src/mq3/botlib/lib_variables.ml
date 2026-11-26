// SPDX-License-Identifier: GPL-2.0-or-later
// Managed MiniLang port of botlib/l_libvar.c.
package mq3.botlib.lib_variables

import mq3.compat.numeric as n

/// `Variable` record for lib variables, containing `name`, `value`, `numericValue` and `modified`.
struct Variable name value numericValue modified end struct

/// Parse the released botlib unsigned decimal-number syntax, returning zero for invalid text.
/// @param text Text to parse, format or deliver.
function stringValue(text)
  if text==void then return 0.0 end if
  data=bytes(text);value=0.0;divisor=0
  if len(data)==0 then return value end if
  for index=0 to len(data)-1
    character=data[index]
    if character==46 then
      if divisor!=0 then return 0.0 end if
      divisor=10
    else
      if character<48 or character>57 then return 0.0 end if
      digit=character-48
      if divisor!=0 then value=n.f32(value+n.f32(digit/divisor));divisor=divisor*10
      else value=n.f32(value*10.0+digit) end if
    end if
  end for
  return value
end function

/// Find a library variable by an ASCII case-insensitive name, returning -1 when absent.
/// @param state Lib variables state; accesses `variables`.
/// @param name Name used to identify the requested entry.
function indexOf(state,name)
  if state==void or name==void or len(state.variables)==0 then return -1 end if
  for index=0 to len(state.variables)-1 if stringEqualsIgnoreCaseAscii(state.variables[index].name,name) then return index end if end for
  return -1
end function

/// Apply `mq3.botlib.lib_variables.indexOf` while evaluating `get`. Return paths include `state.variables[index]`.
/// @param state Lib variables state; accesses `variables`.
/// @param name Name used to identify the requested entry.
function get(state,name) index=indexOf(state,name);if index<0 then return void end if;return state.variables[index] end function
/// Apply `mq3.botlib.lib_variables.get` while evaluating `getString`. Return paths include `variable.value`.
/// @param state Lib variables state; accesses `variables`.
/// @param name Name used to identify the requested entry.
function getString(state,name) variable=get(state,name);if variable==void then return "" end if;return variable.value end function
/// Apply `mq3.botlib.lib_variables.get` while evaluating `getValue`. Return paths include `variable.numericValue`.
/// @param state Lib variables state; accesses `variables`.
/// @param name Name used to identify the requested entry.
function getValue(state,name) variable=get(state,name);if variable==void then return 0.0 end if;return variable.numericValue end function

/// Set `state.variables` to `[variable]+state.variables` in `mq3.botlib.lib_variables.alloc`. Return paths include `variable`.
/// @param state Lib variables state; accesses `variables`. May update `state.variables` in place.
/// @param name Name used to identify the requested entry.
function alloc(state,name) variable=Variable(name,"",0.0,false);state.variables=[variable]+state.variables;return variable end function
/// Apply `mq3.botlib.lib_variables.get`, `mq3.botlib.lib_variables.alloc` and `mq3.botlib.lib_variables.stringValue` while evaluating `set`. Return paths include `variable`.
/// @param state Lib variables state; accesses `variables`.
/// @param name Name used to identify the requested entry.
/// @param text Text to parse, format or deliver.
function set(state,name,text)
  if state==void or name==void or text==void then return void end if
  variable=get(state,name);if variable==void then variable=alloc(state,name) end if
  variable.value=text;variable.numericValue=stringValue(text);variable.modified=true;return variable
end function
/// Apply `mq3.botlib.lib_variables.get` and `mq3.botlib.lib_variables.set` while evaluating `variable`. Return paths include `set(state,name,defaultValue)`.
/// @param state Lib variables state; accesses `variables`.
/// @param name Name used to identify the requested entry.
/// @param defaultValue Text to parse, format or deliver.
function variable(state,name,defaultValue) current=get(state,name);if current!=void then return current end if;return set(state,name,defaultValue) end function
/// Return `variable(state,name,defaultValue).value` for `variableString`.
/// @param state Lib variables state; accesses `variables`.
/// @param name Name used to identify the requested entry.
/// @param defaultValue Text to parse, format or deliver.
function variableString(state,name,defaultValue) return variable(state,name,defaultValue).value end function
/// Return `variable(state,name,defaultValue).numericValue` for `variableValue`.
/// @param state Lib variables state; accesses `variables`.
/// @param name Name used to identify the requested entry.
/// @param defaultValue Text to parse, format or deliver.
function variableValue(state,name,defaultValue) return variable(state,name,defaultValue).numericValue end function
/// Apply `mq3.botlib.lib_variables.get` while evaluating `changed`. Return paths include `current!=void and current.modified`.
/// @param state Lib variables state; accesses `variables`.
/// @param name Name used to identify the requested entry.
function changed(state,name) current=get(state,name);return current!=void and current.modified end function
/// Apply `mq3.botlib.lib_variables.get` while evaluating `setNotModified`.
/// @param state Lib variables state; accesses `variables`.
/// @param name Name used to identify the requested entry.
function setNotModified(state,name) current=get(state,name);if current!=void then current.modified=false end if;return void end function

/// Set `state.variables` to `kept` in `mq3.botlib.lib_variables.deAlloc`.
/// @param state Lib variables state; accesses `variables`. May update `state.variables` in place.
/// @param variable Variable record; accesses `name`.
function deAlloc(state,variable)
  if state==void or variable==void or len(state.variables)==0 then return void end if
  kept=[];for each current in state.variables if not stringEqualsIgnoreCaseAscii(current.name,variable.name) then kept=kept+[current] end if end for
  state.variables=kept;return void
end function
/// Set `state.variables` to `[]` in `mq3.botlib.lib_variables.deAllocAll`.
/// @param state Lib variables state; accesses `variables`. May update `state.variables` in place.
function deAllocAll(state) if state!=void then state.variables=[] end if;return void end function
