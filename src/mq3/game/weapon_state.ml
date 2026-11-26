// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// The file-static g_weapon.c firing state persists across weapon helper calls.
package mq3.game.weapon_state

/// `State` record for weapon state, containing `quadFactor`, `forward`, `right`, `up` and `muzzle` and related fields.
struct State
  /// Damage multiplier applied by the active quad-damage effect.
  quadFactor
  /// Forward direction vector derived from the current view orientation.
  forward
  /// Right direction vector derived from the current view orientation.
  right
  /// Up direction vector derived from the current view orientation.
  up
  /// World-space muzzle position from which weapon traces or projectiles begin.
  muzzle
  /// Time controlling the next kamikaze damage phase.
  kamikazeTime
  /// Time controlling the next kamikaze shock-wave phase.
  kamikazeShockTime
  /// Generation marker preventing repeated damage within one kamikaze phase.
  kamikazeGeneration
  /// Generation marker preventing repeated shock application within one phase.
  kamikazeShockGeneration
end struct

/// Update `level.weaponState` during `get`. Return paths include `level.weaponState`.
/// @param level Game-level state; accesses `weaponState`. May update `level.weaponState` in place.
function get(level)
  if level.weaponState == void then
    // Team Arena stores these two cooldowns on gentity_t.  Keeping the
    // per-entity values beside g_weapon.c's other file-static state avoids
    // widening the shared Baseq3 entity ABI while preserving slot identity.
    level.weaponState = State(0.0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],array(1024,0),array(1024,0),array(1024,0),array(1024,0))
  end if
  return level.weaponState
end function
