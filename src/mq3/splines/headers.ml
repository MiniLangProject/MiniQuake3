// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native MiniLang ownership of the eight code/splines public headers.
package mq3.splines.headers

import mq3.compat.numeric as n
import mq3.compat.transcendental as trig
import std.string as strings

const EQUAL_EPSILON=0.001
const DEG2RAD=0.017453292519943295
const RAD2DEG=57.29577951308232

struct Vec3 x y z end struct
struct Angles pitch yaw roll end struct
struct Quat x y z w end struct
struct Mat3 rows end struct
struct Bounds mins maxs cleared end struct
struct ListState values size granularity end struct

function mathAnglesSymbols() return ["Zero","angles_t","set","vec3_p"] end function
function mathMatrixSymbols() return ["Identity","InverseMultiply","OrthoNormalize","SkewSymmetric","mat3_t"] end function
function mathQuaternionSymbols() return ["Length","Normalize","quat_t","set","vec4"] end function
function mathVectorSymbols() return ["AddBounds","AddPoint","Bounds","Center","Clear","ContainsPoint","Cross","IntersectsBounds","IsCleared","Normalize","Radius","Snap","SnapTowards","Zero","idSqrt","idVec3_t","set","vec4_t"] end function
function qSharedSymbols() return [] end function
function splinesSymbols() return [] end function
function utilListSymbols() return ["AddUnique","Append","Clear","Condense","Find","Num","Remove","RemoveIndex","Resize","SetGranularity","SetNum","Size","Sort","idList"] end function
function utilStrSymbols() return ["append","idStr","tolower","toupper"] end function

function vec3(x,y,z) return Vec3(n.f32(x),n.f32(y),n.f32(z)) end function
function angles(pitch,yaw,roll) return Angles(n.f32(pitch),n.f32(yaw),n.f32(roll)) end function
function quat(x,y,z,w) return Quat(n.f32(x),n.f32(y),n.f32(z),n.f32(w)) end function
function mat3(a,b,c) return Mat3([a,b,c]) end function
function idVec3_t(x,y,z) return vec3(x,y,z) end function
function angles_t(pitch,yaw,roll) return angles(pitch,yaw,roll) end function
function quat_t(x,y,z,w) return quat(x,y,z,w) end function
function mat3_t(a,b,c) return mat3(a,b,c) end function
function vec4_t(x,y,z,w) return [n.f32(x),n.f32(y),n.f32(z),n.f32(w)] end function
function idSqrt(value) return trig.sqrt(value) end function
function Q_fabs(value) if value<0.0 then return 0.0-value end if;return value end function
function vecAdd(a,b) return vec3(a.x+b.x,a.y+b.y,a.z+b.z) end function
function vecSub(a,b) return vec3(a.x-b.x,a.y-b.y,a.z-b.z) end function
function vecScale(a,value) return vec3(a.x*value,a.y*value,a.z*value) end function
function dot(a,b) return n.f32(a.x*b.x+a.y*b.y+a.z*b.z) end function
function Cross(a,b) return vec3(a.y*b.z-a.z*b.y,a.z*b.x-a.x*b.z,a.x*b.y-a.y*b.x) end function
function Length(value) return n.f32(idSqrt(value.x*value.x+value.y*value.y+value.z*value.z)) end function
function Normalize(value)
  length=Length(value);if length==0.0 then return vec3(value.x,value.y,value.z) end if
  return vecScale(value,1.0/length)
end function
function Zero() return vec3(0.0,0.0,0.0) end function
function Snap(value) return vec3(n.trunc32(value.x),n.trunc32(value.y),n.trunc32(value.z)) end function
function snapComponent(value,toward) base=n.trunc32(value);if toward>value then return base+1 end if;return base end function
function SnapTowards(value,toward) return vec3(snapComponent(value.x,toward.x),snapComponent(value.y,toward.y),snapComponent(value.z,toward.z)) end function
function LerpVector(a,b,fraction) return vecAdd(a,vecScale(vecSub(b,a),fraction)) end function
function vectorEqual(a,b) return Q_fabs(a.x-b.x)<=EQUAL_EPSILON and Q_fabs(a.y-b.y)<=EQUAL_EPSILON and Q_fabs(a.z-b.z)<=EQUAL_EPSILON end function

function toYaw(value)
  if value.x==0.0 and value.y==0.0 then return 0.0 end if
  yaw=trig.atan2(value.y,value.x)*RAD2DEG;if yaw<0.0 then yaw=yaw+360.0 end if;return n.f32(yaw)
end function
function toPitch(value)
  if value.x==0.0 and value.y==0.0 then if value.z>0.0 then return 90.0 end if;return 270.0 end if
  forward=trig.sqrt(value.x*value.x+value.y*value.y);pitch=trig.atan2(value.z,forward)*RAD2DEG;if pitch<0.0 then pitch=pitch+360.0 end if;return n.f32(pitch)
end function
function vectorToAngles(value) return angles(0.0-toPitch(value),toYaw(value),0.0) end function
function normalizeAngle360(value)
  result=value-n.trunc32(value/360.0)*360.0;if result<0.0 then result=result+360.0 end if;return n.f32(result)
end function
function normalizeAngle180(value) result=normalizeAngle360(value);if result>180.0 then result=result-360.0 end if;return n.f32(result) end function
function Normalize360(value) return angles(normalizeAngle360(value.pitch),normalizeAngle360(value.yaw),normalizeAngle360(value.roll)) end function
function Normalize180(value) return angles(normalizeAngle180(value.pitch),normalizeAngle180(value.yaw),normalizeAngle180(value.roll)) end function
function toVectors(value)
  pitch=value.pitch*DEG2RAD;yaw=value.yaw*DEG2RAD;roll=value.roll*DEG2RAD
  sp=trig.sin(pitch);cp=trig.cos(pitch);sy=trig.sin(yaw);cy=trig.cos(yaw);sr=trig.sin(roll);cr=trig.cos(roll)
  forward=vec3(cp*cy,cp*sy,-sp)
  right=vec3(-sr*sp*cy-cr*-sy,-sr*sp*sy-cr*cy,-sr*cp)
  up=vec3(cr*sp*cy+-sr*-sy,cr*sp*sy+-sr*cy,cr*cp)
  return [forward,right,up]
end function
function toForward(value) return toVectors(value)[0] end function

function quatLength(value) return n.f32(trig.sqrt(value.x*value.x+value.y*value.y+value.z*value.z+value.w*value.w)) end function
function quatNormalize(value) length=quatLength(value);if length==0.0 then return quat(value.x,value.y,value.z,value.w) end if;return quat(value.x/length,value.y/length,value.z/length,value.w/length) end function
function vec4(value) return [value.x,value.y,value.z,value.w] end function

function Identity() return mat3(vec3(1,0,0),vec3(0,1,0),vec3(0,0,1)) end function
function Clear() return mat3(Zero(),Zero(),Zero()) end function
function matVec(matrix,value)
  return vec3(matrix.rows[0].x*value.x+matrix.rows[1].x*value.y+matrix.rows[2].x*value.z,matrix.rows[0].y*value.x+matrix.rows[1].y*value.y+matrix.rows[2].y*value.z,matrix.rows[0].z*value.x+matrix.rows[1].z*value.y+matrix.rows[2].z*value.z)
end function
function Transpose(matrix) return mat3(vec3(matrix.rows[0].x,matrix.rows[1].x,matrix.rows[2].x),vec3(matrix.rows[0].y,matrix.rows[1].y,matrix.rows[2].y),vec3(matrix.rows[0].z,matrix.rows[1].z,matrix.rows[2].z)) end function
function matrixMultiply(a,b)
  t=Transpose(b);return mat3(vec3(dot(a.rows[0],t.rows[0]),dot(a.rows[0],t.rows[1]),dot(a.rows[0],t.rows[2])),vec3(dot(a.rows[1],t.rows[0]),dot(a.rows[1],t.rows[1]),dot(a.rows[1],t.rows[2])),vec3(dot(a.rows[2],t.rows[0]),dot(a.rows[2],t.rows[1]),dot(a.rows[2],t.rows[2])))
end function
function OrthoNormalize(matrix)
  first=Normalize(matrix.rows[0]);third=Normalize(Cross(first,matrix.rows[1]));second=Normalize(Cross(third,first));return mat3(first,second,third)
end function
function InverseMultiply(inverse,b) return matrixMultiply(Transpose(inverse),b) end function
function SkewSymmetric(value) return mat3(vec3(0.0,0.0-value.z,value.y),vec3(value.z,0.0,0.0-value.x),vec3(0.0-value.y,value.x,0.0)) end function

function bounds() return Bounds(vec3(1000000000.0,1000000000.0,1000000000.0),vec3(-1000000000.0,-1000000000.0,-1000000000.0),true) end function
function newBounds() return bounds() end function
function AddPoint(value,point)
  if value.cleared then value.mins=vec3(point.x,point.y,point.z);value.maxs=vec3(point.x,point.y,point.z);value.cleared=false;return true end if
  expanded=false
  if point.x<value.mins.x then value.mins.x=point.x;expanded=true end if;if point.y<value.mins.y then value.mins.y=point.y;expanded=true end if;if point.z<value.mins.z then value.mins.z=point.z;expanded=true end if
  if point.x>value.maxs.x then value.maxs.x=point.x;expanded=true end if;if point.y>value.maxs.y then value.maxs.y=point.y;expanded=true end if;if point.z>value.maxs.z then value.maxs.z=point.z;expanded=true end if
  return expanded
end function
function AddBounds(value,other) if other.cleared then return false end if;first=AddPoint(value,other.mins);second=AddPoint(value,other.maxs);return first or second end function
function Center(value) if value.cleared then return Zero() end if;return vecScale(vecAdd(value.mins,value.maxs),0.5) end function
function Radius(value) if value.cleared then return 0.0 end if;return Length(vecSub(value.maxs,Center(value))) end function
function ContainsPoint(value,point) return not value.cleared and point.x>=value.mins.x and point.y>=value.mins.y and point.z>=value.mins.z and point.x<=value.maxs.x and point.y<=value.maxs.y and point.z<=value.maxs.z end function
function IntersectsBounds(a,b) return not a.cleared and not b.cleared and a.maxs.x>=b.mins.x and a.mins.x<=b.maxs.x and a.maxs.y>=b.mins.y and a.mins.y<=b.maxs.y and a.maxs.z>=b.mins.z and a.mins.z<=b.maxs.z end function
function IsCleared(value) return value.cleared end function

function idList(granularity) if granularity<=0 then return error(7977,"list granularity must be positive") end if;return ListState([],0,granularity) end function
function Num(list) return len(list.values) end function
function Size(list) return list.size end function
function Resize(list,size) if size<0 then return error(7977,"list size is negative") end if;if size<len(list.values) then list.values=slice(list.values,0,size) end if;list.size=size;return size end function
function SetNum(list,count)
  if count<0 then return error(7977,"list count is negative") end if
  if count>list.size then Resize(list,((count+list.granularity-1)/list.granularity)*list.granularity) end if
  while len(list.values)<count list.values=list.values+[void] end while
  if len(list.values)>count then list.values=slice(list.values,0,count) end if;return count
end function
function SetGranularity(list,granularity) if granularity<=0 then return error(7977,"list granularity must be positive") end if;list.granularity=granularity;target=((len(list.values)+granularity-1)/granularity)*granularity;if target!=list.size then Resize(list,target) end if;return granularity end function
function Append(list,value) if len(list.values)==list.size then Resize(list,list.size+list.granularity) end if;list.values=list.values+[value];return len(list.values)-1 end function
function Find(list,value) for index=0 to len(list.values)-1 if list.values[index]==value then return index end if end for;return -1 end function
function AddUnique(list,value) index=Find(list,value);if index>=0 then return index end if;return Append(list,value) end function
function RemoveIndex(list,index)
  if index<0 or index>=len(list.values) then return false end if
  kept=[];for current=0 to len(list.values)-1 if current!=index then kept=kept+[list.values[current]] end if end for
  list.values=kept;return true
end function
function Remove(list,value) return RemoveIndex(list,Find(list,value)) end function
function Condense(list) list.size=len(list.values);return list.size end function
function listClear(list) list.values=[];list.size=0;return void end function
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

function idStr(value) if value==void then return "" end if;return str(value) end function
function append(left,right) return idStr(left)+idStr(right) end function
function tolower(value) return strings.toLowerAscii(idStr(value)) end function
function toupper(value) raw=bytes(idStr(value));for index=0 to len(raw)-1 if raw[index]>=97 and raw[index]<=122 then raw[index]=raw[index]-32 end if end for;return decode(raw) end function
