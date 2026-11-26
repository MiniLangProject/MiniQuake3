// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Spawn selection from g_client.c, g_team.c and FindIntermissionPoint.
package mq3.game.player_spawns
import mq3.game.entities as game
import mq3.game.movement as movement
import mq3.server.world as sv
import mq3.shared.math as q
import mq3.compat.numeric as n
import std.string as strings
/// Find the next active entity with a case-insensitive class-name match for player spawns.
/// @param level Game-level state; accesses `num_entities` and `entities`.
/// @param after After record; accesses `slot`.
/// @param name Name used to identify the requested entry.
function findClass(level,after,name)
  index = 0
  if after != void then index = after.slot+1 end if
  while index < level.num_entities
    ent = level.entities[index]; index = index+1
    if ent.inuse and ent.classname != void and strings.equalsIgnoreCaseAscii(ent.classname,name) then return ent end if
  end while
  return void
end function
/// Apply `mq3.server.world.areaEntities` while evaluating `wouldTelefrag`.
/// @param level Game-level state; accesses `scene` and `entities`.
/// @param spot Spot record; accesses `s`.
function wouldTelefrag(level,spot)
  mins = [-15.0,-15.0,-24.0]; maxs = [15.0,15.0,32.0]
  for axis = 0 to 2
    mins[axis] = n.fadd(spot.s.origin[axis],mins[axis]); maxs[axis] = n.fadd(spot.s.origin[axis],maxs[axis])
  end for
  for each slot in sv.areaEntities(level.scene,mins,maxs,1024)
    if level.entities[slot].client != void then return true end if
  end for
  return false
end function
/// Measure Euclidean distance from a player spawn point to a world-space point.
/// @param spot Spot record; accesses `s`.
/// @param point Three-component point used by the geometric query.
function distanceFrom(spot,point)
  delta = [0.0,0.0,0.0]
  for axis = 0 to 2
    delta[axis] = n.fsub(spot.s.origin[axis],point[axis])
  end for
  return q.VectorLength(delta)
end function
/// Apply `mq3.game.player_spawns.findClass` and `mq3.game.player_spawns.distanceFrom` while evaluating `nearest`.
/// @param level Game-level state; accesses `num_entities` and `entities`.
/// @param point Three-component point used by the geometric query.
function nearest(level,point)
  nearestDist = 999999.0; result = void; spot = void
  while true
    spot = findClass(level,spot,"info_player_deathmatch")
    if spot == void then break end if
    distance = distanceFrom(spot,point)
    if distance < nearestDist then nearestDist = distance; result = spot end if
  end while
  return result
end function
/// Apply `mq3.game.player_spawns.findClass`, `mq3.game.player_spawns.wouldTelefrag` and `mq3.game.entities.random` while evaluating `randomDeathmatch`. Return paths include `spots[game.random(level) % len(spots)]`.
/// @param level Game-level state; accesses `num_entities` and `entities`.
function randomDeathmatch(level)
  spots = []; spot = void
  while true
    spot = findClass(level,spot,"info_player_deathmatch")
    if spot == void then break end if
    if wouldTelefrag(level,spot) then continue end if
    if len(spots) == 128 then return error(493,"Original deathmatch spawn array would overflow") end if
    spots = spots+[spot]
  end while
  if len(spots) == 0 then return findClass(level,void,"info_player_deathmatch") end if
  return spots[game.random(level) % len(spots)]
end function
/// Update `origin[axis]`, `angles[axis]` and `origin[2]` during `spawnResult`. Return paths include `spot`.
/// @param spot Spot record; accesses `s`.
/// @param origin World-space position as three coordinates. Entries may be updated in place.
/// @param angles Pitch, yaw and roll angles in degrees. Entries may be updated in place.
function spawnResult(spot,origin,angles)
  if spot == void then return error(493,"Couldn't find a spawn point") end if
  for axis = 0 to 2
    origin[axis] = spot.s.origin[axis]; angles[axis] = spot.s.angles[axis]
  end for
  origin[2] = n.fadd(origin[2],9.0)
  return spot
end function
/// Apply `mq3.game.player_spawns.findClass`, `mq3.game.player_spawns.wouldTelefrag` and `mq3.game.player_spawns.distanceFrom` while evaluating `furthest`. Return paths include `spawnResult(spots[rnd],origin,angles)`.
/// @param level Game-level state; accesses `num_entities` and `entities`.
/// @param avoid Three-component point used by the geometric query.
/// @param origin World-space position as three coordinates.
/// @param angles Pitch, yaw and roll angles in degrees.
function furthest(level,avoid,origin,angles)
  spots = array(64,0); distances = array(64,0.0); count = 0; spot = void
  while true
    spot = findClass(level,spot,"info_player_deathmatch")
    if spot == void then break end if
    if wouldTelefrag(level,spot) then continue end if
    distance = distanceFrom(spot,avoid); i = 0
    while i < count
      if distance > distances[i] then
        if count >= 64 then count = 63 end if
        j = count
        while j > i
          distances[j] = distances[j-1]; spots[j] = spots[j-1]; j = j-1
        end while
        distances[i] = distance; spots[i] = spot; count = count+1
        if count > 64 then count = 64 end if
        break
      end if
      i = i+1
    end while
    if i >= count and count < 64 then distances[count] = distance; spots[count] = spot; count = count+1 end if
  end while
  if count == 0 then return spawnResult(findClass(level,void,"info_player_deathmatch"),origin,angles) end if
  // random() can be exactly 1; numSpots / 2 is C integer division.
  rnd = n.trunc32(n.fmul(n.fdiv(game.random(level) & 32767,32767.0),count >> 1))
  return spawnResult(spots[rnd],origin,angles)
end function
/// Forward `selectSpawn` to `mq3.game.player_spawns.furthest` and return the delegated result.
/// @param level Game-level state; accesses `num_entities` and `entities`.
/// @param avoid Three-component point used by the geometric query.
/// @param origin World-space position as three coordinates.
/// @param angles Pitch, yaw and roll angles in degrees.
function selectSpawn(level,avoid,origin,angles)
  return furthest(level,avoid,origin,angles)
end function
/// Apply `mq3.game.player_spawns.findClass`, `mq3.game.player_spawns.selectSpawn` and `mq3.game.player_spawns.wouldTelefrag` while evaluating `initial`. Return paths include `spawnResult(spot,origin,angles)`.
/// @param level Game-level state; accesses `num_entities` and `entities`.
/// @param origin World-space position as three coordinates.
/// @param angles Pitch, yaw and roll angles in degrees.
function initial(level,origin,angles)
  spot = void
  while true
    spot = findClass(level,spot,"info_player_deathmatch")
    if spot == void then break end if
    if (spot.spawnflags & 1) != 0 then break end if
  end while
  if spot == void then return selectSpawn(level,[0.0,0.0,0.0],origin,angles) end if
  if wouldTelefrag(level,spot) then return selectSpawn(level,[0.0,0.0,0.0],origin,angles) end if
  return spawnResult(spot,origin,angles)
end function
/// Apply `mq3.game.player_spawns.findClass`, `mq3.game.player_spawns.wouldTelefrag` and `mq3.game.entities.random` while evaluating `randomTeam`. Return paths include `spots[game.random(level) % len(spots)]`.
/// @param level Game-level state; accesses `num_entities` and `entities`.
/// @param teamstate Value used by `randomTeam` in `if teamstate == 0 then`.
/// @param team Team identifier used by the game rules.
function randomTeam(level,teamstate,team)
  name = ""
  if team != 1 and team != 2 then return void end if
  if teamstate == 0 then
    if team == 1 then name = "team_CTF_redplayer" else name = "team_CTF_blueplayer" end if
  else
    if team == 1 then name = "team_CTF_redspawn" else name = "team_CTF_bluespawn" end if
  end if
  spots = []; spot = void
  while true
    spot = findClass(level,spot,name)
    if spot == void then break end if
    if wouldTelefrag(level,spot) then continue end if
    spots = spots+[spot]
    if len(spots) == 32 then break end if
  end while
  if len(spots) == 0 then return findClass(level,void,name) end if
  return spots[game.random(level) % len(spots)]
end function
/// Apply `mq3.game.player_spawns.randomTeam`, `mq3.game.player_spawns.selectSpawn` and `mq3.game.player_spawns.spawnResult` while evaluating `ctf`. Return paths include `spawnResult(spot,origin,angles)`.
/// @param level Game-level state; accesses `num_entities` and `entities`.
/// @param team Team identifier used by the game rules.
/// @param teamstate Value used by `randomTeam` in `if teamstate == 0 then`.
/// @param origin World-space position as three coordinates.
/// @param angles Pitch, yaw and roll angles in degrees.
function ctf(level,team,teamstate,origin,angles)
  spot = randomTeam(level,teamstate,team)
  if spot == void then return selectSpawn(level,[0.0,0.0,0.0],origin,angles) end if
  return spawnResult(spot,origin,angles)
end function
/// Update `level.intermission_origin` and `level.intermission_angle` during `findIntermission`.
/// @param level Game-level state; accesses `intermission_origin` and `intermission_angle`. May update `level.intermission_origin` and `level.intermission_angle` in place.
function findIntermission(level)
  ent = findClass(level,void,"info_player_intermission")
  if ent == void then
    selectSpawn(level,[0.0,0.0,0.0],level.intermission_origin,level.intermission_angle)
  else
    level.intermission_origin = movement.copy(ent.s.origin); level.intermission_angle = movement.copy(ent.s.angles)
    if ent.target != void then
      target = game.pickTarget(level,ent.target)
      if target != void then
        dir = [0.0,0.0,0.0]
        for axis = 0 to 2
          dir[axis] = n.fsub(target.s.origin[axis],level.intermission_origin[axis])
        end for
        level.intermission_angle = q.vectoangles(dir)
      end if
    end if
  end if
  return void
end function
/// Set `origin[axis]` to `level.intermission_origin[axis]` and `angles[axis]` to `level.intermission_angle[axis]` in `mq3.game.player_spawns.spectator`.
/// @param level Game-level state; accesses `intermission_origin` and `intermission_angle`.
/// @param origin World-space position as three coordinates. Entries may be updated in place.
/// @param angles Pitch, yaw and roll angles in degrees. Entries may be updated in place.
function spectator(level,origin,angles)
  findIntermission(level)
  for axis = 0 to 2
    origin[axis] = level.intermission_origin[axis]; angles[axis] = level.intermission_angle[axis]
  end for
  return void
end function
