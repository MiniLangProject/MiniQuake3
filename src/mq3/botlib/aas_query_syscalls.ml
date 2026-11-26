// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// QVM layouts for bot_entitystate_t, aas_entityinfo_t and AAS_TraceAreas.
package mq3.botlib.aas_query_syscalls

import mq3.botlib.aas_entities as aasEntities
import mq3.botlib.aas_trace_areas as traceAreas
import mq3.vm.syscall_common as common
import mq3.compat.numeric as n

/// Byte size of the bot entity state record in the bot VM ABI or serialized representation.
const BOT_ENTITYSTATE_SIZE=112
/// Byte size of the AAS entity information record in the bot VM ABI or serialized representation.
const AAS_ENTITYINFO_SIZE=140

/// Return a new array `[n.bitsFloat(n.readI32(data,address)),n.bitsFloat(n.readI32(data,address+4)),n.bitsFloat(n.readI32(data,address+8))]` for `vector`.
/// @param data Value passed as argument 1 to `mq3.compat.numeric.readI32`.
/// @param address Address within the VM memory or native data buffer.
function vector(data,address) return [n.bitsFloat(n.readI32(data,address)),n.bitsFloat(n.readI32(data,address+4)),n.bitsFloat(n.readI32(data,address+8))] end function
/// Write three float bit patterns to consecutive VM memory words for aas query syscalls.
/// @param data Value passed as argument 1 to `mq3.compat.numeric.writeU32`.
/// @param address Address within the VM memory or native data buffer.
/// @param value Array or byte sequence accessed at `axis`.
function writeVector(data,address,value) for axis=0 to 2 n.writeU32(data,address+axis*4,n.floatBits(value[axis])) end for;return void end function

/// Build the `mq3.botlib.aas_entities.EntityState` result for `readEntityState`.
/// @param vm Vm record; accesses `data`.
/// @param address Address within the VM memory or native data buffer.
function readEntityState(vm,address)
  at=common.pointer(vm,address,BOT_ENTITYSTATE_SIZE,"bot_entitystate_t input");if at is error then return at end if
  return aasEntities.EntityState(n.readI32(vm.data,at),n.readI32(vm.data,at+4),vector(vm.data,at+8),vector(vm.data,at+20),vector(vm.data,at+32),vector(vm.data,at+44),vector(vm.data,at+56),n.readI32(vm.data,at+68),n.readI32(vm.data,at+72),n.readI32(vm.data,at+76),n.readI32(vm.data,at+80),n.readI32(vm.data,at+84),n.readI32(vm.data,at+88),n.readI32(vm.data,at+92),n.readI32(vm.data,at+96),n.readI32(vm.data,at+100),n.readI32(vm.data,at+104),n.readI32(vm.data,at+108))
end function

/// Apply `mq3.vm.syscall_common.pointer`, `mq3.botlib.aas_entities.AAS_EntityInfo` and `mq3.botlib.aas_query_syscalls.writeVector` while evaluating `entityInfo`.
/// @param state AAS entities state; accesses `maxEntities` and `entities`.
/// @param vm Vm record; accesses `data`.
/// @param number Entity number in the game or AAS entity table.
/// @param address Address within the VM memory or native data buffer.
function entityInfo(state,vm,number,address)
  output=common.pointer(vm,address,AAS_ENTITYINFO_SIZE,"aas_entityinfo_t output");if output is error then return output end if
  info=aasEntities.AAS_EntityInfo(state,number);valid=0;if info.valid then valid=1 end if
  n.writeU32(vm.data,output,valid);n.writeU32(vm.data,output+4,info.type);n.writeU32(vm.data,output+8,info.flags);n.writeU32(vm.data,output+12,n.floatBits(info.ltime));n.writeU32(vm.data,output+16,n.floatBits(info.updateTime));n.writeU32(vm.data,output+20,info.number)
  writeVector(vm.data,output+24,info.origin);writeVector(vm.data,output+36,info.angles);writeVector(vm.data,output+48,info.oldOrigin);writeVector(vm.data,output+60,info.lastVisOrigin);writeVector(vm.data,output+72,info.mins);writeVector(vm.data,output+84,info.maxs)
  n.writeU32(vm.data,output+96,info.groundent);n.writeU32(vm.data,output+100,info.solid);n.writeU32(vm.data,output+104,info.modelindex);n.writeU32(vm.data,output+108,info.modelindex2);n.writeU32(vm.data,output+112,info.frame);n.writeU32(vm.data,output+116,info.event);n.writeU32(vm.data,output+120,info.eventParm);n.writeU32(vm.data,output+124,info.powerups);n.writeU32(vm.data,output+128,info.weapon);n.writeU32(vm.data,output+132,info.legsAnim);n.writeU32(vm.data,output+136,info.torsoAnim)
  return 0
end function

/// Apply `mq3.vm.syscall_common.argument`, `mq3.vm.syscall_common.readFloatVector` and `mq3.botlib.aas_trace_areas.trace` while evaluating `trace`. Return paths include `len(result.areas)`.
/// @param runtime AAS trace areas runtime; accesses `initialized` and `map`.
/// @param vm Vm record; accesses `data`.
/// @param base Address within the VM memory or native data buffer.
function trace(runtime,vm,base)
  maximum=common.argument(vm,base,5);if maximum<0 or maximum>65536 then return error(7532,"invalid AAS TraceAreas capacity") end if
  start=common.readFloatVector(vm,common.argument(vm,base,1),3,"AAS trace-area start");if start is error then return start end if
  finish=common.readFloatVector(vm,common.argument(vm,base,2),3,"AAS trace-area end");if finish is error then return finish end if
  result=traceAreas.trace(runtime,start,finish,maximum);if result is error then return result end if
  if maximum>0 then
    areasAt=common.pointer(vm,common.argument(vm,base,3),maximum*4,"AAS trace-area output");if areasAt is error then return areasAt end if
    n.writeU32(vm.data,areasAt,0)
    for index=0 to len(result.areas)-1 n.writeU32(vm.data,areasAt+index*4,result.areas[index]) end for
    pointsAddress=common.argument(vm,base,4)
    if pointsAddress!=0 then pointsAt=common.pointer(vm,pointsAddress,maximum*12,"AAS trace-point output");if pointsAt is error then return pointsAt end if;for index=0 to len(result.points)-1 writeVector(vm.data,pointsAt+index*12,result.points[index]) end for end if
  end if
  return len(result.areas)
end function
