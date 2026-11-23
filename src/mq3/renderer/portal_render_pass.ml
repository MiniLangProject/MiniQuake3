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

struct Refdef x y width height fovX fovY vieworg viewaxis time flags areaMask end struct
struct Surface normal dist faceIndex textureIndex distanceSquared end struct
struct Plan surface view refdef end struct
struct WorldBatchCache faces normal dist batch builds hits clippedFaces end struct

function worldBatchCache() return WorldBatchCache(void,void,0.0,void,0,0,void) end function
function cachedWorldBatch(cache,faces,normal,dist)
  if cache.batch==void or cache.dist!=dist or cache.normal[0]!=normal[0] or cache.normal[1]!=normal[1] or cache.normal[2]!=normal[2] then return void end if
  if not worldSelection.sameFaces(cache.faces,faces) then return void end if
  cache.hits=cache.hits+1
  return cache.batch
end function
function storeWorldBatch(cache,faces,normal,dist,batch)
  cache.faces=faces;cache.normal=normal;cache.dist=dist;cache.batch=batch
  cache.builds=cache.builds+1
  return batch
end function

function fail(message) return error(7702,"portal render pass: "+message) end function
function squaredDistance(a,b) x=a[0]-b[0];y=a[1]-b[1];z=a[2]-b[2];return x*x+y*y+z*z end function
function planeFor(triangle,viewOrigin)
  if triangle==void or triangle.vertices==void or len(triangle.vertices)!=3 then return void end if
  a=triangle.vertices[0].position;b=triangle.vertices[1].position;c=triangle.vertices[2].position
  normal=[triangle.vertices[0].normal[0],triangle.vertices[0].normal[1],triangle.vertices[0].normal[2]]
  if qmath.VectorLength(normal)<0.0001 then normal=qmath.CrossProduct([b[0]-a[0],b[1]-a[1],b[2]-a[2]],[c[0]-a[0],c[1]-a[1],c[2]-a[2]]) end if
  if qmath.VectorNormalize(normal)==0.0 then return void end if
  center=[(a[0]+b[0]+c[0])/3.0,(a[1]+b[1]+c[1])/3.0,(a[2]+b[2]+c[2])/3.0]
  return Surface(normal,qmath.DotProduct(a,normal),triangle.faceIndex,triangle.textureIndex,squaredDistance(center,viewOrigin))
end function
function before(left,right)
  return left.distanceSquared<right.distanceSquared or (left.distanceSquared==right.distanceSquared and left.faceIndex<right.faceIndex)
end function

// tr_main.c:SurfIsOffscreen rejects a portal surface when every vertex is
// outside the same clip plane.  The draw-surface selection alone is coarser:
// its face bounds can intersect the frustum while the portal triangle does not.
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

// Baseq3 renders at most the first viable portal view in a main view and
// refuses recursion.  Here distance provides deterministic draw-surface
// ordering when several selected portal faces share sort == SS_PORTAL.
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

struct ComposeServices drawPortalFn clearDepthFn drawMainFn context end struct
function compose(services,portal)
  if services==void or services.clearDepthFn==void or services.drawMainFn==void then return fail("composition services are incomplete") end if
  drawn=0
  if portal!=void then if services.drawPortalFn==void then return fail("portal draw service is missing") end if;value=services.drawPortalFn(services.context,portal);if value is error then return value end if;drawn=drawn+value;services.clearDepthFn(services.context) end if
  value=services.drawMainFn(services.context);if value is error then return value end if;return drawn+value
end function
