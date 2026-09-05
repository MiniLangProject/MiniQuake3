// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// MiniLang adaptation of code/game/q_math.c, see original COPYING.txt.
package mq3.shared.math
import mq3.compat.numeric as n
import mq3.compat.transcendental as crt

function AngleVectors(angles)
  // q_shared.h defines M_PI with an f suffix, so the factor is binary32.
  factor = n.fdiv(n.fmul(n.f32(3.14159265358979323846),2.0),360.0)
  angle = n.fmul(angles[1],factor)
  sy = n.f32(crt.sin(angle)); cy = n.f32(crt.cos(angle))
  angle = n.fmul(angles[0],factor)
  sp = n.f32(crt.sin(angle)); cp = n.f32(crt.cos(angle))
  angle = n.fmul(angles[2],factor)
  sr = n.f32(crt.sin(angle)); cr = n.f32(crt.cos(angle))
  forward = [n.fmul(cp,cy),n.fmul(cp,sy),n.fneg(sp)]
  right = [n.fadd(n.fmul(n.fmul(n.fmul(-1,sr),sp),cy),n.fmul(n.fmul(-1,cr),n.fneg(sy))),n.fadd(n.fmul(n.fmul(n.fmul(-1,sr),sp),sy),n.fmul(n.fmul(-1,cr),cy)),n.fmul(n.fmul(-1,sr),cp)]
  up = [n.fadd(n.fmul(n.fmul(cr,sp),cy),n.fmul(n.fneg(sr),n.fneg(sy))),n.fadd(n.fmul(n.fmul(cr,sp),sy),n.fmul(n.fneg(sr),cy)),n.fmul(cr,cp)]
  return [forward,right,up]
end function

function atanDegrees(y,x)
  angle = crt.atan2(y,x)
  // Frozen MiniLang arithmetic canonicalizes -0 when multiplying by an int.
  if angle == 0 then return angle end if
  return n.f32(angle*180/n.f32(3.14159265358979323846))
end function
function vectoangles(vector)
  yaw = 0.0; pitch = 0.0
  if vector[1] == 0 and vector[0] == 0 then
    if vector[2] > 0 then pitch = 90.0 else pitch = 270.0 end if
  else
    if vector[0] != 0 then yaw = atanDegrees(vector[1],vector[0])
    else if vector[1] > 0 then yaw = 90.0 else yaw = 270.0 end if
    if yaw < 0 then yaw = n.fadd(yaw,360.0) end if
    forward = n.fsqrt(n.fadd(n.fmul(vector[0],vector[0]),n.fmul(vector[1],vector[1])))
    pitch = atanDegrees(vector[2],forward)
    if pitch < 0 then pitch = n.fadd(pitch,360.0) end if
  end if
  return [n.fneg(pitch),yaw,0.0]
end function

function AngleNormalize360(angle)
  // The cast sees a double product, not a binary32 intermediate. Recover
  // truncation from the nearby binary32 integer without another float store.
  scaled = n.f32(angle)*(65536/360.0)
  integer = n.trunc32(scaled)
  if scaled >= -2147483648.0 and scaled < 2147483648.0 then
    if scaled >= 0 then
      while integer > scaled
        integer = integer-1
      end while
      while integer+1 <= scaled
        integer = integer+1
      end while
    else
      while integer < scaled
        integer = integer+1
      end while
      while integer-1 >= scaled
        integer = integer-1
      end while
    end if
  end if
  return n.f32((360.0/65536)*(integer & 65535))
end function
function AngleNormalize180(angle)
  angle = AngleNormalize360(angle)
  if angle > 180.0 then angle = n.f32(angle-360.0) end if
  return angle
end function

function SnapVector(v)
  // Win32 Sys_SnapVector uses x87 FISTP with round-to-nearest, ties-to-even.
  for axis = 0 to 2
    value = v[axis]
    if n.isNaNBits(n.floatBits(value)) or value >= 2147483648.0 or value < -2147483648.0 then
      v[axis] = n.f32(-2147483648)
      continue
    end if
    integer = n.trunc32(value)
    remainder = value-integer
    if remainder > 0.5 or (remainder == 0.5 and (integer & 1) != 0) then integer = integer+1 end if
    if remainder < -0.5 or (remainder == -0.5 and (integer & 1) != 0) then integer = integer-1 end if
    if integer < -2147483648 or integer > 2147483647 then integer = -2147483648 end if
    v[axis] = n.f32(integer)
  end for
  return void
end function

struct RandomState
  seed
end struct

function Q_rand(state)
  state.seed = n.add32(n.mul32(69069, state.seed), 1)
  return state.seed
end function

function Q_random(state)
  return n.fdiv(Q_rand(state) & 65535, 65536.0)
end function

function Q_crandom(state)
  return n.fmul(2.0, n.fsub(Q_random(state), 0.5))
end function

function Q_rsqrt(number)
  x2 = n.fmul(number, 0.5)
  y = n.f32(number)
  i = 0x5f3759df - (n.i32(n.floatBits(y)) >> 1)
  y = n.bitsFloat(i)
  return n.fmul(y, n.fsub(1.5, n.fmul(n.fmul(x2, y), y)))
end function

function Q_fabs(value)
  return n.bitsFloat(n.floatBits(value) & 0x7fffffff)
end function

function DotProduct(a, b)
  return n.fadd(n.fadd(n.fmul(a[0], b[0]), n.fmul(a[1], b[1])), n.fmul(a[2], b[2]))
end function

function CrossProduct(a, b)
  return [n.fsub(n.fmul(a[1], b[2]), n.fmul(a[2], b[1])), n.fsub(n.fmul(a[2], b[0]), n.fmul(a[0], b[2])), n.fsub(n.fmul(a[0], b[1]), n.fmul(a[1], b[0]))]
end function

function VectorMA(a, scale, b)
  return [n.fadd(a[0], n.fmul(scale, b[0])), n.fadd(a[1], n.fmul(scale, b[1])), n.fadd(a[2], n.fmul(scale, b[2]))]
end function

function VectorScale(a, scale)
  return [n.fmul(a[0],scale),n.fmul(a[1],scale),n.fmul(a[2],scale)]
end function

function VectorLength(a)
  return n.fsqrt(DotProduct(a,a))
end function

function VectorNormalize(a)
  length = VectorLength(a)
  if length != 0 then
    inverse = n.fdiv(1.0,length)
    for axis = 0 to 2
      a[axis] = n.fmul(a[axis],inverse)
    end for
  end if
  return length
end function

function VectorNormalize2(a)
  length = VectorLength(a)
  if length == 0 then return [0.0,0.0,0.0] end if
  return VectorScale(a,n.fdiv(1.0,length))
end function

function LerpAngle(startAngle, target, fraction)
  startAngle = n.f32(startAngle)
  target = n.f32(target)
  if n.fsub(target, startAngle) > 180.0 then target = n.fsub(target, 360.0) end if
  if n.fsub(target, startAngle) < -180.0 then target = n.fadd(target, 360.0) end if
  return n.fadd(startAngle, n.fmul(fraction, n.fsub(target, startAngle)))
end function
