// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
package mq3.game.shooters
import mq3.game.entities as game
import mq3.game.constants as c
import mq3.game.movement as movement
import mq3.game.missiles as missiles
import mq3.game.events as events
import mq3.game.items as itemRules
import mq3.shared.math as q
import mq3.shared.directions as directions
import mq3.compat.numeric as n
/// Forward `registerItem` to `mq3.game.items.register` and return the delegated result.
/// @param level Game-level state; accesses `itemRegistered`. May update `level.itemRegistered[item]` in place.
/// @param index Index of the entry to access.
function registerItem(level,index)
  return itemRules.register(level,index)
end function
/// Apply `mq3.game.constants.itemTag` while evaluating `weaponItem`.
/// @param weapon Weapon identifier used by the action or inventory lookup.
function weaponItem(weapon)
  // All IT_WEAPON entries in the pinned baseq3 table, in original order.
  for index = 8 to 17
    if c.itemTag(index) == weapon then return index end if
  end for
  return error(492,"Could not find item for weapon")
end function
/// Update `ent.enemy`, `ent.think` and `ent.nextthink` during `finish`.
/// @param level Game-level state; accesses `gamePrintFn`, `num_entities` and `entities`.
/// @param ent Game entity; accesses `enemy`, `target`, `think` and `nextthink`. May update `ent.enemy`, `ent.think` and `ent.nextthink` in place.
function finish(level,ent)
  ent.enemy = game.pickTarget(level,ent.target); ent.think = void; ent.nextthink = 0
  return void
end function
/// Apply `mq3.game.movement.copy`, `mq3.shared.directions.perpendicular` and `mq3.game.entities.random` while evaluating `use`. Return paths include `events.add(level,ent,c.EV_FIRE_WEAPON,0)`.
/// @param level Game-level state; accesses `randSeed`. May update `level.randSeed` in place.
/// @param ent Game entity; accesses `enemy`, `s`, `movedir` and `random`.
/// @param other Not read by this implementation; retained in the `use` signature.
/// @param activator Not read by this implementation; retained in the `use` signature.
function use(level,ent,other,activator)
  dir = [0.0,0.0,0.0]
  if ent.enemy != void then
    dir = [n.fsub(ent.enemy.r.currentOrigin[0],ent.s.origin[0]),n.fsub(ent.enemy.r.currentOrigin[1],ent.s.origin[1]),n.fsub(ent.enemy.r.currentOrigin[2],ent.s.origin[2])]
    q.VectorNormalize(dir)
  else
    dir = movement.copy(ent.movedir)
  end if
  up = directions.perpendicular(dir); right = q.CrossProduct(up,dir)
  deg = n.f32(2.0*(n.fdiv(game.random(level),32767)-0.5)*ent.random); dir = q.VectorMA(dir,deg,up)
  deg = n.f32(2.0*(n.fdiv(game.random(level),32767)-0.5)*ent.random); dir = q.VectorMA(dir,deg,right)
  q.VectorNormalize(dir)
  if ent.s.weapon == 4 or ent.s.weapon == 5 or ent.s.weapon == 8 then missiles.fire(level,ent,ent.s.origin,dir,ent.s.weapon) end if
  return events.add(level,ent,c.EV_FIRE_WEAPON,0)
end function
