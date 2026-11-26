// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Client-specific cgame traps from CL_CgameSystemCalls.
package mq3.vm.syscall_cgame
import mq3.vm.syscall_common as common
import mq3.vm.cgame_key_traps as keyTraps
import mq3.vm.cgame_pc_traps as pcTraps
import mq3.compat.numeric as n

const GAMESTATE_SIZE = 20100
const SNAPSHOT_SIZE = 53772
const USERCMD_SIZE = 24
const GLCONFIG_SIZE = 11332

/// BytesResult record for vm.syscall_cgame, containing `found`, `data`.
struct BytesResult found data end struct
/// SnapshotNumber record for vm.syscall_cgame, containing `number`, `serverTime`.
struct SnapshotNumber number serverTime end struct

/// Services record for vm.syscall_cgame, containing `shared`, `context`, `addCommandFn`, `removeCommandFn`, `sendClientCommandFn`, `updateScreenFn`, and 18 further fields.
struct Services
  shared
  context
  addCommandFn
  removeCommandFn
  sendClientCommandFn
  updateScreenFn
  loadWorldFn
  registerModelFn
  registerSkinFn
  registerShaderFn
  registerShaderNoMipFn
  clearSceneFn
  getGlconfigFn
  getGameStateFn
  getCurrentSnapshotNumberFn
  getSnapshotFn
  getServerCommandFn
  getCurrentCmdNumberFn
  getUserCmdFn
  setUserCmdValueFn
  memoryRemainingFn
  keyServices
  pcServices
  extendedFn
end struct

/// Create `mq3.vm.syscall_cgame.Services` with shared=shared; context=context; addCommandFn=void; removeCommandFn=void; 20 further fields.
/// @param shared Initial `shared` field stored in the returned or constructed `mq3.vm.syscall_cgame.Services` record.
/// @param context Initial `context` field stored in the returned or constructed `mq3.vm.syscall_cgame.Services` record.
function services(shared,context)
  return Services(shared,context,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void)
end function

/// Create the vm.syscall_cgame error for `unavailable` with 3422 and the supplied diagnostic text.
/// @param name Name used in `("cgame syscall: " + name)` and `(("cgame syscall: " + name) + " service unavailable")`.
function unavailable(name) return error(3422,"cgame syscall: "+name+" service unavailable") end function
/// Return `mq3.vm.syscall_common.argument(vm, base, index)` from `vm.syscall_cgame.arg`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.argument`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
/// @param index Index passed as `index` to `mq3.vm.syscall_common.argument`.
function arg(vm,base,index) return common.argument(vm,base,index) end function

/// Compute exact output in vm.syscall_cgame; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.writeRaw`.
/// @param address Value passed as `value` to `mq3.vm.syscall_common.writeRaw`.
/// @param data Data passed as `data` to `mq3.vm.syscall_common.writeRaw`.
/// @param size Count passed as `count` to `mq3.vm.syscall_common.writeRaw`.
/// @param label Label used in `(label + " output")` and `("cgame syscall: invalid " + label)`.
function exactOutput(vm,address,data,size,label)
  if typeof(data)!="bytes" or len(data)!=size then return error(3422,"cgame syscall: invalid "+label+" layout") end if
  common.writeRaw(vm,address,data,size,label+" output")
  return 0
end function

/// Compute string event in vm.syscall_cgame; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.readString`.
/// @param base Base passed as `base` to `mq3.vm.syscall_cgame.arg`.
/// @param host Record exposing `context`.
/// @param callback Callback invoked for callback; the call sites below define the callback arguments.
/// @param name Name passed as `name` to `mq3.vm.syscall_cgame.unavailable`.
function stringEvent(vm,base,host,callback,name)
  if callback==void then return unavailable(name) end if
  callback(host.context,common.readString(vm,arg(vm,base,1)));return 0
end function

/// Register asset in vm.syscall_cgame; the normal completion returns `callback(host.context, common.readString(vm, arg(vm, base, 1)))`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.readString`.
/// @param base Base passed as `base` to `mq3.vm.syscall_cgame.arg`.
/// @param host Record exposing `context`.
/// @param callback Callback invoked for callback; the call sites below define the callback arguments.
/// @param name Name passed as `name` to `mq3.vm.syscall_cgame.unavailable`.
function registerAsset(vm,base,host,callback,name)
  if callback==void then return unavailable(name) end if
  return callback(host.context,common.readString(vm,arg(vm,base,1)))
end function

/// Compute fixed state in vm.syscall_cgame; the normal completion returns `exactOutput(vm, arg(vm, base, 1), callback(host.context), size, name)`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_cgame.exactOutput`.
/// @param base Base passed as `base` to `mq3.vm.syscall_cgame.arg`.
/// @param host Record exposing `context`.
/// @param callback Callback invoked for callback; the call sites below define the callback arguments.
/// @param size Size passed as `size` to `mq3.vm.syscall_cgame.exactOutput`.
/// @param name Name passed as `name` to `mq3.vm.syscall_cgame.unavailable`.
function fixedState(vm,base,host,callback,size,name)
  if callback==void then return unavailable(name) end if
  return exactOutput(vm,arg(vm,base,1),callback(host.context),size,name)
end function

/// Compute current snapshot number in vm.syscall_cgame; the normal completion returns `0`.
///
/// Validation failures include `cgame syscall: invalid current snapshot result`.
/// @param vm Record exposing `data`.
/// @param base Base passed as `base` to `mq3.vm.syscall_cgame.arg`.
/// @param host Record exposing `getCurrentSnapshotNumberFn`, `context`.
function currentSnapshotNumber(vm,base,host)
  if host.getCurrentSnapshotNumberFn==void then return unavailable("current snapshot number") end if
  result=host.getCurrentSnapshotNumberFn(host.context)
  if result==void then return error(3422,"cgame syscall: invalid current snapshot result") end if
  numberAt=common.pointer(vm,arg(vm,base,1),4,"snapshot number output")
  timeAt=common.pointer(vm,arg(vm,base,2),4,"snapshot time output")
  n.writeU32(vm.data,numberAt,result.number);n.writeU32(vm.data,timeAt,result.serverTime)
  return 0
end function

/// Compute variable state in vm.syscall_cgame; the normal completion returns `1`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_cgame.arg`.
/// @param base Base passed as `base` to `mq3.vm.syscall_cgame.arg`.
/// @param host Record exposing `context`.
/// @param callback Callback invoked for callback; the call sites below define the callback arguments.
/// @param size Size passed as `size` to `mq3.vm.syscall_cgame.exactOutput`.
/// @param name Name passed as `name` to `mq3.vm.syscall_cgame.unavailable`.
function variableState(vm,base,host,callback,size,name)
  if callback==void then return unavailable(name) end if
  result=callback(host.context,arg(vm,base,1))
  if result==void or not result.found then return 0 end if
  exactOutput(vm,arg(vm,base,2),result.data,size,name)
  return 1
end function

/// Get server command in vm.syscall_cgame; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_cgame.arg`.
/// @param base Base passed as `base` to `mq3.vm.syscall_cgame.arg`.
/// @param host Record exposing `getServerCommandFn`, `context`.
function getServerCommand(vm,base,host)
  if host.getServerCommandFn==void then return unavailable("server command") end if
  if host.getServerCommandFn(host.context,arg(vm,base,1)) then return 1 end if
  return 0
end function

/// Set user cmd value in vm.syscall_cgame; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_cgame.arg`.
/// @param base Base passed as `base` to `mq3.vm.syscall_cgame.arg`.
/// @param host Record exposing `setUserCmdValueFn`, `context`.
function setUserCmdValue(vm,base,host)
  if host.setUserCmdValueFn==void then return unavailable("usercmd value") end if
  host.setUserCmdValueFn(host.context,arg(vm,base,1),n.bitsFloat(arg(vm,base,2)));return 0
end function

/// Dispatch specific in vm.syscall_cgame; the normal completion returns `error(3422, ("cgame syscall: unsupported client trap " + str(op)))`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_cgame.stringEvent`.
/// @param base Base passed as `base` to `mq3.vm.syscall_cgame.stringEvent`.
/// @param host Record exposing `addCommandFn`, `sendClientCommandFn`, `updateScreenFn`, `context`, `loadWorldFn`, `registerModelFn`, `registerSkinFn` and further fields.
/// @param op Op used in `str(op)` and `host.extendedFn(host.context, vm, base, op)`.
function dispatchSpecific(vm,base,host,op)
  switch op
    case 15 return stringEvent(vm,base,host,host.addCommandFn,"add command") end case
    case 16 return stringEvent(vm,base,host,host.sendClientCommandFn,"client command") end case
    case 17 if host.updateScreenFn==void then return unavailable("screen update") end if;host.updateScreenFn(host.context);return 0 end case
    case 36 return stringEvent(vm,base,host,host.loadWorldFn,"load world") end case
    case 37 return registerAsset(vm,base,host,host.registerModelFn,"register model") end case
    case 38 return registerAsset(vm,base,host,host.registerSkinFn,"register skin") end case
    case 39 return registerAsset(vm,base,host,host.registerShaderFn,"register shader") end case
    case 40 if host.clearSceneFn==void then return unavailable("clear scene") end if;host.clearSceneFn(host.context);return 0 end case
    case 49 return fixedState(vm,base,host,host.getGlconfigFn,GLCONFIG_SIZE,"glconfig") end case
    case 50 return fixedState(vm,base,host,host.getGameStateFn,GAMESTATE_SIZE,"gameState") end case
    case 51 return currentSnapshotNumber(vm,base,host) end case
    case 52 return variableState(vm,base,host,host.getSnapshotFn,SNAPSHOT_SIZE,"snapshot") end case
    case 53 return getServerCommand(vm,base,host) end case
    case 54 if host.getCurrentCmdNumberFn==void then return unavailable("current command number") end if;return host.getCurrentCmdNumberFn(host.context) end case
    case 55 return variableState(vm,base,host,host.getUserCmdFn,USERCMD_SIZE,"usercmd") end case
    case 56 return setUserCmdValue(vm,base,host) end case
    case 57 return registerAsset(vm,base,host,host.registerShaderNoMipFn,"register shader no mip") end case
    case 58 if host.memoryRemainingFn==void then return unavailable("memory remaining") end if;return host.memoryRemainingFn(host.context) end case
    case 60 if host.keyServices!=void then return keyTraps.dispatch(host.keyServices,vm,base) end if end case
    case 61 if host.keyServices!=void then return keyTraps.dispatch(host.keyServices,vm,base) end if end case
    case 62 if host.keyServices!=void then return keyTraps.dispatch(host.keyServices,vm,base) end if end case
    case 63 if host.keyServices!=void then return keyTraps.dispatch(host.keyServices,vm,base) end if end case
    case 64 if host.pcServices!=void then return pcTraps.dispatch(host.pcServices,vm,base) end if end case
    case 65 if host.pcServices!=void then return pcTraps.dispatch(host.pcServices,vm,base) end if end case
    case 66 if host.pcServices!=void then return pcTraps.dispatch(host.pcServices,vm,base) end if end case
    case 67 if host.pcServices!=void then return pcTraps.dispatch(host.pcServices,vm,base) end if end case
    case 68 if host.pcServices!=void then return pcTraps.dispatch(host.pcServices,vm,base) end if end case
    case 72 return stringEvent(vm,base,host,host.removeCommandFn,"remove command") end case
  end switch
  if host.extendedFn!=void then return host.extendedFn(host.context,vm,base,op) end if
  return error(3422,"cgame syscall: unsupported client trap "+str(op))
end function

/// Dispatch syscall cgame in vm.syscall_cgame; the normal completion returns `dispatchSpecific(vm, base, host, op)`.
///
/// Validation failures include `cgame syscall: invalid dispatcher context`.
/// @param host Record exposing `shared`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.argument`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
function dispatch(host,vm,base)
  if host==void or host.shared==void then return error(3422,"cgame syscall: invalid dispatcher context") end if
  op=common.argument(vm,base,0)
  if op>=0 and op<=14 or op>=100 and op<=113 then return common.dispatch(common.ABI_CGAME,host.shared,vm,base) end if
  return dispatchSpecific(vm,base,host,op)
end function

/// Apply `mq3.vm.syscall_cgame.dispatch` for callback in vm.syscall_cgame.
/// @param host Host passed as `host` to `mq3.vm.syscall_cgame.dispatch`.
function callback(host) return function(vm,base) => dispatch(host,vm,base) end function
