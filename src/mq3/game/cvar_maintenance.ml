// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 CheckCvars. G_UpdateCvars supplies the password value and counter.
package mq3.game.cvar_maintenance
import mq3.compat.numeric as n
import std.string as strings
/// `State` record for cvar maintenance, containing `password`, `passwordModificationCount` and `lastPasswordModificationCount`.
struct State
  /// Current server password used by connection checks.
  password
  /// Revision counter of the password console variable.
  passwordModificationCount
  /// Password revision already propagated to the dependent setting.
  lastPasswordModificationCount
end struct
/// Create a `mq3.game.cvar_maintenance.State` record, initializing `lastPasswordModificationCount` as `-1`.
function create()
  // This state has game-module lifetime. Reuse it across level resets within
  // the same module; create a fresh instance when loading a new game module.
  return State("",0,-1)
end function
/// Use `level.cvarSetFn` to perform `check`.
/// @param level Game-level state; accesses `cvarMaintenance` and `cvarSetFn`.
function check(level)
  state = level.cvarMaintenance
  if state == void then return error(490,"CheckCvars requires game-module Cvar state") end if
  count = n.i32(state.passwordModificationCount)
  if count == state.lastPasswordModificationCount then return void end if
  data = bytes(state.password)
  if len(data) > 255 then return error(490,"Password exceeds native vmCvar storage") end if
  for each part in data
    if part == 0 then return error(490,"Password contains embedded NUL") end if
  end for
  if level.cvarSetFn == void then return error(490,"CheckCvars requires Cvar delivery") end if
  state.lastPasswordModificationCount = count; value = "0"
  if len(data) != 0 and not strings.equalsIgnoreCaseAscii(state.password,"none") then value = "1" end if
  level.cvarSetFn(level,"g_needpass",value); return void
end function
