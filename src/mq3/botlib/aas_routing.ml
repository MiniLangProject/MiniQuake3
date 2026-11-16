// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Weighted AAS routing semantics from code/botlib/be_aas_route.c.
package mq3.botlib.aas_routing

import mq3.botlib.public_headers as publicHeaders
import mq3.format.aas as aas
import mq3.botlib.aas_runtime as rt
import mq3.compat.numeric as n

const TRAVELTYPE_MASK=0xffffff
const TRAVELFLAG_NOTTEAM1=0x01000000
const TRAVELFLAG_NOTTEAM2=0x02000000
const TRAVEL_INVALID=1
const TRAVEL_WALK=2
const TRAVEL_CROUCH=3
const TRAVEL_BARRIERJUMP=4
const TRAVEL_JUMP=5
const TRAVEL_LADDER=6
const TRAVEL_WALKOFFLEDGE=7
const TRAVEL_SWIM=8
const TRAVEL_WATERJUMP=9
const TRAVEL_TELEPORT=10
const TRAVEL_ELEVATOR=11
const TRAVEL_ROCKETJUMP=12
const TRAVEL_BFGJUMP=13
const TRAVEL_GRAPPLEHOOK=14
const TRAVEL_DOUBLEJUMP=15
const TRAVEL_RAMPJUMP=16
const TRAVEL_STRAFEJUMP=17
const TRAVEL_JUMPPAD=18
const TRAVEL_FUNCBOB=19

const TFL_INVALID=publicHeaders.TFL_INVALID
const TFL_WALK=publicHeaders.TFL_WALK
const TFL_CROUCH=publicHeaders.TFL_CROUCH
const TFL_BARRIERJUMP=publicHeaders.TFL_BARRIERJUMP
const TFL_JUMP=publicHeaders.TFL_JUMP
const TFL_LADDER=publicHeaders.TFL_LADDER
const TFL_WALKOFFLEDGE=publicHeaders.TFL_WALKOFFLEDGE
const TFL_SWIM=publicHeaders.TFL_SWIM
const TFL_WATERJUMP=publicHeaders.TFL_WATERJUMP
const TFL_TELEPORT=publicHeaders.TFL_TELEPORT
const TFL_ELEVATOR=publicHeaders.TFL_ELEVATOR
const TFL_ROCKETJUMP=publicHeaders.TFL_ROCKETJUMP
const TFL_BFGJUMP=publicHeaders.TFL_BFGJUMP
const TFL_GRAPPLEHOOK=publicHeaders.TFL_GRAPPLEHOOK
const TFL_DOUBLEJUMP=publicHeaders.TFL_DOUBLEJUMP
const TFL_RAMPJUMP=publicHeaders.TFL_RAMPJUMP
const TFL_STRAFEJUMP=publicHeaders.TFL_STRAFEJUMP
const TFL_JUMPPAD=publicHeaders.TFL_JUMPPAD
const TFL_AIR=publicHeaders.TFL_AIR
const TFL_WATER=publicHeaders.TFL_WATER
const TFL_SLIME=publicHeaders.TFL_SLIME
const TFL_LAVA=publicHeaders.TFL_LAVA
const TFL_DONOTENTER=publicHeaders.TFL_DONOTENTER
const TFL_FUNCBOB=publicHeaders.TFL_FUNCBOB
const TFL_FLIGHT=publicHeaders.TFL_FLIGHT
const TFL_BRIDGE=publicHeaders.TFL_BRIDGE
const TFL_NOTTEAM1=publicHeaders.TFL_NOTTEAM1
const TFL_NOTTEAM2=publicHeaders.TFL_NOTTEAM2
const TFL_DEFAULT=publicHeaders.TFL_DEFAULT

const AREACONTENTS_WATER=1
const AREACONTENTS_LAVA=2
const AREACONTENTS_SLIME=4
const AREACONTENTS_DONOTENTER=256
const AREACONTENTS_NOTTEAM1=2048
const AREACONTENTS_NOTTEAM2=4096
const AREA_LIQUID=4
const AREA_BRIDGE=16

struct Router runtime settings reaches travelTypeFlags areaFlags end struct
struct Route travelTime reachNum end struct
struct Heap times reaches firstReaches positions size end struct

function fail(message) return error(7530,"AAS routing: "+message) end function
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

function travelFlagForType(travelType)
  kind=travelType&TRAVELTYPE_MASK
  flags=[TFL_INVALID,TFL_INVALID,TFL_WALK,TFL_CROUCH,TFL_BARRIERJUMP,TFL_JUMP,TFL_LADDER,TFL_WALKOFFLEDGE,TFL_SWIM,TFL_WATERJUMP,TFL_TELEPORT,TFL_ELEVATOR,TFL_ROCKETJUMP,TFL_BFGJUMP,TFL_GRAPPLEHOOK,TFL_DOUBLEJUMP,TFL_RAMPJUMP,TFL_STRAFEJUMP,TFL_JUMPPAD,TFL_FUNCBOB]
  if kind<0 or kind>=len(flags) then return TFL_INVALID end if
  // The released Q3 routine masks these bits before lookup; team restrictions
  // are supplied by the destination area's contents flags below.
  return flags[kind]
end function
function contentsTravelFlags(value)
  contents=value.contents;flags=0
  if (contents&AREACONTENTS_WATER)!=0 then flags=TFL_WATER else if (contents&AREACONTENTS_SLIME)!=0 then flags=TFL_SLIME else if (contents&AREACONTENTS_LAVA)!=0 then flags=TFL_LAVA else flags=TFL_AIR end if
  if (contents&AREACONTENTS_DONOTENTER)!=0 then flags=flags|TFL_DONOTENTER end if
  if (contents&AREACONTENTS_NOTTEAM1)!=0 then flags=flags|TFL_NOTTEAM1 end if
  if (contents&AREACONTENTS_NOTTEAM2)!=0 then flags=flags|TFL_NOTTEAM2 end if
  if (value.flags&AREA_BRIDGE)!=0 then flags=flags|TFL_BRIDGE end if
  return flags
end function
function areaContentsTravelFlags(router,areaNum)
  if router==void or areaNum<0 or areaNum>=len(router.settings) then return TFL_INVALID end if
  return router.areaFlags[areaNum]
end function
function allowed(required,travelFlags) return (required&travelFlags)==required end function
function edgeAllowed(router,reach,travelFlags)
  destination=reach.areaNum
  if not rt.validArea(router.runtime,destination) or router.runtime.disabled[destination] then return false end if
  kind=reach.travelType&TRAVELTYPE_MASK;required=TFL_INVALID
  if kind>=0 and kind<len(router.travelTypeFlags) then required=router.travelTypeFlags[kind] end if
  return allowed(required,travelFlags) and allowed(router.areaFlags[destination],travelFlags)
end function
function areaTravelTime(router,areaNum,start,finish)
  if router==void or not rt.validArea(router.runtime,areaNum) or start==void or finish==void or len(start)!=3 or len(finish)!=3 then return 0 end if
  dx=n.fsub(start[0],finish[0]);dy=n.fsub(start[1],finish[1]);dz=n.fsub(start[2],finish[2])
  distance=n.fsqrt(n.fadd(n.fadd(n.fmul(dx,dx),n.fmul(dy,dy)),n.fmul(dz,dz)));settings=router.settings[areaNum]
  if (settings.presenceType&rt.PRESENCE_NORMAL)==0 then distance=n.fmul(distance,1.3) else if (settings.flags&AREA_LIQUID)!=0 then distance=n.fmul(distance,1.0) else distance=n.fmul(distance,0.33) end if
  result=n.trunc32(distance);if result<=0 then return 1 end if;return result
end function

function heapCreate(capacity) return Heap(array(capacity+1,0),array(capacity+1,0),array(capacity+1,0),array(capacity,0),0) end function
function heapLess(heap,left,right)
  if heap.times[left]!=heap.times[right] then return heap.times[left]<heap.times[right] end if
  return heap.reaches[left]<heap.reaches[right]
end function
function heapSwap(heap,left,right)
  value=heap.times[left];heap.times[left]=heap.times[right];heap.times[right]=value
  value=heap.reaches[left];heap.reaches[left]=heap.reaches[right];heap.reaches[right]=value
  value=heap.firstReaches[left];heap.firstReaches[left]=heap.firstReaches[right];heap.firstReaches[right]=value
  heap.positions[heap.reaches[left]]=left;heap.positions[heap.reaches[right]]=right
end function
function heapPut(heap,reachNum,time,firstReach)
  position=heap.positions[reachNum]
  if position==0 then heap.size=heap.size+1;position=heap.size;heap.reaches[position]=reachNum;heap.positions[reachNum]=position end if
  heap.times[position]=time;heap.firstReaches[position]=firstReach
  while position>1 parent=position>>1;if not heapLess(heap,position,parent) then return true end if;heapSwap(heap,position,parent);position=parent end while
  return true
end function
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

function areaRouteToGoalArea(router,areaNum,origin,goalAreaNum,travelFlags)
  noRoute=Route(0,0)
  if router==void or not rt.validArea(router.runtime,areaNum) or not rt.validArea(router.runtime,goalAreaNum) then return noRoute end if
  if origin!=void and len(origin)!=3 then return noRoute end if
  if areaNum==goalAreaNum then return Route(1,0) end if
  if (router.settings[areaNum].contents&AREACONTENTS_DONOTENTER)!=0 or (router.settings[goalAreaNum].contents&AREACONTENTS_DONOTENTER)!=0 then travelFlags=travelFlags|TFL_DONOTENTER end if
  reachCount=len(router.reaches);distances=array(reachCount,0);firstReaches=array(reachCount,0);heap=heapCreate(reachCount);source=router.settings[areaNum]
  if source.numReachableAreas>0 then for reachNum=source.firstReachableArea to source.firstReachableArea+source.numReachableAreas-1
    reach=router.reaches[reachNum]
    if edgeAllowed(router,reach,travelFlags) then
      cost=1+reach.travelTime;if origin!=void then cost=cost+areaTravelTime(router,areaNum,origin,reach.start) end if
      distances[reachNum]=cost;firstReaches[reachNum]=reachNum;heapPut(heap,reachNum,cost,reachNum)
    end if
  end for end if
  while heap.size>0
    item=heapPop(heap);cost=item[0];reachNum=item[1];firstReach=item[2]
    if cost==distances[reachNum] then
      incoming=router.reaches[reachNum];currentArea=incoming.areaNum
      if currentArea==goalAreaNum then return Route(cost,firstReach) end if
      settings=router.settings[currentArea]
      if settings.numReachableAreas>0 then for nextNum=settings.firstReachableArea to settings.firstReachableArea+settings.numReachableAreas-1
        outgoing=router.reaches[nextNum]
        if edgeAllowed(router,outgoing,travelFlags) then
          nextCost=cost+areaTravelTime(router,currentArea,incoming.finish,outgoing.start)+outgoing.travelTime
          if distances[nextNum]==0 or nextCost<distances[nextNum] then distances[nextNum]=nextCost;firstReaches[nextNum]=firstReach;heapPut(heap,nextNum,nextCost,firstReach) end if
        end if
      end for end if
    end if
  end while
  return noRoute
end function
function areaTravelTimeToGoalArea(router,areaNum,origin,goalAreaNum,travelFlags) return areaRouteToGoalArea(router,areaNum,origin,goalAreaNum,travelFlags).travelTime end function
function areaReachabilityToGoalArea(router,areaNum,origin,goalAreaNum,travelFlags) return areaRouteToGoalArea(router,areaNum,origin,goalAreaNum,travelFlags).reachNum end function
