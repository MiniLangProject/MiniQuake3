// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native facade for renderer/tr_curve.c.  It operates on the same
// retained RenderVertex records consumed by the productive BSP renderer.
package mq3.renderer.tr_curve_runtime

import mq3.compat.numeric as n
import mq3.renderer.bsp_render_data as render

/// Largest tessellated patch-grid dimension accepted by the renderer.
const MAX_GRID_SIZE=65
/// Surface-dispatch tag identifying a tessellated curved-patch grid.
const SF_GRID=3
/// Data record for `mq3.renderer.tr_curve_runtime.Grid`; groups `surfaceType`, `width`, `height`, `verts`, `widthLodError`, `heightLodError`, and 6 further fields.
struct Grid
  /// Surface-dispatch tag identifying the concrete geometry representation.
  surfaceType
  /// Number of columns in the patch vertex grid.
  width
  /// Number of rows in the patch vertex grid.
  height
  /// Tessellated patch vertices retained with the grid's bounds and detail-error arrays.
  verts
  /// Per-column geometric error used when selecting patch detail.
  widthLodError
  /// Per-row geometric error used when selecting patch detail.
  heightLodError
  /// Axis-aligned bounds enclosing the tessellated patch mesh.
  meshBounds
  /// Center of the mesh's local-space bounding sphere.
  localOrigin
  /// Radius of the mesh's local-space bounding sphere.
  meshRadius
  /// Reference origin used when evaluating patch level of detail.
  lodOrigin
  /// Reference radius used when evaluating patch level of detail.
  lodRadius
  /// Whether the grid has been released and must no longer be used.
  freed
end struct

/// Creates error `7730` with message `"tr_curve: "+message`.
/// @param message Input used in the result expression `error(7730,"tr_curve: "+message)`.
function fail(message) return error(7730,"tr_curve: "+message) end function
/// Returns `render.halfVertex(a,b)` from `mq3.renderer.tr_curve_runtime.LerpDrawVert`; earlier branches return `fail("vertices required")`.
/// @param a Argument 1 supplied to `mq3.renderer.bsp_render_data.halfVertex`.
/// @param b Argument 2 supplied to `mq3.renderer.bsp_render_data.halfVertex`.
function LerpDrawVert(a,b) if a==void or b==void then return fail("vertices required") end if;return render.halfVertex(a,b) end function
/// Returns `render.transposeGrid(ctrl,width,height)` from `mq3.renderer.tr_curve_runtime.Transpose`; earlier branches return `fail("invalid control grid")`.
/// @param width Argument 2 supplied to `mq3.renderer.bsp_render_data.transposeGrid`.
/// @param height Argument 3 supplied to `mq3.renderer.bsp_render_data.transposeGrid`.
/// @param ctrl Argument 1 supplied to `mq3.renderer.bsp_render_data.transposeGrid`.
function Transpose(width,height,ctrl)
  if width<=0 or height<=0 or ctrl==void or len(ctrl)<width*height then return fail("invalid control grid") end if
  return render.transposeGrid(ctrl,width,height)
end function
/// Returns `render.makeGridNormals(ctrl,width,height)` from `mq3.renderer.tr_curve_runtime.MakeMeshNormals`; earlier branches return `fail("invalid control grid")`.
/// @param width Argument 2 supplied to `mq3.renderer.bsp_render_data.makeGridNormals`.
/// @param height Argument 3 supplied to `mq3.renderer.bsp_render_data.makeGridNormals`.
/// @param ctrl Argument 1 supplied to `mq3.renderer.bsp_render_data.makeGridNormals`.
function MakeMeshNormals(width,height,ctrl)
  if width<=0 or height<=0 or ctrl==void or len(ctrl)<width*height then return fail("invalid control grid") end if
  return render.makeGridNormals(ctrl,width,height)
end function
/// Returns each control-grid row in reversed column order after validating its dimensions and storage.
/// @param width Input tested by `width<=0 or height<=0 or len(ctrl)<width*height`.
/// @param height Input tested by `width<=0 or height<=0 or len(ctrl)<width*height`.
/// @param ctrl Indexed input read at `row*width+width-1-column`.
function InvertCtrl(width,height,ctrl)
  if width<=0 or height<=0 or len(ctrl)<width*height then return fail("invalid control grid") end if
  result=[];for row=0 to height-1 for column=0 to width-1 result=result+[ctrl[row*width+width-1-column]] end for end for;return result
end function
/// Builds `second[index]`, `first[index]` in `mq3.renderer.tr_curve_runtime.InvertErrorTable`; returns `[first,second]`.
/// @param errorTable Nested indexed data; outer entries read at `0`, `1`.
/// @param width Input tested by `errorTable==void or len(errorTable)!=2 or len(errorTable[0])<width or len(errorTable[1])<height`.
/// @param height Input tested by `errorTable==void or len(errorTable)!=2 or len(errorTable[0])<width or len(errorTable[1])<height`.
function InvertErrorTable(errorTable,width,height)
  if errorTable==void or len(errorTable)!=2 or len(errorTable[0])<width or len(errorTable[1])<height then return fail("invalid error table") end if
  first=array(MAX_GRID_SIZE,0.0);second=array(MAX_GRID_SIZE,0.0)
  for index=0 to width-1 second[index]=errorTable[0][index] end for
  for index=0 to height-1 first[index]=errorTable[1][height-1-index] end for
  return [first,second]
end function
/// Returns `render.putGridPointsOnCurve(ctrl,width,height)` from `mq3.renderer.tr_curve_runtime.PutPointsOnCurve`; earlier branches return `fail("invalid control grid")`.
/// @param ctrl Argument 1 supplied to `mq3.renderer.bsp_render_data.putGridPointsOnCurve`.
/// @param width Argument 2 supplied to `mq3.renderer.bsp_render_data.putGridPointsOnCurve`.
/// @param height Argument 3 supplied to `mq3.renderer.bsp_render_data.putGridPointsOnCurve`.
function PutPointsOnCurve(ctrl,width,height)
  if width<=0 or height<=0 or ctrl==void or len(ctrl)<width*height then return fail("invalid control grid") end if
  return render.putGridPointsOnCurve(ctrl,width,height)
end function
/// Builds `minimum[axis]`, `maximum[axis]` in `mq3.renderer.tr_curve_runtime.bounds`; returns `[minimum,maximum]`.
/// @param vertices Indexed input read at `0`.
function bounds(vertices)
  minimum=[vertices[0].position[0],vertices[0].position[1],vertices[0].position[2]];maximum=[minimum[0],minimum[1],minimum[2]]
  for each vertex in vertices for axis=0 to 2 if vertex.position[axis]<minimum[axis] then minimum[axis]=vertex.position[axis] end if;if vertex.position[axis]>maximum[axis] then maximum[axis]=vertex.position[axis] end if end for end for
  return [minimum,maximum]
end function
/// Builds `mq3.renderer.tr_curve_runtime.Grid` for `mq3.renderer.tr_curve_runtime.R_CreateSurfaceGridMesh`.
/// @param width Initial value for `mq3.renderer.tr_curve_runtime.Grid.width`.
/// @param height Initial value for `mq3.renderer.tr_curve_runtime.Grid.height`.
/// @param ctrl Indexed input read at `index`.
/// @param errorTable Nested indexed data; outer entries read at `0`, `1`.
function R_CreateSurfaceGridMesh(width,height,ctrl,errorTable)
  if width<=0 or height<=0 or width>MAX_GRID_SIZE or height>MAX_GRID_SIZE or ctrl==void or len(ctrl)<width*height then return fail("invalid grid dimensions") end if
  if errorTable==void or len(errorTable)!=2 or len(errorTable[0])<width or len(errorTable[1])<height then return fail("invalid grid error table") end if
  vertices=[];for index=0 to width*height-1 vertices=vertices+[ctrl[index]] end for;box=bounds(vertices);origin=[];radiusSquared=0.0
  for axis=0 to 2 center=(box[0][axis]+box[1][axis])*0.5;origin=origin+[center];delta=box[0][axis]-center;radiusSquared=radiusSquared+delta*delta end for
  widthErrors=[];for index=0 to width-1 widthErrors=widthErrors+[errorTable[0][index]] end for;heightErrors=[];for index=0 to height-1 heightErrors=heightErrors+[errorTable[1][index]] end for
  return Grid(SF_GRID,width,height,vertices,widthErrors,heightErrors,box,origin,n.fsqrt(radiusSquared),[origin[0],origin[1],origin[2]],n.fsqrt(radiusSquared),false)
end function
/// Updates `grid.widthLodError`, `grid.heightLodError`, `grid.verts`, `grid.freed` in `mq3.renderer.tr_curve_runtime.R_FreeSurfaceGridMesh`; returns `true`.
/// @param grid Mutable record or buffer; this call updates `grid.widthLodError`, `grid.heightLodError`, `grid.verts`, `grid.freed`.
function R_FreeSurfaceGridMesh(grid)
  if grid==void then return false end if;grid.widthLodError=[];grid.heightLodError=[];grid.verts=[];grid.freed=true;return true
end function
/// Computes `R_SubdividePatchToGrid` from `R_CreateSurfaceGridMesh(width,height,ctrl,errorTable)` using `mq3.renderer.bsp_render_data.subdivideHorizontal`, `mq3.renderer.bsp_render_data.transposeGrid`, `mq3.renderer.bsp_render_data.putGridPointsOnCurve`.
/// @param width Argument 2 supplied to `mq3.renderer.bsp_render_data.subdivideHorizontal`.
/// @param height Argument 3 supplied to `mq3.renderer.bsp_render_data.subdivideHorizontal`.
/// @param points Argument 1 supplied to `mq3.renderer.bsp_render_data.subdivideHorizontal`.
/// @param subdivisions Argument 4 supplied to `mq3.renderer.bsp_render_data.subdivideHorizontal`.
function R_SubdividePatchToGrid(width,height,points,subdivisions)
  if width<3 or height<3 or width>MAX_GRID_SIZE or height>MAX_GRID_SIZE or width%2==0 or height%2==0 or points==void or len(points)<width*height or subdivisions<=0.0 then return fail("invalid patch control grid") end if
  first=render.subdivideHorizontal(points,width,height,subdivisions);ctrl=render.transposeGrid(first[0],first[1],first[2]);width=first[2];height=first[1]
  second=render.subdivideHorizontal(ctrl,width,height,subdivisions);ctrl=render.transposeGrid(second[0],second[1],second[2]);width=second[2];height=second[1]
  ctrl=render.putGridPointsOnCurve(ctrl,width,height)
  compacted=render.compactGrid(ctrl,width,height,first[3],second[3])
  ctrl=compacted[0];width=compacted[1];height=compacted[2]
  errorTable=[compacted[3],compacted[4]]
  if height>width then
    ctrl=Transpose(width,height,ctrl);errorTable=InvertErrorTable(errorTable,width,height);temporary=width;width=height;height=temporary;ctrl=InvertCtrl(width,height,ctrl)
  end if
  ctrl=MakeMeshNormals(width,height,ctrl);return R_CreateSurfaceGridMesh(width,height,ctrl,errorTable)
end function
/// Builds `result.lodOrigin`, `result.lodRadius` in `mq3.renderer.tr_curve_runtime.R_GridInsertColumn`; returns `result`.
/// @param grid Record providing `grid.freed`, `grid.width`, `grid.height`, `grid.verts`, `grid.widthLodError`, `grid.heightLodError`.
/// @param column Input tested by `column<=0 or column>=grid.width or row<0 or row>=height or point==void or len(point)!=3`.
/// @param row Input tested by `column<=0 or column>=grid.width or row<0 or row>=height or point==void or len(point)!=3`.
/// @param point Three-component vector read at indices 0, 1, and 2.
/// @param loderror Input used by `widthErrors=widthErrors+[loderror]`.
function R_GridInsertColumn(grid,column,row,point,loderror)
  if grid==void or grid.freed then return fail("live grid required") end if
  width=grid.width+1;height=grid.height;if width>MAX_GRID_SIZE then return void end if
  if column<=0 or column>=grid.width or row<0 or row>=height or point==void or len(point)!=3 then return fail("invalid column insertion") end if
  ctrl=[];widthErrors=[];old=0
  for current=0 to width-1
    if current==column then
      widthErrors=widthErrors+[loderror]
      for targetRow=0 to height-1 value=LerpDrawVert(grid.verts[targetRow*grid.width+current-1],grid.verts[targetRow*grid.width+current]);if targetRow==row then value=render.RenderVertex([point[0],point[1],point[2]],value.baseUV,value.lightmapUV,value.normal,value.color,value.entityColor,value.entityTexCoord,value.shaderTime,value.sourceIndex) end if;ctrl=ctrl+[value] end for
    else widthErrors=widthErrors+[grid.widthLodError[old]];for targetRow=0 to height-1 ctrl=ctrl+[grid.verts[targetRow*grid.width+old]] end for;old=old+1 end if
  end for
  // Column-major construction above is rearranged into row-major control order.
  rowMajor=[];for targetRow=0 to height-1 for current=0 to width-1 rowMajor=rowMajor+[ctrl[current*height+targetRow]] end for end for
  table=[widthErrors,grid.heightLodError];rowMajor=MakeMeshNormals(width,height,rowMajor);lodOrigin=grid.lodOrigin;lodRadius=grid.lodRadius;R_FreeSurfaceGridMesh(grid);result=R_CreateSurfaceGridMesh(width,height,rowMajor,table);result.lodOrigin=lodOrigin;result.lodRadius=lodRadius;return result
end function
/// Builds `result.lodOrigin`, `result.lodRadius` in `mq3.renderer.tr_curve_runtime.R_GridInsertRow`; returns `result`.
/// @param grid Record providing `grid.freed`, `grid.width`, `grid.height`, `grid.verts`, `grid.heightLodError`, `grid.widthLodError`.
/// @param row Input tested by `row<=0 or row>=grid.height or column<0 or column>=width or point==void or len(point)!=3`.
/// @param column Input tested by `row<=0 or row>=grid.height or column<0 or column>=width or point==void or len(point)!=3`.
/// @param point Three-component vector read at indices 0, 1, and 2.
/// @param loderror Input used by `heightErrors=heightErrors+[loderror]`.
function R_GridInsertRow(grid,row,column,point,loderror)
  if grid==void or grid.freed then return fail("live grid required") end if
  width=grid.width;height=grid.height+1;if height>MAX_GRID_SIZE then return void end if
  if row<=0 or row>=grid.height or column<0 or column>=width or point==void or len(point)!=3 then return fail("invalid row insertion") end if
  ctrl=[];heightErrors=[];old=0
  for current=0 to height-1
    if current==row then
      heightErrors=heightErrors+[loderror]
      for targetColumn=0 to width-1 value=LerpDrawVert(grid.verts[(current-1)*width+targetColumn],grid.verts[current*width+targetColumn]);if targetColumn==column then value=render.RenderVertex([point[0],point[1],point[2]],value.baseUV,value.lightmapUV,value.normal,value.color,value.entityColor,value.entityTexCoord,value.shaderTime,value.sourceIndex) end if;ctrl=ctrl+[value] end for
    else heightErrors=heightErrors+[grid.heightLodError[old]];for targetColumn=0 to width-1 ctrl=ctrl+[grid.verts[old*width+targetColumn]] end for;old=old+1 end if
  end for
  table=[grid.widthLodError,heightErrors];ctrl=MakeMeshNormals(width,height,ctrl);lodOrigin=grid.lodOrigin;lodRadius=grid.lodRadius;R_FreeSurfaceGridMesh(grid);result=R_CreateSurfaceGridMesh(width,height,ctrl,table);result.lodOrigin=lodOrigin;result.lodRadius=lodRadius;return result
end function
