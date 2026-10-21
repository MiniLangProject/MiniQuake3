// SPDX-License-Identifier: GPL-2.0-or-later
// Renderer-neutral geometry expansion for refEntity_t and poly submissions
// produced by the original cgame/ui QVMs.
package mq3.renderer.qvm_scene_geometry

import mq3.renderer.scene_queue as sceneQueue
import mq3.renderer.surface_entities as surfaceEntities
import mq3.renderer.view_math as viewMath
import mq3.renderer.surface_md3 as surfaceMd3
import mq3.renderer.md3_entity as md3Entity
import mq3.renderer.surface_trails as surfaceTrails
import mq3.renderer.surface_beam as surfaceBeam
import mq3.renderer.entity_surface_policy as entityPolicy
import mq3.renderer.portal_view as portalView
import mq3.renderer.playable_light_grid as lightGrid
import mq3.renderer.bsp_render_data as bspRender
import mq3.format.md3 as md3
import mq3.compat.numeric as numeric
import std.array as arrays

const RT_MODEL=0
const RT_SPRITE=2
const RT_BEAM=3
const RT_RAIL_CORE=4
const RT_RAIL_RINGS=5
const RT_LIGHTNING=6
const RF_SHADOW_PLANE=256
const PROJECTION_SHADOW_SHADER="$mq3/projectionShadow"

struct Triangle positions texCoords normals colors entityColor entityTexCoord shaderTime modelHandle customSkin shaderHandle shaderName surfaceName entityIndex surfaceIndex renderfx lightmapCoords lightmapIndex fogIndex dynamicLight dynamicLightOrigin dynamicLightAxis dynamicLightBounds end struct
struct Geometry triangles triangleCount modelEntities spriteEntities polySurfaces skippedInline skippedUnsupported sourceVertices vertexTransforms portals culledInline end struct
struct InlineModel index renderData shaderNames bounds dynamicLightFlags end struct
struct FrameEntry modelHandle surfaceIndex frame oldFrame backlerp xyz normals end struct
struct TransformEntry modelHandle surfaceIndex frame oldFrame backlerp origin axis positions normals lightAmbient lightDirected lightDirection lightAlpha colors end struct
struct FrameCache normalTable entries maxEntries hits misses transforms transformHits transformMisses end struct

function fail(message) return error(7670,"QVM scene geometry: "+message) end function
function normal() return [0.0,0.0,1.0] end function
// RB_ProjectionShadowDeform in tr_shadows.c projects model vertices onto the
// entity's horizontal shadow plane along its sampled light direction.  The
// original clamps shallow light directions so projected shadows cannot become
// unbounded; retain that rule before dividing by the vertical component.
function projectionShadowPoint(position,shadowPlane,lightDirection)
  if position==void or len(position)!=3 or lightDirection==void or len(lightDirection)!=3 then return fail("projection shadow needs a point and light direction") end if
  light=[lightDirection[0],lightDirection[1],lightDirection[2]];d=light[2]
  if d<0.5 then light[2]=light[2]+0.5-d;d=light[2] end if
  if d==0.0 then return fail("projection shadow light is parallel to plane") end if
  h=position[2]-shadowPlane;scale=h/d
  return [position[0]-light[0]*scale,position[1]-light[1]*scale,position[2]-light[2]*scale]
end function
function triangle(positions,coords,normals,colors,entityColor,entityTexCoord,shaderTime,modelHandle,customSkin,shaderHandle,shaderName,surfaceName,entityIndex,surfaceIndex,renderfx)
  return Triangle(positions,coords,normals,colors,entityColor,entityTexCoord,shaderTime,modelHandle,customSkin,shaderHandle,shaderName,surfaceName,entityIndex,surfaceIndex,renderfx,[[0.0,0.0],[0.0,0.0],[0.0,0.0]],-1,-1,false,void,void,void)
end function
function mappedTriangle(positions,coords,lightmapCoords,normals,colors,entityColor,entityTexCoord,shaderTime,modelHandle,customSkin,shaderHandle,shaderName,surfaceName,entityIndex,surfaceIndex,renderfx,lightmapIndex,fogIndex,dynamicLight,dynamicLightOrigin,dynamicLightAxis,dynamicLightBounds)
  return Triangle(positions,coords,normals,colors,entityColor,entityTexCoord,shaderTime,modelHandle,customSkin,shaderHandle,shaderName,surfaceName,entityIndex,surfaceIndex,renderfx,lightmapCoords,lightmapIndex,fogIndex,dynamicLight,dynamicLightOrigin,dynamicLightAxis,dynamicLightBounds)
end function
function inlineShaderName(map,textureIndex)
  if textureIndex<0 or textureIndex>=map.counts[1] then return fail("inline BSP shader index outside map") end if
  offset=map.offsets[1]+textureIndex*72;length=0;while length<64 and map.data[offset+length]!=0 length=length+1 end while
  if length==0 then return "" end if;return decode(slice(map.data,offset,length))
end function
function loadInlineModel(map,index,maxTriangles)
  if map==void or typeof(map.data)!="bytes" or index<0 or index>=map.counts[7] or maxTriangles<0 then return fail("invalid inline BSP model") end if
  offset=map.offsets[7]+index*40;first=numeric.readI32(map.data,offset+24);count=numeric.readI32(map.data,offset+28)
  if first<0 or count<0 or first+count>map.counts[13] then return fail("inline BSP surface range outside map") end if
  faces=[];for face=first to first+count-1 faces=faces+[face] end for
  data=bspRender.extract(map,faces,maxTriangles);if data is error then return data end if
  names=array(map.counts[1],"");dynamicLightFlags=array(map.counts[1],false);for textureIndex=0 to map.counts[1]-1 name=inlineShaderName(map,textureIndex);if name is error then return name end if;names[textureIndex]=name;surfaceFlags=numeric.readI32(map.data,map.offsets[1]+textureIndex*72+64);dynamicLightFlags[textureIndex]=(surfaceFlags&0x20004)==0 end for
  bounds=[[numeric.bitsFloat(numeric.readU32(map.data,offset)),numeric.bitsFloat(numeric.readU32(map.data,offset+4)),numeric.bitsFloat(numeric.readU32(map.data,offset+8))],[numeric.bitsFloat(numeric.readU32(map.data,offset+12)),numeric.bitsFloat(numeric.readU32(map.data,offset+16)),numeric.bitsFloat(numeric.readU32(map.data,offset+20))]]
  // Keep inline models distinguishable from MD3 structs without changing the
  // renderer asset registry ABI.
  return [InlineModel(index,data,names,bounds,dynamicLightFlags)]
end function
function isInlineModel(model) return model!=void and typeof(model)=="array" and len(model)==1 end function
function modelAt(assetKinds,modelAssets,handle)
  if handle<=0 or handle>len(assetKinds) or assetKinds[handle-1]!="model" or handle>len(modelAssets) then return void end if
  return modelAssets[handle-1]
end function
function appendTriangle(output,value)
  if output.triangleCount>=len(output.triangles) then return fail("triangle capacity exceeded") end if
  target=output.triangles[output.triangleCount]
  if target==void then output.triangles[output.triangleCount]=value
  else
    for corner=0 to 2 target.positions[corner]=value.positions[corner];target.texCoords[corner]=value.texCoords[corner];target.normals[corner]=value.normals[corner];target.colors[corner]=value.colors[corner] end for
    target.entityColor=value.entityColor;target.entityTexCoord=value.entityTexCoord;target.shaderTime=value.shaderTime;target.modelHandle=value.modelHandle;target.customSkin=value.customSkin;target.shaderHandle=value.shaderHandle;target.shaderName=value.shaderName;target.surfaceName=value.surfaceName;target.entityIndex=value.entityIndex;target.surfaceIndex=value.surfaceIndex;target.renderfx=value.renderfx;target.lightmapCoords=value.lightmapCoords;target.lightmapIndex=value.lightmapIndex;target.fogIndex=value.fogIndex;target.dynamicLight=value.dynamicLight;target.dynamicLightOrigin=value.dynamicLightOrigin;target.dynamicLightAxis=value.dynamicLightAxis;target.dynamicLightBounds=value.dynamicLightBounds
  end if
  output.triangleCount=output.triangleCount+1;return void
end function
function appendIndexedModelTriangle(output,worldPositions,texCoords,worldNormals,vertexColors,defaultColor,entityTexCoord,shaderTime,a,b,c,modelHandle,customSkin,shaderHandle,shaderName,surfaceName,entityIndex,surfaceIndex,renderfx)
  if output.triangleCount>=len(output.triangles) then return fail("triangle capacity exceeded") end if
  target=output.triangles[output.triangleCount]
  if target==void then
    colors=[defaultColor,defaultColor,defaultColor];if vertexColors!=void then colors=[vertexColors[a],vertexColors[b],vertexColors[c]] end if
    target=triangle([worldPositions[a],worldPositions[b],worldPositions[c]],[texCoords[a],texCoords[b],texCoords[c]],[worldNormals[a],worldNormals[b],worldNormals[c]],colors,defaultColor,entityTexCoord,shaderTime,modelHandle,customSkin,shaderHandle,shaderName,surfaceName,entityIndex,surfaceIndex,renderfx);output.triangles[output.triangleCount]=target
  else
    for corner=0 to 2 index=a;if corner==1 then index=b else if corner==2 then index=c end if;target.positions[corner]=worldPositions[index];target.texCoords[corner]=texCoords[index];target.normals[corner]=worldNormals[index];target.colors[corner]=defaultColor;if vertexColors!=void then target.colors[corner]=vertexColors[index] end if end for
    target.entityColor=defaultColor;target.entityTexCoord=entityTexCoord;target.shaderTime=shaderTime;target.modelHandle=modelHandle;target.customSkin=customSkin;target.shaderHandle=shaderHandle;target.shaderName=shaderName;target.surfaceName=surfaceName;target.entityIndex=entityIndex;target.surfaceIndex=surfaceIndex;target.renderfx=renderfx;target.lightmapCoords=[[0.0,0.0],[0.0,0.0],[0.0,0.0]];target.lightmapIndex= -1;target.fogIndex= -1;target.dynamicLight=false;target.dynamicLightOrigin=void;target.dynamicLightAxis=void;target.dynamicLightBounds=void
  end if
  output.triangleCount=output.triangleCount+1;return void
end function
function modelTriangleCount(model,maxTrianglesPerSurface)
  if isInlineModel(model) then return len(model[0].renderData.triangles) end if
  count=0
  for each surface in model.surfaces amount=surface.mesh.numTriangles;if amount>maxTrianglesPerSurface then amount=maxTrianglesPerSurface end if;count=count+amount end for
  return count
end function
function expectedTriangles(entities,polys,assetKinds,modelAssets,maxTrianglesPerSurface)
  count=0
  for each value in entities
    decoded=sceneQueue.decodeEntity(value);if decoded is error then return decoded end if
    if not entityPolicy.visible(decoded.reType,decoded.renderfx,false) then continue end if
    if decoded.reType==RT_MODEL then model=modelAt(assetKinds,modelAssets,decoded.hModel);if model!=void and typeof(model)!="string" then amount=modelTriangleCount(model,maxTrianglesPerSurface);count=count+amount;if not isInlineModel(model) and (decoded.renderfx&RF_SHADOW_PLANE)!=0 then count=count+amount end if end if
    else if decoded.reType==RT_SPRITE or decoded.reType==RT_RAIL_CORE then count=count+2
    else if decoded.reType==RT_BEAM then if decoded.origin!=decoded.oldorigin then count=count+12 end if
    else if decoded.reType==RT_LIGHTNING then count=count+8
    else if decoded.reType==RT_RAIL_RINGS then rings=surfaceTrails.ringCount(decoded.oldorigin,decoded.origin,32.0);if rings is error then return rings end if;count=count+rings*2 end if
  end for
  for each poly in polys if len(poly.verts)>=3 then count=count+len(poly.verts)-2 end if end for
  return count
end function
function decodeEntities(entities)
  result=array(len(entities),void);index=0
  for each value in entities decoded=sceneQueue.decodeEntity(value);if decoded is error then return decoded end if;result[index]=decoded;index=index+1 end for
  return result
end function
function inlineCulled(decoded,model,frustum)
  if frustum==void then return false end if
  orientation=viewMath.orientation(decoded.origin,decoded.axis);result=viewMath.cullLocalBox(model[0].bounds,orientation,frustum,false);if result is error then return result end if;return result==viewMath.CULL_OUT
end function
function expectedDecodedTrianglesMode(decodedEntities,polys,assetKinds,modelAssets,maxTrianglesPerSurface,isPortal,frustum)
  count=0
  for each decoded in decodedEntities
    if not entityPolicy.visible(decoded.reType,decoded.renderfx,isPortal) then continue end if
    if decoded.reType==RT_MODEL then model=modelAt(assetKinds,modelAssets,decoded.hModel);if model!=void and typeof(model)!="string" then culled=false;if isInlineModel(model) then culled=inlineCulled(decoded,model,frustum);if culled is error then return culled end if end if;if not culled then amount=modelTriangleCount(model,maxTrianglesPerSurface);count=count+amount;if not isInlineModel(model) and (decoded.renderfx&RF_SHADOW_PLANE)!=0 then count=count+amount end if end if end if
    else if decoded.reType==RT_SPRITE or decoded.reType==RT_RAIL_CORE then count=count+2
    else if decoded.reType==RT_BEAM then if decoded.origin!=decoded.oldorigin then count=count+12 end if
    else if decoded.reType==RT_LIGHTNING then count=count+8
    else if decoded.reType==RT_RAIL_RINGS then rings=surfaceTrails.ringCount(decoded.oldorigin,decoded.origin,32.0);if rings is error then return rings end if;count=count+rings*2 end if
  end for
  for each poly in polys if len(poly.verts)>=3 then count=count+len(poly.verts)-2 end if end for
  return count
end function
function expectedDecodedTriangles(decodedEntities,polys,assetKinds,modelAssets,maxTrianglesPerSurface) return expectedDecodedTrianglesMode(decodedEntities,polys,assetKinds,modelAssets,maxTrianglesPerSurface,false,void) end function
function transformTriangle(source,orientation,color,modelHandle,customSkin,shaderHandle,surfaceName,entityIndex,lighting,renderfx)
  positions=array(3,void);normals=array(3,void)
  for corner=0 to 2
    point=viewMath.localPointToWorld(source.positions[corner],orientation);if point is error then return point end if
    direction=viewMath.localNormalToWorld(source.normals[corner],orientation);if direction is error then return direction end if
    positions[corner]=point;normals[corner]=direction
  end for
  colors=[color,color,color]
  if lighting!=void then colors=array(3,void);for corner=0 to 2 colors[corner]=lightGrid.vertexColor(lighting,normals[corner]);colors[corner][3]=color[3] end for end if
  return triangle(positions,source.texCoords,normals,colors,color,[0.0,0.0],0.0,modelHandle,customSkin,shaderHandle,source.shaderName,surfaceName,entityIndex,source.surfaceIndex,renderfx)
end function
function createNormalTable() return surfaceMd3.normalTable() end function
function createFrameCache(normalTable,maxEntries)
  if maxEntries<1 then return fail("frame cache needs positive capacity") end if
  if normalTable==void then normalTable=createNormalTable() end if
  return FrameCache(normalTable,[],maxEntries,0,0,[],0,0)
end function
function cachedFrame(cache,modelHandle,model,surfaceIndex,frame,oldFrame,backlerp,normalTable)
  if cache!=void then
    for each entry in cache.entries
      if entry.modelHandle==modelHandle and entry.surfaceIndex==surfaceIndex and entry.frame==frame and entry.oldFrame==oldFrame and entry.backlerp==backlerp then cache.hits=cache.hits+1;return entry end if
    end for
  end if
  table=normalTable;if cache!=void then table=cache.normalTable end if
  surface=model.surfaces[surfaceIndex];lerped=surfaceMd3.lerpVertexesCached(surface.mesh,frame,oldFrame,backlerp,table);if lerped is error then return lerped end if
  entry=FrameEntry(modelHandle,surfaceIndex,frame,oldFrame,backlerp,lerped[0],lerped[1])
  if cache!=void then
    if len(cache.entries)>=cache.maxEntries then cache.entries=arrays.slice(cache.entries,1,len(cache.entries)-1) end if
    cache.entries=cache.entries+[entry];cache.misses=cache.misses+1
  end if
  return entry
end function
function cachedTransform(cache,decoded,surfaceIndex,frameData)
  if cache!=void then
    for each entry in cache.transforms
      if entry.modelHandle==decoded.hModel and entry.surfaceIndex==surfaceIndex and entry.frame==decoded.frame and entry.oldFrame==decoded.oldframe and entry.backlerp==decoded.backlerp and entry.origin==decoded.origin and entry.axis==decoded.axis then cache.transformHits=cache.transformHits+1;return entry end if
    end for
  end if
  orientation=viewMath.orientation(decoded.origin,decoded.axis);count=len(frameData.xyz);worldPositions=array(count,void);worldNormals=array(count,void)
  for vertexIndex=0 to count-1
    point=viewMath.localPointToWorld(frameData.xyz[vertexIndex],orientation);if point is error then return point end if
    direction=viewMath.localNormalToWorld(frameData.normals[vertexIndex],orientation);if direction is error then return direction end if
    worldPositions[vertexIndex]=point;worldNormals[vertexIndex]=direction
  end for
  result=TransformEntry(decoded.hModel,surfaceIndex,decoded.frame,decoded.oldframe,decoded.backlerp,decoded.origin,decoded.axis,worldPositions,worldNormals,void,void,void,-1,void)
  if cache!=void then
    if len(cache.transforms)>=cache.maxEntries then cache.transforms=arrays.slice(cache.transforms,1,len(cache.transforms)-1) end if
    cache.transforms=cache.transforms+[result];cache.transformMisses=cache.transformMisses+1
  end if
  return result
end function
function cachedVertexColors(entry,lighting,alpha)
  if entry.colors!=void and entry.lightAlpha==alpha and entry.lightAmbient==lighting.ambient and entry.lightDirected==lighting.directed and entry.lightDirection==lighting.direction then return entry.colors end if
  colors=array(len(entry.normals),void)
  for vertexIndex=0 to len(entry.normals)-1 color=lightGrid.vertexColor(lighting,entry.normals[vertexIndex]);color[3]=alpha;colors[vertexIndex]=color end for
  entry.lightAmbient=lighting.ambient;entry.lightDirected=lighting.directed;entry.lightDirection=lighting.direction;entry.lightAlpha=alpha;entry.colors=colors;return colors
end function
function addModelOptimized(output,decoded,model,entityIndex,maxTrianglesPerSurface,cache,normalTable,grid,refdef)
  frames=md3Entity.normalizeFrames(model.numFrames,decoded.frame,decoded.oldframe,decoded.renderfx);if frames is error then return frames end if
  // R_AddMD3Surfaces repairs the submitted refEntity_t in place before the
  // surfaces reach the back end. Do the same before cache lookup and lighting.
  decoded.frame=frames.frame;decoded.oldframe=frames.oldFrame
  if decoded.backlerp<0.0 or decoded.backlerp>1.0 then return fail("MD3 backlerp outside zero to one") end if
  lighting=void
  if grid!=void and refdef!=void then lightOrigin=decoded.origin;if (decoded.renderfx&128)!=0 then lightOrigin=decoded.lightingOrigin end if;if (refdef.flags&1)!=0 then lighting=lightGrid.noWorldEntitySample(grid,lightOrigin) else lighting=lightGrid.entitySample(grid,lightOrigin) end if end if
  for surfaceIndex=0 to len(model.surfaces)-1
    surface=model.surfaces[surfaceIndex];limit=surface.mesh.numTriangles;if limit>maxTrianglesPerSurface then limit=maxTrianglesPerSurface end if
    if limit==0 then continue end if
    frameData=cachedFrame(cache,decoded.hModel,model,surfaceIndex,decoded.frame,decoded.oldframe,decoded.backlerp,normalTable);if frameData is error then return frameData end if
    transformed=cachedTransform(cache,decoded,surfaceIndex,frameData);if transformed is error then return transformed end if;worldPositions=transformed.positions;worldNormals=transformed.normals;vertexColors=void
    if lighting!=void then vertexColors=cachedVertexColors(transformed,lighting,decoded.shaderRGBA[3]) end if
    shadowDirection=[0.45,0.3,0.9];if lighting!=void then shadowDirection=lighting.direction end if
    output.sourceVertices=output.sourceVertices+surface.mesh.numVerts;output.vertexTransforms=output.vertexTransforms+surface.mesh.numVerts
    shaderName="";if len(surface.shaders)>0 then shaderName=surface.shaders[0] end if
    for triangleIndex=0 to limit-1
      base=triangleIndex*3;a=surface.mesh.triangles[base];b=surface.mesh.triangles[base+1];c=surface.mesh.triangles[base+2]
      stored=appendIndexedModelTriangle(output,worldPositions,surface.mesh.texCoords,worldNormals,vertexColors,decoded.shaderRGBA,decoded.shaderTexCoord,decoded.shaderTime,a,b,c,decoded.hModel,decoded.customSkin,decoded.customShader,shaderName,surface.name,entityIndex,surfaceIndex,decoded.renderfx);if stored is error then return stored end if
      if (decoded.renderfx&RF_SHADOW_PLANE)!=0 then
        shadowPositions=[]
        for each vertexIndex in [a,b,c] point=projectionShadowPoint(worldPositions[vertexIndex],decoded.shadowPlane,shadowDirection);if point is error then return point end if;shadowPositions=shadowPositions+[point] end for
        shadowColor=[0,0,0,102];stored=appendTriangle(output,triangle(shadowPositions,[[0.0,0.0],[0.0,0.0],[0.0,0.0]],[normal(),normal(),normal()],[shadowColor,shadowColor,shadowColor],shadowColor,[0.0,0.0],0.0,0,0,0,PROJECTION_SHADOW_SHADER,"",entityIndex,surfaceIndex,0));if stored is error then return stored end if
      end if
    end for
  end for
  output.modelEntities=output.modelEntities+1;return void
end function
function addInlineModel(output,decoded,wrapped,entityIndex)
  model=wrapped[0];orientation=viewMath.orientation(decoded.origin,decoded.axis)
  for each source in model.renderData.triangles
    positions=[];normals=[];coords=[];lightmapCoords=[];colors=[]
    for corner=0 to 2
      vertex=source.vertices[corner];point=viewMath.localPointToWorld(vertex.position,orientation);if point is error then return point end if
      direction=viewMath.localNormalToWorld(vertex.normal,orientation);if direction is error then return direction end if
      positions=positions+[point];normals=normals+[direction];coords=coords+[vertex.baseUV];lightmapCoords=lightmapCoords+[vertex.lightmapUV];colors=colors+[vertex.color]
    end for
    shaderName="";if source.textureIndex>=0 and source.textureIndex<len(model.shaderNames) then shaderName=model.shaderNames[source.textureIndex] end if
    dynamicLight=false;if source.textureIndex>=0 and source.textureIndex<len(model.dynamicLightFlags) then dynamicLight=model.dynamicLightFlags[source.textureIndex] end if
    stored=appendTriangle(output,mappedTriangle(positions,coords,lightmapCoords,normals,colors,decoded.shaderRGBA,decoded.shaderTexCoord,decoded.shaderTime,decoded.hModel,0,decoded.customShader,shaderName,"",entityIndex,source.faceIndex,decoded.renderfx,source.lightmapIndex,source.fogIndex,dynamicLight,decoded.origin,decoded.axis,model.bounds));if stored is error then return stored end if
  end for
  output.modelEntities=output.modelEntities+1;return void
end function
function addSprite(output,decoded,refdef,entityIndex)
  if refdef==void or refdef.viewaxis==void or len(refdef.viewaxis)!=3 then return fail("sprite needs refdef view axes") end if
  submission=surfaceEntities.surfaceSprite(decoded.origin,decoded.radius,decoded.rotation,decoded.shaderRGBA,refdef.viewaxis[1],refdef.viewaxis[2],refdef.viewaxis[0],false,0,0,65536,65536)
  if submission is error then return submission end if
  for index=0 to 1
    positions=array(3,void);coords=array(3,void);normals=array(3,void)
    for corner=0 to 2
      vertex=submission.vertices[submission.indexes[index*3+corner]];positions[corner]=vertex.xyz;coords[corner]=vertex.tex0;normals[corner]=vertex.normal
    end for
    stored=appendTriangle(output,triangle(positions,coords,normals,[decoded.shaderRGBA,decoded.shaderRGBA,decoded.shaderRGBA],decoded.shaderRGBA,decoded.shaderTexCoord,decoded.shaderTime,0,0,decoded.customShader,"","",entityIndex,0,decoded.renderfx));if stored is error then return stored end if
  end for
  output.spriteEntities=output.spriteEntities+1;return void
end function
function addTrailSubmission(output,decoded,submission,entityIndex)
  if submission is error then return submission end if
  for triangleIndex=0 to len(submission.indexes)/3-1
    positions=[];coords=[];colors=[]
    for corner=0 to 2 source=submission.vertices[submission.indexes[triangleIndex*3+corner]];positions=positions+[source.xyz];coords=coords+[source.uv];colors=colors+[source.color] end for
    stored=appendTriangle(output,triangle(positions,coords,[normal(),normal(),normal()],colors,decoded.shaderRGBA,decoded.shaderTexCoord,decoded.shaderTime,0,0,decoded.customShader,"","",entityIndex,0,decoded.renderfx));if stored is error then return stored end if
  end for
  return void
end function
function addTrail(output,decoded,refdef,entityIndex)
  if refdef==void or refdef.vieworg==void or len(refdef.vieworg)!=3 then return fail("trail needs a view origin") end if
  submission=void
  if decoded.reType==RT_RAIL_CORE then submission=surfaceTrails.railCore(decoded.oldorigin,decoded.origin,refdef.vieworg,6.0,decoded.shaderRGBA)
  else if decoded.reType==RT_RAIL_RINGS then submission=surfaceTrails.railRings(decoded.oldorigin,decoded.origin,32.0,16.0,decoded.shaderRGBA)
  else submission=surfaceTrails.lightning(decoded.origin,decoded.oldorigin,refdef.vieworg,decoded.shaderRGBA) end if
  return addTrailSubmission(output,decoded,submission,entityIndex)
end function
function addBeam(output,decoded,entityIndex)
  submission=surfaceBeam.build(decoded.origin,decoded.oldorigin);if submission is error then return submission end if
  for triangleIndex=0 to len(submission.indexes)/3-1
    positions=[];coords=[];colors=[]
    for corner=0 to 2 source=submission.vertices[submission.indexes[triangleIndex*3+corner]];positions=positions+[source.xyz];coords=coords+[source.uv];colors=colors+[source.color] end for
    stored=appendTriangle(output,triangle(positions,coords,[normal(),normal(),normal()],colors,decoded.shaderRGBA,decoded.shaderTexCoord,decoded.shaderTime,0,0,0,"$mq3/beam","",entityIndex,0,decoded.renderfx));if stored is error then return stored end if
  end for
  return void
end function
function addPolys(output,polys)
  for each poly in polys
    if len(poly.verts)>=3 then
      for index=1 to len(poly.verts)-2
        a=poly.verts[0];b=poly.verts[index];c=poly.verts[index+1]
        stored=appendTriangle(output,triangle([a.xyz,b.xyz,c.xyz],[a.st,b.st,c.st],[normal(),normal(),normal()],[a.modulate,b.modulate,c.modulate],[255,255,255,255],[0.0,0.0],0.0,0,0,poly.hShader,"","",-1,output.polySurfaces,0));if stored is error then return stored end if
      end for
    end if
    output.polySurfaces=output.polySurfaces+1
  end for
  return void
end function
function buildRecordsFrameCachedLitReuseMode(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid,previous,isPortal,frustum)
  if entities==void or polys==void or assetKinds==void or modelAssets==void or maxTrianglesPerSurface<0 then return fail("invalid build input") end if
  decodedEntities=decodeEntities(entities);if decodedEntities is error then return decodedEntities end if
  capacity=expectedDecodedTrianglesMode(decodedEntities,polys,assetKinds,modelAssets,maxTrianglesPerSurface,isPortal,frustum)
  output=void
  if previous!=void and previous.triangles!=void and len(previous.triangles)==capacity then output=previous;output.triangleCount=0;output.modelEntities=0;output.spriteEntities=0;output.polySurfaces=0;output.skippedInline=0;output.skippedUnsupported=0;output.sourceVertices=0;output.vertexTransforms=0;output.portals=[];output.culledInline=0
  else output=Geometry(array(capacity,void),0,0,0,0,0,0,0,0,[],0) end if
  entityIndex=0
  for each decoded in decodedEntities
    if entityPolicy.isPortalMarker(decoded.reType) then output.portals=output.portals+[decoded]
    else if not entityPolicy.visible(decoded.reType,decoded.renderfx,isPortal) then entityIndex=entityIndex+1;continue
    else if decoded.reType==RT_MODEL then
      model=modelAt(assetKinds,modelAssets,decoded.hModel)
      if model==void then output.skippedUnsupported=output.skippedUnsupported+1
      else if typeof(model)=="string" then output.skippedInline=output.skippedInline+1
      else if isInlineModel(model) then culled=inlineCulled(decoded,model,frustum);if culled is error then return culled end if;if culled then output.culledInline=output.culledInline+1 else added=addInlineModel(output,decoded,model,entityIndex);if added is error then return added end if end if
      else added=addModelOptimized(output,decoded,model,entityIndex,maxTrianglesPerSurface,cache,normalTable,grid,refdef);if added is error then return added end if
      end if
    else if decoded.reType==RT_SPRITE then added=addSprite(output,decoded,refdef,entityIndex);if added is error then return added end if
    else if decoded.reType==RT_BEAM then added=addBeam(output,decoded,entityIndex);if added is error then return added end if
    else if decoded.reType==RT_RAIL_CORE or decoded.reType==RT_RAIL_RINGS or decoded.reType==RT_LIGHTNING then added=addTrail(output,decoded,refdef,entityIndex);if added is error then return added end if
    else output.skippedUnsupported=output.skippedUnsupported+1
    end if
    entityIndex=entityIndex+1
  end for
  addedPolys=addPolys(output,polys);if addedPolys is error then return addedPolys end if
  return output
end function
function buildRecordsFrameCachedLitReuse(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid,previous) return buildRecordsFrameCachedLitReuseMode(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid,previous,false,void) end function
function buildPortalRecords(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid) return buildRecordsFrameCachedLitReuseMode(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid,void,true,void) end function
function refdefFrustum(refdef)
  if refdef==void then return fail("refdef is required for frustum culling") end if
  return viewMath.setupFrustum(refdef.vieworg,refdef.viewaxis,refdef.fovX,refdef.fovY)
end function
function buildRecordsWithFrameCacheReuseCulled(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,grid,previous)
  if cache==void then return fail("frame cache is required") end if;frustum=refdefFrustum(refdef);if frustum is error then return frustum end if
  return buildRecordsFrameCachedLitReuseMode(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,cache.normalTable,grid,previous,false,frustum)
end function
function buildPortalRecordsCulled(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid)
  frustum=refdefFrustum(refdef);if frustum is error then return frustum end if
  return buildRecordsFrameCachedLitReuseMode(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid,void,true,frustum)
end function
function buildRecordsFrameCachedLit(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid) return buildRecordsFrameCachedLitReuse(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid,void) end function
function buildRecordsCachedLit(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,normalTable,grid) return buildRecordsFrameCachedLit(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,void,normalTable,grid) end function
function buildRecordsWithFrameCache(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,grid)
  if cache==void then return fail("frame cache is required") end if
  return buildRecordsFrameCachedLit(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,cache.normalTable,grid)
end function
function buildRecordsWithFrameCacheReuse(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,grid,previous)
  if cache==void then return fail("frame cache is required") end if
  return buildRecordsFrameCachedLitReuse(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,cache.normalTable,grid,previous)
end function
function buildRecordsCached(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,normalTable) return buildRecordsCachedLit(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,normalTable,void) end function
function buildRecords(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface) return buildRecordsCached(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,void) end function
function build(scene,assetKinds,modelAssets,refdef,maxTrianglesPerSurface)
  if scene==void then return fail("missing scene") end if
  return buildRecords(sceneQueue.sceneEntities(scene),sceneQueue.scenePolys(scene),assetKinds,modelAssets,refdef,maxTrianglesPerSurface)
end function
function portalViewForPlane(geometry,normal,dist,refdef)
  if geometry==void or geometry.portals==void or refdef==void then return fail("portal geometry and refdef are required") end if
  return portalView.prepare(normal,dist,geometry.portals,refdef.time,refdef.vieworg,refdef.viewaxis)
end function
