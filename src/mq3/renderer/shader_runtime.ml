// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native runtime facade for code/renderer/tr_shader.c.
package mq3.renderer.shader_runtime

import mq3.renderer.shader_index as shaderIndex
import mq3.renderer.shader_parser as shaderParser
import mq3.renderer.shader_remap as shaderRemap
import mq3.shared.parser as parser
import std.string as strings

const LIGHTMAP_NONE=-1
const LIGHTMAP_BY_VERTEX=-2
const LIGHTMAP_2D=-3
const LIGHTMAP_WHITEIMAGE=-4
const SS_PORTAL=1.0
const SS_ENVIRONMENT=2.0
const SS_OPAQUE=3.0
const SS_DECAL=4.0
const SS_SEE_THROUGH=5.0
const SS_BLEND0=9.0
const SS_FOG=7.0

struct ShaderSource name text end struct
struct SkyParms outerBox cloudHeight innerBox end struct
struct CollapseResult collapsed environment blend first second end struct
struct PermanentShader handle name lightmapIndex mipRawImage shader image defaultShader explicitlyDefined internal iteratorName collapse vertexCollapsed passes sortedIndex remappedName timeOffset end struct
struct State text index shaders sorted remaps assets kinds context loadImageFn commandFixFn numLightmaps detailTextures vertexLight ignoreFastPath textureEnvAdd multitexture initialized warnings end struct

function lower(value) if value==void then return "" end if;return strings.toLowerAscii(value) end function
function sameName(a,b) return stringEqualsIgnoreCaseAscii(stripExtension(a),stripExtension(b)) end function
function stripExtension(name)
  if name==void then return "" end if;data=bytes(name);last=-1
  for index=0 to len(data)-1 if data[index]==46 then last=index else if data[index]==47 or data[index]==92 then last=-1 end if end for
  if last<0 then return name end if;return decode(slice(data,0,last))
end function
function has(values,value) for each item in values if item==value then return true end if end for;return false end function
function waveEqual(a,b) return a.func==b.func and a.base==b.base and a.amplitude==b.amplitude and a.phase==b.phase and a.frequency==b.frequency end function

function create(context,loadImageFn,commandFixFn)
  empty=shaderIndex.build("")
  return State("",empty,[],[],shaderRemap.create(),[],[],context,loadImageFn,commandFixFn,0,true,false,false,true,true,false,[])
end function

// Parser and shader-text entry points -----------------------------------
function generateHashValue(name,size) return shaderIndex.hashValue(name,size) end function
function findShaderInShaderText(state,name) if state==void then return void end if;return shaderIndex.find(state.index,name) end function
function nameToAFunc(name) return shaderParser.nameToAFunc(name) end function
function nameToSrcBlendMode(name) return shaderParser.nameToSrcBlendMode(name) end function
function nameToDstBlendMode(name) return shaderParser.nameToDstBlendMode(name) end function
function nameToGenFunc(name) return shaderParser.nameToGenFunc(name) end function
function parseVector(state,count) return shaderParser.parseVector(state,count) end function
function parseWaveForm(state) return shaderParser.parseWave(state) end function
function parseTexMod(tokens) return shaderParser.parseTexMod(tokens) end function
function parseStage(state) return shaderParser.parseStage(state) end function
function parseDeform(state) return shaderParser.parseDeform(state) end function
function parseSkyParms(outerBox,cloudHeight,innerBox) return SkyParms(outerBox,cloudHeight,innerBox) end function
function parseSort(shader,value) shader.sort=shaderParser.sortValue(value);return shader.sort end function
function parseSurfaceParm(shader,value) name=lower(value);if not has(shader.surfaceParms,name) then shader.surfaceParms=shader.surfaceParms+[name] end if;return name end function
function parseShader(text,name) return shaderParser.parseText(text,name) end function

// Original static tables exposed as deterministic native contracts.
function modes()
  return [[0,shaderParser.GLS_SRCBLEND_ZERO|shaderParser.GLS_DSTBLEND_SRC_COLOR,"modulate",0],
    [0,shaderParser.GLS_SRCBLEND_DST_COLOR|shaderParser.GLS_DSTBLEND_ZERO,"modulate",0],
    [shaderParser.GLS_SRCBLEND_DST_COLOR|shaderParser.GLS_DSTBLEND_ZERO,shaderParser.GLS_SRCBLEND_DST_COLOR|shaderParser.GLS_DSTBLEND_ZERO,"modulate",shaderParser.GLS_SRCBLEND_DST_COLOR|shaderParser.GLS_DSTBLEND_ZERO],
    [0,shaderParser.GLS_SRCBLEND_ONE|shaderParser.GLS_DSTBLEND_ONE,"add",0],
    [shaderParser.GLS_SRCBLEND_ONE|shaderParser.GLS_DSTBLEND_ONE,shaderParser.GLS_SRCBLEND_ONE|shaderParser.GLS_DSTBLEND_ONE,"add",shaderParser.GLS_SRCBLEND_ONE|shaderParser.GLS_DSTBLEND_ONE]]
end function
function valid(shader) return shader!=void and shader.name!="" and (len(shader.stages)>0 or has(shader.surfaceParms,"fog")) end function

function stageBlend(stage) return stage.blendSrc|stage.blendDst end function
function collapseMode(first,second)
  a=stageBlend(first);b=stageBlend(second);modA=shaderParser.GLS_SRCBLEND_ZERO|shaderParser.GLS_DSTBLEND_SRC_COLOR;modB=shaderParser.GLS_SRCBLEND_DST_COLOR|shaderParser.GLS_DSTBLEND_ZERO;add=shaderParser.GLS_SRCBLEND_ONE|shaderParser.GLS_DSTBLEND_ONE
  if (a==0 and (b==modA or b==modB)) or ((a==modA or a==modB) and (b==modA or b==modB)) then return "modulate" end if
  if (a==0 and b==add) or (a==add and b==add) then return "add" end if
  return ""
end function
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

function stageRank(stage)
  rank=0;if stage.isLightmap then rank=rank-100 end if;if stage.tcGen!="texture" and stage.tcGen!="bad" then rank=rank-5 end if;if len(stage.texMods)>0 then rank=rank-5 end if
  if stage.rgbGen!="identity" and stage.rgbGen!="identitylighting" then rank=rank-3 end if;return rank
end function
function vertexLightingCollapse(shader,lightmapIndex)
  if shader==void or len(shader.stages)==0 then return void end if;best=shader.stages[0]
  if shader.sort==SS_OPAQUE then rank=-999999;for each stage in shader.stages current=stageRank(stage);if current>rank then best=stage;rank=current end if end for;best.blendSrc=0;best.blendDst=0;best.depthWrite=true;best.stateBits=shaderParser.GLS_DEPTHMASK_TRUE;if lightmapIndex==LIGHTMAP_NONE then best.rgbGen="lightingdiffuse" else best.rgbGen="exactvertex" end if;best.alphaGen="skip"
  else
    if best.isLightmap and len(shader.stages)>1 then best=shader.stages[1] end if
    if best.rgbGen=="oneminusentity" then best.rgbGen="identitylighting" end if
  end if
  shader.stages=[best];return best
end function

function computeStageIteratorFunc(shader,collapse,ignoreFastPath)
  if shader==void then return "generic" end if;if has(shader.surfaceParms,"sky") then return "sky" end if;if ignoreFastPath then return "generic" end if
  if len(shader.stages)==1 then stage=shader.stages[0]
    if stage.rgbGen=="lightingdiffuse" and (stage.alphaGen=="identity" or stage.alphaGen=="skip") and (stage.tcGen=="texture" or stage.tcGen=="bad") and not shader.polygonOffset and len(shader.deforms)==0 and not collapse.collapsed then return "vertexLitTexture" end if
    if collapse.collapsed and collapse.environment!="" and stage.rgbGen=="identity" and stage.alphaGen=="identity" and len(shader.deforms)==0 and not shader.polygonOffset then return "lightmappedMultitexture" end if
  end if;return "generic"
end function

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

function fixRenderCommandList(state,newShader) if state!=void and state.commandFixFn!=void then return state.commandFixFn(state.context,newShader) end if;return 0 end function
function sortNewShader(state,record)
  index=len(state.sorted);while index>0 and state.sorted[index-1].shader.sort>record.shader.sort index=index-1 end while
  values=[];if len(state.sorted)>0 then for position=0 to len(state.sorted)-1 if position==index then values=values+[record] end if;values=values+[state.sorted[position]] end for end if;if index==len(state.sorted) then values=values+[record] end if;state.sorted=values
  for position=0 to len(state.sorted)-1 state.sorted[position].sortedIndex=position end for;fixRenderCommandList(state,index);return index
end function
function generatePermanentShader(state,record)
  if state==void or record==void then return void end if;record.handle=len(state.shaders);state.shaders=state.shaders+[record];state.assets=state.assets+[record.name];state.kinds=state.kinds+["shader"];sortNewShader(state,record);return record
end function

function findLoaded(state,name,lightmapIndex)
  if state==void then return void end if;for each item in state.shaders if sameName(item.name,name) and (item.lightmapIndex==lightmapIndex or item.defaultShader) then return item end if end for;return void
end function
function loadImage(state,name,mipRawImage) if state==void or state.loadImageFn==void then return void end if;return state.loadImageFn(state.context,name,mipRawImage) end function
function implicitShader(name,lightmapIndex,image)
  shader=shaderParser.Shader(stripExtension(name),[],0.0,"front",[],false,false,false,false,0.0,0.0,[],[0.0,0.0,0.0],0.0,[],512.0);stage=shaderParser.blankStage();stage.images=[image]
  if lightmapIndex==LIGHTMAP_NONE then stage.rgbGen="lightingdiffuse"
  else if lightmapIndex==LIGHTMAP_BY_VERTEX then stage.rgbGen="exactvertex";stage.alphaGen="skip"
  else if lightmapIndex==LIGHTMAP_2D then stage.rgbGen="vertex";stage.alphaGen="vertex";stage.depthWrite=false;stage.blendSrc=shaderParser.GLS_SRCBLEND_SRC_ALPHA;stage.blendDst=shaderParser.GLS_DSTBLEND_ONE_MINUS_SRC_ALPHA;stage.stateBits=stage.blendSrc|stage.blendDst
  else if lightmapIndex==LIGHTMAP_WHITEIMAGE then stage.rgbGen="identitylighting"
  else stage.rgbGen="identity" end if;shader.stages=[stage];return shader
end function
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
function r_FindShaderByName(state,name)
  if state==void then return void end if;for each item in state.shaders if sameName(item.name,name) then return item end if end for;if len(state.shaders)>0 then return state.shaders[0] end if;return void
end function
function re_RegisterShaderFromImage(state,name,lightmapIndex,image,mipRawImage)
  loaded=findLoaded(state,name,lightmapIndex);if loaded!=void then return loaded.handle end if;shader=implicitShader(name,lightmapIndex,image);record=finishShader(state,shader,lightmapIndex,mipRawImage,image,false);if image==void then record.defaultShader=true end if;generatePermanentShader(state,record);if record.defaultShader then return 0 end if;return record.handle
end function
function re_RegisterShaderNoMip(state,name) record=r_FindShader(state,name,LIGHTMAP_2D,false);if record==void or record.defaultShader then return 0 end if;return record.handle end function

function r_RemapShader(state,oldName,newName,timeOffset)
  changed=shaderRemap.apply(state.remaps,state.assets,state.kinds,oldName,newName,timeOffset)
  for each record in state.shaders if sameName(record.name,oldName) then record.remappedName=newName;record.timeOffset=timeOffset end if end for;return changed
end function
function r_ShaderList_f(state,sorted)
  lines=[];values=state.shaders;if sorted then values=state.sorted end if
  for each record in values marker="";if record.lightmapIndex>=0 then marker=marker+"L " end if;if record.collapse.collapsed then marker=marker+"MT("+record.collapse.environment+") " end if;if record.explicitlyDefined then marker=marker+"E " end if;marker=marker+record.iteratorName+" : "+record.name;if record.defaultShader then marker=marker+" (DEFAULTED)" end if;lines=lines+[marker] end for;return lines
end function

function scanAndLoadShaderFiles(state,sources)
  text="";index=len(sources)-1;while index>=0 text=text+"\n"+sources[index].text;index=index-1 end while;state.text=text;state.index=shaderIndex.build(text);return len(state.index.entries)
end function
function createInternalShaders(state,defaultImage)
  state.shaders=[];state.sorted=[];state.assets=[];state.kinds=[]
  base=implicitShader("<default>",LIGHTMAP_NONE,defaultImage);defaultRecord=finishShader(state,base,LIGHTMAP_NONE,true,defaultImage,false);defaultRecord.internal=true;defaultRecord.defaultShader=defaultImage==void;generatePermanentShader(state,defaultRecord)
  // The released C code intentionally reuses the initialized default stage
  // while changing the shader marker and sort for the stencil shadow entry.
  shadow=implicitShader("<stencil shadow>",LIGHTMAP_NONE,defaultImage);shadow.sort=11.0;shadowRecord=finishShader(state,shadow,LIGHTMAP_NONE,true,defaultImage,false);shadowRecord.internal=true;generatePermanentShader(state,shadowRecord);return 2
end function
function createExternalShaders(state) r_FindShader(state,"projectionShadow",LIGHTMAP_NONE,true);r_FindShader(state,"flareShader",LIGHTMAP_NONE,true);r_FindShader(state,"sun",LIGHTMAP_NONE,true);return 3 end function
function r_InitShaders(state,sources,defaultImage)
  createInternalShaders(state,defaultImage);count=scanAndLoadShaderFiles(state,sources);createExternalShaders(state);state.initialized=true;return count
end function
