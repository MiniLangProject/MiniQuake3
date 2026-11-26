// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Server-specific qagame traps from SV_GameSystemCalls.
package mq3.vm.syscall_qagame
import mq3.vm.syscall_common as common
import mq3.vm.syscall_qagame_world as world
import mq3.compat.numeric as n
import mq3.shared.math as qmath

/// Byte size used for qtime storage or binary layout in mq3.vm.syscall_qagame.
const QTIME_SIZE=36

/// TokenResult record for vm.syscall_qagame, containing `found`, `text`.
struct TokenResult
  /// Nonzero when the requested token, source, or resource result is available.
  found
  /// Spelling of the token returned by the host token-reading operation.
  text
end struct

/// Services record for vm.syscall_qagame, containing `shared`, `context`, `locateGameDataFn`, `dropClientFn`, `sendServerCommandFn`, `setConfigstringFn`, and 20 further fields.
struct Services
  /// Shared host service bundle used by the VM syscall adapters.
  shared
  /// Opaque caller-supplied context available to server game-VM entity, client, and configuration
  /// services.
  context
  /// Injected callback for locate game data; invoked through the Services service/state record.
  locateGameDataFn
  /// Injected callback for drop client; invoked through the Services service/state record.
  dropClientFn
  /// Injected callback for send server command; invoked through the Services service/state record.
  sendServerCommandFn
  /// Injected callback for set configuration string; invoked through the Services service/state record.
  setConfigstringFn
  /// Injected callback for get configuration string; invoked through the Services service/state record.
  getConfigstringFn
  /// Injected callback for get user information; invoked through the Services service/state record.
  getUserinfoFn
  /// Injected callback for set user information; invoked through the Services service/state record.
  setUserinfoFn
  /// Injected callback for get server information; invoked through the Services service/state record.
  getServerinfoFn
  /// Injected callback for set brush model; invoked through the Services service/state record.
  setBrushModelFn
  /// Injected callback for in potential visibility set; invoked through the Services service/state
  /// record.
  inPvsFn
  /// Injected callback for adjust area portal; invoked through the Services service/state record.
  adjustAreaPortalFn
  /// Injected callback for areas connected; invoked through the Services service/state record.
  areasConnectedFn
  /// Injected callback for link entity; invoked through the Services service/state record.
  linkEntityFn
  /// Injected callback for unlink entity; invoked through the Services service/state record.
  unlinkEntityFn
  /// Injected callback for bot allocate client; invoked through the Services service/state record.
  botAllocateClientFn
  /// Injected callback for bot free client; invoked through the Services service/state record.
  botFreeClientFn
  /// Injected callback for entity token; invoked through the Services service/state record.
  entityTokenFn
  /// Injected callback for file list; invoked through the Services service/state record.
  fileListFn
  /// Injected callback for debug polygon create; invoked through the Services service/state record.
  debugPolygonCreateFn
  /// Injected callback for debug polygon delete; invoked through the Services service/state record.
  debugPolygonDeleteFn
  /// Injected callback for real time; invoked through the Services service/state record.
  realTimeFn
  /// Injected callback for seek; invoked through the Services service/state record.
  seekFn
  /// Injected world-query callbacks used for collision, visibility, and entity access.
  worldServices
  /// Injected callback for extended; invoked through the Services service/state record.
  extendedFn
end struct

/// Create `mq3.vm.syscall_qagame.Services` with shared=shared; context=context; locateGameDataFn=void; dropClientFn=void; 22 further fields.
/// @param shared Initial `shared` field stored in the returned or constructed `mq3.vm.syscall_qagame.Services` record.
/// @param context Initial `context` field stored in the returned or constructed `mq3.vm.syscall_qagame.Services` record.
function services(shared,context)
  return Services(shared,context,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void)
end function

/// Create the vm.syscall_qagame error for `unavailable` with 3421 and the supplied diagnostic text.
/// @param name Name used in `("qagame syscall: " + name)` and `(("qagame syscall: " + name) + " service unavailable")`.
function unavailable(name) return error(3421,"qagame syscall: "+name+" service unavailable") end function

/// Return `mq3.vm.syscall_common.argument(vm, base, index)` from `vm.syscall_qagame.arg`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.argument`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
/// @param index Index passed as `index` to `mq3.vm.syscall_common.argument`.
function arg(vm,base,index) return common.argument(vm,base,index) end function

/// Return `mq3.vm.syscall_common.pointer(vm, value, 1, label)` from `vm.syscall_qagame.opaque`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.pointer`.
/// @param value Value passed as `value` to `mq3.vm.syscall_common.pointer`.
/// @param label Label passed as `label` to `mq3.vm.syscall_common.pointer`.
function opaque(vm,value,label)
  return common.pointer(vm,value,1,label)
end function

/// Apply `mq3.vm.syscall_common.pointer`, `mq3.compat.numeric.bitsFloat`, `mq3.compat.numeric.readU32` for vector in vm.syscall_qagame.
/// @param vm Record exposing `data`.
/// @param value Value passed as `value` to `mq3.vm.syscall_common.pointer`.
/// @param label Label passed as `label` to `mq3.vm.syscall_common.pointer`.
function vector(vm,value,label)
  at=common.pointer(vm,value,12,label)
  return [n.bitsFloat(n.readU32(vm.data,at)),n.bitsFloat(n.readU32(vm.data,at+4)),n.bitsFloat(n.readU32(vm.data,at+8))]
end function

/// Compute locate game data in vm.syscall_qagame; the normal completion returns `0`.
///
/// Validation failures include `qagame syscall: invalid game-data layout`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_qagame.arg`.
/// @param base Base passed as `base` to `mq3.vm.syscall_qagame.arg`.
/// @param host Record exposing `locateGameDataFn`, `context`.
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

/// Compute string call in vm.syscall_qagame; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.readString`.
/// @param base Base passed as `base` to `mq3.vm.syscall_qagame.arg`.
/// @param host Record exposing `context`.
/// @param callback Callback invoked for callback; the call sites below define the callback arguments.
/// @param name Name passed as `name` to `mq3.vm.syscall_qagame.unavailable`.
/// @param withClient With client operand used by `stringCall`; its reads are shown in the implementation.
function stringCall(vm,base,host,callback,name,withClient)
  if callback==void then return unavailable(name) end if
  text=common.readString(vm,arg(vm,base,2))
  if withClient then callback(host.context,arg(vm,base,1),text) else callback(host.context,text) end if
  return 0
end function

/// Compute indexed output in vm.syscall_qagame; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_qagame.arg`.
/// @param base Base passed as `base` to `mq3.vm.syscall_qagame.arg`.
/// @param host Record exposing `context`.
/// @param callback Callback invoked for callback; the call sites below define the callback arguments.
/// @param name Name passed as `name` to `mq3.vm.syscall_qagame.unavailable`.
function indexedOutput(vm,base,host,callback,name)
  if callback==void then return unavailable(name) end if
  value=callback(host.context,arg(vm,base,1))
  common.writeBuffer(vm,arg(vm,base,2),arg(vm,base,3),value,name+" output")
  return 0
end function

/// Compute server info in vm.syscall_qagame; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.writeBuffer`.
/// @param base Base passed as `base` to `mq3.vm.syscall_qagame.arg`.
/// @param host Record exposing `getServerinfoFn`, `context`.
function serverInfo(vm,base,host)
  if host.getServerinfoFn==void then return unavailable("serverinfo") end if
  common.writeBuffer(vm,arg(vm,base,1),arg(vm,base,2),host.getServerinfoFn(host.context),"serverinfo output")
  return 0
end function

/// Compute brush model in vm.syscall_qagame; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_qagame.opaque`.
/// @param base Base passed as `base` to `mq3.vm.syscall_qagame.arg`.
/// @param host Record exposing `setBrushModelFn`, `context`.
function brushModel(vm,base,host)
  if host.setBrushModelFn==void then return unavailable("brush model") end if
  host.setBrushModelFn(host.context,opaque(vm,arg(vm,base,1),"gentity"),common.readString(vm,arg(vm,base,2)))
  return 0
end function

/// Compute in pvs in vm.syscall_qagame; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_qagame.vector`.
/// @param base Base passed as `base` to `mq3.vm.syscall_qagame.arg`.
/// @param host Record exposing `inPvsFn`, `context`.
/// @param ignorePortals Argument 4 passed to `host.inPvsFn`.
function inPvs(vm,base,host,ignorePortals)
  if host.inPvsFn==void then return unavailable("PVS") end if
  if host.inPvsFn(host.context,vector(vm,arg(vm,base,1),"PVS origin 1"),vector(vm,arg(vm,base,2),"PVS origin 2"),ignorePortals) then return 1 end if
  return 0
end function

/// Compute portal state in vm.syscall_qagame; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_qagame.opaque`.
/// @param base Base passed as `base` to `mq3.vm.syscall_qagame.arg`.
/// @param host Record exposing `adjustAreaPortalFn`, `context`.
function portalState(vm,base,host)
  if host.adjustAreaPortalFn==void then return unavailable("area portal") end if
  host.adjustAreaPortalFn(host.context,opaque(vm,arg(vm,base,1),"gentity"),arg(vm,base,2)!=0);return 0
end function

/// Compute entity link in vm.syscall_qagame; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_qagame.opaque`.
/// @param base Base passed as `base` to `mq3.vm.syscall_qagame.arg`.
/// @param host Record exposing `unlinkEntityFn`, `linkEntityFn`, `context`.
/// @param isLink Is link operand used by `entityLink`; its reads are shown in the implementation.
function entityLink(vm,base,host,isLink)
  callback=host.unlinkEntityFn;if isLink then callback=host.linkEntityFn end if
  if callback==void then return unavailable("entity link") end if
  callback(host.context,opaque(vm,arg(vm,base,1),"gentity"));return 0
end function

/// Compute entity token in vm.syscall_qagame; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.writeBuffer`.
/// @param base Base passed as `base` to `mq3.vm.syscall_qagame.arg`.
/// @param host Record exposing `entityTokenFn`, `context`.
function entityToken(vm,base,host)
  if host.entityTokenFn==void then return unavailable("entity token") end if
  result=host.entityTokenFn(host.context)
  if result==void then result=TokenResult(false,"") end if
  common.writeBuffer(vm,arg(vm,base,1),arg(vm,base,2),result.text,"entity token output")
  if result.found then return 1 end if
  return 0
end function

/// Compute file list in vm.syscall_qagame; the normal completion returns `count`.
///
/// Validation failures include `qagame syscall: negative file-list capacity`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_qagame.arg`.
/// @param base Base passed as `base` to `mq3.vm.syscall_qagame.arg`.
/// @param host Record exposing `fileListFn`, `context`.
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

/// Compute debug polygon create in vm.syscall_qagame; the normal completion returns `host.debugPolygonCreateFn(host.context, arg(vm, base, 1), points)`.
///
/// Validation failures include `qagame syscall: negative debug-polygon point count`; `qagame syscall: debug-polygon point count overflow`.
/// @param vm Record exposing `data`.
/// @param base Base passed as `base` to `mq3.vm.syscall_qagame.arg`.
/// @param host Record exposing `debugPolygonCreateFn`, `context`.
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

/// Compute real time in vm.syscall_qagame; the normal completion returns `value.epoch`.
///
/// Validation failures include `qagame syscall: invalid qtime_t layout`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_qagame.arg`.
/// @param base Base passed as `base` to `mq3.vm.syscall_qagame.arg`.
/// @param host Record exposing `realTimeFn`, `context`.
function realTime(vm,base,host)
  if host.realTimeFn==void then return unavailable("real time") end if
  value=host.realTimeFn(host.context)
  if value==void or typeof(value.data)!="bytes" or len(value.data)!=QTIME_SIZE then return error(3421,"qagame syscall: invalid qtime_t layout") end if
  address=arg(vm,base,1);if address!=0 then common.writeRaw(vm,address,value.data,QTIME_SIZE,"qtime_t output") end if
  return value.epoch
end function

/// Dispatch specific in vm.syscall_qagame; the normal completion returns `error(3421, ("qagame syscall: unsupported server trap " + str(op)))`.
/// @param vm Record exposing `data`.
/// @param base Base passed as `base` to `mq3.vm.syscall_qagame_world.dispatch`.
/// @param host Record exposing `worldServices`, `fileListFn`, `debugPolygonCreateFn`, `debugPolygonDeleteFn`, `context`, `realTimeFn`, `dropClientFn` and further fields.
/// @param op Op passed as `op` to `mq3.vm.syscall_qagame_world.dispatch`.
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

/// Dispatch syscall qagame in vm.syscall_qagame; the normal completion returns `dispatchSpecific(vm, base, host, op)`.
///
/// Validation failures include `qagame syscall: invalid dispatcher context`.
/// @param host Record exposing `shared`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.argument`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
function dispatch(host,vm,base)
  if host==void or host.shared==void then return error(3421,"qagame syscall: invalid dispatcher context") end if
  op=common.argument(vm,base,0)
  if op>=0 and op<=14 or op>=100 and op<=113 then return common.dispatch(common.ABI_QAGAME,host.shared,vm,base) end if
  return dispatchSpecific(vm,base,host,op)
end function

/// Apply `mq3.vm.syscall_qagame.dispatch` for callback in vm.syscall_qagame.
/// @param host Host passed as `host` to `mq3.vm.syscall_qagame.dispatch`.
function callback(host) return function(vm,base) => dispatch(host,vm,base) end function
