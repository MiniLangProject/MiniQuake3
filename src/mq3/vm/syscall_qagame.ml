// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Server-specific qagame traps from SV_GameSystemCalls.
package mq3.vm.syscall_qagame
import mq3.vm.syscall_common as common
import mq3.vm.syscall_qagame_world as world
import mq3.compat.numeric as n
import mq3.shared.math as qmath

const QTIME_SIZE=36

struct TokenResult found text end struct

struct Services
  shared
  context
  locateGameDataFn
  dropClientFn
  sendServerCommandFn
  setConfigstringFn
  getConfigstringFn
  getUserinfoFn
  setUserinfoFn
  getServerinfoFn
  setBrushModelFn
  inPvsFn
  adjustAreaPortalFn
  areasConnectedFn
  linkEntityFn
  unlinkEntityFn
  botAllocateClientFn
  botFreeClientFn
  entityTokenFn
  fileListFn
  debugPolygonCreateFn
  debugPolygonDeleteFn
  realTimeFn
  seekFn
  worldServices
  extendedFn
end struct

function services(shared,context)
  return Services(shared,context,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void)
end function

function unavailable(name) return error(3421,"qagame syscall: "+name+" service unavailable") end function

function arg(vm,base,index) return common.argument(vm,base,index) end function

function opaque(vm,value,label)
  return common.pointer(vm,value,1,label)
end function

function vector(vm,value,label)
  at=common.pointer(vm,value,12,label)
  return [n.bitsFloat(n.readU32(vm.data,at)),n.bitsFloat(n.readU32(vm.data,at+4)),n.bitsFloat(n.readU32(vm.data,at+8))]
end function

function locateGameData(vm,base,host)
  if host.locateGameDataFn==void then return unavailable("locate game data") end if
  entityCount=arg(vm,base,2);entityStride=arg(vm,base,3);clientStride=arg(vm,base,5)
  if entityCount<0 or entityStride<=0 or clientStride<=0 then return error(3421,"qagame syscall: invalid game-data layout") end if
  entityBytes=entityCount*entityStride
  entities=common.pointer(vm,arg(vm,base,1),entityBytes,"gentity array")
  clients=opaque(vm,arg(vm,base,4),"playerState array")
  host.locateGameDataFn(host.context,entities,entityCount,entityStride,clients,clientStride)
  return 0
end function

function stringCall(vm,base,host,callback,name,withClient)
  if callback==void then return unavailable(name) end if
  text=common.readString(vm,arg(vm,base,2))
  if withClient then callback(host.context,arg(vm,base,1),text) else callback(host.context,text) end if
  return 0
end function

function indexedOutput(vm,base,host,callback,name)
  if callback==void then return unavailable(name) end if
  value=callback(host.context,arg(vm,base,1))
  common.writeBuffer(vm,arg(vm,base,2),arg(vm,base,3),value,name+" output")
  return 0
end function

function serverInfo(vm,base,host)
  if host.getServerinfoFn==void then return unavailable("serverinfo") end if
  common.writeBuffer(vm,arg(vm,base,1),arg(vm,base,2),host.getServerinfoFn(host.context),"serverinfo output")
  return 0
end function

function brushModel(vm,base,host)
  if host.setBrushModelFn==void then return unavailable("brush model") end if
  host.setBrushModelFn(host.context,opaque(vm,arg(vm,base,1),"gentity"),common.readString(vm,arg(vm,base,2)))
  return 0
end function

function inPvs(vm,base,host,ignorePortals)
  if host.inPvsFn==void then return unavailable("PVS") end if
  if host.inPvsFn(host.context,vector(vm,arg(vm,base,1),"PVS origin 1"),vector(vm,arg(vm,base,2),"PVS origin 2"),ignorePortals) then return 1 end if
  return 0
end function

function portalState(vm,base,host)
  if host.adjustAreaPortalFn==void then return unavailable("area portal") end if
  host.adjustAreaPortalFn(host.context,opaque(vm,arg(vm,base,1),"gentity"),arg(vm,base,2)!=0);return 0
end function

function entityLink(vm,base,host,isLink)
  callback=host.unlinkEntityFn;if isLink then callback=host.linkEntityFn end if
  if callback==void then return unavailable("entity link") end if
  callback(host.context,opaque(vm,arg(vm,base,1),"gentity"));return 0
end function

function entityToken(vm,base,host)
  if host.entityTokenFn==void then return unavailable("entity token") end if
  result=host.entityTokenFn(host.context)
  if result==void then result=TokenResult(false,"") end if
  common.writeBuffer(vm,arg(vm,base,1),arg(vm,base,2),result.text,"entity token output")
  if result.found then return 1 end if
  return 0
end function

function fileList(vm,base,host)
  if host.fileListFn==void then return unavailable("file list") end if
  capacity=arg(vm,base,4);if capacity<0 then return error(3421,"qagame syscall: negative file-list capacity") end if
  path=common.readString(vm,arg(vm,base,1));extension=common.readString(vm,arg(vm,base,2))
  entries=host.fileListFn(host.context,path,extension);if entries==void then entries=[] end if
  data=bytes(capacity,0);cursor=0;count=0
  for each name in entries
    encoded=bytes(name);if cursor+len(encoded)+1>capacity then break end if
    if len(encoded)>0 then copyBytes(data,cursor,encoded,0,len(encoded)) end if
    cursor=cursor+len(encoded)+1;count=count+1
  end for
  if capacity>0 then common.writeRaw(vm,arg(vm,base,3),data,capacity,"file list output") end if
  return count
end function

function debugPolygonCreate(vm,base,host)
  if host.debugPolygonCreateFn==void then return unavailable("debug polygon create") end if
  count=arg(vm,base,2);if count<0 then return error(3421,"qagame syscall: negative debug-polygon point count") end if
  if count>(len(vm.data)/12) then return error(3421,"qagame syscall: debug-polygon point count overflow") end if
  at=0;if count>0 then at=common.pointer(vm,arg(vm,base,3),count*12,"debug-polygon points") end if;points=[]
  for index=0 to count-1
    points=points+[[n.bitsFloat(n.readU32(vm.data,at+index*12)),n.bitsFloat(n.readU32(vm.data,at+index*12+4)),n.bitsFloat(n.readU32(vm.data,at+index*12+8))]]
  end for
  return host.debugPolygonCreateFn(host.context,arg(vm,base,1),points)
end function

function realTime(vm,base,host)
  if host.realTimeFn==void then return unavailable("real time") end if
  value=host.realTimeFn(host.context)
  if value==void or typeof(value.data)!="bytes" or len(value.data)!=QTIME_SIZE then return error(3421,"qagame syscall: invalid qtime_t layout") end if
  address=arg(vm,base,1);if address!=0 then common.writeRaw(vm,address,value.data,QTIME_SIZE,"qtime_t output") end if
  return value.epoch
end function

function dispatchSpecific(vm,base,host,op)
  if op==24 or op==25 or op==32 or op==33 or op==36 or op==43 or op==44 then
    if host.worldServices==void then return unavailable("binary world") end if
    return world.dispatch(host.worldServices,vm,base,op)
  end if
  // Hosts that already provide these optional engine services through their
  // extended dispatcher keep working until they adopt the typed callbacks.
  if op==38 and host.fileListFn!=void then return fileList(vm,base,host) end if
  if op==39 and host.debugPolygonCreateFn!=void then return debugPolygonCreate(vm,base,host) end if
  if op==40 and host.debugPolygonDeleteFn!=void then host.debugPolygonDeleteFn(host.context,arg(vm,base,1));return 0 end if
  if op==41 and host.realTimeFn!=void then return realTime(vm,base,host) end if
  switch op
    case 15 return locateGameData(vm,base,host) end case
    case 16 return stringCall(vm,base,host,host.dropClientFn,"drop client",true) end case
    case 17 return stringCall(vm,base,host,host.sendServerCommandFn,"server command",true) end case
    case 18 return stringCall(vm,base,host,host.setConfigstringFn,"configstring",true) end case
    case 19 return indexedOutput(vm,base,host,host.getConfigstringFn,"configstring") end case
    case 20 return indexedOutput(vm,base,host,host.getUserinfoFn,"userinfo") end case
    case 21 return stringCall(vm,base,host,host.setUserinfoFn,"userinfo",true) end case
    case 22 return serverInfo(vm,base,host) end case
    case 23 return brushModel(vm,base,host) end case
    case 26 return inPvs(vm,base,host,false) end case
    case 27 return inPvs(vm,base,host,true) end case
    case 28 return portalState(vm,base,host) end case
    case 29 if host.areasConnectedFn==void then return unavailable("areas connected") end if;if host.areasConnectedFn(host.context,arg(vm,base,1),arg(vm,base,2)) then return 1 else return 0 end if end case
    case 30 return entityLink(vm,base,host,true) end case
    case 31 return entityLink(vm,base,host,false) end case
    case 34 if host.botAllocateClientFn==void then return unavailable("bot allocation") end if;return host.botAllocateClientFn(host.context) end case
    case 35 if host.botFreeClientFn==void then return unavailable("bot free") end if;host.botFreeClientFn(host.context,arg(vm,base,1));return 0 end case
    case 37 return entityToken(vm,base,host) end case
    case 42
      address=arg(vm,base,1);value=vector(vm,address,"snap vector");qmath.SnapVector(value);at=common.pointer(vm,address,12,"snap vector")
      for axis=0 to 2 n.writeU32(vm.data,at+axis*4,n.floatBits(value[axis])) end for;return 0
    end case
    case 45 if host.seekFn==void then return unavailable("file seek") end if;return host.seekFn(host.context,arg(vm,base,1),arg(vm,base,2),arg(vm,base,3)) end case
  end switch
  if host.extendedFn!=void then return host.extendedFn(host.context,vm,base,op) end if
  return error(3421,"qagame syscall: unsupported server trap "+str(op))
end function

function dispatch(host,vm,base)
  if host==void or host.shared==void then return error(3421,"qagame syscall: invalid dispatcher context") end if
  op=common.argument(vm,base,0)
  if op>=0 and op<=14 or op>=100 and op<=113 then return common.dispatch(common.ABI_QAGAME,host.shared,vm,base) end if
  return dispatchSpecific(vm,base,host,op)
end function

function callback(host) return function(vm,base) => dispatch(host,vm,base) end function
