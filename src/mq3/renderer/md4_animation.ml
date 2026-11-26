// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/renderer/tr_animation.c.
package mq3.renderer.md4_animation

import mq3.compat.numeric as n

/// Data record for `mq3.renderer.md4_animation.Bone`; groups `matrix`.
struct Bone matrix end struct
/// Data record for `mq3.renderer.md4_animation.Weight`; groups `boneIndex`, `boneWeight`, `offset`.
struct Weight boneIndex boneWeight offset end struct
/// Data record for `mq3.renderer.md4_animation.Vertex`; groups `normal`, `texCoords`, `weights`.
struct Vertex normal texCoords weights end struct
/// Data record for `mq3.renderer.md4_animation.Surface`; groups `shaderIndex`, `triangles`, `vertices`.
struct Surface shaderIndex triangles vertices end struct
/// Data record for `mq3.renderer.md4_animation.Frame`; groups `bones`.
struct Frame bones end struct
/// Data record for `mq3.renderer.md4_animation.DrawSurface`; groups `surfaceIndex`, `shaderIndex`, `fogNum`, `dlightMap`.
struct DrawSurface surfaceIndex shaderIndex fogNum dlightMap end struct
/// Data record for `mq3.renderer.md4_animation.AnimatedSurface`; groups `positions`, `normals`, `texCoords`, `indexes`.
struct AnimatedSurface positions normals texCoords indexes end struct

/// Creates error `7760` with message `"MD4 animation: "+message`.
/// @param message Input used in the result expression `error(7760,"MD4 animation: "+message)`.
function fail(message) return error(7760,"MD4 animation: "+message) end function
/// Builds `mq3.renderer.md4_animation.Bone` for `mq3.renderer.md4_animation.bone`.
/// @param matrix Initial value for `mq3.renderer.md4_animation.Bone.matrix`.
function bone(matrix)
  if matrix==void or len(matrix)!=3 then return fail("bone needs three rows") end if
  for each row in matrix if row==void or len(row)!=4 then return fail("bone row needs four components") end if end for
  return Bone(matrix)
end function
/// Constructs `mq3.renderer.md4_animation.Weight` with `boneWeight` = `n.f32(value)` and the supplied remaining values.
/// @param index Initial value for `mq3.renderer.md4_animation.Weight.boneIndex`.
/// @param value Argument 1 supplied to `mq3.compat.numeric.f32`.
/// @param offset Initial value for `mq3.renderer.md4_animation.Weight.offset`.
function weight(index,value,offset) return Weight(index,n.f32(value),offset) end function
/// Constructs `mq3.renderer.md4_animation.Vertex` from `normal`, `texCoords`, `weights`.
/// @param normal Initial value for `mq3.renderer.md4_animation.Vertex.normal`.
/// @param texCoords Initial value for `mq3.renderer.md4_animation.Vertex.texCoords`.
/// @param weights Initial value for `mq3.renderer.md4_animation.Vertex.weights`.
function vertex(normal,texCoords,weights) return Vertex(normal,texCoords,weights) end function
/// Constructs `mq3.renderer.md4_animation.Surface` from `shaderIndex`, `triangles`, `vertices`.
/// @param shaderIndex Initial value for `mq3.renderer.md4_animation.Surface.shaderIndex`.
/// @param triangles Initial value for `mq3.renderer.md4_animation.Surface.triangles`.
/// @param vertices Initial value for `mq3.renderer.md4_animation.Surface.vertices`.
function surface(shaderIndex,triangles,vertices) return Surface(shaderIndex,triangles,vertices) end function
/// Constructs `mq3.renderer.md4_animation.Frame` from `bones`.
/// @param bones Initial value for `mq3.renderer.md4_animation.Frame.bones`.
function frame(bones) return Frame(bones) end function

// R_AddAnimSurfaces: MD4 has one LOD and submits every surface with fog zero
// and no dlight map.
/// @param surfaces Indexed input read at `index`.
function addAnimSurfaces(surfaces)
  if surfaces==void then return fail("surfaces are required") end if
  result=[];for index=0 to len(surfaces)-1 value=surfaces[index];result=result+[DrawSurface(index,value.shaderIndex,0,false)] end for;return result
end function

/// Builds `mq3.renderer.md4_animation.Bone` for `mq3.renderer.md4_animation.blendBone`.
/// @param current Record providing `current.matrix`.
/// @param old Record providing `old.matrix`.
/// @param frontlerp Argument 1 supplied to `mq3.compat.numeric.fmul`.
/// @param backlerp Argument 1 supplied to `mq3.compat.numeric.fmul`.
function blendBone(current,old,frontlerp,backlerp)
  rows=[]
  for row=0 to 2 values=[];for column=0 to 3 values=values+[n.fadd(n.fmul(frontlerp,current.matrix[row][column]),n.fmul(backlerp,old.matrix[row][column]))] end for;rows=rows+[values] end for
  return Bone(rows)
end function
/// Calls `mq3.compat.numeric.fadd` with `(n.fadd(n.fmul(row[0],value[0]),n.fmul(row[1],value[1])),n.fmul(row[2],value[2]))` and returns its result.
/// @param row Three-component vector read at indices 0, 1, and 2.
/// @param value Three-component vector read at indices 0, 1, and 2.
function dotRow(row,value) return n.fadd(n.fadd(n.fmul(row[0],value[0]),n.fmul(row[1],value[1])),n.fmul(row[2],value[2])) end function

// RB_SurfaceAnim: blend all 3x4 bone matrices, then skin positions and
// normals by each vertex's weighted bone list.
/// @param value Record providing `value.vertices`, `value.triangles`.
/// @param currentFrame Record providing `currentFrame.bones`.
/// @param oldFrame Record providing `oldFrame.bones`.
/// @param backlerp Argument 1 supplied to `mq3.compat.numeric.f32`.
/// @param currentVertexes Input tested by `currentVertexes+len(value.vertices)>maxVertexes or currentIndexes+len(value.triangles)>maxIndexes`.
/// @param currentIndexes Input tested by `currentVertexes+len(value.vertices)>maxVertexes or currentIndexes+len(value.triangles)>maxIndexes`.
/// @param maxVertexes Input tested by `currentVertexes+len(value.vertices)>maxVertexes or currentIndexes+len(value.triangles)>maxIndexes`.
/// @param maxIndexes Input tested by `currentVertexes+len(value.vertices)>maxVertexes or currentIndexes+len(value.triangles)>maxIndexes`.
function surfaceAnim(value,currentFrame,oldFrame,backlerp,currentVertexes,currentIndexes,maxVertexes,maxIndexes)
  if value==void or currentFrame==void or oldFrame==void then return fail("surface and frames are required") end if
  if backlerp<0.0 or backlerp>1.0 then return fail("backlerp outside zero to one") end if
  if len(currentFrame.bones)!=len(oldFrame.bones) then return fail("frame bone counts differ") end if
  if currentVertexes+len(value.vertices)>maxVertexes or currentIndexes+len(value.triangles)>maxIndexes then return fail("tessellation overflow") end if
  frontlerp=n.fsub(1.0,n.f32(backlerp));bones=currentFrame.bones
  if backlerp!=0.0 then bones=[];for index=0 to len(currentFrame.bones)-1 bones=bones+[blendBone(currentFrame.bones[index],oldFrame.bones[index],frontlerp,backlerp)] end for end if
  positions=[];normals=[];texCoords=[]
  for each source in value.vertices
    position=[0.0,0.0,0.0];normal=[0.0,0.0,0.0]
    for each influence in source.weights
      if influence.boneIndex<0 or influence.boneIndex>=len(bones) then return fail("weight bone index out of range") end if
      transform=bones[influence.boneIndex];amount=influence.boneWeight
      for axis=0 to 2
        position[axis]=n.fadd(position[axis],n.fmul(amount,n.fadd(dotRow(transform.matrix[axis],influence.offset),transform.matrix[axis][3])))
        normal[axis]=n.fadd(normal[axis],n.fmul(amount,dotRow(transform.matrix[axis],source.normal)))
      end for
    end for
    positions=positions+[position];normals=normals+[normal];texCoords=texCoords+[[source.texCoords[0],source.texCoords[1]]]
  end for
  indexes=[];for each index in value.triangles indexes=indexes+[currentVertexes+index] end for
  return AnimatedSurface(positions,normals,texCoords,indexes)
end function
