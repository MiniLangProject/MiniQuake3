// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete C-named code/game/g_combat.c surface.
package mq3.game.g_combat
import mq3.game.combat as combat
import mq3.game.combat_missionpack as mission
import mq3.game.scores as scores
import mq3.game.deaths as deaths
import mq3.game.bodies as bodies

/// Forward `ScorePlum` to `mq3.game.scores.scorePlum` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `s`.
/// @param origin World-space position as three coordinates.
/// @param score Value used by `scorePlum` in `plum.s.time = score`.
function ScorePlum(level,ent,origin,score) return scores.scorePlum(level,ent,origin,score) end function
/// Forward `AddScore` to `mq3.game.scores.addScore` and return the delegated result.
/// @param level Game-level state; accesses `spawner` and `teamScores`. May update `level.teamScores[team]` in place.
/// @param ent Game entity; accesses `client`. May update `ent.client.ps.persistant[c.PERS_SCORE]` in place.
/// @param origin World-space position as three coordinates.
/// @param score Value used by `scorePlum` in `plum.s.time = score`.
function AddScore(level,ent,origin,score) return scores.addScore(level,ent,origin,score) end function
/// Forward `TossClientItems` to `mq3.game.deaths.tossClientItems` and return the delegated result.
/// @param level Game-level state; accesses `spawner` and `time`.
/// @param self Entity receiving the callback; accesses `client` and `s`.
function TossClientItems(level,self) return deaths.tossClientItems(level,self) end function
/// Forward `TossClientCubes` to `mq3.game.combat_missionpack.TossClientCubes` and return the delegated result.
/// @param level Game-level state; accesses `time` and `neutralObelisk`.
/// @param self Entity receiving the callback; accesses `client`. May update `self.client.ps.generic1` in place.
function TossClientCubes(level,self) return mission.TossClientCubes(level,self) end function
/// Forward `TossClientPersistantPowerups` to `mq3.game.combat_missionpack.TossClientPersistantPowerups` and return the delegated result.
/// @param level Game-level state; accesses `scene`.
/// @param ent Game entity; accesses `client`. May update `ent.client.ps.stats[STAT_PERSISTANT_POWERUP]` and `ent.client.persistantPowerup` in place.
function TossClientPersistantPowerups(level,ent) return mission.TossClientPersistantPowerups(level,ent) end function
/// Forward `LookAtKiller` to `mq3.game.bodies.lookAtKiller` and return the delegated result.
/// @param level Value passed as argument 1 to `mq3.game.bodies.lookAtKiller`.
/// @param self Entity receiving the callback; accesses `client` and `s`. May update `self.client.ps.stats[c.STAT_DEAD_YAW]` in place.
/// @param inflictor Entity directly delivering the damage.
/// @param attacker Entity credited with the attack.
function LookAtKiller(level,self,inflictor,attacker) return bodies.lookAtKiller(level,self,inflictor,attacker) end function
/// Forward `GibEntity` to `mq3.game.bodies.gib` and return the delegated result.
/// @param level Game-level state; accesses `entities`.
/// @param self Entity receiving the callback; accesses `s`, `takedamage` and `r`. May update `self.takedamage`, `self.s.eType` and `self.r.contents` in place.
/// @param killer Integer parameter stored alongside the emitted event.
function GibEntity(level,self,killer) return bodies.gib(level,self,killer) end function
/// Forward `body_die` to `mq3.game.bodies.die` and return the delegated result.
/// @param level Game-level state; accesses `blood`.
/// @param self Entity receiving the callback; accesses `health`. May update `self.health` in place.
/// @param inflictor Entity directly delivering the damage.
/// @param attacker Entity credited with the attack.
/// @param damage Damage amount before the current operation applies its rules.
/// @param meansOfDeath Value passed as argument 6 to `mq3.game.bodies.die`.
function body_die(level,self,inflictor,attacker,damage,meansOfDeath) return bodies.die(level,self,inflictor,attacker,damage,meansOfDeath) end function
/// Forward `Kamikaze_DeathActivate` to `mq3.game.combat_missionpack.Kamikaze_DeathActivate` and return the delegated result.
/// @param level Game-level state; accesses `time` and `entities`.
/// @param ent Game entity; accesses `client`, `activator` and `s`. May update `ent.s.eFlags` in place.
function Kamikaze_DeathActivate(level,ent) return mission.Kamikaze_DeathActivate(level,ent) end function
/// Forward `Kamikaze_DeathTimer` to `mq3.game.combat_missionpack.Kamikaze_DeathTimer` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param self Entity receiving the callback; accesses `s`.
function Kamikaze_DeathTimer(level,self) return mission.Kamikaze_DeathTimer(level,self) end function
/// Forward `CheckAlmostCapture` to `mq3.game.deaths.checkAlmostCapture` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
/// @param self Entity receiving the callback; accesses `client`.
/// @param attacker Entity credited with the attack.
function CheckAlmostCapture(level,self,attacker) return deaths.checkAlmostCapture(level,self,attacker) end function
/// Forward `CheckAlmostScored` to `mq3.game.deaths.checkAlmostScored` and return the delegated result.
/// @param level Game-level state; accesses `num_entities` and `entities`.
/// @param self Entity receiving the callback; accesses `client`. May update `self.client.ps.persistant[c.PERS_PLAYEREVENTS]` in place.
/// @param attacker Entity credited with the attack.
function CheckAlmostScored(level,self,attacker) return deaths.checkAlmostScored(level,self,attacker) end function
/// Forward `player_die` to `mq3.game.deaths.playerDie` and return the delegated result.
/// @param level Game-level state; accesses `intermissiontime`, `time`, `scene`, `maxclients` and `clients` and related fields. May update `level.deathAnimIndex` in place.
/// @param self Entity receiving the callback; accesses `client`, `s`, `r`, `enemy` and `takedamage` and related fields. May update `self.client.ps.pm_type`, `self.enemy` and `self.client.ps.persistant[c.PERS_KILLED]` and additional fields in place.
/// @param inflictor Entity directly delivering the damage.
/// @param attacker Entity credited with the attack.
/// @param damage Damage amount before the current operation applies its rules.
/// @param meansOfDeath Means-of-death code used for damage attribution.
function player_die(level,self,inflictor,attacker,damage,meansOfDeath)
  return deaths.playerDie(level,self,inflictor,attacker,damage,meansOfDeath)
end function
/// Forward `CheckArmor` to `mq3.game.combat.checkArmor` and return the delegated result.
/// @param ent Game entity; accesses `client`. May update `ent.client.ps.stats[c.STAT_ARMOR]` in place.
/// @param damage Damage amount before the current operation applies its rules.
/// @param dflags Value used by `checkArmor` in `if amount == 0 or ent.client == void or (dflags & DAMAGE_NO_ARMOR) != 0 then return 0 end if`.
function CheckArmor(ent,damage,dflags) return combat.checkArmor(ent,damage,dflags) end function
/// Forward `RaySphereIntersections` to `mq3.game.combat.raySphereIntersections` and return the delegated result.
/// @param origin World-space position as three coordinates.
/// @param radius Radius used by the spatial or damage query.
/// @param point Three-component point used by the geometric query.
/// @param dir Value passed as argument 1 to `mq3.shared.math.VectorNormalize`.
/// @param intersections Array or byte sequence accessed at `0` and `1`. Entries are written in place.
function RaySphereIntersections(origin,radius,point,dir,intersections) return combat.raySphereIntersections(origin,radius,point,dir,intersections) end function
/// Forward `G_InvulnerabilityEffect` to `mq3.game.combat.invulnerabilityEffect` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param targ Targ record; accesses `client`.
/// @param dir Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param point Three-component point used by the geometric query.
/// @param impactpoint Array or byte sequence accessed at `axis`. Entries are written in place.
/// @param bouncedir Array or byte sequence accessed at `axis`. Entries are written in place.
function G_InvulnerabilityEffect(level,targ,dir,point,impactpoint,bouncedir) return combat.invulnerabilityEffect(level,targ,dir,point,impactpoint,bouncedir) end function
/// Forward `G_Damage` to `mq3.game.combat.damage` and return the delegated result.
/// @param level Game-level state; accesses `intermissionQueued`, `time`, `entities`, `obeliskAttackFn` and `knockback` and related fields.
/// @param targ Targ record; accesses `takedamage`, `client`, `s`, `use` and `moverState` and related fields. May update `targ.client.lasthurt_client`, `targ.client.lasthurt_mod` and `targ.health` and additional fields in place.
/// @param inflictor Entity directly delivering the damage.
/// @param attacker Entity credited with the attack.
/// @param dir Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param point Three-component point used by the geometric query.
/// @param damage Damage amount before the current operation applies its rules.
/// @param dflags Value used by `checkArmor` in `if amount == 0 or ent.client == void or (dflags & DAMAGE_NO_ARMOR) != 0 then return 0 end if`.
/// @param mod Means-of-death code used for damage attribution.
function G_Damage(level,targ,inflictor,attacker,dir,point,damage,dflags,mod) return combat.damage(level,targ,inflictor,attacker,dir,point,damage,dflags,mod) end function
/// Forward `CanDamage` to `mq3.game.combat.canDamage` and return the delegated result.
/// @param level Game-level state; accesses `scene` and `traceObserveFn`.
/// @param targ Targ record; accesses `r` and `s`.
/// @param origin World-space position as three coordinates.
function CanDamage(level,targ,origin) return combat.canDamage(level,targ,origin) end function
/// Forward `G_RadiusDamage` to `mq3.game.combat.radiusDamage` and return the delegated result.
/// @param level Game-level state; accesses `scene` and `entities`.
/// @param origin World-space position as three coordinates.
/// @param attacker Entity credited with the attack.
/// @param damage Damage amount before the current operation applies its rules.
/// @param radius Radius used by the spatial or damage query.
/// @param ignore Value used by `radiusDamage` in `if ent == ignore or not ent.takedamage then continue end if`.
/// @param mod Means-of-death code used for damage attribution.
function G_RadiusDamage(level,origin,attacker,damage,radius,ignore,mod) return combat.radiusDamage(level,origin,attacker,damage,radius,ignore,mod) end function
