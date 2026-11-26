// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Managed ownership facade for code/game/q_shared.h inline and platform helpers.
package mq3.shared.q_shared_header

import mq3.compat.numeric as n
import mq3.shared.math as q
import mq3.shared.q_shared_runtime as shared

const qfalse=0
const qtrue=1
const MAX_STRING_CHARS=1024
const MAX_TOKEN_CHARS=1024
const MAX_INFO_STRING=1024
const BIG_INFO_STRING=8192
const MAX_QPATH=64
const MAX_NAME_LENGTH=32
const MAX_SAY_TEXT=150
const MAX_CLIENTS=64
const MAX_GENTITIES=1024
const ENTITYNUM_NONE=1023
const ENTITYNUM_WORLD=1022
const ENTITYNUM_MAX_NORMAL=1022
const GENTITYNUM_BITS=10
const MAX_MODELS=256
const MAX_SOUNDS=256
const MAX_CONFIGSTRINGS=1024
const MAX_GAMESTATE_CHARS=16000
const PATH_SEP=92

/// Return `mq3.shared.q_shared_runtime.bigShort(value)` from `shared.q_shared_header.BigShort`.
/// @param value Value passed as `value` to `mq3.shared.q_shared_runtime.bigShort`.
function BigShort(value) return shared.bigShort(value) end function
/// Return `mq3.shared.q_shared_runtime.littleShort(value)` from `shared.q_shared_header.LittleShort`.
/// @param value Value passed as `value` to `mq3.shared.q_shared_runtime.littleShort`.
function LittleShort(value) return shared.littleShort(value) end function
/// Return `mq3.shared.q_shared_runtime.bigLong(value)` from `shared.q_shared_header.BigLong`.
/// @param value Value passed as `value` to `mq3.shared.q_shared_runtime.bigLong`.
function BigLong(value) return shared.bigLong(value) end function
/// Return `mq3.shared.q_shared_runtime.littleLong(value)` from `shared.q_shared_header.LittleLong`.
/// @param value Value passed as `value` to `mq3.shared.q_shared_runtime.littleLong`.
function LittleLong(value) return shared.littleLong(value) end function
/// Return `mq3.shared.q_shared_runtime.bigFloat(value)` from `shared.q_shared_header.BigFloat`.
/// @param value Value passed as `value` to `mq3.shared.q_shared_runtime.bigFloat`.
function BigFloat(value) return shared.bigFloat(value) end function
/// Return `mq3.shared.q_shared_runtime.littleFloat(value)` from `shared.q_shared_header.LittleFloat`.
/// @param value Value passed as `value` to `mq3.shared.q_shared_runtime.littleFloat`.
function LittleFloat(value) return shared.littleFloat(value) end function

/// Return `mq3.shared.math.CrossProduct(a, b)` from `shared.q_shared_header.CrossProduct`.
/// @param a A passed as `a` to `mq3.shared.math.CrossProduct`.
/// @param b B passed as `b` to `mq3.shared.math.CrossProduct`.
function CrossProduct(a,b) return q.CrossProduct(a,b) end function
/// Return `mq3.shared.math.Distance(a, b)` from `shared.q_shared_header.Distance`.
/// @param a A passed as `a` to `mq3.shared.math.Distance`.
/// @param b B passed as `b` to `mq3.shared.math.Distance`.
function Distance(a,b) return q.Distance(a,b) end function
/// Return `mq3.shared.math.DistanceSquared(a, b)` from `shared.q_shared_header.DistanceSquared`.
/// @param a A passed as `a` to `mq3.shared.math.DistanceSquared`.
/// @param b B passed as `b` to `mq3.shared.math.DistanceSquared`.
function DistanceSquared(a,b) return q.DistanceSquared(a,b) end function
/// Return `mq3.shared.math.Q_fabs(value)` from `shared.q_shared_header.Q_fabs`.
/// @param value Value passed as `value` to `mq3.shared.math.Q_fabs`.
function Q_fabs(value) return q.Q_fabs(value) end function
/// Return `mq3.shared.math.Q_rsqrt(value)` from `shared.q_shared_header.Q_rsqrt`.
/// @param value Number passed as `number` to `mq3.shared.math.Q_rsqrt`.
function Q_rsqrt(value) return q.Q_rsqrt(value) end function
/// Return `mq3.shared.math.VectorCompare(a, b)` from `shared.q_shared_header.VectorCompare`.
/// @param a A passed as `a` to `mq3.shared.math.VectorCompare`.
/// @param b B passed as `b` to `mq3.shared.math.VectorCompare`.
function VectorCompare(a,b) return q.VectorCompare(a,b) end function
/// Return `mq3.shared.math.VectorInverse(value)` from `shared.q_shared_header.VectorInverse`.
/// @param value V passed as `v` to `mq3.shared.math.VectorInverse`.
function VectorInverse(value) return q.VectorInverse(value) end function
/// Return `mq3.shared.math.VectorLength(value)` from `shared.q_shared_header.VectorLength`.
/// @param value A passed as `a` to `mq3.shared.math.VectorLength`.
function VectorLength(value) return q.VectorLength(value) end function
/// Return `mq3.shared.math.VectorLengthSquared(value)` from `shared.q_shared_header.VectorLengthSquared`.
/// @param value A passed as `a` to `mq3.shared.math.VectorLengthSquared`.
function VectorLengthSquared(value) return q.VectorLengthSquared(value) end function
/// Return `mq3.shared.math.VectorNormalizeFast(value)` from `shared.q_shared_header.VectorNormalizeFast`.
/// @param value V passed as `v` to `mq3.shared.math.VectorNormalizeFast`.
function VectorNormalizeFast(value) return q.VectorNormalizeFast(value) end function

// The three names below are PowerPC compiler intrinsics in the original header.
// Keeping managed equivalents makes the header surface complete while the Win32
// target naturally uses the Big/Little helpers above.
/// @param data Data used in `len(data)` and `data[offset]`.
/// @param offset Zero-based index into `data`.
function __lwbrx(data,offset)
  if offset<0 or offset+4>len(data) then return error(7880,"__lwbrx outside buffer") end if
  return n.u32((data[offset]<<24)|(data[offset+1]<<16)|(data[offset+2]<<8)|data[offset+3])
end function
/// Compute lhbrx in shared.q_shared_header; the normal completion returns `(((data[offset] << 8) | data[(offset + 1)]) & 65535)`.
///
/// Validation failures include `__lhbrx outside buffer`.
/// @param data Data used in `len(data)` and `data[offset]`.
/// @param offset Zero-based index into `data`.
function __lhbrx(data,offset)
  if offset<0 or offset+2>len(data) then return error(7881,"__lhbrx outside buffer") end if
  return ((data[offset]<<8)|data[offset+1])&0xffff
end function
/// Compute fctiw in shared.q_shared_header; the normal completion returns `integer`.
/// @param value Floating-point value to narrow and reinterpret.
function __fctiw(value)
  if n.isNaNBits(n.floatBits(value)) or value>=2147483648.0 or value< -2147483648.0 then return -2147483648 end if
  integer=n.trunc32(value);fraction=n.fsub(value,n.f32(integer))
  if fraction>0.5 or (fraction==0.5 and (integer&1)!=0) then integer=integer+1 end if
  if fraction< -0.5 or (fraction== -0.5 and (integer&1)!=0) then integer=integer-1 end if
  return integer
end function
/// Return `mq3.shared.q_shared_header.__lwbrx(data, offset)` from `shared.q_shared_header.ppcLwbrx`.
/// @param data Data passed as `data` to `mq3.shared.q_shared_header.__lwbrx`.
/// @param offset Offset passed as `offset` to `mq3.shared.q_shared_header.__lwbrx`.
function ppcLwbrx(data,offset) return __lwbrx(data,offset) end function
/// Return `mq3.shared.q_shared_header.__lhbrx(data, offset)` from `shared.q_shared_header.ppcLhbrx`.
/// @param data Data passed as `data` to `mq3.shared.q_shared_header.__lhbrx`.
/// @param offset Offset passed as `offset` to `mq3.shared.q_shared_header.__lhbrx`.
function ppcLhbrx(data,offset) return __lhbrx(data,offset) end function
/// Return `mq3.shared.q_shared_header.__fctiw(value)` from `shared.q_shared_header.ppcFctiw`.
/// @param value Value passed as `value` to `mq3.shared.q_shared_header.__fctiw`.
function ppcFctiw(value) return __fctiw(value) end function
