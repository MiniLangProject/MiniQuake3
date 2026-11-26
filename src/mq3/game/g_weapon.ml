// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete g_weapon.c surface. Baseq3 delegates to the exact-tested weapon
// kernels; this file adds the MISSIONPACK Nailgun, Prox, Chaingun and Kamikaze.
package mq3.game.g_weapon
import mq3.game.constants as c
import mq3.game.weapons as base
import mq3.game.weapon_hitscan as hitscan
import mq3.game.weapon_state as weaponState
import mq3.game.missiles as missiles
import mq3.game.entities as game
import mq3.game.combat as combat
import mq3.game.events as events
import mq3.game.snapshot as snapshot
import mq3.game.movement as movement
import mq3.shared.math as q
import mq3.compat.numeric as n
import mq3.compat.transcendental as crt
import mq3.server.world as sv

const WP_NAILGUN = 11
const WP_PROX_LAUNCHER = 12
const WP_CHAINGUN = 13
const MOD_NAIL = 24
const MOD_CHAINGUN = 25
const MOD_PROXIMITY_MINE = 26
const MOD_KAMIKAZE = 27
const EF_KAMIKAZE = 0x200
const DAMAGE_RADIUS = 1
const DAMAGE_NO_PROTECTION = 8
const DAMAGE_NO_TEAM_PROTECTION = 16
const MASK_SHOT = 0x06000001

/// Forward `G_BounceProjectile` to `mq3.game.weapons.bounceProjectile` and return the delegated result.
/// @param start Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param impact Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param dir Value passed as argument 2 to `mq3.shared.math.DotProduct`.
/// @param endout Array or byte sequence accessed at `axis`. Entries are written in place.
function G_BounceProjectile(start,impact,dir,endout) return base.bounceProjectile(start,impact,dir,endout) end function
/// Forward `Weapon_Gauntlet` to `mq3.game.weapons.gauntlet` and return the delegated result.
/// @param level Value passed as argument 1 to `mq3.game.weapons.gauntlet`.
/// @param ent Value passed as argument 2 to `mq3.game.weapons.gauntlet`.
function Weapon_Gauntlet(level,ent) return base.gauntlet(level,ent) end function
/// Forward `CheckGauntletAttack` to `mq3.game.weapons.checkGauntlet` and return the delegated result.
/// @param level Game-level state; accesses `entities` and `quadfactor`.
/// @param ent Game entity; accesses `s`.
function CheckGauntletAttack(level,ent) return base.checkGauntlet(level,ent) end function
/// Forward `SnapVectorTowards` to `mq3.game.missiles.snapTowards` and return the delegated result.
/// @param value Array or byte sequence accessed at `axis`. Entries are written in place.
/// @param towards Array or byte sequence accessed at `axis`.
function SnapVectorTowards(value,towards) return missiles.snapTowards(value,towards) end function
/// Forward `Bullet_Fire` to `mq3.game.weapon_hitscan.bullet` and return the delegated result.
/// @param level Game-level state; accesses `weaponState`. May update `level.weaponState` in place.
/// @param ent Game entity; accesses `s` and `client`. May update `ent.client.accuracy_hits` in place.
/// @param spread Value passed as argument 1 to `mq3.compat.numeric.f32`.
/// @param damage Damage amount before the current operation applies its rules.
function Bullet_Fire(level,ent,spread,damage) return hitscan.bullet(level,ent,spread,damage) end function
/// Forward `BFG_Fire` to `mq3.game.weapons.bfg` and return the delegated result.
/// @param level Game-level state; accesses `weaponState`. May update `level.weaponState` in place.
/// @param ent Entity receiving the callback; accesses `s`.
function BFG_Fire(level,ent) return base.bfg(level,ent) end function
/// Forward `ShotgunPellet` to `mq3.game.weapon_hitscan.shotgunPellet` and return the delegated result.
/// @param level Game-level state; accesses `weaponState`. May update `level.weaponState` in place.
/// @param start Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param finish Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param ent Game entity; accesses `s`.
function ShotgunPellet(level,start,finish,ent) return hitscan.shotgunPellet(level,start,finish,ent) end function
/// Forward `ShotgunPattern` to `mq3.game.weapon_hitscan.shotgunPattern` and return the delegated result.
/// @param level Game-level state; accesses `weaponState`. May update `level.weaponState` in place.
/// @param origin World-space position as three coordinates.
/// @param origin2 Value passed as argument 1 to `mq3.shared.math.VectorNormalize2`.
/// @param seed State used to initialize the deterministic random sequence.
/// @param ent Game entity; accesses `client`. May update `ent.client.accuracy_hits` in place.
function ShotgunPattern(level,origin,origin2,seed,ent) return hitscan.shotgunPattern(level,origin,origin2,seed,ent) end function
/// Forward `weapon_supershotgun_fire` to `mq3.game.weapon_hitscan.shotgun` and return the delegated result.
/// @param level Game-level state; accesses `weaponState`. May update `level.weaponState` in place.
/// @param ent Game entity; accesses `s`.
function weapon_supershotgun_fire(level,ent) return hitscan.shotgun(level,ent) end function
/// Forward `weapon_grenadelauncher_fire` to `mq3.game.weapons.grenade` and return the delegated result.
/// @param level Game-level state; accesses `weaponState`. May update `level.weaponState` in place.
/// @param ent Entity receiving the callback; accesses `s`.
function weapon_grenadelauncher_fire(level,ent) return base.grenade(level,ent) end function
/// Forward `Weapon_RocketLauncher_Fire` to `mq3.game.weapons.rocket` and return the delegated result.
/// @param level Game-level state; accesses `weaponState`. May update `level.weaponState` in place.
/// @param ent Entity receiving the callback; accesses `s`.
function Weapon_RocketLauncher_Fire(level,ent) return base.rocket(level,ent) end function
/// Forward `Weapon_Plasmagun_Fire` to `mq3.game.weapons.plasma` and return the delegated result.
/// @param level Game-level state; accesses `weaponState`. May update `level.weaponState` in place.
/// @param ent Entity receiving the callback; accesses `s`.
function Weapon_Plasmagun_Fire(level,ent) return base.plasma(level,ent) end function
/// Forward `weapon_railgun_fire` to `mq3.game.weapon_hitscan.rail` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `s`.
function weapon_railgun_fire(level,ent) return hitscan.rail(level,ent) end function
/// Forward `Weapon_GrapplingHook_Fire` to `mq3.game.weapons.grapple` and return the delegated result.
/// @param level Game-level state; accesses `weaponState`. May update `level.weaponState` in place.
/// @param ent Game entity; accesses `client`.
function Weapon_GrapplingHook_Fire(level,ent) return base.grapple(level,ent) end function
/// Forward `Weapon_HookFree` to `mq3.game.missiles.hookFree` and return the delegated result.
/// @param level Game-level state; accesses `scene` and `time`. May update `level.scene.entities[ent.slot]` in place.
/// @param ent Game entity; accesses `parent`.
function Weapon_HookFree(level,ent) return missiles.hookFree(level,ent) end function
/// Forward `Weapon_HookThink` to `mq3.game.missiles.hookThink` and return the delegated result.
/// @param level Value passed as argument 1 to `mq3.game.missiles.hookThink`.
/// @param ent Game entity; accesses `enemy` and `r`.
function Weapon_HookThink(level,ent) return missiles.hookThink(level,ent) end function
/// Forward `Weapon_LightningFire` to `mq3.game.weapon_hitscan.lightning` and return the delegated result.
/// @param level Game-level state; accesses `weaponState`. May update `level.weaponState` in place.
/// @param ent Game entity; accesses `s` and `client`. May update `ent.client.accuracy_hits` in place.
function Weapon_LightningFire(level,ent) return hitscan.lightning(level,ent) end function
/// Forward `LogAccuracyHit` to `mq3.game.combat.logAccuracyHit` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
/// @param target Target record; accesses `takedamage` and `client`.
/// @param attacker Entity credited with the attack.
function LogAccuracyHit(level,target,attacker) return combat.logAccuracyHit(level,target,attacker) end function
/// Forward `CalcMuzzlePoint` to `mq3.game.weapons.calcMuzzlePoint` and return the delegated result.
/// @param ent Game entity; accesses `s`.
/// @param forward Array or byte sequence accessed at `axis`.
/// @param right Value passed as argument 3 to `mq3.game.weapons.calcMuzzlePoint`.
/// @param up Value passed as argument 4 to `mq3.game.weapons.calcMuzzlePoint`.
/// @param muzzlePoint Array or byte sequence accessed at `axis`. Entries are written in place.
function CalcMuzzlePoint(ent,forward,right,up,muzzlePoint) return base.calcMuzzlePoint(ent,forward,right,up,muzzlePoint) end function
/// Forward `CalcMuzzlePointOrigin` to `mq3.game.weapons.calcMuzzlePointOrigin` and return the delegated result.
/// @param ent Game entity; accesses `s`.
/// @param origin World-space position as three coordinates.
/// @param forward Array or byte sequence accessed at `axis`.
/// @param right Value passed as argument 3 to `mq3.game.weapons.calcMuzzlePoint`.
/// @param up Value passed as argument 4 to `mq3.game.weapons.calcMuzzlePoint`.
/// @param muzzlePoint Array or byte sequence accessed at `axis`. Entries are written in place.
function CalcMuzzlePointOrigin(ent,origin,forward,right,up,muzzlePoint) return base.calcMuzzlePointOrigin(ent,origin,forward,right,up,muzzlePoint) end function

/// Forward `randomFloat` to `mq3.compat.numeric.fdiv` and return the delegated result.
/// @param level Game-level state; accesses `randSeed`. May update `level.randSeed` in place.
function randomFloat(level) return n.fdiv(game.random(level),32767.0) end function
/// Return `2.0*(randomFloat(level)-0.5)` for `centeredRandom`.
/// @param level Game-level state; accesses `randSeed`. May update `level.randSeed` in place.
function centeredRandom(level) return 2.0*(randomFloat(level)-0.5) end function

/// Apply `mq3.game.entities.spawn`, `mq3.game.movement.copy` and `mq3.game.g_weapon.randomFloat` while evaluating `fireNail`. Return paths include `bolt`.
/// @param level Game-level state; accesses `time`.
/// @param self Entity receiving the callback; accesses `s`.
/// @param start Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param forward Value passed as argument 3 to `mq3.shared.math.VectorMA`.
/// @param right Value passed as argument 3 to `mq3.shared.math.VectorMA`.
/// @param up Value passed as argument 3 to `mq3.shared.math.VectorMA`.
function fireNail(level,self,start,forward,right,up)
  bolt = game.spawn(level); bolt.classname = "nail"; bolt.nextthink = n.add32(level.time,10000); bolt.think = missiles.explode
  bolt.s.eType = c.ET_MISSILE; bolt.r.svFlags = 128; bolt.s.weapon = WP_NAILGUN; bolt.r.ownerNum = self.s.number; bolt.parent = self
  bolt.damage = 20; bolt.methodOfDeath = MOD_NAIL; bolt.clipmask = MASK_SHOT; bolt.target_ent = void
  bolt.s.pos.trType = c.TR_LINEAR; bolt.s.pos.trTime = level.time; bolt.s.pos.trBase = movement.copy(start)
  angle = n.f32(randomFloat(level)*3.14159265358979323846*2.0)
  vertical = n.f32(crt.sin(angle)*centeredRandom(level)*500.0*16.0)
  horizontal = n.f32(crt.cos(angle)*centeredRandom(level)*500.0*16.0)
  finish = q.VectorMA(start,131072.0,forward); finish = q.VectorMA(finish,horizontal,right); finish = q.VectorMA(finish,vertical,up)
  direction = [finish[0]-start[0],finish[1]-start[1],finish[2]-start[2]]; q.VectorNormalize(direction)
  speed = n.f32(555.0+randomFloat(level)*1800.0); bolt.s.pos.trDelta = q.VectorScale(direction,speed); snapshot.snapVector(bolt.s.pos.trDelta)
  bolt.r.currentOrigin = movement.copy(start); return bolt
end function

/// Apply `mq3.game.entities.spawn`, `mq3.game.movement.copy` and `mq3.game.snapshot.snapVector` while evaluating `fireProx`. Return paths include `bolt`.
/// @param level Game-level state; accesses `time`.
/// @param self Entity receiving the callback; accesses `s` and `client`.
/// @param start Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param direction Value passed as argument 1 to `mq3.shared.math.VectorNormalize`.
function fireProx(level,self,start,direction)
  q.VectorNormalize(direction); bolt = game.spawn(level); bolt.classname = "prox mine"; bolt.nextthink = n.add32(level.time,3000); bolt.think = missiles.explode
  bolt.s.eType = c.ET_MISSILE; bolt.r.svFlags = 128; bolt.s.weapon = WP_PROX_LAUNCHER; bolt.s.eFlags = 0
  bolt.r.ownerNum = self.s.number; bolt.parent = self; bolt.damage = 0; bolt.splashDamage = 100; bolt.splashRadius = 150
  bolt.methodOfDeath = MOD_PROXIMITY_MINE; bolt.splashMethodOfDeath = MOD_PROXIMITY_MINE; bolt.clipmask = MASK_SHOT; bolt.target_ent = void; bolt.count = 0
  bolt.s.generic1 = self.client.team; bolt.s.pos.trType = c.TR_GRAVITY; bolt.s.pos.trTime = n.add32(level.time,-50); bolt.s.pos.trBase = movement.copy(start)
  bolt.s.pos.trDelta = q.VectorScale(direction,700.0); snapshot.snapVector(bolt.s.pos.trDelta); bolt.r.currentOrigin = movement.copy(start); return bolt
end function

/// Apply `mq3.game.weapon_state.get` and `mq3.game.g_weapon.fireNail` while evaluating `Weapon_Nailgun_Fire`.
/// @param level Game-level state; accesses `weaponState`. May update `level.weaponState` in place.
/// @param ent Entity receiving the callback; accesses `s`.
function Weapon_Nailgun_Fire(level,ent)
  state = weaponState.get(level); result = void
  for count = 0 to 14
    result = fireNail(level,ent,state.muzzle,state.forward,state.right,state.up); result.damage = n.trunc32(n.fmul(result.damage,state.quadFactor)); result.splashDamage = n.trunc32(n.fmul(result.splashDamage,state.quadFactor))
  end for
  return result
end function

/// Apply `mq3.game.weapon_state.get` and `mq3.game.g_weapon.fireProx` while evaluating `weapon_proxlauncher_fire`.
/// @param level Game-level state; accesses `weaponState`. May update `level.weaponState` in place.
/// @param ent Entity receiving the callback; accesses `s` and `client`.
function weapon_proxlauncher_fire(level,ent)
  state = weaponState.get(level); state.forward[2] = n.fadd(state.forward[2],n.f32(0.2)); q.VectorNormalize(state.forward)
  result = fireProx(level,ent,state.muzzle,state.forward); result.damage = n.trunc32(n.fmul(result.damage,state.quadFactor)); result.splashDamage = n.trunc32(n.fmul(result.splashDamage,state.quadFactor)); return result
end function

/// Apply `mq3.game.weapons.fire`, `mq3.game.weapons.weaponClient` and `mq3.game.weapon_state.get` while evaluating `FireWeapon`.
/// @param level Game-level state; accesses `quadfactor` and `spawner`.
/// @param ent Game entity; accesses `s`.
/// @param missionpack Whether Team Arena rules and definitions are active.
/// @param doubler Value used by `FireWeapon` in `if doubler then state.quadFactor = n.fmul(state.quadFactor,2.0) end if`.
function FireWeapon(level,ent,missionpack,doubler)
  if not missionpack then return base.fire(level,ent) end if
  client = base.weaponClient(ent); state = weaponState.get(level)
  if client.ps.powerups[c.PW_QUAD] != 0 then state.quadFactor = level.quadfactor else state.quadFactor = 1.0 end if
  if doubler then state.quadFactor = n.fmul(state.quadFactor,2.0) end if
  if ent.s.weapon != c.WP_GRAPPLING_HOOK and ent.s.weapon != c.WP_GAUNTLET then
    if ent.s.weapon == WP_NAILGUN then client.accuracy_shots = n.add32(client.accuracy_shots,15) else client.accuracy_shots = n.add32(client.accuracy_shots,1) end if
  end if
  base.weaponAim(state,client.ps.viewangles); base.calcMuzzlePointOrigin(ent,client.oldOrigin,state.forward,state.right,state.up,state.muzzle)
  if ent.s.weapon == WP_NAILGUN then return Weapon_Nailgun_Fire(level,ent) end if
  if ent.s.weapon == WP_PROX_LAUNCHER then return weapon_proxlauncher_fire(level,ent) end if
  if ent.s.weapon == WP_CHAINGUN then return hitscan.bullet(level,ent,600.0,7) end if
  // Dispatch the remaining weapons without recomputing quad/shot accounting.
  switch ent.s.weapon
    case c.WP_GAUNTLET base.gauntlet(level,ent) end case
    case c.WP_LIGHTNING hitscan.lightning(level,ent) end case
    case c.WP_SHOTGUN hitscan.shotgun(level,ent) end case
    case c.WP_MACHINEGUN damage=7;if level.spawner!=void and level.spawner.gametype==3 then damage=5 end if;hitscan.bullet(level,ent,200.0,damage) end case
    case c.WP_GRENADE_LAUNCHER base.grenade(level,ent) end case
    case c.WP_ROCKET_LAUNCHER base.rocket(level,ent) end case
    case c.WP_PLASMAGUN base.plasma(level,ent) end case
    case c.WP_RAILGUN hitscan.rail(level,ent) end case
    case c.WP_BFG base.bfg(level,ent) end case
    case c.WP_GRAPPLING_HOOK base.grapple(level,ent) end case
  end switch
  return void
end function

/// Calculate the shortest distance from an origin to an entity's axis-aligned absolute bounds.
/// @param origin World-space position as three coordinates.
/// @param ent Game entity; accesses `r`.
function edgeDistance(origin,ent)
  delta = [0.0,0.0,0.0]
  for axis = 0 to 2
    if origin[axis] < ent.r.absmin[axis] then delta[axis] = ent.r.absmin[axis]-origin[axis]
    else if origin[axis] > ent.r.absmax[axis] then delta[axis] = origin[axis]-ent.r.absmax[axis] end if
  end for
  return q.VectorLength(delta)
end function

/// Apply `mq3.game.weapon_state.get`, `mq3.server.world.areaEntities` and `mq3.game.g_weapon.edgeDistance` while evaluating `KamikazeRadiusDamage`. Return paths include `hits`.
/// @param level Game-level state; accesses `scene`, `entities` and `time`.
/// @param origin World-space position as three coordinates.
/// @param attacker Entity credited with the attack.
/// @param damage Damage amount before the current operation applies its rules.
/// @param radius Radius used by the spatial or damage query.
function KamikazeRadiusDamage(level,origin,attacker,damage,radius)
  state = weaponState.get(level); if radius < 1 then radius = 1.0 end if
  mins=[origin[0]-radius,origin[1]-radius,origin[2]-radius];maxs=[origin[0]+radius,origin[1]+radius,origin[2]+radius]
  hits=0
  for each number in sv.areaEntities(level.scene,mins,maxs,1024)
    ent=level.entities[number];cooling=state.kamikazeGeneration[number]==ent.freetime and state.kamikazeTime[number]>level.time
    if not ent.takedamage or cooling or edgeDistance(origin,ent)>=radius then continue end if
    direction=[ent.r.currentOrigin[0]-origin[0],ent.r.currentOrigin[1]-origin[1],ent.r.currentOrigin[2]-origin[2]+24.0]
    combat.damage(level,ent,void,attacker,direction,origin,n.trunc32(damage),DAMAGE_RADIUS|DAMAGE_NO_TEAM_PROTECTION,MOD_KAMIKAZE)
    state.kamikazeTime[number]=n.add32(level.time,3000);state.kamikazeGeneration[number]=ent.freetime;hits=hits+1
  end for
  return hits
end function

/// Apply `mq3.game.weapon_state.get`, `mq3.server.world.areaEntities` and `mq3.game.g_weapon.edgeDistance` while evaluating `KamikazeShockWave`. Return paths include `hits`.
/// @param level Game-level state; accesses `scene`, `entities` and `time`.
/// @param origin World-space position as three coordinates.
/// @param attacker Entity credited with the attack.
/// @param damage Damage amount before the current operation applies its rules.
/// @param push Value passed as argument 2 to `mq3.compat.numeric.fmul`.
/// @param radius Radius used by the spatial or damage query.
function KamikazeShockWave(level,origin,attacker,damage,push,radius)
  state=weaponState.get(level);if radius<1 then radius=1.0 end if
  mins=[origin[0]-radius,origin[1]-radius,origin[2]-radius];maxs=[origin[0]+radius,origin[1]+radius,origin[2]+radius];hits=0
  for each number in sv.areaEntities(level.scene,mins,maxs,1024)
    ent=level.entities[number];cooling=state.kamikazeShockGeneration[number]==ent.freetime and state.kamikazeShockTime[number]>level.time
    if cooling or edgeDistance(origin,ent)>=radius then continue end if
    direction=[ent.r.currentOrigin[0]-origin[0],ent.r.currentOrigin[1]-origin[1],ent.r.currentOrigin[2]-origin[2]+24.0]
    combat.damage(level,ent,void,attacker,direction,origin,n.trunc32(damage),DAMAGE_RADIUS|DAMAGE_NO_TEAM_PROTECTION,MOD_KAMIKAZE)
    direction[2]=0.0;q.VectorNormalize(direction)
    if ent.client!=void then ent.client.ps.velocity[0]=n.fmul(direction[0],push);ent.client.ps.velocity[1]=n.fmul(direction[1],push);ent.client.ps.velocity[2]=100.0 end if
    state.kamikazeShockTime[number]=n.add32(level.time,3000);state.kamikazeShockGeneration[number]=ent.freetime;hits=hits+1
  end for
  return hits
end function

/// Return `n.trunc32(value*(65536.0/360.0))&65535` for `angleToShort`.
/// @param value Operand used to evaluate the returned expression `n.trunc32(value*(65536.0/360.0))&65535`.
function angleToShort(value) return n.trunc32(value*(65536.0/360.0))&65535 end function
/// Update `self.count`, `self.nextthink` and `self.movedir` during `KamikazeDamage`.
/// @param level Game-level state; accesses `time`, `maxclients` and `entities`.
/// @param self Entity receiving the callback; accesses `count`, `s`, `activator`, `nextthink` and `movedir`. May update `self.count`, `self.nextthink` and `self.movedir` in place.
function KamikazeDamage(level,self)
  self.count=n.add32(self.count,100)
  shockRadius=n.trunc32(n.fdiv(n.fmul(n.i32(self.count),1320.0),2000.0));KamikazeShockWave(level,self.s.pos.trBase,self.activator,25.0,400.0,shockRadius)
  if self.count>=250 then boomRadius=n.trunc32(n.fdiv(n.fmul(n.i32(self.count-250),720.0),1750.0));KamikazeRadiusDamage(level,self.s.pos.trBase,self.activator,400.0,boomRadius) end if
  if self.count>=2000 then return game.free(level,self) end if
  self.nextthink=n.add32(level.time,100);newangles=[centeredRandom(level)*2.0,centeredRandom(level)*2.0,0.0]
  for index=0 to level.maxclients-1
    ent=level.entities[index];if not ent.inuse or ent.client==void then continue end if
    if ent.client.ps.groundEntityNum!=1023 then ent.client.ps.velocity[0]=n.fadd(ent.client.ps.velocity[0],centeredRandom(level)*120.0);ent.client.ps.velocity[1]=n.fadd(ent.client.ps.velocity[1],centeredRandom(level)*120.0);ent.client.ps.velocity[2]=n.f32(30.0+randomFloat(level)*25.0) end if
    for axis=0 to 2 ent.client.ps.delta_angles[axis]=n.add32(ent.client.ps.delta_angles[axis],angleToShort(newangles[axis]-self.movedir[axis])) end for
  end for
  self.movedir=movement.copy(newangles);return void
end function

/// Set `ent.s.eFlags` to `ent.s.eFlags&~EF_KAMIKAZE` in `mq3.game.g_weapon.G_StartKamikaze`. Return paths include `explosion`.
/// @param level Game-level state; accesses `time` and `entities`.
/// @param ent Game entity; accesses `client`, `activator` and `s`. May update `ent.s.eFlags` in place.
function G_StartKamikaze(level,ent)
  explosion=game.spawn(level);explosion.s.eType=c.ET_EVENTS+c.EV_KAMIKAZE;explosion.eventTime=level.time
  source=ent;if ent.client==void then source=ent.activator end if;snapped=movement.copy(source.s.pos.trBase);snapshot.snapVector(snapped);game.setOrigin(explosion,snapped)
  explosion.classname="kamikaze";explosion.s.pos.trType=c.TR_STATIONARY;explosion.think=KamikazeDamage;explosion.nextthink=n.add32(level.time,100);explosion.count=0;explosion.movedir=[0.0,0.0,0.0];game.link(level,explosion)
  if ent.client!=void then explosion.activator=ent;ent.s.eFlags=ent.s.eFlags&~EF_KAMIKAZE;combat.damage(level,ent,ent,ent,void,void,100000,DAMAGE_NO_PROTECTION,MOD_KAMIKAZE)
  else if ent.activator.classname=="bodyque" then explosion.activator=level.entities[ent.activator.r.ownerNum] else explosion.activator=ent.activator end if
  sound=game.tempEntity(level,snapped,c.EV_GLOBAL_TEAM_SOUND);sound.r.svFlags=sound.r.svFlags|32;sound.s.eventParm=c.GTS_KAMIKAZE;return explosion
end function
