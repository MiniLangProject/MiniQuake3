// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
package mq3.game.events
import mq3.game.entities as game
import mq3.game.constants as c
function add(level,ent,event,parm)
  if event == 0 then return void end if
  if ent.client != void then
    ps = ent.client.ps; bits = ((ps.externalEvent & 0x300)+0x100) & 0x300
    ps.externalEvent = event | bits; ps.externalEventParm = parm; ps.externalEventTime = level.time
  else
    bits = ((ent.s.event & 0x300)+0x100) & 0x300; ent.s.event = event | bits; ent.s.eventParm = parm
  end if
  ent.eventTime = level.time
  return void
end function
function sound(level,ent,channel,index)
  temp = game.tempEntity(level,ent.r.currentOrigin,c.EV_GENERAL_SOUND); temp.s.eventParm = index
  return void
end function
