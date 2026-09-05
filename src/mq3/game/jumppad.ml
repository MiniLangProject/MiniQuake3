// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// BG_TouchJumpPad. Trigger discovery/dispatch belongs to the game server.
package mq3.game.jumppad
import mq3.game.constants as c
import mq3.game.movement as movement
import mq3.shared.math as q
import mq3.compat.numeric as n
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
