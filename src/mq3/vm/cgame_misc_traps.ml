// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CG_REAL_TIME, CG_SNAPVECTOR and CG_GET_ENTITY_TOKEN host-side QVM ABI.
package mq3.vm.cgame_misc_traps

import std.time as time
import mq3.compat.numeric as n
import mq3.shared.math as qmath
import mq3.shared.parser as parser
import mq3.vm.syscall_common as common

const QTIME_SIZE=36

/// RealTimeValue record for vm.cgame_misc_traps, containing `epoch`, `data`.
struct RealTimeValue epoch data end struct
/// EntityTokens record for vm.cgame_misc_traps, containing `source`, `parser`.
struct EntityTokens source parser end struct
/// TokenResult record for vm.cgame_misc_traps, containing `found`, `text`.
struct TokenResult found text end struct

/// Create the vm.cgame_misc_traps error for `fail` with 7484 and the supplied diagnostic text.
/// @param message Message used in `("cgame misc traps: " + message)` and `error(7484, ("cgame misc traps: " + message))`.
function fail(message) return error(7484,"cgame misc traps: "+message) end function

// qtime_t is nine consecutive native-QVM ints. Its month and year retain the
// C library conventions used by Com_RealTime (January=0, year since 1900).
/// @param value Record exposing `date`, `time`.
/// @param isDst Is dst operand used by `encodeQtime`; its reads are shown in the implementation.
function encodeQtime(value,isDst)
  if value==void or not time.datetime.isValid(value) then return fail("invalid local date/time") end if
  yearStart=time.Date(value.date.year,1,1)
  dayOfYear=time.date.toOrdinal(value.date)-time.date.toOrdinal(yearStart)
  dayOfWeek=time.date.dayOfWeek(value.date)%7
  fields=[value.time.second,value.time.minute,value.time.hour,value.date.day,value.date.month-1,value.date.year-1900,dayOfWeek,dayOfYear,isDst]
  output=bytes(QTIME_SIZE,0)
  for index=0 to len(fields)-1 n.writeU32(output,index*4,n.i32(fields[index])) end for
  return output
end function

// The standard library exposes portable UTC/local wall clocks but not the
// platform DST flag. -1 is the C tm value for "unknown" and preserves the ABI
// without claiming a wrong daylight-saving state.
function sampleRealTime()
  utc=time.datetime.nowUtc();local=time.datetime.nowLocal()
  if utc==void or local==void then return fail("wall clock unavailable") end if
  milliseconds=time.datetime.toUnixMillis(utc);if milliseconds==void then return fail("UTC conversion failed") end if
  encoded=encodeQtime(local,-1);if encoded is error then return encoded end if
  return RealTimeValue(time._idiv(milliseconds,1000),encoded)
end function

/// Compute real time in vm.cgame_misc_traps; the normal completion returns `value.epoch`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.writeRaw`.
/// @param address Value passed as `value` to `mq3.vm.syscall_common.writeRaw`.
/// @param value Record exposing `data`, `epoch`.
function realTime(vm,address,value)
  if value==void or value is error or typeof(value.data)!="bytes" or len(value.data)!=QTIME_SIZE then return fail("invalid real-time sample") end if
  if address!=0 then
    written=common.writeRaw(vm,address,value.data,QTIME_SIZE,"qtime_t output");if written is error then return written end if
  end if
  return value.epoch
end function

/// Compute snap vector in vm.cgame_misc_traps; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.readFloatVector`.
/// @param address Address passed as `address` to `mq3.vm.syscall_common.readFloatVector`.
function snapVector(vm,address)
  values=common.readFloatVector(vm,address,3,"snap vector");if values is error then return values end if
  qmath.SnapVector(values)
  written=common.writeFloatVector(vm,address,values,"snap vector");if written is error then return written end if
  return 0
end function

/// Create entity tokens in vm.cgame_misc_traps; the normal completion returns `EntityTokens(retained, parser.create(retained))`.
/// @param source Source used in `len(source)` and `bytes(source)`.
function createEntityTokens(source)
  if typeof(source)=="string" then source=bytes(source) end if
  if typeof(source)!="bytes" then return fail("entity string must be bytes") end if
  retained=slice(source,0,len(source));return EntityTokens(retained,parser.create(retained))
end function

/// Reset entity tokens in vm.cgame_misc_traps; updates `state.parser`.
///
/// Direct state writes: `state.parser`.
/// @param state Record exposing `source`. Updated in place: `parser`.
function resetEntityTokens(state)
  if state==void or typeof(state.source)!="bytes" then return fail("invalid entity-token state") end if
  state.parser=parser.create(state.source);return void
end function

/// Compute next entity token in vm.cgame_misc_traps; the normal completion returns `TokenResult(true, token)`.
/// @param state Record exposing `parser`.
function nextEntityToken(state)
  if state==void or state.parser==void then return fail("invalid entity-token state") end if
  token=parser.parseExt(state.parser,true);if token is error then return token end if
  if token=="" or state.parser.offset<0 then
    reset=resetEntityTokens(state);if reset is error then return reset end if
    return TokenResult(false,"")
  end if
  return TokenResult(true,token)
end function

/// Compute entity token in vm.cgame_misc_traps; the normal completion returns `0`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.pointer`.
/// @param address Value passed as `value` to `mq3.vm.syscall_common.pointer`.
/// @param capacity Size passed as `size` to `mq3.vm.syscall_common.pointer`.
/// @param state State passed as `state` to `mq3.vm.cgame_misc_traps.nextEntityToken`.
function entityToken(vm,address,capacity,state)
  if capacity<1 then return fail("entity-token capacity must be positive") end if
  at=common.pointer(vm,address,capacity,"entity token output");if at is error then return at end if
  result=nextEntityToken(state);if result is error then return result end if
  written=common.writeBuffer(vm,address,capacity,result.text,"entity token output");if written is error then return written end if
  if result.found then return 1 end if;return 0
end function
