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

function BigShort(value) return shared.bigShort(value) end function
function LittleShort(value) return shared.littleShort(value) end function
function BigLong(value) return shared.bigLong(value) end function
function LittleLong(value) return shared.littleLong(value) end function
function BigFloat(value) return shared.bigFloat(value) end function
function LittleFloat(value) return shared.littleFloat(value) end function

function CrossProduct(a,b) return q.CrossProduct(a,b) end function
function Distance(a,b) return q.Distance(a,b) end function
function DistanceSquared(a,b) return q.DistanceSquared(a,b) end function
function Q_fabs(value) return q.Q_fabs(value) end function
function Q_rsqrt(value) return q.Q_rsqrt(value) end function
function VectorCompare(a,b) return q.VectorCompare(a,b) end function
function VectorInverse(value) return q.VectorInverse(value) end function
function VectorLength(value) return q.VectorLength(value) end function
function VectorLengthSquared(value) return q.VectorLengthSquared(value) end function
function VectorNormalizeFast(value) return q.VectorNormalizeFast(value) end function

// The three names below are PowerPC compiler intrinsics in the original header.
// Keeping managed equivalents makes the header surface complete while the Win32
// target naturally uses the Big/Little helpers above.
function __lwbrx(data,offset)
  if offset<0 or offset+4>len(data) then return error(7880,"__lwbrx outside buffer") end if
  return n.u32((data[offset]<<24)|(data[offset+1]<<16)|(data[offset+2]<<8)|data[offset+3])
end function
function __lhbrx(data,offset)
  if offset<0 or offset+2>len(data) then return error(7881,"__lhbrx outside buffer") end if
  return ((data[offset]<<8)|data[offset+1])&0xffff
end function
function __fctiw(value)
  if n.isNaNBits(n.floatBits(value)) or value>=2147483648.0 or value< -2147483648.0 then return -2147483648 end if
  integer=n.trunc32(value);fraction=n.fsub(value,n.f32(integer))
  if fraction>0.5 or (fraction==0.5 and (integer&1)!=0) then integer=integer+1 end if
  if fraction< -0.5 or (fraction== -0.5 and (integer&1)!=0) then integer=integer-1 end if
  return integer
end function
function ppcLwbrx(data,offset) return __lwbrx(data,offset) end function
function ppcLhbrx(data,offset) return __lhbrx(data,offset) end function
function ppcFctiw(value) return __fctiw(value) end function
