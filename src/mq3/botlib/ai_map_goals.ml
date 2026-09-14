// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// target_location/info_camp goals from code/botlib/be_ai_goal.c.
package mq3.botlib.ai_map_goals

import mq3.botlib.aas_runtime as aasRuntime
import mq3.botlib.ai_resource_pools as resources
import mq3.compat.textnumbers as numbers
import std.string as strings

const OP_GET_NEXT_CAMP_SPOT_GOAL=567
const OP_GET_MAP_LOCATION_GOAL=568
const MAX_EPAIRKEY=144

struct MapLocation name goal end struct
struct CampSpot name range weight wait random goal end struct
struct State aas bspEntities locations campSpots initialized end struct
struct CampResult next goal end struct

function create() return State(void,[],[],[],false) end function
function epair(entity,key)
  if entity==void then return [false,""] end if;for each pair in entity if pair[0]==key then return [true,pair[1]] end if end for;return [false,""]
end function
function bounded(value)
  data=bytes(value);count=len(data);if count>=MAX_EPAIRKEY then count=MAX_EPAIRKEY-1 end if;return decode(slice(data,0,count))
end function
function vectorValue(entity,key)
  pair=epair(entity,key);if not pair[0] then return [0.0,0.0,0.0] end if;parsed=numbers.vector(pair[1],[0.0,0.0,0.0]);if parsed[0]!=3 then return [0.0,0.0,0.0] end if;return parsed[1]
end function
function floatValue(entity,key) pair=epair(entity,key);if not pair[0] then return 0.0 end if;return numbers.atof32(pair[1]) end function
function goalAt(aas,origin)
  area=0;if aas!=void then area=aasRuntime.pointAreaNum(aas,origin) end if
  return resources.Goal([origin[0],origin[1],origin[2]],area,[-8.0,-8.0,-8.0],[8.0,8.0,8.0],0,0,0,0)
end function
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
function clear(state) if state!=void then state.aas=void;state.bspEntities=[];state.locations=[];state.campSpots=[];state.initialized=false end if;return 0 end function
function nextCampSpotGoal(state,number)
  if state==void then return CampResult(0,void) end if;if number<0 then number=0 end if
  index=number;if index<0 or index>=len(state.campSpots) then return CampResult(0,void) end if;return CampResult(number+1,state.campSpots[index].goal)
end function
function mapLocationGoal(state,name)
  if state==void then return void end if;wanted=strings.toLowerAscii(name);for each location in state.locations if strings.toLowerAscii(location.name)==wanted then return location.goal end if end for;return void
end function
function supportsTrap(op) return op==OP_GET_NEXT_CAMP_SPOT_GOAL or op==OP_GET_MAP_LOCATION_GOAL end function
