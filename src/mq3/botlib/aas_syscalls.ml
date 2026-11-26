// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// QVM ABI marshalling for the Baseq3 AAS subset implemented by aas_runtime.
package mq3.botlib.aas_syscalls

import mq3.botlib.aas_runtime as aasRuntime
import mq3.botlib.aas_bspq3 as bspq3
import mq3.botlib.aas_routing as aasRouting
import mq3.botlib.aas_routing_cache as aasRoutingCache
import mq3.vm.syscall_common as common
import mq3.compat.numeric as n
import mq3.compat.textnumbers as textNumbers

/// Write three float bit patterns to consecutive VM memory words for aas syscalls.
/// @param data Value passed as argument 1 to `mq3.compat.numeric.writeU32`.
/// @param address Address within the VM memory or native data buffer.
/// @param value Array or byte sequence accessed at `axis`.
function writeVector(data,address,value)
  for axis=0 to 2 n.writeU32(data,address+axis*4,n.floatBits(value[axis])) end for
  return void
end function

/// Apply `mq3.vm.syscall_common.readFloatVector`, `mq3.botlib.aas_runtime.bboxAreas` and `mq3.vm.syscall_common.pointer` while evaluating `bboxAreas`. Return paths include `len(areas)`.
/// @param runtime AAS runtime; accesses `initialized` and `map`.
/// @param vm Vm record; accesses `data`.
/// @param minsAddress Address within the VM memory or native data buffer.
/// @param maxsAddress Address within the VM memory or native data buffer.
/// @param areasAddress Value used by `pointer` in `if value==0 then return fail(label+" is NULL") end if`.
/// @param maximum Upper bound applied by the operation.
function bboxAreas(runtime,vm,minsAddress,maxsAddress,areasAddress,maximum)
  mins=common.readFloatVector(vm,minsAddress,3,"AAS bbox mins");if mins is error then return mins end if
  maxs=common.readFloatVector(vm,maxsAddress,3,"AAS bbox maxs");if maxs is error then return maxs end if
  areas=aasRuntime.bboxAreas(runtime,mins,maxs,maximum)
  if len(areas)>0 then
    output=common.pointer(vm,areasAddress,maximum*4,"AAS bbox area output");if output is error then return output end if
    for index=0 to len(areas)-1 n.writeU32(vm.data,output+index*4,areas[index]) end for
  end if
  return len(areas)
end function

// aas_areainfo_t in the pinned Baseq3 be_aas.h contains four ints followed
// by mins, maxs and center. clusterAreaNum/reachability metadata remains an
// internal runtime detail and is deliberately not written into the 52-byte ABI.
/// @param runtime AAS runtime; accesses `map` and `disabled`.
/// @param vm Vm record; accesses `data`.
/// @param areaNum AAS area number; zero denotes no area.
/// @param address Address within the VM memory or native data buffer.
function areaInfo(runtime,vm,areaNum,address)
  info=aasRuntime.areaInfo(runtime,areaNum);if info is error then return 0 end if
  output=common.pointer(vm,address,52,"AAS area info output");if output is error then return output end if
  n.writeU32(vm.data,output,info.contents);n.writeU32(vm.data,output+4,info.flags)
  n.writeU32(vm.data,output+8,info.presenceType);n.writeU32(vm.data,output+12,info.cluster)
  writeVector(vm.data,output+16,info.mins);writeVector(vm.data,output+28,info.maxs);writeVector(vm.data,output+40,info.center)
  return 1
end function

/// Apply `mq3.botlib.aas_runtime.presenceTypeBoundingBox`, `mq3.vm.syscall_common.pointer` and `mq3.botlib.aas_syscalls.writeVector` while evaluating `presenceTypeBoundingBox`.
/// @param vm Vm record; accesses `data`.
/// @param presenceType AAS presence type selecting the movement bounds.
/// @param minsAddress Value used by `pointer` in `if value==0 then return fail(label+" is NULL") end if`.
/// @param maxsAddress Value used by `pointer` in `if value==0 then return fail(label+" is NULL") end if`.
function presenceTypeBoundingBox(vm,presenceType,minsAddress,maxsAddress)
  bounds=aasRuntime.presenceTypeBoundingBox(presenceType);if bounds is error then return 0 end if
  mins=common.pointer(vm,minsAddress,12,"AAS presence mins");if mins is error then return mins end if
  maxs=common.pointer(vm,maxsAddress,12,"AAS presence maxs");if maxs is error then return maxs end if
  writeVector(vm.data,mins,bounds[0]);writeVector(vm.data,maxs,bounds[1]);return 0
end function

/// Apply `mq3.vm.syscall_common.readFloatVector` and `mq3.botlib.aas_runtime.pointAreaNum` while evaluating `pointAreaNum`. Return paths include `aasRuntime.pointAreaNum(runtime,point)`.
/// @param runtime AAS runtime; accesses `initialized`, `map`, `nodeCache` and `planeCache`. May update `runtime.nodeCache[nodeNum]` and `runtime.planeCache[node.planeNum]` in place.
/// @param vm VM instance owning the syscall memory and state.
/// @param address Address within the VM memory or native data buffer.
function pointAreaNum(runtime,vm,address)
  point=common.readFloatVector(vm,address,3,"AAS point");if point is error then return point end if
  return aasRuntime.pointAreaNum(runtime,point)
end function

/// Create a `mq3.botlib.aas_bspq3.State` record, initializing `loaded` as `true`, `numEntities` as `len(entities)` and `entities` from `entities`.
/// @param entities Initial value stored in `mq3.botlib.aas_bspq3.State.entities`.
function entityState(entities) return bspq3.State(true,0,"",len(entities),entities) end function
/// Forward `nextBspEntity` to `mq3.botlib.aas_bspq3.AAS_NextBSPEntity` and return the delegated result.
/// @param entities Initial value stored in `mq3.botlib.aas_bspq3.State.entities`.
/// @param current Operand used to evaluate the returned expression `entity`.
function nextBspEntity(entities,current) return bspq3.AAS_NextBSPEntity(entityState(entities),current) end function
/// Forward `bspValue` to `mq3.botlib.aas_bspq3.AAS_ValueForBSPEpairKey` and return the delegated result.
/// @param entities Initial value stored in `mq3.botlib.aas_bspq3.State.entities`.
/// @param entity Operand used to evaluate the returned expression `state!=void and entity>0 and entity<state.numEntities`.
/// @param key Lookup key or field name used by the operation.
function bspValue(entities,entity,key)
  return bspq3.AAS_ValueForBSPEpairKey(entityState(entities),entity,key)
end function
/// Apply `mq3.vm.syscall_common.argument`, `mq3.vm.syscall_common.readString` and `mq3.vm.syscall_common.writeBuffer` while evaluating `bspString`.
/// @param entities Initial value stored in `mq3.botlib.aas_bspq3.State.entities`.
/// @param vm VM instance owning the syscall memory and state.
/// @param base Address within the VM memory or native data buffer.
function bspString(entities,vm,base)
  entity=common.argument(vm,base,1);key=common.readString(vm,common.argument(vm,base,2));if key is error then return key end if
  cleared=common.writeBuffer(vm,common.argument(vm,base,3),common.argument(vm,base,4),"","AAS BSP epair output");if cleared is error then return cleared end if
  pair=bspValue(entities,entity,key);if not pair[0] then return 0 end if
  written=common.writeBuffer(vm,common.argument(vm,base,3),common.argument(vm,base,4),pair[1],"AAS BSP epair output");if written is error then return written end if;return 1
end function
/// Apply `mq3.vm.syscall_common.readString`, `mq3.vm.syscall_common.argument` and `mq3.botlib.aas_syscalls.bspValue` while evaluating `bspVector`.
/// @param entities Initial value stored in `mq3.botlib.aas_bspq3.State.entities`.
/// @param vm Vm record; accesses `data`.
/// @param base Address within the VM memory or native data buffer.
function bspVector(entities,vm,base)
  key=common.readString(vm,common.argument(vm,base,2));if key is error then return key end if;pair=bspValue(entities,common.argument(vm,base,1),key)
  if not pair[0] then return 0 end if;parsed=textNumbers.vector(pair[1],[0.0,0.0,0.0]);if parsed[0]!=3 then return 0 end if
  output=common.pointer(vm,common.argument(vm,base,3),12,"AAS BSP vector output");if output is error then return output end if;writeVector(vm.data,output,parsed[1]);return 1
end function
/// Apply `mq3.vm.syscall_common.readString`, `mq3.vm.syscall_common.argument` and `mq3.botlib.aas_syscalls.bspValue` while evaluating `bspFloat`.
/// @param entities Initial value stored in `mq3.botlib.aas_bspq3.State.entities`.
/// @param vm Vm record; accesses `data`.
/// @param base Address within the VM memory or native data buffer.
function bspFloat(entities,vm,base)
  key=common.readString(vm,common.argument(vm,base,2));if key is error then return key end if;pair=bspValue(entities,common.argument(vm,base,1),key);if not pair[0] then return 0 end if
  output=common.pointer(vm,common.argument(vm,base,3),4,"AAS BSP float output");if output is error then return output end if;n.writeU32(vm.data,output,n.floatBits(textNumbers.atof32(pair[1])));return 1
end function
/// Apply `mq3.vm.syscall_common.readString`, `mq3.vm.syscall_common.argument` and `mq3.botlib.aas_syscalls.bspValue` while evaluating `bspInt`.
/// @param entities Initial value stored in `mq3.botlib.aas_bspq3.State.entities`.
/// @param vm Vm record; accesses `data`.
/// @param base Address within the VM memory or native data buffer.
function bspInt(entities,vm,base)
  key=common.readString(vm,common.argument(vm,base,2));if key is error then return key end if;pair=bspValue(entities,common.argument(vm,base,1),key);if not pair[0] then return 0 end if
  output=common.pointer(vm,common.argument(vm,base,3),4,"AAS BSP int output");if output is error then return output end if;n.writeU32(vm.data,output,textNumbers.atoi(pair[1]));return 1
end function

/// Apply `mq3.botlib.aas_runtime.enableRoutingArea`, `mq3.vm.syscall_common.argument` and `mq3.botlib.aas_syscalls.bboxAreas` while evaluating `dispatchCached`.
/// @param runtime AAS syscalls runtime; accesses `initialized`.
/// @param router AAS routing state; accesses `runtime` and `settings`.
/// @param routeCache Routing cache state; accesses `router`, `routeIndex`, `hits`, `serial` and `routeLru` and related fields. May update `routeCache.hits`, `routeCache.serial` and `routeCache.misses` and additional fields in place.
/// @param entities Initial value stored in `mq3.botlib.aas_bspq3.State.entities`.
/// @param vm VM instance owning the syscall memory and state.
/// @param base Address within the VM memory or native data buffer.
/// @param op Numeric syscall operation identifier.
function dispatchCached(runtime,router,routeCache,entities,vm,base,op)
  if op==300 then return aasRuntime.enableRoutingArea(runtime,common.argument(vm,base,1),common.argument(vm,base,2)) end if
  if op==301 then return bboxAreas(runtime,vm,common.argument(vm,base,1),common.argument(vm,base,2),common.argument(vm,base,3),common.argument(vm,base,4)) end if
  if op==302 then return areaInfo(runtime,vm,common.argument(vm,base,1),common.argument(vm,base,2)) end if
  if op==304 then if runtime!=void and runtime.initialized then return 1 else return 0 end if end if
  if op==305 then return presenceTypeBoundingBox(vm,common.argument(vm,base,1),common.argument(vm,base,2),common.argument(vm,base,3)) end if
  if op==306 then return n.floatBits(aasRuntime.getTime(runtime)) end if
  if op==307 then return pointAreaNum(runtime,vm,common.argument(vm,base,1)) end if
  if op==310 then return nextBspEntity(entities,common.argument(vm,base,1)) end if
  if op==311 then return bspString(entities,vm,base) end if
  if op==312 then return bspVector(entities,vm,base) end if
  if op==313 then return bspFloat(entities,vm,base) end if
  if op==314 then return bspInt(entities,vm,base) end if
  if op==315 then return aasRuntime.areaReachability(runtime,common.argument(vm,base,1)) end if
  if op==316 then origin=common.readFloatVector(vm,common.argument(vm,base,2),3,"AAS route origin");if origin is error then return origin end if;if routeCache!=void then return aasRoutingCache.areaTravelTimeToGoalArea(routeCache,common.argument(vm,base,1),origin,common.argument(vm,base,3),common.argument(vm,base,4)) end if;return aasRouting.areaTravelTimeToGoalArea(router,common.argument(vm,base,1),origin,common.argument(vm,base,3),common.argument(vm,base,4)) end if
  return error(7521,"unsupported Baseq3 AAS trap "+str(op))
end function
/// Forward `dispatch` to `mq3.botlib.aas_syscalls.dispatchCached` and return the delegated result.
/// @param runtime AAS syscalls runtime; accesses `initialized`.
/// @param router AAS routing state; accesses `runtime` and `settings`.
/// @param entities Initial value stored in `mq3.botlib.aas_bspq3.State.entities`.
/// @param vm VM instance owning the syscall memory and state.
/// @param base Address within the VM memory or native data buffer.
/// @param op Numeric syscall operation identifier.
function dispatch(runtime,router,entities,vm,base,op) return dispatchCached(runtime,router,void,entities,vm,base,op) end function
