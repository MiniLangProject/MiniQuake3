// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CPU-side MD3 vertex interpolation and mesh submission from renderer/tr_surface.c.
package mq3.renderer.surface_md3

import mq3.compat.numeric as numeric
import mq3.compat.transcendental as trans
import mq3.shared.math as qmath
import mq3.renderer.native_md3 as nativeMd3

const MD3_XYZ_SCALE=0.015625
const FUNCTABLE_SIZE=1024
const FUNCTABLE_MASK=1023

struct PackedVertex xyz packedNormal end struct
struct MeshSurface numFrames numVerts numTriangles triangles texCoords frames packedFrames end struct
struct Submission xyz normals texCoords indexes baseVertex baseIndex numVertexes numIndexes flushed dlightBits touchesDlights end struct

function vertex(x,y,z,packedNormal)
  return PackedVertex([numeric.i16(x),numeric.i16(y),numeric.i16(z)],packedNormal&0xffff)
end function

function surface(numFrames,numVerts,numTriangles,triangles,texCoords,frames)
  return MeshSurface(numFrames,numVerts,numTriangles,triangles,texCoords,frames,array(numFrames,void))
end function

function packedFrame(value,frame)
  if value.packedFrames[frame]!=void then return value.packedFrames[frame] end if
  result=bytes(value.numVerts*8,0)
  for index=0 to value.numVerts-1
    source=value.frames[frame][index];at=index*8
    for axis=0 to 2 number=source.xyz[axis];result[at+axis*2]=number&255;result[at+axis*2+1]=(number>>8)&255 end for
    result[at+6]=source.packedNormal&255;result[at+7]=(source.packedNormal>>8)&255
  end for
  value.packedFrames[frame]=result;return result
end function
// Reference access to a packed-only asset is intentionally transient. Never
// populate every visited .frames slot over a long match: native rendering uses
// packedFrames directly, while legacy load/surface frames remain unchanged.
function frameVertices(value,frame)
  if frame<0 or frame>=value.numFrames then return error(7359,"MD3 frame index out of range") end if
  if value.frames[frame]!=void then return value.frames[frame] end if
  data=value.packedFrames[frame]
  if data==void or typeof(data)!="bytes" or len(data)!=value.numVerts*8 then return error(7357,"MD3 frame vertex count mismatch") end if
  decoded=array(value.numVerts,void)
  for index=0 to value.numVerts-1
    at=index*8;decoded[index]=vertex(data[at]|(data[at+1]<<8),data[at+2]|(data[at+3]<<8),data[at+4]|(data[at+5]<<8),data[at+6]|(data[at+7]<<8))
  end for
  return decoded
end function
function lerpVertexesPacked(value,frame,oldFrame,backlerp,table)
  if frame<0 or frame>=value.numFrames or oldFrame<0 or oldFrame>=value.numFrames then return error(7359,"MD3 frame index out of range") end if
  if backlerp<0.0 or backlerp>1.0 then return error(7360,"MD3 backlerp outside zero to one") end if
  fresh=packedFrame(value,frame);old=packedFrame(value,oldFrame);return nativeMd3.lerp(fresh,old,table,value.numVerts,backlerp)
end function

function valid3(value) return value!=void and len(value)==3 end function
function validate(value)
  if value==void or value.numFrames<1 then return error(7350,"MD3 surface needs at least one frame") end if
  if value.numVerts<1 or value.numTriangles<0 then return error(7351,"invalid MD3 surface counts") end if
  if value.triangles==void or len(value.triangles)!=value.numTriangles*3 then return error(7352,"MD3 triangle count mismatch") end if
  if value.texCoords==void or len(value.texCoords)!=value.numVerts then return error(7353,"MD3 texture-coordinate count mismatch") end if
  if value.frames==void or len(value.frames)!=value.numFrames then return error(7354,"MD3 frame count mismatch") end if
  for i=0 to len(value.triangles)-1
    if value.triangles[i]<0 or value.triangles[i]>=value.numVerts then return error(7355,"MD3 triangle index out of range") end if
  end for
  for i=0 to value.numVerts-1
    if value.texCoords[i]==void or len(value.texCoords[i])!=2 then return error(7356,"malformed MD3 texture coordinate") end if
  end for
  for frame=0 to value.numFrames-1
    if value.frames[frame]==void then
      if value.packedFrames==void or len(value.packedFrames)!=value.numFrames then return error(7357,"MD3 frame vertex count mismatch") end if
      data=value.packedFrames[frame];if data==void or typeof(data)!="bytes" or len(data)!=value.numVerts*8 then return error(7357,"MD3 frame vertex count mismatch") end if
      continue
    end if
    if len(value.frames[frame])!=value.numVerts then return error(7357,"MD3 frame vertex count mismatch") end if
    for i=0 to value.numVerts-1
      v=value.frames[frame][i]
      if v==void or not valid3(v.xyz) then return error(7358,"malformed MD3 packed vertex") end if
    end for
  end for
  return true
end function

// R_Init builds this 1024-entry table with a 1023 divisor. Preserve the float
// operation before the double-precision angle and the final binary32 store.
function tableValue(index)
  step=numeric.fdiv(numeric.fmul(index&FUNCTABLE_MASK,360.0),1023.0)
  return numeric.f32(trans.sin(step*3.14159265358979323846/180.0))
end function

function decodeNormal(packed)
  bits=packed&0xffff
  lat=((bits>>8)&255)*4;lng=(bits&255)*4
  return [numeric.fmul(tableValue(lat+256),tableValue(lng)),numeric.fmul(tableValue(lat),tableValue(lng)),tableValue(lng+256)]
end function
function normalTable()
  result=array(FUNCTABLE_SIZE,0.0);for index=0 to FUNCTABLE_SIZE-1 result[index]=tableValue(index) end for;return result
end function
function decodeNormalCached(packed,table)
  if table==void or len(table)!=FUNCTABLE_SIZE then return decodeNormal(packed) end if
  bits=packed&0xffff;lat=((bits>>8)&255)*4;lng=(bits&255)*4
  return [numeric.fmul(table[(lat+256)&FUNCTABLE_MASK],table[lng&FUNCTABLE_MASK]),numeric.fmul(table[lat&FUNCTABLE_MASK],table[lng&FUNCTABLE_MASK]),table[(lng+256)&FUNCTABLE_MASK]]
end function

function normalizeFast(value)
  inverse=qmath.Q_rsqrt(qmath.DotProduct(value,value))
  return [numeric.fmul(value[0],inverse),numeric.fmul(value[1],inverse),numeric.fmul(value[2],inverse)]
end function

// LerpMeshVertexes selects the new frame directly when backlerp is zero. With
// interpolation it blends decoded normals and applies Quake's Q_rsqrt pass.
function lerpVertexesCached(value,frame,oldFrame,backlerp,table)
  if frame<0 or frame>=value.numFrames or oldFrame<0 or oldFrame>=value.numFrames then return error(7359,"MD3 frame index out of range") end if
  backlerp=numeric.f32(backlerp)
  if backlerp<0.0 or backlerp>1.0 then return error(7360,"MD3 backlerp outside zero to one") end if
  freshFrame=frameVertices(value,frame);if freshFrame is error then return freshFrame end if
  xyz=array(value.numVerts,void);normals=array(value.numVerts,void)
  newScale=numeric.fmul(MD3_XYZ_SCALE,numeric.fsub(1.0,backlerp))
  if backlerp==0.0 then
    for i=0 to value.numVerts-1
      current=freshFrame[i]
      xyz[i]=[numeric.fmul(current.xyz[0],newScale),numeric.fmul(current.xyz[1],newScale),numeric.fmul(current.xyz[2],newScale)]
      normals[i]=decodeNormalCached(current.packedNormal,table)
    end for
    return [xyz,normals]
  end if
  oldScale=numeric.fmul(MD3_XYZ_SCALE,backlerp)
  oldNormalScale=backlerp;newNormalScale=numeric.fsub(1.0,backlerp)
  oldFrameVertices=freshFrame;if frame!=oldFrame then oldFrameVertices=frameVertices(value,oldFrame);if oldFrameVertices is error then return oldFrameVertices end if end if
  for i=0 to value.numVerts-1
    fresh=freshFrame[i];old=oldFrameVertices[i]
    xyz[i]=[
      numeric.fadd(numeric.fmul(old.xyz[0],oldScale),numeric.fmul(fresh.xyz[0],newScale)),
      numeric.fadd(numeric.fmul(old.xyz[1],oldScale),numeric.fmul(fresh.xyz[1],newScale)),
      numeric.fadd(numeric.fmul(old.xyz[2],oldScale),numeric.fmul(fresh.xyz[2],newScale))]
    a=decodeNormalCached(old.packedNormal,table);b=decodeNormalCached(fresh.packedNormal,table)
    blended=[numeric.fadd(numeric.fmul(a[0],oldNormalScale),numeric.fmul(b[0],newNormalScale)),numeric.fadd(numeric.fmul(a[1],oldNormalScale),numeric.fmul(b[1],newNormalScale)),numeric.fadd(numeric.fmul(a[2],oldNormalScale),numeric.fmul(b[2],newNormalScale))]
    normals[i]=normalizeFast(blended)
  end for
  return [xyz,normals]
end function
function lerpVertexesTrusted(value,frame,oldFrame,backlerp) return lerpVertexesCached(value,frame,oldFrame,backlerp,void) end function
function lerpVertexes(value,frame,oldFrame,backlerp)
  valid=validate(value);if valid is error then return valid end if
  return lerpVertexesTrusted(value,frame,oldFrame,backlerp)
end function

// RB_CHECKOVERFLOW ends the current tessellation before this surface when the
// combined counts exceed capacity. MD3 submission itself does not alter lights.
function submit(value,frame,oldFrame,backlerp,currentVertexes,currentIndexes,maxVertexes,maxIndexes,dlightBits)
  valid=validate(value);if valid is error then return valid end if
  if currentVertexes<0 or currentIndexes<0 or maxVertexes<1 or maxIndexes<1 then return error(7361,"invalid tessellation counts") end if
  neededIndexes=value.numTriangles*3
  if value.numVerts>=maxVertexes or neededIndexes>=maxIndexes then return error(7362,"MD3 surface exceeds tessellation capacity") end if
  flushed=currentVertexes+value.numVerts>=maxVertexes or currentIndexes+neededIndexes>=maxIndexes
  baseVertex=currentVertexes;baseIndex=currentIndexes
  if flushed then baseVertex=0;baseIndex=0 end if
  effectiveBacklerp=backlerp
  if oldFrame==frame then effectiveBacklerp=0.0 end if
  lerped=lerpVertexes(value,frame,oldFrame,effectiveBacklerp);if lerped is error then return lerped end if
  indexes=[]
  for i=0 to neededIndexes-1
    indexes=indexes+[baseVertex+value.triangles[i]]
  end for
  texCoords=[]
  for i=0 to value.numVerts-1
    texCoords=texCoords+[[numeric.f32(value.texCoords[i][0]),numeric.f32(value.texCoords[i][1])]]
  end for
  outputDlightBits=dlightBits;if flushed then outputDlightBits=0 end if
  return Submission(lerped[0],lerped[1],texCoords,indexes,baseVertex,baseIndex,baseVertex+value.numVerts,baseIndex+neededIndexes,flushed,outputDlightBits,false)
end function
