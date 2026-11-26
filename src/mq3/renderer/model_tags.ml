// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// MD3 tag interpolation and model bounds from renderer/tr_model.c.
package mq3.renderer.model_tags

import mq3.compat.numeric as numeric
import mq3.shared.math as qmath

/// Data record for `mq3.renderer.model_tags.Tag`; groups `name`, `origin`, `axis`.
struct Tag name origin axis end struct
/// Data record for `mq3.renderer.model_tags.Md3`; groups `frames`, `bounds`.
struct Md3 frames bounds end struct
/// Data record for `mq3.renderer.model_tags.Model`; groups `brushBounds`, `md3`.
struct Model brushBounds md3 end struct
/// Data record for `mq3.renderer.model_tags.Orientation`; groups `found`, `origin`, `axis`.
struct Orientation found origin axis end struct

/// Constructs `mq3.renderer.model_tags.Tag` from `name`, `origin`, `axis`.
/// @param name Initial value for `mq3.renderer.model_tags.Tag.name`.
/// @param origin Initial value for `mq3.renderer.model_tags.Tag.origin`.
/// @param axis Initial value for `mq3.renderer.model_tags.Tag.axis`.
function tag(name,origin,axis)
  return Tag(name,origin,axis)
end function

/// Constructs `mq3.renderer.model_tags.Md3` with `bounds` = `[mins,maxs]` and the supplied remaining values.
/// @param frames Initial value for `mq3.renderer.model_tags.Md3.frames`.
/// @param mins Input used in the result expression `Md3(frames,[mins,maxs])`.
/// @param maxs Input used in the result expression `Md3(frames,[mins,maxs])`.
function md3(frames,mins,maxs)
  return Md3(frames,[mins,maxs])
end function

/// Constructs `mq3.renderer.model_tags.Model` from `brushBounds`, `md3Value`.
/// @param brushBounds Initial value for `mq3.renderer.model_tags.Model.brushBounds`.
/// @param md3Value Initial value for `mq3.renderer.model_tags.Model.md3`.
function model(brushBounds,md3Value)
  return Model(brushBounds,md3Value)
end function

/// Returns `[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]]` for `mq3.renderer.model_tags.identityAxis`.
function identityAxis()
  return [[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]]
end function

/// Computes `value!=void and len(value)==3` for `mq3.renderer.model_tags.validVector`.
/// @param value Input used in the result expression `value!=void and len(value)==3`.
function validVector(value)
  return value!=void and len(value)==3
end function

/// Computes `value!=void and len(value)==3 and validVector(value[0]) and validVector(value[1]) and validVector(value[2])` for `mq3.renderer.model_tags.validAxis`.
/// @param value Three-component vector read at indices 0, 1, and 2.
function validAxis(value)
  return value!=void and len(value)==3 and validVector(value[0]) and validVector(value[1]) and validVector(value[2])
end function

/// Returns `true` from `mq3.renderer.model_tags.validateTag`; earlier branches return `error(7420,"malformed MD3 tag")`.
/// @param value Record providing `value.name`, `value.origin`, `value.axis`.
function validateTag(value)
  if value==void or value.name==void or not validVector(value.origin) or not validAxis(value.axis) then return error(7420,"malformed MD3 tag") end if
  return true
end function

// R_GetTag accepts transiently oversized animation frames and clamps them to
// the final model frame while model switches settle.
/// @param md3Value Record providing `md3Value.frames`.
/// @param frame Input tested by `frame<0`.
/// @param name Input tested by `entries[i].name==name`.
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

/// Returns `copy` from `mq3.renderer.model_tags.normalize`.
/// @param value Three-component vector read at indices 0, 1, and 2.
function normalize(value)
  copy=[numeric.f32(value[0]),numeric.f32(value[1]),numeric.f32(value[2])]
  qmath.VectorNormalize(copy)
  return copy
end function

/// Constructs `mq3.renderer.model_tags.Orientation` with `found` = `false`, `origin` = `[0.0,0.0,0.0]`, `axis` = `identityAxis()`.
function missingOrientation()
  return Orientation(false,[0.0,0.0,0.0],identityAxis())
end function

// R_LerpTag uses frac for the end tag and (1-frac) for the start tag, then
// normalizes every interpolated basis vector independently.
/// @param modelValue Record providing `modelValue.md3`.
/// @param startFrame Value forwarded as `frame` to `mq3.renderer.model_tags.getTag`.
/// @param endFrame Value forwarded as `frame` to `mq3.renderer.model_tags.getTag`.
/// @param frac Argument 1 supplied to `mq3.compat.numeric.f32`.
/// @param name Value forwarded as `name` to `mq3.renderer.model_tags.getTag`.
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

/// Computes `modelBounds` from `[[bounds[0][0],bounds[0][1],bounds[0][2]],[bounds[1][0],bounds[1][1],bounds[1][2]]]` using `mq3.renderer.model_tags.validVector`.
/// @param modelValue Record providing `modelValue.brushBounds`, `modelValue.md3`.
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
