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

/// Plane record for collision.patchmesh, containing `normal`, `distance`, `signbits`.
struct Plane
  /// Normal of a generated patch facet or bevel clipping plane.
  normal
  /// Signed distance defining the patch clipping plane.
  distance
  /// Signx + (signy<<1) + (signz<<2), used as lookup during collision.
  signbits
end struct
/// Facet record for collision.patchmesh, containing `surface`, `borders`, `inward`, `noAdjust`.
struct Facet
  /// Index of the facet's primary surface plane.
  surface
  /// Plane indexes forming the edges of the collision facet.
  borders
  /// Flags indicating which border planes face inward.
  inward
  /// Flags preventing selected border planes from being expanded for trace bounds.
  noAdjust
end struct
/// Patch record for collision.patchmesh, containing `planes`, `facets`, `bounds`, `planeCache`.
struct Patch
  /// Plane records used to classify or clip the represented geometry.
  planes
  /// Collision facets generated from the curved patch.
  facets
  /// Minimum and maximum corners enclosing the patch, expanded for collision tolerance.
  bounds
  /// Lookup cache used to reuse equivalent patch clipping planes.
  planeCache
end struct
/// Grid record for collision.patchmesh, containing `columns`, `wrapWidth`, `wrapHeight`.
struct Grid
  /// Control-point columns of the subdivided patch grid.
  columns
  /// True when the horizontal grid endpoints form a closed seam.
  wrapWidth
  /// True when the vertical grid endpoints form a closed seam.
  wrapHeight
end struct

/// Create the collision.patchmesh error for `fail` with 3505 and the supplied diagnostic text.
/// @param message Message used in `("Patch: " + message)` and `error(3505, ("Patch: " + message))`.
function fail(message)
  return error(3505,"Patch: "+message)
end function
/// Compute signbits in collision.patchmesh; the normal completion returns `result`.
/// @param normal Normal used in `normal[axis]` and `(normal[axis] < 0)`.
function signbits(normal)
  result = 0
  for axis = 0 to 2
    if normal[axis] < 0 then result = result | (1 << axis) end if
  end for
  return result
end function
/// Return `mq3.collision.patchmesh.signbits(normal)` from `collision.patchmesh.CM_SignbitsForNormal`.
/// @param normal Normal passed as `normal` to `mq3.collision.patchmesh.signbits`.
function CM_SignbitsForNormal(normal) return signbits(normal) end function
/// Create `mq3.collision.patchmesh.Plane` with normal=normal; distance=distance; signbits=CM_SignbitsForNormal(normal).
/// @param normal Initial `normal` field stored in the returned or constructed `mq3.collision.patchmesh.Plane` record.
/// @param distance Initial `distance` field stored in the returned or constructed `mq3.collision.patchmesh.Plane` record.
function plane(normal,distance)
  return Plane(normal,distance,CM_SignbitsForNormal(normal))
end function
/// Compute plane from points in collision.patchmesh; the normal completion returns `plane(normal, q.DotProduct(a, normal))`.
/// @param a B passed as `b` to `mq3.collision.winding.subtract`.
/// @param b A passed as `a` to `mq3.collision.winding.subtract`.
/// @param c A passed as `a` to `mq3.collision.winding.subtract`.
function CM_PlaneFromPoints(a,b,c)
  normal=q.CrossProduct(w.subtract(c,a),w.subtract(b,a))
  if q.VectorNormalize(normal)==0 then return void end if
  return plane(normal,q.DotProduct(a,normal))
end function
/// Compute inverted in collision.patchmesh; the normal completion returns `plane(normal, n.bitsFloat((n.floatBits(p.distance) ^ 2147483648)))`.
/// @param p Record exposing `normal`, `distance`.
/// @param subtractZero Subtract zero operand used by `inverted`; its reads are shown in the implementation.
function inverted(p, subtractZero)
  normal = w.negate(p.normal)
  if subtractZero then normal = w.subtract([0.0,0.0,0.0],p.normal) end if
  return plane(normal,n.bitsFloat(n.floatBits(p.distance)^0x80000000))
end function
/// Close points in collision.patchmesh; the normal completion returns `true`.
/// @param a A used in `a[axis]` and `n.fsub(a[axis], b[axis])`.
/// @param b B used in `b[axis]` and `n.fsub(a[axis], b[axis])`.
function closePoints(a,b)
  for axis = 0 to 2
    d = n.fsub(a[axis],b[axis])
    if d < -0.1 or d > 0.1 then return false end if
  end for
  return true
end function
/// Return `mq3.collision.patchmesh.closePoints(a, b)` from `collision.patchmesh.CM_ComparePoints`.
/// @param a A passed as `a` to `mq3.collision.patchmesh.closePoints`.
/// @param b B passed as `b` to `mq3.collision.patchmesh.closePoints`.
function CM_ComparePoints(a,b) return closePoints(a,b) end function
/// Compute needs subdivision in collision.patchmesh; the normal completion returns `(q.VectorLength(delta) >= 16)`.
/// @param a A used in `a[axis]` and `n.fadd(a[axis], c[axis])`.
/// @param b B used in `b[axis]` and `n.fadd(a[axis], b[axis])`.
/// @param c C used in `c[axis]` and `n.fadd(a[axis], c[axis])`.
function needsSubdivision(a,b,c)
  delta = array(3,0.0)
  for axis = 0 to 2
    linear = n.f32(0.5*n.fadd(a[axis],c[axis]))
    curved = n.f32(0.5*(0.5*n.fadd(a[axis],b[axis])+0.5*n.fadd(b[axis],c[axis])))
    delta[axis] = n.fsub(curved,linear)
  end for
  return q.VectorLength(delta) >= 16
end function
/// Return `mq3.collision.patchmesh.needsSubdivision(a, b, c)` from `collision.patchmesh.CM_NeedsSubdivision`.
/// @param a A passed as `a` to `mq3.collision.patchmesh.needsSubdivision`.
/// @param b B passed as `b` to `mq3.collision.patchmesh.needsSubdivision`.
/// @param c C passed as `c` to `mq3.collision.patchmesh.needsSubdivision`.
function CM_NeedsSubdivision(a,b,c) return needsSubdivision(a,b,c) end function
/// Compute subdivide in collision.patchmesh; the normal completion returns `[first, middle, last]`.
/// @param a A used in `a[axis]` and `n.fadd(a[axis], b[axis])`.
/// @param b B used in `b[axis]` and `n.fadd(a[axis], b[axis])`.
/// @param c C used in `c[axis]` and `n.fadd(b[axis], c[axis])`.
function CM_Subdivide(a,b,c)
  first=array(3,0.0);middle=array(3,0.0);last=array(3,0.0)
  for axis=0 to 2 first[axis]=n.f32(0.5*n.fadd(a[axis],b[axis]));last[axis]=n.f32(0.5*n.fadd(b[axis],c[axis]));middle[axis]=n.f32(0.5*n.fadd(first[axis],last[axis])) end for
  return [first,middle,last]
end function
/// Set grid wrap width in collision.patchmesh; updates `grid.wrapWidth`.
///
/// Direct state writes: `grid.wrapWidth`.
/// @param grid Record exposing `columns`. Updated in place: `wrapWidth`.
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
/// Update `grid.columns` in collision.patchmesh.
///
/// Direct state writes: `grid.columns`.
/// @param grid Record exposing `columns`. Updated in place: `columns`.
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
/// Remove degenerate columns in collision.patchmesh; updates `grid.columns`.
///
/// Direct state writes: `grid.columns`.
/// @param grid Record exposing `columns`. Updated in place: `columns`.
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
/// Compute subdivide columns in collision.patchmesh.
/// @param grid Grid passed as `grid` to `mq3.collision.patchmesh.CM_SetGridWrapWidth`.
function subdivideColumns(grid)
  CM_SetGridWrapWidth(grid);CM_SubdivideGridColumns(grid);CM_RemoveDegenerateColumns(grid);return void
end function
/// Update `grid.columns`, `grid.wrapWidth`, `grid.wrapHeight` in collision.patchmesh.
///
/// Direct state writes: `grid.columns`, `grid.wrapWidth`, `grid.wrapHeight`.
/// @param grid Record exposing `columns`, `wrapWidth`, `wrapHeight`. Updated in place: `columns`, `wrapWidth`, `wrapHeight`.
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
/// Return `mq3.collision.patchmesh.CM_TransposeGrid(grid)` from `collision.patchmesh.transpose`.
/// @param grid Grid passed as `grid` to `mq3.collision.patchmesh.CM_TransposeGrid`.
function transpose(grid) return CM_TransposeGrid(grid) end function
/// Append plane in collision.patchmesh; the normal completion returns `(len(patch.planes) - 1)`.
///
/// Direct state writes: `patch.planes`.
/// @param patch Record exposing `planes`, `planeCache`. Updated in place: `planes`.
/// @param p Plane record with a three-component normal and distance.
function appendPlane(patch, p)
  if len(patch.planes) >= 2048 then return fail("plane limit exceeded") end if
  if patch.planeCache!=void then stored=nativePlanes.store(patch.planeCache,len(patch.planes),p);if stored!=1 then return fail("plane cache rejected insertion") end if end if
  patch.planes = patch.planes+[p]
  return len(patch.planes)-1
end function
/// Compute equal plane in collision.patchmesh; the normal completion returns `- 1`.
/// @param a Record exposing `distance`, `normal`.
/// @param b P passed as `p` to `mq3.collision.patchmesh.inverted`.
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
/// Return `mq3.collision.patchmesh.equalPlane(a, b)` from `collision.patchmesh.CM_PlaneEqual`.
/// @param a A passed as `a` to `mq3.collision.patchmesh.equalPlane`.
/// @param b B passed as `b` to `mq3.collision.patchmesh.equalPlane`.
function CM_PlaneEqual(a,b) return equalPlane(a,b) end function
/// Find plane 2 in collision.patchmesh; the normal completion returns `[appendPlane(patch, p), 0]`.
/// @param patch Record exposing `planeCache`, `planes`.
/// @param p Plane record supplying the normal and distance to match; negative results denote no match or invalid bounds.
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
/// Return `mq3.collision.patchmesh.findPlane2(patch, p)` from `collision.patchmesh.CM_FindPlane2`.
/// @param patch Patch passed as `patch` to `mq3.collision.patchmesh.findPlane2`.
/// @param p P passed as `p` to `mq3.collision.patchmesh.findPlane2`.
function CM_FindPlane2(patch,p) return findPlane2(patch,p) end function
/// Find plane in collision.patchmesh; the normal completion returns `appendPlane(patch, candidate)`.
/// @param patch Record exposing `planeCache`, `planes`.
/// @param a A passed as `a` to `mq3.collision.patchmesh.CM_PlaneFromPoints`.
/// @param b B passed as `b` to `mq3.collision.patchmesh.CM_PlaneFromPoints`.
/// @param c C passed as `c` to `mq3.collision.patchmesh.CM_PlaneFromPoints`.
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
/// Return `mq3.collision.patchmesh.findPlane(patch, a, b, c)` from `collision.patchmesh.CM_FindPlane`.
/// @param patch Patch passed as `patch` to `mq3.collision.patchmesh.findPlane`.
/// @param a A passed as `a` to `mq3.collision.patchmesh.findPlane`.
/// @param b B passed as `b` to `mq3.collision.patchmesh.findPlane`.
/// @param c C passed as `c` to `mq3.collision.patchmesh.findPlane`.
function CM_FindPlane(patch,a,b,c) return findPlane(patch,a,b,c) end function
/// Compute grid plane in collision.patchmesh; the normal completion returns `index`.
/// @param gridPlanes Grid planes used in `gridPlanes[i]` and `gridPlanes[i][j]`.
/// @param i Zero-based index into `gridPlanes`.
/// @param j Zero-based index into `gridPlanes[i]`.
/// @param tri Zero-based index into `gridPlanes[i][j]`.
function gridPlane(gridPlanes,i,j,tri)
  index = gridPlanes[i][j][tri]
  if index == -1 then index = gridPlanes[i][j][tri^1] end if
  return index
end function
/// Return `mq3.collision.patchmesh.gridPlane(gridPlanes, i, j, tri)` from `collision.patchmesh.CM_GridPlane`.
/// @param gridPlanes Grid planes passed as `gridPlanes` to `mq3.collision.patchmesh.gridPlane`.
/// @param i I passed as `i` to `mq3.collision.patchmesh.gridPlane`.
/// @param j J passed as `j` to `mq3.collision.patchmesh.gridPlane`.
/// @param tri Tri passed as `tri` to `mq3.collision.patchmesh.gridPlane`.
function CM_GridPlane(gridPlanes,i,j,tri) return gridPlane(gridPlanes,i,j,tri) end function
/// Compute edge plane in collision.patchmesh; the normal completion returns `findPlane(patch, a, b, up)`.
/// @param patch Record exposing `planes`.
/// @param grid Record exposing `columns`.
/// @param gridPlanes Grid planes passed as `gridPlanes` to `mq3.collision.patchmesh.gridPlane`.
/// @param i I passed as `i` to `mq3.collision.patchmesh.gridPlane`.
/// @param j J passed as `j` to `mq3.collision.patchmesh.gridPlane`.
/// @param k K operand used by `edgePlane`; its reads are shown in the implementation.
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
/// Return `mq3.collision.patchmesh.edgePlane(patch, grid, gridPlanes, i, j, k)` from `collision.patchmesh.CM_EdgePlaneNum`.
/// @param patch Patch passed as `patch` to `mq3.collision.patchmesh.edgePlane`.
/// @param grid Grid passed as `grid` to `mq3.collision.patchmesh.edgePlane`.
/// @param gridPlanes Grid planes passed as `gridPlanes` to `mq3.collision.patchmesh.edgePlane`.
/// @param i I passed as `i` to `mq3.collision.patchmesh.edgePlane`.
/// @param j J passed as `j` to `mq3.collision.patchmesh.edgePlane`.
/// @param k K passed as `k` to `mq3.collision.patchmesh.edgePlane`.
function CM_EdgePlaneNum(patch,grid,gridPlanes,i,j,k) return edgePlane(patch,grid,gridPlanes,i,j,k) end function
/// Set inward in collision.patchmesh.
/// @param patch Patch passed as `patch` to `mq3.collision.patchmesh.CM_PointOnPlaneSide`.
/// @param facet Record exposing `borders`, `inward`.
/// @param points Sequence traversed as `point` by the loop in `setInward`.
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
/// Return `mq3.collision.patchmesh.setInward(patch, facet, points)` from `collision.patchmesh.CM_SetBorderInward`.
/// @param patch Patch passed as `patch` to `mq3.collision.patchmesh.setInward`.
/// @param facet Facet passed as `facet` to `mq3.collision.patchmesh.setInward`.
/// @param points Points passed as `points` to `mq3.collision.patchmesh.setInward`.
function CM_SetBorderInward(patch,facet,points) return setInward(patch,facet,points) end function
/// Compute facet winding in collision.patchmesh; the normal completion returns `points`.
/// @param patch Record exposing `planes`.
/// @param facet Record exposing `surface`, `borders`, `inward`.
/// @param skipSurface Skip surface used in `(skipSurface and (index == facet.surface))`.
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
/// Return `mq3.collision.patchmesh.validFacet(patch, facet)` from `collision.patchmesh.CM_ValidateFacet`.
/// @param patch Patch passed as `patch` to `mq3.collision.patchmesh.validFacet`.
/// @param facet Facet passed as `facet` to `mq3.collision.patchmesh.validFacet`.
function CM_ValidateFacet(patch,facet) return validFacet(patch,facet) end function
/// Validate facet in collision.patchmesh; the normal completion returns `true`.
/// @param patch Patch passed as `patch` to `mq3.collision.patchmesh.facetWinding`.
/// @param facet Facet passed as `facet` to `mq3.collision.patchmesh.facetWinding`.
function validFacet(patch,facet)
  points = facetWinding(patch,facet,false)
  if len(points) == 0 then return false end if
  bounds = w.bounds(points)
  for axis = 0 to 2
    if n.fsub(bounds[1][axis],bounds[0][axis]) > 65535 or bounds[0][axis] >= 65535 or bounds[1][axis] <= -65535 then return false end if
  end for
  return true
end function
/// Test plane in collision.patchmesh; the normal completion returns `false`.
/// @param patch Record exposing `planes`.
/// @param facet Record exposing `surface`, `borders`.
/// @param p B passed as `b` to `mq3.collision.patchmesh.CM_PlaneEqual`.
function hasPlane(patch,facet,p)
  if CM_PlaneEqual(patch.planes[facet.surface],p) >= 0 then return true end if
  for each index in facet.borders
    if CM_PlaneEqual(patch.planes[index],p) >= 0 then return true end if
  end for
  return false
end function
/// Add border in collision.patchmesh; updates `facet.borders`, `facet.inward`, `facet.noAdjust`.
///
/// Direct state writes: `facet.borders`, `facet.inward`, `facet.noAdjust`.
/// @param facet Record exposing `borders`, `inward`, `noAdjust`. Updated in place: `borders`, `inward`, `noAdjust`.
/// @param index Index used in `(facet.borders + [index])`.
/// @param inward Inward used in `(facet.inward + [inward])`.
/// @param noAdjust No adjust used in `(facet.noAdjust + [noAdjust])`.
function addBorder(facet,index,inward,noAdjust)
  if len(facet.borders) >= 26 then return fail("facet border limit exceeded") end if
  facet.borders = facet.borders+[index]
  facet.inward = facet.inward+[inward]
  facet.noAdjust = facet.noAdjust+[noAdjust]
  return void
end function
/// Compute snap in collision.patchmesh; the normal completion returns `normal`.
/// @param normal Normal used in `normal[axis]` and `n.fsub(normal[axis], direction)`.
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
/// Return `mq3.collision.patchmesh.snap(normal)` from `collision.patchmesh.CM_SnapVector`.
/// @param normal Normal passed as `normal` to `mq3.collision.patchmesh.snap`.
function CM_SnapVector(normal) return snap(normal) end function
/// Add bevels in collision.patchmesh.
/// @param patch Record exposing `planes`.
/// @param facet Record exposing `surface`.
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
/// Return `mq3.collision.patchmesh.addBevels(patch, facet)` from `collision.patchmesh.CM_AddFacetBevels`.
/// @param patch Patch passed as `patch` to `mq3.collision.patchmesh.addBevels`.
/// @param facet Facet passed as `facet` to `mq3.collision.patchmesh.addBevels`.
function CM_AddFacetBevels(patch,facet) return addBevels(patch,facet) end function
/// Add facet in collision.patchmesh; updates `patch.facets`.
///
/// Direct state writes: `patch.facets`.
/// @param patch Record exposing `facets`. Updated in place: `facets`.
/// @param surface Initial `surface` field stored in the returned or constructed `mq3.collision.patchmesh.Facet` record.
/// @param borders Initial `borders` field stored in the returned or constructed `mq3.collision.patchmesh.Facet` record.
/// @param noAdjust Initial `noAdjust` field stored in the returned or constructed `mq3.collision.patchmesh.Facet` record.
/// @param points Points passed as `points` to `mq3.collision.patchmesh.CM_SetBorderInward`.
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
/// Compute from grid in collision.patchmesh.
/// @param grid Record exposing `columns`, `wrapHeight`, `wrapWidth`.
/// @param patch Patch passed as `patch` to `mq3.collision.patchmesh.CM_FindPlane`.
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
/// Return `mq3.collision.patchmesh.fromGrid(grid, patch)` from `collision.patchmesh.CM_PatchCollideFromGrid`.
/// @param grid Grid passed as `grid` to `mq3.collision.patchmesh.fromGrid`.
/// @param patch Patch passed as `patch` to `mq3.collision.patchmesh.fromGrid`.
function CM_PatchCollideFromGrid(grid,patch) return fromGrid(grid,patch) end function
/// Compute point on plane side in collision.patchmesh; the normal completion returns `2`.
/// @param patch Record exposing `planes`.
/// @param point Left three-element vector.
/// @param index Zero-based index into `patch.planes`.
function CM_PointOnPlaneSide(patch,point,index)
  if index==-1 then return 2 end if
  p=patch.planes[index];distance=n.fsub(q.DotProduct(point,p.normal),p.distance)
  if distance>0.1 then return 0 end if;if distance< -0.1 then return 1 end if;return 2
end function
/// Compute generate in collision.patchmesh; the normal completion returns `patch`.
/// @param width Width used in `(width & 1)` and `(i < width)`.
/// @param height Height used in `(height & 1)` and `(j < height)`.
/// @param points Points used in `len(points)` and `points[((j * width) + i)]`.
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
/// Return `mq3.collision.patchmesh.generate(width, height, points)` from `collision.patchmesh.CM_GeneratePatchCollide`.
/// @param width Width passed as `width` to `mq3.collision.patchmesh.generate`.
/// @param height Height passed as `height` to `mq3.collision.patchmesh.generate`.
/// @param points Points passed as `points` to `mq3.collision.patchmesh.generate`.
function CM_GeneratePatchCollide(width,height,points) return generate(width,height,points) end function
