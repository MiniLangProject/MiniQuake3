// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Checked BSP46 render data extraction for the interactive desktop slice.
package mq3.renderer.bsp_render_data
import mq3.compat.numeric as n
import std.ds.list as lists

const MST_PLANAR = 1
const MST_PATCH = 2
const MST_TRIANGLE_SOUP = 3
const DEFAULT_PATCH_ERROR = 4.0
const MAX_GRID_SIZE = 65
const MAX_PATCH_SIZE = 32
const VERTEX_STRIDE = 44
const FACE_STRIDE = 104
const LIGHTMAP_WIDTH = 128
const LIGHTMAP_HEIGHT = 128
const LIGHTMAP_RGB_SIZE = 49152

struct RenderVertex position baseUV lightmapUV normal color entityColor entityTexCoord shaderTime sourceIndex end struct
struct RenderTriangle vertices textureIndex lightmapIndex fogIndex faceIndex triangleIndex end struct
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
  color=[map.data[offset+40],map.data[offset+41],map.data[offset+42],map.data[offset+43]]
  return RenderVertex([f32(map,offset),f32(map,offset+4),f32(map,offset+8)],[f32(map,offset+12),f32(map,offset+16)],[f32(map,offset+20),f32(map,offset+24)],[f32(map,offset+28),f32(map,offset+32),f32(map,offset+36)],color,[255,255,255,255],[0.0,0.0],0.0,index)
end function

function lerp(a,b,t) return a+(b-a)*t end function
function bezierScalar(a,b,c,t)
  first=lerp(a,b,t);last=lerp(b,c,t);return lerp(first,last,t)
end function
function bezierArray(a,b,c,t)
  result=array(len(a),0.0)
  for index=0 to len(a)-1 result[index]=bezierScalar(a[index],b[index],c[index],t) end for
  return result
end function
function normalized(value)
  length=n.fsqrt(value[0]*value[0]+value[1]*value[1]+value[2]*value[2]);if length<=0.0 then return [0.0,0.0,1.0] end if
  return [value[0]/length,value[1]/length,value[2]/length]
end function
function bezierVertex(a,b,c,t)
  color=bezierArray(a.color,b.color,c.color,t)
  for index=0 to 3 color[index]=n.trunc32(color[index]+0.5);if color[index]<0 then color[index]=0 end if;if color[index]>255 then color[index]=255 end if end for
  entityColor=bezierArray(a.entityColor,b.entityColor,c.entityColor,t);for index=0 to 3 entityColor[index]=n.trunc32(entityColor[index]+0.5) end for
  entityTexCoord=bezierArray(a.entityTexCoord,b.entityTexCoord,c.entityTexCoord,t);shaderTime=bezierScalar(a.shaderTime,b.shaderTime,c.shaderTime,t)
  return RenderVertex(bezierArray(a.position,b.position,c.position,t),bezierArray(a.baseUV,b.baseUV,c.baseUV,t),bezierArray(a.lightmapUV,b.lightmapUV,c.lightmapUV,t),normalized(bezierArray(a.normal,b.normal,c.normal,t)),color,entityColor,entityTexCoord,shaderTime,-1)
end function
function halfArray(a,b)
  result=array(len(a),0.0)
  for index=0 to len(a)-1 result[index]=(a[index]+b[index])*0.5 end for
  return result
end function
function halfVertex(a,b)
  color=array(4,0);entityColor=array(4,0)
  for index=0 to 3
    color[index]=n.quotient(a.color[index]+b.color[index],2)
    entityColor[index]=n.quotient(a.entityColor[index]+b.entityColor[index],2)
  end for
  return RenderVertex(halfArray(a.position,b.position),halfArray(a.baseUV,b.baseUV),halfArray(a.lightmapUV,b.lightmapUV),halfArray(a.normal,b.normal),color,entityColor,halfArray(a.entityTexCoord,b.entityTexCoord),(a.shaderTime+b.shaderTime)*0.5,-1)
end function
function curveLineError(a,b,c)
  offset=array(3,0.0);direction=array(3,0.0);lengthSquared=0.0
  for axis=0 to 2
    offset[axis]=bezierScalar(a.position[axis],b.position[axis],c.position[axis],0.5)-a.position[axis]
    delta=c.position[axis]-a.position[axis]
    direction[axis]=delta
    lengthSquared=lengthSquared+delta*delta
  end for
  if lengthSquared>0.0 then length=n.fsqrt(lengthSquared);for axis=0 to 2 direction[axis]=direction[axis]/length end for end if
  projected=offset[0]*direction[0]+offset[1]*direction[1]+offset[2]*direction[2];errorSquared=0.0
  for axis=0 to 2 delta=offset[axis]-direction[axis]*projected;errorSquared=errorSquared+delta*delta end for
  return n.fsqrt(errorSquared)
end function
function transposeGrid(control,width,height)
  result=array(width*height,void)
  for row=0 to width-1 for column=0 to height-1 result[row*height+column]=control[column*width+row] end for end for
  return result
end function
// Baseq3 R_SubdividePatchToGrid checks perpendicular distance to the chord,
// inserts the two de Casteljau half points and rechecks the same span.  This
// preserves its non-uniform grid and 65-point axis ceiling instead of applying
// one worst-case subdivision count to every quadratic block.
function subdivideHorizontal(control,width,height,errorLimit)
  errors=array(MAX_GRID_SIZE,0.0);column=0
  while column+2<width
    maximum=0.0
    for row=0 to height-1
      value=curveLineError(control[row*width+column],control[row*width+column+1],control[row*width+column+2]);if value>maximum then maximum=value end if
    end for
    if maximum<0.1 then errors[column+1]=999.0;column=column+2
    else if maximum<=errorLimit or width+2>MAX_GRID_SIZE then errors[column+1]=1.0/maximum;column=column+2
    else
      newWidth=width+2
      expanded=array(newWidth*height,void)
      for row=0 to height-1
        start=row*width;target=row*newWidth
        for index=0 to column expanded[target+index]=control[start+index] end for
        previous=halfVertex(control[start+column],control[start+column+1])
        following=halfVertex(control[start+column+1],control[start+column+2])
        expanded[target+column+1]=previous
        expanded[target+column+2]=halfVertex(previous,following)
        expanded[target+column+3]=following
        for index=column+2 to width-1 expanded[target+index+2]=control[start+index] end for
      end for
      control=expanded;width=newWidth;errors[column+2]=1.0/maximum
    end if
  end while
  return [control,width,height,errors]
end function
function putGridPointsOnCurve(control,width,height)
  for column=0 to width-1
    row=1;while row<height-1 previous=halfVertex(control[row*width+column],control[(row+1)*width+column]);following=halfVertex(control[row*width+column],control[(row-1)*width+column]);control[row*width+column]=halfVertex(previous,following);row=row+2 end while
  end for
  for row=0 to height-1
    column=1;while column<width-1 previous=halfVertex(control[row*width+column],control[row*width+column+1]);following=halfVertex(control[row*width+column],control[row*width+column-1]);control[row*width+column]=halfVertex(previous,following);column=column+2 end while
  end for
  return control
end function
function retainedGridAxis(size,errors)
  retained=lists.List.withCapacity(size)
  retained.add(0)
  index=1
  while index<size-1
    // The original shifts the error table with the grid, then advances
    // past the point that took the removed point's place.
    if errors[index]==999.0 then index=index+1 end if
    retained.add(index)
    index=index+1
  end while
  if index==size-1 then retained.add(index) end if
  return retained.toArray()
end function
function compactGrid(control,width,height,widthErrors,heightErrors)
  columns=retainedGridAxis(width,widthErrors)
  rows=retainedGridAxis(height,heightErrors)
  newWidth=len(columns);newHeight=len(rows)
  if newWidth==width and newHeight==height then
    return [control,width,height,widthErrors,heightErrors]
  end if
  compacted=array(newWidth*newHeight,void)
  for row=0 to newHeight-1
    for column=0 to newWidth-1
      compacted[row*newWidth+column]=control[rows[row]*width+columns[column]]
    end for
  end for
  newWidthErrors=array(newWidth,0.0);newHeightErrors=array(newHeight,0.0)
  for column=0 to newWidth-1 newWidthErrors[column]=widthErrors[columns[column]] end for
  for row=0 to newHeight-1 newHeightErrors[row]=heightErrors[rows[row]] end for
  return [compacted,newWidth,newHeight,newWidthErrors,newHeightErrors]
end function
function normalDirection(target,base)
  value=array(3,0.0);lengthSquared=0.0
  for axis=0 to 2 delta=target[axis]-base[axis];value[axis]=delta;lengthSquared=lengthSquared+delta*delta end for
  if lengthSquared<=0.0 then return void end if
  length=n.fsqrt(lengthSquared);for axis=0 to 2 value[axis]=value[axis]/length end for;return value
end function
function crossNormal(a,b)
  value=[a[1]*b[2]-a[2]*b[1],a[2]*b[0]-a[0]*b[2],a[0]*b[1]-a[1]*b[0]]
  length=n.fsqrt(value[0]*value[0]+value[1]*value[1]+value[2]*value[2]);if length<=0.0 then return void end if
  return [value[0]/length,value[1]/length,value[2]/length]
end function
function vertexWithNormal(value,normal)
  return RenderVertex(value.position,value.baseUV,value.lightmapUV,normal,value.color,value.entityColor,value.entityTexCoord,value.shaderTime,value.sourceIndex)
end function
// MakeMeshNormals, including Baseq3's seam wrapping and up-to-three-point
// search through degenerate neighbours.  Positions stay immutable while every
// normal is derived so replacing vertices cannot affect later samples.
function makeGridNormals(control,width,height)
  wrapWidth=true
  for row=0 to height-1
    delta=normalDirection(control[row*width].position,control[row*width+width-1].position)
    if delta!=void then distanceSquared=0.0;for axis=0 to 2 difference=control[row*width].position[axis]-control[row*width+width-1].position[axis];distanceSquared=distanceSquared+difference*difference end for;if distanceSquared>1.0 then wrapWidth=false;break end if end if
  end for
  wrapHeight=true
  for column=0 to width-1
    distanceSquared=0.0;for axis=0 to 2 difference=control[column].position[axis]-control[(height-1)*width+column].position[axis];distanceSquared=distanceSquared+difference*difference end for
    if distanceSquared>1.0 then wrapHeight=false;break end if
  end for
  neighbours=[[0,1],[1,1],[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1]];normals=array(width*height,void)
  for column=0 to width-1
    for row=0 to height-1
      base=control[row*width+column].position;around=array(8,void)
      for directionIndex=0 to 7
        distance=1
        while distance<=3
          x=column+neighbours[directionIndex][0]*distance;y=row+neighbours[directionIndex][1]*distance
          if wrapWidth then if x<0 then x=width-1+x else if x>=width then x=1+x-width end if end if
          if wrapHeight then if y<0 then y=height-1+y else if y>=height then y=1+y-height end if end if
          if x<0 or x>=width or y<0 or y>=height then break end if
          candidate=normalDirection(control[y*width+x].position,base)
          if candidate!=void then around[directionIndex]=candidate;break end if
          distance=distance+1
        end while
      end for
      sum=[0.0,0.0,0.0]
      for directionIndex=0 to 7
        next=(directionIndex+1)&7
        if around[directionIndex]!=void and around[next]!=void then candidate=crossNormal(around[next],around[directionIndex]);if candidate!=void then for axis=0 to 2 sum[axis]=sum[axis]+candidate[axis] end for end if end if
      end for
      normal=normalDirection(sum,[0.0,0.0,0.0]);if normal==void then normal=[0.0,0.0,0.0] end if;normals[row*width+column]=normal
    end for
  end for
  for index=0 to len(control)-1 control[index]=vertexWithNormal(control[index],normals[index]) end for
  return control
end function
function subdividePatchWithErrors(control,width,height,errorLimit)
  first=subdivideHorizontal(control,width,height,errorLimit);control=transposeGrid(first[0],first[1],first[2]);width=first[2];height=first[1]
  second=subdivideHorizontal(control,width,height,errorLimit);control=transposeGrid(second[0],second[1],second[2]);width=second[2];height=second[1]
  control=putGridPointsOnCurve(control,width,height)
  grid=compactGrid(control,width,height,first[3],second[3])
  control=makeGridNormals(grid[0],grid[1],grid[2])
  return [control,grid[1],grid[2],grid[3],grid[4]]
end function
function subdividePatch(control,width,height,errorLimit)
  grid=subdividePatchWithErrors(control,width,height,errorLimit);return [grid[0],grid[1],grid[2]]
end function
function patchGrid(map,faceOffset,errorLimit)
  firstVert=i32(map,faceOffset+12);numVerts=i32(map,faceOffset+16);width=i32(map,faceOffset+96);height=i32(map,faceOffset+100)
  if firstVert is error or numVerts is error or firstVert<0 or numVerts<0 or firstVert+numVerts>map.counts[10] then return fail("face vertex range outside lump") end if
  if width is error or height is error or width<3 or height<3 or width>MAX_PATCH_SIZE or height>MAX_PATCH_SIZE or width%2==0 or height%2==0 or width*height!=numVerts then return fail("invalid patch control grid") end if
  control=array(numVerts,void)
  for index=0 to numVerts-1 value=vertex(map,firstVert+index);if value is error then return value end if;control[index]=value end for
  return subdividePatchWithErrors(control,width,height,errorLimit)
end function
function appendPatchGrid(triangles,control,width,columns,rows,textureIndex,lightmapIndex,fogIndex,faceIndex,maxTriangles)
  count=0;truncated=false
  for row=0 to len(rows)-2
    for column=0 to len(columns)-2
      a=rows[row]*width+columns[column];b=rows[row+1]*width+columns[column];c=rows[row]*width+columns[column+1];d=rows[row+1]*width+columns[column+1]
      pair=[[control[a],control[b],control[c]],[control[c],control[b],control[d]]]
      for local=0 to 1 triangleIndex=count;count=count+1;if triangles.size<maxTriangles then triangles.add(RenderTriangle(pair[local],textureIndex,lightmapIndex,fogIndex,faceIndex,triangleIndex)) else truncated=true end if end for
    end for
  end for
  return [count,truncated]
end function
function gridIndexes(size)
  indexes=array(size,0);for index=0 to size-1 indexes[index]=index end for;return indexes
end function

// Face and meshvert order is retained. Repeated face indexes are ignored after
// their first occurrence, giving visible-leaf callers a stable render stream.
// Validation continues beyond maxTriangles so malformed BSP input cannot hide
// behind an output limit.
function extractWithPatchError(map,faceIndexes,maxTriangles,patchError) return extractMode(map,faceIndexes,maxTriangles,patchError,false) end function
// Internal retained-world path. Consumers must treat shared face vertices as
// immutable; the public extractor deliberately keeps its independent corners.
function extractRetainedWithPatchError(map,faceIndexes,maxTriangles,patchError) return extractMode(map,faceIndexes,maxTriangles,patchError,true) end function
function patchNoDraw(map,textureIndex)
  shaderOffset=recordRange(map,1,textureIndex,72);if shaderOffset is error then return shaderOffset end if
  surfaceFlags=i32(map,shaderOffset+64);if surfaceFlags is error then return surfaceFlags end if
  return (surfaceFlags&0x80)!=0
end function
function extractMode(map,faceIndexes,maxTriangles,patchError,shareFaceVertices)
  if not validMap(map) then return fail("invalid BSP object") end if
  if faceIndexes==void then return fail("missing face list") end if
  if maxTriangles<0 then return fail("negative triangle limit") end if
  if patchError<=0.0 then return fail("non-positive patch error") end if
  capacity=maxTriangles;if capacity>4096 then capacity=4096 end if
  triangles=lists.List.withCapacity(capacity)
  // The retained-world cache extracts one face at a time. Allocate the face
  // bitmap only for callers whose input can actually contain duplicates.
  seen=void;if len(faceIndexes)>1 then seen=array(map.counts[13],false) end if
  surfaceCount=0;triangleCount=0;skipped=0;truncated=false;patchSurfaceCount=0
  for each faceIndex in faceIndexes
    if faceIndex<0 or faceIndex>=map.counts[13] then return fail("record index outside lump") end if
    already=false;if seen!=void then already=seen[faceIndex] end if
    if not already then
      if seen!=void then seen[faceIndex]=true end if
      faceOffset=recordRange(map,13,faceIndex,FACE_STRIDE);if faceOffset is error then return faceOffset end if
      textureIndex=i32(map,faceOffset);rawFogIndex=i32(map,faceOffset+4);kind=i32(map,faceOffset+8);firstVert=i32(map,faceOffset+12);numVerts=i32(map,faceOffset+16);firstMesh=i32(map,faceOffset+20);numMesh=i32(map,faceOffset+24);lightmapIndex=i32(map,faceOffset+28)
      if textureIndex is error or rawFogIndex is error or kind is error or firstVert is error or numVerts is error or firstMesh is error or numMesh is error or lightmapIndex is error then return fail("truncated face") end if
      fogIndex=rawFogIndex+1
      if kind==MST_PLANAR or kind==MST_TRIANGLE_SOUP or kind==MST_PATCH then
        if textureIndex<0 or textureIndex>=map.counts[1] then return fail("face texture index outside shader lump") end if
        if lightmapIndex < -1 or lightmapIndex>=map.counts[14] then return fail("face lightmap index outside lump") end if
        if firstVert<0 or numVerts<0 or firstVert+numVerts>map.counts[10] then return fail("face vertex range outside lump") end if
        if kind==MST_PATCH then
          noDraw=patchNoDraw(map,textureIndex);if noDraw is error then return noDraw end if
          if noDraw then skipped=skipped+1;continue end if
        end if
        surfaceCount=surfaceCount+1
        if kind==MST_PATCH then
          patchSurfaceCount=patchSurfaceCount+1
          grid=patchGrid(map,faceOffset,patchError);if grid is error then return grid end if
          patch=appendPatchGrid(triangles,grid[0],grid[1],gridIndexes(grid[1]),gridIndexes(grid[2]),textureIndex,lightmapIndex,fogIndex,faceIndex,maxTriangles)
          triangleCount=triangleCount+patch[0];if patch[1] then truncated=true end if
        else
          if firstMesh<0 or numMesh<0 or firstMesh+numMesh>map.counts[11] or numMesh%3!=0 then return fail("face meshvert range is invalid") end if
          decodedVertices=void;if shareFaceVertices then decodedVertices=array(numVerts,void) end if
          for triangleIndex=0 to n.quotient(numMesh,3)-1
            verts=array(3,void)
            for corner=0 to 2
              meshOffset=recordRange(map,11,firstMesh+triangleIndex*3+corner,4);if meshOffset is error then return meshOffset end if
              relative=i32(map,meshOffset)
              if relative is error or relative<0 or relative>=numVerts then return fail("meshvert outside face vertices") end if
              value=void;if decodedVertices!=void then value=decodedVertices[relative] end if
              if value==void then
                value=vertex(map,firstVert+relative);if value is error then return value end if
                if decodedVertices!=void then decodedVertices[relative]=value end if
              end if
              verts[corner]=value
            end for
            triangleCount=triangleCount+1
            if triangles.size<maxTriangles then triangles.add(RenderTriangle(verts,textureIndex,lightmapIndex,fogIndex,faceIndex,triangleIndex)) else truncated=true end if
          end for
        end if
      else skipped=skipped+1
      end if
    end if
  end for
  return RenderData(triangles.toArray(),surfaceCount,triangleCount,skipped,truncated,patchSurfaceCount)
end function

function extract(map,faceIndexes,maxTriangles) return extractWithPatchError(map,faceIndexes,maxTriangles,DEFAULT_PATCH_ERROR) end function

function all(map,maxTriangles)
  if not validMap(map) then return fail("invalid BSP object") end if
  faces=array(map.counts[13],void);for index=0 to map.counts[13]-1 faces[index]=index end for
  return extract(map,faces,maxTriangles)
end function

function lightmapRgb(map,index)
  if not validMap(map) then return fail("invalid BSP object") end if
  offset=recordRange(map,14,index,LIGHTMAP_RGB_SIZE);if offset is error then return offset end if
  return slice(map.data,offset,LIGHTMAP_RGB_SIZE)
end function

// R_ColorShiftLightingBytes. The dependency-free software renderer has no
// hardware gamma ramp, so tr.overbrightBits is zero while Baseq3's default
// r_mapOverBrightBits remains two.
function colorShiftLighting(red,green,blue,shift)
  if shift<0 or shift>8 then return fail("light overbright shift outside range") end if
  r=red<<shift;g=green<<shift;b=blue<<shift
  if (r|g|b)>255 then maximum=r;if g>maximum then maximum=g end if;if b>maximum then maximum=b end if;r=n.quotient(r*255,maximum);g=n.quotient(g*255,maximum);b=n.quotient(b*255,maximum) end if
  return [r,g,b]
end function
function lightmapRgbaShift(map,index,mapOverbrightBits,rendererOverbrightBits)
  rgb=lightmapRgb(map,index);if rgb is error then return rgb end if
  shift=mapOverbrightBits-rendererOverbrightBits;if shift<0 or shift>8 then return fail("invalid lightmap overbright configuration") end if
  rgba=bytes(LIGHTMAP_WIDTH*LIGHTMAP_HEIGHT*4,255)
  for pixel=0 to LIGHTMAP_WIDTH*LIGHTMAP_HEIGHT-1
    shifted=colorShiftLighting(rgb[pixel*3],rgb[pixel*3+1],rgb[pixel*3+2],shift);rgba[pixel*4]=shifted[0];rgba[pixel*4+1]=shifted[1];rgba[pixel*4+2]=shifted[2]
  end for
  return rgba
end function
function lightmapRgba(map,index) return lightmapRgbaShift(map,index,2,0) end function
