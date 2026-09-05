// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// The allocated-entity loop of G_RunFrame. Full frame orchestration is pending.
package mq3.game.frame
import mq3.game.entities as game
import mq3.game.spawn_functions as funcs
import mq3.game.constants as c
import mq3.game.missiles as missiles
import mq3.compat.numeric as n
function runEntities(level)
  i = 0
  while i < level.num_entities
    ent = level.entities[i]; slot = i; i = i+1
    if not ent.inuse then continue end if
    if n.i32(level.time-ent.eventTime) > 300 then
      if ent.s.event != 0 then
        ent.s.event = 0
        if ent.client != void then ent.client.ps.externalEvent = 0 end if
      end if
      if ent.freeAfterEvent then game.free(level,ent); continue
      else if ent.unlinkAfterEvent then ent.unlinkAfterEvent = false; game.unlink(level,ent) end if
    end if
    if ent.freeAfterEvent then continue end if
    if not ent.r.linked and ent.neverFree then continue end if
    kind = 0
    if ent.s.eType == c.ET_MISSILE then kind = 1
    else if ent.s.eType == c.ET_ITEM or ent.physicsObject then kind = 2
    else if ent.s.eType == c.ET_MOVER then kind = 3
    else if slot < 64 then kind = 4 end if
    if kind != 0 then
      if kind == 1 and level.runEntityFn == void then missiles.run(level,ent)
      else
        if level.runEntityFn == void then return error(488,"Entity frame requires unported item/mover/client handler") end if
        level.runEntityFn(level,kind,ent)
      end if
    else
      funcs.runThink(level,ent)
    end if
  end while
  return void
end function
