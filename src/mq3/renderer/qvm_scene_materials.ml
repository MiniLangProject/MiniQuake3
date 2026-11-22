// SPDX-License-Identifier: GPL-2.0-or-later
// Resolves original QVM scene shader and skin handles to decoded PK3 images.
package mq3.renderer.qvm_scene_materials

import mq3.renderer.playable_materials as materials
import mq3.renderer.qvm_scene_geometry as sceneGeometry
import mq3.game.bg_public as bg
import mq3.shared.q_shared_header as qSharedLimits
import std.ds.hashmap as maps
import mq3.renderer.player_skins as playerSkins
import mq3.renderer.shader_parser as shaderParser
import mq3.renderer.shader_remap as shaderRemap
import std.string as strings

struct LoadedSkin handle skin end struct
struct Binding shaderHandle customSkin shaderName surfaceName materialIndex end struct
struct Texture imageName image slot end struct
// Field layout intentionally matches playable_materials.Material so the
// existing multi-pass native batch path can consume QVM materials directly.
struct Material textureIndex shaderName imageName image slot stages deforms twoSided sort polygonOffset noMipMaps timeOffset clampTime noPicMip end struct
struct ResolvedTriangle triangle materialIndex end struct
struct Catalog triangles materials textures scriptIndex scriptCount loadedSkins bindings resolvedTriangles unresolvedTriangles nextTextureSlot recentBinding shaderRemaps imageCache end struct

const BUILTIN_BEAM="$mq3/beam"
const BUILTIN_PROJECTION_SHADOW="$mq3/projectionShadow"

function fail(message) return error(7680,"QVM scene materials: "+message) end function
// R_FindShader strips the extension before consulting shader text.
function strippedName(name)
  if name==void or name=="" then return "" end if
  data=bytes(name);count=0;while count<len(data) and data[count]!=46 count=count+1 end while
  return decode(slice(data,0,count))
end function
function typedName(assets,kinds,handle,kindA,kindB)
  if handle<=0 or handle>len(assets) or handle>len(kinds) then return "" end if
  if kinds[handle-1]!=kindA and kinds[handle-1]!=kindB then return "" end if
  return assets[handle-1]
end function
function cachedSkin(cache,handle)
  for each item in cache if item.handle==handle then return item.skin end if end for
  return void
end function
function loadSkin(archive,assets,kinds,cache,handle)
  found=cachedSkin(cache,handle);if found!=void then return [found,cache] end if
  path=typedName(assets,kinds,handle,"skin","skin")
  if path=="" then return [void,cache] end if
  skin=try(playerSkins.load(archive,path));if skin is error then return [void,cache] end if
  return [skin,cache+[LoadedSkin(handle,skin)]]
end function
// Skin registration in Quake resolves its mapped shaders before the first
// visible frame. Decode only skins already registered by this match; retain
// their images in the same bounded, archive-scoped cache used by bindTriangle.
// No runtime material or texture slot is allocated by this warmup.
function warmRegisteredPlayerSkins(catalog,archive,assets,kinds)
  if catalog==void or archive==void or assets==void or kinds==void or len(assets)!=len(kinds) then return fail("invalid player skin warmup input") end if
  if len(assets)==0 then return 0 end if
  warmed=0
  for handle=1 to len(assets)
    path=typedName(assets,kinds,handle,"skin","skin")
    if path=="" then continue end if
    lower=strings.toLowerAscii(path)
    if not strings.startsWith(lower,"models/players/") or not strings.endsWith(lower,".skin") then continue end if
    if cachedSkin(catalog.loadedSkins,handle)!=void then continue end if
    loaded=loadSkin(archive,assets,kinds,catalog.loadedSkins,handle)
    skin=loaded[0];catalog.loadedSkins=loaded[1]
    if skin==void then continue end if
    for each mapping in skin.mappings
      ignored=materials.runtimeStagesCached(archive,catalog.scriptIndex,strippedName(mapping.shaderName),0,32768,catalog.imageCache)
    end for
    warmed=warmed+1
  end for
  return warmed
end function
// CG_RegisterGraphics registers the server's CS_MODELS before play. Decode
// their MD3 stage images at this point, including alternate LOD surfaces.
// Texture slots and sampler settings still belong to the first actual binding.
function warmServerModelImages(catalog,archive,assets,kinds,modelAssets,configstrings)
  names=maps.HashMap.new()
  for modelIndex=1 to qSharedLimits.MAX_MODELS-1
    slot=bg.CS_MODELS+modelIndex
    if slot>=len(configstrings) then break end if
    path=configstrings[slot]
    if path==void or path=="" then break end if
    lower=strings.toLowerAscii(path)
    if strings.endsWith(lower,".md3") then names.set(lower,true) end if
  end for
  shaders=maps.HashMap.new();warmed=0
  for handle=1 to len(assets)
    if handle>len(modelAssets) then break end if
    if kinds[handle-1]!="model" then continue end if
    path=strings.toLowerAscii(assets[handle-1])
    if names.get(path)!=true then continue end if
    model=modelAssets[handle-1]
    if model==void or typeof(model)=="string" or sceneGeometry.isInlineModel(model) then continue end if
    levels=[model];if sceneGeometry.isLodModel(model) then levels=model[1] end if
    for each level in levels
      if level==void then continue end if
      for each surface in level.surfaces
        for each shader in surface.shaders
          name=strippedName(shader);key=strings.toLowerAscii(name)
          if name=="" or shaders.get(key)==true then continue end if
          shaders.set(key,true)
          ignored=materials.runtimeStagesCached(archive,catalog.scriptIndex,name,0,32768,catalog.imageCache)
          warmed=warmed+1
        end for
      end for
    end for
  end for
  return warmed
end function
function skinShader(skin,surfaceName)
  if skin==void or surfaceName=="" then return "" end if
  for each mapping in skin.mappings if stringEqualsIgnoreCaseAscii(mapping.surface,surfaceName) then return mapping.shaderName end if end for
  return ""
end function
function materialIndex(materialList,name)
  if len(materialList)==0 then return -1 end if
  for index=0 to len(materialList)-1 if stringEqualsIgnoreCaseAscii(materialList[index].shaderName,name) then return index end if end for
  return -1
end function
function addTextures(textureList,stages)
  result=textureList
  for each stage in stages
    if len(stage.images)>0 then for index=0 to len(stage.images)-1
      result=result+[Texture(stage.imageNames[index],stage.images[index],stage.slots[index])]
    end for end if
  end for
  return result
end function
function whiteImage() return materials.Image(1,1,bytes(4,255)) end function
function beamStage(image,slot)
  return materials.RuntimeStage(["$whiteimage"],[image],[slot],0.0,[],materials.BLEND_ADD,materials.ALPHA_TEST_NONE,"texture","vertex",shaderParser.blankWave(),"vertex",shaderParser.blankWave(),[255,255,255,255],false,false,false,false,256.0,[])
end function
function addBeamMaterial(output,endSlot)
  existing=materialIndex(output.materials,BUILTIN_BEAM);if existing>=0 then return existing end if
  if output.nextTextureSlot>=endSlot then return -1 end if
  image=whiteImage();slot=output.nextTextureSlot;stage=beamStage(image,slot);index=len(output.materials)
  output.materials=output.materials+[Material(index,BUILTIN_BEAM,"$whiteimage",image,slot,[stage],[],true,9.0,false,true,0.0,0.0,true)]
  output.textures=output.textures+[Texture("$whiteimage",image,slot)];output.nextTextureSlot=slot+1;return index
end function
function projectionShadowStage(image,slot)
  return materials.RuntimeStage(["$whiteimage"],[image],[slot],0.0,[],materials.BLEND_ALPHA,materials.ALPHA_TEST_NONE,"texture","vertex",shaderParser.blankWave(),"vertex",shaderParser.blankWave(),[255,255,255,255],false,false,false,false,256.0,[])
end function
function addProjectionShadowMaterial(output,endSlot)
  existing=materialIndex(output.materials,BUILTIN_PROJECTION_SHADOW);if existing>=0 then return existing end if
  if output.nextTextureSlot>=endSlot then return -1 end if
  image=whiteImage();slot=output.nextTextureSlot;stage=projectionShadowStage(image,slot);index=len(output.materials)
  output.materials=output.materials+[Material(index,BUILTIN_PROJECTION_SHADOW,"$whiteimage",image,slot,[stage],[],true,4.0,true,true,0.0,0.0,true)]
  output.textures=output.textures+[Texture("$whiteimage",image,slot)];output.nextTextureSlot=slot+1;return index
end function
function hasImage(stages)
  for each stage in stages if len(stage.images)>0 then return true end if end for
  return false
end function
function resolveShaderName(triangle,archive,assets,kinds,skinCache)
  direct=typedName(assets,kinds,triangle.shaderHandle,"shader","shaderNoMip")
  if direct!="" then return [direct,skinCache] end if
  if triangle.customSkin>0 then
    loaded=loadSkin(archive,assets,kinds,skinCache,triangle.customSkin);skinCache=loaded[1]
    mapped=skinShader(loaded[0],triangle.surfaceName);if mapped!="" then return [mapped,skinCache] end if
  end if
  return [triangle.shaderName,skinCache]
end function
function textKey(value) if value==void then return "" end if;return value end function
function sameBinding(binding,triangle)
  if binding==void then return false end if
  shader=textKey(triangle.shaderName);surface=textKey(triangle.surfaceName)
  return binding.shaderHandle==triangle.shaderHandle and binding.customSkin==triangle.customSkin and binding.shaderName==shader and binding.surfaceName==surface
end function
function cachedBinding(output,triangle)
  if sameBinding(output.recentBinding,triangle) then return output.recentBinding.materialIndex end if
  for each binding in output.bindings if sameBinding(binding,triangle) then output.recentBinding=binding;return binding.materialIndex end if end for
  return -2
end function

function bindingMatchesRegistry(output,index,triangle,assets,kinds)
  direct=typedName(assets,kinds,triangle.shaderHandle,"shader","shaderNoMip")
  if direct=="" then return true end if
  if index<0 or index>=len(output.materials) then return false end if
  return stringEqualsIgnoreCaseAscii(output.materials[index].shaderName,strippedName(direct))
end function

function storeBinding(output,triangle,index)
  for each binding in output.bindings
    if sameBinding(binding,triangle) then binding.materialIndex=index;output.recentBinding=binding;return binding end if
  end for
  binding=Binding(triangle.shaderHandle,triangle.customSkin,textKey(triangle.shaderName),textKey(triangle.surfaceName),index);output.bindings=output.bindings+[binding];output.recentBinding=binding;return binding
end function

// R_AddMD3Surfaces only submits a projection-shadow draw surface when the
// source surface resolves to SS_OPAQUE and lies outside fog. Geometry expansion
// keeps every projected triangle directly after its source triangle, allowing
// the material bridge to apply the original shader policy after skin/custom
// shader resolution without duplicating the shader registry here.
function projectionShadowEligible(output,triangle,outputIndex)
  if triangle.fogIndex>0 or outputIndex<=0 then return false end if
  source=output.triangles[outputIndex-1]
  if source==void or source.triangle.entityIndex!=triangle.entityIndex or source.triangle.surfaceIndex!=triangle.surfaceIndex then return false end if
  index=source.materialIndex
  if index<0 then return true end if
  return index<len(output.materials) and output.materials[index].sort==3.0
end function

// The mutable catalog owns these short-lived bindings. Prepared scene batches
// copy source fields into their own geometry; they never retain these wrappers.
// Reuse them instead of allocating one wrapper per triangle per view/frame.
function storeResolvedTriangle(output,outputIndex,triangle,materialIndex)
  resolved=output.triangles[outputIndex]
  if resolved==void then output.triangles[outputIndex]=ResolvedTriangle(triangle,materialIndex)
  else resolved.triangle=triangle;resolved.materialIndex=materialIndex end if
  return void
end function

function bindTriangle(output,triangle,outputIndex,archive,assets,kinds,endSlot)
  if triangle.shaderName==BUILTIN_PROJECTION_SHADOW and not projectionShadowEligible(output,triangle,outputIndex) then output.unresolvedTriangles=output.unresolvedTriangles+1;storeResolvedTriangle(output,outputIndex,triangle,-1);return void end if
  index=cachedBinding(output,triangle)
  // R_RemapShader preserves handles while changing the shader object they
  // resolve to. Reject a cached binding when that stable handle's registry
  // name changed so the replacement material is decoded on this refresh.
  if index!= -2 and not bindingMatchesRegistry(output,index,triangle,assets,kinds) then index= -2 end if
  if index== -2 then
    named=resolveShaderName(triangle,archive,assets,kinds,output.loadedSkins);shaderName=strippedName(named[0]);output.loadedSkins=named[1];index=-1
    if shaderName==BUILTIN_BEAM then index=addBeamMaterial(output,endSlot)
    else if shaderName==BUILTIN_PROJECTION_SHADOW then index=addProjectionShadowMaterial(output,endSlot)
    else if shaderName!="" then
      index=materialIndex(output.materials,shaderName)
      if index<0 then
        runtime=materials.runtimeStagesCached(archive,output.scriptIndex,shaderName,output.nextTextureSlot,endSlot,output.imageCache)
        stages=runtime[0];output.nextTextureSlot=runtime[1]
        firstName="";firstImage=void;firstSlot=-1
        for each stage in stages if firstSlot<0 and len(stage.images)>0 then firstName=stage.imageNames[0];firstImage=stage.images[0];firstSlot=stage.slots[0] end if end for
        noMip=runtime[6];noPicMip=runtime[8]
        if typedName(assets,kinds,triangle.shaderHandle,"shaderNoMip","shaderNoMip")!="" then noMip=true;noPicMip=true end if
        output.materials=output.materials+[Material(len(output.materials),shaderName,firstName,firstImage,firstSlot,stages,runtime[2],runtime[3],runtime[4],runtime[5],noMip,0.0,runtime[7],noPicMip)]
        index=len(output.materials)-1;output.textures=addTextures(output.textures,stages)
      end if
    end if
    storeBinding(output,triangle,index)
  end if
  offset=shaderRemap.timeOffsetForHandle(output.shaderRemaps,triangle.shaderHandle);if index>=0 and offset!=void then output.materials[index].timeOffset=offset end if
  if index>=0 and hasImage(output.materials[index].stages) then output.resolvedTriangles=output.resolvedTriangles+1 else output.unresolvedTriangles=output.unresolvedTriangles+1 end if
  storeResolvedTriangle(output,outputIndex,triangle,index);return void
end function

function buildIndexed(archive,triangles,assets,kinds,firstTextureSlot,maxTextureSlots,shaderRemaps,scripts)
  if archive==void or triangles==void or assets==void or kinds==void then return fail("archive, triangles and asset registry are required") end if
  if len(assets)!=len(kinds) then return fail("asset registry length mismatch") end if
  if firstTextureSlot<0 or maxTextureSlots<0 then return fail("invalid texture slot range") end if
  if scripts==void or len(scripts)!=2 or scripts[0]==void then return fail("shared shader index is required") end if
  output=Catalog(array(len(triangles),void),[],[],scripts[0],scripts[1],[],[],0,0,firstTextureSlot,void,shaderRemaps,materials.imageCache(archive));endSlot=firstTextureSlot+maxTextureSlots;triangleIndex=0
  for each triangle in triangles bindTriangle(output,triangle,triangleIndex,archive,assets,kinds,endSlot);triangleIndex=triangleIndex+1 end for
  return output
end function
function build(archive,triangles,assets,kinds,firstTextureSlot,maxTextureSlots,shaderRemaps)
  scripts=materials.buildScriptIndex(archive);if scripts is error then return scripts end if
  return buildIndexed(archive,triangles,assets,kinds,firstTextureSlot,maxTextureSlots,shaderRemaps,scripts)
end function

// Rebinds moving geometry while retaining decoded images and shader programs.
// Newly encountered registered shaders are appended within the original slot range.
function refresh(catalog,archive,triangles,assets,kinds,endTextureSlot)
  if catalog==void or archive==void or triangles==void or endTextureSlot<catalog.nextTextureSlot then return fail("invalid refresh input") end if
  if catalog.triangles==void or len(catalog.triangles)!=len(triangles) then catalog.triangles=array(len(triangles),void) end if
  catalog.resolvedTriangles=0;catalog.unresolvedTriangles=0;triangleIndex=0
  for each triangle in triangles bindTriangle(catalog,triangle,triangleIndex,archive,assets,kinds,endTextureSlot);triangleIndex=triangleIndex+1 end for
  return catalog
end function
