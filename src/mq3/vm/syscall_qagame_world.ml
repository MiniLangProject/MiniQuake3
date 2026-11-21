// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Binary world-query and usercmd traps from SV_GameSystemCalls.
package mq3.vm.syscall_qagame_world
import mq3.vm.syscall_common as common
import mq3.compat.numeric as n
import mq3.qcommon.message_delta as messageDelta

extern function writeTraceNative(data as bytes,capacity as i32,offset as i32,allsolid as u32,startsolid as u32,fraction as double,x as double,y as double,z as double,nx as double,ny as double,nz as double,distance as double,planeMetadata as u32,flags as u32,contents as u32,entity as u32) from "miniquake3_abi.dll" symbol "mq3_write_qvm_trace" returns i32

const TRACE_SIZE=56
const USERCMD_SIZE=24

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

struct Services
  context
  traceFn
  pointContentsFn
  entitiesInBoxFn
  entityContactFn
  getUsercmdFn
end struct

function services(context) return Services(context,void,void,void,void,void) end function
function unavailable(name) return error(3422,"qagame world syscall: "+name+" service unavailable") end function
function arg(vm,base,index) return common.argument(vm,base,index) end function

function vector(vm,address,label)
  at=common.pointer(vm,address,12,label)
  return [n.bitsFloat(n.readU32(vm.data,at)),n.bitsFloat(n.readU32(vm.data,at+4)),n.bitsFloat(n.readU32(vm.data,at+8))]
end function

function nullableVector(vm,address,label)
  if address==0 then return void end if
  return vector(vm,address,label)
end function

function requireVector(value,label)
  if value==void or len(value)!=3 then return error(3422,"qagame world syscall: invalid "+label) end if
  return value
end function

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

function pointContents(vm,base,host)
  if host.pointContentsFn==void then return unavailable("point contents") end if
  return host.pointContentsFn(host.context,vector(vm,arg(vm,base,1),"point contents origin"),arg(vm,base,2))
end function

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

function entityContact(vm,base,host,capsule)
  if host.entityContactFn==void then return unavailable("entity contact") end if
  mins=vector(vm,arg(vm,base,1),"contact mins");maxs=vector(vm,arg(vm,base,2),"contact maxs")
  entity=common.pointer(vm,arg(vm,base,3),1,"contact entity")
  if host.entityContactFn(host.context,mins,maxs,entity,capsule) then return 1 end if
  return 0
end function

function getUsercmd(vm,base,host)
  if host.getUsercmdFn==void then return unavailable("get usercmd") end if
  address=arg(vm,base,2);common.pointer(vm,address,USERCMD_SIZE,"usercmd_t output")
  return writeUsercmd(vm,address,host.getUsercmdFn(host.context,arg(vm,base,1)))
end function

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

function userCommand(serverTime,angles,buttons,weapon,forwardmove,rightmove,upmove)
  return messageDelta.UserCommand(serverTime,angles,buttons,weapon,forwardmove,rightmove,upmove)
end function
