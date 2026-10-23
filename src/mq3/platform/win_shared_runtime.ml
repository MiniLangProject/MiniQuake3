// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// MiniLang adaptation of code/win32/win_shared.c.
package mq3.platform.win_shared_runtime
import mq3.compat.numeric as n
import mq3.shared.math as math

const CPUID_GENERIC=0
const CPUID_INTEL_UNSUPPORTED=0x20
const CPUID_INTEL_PENTIUM=0x21
const CPUID_INTEL_MMX=0x22
const CPUID_INTEL_KATMAI=0x23
const CPUID_AMD_3DNOW=0x30

struct Cpu maximum extendedMaximum featureEDX extendedFeatureEDX cpuidSupported end struct
struct Clock initialized timeBase end struct

function createCpu(maximum,extendedMaximum,featureEDX,extendedFeatureEDX,cpuidSupported)
  return Cpu(maximum,extendedMaximum,featureEDX,extendedFeatureEDX,cpuidSupported)
end function
function createClock() return Clock(false,0) end function

// CPUID exposes the four values win_shared consumes. Vendor text is irrelevant
// to the original decision after its vendor restriction was removed.
function CPUID(cpu,func)
  if func==0 then return [cpu.maximum,0,0,0] end if
  if func==1 then return [0,0,0,cpu.featureEDX] end if
  if func==0x80000000 then return [cpu.extendedMaximum,0,0,0] end if
  if func==0x80000001 then return [0,0,0,cpu.extendedFeatureEDX] end if
  return [0,0,0,0]
end function
function IsPentium(cpu) return cpu.cpuidSupported end function
function IsMMX(cpu) return (CPUID(cpu,1)[3]&(1<<23))!=0 end function
function IsKNI(cpu) return (CPUID(cpu,1)[3]&(1<<25))!=0 end function
function Is3DNOW(cpu)
  if CPUID(cpu,0x80000000)[0]<0x80000000 then return false end if
  return (CPUID(cpu,0x80000001)[3]&(1<<31))!=0
end function
function Sys_GetProcessorId(cpu,architecture)
  if architecture!="x86" then return CPUID_GENERIC end if
  if not IsPentium(cpu) then return CPUID_INTEL_UNSUPPORTED end if
  if not IsMMX(cpu) then return CPUID_INTEL_PENTIUM end if
  if Is3DNOW(cpu) then return CPUID_AMD_3DNOW end if
  if IsKNI(cpu) then return CPUID_INTEL_KATMAI end if
  return CPUID_INTEL_MMX
end function

function Sys_Milliseconds(clock,timeGetTime)
  now=n.u32(timeGetTime)
  if not clock.initialized then clock.timeBase=now;clock.initialized=true end if
  return n.i32(n.u32(now-clock.timeBase))
end function
function fastftol(value)
  vector=[value,0.0,0.0];math.SnapVector(vector);return n.trunc32(vector[0])
end function
function Sys_SnapVector(vector) math.SnapVector(vector);return void end function
function Sys_GetCurrentUser(userName)
  if userName==void or typeof(userName)!="string" or len(bytes(userName))==0 then return "player" end if
  data=bytes(userName);if len(data)>1023 then data=slice(data,0,1023) end if;return decode(data)
end function
function Sys_DefaultHomePath() return void end function
function Sys_DefaultInstallPath(currentWorkingDirectory) return currentWorkingDirectory end function
