// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Checked BSP46 render data extraction for the interactive desktop slice.
package mq3.renderer.bsp_render_data
import mq3.compat.numeric as n

const MST_PLANAR = 1
const MST_PATCH = 2
const MST_TRIANGLE_SOUP = 3
const DEFAULT_PATCH_ERROR = 4.0
const MAX_PATCH_SUBDIVISIONS = 16
const VERTEX_STRIDE = 44
const FACE_STRIDE = 104
const LIGHTMAP_WIDTH = 128
const LIGHTMAP_HEIGHT = 128
const LIGHTMAP_RGB_SIZE = 49152

struct RenderVertex position baseUV lightmapUV color end struct
struct RenderTriangle vertices textureIndex lightmapIndex faceIndex triangleIndex end struct
struct RenderData triangles surfaceCount triangleCount skippedSurfaceCount truncated patchSurfaceCount end struct

function fail(text) return error(7410,"BSP render data: "+text) end function
function validMap(map)
  return map!=void and typeof(map.data)=="bytes" and map.offsets!=void and len(map.offsets)>=17 and map.counts!=void and len(map.counts)>=17
end function
function recordRange(map,lump,index,stride)
  if index<0 or index>=map.counts[lump] then return fail("record index outside lump") end if
  offset=map.offsets[lump]+index*stride
  if offset<0 or offset+stride>len(map.data) then return fail("record outside BSP data") end if
  return offset
end function
function i32(map,offset)
  value=n.readI32(map.data,offset);if value is error then return fail("truncated integer") end if;return value
end function
function f32(map,offset)
  value=n.readU32(map.data,offset);if value is error then return fail("truncated float") end if;return n.bitsFloat(value)
end function
function vertex(map,index)
  offset=recordRange(map,10,index,VERTEX_STRIDE);if offset is error then return offset end if
  return RenderVertex([f32(map,offset),f32(map,offset+4),f32(map,offset+8)],[f32(map,offset+12),f32(map,offset+16)],[f32(map,offset+20),f32(map,offset+24)],[map.data[offset+40],map.data[offset+41],map.data[offset+42],map.data[offset+43]])
end function
function contains(values,wanted)
  for each value in values if value==wanted then return true end if end for
  return false
end function

function lerp(a,b,t) return a+(b-a)*t end function
function bezierScalar(a,b,c,t)
  first=lerp(a,b,t);last=lerp(b,c,t);return lerp(first,last,t)
end function
function bezierArray(a,b,c,t)
  result=[];for index=0 to len(a)-1 result=result+[bezierScalar(a[index],b[index],c[index],t)] end for;return result
end function
function bezierVertex(a,b,c,t)
  color=bezierArray(a.color,b.color,c.color,t)
  for index=0 to 3 color[index]=n.trunc32(color[index]+0.5);if color[index]<0 then color[index]=0 end if;if color[index]>255 then color[index]=255 end if end for
  return RenderVertex(bezierArray(a.position,b.position,c.position,t),bezierArray(a.baseUV,b.baseUV,c.baseUV,t),bezierArray(a.lightmapUV,b.lightmapUV,c.lightmapUV,t),color)
end function
function curveError(a,b,c)
  sum=0.0
  for axis=0 to 2 delta=(a.position[axis]-2.0*b.position[axis]+c.position[axis])*0.25;sum=sum+delta*delta end for
  return n.fsqrt(sum)
end function
function patchAxisSegments(control,width,height,horizontal,errorLimit)
  worst=0.0
  if horizontal then
    for row=0 to height-1
      column=0;while column<=width-3
        value=curveError(control[row*width+column],control[row*width+column+1],control[row*width+column+2]);if value>worst then worst=value end if;column=column+2
      end while
    end for
  else
    for column=0 to width-1
      row=0;while row<=height-3
        value=curveError(control[row*width+column],control[(row+1)*width+column],control[(row+2)*width+column]);if value>worst then worst=value end if;row=row+2
      end while
    end for
  end if
  segments=1;scaled=worst
  while scaled>errorLimit and segments<MAX_PATCH_SUBDIVISIONS segments=segments*2;scaled=scaled*0.25 end while
  return segments
end function
function patchPoint(control,width,blockX,blockY,u,v)
  rows=[]
  for row=0 to 2
    offset=(blockY*2+row)*width+blockX*2
    rows=rows+[bezierVertex(control[offset],control[offset+1],control[offset+2],u)]
  end for
  return bezierVertex(rows[0],rows[1],rows[2],v)
end function
function appendPatch(triangles,control,width,height,textureIndex,lightmapIndex,faceIndex,maxTriangles,errorLimit)
  uSegments=patchAxisSegments(control,width,height,true,errorLimit);vSegments=patchAxisSegments(control,width,height,false,errorLimit)
  count=0;truncated=false
  for blockY=0 to n.quotient(height-1,2)-1
    for blockX=0 to n.quotient(width-1,2)-1
      grid=[]
      for row=0 to vSegments
        v=row/vSegments
        for column=0 to uSegments grid=grid+[patchPoint(control,width,blockX,blockY,column/uSegments,v)] end for
      end for
      for row=0 to vSegments-1
        for column=0 to uSegments-1
          a=row*(uSegments+1)+column;b=a+uSegments+1;c=a+1;d=b+1
          pair=[[grid[a],grid[b],grid[c]],[grid[c],grid[b],grid[d]]]
          for local=0 to 1
            triangleIndex=count;count=count+1
            if len(triangles)<maxTriangles then triangles=triangles+[RenderTriangle(pair[local],textureIndex,lightmapIndex,faceIndex,triangleIndex)] else truncated=true end if
          end for
        end for
      end for
    end for
  end for
  return [triangles,count,truncated]
end function

// Face and meshvert order is retained. Repeated face indexes are ignored after
// their first occurrence, giving visible-leaf callers a stable render stream.
// Validation continues beyond maxTriangles so malformed BSP input cannot hide
// behind an output limit.
function extractWithPatchError(map,faceIndexes,maxTriangles,patchError)
  if not validMap(map) then return fail("invalid BSP object") end if
  if faceIndexes==void then return fail("missing face list") end if
  if maxTriangles<0 then return fail("negative triangle limit") end if
  if patchError<=0.0 then return fail("non-positive patch error") end if
  triangles=[];seen=[];surfaceCount=0;triangleCount=0;skipped=0;truncated=false;patchSurfaceCount=0
  for each faceIndex in faceIndexes
    if not contains(seen,faceIndex) then
      seen=seen+[faceIndex]
      faceOffset=recordRange(map,13,faceIndex,FACE_STRIDE);if faceOffset is error then return faceOffset end if
      textureIndex=i32(map,faceOffset);kind=i32(map,faceOffset+8);firstVert=i32(map,faceOffset+12);numVerts=i32(map,faceOffset+16);firstMesh=i32(map,faceOffset+20);numMesh=i32(map,faceOffset+24);lightmapIndex=i32(map,faceOffset+28)
      if textureIndex is error or kind is error or firstVert is error or numVerts is error or firstMesh is error or numMesh is error or lightmapIndex is error then return fail("truncated face") end if
      if kind==MST_PLANAR or kind==MST_TRIANGLE_SOUP or kind==MST_PATCH then
        if textureIndex<0 or textureIndex>=map.counts[1] then return fail("face texture index outside shader lump") end if
        if lightmapIndex < -1 or lightmapIndex>=map.counts[14] then return fail("face lightmap index outside lump") end if
        if firstVert<0 or numVerts<0 or firstVert+numVerts>map.counts[10] then return fail("face vertex range outside lump") end if
        surfaceCount=surfaceCount+1
        if kind==MST_PATCH then
          patchSurfaceCount=patchSurfaceCount+1
          width=i32(map,faceOffset+96);height=i32(map,faceOffset+100)
          if width is error or height is error or width<3 or height<3 or width>129 or height>129 or width%2==0 or height%2==0 or width*height!=numVerts then return fail("invalid patch control grid") end if
          control=[];for controlIndex=0 to numVerts-1 value=vertex(map,firstVert+controlIndex);if value is error then return value end if;control=control+[value] end for
          patch=appendPatch(triangles,control,width,height,textureIndex,lightmapIndex,faceIndex,maxTriangles,patchError)
          triangles=patch[0];triangleCount=triangleCount+patch[1];if patch[2] then truncated=true end if
        else
          if firstMesh<0 or numMesh<0 or firstMesh+numMesh>map.counts[11] or numMesh%3!=0 then return fail("face meshvert range is invalid") end if
          for triangleIndex=0 to n.quotient(numMesh,3)-1
            verts=[]
            for corner=0 to 2
              meshOffset=recordRange(map,11,firstMesh+triangleIndex*3+corner,4);if meshOffset is error then return meshOffset end if
              relative=i32(map,meshOffset)
              if relative is error or relative<0 or relative>=numVerts then return fail("meshvert outside face vertices") end if
              value=vertex(map,firstVert+relative);if value is error then return value end if
              verts=verts+[value]
            end for
            triangleCount=triangleCount+1
            if len(triangles)<maxTriangles then triangles=triangles+[RenderTriangle(verts,textureIndex,lightmapIndex,faceIndex,triangleIndex)] else truncated=true end if
          end for
        end if
      else skipped=skipped+1
      end if
    end if
  end for
  return RenderData(triangles,surfaceCount,triangleCount,skipped,truncated,patchSurfaceCount)
end function

function extract(map,faceIndexes,maxTriangles) return extractWithPatchError(map,faceIndexes,maxTriangles,DEFAULT_PATCH_ERROR) end function

function all(map,maxTriangles)
  if not validMap(map) then return fail("invalid BSP object") end if
  faces=[];for index=0 to map.counts[13]-1 faces=faces+[index] end for
  return extract(map,faces,maxTriangles)
end function

function lightmapRgb(map,index)
  if not validMap(map) then return fail("invalid BSP object") end if
  offset=recordRange(map,14,index,LIGHTMAP_RGB_SIZE);if offset is error then return offset end if
  return slice(map.data,offset,LIGHTMAP_RGB_SIZE)
end function

function lightmapRgba(map,index)
  rgb=lightmapRgb(map,index);if rgb is error then return rgb end if
  rgba=bytes(LIGHTMAP_WIDTH*LIGHTMAP_HEIGHT*4,255)
  for pixel=0 to LIGHTMAP_WIDTH*LIGHTMAP_HEIGHT-1
    rgba[pixel*4]=rgb[pixel*3];rgba[pixel*4+1]=rgb[pixel*3+1];rgba[pixel*4+2]=rgb[pixel*3+2]
  end for
  return rgba
end function
