// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Rail-core, rail-ring and lightning geometry from renderer/tr_surface.c.
package mq3.renderer.surface_trails

import mq3.compat.numeric as numeric
import mq3.compat.transcendental as trans
import mq3.shared.math as qmath

/// Data record for `mq3.renderer.surface_trails.Vertex`; groups `xyz`, `uv`, `color`.
struct Vertex
  /// Three-dimensional position of this vertex.
  xyz
  /// Texture coordinates associated with this vertex.
  uv
  /// Modulation color of a generated rail-trail vertex.
  color
end struct
/// Data record for `mq3.renderer.surface_trails.Submission`; groups `vertices`, `indexes`.
struct Submission
  /// Generated vertex records forming the rail-trail geometry.
  vertices
  /// Triangle indices joining the generated rail-trail vertices.
  indexes
end struct

/// Creates error `7697` with message `"surface trails: "+message`.
/// @param message Input used in the result expression `error(7697,"surface trails: "+message)`.
function fail(message) return error(7697,"surface trails: "+message) end function
/// Computes `value!=void and len(value)==3` for `mq3.renderer.surface_trails.valid3`.
/// @param value Input used in the result expression `value!=void and len(value)==3`.
function valid3(value) return value!=void and len(value)==3 end function
/// Computes `value!=void and len(value)==4` for `mq3.renderer.surface_trails.validColor`.
/// @param value Input used in the result expression `value!=void and len(value)==4`.
function validColor(value) return value!=void and len(value)==4 end function
/// Returns `[numeric.fsub(a[0],b[0]),numeric.fsub(a[1],b[1]),numeric.fsub(a[2],b[2])]` for `mq3.renderer.surface_trails.subtract`.
/// @param a Three-component vector read at indices 0, 1, and 2.
/// @param b Three-component vector read at indices 0, 1, and 2.
function subtract(a,b) return [numeric.fsub(a[0],b[0]),numeric.fsub(a[1],b[1]),numeric.fsub(a[2],b[2])] end function
/// Returns `[numeric.fadd(a[0],b[0]),numeric.fadd(a[1],b[1]),numeric.fadd(a[2],b[2])]` for `mq3.renderer.surface_trails.add`.
/// @param a Three-component vector read at indices 0, 1, and 2.
/// @param b Three-component vector read at indices 0, 1, and 2.
function add(a,b) return [numeric.fadd(a[0],b[0]),numeric.fadd(a[1],b[1]),numeric.fadd(a[2],b[2])] end function
/// Constructs `mq3.renderer.surface_trails.Vertex` with `uv` = `[numeric.f32(u),numeric.f32(v)]` and the supplied remaining values.
/// @param point Initial value for `mq3.renderer.surface_trails.Vertex.xyz`.
/// @param u Argument 1 supplied to `mq3.compat.numeric.f32`.
/// @param v Argument 1 supplied to `mq3.compat.numeric.f32`.
/// @param color Initial value for `mq3.renderer.surface_trails.Vertex.color`.
function vertex(point,u,v,color) return Vertex(point,[numeric.f32(u),numeric.f32(v)],color) end function
/// Calls `mq3.compat.numeric.trunc32` with `(numeric.fmul(value,0.25))` and returns its result.
/// @param value Argument 1 supplied to `mq3.compat.numeric.fmul`.
function quarter(value) return numeric.trunc32(numeric.fmul(value,0.25)) end function
/// Returns `[quarter(color[0]),quarter(color[1]),quarter(color[2]),color[3]]` for `mq3.renderer.surface_trails.quarterColor`.
/// @param color Indexed input read at `0`, `1`, `2`, `3`.
function quarterColor(color) return [quarter(color[0]),quarter(color[1]),quarter(color[2]),color[3]] end function

// Direct equivalent of DoRailCore. len is the integral result retained by the
// original caller after VectorNormalize's float return is converted to int.
/// @param start Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`.
/// @param finish Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`.
/// @param up Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`.
/// @param lengthValue Argument 1 supplied to `mq3.compat.numeric.f32`.
/// @param spanWidth Argument 1 supplied to `mq3.compat.numeric.f32`.
/// @param color Value forwarded as `value` to `mq3.renderer.surface_trails.validColor`.
function railCoreRaw(start,finish,up,lengthValue,spanWidth,color)
  if not valid3(start) or not valid3(finish) or not valid3(up) or not validColor(color) then return fail("malformed rail core") end if
  width=numeric.f32(spanWidth);negative=numeric.fneg(width);t=numeric.fdiv(numeric.f32(lengthValue),256.0)
  vertices=[
    vertex(qmath.VectorMA(start,width,up),0.0,0.0,quarterColor(color)),
    vertex(qmath.VectorMA(start,negative,up),0.0,1.0,color),
    vertex(qmath.VectorMA(finish,width,up),t,0.0,color),
    vertex(qmath.VectorMA(finish,negative,up),t,1.0,color)]
  return Submission(vertices,[0,1,2,2,1,3])
end function

/// Computes `makeNormalVectors` from `[right,qmath.CrossProduct(right,forward)]` using `mq3.compat.numeric.fneg`, `mq3.shared.math.DotProduct`, `mq3.shared.math.VectorMA`.
/// @param forward Argument 2 supplied to `mq3.shared.math.DotProduct`.
function makeNormalVectors(forward)
  right=[forward[2],numeric.fneg(forward[0]),forward[1]]
  d=qmath.DotProduct(right,forward);right=qmath.VectorMA(right,numeric.fneg(d),forward);qmath.VectorNormalize(right)
  return [right,qmath.CrossProduct(right,forward)]
end function

// Direct equivalent of DoRailDiscs, retaining its one-segment shortening for
// shots long enough to contain more than one nominal segment.
/// @param numSegments Input tested by `numSegments>1`.
/// @param start Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`.
/// @param direction Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`.
/// @param right Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`.
/// @param up Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`.
/// @param spanWidth Argument 1 supplied to `mq3.compat.numeric.f32`.
/// @param color Value forwarded as `value` to `mq3.renderer.surface_trails.validColor`.
function railDiscs(numSegments,start,direction,right,up,spanWidth,color)
  if numSegments<0 or not valid3(start) or not valid3(direction) or not valid3(right) or not valid3(up) or not validColor(color) then return fail("malformed rail rings") end if
  if numSegments>1 then numSegments=numSegments-1 end if
  if numSegments==0 then return Submission([],[]) end if
  positions=array(4,void);width=numeric.f32(spanWidth);scale=0.25
  for i=0 to 3
    degrees=45+i*90;radians=numeric.fdiv(numeric.fmul(numeric.f32(degrees),numeric.f32(3.14159265358979323846)),180.0)
    c=numeric.f32(trans.cos(radians));s=numeric.f32(trans.sin(radians));v=[]
    for axis=0 to 2 v=v+[numeric.fmul(numeric.fmul(numeric.fadd(numeric.fmul(right[axis],c),numeric.fmul(up[axis],s)),scale),width)] end for
    positions[i]=add(start,v);if numSegments>1 then positions[i]=add(positions[i],direction) end if
  end for
  vertices=[];indexes=[]
  for segment=0 to numSegments-1
    base=len(vertices)
    for j=0 to 3
      u=0.0;if j<2 then u=1.0 end if;v=0.0;if j!=0 and j!=3 then v=1.0 end if
      vertices=vertices+[vertex(positions[j],u,v,color)];positions[j]=add(positions[j],direction)
    end for
    indexes=indexes+[base,base+1,base+3,base+3,base+1,base+2]
  end for
  return Submission(vertices,indexes)
end function

/// Computes `railCore` from `railCoreRaw(start,finish,right,lengthValue,spanWidth,color)` using `mq3.renderer.surface_trails.valid3`, `mq3.renderer.surface_trails.subtract`, `mq3.compat.numeric.trunc32`.
/// @param start Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`.
/// @param finish Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`.
/// @param viewOrigin Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`.
/// @param spanWidth Value forwarded as `spanWidth` to `mq3.renderer.surface_trails.railCoreRaw`.
/// @param color Value forwarded as `color` to `mq3.renderer.surface_trails.railCoreRaw`.
function railCore(start,finish,viewOrigin,spanWidth,color)
  if not valid3(start) or not valid3(finish) or not valid3(viewOrigin) then return fail("malformed rail view") end if
  direction=subtract(finish,start);lengthValue=numeric.trunc32(qmath.VectorNormalize(direction))
  v1=subtract(start,viewOrigin);qmath.VectorNormalize(v1);v2=subtract(finish,viewOrigin);qmath.VectorNormalize(v2)
  right=qmath.CrossProduct(v1,v2);qmath.VectorNormalize(right)
  return railCoreRaw(start,finish,right,lengthValue,spanWidth,color)
end function

/// Computes `ringCount` from `numeric.trunc32(numeric.fdiv(lengthValue,numeric.f32(segmentLength)))` using `mq3.renderer.surface_trails.valid3`, `mq3.renderer.surface_trails.subtract`, `mq3.compat.numeric.trunc32`.
/// @param start Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`.
/// @param finish Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`.
/// @param segmentLength Argument 1 supplied to `mq3.compat.numeric.f32`.
function ringCount(start,finish,segmentLength)
  if not valid3(start) or not valid3(finish) or segmentLength<=0.0 then return fail("invalid rail segment length") end if
  direction=subtract(finish,start);lengthValue=numeric.trunc32(qmath.VectorLength(direction));segments=numeric.trunc32(numeric.fdiv(lengthValue,numeric.f32(segmentLength)))
  if segments<=0 then segments=1 end if;if segments>1 then return segments-1 end if;return segments
end function
/// Computes `railRings` from `railDiscs(segments,start,step,basis[0],basis[1],spanWidth,color)` using `mq3.renderer.surface_trails.valid3`, `mq3.renderer.surface_trails.subtract`, `mq3.compat.numeric.trunc32`.
/// @param start Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`.
/// @param finish Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`.
/// @param segmentLength Argument 1 supplied to `mq3.compat.numeric.f32`.
/// @param spanWidth Value forwarded as `spanWidth` to `mq3.renderer.surface_trails.railDiscs`.
/// @param color Value forwarded as `color` to `mq3.renderer.surface_trails.railDiscs`.
function railRings(start,finish,segmentLength,spanWidth,color)
  if not valid3(start) or not valid3(finish) or segmentLength<=0.0 then return fail("invalid rail rings") end if
  direction=subtract(finish,start);lengthValue=numeric.trunc32(qmath.VectorNormalize(direction));basis=makeNormalVectors(direction)
  segments=numeric.trunc32(numeric.fdiv(lengthValue,numeric.f32(segmentLength)));if segments<=0 then segments=1 end if
  step=qmath.VectorScale(direction,numeric.f32(segmentLength))
  return railDiscs(segments,start,step,basis[0],basis[1],spanWidth,color)
end function

/// Builds `temporary[position]` in `mq3.renderer.surface_trails.perpendicularVector`; returns `result`.
/// @param source Argument 1 supplied to `mq3.shared.math.DotProduct`.
function perpendicularVector(source)
  position=0;minimum=1.0
  for i=0 to 2 value=source[i];if value<0.0 then value=numeric.fneg(value) end if;if value<minimum then position=i;minimum=value end if end for
  temporary=[0.0,0.0,0.0];temporary[position]=1.0
  inverse=numeric.fdiv(1.0,qmath.DotProduct(source,source));d=numeric.fmul(qmath.DotProduct(temporary,source),inverse)
  result=qmath.VectorMA(temporary,numeric.fneg(d),source);qmath.VectorNormalize(result);return result
end function
/// Builds `result[i]` in `mq3.renderer.surface_trails.matrixMultiply`; returns `result`.
/// @param a Nested indexed data; outer entries read at `i`.
/// @param b Nested indexed data; outer entries read at `0`, `1`, `2`.
function matrixMultiply(a,b)
  result=array(3,void)
  for i=0 to 2 row=[];for j=0 to 2 row=row+[numeric.fadd(numeric.fadd(numeric.fmul(a[i][0],b[0][j]),numeric.fmul(a[i][1],b[1][j])),numeric.fmul(a[i][2],b[2][j]))] end for;result[i]=row end for
  return result
end function
/// Builds an orthogonal basis and rotates a point around the supplied direction by an angle in degrees.
/// @param direction Value forwarded as `source` to `mq3.renderer.surface_trails.perpendicularVector`.
/// @param point Three-component vector read at indices 0, 1, and 2.
/// @param degrees Argument 1 supplied to `mq3.compat.numeric.f32`.
function rotateAroundVector(direction,point,degrees)
  vr=perpendicularVector(direction);vup=qmath.CrossProduct(vr,direction)
  matrix=[[vr[0],vup[0],direction[0]],[vr[1],vup[1],direction[1]],[vr[2],vup[2],direction[2]]]
  inverse=[[matrix[0][0],matrix[1][0],matrix[2][0]],[matrix[0][1],matrix[1][1],matrix[2][1]],[matrix[0][2],matrix[1][2],matrix[2][2]]]
  radians=numeric.fdiv(numeric.fmul(numeric.f32(degrees),numeric.f32(3.14159265358979323846)),180.0);c=numeric.f32(trans.cos(radians));s=numeric.f32(trans.sin(radians))
  z=[[c,s,0.0],[numeric.fneg(s),c,0.0],[0.0,0.0,1.0]];rotation=matrixMultiply(matrixMultiply(matrix,z),inverse);result=[]
  for i=0 to 2 result=result+[numeric.fadd(numeric.fadd(numeric.fmul(rotation[i][0],point[0]),numeric.fmul(rotation[i][1],point[1])),numeric.fmul(rotation[i][2],point[2]))] end for
  return result
end function
/// Builds `mq3.renderer.surface_trails.Submission` using `mq3.shared.math.VectorNormalize`.
/// @param start Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`.
/// @param finish Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`.
/// @param viewOrigin Value forwarded as `value` to `mq3.renderer.surface_trails.valid3`.
/// @param color Value forwarded as `color` to `mq3.renderer.surface_trails.railCoreRaw`.
function lightning(start,finish,viewOrigin,color)
  if not valid3(start) or not valid3(finish) or not valid3(viewOrigin) then return fail("malformed lightning") end if
  direction=subtract(finish,start);lengthValue=numeric.trunc32(qmath.VectorNormalize(direction))
  v1=subtract(start,viewOrigin);qmath.VectorNormalize(v1);v2=subtract(finish,viewOrigin);qmath.VectorNormalize(v2);right=qmath.CrossProduct(v1,v2);qmath.VectorNormalize(right)
  vertices=[];indexes=[]
  for i=0 to 3
    core=railCoreRaw(start,finish,right,lengthValue,8.0,color);base=len(vertices);vertices=vertices+core.vertices
    for each index in core.indexes indexes=indexes+[base+index] end for
    right=rotateAroundVector(direction,right,45.0)
  end for
  return Submission(vertices,indexes)
end function
