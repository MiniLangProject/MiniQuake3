// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// UI-specific traps from CL_UISystemCalls.
package mq3.vm.syscall_ui
import mq3.vm.syscall_common as common
import mq3.vm.syscall_ui_media as media
import mq3.compat.numeric as n

const CLIENT_STATE_SIZE = 3084
const GLCONFIG_SIZE = 11332

struct ClientServices clipboardFn glconfigFn clientStateFn configStringFn end struct
struct KeyServices keyNameFn bindingFn setBindingFn isDownFn getOverstrikeFn setOverstrikeFn clearFn getCatcherFn setCatcherFn end struct
struct RendererServices registerModelFn registerSkinFn registerShaderNoMipFn clearSceneFn setColorFn drawStretchPicFn updateScreenFn end struct
struct LanServices loadFn saveFn addFn removeFn pingQueueCountFn clearPingFn getPingFn getPingInfoFn serverCountFn serverAddressFn serverInfoFn serverPingFn markVisibleFn isVisibleFn updatePingsFn resetPingsFn serverStatusFn compareFn end struct
struct Services shared context client keys renderer lan fileListFn memoryRemainingFn mediaServices extendedFn end struct

function clientServices() return ClientServices(void,void,void,void) end function
function keyServices() return KeyServices(void,void,void,void,void,void,void,void,void) end function
function rendererServices() return RendererServices(void,void,void,void,void,void,void) end function
function lanServices() return LanServices(void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void) end function
function services(shared,context) return Services(shared,context,clientServices(),keyServices(),rendererServices(),lanServices(),void,void,void,void) end function
function unavailable(name) return error(3423,"UI syscall: "+name+" service unavailable") end function
function arg(vm,base,index) return common.argument(vm,base,index) end function

function output(vm,address,capacity,text,label)
  common.writeBuffer(vm,address,capacity,text,label);return 0
end function

function fixedOutput(vm,address,data,size,label)
  if typeof(data)!="bytes" or len(data)!=size then return error(3423,"UI syscall: invalid "+label+" layout") end if
  common.writeRaw(vm,address,data,size,label+" output");return 0
end function

function registerAsset(vm,base,host,callback,name)
  if callback==void then return unavailable(name) end if
  return callback(host.context,common.readString(vm,arg(vm,base,1)))
end function

function stringOutput(vm,base,host,callback,name)
  if callback==void then return unavailable(name) end if
  return output(vm,arg(vm,base,2),arg(vm,base,3),callback(host.context,arg(vm,base,1)),name+" output")
end function

function setBinding(vm,base,host)
  if host.keys.setBindingFn==void then return unavailable("set binding") end if
  host.keys.setBindingFn(host.context,arg(vm,base,1),common.readString(vm,arg(vm,base,2)));return 0
end function

function setColor(vm,base,host)
  if host.renderer.setColorFn==void then return unavailable("set color") end if
  address=arg(vm,base,1);color=void
  if address!=0 then
    at=common.pointer(vm,address,16,"color input")
    color=[n.bitsFloat(n.readI32(vm.data,at)),n.bitsFloat(n.readI32(vm.data,at+4)),n.bitsFloat(n.readI32(vm.data,at+8)),n.bitsFloat(n.readI32(vm.data,at+12))]
  end if
  host.renderer.setColorFn(host.context,color);return 0
end function

function drawStretchPic(vm,base,host)
  if host.renderer.drawStretchPicFn==void then return unavailable("draw stretch pic") end if
  values=[]
  for index=1 to 8 values=values+[n.bitsFloat(arg(vm,base,index))] end for
  host.renderer.drawStretchPicFn(host.context,values,arg(vm,base,9));return 0
end function

function getClientState(vm,base,host)
  if host.client.clientStateFn==void then return unavailable("client state") end if
  return fixedOutput(vm,arg(vm,base,1),host.client.clientStateFn(host.context),CLIENT_STATE_SIZE,"client state")
end function

function getConfigString(vm,base,host)
  if host.client.configStringFn==void then return unavailable("config string") end if
  value=host.client.configStringFn(host.context,arg(vm,base,1))
  if value==void then return 0 end if
  output(vm,arg(vm,base,2),arg(vm,base,3),value,"config string output");return 1
end function

function getPing(vm,base,host)
  if host.lan.getPingFn==void then return unavailable("ping") end if
  value=host.lan.getPingFn(host.context,arg(vm,base,1))
  if value==void then value=["",0] end if
  output(vm,arg(vm,base,2),arg(vm,base,3),value[0],"ping address output")
  at=common.pointer(vm,arg(vm,base,4),4,"ping time output");n.writeU32(vm.data,at,value[1]);return 0
end function

function getFileList(vm,base,host)
  if host.fileListFn==void then return unavailable("file list") end if
  capacity=arg(vm,base,4);if capacity<0 then return error(3423,"UI syscall: negative file-list capacity") end if
  path="";extension="";pathAt=arg(vm,base,1);extensionAt=arg(vm,base,2)
  if pathAt!=0 then path=common.readString(vm,pathAt) end if;if extensionAt!=0 then extension=common.readString(vm,extensionAt) end if
  entries=host.fileListFn(host.context,path,extension)
  if entries==void then entries=[] end if;data=bytes(capacity,0);cursor=0;count=0
  for each name in entries
    encoded=bytes(name);if cursor+len(encoded)+1>capacity then break end if
    copyBytes(data,cursor,encoded,0,len(encoded));cursor=cursor+len(encoded)+1;count=count+1
  end for
  if capacity>0 then common.writeRaw(vm,arg(vm,base,3),data,capacity,"file list output") end if
  return count
end function

function lanString(vm,base,host,callback,name)
  if callback==void then return unavailable(name) end if
  value=callback(host.context,arg(vm,base,1),arg(vm,base,2))
  return output(vm,arg(vm,base,3),arg(vm,base,4),value,name+" output")
end function

function serverStatus(vm,base,host)
  if host.lan.serverStatusFn==void then return unavailable("server status") end if
  address=common.readString(vm,arg(vm,base,1));capacity=arg(vm,base,3)
  value=host.lan.serverStatusFn(host.context,address)
  if value==void then return 0 end if
  output(vm,arg(vm,base,2),capacity,value,"server status output");return 1
end function

function dispatchSpecific(vm,base,host,op)
  if op==31 or op==32 or op==53 or op==54 or (op>=62 and op<=64) or (op>=75 and op<=81) or op==86 or op==87 then
    if host.mediaServices==void then return unavailable("media") end if
    return media.dispatch(host.mediaServices,vm,base)
  end if
  switch op
    case 17 return getFileList(vm,base,host) end case
    case 18 return registerAsset(vm,base,host,host.renderer.registerModelFn,"register model") end case
    case 19 return registerAsset(vm,base,host,host.renderer.registerSkinFn,"register skin") end case
    case 20 return registerAsset(vm,base,host,host.renderer.registerShaderNoMipFn,"register shader no mip") end case
    case 21 if host.renderer.clearSceneFn==void then return unavailable("clear scene") end if;host.renderer.clearSceneFn(host.context);return 0 end case
    case 26 return setColor(vm,base,host) end case
    case 27 return drawStretchPic(vm,base,host) end case
    case 28 if host.renderer.updateScreenFn==void then return unavailable("screen update") end if;host.renderer.updateScreenFn(host.context);return 0 end case
    case 33 return stringOutput(vm,base,host,host.keys.keyNameFn,"key name") end case
    case 34 return stringOutput(vm,base,host,host.keys.bindingFn,"binding") end case
    case 35 return setBinding(vm,base,host) end case
    case 36 if host.keys.isDownFn==void then return unavailable("key state") end if;if host.keys.isDownFn(host.context,arg(vm,base,1)) then return 1 end if;return 0 end case
    case 37 if host.keys.getOverstrikeFn==void then return unavailable("overstrike state") end if;if host.keys.getOverstrikeFn(host.context) then return 1 end if;return 0 end case
    case 38 if host.keys.setOverstrikeFn==void then return unavailable("set overstrike") end if;host.keys.setOverstrikeFn(host.context,arg(vm,base,1)!=0);return 0 end case
    case 39 if host.keys.clearFn==void then return unavailable("clear keys") end if;host.keys.clearFn(host.context);return 0 end case
    case 40 if host.keys.getCatcherFn==void then return unavailable("key catcher") end if;return host.keys.getCatcherFn(host.context) end case
    case 41 if host.keys.setCatcherFn==void then return unavailable("set key catcher") end if;host.keys.setCatcherFn(host.context,arg(vm,base,1));return 0 end case
    case 42 if host.client.clipboardFn==void then return unavailable("clipboard") end if;return output(vm,arg(vm,base,1),arg(vm,base,2),host.client.clipboardFn(host.context),"clipboard output") end case
    case 43 if host.client.glconfigFn==void then return unavailable("glconfig") end if;return fixedOutput(vm,arg(vm,base,1),host.client.glconfigFn(host.context),GLCONFIG_SIZE,"glconfig") end case
    case 44 return getClientState(vm,base,host) end case
    case 45 return getConfigString(vm,base,host) end case
    case 46 if host.lan.pingQueueCountFn==void then return unavailable("ping queue count") end if;return host.lan.pingQueueCountFn(host.context) end case
    case 47 if host.lan.clearPingFn==void then return unavailable("clear ping") end if;host.lan.clearPingFn(host.context,arg(vm,base,1));return 0 end case
    case 48 return getPing(vm,base,host) end case
    case 49 return stringOutput(vm,base,host,host.lan.getPingInfoFn,"ping info") end case
    case 52 if host.memoryRemainingFn==void then return unavailable("memory remaining") end if;return host.memoryRemainingFn(host.context) end case
    case 65 if host.lan.serverCountFn==void then return unavailable("server count") end if;return host.lan.serverCountFn(host.context,arg(vm,base,1)) end case
    case 66 return lanString(vm,base,host,host.lan.serverAddressFn,"server address") end case
    case 67 return lanString(vm,base,host,host.lan.serverInfoFn,"server info") end case
    case 68 if host.lan.markVisibleFn==void then return unavailable("mark visible") end if;host.lan.markVisibleFn(host.context,arg(vm,base,1),arg(vm,base,2),arg(vm,base,3)!=0);return 0 end case
    case 69 if host.lan.updatePingsFn==void then return unavailable("update pings") end if;if host.lan.updatePingsFn(host.context,arg(vm,base,1)) then return 1 end if;return 0 end case
    case 70 if host.lan.resetPingsFn==void then return unavailable("reset pings") end if;host.lan.resetPingsFn(host.context,arg(vm,base,1));return 0 end case
    case 71 if host.lan.loadFn==void then return unavailable("load cached servers") end if;host.lan.loadFn(host.context);return 0 end case
    case 72 if host.lan.saveFn==void then return unavailable("save cached servers") end if;host.lan.saveFn(host.context);return 0 end case
    case 73 if host.lan.addFn==void then return unavailable("add server") end if;return host.lan.addFn(host.context,arg(vm,base,1),common.readString(vm,arg(vm,base,2)),common.readString(vm,arg(vm,base,3))) end case
    case 74 if host.lan.removeFn==void then return unavailable("remove server") end if;host.lan.removeFn(host.context,arg(vm,base,1),common.readString(vm,arg(vm,base,2)));return 0 end case
    case 82 return serverStatus(vm,base,host) end case
    case 83 if host.lan.serverPingFn==void then return unavailable("server ping") end if;return host.lan.serverPingFn(host.context,arg(vm,base,1),arg(vm,base,2)) end case
    case 84 if host.lan.isVisibleFn==void then return unavailable("server visibility") end if;if host.lan.isVisibleFn(host.context,arg(vm,base,1),arg(vm,base,2)) then return 1 end if;return 0 end case
    case 85 if host.lan.compareFn==void then return unavailable("compare servers") end if;return host.lan.compareFn(host.context,arg(vm,base,1),arg(vm,base,2),arg(vm,base,3),arg(vm,base,4),arg(vm,base,5)) end case
  end switch
  if host.extendedFn!=void then return host.extendedFn(host.context,vm,base,op) end if
  return error(3423,"UI syscall: unsupported client trap "+str(op))
end function

function dispatch(host,vm,base)
  if host==void or host.shared==void then return error(3423,"UI syscall: invalid dispatcher context") end if
  op=common.argument(vm,base,0)
  if op>=0 and op<=16 or op==50 or op==51 or op>=100 and op<=113 then return common.dispatch(common.ABI_UI,host.shared,vm,base) end if
  return dispatchSpecific(vm,base,host,op)
end function

function callback(host) return function(vm,base) => dispatch(host,vm,base) end function
