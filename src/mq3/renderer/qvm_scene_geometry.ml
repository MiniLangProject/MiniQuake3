// SPDX-License-Identifier: GPL-2.0-or-later
// Renderer-neutral geometry expansion for refEntity_t and poly submissions
// produced by the original cgame/ui QVMs.
package mq3.renderer.qvm_scene_geometry

import mq3.renderer.scene_queue as sceneQueue
import mq3.renderer.surface_entities as surfaceEntities
import mq3.renderer.view_math as viewMath
import mq3.format.md3 as md3

const RT_MODEL=0
const RT_SPRITE=2

struct Triangle positions texCoords normals colors modelHandle customSkin shaderHandle shaderName surfaceName entityIndex surfaceIndex end struct
struct Geometry triangles modelEntities spriteEntities polySurfaces skippedInline skippedUnsupported end struct

function fail(message) return error(7670,"QVM scene geometry: "+message) end function
function normal() return [0.0,0.0,1.0] end function
function triangle(positions,coords,normals,colors,modelHandle,customSkin,shaderHandle,shaderName,surfaceName,entityIndex,surfaceIndex)
  return Triangle(positions,coords,normals,colors,modelHandle,customSkin,shaderHandle,shaderName,surfaceName,entityIndex,surfaceIndex)
end function
function modelAt(assetKinds,modelAssets,handle)
  if handle<=0 or handle>len(assetKinds) or assetKinds[handle-1]!="model" or handle>len(modelAssets) then return void end if
  return modelAssets[handle-1]
end function
function transformTriangle(source,orientation,color,modelHandle,customSkin,shaderHandle,surfaceName,entityIndex)
  positions=[];normals=[]
  for corner=0 to 2
    point=viewMath.localPointToWorld(source.positions[corner],orientation);if point is error then return point end if
    direction=viewMath.localNormalToWorld(source.normals[corner],orientation);if direction is error then return direction end if
    positions=positions+[point];normals=normals+[direction]
  end for
  return triangle(positions,source.texCoords,normals,[color,color,color],modelHandle,customSkin,shaderHandle,source.shaderName,surfaceName,entityIndex,source.surfaceIndex)
end function
function addModel(output,decoded,model,entityIndex,maxTrianglesPerSurface)
  if decoded.frame<0 or decoded.frame>=model.numFrames or decoded.oldframe<0 or decoded.oldframe>=model.numFrames then return fail("MD3 frame outside model") end if
  if decoded.backlerp<0.0 or decoded.backlerp>1.0 then return fail("MD3 backlerp outside zero to one") end if
  orientation=viewMath.orientation(decoded.origin,decoded.axis)
  for surfaceIndex=0 to len(model.surfaces)-1
    source=md3.renderTriangles(model,surfaceIndex,decoded.frame,decoded.oldframe,decoded.backlerp,maxTrianglesPerSurface);if source is error then return source end if
    for each value in source
      converted=transformTriangle(value,orientation,decoded.shaderRGBA,decoded.hModel,decoded.customSkin,decoded.customShader,model.surfaces[surfaceIndex].name,entityIndex);if converted is error then return converted end if
      output.triangles=output.triangles+[converted]
    end for
  end for
  output.modelEntities=output.modelEntities+1;return void
end function
function addSprite(output,decoded,refdef,entityIndex)
  if refdef==void or refdef.viewaxis==void or len(refdef.viewaxis)!=3 then return fail("sprite needs refdef view axes") end if
  submission=surfaceEntities.surfaceSprite(decoded.origin,decoded.radius,decoded.rotation,decoded.shaderRGBA,refdef.viewaxis[1],refdef.viewaxis[2],refdef.viewaxis[0],false,0,0,65536,65536)
  if submission is error then return submission end if
  for index=0 to 1
    positions=[];coords=[];normals=[]
    for corner=0 to 2
      vertex=submission.vertices[submission.indexes[index*3+corner]];positions=positions+[vertex.xyz];coords=coords+[vertex.tex0];normals=normals+[vertex.normal]
    end for
    output.triangles=output.triangles+[triangle(positions,coords,normals,[decoded.shaderRGBA,decoded.shaderRGBA,decoded.shaderRGBA],0,0,decoded.customShader,"","",entityIndex,0)]
  end for
  output.spriteEntities=output.spriteEntities+1;return void
end function
function addPolys(output,polys)
  for each poly in polys
    if len(poly.verts)>=3 then
      for index=1 to len(poly.verts)-2
        a=poly.verts[0];b=poly.verts[index];c=poly.verts[index+1]
        output.triangles=output.triangles+[triangle([a.xyz,b.xyz,c.xyz],[a.st,b.st,c.st],[normal(),normal(),normal()],[a.modulate,b.modulate,c.modulate],0,0,poly.hShader,"","",-1,output.polySurfaces)]
      end for
    end if
    output.polySurfaces=output.polySurfaces+1
  end for
  return void
end function
function buildRecords(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface)
  if entities==void or polys==void or assetKinds==void or modelAssets==void or maxTrianglesPerSurface<0 then return fail("invalid build input") end if
  output=Geometry([],0,0,0,0,0);entityIndex=0
  for each value in entities
    decoded=sceneQueue.decodeEntity(value);if decoded is error then return decoded end if
    if decoded.reType==RT_MODEL then
      model=modelAt(assetKinds,modelAssets,decoded.hModel)
      if model==void then output.skippedUnsupported=output.skippedUnsupported+1
      else if typeof(model)=="string" then output.skippedInline=output.skippedInline+1
      else added=addModel(output,decoded,model,entityIndex,maxTrianglesPerSurface);if added is error then return added end if
      end if
    else if decoded.reType==RT_SPRITE then added=addSprite(output,decoded,refdef,entityIndex);if added is error then return added end if
    else output.skippedUnsupported=output.skippedUnsupported+1
    end if
    entityIndex=entityIndex+1
  end for
  addedPolys=addPolys(output,polys);if addedPolys is error then return addedPolys end if
  return output
end function
function build(scene,assetKinds,modelAssets,refdef,maxTrianglesPerSurface)
  if scene==void then return fail("missing scene") end if
  return buildRecords(sceneQueue.sceneEntities(scene),sceneQueue.scenePolys(scene),assetKinds,modelAssets,refdef,maxTrianglesPerSurface)
end function
