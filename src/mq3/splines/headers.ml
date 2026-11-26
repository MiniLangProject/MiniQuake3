// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native MiniLang ownership of the eight code/splines public headers.
package mq3.splines.headers

import mq3.compat.numeric as n
import mq3.compat.transcendental as trig
import std.string as strings

/// Tolerance used when comparing floating-point geometric values for equality.
const EQUAL_EPSILON=0.001
/// Multiplicative factor that converts degrees to radians.
const DEG2RAD=0.017453292519943295
/// Multiplicative factor that converts radians to degrees.
const RAD2DEG=57.29577951308232

/// Vec3 record for splines.headers, containing `x`, `y`, `z`.
struct Vec3
  /// X component of the spatial vector.
  x
  /// Y component of the spatial vector.
  y
  /// Z component of the spatial vector.
  z
end struct
/// Angles record for splines.headers, containing `pitch`, `yaw`, `roll`.
struct Angles
  /// Rotation around the lateral axis, expressed as the pitch angle.
  pitch
  /// Rotation around the vertical axis, expressed as the yaw angle.
  yaw
  /// Rotation around the longitudinal axis, expressed as the roll angle.
  roll
end struct
/// Quat record for splines.headers, containing `x`, `y`, `z`, `w`.
struct Quat
  /// X component of the spatial vector.
  x
  /// Y component of the spatial vector.
  y
  /// Z component of the spatial vector.
  z
  /// Fourth component of the homogeneous vector.
  w
end struct
/// Mat3 record for splines.headers, containing `rows`.
struct Mat3
  /// Console-variable table rows managed by the cvar subsystem.
  rows
end struct
/// Bounds record for splines.headers, containing `mins`, `maxs`, `cleared`.
struct Bounds
  /// Lower XYZ corner of the accumulated spline bounds.
  mins
  /// Upper XYZ corner of the accumulated spline bounds.
  maxs
  /// Nonzero when the bounds are empty and the next added point must initialize them.
  cleared
end struct
/// ListState record for splines.headers, containing `values`, `size`, `granularity`.
struct ListState
  /// List elements currently in use.
  values
  /// Allocated element capacity of the list; the used element count is len(values).
  size
  /// Allocation growth increment used by list storage.
  granularity
end struct

/// List the 4 names in splines.headers.mathAnglesSymbols, beginning with `Zero`, `angles_t`, `set`, `vec3_p`.
function mathAnglesSymbols() return ["Zero","angles_t","set","vec3_p"] end function
/// List the 5 names in splines.headers.mathMatrixSymbols, beginning with `Identity`, `InverseMultiply`, `OrthoNormalize`, `SkewSymmetric`.
function mathMatrixSymbols() return ["Identity","InverseMultiply","OrthoNormalize","SkewSymmetric","mat3_t"] end function
/// List the 5 names in splines.headers.mathQuaternionSymbols, beginning with `Length`, `Normalize`, `quat_t`, `set`.
function mathQuaternionSymbols() return ["Length","Normalize","quat_t","set","vec4"] end function
/// List the 18 names in splines.headers.mathVectorSymbols, beginning with `AddBounds`, `AddPoint`, `Bounds`, `Center`.
function mathVectorSymbols() return ["AddBounds","AddPoint","Bounds","Center","Clear","ContainsPoint","Cross","IntersectsBounds","IsCleared","Normalize","Radius","Snap","SnapTowards","Zero","idSqrt","idVec3_t","set","vec4_t"] end function
/// List the 0 names in splines.headers.qSharedSymbols.
function qSharedSymbols() return [] end function
/// List the 0 names in splines.headers.splinesSymbols.
function splinesSymbols() return [] end function
/// List the 14 names in splines.headers.utilListSymbols, beginning with `AddUnique`, `Append`, `Clear`, `Condense`.
function utilListSymbols() return ["AddUnique","Append","Clear","Condense","Find","Num","Remove","RemoveIndex","Resize","SetGranularity","SetNum","Size","Sort","idList"] end function
/// List the 4 names in splines.headers.utilStrSymbols, beginning with `append`, `idStr`, `tolower`, `toupper`.
function utilStrSymbols() return ["append","idStr","tolower","toupper"] end function

/// Create `mq3.splines.headers.Vec3` with x=n.f32(x); y=n.f32(y); z=n.f32(z).
/// @param x Floating-point value to narrow to binary32.
/// @param y Floating-point value to narrow to binary32.
/// @param z Floating-point value to narrow to binary32.
function vec3(x,y,z) return Vec3(n.f32(x),n.f32(y),n.f32(z)) end function
/// Create `mq3.splines.headers.Angles` with pitch=n.f32(pitch); yaw=n.f32(yaw); roll=n.f32(roll).
/// @param pitch Floating-point value to narrow to binary32.
/// @param yaw Floating-point value to narrow to binary32.
/// @param roll Floating-point value to narrow to binary32.
function angles(pitch,yaw,roll) return Angles(n.f32(pitch),n.f32(yaw),n.f32(roll)) end function
/// Create `mq3.splines.headers.Quat` with x=n.f32(x); y=n.f32(y); z=n.f32(z); w=n.f32(w).
/// @param x Floating-point value to narrow to binary32.
/// @param y Floating-point value to narrow to binary32.
/// @param z Floating-point value to narrow to binary32.
/// @param w Floating-point value to narrow to binary32.
function quat(x,y,z,w) return Quat(n.f32(x),n.f32(y),n.f32(z),n.f32(w)) end function
/// Create `mq3.splines.headers.Mat3` with rows=[a, b, c].
/// @param a A used in `Mat3([a, b, c])`.
/// @param b B used in `Mat3([a, b, c])`.
/// @param c C used in `Mat3([a, b, c])`.
function mat3(a,b,c) return Mat3([a,b,c]) end function
/// Return `mq3.splines.headers.vec3(x, y, z)` from `splines.headers.idVec3_t`.
/// @param x X passed as `x` to `mq3.splines.headers.vec3`.
/// @param y Y passed as `y` to `mq3.splines.headers.vec3`.
/// @param z Z passed as `z` to `mq3.splines.headers.vec3`.
function idVec3_t(x,y,z) return vec3(x,y,z) end function
/// Return `mq3.splines.headers.angles(pitch, yaw, roll)` from `splines.headers.angles_t`.
/// @param pitch Pitch passed as `pitch` to `mq3.splines.headers.angles`.
/// @param yaw Yaw passed as `yaw` to `mq3.splines.headers.angles`.
/// @param roll Roll passed as `roll` to `mq3.splines.headers.angles`.
function angles_t(pitch,yaw,roll) return angles(pitch,yaw,roll) end function
/// Return `mq3.splines.headers.quat(x, y, z, w)` from `splines.headers.quat_t`.
/// @param x X passed as `x` to `mq3.splines.headers.quat`.
/// @param y Y passed as `y` to `mq3.splines.headers.quat`.
/// @param z Z passed as `z` to `mq3.splines.headers.quat`.
/// @param w W passed as `w` to `mq3.splines.headers.quat`.
function quat_t(x,y,z,w) return quat(x,y,z,w) end function
/// Return `mq3.splines.headers.mat3(a, b, c)` from `splines.headers.mat3_t`.
/// @param a A passed as `a` to `mq3.splines.headers.mat3`.
/// @param b B passed as `b` to `mq3.splines.headers.mat3`.
/// @param c C passed as `c` to `mq3.splines.headers.mat3`.
function mat3_t(a,b,c) return mat3(a,b,c) end function
/// Compute splines.headers.vec4_t as `[n.f32(x), n.f32(y), n.f32(z), n.f32(w)]`.
/// @param x Floating-point value to narrow to binary32.
/// @param y Floating-point value to narrow to binary32.
/// @param z Floating-point value to narrow to binary32.
/// @param w Floating-point value to narrow to binary32.
function vec4_t(x,y,z,w) return [n.f32(x),n.f32(y),n.f32(z),n.f32(w)] end function
/// Return `mq3.compat.transcendental.sqrt(value)` from `splines.headers.idSqrt`.
/// @param value Floating-point operand.
function idSqrt(value) return trig.sqrt(value) end function
/// Compute fabs in splines.headers; the normal completion returns `value`.
/// @param value Value used in `(value < 0.0)` and `(0.0 - value)`.
function Q_fabs(value) if value<0.0 then return 0.0-value end if;return value end function
/// Return `mq3.splines.headers.vec3((a.x + b.x), (a.y + b.y), (a.z + b.z))` from `splines.headers.vecAdd`.
/// @param a Record exposing `x`, `y`, `z`.
/// @param b Record exposing `x`, `y`, `z`.
function vecAdd(a,b) return vec3(a.x+b.x,a.y+b.y,a.z+b.z) end function
/// Return `mq3.splines.headers.vec3((a.x - b.x), (a.y - b.y), (a.z - b.z))` from `splines.headers.vecSub`.
/// @param a Record exposing `x`, `y`, `z`.
/// @param b Record exposing `x`, `y`, `z`.
function vecSub(a,b) return vec3(a.x-b.x,a.y-b.y,a.z-b.z) end function
/// Return `mq3.splines.headers.vec3((a.x * value), (a.y * value), (a.z * value))` from `splines.headers.vecScale`.
/// @param a Record exposing `x`, `y`, `z`.
/// @param value Value used in `(a.x * value)` and `(a.y * value)`.
function vecScale(a,value) return vec3(a.x*value,a.y*value,a.z*value) end function
/// Return `mq3.compat.numeric.f32((((a.x * b.x) + (a.y * b.y)) + (a.z * b.z)))` from `splines.headers.dot`.
/// @param a Record exposing `x`, `y`, `z`.
/// @param b Record exposing `x`, `y`, `z`.
function dot(a,b) return n.f32(a.x*b.x+a.y*b.y+a.z*b.z) end function
/// Return `mq3.splines.headers.vec3(((a.y * b.z) - (a.z * b.y)), ((a.z * b.x) - (a.x * b.z)), ((a.x * b.y) - (a.y * b.x)))` from `splines.headers.Cross`.
/// @param a Record exposing `y`, `z`, `x`.
/// @param b Record exposing `z`, `y`, `x`.
function Cross(a,b) return vec3(a.y*b.z-a.z*b.y,a.z*b.x-a.x*b.z,a.x*b.y-a.y*b.x) end function
/// Return `mq3.compat.numeric.f32(idSqrt((((value.x * value.x) + (value.y * value.y)) + (value.z * value.z))))` from `splines.headers.Length`.
/// @param value Record exposing `x`, `y`, `z`.
function Length(value) return n.f32(idSqrt(value.x*value.x+value.y*value.y+value.z*value.z)) end function
/// Normalize headers in splines.headers; the normal completion returns `vecScale(value, (1.0 / length))`.
/// @param value Record exposing `x`, `y`, `z`.
function Normalize(value)
  length=Length(value);if length==0.0 then return vec3(value.x,value.y,value.z) end if
  return vecScale(value,1.0/length)
end function
/// Return `mq3.splines.headers.vec3(0.0, 0.0, 0.0)` from `splines.headers.Zero`.
function Zero() return vec3(0.0,0.0,0.0) end function
/// Return `mq3.splines.headers.vec3(n.trunc32(value.x), n.trunc32(value.y), n.trunc32(value.z))` from `splines.headers.Snap`.
/// @param value Record exposing `x`, `y`, `z`.
function Snap(value) return vec3(n.trunc32(value.x),n.trunc32(value.y),n.trunc32(value.z)) end function
/// Compute snap component in splines.headers; the normal completion returns `base`.
/// @param value Floating-point value to convert to signed 32-bit integer semantics.
/// @param toward Toward used in `(toward > value)`.
function snapComponent(value,toward) base=n.trunc32(value);if toward>value then return base+1 end if;return base end function
/// Return `mq3.splines.headers.vec3(snapComponent(value.x, toward.x), snapComponent(value.y, toward.y), snapComponent(value.z, toward.z))` from `splines.headers.SnapTowards`.
/// @param value Record exposing `x`, `y`, `z`.
/// @param toward Record exposing `x`, `y`, `z`.
function SnapTowards(value,toward) return vec3(snapComponent(value.x,toward.x),snapComponent(value.y,toward.y),snapComponent(value.z,toward.z)) end function
/// Return `mq3.splines.headers.vecAdd(a, vecScale(vecSub(b, a), fraction))` from `splines.headers.LerpVector`.
/// @param a A passed as `a` to `mq3.splines.headers.vecAdd`.
/// @param b A passed as `a` to `mq3.splines.headers.vecSub`.
/// @param fraction Value passed as `value` to `mq3.splines.headers.vecScale`.
function LerpVector(a,b,fraction) return vecAdd(a,vecScale(vecSub(b,a),fraction)) end function
/// Compute splines.headers.vectorEqual as `(((Q_fabs((a.x - b.x)) <= EQUAL_EPSILON) and (Q_fabs((a.y - b.y)) <= EQUAL_EPSILON)) and (Q_fabs((a.z - b.z)) <= EQUAL_EPSILON))`.
/// @param a Record exposing `x`, `y`, `z`.
/// @param b Record exposing `x`, `y`, `z`.
function vectorEqual(a,b) return Q_fabs(a.x-b.x)<=EQUAL_EPSILON and Q_fabs(a.y-b.y)<=EQUAL_EPSILON and Q_fabs(a.z-b.z)<=EQUAL_EPSILON end function

/// Compute to yaw in splines.headers; the normal completion returns `n.f32(yaw)`.
/// @param value Record exposing `x`, `y`.
function toYaw(value)
  if value.x==0.0 and value.y==0.0 then return 0.0 end if
  yaw=trig.atan2(value.y,value.x)*RAD2DEG;if yaw<0.0 then yaw=yaw+360.0 end if;return n.f32(yaw)
end function
/// Compute to pitch in splines.headers; the normal completion returns `n.f32(pitch)`.
/// @param value Record exposing `x`, `y`, `z`.
function toPitch(value)
  if value.x==0.0 and value.y==0.0 then if value.z>0.0 then return 90.0 end if;return 270.0 end if
  forward=trig.sqrt(value.x*value.x+value.y*value.y);pitch=trig.atan2(value.z,forward)*RAD2DEG;if pitch<0.0 then pitch=pitch+360.0 end if;return n.f32(pitch)
end function
/// Return `mq3.splines.headers.angles((0.0 - toPitch(value)), toYaw(value), 0.0)` from `splines.headers.vectorToAngles`.
/// @param value Value passed as `value` to `mq3.splines.headers.toPitch`.
function vectorToAngles(value) return angles(0.0-toPitch(value),toYaw(value),0.0) end function
/// Normalize angle 360 in splines.headers; the normal completion returns `n.f32(result)`.
/// @param value Value used in `(value / 360.0)` and `n.trunc32((value / 360.0))`.
function normalizeAngle360(value)
  result=value-n.trunc32(value/360.0)*360.0;if result<0.0 then result=result+360.0 end if;return n.f32(result)
end function
/// Normalize angle 180 in splines.headers; the normal completion returns `n.f32(result)`.
/// @param value Value passed as `value` to `mq3.splines.headers.normalizeAngle360`.
function normalizeAngle180(value) result=normalizeAngle360(value);if result>180.0 then result=result-360.0 end if;return n.f32(result) end function
/// Return `mq3.splines.headers.angles(normalizeAngle360(value.pitch), normalizeAngle360(value.yaw), normalizeAngle360(value.roll))` from `splines.headers.Normalize360`.
/// @param value Record exposing `pitch`, `yaw`, `roll`.
function Normalize360(value) return angles(normalizeAngle360(value.pitch),normalizeAngle360(value.yaw),normalizeAngle360(value.roll)) end function
/// Return `mq3.splines.headers.angles(normalizeAngle180(value.pitch), normalizeAngle180(value.yaw), normalizeAngle180(value.roll))` from `splines.headers.Normalize180`.
/// @param value Record exposing `pitch`, `yaw`, `roll`.
function Normalize180(value) return angles(normalizeAngle180(value.pitch),normalizeAngle180(value.yaw),normalizeAngle180(value.roll)) end function
/// Compute to vectors in splines.headers; the normal completion returns `[forward, right, up]`.
/// @param value Record exposing `pitch`, `yaw`, `roll`.
function toVectors(value)
  pitch=value.pitch*DEG2RAD;yaw=value.yaw*DEG2RAD;roll=value.roll*DEG2RAD
  sp=trig.sin(pitch);cp=trig.cos(pitch);sy=trig.sin(yaw);cy=trig.cos(yaw);sr=trig.sin(roll);cr=trig.cos(roll)
  forward=vec3(cp*cy,cp*sy,-sp)
  right=vec3(-sr*sp*cy-cr*-sy,-sr*sp*sy-cr*cy,-sr*cp)
  up=vec3(cr*sp*cy+-sr*-sy,cr*sp*sy+-sr*cy,cr*cp)
  return [forward,right,up]
end function
/// Compute splines.headers.toForward as `toVectors(value)[0]`.
/// @param value Value passed as `value` to `mq3.splines.headers.toVectors`.
function toForward(value) return toVectors(value)[0] end function

/// Return `mq3.compat.numeric.f32(trig.sqrt(((((value.x * value.x) + (value.y * value.y)) + (value.z * value.z)) + (value.w * value.w))))` from `splines.headers.quatLength`.
/// @param value Record exposing `x`, `y`, `z`, `w`.
function quatLength(value) return n.f32(trig.sqrt(value.x*value.x+value.y*value.y+value.z*value.z+value.w*value.w)) end function
/// Compute quat normalize in splines.headers; the normal completion returns `quat((value.x / length), (value.y / length), (value.z / length), (value.w / length))`.
/// @param value Record exposing `x`, `y`, `z`, `w`.
function quatNormalize(value) length=quatLength(value);if length==0.0 then return quat(value.x,value.y,value.z,value.w) end if;return quat(value.x/length,value.y/length,value.z/length,value.w/length) end function
/// Compute splines.headers.vec4 as `[value.x, value.y, value.z, value.w]`.
/// @param value Record exposing `x`, `y`, `z`, `w`.
function vec4(value) return [value.x,value.y,value.z,value.w] end function

/// Return `mq3.splines.headers.mat3(vec3(1, 0, 0), vec3(0, 1, 0), vec3(0, 0, 1))` from `splines.headers.Identity`.
function Identity() return mat3(vec3(1,0,0),vec3(0,1,0),vec3(0,0,1)) end function
/// Return `mq3.splines.headers.mat3(Zero(), Zero(), Zero())` from `splines.headers.Clear`.
function Clear() return mat3(Zero(),Zero(),Zero()) end function
/// Delegate `matVec` to `mq3.splines.headers.vec3` and return its result.
/// @param matrix Record exposing `rows`.
/// @param value Record exposing `x`, `y`, `z`.
function matVec(matrix,value)
  return vec3(matrix.rows[0].x*value.x+matrix.rows[1].x*value.y+matrix.rows[2].x*value.z,matrix.rows[0].y*value.x+matrix.rows[1].y*value.y+matrix.rows[2].y*value.z,matrix.rows[0].z*value.x+matrix.rows[1].z*value.y+matrix.rows[2].z*value.z)
end function
/// Return `mq3.splines.headers.mat3(vec3(matrix.rows[0].x, matrix.rows[1].x, matrix.rows[2].x), vec3(matrix.rows[0].y, matrix.rows[1].y, matrix.rows[2].y), vec3(matrix.rows[0].z, matrix.rows[1].z, matrix.rows[2].z))` from `splines.headers.Transpose`.
/// @param matrix Record exposing `rows`.
function Transpose(matrix) return mat3(vec3(matrix.rows[0].x,matrix.rows[1].x,matrix.rows[2].x),vec3(matrix.rows[0].y,matrix.rows[1].y,matrix.rows[2].y),vec3(matrix.rows[0].z,matrix.rows[1].z,matrix.rows[2].z)) end function
/// Apply `mq3.splines.headers.Transpose`, `mq3.splines.headers.mat3`, `mq3.splines.headers.vec3` for matrix multiply in splines.headers.
/// @param a Record exposing `rows`.
/// @param b Matrix passed as `matrix` to `mq3.splines.headers.Transpose`.
function matrixMultiply(a,b)
  t=Transpose(b);return mat3(vec3(dot(a.rows[0],t.rows[0]),dot(a.rows[0],t.rows[1]),dot(a.rows[0],t.rows[2])),vec3(dot(a.rows[1],t.rows[0]),dot(a.rows[1],t.rows[1]),dot(a.rows[1],t.rows[2])),vec3(dot(a.rows[2],t.rows[0]),dot(a.rows[2],t.rows[1]),dot(a.rows[2],t.rows[2])))
end function
/// Compute ortho normalize in splines.headers; the normal completion returns `mat3(first, second, third)`.
/// @param matrix Record exposing `rows`.
function OrthoNormalize(matrix)
  first=Normalize(matrix.rows[0]);third=Normalize(Cross(first,matrix.rows[1]));second=Normalize(Cross(third,first));return mat3(first,second,third)
end function
/// Return `mq3.splines.headers.matrixMultiply(Transpose(inverse), b)` from `splines.headers.InverseMultiply`.
/// @param inverse Matrix passed as `matrix` to `mq3.splines.headers.Transpose`.
/// @param b B passed as `b` to `mq3.splines.headers.matrixMultiply`.
function InverseMultiply(inverse,b) return matrixMultiply(Transpose(inverse),b) end function
/// Return `mq3.splines.headers.mat3(vec3(0.0, (0.0 - value.z), value.y), vec3(value.z, 0.0, (0.0 - value.x)), vec3((0.0 - value.y), value.x, 0.0))` from `splines.headers.SkewSymmetric`.
/// @param value Record exposing `z`, `y`, `x`.
function SkewSymmetric(value) return mat3(vec3(0.0,0.0-value.z,value.y),vec3(value.z,0.0,0.0-value.x),vec3(0.0-value.y,value.x,0.0)) end function

/// Create `mq3.splines.headers.Bounds` with mins=vec3(1000000000.0, 1000000000.0, 1000000000.0); maxs=vec3(- 1000000000.0, - 1000000000.0, - 1000000000.0); cleared=true.
function bounds() return Bounds(vec3(1000000000.0,1000000000.0,1000000000.0),vec3(-1000000000.0,-1000000000.0,-1000000000.0),true) end function
/// Return `mq3.splines.headers.bounds()` from `splines.headers.newBounds`.
function newBounds() return bounds() end function
/// Add point in splines.headers; the normal completion returns `expanded`.
///
/// Direct state writes: `value.mins`, `value.maxs`, `value.cleared`.
/// @param value Record exposing `cleared`, `mins`, `maxs`. Updated in place: `mins`, `maxs`, `cleared`.
/// @param point Record exposing `x`, `y`, `z`.
function AddPoint(value,point)
  if value.cleared then value.mins=vec3(point.x,point.y,point.z);value.maxs=vec3(point.x,point.y,point.z);value.cleared=false;return true end if
  expanded=false
  if point.x<value.mins.x then value.mins.x=point.x;expanded=true end if;if point.y<value.mins.y then value.mins.y=point.y;expanded=true end if;if point.z<value.mins.z then value.mins.z=point.z;expanded=true end if
  if point.x>value.maxs.x then value.maxs.x=point.x;expanded=true end if;if point.y>value.maxs.y then value.maxs.y=point.y;expanded=true end if;if point.z>value.maxs.z then value.maxs.z=point.z;expanded=true end if
  return expanded
end function
/// Add bounds in splines.headers; the normal completion returns `(first or second)`.
/// @param value Value passed as `value` to `mq3.splines.headers.AddPoint`.
/// @param other Record exposing `cleared`, `mins`, `maxs`.
function AddBounds(value,other) if other.cleared then return false end if;first=AddPoint(value,other.mins);second=AddPoint(value,other.maxs);return first or second end function
/// Compute center in splines.headers; the normal completion returns `vecScale(vecAdd(value.mins, value.maxs), 0.5)`.
/// @param value Record exposing `cleared`, `mins`, `maxs`.
function Center(value) if value.cleared then return Zero() end if;return vecScale(vecAdd(value.mins,value.maxs),0.5) end function
/// Compute radius in splines.headers; the normal completion returns `Length(vecSub(value.maxs, Center(value)))`.
/// @param value Record exposing `cleared`, `maxs`.
function Radius(value) if value.cleared then return 0.0 end if;return Length(vecSub(value.maxs,Center(value))) end function
/// Compute splines.headers.ContainsPoint as `((((((not value.cleared and (point.x >= value.mins.x)) and (point.y >= value.mins.y)) and (point.z >= value.mins.z)) and (point.x <= value.maxs.x)) and (point.y <= value.maxs.y)) and (point.z <= value.maxs.z))`.
/// @param value Record exposing `cleared`, `mins`, `maxs`.
/// @param point Record exposing `x`, `y`, `z`.
function ContainsPoint(value,point) return not value.cleared and point.x>=value.mins.x and point.y>=value.mins.y and point.z>=value.mins.z and point.x<=value.maxs.x and point.y<=value.maxs.y and point.z<=value.maxs.z end function
/// Compute splines.headers.IntersectsBounds as `(((((((not a.cleared and not b.cleared) and (a.maxs.x >= b.mins.x)) and (a.mins.x <= b.maxs.x)) and (a.maxs.y >= b.mins.y)) and (a.mins.y <= b.maxs.y)) and (a.maxs.z >= b.mins.z)) and (a.mins.z <= b.maxs.z))`.
/// @param a Record exposing `cleared`, `maxs`, `mins`.
/// @param b Record exposing `cleared`, `mins`, `maxs`.
function IntersectsBounds(a,b) return not a.cleared and not b.cleared and a.maxs.x>=b.mins.x and a.mins.x<=b.maxs.x and a.maxs.y>=b.mins.y and a.mins.y<=b.maxs.y and a.maxs.z>=b.mins.z and a.mins.z<=b.maxs.z end function
/// Compute splines.headers.IsCleared as `value.cleared`.
/// @param value Record exposing `cleared`.
function IsCleared(value) return value.cleared end function

/// Compute id list in splines.headers; the normal completion returns `ListState([], 0, granularity)`.
///
/// Validation failures include `list granularity must be positive`.
/// @param granularity Initial `granularity` field stored in the returned or constructed `mq3.splines.headers.ListState` record.
function idList(granularity) if granularity<=0 then return error(7977,"list granularity must be positive") end if;return ListState([],0,granularity) end function
/// Return `len(list.values)` from `splines.headers.Num`.
/// @param list Record exposing `values`.
function Num(list) return len(list.values) end function
/// Compute splines.headers.Size as `list.size`.
/// @param list Record exposing `size`.
function Size(list) return list.size end function
/// Update `list.values`, `list.size` in splines.headers; the normal completion returns `size`.
///
/// Validation failures include `list size is negative`.
/// Direct state writes: `list.values`, `list.size`.
/// @param list Record exposing `values`. Updated in place: `values`, `size`.
/// @param size Size used in `(size < 0)` and `(size < len(list.values))`.
function Resize(list,size) if size<0 then return error(7977,"list size is negative") end if;if size<len(list.values) then list.values=slice(list.values,0,size) end if;list.size=size;return size end function
/// Set num in splines.headers; the normal completion returns `count`.
///
/// Validation failures include `list count is negative`.
/// Direct state writes: `list.values`.
/// @param list Record exposing `size`, `granularity`, `values`. Updated in place: `values`.
/// @param count Count used in `(count < 0)` and `(count > list.size)`.
function SetNum(list,count)
  if count<0 then return error(7977,"list count is negative") end if
  if count>list.size then Resize(list,((count+list.granularity-1)/list.granularity)*list.granularity) end if
  while len(list.values)<count list.values=list.values+[void] end while
  if len(list.values)>count then list.values=slice(list.values,0,count) end if;return count
end function
/// Set granularity in splines.headers; the normal completion returns `granularity`.
///
/// Validation failures include `list granularity must be positive`.
/// Direct state writes: `list.granularity`.
/// @param list Record exposing `values`, `size`. Updated in place: `granularity`.
/// @param granularity Granularity used in `(granularity <= 0)` and `(len(list.values) + granularity)`.
function SetGranularity(list,granularity) if granularity<=0 then return error(7977,"list granularity must be positive") end if;list.granularity=granularity;target=((len(list.values)+granularity-1)/granularity)*granularity;if target!=list.size then Resize(list,target) end if;return granularity end function
/// Append headers in splines.headers; the normal completion returns `(len(list.values) - 1)`.
///
/// Direct state writes: `list.values`.
/// @param list Record exposing `values`, `size`, `granularity`. Updated in place: `values`.
/// @param value Value used in `(list.values + [value])`.
function Append(list,value) if len(list.values)==list.size then Resize(list,list.size+list.granularity) end if;list.values=list.values+[value];return len(list.values)-1 end function
/// Find headers in splines.headers; the normal completion returns `- 1`.
/// @param list Record exposing `values`.
/// @param value Value used in `(list.values[index] == value)`.
function Find(list,value) for index=0 to len(list.values)-1 if list.values[index]==value then return index end if end for;return -1 end function
/// Add unique in splines.headers; the normal completion returns `Append(list, value)`.
/// @param list List passed as `list` to `mq3.splines.headers.Find`.
/// @param value Value passed as `value` to `mq3.splines.headers.Find`.
function AddUnique(list,value) index=Find(list,value);if index>=0 then return index end if;return Append(list,value) end function
/// Remove index in splines.headers; the normal completion returns `true`.
///
/// Direct state writes: `list.values`.
/// @param list Record exposing `values`. Updated in place: `values`.
/// @param index Index used in `(index < 0)` and `(current != index)`.
function RemoveIndex(list,index)
  if index<0 or index>=len(list.values) then return false end if
  kept=[];for current=0 to len(list.values)-1 if current!=index then kept=kept+[list.values[current]] end if end for
  list.values=kept;return true
end function
/// Return `mq3.splines.headers.RemoveIndex(list, Find(list, value))` from `splines.headers.Remove`.
/// @param list List passed as `list` to `mq3.splines.headers.RemoveIndex`.
/// @param value Value passed as `value` to `mq3.splines.headers.Find`.
function Remove(list,value) return RemoveIndex(list,Find(list,value)) end function
/// Update `list.size` in splines.headers; the normal completion returns `list.size`.
///
/// Direct state writes: `list.size`.
/// @param list Record exposing `values`, `size`. Updated in place: `size`.
function Condense(list) list.size=len(list.values);return list.size end function
/// Update `list.values`, `list.size` in splines.headers.
///
/// Direct state writes: `list.values`, `list.size`.
/// @param list Updated in place: `values`, `size`.
function listClear(list) list.values=[];list.size=0;return void end function
/// Compute sort in splines.headers; the normal completion returns `list`.
///
/// Validation failures include `list comparator is missing`.
/// @param list Record exposing `values`.
/// @param compare Compare used in `(compare == void)` and `compare(context, list.values[(cursor - 1)], list.values[cursor])`.
/// @param context Context used in `compare(context, list.values[(cursor - 1)], list.values[cursor])` and `(compare(context, list.values[(cursor - 1)], list.values[cursor]) > 0)`.
function Sort(list,compare,context)
  if compare==void then return error(7977,"list comparator is missing") end if
  if len(list.values)>1 then
    for index=1 to len(list.values)-1
      cursor=index
      while cursor>0 and compare(context,list.values[cursor-1],list.values[cursor])>0
        saved=list.values[cursor-1];list.values[cursor-1]=list.values[cursor];list.values[cursor]=saved;cursor=cursor-1
      end while
    end for
  end if
  return list
end function

/// Compute id str in splines.headers; the normal completion returns `str(value)`.
/// @param value Value used in `str(value)` and `(value == void)`.
function idStr(value) if value==void then return "" end if;return str(value) end function
/// Compute splines.headers.append as `(idStr(left) + idStr(right))`.
/// @param left Value passed as `value` to `mq3.splines.headers.idStr`.
/// @param right Value passed as `value` to `mq3.splines.headers.idStr`.
function append(left,right) return idStr(left)+idStr(right) end function
/// Return `std.string.toLowerAscii(idStr(value))` from `splines.headers.tolower`.
/// @param value Value passed as `value` to `mq3.splines.headers.idStr`.
function tolower(value) return strings.toLowerAscii(idStr(value)) end function
/// Compute toupper in splines.headers; the normal completion returns `decode(raw)`.
/// @param value Value passed as `value` to `mq3.splines.headers.idStr`.
function toupper(value) raw=bytes(idStr(value));for index=0 to len(raw)-1 if raw[index]>=97 and raw[index]<=122 then raw[index]=raw[index]-32 end if end for;return decode(raw) end function
