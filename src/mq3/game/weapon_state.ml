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
  kamikazeTime
  kamikazeShockTime
  kamikazeGeneration
  kamikazeShockGeneration
end struct

function get(level)
  if level.weaponState == void then
    // Team Arena stores these two cooldowns on gentity_t.  Keeping the
    // per-entity values beside g_weapon.c's other file-static state avoids
    // widening the shared Baseq3 entity ABI while preserving slot identity.
    level.weaponState = State(0.0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],array(1024,0),array(1024,0),array(1024,0),array(1024,0))
  end if
  return level.weaponState
end function
