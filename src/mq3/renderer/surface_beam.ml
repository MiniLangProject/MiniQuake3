// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Immediate-mode RT_BEAM prism expansion from renderer/tr_surface.c.
package mq3.renderer.surface_beam

import mq3.compat.numeric as numeric
import mq3.shared.math as qmath
import mq3.renderer.surface_trails as trails

/// Data record for `mq3.renderer.surface_beam.Vertex`; groups `xyz`, `uv`, `color`.
struct Vertex
  /// Three-dimensional position of this vertex.
  xyz
  /// Texture coordinates associated with this vertex.
  uv
  /// Modulation color of a generated beam vertex.
  color
end struct
/// Data record for `mq3.renderer.surface_beam.Submission`; groups `vertices`, `indexes`.
struct Submission
  /// Generated vertex records forming the beam's visible sides.
  vertices
  /// Triangle indices joining the generated beam vertices.
  indexes
end struct

/// Creates error `7699` with message `"surface beam: "+message`.
/// @param message Input used in the result expression `error(7699,"surface beam: "+message)`.
function fail(message) return error(7699,"surface beam: "+message) end function
/// Computes `value!=void and len(value)==3` for `mq3.renderer.surface_beam.valid3`.
/// @param value Input used in the result expression `value!=void and len(value)==3`.
function valid3(value) return value!=void and len(value)==3 end function
/// Returns `[numeric.fsub(a[0],b[0]),numeric.fsub(a[1],b[1]),numeric.fsub(a[2],b[2])]` for `mq3.renderer.surface_beam.subtract`.
/// @param a Three-component vector read at indices 0, 1, and 2.
/// @param b Three-component vector read at indices 0, 1, and 2.
function subtract(a,b) return [numeric.fsub(a[0],b[0]),numeric.fsub(a[1],b[1]),numeric.fsub(a[2],b[2])] end function
/// Returns `[numeric.fadd(a[0],b[0]),numeric.fadd(a[1],b[1]),numeric.fadd(a[2],b[2])]` for `mq3.renderer.surface_beam.add`.
/// @param a Three-component vector read at indices 0, 1, and 2.
/// @param b Three-component vector read at indices 0, 1, and 2.
function add(a,b) return [numeric.fadd(a[0],b[0]),numeric.fadd(a[1],b[1]),numeric.fadd(a[2],b[2])] end function

// Baseq3 emits a closed six-sided triangle strip through immediate OpenGL.
// Positions intentionally remain relative to zero because R_RotateForEntity
// uses the world orientation for every non-model entity.
/// @param origin Value forwarded as `value` to `mq3.renderer.surface_beam.valid3`.
/// @param oldOrigin Value forwarded as `value` to `mq3.renderer.surface_beam.valid3`.
function build(origin,oldOrigin)
  if not valid3(origin) or not valid3(oldOrigin) then return fail("beam endpoints need three components") end if
  direction=subtract(oldOrigin,origin);normalized=[direction[0],direction[1],direction[2]]
  if qmath.VectorNormalize(normalized)==0.0 then return Submission([],[]) end if
  perpendicular=trails.perpendicularVector(normalized);perpendicular=qmath.VectorScale(perpendicular,4.0)
  starts=array(6,void);finishes=array(6,void)
  for i=0 to 5 starts[i]=trails.rotateAroundVector(normalized,perpendicular,60.0*i);finishes[i]=add(starts[i],direction) end for
  vertices=array(14,void);color=[255,0,0,255]
  for i=0 to 6 source=i%6;vertices[i*2]=Vertex(starts[source],[0.0,0.0],color);vertices[i*2+1]=Vertex(finishes[source],[1.0,0.0],color) end for
  indexes=[]
  for i=0 to 11 if (i&1)==0 then indexes=indexes+[i,i+1,i+2] else indexes=indexes+[i+1,i,i+2] end if end for
  return Submission(vertices,indexes)
end function
