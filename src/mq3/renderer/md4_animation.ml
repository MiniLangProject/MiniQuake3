// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/renderer/tr_animation.c.
package mq3.renderer.md4_animation

import mq3.compat.numeric as n

struct Bone matrix end struct
struct Weight boneIndex boneWeight offset end struct
struct Vertex normal texCoords weights end struct
struct Surface shaderIndex triangles vertices end struct
struct Frame bones end struct
struct DrawSurface surfaceIndex shaderIndex fogNum dlightMap end struct
struct AnimatedSurface positions normals texCoords indexes end struct

function fail(message) return error(7760,"MD4 animation: "+message) end function
function bone(matrix)
  if matrix==void or len(matrix)!=3 then return fail("bone needs three rows") end if
  for each row in matrix if row==void or len(row)!=4 then return fail("bone row needs four components") end if end for
  return Bone(matrix)
end function
function weight(index,value,offset) return Weight(index,n.f32(value),offset) end function
function vertex(normal,texCoords,weights) return Vertex(normal,texCoords,weights) end function
function surface(shaderIndex,triangles,vertices) return Surface(shaderIndex,triangles,vertices) end function
function frame(bones) return Frame(bones) end function

// R_AddAnimSurfaces: MD4 has one LOD and submits every surface with fog zero
// and no dlight map.
function addAnimSurfaces(surfaces)
  if surfaces==void then return fail("surfaces are required") end if
  result=[];for index=0 to len(surfaces)-1 value=surfaces[index];result=result+[DrawSurface(index,value.shaderIndex,0,false)] end for;return result
end function

function blendBone(current,old,frontlerp,backlerp)
  rows=[]
  for row=0 to 2 values=[];for column=0 to 3 values=values+[n.fadd(n.fmul(frontlerp,current.matrix[row][column]),n.fmul(backlerp,old.matrix[row][column]))] end for;rows=rows+[values] end for
  return Bone(rows)
end function
function dotRow(row,value) return n.fadd(n.fadd(n.fmul(row[0],value[0]),n.fmul(row[1],value[1])),n.fmul(row[2],value[2])) end function

// RB_SurfaceAnim: blend all 3x4 bone matrices, then skin positions and
// normals by each vertex's weighted bone list.
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
