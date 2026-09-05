// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
package mq3.game.hazards
import mq3.game.entities as game
import mq3.game.events as events
import mq3.game.combat as combat
import mq3.game.constants as c
import mq3.compat.numeric as n
function hurtUse(level,self,other,activator)
  if self.r.linked then game.unlink(level,self) else game.link(level,self) end if
  return void
end function
function hurtTouch(level,self,other,trace)
  if not other.takedamage or self.timestamp > level.time then return void end if
  if (self.spawnflags & 16) != 0 then self.timestamp = n.add32(level.time,1000) else self.timestamp = n.add32(level.time,100) end if
  if (self.spawnflags & 4) == 0 then events.sound(level,other,0,self.noise_index) end if
  dflags = 0
  if (self.spawnflags & 8) != 0 then dflags = combat.DAMAGE_NO_PROTECTION end if
  combat.damage(level,other,self,self,void,void,self.damage,dflags,c.MOD_TRIGGER_HURT)
  return void
end function
function killUse(level,self,other,activator)
  return combat.damage(level,activator,void,void,void,void,100000,combat.DAMAGE_NO_PROTECTION,c.MOD_TELEFRAG)
end function
