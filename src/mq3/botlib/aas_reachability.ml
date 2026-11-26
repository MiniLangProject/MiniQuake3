// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native ownership of code/botlib/be_aas_reach.c. Runtime maps normally carry
// BSPC-built reachabilities; the generator below is used for forced rebuilds.
package mq3.botlib.aas_reachability
import mq3.format.aas as aas
import mq3.botlib.aas_runtime as runtime
import mq3.botlib.aas_routing as routing
import mq3.compat.numeric as n

const FACE_GROUND=4
const AREA_GROUNDED=1
const AREA_LADDER=2
const AREA_LIQUID=4
const AREA_WEAPONJUMP=8192
const AREACONTENTS_LAVA=2
const AREACONTENTS_SLIME=4
const AREACONTENTS_CLUSTERPORTAL=8
const AREACONTENTS_TELEPORTER=64
const AREACONTENTS_JUMPPAD=128
const AREACONTENTS_DONOTENTER=256
const PRESENCE_NORMAL=2
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
const TRAVEL_GRAPPLEHOOK=14
const TRAVEL_JUMPPAD=18
const TRAVEL_FUNCBOB=19
const TRAVELFLAG_NOTTEAM1=0x01000000
const TRAVELFLAG_NOTTEAM2=0x02000000

/// `Physics` record for aas reachability, containing `gravity`, `jumpVelocity`, `maxVelocity`, `maxJumpFallHeight` and `step` and related fields.
struct Physics gravity jumpVelocity maxVelocity maxJumpFallHeight step barrier waterJump startWalkOff fallDelta5 fallDelta10 fallDamage5 fallDamage10 end struct
/// `Reach` record for aas reachability, containing `sourceArea`, `areaNum`, `faceNum`, `edgeNum` and `start` and related fields.
struct Reach sourceArea areaNum faceNum edgeNum start finish travelType travelTime allocated end struct
/// `Special` record for aas reachability, containing `kind`, `sourceArea`, `destinationArea`, `entity` and `model` and related fields.
struct Special kind sourceArea destinationArea entity model start finish velocity team end struct
/// `Action` record for aas reachability, containing `boundary`, `kind`, `source`, `destination` and `detail` and related fields.
struct Action boundary kind source destination detail dispatched end struct
/// `World` record for aas reachability, containing `runtime`, `map`, `settings`, `areas` and `reachesByArea` and related fields.
struct World runtime map settings areas reachesByArea stored heapCapacity heapUsed loaded saveFile numReachabilityAreas forceReachability calcGrapple physics specials services actions retailActive end struct
/// `Services` record for aas reachability, containing `pointAreaFn`, `pointContentsFn`, `bboxAreasFn`, `traceFn` and `teamFn` and related fields.
struct Services pointAreaFn pointContentsFn bboxAreasFn traceFn teamFn timeFn context end struct

/// Create a `mq3.botlib.aas_reachability.Physics` record, initializing `gravity` as `800.0`, `jumpVelocity` as `270.0` and `maxVelocity` as `320.0`.
function defaultPhysics() return Physics(800.0,270.0,320.0,450.0,18.0,32.0,42.0,1,40.0,60.0,5,10) end function
/// Create a `mq3.botlib.aas_reachability.Services` record with the declared empty defaults.
function services() return Services(void,void,void,void,void,void,void) end function
/// Build the `mq3.botlib.aas_reachability.World` result for `create`.
/// @param rt Rt record; accesses `initialized` and `map`.
function create(rt)
  if rt==void or not rt.initialized then return error(7950,"AAS reachability requires initialized runtime") end if
  count=rt.map.counts[aas.LUMP_AREAS];settings=array(count,void);areas=array(count,void);links=array(count,void)
  if count>0 then for index=0 to count-1 settings[index]=aas.areaSettings(rt.map,index);areas[index]=aas.area(rt.map,index);links[index]=[] end for end if
  return World(rt,rt.map,settings,areas,links,[],0,0,true,false,0,false,false,defaultPhysics(),[],services(),[],false)
end function
/// Test `world!=void and areaNum>0 and areaNum<len(world.settings)` as the condition for `valid`.
/// @param world World data; accesses `settings`.
/// @param areaNum AAS area number; zero denotes no area.
function valid(world,areaNum) return world!=void and areaNum>0 and areaNum<len(world.settings) end function
/// Set `world.actions` to `world.actions+[event]` in `mq3.botlib.aas_reachability.emit`. Return paths include `event`.
/// @param world World data; accesses `retailActive` and `actions`. May update `world.actions` in place.
/// @param kind Initial value stored in `mq3.botlib.aas_reachability.Action.kind`.
/// @param source Initial value stored in `mq3.botlib.aas_reachability.Action.source`.
/// @param destination Initial value stored in `mq3.botlib.aas_reachability.Action.destination`.
/// @param detail Initial value stored in `mq3.botlib.aas_reachability.Action.detail`.
function emit(world,kind,source,destination,detail) event=Action("aas-reachability",kind,source,destination,detail,not world.retailActive);world.actions=world.actions+[event];return event end function
/// Return a new array `[a[0]-b[0],a[1]-b[1],a[2]-b[2]]` for `vecSub`.
/// @param a Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param b Three-component array; components 0, 1 and 2 are used in their stored order.
function vecSub(a,b) return [a[0]-b[0],a[1]-b[1],a[2]-b[2]] end function
/// Return `a[0]*b[0]+a[1]*b[1]+a[2]*b[2]` for `dot`.
/// @param a Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param b Three-component array; components 0, 1 and 2 are used in their stored order.
function dot(a,b) return a[0]*b[0]+a[1]*b[1]+a[2]*b[2] end function
/// Forward `length` to `mq3.compat.numeric.fsqrt` and return the delegated result.
/// @param v Three-component array; components 0, 1 and 2 are used in their stored order.
function length(v) return n.fsqrt(dot(v,v)) end function
/// Return `world.areas[areaNum].center` for `center`.
/// @param world World data; accesses `areas`.
/// @param areaNum AAS area number; zero denotes no area.
function center(world,areaNum) return world.areas[areaNum].center end function
/// Test overlap of two AAS area bounds after extending their separation tolerance by the supplied margin.
/// @param a A record; accesses `mins` and `maxs`.
/// @param b B record; accesses `maxs` and `mins`.
/// @param extra Value used by `overlap` in `for axis=0 to 2 if a.mins[axis]>b.maxs[axis]+extra or a.maxs[axis]<b.mins[axis]-extra then return false end if e...`.
function overlap(a,b,extra) for axis=0 to 2 if a.mins[axis]>b.maxs[axis]+extra or a.maxs[axis]<b.mins[axis]-extra then return false end if end for;return true end function
/// Add base travel cost to truncated distance over speed and clamp the result to the unsigned sixteen-bit range excluding zero.
/// @param distance Value used by `travelTime` in `value=base+n.trunc32(distance/speed)`.
/// @param speed Requested movement speed.
/// @param base Value used by `travelTime` in `value=base+n.trunc32(distance/speed)`.
function travelTime(distance,speed,base) value=base+n.trunc32(distance/speed);if value<1 then value=1 end if;if value>65535 then value=65535 end if;return value end function

/// Apply `mq3.botlib.aas_runtime.faceArea` while evaluating `AAS_FaceArea`. Return paths include `0.0`.
/// @param world World data; accesses `runtime`.
/// @param face AAS face index.
function AAS_FaceArea(world,face) if typeof(face)=="int" then return runtime.faceArea(world.runtime,face) end if;return 0.0 end function
/// Forward `AAS_AreaVolume` to `mq3.botlib.aas_runtime.areaVolume` and return the delegated result.
/// @param world World data; accesses `runtime`.
/// @param areaNum AAS area number; zero denotes no area.
function AAS_AreaVolume(world,areaNum) return runtime.areaVolume(world.runtime,areaNum) end function
/// Apply `mq3.botlib.aas_reachability.valid`, `mq3.botlib.aas_reachability.AAS_AreaReachability` and `mq3.botlib.aas_reachability.AAS_AreaDoNotEnter` while evaluating `AAS_BestReachableLinkArea`. Return paths include `best`.
/// @param world World data; accesses `settings`.
/// @param areas Value used by `AAS_BestReachableLinkArea` in `for each areaNum in areas if valid(world,areaNum) and AAS_AreaReachability(world,areaNum)>0 and not AAS_AreaDoNo...`.
function AAS_BestReachableLinkArea(world,areas)
  best=0;for each areaNum in areas if valid(world,areaNum) and AAS_AreaReachability(world,areaNum)>0 and not AAS_AreaDoNotEnter(world,areaNum) then return areaNum end if;if best==0 and valid(world,areaNum) then best=areaNum end if end for;return best
end function
/// Set `areaStart[axis]` to `value.start[axis]` and `velocity[axis]` to `value.velocity[axis]` in `mq3.botlib.aas_reachability.AAS_GetJumpPadInfo`.
/// @param world World data; accesses `specials`.
/// @param ent Value used by `AAS_GetJumpPadInfo` in `for each value in world.specials if value.kind=="jumppad" and value.entity==ent then for axis=0 to 2 areaStart[a...`.
/// @param areaStart Array or byte sequence accessed at `axis`. Entries are written in place.
/// @param absmins Not read by this implementation; retained in the `AAS_GetJumpPadInfo` signature.
/// @param absmaxs Not read by this implementation; retained in the `AAS_GetJumpPadInfo` signature.
/// @param velocity Three-component movement velocity. Entries may be updated in place.
function AAS_GetJumpPadInfo(world,ent,areaStart,absmins,absmaxs,velocity)
  for each value in world.specials if value.kind=="jumppad" and value.entity==ent then for axis=0 to 2 areaStart[axis]=value.start[axis];velocity[axis]=value.velocity[axis] end for;return value.sourceArea end if end for;return 0
end function
/// Apply `mq3.botlib.aas_reachability.AAS_AreaVolume` while evaluating `AAS_BestReachableFromJumpPadArea`. Return paths include `best`.
/// @param world World data; accesses `specials`.
/// @param origin Not read by this implementation; retained in the `AAS_BestReachableFromJumpPadArea` signature.
/// @param mins Not read by this implementation; retained in the `AAS_BestReachableFromJumpPadArea` signature.
/// @param maxs Not read by this implementation; retained in the `AAS_BestReachableFromJumpPadArea` signature.
function AAS_BestReachableFromJumpPadArea(world,origin,mins,maxs)
  best=0;volume=0.0;for each value in world.specials if value.kind=="jumppad" then candidate=value.sourceArea;v=AAS_AreaVolume(world,candidate);if v>=volume then volume=v;best=candidate end if end if end for;return best
end function
/// Set `goalOrigin[axis]` to `origin[axis]` in `mq3.botlib.aas_reachability.AAS_BestReachableArea`. Return paths include `AAS_BestReachableLinkArea(world,areas)`.
/// @param world World data; accesses `services` and `runtime`.
/// @param origin World-space position as three coordinates.
/// @param mins Minimum coordinates of the axis-aligned bounds.
/// @param maxs Maximum coordinates of the axis-aligned bounds.
/// @param goalOrigin Array or byte sequence accessed at `axis`. Entries are written in place.
function AAS_BestReachableArea(world,origin,mins,maxs,goalOrigin)
  areaNum=0;if world.services.pointAreaFn!=void then areaNum=world.services.pointAreaFn(world.services.context,origin) else areaNum=runtime.pointAreaNum(world.runtime,origin) end if
  if areaNum!=0 then for axis=0 to 2 goalOrigin[axis]=origin[axis] end for;return areaNum end if
  absmins=[origin[0]+mins[0],origin[1]+mins[1],origin[2]+mins[2]];absmaxs=[origin[0]+maxs[0],origin[1]+maxs[1],origin[2]+maxs[2]]
  areas=[];if world.services.bboxAreasFn!=void then areas=world.services.bboxAreasFn(world.services.context,absmins,absmaxs) else areas=runtime.bboxAreas(world.runtime,absmins,absmaxs,128) end if
  for axis=0 to 2 goalOrigin[axis]=origin[axis] end for;return AAS_BestReachableLinkArea(world,areas)
end function

/// Update `world.heapCapacity`, `world.heapUsed`, `world.reachesByArea` and `world.reachesByArea[index]` during `AAS_SetupReachabilityHeap`.
/// @param world World data; accesses `heapCapacity`, `heapUsed`, `reachesByArea` and `settings`. May update `world.heapCapacity`, `world.heapUsed` and `world.reachesByArea` and additional fields in place.
function AAS_SetupReachabilityHeap(world) world.heapCapacity=65536;world.heapUsed=0;world.reachesByArea=array(len(world.settings),void);for index=0 to len(world.reachesByArea)-1 world.reachesByArea[index]=[] end for;return true end function
/// Set `world.heapCapacity` to `0` and `world.heapUsed` to `0` in `mq3.botlib.aas_reachability.AAS_ShutDownReachabilityHeap`.
/// @param world World data; accesses `heapCapacity` and `heapUsed`. May update `world.heapCapacity` and `world.heapUsed` in place.
function AAS_ShutDownReachabilityHeap(world) world.heapCapacity=0;world.heapUsed=0;return void end function
/// Record or dispatch `"heap-full"` actions in `AAS_AllocReachability`. Return paths include `Reach(0,0,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,true)`.
/// @param world World data; accesses `heapUsed` and `heapCapacity`. May update `world.heapUsed` in place.
function AAS_AllocReachability(world)
  if world.heapUsed>=world.heapCapacity then emit(world,"heap-full",0,0,"AAS_MAX_REACHABILITYSIZE");return void end if
  world.heapUsed=world.heapUsed+1;return Reach(0,0,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,true)
end function
/// Set `value.allocated` to `false` and `world.heapUsed` to `world.heapUsed-1` in `mq3.botlib.aas_reachability.AAS_FreeReachability`.
/// @param world World data; accesses `heapUsed`. May update `world.heapUsed` in place.
/// @param value Value record; accesses `allocated`. May update `value.allocated` in place.
function AAS_FreeReachability(world,value)
  if value==void or not value.allocated then return false end if;value.allocated=false;if world.heapUsed>0 then world.heapUsed=world.heapUsed-1 end if;return true
end function
/// Set `world.reachesByArea[source]` to `[value]+world.reachesByArea[source]` in `mq3.botlib.aas_reachability.addReach`.
/// @param world World data; accesses `reachesByArea`. May update `world.reachesByArea[source]` in place.
/// @param source AAS area number; zero denotes no area.
/// @param destination AAS area number; zero denotes no area.
/// @param type Value used by `addReach` in `value.travelType=type`.
/// @param start Value used by `addReach` in `value.start=start`.
/// @param finish Value used by `addReach` in `value.finish=finish`.
/// @param faceNum AAS face index.
/// @param edgeNum Value used by `addReach` in `value.edgeNum=edgeNum`.
/// @param time Time value in the units expected by this module.
function addReach(world,source,destination,type,start,finish,faceNum,edgeNum,time)
  if not valid(world,source) or not valid(world,destination) or AAS_ReachabilityExists(world,source,destination) then return false end if
  value=AAS_AllocReachability(world);if value==void then return false end if;value.sourceArea=source;value.areaNum=destination;value.faceNum=faceNum;value.edgeNum=edgeNum;value.start=start;value.finish=finish;value.travelType=type;value.travelTime=time;world.reachesByArea[source]=[value]+world.reachesByArea[source];return true
end function
/// Apply `mq3.botlib.aas_reachability.valid` while evaluating `AAS_AreaReachability`. Return paths include `len(world.reachesByArea[areaNum])`.
/// @param world World data; accesses `reachesByArea`.
/// @param areaNum AAS area number; zero denotes no area.
function AAS_AreaReachability(world,areaNum) if not valid(world,areaNum) then return 0 end if;return len(world.reachesByArea[areaNum]) end function
/// Apply `mq3.botlib.aas_reachability.valid`, `mq3.format.aas.faceIndex` and `mq3.format.aas.face` while evaluating `AAS_AreaGroundFaceArea`. Return paths include `total`.
/// @param world World data; accesses `areas` and `map`.
/// @param areaNum AAS area number; zero denotes no area.
function AAS_AreaGroundFaceArea(world,areaNum)
  if not valid(world,areaNum) then return 0.0 end if;area=world.areas[areaNum];total=0.0;for offset=0 to area.numFaces-1 faceNum=aas.faceIndex(world.map,area.firstFace+offset);if faceNum<0 then faceNum=0-faceNum end if;face=aas.face(world.map,faceNum);if (face.flags&FACE_GROUND)!=0 then total=total+AAS_FaceArea(world,faceNum) end if end for;return total
end function
/// Apply `mq3.format.aas.face`, `mq3.format.aas.edgeIndex` and `mq3.format.aas.edge` while evaluating `AAS_FaceCenter`.
/// @param world World data; accesses `map`.
/// @param faceNum AAS face index.
function AAS_FaceCenter(world,faceNum)
  face=aas.face(world.map,faceNum);value=[0.0,0.0,0.0];if face is error or face.numEdges==0 then return value end if
  for offset=0 to face.numEdges-1 edgeNum=aas.edgeIndex(world.map,face.firstEdge+offset);if edgeNum<0 then edgeNum=0-edgeNum end if;edge=aas.edge(world.map,edgeNum);for side=0 to 1 vertex=aas.vertex(world.map,edge[side]);for axis=0 to 2 value[axis]=value[axis]+vertex[axis] end for end for end for
  scale=0.5/face.numEdges;for axis=0 to 2 value[axis]=value[axis]*scale end for;return value
end function
/// Calculate the fall distance associated with the released fall-damage velocity threshold and configured gravity.
/// @param world World data; accesses `physics`.
function AAS_FallDamageDistance(world) gravity=world.physics.gravity;velocity=n.fsqrt(300000.0);time=velocity/gravity;return n.trunc32(0.5*gravity*time*time) end function
/// Convert fall distance into the squared-impact-velocity measure used by AAS fall-damage checks.
/// @param world World data; accesses `physics`.
/// @param distance Value used by `AAS_FallDelta` in `magnitude=distance`.
function AAS_FallDelta(world,distance) magnitude=distance;if magnitude<0 then magnitude=0.0-magnitude end if;velocity=n.fsqrt(magnitude*2.0/world.physics.gravity)*world.physics.gravity;return velocity*velocity*0.0001 end function
/// Return `0.5*world.physics.gravity*(jumpVelocity/world.physics.gravity)*(jumpVelocity/world.physics.gravity)` for `AAS_MaxJumpHeight`.
/// @param world World data; accesses `physics`.
/// @param jumpVelocity Operand used to evaluate the returned expression `0.5*world.physics.gravity*(jumpVelocity/world.physics.gravity)*(jumpVelocity/world.physics.gravity)`.
function AAS_MaxJumpHeight(world,jumpVelocity) return 0.5*world.physics.gravity*(jumpVelocity/world.physics.gravity)*(jumpVelocity/world.physics.gravity) end function
/// Estimate maximum horizontal jump distance from fall height, jump velocity, gravity and maximum movement speed.
/// @param world World data; accesses `physics`.
/// @param jumpVelocity Operand used to evaluate the returned expression `world.physics.maxVelocity*(time+jumpVelocity/world.physics.gravity)`.
function AAS_MaxJumpDistance(world,jumpVelocity) time=n.fsqrt(world.physics.maxJumpFallHeight/(0.5*world.physics.gravity));return world.physics.maxVelocity*(time+jumpVelocity/world.physics.gravity) end function
/// Test `(world.settings[areaNum].presenceType&PRESENCE_NORMAL)==0` as the condition for `AAS_AreaCrouch`.
/// @param world World data; accesses `settings`.
/// @param areaNum AAS area number; zero denotes no area.
function AAS_AreaCrouch(world,areaNum) return (world.settings[areaNum].presenceType&PRESENCE_NORMAL)==0 end function
/// Test `(world.settings[areaNum].flags&AREA_LIQUID)!=0` as the condition for `AAS_AreaSwim`.
/// @param world World data; accesses `settings`.
/// @param areaNum AAS area number; zero denotes no area.
function AAS_AreaSwim(world,areaNum) return (world.settings[areaNum].flags&AREA_LIQUID)!=0 end function
/// Forward `AAS_AreaLiquid` to `mq3.botlib.aas_reachability.AAS_AreaSwim` and return the delegated result.
/// @param world World data; accesses `settings`.
/// @param areaNum AAS area number; zero denotes no area.
function AAS_AreaLiquid(world,areaNum) return AAS_AreaSwim(world,areaNum) end function
/// Return `world.settings[areaNum].contents&AREACONTENTS_LAVA` for `AAS_AreaLava`.
/// @param world World data; accesses `settings`.
/// @param areaNum AAS area number; zero denotes no area.
function AAS_AreaLava(world,areaNum) return world.settings[areaNum].contents&AREACONTENTS_LAVA end function
/// Return `world.settings[areaNum].contents&AREACONTENTS_SLIME` for `AAS_AreaSlime`.
/// @param world World data; accesses `settings`.
/// @param areaNum AAS area number; zero denotes no area.
function AAS_AreaSlime(world,areaNum) return world.settings[areaNum].contents&AREACONTENTS_SLIME end function
/// Return `world.settings[areaNum].flags&AREA_GROUNDED` for `AAS_AreaGrounded`.
/// @param world World data; accesses `settings`.
/// @param areaNum AAS area number; zero denotes no area.
function AAS_AreaGrounded(world,areaNum) return world.settings[areaNum].flags&AREA_GROUNDED end function
/// Return `world.settings[areaNum].flags&AREA_LADDER` for `AAS_AreaLadder`.
/// @param world World data; accesses `settings`.
/// @param areaNum AAS area number; zero denotes no area.
function AAS_AreaLadder(world,areaNum) return world.settings[areaNum].flags&AREA_LADDER end function
/// Return `world.settings[areaNum].contents&AREACONTENTS_JUMPPAD` for `AAS_AreaJumpPad`.
/// @param world World data; accesses `settings`.
/// @param areaNum AAS area number; zero denotes no area.
function AAS_AreaJumpPad(world,areaNum) return world.settings[areaNum].contents&AREACONTENTS_JUMPPAD end function
/// Return `world.settings[areaNum].contents&AREACONTENTS_TELEPORTER` for `AAS_AreaTeleporter`.
/// @param world World data; accesses `settings`.
/// @param areaNum AAS area number; zero denotes no area.
function AAS_AreaTeleporter(world,areaNum) return world.settings[areaNum].contents&AREACONTENTS_TELEPORTER end function
/// Return `world.settings[areaNum].contents&AREACONTENTS_CLUSTERPORTAL` for `AAS_AreaClusterPortal`.
/// @param world World data; accesses `settings`.
/// @param areaNum AAS area number; zero denotes no area.
function AAS_AreaClusterPortal(world,areaNum) return world.settings[areaNum].contents&AREACONTENTS_CLUSTERPORTAL end function
/// Return `world.settings[areaNum].contents&AREACONTENTS_DONOTENTER` for `AAS_AreaDoNotEnter`.
/// @param world World data; accesses `settings`.
/// @param areaNum AAS area number; zero denotes no area.
function AAS_AreaDoNotEnter(world,areaNum) return world.settings[areaNum].contents&AREACONTENTS_DONOTENTER end function
/// Forward `AAS_BarrierJumpTravelTime` to `mq3.compat.numeric.trunc32` and return the delegated result.
/// @param world World data; accesses `physics`.
function AAS_BarrierJumpTravelTime(world) return n.trunc32(world.physics.jumpVelocity/(world.physics.gravity*0.1)) end function
/// Test whether the first area already has a reachability ending in the second area.
/// @param world World data; accesses `reachesByArea`.
/// @param area1 Value used by `AAS_ReachabilityExists` in `for each value in world.reachesByArea[area1] if value.areaNum==area2 then return true end if end for`.
/// @param area2 Value used by `AAS_ReachabilityExists` in `for each value in world.reachesByArea[area1] if value.areaNum==area2 then return true end if end for`.
function AAS_ReachabilityExists(world,area1,area2) for each value in world.reachesByArea[area1] if value.areaNum==area2 then return true end if end for;return false end function
/// Apply `mq3.botlib.aas_reachability.vecSub`, `mq3.botlib.aas_reachability.length` and `mq3.botlib.aas_runtime.pointAreaNum` while evaluating `AAS_NearbySolidOrGap`.
/// @param world World data; accesses `runtime`.
/// @param start Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param finish Three-component array; components 0, 1 and 2 are used in their stored order.
function AAS_NearbySolidOrGap(world,start,finish)
  direction=vecSub(finish,start);direction[2]=0.0;size=length(direction);if size>0.0 then direction=[direction[0]/size,direction[1]/size,0.0] end if
  for each distance in [48.0,64.0] point=[finish[0]+distance*direction[0],finish[1]+distance*direction[1],finish[2]];area=runtime.pointAreaNum(world.runtime,point);if area==0 and distance==48.0 then point[2]=point[2]+16.0;area=runtime.pointAreaNum(world.runtime,point);if area==0 then return true end if end if;if area!=0 and not AAS_AreaSwim(world,area) and not AAS_AreaGrounded(world,area) then return true end if end for;return false
end function
/// Apply `mq3.botlib.aas_reachability.AAS_AreaSwim`, `mq3.botlib.aas_reachability.AAS_AreaCrouch` and `mq3.botlib.aas_reachability.overlap` while evaluating `AAS_Reachability_Swim`. Return paths include `addReach(world,area1,area2,TRAVEL_SWIM,center(world,area1),center(world,area2),0,0,time)`.
/// @param world World data; accesses `areas`.
/// @param area1 AAS area number; zero denotes no area.
/// @param area2 AAS area number; zero denotes no area.
function AAS_Reachability_Swim(world,area1,area2) if not AAS_AreaSwim(world,area1) or not AAS_AreaSwim(world,area2) or AAS_AreaCrouch(world,area2) or not overlap(world.areas[area1],world.areas[area2],10.0) then return false end if;time=1;if AAS_AreaVolume(world,area2)<800.0 then time=time+200 end if;return addReach(world,area1,area2,TRAVEL_SWIM,center(world,area1),center(world,area2),0,0,time) end function
/// Apply `mq3.botlib.aas_reachability.AAS_AreaGrounded`, `mq3.botlib.aas_reachability.overlap` and `mq3.botlib.aas_reachability.center` while evaluating `AAS_Reachability_EqualFloorHeight`.
/// @param world World data; accesses `areas` and `physics`.
/// @param area1 AAS area number; zero denotes no area.
/// @param area2 AAS area number; zero denotes no area.
function AAS_Reachability_EqualFloorHeight(world,area1,area2)
  if not AAS_AreaGrounded(world,area1) or not AAS_AreaGrounded(world,area2) or not overlap(world.areas[area1],world.areas[area2],1.0) then return false end if;dz=center(world,area2)[2]-center(world,area1)[2];if dz<0 then dz=0.0-dz end if;if dz>world.physics.step then return false end if;kind=TRAVEL_WALK;if AAS_AreaCrouch(world,area2) then kind=TRAVEL_CROUCH end if;return addReach(world,area1,area2,kind,center(world,area1),center(world,area2),0,0,travelTime(VectorDistance(center(world,area1),center(world,area2)),100.0,1))
end function
/// Apply `mq3.botlib.aas_reachability.overlap`, `mq3.botlib.aas_reachability.center` and `mq3.botlib.aas_reachability.AAS_AreaSwim` while evaluating `AAS_Reachability_Step_Barrier_WaterJump_WalkOffLedge`. Return paths include `addReach(world,area1,area2,kind,start,finish,0,0,base)`.
/// @param world World data; accesses `areas` and `physics`.
/// @param area1 AAS area number; zero denotes no area.
/// @param area2 AAS area number; zero denotes no area.
function AAS_Reachability_Step_Barrier_WaterJump_WalkOffLedge(world,area1,area2)
  if not overlap(world.areas[area1],world.areas[area2],16.0) then return false end if;start=center(world,area1);finish=center(world,area2);dz=finish[2]-start[2];kind=TRAVEL_WALK
  if AAS_AreaSwim(world,area1) and not AAS_AreaSwim(world,area2) and dz<=world.physics.waterJump then kind=TRAVEL_WATERJUMP
  else if dz>world.physics.step and dz<=world.physics.barrier then kind=TRAVEL_BARRIERJUMP
  else if dz<0.0-world.physics.step then kind=TRAVEL_WALKOFFLEDGE
  else if dz>world.physics.step then return false
  else if AAS_AreaCrouch(world,area2) then kind=TRAVEL_CROUCH end if
  base=1;if kind==TRAVEL_BARRIERJUMP then base=AAS_BarrierJumpTravelTime(world) else if kind==TRAVEL_WALKOFFLEDGE then base=world.physics.startWalkOff+n.trunc32((0.0-dz)*50.0/world.physics.gravity) end if;return addReach(world,area1,area2,kind,start,finish,0,0,base)
end function
/// Forward `VectorDistance` to `mq3.botlib.aas_reachability.length` and return the delegated result.
/// @param v1 Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param v2 Three-component array; components 0, 1 and 2 are used in their stored order.
function VectorDistance(v1,v2) return length(vecSub(v1,v2)) end function
/// Test `dot(vecSub(v,v1),vecSub(v,v2))<=0.0` as the condition for `VectorBetweenVectors`.
/// @param v Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param v1 Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param v2 Three-component array; components 0, 1 and 2 are used in their stored order.
function VectorBetweenVectors(v,v1,v2) return dot(vecSub(v,v1),vecSub(v,v2))<=0.0 end function
/// Return a new array `[(v1[0]+v2[0])*0.5,(v1[1]+v2[1])*0.5,(v1[2]+v2[2])*0.5]` for `VectorMiddle`.
/// @param v1 Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param v2 Three-component array; components 0, 1 and 2 are used in their stored order.
function VectorMiddle(v1,v2) return [(v1[0]+v2[0])*0.5,(v1[1]+v2[1])*0.5,(v1[2]+v2[2])*0.5] end function
/// Apply `mq3.botlib.aas_reachability.vecSub`, `mq3.botlib.aas_reachability.dot` and `mq3.botlib.aas_reachability.VectorDistance` while evaluating `AAS_ClosestEdgePoints`. Return paths include `[VectorDistance(first,second),first,second]`.
/// @param v1 Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param v2 Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param v3 Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param v4 Three-component array; components 0, 1 and 2 are used in their stored order.
function AAS_ClosestEdgePoints(v1,v2,v3,v4)
  u=vecSub(v2,v1);v=vecSub(v4,v3);w=vecSub(v1,v3);a=dot(u,u);b=dot(u,v);c=dot(v,v);d=dot(u,w);e=dot(v,w);denominator=a*c-b*b
  s=0.0;t=0.0;if denominator>0.000001 then s=(b*e-c*d)/denominator;t=(a*e-b*d)/denominator else if c>0.0 then t=e/c end if
  if s<0.0 then s=0.0 else if s>1.0 then s=1.0 end if;if t<0.0 then t=0.0 else if t>1.0 then t=1.0 end if
  first=[v1[0]+s*u[0],v1[1]+s*u[1],v1[2]+s*u[2]];second=[v3[0]+t*v[0],v3[1]+t*v[1],v3[2]+t*v[2]];return [VectorDistance(first,second),first,second]
end function
/// Apply `mq3.botlib.aas_reachability.center`, `mq3.botlib.aas_reachability.AAS_MaxJumpHeight` and `mq3.botlib.aas_reachability.VectorDistance` while evaluating `AAS_Reachability_Jump`. Return paths include `addReach(world,area1,area2,TRAVEL_JUMP,start,finish,0,0,10)`.
/// @param world World data; accesses `physics`.
/// @param area1 AAS area number; zero denotes no area.
/// @param area2 AAS area number; zero denotes no area.
function AAS_Reachability_Jump(world,area1,area2) start=center(world,area1);finish=center(world,area2);if finish[2]-start[2]>AAS_MaxJumpHeight(world,world.physics.jumpVelocity) or VectorDistance(start,finish)>AAS_MaxJumpDistance(world,world.physics.jumpVelocity) then return false end if;return addReach(world,area1,area2,TRAVEL_JUMP,start,finish,0,0,10) end function
/// Apply `mq3.botlib.aas_reachability.AAS_AreaLadder`, `mq3.botlib.aas_reachability.overlap` and `mq3.botlib.aas_reachability.addReach` while evaluating `AAS_Reachability_Ladder`.
/// @param world World data; accesses `areas`.
/// @param area1 AAS area number; zero denotes no area.
/// @param area2 AAS area number; zero denotes no area.
function AAS_Reachability_Ladder(world,area1,area2) if not AAS_AreaLadder(world,area1) and not AAS_AreaLadder(world,area2) then return false end if;if not overlap(world.areas[area1],world.areas[area2],32.0) then return false end if;return addReach(world,area1,area2,TRAVEL_LADDER,center(world,area1),center(world,area2),0,0,travelTime(VectorDistance(center(world,area1),center(world,area2)),100.0,1)) end function
/// Use `world.services.teamFn` to perform `AAS_TravelFlagsForTeam`.
/// @param world World data; accesses `services`.
/// @param ent Value passed as argument 2 to `world.services.teamFn`.
function AAS_TravelFlagsForTeam(world,ent) if world.services.teamFn==void then return 0 end if;team=world.services.teamFn(world.services.context,ent);if team==1 then return TRAVELFLAG_NOTTEAM1 else if team==2 then return TRAVELFLAG_NOTTEAM2 end if;return 0 end function
/// Apply `mq3.botlib.aas_reachability.addReach` while evaluating `addSpecial`. Return paths include `count`.
/// @param world World data; accesses `specials`.
/// @param kind Value used by `addSpecial` in `for each value in world.specials if value.kind==kind and addReach(world,value.sourceArea,value.destinationArea,t...`.
/// @param travelType AAS reachability travel-type code.
function addSpecial(world,kind,travelType) count=0;for each value in world.specials if value.kind==kind and addReach(world,value.sourceArea,value.destinationArea,travelType,value.start,value.finish,value.entity,value.model,1) then count=count+1 end if end for;return count end function
/// Forward `AAS_Reachability_Teleport` to `mq3.botlib.aas_reachability.addSpecial` and return the delegated result.
/// @param world World data; accesses `specials`.
function AAS_Reachability_Teleport(world) return addSpecial(world,"teleport",TRAVEL_TELEPORT) end function
/// Forward `AAS_Reachability_Elevator` to `mq3.botlib.aas_reachability.addSpecial` and return the delegated result.
/// @param world World data; accesses `specials`.
function AAS_Reachability_Elevator(world) return addSpecial(world,"elevator",TRAVEL_ELEVATOR) end function
/// Forward `AAS_Reachability_FuncBobbing` to `mq3.botlib.aas_reachability.addSpecial` and return the delegated result.
/// @param world World data; accesses `specials`.
function AAS_Reachability_FuncBobbing(world) return addSpecial(world,"func_bobbing",TRAVEL_FUNCBOB) end function
/// Forward `AAS_Reachability_JumpPad` to `mq3.botlib.aas_reachability.addSpecial` and return the delegated result.
/// @param world World data; accesses `specials`.
function AAS_Reachability_JumpPad(world) return addSpecial(world,"jumppad",TRAVEL_JUMPPAD) end function
/// Apply `mq3.botlib.aas_reachability.center` and `mq3.botlib.aas_reachability.addReach` while evaluating `AAS_Reachability_Grapple`.
/// @param world World data; accesses `calcGrapple`.
/// @param area1 AAS area number; zero denotes no area.
/// @param area2 AAS area number; zero denotes no area.
function AAS_Reachability_Grapple(world,area1,area2) if not world.calcGrapple or center(world,area2)[2]<=center(world,area1)[2]+32.0 then return false end if;return addReach(world,area1,area2,TRAVEL_GRAPPLEHOOK,center(world,area1),center(world,area2),0,0,50) end function
/// Set `world.settings[value.destinationArea].flags` to `world.settings[value.destinationArea].flags|AREA_WEAPONJUMP` in `mq3.botlib.aas_reachability.AAS_SetWeaponJumpAreaFlags`.
/// @param world World data; accesses `specials` and `settings`. May update `world.settings[value.destinationArea].flags` in place.
function AAS_SetWeaponJumpAreaFlags(world) for each value in world.specials if value.kind=="item" and valid(world,value.destinationArea) then world.settings[value.destinationArea].flags=world.settings[value.destinationArea].flags|AREA_WEAPONJUMP end if end for;return void end function
/// Apply `mq3.botlib.aas_reachability.center`, `mq3.botlib.aas_reachability.AAS_MaxJumpHeight` and `mq3.botlib.aas_reachability.addReach` while evaluating `AAS_Reachability_WeaponJump`.
/// @param world World data; accesses `settings` and `physics`.
/// @param area1 AAS area number; zero denotes no area.
/// @param area2 AAS area number; zero denotes no area.
function AAS_Reachability_WeaponJump(world,area1,area2) if (world.settings[area2].flags&AREA_WEAPONJUMP)==0 then return false end if;rise=center(world,area2)[2]-center(world,area1)[2];if rise<=AAS_MaxJumpHeight(world,world.physics.jumpVelocity) then return false end if;return addReach(world,area1,area2,TRAVEL_ROCKETJUMP,center(world,area1),center(world,area2),0,0,100) end function
/// Apply `mq3.botlib.aas_reachability.center`, `mq3.botlib.aas_reachability.overlap` and `mq3.botlib.aas_reachability.addReach` while evaluating `AAS_Reachability_WalkOffLedge`. Return paths include `count`.
/// @param world World data; accesses `areas` and `physics`.
/// @param areaNum AAS area number; zero denotes no area.
function AAS_Reachability_WalkOffLedge(world,areaNum) count=0;for destination=1 to len(world.areas)-1 if destination!=areaNum and center(world,destination)[2]<center(world,areaNum)[2]-world.physics.step and overlap(world.areas[areaNum],world.areas[destination],64.0) then if addReach(world,areaNum,destination,TRAVEL_WALKOFFLEDGE,center(world,areaNum),center(world,destination),0,0,world.physics.startWalkOff) then count=count+1 end if end if end for;return count end function
/// Apply `mq3.botlib.aas_reachability.AAS_ReachabilityExists`, `mq3.botlib.aas_reachability.AAS_Reachability_Swim` and `mq3.botlib.aas_reachability.AAS_Reachability_EqualFloorHeight` while evaluating `AAS_FindFaceReachabilities`. Return paths include `count`.
/// @param world World data; accesses `areas`.
/// @param areaNum AAS area number; zero denotes no area.
function AAS_FindFaceReachabilities(world,areaNum)
  count=0;for destination=1 to len(world.areas)-1 if destination==areaNum or AAS_ReachabilityExists(world,areaNum,destination) then continue end if;if AAS_Reachability_Swim(world,areaNum,destination) or AAS_Reachability_EqualFloorHeight(world,areaNum,destination) or AAS_Reachability_Step_Barrier_WaterJump_WalkOffLedge(world,areaNum,destination) or AAS_Reachability_Ladder(world,areaNum,destination) or AAS_Reachability_Jump(world,areaNum,destination) then count=count+1 end if end for;return count
end function
/// Update `world.stored`, `world.settings[areaNum].firstReachableArea` and `world.settings[areaNum].numReachableAreas` during `AAS_StoreReachability`. Return paths include `len(world.stored)`.
/// @param world World data; accesses `stored`, `settings` and `reachesByArea`. May update `world.stored`, `world.settings[areaNum].firstReachableArea` and `world.settings[areaNum].numReachableAreas` in place.
function AAS_StoreReachability(world)
  world.stored=[Reach(0,0,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,false)];for areaNum=0 to len(world.settings)-1 world.settings[areaNum].firstReachableArea=len(world.stored);world.settings[areaNum].numReachableAreas=len(world.reachesByArea[areaNum]);for each value in world.reachesByArea[areaNum] world.stored=world.stored+[value] end for end for;return len(world.stored)
end function
/// Record or dispatch `"complete"` actions in `AAS_ContinueInitReachability`.
/// @param world World data; accesses `loaded`, `numReachabilityAreas`, `areas` and `stored`. May update `world.numReachabilityAreas` in place.
/// @param time Not read by this implementation; retained in the `AAS_ContinueInitReachability` signature.
function AAS_ContinueInitReachability(world,time)
  if not world.loaded or world.numReachabilityAreas>=len(world.areas)+2 then return false end if
  if world.numReachabilityAreas<len(world.areas) then areaNum=world.numReachabilityAreas;world.numReachabilityAreas=world.numReachabilityAreas+1;if areaNum>0 and not AAS_AreaJumpPad(world,areaNum) then AAS_FindFaceReachabilities(world,areaNum) end if;return true end if
  if world.numReachabilityAreas==len(world.areas) then world.numReachabilityAreas=world.numReachabilityAreas+1;return true end if
  for areaNum=1 to len(world.areas)-1 if not AAS_AreaJumpPad(world,areaNum) then AAS_Reachability_WalkOffLedge(world,areaNum) end if end for;AAS_Reachability_JumpPad(world);AAS_Reachability_Teleport(world);AAS_Reachability_Elevator(world);AAS_Reachability_FuncBobbing(world);AAS_StoreReachability(world);AAS_ShutDownReachabilityHeap(world);world.numReachabilityAreas=world.numReachabilityAreas+1;emit(world,"complete",0,0,str(len(world.stored)));return true
end function
/// Update `world.numReachabilityAreas` and `world.saveFile` during `AAS_InitReachability`.
/// @param world World data; accesses `loaded`, `map`, `forceReachability`, `numReachabilityAreas` and `areas` and related fields. May update `world.numReachabilityAreas` and `world.saveFile` in place.
function AAS_InitReachability(world)
  if not world.loaded then return false end if;if world.map.counts[aas.LUMP_REACHABILITY]>0 and not world.forceReachability then world.numReachabilityAreas=len(world.areas)+2;return true end if;world.saveFile=true;world.numReachabilityAreas=1;AAS_SetupReachabilityHeap(world);AAS_SetWeaponJumpAreaFlags(world);return true
end function



