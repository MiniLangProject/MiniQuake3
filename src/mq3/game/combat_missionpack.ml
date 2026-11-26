// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Team Arena-only helpers owned by g_combat.c.
package mq3.game.combat_missionpack
import mq3.game.game_headers as headers
import mq3.game.constants as c
import mq3.game.entities as game
import mq3.game.g_items as combatItems
import mq3.game.g_weapon as weapon
import mq3.shared.math as q
import mq3.compat.numeric as n

const SVF_NOCLIENT = 1
const EF_NODRAW = 0x80
const EF_KAMIKAZE = 0x200
const CONTENTS_TRIGGER=headers.CONTENTS_TRIGGER
const STAT_PERSISTANT_POWERUP = 7
const GT_HARVESTER = 7

/// Set `self.client.ps.generic1` to `0` in `mq3.game.combat_missionpack.TossClientCubes`. Return paths include `drop`.
/// @param level Game-level state; accesses `time` and `neutralObelisk`.
/// @param self Entity receiving the callback; accesses `client`. May update `self.client.ps.generic1` in place.
function TossClientCubes(level,self)
  if self.client == void then return void end if
  self.client.ps.generic1 = 0
  if not game.entitiesFree(level) then return void end if
  item = 48; if self.client.team == c.TEAM_RED then item = 47 end if
  angles = [0.0,n.f32(level.time%360),0.0]; axes = q.AngleVectors(angles)
  velocity = [n.fmul(axes[0][0],150.0),n.fmul(axes[0][1],150.0),n.fadd(n.fmul(axes[0][2],150.0),n.fadd(200.0,n.fmul(n.fsub(n.fmul(n.fdiv(game.random(level),32767),2.0),1.0),50.0)))]
  origin = [0.0,0.0,0.0]
  if level.neutralObelisk != void then origin = [level.neutralObelisk.s.pos.trBase[0],level.neutralObelisk.s.pos.trBase[1],n.fadd(level.neutralObelisk.s.pos.trBase[2],44.0)] end if
  drop = combatItems.LaunchItem(level,item,origin,velocity)
  drop.nextthink = n.add32(level.time,30000); drop.think = game.free; drop.spawnflags = self.client.team
  return drop
end function

/// Set `ent.client.ps.stats[STAT_PERSISTANT_POWERUP]` to `0` and `ent.client.persistantPowerup` to `void` in `mq3.game.combat_missionpack.TossClientPersistantPowerups`. Return paths include `powerup`.
/// @param level Game-level state; accesses `scene`.
/// @param ent Game entity; accesses `client`. May update `ent.client.ps.stats[STAT_PERSISTANT_POWERUP]` and `ent.client.persistantPowerup` in place.
function TossClientPersistantPowerups(level,ent)
  if ent.client == void or ent.client.persistantPowerup == void then return void end if
  powerup = ent.client.persistantPowerup; powerup.r.svFlags = powerup.r.svFlags & n.i32(~SVF_NOCLIENT)
  powerup.s.eFlags = powerup.s.eFlags & n.i32(~EF_NODRAW); powerup.r.contents = CONTENTS_TRIGGER; game.link(level,powerup)
  ent.client.ps.stats[STAT_PERSISTANT_POWERUP] = 0; ent.client.persistantPowerup = void
  return powerup
end function

/// Apply `mq3.game.g_weapon.G_StartKamikaze` and `mq3.game.entities.free` while evaluating `Kamikaze_DeathActivate`.
/// @param level Game-level state; accesses `time` and `entities`.
/// @param ent Game entity; accesses `client`, `activator` and `s`. May update `ent.s.eFlags` in place.
function Kamikaze_DeathActivate(level,ent)
  result = weapon.G_StartKamikaze(level,ent); game.free(level,ent); return result
end function

/// Apply `mq3.game.entities.spawn` while evaluating `Kamikaze_DeathTimer`. Return paths include `timer`.
/// @param level Game-level state; accesses `time`.
/// @param self Entity receiving the callback; accesses `s`.
function Kamikaze_DeathTimer(level,self)
  timer = game.spawn(level); timer.classname = "kamikaze timer"; timer.s.pos.trBase = [self.s.pos.trBase[0],self.s.pos.trBase[1],self.s.pos.trBase[2]]
  timer.r.svFlags = timer.r.svFlags | SVF_NOCLIENT; timer.think = Kamikaze_DeathActivate
  timer.nextthink = n.add32(level.time,5000); timer.activator = self; return timer
end function

/// Update `self.client.ps.eFlags`, `self.activator.think` and `self.activator.nextthink` during `cleanupPlayerDie`.
/// @param level Game-level state; accesses `spawner` and `time`.
/// @param self Entity receiving the callback; accesses `client` and `activator`. May update `self.client.ps.eFlags`, `self.activator.think` and `self.activator.nextthink` in place.
function cleanupPlayerDie(level,self)
  if level.spawner == void or not level.spawner.missionpack or self.client == void then return void end if
  if (self.client.ps.eFlags & 2) != 0 and self.activator != void then
    self.client.ps.eFlags = self.client.ps.eFlags & n.i32(~2); self.activator.think = game.free; self.activator.nextthink = level.time
  end if
  return void
end function

/// Apply `mq3.game.combat_missionpack.TossClientPersistantPowerups` and `mq3.game.combat_missionpack.TossClientCubes` while evaluating `dropPlayerDeathItems`.
/// @param level Game-level state; accesses `spawner`.
/// @param self Game entity; accesses `client`. May update `self.client.ps.stats[STAT_PERSISTANT_POWERUP]` and `self.client.persistantPowerup` in place.
function dropPlayerDeathItems(level,self)
  if level.spawner == void or not level.spawner.missionpack then return void end if
  TossClientPersistantPowerups(level,self)
  if level.spawner.gametype == GT_HARVESTER then TossClientCubes(level,self) end if
  return void
end function

/// Apply `mq3.game.combat_missionpack.Kamikaze_DeathTimer` while evaluating `afterPlayerDie`.
/// @param level Game-level state; accesses `spawner`.
/// @param self Entity receiving the callback; accesses `inuse` and `s`.
function afterPlayerDie(level,self)
  if level.spawner != void and level.spawner.missionpack and self.inuse and self.s.eType != c.ET_INVISIBLE and (self.s.eFlags & EF_KAMIKAZE) != 0 then return Kamikaze_DeathTimer(level,self) end if
  return void
end function
