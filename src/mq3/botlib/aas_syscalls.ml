// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// QVM ABI marshalling for the Baseq3 AAS subset implemented by aas_runtime.
package mq3.botlib.aas_syscalls

import mq3.botlib.aas_runtime as aasRuntime
import mq3.botlib.aas_routing as aasRouting
import mq3.vm.syscall_common as common
import mq3.compat.numeric as n
import mq3.compat.textnumbers as textNumbers

function writeVector(data,address,value)
  for axis=0 to 2 n.writeU32(data,address+axis*4,n.floatBits(value[axis])) end for
  return void
end function

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
function areaInfo(runtime,vm,areaNum,address)
  info=aasRuntime.areaInfo(runtime,areaNum);if info is error then return 0 end if
  output=common.pointer(vm,address,52,"AAS area info output");if output is error then return output end if
  n.writeU32(vm.data,output,info.contents);n.writeU32(vm.data,output+4,info.flags)
  n.writeU32(vm.data,output+8,info.presenceType);n.writeU32(vm.data,output+12,info.cluster)
  writeVector(vm.data,output+16,info.mins);writeVector(vm.data,output+28,info.maxs);writeVector(vm.data,output+40,info.center)
  return 1
end function

function presenceTypeBoundingBox(vm,presenceType,minsAddress,maxsAddress)
  bounds=aasRuntime.presenceTypeBoundingBox(presenceType);if bounds is error then return 0 end if
  mins=common.pointer(vm,minsAddress,12,"AAS presence mins");if mins is error then return mins end if
  maxs=common.pointer(vm,maxsAddress,12,"AAS presence maxs");if maxs is error then return maxs end if
  writeVector(vm.data,mins,bounds[0]);writeVector(vm.data,maxs,bounds[1]);return 0
end function

function pointAreaNum(runtime,vm,address)
  point=common.readFloatVector(vm,address,3,"AAS point");if point is error then return point end if
  return aasRuntime.pointAreaNum(runtime,point)
end function

function nextBspEntity(entities,current)
  // Entity zero is worldspawn and is not returned by AAS_NextBSPEntity.
  next=current+1;if next<1 or next>=len(entities) then return 0 end if;return next
end function
function bspValue(entities,entity,key)
  if entity<1 or entity>=len(entities) then return [false,""] end if
  for each pair in entities[entity] if pair[0]==key then return [true,pair[1]] end if end for
  return [false,""]
end function
function bspString(entities,vm,base)
  entity=common.argument(vm,base,1);key=common.readString(vm,common.argument(vm,base,2));if key is error then return key end if
  cleared=common.writeBuffer(vm,common.argument(vm,base,3),common.argument(vm,base,4),"","AAS BSP epair output");if cleared is error then return cleared end if
  pair=bspValue(entities,entity,key);if not pair[0] then return 0 end if
  written=common.writeBuffer(vm,common.argument(vm,base,3),common.argument(vm,base,4),pair[1],"AAS BSP epair output");if written is error then return written end if;return 1
end function
function bspVector(entities,vm,base)
  key=common.readString(vm,common.argument(vm,base,2));if key is error then return key end if;pair=bspValue(entities,common.argument(vm,base,1),key)
  if not pair[0] then return 0 end if;parsed=textNumbers.vector(pair[1],[0.0,0.0,0.0]);if parsed[0]!=3 then return 0 end if
  output=common.pointer(vm,common.argument(vm,base,3),12,"AAS BSP vector output");if output is error then return output end if;writeVector(vm.data,output,parsed[1]);return 1
end function
function bspFloat(entities,vm,base)
  key=common.readString(vm,common.argument(vm,base,2));if key is error then return key end if;pair=bspValue(entities,common.argument(vm,base,1),key);if not pair[0] then return 0 end if
  output=common.pointer(vm,common.argument(vm,base,3),4,"AAS BSP float output");if output is error then return output end if;n.writeU32(vm.data,output,n.floatBits(textNumbers.atof32(pair[1])));return 1
end function
function bspInt(entities,vm,base)
  key=common.readString(vm,common.argument(vm,base,2));if key is error then return key end if;pair=bspValue(entities,common.argument(vm,base,1),key);if not pair[0] then return 0 end if
  output=common.pointer(vm,common.argument(vm,base,3),4,"AAS BSP int output");if output is error then return output end if;n.writeU32(vm.data,output,textNumbers.atoi(pair[1]));return 1
end function

function dispatch(runtime,router,entities,vm,base,op)
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
  if op==316 then origin=common.readFloatVector(vm,common.argument(vm,base,2),3,"AAS route origin");if origin is error then return origin end if;return aasRouting.areaTravelTimeToGoalArea(router,common.argument(vm,base,1),origin,common.argument(vm,base,3),common.argument(vm,base,4)) end if
  return error(7521,"unsupported Baseq3 AAS trap "+str(op))
end function
