// SPDX-License-Identifier: GPL-2.0-or-later
// World-space user clip plane used by recursive portal views.
package mq3.renderer.portal_clip

import mq3.renderer.bsp_render_data as renderData
import mq3.renderer.qvm_scene_geometry as sceneGeometry
import mq3.shared.math as qmath
import mq3.compat.numeric as numeric

function fail(message) return error(7703,"portal clip: "+message) end function
function distance(point,normal,dist) return qmath.DotProduct(point,normal)-dist end function
function lerp3(a,b,t) return [a[0]+(b[0]-a[0])*t,a[1]+(b[1]-a[1])*t,a[2]+(b[2]-a[2])*t] end function
function lerp2(a,b,t) return [a[0]+(b[0]-a[0])*t,a[1]+(b[1]-a[1])*t] end function
function lerpColor(a,b,t) return [numeric.trunc32(a[0]+(b[0]-a[0])*t),numeric.trunc32(a[1]+(b[1]-a[1])*t),numeric.trunc32(a[2]+(b[2]-a[2])*t),numeric.trunc32(a[3]+(b[3]-a[3])*t)] end function
function clippedVertex(a,b,da,db)
  t=da/(da-db);normal=lerp3(a.normal,b.normal,t);qmath.VectorNormalize(normal)
  return renderData.RenderVertex(lerp3(a.position,b.position,t),lerp2(a.baseUV,b.baseUV,t),lerp2(a.lightmapUV,b.lightmapUV,t),normal,lerpColor(a.color,b.color,t),lerpColor(a.entityColor,b.entityColor,t),lerp2(a.entityTexCoord,b.entityTexCoord,t),a.shaderTime+(b.shaderTime-a.shaderTime)*t,-1)
end function
function clipVertices(vertices,normal,dist)
  output=[];previous=vertices[len(vertices)-1];previousDistance=distance(previous.position,normal,dist);previousInside=previousDistance>=0.0
  for each current in vertices
    currentDistance=distance(current.position,normal,dist);currentInside=currentDistance>=0.0
    if currentInside then if not previousInside then output=output+[clippedVertex(previous,current,previousDistance,currentDistance)] end if;output=output+[current]
    else if previousInside then output=output+[clippedVertex(previous,current,previousDistance,currentDistance)] end if
    previous=current;previousDistance=currentDistance;previousInside=currentInside
  end for
  return output
end function
function clipRenderData(source,normal,dist)
  if source==void or source.triangles==void or normal==void or len(normal)!=3 then return fail("render data and plane are required") end if
  triangles=[]
  for each triangle in source.triangles
    polygon=clipVertices(triangle.vertices,normal,dist)
    if len(polygon)>=3 then for corner=1 to len(polygon)-2 triangles=triangles+[renderData.RenderTriangle([polygon[0],polygon[corner],polygon[corner+1]],triangle.textureIndex,triangle.lightmapIndex,triangle.fogIndex,triangle.faceIndex,triangle.triangleIndex)] end for end if
  end for
  return renderData.RenderData(triangles,source.surfaceCount,len(triangles),source.skippedSurfaceCount,source.truncated,source.patchSurfaceCount)
end function

struct SceneVertex position texCoord lightmapCoord normal color entityColor end struct
function sceneVertex(triangle,corner) return SceneVertex(triangle.positions[corner],triangle.texCoords[corner],triangle.lightmapCoords[corner],triangle.normals[corner],triangle.colors[corner],triangle.entityColor) end function
function clippedSceneVertex(a,b,da,db) t=da/(da-db);normal=lerp3(a.normal,b.normal,t);qmath.VectorNormalize(normal);return SceneVertex(lerp3(a.position,b.position,t),lerp2(a.texCoord,b.texCoord,t),lerp2(a.lightmapCoord,b.lightmapCoord,t),normal,lerpColor(a.color,b.color,t),lerpColor(a.entityColor,b.entityColor,t)) end function
function clipSceneVertices(vertices,normal,dist)
  output=[];previous=vertices[len(vertices)-1];pd=distance(previous.position,normal,dist);pi=pd>=0.0
  for each current in vertices cd=distance(current.position,normal,dist);ci=cd>=0.0;if ci then if not pi then output=output+[clippedSceneVertex(previous,current,pd,cd)] end if;output=output+[current] else if pi then output=output+[clippedSceneVertex(previous,current,pd,cd)] end if;previous=current;pd=cd;pi=ci end for
  return output
end function
function sceneTriangle(source,a,b,c)
  return sceneGeometry.Triangle([a.position,b.position,c.position],[a.texCoord,b.texCoord,c.texCoord],[a.normal,b.normal,c.normal],[a.color,b.color,c.color],source.entityColor,source.entityTexCoord,source.shaderTime,source.modelHandle,source.customSkin,source.shaderHandle,source.shaderName,source.surfaceName,source.entityIndex,source.surfaceIndex,source.renderfx,[a.lightmapCoord,b.lightmapCoord,c.lightmapCoord],source.lightmapIndex,source.fogIndex,source.dynamicLight,source.dynamicLightOrigin,source.dynamicLightAxis,source.dynamicLightBounds)
end function
function clipScene(source,normal,dist)
  if source==void or source.triangles==void or normal==void or len(normal)!=3 then return fail("scene geometry and plane are required") end if
  triangles=[]
  for each triangle in source.triangles polygon=clipSceneVertices([sceneVertex(triangle,0),sceneVertex(triangle,1),sceneVertex(triangle,2)],normal,dist);if len(polygon)>=3 then for corner=1 to len(polygon)-2 triangles=triangles+[sceneTriangle(triangle,polygon[0],polygon[corner],polygon[corner+1])] end for end if end for
  return sceneGeometry.Geometry(triangles,len(triangles),source.modelEntities,source.spriteEntities,source.polySurfaces,source.skippedInline,source.skippedUnsupported,source.sourceVertices,source.vertexTransforms,source.portals,source.culledInline)
end function
