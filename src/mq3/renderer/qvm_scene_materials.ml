// SPDX-License-Identifier: GPL-2.0-or-later
// Resolves original QVM scene shader and skin handles to decoded PK3 images.
package mq3.renderer.qvm_scene_materials

import mq3.renderer.playable_materials as materials
import mq3.renderer.player_skins as playerSkins

struct LoadedSkin handle skin end struct
struct Binding shaderHandle customSkin shaderName surfaceName materialIndex end struct
struct Texture imageName image slot end struct
// Field layout intentionally matches playable_materials.Material so the
// existing multi-pass native batch path can consume QVM materials directly.
struct Material textureIndex shaderName imageName image slot stages deforms twoSided sort polygonOffset noMipMaps end struct
struct ResolvedTriangle triangle materialIndex end struct
struct Catalog triangles materials textures scriptIndex scriptCount loadedSkins bindings resolvedTriangles unresolvedTriangles nextTextureSlot recentBinding end struct

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
      duplicate=false
      for each texture in result if texture.slot==stage.slots[index] then duplicate=true;break end if end for
      if not duplicate then result=result+[Texture(stage.imageNames[index],stage.images[index],stage.slots[index])] end if
    end for end if
  end for
  return result
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

function bindTriangle(output,triangle,outputIndex,archive,assets,kinds,endSlot)
  index=cachedBinding(output,triangle)
  // R_RemapShader preserves handles while changing the shader object they
  // resolve to. Reject a cached binding when that stable handle's registry
  // name changed so the replacement material is decoded on this refresh.
  if index!= -2 and not bindingMatchesRegistry(output,index,triangle,assets,kinds) then index= -2 end if
  if index== -2 then
    named=resolveShaderName(triangle,archive,assets,kinds,output.loadedSkins);shaderName=strippedName(named[0]);output.loadedSkins=named[1];index=-1
    if shaderName!="" then
      index=materialIndex(output.materials,shaderName)
      if index<0 then
        runtime=materials.runtimeStages(archive,output.scriptIndex,shaderName,output.nextTextureSlot,endSlot)
        stages=runtime[0];output.nextTextureSlot=runtime[1]
        firstName="";firstImage=void;firstSlot=-1
        for each stage in stages if firstSlot<0 and len(stage.images)>0 then firstName=stage.imageNames[0];firstImage=stage.images[0];firstSlot=stage.slots[0] end if end for
        output.materials=output.materials+[Material(len(output.materials),shaderName,firstName,firstImage,firstSlot,stages,runtime[2],runtime[3],runtime[4],runtime[5],runtime[6])]
        index=len(output.materials)-1;output.textures=addTextures(output.textures,stages)
      end if
    end if
    storeBinding(output,triangle,index)
  end if
  if index>=0 and hasImage(output.materials[index].stages) then output.resolvedTriangles=output.resolvedTriangles+1 else output.unresolvedTriangles=output.unresolvedTriangles+1 end if
  output.triangles[outputIndex]=ResolvedTriangle(triangle,index);return void
end function

function build(archive,triangles,assets,kinds,firstTextureSlot,maxTextureSlots)
  if archive==void or triangles==void or assets==void or kinds==void then return fail("archive, triangles and asset registry are required") end if
  if len(assets)!=len(kinds) then return fail("asset registry length mismatch") end if
  if firstTextureSlot<0 or maxTextureSlots<0 then return fail("invalid texture slot range") end if
  scripts=materials.buildScriptIndex(archive);if scripts is error then return scripts end if
  output=Catalog(array(len(triangles),void),[],[],scripts[0],scripts[1],[],[],0,0,firstTextureSlot,void);endSlot=firstTextureSlot+maxTextureSlots;triangleIndex=0
  for each triangle in triangles bindTriangle(output,triangle,triangleIndex,archive,assets,kinds,endSlot);triangleIndex=triangleIndex+1 end for
  return output
end function

// Rebinds moving geometry while retaining decoded images and shader programs.
// Newly encountered registered shaders are appended within the original slot range.
function refresh(catalog,archive,triangles,assets,kinds,endTextureSlot)
  if catalog==void or archive==void or triangles==void or endTextureSlot<catalog.nextTextureSlot then return fail("invalid refresh input") end if
  catalog.triangles=array(len(triangles),void);catalog.resolvedTriangles=0;catalog.unresolvedTriangles=0;triangleIndex=0
  for each triangle in triangles bindTriangle(catalog,triangle,triangleIndex,archive,assets,kinds,endTextureSlot);triangleIndex=triangleIndex+1 end for
  return catalog
end function
