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

function TeleportPlayer(level,player,origin,angles) return teleport.player(level,player,origin,angles) end function

function SP_info_camp(level,self) return game.setOrigin(self,self.s.origin) end function
function SP_info_null(level,self) return game.free(level,self) end function
function SP_info_notnull(level,self) return game.setOrigin(self,self.s.origin) end function
function SP_light(level,self) return game.free(level,self) end function
function SP_misc_teleporter_dest(level,ent) return void end function
function SP_misc_model(level,ent) return game.free(level,ent) end function

function locateCamera(level,ent) return portals.locateCamera(level,ent) end function
function SP_misc_portal_surface(level,ent) return portals.surface(level,ent) end function
function SP_misc_portal_camera(level,ent) return portals.camera(level,ent) end function

function Use_Shooter(level,ent,other,activator) return shooters.use(level,ent,other,activator) end function
function InitShooter_Finish(level,ent) return shooters.finish(level,ent) end function
function InitShooter(level,ent,weapon)
  ent.use = shooters.use; ent.s.weapon = weapon
  shooters.registerItem(level,shooters.weaponItem(weapon))
  ent.movedir = directions.movedirVector(ent.s.angles); ent.s.angles = [0.0,0.0,0.0]
  if ent.random == 0 then ent.random = 1.0 end if
  ent.random = n.f32(crt.sin(n.fdiv(n.fmul(n.f32(3.14159265358979323846),ent.random),180)))
  if ent.target != void then ent.think = shooters.finish; ent.nextthink = n.add32(level.time,500) end if
  return game.link(level,ent)
end function
function SP_shooter_rocket(level,ent) return InitShooter(level,ent,c.WP_ROCKET_LAUNCHER) end function
function SP_shooter_plasma(level,ent) return InitShooter(level,ent,c.WP_PLASMAGUN) end function
function SP_shooter_grenade(level,ent) return InitShooter(level,ent,c.WP_GRENADE_LAUNCHER) end function

function PortalDie(level,self,inflictor,attacker,damage,mod) return activePortals.PortalDie(level,self,inflictor,attacker,damage,mod) end function
function PortalTouch(level,self,other,trace) return activePortals.PortalTouch(level,self,other,trace) end function
function PortalEnable(level,self)
  return activePortals.PortalEnable(level,self)
end function
function DropPortalDestination(level,player) return activePortals.DropPortalDestination(level,player) end function
function DropPortalSource(level,player) return activePortals.DropPortalSource(level,player) end function
function UsePortalHoldable(level,player)
  if player.client.portalID != 0 then return DropPortalSource(level,player) end if
  return DropPortalDestination(level,player)
end function

// `utilities` is a false-positive candidate produced by the historical
// inventory parser from the "calculations in the utilities" comment.  Keep a
// named, side-effect-free compatibility entry so the pinned 20-name ledger is
// exhaustively represented without inventing a Quake entity behavior.
function utilities(level,ent) return void end function
