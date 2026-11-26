// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Binary world-query and usercmd traps from SV_GameSystemCalls.
package mq3.vm.syscall_qagame_world
import mq3.vm.syscall_common as common
import mq3.compat.numeric as n
import mq3.qcommon.message_delta as messageDelta

/// Serialize a complete 56-byte Quake III trace_t into bounded QVM memory.
/// @param data Mutable VM byte memory.
/// @param capacity VM byte-buffer capacity.
/// @param offset Destination byte offset with 56 bytes remaining.
/// @param allsolid Nonzero when the complete sweep is inside solid geometry.
/// @param startsolid Nonzero when the initial position is inside solid geometry.
/// @param fraction Fraction of the sweep completed before impact.
/// @param x Trace endpoint X coordinate.
/// @param y Trace endpoint Y coordinate.
/// @param z Trace endpoint Z coordinate.
/// @param nx Impact-plane normal X component.
/// @param ny Impact-plane normal Y component.
/// @param nz Impact-plane normal Z component.
/// @param distance Impact-plane distance.
/// @param planeMetadata Packed plane type/sign bits; the native writer retains the low 16 bits.
/// @param flags Surface flags.
/// @param contents Collision contents flags.
/// @param entity Hit entity number.
/// @returns 1 after writing all fourteen words; 0 when the destination is null or out of bounds.
extern function writeTraceNative(data as bytes,capacity as i32,offset as i32,allsolid as u32,startsolid as u32,fraction as double,x as double,y as double,z as double,nx as double,ny as double,nz as double,distance as double,planeMetadata as u32,flags as u32,contents as u32,entity as u32) from "miniquake3_abi.dll" symbol "mq3_write_qvm_trace" returns i32

const TRACE_SIZE=56
const USERCMD_SIZE=24

/// TraceResult record for vm.syscall_qagame_world, containing `allsolid`, `startsolid`, `fraction`, `endpos`, `planeNormal`, `planeDist`, and 5 further fields.
struct TraceResult
  allsolid
  startsolid
  fraction
  endpos
  planeNormal
  planeDist
  planeType
  planeSignBits
  surfaceFlags
  contents
  entityNum
end struct

/// Services record for vm.syscall_qagame_world, containing `context`, `traceFn`, `pointContentsFn`, `entitiesInBoxFn`, `entityContactFn`, `getUsercmdFn`.
struct Services
  context
  traceFn
  pointContentsFn
  entitiesInBoxFn
  entityContactFn
  getUsercmdFn
end struct

/// Create `mq3.vm.syscall_qagame_world.Services` with context=context; traceFn=void; pointContentsFn=void; entitiesInBoxFn=void; entityContactFn=void; getUsercmdFn=void.
/// @param context Initial `context` field stored in the returned or constructed `mq3.vm.syscall_qagame_world.Services` record.
function services(context) return Services(context,void,void,void,void,void) end function
/// Create the vm.syscall_qagame_world error for `unavailable` with 3422 and the supplied diagnostic text.
/// @param name Name used in `("qagame world syscall: " + name)` and `(("qagame world syscall: " + name) + " service unavailable")`.
function unavailable(name) return error(3422,"qagame world syscall: "+name+" service unavailable") end function
/// Return `mq3.vm.syscall_common.argument(vm, base, index)` from `vm.syscall_qagame_world.arg`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.argument`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
/// @param index Index passed as `index` to `mq3.vm.syscall_common.argument`.
function arg(vm,base,index) return common.argument(vm,base,index) end function

/// Apply `mq3.vm.syscall_common.pointer`, `mq3.compat.numeric.bitsFloat`, `mq3.compat.numeric.readU32` for vector in vm.syscall_qagame_world.
/// @param vm Record exposing `data`.
/// @param address Value passed as `value` to `mq3.vm.syscall_common.pointer`.
/// @param label Label passed as `label` to `mq3.vm.syscall_common.pointer`.
function vector(vm,address,label)
  at=common.pointer(vm,address,12,label)
  return [n.bitsFloat(n.readU32(vm.data,at)),n.bitsFloat(n.readU32(vm.data,at+4)),n.bitsFloat(n.readU32(vm.data,at+8))]
end function

/// Compute nullable vector in vm.syscall_qagame_world; the normal completion returns `vector(vm, address, label)`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_qagame_world.vector`.
/// @param address Address passed as `address` to `mq3.vm.syscall_qagame_world.vector`.
/// @param label Label passed as `label` to `mq3.vm.syscall_qagame_world.vector`.
function nullableVector(vm,address,label)
  if address==0 then return void end if
  return vector(vm,address,label)
end function

/// Compute require vector in vm.syscall_qagame_world; the normal completion returns `value`.
/// @param value Value used in `len(value)` and `(value == void)`.
/// @param label Label used in `("qagame world syscall: invalid " + label)` and `error(3422, ("qagame world syscall: invalid " + label))`.
function requireVector(value,label)
  if value==void or len(value)!=3 then return error(3422,"qagame world syscall: invalid "+label) end if
  return value
end function

/// Write trace in vm.syscall_qagame_world; the normal completion returns `0`.
///
/// Validation failures include `qagame world syscall: trace service returned no result`; `qagame world syscall: invalid trace output buffer`.
/// @param vm Record exposing `data`.
/// @param address Value passed as `value` to `mq3.vm.syscall_common.pointer`.
/// @param result Record exposing `endpos`, `planeNormal`, `allsolid`, `startsolid`, `planeType`, `planeSignBits`, `fraction` and further fields.
function writeTrace(vm,address,result)
  at=common.pointer(vm,address,TRACE_SIZE,"trace_t output")
  if result==void then return error(3422,"qagame world syscall: trace service returned no result") end if
  finish=requireVector(result.endpos,"trace endpos")
  normal=requireVector(result.planeNormal,"trace plane normal")
  allsolid=0;if result.allsolid then allsolid=1 end if
  startsolid=0;if result.startsolid then startsolid=1 end if
  metadata=(result.planeType&255)|((result.planeSignBits&255)<<8)
  if writeTraceNative(vm.data,len(vm.data),at,allsolid,startsolid,result.fraction,
      finish[0],finish[1],finish[2],normal[0],normal[1],normal[2],result.planeDist,
      metadata,n.u32(result.surfaceFlags),n.u32(result.contents),n.u32(result.entityNum))!=1 then
    return error(3422,"qagame world syscall: invalid trace output buffer")
  end if
  return 0
end function

/// Write usercmd in vm.syscall_qagame_world; the normal completion returns `0`.
///
/// Validation failures include `qagame world syscall: invalid usercmd result`.
/// @param vm Record exposing `data`.
/// @param address Value passed as `value` to `mq3.vm.syscall_common.pointer`.
/// @param command Record exposing `angles`, `serverTime`, `buttons`, `weapon`, `forwardmove`, `rightmove`, `upmove`.
function writeUsercmd(vm,address,command)
  at=common.pointer(vm,address,USERCMD_SIZE,"usercmd_t output")
  if command==void or command.angles==void or len(command.angles)!=3 then return error(3422,"qagame world syscall: invalid usercmd result") end if
  n.writeU32(vm.data,at,command.serverTime)
  for axis=0 to 2 n.writeU32(vm.data,at+4+axis*4,command.angles[axis]) end for
  n.writeU32(vm.data,at+16,command.buttons)
  vm.data[at+20]=command.weapon & 255;vm.data[at+21]=command.forwardmove & 255
  vm.data[at+22]=command.rightmove & 255;vm.data[at+23]=command.upmove & 255
  return 0
end function

/// Trace syscall qagame world in vm.syscall_qagame_world; the normal completion returns `writeTrace(vm, output, result)`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_qagame_world.arg`.
/// @param base Base passed as `base` to `mq3.vm.syscall_qagame_world.arg`.
/// @param host Record exposing `traceFn`, `context`.
/// @param capsule Capsule used in `host.traceFn(host.context, start, mins, maxs, finish, arg(vm, base, 6), arg(vm, base, 7), capsule)`.
function trace(vm,base,host,capsule)
  if host.traceFn==void then return unavailable("trace") end if
  output=arg(vm,base,1);common.pointer(vm,output,TRACE_SIZE,"trace_t output")
  start=vector(vm,arg(vm,base,2),"trace start")
  mins=nullableVector(vm,arg(vm,base,3),"trace mins")
  maxs=nullableVector(vm,arg(vm,base,4),"trace maxs")
  finish=vector(vm,arg(vm,base,5),"trace end")
  result=host.traceFn(host.context,start,mins,maxs,finish,arg(vm,base,6),arg(vm,base,7),capsule)
  return writeTrace(vm,output,result)
end function

/// Compute point contents in vm.syscall_qagame_world; the normal completion returns `host.pointContentsFn(host.context, vector(vm, arg(vm, base, 1), "point contents origin"), arg(vm, base, 2))`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_qagame_world.vector`.
/// @param base Base passed as `base` to `mq3.vm.syscall_qagame_world.arg`.
/// @param host Record exposing `pointContentsFn`, `context`.
function pointContents(vm,base,host)
  if host.pointContentsFn==void then return unavailable("point contents") end if
  return host.pointContentsFn(host.context,vector(vm,arg(vm,base,1),"point contents origin"),arg(vm,base,2))
end function

/// Compute entities in box in vm.syscall_qagame_world; the normal completion returns `len(found)`.
///
/// Validation failures include `qagame world syscall: negative entity-list capacity`; `qagame world syscall: entity-list capacity overflow`; `qagame world syscall: entity service returned no list`.
/// @param vm Record exposing `data`.
/// @param base Base passed as `base` to `mq3.vm.syscall_qagame_world.arg`.
/// @param host Record exposing `entitiesInBoxFn`, `context`.
function entitiesInBox(vm,base,host)
  if host.entitiesInBoxFn==void then return unavailable("entities in box") end if
  mins=vector(vm,arg(vm,base,1),"area mins");maxs=vector(vm,arg(vm,base,2),"area maxs")
  address=arg(vm,base,3);capacity=arg(vm,base,4)
  if capacity<0 then return error(3422,"qagame world syscall: negative entity-list capacity") end if
  if capacity>(len(vm.data)>>2) then return error(3422,"qagame world syscall: entity-list capacity overflow") end if
  at=0;if capacity>0 then at=common.pointer(vm,address,capacity*4,"entity-list output") end if
  found=host.entitiesInBoxFn(host.context,mins,maxs,capacity)
  if found==void then return error(3422,"qagame world syscall: entity service returned no list") end if
  if len(found)>capacity then return error(3422,"qagame world syscall: entity service exceeded capacity") end if
  if len(found)>0 then for index=0 to len(found)-1 n.writeU32(vm.data,at+index*4,found[index]) end for end if
  return len(found)
end function

/// Compute entity contact in vm.syscall_qagame_world; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_qagame_world.vector`.
/// @param base Base passed as `base` to `mq3.vm.syscall_qagame_world.arg`.
/// @param host Record exposing `entityContactFn`, `context`.
/// @param capsule Capsule used in `host.entityContactFn(host.context, mins, maxs, entity, capsule)`.
function entityContact(vm,base,host,capsule)
  if host.entityContactFn==void then return unavailable("entity contact") end if
  mins=vector(vm,arg(vm,base,1),"contact mins");maxs=vector(vm,arg(vm,base,2),"contact maxs")
  entity=common.pointer(vm,arg(vm,base,3),1,"contact entity")
  if host.entityContactFn(host.context,mins,maxs,entity,capsule) then return 1 end if
  return 0
end function

/// Get usercmd in vm.syscall_qagame_world; the normal completion returns `writeUsercmd(vm, address, host.getUsercmdFn(host.context, arg(vm, base, 1)))`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_qagame_world.arg`.
/// @param base Base passed as `base` to `mq3.vm.syscall_qagame_world.arg`.
/// @param host Record exposing `getUsercmdFn`, `context`.
function getUsercmd(vm,base,host)
  if host.getUsercmdFn==void then return unavailable("get usercmd") end if
  address=arg(vm,base,2);common.pointer(vm,address,USERCMD_SIZE,"usercmd_t output")
  return writeUsercmd(vm,address,host.getUsercmdFn(host.context,arg(vm,base,1)))
end function

/// Dispatch syscall qagame world in vm.syscall_qagame_world; the normal completion returns `error(3422, ("qagame world syscall: unsupported trap " + str(op)))`.
///
/// Validation failures include `qagame world syscall: invalid dispatcher context`.
/// @param host Host passed as `host` to `mq3.vm.syscall_qagame_world.trace`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_qagame_world.trace`.
/// @param base Base passed as `base` to `mq3.vm.syscall_qagame_world.trace`.
/// @param op Op used in `str(op)` and `("qagame world syscall: unsupported trap " + str(op))`.
function dispatch(host,vm,base,op)
  if host==void then return error(3422,"qagame world syscall: invalid dispatcher context") end if
  switch op
    case 24 return trace(vm,base,host,false) end case
    case 25 return pointContents(vm,base,host) end case
    case 32 return entitiesInBox(vm,base,host) end case
    case 33 return entityContact(vm,base,host,false) end case
    case 36 return getUsercmd(vm,base,host) end case
    case 43 return trace(vm,base,host,true) end case
    case 44 return entityContact(vm,base,host,true) end case
  end switch
  return error(3422,"qagame world syscall: unsupported trap "+str(op))
end function

/// Return `mq3.qcommon.message_delta.UserCommand(serverTime, angles, buttons, weapon, forwardmove, rightmove, upmove)` from `vm.syscall_qagame_world.userCommand`.
/// @param serverTime Initial `serverTime` field stored in the returned or constructed `mq3.qcommon.message_delta.UserCommand` record.
/// @param angles Initial `angles` field stored in the returned or constructed `mq3.qcommon.message_delta.UserCommand` record.
/// @param buttons Initial `buttons` field stored in the returned or constructed `mq3.qcommon.message_delta.UserCommand` record.
/// @param weapon Initial `weapon` field stored in the returned or constructed `mq3.qcommon.message_delta.UserCommand` record.
/// @param forwardmove Initial `forwardmove` field stored in the returned or constructed `mq3.qcommon.message_delta.UserCommand` record.
/// @param rightmove Initial `rightmove` field stored in the returned or constructed `mq3.qcommon.message_delta.UserCommand` record.
/// @param upmove Initial `upmove` field stored in the returned or constructed `mq3.qcommon.message_delta.UserCommand` record.
function userCommand(serverTime,angles,buttons,weapon,forwardmove,rightmove,upmove)
  return messageDelta.UserCommand(serverTime,angles,buttons,weapon,forwardmove,rightmove,upmove)
end function
