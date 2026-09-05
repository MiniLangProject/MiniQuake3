// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// MiniLang adaptation of code/game/q_math.c, see original COPYING.txt.
package mq3.shared.math
import mq3.compat.numeric as n

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
