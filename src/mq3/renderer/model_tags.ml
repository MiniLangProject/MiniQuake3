// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// MD3 tag interpolation and model bounds from renderer/tr_model.c.
package mq3.renderer.model_tags

import mq3.compat.numeric as numeric
import mq3.shared.math as qmath

struct Tag name origin axis end struct
struct Md3 frames bounds end struct
struct Model brushBounds md3 end struct
struct Orientation found origin axis end struct

function tag(name,origin,axis)
  return Tag(name,origin,axis)
end function

function md3(frames,mins,maxs)
  return Md3(frames,[mins,maxs])
end function

function model(brushBounds,md3Value)
  return Model(brushBounds,md3Value)
end function

function identityAxis()
  return [[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]]
end function

function validVector(value)
  return value!=void and len(value)==3
end function

function validAxis(value)
  return value!=void and len(value)==3 and validVector(value[0]) and validVector(value[1]) and validVector(value[2])
end function

function validateTag(value)
  if value==void or value.name==void or not validVector(value.origin) or not validAxis(value.axis) then return error(7420,"malformed MD3 tag") end if
  return true
end function

// R_GetTag accepts transiently oversized animation frames and clamps them to
// the final model frame while model switches settle.
function getTag(md3Value,frame,name)
  if md3Value==void or md3Value.frames==void or len(md3Value.frames)<1 then return void end if
  if frame<0 then return error(7421,"negative MD3 tag frame") end if
  if frame>=len(md3Value.frames) then frame=len(md3Value.frames)-1 end if
  entries=md3Value.frames[frame]
  if entries==void then return error(7422,"missing MD3 tag frame") end if
  for i=0 to len(entries)-1
    valid=validateTag(entries[i]);if valid is error then return valid end if
    if entries[i].name==name then return entries[i] end if
  end for
  return void
end function

function normalize(value)
  copy=[numeric.f32(value[0]),numeric.f32(value[1]),numeric.f32(value[2])]
  qmath.VectorNormalize(copy)
  return copy
end function

function missingOrientation()
  return Orientation(false,[0.0,0.0,0.0],identityAxis())
end function

// R_LerpTag uses frac for the end tag and (1-frac) for the start tag, then
// normalizes every interpolated basis vector independently.
function lerpTag(modelValue,startFrame,endFrame,frac,name)
  if modelValue==void or modelValue.md3==void then return missingOrientation() end if
  start=getTag(modelValue.md3,startFrame,name);if start is error then return start end if
  finish=getTag(modelValue.md3,endFrame,name);if finish is error then return finish end if
  if start==void or finish==void then return missingOrientation() end if
  front=numeric.f32(frac);back=numeric.fsub(1.0,front)
  origin=[];axis=[]
  for i=0 to 2
    origin=origin+[numeric.fadd(numeric.fmul(start.origin[i],back),numeric.fmul(finish.origin[i],front))]
  end for
  for row=0 to 2
    blended=[]
    for i=0 to 2
      blended=blended+[numeric.fadd(numeric.fmul(start.axis[row][i],back),numeric.fmul(finish.axis[row][i],front))]
    end for
    axis=axis+[normalize(blended)]
  end for
  return Orientation(true,origin,axis)
end function

function modelBounds(modelValue)
  if modelValue==void then return [[0.0,0.0,0.0],[0.0,0.0,0.0]] end if
  if modelValue.brushBounds!=void then
    if len(modelValue.brushBounds)!=2 or not validVector(modelValue.brushBounds[0]) or not validVector(modelValue.brushBounds[1]) then return error(7423,"malformed brush-model bounds") end if
    return [[modelValue.brushBounds[0][0],modelValue.brushBounds[0][1],modelValue.brushBounds[0][2]],[modelValue.brushBounds[1][0],modelValue.brushBounds[1][1],modelValue.brushBounds[1][2]]]
  end if
  if modelValue.md3==void then return [[0.0,0.0,0.0],[0.0,0.0,0.0]] end if
  bounds=modelValue.md3.bounds
  if bounds==void or len(bounds)!=2 or not validVector(bounds[0]) or not validVector(bounds[1]) then return error(7424,"malformed MD3 bounds") end if
  return [[bounds[0][0],bounds[0][1],bounds[0][2]],[bounds[1][0],bounds[1][1],bounds[1][2]]]
end function
