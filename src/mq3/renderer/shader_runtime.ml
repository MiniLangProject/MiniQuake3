// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native runtime facade for code/renderer/tr_shader.c.
package mq3.renderer.shader_runtime

import mq3.renderer.shader_index as shaderIndex
import mq3.renderer.shader_parser as shaderParser
import mq3.renderer.shader_remap as shaderRemap
import mq3.shared.parser as parser
import std.string as strings

/// Negative lightmap selector for a shader that does not use baked lighting.
const LIGHTMAP_NONE=-1
/// Negative lightmap selector requesting vertex lighting instead of a lightmap image.
const LIGHTMAP_BY_VERTEX=-2
/// Negative lightmap selector used for two-dimensional drawing shaders.
const LIGHTMAP_2D=-3
/// Negative lightmap selector substituting the renderer's white image.
const LIGHTMAP_WHITEIMAGE=-4
/// Shader sort order reserved for portal surfaces.
const SS_PORTAL=1.0
/// Shader sort order reserved for environment and sky surfaces.
const SS_ENVIRONMENT=2.0
/// Shader sort order for opaque surfaces.
const SS_OPAQUE=3.0
/// Shader sort order for decals placed over opaque geometry.
const SS_DECAL=4.0
/// Shader sort order for surfaces with cutout transparency.
const SS_SEE_THROUGH=5.0
/// Shader sort order for the first general blended-surface category.
const SS_BLEND0=9.0
/// Shader sort order reserved for fog surfaces.
const SS_FOG=7.0

/// Data record for `mq3.renderer.shader_runtime.ShaderSource`; groups `name`, `text`.
struct ShaderSource
  /// Shader script source name retained with the text supplied for indexing.
  name
  /// Text payload, script source, or message associated with this record.
  text
end struct
/// Data record for `mq3.renderer.shader_runtime.SkyParms`; groups `outerBox`, `cloudHeight`, `innerBox`.
struct SkyParms
  /// Six images forming the outer skybox.
  outerBox
  /// Height used to project moving cloud texture coordinates.
  cloudHeight
  /// Six images forming the inner skybox layer.
  innerBox
end struct
/// Data record for `mq3.renderer.shader_runtime.CollapseResult`; groups `collapsed`, `environment`, `blend`, `first`, `second`.
struct CollapseResult
  /// Whether two compatible material stages were merged into one pass.
  collapsed
  /// Texture-environment combine mode selected for the merged pass.
  environment
  /// Blend mode selected for the material or merged stage.
  blend
  /// First shader stage participating in the attempted multitexture collapse.
  first
  /// Second shader stage participating in the attempted multitexture collapse.
  second
end struct
/// Data record for `mq3.renderer.shader_runtime.PermanentShader`; groups `handle`, `name`, `lightmapIndex`, `mipRawImage`, `shader`, `image`, and 10 further fields.
struct PermanentShader
  /// Resource handle used to identify the registered or opened object.
  handle
  /// Registered material name used to find the permanent shader and its remappings.
  name
  /// Index or special selector identifying the surface's baked lightmap.
  lightmapIndex
  /// Whether a shader's implicit image is loaded with mipmap generation enabled.
  mipRawImage
  /// Resolved shader record or handle used for this drawing operation.
  shader
  /// Image associated with the registered shader's implicit or fallback material path.
  image
  /// Whether shader resolution fell back to the renderer's default material.
  defaultShader
  /// Whether the material was defined in a shader script.
  explicitlyDefined
  /// Whether the shader is an internal renderer resource.
  internal
  /// Backend iterator selected to execute the shader's drawing stages.
  iteratorName
  /// Result of combining compatible shader stages into fewer drawing passes.
  collapse
  /// Whether stage colors and lighting were collapsed to the vertex-lighting path.
  vertexCollapsed
  /// Drawing passes required by the material or retained batch.
  passes
  /// Position of this shader in the renderer's sort order.
  sortedIndex
  /// Shader name selected after applying active remaps.
  remappedName
  /// Offset in seconds applied to the material's shader time.
  timeOffset
end struct
/// Data record for `mq3.renderer.shader_runtime.State`; groups `text`, `index`, `shaders`, `sorted`, `remaps`, `assets`, and 12 further fields.
struct State
  /// Text payload, script source, or message associated with this record.
  text
  /// Parsed shader-text index used to find definitions by material name.
  index
  /// Shader records available to resolve the queued drawing surfaces.
  shaders
  /// Shader records ordered by their rendering sort keys.
  sorted
  /// Shader remapping entries applied during material lookup.
  remaps
  /// Registered resource handles and their backing asset data.
  assets
  /// Resource categories associated with the registered shader assets.
  kinds
  /// Asset-host state passed when loading shader images or repairing queued shader references.
  context
  /// Host callback used to perform load image operations for this subsystem.
  loadImageFn
  /// Host callback used to perform command fix operations for this subsystem.
  commandFixFn
  /// Number of BSP lightmaps available to shader registration.
  numLightmaps
  /// Whether optional detail-texture stages are enabled.
  detailTextures
  /// Whether lighting is reduced to the vertex-lighting path.
  vertexLight
  /// Whether optimized single-stage drawing paths are disabled.
  ignoreFastPath
  /// Whether additive texture-environment combining is available.
  textureEnvAdd
  /// Whether multiple texture units may be used in one drawing pass.
  multitexture
  /// Whether initialization completed successfully.
  initialized
  /// Nonfatal diagnostics retained by the subsystem.
  warnings
end struct

/// Returns `strings.toLowerAscii(value)` from `mq3.renderer.shader_runtime.lower`; earlier branches return `""`.
/// @param value Argument 1 supplied to `std.string.toLowerAscii`.
function lower(value) if value==void then return "" end if;return strings.toLowerAscii(value) end function
/// Calls `stringEqualsIgnoreCaseAscii` with `(stripExtension(a),stripExtension(b))` and returns its result.
/// @param a Value forwarded as `name` to `mq3.renderer.shader_runtime.stripExtension`.
/// @param b Value forwarded as `name` to `mq3.renderer.shader_runtime.stripExtension`.
function sameName(a,b) return stringEqualsIgnoreCaseAscii(stripExtension(a),stripExtension(b)) end function
/// Computes `stripExtension` from `decode(slice(data,0,last))`.
/// @param name Argument 1 supplied to `bytes`.
function stripExtension(name)
  if name==void then return "" end if;data=bytes(name);last=-1
  for index=0 to len(data)-1 if data[index]==46 then last=index else if data[index]==47 or data[index]==92 then last=-1 end if end for
  if last<0 then return name end if;return decode(slice(data,0,last))
end function
/// Returns `false` from `mq3.renderer.shader_runtime.has`; earlier branches return `true`.
/// @param values Sequence traversed as `item` while producing this result.
/// @param value Input used by `for each item in values if item==value then return true`.
function has(values,value) for each item in values if item==value then return true end if end for;return false end function
/// Computes `a.func==b.func and a.base==b.base and a.amplitude==b.amplitude and a.phase==b.phase and a.frequency==b.frequency` for `mq3.renderer.shader_runtime.waveEqual`.
/// @param a Record providing `a.func`, `a.base`, `a.amplitude`, `a.phase`, `a.frequency`.
/// @param b Record providing `b.func`, `b.base`, `b.amplitude`, `b.phase`, `b.frequency`.
function waveEqual(a,b) return a.func==b.func and a.base==b.base and a.amplitude==b.amplitude and a.phase==b.phase and a.frequency==b.frequency end function

/// Builds `mq3.renderer.shader_runtime.State` using `mq3.renderer.shader_index.build`, `mq3.renderer.shader_remap.create`.
/// @param context Initial value for `mq3.renderer.shader_runtime.State.context`.
/// @param loadImageFn Initial value for `mq3.renderer.shader_runtime.State.loadImageFn`.
/// @param commandFixFn Initial value for `mq3.renderer.shader_runtime.State.commandFixFn`.
function create(context,loadImageFn,commandFixFn)
  empty=shaderIndex.build("")
  return State("",empty,[],[],shaderRemap.create(),[],[],context,loadImageFn,commandFixFn,0,true,false,false,true,true,false,[])
end function

// Parser and shader-text entry points -----------------------------------
/// @param name Argument 1 supplied to `mq3.renderer.shader_index.hashValue`.
/// @param size Argument 2 supplied to `mq3.renderer.shader_index.hashValue`.
function generateHashValue(name,size) return shaderIndex.hashValue(name,size) end function
/// Returns `shaderIndex.find(state.index,name)` from `mq3.renderer.shader_runtime.findShaderInShaderText`; earlier branches return `void`.
/// @param state Record providing `state.index`.
/// @param name Argument 2 supplied to `mq3.renderer.shader_index.find`.
function findShaderInShaderText(state,name) if state==void then return void end if;return shaderIndex.find(state.index,name) end function
/// Calls `mq3.renderer.shader_parser.nameToAFunc` with `(name)` and returns its result.
/// @param name Argument 1 supplied to `mq3.renderer.shader_parser.nameToAFunc`.
function nameToAFunc(name) return shaderParser.nameToAFunc(name) end function
/// Calls `mq3.renderer.shader_parser.nameToSrcBlendMode` with `(name)` and returns its result.
/// @param name Argument 1 supplied to `mq3.renderer.shader_parser.nameToSrcBlendMode`.
function nameToSrcBlendMode(name) return shaderParser.nameToSrcBlendMode(name) end function
/// Calls `mq3.renderer.shader_parser.nameToDstBlendMode` with `(name)` and returns its result.
/// @param name Argument 1 supplied to `mq3.renderer.shader_parser.nameToDstBlendMode`.
function nameToDstBlendMode(name) return shaderParser.nameToDstBlendMode(name) end function
/// Calls `mq3.renderer.shader_parser.nameToGenFunc` with `(name)` and returns its result.
/// @param name Argument 1 supplied to `mq3.renderer.shader_parser.nameToGenFunc`.
function nameToGenFunc(name) return shaderParser.nameToGenFunc(name) end function
/// Calls `mq3.renderer.shader_parser.parseVector` with `(state,count)` and returns its result.
/// @param state Argument 1 supplied to `mq3.renderer.shader_parser.parseVector`.
/// @param count Argument 2 supplied to `mq3.renderer.shader_parser.parseVector`.
function parseVector(state,count) return shaderParser.parseVector(state,count) end function
/// Calls `mq3.renderer.shader_parser.parseWave` with `(state)` and returns its result.
/// @param state Argument 1 supplied to `mq3.renderer.shader_parser.parseWave`.
function parseWaveForm(state) return shaderParser.parseWave(state) end function
/// Calls `mq3.renderer.shader_parser.parseTexMod` with `(tokens)` and returns its result.
/// @param tokens Argument 1 supplied to `mq3.renderer.shader_parser.parseTexMod`.
function parseTexMod(tokens) return shaderParser.parseTexMod(tokens) end function
/// Calls `mq3.renderer.shader_parser.parseStage` with `(state)` and returns its result.
/// @param state Argument 1 supplied to `mq3.renderer.shader_parser.parseStage`.
function parseStage(state) return shaderParser.parseStage(state) end function
/// Calls `mq3.renderer.shader_parser.parseDeform` with `(state)` and returns its result.
/// @param state Argument 1 supplied to `mq3.renderer.shader_parser.parseDeform`.
function parseDeform(state) return shaderParser.parseDeform(state) end function
/// Constructs `mq3.renderer.shader_runtime.SkyParms` from `outerBox`, `cloudHeight`, `innerBox`.
/// @param outerBox Initial value for `mq3.renderer.shader_runtime.SkyParms.outerBox`.
/// @param cloudHeight Initial value for `mq3.renderer.shader_runtime.SkyParms.cloudHeight`.
/// @param innerBox Initial value for `mq3.renderer.shader_runtime.SkyParms.innerBox`.
function parseSkyParms(outerBox,cloudHeight,innerBox) return SkyParms(outerBox,cloudHeight,innerBox) end function
/// Updates `shader.sort` in `mq3.renderer.shader_runtime.parseSort`; returns `shader.sort`.
/// @param shader Mutable record or buffer; this call updates `shader.sort`.
/// @param value Argument 1 supplied to `mq3.renderer.shader_parser.sortValue`.
function parseSort(shader,value) shader.sort=shaderParser.sortValue(value);return shader.sort end function
/// Updates `shader.surfaceParms` in `mq3.renderer.shader_runtime.parseSurfaceParm`; returns `name`.
/// @param shader Mutable record or buffer; this call updates `shader.surfaceParms`.
/// @param value Value forwarded as `value` to `mq3.renderer.shader_runtime.lower`.
function parseSurfaceParm(shader,value) name=lower(value);if not has(shader.surfaceParms,name) then shader.surfaceParms=shader.surfaceParms+[name] end if;return name end function
/// Calls `mq3.renderer.shader_parser.parseText` with `(text,name)` and returns its result.
/// @param text Argument 1 supplied to `mq3.renderer.shader_parser.parseText`.
/// @param name Argument 2 supplied to `mq3.renderer.shader_parser.parseText`.
function parseShader(text,name) return shaderParser.parseText(text,name) end function

// Original static tables exposed as deterministic native contracts.
function modes()
  return [[0,shaderParser.GLS_SRCBLEND_ZERO|shaderParser.GLS_DSTBLEND_SRC_COLOR,"modulate",0],
    [0,shaderParser.GLS_SRCBLEND_DST_COLOR|shaderParser.GLS_DSTBLEND_ZERO,"modulate",0],
    [shaderParser.GLS_SRCBLEND_DST_COLOR|shaderParser.GLS_DSTBLEND_ZERO,shaderParser.GLS_SRCBLEND_DST_COLOR|shaderParser.GLS_DSTBLEND_ZERO,"modulate",shaderParser.GLS_SRCBLEND_DST_COLOR|shaderParser.GLS_DSTBLEND_ZERO],
    [0,shaderParser.GLS_SRCBLEND_ONE|shaderParser.GLS_DSTBLEND_ONE,"add",0],
    [shaderParser.GLS_SRCBLEND_ONE|shaderParser.GLS_DSTBLEND_ONE,shaderParser.GLS_SRCBLEND_ONE|shaderParser.GLS_DSTBLEND_ONE,"add",shaderParser.GLS_SRCBLEND_ONE|shaderParser.GLS_DSTBLEND_ONE]]
end function
/// Computes `shader!=void and shader.name!="" and (len(shader.stages)>0 or has(shader.surfaceParms,"fog"))` for `mq3.renderer.shader_runtime.valid`.
/// @param shader Record providing `shader.name`, `shader.stages`, `shader.surfaceParms`.
function valid(shader) return shader!=void and shader.name!="" and (len(shader.stages)>0 or has(shader.surfaceParms,"fog")) end function

/// Computes `stage.blendSrc|stage.blendDst` for `mq3.renderer.shader_runtime.stageBlend`.
/// @param stage Record providing `stage.blendSrc`, `stage.blendDst`.
function stageBlend(stage) return stage.blendSrc|stage.blendDst end function
/// Computes `collapseMode` from `""` using `mq3.renderer.shader_runtime.stageBlend`, `if`, `and`.
/// @param first Value forwarded as `stage` to `mq3.renderer.shader_runtime.stageBlend`.
/// @param second Value forwarded as `stage` to `mq3.renderer.shader_runtime.stageBlend`.
function collapseMode(first,second)
  a=stageBlend(first);b=stageBlend(second);modA=shaderParser.GLS_SRCBLEND_ZERO|shaderParser.GLS_DSTBLEND_SRC_COLOR;modB=shaderParser.GLS_SRCBLEND_DST_COLOR|shaderParser.GLS_DSTBLEND_ZERO;add=shaderParser.GLS_SRCBLEND_ONE|shaderParser.GLS_DSTBLEND_ONE
  if (a==0 and (b==modA or b==modB)) or ((a==modA or a==modB) and (b==modA or b==modB)) then return "modulate" end if
  if (a==0 and b==add) or (a==add and b==add) then return "add" end if
  return ""
end function
/// Builds `mq3.renderer.shader_runtime.CollapseResult` for `mq3.renderer.shader_runtime.collapseMultitexture`.
/// @param shader Record providing `shader.stages`.
/// @param multitextureAvailable Input tested by `shader==void or not multitextureAvailable or len(shader.stages)<2`.
/// @param addAvailable Input tested by `environment=="" or (environment=="add" and not addAvailable)`.
function collapseMultitexture(shader,multitextureAvailable,addAvailable)
  empty=CollapseResult(false,"",0,void,void)
  if shader==void or not multitextureAvailable or len(shader.stages)<2 then return empty end if
  first=shader.stages[0];second=shader.stages[1]
  if not first.active or not second.active or first.alphaFunc!=second.alphaFunc or first.depthFunc!=second.depthFunc then return empty end if
  if first.rgbGen!=second.rgbGen or first.alphaGen!=second.alphaGen then return empty end if
  if first.rgbGen=="wave" and not waveEqual(first.rgbWave,second.rgbWave) then return empty end if
  if first.alphaGen=="wave" and not waveEqual(first.alphaWave,second.alphaWave) then return empty end if
  environment=collapseMode(first,second);if environment=="" or (environment=="add" and not addAvailable) then return empty end if
  if environment=="add" and first.rgbGen!="identity" then return empty end if
  blend=0;if stageBlend(first)!=0 and stageBlend(second)!=0 then blend=stageBlend(second) end if
  return CollapseResult(true,environment,blend,first,second)
end function

/// Scores lightmaps and nontrivial coordinate/color generation with negative weights for stage ordering.
/// @param stage Record providing `stage.isLightmap`, `stage.tcGen`, `stage.texMods`, `stage.rgbGen`.
function stageRank(stage)
  rank=0;if stage.isLightmap then rank=rank-100 end if;if stage.tcGen!="texture" and stage.tcGen!="bad" then rank=rank-5 end if;if len(stage.texMods)>0 then rank=rank-5 end if
  if stage.rgbGen!="identity" and stage.rgbGen!="identitylighting" then rank=rank-3 end if;return rank
end function
/// Updates `shader.stages` in `mq3.renderer.shader_runtime.vertexLightingCollapse`; returns `best`.
/// @param shader Mutable record or buffer; this call updates `shader.stages`.
/// @param lightmapIndex Input tested by `lightmapIndex==LIGHTMAP_NONE`.
function vertexLightingCollapse(shader,lightmapIndex)
  if shader==void or len(shader.stages)==0 then return void end if;best=shader.stages[0]
  if shader.sort==SS_OPAQUE then rank=-999999;for each stage in shader.stages current=stageRank(stage);if current>rank then best=stage;rank=current end if end for;best.blendSrc=0;best.blendDst=0;best.depthWrite=true;best.stateBits=shaderParser.GLS_DEPTHMASK_TRUE;if lightmapIndex==LIGHTMAP_NONE then best.rgbGen="lightingdiffuse" else best.rgbGen="exactvertex" end if;best.alphaGen="skip"
  else
    if best.isLightmap and len(shader.stages)>1 then best=shader.stages[1] end if
    if best.rgbGen=="oneminusentity" then best.rgbGen="identitylighting" end if
  end if
  shader.stages=[best];return best
end function

/// Computes `computeStageIteratorFunc` from `"generic"` using `mq3.renderer.shader_runtime.has`, `and`.
/// @param shader Record providing `shader.surfaceParms`, `shader.stages`, `shader.polygonOffset`, `shader.deforms`.
/// @param collapse Record providing `collapse.collapsed`, `collapse.environment`.
/// @param ignoreFastPath Input tested by `ignoreFastPath`.
function computeStageIteratorFunc(shader,collapse,ignoreFastPath)
  if shader==void then return "generic" end if;if has(shader.surfaceParms,"sky") then return "sky" end if;if ignoreFastPath then return "generic" end if
  if len(shader.stages)==1 then stage=shader.stages[0]
    if stage.rgbGen=="lightingdiffuse" and (stage.alphaGen=="identity" or stage.alphaGen=="skip") and (stage.tcGen=="texture" or stage.tcGen=="bad") and not shader.polygonOffset and len(shader.deforms)==0 and not collapse.collapsed then return "vertexLitTexture" end if
    if collapse.collapsed and collapse.environment!="" and stage.rgbGen=="identity" and stage.alphaGen=="identity" and len(shader.deforms)==0 and not shader.polygonOffset then return "lightmappedMultitexture" end if
  end if;return "generic"
end function

/// Builds `mq3.renderer.shader_runtime.PermanentShader` after updating `shader.sort`, `stage.tcGen`, `shader.stages`.
/// @param state Record providing `state.detailTextures`, `state.vertexLight`, `state.multitexture`, `state.textureEnvAdd`, `state.ignoreFastPath`.
/// @param shader Initial value for `mq3.renderer.shader_runtime.PermanentShader.shader`.
/// @param lightmapIndex Value forwarded as `lightmapIndex` to `mq3.renderer.shader_runtime.vertexLightingCollapse`.
/// @param mipRawImage Initial value for `mq3.renderer.shader_runtime.PermanentShader.mipRawImage`.
/// @param image Initial value for `mq3.renderer.shader_runtime.PermanentShader.image`.
/// @param explicit Initial value for `mq3.renderer.shader_runtime.PermanentShader.explicitlyDefined`.
function finishShader(state,shader,lightmapIndex,mipRawImage,image,explicit)
  if shader==void then return void end if
  if has(shader.surfaceParms,"sky") then shader.sort=SS_ENVIRONMENT end if;if shader.polygonOffset and shader.sort==0.0 then shader.sort=SS_DECAL end if
  stages=[];hasLightmap=false
  for each stage in shader.stages
    if stage.active and len(stage.images)>0 and (state.detailTextures or not stage.detail) then
      if stage.isLightmap then
        if stage.tcGen=="bad" then stage.tcGen="lightmap" end if
        hasLightmap=true
      else
        if stage.tcGen=="bad" then stage.tcGen="texture" end if
      end if
      if stageBlend(stage)!=0 and shader.sort==0.0 then if stage.depthWrite then shader.sort=SS_SEE_THROUGH else shader.sort=SS_BLEND0 end if end if;stages=stages+[stage]
    end if
  end for;shader.stages=stages;if shader.sort==0.0 then shader.sort=SS_OPAQUE end if
  vertex=false;if len(shader.stages)>1 and state.vertexLight then vertexLightingCollapse(shader,lightmapIndex);vertex=true;hasLightmap=false end if
  collapse=collapseMultitexture(shader,state.multitexture,state.textureEnvAdd)
  passes=len(shader.stages);if collapse.collapsed then passes=passes-1 end if;if passes==0 then shader.sort=SS_FOG end if
  effective=lightmapIndex;if effective>=0 and not hasLightmap then effective=LIGHTMAP_NONE end if
  iteratorName=computeStageIteratorFunc(shader,collapse,state.ignoreFastPath)
  return PermanentShader(-1,shader.name,effective,mipRawImage,shader,image,false,explicit,false,iteratorName,collapse,vertex,passes,-1,shader.name,"")
end function

/// Returns `0` from `mq3.renderer.shader_runtime.fixRenderCommandList`; earlier branches return `state.commandFixFn(state.context,newShader)`.
/// @param state Record providing `state.commandFixFn`, `state.context`.
/// @param newShader Argument 2 supplied to `state.commandFixFn`.
function fixRenderCommandList(state,newShader) if state!=void and state.commandFixFn!=void then return state.commandFixFn(state.context,newShader) end if;return 0 end function
/// Updates `state.sorted`, `state.sorted[position].sortedIndex` in `mq3.renderer.shader_runtime.sortNewShader`; returns `index`.
/// @param state Mutable record or buffer; this call updates `state.sorted`, `state.sorted[position].sortedIndex`.
/// @param record Record providing `record.shader`.
function sortNewShader(state,record)
  index=len(state.sorted);while index>0 and state.sorted[index-1].shader.sort>record.shader.sort index=index-1 end while
  values=[];if len(state.sorted)>0 then for position=0 to len(state.sorted)-1 if position==index then values=values+[record] end if;values=values+[state.sorted[position]] end for end if;if index==len(state.sorted) then values=values+[record] end if;state.sorted=values
  for position=0 to len(state.sorted)-1 state.sorted[position].sortedIndex=position end for;fixRenderCommandList(state,index);return index
end function
/// Updates `record.handle`, `state.shaders`, `state.assets`, `state.kinds` in `mq3.renderer.shader_runtime.generatePermanentShader`; returns `record`.
/// @param state Mutable record or buffer; this call updates `state.shaders`, `state.assets`, `state.kinds`.
/// @param record Mutable record or buffer; this call updates `record.handle`.
function generatePermanentShader(state,record)
  if state==void or record==void then return void end if;record.handle=len(state.shaders);state.shaders=state.shaders+[record];state.assets=state.assets+[record.name];state.kinds=state.kinds+["shader"];sortNewShader(state,record);return record
end function

/// Returns `void` from `mq3.renderer.shader_runtime.findLoaded`; earlier branches return `void`, `item`.
/// @param state Record providing `state.shaders`.
/// @param name Value forwarded as `b` to `mq3.renderer.shader_runtime.sameName`.
/// @param lightmapIndex Input used by `for each item in state.shaders if sameName(item.name,name) and (item.lightmapIndex==lightmapIndex or item.defaultShader) then return item`.
function findLoaded(state,name,lightmapIndex)
  if state==void then return void end if;for each item in state.shaders if sameName(item.name,name) and (item.lightmapIndex==lightmapIndex or item.defaultShader) then return item end if end for;return void
end function
/// Returns `state.loadImageFn(state.context,name,mipRawImage)` from `mq3.renderer.shader_runtime.loadImage`; earlier branches return `void`.
/// @param state Record providing `state.loadImageFn`, `state.context`.
/// @param name Argument 2 supplied to `state.loadImageFn`.
/// @param mipRawImage Argument 3 supplied to `state.loadImageFn`.
function loadImage(state,name,mipRawImage) if state==void or state.loadImageFn==void then return void end if;return state.loadImageFn(state.context,name,mipRawImage) end function
/// Builds `stage.images`, `stage.rgbGen`, `stage.alphaGen`, `stage.depthWrite`, `stage.blendSrc` in `mq3.renderer.shader_runtime.implicitShader`; returns `shader`.
/// @param name Value forwarded as `name` to `mq3.renderer.shader_runtime.stripExtension`.
/// @param lightmapIndex Input tested by `lightmapIndex==LIGHTMAP_NONE`.
/// @param image Input used by `stage.images=[image]`.
function implicitShader(name,lightmapIndex,image)
  shader=shaderParser.Shader(stripExtension(name),[],0.0,"front",[],false,false,false,false,0.0,0.0,[],[0.0,0.0,0.0],0.0,[],512.0);stage=shaderParser.blankStage();stage.images=[image]
  if lightmapIndex==LIGHTMAP_NONE then stage.rgbGen="lightingdiffuse"
  else if lightmapIndex==LIGHTMAP_BY_VERTEX then stage.rgbGen="exactvertex";stage.alphaGen="skip"
  else if lightmapIndex==LIGHTMAP_2D then stage.rgbGen="vertex";stage.alphaGen="vertex";stage.depthWrite=false;stage.blendSrc=shaderParser.GLS_SRCBLEND_SRC_ALPHA;stage.blendDst=shaderParser.GLS_DSTBLEND_ONE_MINUS_SRC_ALPHA;stage.stateBits=stage.blendSrc|stage.blendDst
  else if lightmapIndex==LIGHTMAP_WHITEIMAGE then stage.rgbGen="identitylighting"
  else stage.rgbGen="identity" end if;shader.stages=[stage];return shader
end function
/// Builds `record.defaultShader` in `mq3.renderer.shader_runtime.r_FindShader`; returns `generatePermanentShader(state,record)`.
/// @param state Record providing `state.numLightmaps`, `state.index`.
/// @param name Value forwarded as `name` to `mq3.renderer.shader_runtime.stripExtension`.
/// @param lightmapIndex Value forwarded as `lightmapIndex` to `mq3.renderer.shader_runtime.findLoaded`.
/// @param mipRawImage Value forwarded as `mipRawImage` to `mq3.renderer.shader_runtime.finishShader`.
function r_FindShader(state,name,lightmapIndex,mipRawImage)
  if state==void or name==void or name=="" then return r_FindShaderByName(state,"<default>") end if;if lightmapIndex>=state.numLightmaps and lightmapIndex>=0 then lightmapIndex=LIGHTMAP_BY_VERTEX end if
  stripped=stripExtension(name);loaded=findLoaded(state,stripped,lightmapIndex);if loaded!=void then return loaded end if
  entry=findShaderInShaderText(state,stripped)
  if entry!=void then
    record=void;shader=shaderParser.parseIndexed(state.index,stripped)
    if shader is error then fallback=implicitShader(stripped,lightmapIndex,void);record=finishShader(state,fallback,lightmapIndex,mipRawImage,void,false);record.defaultShader=true
    else record=finishShader(state,shader,lightmapIndex,mipRawImage,void,true) end if
    return generatePermanentShader(state,record)
  end if
  image=loadImage(state,name,mipRawImage);shader=implicitShader(stripped,lightmapIndex,image);record=finishShader(state,shader,lightmapIndex,mipRawImage,image,false);if image==void then record.defaultShader=true end if;return generatePermanentShader(state,record)
end function
/// Returns `void` from `mq3.renderer.shader_runtime.r_FindShaderByName`; earlier branches return `void`, `item`, `state.shaders[0]`.
/// @param state Record providing `state.shaders`.
/// @param name Value forwarded as `b` to `mq3.renderer.shader_runtime.sameName`.
function r_FindShaderByName(state,name)
  if state==void then return void end if;for each item in state.shaders if sameName(item.name,name) then return item end if end for;if len(state.shaders)>0 then return state.shaders[0] end if;return void
end function
/// Builds `record.defaultShader` in `mq3.renderer.shader_runtime.re_RegisterShaderFromImage`; returns `record.handle`.
/// @param state Value forwarded as `state` to `mq3.renderer.shader_runtime.findLoaded`.
/// @param name Value forwarded as `name` to `mq3.renderer.shader_runtime.findLoaded`.
/// @param lightmapIndex Value forwarded as `lightmapIndex` to `mq3.renderer.shader_runtime.findLoaded`.
/// @param image Value forwarded as `image` to `mq3.renderer.shader_runtime.implicitShader`.
/// @param mipRawImage Value forwarded as `mipRawImage` to `mq3.renderer.shader_runtime.finishShader`.
function re_RegisterShaderFromImage(state,name,lightmapIndex,image,mipRawImage)
  loaded=findLoaded(state,name,lightmapIndex);if loaded!=void then return loaded.handle end if;shader=implicitShader(name,lightmapIndex,image);record=finishShader(state,shader,lightmapIndex,mipRawImage,image,false);if image==void then record.defaultShader=true end if;generatePermanentShader(state,record);if record.defaultShader then return 0 end if;return record.handle
end function
/// Returns `record.handle` from `mq3.renderer.shader_runtime.re_RegisterShaderNoMip`; earlier branches return `0`.
/// @param state Value forwarded as `state` to `mq3.renderer.shader_runtime.r_FindShader`.
/// @param name Value forwarded as `name` to `mq3.renderer.shader_runtime.r_FindShader`.
function re_RegisterShaderNoMip(state,name) record=r_FindShader(state,name,LIGHTMAP_2D,false);if record==void or record.defaultShader then return 0 end if;return record.handle end function

/// Builds `record.remappedName`, `record.timeOffset` in `mq3.renderer.shader_runtime.r_RemapShader`; returns `changed`.
/// @param state Record providing `state.remaps`, `state.assets`, `state.kinds`, `state.shaders`.
/// @param oldName Argument 4 supplied to `mq3.renderer.shader_remap.apply`.
/// @param newName Value assigned to `record.remappedName`.
/// @param timeOffset Value assigned to `record.timeOffset`.
function r_RemapShader(state,oldName,newName,timeOffset)
  changed=shaderRemap.apply(state.remaps,state.assets,state.kinds,oldName,newName,timeOffset)
  for each record in state.shaders if sameName(record.name,oldName) then record.remappedName=newName;record.timeOffset=timeOffset end if end for;return changed
end function
/// Formats registered shaders with lightmap, multitexture, explicit-definition, iterator, and fallback markers.
/// @param state Record providing `state.shaders`, `state.sorted`.
/// @param sorted Input tested by `sorted`.
function r_ShaderList_f(state,sorted)
  lines=[];values=state.shaders;if sorted then values=state.sorted end if
  for each record in values marker="";if record.lightmapIndex>=0 then marker=marker+"L " end if;if record.collapse.collapsed then marker=marker+"MT("+record.collapse.environment+") " end if;if record.explicitlyDefined then marker=marker+"E " end if;marker=marker+record.iteratorName+" : "+record.name;if record.defaultShader then marker=marker+" (DEFAULTED)" end if;lines=lines+[marker] end for;return lines
end function

/// Updates `state.text`, `state.index` in `mq3.renderer.shader_runtime.scanAndLoadShaderFiles`; returns `len(state.index.entries)`.
/// @param state Mutable record or buffer; this call updates `state.text`, `state.index`.
/// @param sources Indexed input read at `index`.
function scanAndLoadShaderFiles(state,sources)
  text="";index=len(sources)-1;while index>=0 text=text+"\n"+sources[index].text;index=index-1 end while;state.text=text;state.index=shaderIndex.build(text);return len(state.index.entries)
end function
/// Updates `state.shaders`, `state.sorted`, `state.assets`, `state.kinds` in `mq3.renderer.shader_runtime.createInternalShaders`; returns `2`.
/// @param state Mutable record or buffer; this call updates `state.shaders`, `state.sorted`, `state.assets`, `state.kinds`.
/// @param defaultImage Value forwarded as `image` to `mq3.renderer.shader_runtime.implicitShader`.
function createInternalShaders(state,defaultImage)
  state.shaders=[];state.sorted=[];state.assets=[];state.kinds=[]
  base=implicitShader("<default>",LIGHTMAP_NONE,defaultImage);defaultRecord=finishShader(state,base,LIGHTMAP_NONE,true,defaultImage,false);defaultRecord.internal=true;defaultRecord.defaultShader=defaultImage==void;generatePermanentShader(state,defaultRecord)
  // The released C code intentionally reuses the initialized default stage
  // while changing the shader marker and sort for the stencil shadow entry.
  shadow=implicitShader("<stencil shadow>",LIGHTMAP_NONE,defaultImage);shadow.sort=11.0;shadowRecord=finishShader(state,shadow,LIGHTMAP_NONE,true,defaultImage,false);shadowRecord.internal=true;generatePermanentShader(state,shadowRecord);return 2
end function
/// Returns `3` from `mq3.renderer.shader_runtime.createExternalShaders`.
/// @param state Value forwarded as `state` to `mq3.renderer.shader_runtime.r_FindShader`.
function createExternalShaders(state) r_FindShader(state,"projectionShadow",LIGHTMAP_NONE,true);r_FindShader(state,"flareShader",LIGHTMAP_NONE,true);r_FindShader(state,"sun",LIGHTMAP_NONE,true);return 3 end function
/// Updates `state.initialized` in `mq3.renderer.shader_runtime.r_InitShaders`; returns `count`.
/// @param state Mutable record or buffer; this call updates `state.initialized`.
/// @param sources Value forwarded as `sources` to `mq3.renderer.shader_runtime.scanAndLoadShaderFiles`.
/// @param defaultImage Value forwarded as `defaultImage` to `mq3.renderer.shader_runtime.createInternalShaders`.
function r_InitShaders(state,sources,defaultImage)
  createInternalShaders(state,defaultImage);count=scanAndLoadShaderFiles(state,sources);createExternalShaders(state);state.initialized=true;return count
end function
