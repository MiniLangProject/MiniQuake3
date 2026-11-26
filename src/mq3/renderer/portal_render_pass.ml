// SPDX-License-Identifier: GPL-2.0-or-later
// Front-end selection and recursive-view planning for Baseq3 portal surfaces.
package mq3.renderer.portal_render_pass

import mq3.shared.math as qmath
import mq3.client.playable_viewer as viewer
import mq3.renderer.portal_view as portalView
import std.ds.set as sets
import std.ds.list as lists
import std.sort as sorting
import mq3.renderer.world_surface_selection as worldSelection

/// Data record for `mq3.renderer.portal_render_pass.Refdef`; groups `x`, `y`, `width`, `height`, `fovX`, `fovY`, and 5 further fields.
struct Refdef
  /// Horizontal position of the view or drawing rectangle, in pixels.
  x
  /// Vertical position of the view or drawing rectangle, in pixels.
  y
  /// Width in pixels of the viewport rendered through the secondary portal camera.
  width
  /// Height in pixels of the viewport rendered through the secondary portal camera.
  height
  /// Horizontal camera field of view, in degrees.
  fovX
  /// Vertical camera field of view, in degrees.
  fovY
  /// Camera origin in world coordinates.
  vieworg
  /// Camera orientation represented by three basis vectors.
  viewaxis
  /// Scene time in milliseconds preserved when constructing the secondary portal view.
  time
  /// View-definition flags applied when rendering the portal camera.
  flags
  /// Area-visibility mask; set bits suppress rendering of the associated areas.
  areaMask
end struct
/// Data record for `mq3.renderer.portal_render_pass.Surface`; groups `normal`, `dist`, `faceIndex`, `textureIndex`, `distanceSquared`.
struct Surface
  /// Normalized portal-surface plane normal derived from its candidate world triangle.
  normal
  /// Signed plane distance measured along its normal.
  dist
  /// Index of the source BSP face.
  faceIndex
  /// Index identifying the texture or BSP shader assigned to the surface.
  textureIndex
  /// Squared distance used for ordering or rejecting the candidate.
  distanceSquared
end struct
/// Data record for `mq3.renderer.portal_render_pass.Plan`; groups `surface`, `view`, `refdef`.
struct Plan
  /// Surface record, handle, or identifier associated with the drawing operation.
  surface
  /// Derived camera orientation and clipping state for a portal view.
  view
  /// Camera, viewport, timing, and rendering flags for the view.
  refdef
end struct
/// Data record for `mq3.renderer.portal_render_pass.WorldBatchCache`; groups `faces`, `normal`, `dist`, `batch`, `builds`, `hits`, and 1 further field.
struct WorldBatchCache
  /// BSP faces retained for the current geometry or visibility selection.
  faces
  /// Portal clipping-plane normal included in the retained world-batch cache key.
  normal
  /// Signed plane distance measured along its normal.
  dist
  /// Prepared drawing batch associated with the selected geometry.
  batch
  /// Number of cache entries or batches rebuilt from source data.
  builds
  /// Number of lookups satisfied by an existing cache entry.
  hits
  /// Number of BSP faces clipped against the portal plane.
  clippedFaces
end struct

/// Constructs `mq3.renderer.portal_render_pass.WorldBatchCache` with `faces` = `void`, `normal` = `void`, `dist` = `0.0`, `batch` = `void` and the supplied remaining values.
function worldBatchCache() return WorldBatchCache(void,void,0.0,void,0,0,void) end function
/// Updates `cache.hits` in `mq3.renderer.portal_render_pass.cachedWorldBatch`; returns `cache.batch`.
/// @param cache Mutable record or buffer; this call updates `cache.hits`.
/// @param faces Argument 2 supplied to `mq3.renderer.world_surface_selection.sameFaces`.
/// @param normal Three-component vector read at indices 0, 1, and 2.
/// @param dist Input tested by `cache.batch==void or cache.dist!=dist or cache.normal[0]!=normal[0] or cache.normal[1]!=normal[1] or cache.normal[2]!=normal[2]`.
function cachedWorldBatch(cache,faces,normal,dist)
  if cache.batch==void or cache.dist!=dist or cache.normal[0]!=normal[0] or cache.normal[1]!=normal[1] or cache.normal[2]!=normal[2] then return void end if
  if not worldSelection.sameFaces(cache.faces,faces) then return void end if
  cache.hits=cache.hits+1
  return cache.batch
end function
/// Updates `cache.faces`, `cache.normal`, `cache.dist`, `cache.batch`, `cache.builds` in `mq3.renderer.portal_render_pass.storeWorldBatch`; returns `batch`.
/// @param cache Mutable record or buffer; this call updates `cache.faces`, `cache.normal`, `cache.dist`, `cache.batch`, `cache.builds`.
/// @param faces Value assigned to `cache.faces`.
/// @param normal Value assigned to `cache.normal`.
/// @param dist Value assigned to `cache.dist`.
/// @param batch Value assigned to `cache.batch`.
function storeWorldBatch(cache,faces,normal,dist,batch)
  cache.faces=faces;cache.normal=normal;cache.dist=dist;cache.batch=batch
  cache.builds=cache.builds+1
  return batch
end function

/// Creates error `7702` with message `"portal render pass: "+message`.
/// @param message Input used in the result expression `error(7702,"portal render pass: "+message)`.
function fail(message) return error(7702,"portal render pass: "+message) end function
/// Returns `x*x+y*y+z*z` from `mq3.renderer.portal_render_pass.squaredDistance`.
/// @param a Three-component vector read at indices 0, 1, and 2.
/// @param b Three-component vector read at indices 0, 1, and 2.
function squaredDistance(a,b) x=a[0]-b[0];y=a[1]-b[1];z=a[2]-b[2];return x*x+y*y+z*z end function
/// Builds `mq3.renderer.portal_render_pass.Surface` using `mq3.shared.math.VectorLength`, `mq3.shared.math.CrossProduct`, `mq3.shared.math.VectorNormalize`.
/// @param triangle Record providing `triangle.vertices`, `triangle.faceIndex`, `triangle.textureIndex`.
/// @param viewOrigin Value forwarded as `b` to `mq3.renderer.portal_render_pass.squaredDistance`.
function planeFor(triangle,viewOrigin)
  if triangle==void or triangle.vertices==void or len(triangle.vertices)!=3 then return void end if
  a=triangle.vertices[0].position;b=triangle.vertices[1].position;c=triangle.vertices[2].position
  normal=[triangle.vertices[0].normal[0],triangle.vertices[0].normal[1],triangle.vertices[0].normal[2]]
  if qmath.VectorLength(normal)<0.0001 then normal=qmath.CrossProduct([b[0]-a[0],b[1]-a[1],b[2]-a[2]],[c[0]-a[0],c[1]-a[1],c[2]-a[2]]) end if
  if qmath.VectorNormalize(normal)==0.0 then return void end if
  center=[(a[0]+b[0]+c[0])/3.0,(a[1]+b[1]+c[1])/3.0,(a[2]+b[2]+c[2])/3.0]
  return Surface(normal,qmath.DotProduct(a,normal),triangle.faceIndex,triangle.textureIndex,squaredDistance(center,viewOrigin))
end function
/// Computes `left.distanceSquared<right.distanceSquared or (left.distanceSquared==right.distanceSquared and left.faceIndex<right.faceIndex)` for `mq3.renderer.portal_render_pass.before`.
/// @param left Record providing `left.distanceSquared`, `left.faceIndex`.
/// @param right Record providing `right.distanceSquared`, `right.faceIndex`.
function before(left,right)
  return left.distanceSquared<right.distanceSquared or (left.distanceSquared==right.distanceSquared and left.faceIndex<right.faceIndex)
end function

// tr_main.c:SurfIsOffscreen rejects a portal surface when every vertex is
// outside the same clip plane.  The draw-surface selection alone is coarser:
// its face bounds can intersect the frustum while the portal triangle does not.
/// @param triangle Record providing `triangle.vertices`.
/// @param refdef Record providing `refdef.vieworg`, `refdef.viewaxis`.
/// @param slopeX Input tested by `side>=depth*slopeX`.
/// @param slopeY Input tested by `up>=depth*slopeY`.
function triangleInFrustum(triangle,refdef,slopeX,slopeY)
  common=127
  for each vertex in triangle.vertices
    point=vertex.position;delta=[point[0]-refdef.vieworg[0],point[1]-refdef.vieworg[1],point[2]-refdef.vieworg[2]]
    depth=qmath.DotProduct(delta,refdef.viewaxis[0]);side=qmath.DotProduct(delta,refdef.viewaxis[1]);up=qmath.DotProduct(delta,refdef.viewaxis[2]);flags=0
    if side>=depth*slopeX then flags=flags|1 end if
    if side<= -depth*slopeX then flags=flags|2 end if
    if up>=depth*slopeY then flags=flags|4 end if
    if up<= -depth*slopeY then flags=flags|8 end if
    if depth<1.0 then flags=flags|64 end if
    common=common&flags
  end for
  return common==0
end function

// SurfIsOffscreen counts only triangles whose first vertex faces the eye.
// A surface with every triangle backfaced cannot contribute a portal view.
/// @param triangle Record providing `triangle.vertices`.
/// @param viewOrigin Three-component vector read at indices 0, 1, and 2.
function triangleFacesView(triangle,viewOrigin)
  vertex=triangle.vertices[0];point=vertex.position;normal=vertex.normal
  return (point[0]-viewOrigin[0])*normal[0]+(point[1]-viewOrigin[1])*normal[1]+(point[2]-viewOrigin[2])*normal[2]<0.0
end function

// Baseq3 renders at most the first viable portal view in a main view and
// refuses recursion.  Here distance provides deterministic draw-surface
// ordering when several selected portal faces share sort == SS_PORTAL.
/// @param renderData Record providing `renderData.triangles`.
/// @param catalog Record providing `catalog.materials`.
/// @param geometry Record providing `geometry.portals`.
/// @param sourceRefdef Record providing `sourceRefdef.flags`, `sourceRefdef.width`, `sourceRefdef.fovX`, `sourceRefdef.height`, `sourceRefdef.fovY`, `sourceRefdef.vieworg`.
/// @param isPortal Input tested by `isPortal`.
function prepare(renderData,catalog,geometry,sourceRefdef,isPortal)
  if isPortal then return void end if
  if renderData==void or renderData.triangles==void or geometry==void or sourceRefdef==void then return fail("world, scene geometry and refdef are required") end if
  // R_GetPortalOrientations requires an RT_PORTALSURFACE entity. HUD-only
  // views never submit the BSP world; neither case can produce a world portal.
  if (sourceRefdef.flags&1)!=0 or (geometry.portals!=void and len(geometry.portals)==0) then return void end if
  textures=sets.HashSet.new()
  if catalog!=void and catalog.materials!=void then
    for each material in catalog.materials if material.sort==1.0 then textures.add(material.textureIndex) end if end for
  end if
  if textures.isEmpty() then return void end if
  focalX=viewer.focalLength(sourceRefdef.width,sourceRefdef.fovX);if focalX is error then return focalX end if
  focalY=viewer.focalLength(sourceRefdef.height,sourceRefdef.fovY);if focalY is error then return focalY end if
  slopeX=sourceRefdef.width/(2.0*focalX);slopeY=sourceRefdef.height/(2.0*focalY)
  candidates=lists.List.new();faces=sets.HashSet.new()
  for each triangle in renderData.triangles
    if not textures.has(triangle.textureIndex) or faces.has(triangle.faceIndex) then continue end if
    if not triangleInFrustum(triangle,sourceRefdef,slopeX,slopeY) then continue end if
    if not triangleFacesView(triangle,sourceRefdef.vieworg) then continue end if
    surface=planeFor(triangle,sourceRefdef.vieworg);if surface!=void then candidates.add(surface);faces.add(triangle.faceIndex) end if
  end for
  ordered=candidates.toArray();sorting.sortBy(ordered,before)
  for each surface in ordered
    view=portalView.prepare(surface.normal,surface.dist,geometry.portals,sourceRefdef.time,sourceRefdef.vieworg,sourceRefdef.viewaxis)
    if view is error then return view end if
    if view!=void then
      refdef=Refdef(sourceRefdef.x,sourceRefdef.y,sourceRefdef.width,sourceRefdef.height,sourceRefdef.fovX,sourceRefdef.fovY,view.origin,view.axis,sourceRefdef.time,sourceRefdef.flags,sourceRefdef.areaMask)
      return Plan(surface,view,refdef)
    end if
  end for
  return void
end function

/// Callback table for `mq3.renderer.portal_render_pass.ComposeServices`; exposes `drawPortalFn`, `clearDepthFn`, `drawMainFn`, `context`.
struct ComposeServices
  /// Host callback used to perform draw portal operations for this subsystem.
  drawPortalFn
  /// Host callback used to perform clear depth operations for this subsystem.
  clearDepthFn
  /// Host callback used to perform draw main operations for this subsystem.
  drawMainFn
  /// Drawing-host state shared by portal rendering, depth clearing, and main-view composition
  /// callbacks.
  context
end struct
/// Computes `compose` from `drawn+value` using `services.drawPortalFn`, `services.clearDepthFn`, `services.drawMainFn`.
/// @param services Record providing `services.clearDepthFn`, `services.drawMainFn`, `services.drawPortalFn`, `services.context`.
/// @param portal Argument 2 supplied to `services.drawPortalFn`.
function compose(services,portal)
  if services==void or services.clearDepthFn==void or services.drawMainFn==void then return fail("composition services are incomplete") end if
  drawn=0
  if portal!=void then if services.drawPortalFn==void then return fail("portal draw service is missing") end if;value=services.drawPortalFn(services.context,portal);if value is error then return value end if;drawn=drawn+value;services.clearDepthFn(services.context) end if
  value=services.drawMainFn(services.context);if value is error then return value end if;return drawn+value
end function
