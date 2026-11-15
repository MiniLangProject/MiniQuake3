// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Quadratic patch subdivision, facet generation and bevels from cm_patch.c.
package mq3.collision.patchmesh
import mq3.compat.numeric as n
import mq3.shared.math as q
import mq3.collision.winding as w
import mq3.qcommon.headers as qcommonHeaders
import std.array as arrays
import mq3.collision.native_planes as nativePlanes

struct Plane
  normal
  distance
  signbits
end struct
struct Facet
  surface
  borders
  inward
  noAdjust
end struct
struct Patch
  planes
  facets
  bounds
  planeCache
end struct
struct Grid
  columns
  wrapWidth
  wrapHeight
end struct

function fail(message)
  return error(3505,"Patch: "+message)
end function
function signbits(normal)
  result = 0
  for axis = 0 to 2
    if normal[axis] < 0 then result = result | (1 << axis) end if
  end for
  return result
end function
function CM_SignbitsForNormal(normal) return signbits(normal) end function
function plane(normal,distance)
  return Plane(normal,distance,CM_SignbitsForNormal(normal))
end function
function CM_PlaneFromPoints(a,b,c)
  normal=q.CrossProduct(w.subtract(c,a),w.subtract(b,a))
  if q.VectorNormalize(normal)==0 then return void end if
  return plane(normal,q.DotProduct(a,normal))
end function
function inverted(p, subtractZero)
  normal = w.negate(p.normal)
  if subtractZero then normal = w.subtract([0.0,0.0,0.0],p.normal) end if
  return plane(normal,n.bitsFloat(n.floatBits(p.distance)^0x80000000))
end function
function closePoints(a,b)
  for axis = 0 to 2
    d = n.fsub(a[axis],b[axis])
    if d < -0.1 or d > 0.1 then return false end if
  end for
  return true
end function
function CM_ComparePoints(a,b) return closePoints(a,b) end function
function needsSubdivision(a,b,c)
  delta = array(3,0.0)
  for axis = 0 to 2
    linear = n.f32(0.5*n.fadd(a[axis],c[axis]))
    curved = n.f32(0.5*(0.5*n.fadd(a[axis],b[axis])+0.5*n.fadd(b[axis],c[axis])))
    delta[axis] = n.fsub(curved,linear)
  end for
  return q.VectorLength(delta) >= 16
end function
function CM_NeedsSubdivision(a,b,c) return needsSubdivision(a,b,c) end function
function CM_Subdivide(a,b,c)
  first=array(3,0.0);middle=array(3,0.0);last=array(3,0.0)
  for axis=0 to 2 first[axis]=n.f32(0.5*n.fadd(a[axis],b[axis]));last[axis]=n.f32(0.5*n.fadd(b[axis],c[axis]));middle[axis]=n.f32(0.5*n.fadd(first[axis],last[axis])) end for
  return [first,middle,last]
end function
function CM_SetGridWrapWidth(grid)
  columns = grid.columns
  height = len(columns[0])
  grid.wrapWidth = true
  j = 0
  while j < height
    if not closePoints(columns[0][j],columns[len(columns)-1][j]) then grid.wrapWidth = false;break end if
    j = j+1
  end while
  return void
end function
function CM_SubdivideGridColumns(grid)
  columns=grid.columns;height=len(columns[0])
  i = 0
  while i < len(columns)-2
    needed = false;j = 0
    while j < height
      if needsSubdivision(columns[i][j],columns[i+1][j],columns[i+2][j]) then needed = true;break end if
      j = j+1
    end while
    if not needed then
      columns = arrays.slice(columns,0,i+1)+arrays.slice(columns,i+2,len(columns)-i-2)
      i = i+1;continue
    end if
    if len(columns)+2 > qcommonHeaders.MAX_GRID_SIZE then return fail("subdivision grid limit exceeded") end if
    first = array(height,void);middle = array(height,void);last = array(height,void)
    j = 0
    while j < height
      divided=CM_Subdivide(columns[i][j],columns[i+1][j],columns[i+2][j]);first[j]=divided[0];middle[j]=divided[1];last[j]=divided[2]
      j = j+1
    end while
    columns = arrays.slice(columns,0,i+1)+[first,middle,last]+arrays.slice(columns,i+2,len(columns)-i-2)
  end while
  grid.columns=columns;return void
end function
function CM_RemoveDegenerateColumns(grid)
  columns=grid.columns;height=len(columns[0])
  i = 0
  while i < len(columns)-1
    identical = true;j = 0
    while j < height
      if not closePoints(columns[i][j],columns[i+1][j]) then identical = false;break end if
      j = j+1
    end while
    if identical then
      columns = arrays.slice(columns,0,i+1)+arrays.slice(columns,i+2,len(columns)-i-2)
    else
      i = i+1
    end if
  end while
  grid.columns = columns
  return void
end function
function subdivideColumns(grid)
  CM_SetGridWrapWidth(grid);CM_SubdivideGridColumns(grid);CM_RemoveDegenerateColumns(grid);return void
end function
function CM_TransposeGrid(grid)
  width = len(grid.columns);height = len(grid.columns[0])
  columns = array(height,void)
  j = 0
  while j < height
    column = array(width,void);i = 0
    while i < width
      column[i] = grid.columns[i][j];i = i+1
    end while
    columns[j] = column;j = j+1
  end while
  grid.columns = columns
  previous = grid.wrapWidth;grid.wrapWidth = grid.wrapHeight;grid.wrapHeight = previous
  return void
end function
function transpose(grid) return CM_TransposeGrid(grid) end function
function appendPlane(patch, p)
  if len(patch.planes) >= 2048 then return fail("plane limit exceeded") end if
  if patch.planeCache!=void then stored=nativePlanes.store(patch.planeCache,len(patch.planes),p);if stored!=1 then return fail("plane cache rejected insertion") end if end if
  patch.planes = patch.planes+[p]
  return len(patch.planes)-1
end function
function equalPlane(a,b)
  for flip = 0 to 1
    candidate = b
    if flip == 1 then candidate = inverted(b,false) end if
    matched = q.Q_fabs(n.fsub(a.distance,candidate.distance)) < 0.02
    for axis = 0 to 2
      if q.Q_fabs(n.fsub(a.normal[axis],candidate.normal[axis])) >= 0.0001 then matched = false end if
    end for
    if matched then return flip end if
  end for
  return -1
end function
function CM_PlaneEqual(a,b) return equalPlane(a,b) end function
function findPlane2(patch,p)
  if patch.planeCache!=void then found=nativePlanes.find2(patch.planeCache,len(patch.planes),p);if found>=0 then return [found>>1,found&1] end if;return [appendPlane(patch,p),0] end if
  index = 0
  while index < len(patch.planes)
    flipped = equalPlane(patch.planes[index],p)
    if flipped >= 0 then return [index,flipped] end if
    index = index+1
  end while
  return [appendPlane(patch,p),0]
end function
function CM_FindPlane2(patch,p) return findPlane2(patch,p) end function
function findPlane(patch,a,b,c)
  candidate=CM_PlaneFromPoints(a,b,c);if candidate==void then return -1 end if;normal=candidate.normal
  if patch.planeCache!=void then found=nativePlanes.find(patch.planeCache,len(patch.planes),normal,a,b,c);if found>=0 then return found end if;return appendPlane(patch,candidate) end if
  index = 0
  while index < len(patch.planes)
    p = patch.planes[index]
    if q.DotProduct(normal,p.normal) < 0 then index = index+1;continue end if
    matched = true
    for each point in [a,b,c]
      distance = n.fsub(q.DotProduct(point,p.normal),p.distance)
      if distance < -0.1 or distance > 0.1 then matched = false;break end if
    end for
    if matched then return index end if
    index = index+1
  end while
  return appendPlane(patch,candidate)
end function
function CM_FindPlane(patch,a,b,c) return findPlane(patch,a,b,c) end function
function gridPlane(gridPlanes,i,j,tri)
  index = gridPlanes[i][j][tri]
  if index == -1 then index = gridPlanes[i][j][tri^1] end if
  return index
end function
function CM_GridPlane(gridPlanes,i,j,tri) return gridPlane(gridPlanes,i,j,tri) end function
function edgePlane(patch,grid,gridPlanes,i,j,k)
  points = grid.columns
  a = void;b = void;p = -1;reverse = false
  switch k
    case 0
      a = points[i][j];b = points[i+1][j];p = gridPlane(gridPlanes,i,j,0)
    end case
    case 1
      a = points[i+1][j];b = points[i+1][j+1];p = gridPlane(gridPlanes,i,j,0)
    end case
    case 2
      a = points[i][j+1];b = points[i+1][j+1];p = gridPlane(gridPlanes,i,j,1);reverse = true
    end case
    case 3
      a = points[i][j];b = points[i][j+1];p = gridPlane(gridPlanes,i,j,1);reverse = true
    end case
    case 4
      a = points[i+1][j+1];b = points[i][j];p = gridPlane(gridPlanes,i,j,0)
    end case
    case 5
      a = points[i][j];b = points[i+1][j+1];p = gridPlane(gridPlanes,i,j,1)
    end case
  end switch
  // The original can access plane[-1] for fully degenerate cells. There is no
  // meaningful collision facet there; reject the absent edge deterministically.
  if p < 0 then return -1 end if
  up = q.VectorMA(a,4.0,patch.planes[p].normal)
  if reverse then return findPlane(patch,b,a,up) end if
  return findPlane(patch,a,b,up)
end function
function CM_EdgePlaneNum(patch,grid,gridPlanes,i,j,k) return edgePlane(patch,grid,gridPlanes,i,j,k) end function
function setInward(patch,facet,points)
  k = 0
  while k < len(facet.borders)
    front = false;back = false;index = facet.borders[k]
    if index >= 0 then
      for each point in points
        side=CM_PointOnPlaneSide(patch,point,index)
        if side==0 then front=true end if;if side==1 then back=true end if
      end for
    end if
    if front and not back then facet.inward[k] = 1 end if
    if not front and not back then facet.borders[k] = -1 end if
    k = k+1
  end while
  return void
end function
function CM_SetBorderInward(patch,facet,points) return setInward(patch,facet,points) end function
function facetWinding(patch,facet,skipSurface)
  if facet.surface < 0 then return [] end if
  p = patch.planes[facet.surface]
  points = w.base(p.normal,p.distance)
  j = 0
  while j < len(facet.borders) and len(points) > 0
    index = facet.borders[j]
    if index < 0 then return [] end if
    if skipSurface and index == facet.surface then j = j+1;continue end if
    p = patch.planes[index]
    if facet.inward[j] == 0 then p = inverted(p,true) end if
    points = w.chop(points,p.normal,p.distance)
    j = j+1
  end while
  return points
end function
function CM_ValidateFacet(patch,facet) return validFacet(patch,facet) end function
function validFacet(patch,facet)
  points = facetWinding(patch,facet,false)
  if len(points) == 0 then return false end if
  bounds = w.bounds(points)
  for axis = 0 to 2
    if n.fsub(bounds[1][axis],bounds[0][axis]) > 65535 or bounds[0][axis] >= 65535 or bounds[1][axis] <= -65535 then return false end if
  end for
  return true
end function
function hasPlane(patch,facet,p)
  if CM_PlaneEqual(patch.planes[facet.surface],p) >= 0 then return true end if
  for each index in facet.borders
    if CM_PlaneEqual(patch.planes[index],p) >= 0 then return true end if
  end for
  return false
end function
function addBorder(facet,index,inward,noAdjust)
  if len(facet.borders) >= 26 then return fail("facet border limit exceeded") end if
  facet.borders = facet.borders+[index]
  facet.inward = facet.inward+[inward]
  facet.noAdjust = facet.noAdjust+[noAdjust]
  return void
end function
function snap(normal)
  for axis = 0 to 2
    for each direction in [-1.0,1.0]
      if q.Q_fabs(n.fsub(normal[axis],direction)) < 0.0001 then
        result = [0.0,0.0,0.0];result[axis] = direction;return result
      end if
    end for
  end for
  return normal
end function
function CM_SnapVector(normal) return snap(normal) end function
function addBevels(patch,facet)
  points = facetWinding(patch,facet,true)
  if len(points) == 0 then return void end if
  bounds = w.bounds(points)
  for axis = 0 to 2
    for each direction in [-1.0,1.0]
      normal = [0.0,0.0,0.0];normal[axis] = direction
      distance = bounds[1][axis]
      if direction == -1 then distance = n.fneg(bounds[0][axis]) end if
      p = plane(normal,distance)
      if not hasPlane(patch,facet,p) then
        found = CM_FindPlane2(patch,p);addBorder(facet,found[0],found[1],0)
      end if
    end for
  end for
  j = 0
  while j < len(points)
    vector = w.subtract(points[j],points[(j+1)%len(points)])
    if q.VectorNormalize(vector) < 0.5 then j = j+1;continue end if
    vector = CM_SnapVector(vector)
    axial = false
    for axis = 0 to 2
      if vector[axis] == -1 or vector[axis] == 1 then axial = true end if
    end for
    if axial then j = j+1;continue end if
    for axis = 0 to 2
      for each direction in [-1.0,1.0]
        vector2 = [0.0,0.0,0.0];vector2[axis] = direction
        normal = q.CrossProduct(vector,vector2)
        if q.VectorNormalize(normal) < 0.5 then continue end if
        p = plane(normal,q.DotProduct(points[j],normal))
        valid = true
        for each point in points
          if n.fsub(q.DotProduct(point,normal),p.distance) > 0.1 then valid = false;break end if
        end for
        if not valid or hasPlane(patch,facet,p) then continue end if
        found = CM_FindPlane2(patch,p)
        candidate = patch.planes[found[0]]
        if found[1] == 0 then candidate = inverted(candidate,false) end if
        if len(w.chop(points,candidate.normal,candidate.distance)) == 0 then continue end if
        addBorder(facet,found[0],found[1],0)
      end for
    end for
    j = j+1
  end while
  addBorder(facet,facet.surface,1,0)
  return void
end function
function CM_AddFacetBevels(patch,facet) return addBevels(patch,facet) end function
function addFacet(patch,surface,borders,noAdjust,points)
  if len(patch.facets) >= 1024 then return fail("facet limit exceeded") end if
  facet = Facet(surface,borders,array(len(borders),0),noAdjust)
  CM_SetBorderInward(patch,facet,points)
  if CM_ValidateFacet(patch,facet) then
    CM_AddFacetBevels(patch,facet)
    patch.facets = patch.facets+[facet]
  end if
  return void
end function
function fromGrid(grid,patch)
  columns = grid.columns;width = len(columns);height = len(columns[0])
  gridPlanes = array(width,void);i = 0
  while i < width
    gridPlanes[i] = array(height,void);j = 0
    while j < height
      gridPlanes[i][j] = [-1,-1];j = j+1
    end while
    i = i+1
  end while
  i = 0
  while i < width-1
    j = 0
    while j < height-1
      gridPlanes[i][j][0] = CM_FindPlane(patch,columns[i][j],columns[i+1][j],columns[i+1][j+1])
      gridPlanes[i][j][1] = CM_FindPlane(patch,columns[i+1][j+1],columns[i][j+1],columns[i][j])
      j = j+1
    end while
    i = i+1
  end while
  i = 0
  while i < width-1
    j = 0
    while j < height-1
      borders = [-1,-1,-1,-1];noAdjust = [0,0,0,0];pair = gridPlanes[i][j]
      if j > 0 then borders[0] = gridPlanes[i][j-1][1] else if grid.wrapHeight then borders[0] = gridPlanes[i][height-2][1] end if
      if j < height-2 then borders[2] = gridPlanes[i][j+1][0] else if grid.wrapHeight then borders[2] = gridPlanes[i][0][0] end if
      if i > 0 then borders[3] = gridPlanes[i-1][j][0] else if grid.wrapWidth then borders[3] = gridPlanes[width-2][j][0] end if
      if i < width-2 then borders[1] = gridPlanes[i+1][j][1] else if grid.wrapWidth then borders[1] = gridPlanes[0][j][1] end if
      // Original order matters because plane interning is tolerance based.
      for each side in [0,2,3,1]
        tri = 0
        if side == 2 or side == 3 then tri = 1 end if
        if borders[side] == pair[tri] then noAdjust[side] = 1 end if
        if borders[side] == -1 or noAdjust[side] != 0 then borders[side] = CM_EdgePlaneNum(patch,grid,gridPlanes,i,j,side) end if
      end for
      a = columns[i][j];b = columns[i+1][j];c = columns[i+1][j+1];d = columns[i][j+1]
      if pair[0] == pair[1] then
        if pair[0] != -1 then addFacet(patch,pair[0],borders,noAdjust,[a,b,c,d]) end if
      else
        diagonal = pair[1]
        if diagonal == -1 then
          diagonal = borders[2]
          if diagonal == -1 then diagonal = CM_EdgePlaneNum(patch,grid,gridPlanes,i,j,4) end if
        end if
        addFacet(patch,pair[0],[borders[0],borders[1],diagonal],[noAdjust[0],noAdjust[1],0],[a,b,c])
        diagonal = pair[0]
        if diagonal == -1 then
          diagonal = borders[0]
          if diagonal == -1 then diagonal = CM_EdgePlaneNum(patch,grid,gridPlanes,i,j,5) end if
        end if
        addFacet(patch,pair[1],[borders[2],borders[3],diagonal],[noAdjust[2],noAdjust[3],0],[c,d,a])
      end if
      j = j+1
    end while
    i = i+1
  end while
  return void
end function
function CM_PatchCollideFromGrid(grid,patch) return fromGrid(grid,patch) end function
function CM_PointOnPlaneSide(patch,point,index)
  if index==-1 then return 2 end if
  p=patch.planes[index];distance=n.fsub(q.DotProduct(point,p.normal),p.distance)
  if distance>0.1 then return 0 end if;if distance< -0.1 then return 1 end if;return 2
end function
function generate(width,height,points)
  if width <= 2 or height <= 2 or width > qcommonHeaders.MAX_GRID_SIZE or height > qcommonHeaders.MAX_GRID_SIZE or (width & 1) == 0 or (height & 1) == 0 or len(points) != width*height then return fail("invalid quadratic grid dimensions") end if
  columns = array(width,void);i = 0
  while i < width
    columns[i] = array(height,void);j = 0
    while j < height
      columns[i][j] = points[j*width+i];j = j+1
    end while
    i = i+1
  end while
  grid = Grid(columns,false,false)
  CM_SetGridWrapWidth(grid);CM_SubdivideGridColumns(grid);CM_RemoveDegenerateColumns(grid)
  CM_TransposeGrid(grid)
  CM_SetGridWrapWidth(grid);CM_SubdivideGridColumns(grid);CM_RemoveDegenerateColumns(grid)
  allPoints = []
  for each column in grid.columns
    allPoints = allPoints+column
  end for
  patch = Patch([],[],w.bounds(allPoints),bytes(2048*16,0))
  CM_PatchCollideFromGrid(grid,patch)
  for axis = 0 to 2
    patch.bounds[0][axis] = n.fsub(patch.bounds[0][axis],1.0)
    patch.bounds[1][axis] = n.fadd(patch.bounds[1][axis],1.0)
  end for
  return patch
end function
function CM_GeneratePatchCollide(width,height,points) return generate(width,height,points) end function
