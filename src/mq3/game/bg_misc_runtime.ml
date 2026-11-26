// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete source-symbol facade for code/game/bg_misc.c.
package mq3.game.bg_misc_runtime
import mq3.game.constants as c
import mq3.game.items as items
import mq3.game.jumppad as jumppad
import mq3.game.snapshot as snapshot
import mq3.game.spawn_tables as tables
import mq3.game.trajectory as trajectory
import mq3.compat.numeric as n
import std.string as strings

/// Apply `mq3.game.spawn_tables.missionpackItems` and `mq3.game.spawn_tables.items` while evaluating `itemLimit`. Return paths include `len(tables.items())`.
/// @param missionpack Whether Team Arena rules and definitions are active.
function itemLimit(missionpack)
  if missionpack then return len(tables.missionpackItems()) end if
  return len(tables.items())
end function

/// Apply `mq3.game.constants.missionpackItemType` and `mq3.game.constants.itemType` while evaluating `resolvedItemType`. Return paths include `c.itemType(index)`.
/// @param index Index of the entry to access.
/// @param missionpack Whether Team Arena rules and definitions are active.
function resolvedItemType(index,missionpack)
  if missionpack then return c.missionpackItemType(index) end if
  return c.itemType(index)
end function

/// Apply `mq3.game.constants.missionpackItemTag` and `mq3.game.constants.itemTag` while evaluating `resolvedItemTag`. Return paths include `c.itemTag(index)`.
/// @param index Index of the entry to access.
/// @param missionpack Whether Team Arena rules and definitions are active.
function resolvedItemTag(index,missionpack)
  if missionpack then return c.missionpackItemTag(index) end if
  return c.itemTag(index)
end function

/// Return the pinned pickup-name table, extending it with Team Arena items when requested.
/// @param missionpack Whether Team Arena rules and definitions are active.
function pickupNames(missionpack)
  names = ["","Armor Shard","Armor","Heavy Armor","5 Health","25 Health","50 Health","Mega Health",
    "Gauntlet","Shotgun","Machinegun","Grenade Launcher","Rocket Launcher","Lightning Gun","Railgun",
    "Plasma Gun","BFG10K","Grappling Hook","Shells","Bullets","Grenades","Cells","Lightning","Rockets",
    "Slugs","Bfg Ammo","Personal Teleporter","Medkit","Quad Damage","Battle Suit","Speed",
    "Invisibility","Regeneration","Flight","Red Flag","Blue Flag"]
  if missionpack then
    names = names+["Kamikaze","Portal","Invulnerability","Nails","Proximity Mines","Chaingun Belt",
      "Scout","Guard","Doubler","Ammo Regen","Neutral Flag","Red Cube","Blue Cube","Nailgun",
      "Prox Launcher","Chaingun"]
  end if
  return names
end function

/// Apply `mq3.game.bg_misc_runtime.itemLimit`, `mq3.game.bg_misc_runtime.resolvedItemType` and `mq3.game.bg_misc_runtime.resolvedItemTag` while evaluating `BG_FindItemForPowerup`.
/// @param powerup Value used by `BG_FindItemForPowerup` in `if (kind == c.IT_POWERUP or kind == c.IT_TEAM or kind == c.IT_PERSISTANT_POWERUP) and resolvedItemTag(index,miss...`.
/// @param missionpack Whether Team Arena rules and definitions are active.
function BG_FindItemForPowerup(powerup,missionpack)
  for index = 0 to itemLimit(missionpack)-1
    kind = resolvedItemType(index,missionpack)
    if (kind == c.IT_POWERUP or kind == c.IT_TEAM or kind == c.IT_PERSISTANT_POWERUP) and resolvedItemTag(index,missionpack) == powerup then return index end if
  end for
  return 0
end function

/// Apply `mq3.game.bg_misc_runtime.itemLimit`, `mq3.game.bg_misc_runtime.resolvedItemType` and `mq3.game.bg_misc_runtime.resolvedItemTag` while evaluating `BG_FindItemForHoldable`.
/// @param holdable Value used by `BG_FindItemForHoldable` in `if resolvedItemType(index,missionpack) == c.IT_HOLDABLE and resolvedItemTag(index,missionpack) == holdable then...`.
/// @param missionpack Whether Team Arena rules and definitions are active.
function BG_FindItemForHoldable(holdable,missionpack)
  for index = 0 to itemLimit(missionpack)-1
    if resolvedItemType(index,missionpack) == c.IT_HOLDABLE and resolvedItemTag(index,missionpack) == holdable then return index end if
  end for
  return error(497,"HoldableItem not found")
end function

/// Apply `mq3.game.bg_misc_runtime.itemLimit`, `mq3.game.bg_misc_runtime.resolvedItemType` and `mq3.game.bg_misc_runtime.resolvedItemTag` while evaluating `BG_FindItemForWeapon`.
/// @param weapon Weapon identifier used by the action or inventory lookup.
/// @param missionpack Whether Team Arena rules and definitions are active.
function BG_FindItemForWeapon(weapon,missionpack)
  for index = 1 to itemLimit(missionpack)-1
    if resolvedItemType(index,missionpack) == c.IT_WEAPON and resolvedItemTag(index,missionpack) == weapon then return index end if
  end for
  return error(497,"Couldn't find item for weapon " + str(weapon))
end function

/// Apply `mq3.game.bg_misc_runtime.pickupNames` while evaluating `BG_FindItem`.
/// @param pickupName Value passed as argument 2 to `std.string.equalsIgnoreCaseAscii`.
/// @param missionpack Whether Team Arena rules and definitions are active.
function BG_FindItem(pickupName,missionpack)
  names = pickupNames(missionpack)
  for index = 1 to len(names)-1
    if strings.equalsIgnoreCaseAscii(names[index],pickupName) then return index end if
  end for
  return 0
end function

/// Update `ps.events[slot]`, `ps.eventParms[slot]` and `ps.eventSequence` during `BG_AddPredictableEventToPlayerstate`.
/// @param event Player or entity event identifier.
/// @param parm Integer parameter stored alongside the emitted event.
/// @param ps Player movement state; accesses `eventSequence`, `events` and `eventParms`. May update `ps.events[slot]`, `ps.eventParms[slot]` and `ps.eventSequence` in place.
function BG_AddPredictableEventToPlayerstate(event,parm,ps)
  slot = ps.eventSequence & 1
  ps.events[slot] = event; ps.eventParms[slot] = parm
  ps.eventSequence = n.add32(ps.eventSequence,1)
  return void
end function

/// Forward `BG_CanItemBeGrabbed` to `mq3.game.items.canGrab` and return the delegated result.
/// @param gametype Value used by `canGrab` in `if gametype == 7 then return true end if`.
/// @param ent Game entity; accesses `s`.
/// @param ps Items state; accesses `ammo`, `stats`, `persistant` and `powerups`.
function BG_CanItemBeGrabbed(gametype,ent,ps) return items.canGrab(gametype,ent,ps) end function
/// Forward `BG_EvaluateTrajectory` to `mq3.game.trajectory.evaluate` and return the delegated result.
/// @param tr Trajectory record containing type, base position, velocity, start time and duration.
/// @param atTime Game time in milliseconds at which the trajectory is evaluated.
function BG_EvaluateTrajectory(tr,atTime) return trajectory.evaluate(tr,atTime) end function
/// Forward `BG_EvaluateTrajectoryDelta` to `mq3.game.trajectory.evaluateDelta` and return the delegated result.
/// @param tr Trajectory record containing type, velocity, start time and duration.
/// @param atTime Game time in milliseconds at which the trajectory is evaluated.
function BG_EvaluateTrajectoryDelta(tr,atTime) return trajectory.evaluateDelta(tr,atTime) end function
/// Forward `BG_PlayerStateToEntityState` to `mq3.game.snapshot.fromPlayer` and return the delegated result.
/// @param ps Player movement state; accesses `pm_type`, `stats`, `clientNum`, `origin` and `velocity` and related fields. May update `ps.entityEventSequence` in place.
/// @param state S record; accesses `eType`, `number`, `pos`, `apos` and `angles2` and related fields. May update `state.eType`, `state.number` and `state.pos.trType` and additional fields in place.
/// @param snap Value used by `convert` in `if snap then snapVector(s.pos.trBase) end if`.
function BG_PlayerStateToEntityState(ps,state,snap) return snapshot.fromPlayer(ps,state,snap) end function
/// Forward `BG_PlayerStateToEntityStateExtraPolate` to `mq3.game.snapshot.extrapolate` and return the delegated result.
/// @param ps Player movement state; accesses `pm_type`, `stats`, `clientNum`, `origin` and `velocity` and related fields. May update `ps.entityEventSequence` in place.
/// @param state S record; accesses `eType`, `number`, `pos`, `apos` and `angles2` and related fields. May update `state.eType`, `state.number` and `state.pos.trType` and additional fields in place.
/// @param time Time value in the units expected by this module.
/// @param snap Value used by `convert` in `if snap then snapVector(s.pos.trBase) end if`.
function BG_PlayerStateToEntityStateExtraPolate(ps,state,time,snap) return snapshot.extrapolate(ps,state,time,snap) end function
/// Forward `BG_PlayerTouchesItem` to `mq3.game.trajectory.playerTouchesItem` and return the delegated result.
/// @param ps Player movement state; accesses `origin`.
/// @param item Item record; accesses `pos`.
/// @param atTime Game time in milliseconds at which the trajectory is evaluated.
function BG_PlayerTouchesItem(ps,item,atTime) return trajectory.playerTouchesItem(ps,item.pos,atTime) end function
/// Forward `BG_TouchJumpPad` to `mq3.game.jumppad.touch` and return the delegated result.
/// @param ps Player movement state; accesses `pm_type`, `powerups`, `jumppad_ent`, `eventSequence` and `events` and related fields. May update `ps.events[slot]`, `ps.eventParms[slot]` and `ps.eventSequence` and additional fields in place.
/// @param item Item record; accesses `number` and `origin2`.
function BG_TouchJumpPad(ps,item) return jumppad.touch(ps,item.number,item.origin2) end function
