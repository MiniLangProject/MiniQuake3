// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 g_weapon.c aiming, gauntlet, projectile helpers and FireWeapon.
package mq3.game.weapons
import mq3.game.constants as c
import mq3.game.weapon_state as weaponState
import mq3.game.weapon_hitscan as weaponHitscan
import mq3.game.entities as weaponEntities
import mq3.game.events as weaponEvents
import mq3.game.combat as weaponCombat
import mq3.game.missiles as weaponMissiles
import mq3.game.snapshot as weaponSnapshot
import mq3.shared.math as q
import mq3.shared.directions as weaponDirections
import mq3.compat.numeric as n

function weaponClient(ent)
  if ent == void or ent.client == void then return error(491,"Weapon requires a client entity") end if
  return ent.client
end function

function weaponAim(state,angles)
  axes = q.AngleVectors(angles)
  // Keep the original static-vector identities: traces and damage callbacks
  // can observe or normalize these same arrays before subsequent helper calls.
  for axis = 0 to 2
    state.forward[axis] = axes[0][axis]
    state.right[axis] = axes[1][axis]
    state.up[axis] = axes[2][axis]
  end for
  return void
end function

function calcMuzzlePoint(ent,forward,right,up,output)
  client = weaponClient(ent)
  for axis = 0 to 2
    output[axis] = ent.s.pos.trBase[axis]
  end for
  output[2] = n.fadd(output[2],client.ps.viewheight)
  for axis = 0 to 2
    output[axis] = n.fadd(output[axis],n.fmul(14.0,forward[axis]))
  end for
  // This is the game's truncating SnapVector macro, not trap_SnapVector.
  return weaponSnapshot.snapVector(output)
end function

function calcMuzzlePointOrigin(ent,origin,forward,right,up,output)
  // The pinned native function deliberately reads trBase and ignores origin.
  return calcMuzzlePoint(ent,forward,right,up,output)
end function

function bounceProjectile(start,impact,dir,endout)
  delta = [n.fsub(impact[0],start[0]),n.fsub(impact[1],start[1]),n.fsub(impact[2],start[2])]
  dot = q.DotProduct(delta,dir); bounced = q.VectorMA(delta,n.fmul(-2.0,dot),dir)
  q.VectorNormalize(bounced)
  for axis = 0 to 2
    endout[axis] = n.fadd(impact[axis],n.fmul(8192.0,bounced[axis]))
  end for
  return void
end function

function gauntlet(level,ent)
  // Weapon_Gauntlet has an empty body; CheckGauntletAttack applies the damage.
  return void
end function

function checkGauntlet(level,ent)
  client = weaponClient(ent); state = weaponState.get(level)
  weaponAim(state,client.ps.viewangles)
  calcMuzzlePoint(ent,state.forward,state.right,state.up,state.muzzle)
  finish = q.VectorMA(state.muzzle,32.0,state.forward)
  hit = weaponCombat.shotTrace(level,state.muzzle,finish,void,void,ent.s.number,0x06000001)
  if (hit.trace.surfaceFlags & 16) != 0 then return false end if
  if hit.entityNum < 0 or hit.entityNum >= 1024 then return error(491,"Gauntlet trace has an invalid entity number") end if
  target = level.entities[hit.entityNum]
  if target.takedamage and target.client != void then
    temp = weaponEntities.tempEntity(level,hit.endpos,c.EV_MISSILE_HIT)
    temp.s.otherEntityNum = target.s.number; temp.s.eventParm = weaponDirections.dirToByte(hit.trace.normal)
    temp.s.weapon = ent.s.weapon
  end if
  if not target.takedamage then return false end if
  client = weaponClient(ent)
  if client.ps.powerups[c.PW_QUAD] != 0 then
    weaponEvents.add(level,ent,c.EV_POWERUP_QUAD,0); state.quadFactor = level.quadfactor
  else state.quadFactor = 1.0 end if
  damage = n.trunc32(n.fmul(50.0,state.quadFactor))
  weaponCombat.damage(level,target,ent,ent,state.forward,hit.endpos,damage,0,c.MOD_GAUNTLET)
  return true
end function

function weaponScaleMissile(state,missile)
  missile.damage = n.trunc32(n.fmul(missile.damage,state.quadFactor))
  missile.splashDamage = n.trunc32(n.fmul(missile.splashDamage,state.quadFactor))
  return void
end function

function grenade(level,ent)
  state = weaponState.get(level)
  state.forward[2] = n.fadd(state.forward[2],n.f32(0.2)); q.VectorNormalize(state.forward)
  missile = weaponMissiles.fire(level,ent,state.muzzle,state.forward,c.WP_GRENADE_LAUNCHER)
  return weaponScaleMissile(state,missile)
end function

function rocket(level,ent)
  state = weaponState.get(level)
  missile = weaponMissiles.fire(level,ent,state.muzzle,state.forward,c.WP_ROCKET_LAUNCHER)
  return weaponScaleMissile(state,missile)
end function

function plasma(level,ent)
  state = weaponState.get(level)
  missile = weaponMissiles.fire(level,ent,state.muzzle,state.forward,c.WP_PLASMAGUN)
  return weaponScaleMissile(state,missile)
end function

function bfg(level,ent)
  state = weaponState.get(level)
  missile = weaponMissiles.fire(level,ent,state.muzzle,state.forward,c.WP_BFG)
  return weaponScaleMissile(state,missile)
end function

function grapple(level,ent)
  client = weaponClient(ent); state = weaponState.get(level)
  if not client.fireHeld and client.hook == void then
    weaponMissiles.fire(level,ent,state.muzzle,state.forward,c.WP_GRAPPLING_HOOK)
  end if
  client = weaponClient(ent); client.fireHeld = true; return void
end function

function fire(level,ent)
  client = weaponClient(ent); state = weaponState.get(level)
  if client.ps.powerups[c.PW_QUAD] != 0 then state.quadFactor = level.quadfactor
  else state.quadFactor = 1.0 end if
  // Use entityState.weapon, including unknown weapon values for shot counting.
  if ent.s.weapon != c.WP_GRAPPLING_HOOK and ent.s.weapon != c.WP_GAUNTLET then
    client.accuracy_shots = n.add32(client.accuracy_shots,1)
  end if
  weaponAim(state,client.ps.viewangles)
  calcMuzzlePointOrigin(ent,client.oldOrigin,state.forward,state.right,state.up,state.muzzle)
  switch ent.s.weapon
    case c.WP_GAUNTLET
      gauntlet(level,ent)
    end case
    case c.WP_LIGHTNING
      weaponHitscan.lightning(level,ent)
    end case
    case c.WP_SHOTGUN
      weaponHitscan.shotgun(level,ent)
    end case
    case c.WP_MACHINEGUN
      if level.spawner == void then return error(491,"Machinegun requires game spawn state") end if
      damage = 7
      if level.spawner.gametype == 3 then damage = 5 end if
      weaponHitscan.bullet(level,ent,200.0,damage)
    end case
    case c.WP_GRENADE_LAUNCHER
      grenade(level,ent)
    end case
    case c.WP_ROCKET_LAUNCHER
      rocket(level,ent)
    end case
    case c.WP_PLASMAGUN
      plasma(level,ent)
    end case
    case c.WP_RAILGUN
      weaponHitscan.rail(level,ent)
    end case
    case c.WP_BFG
      bfg(level,ent)
    end case
    case c.WP_GRAPPLING_HOOK
      grapple(level,ent)
    end case
    case default
      // Native FireWeapon intentionally ignores unknown weapon dispatch values.
      return void
    end case
  end switch
  return void
end function
