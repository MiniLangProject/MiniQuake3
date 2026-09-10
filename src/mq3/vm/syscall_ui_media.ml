// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Sound, cinematic and platform-oriented UI traps from CL_UISystemCalls.
package mq3.vm.syscall_ui_media
import mq3.vm.syscall_common as common

const QTIME_SIZE = 36
const CDKEY_CHARS = 16

struct SoundServices registerFn startLocalFn stopBackgroundFn startBackgroundFn end struct
struct CinematicServices playFn stopFn runFn drawFn setExtentsFn end struct
struct PlatformServices realTimeFn remapShaderFn getCdKeyFn setCdKeyFn verifyCdKeyFn seekFn pbStatusFn end struct
struct Services context sound cinematic platform end struct

function soundServices() return SoundServices(void,void,void,void) end function
function cinematicServices() return CinematicServices(void,void,void,void,void) end function
function platformServices() return PlatformServices(void,void,void,void,void,void,void) end function
function services(context) return Services(context,soundServices(),cinematicServices(),platformServices()) end function
function unavailable(name) return error(3424,"UI media syscall: "+name+" service unavailable") end function
function arg(vm,base,index) return common.argument(vm,base,index) end function

function registerSound(vm,base,host)
  if host.sound.registerFn==void then return unavailable("register sound") end if
  return host.sound.registerFn(host.context,common.readString(vm,arg(vm,base,1)),arg(vm,base,2)!=0)
end function

function startLocalSound(vm,base,host)
  if host.sound.startLocalFn==void then return unavailable("start local sound") end if
  host.sound.startLocalFn(host.context,arg(vm,base,1),arg(vm,base,2));return 0
end function

function startBackground(vm,base,host)
  if host.sound.startBackgroundFn==void then return unavailable("start background track") end if
  host.sound.startBackgroundFn(host.context,common.readString(vm,arg(vm,base,1)),common.readString(vm,arg(vm,base,2)));return 0
end function

function realTime(vm,base,host)
  if host.platform.realTimeFn==void then return unavailable("real time") end if
  value=host.platform.realTimeFn(host.context)
  if len(value)!=2 or typeof(value[1])!="bytes" or len(value[1])!=QTIME_SIZE then return error(3424,"UI media syscall: invalid qtime_t layout") end if
  common.writeRaw(vm,arg(vm,base,1),value[1],QTIME_SIZE,"qtime_t output");return value[0]
end function

function playCinematic(vm,base,host)
  if host.cinematic.playFn==void then return unavailable("play cinematic") end if
  return host.cinematic.playFn(host.context,common.readString(vm,arg(vm,base,1)),arg(vm,base,2),arg(vm,base,3),arg(vm,base,4),arg(vm,base,5),arg(vm,base,6))
end function

function setExtents(vm,base,host)
  if host.cinematic.setExtentsFn==void then return unavailable("set cinematic extents") end if
  host.cinematic.setExtentsFn(host.context,arg(vm,base,1),arg(vm,base,2),arg(vm,base,3),arg(vm,base,4),arg(vm,base,5));return 0
end function

function remapShader(vm,base,host)
  if host.platform.remapShaderFn==void then return unavailable("remap shader") end if
  host.platform.remapShaderFn(host.context,common.readString(vm,arg(vm,base,1)),common.readString(vm,arg(vm,base,2)),common.readString(vm,arg(vm,base,3)));return 0
end function

function getCdKey(vm,base,host)
  if host.platform.getCdKeyFn==void then return unavailable("get CD key") end if
  capacity=arg(vm,base,2)
  if capacity<17 then return error(3424,"UI media syscall: CD-key output capacity below 17 bytes") end if
  key=bytes(host.platform.getCdKeyFn(host.context))
  if len(key)<CDKEY_CHARS then return error(3424,"UI media syscall: CD-key service returned fewer than 16 bytes") end if
  output=bytes(17,0);copyBytes(output,0,key,0,CDKEY_CHARS)
  common.writeRaw(vm,arg(vm,base,1),output,17,"CD-key output");return 0
end function

function setCdKey(vm,base,host)
  if host.platform.setCdKeyFn==void then return unavailable("set CD key") end if
  at=common.pointer(vm,arg(vm,base,1),CDKEY_CHARS,"CD-key input")
  host.platform.setCdKeyFn(host.context,slice(vm.data,at,CDKEY_CHARS));return 0
end function

function verifyCdKey(vm,base,host)
  if host.platform.verifyCdKeyFn==void then return unavailable("verify CD key") end if
  if host.platform.verifyCdKeyFn(host.context,common.readString(vm,arg(vm,base,1)),common.readString(vm,arg(vm,base,2))) then return 1 end if
  return 0
end function

function dispatch(host,vm,base)
  if host==void or vm==void or typeof(vm.data)!="bytes" then return error(3424,"UI media syscall: invalid dispatcher context") end if
  op=arg(vm,base,0)
  switch op
    case 31 return registerSound(vm,base,host) end case
    case 32 return startLocalSound(vm,base,host) end case
    case 53 return getCdKey(vm,base,host) end case
    case 54 return setCdKey(vm,base,host) end case
    case 62 if host.sound.stopBackgroundFn==void then return unavailable("stop background track") end if;host.sound.stopBackgroundFn(host.context);return 0 end case
    case 63 return startBackground(vm,base,host) end case
    case 64 return realTime(vm,base,host) end case
    case 75 return playCinematic(vm,base,host) end case
    case 76 if host.cinematic.stopFn==void then return unavailable("stop cinematic") end if;return host.cinematic.stopFn(host.context,arg(vm,base,1)) end case
    case 77 if host.cinematic.runFn==void then return unavailable("run cinematic") end if;return host.cinematic.runFn(host.context,arg(vm,base,1)) end case
    case 78 if host.cinematic.drawFn==void then return unavailable("draw cinematic") end if;host.cinematic.drawFn(host.context,arg(vm,base,1));return 0 end case
    case 79 return setExtents(vm,base,host) end case
    case 80 return remapShader(vm,base,host) end case
    case 81 return verifyCdKey(vm,base,host) end case
    case 86 if host.platform.seekFn==void then return unavailable("file seek") end if;return host.platform.seekFn(host.context,arg(vm,base,1),arg(vm,base,2),arg(vm,base,3)) end case
    case 87 if host.platform.pbStatusFn!=void then host.platform.pbStatusFn(host.context,arg(vm,base,1)) end if;return 0 end case
  end switch
  return error(3424,"UI media syscall: unsupported trap "+str(op))
end function

function callback(host) return function(vm,base) => dispatch(host,vm,base) end function
