// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// QVM ABI for Baseq3 AAS route traps 575-577.
package mq3.botlib.aas_route_extra_syscalls

import mq3.botlib.aas_route_extras as extras
import mq3.vm.syscall_common as common
import mq3.compat.numeric as n

/// Byte size of the predict route record in the bot VM ABI or serialized representation.
const PREDICT_ROUTE_SIZE=36
/// Byte size of the alternative goal record in the bot VM ABI or serialized representation.
const ALTERNATIVE_GOAL_SIZE=24
/// Write three float bit patterns to consecutive VM memory words for aas route extra syscalls.
/// @param data Value passed as argument 1 to `mq3.compat.numeric.writeU32`.
/// @param address Address within the VM memory or native data buffer.
/// @param value Array or byte sequence accessed at `axis`.
function writeVector(data,address,value) for axis=0 to 2 n.writeU32(data,address+axis*4,n.floatBits(value[axis])) end for;return void end function
/// Set `data[address]` to `value&255` and `data[address+1]` to `(value>>8)&255` in `mq3.botlib.aas_route_extra_syscalls.writeU16`.
/// @param data Array or byte sequence accessed at `address` and `address+1`. Entries are written in place.
/// @param address Address within the VM memory or native data buffer.
/// @param value Value used by `writeU16` in `data[address]=value&255`.
function writeU16(data,address,value) data[address]=value&255;data[address+1]=(value>>8)&255;return void end function
/// Build the `mq3.botlib.aas_route_extras.PredictRoute` result for `readPredictRoute`.
/// @param vm Vm record; accesses `data`.
/// @param address Address within the VM memory or native data buffer.
function readPredictRoute(vm,address)
  at=common.pointer(vm,address,PREDICT_ROUTE_SIZE,"AAS predicted route output");if at is error then return at end if
  return extras.PredictRoute([n.bitsFloat(n.readU32(vm.data,at)),n.bitsFloat(n.readU32(vm.data,at+4)),n.bitsFloat(n.readU32(vm.data,at+8))],n.readI32(vm.data,at+12),n.readI32(vm.data,at+16),n.readI32(vm.data,at+20),n.readI32(vm.data,at+24),n.readI32(vm.data,at+28),n.readI32(vm.data,at+32))
end function
/// Apply `mq3.vm.syscall_common.pointer` and `mq3.botlib.aas_route_extra_syscalls.writeVector` while evaluating `writePredictRoute`.
/// @param vm Vm record; accesses `data`.
/// @param address Address within the VM memory or native data buffer.
/// @param value Value record; accesses `endPos`, `endArea`, `stopEvent`, `endContents` and `endTravelFlags` and related fields.
function writePredictRoute(vm,address,value)
  at=common.pointer(vm,address,PREDICT_ROUTE_SIZE,"AAS predicted route output");if at is error then return at end if;writeVector(vm.data,at,value.endPos);n.writeU32(vm.data,at+12,value.endArea);n.writeU32(vm.data,at+16,value.stopEvent);n.writeU32(vm.data,at+20,value.endContents);n.writeU32(vm.data,at+24,value.endTravelFlags);n.writeU32(vm.data,at+28,value.numAreas);n.writeU32(vm.data,at+32,value.time);return 0
end function
/// Apply `mq3.vm.syscall_common.pointer`, `mq3.botlib.aas_route_extra_syscalls.writeVector` and `mq3.botlib.aas_route_extra_syscalls.writeU16` while evaluating `writeAlternativeGoals`. Return paths include `len(values)`.
/// @param vm Vm record; accesses `data`.
/// @param address Address within the VM memory or native data buffer.
/// @param values Array or byte sequence accessed at `index`.
/// @param maximum Upper bound applied by the operation.
function writeAlternativeGoals(vm,address,values,maximum)
  if len(values)==0 then return 0 end if;at=common.pointer(vm,address,maximum*ALTERNATIVE_GOAL_SIZE,"AAS alternative-route goals");if at is error then return at end if
  for index=0 to len(values)-1 value=values[index];offset=at+index*ALTERNATIVE_GOAL_SIZE;writeVector(vm.data,offset,value.origin);n.writeU32(vm.data,offset+12,value.areaNum);writeU16(vm.data,offset+16,value.startTravelTime);writeU16(vm.data,offset+18,value.goalTravelTime);writeU16(vm.data,offset+20,value.extraTravelTime) end for;return len(values)
end function

/// Apply `mq3.vm.syscall_common.readFloatVector`, `mq3.vm.syscall_common.argument` and `mq3.botlib.aas_route_extras.alternativeRouteGoals` while evaluating `dispatchCached`.
/// @param state AAS route extras state; accesses `initialized` and `map`.
/// @param router AAS routing state; accesses `settings` and `runtime`.
/// @param cache Routing cache state; accesses `router`.
/// @param vm VM instance owning the syscall memory and state.
/// @param base Address within the VM memory or native data buffer.
/// @param op Numeric syscall operation identifier.
function dispatchCached(state,router,cache,vm,base,op)
  if op==extras.OP_ALTERNATIVE_ROUTE_GOAL then
    start=common.readFloatVector(vm,common.argument(vm,base,1),3,"AAS alternative-route start");if start is error then return start end if;goal=common.readFloatVector(vm,common.argument(vm,base,3),3,"AAS alternative-route goal");if goal is error then return goal end if;maximum=common.argument(vm,base,7);if maximum<0 or maximum>65536 then return error(7534,"invalid AAS alternative-route capacity") end if
    values=extras.alternativeRouteGoals(router,start,common.argument(vm,base,2),goal,common.argument(vm,base,4),common.argument(vm,base,5),maximum,common.argument(vm,base,8));return writeAlternativeGoals(vm,common.argument(vm,base,6),values,maximum)
  end if
  if op==extras.OP_PREDICT_ROUTE then
    address=common.argument(vm,base,1);value=readPredictRoute(vm,address);if value is error then return value end if;origin=common.readFloatVector(vm,common.argument(vm,base,3),3,"AAS predicted-route origin");if origin is error then return origin end if
    result=extras.predictRouteCached(router,cache,value,common.argument(vm,base,2),origin,common.argument(vm,base,4),common.argument(vm,base,5),common.argument(vm,base,6),common.argument(vm,base,7),common.argument(vm,base,8),common.argument(vm,base,9),common.argument(vm,base,10),common.argument(vm,base,11));written=writePredictRoute(vm,address,value);if written is error then return written end if;return result
  end if
  if op==extras.OP_POINT_REACHABILITY_AREA_INDEX then address=common.argument(vm,base,1);if address==0 then return extras.pointReachabilityAreaIndex(state,void) end if;point=common.readFloatVector(vm,address,3,"AAS reachability-index point");if point is error then return point end if;return extras.pointReachabilityAreaIndex(state,point) end if
  return error(7534,"unsupported Baseq3 extended AAS trap "+str(op))
end function

/// Forward `dispatch` to `mq3.botlib.aas_route_extra_syscalls.dispatchCached` and return the delegated result.
/// @param state AAS route extras state; accesses `initialized` and `map`.
/// @param router AAS routing state; accesses `settings` and `runtime`.
/// @param vm VM instance owning the syscall memory and state.
/// @param base Address within the VM memory or native data buffer.
/// @param op Numeric syscall operation identifier.
function dispatch(state,router,vm,base,op) return dispatchCached(state,router,void,vm,base,op) end function
