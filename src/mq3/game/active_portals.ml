// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Team Arena portal holdable path used by g_active.c ClientEvents.  The
// original definitions live in g_misc.c, but the active-game dispatch owns
// the decision between destination and source and therefore needs a complete
// productive implementation rather than an observed callback.
package mq3.game.active_portals
import mq3.game.game_headers as headers
import mq3.game.constants as c
import mq3.game.entities as game
import mq3.game.g_items as gItems
import mq3.game.teleport as teleport
import mq3.game.combat as combat
import mq3.game.snapshot as snapshot
import mq3.game.spawn_values as values
import mq3.game.movement as movement
import mq3.compat.numeric as n

const CONTENTS_CORPSE=headers.CONTENTS_CORPSE
const CONTENTS_TRIGGER=headers.CONTENTS_TRIGGER
const DAMAGE_NO_PROTECTION = 8

/// Forward `PortalDie` to `mq3.game.entities.free` and return the delegated result.
/// @param level Game-level state; accesses `scene` and `time`. May update `level.scene.entities[ent.slot]` in place.
/// @param self Game entity; accesses `neverFree`, `r`, `slot`, `s` and `client` and related fields. May update `self.r`, `self.s` and `self.client` and additional fields in place.
/// @param inflictor Not read by this implementation; retained in the `PortalDie` signature.
/// @param attacker Not read by this implementation; retained in the `PortalDie` signature.
/// @param damage Not read by this implementation; retained in the `PortalDie` signature.
/// @param mod Not read by this implementation; retained in the `PortalDie` signature.
function PortalDie(level,self,inflictor,attacker,damage,mod)
  return game.free(level,self)
end function

/// Find the active personal-portal destination with the matching portal identifier.
/// @param level Game-level state; accesses `num_entities` and `entities`.
/// @param id Value used by `findDestination` in `if ent.inuse and ent.classname == "hi_portal destination" and ent.count == id then return ent end if`.
function findDestination(level,id)
  for index = 0 to level.num_entities-1
    ent = level.entities[index]
    if ent.inuse and ent.classname == "hi_portal destination" and ent.count == id then return ent end if
  end for
  return void
end function

/// Set `other.client.ps.powerups[powerup]` to `0` in `mq3.game.active_portals.dropCarriedFlag`.
/// @param level Game-level state; accesses `randSeed`. May update `level.randSeed` in place.
/// @param other Other record; accesses `client`. May update `other.client.ps.powerups[powerup]` in place.
function dropCarriedFlag(level,other)
  powerup = -1; item = -1
  if other.client.ps.powerups[c.PW_NEUTRALFLAG] != 0 then powerup = c.PW_NEUTRALFLAG; item = 46
  else if other.client.ps.powerups[c.PW_REDFLAG] != 0 then powerup = c.PW_REDFLAG; item = 34
  else if other.client.ps.powerups[c.PW_BLUEFLAG] != 0 then powerup = c.PW_BLUEFLAG; item = 35 end if
  if item >= 0 then gItems.Drop_Item(level,other,item,0.0); other.client.ps.powerups[powerup] = 0 end if
  return void
end function

/// Apply `mq3.game.active_portals.dropCarriedFlag`, `mq3.game.active_portals.findDestination` and `mq3.game.teleport.player` while evaluating `PortalTouch`.
/// @param level Game-level state; accesses `randSeed`. May update `level.randSeed` in place.
/// @param self Entity receiving the callback; accesses `count`, `pos1` and `s`.
/// @param other Other record; accesses `health` and `client`.
/// @param trace Not read by this implementation; retained in the `PortalTouch` signature.
function PortalTouch(level,self,other,trace)
  if other.health <= 0 or other.client == void then return void end if
  dropCarriedFlag(level,other)
  destination = findDestination(level,self.count)
  if destination == void then
    if self.pos1[0] != 0.0 or self.pos1[1] != 0.0 or self.pos1[2] != 0.0 then teleport.player(level,other,self.pos1,self.s.angles) end if
    combat.damage(level,other,other,other,void,void,100000,DAMAGE_NO_PROTECTION,c.MOD_TELEFRAG)
    return void
  end if
  teleport.player(level,other,destination.s.pos.trBase,destination.s.angles)
  return void
end function

/// Update `self.touch`, `self.think` and `self.nextthink` during `PortalEnable`.
/// @param level Game-level state; accesses `time`.
/// @param self Entity receiving the callback; accesses `touch`, `think` and `nextthink`. May update `self.touch`, `self.think` and `self.nextthink` in place.
function PortalEnable(level,self)
  self.touch = PortalTouch; self.think = game.free; self.nextthink = n.add32(level.time,120000)
  return void
end function

/// Update `level.spawner.portalSequence`, `player.client.portalID` and `player.client.ps.stats[c.STAT_HOLDABLE_ITEM]` during `DropPortalDestination`. Return paths include `ent`.
/// @param level Game-level state; accesses `spawner` and `time`. May update `level.spawner.portalSequence` in place.
/// @param player Player entity; accesses `s`, `r` and `client`. May update `player.client.portalID` and `player.client.ps.stats[c.STAT_HOLDABLE_ITEM]` in place.
function DropPortalDestination(level,player)
  if level.spawner == void then return error(498,"Portal destination requires spawn state") end if
  ent = game.spawn(level); ent.s.modelindex = values.modelIndex(level.spawner,"models/powerups/teleporter/tele_exit.md3")
  snapped = movement.copy(player.s.pos.trBase); snapshot.snapVector(snapped); game.setOrigin(ent,snapped)
  ent.r.mins = movement.copy(player.r.mins); ent.r.maxs = movement.copy(player.r.maxs)
  ent.classname = "hi_portal destination"; ent.s.pos.trType = c.TR_STATIONARY; ent.r.contents = CONTENTS_CORPSE
  ent.takedamage = true; ent.health = 200; ent.die = PortalDie; ent.s.angles = movement.copy(player.s.apos.trBase)
  ent.think = game.free; ent.nextthink = n.add32(level.time,120000); game.link(level,ent)
  level.spawner.portalSequence = n.add32(level.spawner.portalSequence,1); player.client.portalID = level.spawner.portalSequence
  ent.count = player.client.portalID; player.client.ps.stats[c.STAT_HOLDABLE_ITEM] = 37
  return ent
end function

/// Set `player.client.portalID` to `0` in `mq3.game.active_portals.DropPortalSource`. Return paths include `ent`.
/// @param level Game-level state; accesses `spawner` and `time`.
/// @param player Player entity; accesses `s`, `r` and `client`. May update `player.client.portalID` in place.
function DropPortalSource(level,player)
  if level.spawner == void then return error(498,"Portal source requires spawn state") end if
  ent = game.spawn(level); ent.s.modelindex = values.modelIndex(level.spawner,"models/powerups/teleporter/tele_enter.md3")
  snapped = movement.copy(player.s.pos.trBase); snapshot.snapVector(snapped); game.setOrigin(ent,snapped)
  ent.r.mins = movement.copy(player.r.mins); ent.r.maxs = movement.copy(player.r.maxs)
  ent.classname = "hi_portal source"; ent.s.pos.trType = c.TR_STATIONARY; ent.r.contents = CONTENTS_CORPSE | CONTENTS_TRIGGER
  ent.takedamage = true; ent.health = 200; ent.die = PortalDie; game.link(level,ent)
  ent.count = player.client.portalID; player.client.portalID = 0; ent.nextthink = n.add32(level.time,1000); ent.think = PortalEnable
  destination = findDestination(level,ent.count)
  if destination != void then ent.pos1 = movement.copy(destination.s.pos.trBase) end if
  return ent
end function

/// Apply `mq3.game.active_portals.DropPortalSource` and `mq3.game.active_portals.DropPortalDestination` while evaluating `use`. Return paths include `DropPortalDestination(level,player)`.
/// @param level Game-level state; accesses `spawner` and `time`.
/// @param player Player entity; accesses `client`.
function use(level,player)
  if player.client.portalID != 0 then return DropPortalSource(level,player) end if
  return DropPortalDestination(level,player)
end function

