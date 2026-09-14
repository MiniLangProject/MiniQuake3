// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// QVM ABI for Baseq3 AAS route traps 575-577.
package mq3.botlib.aas_route_extra_syscalls

import mq3.botlib.aas_route_extras as extras
import mq3.vm.syscall_common as common
import mq3.compat.numeric as n

const PREDICT_ROUTE_SIZE=36
const ALTERNATIVE_GOAL_SIZE=24
function writeVector(data,address,value) for axis=0 to 2 n.writeU32(data,address+axis*4,n.floatBits(value[axis])) end for;return void end function
function writeU16(data,address,value) data[address]=value&255;data[address+1]=(value>>8)&255;return void end function
function readPredictRoute(vm,address)
  at=common.pointer(vm,address,PREDICT_ROUTE_SIZE,"AAS predicted route output");if at is error then return at end if
  return extras.PredictRoute([n.bitsFloat(n.readU32(vm.data,at)),n.bitsFloat(n.readU32(vm.data,at+4)),n.bitsFloat(n.readU32(vm.data,at+8))],n.readI32(vm.data,at+12),n.readI32(vm.data,at+16),n.readI32(vm.data,at+20),n.readI32(vm.data,at+24),n.readI32(vm.data,at+28),n.readI32(vm.data,at+32))
end function
function writePredictRoute(vm,address,value)
  at=common.pointer(vm,address,PREDICT_ROUTE_SIZE,"AAS predicted route output");if at is error then return at end if;writeVector(vm.data,at,value.endPos);n.writeU32(vm.data,at+12,value.endArea);n.writeU32(vm.data,at+16,value.stopEvent);n.writeU32(vm.data,at+20,value.endContents);n.writeU32(vm.data,at+24,value.endTravelFlags);n.writeU32(vm.data,at+28,value.numAreas);n.writeU32(vm.data,at+32,value.time);return 0
end function
function writeAlternativeGoals(vm,address,values,maximum)
  if len(values)==0 then return 0 end if;at=common.pointer(vm,address,maximum*ALTERNATIVE_GOAL_SIZE,"AAS alternative-route goals");if at is error then return at end if
  for index=0 to len(values)-1 value=values[index];offset=at+index*ALTERNATIVE_GOAL_SIZE;writeVector(vm.data,offset,value.origin);n.writeU32(vm.data,offset+12,value.areaNum);writeU16(vm.data,offset+16,value.startTravelTime);writeU16(vm.data,offset+18,value.goalTravelTime);writeU16(vm.data,offset+20,value.extraTravelTime) end for;return len(values)
end function

function dispatch(state,router,vm,base,op)
  if op==extras.OP_ALTERNATIVE_ROUTE_GOAL then
    start=common.readFloatVector(vm,common.argument(vm,base,1),3,"AAS alternative-route start");if start is error then return start end if;goal=common.readFloatVector(vm,common.argument(vm,base,3),3,"AAS alternative-route goal");if goal is error then return goal end if;maximum=common.argument(vm,base,7);if maximum<0 or maximum>65536 then return error(7534,"invalid AAS alternative-route capacity") end if
    values=extras.alternativeRouteGoals(router,start,common.argument(vm,base,2),goal,common.argument(vm,base,4),common.argument(vm,base,5),maximum,common.argument(vm,base,8));return writeAlternativeGoals(vm,common.argument(vm,base,6),values,maximum)
  end if
  if op==extras.OP_PREDICT_ROUTE then
    address=common.argument(vm,base,1);value=readPredictRoute(vm,address);if value is error then return value end if;origin=common.readFloatVector(vm,common.argument(vm,base,3),3,"AAS predicted-route origin");if origin is error then return origin end if
    result=extras.predictRoute(router,value,common.argument(vm,base,2),origin,common.argument(vm,base,4),common.argument(vm,base,5),common.argument(vm,base,6),common.argument(vm,base,7),common.argument(vm,base,8),common.argument(vm,base,9),common.argument(vm,base,10),common.argument(vm,base,11));written=writePredictRoute(vm,address,value);if written is error then return written end if;return result
  end if
  if op==extras.OP_POINT_REACHABILITY_AREA_INDEX then address=common.argument(vm,base,1);if address==0 then return extras.pointReachabilityAreaIndex(state,void) end if;point=common.readFloatVector(vm,address,3,"AAS reachability-index point");if point is error then return point end if;return extras.pointReachabilityAreaIndex(state,point) end if
  return error(7534,"unsupported Baseq3 extended AAS trap "+str(op))
end function
