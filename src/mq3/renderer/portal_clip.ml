// SPDX-License-Identifier: GPL-2.0-or-later
// World-space user clip plane used by recursive portal views.
package mq3.renderer.portal_clip

import mq3.renderer.bsp_render_data as renderData
import mq3.renderer.qvm_scene_geometry as sceneGeometry
import mq3.shared.math as qmath
import mq3.compat.numeric as numeric
import std.ds.list as lists

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
  output=array(len(vertices)+1,void);count=0;previous=vertices[len(vertices)-1];previousDistance=distance(previous.position,normal,dist);previousInside=previousDistance>=0.0
  for each current in vertices
    currentDistance=distance(current.position,normal,dist);currentInside=currentDistance>=0.0
    if currentInside then if not previousInside then output[count]=clippedVertex(previous,current,previousDistance,currentDistance);count=count+1 end if;output[count]=current;count=count+1
    else if previousInside then output[count]=clippedVertex(previous,current,previousDistance,currentDistance);count=count+1 end if
    previous=current;previousDistance=currentDistance;previousInside=currentInside
  end for
  if count==0 then return [] end if
  result=array(count,void);copyArray(result,0,output,0,count);return result
end function
function clipTriangles(input,normal,dist)
  // A portal can expose thousands of BSP triangles. Appending to an immutable
  // array copied the entire prefix for every emitted triangle each frame.
  triangles=lists.List.withCapacity(len(input)*2)
  for each triangle in input
    polygon=clipVertices(triangle.vertices,normal,dist)
    if len(polygon)>=3 then for corner=1 to len(polygon)-2 triangles.add(renderData.RenderTriangle([polygon[0],polygon[corner],polygon[corner+1]],triangle.textureIndex,triangle.lightmapIndex,triangle.fogIndex,triangle.faceIndex,triangle.triangleIndex)) end for end if
  end for
  return triangles.toArray()
end function
function clipRenderData(source,normal,dist)
  if source==void or source.triangles==void or normal==void or len(normal)!=3 then return fail("render data and plane are required") end if
  triangles=clipTriangles(source.triangles,normal,dist)
  return renderData.RenderData(triangles,source.surfaceCount,len(triangles),source.skippedSurfaceCount,source.truncated,source.patchSurfaceCount)
end function

// A face's vertices, including each patch LOD variant, are immutable within
// its world. Only the selection and the portal plane vary between views.
struct FaceCache world normal dist byFace end struct
function createFaceCache(world) return FaceCache(world,void,0.0,void) end function
function clipSelection(cache,chosen,normal,dist)
  if cache==void or chosen==void or normal==void or len(normal)!=3 then return fail("selection and portal plane are required") end if
  world=cache.world
  if cache.normal==void or cache.dist!=dist or cache.normal[0]!=normal[0] or cache.normal[1]!=normal[1] or cache.normal[2]!=normal[2] or len(cache.byFace)!=len(world.trianglesByFace) then
    cache.byFace=array(len(world.trianglesByFace),void)
    cache.normal=[normal[0],normal[1],normal[2]];cache.dist=dist
  end if
  total=0;patches=0
  for each face in chosen.faceIndexes
    if face<0 or face>=len(cache.byFace) then return fail("selected face outside portal cache") end if
    clipped=cache.byFace[face]
    if clipped==void then
      clipped=clipTriangles(world.trianglesByFace[face],normal,dist)
      cache.byFace[face]=clipped
    end if
    total=total+len(clipped)
    if world.faceKinds[face]==renderData.MST_PATCH then patches=patches+1 end if
  end for
  triangles=array(total,void);offset=0
  for each face in chosen.faceIndexes
    clipped=cache.byFace[face];count=len(clipped)
    if count>0 then copyArray(triangles,offset,clipped,0,count);offset=offset+count end if
  end for
  return renderData.RenderData(triangles,chosen.selectedSurfaceCount,total,0,false,patches)
end function

struct SceneVertex position texCoord lightmapCoord normal color entityColor end struct
function sceneVertex(triangle,corner) return SceneVertex(triangle.positions[corner],triangle.texCoords[corner],triangle.lightmapCoords[corner],triangle.normals[corner],triangle.colors[corner],triangle.entityColor) end function
function clippedSceneVertex(a,b,da,db) t=da/(da-db);normal=lerp3(a.normal,b.normal,t);qmath.VectorNormalize(normal);return SceneVertex(lerp3(a.position,b.position,t),lerp2(a.texCoord,b.texCoord,t),lerp2(a.lightmapCoord,b.lightmapCoord,t),normal,lerpColor(a.color,b.color,t),lerpColor(a.entityColor,b.entityColor,t)) end function
function clipSceneVertices(vertices,normal,dist)
  output=array(len(vertices)+1,void);count=0;previous=vertices[len(vertices)-1];pd=distance(previous.position,normal,dist);pi=pd>=0.0
  for each current in vertices cd=distance(current.position,normal,dist);ci=cd>=0.0;if ci then if not pi then output[count]=clippedSceneVertex(previous,current,pd,cd);count=count+1 end if;output[count]=current;count=count+1 else if pi then output[count]=clippedSceneVertex(previous,current,pd,cd);count=count+1 end if;previous=current;pd=cd;pi=ci end for
  if count==0 then return [] end if
  result=array(count,void);copyArray(result,0,output,0,count);return result
end function
function sceneTriangle(source,a,b,c)
  return sceneGeometry.Triangle([a.position,b.position,c.position],[a.texCoord,b.texCoord,c.texCoord],[a.normal,b.normal,c.normal],[a.color,b.color,c.color],source.entityColor,source.entityTexCoord,source.shaderTime,source.modelHandle,source.customSkin,source.shaderHandle,source.shaderName,source.surfaceName,source.entityIndex,source.surfaceIndex,source.renderfx,[a.lightmapCoord,b.lightmapCoord,c.lightmapCoord],source.lightmapIndex,source.fogIndex,source.dynamicLight,source.dynamicLightOrigin,source.dynamicLightAxis,source.dynamicLightBounds,void)
end function
function clipScene(source,normal,dist)
  if source==void or source.triangles==void or normal==void or len(normal)!=3 then return fail("scene geometry and plane are required") end if
  triangles=lists.List.withCapacity(len(source.triangles)*2)
  for each triangle in source.triangles
    a=distance(triangle.positions[0],normal,dist)>=0.0
    b=distance(triangle.positions[1],normal,dist)>=0.0
    c=distance(triangle.positions[2],normal,dist)>=0.0
    if a and b and c then
      // A clipped scene uses its own vertex IDs. Its unmodified vertex attributes
      // may be shared with the source until the portal batch consumes them.
      kept=triangle
      if triangle.vertexIds!=void then
        kept=sceneGeometry.Triangle(triangle.positions,triangle.texCoords,triangle.normals,triangle.colors,triangle.entityColor,triangle.entityTexCoord,triangle.shaderTime,triangle.modelHandle,triangle.customSkin,triangle.shaderHandle,triangle.shaderName,triangle.surfaceName,triangle.entityIndex,triangle.surfaceIndex,triangle.renderfx,triangle.lightmapCoords,triangle.lightmapIndex,triangle.fogIndex,triangle.dynamicLight,triangle.dynamicLightOrigin,triangle.dynamicLightAxis,triangle.dynamicLightBounds,void)
      end if
      triangles.add(kept)
    else if a or b or c then
      polygon=clipSceneVertices([sceneVertex(triangle,0),sceneVertex(triangle,1),sceneVertex(triangle,2)],normal,dist)
      for corner=1 to len(polygon)-2 triangles.add(sceneTriangle(triangle,polygon[0],polygon[corner],polygon[corner+1])) end for
    end if
  end for
  // Stencil volumes are depth-tested against the already clipped portal
  // scene and constrained again by its viewport. Preserve their closed side
  // topology here: clipping individual volume sides would open the volume and
  // corrupt the increment/decrement stencil count.
  return sceneGeometry.Geometry(triangles.toArray(),triangles.len(),source.modelEntities,source.spriteEntities,source.polySurfaces,source.skippedInline,source.skippedUnsupported,source.sourceVertices,source.vertexTransforms,source.portals,source.culledInline,source.shadowTriangles,source.shadowTriangleCount)
end function
