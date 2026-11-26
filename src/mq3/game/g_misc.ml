// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete source-symbol facade for code/game/g_misc.c.  The productive
// spawn and Team Arena holdable paths enter here; the focused packages own
// the already differential-tested mechanics.
package mq3.game.g_misc
import mq3.game.entities as game
import mq3.game.constants as c
import mq3.game.teleport as teleport
import mq3.game.portals as portals
import mq3.game.shooters as shooters
import mq3.game.active_portals as activePortals
import mq3.shared.directions as directions
import mq3.compat.numeric as n
import mq3.compat.transcendental as crt

/// Forward `TeleportPlayer` to `mq3.game.teleport.player` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param player Game entity; accesses `client`, `s` and `r`. May update `player.r.currentOrigin` in place.
/// @param origin World-space position as three coordinates.
/// @param angles Pitch, yaw and roll angles in degrees.
function TeleportPlayer(level,player,origin,angles) return teleport.player(level,player,origin,angles) end function

/// Forward `SP_info_camp` to `mq3.game.entities.setOrigin` and return the delegated result.
/// @param level Not read by this implementation; retained in the `SP_info_camp` signature.
/// @param self Entity receiving the callback; accesses `s`.
function SP_info_camp(level,self) return game.setOrigin(self,self.s.origin) end function
/// Forward `SP_info_null` to `mq3.game.entities.free` and return the delegated result.
/// @param level Game-level state; accesses `scene` and `time`. May update `level.scene.entities[ent.slot]` in place.
/// @param self Game entity; accesses `neverFree`, `r`, `slot`, `s` and `client` and related fields. May update `self.r`, `self.s` and `self.client` and additional fields in place.
function SP_info_null(level,self) return game.free(level,self) end function
/// Forward `SP_info_notnull` to `mq3.game.entities.setOrigin` and return the delegated result.
/// @param level Not read by this implementation; retained in the `SP_info_notnull` signature.
/// @param self Entity receiving the callback; accesses `s`.
function SP_info_notnull(level,self) return game.setOrigin(self,self.s.origin) end function
/// Forward `SP_light` to `mq3.game.entities.free` and return the delegated result.
/// @param level Game-level state; accesses `scene` and `time`. May update `level.scene.entities[ent.slot]` in place.
/// @param self Game entity; accesses `neverFree`, `r`, `slot`, `s` and `client` and related fields. May update `self.r`, `self.s` and `self.client` and additional fields in place.
function SP_light(level,self) return game.free(level,self) end function
/// Return `void` for `SP_misc_teleporter_dest`.
/// @param level Not read by this implementation; retained in the `SP_misc_teleporter_dest` signature.
/// @param ent Not read by this implementation; retained in the `SP_misc_teleporter_dest` signature.
function SP_misc_teleporter_dest(level,ent) return void end function
/// Forward `SP_misc_model` to `mq3.game.entities.free` and return the delegated result.
/// @param level Game-level state; accesses `scene` and `time`. May update `level.scene.entities[ent.slot]` in place.
/// @param ent Game entity; accesses `neverFree`, `r`, `slot`, `s` and `client` and related fields. May update `ent.r`, `ent.s` and `ent.client` and additional fields in place.
function SP_misc_model(level,ent) return game.free(level,ent) end function

/// Forward `locateCamera` to `mq3.game.portals.locateCamera` and return the delegated result.
/// @param level Game-level state; accesses `gamePrintFn`.
/// @param ent Game entity; accesses `target`, `r` and `s`. May update `ent.r.ownerNum`, `ent.s.frame` and `ent.s.powerups` and additional fields in place.
function locateCamera(level,ent) return portals.locateCamera(level,ent) end function
/// Forward `SP_misc_portal_surface` to `mq3.game.portals.surface` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `r`, `s`, `target`, `think` and `nextthink`. May update `ent.r.mins[axis]`, `ent.r.maxs[axis]` and `ent.r.svFlags` and additional fields in place.
function SP_misc_portal_surface(level,ent) return portals.surface(level,ent) end function
/// Forward `SP_misc_portal_camera` to `mq3.game.portals.camera` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `r` and `s`. May update `ent.r.mins[axis]`, `ent.r.maxs[axis]` and `ent.s.clientNum` in place.
function SP_misc_portal_camera(level,ent) return portals.camera(level,ent) end function

/// Forward `Use_Shooter` to `mq3.game.shooters.use` and return the delegated result.
/// @param level Game-level state; accesses `randSeed`. May update `level.randSeed` in place.
/// @param ent Game entity; accesses `enemy`, `s`, `movedir` and `random`.
/// @param other Value passed as argument 3 to `mq3.game.shooters.use`.
/// @param activator Entity responsible for activating the target.
function Use_Shooter(level,ent,other,activator) return shooters.use(level,ent,other,activator) end function
/// Forward `InitShooter_Finish` to `mq3.game.shooters.finish` and return the delegated result.
/// @param level Game-level state; accesses `gamePrintFn`, `num_entities` and `entities`.
/// @param ent Game entity; accesses `enemy`, `target`, `think` and `nextthink`. May update `ent.enemy`, `ent.think` and `ent.nextthink` in place.
function InitShooter_Finish(level,ent) return shooters.finish(level,ent) end function
/// Update `ent.use`, `ent.s.weapon`, `ent.movedir` and `ent.s.angles` and related state during `InitShooter`. Return paths include `game.link(level,ent)`.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `use`, `s`, `movedir`, `random` and `target` and related fields. May update `ent.use`, `ent.s.weapon` and `ent.movedir` and additional fields in place.
/// @param weapon Weapon identifier used by the action or inventory lookup.
function InitShooter(level,ent,weapon)
  ent.use = shooters.use; ent.s.weapon = weapon
  shooters.registerItem(level,shooters.weaponItem(weapon))
  ent.movedir = directions.movedirVector(ent.s.angles); ent.s.angles = [0.0,0.0,0.0]
  if ent.random == 0 then ent.random = 1.0 end if
  ent.random = n.f32(crt.sin(n.fdiv(n.fmul(n.f32(3.14159265358979323846),ent.random),180)))
  if ent.target != void then ent.think = shooters.finish; ent.nextthink = n.add32(level.time,500) end if
  return game.link(level,ent)
end function
/// Forward `SP_shooter_rocket` to `mq3.game.g_misc.InitShooter` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `use`, `s`, `movedir`, `random` and `target` and related fields. May update `ent.use`, `ent.s.weapon` and `ent.movedir` and additional fields in place.
function SP_shooter_rocket(level,ent) return InitShooter(level,ent,c.WP_ROCKET_LAUNCHER) end function
/// Forward `SP_shooter_plasma` to `mq3.game.g_misc.InitShooter` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `use`, `s`, `movedir`, `random` and `target` and related fields. May update `ent.use`, `ent.s.weapon` and `ent.movedir` and additional fields in place.
function SP_shooter_plasma(level,ent) return InitShooter(level,ent,c.WP_PLASMAGUN) end function
/// Forward `SP_shooter_grenade` to `mq3.game.g_misc.InitShooter` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `use`, `s`, `movedir`, `random` and `target` and related fields. May update `ent.use`, `ent.s.weapon` and `ent.movedir` and additional fields in place.
function SP_shooter_grenade(level,ent) return InitShooter(level,ent,c.WP_GRENADE_LAUNCHER) end function

/// Forward `PortalDie` to `mq3.game.active_portals.PortalDie` and return the delegated result.
/// @param level Game-level state; accesses `scene` and `time`. May update `level.scene.entities[ent.slot]` in place.
/// @param self Game entity; accesses `neverFree`, `r`, `slot`, `s` and `client` and related fields. May update `self.r`, `self.s` and `self.client` and additional fields in place.
/// @param inflictor Entity directly delivering the damage.
/// @param attacker Entity credited with the attack.
/// @param damage Damage amount before the current operation applies its rules.
/// @param mod Means-of-death code used for damage attribution.
function PortalDie(level,self,inflictor,attacker,damage,mod) return activePortals.PortalDie(level,self,inflictor,attacker,damage,mod) end function
/// Forward `PortalTouch` to `mq3.game.active_portals.PortalTouch` and return the delegated result.
/// @param level Game-level state; accesses `randSeed`. May update `level.randSeed` in place.
/// @param self Entity receiving the callback; accesses `count`, `pos1` and `s`.
/// @param other Other record; accesses `health` and `client`.
/// @param trace Value passed as argument 4 to `mq3.game.active_portals.PortalTouch`.
function PortalTouch(level,self,other,trace) return activePortals.PortalTouch(level,self,other,trace) end function
/// Forward `PortalEnable` to `mq3.game.active_portals.PortalEnable` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param self Entity receiving the callback; accesses `touch`, `think` and `nextthink`. May update `self.touch`, `self.think` and `self.nextthink` in place.
function PortalEnable(level,self)
  return activePortals.PortalEnable(level,self)
end function
/// Forward `DropPortalDestination` to `mq3.game.active_portals.DropPortalDestination` and return the delegated result.
/// @param level Game-level state; accesses `spawner` and `time`. May update `level.spawner.portalSequence` in place.
/// @param player Player entity; accesses `s`, `r` and `client`. May update `player.client.portalID` and `player.client.ps.stats[c.STAT_HOLDABLE_ITEM]` in place.
function DropPortalDestination(level,player) return activePortals.DropPortalDestination(level,player) end function
/// Forward `DropPortalSource` to `mq3.game.active_portals.DropPortalSource` and return the delegated result.
/// @param level Game-level state; accesses `spawner` and `time`.
/// @param player Player entity; accesses `s`, `r` and `client`. May update `player.client.portalID` in place.
function DropPortalSource(level,player) return activePortals.DropPortalSource(level,player) end function
/// Apply `mq3.game.g_misc.DropPortalSource` and `mq3.game.g_misc.DropPortalDestination` while evaluating `UsePortalHoldable`. Return paths include `DropPortalDestination(level,player)`.
/// @param level Game-level state; accesses `spawner` and `time`.
/// @param player Player entity; accesses `client`.
function UsePortalHoldable(level,player)
  if player.client.portalID != 0 then return DropPortalSource(level,player) end if
  return DropPortalDestination(level,player)
end function

// `utilities` is a false-positive candidate produced by the historical
// inventory parser from the "calculations in the utilities" comment.  Keep a
// named, side-effect-free compatibility entry so the pinned 20-name ledger is
// exhaustively represented without inventing a Quake entity behavior.
/// @param level Not read by this implementation; retained in the `utilities` signature.
/// @param ent Not read by this implementation; retained in the `utilities` signature.
function utilities(level,ent) return void end function
