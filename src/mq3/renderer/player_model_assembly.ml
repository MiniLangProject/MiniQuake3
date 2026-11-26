// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Renderer-neutral assembly of Quake III lower/upper/head MD3 player models.
package mq3.renderer.player_model_assembly

import mq3.compat.numeric as numeric
import mq3.format.md3 as md3
import mq3.renderer.model_tags as modelTags
import mq3.renderer.view_math as viewMath

const LOWER_PART=0
const UPPER_PART=1
const HEAD_PART=2

/// Data record for `mq3.renderer.player_model_assembly.Animation`; groups `frame`, `oldFrame`, `backlerp`.
struct Animation frame oldFrame backlerp end struct
/// Data record for `mq3.renderer.player_model_assembly.Transform`; groups `origin`, `axis`.
struct Transform origin axis end struct
/// Data record for `mq3.renderer.player_model_assembly.Models`; groups `lower`, `upper`, `head`.
struct Models lower upper head end struct
/// Data record for `mq3.renderer.player_model_assembly.Part`; groups `kind`, `name`, `model`, `animation`, `transform`.
struct Part kind name model animation transform end struct
/// Data record for `mq3.renderer.player_model_assembly.Assembly`; groups `lower`, `upper`, `head`.
struct Assembly lower upper head end struct
/// Data record for `mq3.renderer.player_model_assembly.Triangle`; groups `positions`, `texCoords`, `normals`, `part`, `surfaceIndex`, `shaderName`.
struct Triangle positions texCoords normals part surfaceIndex shaderName end struct

/// Creates error `7520` with message `"player model assembly: "+message`.
/// @param message Input used in the result expression `error(7520,"player model assembly: "+message)`.
function fail(message) return error(7520,"player model assembly: "+message) end function

/// Constructs `mq3.renderer.player_model_assembly.Animation` with `backlerp` = `numeric.f32(backlerp)` and the supplied remaining values.
/// @param frame Initial value for `mq3.renderer.player_model_assembly.Animation.frame`.
/// @param oldFrame Initial value for `mq3.renderer.player_model_assembly.Animation.oldFrame`.
/// @param backlerp Argument 1 supplied to `mq3.compat.numeric.f32`.
function animation(frame,oldFrame,backlerp)
  return Animation(frame,oldFrame,numeric.f32(backlerp))
end function

/// Returns `[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]]` for `mq3.renderer.player_model_assembly.identityAxis`.
function identityAxis()
  return [[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]]
end function

/// Constructs `mq3.renderer.player_model_assembly.Transform` from `origin`, `axis`.
/// @param origin Initial value for `mq3.renderer.player_model_assembly.Transform.origin`.
/// @param axis Initial value for `mq3.renderer.player_model_assembly.Transform.axis`.
function transform(origin,axis) return Transform(origin,axis) end function
/// Constructs `mq3.renderer.player_model_assembly.Transform` with `origin` = `[0.0,0.0,0.0]`, `axis` = `identityAxis()`.
function identityTransform() return Transform([0.0,0.0,0.0],identityAxis()) end function
/// Constructs `mq3.renderer.player_model_assembly.Models` from `lower`, `upper`, `head`.
/// @param lower Initial value for `mq3.renderer.player_model_assembly.Models.lower`.
/// @param upper Initial value for `mq3.renderer.player_model_assembly.Models.upper`.
/// @param head Initial value for `mq3.renderer.player_model_assembly.Models.head`.
function models(lower,upper,head) return Models(lower,upper,head) end function

// Loads the three conventional player-model pieces without taking ownership of
// an archive or filesystem. This keeps asset lookup policy outside the renderer.
/// @param lowerData Argument 1 supplied to `mq3.format.md3.load`.
/// @param upperData Argument 1 supplied to `mq3.format.md3.load`.
/// @param headData Argument 1 supplied to `mq3.format.md3.load`.
function load(lowerData,upperData,headData)
  lower=md3.load(lowerData);if lower is error then return lower end if
  upper=md3.load(upperData);if upper is error then return upper end if
  head=md3.load(headData);if head is error then return head end if
  return Models(lower,upper,head)
end function

/// Computes `value!=void and len(value)==3` for `mq3.renderer.player_model_assembly.valid3`.
/// @param value Input used in the result expression `value!=void and len(value)==3`.
function valid3(value) return value!=void and len(value)==3 end function
/// Requires a three-component origin and three valid three-component transform axes.
/// @param value Record providing `value.origin`, `value.axis`.
function validateTransform(value)
  if value==void or not valid3(value.origin) or value.axis==void or len(value.axis)!=3 then return fail("malformed transform") end if
  for row=0 to 2 if not valid3(value.axis[row]) then return fail("malformed transform axis") end if end for
  return true
end function

/// Checks current/previous animation frames against the model and bounds backlerp to zero through one.
/// @param model Record providing `model.numFrames`.
/// @param anim Record providing `anim.frame`, `anim.oldFrame`, `anim.backlerp`.
function validateAnimation(model,anim)
  if model==void or model.numFrames<1 then return fail("model has no animation frames") end if
  if anim==void then return fail("missing animation") end if
  if anim.frame<0 or anim.frame>=model.numFrames or anim.oldFrame<0 or anim.oldFrame>=model.numFrames then return fail("animation frame outside model") end if
  if anim.backlerp<0.0 or anim.backlerp>1.0 then return fail("backlerp outside zero to one") end if
  return true
end function

/// Multiplies two 3-by-3 orientation matrices using the compatibility float arithmetic operations.
/// @param left Nested indexed data; outer entries read at `row`.
/// @param right Nested indexed data; outer entries read at `0`, `1`, `2`.
function multiplyAxis(left,right)
  result=[]
  for row=0 to 2
    output=[]
    for column=0 to 2
      value=numeric.fadd(numeric.fadd(numeric.fmul(left[row][0],right[0][column]),numeric.fmul(left[row][1],right[1][column])),numeric.fmul(left[row][2],right[2][column]))
      output=output+[value]
    end for
    result=result+[output]
  end for
  return result
end function

// Equivalent to the identity-local-axis case of
// CG_PositionRotatedEntityOnTag: tag.axis * parent.axis.
/// @param parent Record providing `parent.axis`.
/// @param orientation Record providing `orientation.found`, `orientation.origin`, `orientation.axis`.
function attach(parent,orientation)
  valid=validateTransform(parent);if valid is error then return valid end if
  if orientation==void or not orientation.found then return fail("required attachment tag missing") end if
  tagTransform=Transform(orientation.origin,orientation.axis)
  valid=validateTransform(tagTransform);if valid is error then return valid end if
  origin=viewMath.localPointToWorld(orientation.origin,parent);if origin is error then return origin end if
  return Transform(origin,multiplyAxis(orientation.axis,parent.axis))
end function

/// Computes `tagOrientation` from `modelTags.lerpTag(wrapped,anim.oldFrame,anim.frame,numeric.fsub(1.0,anim.backlerp),name)` using `mq3.renderer.model_tags.md3`, `mq3.renderer.model_tags.model`, `mq3.renderer.model_tags.lerpTag`.
/// @param model Record providing `model.tags`, `model.bounds`.
/// @param anim Record providing `anim.oldFrame`, `anim.frame`, `anim.backlerp`.
/// @param name Argument 5 supplied to `mq3.renderer.model_tags.lerpTag`.
function tagOrientation(model,anim,name)
  tagModel=modelTags.md3(model.tags,model.bounds[0],model.bounds[1])
  wrapped=modelTags.model(void,tagModel)
  // R_LerpTag receives oldframe, frame and 1-backlerp.
  return modelTags.lerpTag(wrapped,anim.oldFrame,anim.frame,numeric.fsub(1.0,anim.backlerp),name)
end function

// Builds the hierarchy lower -> tag_torso -> upper -> tag_head -> head.
// The root transform places the complete player in the caller's model space.
/// @param value Record providing `value.lower`, `value.upper`, `value.head`.
/// @param lowerAnimation Value forwarded as `anim` to `mq3.renderer.player_model_assembly.validateAnimation`.
/// @param upperAnimation Value forwarded as `anim` to `mq3.renderer.player_model_assembly.validateAnimation`.
/// @param headAnimation Value forwarded as `anim` to `mq3.renderer.player_model_assembly.validateAnimation`.
/// @param root Value forwarded as `value` to `mq3.renderer.player_model_assembly.validateTransform`.
function assemble(value,lowerAnimation,upperAnimation,headAnimation,root)
  if value==void or value.lower==void or value.upper==void or value.head==void then return fail("three MD3 model pieces required") end if
  valid=validateTransform(root);if valid is error then return valid end if
  valid=validateAnimation(value.lower,lowerAnimation);if valid is error then return valid end if
  valid=validateAnimation(value.upper,upperAnimation);if valid is error then return valid end if
  valid=validateAnimation(value.head,headAnimation);if valid is error then return valid end if
  torsoTag=tagOrientation(value.lower,lowerAnimation,"tag_torso");if torsoTag is error then return torsoTag end if
  upperTransform=attach(root,torsoTag);if upperTransform is error then return upperTransform end if
  headTag=tagOrientation(value.upper,upperAnimation,"tag_head");if headTag is error then return headTag end if
  headTransform=attach(upperTransform,headTag);if headTransform is error then return headTransform end if
  lowerPart=Part(LOWER_PART,"lower",value.lower,lowerAnimation,root)
  upperPart=Part(UPPER_PART,"upper",value.upper,upperAnimation,upperTransform)
  headPart=Part(HEAD_PART,"head",value.head,headAnimation,headTransform)
  return Assembly(lowerPart,upperPart,headPart)
end function

// CG_AddPlayerWeapon attaches the weapon model to the animated torso rather
// than to the player root. Keep this transform renderer-neutral so view and
// world weapon models share the same item-model path.
/// @param value Record providing `value.upper`.
/// @param name Value forwarded as `name` to `mq3.renderer.player_model_assembly.tagOrientation`.
function upperAttachment(value,name)
  if value==void or value.upper==void or name=="" then return fail("upper attachment needs an assembled player and tag name") end if
  orientation=tagOrientation(value.upper.model,value.upper.animation,name);if orientation is error then return orientation end if
  return attach(value.upper.transform,orientation)
end function

/// Builds `mq3.renderer.player_model_assembly.Triangle` using `mq3.renderer.view_math.localPointToWorld`, `mq3.renderer.view_math.localNormalToWorld`.
/// @param source Record providing `source.positions`, `source.normals`, `source.texCoords`, `source.surfaceIndex`, `source.shaderName`.
/// @param part Record providing `part.transform`, `part.kind`.
function transformTriangle(source,part)
  positions=[];normals=[]
  for corner=0 to 2
    point=viewMath.localPointToWorld(source.positions[corner],part.transform);if point is error then return point end if
    normal=viewMath.localNormalToWorld(source.normals[corner],part.transform);if normal is error then return normal end if
    positions=positions+[point];normals=normals+[normal]
  end for
  return Triangle(positions,source.texCoords,normals,part.kind,source.surfaceIndex,source.shaderName)
end function

/// Interpolates every model surface within the triangle budget and transforms the resulting triangles into the part's space.
/// @param part Record providing `part.model`, `part.animation`.
/// @param maxTrianglesPerSurface Argument 6 supplied to `mq3.format.md3.renderTriangles`.
function renderPart(part,maxTrianglesPerSurface)
  result=[]
  if len(part.model.surfaces)>0 then
    for surfaceIndex=0 to len(part.model.surfaces)-1
      source=md3.renderTriangles(part.model,surfaceIndex,part.animation.frame,part.animation.oldFrame,part.animation.backlerp,maxTrianglesPerSurface)
      if source is error then return source end if
      if len(source)>0 then
        for triangleIndex=0 to len(source)-1
          output=transformTriangle(source[triangleIndex],part);if output is error then return output end if
          result=result+[output]
        end for
      end if
    end for
  end if
  return result
end function

// Returns lower, upper and head triangles in one shared coordinate system.
// The limit applies independently to every surface, matching renderTriangles.
/// @param value Record providing `value.lower`, `value.upper`, `value.head`.
/// @param maxTrianglesPerSurface Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.player_model_assembly.renderPart`.
function render(value,maxTrianglesPerSurface)
  if value==void then return fail("missing assembly") end if
  if maxTrianglesPerSurface<0 then return fail("negative triangle limit") end if
  result=[]
  pieces=[value.lower,value.upper,value.head]
  for partIndex=0 to 2
    triangles=renderPart(pieces[partIndex],maxTrianglesPerSurface);if triangles is error then return triangles end if
    result=result+triangles
  end for
  return result
end function
