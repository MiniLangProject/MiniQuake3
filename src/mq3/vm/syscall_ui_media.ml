// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Sound, cinematic and platform-oriented UI traps from CL_UISystemCalls.
package mq3.vm.syscall_ui_media
import mq3.vm.syscall_common as common

/// Byte size used for qtime storage or binary layout in mq3.vm.syscall_ui_media.
const QTIME_SIZE = 36
/// Number of characters stored in the legacy CD-key value.
const CDKEY_CHARS = 16

/// SoundServices record for vm.syscall_ui_media, containing `registerFn`, `startLocalFn`, `stopBackgroundFn`, `startBackgroundFn`.
struct SoundServices
  /// Injected callback for register; invoked through the SoundServices service/state record.
  registerFn
  /// Injected callback for start local; invoked through the SoundServices service/state record.
  startLocalFn
  /// Injected callback for stop background; invoked through the SoundServices service/state record.
  stopBackgroundFn
  /// Injected callback for start background; invoked through the SoundServices service/state record.
  startBackgroundFn
end struct
/// CinematicServices record for vm.syscall_ui_media, containing `playFn`, `stopFn`, `runFn`, `drawFn`, `setExtentsFn`.
struct CinematicServices
  /// Injected callback for play; invoked through the CinematicServices service/state record.
  playFn
  /// Injected callback for stop; invoked through the CinematicServices service/state record.
  stopFn
  /// Injected callback for run; invoked through the CinematicServices service/state record.
  runFn
  /// Injected callback for draw; invoked through the CinematicServices service/state record.
  drawFn
  /// Injected callback for set extents; invoked through the CinematicServices service/state record.
  setExtentsFn
end struct
/// PlatformServices record for vm.syscall_ui_media, containing `realTimeFn`, `remapShaderFn`, `getCdKeyFn`, `setCdKeyFn`, `verifyCdKeyFn`, `seekFn`, and 1 further fields.
struct PlatformServices
  /// Injected callback for real time; invoked through the PlatformServices service/state record.
  realTimeFn
  /// Injected callback for remap shader; invoked through the PlatformServices service/state record.
  remapShaderFn
  /// Injected callback for get cd key; invoked through the PlatformServices service/state record.
  getCdKeyFn
  /// Injected callback for set cd key; invoked through the PlatformServices service/state record.
  setCdKeyFn
  /// Injected callback for verify cd key; invoked through the PlatformServices service/state record.
  verifyCdKeyFn
  /// Injected callback for seek; invoked through the PlatformServices service/state record.
  seekFn
  /// Injected callback for pb status; invoked through the PlatformServices service/state record.
  pbStatusFn
end struct
/// Services record for vm.syscall_ui_media, containing `context`, `sound`, `cinematic`, `platform`.
struct Services
  /// Opaque caller-supplied context available to UI VM sound, cinematic, and platform services.
  context
  /// Sound service bundle used by media and playback operations.
  sound
  /// Cinematic playback service bundle used by UI media calls.
  cinematic
  /// Platform service bundle providing operating-system operations.
  platform
end struct

/// Create `mq3.vm.syscall_ui_media.SoundServices` with registerFn=void; startLocalFn=void; stopBackgroundFn=void; startBackgroundFn=void.
function soundServices() return SoundServices(void,void,void,void) end function
/// Create `mq3.vm.syscall_ui_media.CinematicServices` with playFn=void; stopFn=void; runFn=void; drawFn=void; setExtentsFn=void.
function cinematicServices() return CinematicServices(void,void,void,void,void) end function
/// Create `mq3.vm.syscall_ui_media.PlatformServices` with realTimeFn=void; remapShaderFn=void; getCdKeyFn=void; setCdKeyFn=void; verifyCdKeyFn=void; seekFn=void; pbStatusFn=void.
function platformServices() return PlatformServices(void,void,void,void,void,void,void) end function
/// Create `mq3.vm.syscall_ui_media.Services` with context=context; sound=soundServices(); cinematic=cinematicServices(); platform=platformServices().
/// @param context Initial `context` field stored in the returned or constructed `mq3.vm.syscall_ui_media.Services` record.
function services(context) return Services(context,soundServices(),cinematicServices(),platformServices()) end function
/// Create the vm.syscall_ui_media error for `unavailable` with 3424 and the supplied diagnostic text.
/// @param name Name used in `("UI media syscall: " + name)` and `(("UI media syscall: " + name) + " service unavailable")`.
function unavailable(name) return error(3424,"UI media syscall: "+name+" service unavailable") end function
/// Return `mq3.vm.syscall_common.argument(vm, base, index)` from `vm.syscall_ui_media.arg`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.argument`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
/// @param index Index passed as `index` to `mq3.vm.syscall_common.argument`.
function arg(vm,base,index) return common.argument(vm,base,index) end function

/// Register sound in vm.syscall_ui_media; the normal completion returns `host.sound.registerFn(host.context, common.readString(vm, arg(vm, base, 1)), (arg(vm, base, 2) != 0))`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.readString`.
/// @param base Base passed as `base` to `mq3.vm.syscall_ui_media.arg`.
/// @param host Record exposing `sound`, `context`.
function registerSound(vm,base,host)
  if host.sound.registerFn==void then return unavailable("register sound") end if
  return host.sound.registerFn(host.context,common.readString(vm,arg(vm,base,1)),arg(vm,base,2)!=0)
end function

/// Start local sound in vm.syscall_ui_media; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_ui_media.arg`.
/// @param base Base passed as `base` to `mq3.vm.syscall_ui_media.arg`.
/// @param host Record exposing `sound`, `context`.
function startLocalSound(vm,base,host)
  if host.sound.startLocalFn==void then return unavailable("start local sound") end if
  host.sound.startLocalFn(host.context,arg(vm,base,1),arg(vm,base,2));return 0
end function

/// Start background in vm.syscall_ui_media; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.readString`.
/// @param base Base passed as `base` to `mq3.vm.syscall_ui_media.arg`.
/// @param host Record exposing `sound`, `context`.
function startBackground(vm,base,host)
  if host.sound.startBackgroundFn==void then return unavailable("start background track") end if
  host.sound.startBackgroundFn(host.context,common.readString(vm,arg(vm,base,1)),common.readString(vm,arg(vm,base,2)));return 0
end function

/// Compute real time in vm.syscall_ui_media; the normal completion returns `value[0]`.
///
/// Validation failures include `UI media syscall: invalid qtime_t layout`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.writeRaw`.
/// @param base Base passed as `base` to `mq3.vm.syscall_ui_media.arg`.
/// @param host Record exposing `platform`, `context`.
function realTime(vm,base,host)
  if host.platform.realTimeFn==void then return unavailable("real time") end if
  value=host.platform.realTimeFn(host.context)
  if len(value)!=2 or typeof(value[1])!="bytes" or len(value[1])!=QTIME_SIZE then return error(3424,"UI media syscall: invalid qtime_t layout") end if
  common.writeRaw(vm,arg(vm,base,1),value[1],QTIME_SIZE,"qtime_t output");return value[0]
end function

/// Apply `mq3.vm.syscall_ui_media.unavailable`, `host.cinematic.playFn`, `mq3.vm.syscall_common.readString` for play cinematic in vm.syscall_ui_media.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.readString`.
/// @param base Base passed as `base` to `mq3.vm.syscall_ui_media.arg`.
/// @param host Record exposing `cinematic`, `context`.
function playCinematic(vm,base,host)
  if host.cinematic.playFn==void then return unavailable("play cinematic") end if
  return host.cinematic.playFn(host.context,common.readString(vm,arg(vm,base,1)),arg(vm,base,2),arg(vm,base,3),arg(vm,base,4),arg(vm,base,5),arg(vm,base,6))
end function

/// Set extents in vm.syscall_ui_media; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_ui_media.arg`.
/// @param base Base passed as `base` to `mq3.vm.syscall_ui_media.arg`.
/// @param host Record exposing `cinematic`, `context`.
function setExtents(vm,base,host)
  if host.cinematic.setExtentsFn==void then return unavailable("set cinematic extents") end if
  host.cinematic.setExtentsFn(host.context,arg(vm,base,1),arg(vm,base,2),arg(vm,base,3),arg(vm,base,4),arg(vm,base,5));return 0
end function

/// Compute remap shader in vm.syscall_ui_media; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.readString`.
/// @param base Base passed as `base` to `mq3.vm.syscall_ui_media.arg`.
/// @param host Record exposing `platform`, `context`.
function remapShader(vm,base,host)
  if host.platform.remapShaderFn==void then return unavailable("remap shader") end if
  host.platform.remapShaderFn(host.context,common.readString(vm,arg(vm,base,1)),common.readString(vm,arg(vm,base,2)),common.readString(vm,arg(vm,base,3)));return 0
end function

/// Get cd key in vm.syscall_ui_media; the normal completion returns `0`.
///
/// Validation failures include `UI media syscall: CD-key output capacity below 17 bytes`; `UI media syscall: CD-key service returned fewer than 16 bytes`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_ui_media.arg`.
/// @param base Base passed as `base` to `mq3.vm.syscall_ui_media.arg`.
/// @param host Record exposing `platform`, `context`.
function getCdKey(vm,base,host)
  if host.platform.getCdKeyFn==void then return unavailable("get CD key") end if
  capacity=arg(vm,base,2)
  if capacity<17 then return error(3424,"UI media syscall: CD-key output capacity below 17 bytes") end if
  key=bytes(host.platform.getCdKeyFn(host.context))
  if len(key)<CDKEY_CHARS then return error(3424,"UI media syscall: CD-key service returned fewer than 16 bytes") end if
  output=bytes(17,0);copyBytes(output,0,key,0,CDKEY_CHARS)
  common.writeRaw(vm,arg(vm,base,1),output,17,"CD-key output");return 0
end function

/// Set cd key in vm.syscall_ui_media; the normal completion returns `0`.
/// @param vm Record exposing `data`.
/// @param base Base passed as `base` to `mq3.vm.syscall_ui_media.arg`.
/// @param host Record exposing `platform`, `context`.
function setCdKey(vm,base,host)
  if host.platform.setCdKeyFn==void then return unavailable("set CD key") end if
  at=common.pointer(vm,arg(vm,base,1),CDKEY_CHARS,"CD-key input")
  host.platform.setCdKeyFn(host.context,slice(vm.data,at,CDKEY_CHARS));return 0
end function

/// Compute verify cd key in vm.syscall_ui_media; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_ui_media.arg`.
/// @param base Base passed as `base` to `mq3.vm.syscall_ui_media.arg`.
/// @param host Record exposing `platform`, `context`.
function verifyCdKey(vm,base,host)
  if host.platform.verifyCdKeyFn==void then return unavailable("verify CD key") end if
  key="";keyAt=arg(vm,base,1);if keyAt!=0 then key=common.readString(vm,keyAt) end if
  checksum="";checksumAt=arg(vm,base,2);if checksumAt!=0 then checksum=common.readString(vm,checksumAt) end if
  if host.platform.verifyCdKeyFn(host.context,key,checksum) then return 1 end if
  return 0
end function

/// Dispatch syscall ui media in vm.syscall_ui_media; the normal completion returns `error(3424, ("UI media syscall: unsupported trap " + str(op)))`.
///
/// Validation failures include `UI media syscall: invalid dispatcher context`.
/// @param host Record exposing `sound`, `context`, `cinematic`, `platform`.
/// @param vm Record exposing `data`.
/// @param base Base passed as `base` to `mq3.vm.syscall_ui_media.arg`.
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

/// Apply `mq3.vm.syscall_ui_media.dispatch` for callback in vm.syscall_ui_media.
/// @param host Host passed as `host` to `mq3.vm.syscall_ui_media.dispatch`.
function callback(host) return function(vm,base) => dispatch(host,vm,base) end function
