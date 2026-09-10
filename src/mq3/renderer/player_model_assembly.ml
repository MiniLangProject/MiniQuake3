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

struct Animation frame oldFrame backlerp end struct
struct Transform origin axis end struct
struct Models lower upper head end struct
struct Part kind name model animation transform end struct
struct Assembly lower upper head end struct
struct Triangle positions texCoords normals part surfaceIndex shaderName end struct

function fail(message) return error(7520,"player model assembly: "+message) end function

function animation(frame,oldFrame,backlerp)
  return Animation(frame,oldFrame,numeric.f32(backlerp))
end function

function identityAxis()
  return [[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]]
end function

function transform(origin,axis) return Transform(origin,axis) end function
function identityTransform() return Transform([0.0,0.0,0.0],identityAxis()) end function
function models(lower,upper,head) return Models(lower,upper,head) end function

// Loads the three conventional player-model pieces without taking ownership of
// an archive or filesystem. This keeps asset lookup policy outside the renderer.
function load(lowerData,upperData,headData)
  lower=md3.load(lowerData);if lower is error then return lower end if
  upper=md3.load(upperData);if upper is error then return upper end if
  head=md3.load(headData);if head is error then return head end if
  return Models(lower,upper,head)
end function

function valid3(value) return value!=void and len(value)==3 end function
function validateTransform(value)
  if value==void or not valid3(value.origin) or value.axis==void or len(value.axis)!=3 then return fail("malformed transform") end if
  for row=0 to 2 if not valid3(value.axis[row]) then return fail("malformed transform axis") end if end for
  return true
end function

function validateAnimation(model,anim)
  if model==void or model.numFrames<1 then return fail("model has no animation frames") end if
  if anim==void then return fail("missing animation") end if
  if anim.frame<0 or anim.frame>=model.numFrames or anim.oldFrame<0 or anim.oldFrame>=model.numFrames then return fail("animation frame outside model") end if
  if anim.backlerp<0.0 or anim.backlerp>1.0 then return fail("backlerp outside zero to one") end if
  return true
end function

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
function attach(parent,orientation)
  valid=validateTransform(parent);if valid is error then return valid end if
  if orientation==void or not orientation.found then return fail("required attachment tag missing") end if
  tagTransform=Transform(orientation.origin,orientation.axis)
  valid=validateTransform(tagTransform);if valid is error then return valid end if
  origin=viewMath.localPointToWorld(orientation.origin,parent);if origin is error then return origin end if
  return Transform(origin,multiplyAxis(orientation.axis,parent.axis))
end function

function tagOrientation(model,anim,name)
  tagModel=modelTags.md3(model.tags,model.bounds[0],model.bounds[1])
  wrapped=modelTags.model(void,tagModel)
  // R_LerpTag receives oldframe, frame and 1-backlerp.
  return modelTags.lerpTag(wrapped,anim.oldFrame,anim.frame,numeric.fsub(1.0,anim.backlerp),name)
end function

// Builds the hierarchy lower -> tag_torso -> upper -> tag_head -> head.
// The root transform places the complete player in the caller's model space.
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

function transformTriangle(source,part)
  positions=[];normals=[]
  for corner=0 to 2
    point=viewMath.localPointToWorld(source.positions[corner],part.transform);if point is error then return point end if
    normal=viewMath.localNormalToWorld(source.normals[corner],part.transform);if normal is error then return normal end if
    positions=positions+[point];normals=normals+[normal]
  end for
  return Triangle(positions,source.texCoords,normals,part.kind,source.surfaceIndex,source.shaderName)
end function

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
