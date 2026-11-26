// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete source-symbol facade for code/renderer/tr_main.c.  The stateful
// front-end entry points use explicit state/services while the arithmetic and
// visibility rules remain the original renderer rules.
package mq3.renderer.tr_main_runtime

import mq3.compat.numeric as n
import mq3.compat.transcendental as trans
import mq3.shared.math as qmath
import mq3.renderer.draw_surfs as draw
import mq3.renderer.entity_surface_policy as policy
import mq3.renderer.portal_view as portals
import mq3.renderer.view_math as viewmath

const RT_MODEL=0
const RT_POLY=1
const RT_SPRITE=2
const RT_BEAM=3
const RT_RAIL_CORE=4
const RT_RAIL_RINGS=5
const RT_LIGHTNING=6
const RT_PORTALSURFACE=7
const SF_FACE=2
const SF_TRIANGLES=4
const SF_POLY=5
const RDF_NOWORLDMODEL=1

/// Data record for `mq3.renderer.tr_main_runtime.Plane`; groups `normal`, `dist`.
struct Plane normal dist end struct
/// Data record for `mq3.renderer.tr_main_runtime.Orientation`; groups `origin`, `axis`, `viewOrigin`, `modelMatrix`.
struct Orientation origin axis viewOrigin modelMatrix end struct
/// Data record for `mq3.renderer.tr_main_runtime.EntitySurface`; groups `entityIndex`, `reType`, `fogNum`, `payload`.
struct EntitySurface entityIndex reType fogNum payload end struct
/// Data record for `mq3.renderer.tr_main_runtime.DebugPass`; groups `color`, `points`, `wireframe`, `depthMin`, `depthMax`.
struct DebugPass color points wireframe depthMin depthMax end struct
/// Data record for `mq3.renderer.tr_main_runtime.DebugPolygonResult`; groups `solid`, `outline`.
struct DebugPolygonResult solid outline end struct
/// Callback table for `mq3.renderer.tr_main_runtime.RenderServices`; exposes `addWorldFn`, `addPolygonsFn`, `setupProjectionFn`, `addEntitiesFn`, `addCommandFn`, `debugFn`, and 1 further field.
struct RenderServices addWorldFn addPolygonsFn setupProjectionFn addEntitiesFn addCommandFn debugFn context end struct
/// Data record for `mq3.renderer.tr_main_runtime.RenderState`; groups `viewCount`, `frameSceneNum`, `frameCount`, `numDrawSurfs`, `viewParms`, `queue`, and 1 further field.
struct RenderState viewCount frameSceneNum frameCount numDrawSurfs viewParms queue services end struct

/// Creates error `7760` with message `"tr_main: "+message`.
/// @param message Input used in the result expression `error(7760,"tr_main: "+message)`.
function fail(message) return error(7760,"tr_main: "+message) end function
/// Returns `[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]]` for `mq3.renderer.tr_main_runtime.identityAxis`.
function identityAxis() return [[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]] end function
/// Returns `[1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0]` for `mq3.renderer.tr_main_runtime.identityMatrix`.
function identityMatrix() return [1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0] end function
/// Constructs `mq3.renderer.tr_main_runtime.Orientation` from `origin`, `axis`, `viewOrigin`, `modelMatrix`.
/// @param origin Initial value for `mq3.renderer.tr_main_runtime.Orientation.origin`.
/// @param axis Initial value for `mq3.renderer.tr_main_runtime.Orientation.axis`.
/// @param viewOrigin Initial value for `mq3.renderer.tr_main_runtime.Orientation.viewOrigin`.
/// @param modelMatrix Initial value for `mq3.renderer.tr_main_runtime.Orientation.modelMatrix`.
function orientation(origin,axis,viewOrigin,modelMatrix) return Orientation(origin,axis,viewOrigin,modelMatrix) end function

/// Calls `mq3.renderer.view_math.cullLocalBox` with `(bounds,current,frustum,noCull)` and returns its result.
/// @param bounds Argument 1 supplied to `mq3.renderer.view_math.cullLocalBox`.
/// @param current Argument 2 supplied to `mq3.renderer.view_math.cullLocalBox`.
/// @param frustum Argument 3 supplied to `mq3.renderer.view_math.cullLocalBox`.
/// @param noCull Argument 4 supplied to `mq3.renderer.view_math.cullLocalBox`.
function R_CullLocalBox(bounds,current,frustum,noCull) return viewmath.cullLocalBox(bounds,current,frustum,noCull) end function
/// Calls `mq3.renderer.view_math.cullLocalPointAndRadius` with `(point,radius,current,frustum,noCull)` and returns its result.
/// @param point Argument 1 supplied to `mq3.renderer.view_math.cullLocalPointAndRadius`.
/// @param radius Argument 2 supplied to `mq3.renderer.view_math.cullLocalPointAndRadius`.
/// @param current Argument 3 supplied to `mq3.renderer.view_math.cullLocalPointAndRadius`.
/// @param frustum Argument 4 supplied to `mq3.renderer.view_math.cullLocalPointAndRadius`.
/// @param noCull Argument 5 supplied to `mq3.renderer.view_math.cullLocalPointAndRadius`.
function R_CullLocalPointAndRadius(point,radius,current,frustum,noCull) return viewmath.cullLocalPointAndRadius(point,radius,current,frustum,noCull) end function
/// Calls `mq3.renderer.view_math.cullPointAndRadius` with `(point,radius,frustum,noCull)` and returns its result.
/// @param point Argument 1 supplied to `mq3.renderer.view_math.cullPointAndRadius`.
/// @param radius Argument 2 supplied to `mq3.renderer.view_math.cullPointAndRadius`.
/// @param frustum Argument 3 supplied to `mq3.renderer.view_math.cullPointAndRadius`.
/// @param noCull Argument 4 supplied to `mq3.renderer.view_math.cullPointAndRadius`.
function R_CullPointAndRadius(point,radius,frustum,noCull) return viewmath.cullPointAndRadius(point,radius,frustum,noCull) end function
/// Calls `mq3.renderer.view_math.localNormalToWorld` with `(local,current)` and returns its result.
/// @param local Argument 1 supplied to `mq3.renderer.view_math.localNormalToWorld`.
/// @param current Argument 2 supplied to `mq3.renderer.view_math.localNormalToWorld`.
function R_LocalNormalToWorld(local,current) return viewmath.localNormalToWorld(local,current) end function
/// Calls `mq3.renderer.view_math.localPointToWorld` with `(local,current)` and returns its result.
/// @param local Argument 1 supplied to `mq3.renderer.view_math.localPointToWorld`.
/// @param current Argument 2 supplied to `mq3.renderer.view_math.localPointToWorld`.
function R_LocalPointToWorld(local,current) return viewmath.localPointToWorld(local,current) end function
/// Calls `mq3.renderer.view_math.worldToLocal` with `(world,current)` and returns its result.
/// @param world Argument 1 supplied to `mq3.renderer.view_math.worldToLocal`.
/// @param current Argument 2 supplied to `mq3.renderer.view_math.worldToLocal`.
function R_WorldToLocal(world,current) return viewmath.worldToLocal(world,current) end function
/// Calls `mq3.renderer.view_math.transformModelToClip` with `(source,modelMatrix,projectionMatrix)` and returns its result.
/// @param source Argument 1 supplied to `mq3.renderer.view_math.transformModelToClip`.
/// @param modelMatrix Argument 2 supplied to `mq3.renderer.view_math.transformModelToClip`.
/// @param projectionMatrix Argument 3 supplied to `mq3.renderer.view_math.transformModelToClip`.
function R_TransformModelToClip(source,modelMatrix,projectionMatrix) return viewmath.transformModelToClip(source,modelMatrix,projectionMatrix) end function
/// Calls `mq3.renderer.view_math.transformClipToWindow` with `(clip,viewportWidth,viewportHeight)` and returns its result.
/// @param clip Argument 1 supplied to `mq3.renderer.view_math.transformClipToWindow`.
/// @param viewportWidth Argument 2 supplied to `mq3.renderer.view_math.transformClipToWindow`.
/// @param viewportHeight Argument 3 supplied to `mq3.renderer.view_math.transformClipToWindow`.
function R_TransformClipToWindow(clip,viewportWidth,viewportHeight) return viewmath.transformClipToWindow(clip,viewportWidth,viewportHeight) end function

/// Builds `result[i*4+j]` in `mq3.renderer.tr_main_runtime.myGlMultMatrix`; returns `result`.
/// @param a Indexed input read at `i*4`, `i*4+1`, `i*4+2`, `i*4+3`.
/// @param b Indexed input read at `j`, `4+j`, `8+j`, `12+j`.
function myGlMultMatrix(a,b)
  if a==void or b==void or len(a)!=16 or len(b)!=16 then return fail("matrix multiplication requires two 4x4 matrices") end if
  result=array(16,0.0)
  for i=0 to 3
    for j=0 to 3
      result[i*4+j]=n.fadd(n.fadd(n.fadd(n.fmul(a[i*4],b[j]),n.fmul(a[i*4+1],b[4+j])),n.fmul(a[i*4+2],b[8+j])),n.fmul(a[i*4+3],b[12+j]))
    end for
  end for
  return result
end function

/// Computes `R_RotateForEntity` from `orientation([origin[0],origin[1],origin[2]],axis,localView,model)` using `mq3.renderer.tr_main_runtime.myGlMultMatrix`, `mq3.shared.math.VectorLength`, `mq3.compat.numeric.fdiv`.
/// @param entity Record providing `entity.reType`, `entity.axis`, `entity.origin`, `entity.nonNormalizedAxes`.
/// @param viewParms Record providing `viewParms.world`, `viewParms.origin`.
function R_RotateForEntity(entity,viewParms)
  if entity==void or viewParms==void or viewParms.world==void then return fail("entity rotation needs entity and view") end if
  if entity.reType!=RT_MODEL then return viewParms.world end if
  axis=entity.axis;origin=entity.origin
  local=[axis[0][0],axis[0][1],axis[0][2],0.0,axis[1][0],axis[1][1],axis[1][2],0.0,axis[2][0],axis[2][1],axis[2][2],0.0,origin[0],origin[1],origin[2],1.0]
  model=myGlMultMatrix(local,viewParms.world.modelMatrix);if model is error then return model end if
  delta=[viewParms.origin[0]-origin[0],viewParms.origin[1]-origin[1],viewParms.origin[2]-origin[2]]
  scale=1.0
  if entity.nonNormalizedAxes then length=qmath.VectorLength(axis[0]);if length==0.0 then scale=0.0 else scale=n.fdiv(1.0,length) end if end if
  localView=[n.fmul(qmath.DotProduct(delta,axis[0]),scale),n.fmul(qmath.DotProduct(delta,axis[1]),scale),n.fmul(qmath.DotProduct(delta,axis[2]),scale)]
  return orientation([origin[0],origin[1],origin[2]],axis,localView,model)
end function

/// Builds `matrix[0]`, `matrix[4]`, `matrix[8]`, `matrix[12]`, `matrix[1]` in `mq3.renderer.tr_main_runtime.R_RotateForViewer`.
/// @param viewOrigin Argument 1 supplied to `mq3.shared.math.DotProduct`.
/// @param viewAxis Nested indexed data; outer entries read at `0`, `1`, `2`.
function R_RotateForViewer(viewOrigin,viewAxis)
  matrix=array(16,0.0)
  matrix[0]=viewAxis[0][0];matrix[4]=viewAxis[0][1];matrix[8]=viewAxis[0][2];matrix[12]=0.0-qmath.DotProduct(viewOrigin,viewAxis[0])
  matrix[1]=viewAxis[1][0];matrix[5]=viewAxis[1][1];matrix[9]=viewAxis[1][2];matrix[13]=0.0-qmath.DotProduct(viewOrigin,viewAxis[1])
  matrix[2]=viewAxis[2][0];matrix[6]=viewAxis[2][1];matrix[10]=viewAxis[2][2];matrix[14]=0.0-qmath.DotProduct(viewOrigin,viewAxis[2]);matrix[15]=1.0
  flip=[0.0,0.0,-1.0,0.0,-1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0]
  return orientation([0.0,0.0,0.0],identityAxis(),[viewOrigin[0],viewOrigin[1],viewOrigin[2]],myGlMultMatrix(matrix,flip))
end function

/// Computes `SetFarClip` from `n.fsqrt(farthest)` using `mq3.shared.math.DotProduct`, `mq3.compat.numeric.fsqrt`.
/// @param noworld Input tested by `noworld`.
/// @param visBounds Nested indexed data; outer entries read at `1-(i&1)`, `1-((i>>1)&1)`, `1-((i>>2)&1)`.
/// @param viewOrigin Three-component vector read at indices 0, 1, and 2.
function SetFarClip(noworld,visBounds,viewOrigin)
  if noworld then return 2048.0 end if
  farthest=0.0
  for i=0 to 7
    point=[visBounds[1-(i&1)][0],visBounds[1-((i>>1)&1)][1],visBounds[1-((i>>2)&1)][2]]
    delta=[point[0]-viewOrigin[0],point[1]-viewOrigin[1],point[2]-viewOrigin[2]];distance=qmath.DotProduct(delta,delta)
    if distance>farthest then farthest=distance end if
  end for
  return n.fsqrt(farthest)
end function

/// Builds `m[0]`, `m[5]`, `m[10]`, `m[14]`, `m[11]` in `mq3.renderer.tr_main_runtime.R_SetupProjection`; returns `m`.
/// @param fovX Argument 1 supplied to `mq3.compat.numeric.fmul`.
/// @param fovY Argument 1 supplied to `mq3.compat.numeric.fmul`.
/// @param zNear Argument 1 supplied to `mq3.compat.numeric.fmul`.
/// @param zFar Argument 1 supplied to `mq3.compat.numeric.fsub`.
function R_SetupProjection(fovX,fovY,zNear,zFar)
  if fovX<=0.0 or fovX>=180.0 or fovY<=0.0 or fovY>=180.0 or zNear<=0.0 or zFar<=zNear then return fail("invalid projection parameters") end if
  ay=n.fmul(fovY,n.fdiv(n.f32(3.14159265358979323846),360.0));ax=n.fmul(fovX,n.fdiv(n.f32(3.14159265358979323846),360.0))
  ymax=n.fmul(zNear,n.f32(n.fdiv(trans.sin(ay),trans.cos(ay))));xmax=n.fmul(zNear,n.f32(n.fdiv(trans.sin(ax),trans.cos(ax))))
  width=n.fmul(2.0,xmax);height=n.fmul(2.0,ymax);depth=n.fsub(zFar,zNear);m=array(16,0.0)
  m[0]=n.fdiv(n.fmul(2.0,zNear),width);m[5]=n.fdiv(n.fmul(2.0,zNear),height);m[10]=n.fneg(n.fdiv(n.fadd(zFar,zNear),depth));m[14]=n.fneg(n.fdiv(n.fmul(n.fmul(2.0,zFar),zNear),depth));m[11]=-1.0
  return m
end function

/// Calls `mq3.renderer.view_math.setupFrustum` with `(origin,axis,fovX,fovY)` and returns its result.
/// @param origin Argument 1 supplied to `mq3.renderer.view_math.setupFrustum`.
/// @param axis Argument 2 supplied to `mq3.renderer.view_math.setupFrustum`.
/// @param fovX Argument 3 supplied to `mq3.renderer.view_math.setupFrustum`.
/// @param fovY Argument 4 supplied to `mq3.renderer.view_math.setupFrustum`.
function R_SetupFrustum(origin,axis,fovX,fovY) return viewmath.setupFrustum(origin,axis,fovX,fovY) end function
/// Calls `mq3.renderer.portal_view.mirrorPoint` with `(input,surface,camera)` and returns its result.
/// @param input Argument 1 supplied to `mq3.renderer.portal_view.mirrorPoint`.
/// @param surface Argument 2 supplied to `mq3.renderer.portal_view.mirrorPoint`.
/// @param camera Argument 3 supplied to `mq3.renderer.portal_view.mirrorPoint`.
function R_MirrorPoint(input,surface,camera) return portals.mirrorPoint(input,surface,camera) end function
/// Calls `mq3.renderer.portal_view.mirrorVector` with `(input,surface,camera)` and returns its result.
/// @param input Argument 1 supplied to `mq3.renderer.portal_view.mirrorVector`.
/// @param surface Argument 2 supplied to `mq3.renderer.portal_view.mirrorVector`.
/// @param camera Argument 3 supplied to `mq3.renderer.portal_view.mirrorVector`.
function R_MirrorVector(input,surface,camera) return portals.mirrorVector(input,surface,camera) end function

// Surface is {kind, plane} for faces or {kind, vertices, indexes} for meshes.
/// @param surface Record providing `surface.kind`, `surface.plane`, `surface.vertices`, `surface.indexes`.
function R_PlaneForSurface(surface)
  if surface==void then return Plane([1.0,0.0,0.0],0.0) end if
  if surface.kind==SF_FACE then return Plane([surface.plane.normal[0],surface.plane.normal[1],surface.plane.normal[2]],surface.plane.dist) end if
  points=surface.vertices;a=void;b=void;c=void
  if surface.kind==SF_TRIANGLES then if surface.indexes==void or len(surface.indexes)<3 then return Plane([1.0,0.0,0.0],0.0) end if;a=points[surface.indexes[0]];b=points[surface.indexes[1]];c=points[surface.indexes[2]]
  else if surface.kind==SF_POLY then if points==void or len(points)<3 then return Plane([1.0,0.0,0.0],0.0) end if;a=points[0];b=points[1];c=points[2]
  else return Plane([1.0,0.0,0.0],0.0) end if
  value=qmath.PlaneFromPoints(a,b,c);if value==void then return Plane([1.0,0.0,0.0],0.0) end if;return Plane([value[0],value[1],value[2]],value[3])
end function

/// Calls `mq3.renderer.portal_view.portalOrientation` with `(surface.normal,surface.dist,entities,timeMilliseconds)` and returns its result.
/// @param surface Record providing `surface.normal`, `surface.dist`.
/// @param entities Argument 3 supplied to `mq3.renderer.portal_view.portalOrientation`.
/// @param timeMilliseconds Argument 4 supplied to `mq3.renderer.portal_view.portalOrientation`.
function R_GetPortalOrientations(surface,entities,timeMilliseconds) return portals.portalOrientation(surface.normal,surface.dist,entities,timeMilliseconds) end function
/// Returns `found!=void and not (found is error) and found[3]` from `mq3.renderer.tr_main_runtime.IsMirror`.
/// @param surface Value forwarded as `surface` to `mq3.renderer.tr_main_runtime.R_GetPortalOrientations`.
/// @param entities Value forwarded as `entities` to `mq3.renderer.tr_main_runtime.R_GetPortalOrientations`.
/// @param timeMilliseconds Value forwarded as `timeMilliseconds` to `mq3.renderer.tr_main_runtime.R_GetPortalOrientations`.
function IsMirror(surface,entities,timeMilliseconds) found=R_GetPortalOrientations(surface,entities,timeMilliseconds);return found!=void and not (found is error) and found[3] end function

/// Computes `SurfIsOffscreen` from `shortest>portalRange*portalRange` using `mq3.renderer.view_math.transformModelToClip`, `mq3.shared.math.DotProduct`.
/// @param vertices Nested indexed data; outer entries read at `index`.
/// @param normals Indexed input read at `index`.
/// @param indexes Indexed input read at `i`.
/// @param modelMatrix Argument 2 supplied to `mq3.renderer.view_math.transformModelToClip`.
/// @param projectionMatrix Argument 3 supplied to `mq3.renderer.view_math.transformModelToClip`.
/// @param viewOrigin Three-component vector read at indices 0, 1, and 2.
/// @param portalRange Input used in the result expression `shortest>portalRange*portalRange`.
/// @param mirror Input tested by `mirror`.
/// @param smpActive Input tested by `smpActive`.
function SurfIsOffscreen(vertices,normals,indexes,modelMatrix,projectionMatrix,viewOrigin,portalRange,mirror,smpActive)
  if smpActive then return false end if
  if vertices==void or normals==void or indexes==void then return true end if
  pointAnd=63;shortest=100000000.0
  for each vertex in vertices
    transformed=viewmath.transformModelToClip(vertex,modelMatrix,projectionMatrix);if transformed is error then return transformed end if;clip=transformed[1];flags=0
    for j=0 to 2 if clip[j]>=clip[3] then flags=flags|(1<<(j*2)) else if clip[j]<=0.0-clip[3] then flags=flags|(1<<(j*2+1)) end if end for
    pointAnd=pointAnd&flags
  end for
  if pointAnd!=0 then return true end if
  triangles=len(indexes)/3;front=triangles
  i=0
  while i<len(indexes)
    index=indexes[i];delta=[vertices[index][0]-viewOrigin[0],vertices[index][1]-viewOrigin[1],vertices[index][2]-viewOrigin[2]];distance=qmath.DotProduct(delta,delta);if distance<shortest then shortest=distance end if
    if qmath.DotProduct(delta,normals[index])>=0.0 then front=front-1 end if
    i=i+3
  end while
  if front==0 then return true end if;if mirror then return false end if;return shortest>portalRange*portalRange
end function

/// Returns `portals.prepare(surface.normal,surface.dist,entities,timeMilliseconds,viewOrigin,viewAxis)` from `mq3.renderer.tr_main_runtime.R_MirrorViewBySurface`; earlier branches return `void`.
/// @param surface Record providing `surface.normal`, `surface.dist`.
/// @param entities Argument 3 supplied to `mq3.renderer.portal_view.prepare`.
/// @param timeMilliseconds Argument 4 supplied to `mq3.renderer.portal_view.prepare`.
/// @param viewOrigin Argument 5 supplied to `mq3.renderer.portal_view.prepare`.
/// @param viewAxis Argument 6 supplied to `mq3.renderer.portal_view.prepare`.
/// @param isPortal Input tested by `isPortal or noPortals or fastSky`.
/// @param noPortals Input tested by `isPortal or noPortals or fastSky`.
/// @param fastSky Input tested by `isPortal or noPortals or fastSky`.
function R_MirrorViewBySurface(surface,entities,timeMilliseconds,viewOrigin,viewAxis,isPortal,noPortals,fastSky)
  if isPortal or noPortals or fastSky then return void end if
  return portals.prepare(surface.normal,surface.dist,entities,timeMilliseconds,viewOrigin,viewAxis)
end function

/// Returns the first fog volume overlapping a sprite's radius, or zero when none applies or world rendering is disabled.
/// @param origin Indexed input read at `j`.
/// @param radius Input used by `for j=0 to 2 if origin[j]-radius>=fog[1][j] or origin[j]+radius<=fog[0][j] then inside=false`.
/// @param fogBounds Indexed input read at `i`.
/// @param noworld Input tested by `noworld or fogBounds==void`.
function R_SpriteFogNum(origin,radius,fogBounds,noworld)
  if noworld or fogBounds==void then return 0 end if
  for i=1 to len(fogBounds)-1
    fog=fogBounds[i];inside=true
    for j=0 to 2 if origin[j]-radius>=fog[1][j] or origin[j]+radius<=fog[0][j] then inside=false end if end for
    if inside then return i end if
  end for
  return 0
end function

/// Calls `mq3.renderer.draw_surfs.sortStable` with `(drawSurfs)` and returns its result.
/// @param drawSurfs Argument 1 supplied to `mq3.renderer.draw_surfs.sortStable`.
function shortsort(drawSurfs) return draw.sortStable(drawSurfs) end function
/// Calls `mq3.renderer.draw_surfs.sortStable` with `(drawSurfs)` and returns its result.
/// @param drawSurfs Argument 1 supplied to `mq3.renderer.draw_surfs.sortStable`.
function qsortFast(drawSurfs) return draw.sortStable(drawSurfs) end function
/// Calls `mq3.renderer.draw_surfs.add` with `(queue,surface,shaderIndex,entityNum,fogIndex,dlightMap)` and returns its result.
/// @param queue Argument 1 supplied to `mq3.renderer.draw_surfs.add`.
/// @param surface Argument 2 supplied to `mq3.renderer.draw_surfs.add`.
/// @param shaderIndex Argument 3 supplied to `mq3.renderer.draw_surfs.add`.
/// @param entityNum Argument 4 supplied to `mq3.renderer.draw_surfs.add`.
/// @param fogIndex Argument 5 supplied to `mq3.renderer.draw_surfs.add`.
/// @param dlightMap Argument 6 supplied to `mq3.renderer.draw_surfs.add`.
function R_AddDrawSurf(queue,surface,shaderIndex,entityNum,fogIndex,dlightMap) return draw.add(queue,surface,shaderIndex,entityNum,fogIndex,dlightMap) end function
/// Calls `mq3.renderer.draw_surfs.decompose` with `(sortKey)` and returns its result.
/// @param sortKey Argument 1 supplied to `mq3.renderer.draw_surfs.decompose`.
function R_DecomposeSort(sortKey) return draw.decompose(sortKey) end function
/// Calls `mq3.renderer.draw_surfs.sortQueue` with `(queue)` and returns its result.
/// @param queue Argument 1 supplied to `mq3.renderer.draw_surfs.sortQueue`.
function R_SortDrawSurfs(queue) return draw.sortQueue(queue) end function

/// Applies entity visibility/type policy and assigns fog indices before creating drawable entity-surface records.
/// @param entities Indexed input read at `index`.
/// @param isPortal Input tested by `(entity.renderfx&policy.RF_FIRST_PERSON)!=0 and isPortal`.
/// @param fogBounds Value forwarded as `fogBounds` to `mq3.renderer.tr_main_runtime.R_SpriteFogNum`.
/// @param noworld Value forwarded as `noworld` to `mq3.renderer.tr_main_runtime.R_SpriteFogNum`.
/// @param drawEntities Input tested by `not drawEntities`.
function R_AddEntitySurfaces(entities,isPortal,fogBounds,noworld,drawEntities)
  output=[];if not drawEntities then return output end if
  for index=0 to len(entities)-1
    entity=entities[index]
    if (entity.renderfx&policy.RF_FIRST_PERSON)!=0 and isPortal then continue end if
    if entity.reType==RT_PORTALSURFACE then continue end if
    generated=entity.reType==RT_SPRITE or entity.reType==RT_BEAM or entity.reType==RT_LIGHTNING or entity.reType==RT_RAIL_CORE or entity.reType==RT_RAIL_RINGS
    if generated and (entity.renderfx&policy.RF_THIRD_PERSON)!=0 and not isPortal then continue end if
    if entity.reType!=RT_MODEL and not generated then return fail("bad refEntity type "+str(entity.reType)) end if
    fog=0;if generated then fog=R_SpriteFogNum(entity.origin,entity.radius,fogBounds,noworld) end if
    output=output+[EntitySurface(index,entity.reType,fog,entity)]
  end for
  return output
end function

/// Computes `R_GenerateDrawSurfs` from `state.numDrawSurfs` using `s.addWorldFn`, `s.addPolygonsFn`, `s.setupProjectionFn`.
/// @param state Record providing `state.services`, `state.numDrawSurfs`.
function R_GenerateDrawSurfs(state)
  if state==void or state.services==void then return fail("missing render services") end if;s=state.services;c=s.context
  if s.addWorldFn!=void then value=s.addWorldFn(c,state);if value is error then return value end if end if
  if s.addPolygonsFn!=void then value=s.addPolygonsFn(c,state);if value is error then return value end if end if
  if s.setupProjectionFn!=void then value=s.setupProjectionFn(c,state);if value is error then return value end if end if
  if s.addEntitiesFn!=void then value=s.addEntitiesFn(c,state);if value is error then return value end if end if
  return state.numDrawSurfs
end function

/// Builds `mq3.renderer.tr_main_runtime.DebugPolygonResult` for `mq3.renderer.tr_main_runtime.R_DebugPolygon`.
/// @param color Input used by `rgb=[color&1,(color>>1)&1,(color>>2)&1]`.
/// @param points Value used for `mq3.renderer.tr_main_runtime.DebugPass.points`.
function R_DebugPolygon(color,points)
  if points==void or len(points)<3 then return fail("debug polygon needs at least three points") end if
  rgb=[color&1,(color>>1)&1,(color>>2)&1]
  return DebugPolygonResult(DebugPass(rgb,points,false,0.0,1.0),DebugPass([1,1,1],points,true,0.0,0.0))
end function

/// Computes `R_DebugGraphics` from `state.services.debugFn(state.services.context,state)` using `state.services.debugFn`.
/// @param state Record providing `state.services`.
/// @param enabled Input tested by `not enabled`.
function R_DebugGraphics(state,enabled)
  if not enabled then return false end if
  if state==void or state.services==void or state.services.debugFn==void then return fail("debug callback unavailable") end if
  return state.services.debugFn(state.services.context,state)
end function

/// Updates `state.viewCount`, `state.viewParms`, `state.viewParms.frameSceneNum`, `state.viewParms.frameCount`, `state.viewParms.world` in `mq3.renderer.tr_main_runtime.R_RenderView`; returns `true`.
/// @param state Mutable record or buffer; this call updates `state.viewCount`, `state.viewParms`, `state.viewParms.frameSceneNum`, `state.viewParms.frameCount`, `state.viewParms.world`.
/// @param parms Record providing `parms.viewportWidth`, `parms.viewportHeight`, `parms.origin`, `parms.axis`, `parms.fovX`, `parms.fovY`.
function R_RenderView(state,parms)
  if parms.viewportWidth<=0 or parms.viewportHeight<=0 then return false end if
  state.viewCount=state.viewCount+1;state.viewParms=parms;state.viewParms.frameSceneNum=state.frameSceneNum;state.viewParms.frameCount=state.frameCount;first=state.numDrawSurfs;state.viewCount=state.viewCount+1
  state.viewParms.world=R_RotateForViewer(parms.origin,parms.axis);state.viewParms.frustum=R_SetupFrustum(parms.origin,parms.axis,parms.fovX,parms.fovY)
  value=R_GenerateDrawSurfs(state);if value is error then return value end if
  if state.queue!=void then sorted=R_SortDrawSurfs(state.queue);if sorted is error then return sorted end if end if
  if state.services.addCommandFn!=void then value=state.services.addCommandFn(state.services.context,state,first,state.numDrawSurfs-first);if value is error then return value end if end if
  if state.services.debugFn!=void then state.services.debugFn(state.services.context,state) end if
  return true
end function
