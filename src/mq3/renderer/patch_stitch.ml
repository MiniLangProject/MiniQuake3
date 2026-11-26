// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Shared patch seam stitching and LOD synchronization.
package mq3.renderer.patch_stitch

import mq3.renderer.bsp_render_data as render

const MAX_GRID_SIZE=65

/// Returns `value` from `mq3.renderer.patch_stitch.abs`; earlier branches return `0.0-value`.
/// @param value Input tested by `value<0.0`.
function abs(value) if value<0.0 then return 0.0-value end if;return value end function
/// Computes `abs(a[0]-b[0])<=tolerance and abs(a[1]-b[1])<=tolerance and abs(a[2]-b[2])<=tolerance` for `mq3.renderer.patch_stitch.nearPoint`.
/// @param a Three-component vector read at indices 0, 1, and 2.
/// @param b Three-component vector read at indices 0, 1, and 2.
/// @param tolerance Input used in the result expression `abs(a[0]-b[0])<=tolerance and abs(a[1]-b[1])<=tolerance and abs(a[2]-b[2])<=tolerance`.
function nearPoint(a,b,tolerance) return abs(a[0]-b[0])<=tolerance and abs(a[1]-b[1])<=tolerance and abs(a[2]-b[2])<=tolerance end function
/// Computes `a.lodRadius==b.lodRadius and a.lodOrigin==b.lodOrigin` for `mq3.renderer.patch_stitch.sameLodGroup`.
/// @param a Record providing `a.lodRadius`, `a.lodOrigin`.
/// @param b Record providing `b.lodRadius`, `b.lodOrigin`.
function sameLodGroup(a,b) return a.lodRadius==b.lodRadius and a.lodOrigin==b.lodOrigin end function

/// Computes `edgePoint` from `grid.control[index*grid.width+grid.width-1]`.
/// @param grid Record providing `grid.control`, `grid.height`, `grid.width`.
/// @param side Input tested by `side==0`.
/// @param index Input tested by `side==0`.
function edgePoint(grid,side,index) if side==0 then return grid.control[index] end if;if side==1 then return grid.control[(grid.height-1)*grid.width+index] end if;if side==2 then return grid.control[index*grid.width] end if;return grid.control[index*grid.width+grid.width-1] end function
/// Returns `grid.height` from `mq3.renderer.patch_stitch.edgeCount`; earlier branches return `grid.width`.
/// @param grid Record providing `grid.width`, `grid.height`.
/// @param side Input tested by `side<2`.
function edgeCount(grid,side) if side<2 then return grid.width end if;return grid.height end function
/// Returns `grid.heightLodError` from `mq3.renderer.patch_stitch.edgeErrors`; earlier branches return `grid.widthLodError`.
/// @param grid Record providing `grid.widthLodError`, `grid.heightLodError`.
/// @param side Input tested by `side<2`.
function edgeErrors(grid,side) if side<2 then return grid.widthLodError end if;return grid.heightLodError end function
/// Detects nearly coincident interior control points on an edge using a 0.1-unit tolerance.
/// @param grid Value forwarded as `grid` to `mq3.renderer.patch_stitch.edgeCount`.
/// @param side Value forwarded as `side` to `mq3.renderer.patch_stitch.edgeCount`.
function mergedEdge(grid,side)
  count=edgeCount(grid,side)
  if count<4 then return false end if
  for first=1 to count-3
    for second=first+1 to count-2
      if nearPoint(edgePoint(grid,side,first).position,edgePoint(grid,side,second).position,0.1) then return true end if
    end for
  end for
  return false
end function
/// Builds `validTarget[side]`, `targetErrors[second]` in `mq3.renderer.patch_stitch.copyLodErrors`; returns `touched`.
/// @param source Value forwarded as `grid` to `mq3.renderer.patch_stitch.edgeCount`.
/// @param target Value forwarded as `grid` to `mq3.renderer.patch_stitch.mergedEdge`.
function copyLodErrors(source,target)
  touched=false
  validTarget=array(4,false)
  for side=0 to 3 validTarget[side]=not mergedEdge(target,side) end for
  for sourceSide=0 to 3
    sourceCount=edgeCount(source,sourceSide)
    if sourceCount<3 or mergedEdge(source,sourceSide) then continue end if
    sourceErrors=edgeErrors(source,sourceSide)
    for first=1 to sourceCount-2
      point=edgePoint(source,sourceSide,first).position
      for targetSide=0 to 3
        targetCount=edgeCount(target,targetSide)
        if targetCount<3 or not validTarget[targetSide] then continue end if
        targetErrors=edgeErrors(target,targetSide)
        for second=1 to targetCount-2
          if nearPoint(point,edgePoint(target,targetSide,second).position,0.1) then
            targetErrors[second]=sourceErrors[first];touched=true
          end if
        end for
      end for
    end for
  end for
  return touched
end function
/// Builds `other.lodFixed` in `mq3.renderer.patch_stitch.R_FixSharedVertexLodError_r`; returns `true`.
/// @param grids Value forwarded as `grids` to `mq3.renderer.patch_stitch.R_FixSharedVertexLodError_r`.
/// @param start Value forwarded as `start` to `mq3.renderer.patch_stitch.R_FixSharedVertexLodError_r`.
/// @param grid Value forwarded as `a` to `mq3.renderer.patch_stitch.sameLodGroup`.
function R_FixSharedVertexLodError_r(grids,start,grid)
  index=start
  while index<len(grids)
    other=grids[index]
    if not other.lodFixed and sameLodGroup(grid,other) and copyLodErrors(grid,other) then
      other.lodFixed=2;R_FixSharedVertexLodError_r(grids,start,other)
    end if
    index=index+1
  end while
  return true
end function
/// Updates `grids[index].lodFixed` in `mq3.renderer.patch_stitch.R_FixSharedVertexLodError`; returns `grids`.
/// @param grids Mutable record or buffer; this call updates `grids[index].lodFixed`.
function R_FixSharedVertexLodError(grids) for index=0 to len(grids)-1 if not grids[index].lodFixed then grids[index].lodFixed=2;R_FixSharedVertexLodError_r(grids,index+1,grids[index]) end if end for;return grids end function

/// Forwards `atPosition` to `mq3.renderer.bsp_render_data.RenderVertex` and returns its result.
/// @param vertex Record providing `vertex.baseUV`, `vertex.lightmapUV`, `vertex.normal`, `vertex.color`, `vertex.entityColor`, `vertex.entityTexCoord`.
/// @param position Argument 1 supplied to `mq3.renderer.bsp_render_data.RenderVertex`.
function atPosition(vertex,position) return render.RenderVertex(position,vertex.baseUV,vertex.lightmapUV,vertex.normal,vertex.color,vertex.entityColor,vertex.entityTexCoord,vertex.shaderTime,vertex.sourceIndex) end function
/// Updates `grid.widthLodError`, `grid.control`, `grid.width` in `mq3.renderer.patch_stitch.insertColumn`; returns `true`.
/// @param grid Mutable record or buffer; this call updates `grid.widthLodError`, `grid.control`, `grid.width`.
/// @param column Argument 5 supplied to `copyArray`.
/// @param row Input tested by `currentRow==row`.
/// @param vertex Record providing `vertex.position`.
/// @param errorValue Value forwarded as `value` to `mq3.renderer.patch_stitch.insertError`.
function insertColumn(grid,column,row,vertex,errorValue)
  if grid.width>=MAX_GRID_SIZE then return false end if
  width=grid.width;result=array((width+1)*grid.height,void)
  for currentRow=0 to grid.height-1
    source=currentRow*width;target=currentRow*(width+1)
    copyArray(result,target,grid.control,source,column)
    inserted=render.halfVertex(grid.control[source+column-1],grid.control[source+column])
    if currentRow==row then inserted=atPosition(inserted,vertex.position) end if
    result[target+column]=inserted
    copyArray(result,target+column+1,grid.control,source+column,width-column)
  end for
  grid.widthLodError=insertError(grid.widthLodError,column,errorValue)
  grid.control=result;grid.width=width+1;return true
end function
/// Updates `grid.heightLodError`, `grid.control`, `grid.height` in `mq3.renderer.patch_stitch.insertRow`; returns `true`.
/// @param grid Mutable record or buffer; this call updates `grid.heightLodError`, `grid.control`, `grid.height`.
/// @param row Value forwarded as `at` to `mq3.renderer.patch_stitch.insertError`.
/// @param column Input tested by `col==column`.
/// @param vertex Record providing `vertex.position`.
/// @param errorValue Value forwarded as `value` to `mq3.renderer.patch_stitch.insertError`.
function insertRow(grid,row,column,vertex,errorValue)
  if grid.height>=MAX_GRID_SIZE then return false end if
  width=grid.width;height=grid.height;result=array((height+1)*width,void)
  before=row*width;after=(height-row)*width
  copyArray(result,0,grid.control,0,before)
  copyArray(result,before+width,grid.control,before,after)
  for col=0 to width-1
    inserted=render.halfVertex(grid.control[before-width+col],grid.control[before+col])
    if col==column then inserted=atPosition(inserted,vertex.position) end if
    result[before+col]=inserted
  end for
  grid.heightLodError=insertError(grid.heightLodError,row,errorValue)
  grid.control=result;grid.height=height+1;return true
end function
/// Builds `result[at]` in `mq3.renderer.patch_stitch.insertError`; returns `result`.
/// @param source Argument 3 supplied to `copyArray`.
/// @param at Argument 5 supplied to `copyArray`.
/// @param value Value assigned to `result[at]`.
function insertError(source,at,value)
  result=array(len(source)+1,0.0)
  copyArray(result,0,source,0,at);result[at]=value
  copyArray(result,at+1,source,at,len(source)-at)
  return result
end function
/// Updates `grid2.lodStitched` in `mq3.renderer.patch_stitch.R_StitchPatches`; returns `false`.
/// @param grid1 Value forwarded as `a` to `mq3.renderer.patch_stitch.sameLodGroup`.
/// @param grid2 Mutable record or buffer; this call updates `grid2.lodStitched`.
function R_StitchPatches(grid1,grid2)
  if not sameLodGroup(grid1,grid2) then return false end if
  for side1=0 to 3
    if mergedEdge(grid1,side1) then continue end if
    count1=edgeCount(grid1,side1);sourceErrors=edgeErrors(grid1,side1);start=0;while start<count1-2
    a=edgePoint(grid1,side1,start);middle=edgePoint(grid1,side1,start+1);b=edgePoint(grid1,side1,start+2)
    for side2=0 to 3 count2=edgeCount(grid2,side2);for at=0 to count2-2
      c=edgePoint(grid2,side2,at);d=edgePoint(grid2,side2,at+1)
      if nearPoint(c.position,d.position,0.01) then continue end if
      if (nearPoint(a.position,c.position,0.1) and nearPoint(b.position,d.position,0.1)) or (nearPoint(a.position,d.position,0.1) and nearPoint(b.position,c.position,0.1)) then
        errorValue=sourceErrors[start+1]
        inserted=false;if side2<2 then anchor=0;if side2==1 then anchor=grid2.height-1 end if;inserted=insertColumn(grid2,at+1,anchor,middle,errorValue) else anchor=0;if side2==3 then anchor=grid2.width-1 end if;inserted=insertRow(grid2,at+1,anchor,middle,errorValue) end if;if inserted then grid2.lodStitched=false;return true end if
      end if
    end for end for
    start=start+2
  end while end for;return false
end function
/// Repeats pairwise patch stitching until no changes remain or the grid-size guard is reached.
/// @param grids Indexed input read at `i`, `j`.
function R_StitchAllPatches(grids)
  count=0;changed=true;guard=0;while changed and guard<MAX_GRID_SIZE*len(grids) changed=false;for i=0 to len(grids)-1 for j=0 to len(grids)-1 if i!=j and R_StitchPatches(grids[i],grids[j]) then count=count+1;changed=true end if end for end for;guard=guard+1 end while;return count
end function
