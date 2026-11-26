// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Deterministic four-dimensional renderer noise from renderer/tr_noise.c.
package mq3.renderer.noise
import mq3.compat.numeric as n

const NOISE_SIZE=256
const NOISE_MASK=255

/// Data record for `mq3.renderer.noise.Noise`; groups `table`, `permutation`.
struct Noise table permutation end struct

// Baseq3's Windows build obtains rand() from the Microsoft C runtime.  Keep
// that 15-bit sequence here so normal deformations do not depend on the host.
/// @param state Argument 1 supplied to `mq3.compat.numeric.mul32`.
function msvcRand(state)
  state=n.add32(n.mul32(state,214013),2531011)
  return [state,(n.shr32(state,16)&32767)]
end function

/// Builds `mq3.renderer.noise.Noise` for `mq3.renderer.noise.create`.
function create()
  table=[];permutation=[];state=1001
  for index=0 to NOISE_SIZE-1
    sample=msvcRand(state);state=sample[0];unit=n.fdiv(n.f32(sample[1]),32767.0);table=table+[n.fsub(n.fmul(unit,2.0),1.0)]
    sample=msvcRand(state);state=sample[0];scaled=n.fmul(n.fdiv(n.f32(sample[1]),32767.0),255.0);permutation=permutation+[n.trunc32(scaled)]
  end for
  return Noise(table,permutation)
end function

/// Computes `noise.permutation[value&NOISE_MASK]` for `mq3.renderer.noise.perm`.
/// @param noise Record providing `noise.permutation`.
/// @param value Input used in the result expression `noise.permutation[value&NOISE_MASK]`.
function perm(noise,value) return noise.permutation[value&NOISE_MASK] end function
/// Returns `noise.table[index]` from `mq3.renderer.noise.valueAt`.
/// @param noise Record providing `noise.table`.
/// @param x Input used by `index=perm(noise,x+perm(noise,y+perm(noise,z+perm(noise,t))))`.
/// @param y Input used by `index=perm(noise,x+perm(noise,y+perm(noise,z+perm(noise,t))))`.
/// @param z Input used by `index=perm(noise,x+perm(noise,y+perm(noise,z+perm(noise,t))))`.
/// @param t Value forwarded as `value` to `mq3.renderer.noise.perm`.
function valueAt(noise,x,y,z,t)
  index=perm(noise,x+perm(noise,y+perm(noise,z+perm(noise,t))))
  return noise.table[index]
end function
/// Calls `mq3.compat.numeric.fadd` with `(n.fmul(a,n.fsub(1.0,weight)),n.fmul(b,weight))` and returns its result.
/// @param a Argument 1 supplied to `mq3.compat.numeric.fmul`.
/// @param b Argument 1 supplied to `mq3.compat.numeric.fmul`.
/// @param weight Argument 2 supplied to `mq3.compat.numeric.fsub`.
function lerp(a,b,weight) return n.fadd(n.fmul(a,n.fsub(1.0,weight)),n.fmul(b,weight)) end function
/// Returns `integer` from `mq3.renderer.noise.floorNumber`; earlier branches return `integer-1`.
/// @param value Argument 1 supplied to `mq3.compat.numeric.trunc32`.
function floorNumber(value) integer=n.trunc32(value);if value<integer then return integer-1 end if;return integer end function

/// Computes `noiseSlice` from `lerp(front,back,fz)` using `mq3.renderer.noise.lerp`, `mq3.renderer.noise.valueAt`.
/// @param noise Value forwarded as `noise` to `mq3.renderer.noise.valueAt`.
/// @param ix Value forwarded as `x` to `mq3.renderer.noise.valueAt`.
/// @param iy Value forwarded as `y` to `mq3.renderer.noise.valueAt`.
/// @param iz Value forwarded as `z` to `mq3.renderer.noise.valueAt`.
/// @param it Value forwarded as `t` to `mq3.renderer.noise.valueAt`.
/// @param fx Value forwarded as `weight` to `mq3.renderer.noise.lerp`.
/// @param fy Value forwarded as `weight` to `mq3.renderer.noise.lerp`.
/// @param fz Value forwarded as `weight` to `mq3.renderer.noise.lerp`.
function noiseSlice(noise,ix,iy,iz,it,fx,fy,fz)
  front=lerp(lerp(valueAt(noise,ix,iy,iz,it),valueAt(noise,ix+1,iy,iz,it),fx),lerp(valueAt(noise,ix,iy+1,iz,it),valueAt(noise,ix+1,iy+1,iz,it),fx),fy)
  back=lerp(lerp(valueAt(noise,ix,iy,iz+1,it),valueAt(noise,ix+1,iy,iz+1,it),fx),lerp(valueAt(noise,ix,iy+1,iz+1,it),valueAt(noise,ix+1,iy+1,iz+1,it),fx),fy)
  return lerp(front,back,fz)
end function
/// Computes `get4f` from `lerp(noiseSlice(noise,ix,iy,iz,it,fx,fy,fz),noiseSlice(noise,ix,iy,iz,it+1,fx,fy,fz),ft)` using `mq3.renderer.noise.floorNumber`, `mq3.compat.numeric.fsub`, `mq3.renderer.noise.lerp`.
/// @param noise Value forwarded as `noise` to `mq3.renderer.noise.noiseSlice`.
/// @param x Value forwarded as `value` to `mq3.renderer.noise.floorNumber`.
/// @param y Value forwarded as `value` to `mq3.renderer.noise.floorNumber`.
/// @param z Value forwarded as `value` to `mq3.renderer.noise.floorNumber`.
/// @param t Value forwarded as `value` to `mq3.renderer.noise.floorNumber`.
function get4f(noise,x,y,z,t)
  ix=floorNumber(x);fx=n.fsub(x,ix);iy=floorNumber(y);fy=n.fsub(y,iy);iz=floorNumber(z);fz=n.fsub(z,iz);it=floorNumber(t);ft=n.fsub(t,it)
  return lerp(noiseSlice(noise,ix,iy,iz,it,fx,fy,fz),noiseSlice(noise,ix,iy,iz,it+1,fx,fy,fz),ft)
end function
