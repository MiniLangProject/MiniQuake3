// SPDX-License-Identifier: GPL-2.0-or-later
// Front-end selection and recursive-view planning for Baseq3 portal surfaces.
package mq3.renderer.portal_render_pass

import mq3.shared.math as qmath
import mq3.renderer.portal_view as portalView

struct Refdef x y width height fovX fovY vieworg viewaxis time flags areaMask end struct
struct Surface normal dist faceIndex textureIndex distanceSquared end struct
struct Plan surface view refdef end struct

function fail(message) return error(7702,"portal render pass: "+message) end function
function portalMaterial(catalog,textureIndex)
  if catalog==void or catalog.materials==void then return false end if
  for each material in catalog.materials if material.textureIndex==textureIndex and material.sort==1.0 then return true end if end for
  return false
end function
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
function seenFace(values,faceIndex) for each value in values if value==faceIndex then return true end if end for;return false end function

// Baseq3 renders at most the first viable portal view in a main view and
// refuses recursion.  Here distance provides deterministic draw-surface
// ordering when several selected portal faces share sort == SS_PORTAL.
function prepare(renderData,catalog,geometry,sourceRefdef,isPortal)
  if isPortal then return void end if
  if renderData==void or renderData.triangles==void or geometry==void or sourceRefdef==void then return fail("world, scene geometry and refdef are required") end if
  // R_GetPortalOrientations requires an RT_PORTALSURFACE entity. HUD-only
  // views never submit the BSP world; neither case can produce a world portal.
  if (sourceRefdef.flags&1)!=0 or (geometry.portals!=void and len(geometry.portals)==0) then return void end if
  candidates=[];faces=[]
  for each triangle in renderData.triangles
    if not portalMaterial(catalog,triangle.textureIndex) or seenFace(faces,triangle.faceIndex) then continue end if
    surface=planeFor(triangle,sourceRefdef.vieworg);if surface!=void then candidates=candidates+[surface];faces=faces+[triangle.faceIndex] end if
  end for
  while len(candidates)>0
    best=0;if len(candidates)>1 then for index=1 to len(candidates)-1 if candidates[index].distanceSquared<candidates[best].distanceSquared or (candidates[index].distanceSquared==candidates[best].distanceSquared and candidates[index].faceIndex<candidates[best].faceIndex) then best=index end if end for end if
    surface=candidates[best];view=portalView.prepare(surface.normal,surface.dist,geometry.portals,sourceRefdef.time,sourceRefdef.vieworg,sourceRefdef.viewaxis)
    if view is error then return view end if
    if view!=void then
      refdef=Refdef(sourceRefdef.x,sourceRefdef.y,sourceRefdef.width,sourceRefdef.height,sourceRefdef.fovX,sourceRefdef.fovY,view.origin,view.axis,sourceRefdef.time,sourceRefdef.flags,sourceRefdef.areaMask)
      return Plan(surface,view,refdef)
    end if
    next=[];for index=0 to len(candidates)-1 if index!=best then next=next+[candidates[index]] end if end for;candidates=next
  end while
  return void
end function

struct ComposeServices drawPortalFn clearDepthFn drawMainFn context end struct
function compose(services,portal)
  if services==void or services.clearDepthFn==void or services.drawMainFn==void then return fail("composition services are incomplete") end if
  drawn=0
  if portal!=void then if services.drawPortalFn==void then return fail("portal draw service is missing") end if;value=services.drawPortalFn(services.context,portal);if value is error then return value end if;drawn=drawn+value;services.clearDepthFn(services.context) end if
  value=services.drawMainFn(services.context);if value is error then return value end if;return drawn+value
end function
