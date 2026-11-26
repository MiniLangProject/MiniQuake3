// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// MiniLang adaptation of code/win32/win_shared.c.
package mq3.platform.win_shared_runtime
import mq3.compat.numeric as n
import mq3.shared.math as math

/// Processor category using the generic implementation path.
const CPUID_GENERIC=0
/// Processor category marking an unsupported legacy Intel CPU.
const CPUID_INTEL_UNSUPPORTED=0x20
/// Processor category selecting the Pentium-compatible implementation path.
const CPUID_INTEL_PENTIUM=0x21
/// Processor category indicating Intel MMX support.
const CPUID_INTEL_MMX=0x22
/// Processor category indicating the Intel Katmai/SSE implementation path.
const CPUID_INTEL_KATMAI=0x23
/// Processor category indicating AMD 3DNow support.
const CPUID_AMD_3DNOW=0x30

/// Data record for `mq3.platform.win_shared_runtime.Cpu`; groups `maximum`, `extendedMaximum`, `featureEDX`, `extendedFeatureEDX`, `cpuidSupported`.
struct Cpu
  /// Highest supported basic CPUID leaf.
  maximum
  /// Highest supported extended CPUID leaf.
  extendedMaximum
  /// Processor feature flags returned in EDX by the basic CPUID query.
  featureEDX
  /// Processor feature flags returned in EDX by the extended CPUID query.
  extendedFeatureEDX
  /// Whether the processor supports the CPUID instruction.
  cpuidSupported
end struct
/// Data record for `mq3.platform.win_shared_runtime.Clock`; groups `initialized`, `timeBase`.
struct Clock
  /// Whether initialization completed successfully.
  initialized
  /// Clock origin subtracted to produce elapsed platform milliseconds.
  timeBase
end struct

/// Constructs `mq3.platform.win_shared_runtime.Cpu` from `maximum`, `extendedMaximum`, `featureEDX`, `extendedFeatureEDX`, `cpuidSupported`.
/// @param maximum Initial value for `mq3.platform.win_shared_runtime.Cpu.maximum`.
/// @param extendedMaximum Initial value for `mq3.platform.win_shared_runtime.Cpu.extendedMaximum`.
/// @param featureEDX Initial value for `mq3.platform.win_shared_runtime.Cpu.featureEDX`.
/// @param extendedFeatureEDX Initial value for `mq3.platform.win_shared_runtime.Cpu.extendedFeatureEDX`.
/// @param cpuidSupported Initial value for `mq3.platform.win_shared_runtime.Cpu.cpuidSupported`.
function createCpu(maximum,extendedMaximum,featureEDX,extendedFeatureEDX,cpuidSupported)
  return Cpu(maximum,extendedMaximum,featureEDX,extendedFeatureEDX,cpuidSupported)
end function
/// Constructs `mq3.platform.win_shared_runtime.Clock` with `initialized` = `false`, `timeBase` = `0`.
function createClock() return Clock(false,0) end function

// CPUID exposes the four values win_shared consumes. Vendor text is irrelevant
// to the original decision after its vendor restriction was removed.
/// @param cpu Record providing `cpu.maximum`, `cpu.featureEDX`, `cpu.extendedMaximum`, `cpu.extendedFeatureEDX`.
/// @param func Input tested by `func==0`.
function CPUID(cpu,func)
  if func==0 then return [cpu.maximum,0,0,0] end if
  if func==1 then return [0,0,0,cpu.featureEDX] end if
  if func==0x80000000 then return [cpu.extendedMaximum,0,0,0] end if
  if func==0x80000001 then return [0,0,0,cpu.extendedFeatureEDX] end if
  return [0,0,0,0]
end function
/// Computes `cpu.cpuidSupported` for `mq3.platform.win_shared_runtime.IsPentium`.
/// @param cpu Record providing `cpu.cpuidSupported`.
function IsPentium(cpu) return cpu.cpuidSupported end function
/// Computes `(CPUID(cpu,1)[3]&(1<<23))!=0` for `mq3.platform.win_shared_runtime.IsMMX`.
/// @param cpu Value forwarded as `cpu` to `mq3.platform.win_shared_runtime.CPUID`.
function IsMMX(cpu) return (CPUID(cpu,1)[3]&(1<<23))!=0 end function
/// Computes `(CPUID(cpu,1)[3]&(1<<25))!=0` for `mq3.platform.win_shared_runtime.IsKNI`.
/// @param cpu Value forwarded as `cpu` to `mq3.platform.win_shared_runtime.CPUID`.
function IsKNI(cpu) return (CPUID(cpu,1)[3]&(1<<25))!=0 end function
/// Returns `(CPUID(cpu,0x80000001)[3]&(1<<31))!=0` from `mq3.platform.win_shared_runtime.Is3DNOW`; earlier branches return `false`.
/// @param cpu Value forwarded as `cpu` to `mq3.platform.win_shared_runtime.CPUID`.
function Is3DNOW(cpu)
  if CPUID(cpu,0x80000000)[0]<0x80000000 then return false end if
  return (CPUID(cpu,0x80000001)[3]&(1<<31))!=0
end function
/// Selects the legacy Quake processor identifier from architecture and Pentium/MMX/3DNow/SSE feature checks.
/// @param cpu Value forwarded as `cpu` to `mq3.platform.win_shared_runtime.IsPentium`.
/// @param architecture Input tested by `architecture!="x86"`.
function Sys_GetProcessorId(cpu,architecture)
  if architecture!="x86" then return CPUID_GENERIC end if
  if not IsPentium(cpu) then return CPUID_INTEL_UNSUPPORTED end if
  if not IsMMX(cpu) then return CPUID_INTEL_PENTIUM end if
  if Is3DNOW(cpu) then return CPUID_AMD_3DNOW end if
  if IsKNI(cpu) then return CPUID_INTEL_KATMAI end if
  return CPUID_INTEL_MMX
end function

/// Updates `clock.timeBase`, `clock.initialized` in `mq3.platform.win_shared_runtime.Sys_Milliseconds`; returns `n.i32(n.u32(now-clock.timeBase))`.
/// @param clock Mutable record or buffer; this call updates `clock.timeBase`, `clock.initialized`.
/// @param timeGetTime Argument 1 supplied to `mq3.compat.numeric.u32`.
function Sys_Milliseconds(clock,timeGetTime)
  now=n.u32(timeGetTime)
  if not clock.initialized then clock.timeBase=now;clock.initialized=true end if
  return n.i32(n.u32(now-clock.timeBase))
end function
/// Returns `n.trunc32(vector[0])` from `mq3.platform.win_shared_runtime.fastftol`.
/// @param value Input used by `vector=[value,0.0,0.0]`.
function fastftol(value)
  vector=[value,0.0,0.0];math.SnapVector(vector);return n.trunc32(vector[0])
end function
/// Returns `void` from `mq3.platform.win_shared_runtime.Sys_SnapVector`.
/// @param vector Argument 1 supplied to `mq3.shared.math.SnapVector`.
function Sys_SnapVector(vector) math.SnapVector(vector);return void end function
/// Returns `decode(data)` from `mq3.platform.win_shared_runtime.Sys_GetCurrentUser`; earlier branches return `"player"`.
/// @param userName Argument 1 supplied to `bytes`.
function Sys_GetCurrentUser(userName)
  if userName==void or typeof(userName)!="string" or len(bytes(userName))==0 then return "player" end if
  data=bytes(userName);if len(data)>1023 then data=slice(data,0,1023) end if;return decode(data)
end function
/// Returns `void` for the `mq3.platform.win_shared_runtime.Sys_DefaultHomePath` compatibility entry point.
function Sys_DefaultHomePath() return void end function
/// Computes `currentWorkingDirectory` for `mq3.platform.win_shared_runtime.Sys_DefaultInstallPath`.
/// @param currentWorkingDirectory Input used in the result expression `currentWorkingDirectory`.
function Sys_DefaultInstallPath(currentWorkingDirectory) return currentWorkingDirectory end function
