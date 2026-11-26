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

/// Data record for `mq3.renderer.bsp_render_data.RenderVertex`; groups `position`, `baseUV`, `lightmapUV`, `normal`, `color`, `entityColor`, and 3 further fields.
struct RenderVertex position baseUV lightmapUV normal color entityColor entityTexCoord shaderTime sourceIndex end struct
/// Data record for `mq3.renderer.bsp_render_data.RenderTriangle`; groups `vertices`, `textureIndex`, `lightmapIndex`, `fogIndex`, `faceIndex`, `triangleIndex`.
struct RenderTriangle vertices textureIndex lightmapIndex fogIndex faceIndex triangleIndex end struct
/// Data record for `mq3.renderer.bsp_render_data.RenderData`; groups `triangles`, `surfaceCount`, `triangleCount`, `skippedSurfaceCount`, `truncated`, `patchSurfaceCount`.
struct RenderData triangles surfaceCount triangleCount skippedSurfaceCount truncated patchSurfaceCount end struct

/// Creates error `7410` with message `"BSP render data: "+text`.
/// @param text Input used in the result expression `error(7410,"BSP render data: "+text)`.
function fail(text) return error(7410,"BSP render data: "+text) end function
/// Computes `map!=void and typeof(map.data)=="bytes" and map.offsets!=void and len(map.offsets)>=17 and map.counts!=void and len(map.counts)>=17` for `mq3.renderer.bsp_render_data.validMap`.
/// @param map Record providing `map.data`, `map.offsets`, `map.counts`.
function validMap(map)
  return map!=void and typeof(map.data)=="bytes" and map.offsets!=void and len(map.offsets)>=17 and map.counts!=void and len(map.counts)>=17
end function
/// Computes `recordRange` from `map.offsets[lump]+index*stride`.
/// @param map Record providing `map.counts`, `map.offsets`, `map.data`.
/// @param lump Input tested by `index<0 or index>=map.counts[lump]`.
/// @param index Input tested by `index<0 or index>=map.counts[lump]`.
/// @param stride Input used by `offset=map.offsets[lump]+index*stride`.
function recordRange(map,lump,index,stride)
  if index<0 or index>=map.counts[lump] then return fail("record index outside lump") end if
  offset=map.offsets[lump]+index*stride
  if offset<0 or offset+stride>len(map.data) then return fail("record outside BSP data") end if
  return offset
end function
/// Returns `value` from `mq3.renderer.bsp_render_data.i32`; earlier branches return `fail("truncated integer")`.
/// @param map Record providing `map.data`.
/// @param offset Argument 2 supplied to `mq3.compat.numeric.readI32`.
function i32(map,offset)
  value=n.readI32(map.data,offset);if value is error then return fail("truncated integer") end if;return value
end function
/// Returns `n.bitsFloat(value)` from `mq3.renderer.bsp_render_data.f32`; earlier branches return `fail("truncated float")`.
/// @param map Record providing `map.data`.
/// @param offset Argument 2 supplied to `mq3.compat.numeric.readU32`.
function f32(map,offset)
  value=n.readU32(map.data,offset);if value is error then return fail("truncated float") end if;return n.bitsFloat(value)
end function
/// Builds `mq3.renderer.bsp_render_data.RenderVertex` for `mq3.renderer.bsp_render_data.vertex`.
/// @param map Record providing `map.data`.
/// @param index Initial value for `mq3.renderer.bsp_render_data.RenderVertex.sourceIndex`.
function vertex(map,index)
  offset=recordRange(map,10,index,VERTEX_STRIDE);if offset is error then return offset end if
  color=[map.data[offset+40],map.data[offset+41],map.data[offset+42],map.data[offset+43]]
  return RenderVertex([f32(map,offset),f32(map,offset+4),f32(map,offset+8)],[f32(map,offset+12),f32(map,offset+16)],[f32(map,offset+20),f32(map,offset+24)],[f32(map,offset+28),f32(map,offset+32),f32(map,offset+36)],color,[255,255,255,255],[0.0,0.0],0.0,index)
end function

/// Computes `a+(b-a)*t` for `mq3.renderer.bsp_render_data.lerp`.
/// @param a Input used in the result expression `a+(b-a)*t`.
/// @param b Input used in the result expression `a+(b-a)*t`.
/// @param t Input used in the result expression `a+(b-a)*t`.
function lerp(a,b,t) return a+(b-a)*t end function
/// Returns `lerp(first,last,t)` from `mq3.renderer.bsp_render_data.bezierScalar`.
/// @param a Value forwarded as `a` to `mq3.renderer.bsp_render_data.lerp`.
/// @param b Value forwarded as `b` to `mq3.renderer.bsp_render_data.lerp`.
/// @param c Value forwarded as `b` to `mq3.renderer.bsp_render_data.lerp`.
/// @param t Value forwarded as `t` to `mq3.renderer.bsp_render_data.lerp`.
function bezierScalar(a,b,c,t)
  first=lerp(a,b,t);last=lerp(b,c,t);return lerp(first,last,t)
end function
/// Builds `result[index]` in `mq3.renderer.bsp_render_data.bezierArray`; returns `result`.
/// @param a Indexed input read at `index`.
/// @param b Indexed input read at `index`.
/// @param c Indexed input read at `index`.
/// @param t Value forwarded as `t` to `mq3.renderer.bsp_render_data.bezierScalar`.
function bezierArray(a,b,c,t)
  result=array(len(a),0.0)
  for index=0 to len(a)-1 result[index]=bezierScalar(a[index],b[index],c[index],t) end for
  return result
end function
/// Returns `[value[0]/length,value[1]/length,value[2]/length]` from `mq3.renderer.bsp_render_data.normalized`; earlier branches return `[0.0,0.0,1.0]`.
/// @param value Three-component vector read at indices 0, 1, and 2.
function normalized(value)
  length=n.fsqrt(value[0]*value[0]+value[1]*value[1]+value[2]*value[2]);if length<=0.0 then return [0.0,0.0,1.0] end if
  return [value[0]/length,value[1]/length,value[2]/length]
end function
/// Builds `mq3.renderer.bsp_render_data.RenderVertex` after updating `color[index]`, `entityColor[index]`.
/// @param a Record providing `a.color`, `a.entityColor`, `a.entityTexCoord`, `a.shaderTime`, `a.position`, `a.baseUV`.
/// @param b Record providing `b.color`, `b.entityColor`, `b.entityTexCoord`, `b.shaderTime`, `b.position`, `b.baseUV`.
/// @param c Record providing `c.color`, `c.entityColor`, `c.entityTexCoord`, `c.shaderTime`, `c.position`, `c.baseUV`.
/// @param t Value forwarded as `t` to `mq3.renderer.bsp_render_data.bezierArray`.
function bezierVertex(a,b,c,t)
  color=bezierArray(a.color,b.color,c.color,t)
  for index=0 to 3 color[index]=n.trunc32(color[index]+0.5);if color[index]<0 then color[index]=0 end if;if color[index]>255 then color[index]=255 end if end for
  entityColor=bezierArray(a.entityColor,b.entityColor,c.entityColor,t);for index=0 to 3 entityColor[index]=n.trunc32(entityColor[index]+0.5) end for
  entityTexCoord=bezierArray(a.entityTexCoord,b.entityTexCoord,c.entityTexCoord,t);shaderTime=bezierScalar(a.shaderTime,b.shaderTime,c.shaderTime,t)
  return RenderVertex(bezierArray(a.position,b.position,c.position,t),bezierArray(a.baseUV,b.baseUV,c.baseUV,t),bezierArray(a.lightmapUV,b.lightmapUV,c.lightmapUV,t),normalized(bezierArray(a.normal,b.normal,c.normal,t)),color,entityColor,entityTexCoord,shaderTime,-1)
end function
/// Builds `result[index]` in `mq3.renderer.bsp_render_data.halfArray`; returns `result`.
/// @param a Indexed input read at `index`.
/// @param b Indexed input read at `index`.
function halfArray(a,b)
  result=array(len(a),0.0)
  for index=0 to len(a)-1 result[index]=(a[index]+b[index])*0.5 end for
  return result
end function
/// Builds `mq3.renderer.bsp_render_data.RenderVertex` after updating `color[index]`, `entityColor[index]`.
/// @param a Record providing `a.color`, `a.entityColor`, `a.position`, `a.baseUV`, `a.lightmapUV`, `a.normal`.
/// @param b Record providing `b.color`, `b.entityColor`, `b.position`, `b.baseUV`, `b.lightmapUV`, `b.normal`.
function halfVertex(a,b)
  color=array(4,0);entityColor=array(4,0)
  for index=0 to 3
    color[index]=n.quotient(a.color[index]+b.color[index],2)
    entityColor[index]=n.quotient(a.entityColor[index]+b.entityColor[index],2)
  end for
  return RenderVertex(halfArray(a.position,b.position),halfArray(a.baseUV,b.baseUV),halfArray(a.lightmapUV,b.lightmapUV),halfArray(a.normal,b.normal),color,entityColor,halfArray(a.entityTexCoord,b.entityTexCoord),(a.shaderTime+b.shaderTime)*0.5,-1)
end function
/// Builds `offset[axis]`, `direction[axis]` in `mq3.renderer.bsp_render_data.curveLineError`; returns `n.fsqrt(errorSquared)`.
/// @param a Record providing `a.position`.
/// @param b Record providing `b.position`.
/// @param c Record providing `c.position`.
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
/// Builds `result[row*height+column]` in `mq3.renderer.bsp_render_data.transposeGrid`; returns `result`.
/// @param control Indexed input read at `column*width+row`.
/// @param width Input used by `result=array(width*height,void)`.
/// @param height Input used by `result=array(width*height,void)`.
function transposeGrid(control,width,height)
  result=array(width*height,void)
  for row=0 to width-1 for column=0 to height-1 result[row*height+column]=control[column*width+row] end for end for
  return result
end function
// Baseq3 R_SubdividePatchToGrid checks perpendicular distance to the chord,
// inserts the two de Casteljau half points and rechecks the same span.  This
// preserves its non-uniform grid and 65-point axis ceiling instead of applying
// one worst-case subdivision count to every quadratic block.
/// @param control Indexed input read at `row*width+column`, `row*width+column+1`, `row*width+column+2`, `start+index`.
/// @param width Input used by `while column+2<width`.
/// @param height Input used by `for row=0 to height-1`.
/// @param errorLimit Input used by `else if maximum<=errorLimit or width+2>MAX_GRID_SIZE then errors[column+1]=1.0/maximum`.
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
/// Updates `control[row*width+column]` in `mq3.renderer.bsp_render_data.putGridPointsOnCurve`; returns `control`.
/// @param control Mutable record or buffer; this call updates `control[row*width+column]`.
/// @param width Input used by `for column=0 to width-1`.
/// @param height Input used by `while row<height-1 previous=halfVertex(control[row*width+column],control[(row+1)*width+column])`.
function putGridPointsOnCurve(control,width,height)
  for column=0 to width-1
    row=1;while row<height-1 previous=halfVertex(control[row*width+column],control[(row+1)*width+column]);following=halfVertex(control[row*width+column],control[(row-1)*width+column]);control[row*width+column]=halfVertex(previous,following);row=row+2 end while
  end for
  for row=0 to height-1
    column=1;while column<width-1 previous=halfVertex(control[row*width+column],control[row*width+column+1]);following=halfVertex(control[row*width+column],control[row*width+column-1]);control[row*width+column]=halfVertex(previous,following);column=column+2 end while
  end for
  return control
end function
/// Computes `retainedGridAxis` from `retained.toArray()` using `std.ds.list.List.withCapacity`, `retained.add`, `retained.toArray`.
/// @param size Argument 1 supplied to `std.ds.list.List.withCapacity`.
/// @param errors Indexed input read at `index`.
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
/// Builds `compacted[row*newWidth+column]`, `newWidthErrors[column]`, `newHeightErrors[row]` in `mq3.renderer.bsp_render_data.compactGrid`; returns `[compacted,newWidth,newHeight,newWidthErrors,newHeightErrors]`.
/// @param control Indexed input read at `rows[row`.
/// @param width Value forwarded as `size` to `mq3.renderer.bsp_render_data.retainedGridAxis`.
/// @param height Value forwarded as `size` to `mq3.renderer.bsp_render_data.retainedGridAxis`.
/// @param widthErrors Value forwarded as `errors` to `mq3.renderer.bsp_render_data.retainedGridAxis`.
/// @param heightErrors Value forwarded as `errors` to `mq3.renderer.bsp_render_data.retainedGridAxis`.
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
/// Builds `value[axis]` in `mq3.renderer.bsp_render_data.normalDirection`; returns `value`.
/// @param target Indexed input read at `axis`.
/// @param base Indexed input read at `axis`.
function normalDirection(target,base)
  value=array(3,0.0);lengthSquared=0.0
  for axis=0 to 2 delta=target[axis]-base[axis];value[axis]=delta;lengthSquared=lengthSquared+delta*delta end for
  if lengthSquared<=0.0 then return void end if
  length=n.fsqrt(lengthSquared);for axis=0 to 2 value[axis]=value[axis]/length end for;return value
end function
/// Computes `crossNormal` from `[value[0]/length,value[1]/length,value[2]/length]` using `mq3.compat.numeric.fsqrt`.
/// @param a Three-component vector read at indices 0, 1, and 2.
/// @param b Three-component vector read at indices 0, 1, and 2.
function crossNormal(a,b)
  value=[a[1]*b[2]-a[2]*b[1],a[2]*b[0]-a[0]*b[2],a[0]*b[1]-a[1]*b[0]]
  length=n.fsqrt(value[0]*value[0]+value[1]*value[1]+value[2]*value[2]);if length<=0.0 then return void end if
  return [value[0]/length,value[1]/length,value[2]/length]
end function
/// Constructs `mq3.renderer.bsp_render_data.RenderVertex` with `position` = `value.position`, `baseUV` = `value.baseUV`, `lightmapUV` = `value.lightmapUV`, `color` = `value.color` and the supplied remaining values.
/// @param value Record providing `value.position`, `value.baseUV`, `value.lightmapUV`, `value.color`, `value.entityColor`, `value.entityTexCoord`.
/// @param normal Initial value for `mq3.renderer.bsp_render_data.RenderVertex.normal`.
function vertexWithNormal(value,normal)
  return RenderVertex(value.position,value.baseUV,value.lightmapUV,normal,value.color,value.entityColor,value.entityTexCoord,value.shaderTime,value.sourceIndex)
end function
// MakeMeshNormals, including Baseq3's seam wrapping and up-to-three-point
// search through degenerate neighbours.  Positions stay immutable while every
// normal is derived so replacing vertices cannot affect later samples.
/// @param control Mutable record or buffer; this call updates `control[index]`.
/// @param width Input used by `delta=normalDirection(control[row*width].position,control[row*width+width-1].position)`.
/// @param height Input used by `for row=0 to height-1`.
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
/// Computes `subdividePatchWithErrors` from `[control,grid[1],grid[2],grid[3],grid[4]]` using `mq3.renderer.bsp_render_data.subdivideHorizontal`, `mq3.renderer.bsp_render_data.transposeGrid`, `mq3.renderer.bsp_render_data.putGridPointsOnCurve`.
/// @param control Value forwarded as `control` to `mq3.renderer.bsp_render_data.subdivideHorizontal`.
/// @param width Value forwarded as `width` to `mq3.renderer.bsp_render_data.subdivideHorizontal`.
/// @param height Value forwarded as `height` to `mq3.renderer.bsp_render_data.subdivideHorizontal`.
/// @param errorLimit Value forwarded as `errorLimit` to `mq3.renderer.bsp_render_data.subdivideHorizontal`.
function subdividePatchWithErrors(control,width,height,errorLimit)
  first=subdivideHorizontal(control,width,height,errorLimit);control=transposeGrid(first[0],first[1],first[2]);width=first[2];height=first[1]
  second=subdivideHorizontal(control,width,height,errorLimit);control=transposeGrid(second[0],second[1],second[2]);width=second[2];height=second[1]
  control=putGridPointsOnCurve(control,width,height)
  grid=compactGrid(control,width,height,first[3],second[3])
  control=makeGridNormals(grid[0],grid[1],grid[2])
  return [control,grid[1],grid[2],grid[3],grid[4]]
end function
/// Returns `[grid[0],grid[1],grid[2]]` from `mq3.renderer.bsp_render_data.subdividePatch`.
/// @param control Value forwarded as `control` to `mq3.renderer.bsp_render_data.subdividePatchWithErrors`.
/// @param width Value forwarded as `width` to `mq3.renderer.bsp_render_data.subdividePatchWithErrors`.
/// @param height Value forwarded as `height` to `mq3.renderer.bsp_render_data.subdividePatchWithErrors`.
/// @param errorLimit Value forwarded as `errorLimit` to `mq3.renderer.bsp_render_data.subdividePatchWithErrors`.
function subdividePatch(control,width,height,errorLimit)
  grid=subdividePatchWithErrors(control,width,height,errorLimit);return [grid[0],grid[1],grid[2]]
end function
/// Builds `control[index]` in `mq3.renderer.bsp_render_data.patchGrid`; returns `subdividePatchWithErrors(control,width,height,errorLimit)`.
/// @param map Record providing `map.counts`.
/// @param faceOffset Input used by `firstVert=i32(map,faceOffset+12)`.
/// @param errorLimit Value forwarded as `errorLimit` to `mq3.renderer.bsp_render_data.subdividePatchWithErrors`.
function patchGrid(map,faceOffset,errorLimit)
  firstVert=i32(map,faceOffset+12);numVerts=i32(map,faceOffset+16);width=i32(map,faceOffset+96);height=i32(map,faceOffset+100)
  if firstVert is error or numVerts is error or firstVert<0 or numVerts<0 or firstVert+numVerts>map.counts[10] then return fail("face vertex range outside lump") end if
  if width is error or height is error or width<3 or height<3 or width>MAX_PATCH_SIZE or height>MAX_PATCH_SIZE or width%2==0 or height%2==0 or width*height!=numVerts then return fail("invalid patch control grid") end if
  control=array(numVerts,void)
  for index=0 to numVerts-1 value=vertex(map,firstVert+index);if value is error then return value end if;control[index]=value end for
  return subdividePatchWithErrors(control,width,height,errorLimit)
end function
/// Computes `appendPatchGrid` from `[count,truncated]` using `triangles.add`, `mq3.renderer.bsp_render_data.RenderTriangle`.
/// @param triangles Record providing `triangles.size`, `triangles.add`.
/// @param control Indexed input read at `a`, `b`, `c`, `d`.
/// @param width Input used by `a=rows[row]*width+columns[column]`.
/// @param columns Indexed input read at `column`, `column+1`.
/// @param rows Indexed input read at `row`, `row+1`.
/// @param textureIndex Value used for `mq3.renderer.bsp_render_data.RenderTriangle.textureIndex`.
/// @param lightmapIndex Value used for `mq3.renderer.bsp_render_data.RenderTriangle.lightmapIndex`.
/// @param fogIndex Value used for `mq3.renderer.bsp_render_data.RenderTriangle.fogIndex`.
/// @param faceIndex Value used for `mq3.renderer.bsp_render_data.RenderTriangle.faceIndex`.
/// @param maxTriangles Input tested by `triangles.size<maxTriangles`.
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
/// Builds `indexes[index]` in `mq3.renderer.bsp_render_data.gridIndexes`; returns `indexes`.
/// @param size Argument 1 supplied to `array`.
function gridIndexes(size)
  indexes=array(size,0);for index=0 to size-1 indexes[index]=index end for;return indexes
end function

// Face and meshvert order is retained. Repeated face indexes are ignored after
// their first occurrence, giving visible-leaf callers a stable render stream.
// Validation continues beyond maxTriangles so malformed BSP input cannot hide
// behind an output limit.
/// @param map Value forwarded as `map` to `mq3.renderer.bsp_render_data.extractMode`.
/// @param faceIndexes Value forwarded as `faceIndexes` to `mq3.renderer.bsp_render_data.extractMode`.
/// @param maxTriangles Value forwarded as `maxTriangles` to `mq3.renderer.bsp_render_data.extractMode`.
/// @param patchError Value forwarded as `patchError` to `mq3.renderer.bsp_render_data.extractMode`.
function extractWithPatchError(map,faceIndexes,maxTriangles,patchError) return extractMode(map,faceIndexes,maxTriangles,patchError,false) end function
// Internal retained-world path. Consumers must treat shared face vertices as
// immutable; the public extractor deliberately keeps its independent corners.
/// @param map Value forwarded as `map` to `mq3.renderer.bsp_render_data.extractMode`.
/// @param faceIndexes Value forwarded as `faceIndexes` to `mq3.renderer.bsp_render_data.extractMode`.
/// @param maxTriangles Value forwarded as `maxTriangles` to `mq3.renderer.bsp_render_data.extractMode`.
/// @param patchError Value forwarded as `patchError` to `mq3.renderer.bsp_render_data.extractMode`.
function extractRetainedWithPatchError(map,faceIndexes,maxTriangles,patchError) return extractMode(map,faceIndexes,maxTriangles,patchError,true) end function
/// Computes `patchNoDraw` from `(surfaceFlags&0x80)!=0` using `mq3.renderer.bsp_render_data.recordRange`, `mq3.renderer.bsp_render_data.i32`, `return`.
/// @param map Value forwarded as `map` to `mq3.renderer.bsp_render_data.recordRange`.
/// @param textureIndex Value forwarded as `index` to `mq3.renderer.bsp_render_data.recordRange`.
function patchNoDraw(map,textureIndex)
  shaderOffset=recordRange(map,1,textureIndex,72);if shaderOffset is error then return shaderOffset end if
  surfaceFlags=i32(map,shaderOffset+64);if surfaceFlags is error then return surfaceFlags end if
  return (surfaceFlags&0x80)!=0
end function
/// Builds `mq3.renderer.bsp_render_data.RenderData` after updating `seen[faceIndex]`, `decodedVertices[relative]`, `verts[corner]`.
/// @param map Record providing `map.counts`.
/// @param faceIndexes Sequence traversed as `faceIndex` while producing this result.
/// @param maxTriangles Value forwarded as `maxTriangles` to `mq3.renderer.bsp_render_data.appendPatchGrid`.
/// @param patchError Value forwarded as `errorLimit` to `mq3.renderer.bsp_render_data.patchGrid`.
/// @param shareFaceVertices Input tested by `shareFaceVertices`.
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

/// Calls `mq3.renderer.bsp_render_data.extractWithPatchError` with `(map,faceIndexes,maxTriangles,DEFAULT_PATCH_ERROR)` and returns its result.
/// @param map Value forwarded as `map` to `mq3.renderer.bsp_render_data.extractWithPatchError`.
/// @param faceIndexes Value forwarded as `faceIndexes` to `mq3.renderer.bsp_render_data.extractWithPatchError`.
/// @param maxTriangles Value forwarded as `maxTriangles` to `mq3.renderer.bsp_render_data.extractWithPatchError`.
function extract(map,faceIndexes,maxTriangles) return extractWithPatchError(map,faceIndexes,maxTriangles,DEFAULT_PATCH_ERROR) end function

/// Builds `faces[index]` in `mq3.renderer.bsp_render_data.all`; returns `extract(map,faces,maxTriangles)`.
/// @param map Record providing `map.counts`.
/// @param maxTriangles Value forwarded as `maxTriangles` to `mq3.renderer.bsp_render_data.extract`.
function all(map,maxTriangles)
  if not validMap(map) then return fail("invalid BSP object") end if
  faces=array(map.counts[13],void);for index=0 to map.counts[13]-1 faces[index]=index end for
  return extract(map,faces,maxTriangles)
end function

/// Returns `slice(map.data,offset,LIGHTMAP_RGB_SIZE)` from `mq3.renderer.bsp_render_data.lightmapRgb`; earlier branches return `fail("invalid BSP object")`, `offset`.
/// @param map Record providing `map.data`.
/// @param index Value forwarded as `index` to `mq3.renderer.bsp_render_data.recordRange`.
function lightmapRgb(map,index)
  if not validMap(map) then return fail("invalid BSP object") end if
  offset=recordRange(map,14,index,LIGHTMAP_RGB_SIZE);if offset is error then return offset end if
  return slice(map.data,offset,LIGHTMAP_RGB_SIZE)
end function

// R_ColorShiftLightingBytes. The dependency-free software renderer has no
// hardware gamma ramp, so tr.overbrightBits is zero while Baseq3's default
// r_mapOverBrightBits remains two.
/// @param red Input used by `r=red<<shift`.
/// @param green Input used by `g=green<<shift`.
/// @param blue Input used by `b=blue<<shift`.
/// @param shift Input tested by `shift<0 or shift>8`.
function colorShiftLighting(red,green,blue,shift)
  if shift<0 or shift>8 then return fail("light overbright shift outside range") end if
  r=red<<shift;g=green<<shift;b=blue<<shift
  if (r|g|b)>255 then maximum=r;if g>maximum then maximum=g end if;if b>maximum then maximum=b end if;r=n.quotient(r*255,maximum);g=n.quotient(g*255,maximum);b=n.quotient(b*255,maximum) end if
  return [r,g,b]
end function
/// Builds `rgba[pixel*4]`, `rgba[pixel*4+1]`, `rgba[pixel*4+2]` in `mq3.renderer.bsp_render_data.lightmapRgbaShift`; returns `rgba`.
/// @param map Value forwarded as `map` to `mq3.renderer.bsp_render_data.lightmapRgb`.
/// @param index Value forwarded as `index` to `mq3.renderer.bsp_render_data.lightmapRgb`.
/// @param mapOverbrightBits Input used by `shift=mapOverbrightBits-rendererOverbrightBits`.
/// @param rendererOverbrightBits Input used by `shift=mapOverbrightBits-rendererOverbrightBits`.
function lightmapRgbaShift(map,index,mapOverbrightBits,rendererOverbrightBits)
  rgb=lightmapRgb(map,index);if rgb is error then return rgb end if
  shift=mapOverbrightBits-rendererOverbrightBits;if shift<0 or shift>8 then return fail("invalid lightmap overbright configuration") end if
  rgba=bytes(LIGHTMAP_WIDTH*LIGHTMAP_HEIGHT*4,255)
  for pixel=0 to LIGHTMAP_WIDTH*LIGHTMAP_HEIGHT-1
    shifted=colorShiftLighting(rgb[pixel*3],rgb[pixel*3+1],rgb[pixel*3+2],shift);rgba[pixel*4]=shifted[0];rgba[pixel*4+1]=shifted[1];rgba[pixel*4+2]=shifted[2]
  end for
  return rgba
end function
/// Calls `mq3.renderer.bsp_render_data.lightmapRgbaShift` with `(map,index,2,0)` and returns its result.
/// @param map Value forwarded as `map` to `mq3.renderer.bsp_render_data.lightmapRgbaShift`.
/// @param index Value forwarded as `index` to `mq3.renderer.bsp_render_data.lightmapRgbaShift`.
function lightmapRgba(map,index) return lightmapRgbaShift(map,index,2,0) end function
