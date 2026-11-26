// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// target_location/info_camp goals from code/botlib/be_ai_goal.c.
package mq3.botlib.ai_map_goals

import mq3.botlib.internal_headers as botlibHeaders
import mq3.botlib.aas_runtime as aasRuntime
import mq3.botlib.ai_resource_pools as resources
import mq3.compat.textnumbers as numbers
import std.string as strings

/// Bot-library syscall identifier for get next camp spot goal.
const OP_GET_NEXT_CAMP_SPOT_GOAL=567
/// Bot-library syscall identifier for get map location goal.
const OP_GET_MAP_LOCATION_GOAL=568
/// Maximum character capacity of a BSP entity key or value.
const MAX_EPAIRKEY=botlibHeaders.MAX_EPAIRKEY

/// `MapLocation` record for ai map goals, containing `name` and `goal`.
struct MapLocation
  /// Map-authored name used to find this location goal.
  name
  /// Bot goal record describing the location to reach.
  goal
end struct
/// `CampSpot` record for ai map goals, containing `name`, `range`, `weight`, `wait` and `random` and related fields.
struct CampSpot
  /// Map-authored name identifying this camp spot.
  name
  /// Distance range associated with the camp spot.
  range
  /// Configured desirability weight of this map camp spot.
  weight
  /// Configured waiting interval before the operation or camp behavior continues.
  wait
  /// Random waiting-time variation configured for the camp spot.
  random
  /// Bot goal record describing the location to reach.
  goal
end struct
/// `State` record for ai map goals, containing `aas`, `bspEntities`, `locations`, `campSpots` and `initialized`.
struct State
  /// AAS navigation runtime used for area and route queries.
  aas
  /// Parsed key/value definitions from the BSP entity lump.
  bspEntities
  /// Named map-location goals parsed from BSP entities.
  locations
  /// Camp goals parsed from BSP entities.
  campSpots
  /// True after map locations and camp spots have been collected.
  initialized
end struct
/// `CampResult` record for ai map goals, containing `next` and `goal`.
struct CampResult
  /// Enumeration index to use when requesting the following camp goal.
  next
  /// Bot goal record describing the location to reach.
  goal
end struct

/// Create a `mq3.botlib.ai_map_goals.State` record with the declared empty defaults.
function create() return State(void,[],[],[],false) end function
/// Look up a map-entity key and return a found flag with the corresponding text.
/// @param entity Value used by `epair` in `if entity==void then return [false,""] end if`.
/// @param key Lookup text matched against `pair[0]`.
function epair(entity,key)
  if entity==void then return [false,""] end if;for each pair in entity if pair[0]==key then return [true,pair[1]] end if end for;return [false,""]
end function
/// Truncate entity-key text to the maximum epair buffer size minus its terminator.
/// @param value Value passed as argument 1 to `bytes`.
function bounded(value)
  data=bytes(value);count=len(data);if count>=MAX_EPAIRKEY then count=MAX_EPAIRKEY-1 end if;return decode(slice(data,0,count))
end function
/// Apply `mq3.botlib.ai_map_goals.epair` while evaluating `vectorValue`. Return paths include `parsed[1]`.
/// @param entity Value used by `epair` in `if entity==void then return [false,""] end if`.
/// @param key Lookup key or field name used by the operation.
function vectorValue(entity,key)
  pair=epair(entity,key);if not pair[0] then return [0.0,0.0,0.0] end if;parsed=numbers.vector(pair[1],[0.0,0.0,0.0]);if parsed[0]!=3 then return [0.0,0.0,0.0] end if;return parsed[1]
end function
/// Apply `mq3.botlib.ai_map_goals.epair` while evaluating `floatValue`. Return paths include `numbers.atof32(pair[1])`.
/// @param entity Value used by `epair` in `if entity==void then return [false,""] end if`.
/// @param key Lookup key or field name used by the operation.
function floatValue(entity,key) pair=epair(entity,key);if not pair[0] then return 0.0 end if;return numbers.atof32(pair[1]) end function
/// Build the `mq3.botlib.ai_resource_pools.Goal` result for `goalAt`.
/// @param aas AAS runtime; accesses `initialized`, `map`, `nodeCache` and `planeCache`. May update `aas.nodeCache[nodeNum]` and `aas.planeCache[node.planeNum]` in place.
/// @param origin World-space position as three coordinates.
function goalAt(aas,origin)
  area=0;if aas!=void then area=aasRuntime.pointAreaNum(aas,origin) end if
  return resources.Goal([origin[0],origin[1],origin[2]],area,[-8.0,-8.0,-8.0],[8.0,8.0,8.0],0,0,0,0)
end function
/// Update `state.aas`, `state.bspEntities`, `state.locations` and `state.campSpots` and related state during `initialize`. Return paths include `[len(state.locations),len(state.campSpots)]`.
/// @param state AI map goals state; accesses `aas`, `bspEntities`, `locations`, `campSpots` and `initialized`. May update `state.aas`, `state.bspEntities` and `state.locations` and additional fields in place.
/// @param aas AAS runtime; accesses `initialized`, `map`, `nodeCache` and `planeCache`. May update `aas.nodeCache[nodeNum]` and `aas.planeCache[node.planeNum]` in place.
/// @param bspEntities Array or byte sequence accessed at `entityNum`.
function initialize(state,aas,bspEntities)
  if state==void then return error(7602,"AI map goals: state missing") end if;state.aas=aas;state.bspEntities=bspEntities;state.locations=[];state.campSpots=[]
  if bspEntities==void then state.initialized=true;return [0,0] end if
  for entityNum=1 to len(bspEntities)-1
    entity=bspEntities[entityNum];classname=epair(entity,"classname");if not classname[0] then continue end if
    if classname[1]=="target_location" then origin=vectorValue(entity,"origin");message=epair(entity,"message");name="";if message[0] then name=bounded(message[1]) end if;state.locations=[MapLocation(name,goalAt(aas,origin))]+state.locations
    else if classname[1]=="info_camp" then
      origin=vectorValue(entity,"origin");goal=goalAt(aas,origin)
      if goal.areaNum!=0 then message=epair(entity,"message");name="";if message[0] then name=bounded(message[1]) end if;state.campSpots=[CampSpot(name,floatValue(entity,"range"),floatValue(entity,"weight"),floatValue(entity,"wait"),floatValue(entity,"random"),goal)]+state.campSpots end if
    end if
  end for;state.initialized=true;return [len(state.locations),len(state.campSpots)]
end function
/// Update `state.aas`, `state.bspEntities`, `state.locations` and `state.campSpots` and related state during `clear`.
/// @param state AI map goals state; accesses `aas`, `bspEntities`, `locations`, `campSpots` and `initialized`. May update `state.aas`, `state.bspEntities` and `state.locations` and additional fields in place.
function clear(state) if state!=void then state.aas=void;state.bspEntities=[];state.locations=[];state.campSpots=[];state.initialized=false end if;return 0 end function
/// Build the `mq3.botlib.ai_map_goals.CampResult` result for `nextCampSpotGoal`. Return paths include `CampResult(number+1,state.campSpots[index].goal)`.
/// @param state AI map goals state; accesses `campSpots`.
/// @param number Operand used to evaluate the returned expression `CampResult(number+1,state.campSpots[index].goal)`.
function nextCampSpotGoal(state,number)
  if state==void then return CampResult(0,void) end if;if number<0 then number=0 end if
  index=number;if index<0 or index>=len(state.campSpots) then return CampResult(0,void) end if;return CampResult(number+1,state.campSpots[index].goal)
end function
/// Find a named map-location goal using an ASCII case-insensitive comparison.
/// @param state AI map goals state; accesses `locations`.
/// @param name Name used to identify the requested entry.
function mapLocationGoal(state,name)
  if state==void then return void end if;wanted=strings.toLowerAscii(name);for each location in state.locations if strings.toLowerAscii(location.name)==wanted then return location.goal end if end for;return void
end function
/// Test `op==OP_GET_NEXT_CAMP_SPOT_GOAL or op==OP_GET_MAP_LOCATION_GOAL` as the condition for `supportsTrap`.
/// @param op Numeric syscall operation identifier.
function supportsTrap(op) return op==OP_GET_NEXT_CAMP_SPOT_GOAL or op==OP_GET_MAP_LOCATION_GOAL end function
