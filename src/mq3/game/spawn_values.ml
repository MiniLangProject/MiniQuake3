// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
package mq3.game.spawn_values
import mq3.compat.textnumbers as textnum
import mq3.compat.numeric as n
import std.string as strings
/// Look up a spawn key case-insensitively and return a found flag with either its text or the supplied fallback.
/// @param state Spawn values state; accesses `vars`.
/// @param key Lookup key or field name used by the operation.
/// @param fallback Value used when the requested entry is unavailable.
function getString(state,key,fallback)
  for each pair in state.vars
    if strings.equalsIgnoreCaseAscii(pair[0],key) then return [true,pair[1]] end if
  end for
  return [false,fallback]
end function
/// Apply `mq3.game.spawn_values.getString` while evaluating `getInt`. Return paths include `[value[0],textnum.atoi(value[1])]`.
/// @param state Spawn values state; accesses `vars`.
/// @param key Lookup key or field name used by the operation.
/// @param fallback Value used when the requested entry is unavailable.
function getInt(state,key,fallback)
  value = getString(state,key,fallback); return [value[0],textnum.atoi(value[1])]
end function
/// Apply `mq3.game.spawn_values.getString` while evaluating `getFloat`. Return paths include `[value[0],n.f32(textnum.atof(value[1]))]`.
/// @param state Spawn values state; accesses `vars`.
/// @param key Lookup key or field name used by the operation.
/// @param fallback Value used when the requested entry is unavailable.
function getFloat(state,key,fallback)
  value = getString(state,key,fallback); return [value[0],n.f32(textnum.atof(value[1]))]
end function
/// Set `state.configstrings[index]` to `""` and `state.configstrings[index]` to `value` in `mq3.game.spawn_values.setConfig`.
/// @param state Spawn values state; accesses `configstrings` and `effectFn`. May update `state.configstrings[index]` in place.
/// @param index Index of the entry to access.
/// @param value Value passed as argument 5 to `state.effectFn`.
function setConfig(state,index,value)
  if index < 0 or index >= 1024 then return error(485,"Invalid configstring index") end if
  if value == void then state.configstrings[index] = "" else state.configstrings[index] = value end if
  if state.effectFn != void then state.effectFn(state,1,index,"",value) end if
  return void
end function
/// Apply `mq3.game.spawn_values.setConfig` while evaluating `configIndex`. Return paths include `index`.
/// @param state Spawn values state; accesses `configstrings`.
/// @param name Name used to identify the requested entry.
/// @param start Value used by `configIndex` in `if start < 0 or capacity < 1 or start+capacity > 1024 then return error(485,"Invalid configstring range") end if`.
/// @param capacity Maximum number of entries to allocate or retain.
/// @param create Value used by `configIndex` in `if not create then return 0 end if`.
function configIndex(state,name,start,capacity,create)
  if name == void or name == "" then return 0 end if
  if start < 0 or capacity < 1 or start+capacity > 1024 then return error(485,"Invalid configstring range") end if
  index = 1
  while index < capacity
    // trap_GetConfigstring copies at most MAX_STRING_CHARS-1 bytes.
    existing = state.configstrings[start+index]
    if len(bytes(existing)) > 1023 then existing = decode(slice(bytes(existing),0,1023)) end if
    if existing == "" then break end if
    if existing == name then return index end if
    index = index+1
  end while
  if not create then return 0 end if
  if index == capacity then return error(485,"G_FindConfigstringIndex: overflow") end if
  setConfig(state,start+index,name)
  return index
end function
/// Forward `soundIndex` to `mq3.game.spawn_values.configIndex` and return the delegated result.
/// @param state Spawn values state; accesses `configstrings`.
/// @param name Name used to identify the requested entry.
function soundIndex(state,name)
  return configIndex(state,name,288,256,true)
end function
/// Forward `modelIndex` to `mq3.game.spawn_values.configIndex` and return the delegated result.
/// @param state Spawn values state; accesses `configstrings`.
/// @param name Name used to identify the requested entry.
function modelIndex(state,name)
  return configIndex(state,name,32,256,true)
end function
