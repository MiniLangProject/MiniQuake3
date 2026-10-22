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

function itemLimit(missionpack)
  if missionpack then return len(tables.missionpackItems()) end if
  return len(tables.items())
end function

function resolvedItemType(index,missionpack)
  if missionpack then return c.missionpackItemType(index) end if
  return c.itemType(index)
end function

function resolvedItemTag(index,missionpack)
  if missionpack then return c.missionpackItemTag(index) end if
  return c.itemTag(index)
end function

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

function BG_FindItemForPowerup(powerup,missionpack)
  for index = 0 to itemLimit(missionpack)-1
    kind = resolvedItemType(index,missionpack)
    if (kind == c.IT_POWERUP or kind == c.IT_TEAM or kind == c.IT_PERSISTANT_POWERUP) and resolvedItemTag(index,missionpack) == powerup then return index end if
  end for
  return 0
end function

function BG_FindItemForHoldable(holdable,missionpack)
  for index = 0 to itemLimit(missionpack)-1
    if resolvedItemType(index,missionpack) == c.IT_HOLDABLE and resolvedItemTag(index,missionpack) == holdable then return index end if
  end for
  return error(497,"HoldableItem not found")
end function

function BG_FindItemForWeapon(weapon,missionpack)
  for index = 1 to itemLimit(missionpack)-1
    if resolvedItemType(index,missionpack) == c.IT_WEAPON and resolvedItemTag(index,missionpack) == weapon then return index end if
  end for
  return error(497,"Couldn't find item for weapon " + str(weapon))
end function

function BG_FindItem(pickupName,missionpack)
  names = pickupNames(missionpack)
  for index = 1 to len(names)-1
    if strings.equalsIgnoreCaseAscii(names[index],pickupName) then return index end if
  end for
  return 0
end function

function BG_AddPredictableEventToPlayerstate(event,parm,ps)
  slot = ps.eventSequence & 1
  ps.events[slot] = event; ps.eventParms[slot] = parm
  ps.eventSequence = n.add32(ps.eventSequence,1)
  return void
end function

function BG_CanItemBeGrabbed(gametype,ent,ps) return items.canGrab(gametype,ent,ps) end function
function BG_EvaluateTrajectory(tr,atTime) return trajectory.evaluate(tr,atTime) end function
function BG_EvaluateTrajectoryDelta(tr,atTime) return trajectory.evaluateDelta(tr,atTime) end function
function BG_PlayerStateToEntityState(ps,state,snap) return snapshot.fromPlayer(ps,state,snap) end function
function BG_PlayerStateToEntityStateExtraPolate(ps,state,time,snap) return snapshot.extrapolate(ps,state,time,snap) end function
function BG_PlayerTouchesItem(ps,item,atTime) return trajectory.playerTouchesItem(ps,item.pos,atTime) end function
function BG_TouchJumpPad(ps,item) return jumppad.touch(ps,item.number,item.origin2) end function
