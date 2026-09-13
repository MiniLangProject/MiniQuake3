// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Client-specific cgame traps from CL_CgameSystemCalls.
package mq3.vm.syscall_cgame
import mq3.vm.syscall_common as common
import mq3.compat.numeric as n

const GAMESTATE_SIZE = 20100
const SNAPSHOT_SIZE = 53772
const USERCMD_SIZE = 24
const GLCONFIG_SIZE = 11332

struct BytesResult found data end struct
struct SnapshotNumber number serverTime end struct

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
  extendedFn
end struct

function services(shared,context)
  return Services(shared,context,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void)
end function

function unavailable(name) return error(3422,"cgame syscall: "+name+" service unavailable") end function
function arg(vm,base,index) return common.argument(vm,base,index) end function

function exactOutput(vm,address,data,size,label)
  if typeof(data)!="bytes" or len(data)!=size then return error(3422,"cgame syscall: invalid "+label+" layout") end if
  common.writeRaw(vm,address,data,size,label+" output")
  return 0
end function

function stringEvent(vm,base,host,callback,name)
  if callback==void then return unavailable(name) end if
  callback(host.context,common.readString(vm,arg(vm,base,1)));return 0
end function

function registerAsset(vm,base,host,callback,name)
  if callback==void then return unavailable(name) end if
  return callback(host.context,common.readString(vm,arg(vm,base,1)))
end function

function fixedState(vm,base,host,callback,size,name)
  if callback==void then return unavailable(name) end if
  return exactOutput(vm,arg(vm,base,1),callback(host.context),size,name)
end function

function currentSnapshotNumber(vm,base,host)
  if host.getCurrentSnapshotNumberFn==void then return unavailable("current snapshot number") end if
  result=host.getCurrentSnapshotNumberFn(host.context)
  if result==void then return error(3422,"cgame syscall: invalid current snapshot result") end if
  numberAt=common.pointer(vm,arg(vm,base,1),4,"snapshot number output")
  timeAt=common.pointer(vm,arg(vm,base,2),4,"snapshot time output")
  n.writeU32(vm.data,numberAt,result.number);n.writeU32(vm.data,timeAt,result.serverTime)
  return 0
end function

function variableState(vm,base,host,callback,size,name)
  if callback==void then return unavailable(name) end if
  result=callback(host.context,arg(vm,base,1))
  if result==void or not result.found then return 0 end if
  exactOutput(vm,arg(vm,base,2),result.data,size,name)
  return 1
end function

function getServerCommand(vm,base,host)
  if host.getServerCommandFn==void then return unavailable("server command") end if
  if host.getServerCommandFn(host.context,arg(vm,base,1)) then return 1 end if
  return 0
end function

function setUserCmdValue(vm,base,host)
  if host.setUserCmdValueFn==void then return unavailable("usercmd value") end if
  host.setUserCmdValueFn(host.context,arg(vm,base,1),n.bitsFloat(arg(vm,base,2)));return 0
end function

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
    case 72 return stringEvent(vm,base,host,host.removeCommandFn,"remove command") end case
  end switch
  if host.extendedFn!=void then return host.extendedFn(host.context,vm,base,op) end if
  return error(3422,"cgame syscall: unsupported client trap "+str(op))
end function

function dispatch(host,vm,base)
  if host==void or host.shared==void then return error(3422,"cgame syscall: invalid dispatcher context") end if
  op=common.argument(vm,base,0)
  if op>=0 and op<=14 or op>=100 and op<=113 then return common.dispatch(common.ABI_CGAME,host.shared,vm,base) end if
  return dispatchSpecific(vm,base,host,op)
end function

function callback(host) return function(vm,base) => dispatch(host,vm,base) end function
