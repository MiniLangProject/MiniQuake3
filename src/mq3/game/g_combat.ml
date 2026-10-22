// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete C-named code/game/g_combat.c surface.
package mq3.game.g_combat
import mq3.game.combat as combat
import mq3.game.combat_missionpack as mission
import mq3.game.scores as scores
import mq3.game.deaths as deaths
import mq3.game.bodies as bodies

function ScorePlum(level,ent,origin,score) return scores.scorePlum(level,ent,origin,score) end function
function AddScore(level,ent,origin,score) return scores.addScore(level,ent,origin,score) end function
function TossClientItems(level,self) return deaths.tossClientItems(level,self) end function
function TossClientCubes(level,self) return mission.TossClientCubes(level,self) end function
function TossClientPersistantPowerups(level,ent) return mission.TossClientPersistantPowerups(level,ent) end function
function LookAtKiller(level,self,inflictor,attacker) return bodies.lookAtKiller(level,self,inflictor,attacker) end function
function GibEntity(level,self,killer) return bodies.gib(level,self,killer) end function
function body_die(level,self,inflictor,attacker,damage,meansOfDeath) return bodies.die(level,self,inflictor,attacker,damage,meansOfDeath) end function
function Kamikaze_DeathActivate(level,ent) return mission.Kamikaze_DeathActivate(level,ent) end function
function Kamikaze_DeathTimer(level,self) return mission.Kamikaze_DeathTimer(level,self) end function
function CheckAlmostCapture(level,self,attacker) return deaths.checkAlmostCapture(level,self,attacker) end function
function CheckAlmostScored(level,self,attacker) return deaths.checkAlmostScored(level,self,attacker) end function
function player_die(level,self,inflictor,attacker,damage,meansOfDeath)
  return deaths.playerDie(level,self,inflictor,attacker,damage,meansOfDeath)
end function
function CheckArmor(ent,damage,dflags) return combat.checkArmor(ent,damage,dflags) end function
function RaySphereIntersections(origin,radius,point,dir,intersections) return combat.raySphereIntersections(origin,radius,point,dir,intersections) end function
function G_InvulnerabilityEffect(level,targ,dir,point,impactpoint,bouncedir) return combat.invulnerabilityEffect(level,targ,dir,point,impactpoint,bouncedir) end function
function G_Damage(level,targ,inflictor,attacker,dir,point,damage,dflags,mod) return combat.damage(level,targ,inflictor,attacker,dir,point,damage,dflags,mod) end function
function CanDamage(level,targ,origin) return combat.canDamage(level,targ,origin) end function
function G_RadiusDamage(level,origin,attacker,damage,radius,ignore,mod) return combat.radiusDamage(level,origin,attacker,damage,radius,ignore,mod) end function
