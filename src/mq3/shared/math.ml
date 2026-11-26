// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// MiniLang adaptation of code/game/q_math.c, see original COPYING.txt.
package mq3.shared.math
import mq3.compat.numeric as n
import mq3.compat.transcendental as crt
import mq3.shared.bytedirs as bytedirs

/// Convert pitch/yaw/roll in degrees to forward, right, and up vectors with Quake-compatible binary32 rounding.
/// @param angles Three-element [pitch, yaw, roll] array in degrees.
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

/// Convert atan2(y, x) to degrees while preserving the original zero-sign handling.
/// @param y Y coordinate of the direction.
/// @param x X coordinate of the direction.
function atanDegrees(y,x)
  angle = crt.atan2(y,x)
  // Frozen MiniLang arithmetic canonicalizes -0 when multiplying by an int.
  if angle == 0 then return angle end if
  return n.f32(angle*180/n.f32(3.14159265358979323846))
end function
/// Convert a three-component direction to Quake pitch/yaw/roll angles in degrees.
/// @param vector Three-element X/Y/Z direction vector.
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

/// Wrap degrees through the original 16-bit angle quantization into the [0, 360) range.
/// @param angle Floating-point value to narrow to binary32.
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
/// Wrap degrees into the signed half-turn range after 16-bit angle normalization.
/// @param angle Angle passed as `angle` to `mq3.shared.math.AngleNormalize360`.
function AngleNormalize180(angle)
  angle = AngleNormalize360(angle)
  if angle > 180.0 then angle = n.f32(angle-360.0) end if
  return angle
end function

/// Round the three vector components with the original nearest-even integer behavior.
///
/// Direct state writes: `v elements`.
/// @param v Mutable sequence written at `axis`.
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

/// RandomState record for shared.math, containing `seed`.
struct RandomState
  seed
end struct

/// Advance the Quake linear-congruential seed and return the new signed 32-bit state.
///
/// Direct state writes: `state.seed`.
/// @param state Record exposing `seed`. Updated in place: `seed`.
function Q_rand(state)
  state.seed = n.add32(n.mul32(69069, state.seed), 1)
  return state.seed
end function

/// Advance the random seed and scale its low bits into the original [0, 1) random range.
/// @param state State passed as `state` to `mq3.shared.math.Q_rand`.
function Q_random(state)
  return n.fdiv(Q_rand(state) & 65535, 65536.0)
end function

/// Advance the random seed and map the generated fraction to the centered random range.
/// @param state State passed as `state` to `mq3.shared.math.Q_random`.
function Q_crandom(state)
  return n.fmul(2.0, n.fsub(Q_random(state), 0.5))
end function

/// Approximate the reciprocal square root using the original bit estimate and Newton refinement.
/// @param number Left floating-point operand.
function Q_rsqrt(number)
  x2 = n.fmul(number, 0.5)
  y = n.f32(number)
  i = 0x5f3759df - (n.i32(n.floatBits(y)) >> 1)
  y = n.bitsFloat(i)
  return n.fmul(y, n.fsub(1.5, n.fmul(n.fmul(x2, y), y)))
end function

/// Return `mq3.compat.numeric.bitsFloat((n.floatBits(value) & 2147483647))` from `shared.math.Q_fabs`.
/// @param value Floating-point value to narrow and reinterpret.
function Q_fabs(value)
  return n.bitsFloat(n.floatBits(value) & 0x7fffffff)
end function

/// Compute a three-component dot product with the numeric compatibility layer.
/// @param a Left three-element vector.
/// @param b Right three-element vector.
/// @returns The dot product with the compatibility layer's binary32 rounding.
function DotProduct(a as array, b as array) returns float
  return n.dot3(a[0],a[1],a[2],b[0],b[1],b[2])
end function

/// Compute shared.math.CrossProduct as `[n.fsub(n.fmul(a[1], b[2]), n.fmul(a[2], b[1])), n.fsub(n.fmul(a[2], b[0]), n.fmul(a[0], b[2])), n.fsub(n.fmul(a[0], b[1]), n.fmul(a[1], b[0]))]`.
/// @param a A used in `a[1]` and `a[2]`.
/// @param b B used in `b[2]` and `b[1]`.
function CrossProduct(a, b)
  return [n.fsub(n.fmul(a[1], b[2]), n.fmul(a[2], b[1])), n.fsub(n.fmul(a[2], b[0]), n.fmul(a[0], b[2])), n.fsub(n.fmul(a[0], b[1]), n.fmul(a[1], b[0]))]
end function

/// Compute shared.math.VectorMA as `[n.fadd(a[0], n.fmul(scale, b[0])), n.fadd(a[1], n.fmul(scale, b[1])), n.fadd(a[2], n.fmul(scale, b[2]))]`.
/// @param a A used in `a[0]` and `a[1]`.
/// @param scale Left floating-point operand.
/// @param b B used in `b[0]` and `b[1]`.
function VectorMA(a, scale, b)
  return [n.fadd(a[0], n.fmul(scale, b[0])), n.fadd(a[1], n.fmul(scale, b[1])), n.fadd(a[2], n.fmul(scale, b[2]))]
end function

/// Compute shared.math.VectorScale as `[n.fmul(a[0], scale), n.fmul(a[1], scale), n.fmul(a[2], scale)]`.
/// @param a A used in `a[0]` and `a[1]`.
/// @param scale Right floating-point operand.
function VectorScale(a, scale)
  return [n.fmul(a[0],scale),n.fmul(a[1],scale),n.fmul(a[2],scale)]
end function

/// Return `mq3.compat.numeric.fsqrt(DotProduct(a, a))` from `shared.math.VectorLength`.
/// @param a Left three-element vector.
function VectorLength(a)
  return n.fsqrt(DotProduct(a,a))
end function

/// Normalize a three-component vector in place and return its original length.
///
/// Direct state writes: `a elements`.
/// @param a Mutable sequence written at `axis`.
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

/// Return a normalized vector copy while preserving the input vector.
/// @param a A passed as `a` to `mq3.shared.math.VectorLength`.
function VectorNormalize2(a)
  length = VectorLength(a)
  if length == 0 then return [0.0,0.0,0.0] end if
  return VectorScale(a,n.fdiv(1.0,length))
end function

/// Interpolate between angles along the shorter wraparound direction.
/// @param startAngle Floating-point value to narrow to binary32.
/// @param target Floating-point value to narrow to binary32.
/// @param fraction Left floating-point operand.
function LerpAngle(startAngle, target, fraction)
  startAngle = n.f32(startAngle)
  target = n.f32(target)
  if n.fsub(target, startAngle) > 180.0 then target = n.fsub(target, 360.0) end if
  if n.fsub(target, startAngle) < -180.0 then target = n.fadd(target, 360.0) end if
  return n.fadd(startAngle, n.fmul(fraction, n.fsub(target, startAngle)))
end function

// Remaining code/game/q_math.c runtime surface. Arrays own the output that the
// C API writes through pointer arguments; mutating variants retain C behavior.
struct Plane normal dist type signbits end struct

/// Compute shared.math.VectorCompare as `(((a[0] == b[0]) and (a[1] == b[1])) and (a[2] == b[2]))`.
/// @param a A used in `a[0]` and `a[1]`.
/// @param b B used in `b[0]` and `b[1]`.
function VectorCompare(a,b) return a[0]==b[0] and a[1]==b[1] and a[2]==b[2] end function
/// Return `mq3.shared.math.DotProduct(a, a)` from `shared.math.VectorLengthSquared`.
/// @param a Left three-element vector.
function VectorLengthSquared(a) return DotProduct(a,a) end function
/// Compute distance squared in shared.math; the normal completion returns `DotProduct(d, d)`.
/// @param a A used in `a[0]` and `a[1]`.
/// @param b B used in `b[0]` and `b[1]`.
function DistanceSquared(a,b) d=[n.fsub(b[0],a[0]),n.fsub(b[1],a[1]),n.fsub(b[2],a[2])];return DotProduct(d,d) end function
/// Return `mq3.compat.numeric.fsqrt(DistanceSquared(a, b))` from `shared.math.Distance`.
/// @param a A passed as `a` to `mq3.shared.math.DistanceSquared`.
/// @param b B passed as `b` to `mq3.shared.math.DistanceSquared`.
function Distance(a,b) return n.fsqrt(DistanceSquared(a,b)) end function
/// Update `v entries` in shared.math.
///
/// Direct state writes: `v elements`.
/// @param v Mutable sequence written at `i`.
function VectorNormalizeFast(v) scale=Q_rsqrt(DotProduct(v,v));for i=0 to 2 v[i]=n.fmul(v[i],scale) end for;return void end function
/// Update `v entries` in shared.math.
///
/// Direct state writes: `v elements`.
/// @param v Mutable sequence written at `i`.
function VectorInverse(v) for i=0 to 2 v[i]=n.fneg(v[i]) end for;return void end function
/// Clamp char in shared.math; the normal completion returns `value`.
/// @param value Value used in `(value > 127)` and `(value < - 128)`.
function ClampChar(value) if value<(-128) then return -128 end if;if value>127 then return 127 end if;return value end function
/// Clamp short in shared.math; the normal completion returns `value`.
/// @param value Value used in `(value > 32767)` and `(value < - 32768)`.
function ClampShort(value) if value<(-32768) then return -32768 end if;if value>32767 then return 32767 end if;return value end function
/// Select the closest normal from the fixed Quake direction table by maximum dot product.
/// @param direction Left three-element vector.
function DirToByte(direction)
  if direction==void then return 0 end if;values=bytedirs.values();best=0;bestDot=0.0
  for i=0 to len(values)-1 value=DotProduct(direction,values[i]);if value>bestDot then bestDot=value;best=i end if end for
  return best
end function
/// Compute byte to dir in shared.math; the normal completion returns `[values[index][0], values[index][1], values[index][2]]`.
/// @param index Zero-based index into `values`.
function ByteToDir(index) values=bytedirs.values();if index<0 or index>=len(values) then return [0.0,0.0,0.0] end if;return [values[index][0],values[index][1],values[index][2]] end function
/// Compute shared.math.colorByte as `(n.trunc32(n.fmul(value, 255.0)) & 255)`.
/// @param value Left floating-point operand.
function colorByte(value) return n.trunc32(n.fmul(value,255.0))&255 end function
/// Compute shared.math.ColorBytes3 as `((colorByte(r) | (colorByte(g) << 8)) | (colorByte(b) << 16))`.
/// @param r Value passed as `value` to `mq3.shared.math.colorByte`.
/// @param g Value passed as `value` to `mq3.shared.math.colorByte`.
/// @param b Value passed as `value` to `mq3.shared.math.colorByte`.
function ColorBytes3(r,g,b) return colorByte(r)|(colorByte(g)<<8)|(colorByte(b)<<16) end function
/// Return `mq3.compat.numeric.i32((((colorByte(r) | (colorByte(g) << 8)) | (colorByte(b) << 16)) | (colorByte(a) << 24)))` from `shared.math.ColorBytes4`.
/// @param r Value passed as `value` to `mq3.shared.math.colorByte`.
/// @param g Value passed as `value` to `mq3.shared.math.colorByte`.
/// @param b Value passed as `value` to `mq3.shared.math.colorByte`.
/// @param a Value passed as `value` to `mq3.shared.math.colorByte`.
function ColorBytes4(r,g,b,a) return n.i32(colorByte(r)|(colorByte(g)<<8)|(colorByte(b)<<16)|(colorByte(a)<<24)) end function
/// Scale an RGB vector by its largest component and return [original maximum, normalized color].
/// @param input Input used in `input[0]` and `input[1]`.
function NormalizeColor(input)
  maximum=input[0];if input[1]>maximum then maximum=input[1] end if;if input[2]>maximum then maximum=input[2] end if
  if maximum==0 then return [maximum,[0.0,0.0,0.0]] end if
  return [maximum,[n.fdiv(input[0],maximum),n.fdiv(input[1],maximum),n.fdiv(input[2],maximum)]]
end function
/// Construct the normalized plane through three points, handling degenerate triangles.
/// @param a Left three-element vector.
/// @param b B used in `b[0]` and `b[1]`.
/// @param c C used in `c[0]` and `c[1]`.
function PlaneFromPoints(a,b,c)
  d1=[n.fsub(b[0],a[0]),n.fsub(b[1],a[1]),n.fsub(b[2],a[2])];d2=[n.fsub(c[0],a[0]),n.fsub(c[1],a[1]),n.fsub(c[2],a[2])]
  normal=CrossProduct(d2,d1);if VectorNormalize(normal)==0 then return void end if
  return [normal[0],normal[1],normal[2],DotProduct(a,normal)]
end function
/// Compute matrix multiply in shared.math; the normal completion returns `result`.
/// @param left Left used in `left[i]` and `left[i][0]`.
/// @param right Right used in `right[0]` and `right[1]`.
function MatrixMultiply(left,right)
  result=array(3,void);for i=0 to 2 row=array(3,0.0);for j=0 to 2 row[j]=n.fadd(n.fadd(n.fmul(left[i][0],right[0][j]),n.fmul(left[i][1],right[1][j])),n.fmul(left[i][2],right[2][j])) end for;result[i]=row end for;return result
end function
/// Project a point onto the plane through the origin using the original Quake projection formula.
/// @param point Three-element point in the same coordinate space as the plane.
/// @param normal Unit plane normal; the plane passes through the origin.
function ProjectPointOnPlane(point,normal)
  inverse=n.fdiv(1.0,DotProduct(normal,normal));distance=n.fmul(DotProduct(normal,point),inverse)
  return [n.fsub(point[0],n.fmul(distance,n.fmul(normal[0],inverse))),n.fsub(point[1],n.fmul(distance,n.fmul(normal[1],inverse))),n.fsub(point[2],n.fmul(distance,n.fmul(normal[2],inverse)))]
end function
/// Construct a normalized vector perpendicular to the supplied direction.
/// @param source Normalized nonzero three-element direction.
function PerpendicularVector(source)
  position=0;mine=Q_fabs(source[0]);if Q_fabs(source[1])<mine then position=1;mine=Q_fabs(source[1]) end if;if Q_fabs(source[2])<mine then position=2 end if
  temp=[0.0,0.0,0.0];temp[position]=1.0;projected=ProjectPointOnPlane(temp,source);VectorNormalize(projected);return projected
end function
/// Build perpendicular right/up directions around a forward vector.
/// @param forward Normalized three-element forward direction.
function MakeNormalVectors(forward)
  right=[forward[2],n.fneg(forward[0]),forward[1]];distance=DotProduct(right,forward);right=VectorMA(right,n.fneg(distance),forward);VectorNormalize(right);return [right,CrossProduct(right,forward)]
end function
/// Rotate a point around a direction by an angle in degrees.
/// @param direction Normalized nonzero three-element rotation-axis direction.
/// @param point Three-element point to rotate about the origin.
/// @param degrees Rotation angle in degrees.
function RotatePointAroundVector(direction,point,degrees)
  forward=[direction[0],direction[1],direction[2]];right=PerpendicularVector(direction);up=CrossProduct(right,forward)
  matrix=[[right[0],up[0],forward[0]],[right[1],up[1],forward[1]],[right[2],up[2],forward[2]]]
  inverse=[[matrix[0][0],matrix[1][0],matrix[2][0]],[matrix[0][1],matrix[1][1],matrix[2][1]],[matrix[0][2],matrix[1][2],matrix[2][2]]]
  radians=n.fmul(degrees,n.fdiv(n.f32(3.14159265358979323846),180.0));sine=n.f32(crt.sin(radians));cosine=n.f32(crt.cos(radians))
  zrot=[[cosine,sine,0.0],[n.fneg(sine),cosine,0.0],[0.0,0.0,1.0]];rotation=MatrixMultiply(MatrixMultiply(matrix,zrot),inverse)
  return [DotProduct(rotation[0],point),DotProduct(rotation[1],point),DotProduct(rotation[2],point)]
end function
/// Update `axis entries` in shared.math; the normal completion returns `axis`.
///
/// Direct state writes: `axis elements`.
/// @param axis Mutable sequence written at `1`, `2`.
/// @param yaw Rotation angle in degrees.
function RotateAroundDirection(axis,yaw) axis[1]=PerpendicularVector(axis[0]);if yaw!=0 then axis[1]=RotatePointAroundVector(axis[0],axis[1],yaw) end if;axis[2]=CrossProduct(axis[0],axis[1]);return axis end function
/// Compute angles to axis in shared.math; the normal completion returns `[vectors[0], [n.fneg(right[0]), n.fneg(right[1]), n.fneg(right[2])], vectors[2]]`.
/// @param angles Three-element [pitch, yaw, roll] array in degrees.
function AnglesToAxis(angles) vectors=AngleVectors(angles);right=vectors[1];return [vectors[0],[n.fneg(right[0]),n.fneg(right[1]),n.fneg(right[2])],vectors[2]] end function
/// Compute shared.math.AxisClear as `[[1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 1.0]]`.
function AxisClear() return [[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]] end function
/// Compute shared.math.AxisCopy as `[[axis[0][0], axis[0][1], axis[0][2]], [axis[1][0], axis[1][1], axis[1][2]], [axis[2][0], axis[2][1], axis[2][2]]]`.
/// @param axis Axis used in `axis[0]` and `axis[1]`.
function AxisCopy(axis) return [[axis[0][0],axis[0][1],axis[0][2]],[axis[1][0],axis[1][1],axis[1][2]],[axis[2][0],axis[2][1],axis[2][2]]] end function
/// Compute shared.math.VectorRotate as `[DotProduct(input, matrix[0]), DotProduct(input, matrix[1]), DotProduct(input, matrix[2])]`.
/// @param input Left three-element vector.
/// @param matrix Matrix used in `matrix[0]` and `matrix[1]`.
function VectorRotate(input,matrix) return [DotProduct(input,matrix[0]),DotProduct(input,matrix[1]),DotProduct(input,matrix[2])] end function
/// Compute angle subtract in shared.math; the normal completion returns `value`.
/// @param first Left floating-point operand.
/// @param second Right floating-point operand.
function AngleSubtract(first,second) value=n.fsub(first,second);while value>180.0 value=n.fsub(value,360.0) end while;while value<(-180.0) value=n.fadd(value,360.0) end while;return value end function
/// Compute shared.math.AnglesSubtract as `[AngleSubtract(first[0], second[0]), AngleSubtract(first[1], second[1]), AngleSubtract(first[2], second[2])]`.
/// @param first First used in `first[0]` and `first[1]`.
/// @param second Second used in `second[0]` and `second[1]`.
function AnglesSubtract(first,second) return [AngleSubtract(first[0],second[0]),AngleSubtract(first[1],second[1]),AngleSubtract(first[2],second[2])] end function
/// Return `mq3.shared.math.AngleNormalize360(value)` from `shared.math.AngleMod`.
/// @param value Angle passed as `angle` to `mq3.shared.math.AngleNormalize360`.
function AngleMod(value) return AngleNormalize360(value) end function
/// Return `mq3.shared.math.AngleNormalize180(n.fsub(first, second))` from `shared.math.AngleDelta`.
/// @param first Left floating-point operand.
/// @param second Right floating-point operand.
function AngleDelta(first,second) return AngleNormalize180(n.fsub(first,second)) end function
/// Set plane signbits in shared.math; the normal completion returns `bits`.
///
/// Direct state writes: `plane.signbits`.
/// @param plane Record exposing `normal`. Updated in place: `signbits`.
function SetPlaneSignbits(plane) bits=0;for i=0 to 2 if plane.normal[i]<0 then bits=bits|(1<<i) end if end for;plane.signbits=bits;return bits end function
/// Classify an axis-aligned box by explicitly projecting its extreme corners onto the plane.
/// @param mins Mins used in `mins[i]`.
/// @param maxs Maxs used in `maxs[i]`.
/// @param plane Record exposing `normal`, `dist`.
function BoxOnPlaneSide2(mins,maxs,plane)
  near=array(3,0.0);far=array(3,0.0);for i=0 to 2 if plane.normal[i]<0 then near[i]=mins[i];far[i]=maxs[i] else near[i]=maxs[i];far[i]=mins[i] end if end for
  first=n.fsub(DotProduct(plane.normal,near),plane.dist);second=n.fsub(DotProduct(plane.normal,far),plane.dist);sides=0;if first>=0 then sides=1 end if;if second<0 then sides=sides|2 end if;return sides
end function
/// Classify an axis-aligned box using the axial plane shortcut or the projected-corner fallback.
/// @param mins Mins passed as `mins` to `mq3.shared.math.BoxOnPlaneSide2`.
/// @param maxs Maxs passed as `maxs` to `mq3.shared.math.BoxOnPlaneSide2`.
/// @param plane Record exposing `type`, `dist`.
function BoxOnPlaneSide(mins,maxs,plane)
  if plane.type<3 then if plane.dist<=mins[plane.type] then return 1 end if;if plane.dist>=maxs[plane.type] then return 2 end if;return 3 end if
  return BoxOnPlaneSide2(mins,maxs,plane)
end function
/// Compute radius from bounds in shared.math; the normal completion returns `VectorLength(corner)`.
/// @param mins Mins used in `mins[i]` and `Q_fabs(mins[i])`.
/// @param maxs Maxs used in `maxs[i]` and `Q_fabs(maxs[i])`.
function RadiusFromBounds(mins,maxs) corner=array(3,0.0);for i=0 to 2 a=Q_fabs(mins[i]);b=Q_fabs(maxs[i]);if a>b then corner[i]=a else corner[i]=b end if end for;return VectorLength(corner) end function
/// Compute shared.math.ClearBounds as `[[99999.0, 99999.0, 99999.0], [- 99999.0, - 99999.0, - 99999.0]]`.
function ClearBounds() return [[99999.0,99999.0,99999.0],[-99999.0,-99999.0,-99999.0]] end function
/// Add point to bounds in shared.math; updates `mins entries`, `maxs entries`.
///
/// Direct state writes: `mins elements`, `maxs elements`.
/// @param point Point used in `point[i]` and `(point[i] < mins[i])`.
/// @param mins Mutable sequence written at `i`.
/// @param maxs Mutable sequence written at `i`.
function AddPointToBounds(point,mins,maxs) for i=0 to 2 if point[i]<mins[i] then mins[i]=point[i] end if;if point[i]>maxs[i] then maxs[i]=point[i] end if end for;return void end function
/// Return `mq3.shared.math.VectorMA(a, scale, b)` from `shared.math._VectorMA`.
/// @param a A passed as `a` to `mq3.shared.math.VectorMA`.
/// @param scale Scale passed as `scale` to `mq3.shared.math.VectorMA`.
/// @param b B passed as `b` to `mq3.shared.math.VectorMA`.
function _VectorMA(a,scale,b) return VectorMA(a,scale,b) end function
/// Return `mq3.shared.math.DotProduct(a, b)` from `shared.math._DotProduct`.
/// @param a Left three-element vector.
/// @param b Right three-element vector.
function _DotProduct(a,b) return DotProduct(a,b) end function
/// Compute shared.math._VectorSubtract as `[n.fsub(a[0], b[0]), n.fsub(a[1], b[1]), n.fsub(a[2], b[2])]`.
/// @param a A used in `a[0]` and `a[1]`.
/// @param b B used in `b[0]` and `b[1]`.
function _VectorSubtract(a,b) return [n.fsub(a[0],b[0]),n.fsub(a[1],b[1]),n.fsub(a[2],b[2])] end function
/// Compute shared.math._VectorAdd as `[n.fadd(a[0], b[0]), n.fadd(a[1], b[1]), n.fadd(a[2], b[2])]`.
/// @param a A used in `a[0]` and `a[1]`.
/// @param b B used in `b[0]` and `b[1]`.
function _VectorAdd(a,b) return [n.fadd(a[0],b[0]),n.fadd(a[1],b[1]),n.fadd(a[2],b[2])] end function
/// Compute shared.math._VectorCopy as `[value[0], value[1], value[2]]`.
/// @param value Value used in `value[0]` and `value[1]`.
function _VectorCopy(value) return [value[0],value[1],value[2]] end function
/// Return `mq3.shared.math.VectorScale(value, scale)` from `shared.math._VectorScale`.
/// @param value A passed as `a` to `mq3.shared.math.VectorScale`.
/// @param scale Scale passed as `scale` to `mq3.shared.math.VectorScale`.
function _VectorScale(value,scale) return VectorScale(value,scale) end function
/// Compute shared.math.Vector4Scale as `[n.fmul(value[0], scale), n.fmul(value[1], scale), n.fmul(value[2], scale), n.fmul(value[3], scale)]`.
/// @param value Value used in `value[0]` and `value[1]`.
/// @param scale Right floating-point operand.
function Vector4Scale(value,scale) return [n.fmul(value[0],scale),n.fmul(value[1],scale),n.fmul(value[2],scale),n.fmul(value[3],scale)] end function
/// Compute log 2 in shared.math; the normal completion returns `result`.
/// @param value Value used in `(value >> 1)` and `(value != 0)`.
function Q_log2(value) result=0;value=value>>1;while value!=0 result=result+1;value=value>>1 end while;return result end function
/// Compute plane type for normal in shared.math; the normal completion returns `3`.
/// @param normal Normal used in `normal[0]` and `normal[1]`.
function PlaneTypeForNormal(normal) if normal[0]==1.0 then return 0 end if;if normal[1]==1.0 then return 1 end if;if normal[2]==1.0 then return 2 end if;return 3 end function
