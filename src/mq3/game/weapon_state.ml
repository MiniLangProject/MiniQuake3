// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// The file-static g_weapon.c firing state persists across weapon helper calls.
package mq3.game.weapon_state

struct State
  quadFactor
  forward
  right
  up
  muzzle
end struct

function get(level)
  if level.weaponState == void then
    level.weaponState = State(0.0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0])
  end if
  return level.weaponState
end function
