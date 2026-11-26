// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// BG_TouchJumpPad. Trigger discovery/dispatch belongs to the game server.
package mq3.game.jumppad
import mq3.game.constants as c
import mq3.game.movement as movement
import mq3.shared.math as q
import mq3.compat.numeric as n
/// Update `ps.events[slot]`, `ps.eventParms[slot]`, `ps.eventSequence` and `ps.jumppad_ent` and related state during `touch`.
/// @param ps Player movement state; accesses `pm_type`, `powerups`, `jumppad_ent`, `eventSequence` and `events` and related fields. May update `ps.events[slot]`, `ps.eventParms[slot]` and `ps.eventSequence` and additional fields in place.
/// @param number Value used by `touch` in `if ps.jumppad_ent != number then`.
/// @param origin2 Three-component array; components 0, 1 and 2 are used in their stored order.
function touch(ps,number,origin2)
  if ps.pm_type != c.PM_NORMAL or ps.powerups[c.PW_FLIGHT] != 0 then return void end if
  if ps.jumppad_ent != number then
    angles = q.vectoangles(origin2); pitch = q.Q_fabs(q.AngleNormalize180(angles[0])); effect = 1
    if pitch < 45 then effect = 0 end if
    slot = ps.eventSequence & 1; ps.events[slot] = c.EV_JUMP_PAD; ps.eventParms[slot] = effect
    ps.eventSequence = n.add32(ps.eventSequence,1)
  end if
  ps.jumppad_ent = number; ps.jumppad_frame = ps.pmove_framecount
  ps.velocity = movement.copy(origin2)
  return void
end function
