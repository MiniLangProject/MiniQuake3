// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Shared patch seam stitching and LOD synchronization.
package mq3.renderer.patch_stitch

import mq3.renderer.bsp_render_data as render

const MAX_GRID_SIZE=65

function abs(value) if value<0.0 then return 0.0-value end if;return value end function
function nearPoint(a,b,tolerance) return abs(a[0]-b[0])<=tolerance and abs(a[1]-b[1])<=tolerance and abs(a[2]-b[2])<=tolerance end function
function sameLodGroup(a,b) return a.lodRadius==b.lodRadius and a.lodOrigin==b.lodOrigin end function

function edgePoint(grid,side,index) if side==0 then return grid.control[index] end if;if side==1 then return grid.control[(grid.height-1)*grid.width+index] end if;if side==2 then return grid.control[index*grid.width] end if;return grid.control[index*grid.width+grid.width-1] end function
function edgeCount(grid,side) if side<2 then return grid.width end if;return grid.height end function
function edgeErrors(grid,side) if side<2 then return grid.widthLodError end if;return grid.heightLodError end function
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
function R_FixSharedVertexLodError(grids) for index=0 to len(grids)-1 if not grids[index].lodFixed then grids[index].lodFixed=2;R_FixSharedVertexLodError_r(grids,index+1,grids[index]) end if end for;return grids end function

function atPosition(vertex,position) return render.RenderVertex(position,vertex.baseUV,vertex.lightmapUV,vertex.normal,vertex.color,vertex.entityColor,vertex.entityTexCoord,vertex.shaderTime,vertex.sourceIndex) end function
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
function insertError(source,at,value)
  result=array(len(source)+1,0.0)
  copyArray(result,0,source,0,at);result[at]=value
  copyArray(result,at+1,source,at,len(source)-at)
  return result
end function
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
function R_StitchAllPatches(grids)
  count=0;changed=true;guard=0;while changed and guard<MAX_GRID_SIZE*len(grids) changed=false;for i=0 to len(grids)-1 for j=0 to len(grids)-1 if i!=j and R_StitchPatches(grids[i],grids[j]) then count=count+1;changed=true end if end for end for;guard=guard+1 end while;return count
end function
