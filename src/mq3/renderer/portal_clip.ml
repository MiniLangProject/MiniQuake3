// SPDX-License-Identifier: GPL-2.0-or-later
// World-space user clip plane used by recursive portal views.
package mq3.renderer.portal_clip

import mq3.renderer.bsp_render_data as renderData
import mq3.renderer.qvm_scene_geometry as sceneGeometry
import mq3.shared.math as qmath
import mq3.compat.numeric as numeric
import std.ds.list as lists

/// Creates error `7703` with message `"portal clip: "+message`.
/// @param message Input used in the result expression `error(7703,"portal clip: "+message)`.
function fail(message) return error(7703,"portal clip: "+message) end function
/// Computes `qmath.DotProduct(point,normal)-dist` for `mq3.renderer.portal_clip.distance`.
/// @param point Argument 1 supplied to `mq3.shared.math.DotProduct`.
/// @param normal Argument 2 supplied to `mq3.shared.math.DotProduct`.
/// @param dist Input used in the result expression `qmath.DotProduct(point,normal)-dist`.
function distance(point,normal,dist) return qmath.DotProduct(point,normal)-dist end function
/// Returns `[a[0]+(b[0]-a[0])*t,a[1]+(b[1]-a[1])*t,a[2]+(b[2]-a[2])*t]` for `mq3.renderer.portal_clip.lerp3`.
/// @param a Three-component vector read at indices 0, 1, and 2.
/// @param b Three-component vector read at indices 0, 1, and 2.
/// @param t Input used in the result expression `[a[0]+(b[0]-a[0])*t,a[1]+(b[1]-a[1])*t,a[2]+(b[2]-a[2])*t]`.
function lerp3(a,b,t) return [a[0]+(b[0]-a[0])*t,a[1]+(b[1]-a[1])*t,a[2]+(b[2]-a[2])*t] end function
/// Returns `[a[0]+(b[0]-a[0])*t,a[1]+(b[1]-a[1])*t]` for `mq3.renderer.portal_clip.lerp2`.
/// @param a Indexed input read at `0`, `1`.
/// @param b Indexed input read at `0`, `1`.
/// @param t Input used in the result expression `[a[0]+(b[0]-a[0])*t,a[1]+(b[1]-a[1])*t]`.
function lerp2(a,b,t) return [a[0]+(b[0]-a[0])*t,a[1]+(b[1]-a[1])*t] end function
/// Builds the 4-element result for `mq3.renderer.portal_clip.lerpColor` from `numeric.trunc32(a[0]+(b[0]-a[0])*t)`, `numeric.trunc32(a[1]+(b[1]-a[1])*t)`, `numeric.trunc32(a[2]+(b[2]-a[2])*t)`, `numeric.trunc32(a[3]+(b[3]-a[3])*t)`.
/// @param a Indexed input read at `0`, `1`, `2`, `3`.
/// @param b Indexed input read at `0`, `1`, `2`, `3`.
/// @param t Input used in the result expression `[numeric.trunc32(a[0]+(b[0]-a[0])*t),numeric.trunc32(a[1]+(b[1]-a[1])*t),numeric.trunc32(a[2]+(b[2]-a[2])*t),numeric.trunc32(a[3]+(b[3]-a[3])*t)]`.
function lerpColor(a,b,t) return [numeric.trunc32(a[0]+(b[0]-a[0])*t),numeric.trunc32(a[1]+(b[1]-a[1])*t),numeric.trunc32(a[2]+(b[2]-a[2])*t),numeric.trunc32(a[3]+(b[3]-a[3])*t)] end function
/// Interpolates a plane-crossing render vertex, renormalizing its normal and preserving shader/entity attributes.
/// @param a Record providing `a.normal`, `a.position`, `a.baseUV`, `a.lightmapUV`, `a.color`, `a.entityColor`.
/// @param b Record providing `b.normal`, `b.position`, `b.baseUV`, `b.lightmapUV`, `b.color`, `b.entityColor`.
/// @param da Input used by `t=da/(da-db)`.
/// @param db Input used by `t=da/(da-db)`.
function clippedVertex(a,b,da,db)
  t=da/(da-db);normal=lerp3(a.normal,b.normal,t);qmath.VectorNormalize(normal)
  return renderData.RenderVertex(lerp3(a.position,b.position,t),lerp2(a.baseUV,b.baseUV,t),lerp2(a.lightmapUV,b.lightmapUV,t),normal,lerpColor(a.color,b.color,t),lerpColor(a.entityColor,b.entityColor,t),lerp2(a.entityTexCoord,b.entityTexCoord,t),a.shaderTime+(b.shaderTime-a.shaderTime)*t,-1)
end function
/// Builds `output[count]` in `mq3.renderer.portal_clip.clipVertices`; returns `result`.
/// @param vertices Indexed input read at `len(vertices)-1`.
/// @param normal Value forwarded as `normal` to `mq3.renderer.portal_clip.distance`.
/// @param dist Value forwarded as `dist` to `mq3.renderer.portal_clip.distance`.
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
/// Computes `clipTriangles` from `triangles.toArray()` using `std.ds.list.List.withCapacity`, `mq3.renderer.portal_clip.clipVertices`, `triangles.add`.
/// @param input Sequence traversed as `triangle` while producing this result.
/// @param normal Value forwarded as `normal` to `mq3.renderer.portal_clip.clipVertices`.
/// @param dist Value forwarded as `dist` to `mq3.renderer.portal_clip.clipVertices`.
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
/// Clips render triangles against a plane and rebuilds render-data counts while preserving source metadata.
/// @param source Record providing `source.triangles`, `source.surfaceCount`, `source.skippedSurfaceCount`, `source.truncated`, `source.patchSurfaceCount`.
/// @param normal Value forwarded as `normal` to `mq3.renderer.portal_clip.clipTriangles`.
/// @param dist Value forwarded as `dist` to `mq3.renderer.portal_clip.clipTriangles`.
function clipRenderData(source,normal,dist)
  if source==void or source.triangles==void or normal==void or len(normal)!=3 then return fail("render data and plane are required") end if
  triangles=clipTriangles(source.triangles,normal,dist)
  return renderData.RenderData(triangles,source.surfaceCount,len(triangles),source.skippedSurfaceCount,source.truncated,source.patchSurfaceCount)
end function

// A face's vertices, including each patch LOD variant, are immutable within
// its world. Only the selection and the portal plane vary between views.
struct FaceCache
  /// Loaded world geometry and associated scene state.
  world
  /// Clipping-plane normal associated with the cached portal-clipped face set.
  normal
  /// Signed plane distance measured along its normal.
  dist
  /// Portal-clipped geometry cached by original BSP face index.
  byFace
end struct
/// Constructs `mq3.renderer.portal_clip.FaceCache` with `normal` = `void`, `dist` = `0.0`, `byFace` = `void` and the supplied remaining values.
/// @param world Initial value for `mq3.renderer.portal_clip.FaceCache.world`.
function createFaceCache(world) return FaceCache(world,void,0.0,void) end function
/// Updates `cache.byFace`, `cache.normal`, `cache.dist`, `cache.byFace[face]` in `mq3.renderer.portal_clip.clipSelection`; returns `renderData.RenderData(triangles,chosen.selectedSurfaceCount,total,0,false,patches)`.
/// @param cache Mutable record or buffer; this call updates `cache.byFace`, `cache.normal`, `cache.dist`, `cache.byFace[face]`.
/// @param chosen Record providing `chosen.faceIndexes`, `chosen.selectedSurfaceCount`.
/// @param normal Value forwarded as `normal` to `mq3.renderer.portal_clip.clipTriangles`.
/// @param dist Value assigned to `cache.dist`.
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

/// Data record for `mq3.renderer.portal_clip.SceneVertex`; groups `position`, `texCoord`, `lightmapCoord`, `normal`, `color`, `entityColor`.
struct SceneVertex
  /// Three-dimensional position of the vertex.
  position
  /// Base texture coordinates of the clipped scene vertex.
  texCoord
  /// Baked-lightmap coordinates of the clipped scene vertex.
  lightmapCoord
  /// Scene vertex normal preserved or interpolated while clipping geometry against a portal plane.
  normal
  /// Vertex color retained and interpolated as scene geometry is clipped at the portal boundary.
  color
  /// Entity-supplied color used by entity-driven shader stages.
  entityColor
end struct
/// Constructs `mq3.renderer.portal_clip.SceneVertex` with `position` = `triangle.positions[corner]`, `texCoord` = `triangle.texCoords[corner]`, `lightmapCoord` = `triangle.lightmapCoords[corner]`, `normal` = `triangle.normals[corner]` and the supplied remaining values.
/// @param triangle Record providing `triangle.positions`, `triangle.texCoords`, `triangle.lightmapCoords`, `triangle.normals`, `triangle.colors`, `triangle.entityColor`.
/// @param corner Vertex index used consistently across the triangle position/UV/normal/color arrays.
function sceneVertex(triangle,corner) return SceneVertex(triangle.positions[corner],triangle.texCoords[corner],triangle.lightmapCoords[corner],triangle.normals[corner],triangle.colors[corner],triangle.entityColor) end function
/// Builds `mq3.renderer.portal_clip.SceneVertex` using `mq3.shared.math.VectorNormalize`.
/// @param a Record providing `a.normal`, `a.position`, `a.texCoord`, `a.lightmapCoord`, `a.color`, `a.entityColor`.
/// @param b Record providing `b.normal`, `b.position`, `b.texCoord`, `b.lightmapCoord`, `b.color`, `b.entityColor`.
/// @param da Input used by `t=da/(da-db)`.
/// @param db Input used by `t=da/(da-db)`.
function clippedSceneVertex(a,b,da,db) t=da/(da-db);normal=lerp3(a.normal,b.normal,t);qmath.VectorNormalize(normal);return SceneVertex(lerp3(a.position,b.position,t),lerp2(a.texCoord,b.texCoord,t),lerp2(a.lightmapCoord,b.lightmapCoord,t),normal,lerpColor(a.color,b.color,t),lerpColor(a.entityColor,b.entityColor,t)) end function
/// Builds `output[count]` in `mq3.renderer.portal_clip.clipSceneVertices`; returns `result`.
/// @param vertices Indexed input read at `len(vertices)-1`.
/// @param normal Value forwarded as `normal` to `mq3.renderer.portal_clip.distance`.
/// @param dist Value forwarded as `dist` to `mq3.renderer.portal_clip.distance`.
function clipSceneVertices(vertices,normal,dist)
  output=array(len(vertices)+1,void);count=0;previous=vertices[len(vertices)-1];pd=distance(previous.position,normal,dist);pi=pd>=0.0
  for each current in vertices cd=distance(current.position,normal,dist);ci=cd>=0.0;if ci then if not pi then output[count]=clippedSceneVertex(previous,current,pd,cd);count=count+1 end if;output[count]=current;count=count+1 else if pi then output[count]=clippedSceneVertex(previous,current,pd,cd);count=count+1 end if;previous=current;pd=cd;pi=ci end for
  if count==0 then return [] end if
  result=array(count,void);copyArray(result,0,output,0,count);return result
end function
/// Forwards `sceneTriangle` to `mq3.renderer.qvm_scene_geometry.Triangle` and returns its result.
/// @param source Record providing `source.entityColor`, `source.entityTexCoord`, `source.shaderTime`, `source.modelHandle`, `source.customSkin`, `source.shaderHandle`.
/// @param a Record providing `a.position`, `a.texCoord`, `a.normal`, `a.color`, `a.lightmapCoord`.
/// @param b Record providing `b.position`, `b.texCoord`, `b.normal`, `b.color`, `b.lightmapCoord`.
/// @param c Record providing `c.position`, `c.texCoord`, `c.normal`, `c.color`, `c.lightmapCoord`.
function sceneTriangle(source,a,b,c)
  return sceneGeometry.Triangle([a.position,b.position,c.position],[a.texCoord,b.texCoord,c.texCoord],[a.normal,b.normal,c.normal],[a.color,b.color,c.color],source.entityColor,source.entityTexCoord,source.shaderTime,source.modelHandle,source.customSkin,source.shaderHandle,source.shaderName,source.surfaceName,source.entityIndex,source.surfaceIndex,source.renderfx,[a.lightmapCoord,b.lightmapCoord,c.lightmapCoord],source.lightmapIndex,source.fogIndex,source.dynamicLight,source.dynamicLightOrigin,source.dynamicLightAxis,source.dynamicLightBounds,void)
end function
/// Clips scene triangles against a plane, interpolates crossing attributes, and invalidates stale vertex identities.
/// @param source Record providing `source.triangles`, `source.modelEntities`, `source.spriteEntities`, `source.polySurfaces`, `source.skippedInline`, `source.skippedUnsupported`.
/// @param normal Value forwarded as `normal` to `mq3.renderer.portal_clip.distance`.
/// @param dist Value forwarded as `dist` to `mq3.renderer.portal_clip.distance`.
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
