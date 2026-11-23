// SPDX-License-Identifier: GPL-2.0-or-later
// Renderer-neutral geometry expansion for refEntity_t and poly submissions
// produced by the original cgame/ui QVMs.
package mq3.renderer.qvm_scene_geometry

import mq3.renderer.scene_queue as sceneQueue
import mq3.renderer.surface_entities as surfaceEntities
import mq3.renderer.view_math as viewMath
import mq3.renderer.surface_md3 as surfaceMd3
import mq3.renderer.md3_cache_index as md3CacheIndex
import mq3.renderer.native_md3 as nativeMd3
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
import std.ds.list as lists

const RT_MODEL=0
const RT_SPRITE=2
const RT_BEAM=3
const RT_RAIL_CORE=4
const RT_RAIL_RINGS=5
const RT_LIGHTNING=6
const RF_DEPTHHACK=8
const RF_NOSHADOW=64
const RF_SHADOW_PLANE=256
const PROJECTION_SHADOW_SHADER="$mq3/projectionShadow"
const MAX_SHADOW_EDGE_DEFS=32

struct Triangle positions texCoords normals colors entityColor entityTexCoord shaderTime modelHandle customSkin shaderHandle shaderName surfaceName entityIndex surfaceIndex renderfx lightmapCoords lightmapIndex fogIndex dynamicLight dynamicLightOrigin dynamicLightAxis dynamicLightBounds vertexIds end struct
struct ShadowTriangle positions entityIndex surfaceIndex end struct
struct ShadowEdge i2 facing end struct
struct Geometry triangles triangleCount modelEntities spriteEntities polySurfaces skippedInline skippedUnsupported sourceVertices vertexTransforms portals culledInline shadowTriangles shadowTriangleCount end struct
struct InlineModel index renderData shaderNames bounds dynamicLightFlags end struct
struct Md3Selection model lod frames cull end struct
struct FrameEntry modelHandle surfaceIndex frame oldFrame backlerp xyz normals packed vertexCount end struct
struct TransformEntry modelHandle surfaceIndex frame oldFrame backlerp origin axis positions normals lightAmbient lightDirected lightDirection lightAlpha colors end struct
struct FrameCache normalTable entries maxEntries hits misses transforms transformHits transformMisses entryCount entryNext transformCount transformNext packedNormalTable frameIndex transformIndex frameLookupSteps transformLookupSteps end struct

function fail(message) return error(7670,"QVM scene geometry: "+message) end function
function normal() return [0.0,0.0,1.0] end function
// RB_ProjectionShadowDeform in tr_shadows.c projects model vertices onto the
// entity's horizontal shadow plane along its sampled light direction.  The
// original clamps shallow light directions so projected shadows cannot become
// unbounded; retain that rule before dividing by the vertical component.
function projectionShadowPointOriented(position,shadowPlane,lightDirection,origin,axis)
  if position==void or len(position)!=3 or lightDirection==void or len(lightDirection)!=3 or origin==void or len(origin)!=3 or axis==void or len(axis)!=3 then return fail("projection shadow needs a point, light, origin and axes") end if
  for each direction in axis if direction==void or len(direction)!=3 then return fail("projection shadow axis needs three directions") end if end for
  // R_SetupEntityLighting stores the normalized world light in entity-local
  // coordinates. RB_ProjectionShadowDeform then describes the world-Z plane
  // in those same coordinates. Keeping those two transforms is observable for
  // rotated and RF_NON_NORMALIZED_AXES entities; projecting world positions
  // directly only matches the identity-axis case.
  ground=[axis[0][2],axis[1][2],axis[2][2]]
  light=[lightDirection[0]*axis[0][0]+lightDirection[1]*axis[0][1]+lightDirection[2]*axis[0][2],lightDirection[0]*axis[1][0]+lightDirection[1]*axis[1][1]+lightDirection[2]*axis[1][2],lightDirection[0]*axis[2][0]+lightDirection[1]*axis[2][1]+lightDirection[2]*axis[2][2]]
  d=light[0]*ground[0]+light[1]*ground[1]+light[2]*ground[2]
  if d<0.5 then amount=0.5-d;for component=0 to 2 light[component]=light[component]+amount*ground[component] end for;d=light[0]*ground[0]+light[1]*ground[1]+light[2]*ground[2] end if
  if d==0.0 then return fail("projection shadow light is parallel to plane") end if
  h=position[0]*ground[0]+position[1]*ground[1]+position[2]*ground[2]+origin[2]-shadowPlane
  local=[position[0]-light[0]*h/d,position[1]-light[1]*h/d,position[2]-light[2]*h/d]
  return [origin[0]+local[0]*axis[0][0]+local[1]*axis[1][0]+local[2]*axis[2][0],origin[1]+local[0]*axis[0][1]+local[1]*axis[1][1]+local[2]*axis[2][1],origin[2]+local[0]*axis[0][2]+local[1]*axis[1][2]+local[2]*axis[2][2]]
end function
function projectionShadowPoint(position,shadowPlane,lightDirection)
  return projectionShadowPointOriented(position,shadowPlane,lightDirection,[0.0,0.0,0.0],[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]])
end function
function localLightDirection(lightDirection,axis)
  return [lightDirection[0]*axis[0][0]+lightDirection[1]*axis[0][1]+lightDirection[2]*axis[0][2],lightDirection[0]*axis[1][0]+lightDirection[1]*axis[1][1]+lightDirection[2]*axis[1][2],lightDirection[0]*axis[2][0]+lightDirection[1]*axis[2][1]+lightDirection[2]*axis[2][2]]
end function
// R_AddEdgeDef/R_RenderShadowEdges/RB_ShadowTessEnd. Every returned item is
// the four vertices of one GL_TRIANGLE_STRIP silhouette side. The original
// 32-edge-per-start-vertex overflow rule is retained for malformed meshes.
function shadowVolumeSides(positions,indexes,numTriangles,lightDirection)
  if positions==void or indexes==void or lightDirection==void or len(lightDirection)!=3 or numTriangles<0 or numTriangles*3>len(indexes) then return fail("invalid stencil shadow mesh") end if
  edges=array(len(positions),void);if len(positions)>0 then for vertexIndex=0 to len(positions)-1 edges[vertexIndex]=lists.List.withCapacity(8) end for end if;facing=array(numTriangles,false)
  if numTriangles>0 then for triangleIndex=0 to numTriangles-1
    base=triangleIndex*3;i1=indexes[base];i2=indexes[base+1];i3=indexes[base+2]
    if i1<0 or i2<0 or i3<0 or i1>=len(positions) or i2>=len(positions) or i3>=len(positions) then return fail("stencil shadow index outside vertices") end if
    v1=positions[i1];v2=positions[i2];v3=positions[i3];d1=[v2[0]-v1[0],v2[1]-v1[1],v2[2]-v1[2]];d2=[v3[0]-v1[0],v3[1]-v1[1],v3[2]-v1[2]];normalValue=[d1[1]*d2[2]-d1[2]*d2[1],d1[2]*d2[0]-d1[0]*d2[2],d1[0]*d2[1]-d1[1]*d2[0]];front=normalValue[0]*lightDirection[0]+normalValue[1]*lightDirection[1]+normalValue[2]*lightDirection[2]>0.0;facing[triangleIndex]=front
    for each pair in [[i1,i2],[i2,i3],[i3,i1]] if edges[pair[0]].len()<MAX_SHADOW_EDGE_DEFS then edges[pair[0]].add(ShadowEdge(pair[1],front)) end if end for
  end for end if
  extruded=array(len(positions),void);if len(positions)>0 then for vertexIndex=0 to len(positions)-1 point=positions[vertexIndex];extruded[vertexIndex]=[point[0]-512.0*lightDirection[0],point[1]-512.0*lightDirection[1],point[2]-512.0*lightDirection[2]] end for end if
  result=lists.List.withCapacity(numTriangles)
  if len(positions)>0 then for i1=0 to len(positions)-1
    for each edge in edges[i1].toArray()
      if not edge.facing then continue end if
      reverseFront=0;for each reverse in edges[edge.i2].toArray() if reverse.i2==i1 and reverse.facing then reverseFront=reverseFront+1 end if end for
      if reverseFront==0 then result.add([positions[i1],extruded[i1],positions[edge.i2],extruded[edge.i2]]) end if
    end for
  end for end if
  return result.toArray()
end function
function appendShadowTriangle(output,positions,entityIndex,surfaceIndex)
  if output.shadowTriangleCount>=len(output.shadowTriangles) then return fail("stencil shadow triangle capacity exceeded") end if
  output.shadowTriangles[output.shadowTriangleCount]=ShadowTriangle(positions,entityIndex,surfaceIndex);output.shadowTriangleCount=output.shadowTriangleCount+1;return void
end function
function triangle(positions,coords,normals,colors,entityColor,entityTexCoord,shaderTime,modelHandle,customSkin,shaderHandle,shaderName,surfaceName,entityIndex,surfaceIndex,renderfx)
  return Triangle(positions,coords,normals,colors,entityColor,entityTexCoord,shaderTime,modelHandle,customSkin,shaderHandle,shaderName,surfaceName,entityIndex,surfaceIndex,renderfx,[[0.0,0.0],[0.0,0.0],[0.0,0.0]],-1,-1,false,void,void,void,void)
end function
function mappedTriangle(positions,coords,lightmapCoords,normals,colors,entityColor,entityTexCoord,shaderTime,modelHandle,customSkin,shaderHandle,shaderName,surfaceName,entityIndex,surfaceIndex,renderfx,lightmapIndex,fogIndex,dynamicLight,dynamicLightOrigin,dynamicLightAxis,dynamicLightBounds)
  return Triangle(positions,coords,normals,colors,entityColor,entityTexCoord,shaderTime,modelHandle,customSkin,shaderHandle,shaderName,surfaceName,entityIndex,surfaceIndex,renderfx,lightmapCoords,lightmapIndex,fogIndex,dynamicLight,dynamicLightOrigin,dynamicLightAxis,dynamicLightBounds,void)
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
  faces=array(count,0);if count>0 then for face=first to first+count-1 faces[face-first]=face end for end if
  data=bspRender.extract(map,faces,maxTriangles);if data is error then return data end if
  names=array(map.counts[1],"");dynamicLightFlags=array(map.counts[1],false);for textureIndex=0 to map.counts[1]-1 name=inlineShaderName(map,textureIndex);if name is error then return name end if;names[textureIndex]=name;surfaceFlags=numeric.readI32(map.data,map.offsets[1]+textureIndex*72+64);dynamicLightFlags[textureIndex]=(surfaceFlags&0x20004)==0 end for
  bounds=[[numeric.bitsFloat(numeric.readU32(map.data,offset)),numeric.bitsFloat(numeric.readU32(map.data,offset+4)),numeric.bitsFloat(numeric.readU32(map.data,offset+8))],[numeric.bitsFloat(numeric.readU32(map.data,offset+12)),numeric.bitsFloat(numeric.readU32(map.data,offset+16)),numeric.bitsFloat(numeric.readU32(map.data,offset+20))]]
  // Keep inline models distinguishable from MD3 structs without changing the
  // renderer asset registry ABI.
  return [InlineModel(index,data,names,bounds,dynamicLightFlags)]
end function
function isInlineModel(model) return model!=void and typeof(model)=="array" and len(model)==1 end function
function md3Lods(levels) return ["$mq3/md3Lods",levels] end function
function isLodModel(model) return model!=void and typeof(model)=="array" and len(model)==2 and typeof(model[0])=="string" and model[0]=="$mq3/md3Lods" end function
function primaryMd3(model) if isLodModel(model) then if len(model[1])==0 then return void end if;return model[1][0] end if;return model end function
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
    target.entityColor=value.entityColor;target.entityTexCoord=value.entityTexCoord;target.shaderTime=value.shaderTime;target.modelHandle=value.modelHandle;target.customSkin=value.customSkin;target.shaderHandle=value.shaderHandle;target.shaderName=value.shaderName;target.surfaceName=value.surfaceName;target.entityIndex=value.entityIndex;target.surfaceIndex=value.surfaceIndex;target.renderfx=value.renderfx;target.lightmapCoords=value.lightmapCoords;target.lightmapIndex=value.lightmapIndex;target.fogIndex=value.fogIndex;target.dynamicLight=value.dynamicLight;target.dynamicLightOrigin=value.dynamicLightOrigin;target.dynamicLightAxis=value.dynamicLightAxis;target.dynamicLightBounds=value.dynamicLightBounds;target.vertexIds=value.vertexIds
  end if
  output.triangleCount=output.triangleCount+1;return void
end function

// Persistent Cgame decals revisit the same triangle slots each frame. Fill
// their retained records directly instead of constructing a temporary
// Triangle plus its nested arrays only for appendTriangle to copy them.
function appendPolyTriangle(output,poly,a,b,c)
  if output.triangleCount>=len(output.triangles) then return fail("triangle capacity exceeded") end if
  slot=output.triangleCount;target=output.triangles[slot]
  if target==void then
    target=triangle([a.xyz,b.xyz,c.xyz],[a.st,b.st,c.st],[normal(),normal(),normal()],[a.modulate,b.modulate,c.modulate],[255,255,255,255],[0.0,0.0],0.0,0,0,poly.hShader,"","",-1,output.polySurfaces,0)
    output.triangles[slot]=target
  else
    wasPoly=target.modelHandle==0 and target.entityIndex==-1 and target.shaderName=="" and target.surfaceName==""
    target.positions[0]=a.xyz;target.positions[1]=b.xyz;target.positions[2]=c.xyz
    target.texCoords[0]=a.st;target.texCoords[1]=b.st;target.texCoords[2]=c.st
    target.colors[0]=a.modulate;target.colors[1]=b.modulate;target.colors[2]=c.modulate
    if not wasPoly then
      target.normals=[normal(),normal(),normal()];target.entityColor=[255,255,255,255];target.entityTexCoord=[0.0,0.0]
      target.lightmapCoords=[[0.0,0.0],[0.0,0.0],[0.0,0.0]]
    end if
    target.shaderTime=0.0;target.modelHandle=0;target.customSkin=0;target.shaderHandle=poly.hShader
    target.shaderName="";target.surfaceName="";target.entityIndex=-1;target.surfaceIndex=output.polySurfaces;target.renderfx=0
    target.lightmapIndex=-1;target.fogIndex=-1;target.dynamicLight=false;target.dynamicLightOrigin=void
    target.dynamicLightAxis=void;target.dynamicLightBounds=void;target.vertexIds=void
  end if
  output.triangleCount=slot+1;return void
end function
function appendIndexedModelTriangle(output,worldPositions,texCoords,worldNormals,vertexColors,defaultColor,entityTexCoord,shaderTime,a,b,c,modelHandle,customSkin,shaderHandle,shaderName,surfaceName,entityIndex,surfaceIndex,renderfx,fogIndex,vertexBase)
  if output.triangleCount>=len(output.triangles) then return fail("triangle capacity exceeded") end if
  target=output.triangles[output.triangleCount]
  if target==void then
    colors=[defaultColor,defaultColor,defaultColor];if vertexColors!=void then colors=[vertexColors[a],vertexColors[b],vertexColors[c]] end if
    target=triangle([worldPositions[a],worldPositions[b],worldPositions[c]],[texCoords[a],texCoords[b],texCoords[c]],[worldNormals[a],worldNormals[b],worldNormals[c]],colors,defaultColor,entityTexCoord,shaderTime,modelHandle,customSkin,shaderHandle,shaderName,surfaceName,entityIndex,surfaceIndex,renderfx);target.fogIndex=fogIndex;output.triangles[output.triangleCount]=target
  else
    for corner=0 to 2 index=a;if corner==1 then index=b else if corner==2 then index=c end if;target.positions[corner]=worldPositions[index];target.texCoords[corner]=texCoords[index];target.normals[corner]=worldNormals[index];target.colors[corner]=defaultColor;if vertexColors!=void then target.colors[corner]=vertexColors[index] end if end for
    // Dense IDs identify the previous MD3 target's own zero-UV storage.
    // Generic/inline geometry may reference BSP data, even when its UVs are
    // zero, so acquire fresh owned buffers when transitioning back to MD3.
    if target.vertexIds==void then target.lightmapCoords=[[0.0,0.0],[0.0,0.0],[0.0,0.0]] end if
    target.entityColor=defaultColor;target.entityTexCoord=entityTexCoord;target.shaderTime=shaderTime;target.modelHandle=modelHandle;target.customSkin=customSkin;target.shaderHandle=shaderHandle;target.shaderName=shaderName;target.surfaceName=surfaceName;target.entityIndex=entityIndex;target.surfaceIndex=surfaceIndex;target.renderfx=renderfx;target.lightmapIndex= -1;target.fogIndex=fogIndex;target.dynamicLight=false;target.dynamicLightOrigin=void;target.dynamicLightAxis=void;target.dynamicLightBounds=void
  end if
  // Preserve the original mesh indices across animation. Dense surface bases
  // separate entities and surfaces even when their positions happen to match.
  if target.vertexIds==void then target.vertexIds=[vertexBase+a,vertexBase+b,vertexBase+c]
  else target.vertexIds[0]=vertexBase+a;target.vertexIds[1]=vertexBase+b;target.vertexIds[2]=vertexBase+c end if
  output.triangleCount=output.triangleCount+1;return void
end function
function modelTriangleCount(model,maxTrianglesPerSurface)
  if isInlineModel(model) then return len(model[0].renderData.triangles) end if
  count=0
  for each surface in model.surfaces amount=surface.mesh.numTriangles;if amount>maxTrianglesPerSurface then amount=maxTrianglesPerSurface end if;count=count+amount end for
  return count
end function
function modelFogNum(decoded,model,fogCatalog,noWorldModel)
  frames=md3Entity.normalizeFrames(model.numFrames,decoded.frame,decoded.oldframe,decoded.renderfx);if frames is error then return frames end if
  fogs=void;if fogCatalog!=void then fogs=fogCatalog.fogs end if
  return md3Entity.computeFogNum(fogs,decoded.origin,model.frames[frames.frame],noWorldModel)
end function
function selectMd3(decoded,asset,refdef,frustum,lodScale,lodBias)
  levels=[asset];if isLodModel(asset) then levels=asset[1] end if
  if len(levels)==0 or levels[0]==void then return fail("MD3 has no base LOD") end if
  primary=levels[0];frames=md3Entity.normalizeFrames(primary.numFrames,decoded.frame,decoded.oldframe,decoded.renderfx);if frames is error then return frames end if
  lod=0
  if len(levels)>1 then
    if refdef==void then return fail("MD3 LOD needs a refdef") end if
    projection=md3Entity.lodProjection(refdef.fovY,4.0);if projection is error then return projection end if
    frame=primary.frames[frames.frame];lod=md3Entity.computeLod(len(levels),frame.mins,frame.maxs,decoded.origin,refdef.vieworg,refdef.viewaxis[0],projection,lodScale,lodBias);if lod is error then return lod end if
  end if
  model=levels[lod];if frames.frame>=model.numFrames or frames.oldFrame>=model.numFrames then return fail("selected MD3 LOD lacks animation frame") end if
  cull=md3Entity.cullModel(model.frames,frames.frame,frames.oldFrame,decoded.origin,decoded.axis,decoded.nonNormalizedAxes,frustum,false);if cull is error then return cull end if
  return Md3Selection(model,lod,frames,cull)
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
function plannedDecodedTrianglesModeFogLod(decodedEntities,polys,assetKinds,modelAssets,maxTrianglesPerSurface,isPortal,frustum,fogCatalog,noWorldModel,refdef,lodScale,lodBias,shadowMode,plans)
  count=0;entityIndex=-1
  for each decoded in decodedEntities
    entityIndex=entityIndex+1
    if not entityPolicy.visible(decoded.reType,decoded.renderfx,isPortal) then continue end if
    if decoded.reType==RT_MODEL then
      asset=modelAt(assetKinds,modelAssets,decoded.hModel)
      if asset!=void and typeof(asset)!="string" then
        model=asset;culled=false
        if isInlineModel(asset) then culled=inlineCulled(decoded,asset,frustum);if culled is error then return culled end if;if plans!=void then plans[entityIndex]=culled end if
        else selection=selectMd3(decoded,asset,refdef,frustum,lodScale,lodBias);if selection is error then return selection end if;model=selection.model;culled=selection.cull==viewMath.CULL_OUT;if plans!=void then plans[entityIndex]=selection end if end if
        if not culled then amount=modelTriangleCount(model,maxTrianglesPerSurface);count=count+amount;if not isInlineModel(asset) and shadowMode==3 and (decoded.renderfx&RF_SHADOW_PLANE)!=0 then fogNum=modelFogNum(decoded,model,fogCatalog,noWorldModel);if fogNum is error then return fogNum end if;if fogNum==0 then count=count+amount end if end if end if
      end if
    else if decoded.reType==RT_SPRITE or decoded.reType==RT_RAIL_CORE then count=count+2
    else if decoded.reType==RT_BEAM then if decoded.origin!=decoded.oldorigin then count=count+12 end if
    else if decoded.reType==RT_LIGHTNING then count=count+8
    else if decoded.reType==RT_RAIL_RINGS then rings=surfaceTrails.ringCount(decoded.oldorigin,decoded.origin,32.0);if rings is error then return rings end if;count=count+rings*2 end if
  end for
  for each poly in polys if len(poly.verts)>=3 then count=count+len(poly.verts)-2 end if end for
  return count
end function
function expectedDecodedTrianglesModeFogLod(decodedEntities,polys,assetKinds,modelAssets,maxTrianglesPerSurface,isPortal,frustum,fogCatalog,noWorldModel,refdef,lodScale,lodBias,shadowMode)
  return plannedDecodedTrianglesModeFogLod(decodedEntities,polys,assetKinds,modelAssets,maxTrianglesPerSurface,isPortal,frustum,fogCatalog,noWorldModel,refdef,lodScale,lodBias,shadowMode,void)
end function
function expectedDecodedTrianglesModeFog(decodedEntities,polys,assetKinds,modelAssets,maxTrianglesPerSurface,isPortal,frustum,fogCatalog,noWorldModel) return expectedDecodedTrianglesModeFogLod(decodedEntities,polys,assetKinds,modelAssets,maxTrianglesPerSurface,isPortal,frustum,fogCatalog,noWorldModel,void,5.0,0,0) end function
function expectedDecodedTrianglesMode(decodedEntities,polys,assetKinds,modelAssets,maxTrianglesPerSurface,isPortal,frustum) return expectedDecodedTrianglesModeFog(decodedEntities,polys,assetKinds,modelAssets,maxTrianglesPerSurface,isPortal,frustum,void,false) end function
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
  packedTable=nativeMd3.tableBytes(normalTable);if packedTable is error then return packedTable end if
  return FrameCache(normalTable,array(maxEntries,void),maxEntries,0,0,array(maxEntries,void),0,0,0,0,0,0,packedTable,md3CacheIndex.create(maxEntries),md3CacheIndex.create(maxEntries),0,0)
end function
function cachedFrame(cache,modelHandle,model,surfaceIndex,frame,oldFrame,backlerp,normalTable)
  hash=0
  if cache!=void then
    hash=md3CacheIndex.frameHash(modelHandle,surfaceIndex,frame,oldFrame,backlerp);slot=md3CacheIndex.first(cache.frameIndex,hash)
    while slot>=0
      entry=cache.entries[slot];cache.frameLookupSteps=cache.frameLookupSteps+1
      if entry!=void and entry.modelHandle==modelHandle and entry.surfaceIndex==surfaceIndex and entry.frame==frame and entry.oldFrame==oldFrame and entry.backlerp==backlerp then cache.hits=cache.hits+1;return entry end if
      slot=md3CacheIndex.next(cache.frameIndex,slot)
    end while
  end if
  table=normalTable;if cache!=void then table=cache.normalTable end if
  surface=model.surfaces[surfaceIndex];entry=void
  if cache!=void then
    packed=surfaceMd3.lerpVertexesPacked(surface.mesh,frame,oldFrame,backlerp,cache.packedNormalTable);if packed is error then return packed end if
    entry=FrameEntry(modelHandle,surfaceIndex,frame,oldFrame,backlerp,void,void,packed,surface.mesh.numVerts)
  else
    lerped=surfaceMd3.lerpVertexesCached(surface.mesh,frame,oldFrame,backlerp,table);if lerped is error then return lerped end if
    entry=FrameEntry(modelHandle,surfaceIndex,frame,oldFrame,backlerp,lerped[0],lerped[1],void,surface.mesh.numVerts)
  end if
  if cache!=void then
    md3CacheIndex.store(cache.frameIndex,cache.entryNext,hash);cache.entries[cache.entryNext]=entry;cache.entryNext=(cache.entryNext+1)%cache.maxEntries;if cache.entryCount<cache.maxEntries then cache.entryCount=cache.entryCount+1 end if;cache.misses=cache.misses+1
  end if
  return entry
end function
function materializeFrame(entry)
  if entry.xyz==void then values=nativeMd3.unpack(entry.packed,entry.vertexCount);if values is error then return values end if;entry.xyz=values[0];entry.normals=values[1] end if;return entry
end function
function cachedTransform(cache,decoded,modelCacheKey,surfaceIndex,frameData)
  hash=0
  if cache!=void then
    hash=md3CacheIndex.transformHash(modelCacheKey,surfaceIndex,decoded.frame,decoded.oldframe,decoded.backlerp,decoded.origin,decoded.axis);slot=md3CacheIndex.first(cache.transformIndex,hash)
    while slot>=0
      entry=cache.transforms[slot];cache.transformLookupSteps=cache.transformLookupSteps+1
      if entry!=void and entry.modelHandle==modelCacheKey and entry.surfaceIndex==surfaceIndex and entry.frame==decoded.frame and entry.oldFrame==decoded.oldframe and entry.backlerp==decoded.backlerp and entry.origin==decoded.origin and entry.axis==decoded.axis then cache.transformHits=cache.transformHits+1;return entry end if
      slot=md3CacheIndex.next(cache.transformIndex,slot)
    end while
  end if
  count=frameData.vertexCount;worldPositions=void;worldNormals=void
  if frameData.packed!=void then
    packed=nativeMd3.transform(frameData.packed,count,decoded.origin,decoded.axis);if packed is error then return packed end if;values=nativeMd3.unpack(packed,count);if values is error then return values end if;worldPositions=values[0];worldNormals=values[1]
  else
    orientation=viewMath.orientation(decoded.origin,decoded.axis);worldPositions=array(count,void);worldNormals=array(count,void)
    for vertexIndex=0 to count-1
      point=viewMath.localPointToWorld(frameData.xyz[vertexIndex],orientation);if point is error then return point end if
      direction=viewMath.localNormalToWorld(frameData.normals[vertexIndex],orientation);if direction is error then return direction end if
      worldPositions[vertexIndex]=point;worldNormals[vertexIndex]=direction
    end for
  end if
  keyOrigin=[decoded.origin[0],decoded.origin[1],decoded.origin[2]];keyAxis=[[decoded.axis[0][0],decoded.axis[0][1],decoded.axis[0][2]],[decoded.axis[1][0],decoded.axis[1][1],decoded.axis[1][2]],[decoded.axis[2][0],decoded.axis[2][1],decoded.axis[2][2]]]
  result=TransformEntry(modelCacheKey,surfaceIndex,decoded.frame,decoded.oldframe,decoded.backlerp,keyOrigin,keyAxis,worldPositions,worldNormals,void,void,void,-1,void)
  if cache!=void then
    md3CacheIndex.store(cache.transformIndex,cache.transformNext,hash);cache.transforms[cache.transformNext]=result;cache.transformNext=(cache.transformNext+1)%cache.maxEntries;if cache.transformCount<cache.maxEntries then cache.transformCount=cache.transformCount+1 end if;cache.transformMisses=cache.transformMisses+1
  end if
  return result
end function
function cachedVertexColors(entry,lighting,alpha)
  if entry.colors!=void and entry.lightAlpha==alpha and entry.lightAmbient==lighting.ambient and entry.lightDirected==lighting.directed and entry.lightDirection==lighting.direction then return entry.colors end if
  colors=array(len(entry.normals),void)
  // Older prepared views can still reference entry.colors. Fill a fresh
  // fixed-size buffer per vertex instead of growing arrays or mutating those
  // earlier colors when the lighting changes.
  for vertexIndex=0 to len(entry.normals)-1 color=lightGrid.vertexColorInto(lighting,entry.normals[vertexIndex],[255,255,255,255]);color[3]=alpha;colors[vertexIndex]=color end for
  entry.lightAmbient=lighting.ambient;entry.lightDirected=lighting.directed;entry.lightDirection=lighting.direction;entry.lightAlpha=alpha;entry.colors=colors;return colors
end function
function addModelOptimized(output,decoded,selection,entityIndex,maxTrianglesPerSurface,cache,normalTable,grid,refdef,shadowMode,fogCatalog,noWorldModel)
  model=selection.model;frames=selection.frames;modelCacheKey=decoded.hModel*4+selection.lod
  // R_AddMD3Surfaces repairs the submitted refEntity_t in place before the
  // surfaces reach the back end. Do the same before cache lookup and lighting.
  decoded.frame=frames.frame;decoded.oldframe=frames.oldFrame
  // RB_SurfaceMesh bypasses interpolation (including normal renormalization)
  // whenever both frames are identical, regardless of the supplied backlerp.
  if decoded.frame==decoded.oldframe then decoded.backlerp=0.0 end if
  fogNum=modelFogNum(decoded,model,fogCatalog,noWorldModel);if fogNum is error then return fogNum end if
  if decoded.backlerp<0.0 or decoded.backlerp>1.0 then return fail("MD3 backlerp outside zero to one") end if
  lighting=void
  if grid!=void and refdef!=void then lightOrigin=decoded.origin;if (decoded.renderfx&128)!=0 then lightOrigin=decoded.lightingOrigin end if;if (refdef.flags&1)!=0 then lighting=lightGrid.noWorldEntitySample(grid,lightOrigin) else lighting=lightGrid.entitySample(grid,lightOrigin) end if end if
  for surfaceIndex=0 to len(model.surfaces)-1
    surface=model.surfaces[surfaceIndex];limit=surface.mesh.numTriangles;if limit>maxTrianglesPerSurface then limit=maxTrianglesPerSurface end if
    if limit==0 then continue end if
    frameData=cachedFrame(cache,modelCacheKey,model,surfaceIndex,decoded.frame,decoded.oldframe,decoded.backlerp,normalTable);if frameData is error then return frameData end if
    if (shadowMode==3 and (decoded.renderfx&RF_SHADOW_PLANE)!=0) or (shadowMode==2 and (decoded.renderfx&(RF_NOSHADOW|RF_DEPTHHACK))==0) then materialized=materializeFrame(frameData);if materialized is error then return materialized end if end if
    transformed=cachedTransform(cache,decoded,modelCacheKey,surfaceIndex,frameData);if transformed is error then return transformed end if;worldPositions=transformed.positions;worldNormals=transformed.normals;vertexColors=void
    if lighting!=void then vertexColors=cachedVertexColors(transformed,lighting,decoded.shaderRGBA[3]) end if
    shadowDirection=[0.4285714286,0.2857142857,0.8571428571];if lighting!=void then shadowDirection=lighting.direction end if
    vertexBase=output.sourceVertices;output.sourceVertices=output.sourceVertices+surface.mesh.numVerts;output.vertexTransforms=output.vertexTransforms+surface.mesh.numVerts
    shaderName="";if len(surface.shaders)>0 then shaderIndex=decoded.skinNum%len(surface.shaders);if shaderIndex<0 then shaderIndex=0 end if;shaderName=surface.shaders[shaderIndex] end if
    for triangleIndex=0 to limit-1
      base=triangleIndex*3;a=surface.mesh.triangles[base];b=surface.mesh.triangles[base+1];c=surface.mesh.triangles[base+2]
      stored=appendIndexedModelTriangle(output,worldPositions,surface.mesh.texCoords,worldNormals,vertexColors,decoded.shaderRGBA,decoded.shaderTexCoord,decoded.shaderTime,a,b,c,decoded.hModel,decoded.customSkin,decoded.customShader,shaderName,surface.name,entityIndex,surfaceIndex,decoded.renderfx,fogNum,vertexBase);if stored is error then return stored end if
      if fogNum==0 and shadowMode==3 and (decoded.renderfx&RF_SHADOW_PLANE)!=0 then
        shadowPositions=array(3,void);shadowCorner=0
        for each vertexIndex in [a,b,c] point=projectionShadowPointOriented(frameData.xyz[vertexIndex],decoded.shadowPlane,shadowDirection,decoded.origin,decoded.axis);if point is error then return point end if;shadowPositions[shadowCorner]=point;shadowCorner=shadowCorner+1 end for
        shadowColor=[0,0,0,102];stored=appendTriangle(output,triangle(shadowPositions,[[0.0,0.0],[0.0,0.0],[0.0,0.0]],[normal(),normal(),normal()],[shadowColor,shadowColor,shadowColor],shadowColor,[0.0,0.0],0.0,0,0,0,PROJECTION_SHADOW_SHADER,"",entityIndex,surfaceIndex,0));if stored is error then return stored end if
      end if
    end for
    if fogNum==0 and shadowMode==2 and (decoded.renderfx&(RF_NOSHADOW|RF_DEPTHHACK))==0 then
      localLight=localLightDirection(shadowDirection,decoded.axis);sides=shadowVolumeSides(frameData.xyz,surface.mesh.triangles,limit,localLight);if sides is error then return sides end if;orientation=viewMath.orientation(decoded.origin,decoded.axis)
      for each side in sides
        worldSide=array(4,void);sideIndex=0;for each point in side worldPoint=viewMath.localPointToWorld(point,orientation);if worldPoint is error then return worldPoint end if;worldSide[sideIndex]=worldPoint;sideIndex=sideIndex+1 end for
        stored=appendShadowTriangle(output,[worldSide[0],worldSide[1],worldSide[2]],entityIndex,surfaceIndex);if stored is error then return stored end if
        stored=appendShadowTriangle(output,[worldSide[2],worldSide[1],worldSide[3]],entityIndex,surfaceIndex);if stored is error then return stored end if
      end for
    end if
  end for
  output.modelEntities=output.modelEntities+1;return void
end function
function addInlineModel(output,decoded,wrapped,entityIndex)
  model=wrapped[0];orientation=viewMath.orientation(decoded.origin,decoded.axis)
  for each source in model.renderData.triangles
    positions=array(3,void);normals=array(3,void);coords=array(3,void);lightmapCoords=array(3,void);colors=array(3,void)
    for corner=0 to 2
      vertex=source.vertices[corner];point=viewMath.localPointToWorld(vertex.position,orientation);if point is error then return point end if
      direction=viewMath.localNormalToWorld(vertex.normal,orientation);if direction is error then return direction end if
      positions[corner]=point;normals[corner]=direction;coords[corner]=vertex.baseUV;lightmapCoords[corner]=vertex.lightmapUV;colors[corner]=vertex.color
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
    positions=array(3,void);coords=array(3,void);colors=array(3,void)
    for corner=0 to 2 source=submission.vertices[submission.indexes[triangleIndex*3+corner]];positions[corner]=source.xyz;coords[corner]=source.uv;colors[corner]=source.color end for
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
    positions=array(3,void);coords=array(3,void);colors=array(3,void)
    for corner=0 to 2 source=submission.vertices[submission.indexes[triangleIndex*3+corner]];positions[corner]=source.xyz;coords[corner]=source.uv;colors[corner]=source.color end for
    stored=appendTriangle(output,triangle(positions,coords,[normal(),normal(),normal()],colors,decoded.shaderRGBA,decoded.shaderTexCoord,decoded.shaderTime,0,0,0,"$mq3/beam","",entityIndex,0,decoded.renderfx));if stored is error then return stored end if
  end for
  return void
end function
function addPolys(output,polys)
  for each poly in polys
    if len(poly.verts)>=3 then
      for index=1 to len(poly.verts)-2
        a=poly.verts[0];b=poly.verts[index];c=poly.verts[index+1]
        stored=appendPolyTriangle(output,poly,a,b,c);if stored is error then return stored end if
      end for
    end if
    output.polySurfaces=output.polySurfaces+1
  end for
  return void
end function
function stencilShadowCapacity(decodedEntities,assetKinds,modelAssets,maxTrianglesPerSurface,isPortal,frustum,shadowMode,fogCatalog,noWorldModel,refdef,lodScale,lodBias)
  if shadowMode!=2 then return 0 end if;count=0
  for each decoded in decodedEntities
    if decoded.reType!=RT_MODEL or not entityPolicy.visible(decoded.reType,decoded.renderfx,isPortal) or (decoded.renderfx&(RF_NOSHADOW|RF_DEPTHHACK))!=0 then continue end if
    asset=modelAt(assetKinds,modelAssets,decoded.hModel);if asset==void or typeof(asset)=="string" or isInlineModel(asset) then continue end if
    selection=selectMd3(decoded,asset,refdef,frustum,lodScale,lodBias);if selection is error then return selection end if;if selection.cull==viewMath.CULL_OUT then continue end if;model=selection.model
    fogNum=modelFogNum(decoded,model,fogCatalog,noWorldModel);if fogNum is error then return fogNum end if;if fogNum!=0 then continue end if
    count=count+modelTriangleCount(model,maxTrianglesPerSurface)*6
  end for
  return count
end function
function buildRecordsFrameCachedLitReuseModeShadowFogLod(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid,previous,isPortal,frustum,shadowMode,fogCatalog,noWorldModel,lodScale,lodBias)
  if entities==void or polys==void or assetKinds==void or modelAssets==void or maxTrianglesPerSurface<0 then return fail("invalid build input") end if
  decodedEntities=decodeEntities(entities);if decodedEntities is error then return decodedEntities end if
  plans=array(len(decodedEntities),void)
  capacity=plannedDecodedTrianglesModeFogLod(decodedEntities,polys,assetKinds,modelAssets,maxTrianglesPerSurface,isPortal,frustum,fogCatalog,noWorldModel,refdef,lodScale,lodBias,shadowMode,plans);if capacity is error then return capacity end if
  shadowCapacity=stencilShadowCapacity(decodedEntities,assetKinds,modelAssets,maxTrianglesPerSurface,isPortal,frustum,shadowMode,fogCatalog,noWorldModel,refdef,lodScale,lodBias);if shadowCapacity is error then return shadowCapacity end if
  output=void
  if previous!=void and previous.triangles!=void and len(previous.triangles)==capacity and previous.shadowTriangles!=void and len(previous.shadowTriangles)==shadowCapacity then output=previous;output.triangleCount=0;output.modelEntities=0;output.spriteEntities=0;output.polySurfaces=0;output.skippedInline=0;output.skippedUnsupported=0;output.sourceVertices=0;output.vertexTransforms=0;output.portals=[];output.culledInline=0;output.shadowTriangleCount=0
  else output=Geometry(array(capacity,void),0,0,0,0,0,0,0,0,[],0,array(shadowCapacity,void),0) end if
  entityIndex=0
  for each decoded in decodedEntities
    if entityPolicy.isPortalMarker(decoded.reType) then output.portals=output.portals+[decoded]
    else if not entityPolicy.visible(decoded.reType,decoded.renderfx,isPortal) then entityIndex=entityIndex+1;continue
    else if decoded.reType==RT_MODEL then
      asset=modelAt(assetKinds,modelAssets,decoded.hModel)
      if asset==void then output.skippedUnsupported=output.skippedUnsupported+1
      else if typeof(asset)=="string" then output.skippedInline=output.skippedInline+1
      else if isInlineModel(asset) then culled=plans[entityIndex];if culled==void then culled=inlineCulled(decoded,asset,frustum);if culled is error then return culled end if end if;if culled then output.culledInline=output.culledInline+1 else added=addInlineModel(output,decoded,asset,entityIndex);if added is error then return added end if end if
      else selection=plans[entityIndex];if selection==void then selection=selectMd3(decoded,asset,refdef,frustum,lodScale,lodBias);if selection is error then return selection end if end if;if selection.cull!=viewMath.CULL_OUT then added=addModelOptimized(output,decoded,selection,entityIndex,maxTrianglesPerSurface,cache,normalTable,grid,refdef,shadowMode,fogCatalog,noWorldModel);if added is error then return added end if end if
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
function buildRecordsFrameCachedLitReuseModeShadowFog(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid,previous,isPortal,frustum,shadowMode,fogCatalog,noWorldModel) return buildRecordsFrameCachedLitReuseModeShadowFogLod(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid,previous,isPortal,frustum,shadowMode,fogCatalog,noWorldModel,5.0,0) end function
function buildRecordsFrameCachedLitReuseModeShadow(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid,previous,isPortal,frustum,shadowMode) return buildRecordsFrameCachedLitReuseModeShadowFog(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid,previous,isPortal,frustum,shadowMode,void,false) end function
function buildRecordsFrameCachedLitReuseMode(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid,previous,isPortal,frustum) return buildRecordsFrameCachedLitReuseModeShadow(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid,previous,isPortal,frustum,0) end function
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
function buildRecordsWithFrameCacheReuseCulledShadows(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,grid,previous,shadowMode)
  if cache==void then return fail("frame cache is required") end if;frustum=refdefFrustum(refdef);if frustum is error then return frustum end if
  return buildRecordsFrameCachedLitReuseModeShadow(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,cache.normalTable,grid,previous,false,frustum,shadowMode)
end function
function buildRecordsWithFrameCacheReuseCulledShadowsFog(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,grid,previous,shadowMode,fogCatalog)
  if cache==void then return fail("frame cache is required") end if;frustum=refdefFrustum(refdef);if frustum is error then return frustum end if
  return buildRecordsFrameCachedLitReuseModeShadowFog(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,cache.normalTable,grid,previous,false,frustum,shadowMode,fogCatalog,(refdef.flags&1)!=0)
end function
function buildRecordsWithFrameCacheReuseCulledShadowsFogLod(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,grid,previous,shadowMode,fogCatalog,lodScale,lodBias)
  if cache==void then return fail("frame cache is required") end if;frustum=refdefFrustum(refdef);if frustum is error then return frustum end if
  return buildRecordsFrameCachedLitReuseModeShadowFogLod(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,cache.normalTable,grid,previous,false,frustum,shadowMode,fogCatalog,(refdef.flags&1)!=0,lodScale,lodBias)
end function
function buildPortalRecordsCulled(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid)
  frustum=refdefFrustum(refdef);if frustum is error then return frustum end if
  return buildRecordsFrameCachedLitReuseMode(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid,void,true,frustum)
end function
function buildPortalRecordsCulledShadows(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid,shadowMode)
  frustum=refdefFrustum(refdef);if frustum is error then return frustum end if
  return buildRecordsFrameCachedLitReuseModeShadow(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid,void,true,frustum,shadowMode)
end function
function buildPortalRecordsCulledShadowsFog(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid,shadowMode,fogCatalog)
  frustum=refdefFrustum(refdef);if frustum is error then return frustum end if
  return buildRecordsFrameCachedLitReuseModeShadowFog(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid,void,true,frustum,shadowMode,fogCatalog,(refdef.flags&1)!=0)
end function
function buildPortalRecordsCulledShadowsFogLod(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid,shadowMode,fogCatalog,lodScale,lodBias)
  frustum=refdefFrustum(refdef);if frustum is error then return frustum end if
  return buildRecordsFrameCachedLitReuseModeShadowFogLod(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid,void,true,frustum,shadowMode,fogCatalog,(refdef.flags&1)!=0,lodScale,lodBias)
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
