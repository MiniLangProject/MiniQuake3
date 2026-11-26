// SPDX-License-Identifier: GPL-2.0-or-later
// Bounded Baseq3 material resolver for the interactive software-rendered slice.
package mq3.renderer.playable_materials
import mq3.compat.numeric as n
import mq3.format.pk3 as pk3
import mq3.renderer.tga as tga
import mq3.renderer.shader_index as shaderIndex
import mq3.renderer.shader_parser as shaderParser
import mq3.shared.parser as tokenParser
import mq3.platform.playable_jpeg as jpeg
import mq3.platform.playable_window as window
import mq3.compat.transcendental as trans
import std.ds.list as lists
import std.string as strings
import std.string_builder as stringBuilder
import std.ds.hashmap as maps

const SHADER_STRIDE=72
const SHADER_NAME_BYTES=64
const BASE_TEXTURE_FIRST_SLOT=64
const BASE_TEXTURE_SLOT_COUNT=256
const MAX_RUNTIME_STAGES=8
const MAX_ANIMATION_FRAMES=8
const MAX_CACHED_IMAGES=2048
const BLEND_OPAQUE=0
const BLEND_ALPHA=1
const BLEND_ADD=2
const BLEND_FILTER=3
const BLEND_DST_COLOR_ONE_MINUS_DST_ALPHA=4
const BLEND_MARK=6
const BLEND_PREMULTIPLIED_ALPHA=7
const BLEND_GL_STATE=256
const ALPHA_TEST_NONE=0
const ALPHA_TEST_GT0=1
const ALPHA_TEST_LT128=2
const ALPHA_TEST_GE128=3

/// Data record for `mq3.renderer.playable_materials.Image`; groups `width`, `height`, `pixels`.
struct Image width height pixels end struct
/// Data record for `mq3.renderer.playable_materials.UvMod`; groups `kind`, `a`, `b`, `c`, `d`, `e`, and 2 further fields.
struct UvMod kind a b c d e f wave end struct
/// Data record for `mq3.renderer.playable_materials.RuntimeStage`; groups `imageNames`, `images`, `slots`, `animationSpeed`, `uvMods`, `blend`, and 13 further fields.
struct RuntimeStage imageNames images slots animationSpeed uvMods blend alphaTest tcGen rgbGen rgbWave alphaGen alphaWave constantColor bspLightmap clampTexture depthWrite depthEqual portalRange tcGenVectors end struct
/// Data record for `mq3.renderer.playable_materials.Material`; groups `textureIndex`, `shaderName`, `imageName`, `image`, `slot`, `stages`, and 8 further fields.
struct Material textureIndex shaderName imageName image slot stages deforms twoSided sort polygonOffset noMipMaps timeOffset clampTime noPicMip end struct
/// Data record for `mq3.renderer.playable_materials.Catalog`; groups `materials`, `scripts`, `attempted`, `loaded`, `textureCount`, `animatedStageCount`, and 1 further field.
struct Catalog materials scripts attempted loaded textureCount animatedStageCount effectStageCount end struct
/// Data record for `mq3.renderer.playable_materials.ImageCache`; groups `archive`, `images`, `count`, `hits`, `misses`.
struct ImageCache archive images count hits misses end struct

/// Constructs `mq3.renderer.playable_materials.ImageCache` with `images` = `maps.HashMap.withCapacity(512)`, `count` = `0`, `hits` = `0`, `misses` = `0` and the supplied remaining values.
/// @param archive Initial value for `mq3.renderer.playable_materials.ImageCache.archive`.
function imageCache(archive) return ImageCache(archive,maps.HashMap.withCapacity(512),0,0,0) end function
/// Updates `cache.count` in `mq3.renderer.playable_materials.cacheImage`.
/// @param cache Mutable record or buffer; this call updates `cache.count`.
/// @param name Argument 1 supplied to `std.string.toLowerAscii`.
/// @param image Argument 2 supplied to `cache.images.set`.
function cacheImage(cache,name,image)
  if cache==void or name==void or image==void or cache.count>=MAX_CACHED_IMAGES then return void end if
  key=strings.toLowerAscii(name)
  if cache.images.get(key)==void then cache.images.set(key,image);cache.count=cache.count+1 end if
  return void
end function
/// Adds every loaded material-stage image to the shared image cache under its recorded image name.
/// @param cache Value forwarded as `cache` to `mq3.renderer.playable_materials.cacheImage`.
/// @param catalog Record providing `catalog.materials`.
function seedImageCacheFromCatalog(cache,catalog)
  if cache==void or catalog==void then return void end if
  for each material in catalog.materials
    for each stage in material.stages
      index=0
      while index<len(stage.images)
        cacheImage(cache,stage.imageNames[index],stage.images[index]);index=index+1
      end while
    end for
  end for
  return void
end function

/// Creates error `7486` with message `"preview materials: "+message`.
/// @param message Input used in the result expression `error(7486,"preview materials: "+message)`.
function fail(message) return error(7486,"preview materials: "+message) end function
/// Computes `map!=void and typeof(map.data)=="bytes" and len(map.offsets)>1 and len(map.counts)>1` for `mq3.renderer.playable_materials.validMap`.
/// @param map Record providing `map.data`, `map.offsets`, `map.counts`.
function validMap(map) return map!=void and typeof(map.data)=="bytes" and len(map.offsets)>1 and len(map.counts)>1 end function

/// Computes `shaderName` from `decode(slice(map.data,offset,length))` using `mq3.renderer.playable_materials.validMap`.
/// @param map Record providing `map.counts`, `map.offsets`, `map.data`.
/// @param index Input tested by `index<0 or index>=map.counts[1]`.
function shaderName(map,index)
  if not validMap(map) then return fail("invalid BSP") end if
  if index<0 or index>=map.counts[1] then return fail("shader index outside BSP") end if
  offset=map.offsets[1]+index*SHADER_STRIDE
  if offset<0 or offset+SHADER_STRIDE>len(map.data) then return fail("truncated BSP shader") end if
  length=0;while length<SHADER_NAME_BYTES and map.data[offset+length]!=0 length=length+1 end while
  return decode(slice(map.data,offset,length))
end function
/// Computes `shaderSurfaceFlags` from `n.readI32(map.data,offset+68)` using `mq3.renderer.playable_materials.validMap`, `mq3.compat.numeric.readI32`.
/// @param map Record providing `map.counts`, `map.offsets`, `map.data`.
/// @param index Input tested by `not validMap(map) or index<0 or index>=map.counts[1]`.
function shaderSurfaceFlags(map,index)
  if not validMap(map) or index<0 or index>=map.counts[1] then return fail("shader index outside BSP") end if
  offset=map.offsets[1]+index*SHADER_STRIDE;if offset<0 or offset+SHADER_STRIDE>len(map.data) then return fail("truncated BSP shader") end if
  return n.readI32(map.data,offset+68)
end function

/// Calls `std.string.endsWith` with `(strings.toLowerAscii(value),strings.toLowerAscii(suffix))` and returns its result.
/// @param value Argument 1 supplied to `std.string.toLowerAscii`.
/// @param suffix Argument 1 supplied to `std.string.toLowerAscii`.
function endsIgnoreCase(value,suffix)
  return strings.endsWith(strings.toLowerAscii(value),strings.toLowerAscii(suffix))
end function

/// Computes `candidates` from `[name+".tga",name+".jpg",name+".jpeg"]` using `mq3.renderer.playable_materials.endsIgnoreCase`.
/// @param name Value forwarded as `value` to `mq3.renderer.playable_materials.endsIgnoreCase`.
function candidates(name)
  if name==void or name=="" then return [] end if
  if endsIgnoreCase(name,".tga") then stem=decode(slice(bytes(name),0,len(bytes(name))-4));return [name,stem+".jpg",stem+".jpeg"] end if
  if endsIgnoreCase(name,".jpg") then stem=decode(slice(bytes(name),0,len(bytes(name))-4));return [name,stem+".tga",stem+".jpeg"] end if
  if endsIgnoreCase(name,".jpeg") then stem=decode(slice(bytes(name),0,len(bytes(name))-5));return [name,stem+".tga",stem+".jpg"] end if
  return [name+".tga",name+".jpg",name+".jpeg"]
end function

/// Computes `buildScriptIndex` from `[index,count]` using `std.string_builder.StringBuilder.withCapacity`, `mq3.renderer.playable_materials.endsIgnoreCase`, `mq3.format.pk3.readEntry`.
/// @param archive Record providing `archive.entries`.
function buildScriptIndex(archive)
  if archive==void or archive.entries==void then return fail("invalid PK3 archive") end if
  // Retail shader sources total hundreds of KiB.  Repeated immutable string
  // concatenation copied the complete prefix for every script.
  textBuilder=stringBuilder.StringBuilder.withCapacity(65536);count=0
  for each entry in archive.entries
    if endsIgnoreCase(entry.name,".shader") then
      source=try(pk3.readEntry(archive,entry))
      if not (source is error) then textBuilder.appendString(decode(source));textBuilder.appendString("\n");count=count+1 end if
    end if
  end for
  text=textBuilder.toString()
  index=shaderIndex.build(text);if index is error then return index end if
  return [index,count]
end function

// Select the first actual image of a shader stage. This intentionally ignores
// blend animation and tcMod for the first playable slice, but understands both
// map/clampMap and the first frame of animMap without requiring a full shader parse.
/// @param index Record providing `index.text`.
/// @param name Argument 2 supplied to `mq3.renderer.shader_index.find`.
function mappedImageName(index,name)
  if index==void then return void end if
  entry=shaderIndex.find(index,name);if entry==void then return void end if
  state=tokenParser.create(index.text);state.offset=entry.bodyOffset
  if tokenParser.parseExt(state,true)!="{" then return void end if
  depth=1
  while depth>0
    token=tokenParser.parseExt(state,true);if token=="" then return void end if
    if token=="{" then depth=depth+1
    else if token=="}" then depth=depth-1
    else if depth==2 then
      command=strings.toLowerAscii(token)
      image=void
      if command=="map" or command=="clampmap" then image=tokenParser.parseExt(state,false)
      else if command=="animmap" then
        speed=tokenParser.parseExt(state,false);if speed!="" then image=tokenParser.parseExt(state,false) end if
      end if
      if image!=void and image!="" then
        lower=strings.toLowerAscii(image)
        if lower!="$lightmap" and lower!="$whiteimage" then return image end if
      end if
    end if
  end while
  return void
end function

/// Computes `decodeAsset` from `fail("unsupported image extension")` using `mq3.renderer.playable_materials.endsIgnoreCase`, `mq3.renderer.tga.decode`, `mq3.renderer.playable_materials.Image`.
/// @param name Value forwarded as `value` to `mq3.renderer.playable_materials.endsIgnoreCase`.
/// @param data Argument 1 supplied to `mq3.renderer.tga.decode`.
function decodeAsset(name,data)
  if endsIgnoreCase(name,".tga") then
    result=tga.decode(data);if result is error then return result end if
    return Image(result.width,result.height,result.pixels)
  end if
  if endsIgnoreCase(name,".jpg") or endsIgnoreCase(name,".jpeg") then
    result=jpeg.decode(data);if result is error then return result end if
    return Image(result.width,result.height,result.pixels)
  end if
  return fail("unsupported image extension")
end function

/// Updates `cache.hits`, `cache.misses` in `mq3.renderer.playable_materials.loadImageCached`.
/// @param archive Argument 1 supplied to `mq3.format.pk3.findEntry`.
/// @param name Value forwarded as `name` to `mq3.renderer.playable_materials.candidates`.
/// @param cache Mutable record or buffer; this call updates `cache.hits`, `cache.misses`.
function loadImageCached(archive,name,cache)
  for each candidate in candidates(name)
    entry=pk3.findEntry(archive,candidate)
    if entry==void then continue end if
    if cache!=void and cache.archive==archive then
      cached=cache.images.get(strings.toLowerAscii(candidate))
      if cached!=void then cache.hits=cache.hits+1;return [candidate,cached] end if
    end if
    data=try(pk3.readEntry(archive,entry))
    if not (data is error) then
      image=try(decodeAsset(candidate,data))
      if not (image is error) then
        if cache!=void and cache.archive==archive then cache.misses=cache.misses+1;cacheImage(cache,candidate,image) end if
        return [candidate,image]
      end if
    end if
  end for
  return void
end function
/// Calls `mq3.renderer.playable_materials.loadImageCached` with `(archive,name,void)` and returns its result.
/// @param archive Value forwarded as `archive` to `mq3.renderer.playable_materials.loadImageCached`.
/// @param name Value forwarded as `name` to `mq3.renderer.playable_materials.loadImageCached`.
function loadImage(archive,name) return loadImageCached(archive,name,void) end function

/// Returns `false` from `mq3.renderer.playable_materials.containsIndex`; earlier branches return `true`.
/// @param materials Sequence traversed as `material` while producing this result.
/// @param index Input used by `for each material in materials if material.textureIndex==index then return true`.
function containsIndex(materials,index)
  for each material in materials if material.textureIndex==index then return true end if end for
  return false
end function

/// Maps shader source/destination blend factors to the preview renderer's blend-mode constants.
/// @param stage Record providing `stage.blendSrc`, `stage.blendDst`.
function stageBlend(stage)
  if stage.blendSrc==shaderParser.GLS_SRCBLEND_ONE and stage.blendDst==shaderParser.GLS_DSTBLEND_ONE then return BLEND_ADD end if
  if stage.blendSrc==shaderParser.GLS_SRCBLEND_SRC_ALPHA and stage.blendDst==shaderParser.GLS_DSTBLEND_ONE_MINUS_SRC_ALPHA then return BLEND_ALPHA end if
  if stage.blendSrc==shaderParser.GLS_SRCBLEND_DST_COLOR and stage.blendDst==shaderParser.GLS_DSTBLEND_ZERO then return BLEND_FILTER end if
  if stage.blendSrc==shaderParser.GLS_SRCBLEND_ZERO and stage.blendDst==shaderParser.GLS_DSTBLEND_SRC_COLOR then return BLEND_FILTER end if
  if stage.blendSrc==shaderParser.GLS_SRCBLEND_DST_COLOR and stage.blendDst==shaderParser.GLS_DSTBLEND_ONE_MINUS_DST_ALPHA then return BLEND_DST_COLOR_ONE_MINUS_DST_ALPHA end if
  if stage.blendSrc==shaderParser.GLS_SRCBLEND_ZERO and stage.blendDst==shaderParser.GLS_DSTBLEND_ONE_MINUS_SRC_COLOR then return BLEND_MARK end if
  if stage.blendSrc==shaderParser.GLS_SRCBLEND_ONE and stage.blendDst==shaderParser.GLS_DSTBLEND_ONE_MINUS_SRC_ALPHA then return BLEND_PREMULTIPLIED_ALPHA end if
  // Do not silently turn valid retail blendFunc combinations opaque.  The
  // software rasterizer accepts the original GLS_* bit encoding for every
  // remaining Baseq3 source/destination factor pair.
  if stage.blendSrc!=0 and stage.blendDst!=0 then return BLEND_GL_STATE|stage.blendSrc|stage.blendDst end if
  return BLEND_OPAQUE
end function
/// Returns `stage.tcGen` from `mq3.renderer.playable_materials.stageTcGen`; earlier branches return `"texture"`.
/// @param stage Record providing `stage.tcGen`.
function stageTcGen(stage) if stage.tcGen=="bad" then return "texture" end if;return stage.tcGen end function
// RE_UploadCinematic configures scratch images with GL_CLAMP too.
/// @param stage Record providing `stage.mapMode`.
function stageClamp(stage) return stage.mapMode=="clamp" or stage.mapMode=="video" end function

/// Maps parsed shader alpha-test flags to the native greater-than-zero or 128-threshold tests.
/// @param stage Record providing `stage.alphaFunc`.
function stageAlphaTest(stage)
  if stage.alphaFunc==shaderParser.GLS_ATEST_GT_0 then return ALPHA_TEST_GT0 end if
  if stage.alphaFunc==shaderParser.GLS_ATEST_LT_80 then return ALPHA_TEST_LT128 end if
  if stage.alphaFunc==shaderParser.GLS_ATEST_GE_80 then return ALPHA_TEST_GE128 end if
  return ALPHA_TEST_NONE
end function

/// Converts parsed scroll/scale/rotate/turbulence/stretch/transform/entity-translation modifiers into runtime UV modifiers.
/// @param stage Record providing `stage.texMods`.
function stageMods(stage)
  result=[]
  for each mod in stage.texMods
    if mod.kind=="scroll" and len(mod.values)>=2 then result=result+[UvMod("scroll",mod.values[0],mod.values[1],0.0,0.0,0.0,0.0,shaderParser.blankWave())]
    else if mod.kind=="scale" and len(mod.values)>=2 then result=result+[UvMod("scale",mod.values[0],mod.values[1],0.0,0.0,0.0,0.0,shaderParser.blankWave())]
    else if mod.kind=="rotate" and len(mod.values)>=1 then result=result+[UvMod("rotate",mod.values[0],0.0,0.0,0.0,0.0,0.0,shaderParser.blankWave())]
    else if mod.kind=="turb" and len(mod.values)>=4 then result=result+[UvMod("turb",mod.values[0],mod.values[1],mod.values[2],mod.values[3],0.0,0.0,shaderParser.blankWave())]
    else if mod.kind=="stretch" then result=result+[UvMod("stretch",0.0,0.0,0.0,0.0,0.0,0.0,mod.wave)]
    else if mod.kind=="transform" and len(mod.values)>=6 then result=result+[UvMod("transform",mod.values[0],mod.values[1],mod.values[2],mod.values[3],mod.values[4],mod.values[5],shaderParser.blankWave())]
    else if mod.kind=="entitytranslate" then result=result+[UvMod("entitytranslate",0.0,0.0,0.0,0.0,0.0,0.0,shaderParser.blankWave())]
    end if
  end for
  return result
end function

/// Returns `not stringEqualsIgnoreCaseAscii(stage.images[0],"$lightmap")` from `mq3.renderer.playable_materials.usableStage`; earlier branches return `false`.
/// @param stage Record providing `stage.isLightmap`, `stage.images`.
function usableStage(stage)
  if stage==void or stage.isLightmap or len(stage.images)==0 then return false end if
  return not stringEqualsIgnoreCaseAscii(stage.images[0],"$lightmap")
end function

/// Loads bounded animation images or a video placeholder into a runtime stage and returns the next free texture slot.
/// @param archive Value forwarded as `archive` to `mq3.renderer.playable_materials.loadImageCached`.
/// @param stage Record providing `stage.mapMode`, `stage.images`, `stage.rgbGen`, `stage.rgbWave`, `stage.alphaGen`, `stage.alphaWave`.
/// @param nextSlot Input tested by `nextSlot>=endSlot or len(stage.images)==0`.
/// @param endSlot Input tested by `nextSlot>=endSlot or len(stage.images)==0`.
/// @param cache Value forwarded as `cache` to `mq3.renderer.playable_materials.loadImageCached`.
function loadRuntimeStageCached(archive,stage,nextSlot,endSlot,cache)
  if stage.mapMode=="video" then
    if nextSlot>=endSlot or len(stage.images)==0 then return void end if
    // The real renderer installs tr.scratchImage[videoMapHandle] here.  Keep a
    // harmless seed texture until qvm_video_materials binds that stable slot.
    seed=Image(1,1,bytes([0,0,0,255]))
    return [RuntimeStage(["$video:"+stage.images[0]],[seed],[nextSlot],0.0,stageMods(stage),stageBlend(stage),stageAlphaTest(stage),stageTcGen(stage),stage.rgbGen,stage.rgbWave,stage.alphaGen,stage.alphaWave,stage.constantColor,false,true,stage.depthWrite,stage.depthFunc==shaderParser.GLS_DEPTHFUNC_EQUAL,stage.portalRange,stage.tcGenVectors),nextSlot+1]
  end if
  names=[];images=[];slots=[];limit=len(stage.images);if limit>MAX_ANIMATION_FRAMES then limit=MAX_ANIMATION_FRAMES end if
  for index=0 to limit-1
    if nextSlot>=endSlot then break end if
    imageName=stage.images[index];loaded=void
    if stringEqualsIgnoreCaseAscii(imageName,"$whiteimage") then loaded=["$whiteimage",Image(8,8,bytes(8*8*4,255))]
    else loaded=loadImageCached(archive,imageName,cache) end if
    if loaded!=void then names=names+[loaded[0]];images=images+[loaded[1]];slots=slots+[nextSlot];nextSlot=nextSlot+1 end if
  end for
  if len(images)==0 then return void end if
  return [RuntimeStage(names,images,slots,stage.animationSpeed,stageMods(stage),stageBlend(stage),stageAlphaTest(stage),stageTcGen(stage),stage.rgbGen,stage.rgbWave,stage.alphaGen,stage.alphaWave,stage.constantColor,false,stageClamp(stage),stage.depthWrite,stage.depthFunc==shaderParser.GLS_DEPTHFUNC_EQUAL,stage.portalRange,stage.tcGenVectors),nextSlot]
end function
/// Calls `mq3.renderer.playable_materials.loadRuntimeStageCached` with `(archive,stage,nextSlot,endSlot,void)` and returns its result.
/// @param archive Value forwarded as `archive` to `mq3.renderer.playable_materials.loadRuntimeStageCached`.
/// @param stage Value forwarded as `stage` to `mq3.renderer.playable_materials.loadRuntimeStageCached`.
/// @param nextSlot Value forwarded as `nextSlot` to `mq3.renderer.playable_materials.loadRuntimeStageCached`.
/// @param endSlot Value forwarded as `endSlot` to `mq3.renderer.playable_materials.loadRuntimeStageCached`.
function loadRuntimeStage(archive,stage,nextSlot,endSlot) return loadRuntimeStageCached(archive,stage,nextSlot,endSlot,void) end function

/// Returns `decode(slice(data,7,len(data)-7))` from `mq3.renderer.playable_materials.videoName`; earlier branches return `""`.
/// @param stage Record providing `stage.imageNames`.
function videoName(stage)
  if stage==void or len(stage.imageNames)==0 then return "" end if
  name=stage.imageNames[0];if not strings.startsWith(name,"$video:") then return "" end if
  data=bytes(name);return decode(slice(data,7,len(data)-7))
end function
/// Computes `videoName(stage)!=""` for `mq3.renderer.playable_materials.isVideoStage`.
/// @param stage Value forwarded as `stage` to `mq3.renderer.playable_materials.videoName`.
function isVideoStage(stage) return videoName(stage)!="" end function

/// Constructs `mq3.renderer.playable_materials.RuntimeStage` with `imageNames` = `[]`, `images` = `[]`, `slots` = `[]`, `animationSpeed` = `0.0` and the supplied remaining values.
/// @param stage Record providing `stage.rgbGen`, `stage.rgbWave`, `stage.alphaGen`, `stage.alphaWave`, `stage.constantColor`, `stage.depthWrite`.
function lightmapRuntimeStage(stage)
  return RuntimeStage([],[],[],0.0,stageMods(stage),stageBlend(stage),stageAlphaTest(stage),"lightmap",stage.rgbGen,stage.rgbWave,stage.alphaGen,stage.alphaWave,stage.constantColor,true,false,stage.depthWrite,stage.depthFunc==shaderParser.GLS_DEPTHFUNC_EQUAL,stage.portalRange,stage.tcGenVectors)
end function

/// Loads one cached image into an opaque runtime stage when a texture slot remains available.
/// @param archive Value forwarded as `archive` to `mq3.renderer.playable_materials.loadImageCached`.
/// @param name Value forwarded as `name` to `mq3.renderer.playable_materials.loadImageCached`.
/// @param nextSlot Input tested by `nextSlot>=endSlot`.
/// @param endSlot Input tested by `nextSlot>=endSlot`.
/// @param cache Value forwarded as `cache` to `mq3.renderer.playable_materials.loadImageCached`.
function directRuntimeStageCached(archive,name,nextSlot,endSlot,cache)
  if nextSlot>=endSlot then return void end if
  loaded=loadImageCached(archive,name,cache);if loaded==void then return void end if
  return [RuntimeStage([loaded[0]],[loaded[1]],[nextSlot],0.0,[],BLEND_OPAQUE,ALPHA_TEST_NONE,"texture","identitylighting",shaderParser.blankWave(),"identity",shaderParser.blankWave(),[255,255,255,255],false,false,true,false,256.0,[]),nextSlot+1]
end function
/// Calls `mq3.renderer.playable_materials.directRuntimeStageCached` with `(archive,name,nextSlot,endSlot,void)` and returns its result.
/// @param archive Value forwarded as `archive` to `mq3.renderer.playable_materials.directRuntimeStageCached`.
/// @param name Value forwarded as `name` to `mq3.renderer.playable_materials.directRuntimeStageCached`.
/// @param nextSlot Value forwarded as `nextSlot` to `mq3.renderer.playable_materials.directRuntimeStageCached`.
/// @param endSlot Value forwarded as `endSlot` to `mq3.renderer.playable_materials.directRuntimeStageCached`.
function directRuntimeStage(archive,name,nextSlot,endSlot) return directRuntimeStageCached(archive,name,nextSlot,endSlot,void) end function

/// Computes `resolvedShaderSort` from `3.0` using `and`.
/// @param shader Record providing `shader.sort`, `shader.polygonOffset`, `shader.stages`.
function resolvedShaderSort(shader)
  if shader==void then return 3.0 end if
  if shader.sort!=0.0 then return shader.sort end if
  if shader.polygonOffset then return 4.0 end if
  if len(shader.stages)>0 and (shader.stages[0].blendSrc!=0 or shader.stages[0].blendDst!=0) then if shader.stages[0].depthWrite then return 5.0 else return 9.0 end if end if
  return 3.0
end function

/// Computes `runtimeStagesCached` from `[result,nextSlot,deforms,twoSided,sort,polygonOffset,noMipMaps,clampTime,noPicMip]` using `mq3.renderer.shader_parser.parseIndexed`, `not`, `mq3.renderer.playable_materials.resolvedShaderSort`.
/// @param archive Value forwarded as `archive` to `mq3.renderer.playable_materials.loadRuntimeStageCached`.
/// @param index Argument 1 supplied to `mq3.renderer.shader_parser.parseIndexed`.
/// @param name Argument 2 supplied to `mq3.renderer.shader_parser.parseIndexed`.
/// @param nextSlot Value forwarded as `nextSlot` to `mq3.renderer.playable_materials.loadRuntimeStageCached`.
/// @param endSlot Value forwarded as `endSlot` to `mq3.renderer.playable_materials.loadRuntimeStageCached`.
/// @param cache Value forwarded as `cache` to `mq3.renderer.playable_materials.loadRuntimeStageCached`.
function runtimeStagesCached(archive,index,name,nextSlot,endSlot,cache)
  result=[];deforms=[];twoSided=false;sort=3.0;polygonOffset=false;noMipMaps=false;clampTime=0.0;noPicMip=false;parsed=try(shaderParser.parseIndexed(index,name))
  if not (parsed is error) and parsed!=void then
    deforms=parsed.deforms;twoSided=parsed.cull=="twoSided";sort=resolvedShaderSort(parsed);polygonOffset=parsed.polygonOffset;noMipMaps=parsed.noMipMaps;clampTime=parsed.clampTime;noPicMip=parsed.noPicMip
    for each parsedStage in parsed.stages
      if parsedStage.isLightmap and len(result)<MAX_RUNTIME_STAGES then result=result+[lightmapRuntimeStage(parsedStage)]
      else if usableStage(parsedStage) and len(result)<MAX_RUNTIME_STAGES then
        loaded=loadRuntimeStageCached(archive,parsedStage,nextSlot,endSlot,cache)
        if loaded!=void then
          result=result+[loaded[0]];nextSlot=loaded[1]
        end if
      end if
    end for
  end if
  if len(result)==0 then
    mapped=mappedImageName(index,name);if mapped==void then mapped=name end if
    loaded=directRuntimeStageCached(archive,mapped,nextSlot,endSlot,cache)
    if loaded==void and mapped!=name then loaded=directRuntimeStageCached(archive,name,nextSlot,endSlot,cache) end if
    if loaded!=void then result=[loaded[0]];nextSlot=loaded[1] end if
  end if
  return [result,nextSlot,deforms,twoSided,sort,polygonOffset,noMipMaps,clampTime,noPicMip]
end function
/// Calls `mq3.renderer.playable_materials.runtimeStagesCached` with `(archive,index,name,nextSlot,endSlot,void)` and returns its result.
/// @param archive Value forwarded as `archive` to `mq3.renderer.playable_materials.runtimeStagesCached`.
/// @param index Value forwarded as `index` to `mq3.renderer.playable_materials.runtimeStagesCached`.
/// @param name Value forwarded as `name` to `mq3.renderer.playable_materials.runtimeStagesCached`.
/// @param nextSlot Value forwarded as `nextSlot` to `mq3.renderer.playable_materials.runtimeStagesCached`.
/// @param endSlot Value forwarded as `endSlot` to `mq3.renderer.playable_materials.runtimeStagesCached`.
function runtimeStages(archive,index,name,nextSlot,endSlot) return runtimeStagesCached(archive,index,name,nextSlot,endSlot,void) end function

/// Returns `integer` from `mq3.renderer.playable_materials.floorNumber`; earlier branches return `integer-1`.
/// @param value Argument 1 supplied to `mq3.compat.numeric.trunc32`.
function floorNumber(value) integer=n.trunc32(value);if value<integer then return integer-1 end if;return integer end function
/// Returns `frame%len(stage.slots)` from `mq3.renderer.playable_materials.frameIndex`; earlier branches return `0`.
/// @param stage Record providing `stage.slots`, `stage.animationSpeed`.
/// @param nowMilliseconds Input used by `frame=floorNumber(nowMilliseconds*0.001*stage.animationSpeed)`.
function frameIndex(stage,nowMilliseconds)
  if stage==void or len(stage.slots)<2 or stage.animationSpeed<=0.0 then return 0 end if
  frame=floorNumber(nowMilliseconds*0.001*stage.animationSpeed);if frame<0 then frame=0 end if
  return frame%len(stage.slots)
end function
/// Returns `stage.slots[frameIndex(stage,nowMilliseconds)]` from `mq3.renderer.playable_materials.slotAt`; earlier branches return `-1`.
/// @param stage Record providing `stage.slots`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.frameIndex`.
function slotAt(stage,nowMilliseconds) if stage==void or len(stage.slots)==0 then return -1 end if;return stage.slots[frameIndex(stage,nowMilliseconds)] end function
// tr_backend.c subtracts refEntity_t.shaderTime before every shader-time
// consumer runs. Keep that conversion in one place so animated images,
// waves, deforms and tcMods all observe the same per-entity clock.
/// @param nowMilliseconds Current renderer time in milliseconds.
/// @param entityShaderTime Per-entity shader start time in seconds, subtracted from renderer time.
/// @param timeOffset Shader remapping time offset in seconds, also subtracted.
/// @param clampTime Maximum shader time in seconds; zero disables clamping.
/// @returns Float32 renderer seconds minus entityShaderTime and timeOffset, limited by nonzero clampTime.
function shaderSeconds(nowMilliseconds,entityShaderTime,timeOffset,clampTime) returns float
  value=n.fsub(n.fsub(n.f32(nowMilliseconds*0.001),n.f32(entityShaderTime)),n.f32(timeOffset))
  if clampTime!=0.0 and value>=clampTime then return n.f32(clampTime) end if
  return value
end function
/// Converts the offset/clamped per-entity shader clock from seconds back to milliseconds.
/// @param nowMilliseconds Current renderer time in milliseconds.
/// @param entityShaderTime Per-entity shader start time in seconds, subtracted from renderer time.
/// @param timeOffset Shader remapping time offset in seconds, also subtracted.
/// @param clampTime Maximum shader time in seconds; zero disables clamping.
/// @returns The float32 per-entity shader time in milliseconds.
function inline shaderMilliseconds(nowMilliseconds,entityShaderTime,timeOffset,clampTime) returns float return n.fmul(shaderSeconds(nowMilliseconds,entityShaderTime,timeOffset,clampTime),1000.0) end function
/// Calls `mq3.renderer.playable_materials.shaderMilliseconds` with `(nowMilliseconds,shaderTime,0.0,0.0)` and returns its result.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.shaderMilliseconds`.
/// @param shaderTime Value forwarded as `entityShaderTime` to `mq3.renderer.playable_materials.shaderMilliseconds`.
function entityMilliseconds(nowMilliseconds,shaderTime) return shaderMilliseconds(nowMilliseconds,shaderTime,0.0,0.0) end function
/// Calls `mq3.renderer.playable_materials.frameIndex` with `(stage,entityMilliseconds(nowMilliseconds,shaderTime))` and returns its result.
/// @param stage Value forwarded as `stage` to `mq3.renderer.playable_materials.frameIndex`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.entityMilliseconds`.
/// @param shaderTime Value forwarded as `shaderTime` to `mq3.renderer.playable_materials.entityMilliseconds`.
function frameIndexEntity(stage,nowMilliseconds,shaderTime) return frameIndex(stage,entityMilliseconds(nowMilliseconds,shaderTime)) end function
/// Returns `stage.slots[frameIndexEntity(stage,nowMilliseconds,shaderTime)]` from `mq3.renderer.playable_materials.slotAtEntity`; earlier branches return `-1`.
/// @param stage Record providing `stage.slots`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.frameIndexEntity`.
/// @param shaderTime Value forwarded as `shaderTime` to `mq3.renderer.playable_materials.frameIndexEntity`.
function slotAtEntity(stage,nowMilliseconds,shaderTime) if stage==void or len(stage.slots)==0 then return -1 end if;return stage.slots[frameIndexEntity(stage,nowMilliseconds,shaderTime)] end function

/// Computes `waveSignal` from `n.f32(trans.sin(radians))` using `mq3.compat.numeric.f32`, `mq3.compat.numeric.fadd`, `mq3.compat.numeric.fmul`.
/// @param wave Record providing `wave.phase`, `wave.frequency`, `wave.func`.
/// @param nowMilliseconds Input used by `seconds=n.f32(nowMilliseconds*0.001)`.
function waveSignal(wave,nowMilliseconds)
  seconds=n.f32(nowMilliseconds*0.001)
  phase=n.fadd(wave.phase,n.fmul(seconds,wave.frequency))
  index=n.trunc32(n.fmul(phase,1024.0))&1023
  if wave.func==2 then if index<512 then return 1.0 else return -1.0 end if end if
  if wave.func==3 then
    if index<256 then return n.fdiv(index,256.0) end if
    if index<512 then return n.fsub(2.0,n.fdiv(index,256.0)) end if
    if index<768 then return n.fdiv(0-(index-512),256.0) end if
    return n.fsub(n.fdiv(index,256.0),4.0)
  end if
  saw=n.fdiv(index,1024.0)
  if wave.func==4 then return saw end if
  if wave.func==5 then return n.fsub(1.0,saw) end if
  radians=n.fmul(index,n.fdiv(n.fmul(2.0,n.f32(3.14159265358979323846)),1023.0))
  return n.f32(trans.sin(radians))
end function
/// Calls `mq3.compat.numeric.fadd` with `(wave.base,n.fmul(wave.amplitude,waveSignal(wave,nowMilliseconds)))` and returns its result.
/// @param wave Record providing `wave.base`, `wave.amplitude`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.waveSignal`.
function waveSample(wave,nowMilliseconds) return n.fadd(wave.base,n.fmul(wave.amplitude,waveSignal(wave,nowMilliseconds))) end function
/// Returns `waveSample(shifted,nowMilliseconds)` from `mq3.renderer.playable_materials.waveSampleOffset`.
/// @param wave Record providing `wave.func`, `wave.base`, `wave.amplitude`, `wave.phase`, `wave.frequency`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.waveSample`.
/// @param phaseOffset Input used by `shifted=shaderParser.Wave(wave.func,wave.base,wave.amplitude,wave.phase+phaseOffset,wave.frequency)`.
function waveSampleOffset(wave,nowMilliseconds,phaseOffset)
  shifted=shaderParser.Wave(wave.func,wave.base,wave.amplitude,wave.phase+phaseOffset,wave.frequency)
  return waveSample(shifted,nowMilliseconds)
end function
/// Returns `value` from `mq3.renderer.playable_materials.waveValue`; earlier branches return `0.0`, `1.0`.
/// @param wave Value forwarded as `wave` to `mq3.renderer.playable_materials.waveSample`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.waveSample`.
function waveValue(wave,nowMilliseconds)
  value=waveSample(wave,nowMilliseconds)
  if value<0.0 then return 0.0 end if;if value>1.0 then return 1.0 end if;return value
end function
/// Computes the stage brightness for waveform, identity, inverse-vertex, or ordinary vertex RGB generation.
/// @param stage Record providing `stage.rgbGen`, `stage.rgbWave`.
/// @param vertexLight Input tested by `stage.rgbGen=="oneminusvertex"`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.waveValue`.
function stageLight(stage,vertexLight,nowMilliseconds)
  if stage.rgbGen=="wave" then return n.trunc32(n.fmul(255.0,waveValue(stage.rgbWave,nowMilliseconds)))/255.0 end if
  if stage.rgbGen=="identity" then return 1.0 end if
  if stage.rgbGen=="oneminusvertex" then return 1.0-vertexLight end if
  return vertexLight
end function

/// Returns `n.trunc32(value)` from `mq3.renderer.playable_materials.colorByte`; earlier branches return `0`, `255`.
/// @param value Argument 1 supplied to `mq3.compat.numeric.trunc32`.
function colorByte(value)
  if value<0.0 then return 0 end if;if value>255.0 then return 255 end if;return n.trunc32(value)
end function
// FinishShader assigns fog modulation only when the shader's first stage is
// blended. Additive and inverse-source-color stages fade RGB, strict alpha
// stages fade alpha, and premultiplied-alpha stages fade RGBA. The final fog
// pass can then converge on the fog colour without glowing or opaque blended
// surfaces leaking through it.
/// @param firstStage Record providing `firstStage.blend`.
/// @param stage Record providing `stage.blend`.
function fogAdjustment(firstStage,stage)
  if firstStage==void or stage==void or firstStage.blend==BLEND_OPAQUE then return "none" end if
  if stage.blend==BLEND_ADD or stage.blend==BLEND_MARK then return "rgb" end if
  if stage.blend==BLEND_ALPHA then return "alpha" end if
  if stage.blend==BLEND_PREMULTIPLIED_ALPHA then return "rgba" end if
  return "none"
end function
/// Builds `result[0]`, `result[1]`, `result[2]`, `result[3]` in `mq3.renderer.playable_materials.modulateForFog`; returns `result`.
/// @param color Indexed input read at `0`, `1`, `2`, `3`.
/// @param density Input used by `factor=1.0-density`.
/// @param adjustment Input tested by `adjustment=="rgb" or adjustment=="rgba"`.
function modulateForFog(color,density,adjustment)
  factor=1.0-density;if factor<0.0 then factor=0.0 end if;if factor>1.0 then factor=1.0 end if
  result=[color[0],color[1],color[2],color[3]]
  if adjustment=="rgb" or adjustment=="rgba" then result[0]=colorByte(result[0]*factor);result[1]=colorByte(result[1]*factor);result[2]=colorByte(result[2]*factor) end if
  if adjustment=="alpha" or adjustment=="rgba" then result[3]=colorByte(result[3]*factor) end if
  return result
end function
// Complete ComputeColors ordering from tr_shade.c. RGB generation may seed
// alpha, after which alphaGen either preserves or replaces it. identityLight
// is explicit so differential tests can cover the original overbright path;
// the software preview currently renders with identityLight 1.0.
/// @param stage Record providing `stage.rgbGen`, `stage.rgbWave`, `stage.constantColor`, `stage.alphaGen`, `stage.alphaWave`.
/// @param vertexColor Indexed input read at `0`, `1`, `2`, `3`.
/// @param entityColor Indexed input read at `0`, `1`, `2`, `3`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.waveValue`.
/// @param identityLight Input used by `identityByte=colorByte(255.0*identityLight)`.
function stageColorEntityIdentity(stage,vertexColor,entityColor,nowMilliseconds,identityLight)
  identityByte=colorByte(255.0*identityLight);result=[identityByte,identityByte,identityByte,identityByte]
  if stage.rgbGen=="identity" then result=[255,255,255,255]
  else if stage.rgbGen=="vertex" then
    result=[vertexColor[0],vertexColor[1],vertexColor[2],vertexColor[3]]
    if identityLight!=1.0 then result[0]=colorByte(vertexColor[0]*identityLight);result[1]=colorByte(vertexColor[1]*identityLight);result[2]=colorByte(vertexColor[2]*identityLight) end if
  else if stage.rgbGen=="exactvertex" then result=[vertexColor[0],vertexColor[1],vertexColor[2],vertexColor[3]]
  else if stage.rgbGen=="lightingdiffuse" then result=[vertexColor[0],vertexColor[1],vertexColor[2],255]
  else if stage.rgbGen=="oneminusvertex" then result[0]=colorByte((255-vertexColor[0])*identityLight);result[1]=colorByte((255-vertexColor[1])*identityLight);result[2]=colorByte((255-vertexColor[2])*identityLight)
  else if stage.rgbGen=="entity" then result=[entityColor[0],entityColor[1],entityColor[2],entityColor[3]]
  else if stage.rgbGen=="oneminusentity" then result=[255-entityColor[0],255-entityColor[1],255-entityColor[2],255-entityColor[3]]
  else if stage.rgbGen=="wave" then value=colorByte(255.0*waveValue(stage.rgbWave,nowMilliseconds)*identityLight);result=[value,value,value,255]
  else if stage.rgbGen=="const" then result=[colorByte(stage.constantColor[0]),colorByte(stage.constantColor[1]),colorByte(stage.constantColor[2]),colorByte(stage.constantColor[3])]
  end if
  if stage.alphaGen=="identity" then
    if stage.rgbGen!="identity" and (stage.rgbGen!="vertex" or identityLight!=1.0) then result[3]=255 end if
  else if stage.alphaGen=="vertex" then if stage.rgbGen!="vertex" then result[3]=vertexColor[3] end if
  else if stage.alphaGen=="oneminusvertex" then result[3]=255-vertexColor[3]
  else if stage.alphaGen=="entity" then result[3]=entityColor[3]
  else if stage.alphaGen=="oneminusentity" then result[3]=255-entityColor[3]
  else if stage.alphaGen=="wave" then result[3]=colorByte(255.0*waveValue(stage.alphaWave,nowMilliseconds))
  else if stage.alphaGen=="const" then if stage.rgbGen!="const" then result[3]=colorByte(stage.constantColor[3]) end if
  end if
  return result
end function
/// Calls `mq3.renderer.playable_materials.stageColorEntityIdentity` with `(stage,vertexColor,entityColor,nowMilliseconds,1.0)` and returns its result.
/// @param stage Value forwarded as `stage` to `mq3.renderer.playable_materials.stageColorEntityIdentity`.
/// @param vertexColor Value forwarded as `vertexColor` to `mq3.renderer.playable_materials.stageColorEntityIdentity`.
/// @param entityColor Value forwarded as `entityColor` to `mq3.renderer.playable_materials.stageColorEntityIdentity`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.stageColorEntityIdentity`.
function stageColorEntity(stage,vertexColor,entityColor,nowMilliseconds) return stageColorEntityIdentity(stage,vertexColor,entityColor,nowMilliseconds,1.0) end function
/// Calls `mq3.renderer.playable_materials.stageColorEntity` with `(stage,vertexColor,vertexColor,nowMilliseconds)` and returns its result.
/// @param stage Value forwarded as `stage` to `mq3.renderer.playable_materials.stageColorEntity`.
/// @param vertexColor Value forwarded as `vertexColor` to `mq3.renderer.playable_materials.stageColorEntity`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.stageColorEntity`.
function stageColor(stage,vertexColor,nowMilliseconds) return stageColorEntity(stage,vertexColor,vertexColor,nowMilliseconds) end function

// AGEN_PORTAL from tr_shade.c fades each deformed vertex according to its
// camera distance.  This is deliberately evaluated after stageColor so the
// portal generator replaces only alpha, exactly like the original renderer.
/// @param stage Record providing `stage.alphaGen`, `stage.portalRange`.
/// @param vertexColor Value forwarded as `vertexColor` to `mq3.renderer.playable_materials.stageColorEntity`.
/// @param entityColor Value forwarded as `entityColor` to `mq3.renderer.playable_materials.stageColorEntity`.
/// @param position Three-component vector read at indices 0, 1, and 2.
/// @param viewOrigin Three-component vector read at indices 0, 1, and 2.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.stageColorEntity`.
function stageColorAtEntity(stage,vertexColor,entityColor,position,viewOrigin,nowMilliseconds)
  result=stageColorEntity(stage,vertexColor,entityColor,nowMilliseconds)
  if stage.alphaGen=="portal" then
    range=stage.portalRange;if range<=0.0 then range=256.0 end if
    dx=position[0]-viewOrigin[0];dy=position[1]-viewOrigin[1];dz=position[2]-viewOrigin[2]
    distance=n.fsqrt(dx*dx+dy*dy+dz*dz)
    result[3]=colorByte(255.0*distance/range)
  end if
  return result
end function
/// Calls `mq3.renderer.playable_materials.stageColorAtEntity` with `(stage,vertexColor,vertexColor,position,viewOrigin,nowMilliseconds)` and returns its result.
/// @param stage Value forwarded as `stage` to `mq3.renderer.playable_materials.stageColorAtEntity`.
/// @param vertexColor Value forwarded as `vertexColor` to `mq3.renderer.playable_materials.stageColorAtEntity`.
/// @param position Value forwarded as `position` to `mq3.renderer.playable_materials.stageColorAtEntity`.
/// @param viewOrigin Value forwarded as `viewOrigin` to `mq3.renderer.playable_materials.stageColorAtEntity`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.stageColorAtEntity`.
function stageColorAt(stage,vertexColor,position,viewOrigin,nowMilliseconds) return stageColorAtEntity(stage,vertexColor,vertexColor,position,viewOrigin,nowMilliseconds) end function

/// Computes `vectorUV` from `[position[0]*s[0]+position[1]*s[1]+position[2]*s[2],position[0]*t[0]+position[1]*t[1]+position[2]*t[2]]`.
/// @param stage Record providing `stage.tcGenVectors`.
/// @param position Three-component vector read at indices 0, 1, and 2.
function vectorUV(stage,position)
  if stage==void or len(stage.tcGenVectors)!=2 or len(stage.tcGenVectors[0])!=3 or len(stage.tcGenVectors[1])!=3 then return fail("invalid vector tcGen") end if
  s=stage.tcGenVectors[0];t=stage.tcGenVectors[1]
  return [position[0]*s[0]+position[1]*s[1]+position[2]*s[2],position[0]*t[0]+position[1]*t[1]+position[2]*t[2]]
end function

/// Returns `trans.sin(radians)*mod.b` from `mq3.renderer.playable_materials.turbulentOffset`.
/// @param coordinate Input used by `index=n.trunc32((coordinate/1024.0+phase)*1024.0)&1023`.
/// @param mod Record providing `mod.c`, `mod.d`, `mod.b`.
/// @param nowMilliseconds Input used by `phase=mod.c+nowMilliseconds*0.001*mod.d`.
function turbulentOffset(coordinate,mod,nowMilliseconds)
  phase=mod.c+nowMilliseconds*0.001*mod.d
  index=n.trunc32((coordinate/1024.0+phase)*1024.0)&1023
  radians=index*2.0*3.14159265358979323846/1024.0
  return trans.sin(radians)*mod.b
end function

// Baseq3 applies tcMods in declaration order. Turbulence additionally uses
// the unmodified world position of each vertex.
/// @param stage Record providing `stage.uvMods`.
/// @param uv Indexed input read at `0`, `1`.
/// @param position Three-component vector read at indices 0, 1, and 2.
/// @param entityTexCoord Indexed input read at `0`, `1`.
/// @param shaderTime Value forwarded as `shaderTime` to `mq3.renderer.playable_materials.entityMilliseconds`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.entityMilliseconds`.
function transformUVEntityAt(stage,uv,position,entityTexCoord,shaderTime,nowMilliseconds)
  if stage==void or uv==void or len(uv)!=2 or position==void or len(position)!=3 then return fail("stage, UV and world position are required") end if
  if entityTexCoord==void or len(entityTexCoord)!=2 then return fail("entity texture coordinate requires two components") end if
  effectiveMilliseconds=entityMilliseconds(nowMilliseconds,shaderTime);result=[uv[0],uv[1]];seconds=effectiveMilliseconds*0.001
  for each mod in stage.uvMods
    if mod.kind=="scroll" then
      scrollS=mod.a*seconds;scrollS=scrollS-floorNumber(scrollS);scrollT=mod.b*seconds;scrollT=scrollT-floorNumber(scrollT)
      result=[result[0]+scrollS,result[1]+scrollT]
    else if mod.kind=="scale" then result=[result[0]*mod.a,result[1]*mod.b]
    else if mod.kind=="rotate" then
      radians=0.0-mod.a*seconds*3.14159265358979323846/180.0;sine=trans.sin(radians);cosine=trans.cos(radians);x=result[0]-0.5;y=result[1]-0.5
      result=[x*cosine-y*sine+0.5,x*sine+y*cosine+0.5]
    else if mod.kind=="turb" then result=[result[0]+turbulentOffset(position[0]+position[2],mod,effectiveMilliseconds),result[1]+turbulentOffset(position[1],mod,effectiveMilliseconds)]
    else if mod.kind=="stretch" then p=1.0/waveSample(mod.wave,effectiveMilliseconds);offset=0.5-0.5*p;result=[result[0]*p+offset,result[1]*p+offset]
    else if mod.kind=="transform" then s=result[0];t=result[1];result=[s*mod.a+t*mod.c+mod.e,s*mod.b+t*mod.d+mod.f]
    else if mod.kind=="entitytranslate" then scrollS=entityTexCoord[0]*seconds;scrollS=scrollS-floorNumber(scrollS);scrollT=entityTexCoord[1]*seconds;scrollT=scrollT-floorNumber(scrollT);result=[result[0]+scrollS,result[1]+scrollT]
    end if
  end for
  return result
end function

/// Calls `mq3.renderer.playable_materials.transformUVEntityAt` with `(stage,uv,position,[0.0,0.0],0.0,nowMilliseconds)` and returns its result.
/// @param stage Value forwarded as `stage` to `mq3.renderer.playable_materials.transformUVEntityAt`.
/// @param uv Value forwarded as `uv` to `mq3.renderer.playable_materials.transformUVEntityAt`.
/// @param position Value forwarded as `position` to `mq3.renderer.playable_materials.transformUVEntityAt`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.transformUVEntityAt`.
function transformUVAt(stage,uv,position,nowMilliseconds)
  return transformUVEntityAt(stage,uv,position,[0.0,0.0],0.0,nowMilliseconds)
end function

/// Calls `mq3.renderer.playable_materials.transformUVAt` with `(stage,uv,[0.0,0.0,0.0],nowMilliseconds)` and returns its result.
/// @param stage Value forwarded as `stage` to `mq3.renderer.playable_materials.transformUVAt`.
/// @param uv Value forwarded as `uv` to `mq3.renderer.playable_materials.transformUVAt`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_materials.transformUVAt`.
function transformUV(stage,uv,nowMilliseconds)
  return transformUVAt(stage,uv,[0.0,0.0,0.0],nowMilliseconds)
end function

// RB_CalcEnvironmentTexCoords: reflect the normalized eye vector around the
// BSP vertex normal and map reflected Y/Z into texture space.
/// @param position Three-component vector read at indices 0, 1, and 2.
/// @param normal Three-component vector read at indices 0, 1, and 2.
/// @param viewOrigin Three-component vector read at indices 0, 1, and 2.
function environmentUV(position,normal,viewOrigin)
  if position==void or normal==void or viewOrigin==void or len(position)!=3 or len(normal)!=3 or len(viewOrigin)!=3 then return fail("environment coordinates require three-component vectors") end if
  viewer=[viewOrigin[0]-position[0],viewOrigin[1]-position[1],viewOrigin[2]-position[2]]
  length=n.fsqrt(viewer[0]*viewer[0]+viewer[1]*viewer[1]+viewer[2]*viewer[2]);if length>0.0 then viewer=[viewer[0]/length,viewer[1]/length,viewer[2]/length] end if
  dot=normal[0]*viewer[0]+normal[1]*viewer[1]+normal[2]*viewer[2]
  reflectedY=normal[1]*2.0*dot-viewer[1];reflectedZ=normal[2]*2.0*dot-viewer[2]
  return [0.5+reflectedY*0.5,0.5-reflectedZ*0.5]
end function

/// Builds `mq3.renderer.playable_materials.Catalog` using `materialList.add`, `materialList.toArray`, `materialList.len`.
/// @param archive Value forwarded as `archive` to `mq3.renderer.playable_materials.runtimeStages`.
/// @param map Record providing `map.counts`.
/// @param maxMaterials Input used by `endSlot=firstSlot+maxMaterials`.
/// @param firstSlot Input used by `nextSlot=firstSlot`.
/// @param index Value forwarded as `index` to `mq3.renderer.playable_materials.runtimeStages`.
/// @param scriptCount Initial value for `mq3.renderer.playable_materials.Catalog.scripts`.
function loadIndexed(archive,map,maxMaterials,firstSlot,index,scriptCount)
  if archive==void or not validMap(map) then return fail("archive and BSP are required") end if
  if firstSlot<0 or firstSlot>window.NATIVE_TEXTURE_SLOTS or maxMaterials<0 or maxMaterials>window.NATIVE_TEXTURE_SLOTS-firstSlot then return fail("base texture slots outside range") end if
  if index==void or scriptCount<0 then return fail("shader index and count are required") end if
  materialList=lists.List.withCapacity(map.counts[1]);attempted=0;nextSlot=firstSlot;endSlot=firstSlot+maxMaterials;animated=0;effects=0
  textureIndex=0
  while textureIndex<map.counts[1] and nextSlot<endSlot
    name=shaderName(map,textureIndex);if name is error then return name end if
    attempted=attempted+1
    resolved=runtimeStages(archive,index,name,nextSlot,endSlot);stages=resolved[0];nextSlot=resolved[1]
    if len(stages)>0 then
      firstImageName="";firstImage=void;firstImageSlot=-1
      for each stage in stages if firstImageSlot<0 and len(stage.slots)>0 then firstImageName=stage.imageNames[0];firstImage=stage.images[0];firstImageSlot=stage.slots[0] end if end for
      materialList.add(Material(textureIndex,name,firstImageName,firstImage,firstImageSlot,stages,resolved[2],resolved[3],resolved[4],resolved[5],resolved[6],0.0,resolved[7],resolved[8]))
      for each stage in stages
        if len(stage.slots)>1 then animated=animated+1 end if
        if stage.blend!=BLEND_OPAQUE or stage.alphaTest!=ALPHA_TEST_NONE or len(stage.uvMods)>0 then effects=effects+1 end if
      end for
    end if
    textureIndex=textureIndex+1
  end while
  return Catalog(materialList.toArray(),scriptCount,attempted,materialList.len(),nextSlot-firstSlot,animated,effects)
end function

/// Returns `loadIndexed(archive,map,maxMaterials,firstSlot,scripts[0],scripts[1])` from `mq3.renderer.playable_materials.load`; earlier branches return `scripts`.
/// @param archive Value forwarded as `archive` to `mq3.renderer.playable_materials.buildScriptIndex`.
/// @param map Value forwarded as `map` to `mq3.renderer.playable_materials.loadIndexed`.
/// @param maxMaterials Value forwarded as `maxMaterials` to `mq3.renderer.playable_materials.loadIndexed`.
/// @param firstSlot Value forwarded as `firstSlot` to `mq3.renderer.playable_materials.loadIndexed`.
function load(archive,map,maxMaterials,firstSlot)
  scripts=buildScriptIndex(archive);if scripts is error then return scripts end if
  return loadIndexed(archive,map,maxMaterials,firstSlot,scripts[0],scripts[1])
end function

/// Returns `-1` from `mq3.renderer.playable_materials.slotFor`; earlier branches return `-1`, `material.slot`.
/// @param catalog Record providing `catalog.materials`.
/// @param textureIndex Input used by `for each material in catalog.materials if material.textureIndex==textureIndex then return material.slot`.
function slotFor(catalog,textureIndex)
  if catalog==void then return -1 end if
  for each material in catalog.materials if material.textureIndex==textureIndex then return material.slot end if end for
  return -1
end function
