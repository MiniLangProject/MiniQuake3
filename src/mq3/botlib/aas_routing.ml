// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Weighted AAS routing semantics from code/botlib/be_aas_route.c.
package mq3.botlib.aas_routing

import mq3.botlib.public_headers as publicHeaders
import mq3.format.aas as aas
import mq3.botlib.aas_runtime as rt

/// Mask selecting the movement-type identifier from an encoded AAS travel type.
const TRAVELTYPE_MASK=0xffffff
/// Additional AAS travel restriction for team-one restriction.
const TRAVELFLAG_NOTTEAM1=0x01000000
/// Additional AAS travel restriction for team-two restriction.
const TRAVELFLAG_NOTTEAM2=0x02000000
/// AAS travel-type value for a reachability that cannot currently be traversed.
const TRAVEL_INVALID=1
/// AAS movement-type identifier for walk.
const TRAVEL_WALK=2
/// AAS movement-type identifier for crouch.
const TRAVEL_CROUCH=3
/// Jumping onto a barrier.
const TRAVEL_BARRIERJUMP=4
/// AAS movement-type identifier for jump.
const TRAVEL_JUMP=5
/// Climbing a ladder.
const TRAVEL_LADDER=6
/// Walking of a ledge.
const TRAVEL_WALKOFFLEDGE=7
/// AAS movement-type identifier for swim.
const TRAVEL_SWIM=8
/// Jump out of the water.
const TRAVEL_WATERJUMP=9
/// AAS movement-type identifier for teleport.
const TRAVEL_TELEPORT=10
/// Travel by elevator.
const TRAVEL_ELEVATOR=11
/// Rocket jumping required for travel.
const TRAVEL_ROCKETJUMP=12
/// Bfg jumping required for travel.
const TRAVEL_BFGJUMP=13
/// Grappling hook required for travel.
const TRAVEL_GRAPPLEHOOK=14
/// AAS movement-type identifier for double jump.
const TRAVEL_DOUBLEJUMP=15
/// AAS movement-type identifier for ramp jump.
const TRAVEL_RAMPJUMP=16
/// AAS movement-type identifier for strafe jump.
const TRAVEL_STRAFEJUMP=17
/// AAS movement-type identifier for jump pad.
const TRAVEL_JUMPPAD=18
/// AAS movement-type identifier for bobbing mover.
const TRAVEL_FUNCBOB=19

/// Traveling temporary not possible.
const TFL_INVALID=publicHeaders.TFL_INVALID
/// AAS route-permission bit for walk.
const TFL_WALK=publicHeaders.TFL_WALK
/// AAS route-permission bit for crouch.
const TFL_CROUCH=publicHeaders.TFL_CROUCH
/// Jumping onto a barrier.
const TFL_BARRIERJUMP=publicHeaders.TFL_BARRIERJUMP
/// AAS route-permission bit for jump.
const TFL_JUMP=publicHeaders.TFL_JUMP
/// Climbing a ladder.
const TFL_LADDER=publicHeaders.TFL_LADDER
/// Walking of a ledge.
const TFL_WALKOFFLEDGE=publicHeaders.TFL_WALKOFFLEDGE
/// AAS route-permission bit for swim.
const TFL_SWIM=publicHeaders.TFL_SWIM
/// Jumping out of the water.
const TFL_WATERJUMP=publicHeaders.TFL_WATERJUMP
/// AAS route-permission bit for teleport.
const TFL_TELEPORT=publicHeaders.TFL_TELEPORT
/// AAS route-permission bit for elevator.
const TFL_ELEVATOR=publicHeaders.TFL_ELEVATOR
/// AAS route-permission bit for rocket jump.
const TFL_ROCKETJUMP=publicHeaders.TFL_ROCKETJUMP
/// AAS route-permission bit for BFG jump.
const TFL_BFGJUMP=publicHeaders.TFL_BFGJUMP
/// AAS route-permission bit for grappling hook.
const TFL_GRAPPLEHOOK=publicHeaders.TFL_GRAPPLEHOOK
/// AAS route-permission bit for double jump.
const TFL_DOUBLEJUMP=publicHeaders.TFL_DOUBLEJUMP
/// AAS route-permission bit for ramp jump.
const TFL_RAMPJUMP=publicHeaders.TFL_RAMPJUMP
/// AAS route-permission bit for strafe jump.
const TFL_STRAFEJUMP=publicHeaders.TFL_STRAFEJUMP
/// AAS route-permission bit for jump pad.
const TFL_JUMPPAD=publicHeaders.TFL_JUMPPAD
/// Travel through air.
const TFL_AIR=publicHeaders.TFL_AIR
/// Travel through water.
const TFL_WATER=publicHeaders.TFL_WATER
/// Travel through slime.
const TFL_SLIME=publicHeaders.TFL_SLIME
/// Travel through lava.
const TFL_LAVA=publicHeaders.TFL_LAVA
/// Travel through donotenter area.
const TFL_DONOTENTER=publicHeaders.TFL_DONOTENTER
/// AAS route-permission bit for bobbing mover.
const TFL_FUNCBOB=publicHeaders.TFL_FUNCBOB
/// AAS route-permission bit for flight.
const TFL_FLIGHT=publicHeaders.TFL_FLIGHT
/// Move over a bridge.
const TFL_BRIDGE=publicHeaders.TFL_BRIDGE
/// AAS travel restriction marking an area or reachability unavailable to team one.
const TFL_NOTTEAM1=publicHeaders.TFL_NOTTEAM1
/// AAS travel restriction marking an area or reachability unavailable to team two.
const TFL_NOTTEAM2=publicHeaders.TFL_NOTTEAM2
/// Combined mask of the travel permissions enabled for an ordinary bot route.
const TFL_DEFAULT=publicHeaders.TFL_DEFAULT

/// AAS area-contents bit marking water.
const AREACONTENTS_WATER=1
/// AAS area-contents bit marking lava.
const AREACONTENTS_LAVA=2
/// AAS area-contents bit marking slime.
const AREACONTENTS_SLIME=4
/// AAS area-contents bit marking do-not-enter area.
const AREACONTENTS_DONOTENTER=256
/// AAS area-contents bit marking team-one restriction.
const AREACONTENTS_NOTTEAM1=2048
/// AAS area-contents bit marking team-two restriction.
const AREACONTENTS_NOTTEAM2=4096
/// Area contains a liquid.
const AREA_LIQUID=4
/// Area ontop of a bridge.
const AREA_BRIDGE=16

/// `Router` record for aas routing, containing `runtime`, `settings`, `reaches`, `travelTypeFlags` and `areaFlags`.
struct Router
  /// AAS geometry and area-availability runtime used by route searches.
  runtime
  /// Area or runtime settings controlling navigation behavior.
  settings
  /// Reachability records and their source areas used by route searches.
  reaches
  /// Mapping from travel-type identifiers to required route-permission masks.
  travelTypeFlags
  /// Per-area travel-permission masks derived from area contents.
  areaFlags
end struct
/// `Route` record for aas routing, containing `travelTime` and `reachNum`.
struct Route
  /// AAS travel cost assigned to traversing this movement link.
  travelTime
  /// First reachability selected along the calculated route.
  reachNum
end struct
/// `Heap` record for aas routing, containing `times`, `reaches`, `firstReaches`, `positions` and `size`.
struct Heap
  /// Travel costs stored in the route-search priority queue.
  times
  /// Reachability indexes associated with queued search entries.
  reaches
  /// First-hop reachability retained for each queued route.
  firstReaches
  /// Lookup from queued items to their current heap positions.
  positions
  /// Number of routing candidates currently stored in the priority heap.
  size
end struct

/// Construct error `7530` with diagnostic text `"AAS routing: "+message`.
/// @param message Message text supplied to the diagnostic or chat operation.
function fail(message) return error(7530,"AAS routing: "+message) end function
/// Build routing settings, reachability records and travel masks from an initialized AAS map.
/// @param runtime AAS routing runtime; accesses `initialized` and `map`.
function create(runtime)
  if runtime==void or not runtime.initialized then return fail("runtime missing") end if
  areaCount=runtime.map.counts[aas.LUMP_AREAS];reachCount=runtime.map.counts[aas.LUMP_REACHABILITY]
  settings=array(areaCount,void);reaches=array(reachCount,void)
  if areaCount>0 then for index=0 to areaCount-1 value=aas.areaSettings(runtime.map,index);if value is error then return value end if;settings[index]=value end for end if
  if reachCount>0 then for index=0 to reachCount-1 value=aas.reachability(runtime.map,index);if value is error then return value end if;reaches[index]=value end for end if
  travelTypeFlags=[TFL_INVALID,TFL_INVALID,TFL_WALK,TFL_CROUCH,TFL_BARRIERJUMP,TFL_JUMP,TFL_LADDER,TFL_WALKOFFLEDGE,TFL_SWIM,TFL_WATERJUMP,TFL_TELEPORT,TFL_ELEVATOR,TFL_ROCKETJUMP,TFL_BFGJUMP,TFL_GRAPPLEHOOK,TFL_DOUBLEJUMP,TFL_RAMPJUMP,TFL_STRAFEJUMP,TFL_JUMPPAD,TFL_FUNCBOB]
  areaFlags=array(areaCount,0)
  for index=0 to areaCount-1 areaFlags[index]=contentsTravelFlags(settings[index]) end for
  return Router(runtime,settings,reaches,travelTypeFlags,areaFlags)
end function

/// Map the masked AAS travel type to its travel flag, returning TFL_INVALID for an out-of-range type.
/// @param travelType AAS reachability travel-type code.
function travelFlagForType(travelType)
  kind=travelType&TRAVELTYPE_MASK
  flags=[TFL_INVALID,TFL_INVALID,TFL_WALK,TFL_CROUCH,TFL_BARRIERJUMP,TFL_JUMP,TFL_LADDER,TFL_WALKOFFLEDGE,TFL_SWIM,TFL_WATERJUMP,TFL_TELEPORT,TFL_ELEVATOR,TFL_ROCKETJUMP,TFL_BFGJUMP,TFL_GRAPPLEHOOK,TFL_DOUBLEJUMP,TFL_RAMPJUMP,TFL_STRAFEJUMP,TFL_JUMPPAD,TFL_FUNCBOB]
  if kind<0 or kind>=len(flags) then return TFL_INVALID end if
  // The released Q3 routine masks these bits before lookup; team restrictions
  // are supplied by the destination area's contents flags below.
  return flags[kind]
end function
/// Translate AAS area contents into air, liquid, exclusion and team restriction travel flags.
/// @param value Value record; accesses `contents` and `flags`.
function contentsTravelFlags(value)
  contents=value.contents;flags=0
  if (contents&AREACONTENTS_WATER)!=0 then flags=TFL_WATER else if (contents&AREACONTENTS_SLIME)!=0 then flags=TFL_SLIME else if (contents&AREACONTENTS_LAVA)!=0 then flags=TFL_LAVA else flags=TFL_AIR end if
  if (contents&AREACONTENTS_DONOTENTER)!=0 then flags=flags|TFL_DONOTENTER end if
  if (contents&AREACONTENTS_NOTTEAM1)!=0 then flags=flags|TFL_NOTTEAM1 end if
  if (contents&AREACONTENTS_NOTTEAM2)!=0 then flags=flags|TFL_NOTTEAM2 end if
  if (value.flags&AREA_BRIDGE)!=0 then flags=flags|TFL_BRIDGE end if
  return flags
end function
/// Read the cached contents travel mask for an area, returning TFL_INVALID when the router or area is invalid.
/// @param router AAS routing state; accesses `settings` and `areaFlags`.
/// @param areaNum AAS area number; zero denotes no area.
function areaContentsTravelFlags(router,areaNum)
  if router==void or areaNum<0 or areaNum>=len(router.settings) then return TFL_INVALID end if
  return router.areaFlags[areaNum]
end function
/// Test `(required&travelFlags)==required` as the condition for `allowed`.
/// @param required Operand used to evaluate the returned expression `(required&travelFlags)==required`.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
function allowed(required,travelFlags) return (required&travelFlags)==required end function
/// Apply `mq3.botlib.aas_runtime.validArea` and `mq3.botlib.aas_routing.allowed` while evaluating `edgeAllowed`. Return paths include `allowed(required,travelFlags) and allowed(router.areaFlags[destination],travelFlags)`.
/// @param router AAS routing state; accesses `runtime`, `travelTypeFlags` and `areaFlags`.
/// @param reach AAS reachability record; accesses `areaNum` and `travelType`.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
function edgeAllowed(router,reach,travelFlags)
  destination=reach.areaNum
  if not rt.validArea(router.runtime,destination) or router.runtime.disabled[destination] then return false end if
  kind=reach.travelType&TRAVELTYPE_MASK;required=TFL_INVALID
  if kind>=0 and kind<len(router.travelTypeFlags) then required=router.travelTypeFlags[kind] end if
  return allowed(required,travelFlags) and allowed(router.areaFlags[destination],travelFlags)
end function
/// Calculate truncated scaled distance between two 3D points through the native routing helper.
/// @param ax Native `double` value forwarded in the `ax` argument of `scaledDistanceNative`.
/// @param ay Native `double` value forwarded in the `ay` argument of `scaledDistanceNative`.
/// @param az Native `double` value forwarded in the `az` argument of `scaledDistanceNative`.
/// @param bx Native `double` value forwarded in the `bx` argument of `scaledDistanceNative`.
/// @param by Native `double` value forwarded in the `by` argument of `scaledDistanceNative`.
/// @param bz Native `double` value forwarded in the `bz` argument of `scaledDistanceNative`.
/// @param scale Multiplier applied to the Euclidean distance before conversion to a signed integer.
/// @returns Scaled Euclidean distance truncated to the helper's signed 32-bit integer result.
extern function scaledDistanceNative(ax as double,ay as double,az as double,bx as double,by as double,bz as double,scale as double) from "miniquake3_abi.dll" symbol "mq3_scaled_distance3_trunc" returns i32

/// Apply `mq3.botlib.aas_runtime.validArea` and `mq3.botlib.aas_routing.scaledDistanceNative` while evaluating `areaTravelTime`.
/// @param router AAS routing state; accesses `runtime` and `settings`.
/// @param areaNum AAS area number; zero denotes no area.
/// @param start Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param finish Three-component array; components 0, 1 and 2 are used in their stored order.
function areaTravelTime(router,areaNum,start,finish)
  if router==void or not rt.validArea(router.runtime,areaNum) or start==void or finish==void or len(start)!=3 or len(finish)!=3 then return 0 end if
  settings=router.settings[areaNum];scale=0.33
  if (settings.presenceType&rt.PRESENCE_NORMAL)==0 then scale=1.3 else if (settings.flags&AREA_LIQUID)!=0 then scale=1.0 end if
  result=scaledDistanceNative(start[0],start[1],start[2],finish[0],finish[1],finish[2],scale)
  if result<=0 then return 1 end if;return result
end function

/// Create a `mq3.botlib.aas_routing.Heap` record, initializing `times` as `array(capacity+1,0)`, `reaches` as `array(capacity+1,0)` and `firstReaches` as `array(capacity+1,0)`.
/// @param capacity Maximum number of entries to allocate or retain.
function heapCreate(capacity) return Heap(array(capacity+1,0),array(capacity+1,0),array(capacity+1,0),array(capacity,0),0) end function
/// Order routing heap entries by travel time, breaking ties by reachability number.
/// @param heap Heap record; accesses `times` and `reaches`.
/// @param left Operand used to evaluate the returned expression `heap.times[left]<heap.times[right]`.
/// @param right Operand used to evaluate the returned expression `heap.times[left]<heap.times[right]`.
function heapLess(heap,left,right)
  if heap.times[left]!=heap.times[right] then return heap.times[left]<heap.times[right] end if
  return heap.reaches[left]<heap.reaches[right]
end function
/// Update `heap.times[left]`, `heap.times[right]`, `heap.reaches[left]` and `heap.reaches[right]` and related state during `heapSwap`.
/// @param heap Heap record; accesses `times`, `reaches`, `firstReaches` and `positions`. May update `heap.times[left]`, `heap.times[right]` and `heap.reaches[left]` and additional fields in place.
/// @param left Value used by `heapSwap` in `value=heap.times[left]`.
/// @param right Value used by `heapSwap` in `heap.times[left]=heap.times[right]`.
function heapSwap(heap,left,right)
  value=heap.times[left];heap.times[left]=heap.times[right];heap.times[right]=value
  value=heap.reaches[left];heap.reaches[left]=heap.reaches[right];heap.reaches[right]=value
  value=heap.firstReaches[left];heap.firstReaches[left]=heap.firstReaches[right];heap.firstReaches[right]=value
  heap.positions[heap.reaches[left]]=left;heap.positions[heap.reaches[right]]=right
end function
/// Update `heap.size`, `heap.reaches[position]`, `heap.positions[reachNum]` and `heap.times[position]` and related state during `heapPut`.
/// @param heap Heap record; accesses `positions`, `size`, `reaches`, `times` and `firstReaches`. May update `heap.size`, `heap.reaches[position]` and `heap.positions[reachNum]` and additional fields in place.
/// @param reachNum Value used by `heapPut` in `position=heap.positions[reachNum]`.
/// @param time Time value in the units expected by this module.
/// @param firstReach Value used by `heapPut` in `heap.firstReaches[position]=firstReach`.
function heapPut(heap,reachNum,time,firstReach)
  position=heap.positions[reachNum]
  if position==0 then heap.size=heap.size+1;position=heap.size;heap.reaches[position]=reachNum;heap.positions[reachNum]=position end if
  heap.times[position]=time;heap.firstReaches[position]=firstReach
  while position>1 parent=position>>1;if not heapLess(heap,position,parent) then return true end if;heapSwap(heap,position,parent);position=parent end while
  return true
end function
/// Update `heap.size`, `heap.times[1]`, `heap.reaches[1]` and `heap.firstReaches[1]` during `heapPop`.
/// @param heap Heap record; accesses `size`, `times`, `reaches`, `firstReaches` and `positions`. May update `heap.size`, `heap.times[1]` and `heap.reaches[1]` and additional fields in place.
function heapPop(heap)
  if heap.size==0 then return void end if
  result=[heap.times[1],heap.reaches[1],heap.firstReaches[1]];heap.positions[result[1]]=0
  if heap.size==1 then heap.size=0;return result end if
  heap.times[1]=heap.times[heap.size];heap.reaches[1]=heap.reaches[heap.size];heap.firstReaches[1]=heap.firstReaches[heap.size];heap.positions[heap.reaches[1]]=1;heap.size=heap.size-1;position=1
  while true
    left=position*2;if left>heap.size then return result end if;right=left+1;child=left
    if right<=heap.size and heapLess(heap,right,left) then child=right end if
    if not heapLess(heap,child,position) then return result end if
    heapSwap(heap,position,child);position=child
  end while
end function

/// Build the `mq3.botlib.aas_routing.Route` result for `areaRouteToGoalArea`. Return paths include `searchFromArea(router,areaNum,origin,goalAreaNum,travelFlags,void)`.
/// @param router AAS routing state; accesses `runtime` and `settings`.
/// @param areaNum AAS area number; zero denotes no area.
/// @param origin World-space position as three coordinates.
/// @param goalAreaNum Destination AAS area number.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
function areaRouteToGoalArea(router,areaNum,origin,goalAreaNum,travelFlags)
  noRoute=Route(0,0)
  if router==void or not rt.validArea(router.runtime,areaNum) or not rt.validArea(router.runtime,goalAreaNum) then return noRoute end if
  if origin!=void and len(origin)!=3 then return noRoute end if
  if areaNum==goalAreaNum then return Route(1,0) end if
  if (router.settings[areaNum].contents&AREACONTENTS_DONOTENTER)!=0 or (router.settings[goalAreaNum].contents&AREACONTENTS_DONOTENTER)!=0 then travelFlags=travelFlags|TFL_DONOTENTER end if
  return searchFromArea(router,areaNum,origin,goalAreaNum,travelFlags,void)
end function

/// Apply `mq3.botlib.aas_runtime.validArea` and `mq3.botlib.aas_routing.searchFromArea` while evaluating `travelTimesFromArea`. Return paths include `times`.
/// @param router AAS routing state; accesses `runtime` and `settings`.
/// @param areaNum AAS area number; zero denotes no area.
/// @param origin World-space position as three coordinates.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
function travelTimesFromArea(router,areaNum,origin,travelFlags)
  if router==void or not rt.validArea(router.runtime,areaNum) or (origin!=void and len(origin)!=3) then return void end if
  times=array(len(router.settings),0);times[areaNum]=1
  searchFromArea(router,areaNum,origin,0,travelFlags,times)
  return times
end function

// Dijkstra's first arrival in an area has the same cost as stopping the
// point-to-point search at that area. The one-source table needs no tie
// decision because item scoring reads travel time only.
/// @param router AAS routing state; accesses `reaches` and `settings`.
/// @param areaNum AAS area number; zero denotes no area.
/// @param origin World-space position as three coordinates.
/// @param goalAreaNum Destination AAS area number.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
/// @param times Array or byte sequence accessed at `currentArea`. Entries are written in place.
function searchFromArea(router,areaNum,origin,goalAreaNum,travelFlags,times)
  reachCount=len(router.reaches);distances=array(reachCount,0);heap=heapCreate(reachCount);source=router.settings[areaNum]
  if source.numReachableAreas>0 then for reachNum=source.firstReachableArea to source.firstReachableArea+source.numReachableAreas-1
    reach=router.reaches[reachNum]
    if edgeAllowed(router,reach,travelFlags) then
      cost=1+reach.travelTime;if origin!=void then cost=cost+areaTravelTime(router,areaNum,origin,reach.start) end if
      distances[reachNum]=cost;heapPut(heap,reachNum,cost,reachNum)
    end if
  end for end if
  while heap.size>0
    item=heapPop(heap);cost=item[0];reachNum=item[1];firstReach=item[2]
    if cost==distances[reachNum] then
      incoming=router.reaches[reachNum];currentArea=incoming.areaNum
      if currentArea==goalAreaNum then return Route(cost,firstReach) end if
      if times!=void and times[currentArea]==0 then times[currentArea]=cost end if
      settings=router.settings[currentArea]
      if settings.numReachableAreas>0 then for nextNum=settings.firstReachableArea to settings.firstReachableArea+settings.numReachableAreas-1
        outgoing=router.reaches[nextNum]
        if edgeAllowed(router,outgoing,travelFlags) then
          nextCost=cost+areaTravelTime(router,currentArea,incoming.finish,outgoing.start)+outgoing.travelTime
          if distances[nextNum]==0 or nextCost<distances[nextNum] then distances[nextNum]=nextCost;heapPut(heap,nextNum,nextCost,firstReach) end if
        end if
      end for end if
    end if
  end while
  return Route(0,0)
end function
/// Return `areaRouteToGoalArea(router,areaNum,origin,goalAreaNum,travelFlags).travelTime` for `areaTravelTimeToGoalArea`.
/// @param router AAS routing state; accesses `runtime` and `settings`.
/// @param areaNum AAS area number; zero denotes no area.
/// @param origin World-space position as three coordinates.
/// @param goalAreaNum Destination AAS area number.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
function areaTravelTimeToGoalArea(router,areaNum,origin,goalAreaNum,travelFlags) return areaRouteToGoalArea(router,areaNum,origin,goalAreaNum,travelFlags).travelTime end function
/// Return `areaRouteToGoalArea(router,areaNum,origin,goalAreaNum,travelFlags).reachNum` for `areaReachabilityToGoalArea`.
/// @param router AAS routing state; accesses `runtime` and `settings`.
/// @param areaNum AAS area number; zero denotes no area.
/// @param origin World-space position as three coordinates.
/// @param goalAreaNum Destination AAS area number.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
function areaReachabilityToGoalArea(router,areaNum,origin,goalAreaNum,travelFlags) return areaRouteToGoalArea(router,areaNum,origin,goalAreaNum,travelFlags).reachNum end function
