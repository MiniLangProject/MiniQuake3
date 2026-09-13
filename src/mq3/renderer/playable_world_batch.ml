// SPDX-License-Identifier: GPL-2.0-or-later
// Retained world-space commands for native projection and rasterization.
package mq3.renderer.playable_world_batch
import mq3.platform.playable_window as window
import mq3.platform.playable_multitexture as multitexture
import mq3.client.playable_viewer as viewer
import mq3.renderer.playable_materials as materials
import mq3.compat.transcendental as trans

struct Batch commands sourceTriangles drawableTriangles skippedSky end struct
struct UvAffine m00 m01 m10 m11 tx ty end struct
struct StagePass commands sourceUvs sourcePositions sourceNormals sourceLights sourceColors stage deforms primary depthEqual sort polygonOffset end struct
struct MaterialBatch base passes sourceTriangles drawableTriangles emittedTriangles skippedSky animatedPasses uvModifiedPasses blendedPasses generatorPasses alphaTestPasses turbulentPasses stretchPasses environmentPasses filterPasses destinationAlphaPasses clampedPasses deformedPasses polygonOffsetPasses end struct

function fail(text) return error(7490,"playable world batch: "+text) end function
function vertexLight(vertex) return (vertex.color[0]+vertex.color[1]+vertex.color[2])/(255.0*3.0) end function
function worldPoint(position) return viewer.ScreenPoint(position[0],position[1],position[2]) end function
function isSky(triangle,flags) return triangle.textureIndex>=0 and triangle.textureIndex<len(flags) and flags[triangle.textureIndex] end function
function resolvedLightmapSlot(triangle) slot=triangle.lightmapIndex;if slot<0 or slot>=64 then return -1 end if;return slot end function
function appendResolved(commands,triangle,baseSlot,useLightmap)
  va=triangle.vertices[0];vb=triangle.vertices[1];vc=triangle.vertices[2];lightmapSlot=-1;if useLightmap then lightmapSlot=resolvedLightmapSlot(triangle) end if
  colorA=va.color;colorB=vb.color;colorC=vc.color;if lightmapSlot>=0 then colorA=[255,255,255,255];colorB=colorA;colorC=colorA end if
  if baseSlot>=0 then return window.appendTriangleBatchColored(commands,baseSlot,lightmapSlot,worldPoint(va.position),va.baseUV,va.lightmapUV,1.0,colorA,worldPoint(vb.position),vb.baseUV,vb.lightmapUV,1.0,colorB,worldPoint(vc.position),vc.baseUV,vc.lightmapUV,1.0,colorC,255,255,255) end if
  return window.appendSingleTextureTriangleColored(commands,lightmapSlot,worldPoint(va.position),va.lightmapUV,1.0,colorA,worldPoint(vb.position),vb.lightmapUV,1.0,colorB,worldPoint(vc.position),vc.lightmapUV,1.0,colorC,255,255,255)
end function

// Compatibility builder: byte layout and single submission remain unchanged.
function build(renderData,materialSlots,skyTextureFlags)
  if renderData==void or renderData.triangles==void or materialSlots==void or skyTextureFlags==void then return fail("missing render data or material tables") end if
  capacity=len(renderData.triangles);if capacity<1 then capacity=1 end if
  commands=window.createTriangleBatch(capacity);if commands is error then return commands end if;skippedSky=0
  for each triangle in renderData.triangles
    if isSky(triangle,skyTextureFlags) then skippedSky=skippedSky+1;continue end if
    baseSlot=-1;if triangle.textureIndex>=0 and triangle.textureIndex<len(materialSlots) then baseSlot=materialSlots[triangle.textureIndex] end if
    commands=appendResolved(commands,triangle,baseSlot,true);if commands is error then return commands end if
  end for
  return Batch(commands,len(renderData.triangles),commands.count,skippedSky)
end function
function draw(batch,projection) if batch==void or batch.commands==void then return fail("missing batch") end if;return window.submitWorldTriangleBatch(batch.commands,projection) end function

function materialFor(catalog,textureIndex) if catalog==void then return void end if;for each material in catalog.materials if material.textureIndex==textureIndex then return material end if end for;return void end function
function dynamicStage(stage) return stage.bspLightmap or stage.clampTexture or not stage.depthWrite or stage.depthEqual or len(stage.slots)>1 or len(stage.uvMods)>0 or stage.blend!=materials.BLEND_OPAQUE or stage.alphaTest!=materials.ALPHA_TEST_NONE or stage.tcGen=="environment" or (stage.rgbGen!="identity" and stage.rgbGen!="identitylighting") or stage.alphaGen!="identity" end function
function dynamicMaterialStage(material,stage) return material.polygonOffset or len(material.deforms)>0 or dynamicStage(stage) end function
function materialUsesBspLightmap(material) for each stage in material.stages if stage.bspLightmap then return true end if end for;return false end function
function contains(values,wanted) for each value in values if value==wanted then return true end if end for;return false end function
function sortedMaterials(values)
  result=[]
  for each material in values
    inserted=false;next=[]
    for each current in result
      if not inserted and (material.sort<current.sort or (material.sort==current.sort and material.textureIndex<current.textureIndex)) then next=next+[material];inserted=true end if
      next=next+[current]
    end for
    if not inserted then next=next+[material] end if;result=next
  end for
  return result
end function
function uploadMaterials(catalog)
  if catalog==void or catalog.materials==void then return fail("missing material catalog") end if
  uploaded=[]
  for each material in catalog.materials
    for each stage in material.stages
      if len(stage.slots)>0 then
      for index=0 to len(stage.slots)-1
        slot=stage.slots[index]
        if not contains(uploaded,slot) then
          image=stage.images[index]
          if image==void or not window.uploadTexture(slot,image.pixels,image.width,image.height) then return fail("could not upload material stage") end if
          uploaded=uploaded+[slot]
        end if
      end for
      end if
    end for
  end for
  return len(uploaded)
end function
function releaseMaterials(catalog)
  if catalog==void or catalog.materials==void then return 0 end if
  released=[]
  for each material in catalog.materials
    for each stage in material.stages
      for each slot in stage.slots
        if not contains(released,slot) then window.releaseTexture(slot);released=released+[slot] end if
      end for
    end for
  end for
  return len(released)
end function
function countStageTriangles(renderData,textureIndex,flags) count=0;for each triangle in renderData.triangles if triangle.textureIndex==textureIndex and not isSky(triangle,flags) then count=count+1 end if end for;return count end function
function buildStagePass(renderData,material,stage,primary,depthEqual,flags)
  count=countStageTriangles(renderData,material.textureIndex,flags);if count<1 then return void end if
  commands=window.createTriangleBatch(count);sourceUvs=[];sourcePositions=[];sourceNormals=[];sourceLights=[];sourceColors=[]
  for each triangle in renderData.triangles
    if triangle.textureIndex==material.textureIndex and not isSky(triangle,flags) then
      if stage.bspLightmap then
        va=triangle.vertices[0];vb=triangle.vertices[1];vc=triangle.vertices[2]
        commands=window.appendSingleTextureTriangle(commands,resolvedLightmapSlot(triangle),worldPoint(va.position),va.lightmapUV,vertexLight(va),worldPoint(vb.position),vb.lightmapUV,vertexLight(vb),worldPoint(vc.position),vc.lightmapUV,vertexLight(vc),va.color[0],va.color[1],va.color[2])
        sourceUvs=sourceUvs+[[va.lightmapUV,vb.lightmapUV,vc.lightmapUV]]
      else
        commands=appendResolved(commands,triangle,stage.slots[0],primary)
        sourceUvs=sourceUvs+[[triangle.vertices[0].baseUV,triangle.vertices[1].baseUV,triangle.vertices[2].baseUV]]
      end if
      if commands is error then return commands end if
      sourcePositions=sourcePositions+[[triangle.vertices[0].position,triangle.vertices[1].position,triangle.vertices[2].position]]
      sourceNormals=sourceNormals+[[triangle.vertices[0].normal,triangle.vertices[1].normal,triangle.vertices[2].normal]]
      sourceLights=sourceLights+[[vertexLight(triangle.vertices[0]),vertexLight(triangle.vertices[1]),vertexLight(triangle.vertices[2])]]
      sourceColors=sourceColors+[[triangle.vertices[0].color,triangle.vertices[1].color,triangle.vertices[2].color]]
    end if
  end for
  return StagePass(commands,sourceUvs,sourcePositions,sourceNormals,sourceLights,sourceColors,stage,material.deforms,primary,depthEqual,material.sort,material.polygonOffset)
end function

// Static opaque primaries stay in the bit-identical base stream. Dynamic and
// supported blended stages become retained passes with their source UVs.
function buildMaterials(renderData,catalog,skyTextureFlags)
  if renderData==void or renderData.triangles==void or catalog==void or catalog.materials==void or skyTextureFlags==void then return fail("missing material batch inputs") end if
  capacity=len(renderData.triangles);if capacity<1 then capacity=1 end if
  base=window.createTriangleBatch(capacity);if base is error then return base end if;skippedSky=0;drawable=0
  for each triangle in renderData.triangles
    if isSky(triangle,skyTextureFlags) then skippedSky=skippedSky+1;continue end if
    drawable=drawable+1;material=materialFor(catalog,triangle.textureIndex)
    if material==void or len(material.stages)==0 then base=appendResolved(base,triangle,-1,true)
    else if not dynamicMaterialStage(material,material.stages[0]) then base=appendResolved(base,triangle,material.stages[0].slots[0],not materialUsesBspLightmap(material)) end if
    if base is error then return base end if
  end for
  passes=[];animated=0;modified=0;blended=0;generated=0;alphaTested=0;turbulentCount=0;stretchCount=0;environmentCount=0;filterCount=0;destinationAlphaCount=0;clampedCount=0;deformedCount=0;polygonOffsetCount=0;emitted=base.count
  for each material in sortedMaterials(catalog.materials)
    primaryWrites=false;if len(material.stages)>0 then primaryWrites=material.stages[0].depthWrite end if
    for stageIndex=0 to len(material.stages)-1
      stage=material.stages[stageIndex];if not dynamicMaterialStage(material,stage) then continue end if
      pass=buildStagePass(renderData,material,stage,stageIndex==0 and not materialUsesBspLightmap(material),stage.depthEqual or (stageIndex>0 and primaryWrites),skyTextureFlags);if pass is error then return pass end if
      if pass!=void then
        passes=passes+[pass];emitted=emitted+pass.commands.count
        if len(stage.slots)>1 then animated=animated+1 end if;if len(stage.uvMods)>0 then modified=modified+1 end if;if stage.blend!=materials.BLEND_OPAQUE then blended=blended+1 end if
        if stage.rgbGen=="wave" then generated=generated+1 end if
        if stage.alphaTest!=materials.ALPHA_TEST_NONE then alphaTested=alphaTested+1 end if
        if stage.tcGen=="environment" then environmentCount=environmentCount+1 end if
        if stage.blend==materials.BLEND_FILTER then filterCount=filterCount+1 end if
        if stage.blend==materials.BLEND_DST_COLOR_ONE_MINUS_DST_ALPHA then destinationAlphaCount=destinationAlphaCount+1 end if
        if stage.clampTexture then clampedCount=clampedCount+1 end if
        if len(material.deforms)>0 then deformedCount=deformedCount+1 end if
        if material.polygonOffset then polygonOffsetCount=polygonOffsetCount+1 end if
        for each mod in stage.uvMods if mod.kind=="turb" then turbulentCount=turbulentCount+1;break end if end for
        for each mod in stage.uvMods if mod.kind=="stretch" then stretchCount=stretchCount+1;break end if end for
      end if
    end for
  end for
  return MaterialBatch(base,passes,len(renderData.triangles),drawable,emitted,skippedSky,animated,modified,blended,generated,alphaTested,turbulentCount,stretchCount,environmentCount,filterCount,destinationAlphaCount,clampedCount,deformedCount,polygonOffsetCount)
end function

function identityAffine() return UvAffine(1.0,0.0,0.0,1.0,0.0,0.0) end function
function affineFor(stage,nowMilliseconds)
  result=identityAffine();seconds=nowMilliseconds*0.001
  for each mod in stage.uvMods
    if mod.kind=="scroll" then
      s=mod.a*seconds;s=s-materials.floorNumber(s);t=mod.b*seconds;t=t-materials.floorNumber(t);result.tx=result.tx+s;result.ty=result.ty+t
    else if mod.kind=="scale" then result=UvAffine(result.m00*mod.a,result.m01*mod.a,result.m10*mod.b,result.m11*mod.b,result.tx*mod.a,result.ty*mod.b)
    else if mod.kind=="rotate" then
      radians=0.0-mod.a*seconds*3.14159265358979323846/180.0;sine=trans.sin(radians);cosine=trans.cos(radians)
      m00=cosine*result.m00-sine*result.m10;m01=cosine*result.m01-sine*result.m11;m10=sine*result.m00+cosine*result.m10;m11=sine*result.m01+cosine*result.m11
      tx=cosine*(result.tx-0.5)-sine*(result.ty-0.5)+0.5;ty=sine*(result.tx-0.5)+cosine*(result.ty-0.5)+0.5;result=UvAffine(m00,m01,m10,m11,tx,ty)
    else if mod.kind=="stretch" then p=1.0/materials.waveSample(mod.wave,nowMilliseconds);offset=0.5-0.5*p;result=UvAffine(result.m00*p,result.m01*p,result.m10*p,result.m11*p,result.tx*p+offset,result.ty*p+offset)
    end if
  end for
  return result
end function
function applyAffine(transform,uv) return [uv[0]*transform.m00+uv[1]*transform.m01+transform.tx,uv[0]*transform.m10+uv[1]*transform.m11+transform.ty] end function
function hasTurbulence(stage) for each mod in stage.uvMods if mod.kind=="turb" then return true end if end for;return false end function
function deformedPosition(position,normal,deforms,nowMilliseconds)
  result=[position[0],position[1],position[2]]
  for each deform in deforms
    if deform.kind=="wave" then
      phaseOffset=0.0;if deform.wave.frequency!=0.0 then phaseOffset=(result[0]+result[1]+result[2])*deform.spread end if;scale=materials.waveSampleOffset(deform.wave,nowMilliseconds,phaseOffset)
      result=[result[0]+normal[0]*scale,result[1]+normal[1]*scale,result[2]+normal[2]*scale]
    end if
  end for
  return result
end function
function updatePassView(pass,viewOrigin,nowMilliseconds)
  slot=materials.slotAt(pass.stage,nowMilliseconds);transform=affineFor(pass.stage,nowMilliseconds);turbulent=hasTurbulence(pass.stage)
  for triangleIndex=0 to pass.commands.count-1
    offset=triangleIndex*window.TRIANGLE_BATCH_RECORD_BYTES;if not pass.stage.bspLightmap then window.writeBatchI32(pass.commands.data,offset,slot) end if
    for vertex=0 to 2
      position=deformedPosition(pass.sourcePositions[triangleIndex][vertex],pass.sourceNormals[triangleIndex][vertex],pass.deforms,nowMilliseconds);positionOffset=offset+20+vertex*32;window.writeBatchF32(pass.commands.data,positionOffset,position[0]);window.writeBatchF32(pass.commands.data,positionOffset+4,position[1]);window.writeBatchF32(pass.commands.data,positionOffset+8,position[2])
      sourceUv=pass.sourceUvs[triangleIndex][vertex];if pass.stage.tcGen=="environment" then sourceUv=materials.environmentUV(position,pass.sourceNormals[triangleIndex][vertex],viewOrigin) end if
      uv=[0.0,0.0];if turbulent then uv=materials.transformUVAt(pass.stage,sourceUv,position,nowMilliseconds) else uv=applyAffine(transform,sourceUv) end if;uvOffset=offset+32+vertex*32;window.writeBatchF32(pass.commands.data,uvOffset,uv[0]);window.writeBatchF32(pass.commands.data,uvOffset+4,uv[1])
      window.writeBatchF32(pass.commands.data,offset+48+vertex*32,1.0);window.writeBatchColor(pass.commands.data,offset+116+vertex*4,materials.stageColor(pass.stage,pass.sourceColors[triangleIndex][vertex],nowMilliseconds))
    end for
  end for
  return slot
end function
function updatePass(pass,nowMilliseconds) return updatePassView(pass,[0.0,0.0,0.0],nowMilliseconds) end function
function drawMaterials(batch,projection,nowMilliseconds)
  if batch==void or batch.base==void or batch.passes==void or nowMilliseconds<0 then return fail("invalid material draw") end if
  drawn=0;multitexture.setState(multitexture.BLEND_OPAQUE,false,true);multitexture.setAlphaTest(multitexture.ALPHA_TEST_NONE);multitexture.setTextureClamp(false);multitexture.setPolygonOffset(false)
  if batch.base.count>0 then value=window.submitWorldTriangleBatch(batch.base,projection);if value is error then return value end if;drawn=drawn+value end if
  for each pass in batch.passes
    updatePassView(pass,projection.position,nowMilliseconds);multitexture.setState(pass.stage.blend,pass.depthEqual,pass.stage.depthWrite);multitexture.setAlphaTest(pass.stage.alphaTest);multitexture.setTextureClamp(pass.stage.clampTexture);multitexture.setPolygonOffset(pass.polygonOffset)
    value=window.submitWorldTriangleBatch(pass.commands,projection);if value is error then return value end if;drawn=drawn+value
  end for
  multitexture.setState(multitexture.BLEND_OPAQUE,false,true);multitexture.setAlphaTest(multitexture.ALPHA_TEST_NONE);multitexture.setTextureClamp(false);multitexture.setPolygonOffset(false);return drawn
end function
