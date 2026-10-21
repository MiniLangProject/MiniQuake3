// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Client-owned values written by CG_SETUSERCMDVALUE and consumed by CL input.
package mq3.client.cgame_usercmd

struct State weapon sensitivity end struct

function create() return State(0,1.0) end function

// CL_SetUserCmdValue stores both values verbatim.  The weapon is truncated only
// when usercmd_t is serialized; mouse sensitivity remains binary32.
function set(state,weapon,sensitivity)
  if state==void then return error(7696,"cgame usercmd: missing state") end if
  state.weapon=weapon;state.sensitivity=sensitivity;return void
end function

function weapon(state) if state==void then return 0 end if;return state.weapon end function
function sensitivity(state) if state==void then return 1.0 end if;return state.sensitivity end function
function scaleMouse(state,value) return value*sensitivity(state) end function
