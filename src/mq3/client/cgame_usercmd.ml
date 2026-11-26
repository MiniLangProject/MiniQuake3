// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Client-owned values written by CG_SETUSERCMDVALUE and consumed by CL input.
package mq3.client.cgame_usercmd

/// Stores client game usercmd state, including `weapon`, `sensitivity`.
struct State weapon sensitivity end struct

/// Creates a `mq3.client.cgame_usercmd.State` record. Initializes the record with the defaults written in this constructor.
function create() return State(0,1.0) end function

// CL_SetUserCmdValue stores both values verbatim.  The weapon is truncated only
// when usercmd_t is serialized; mouse sensitivity remains binary32.
/// @param state Mutable client game usercmd record/storage; this routine assigns `state.weapon`, `state.sensitivity`.
/// @param weapon Value assigned to `state.weapon`.
/// @param sensitivity Value assigned to `state.sensitivity`.
function set(state,weapon,sensitivity)
  if state==void then return error(7696,"cgame usercmd: missing state") end if
  state.weapon=weapon;state.sensitivity=sensitivity;return void
end function

/// Evaluates client game usercmd `weapon` and returns `0`, `state.weapon` according to its guard/selection conditions.
/// @param state Record read through `state.weapon`.
function weapon(state) if state==void then return 0 end if;return state.weapon end function
/// Evaluates client game usercmd `sensitivity` and returns `1.0`, `state.sensitivity` according to its guard/selection conditions.
/// @param state Record read through `state.sensitivity`.
function sensitivity(state) if state==void then return 1.0 end if;return state.sensitivity end function
/// Computes `value*sensitivity(state)` for client game usercmd `scaleMouse`.
/// @param state Shared client game usercmd state passed to the helper calls in `scaleMouse`.
/// @param value Value used by `return value*sensitivity(state)`.
function scaleMouse(state,value) return value*sensitivity(state) end function
