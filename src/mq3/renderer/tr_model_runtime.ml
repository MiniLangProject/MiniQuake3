// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native MiniLang facade for renderer/tr_model.c.
package mq3.renderer.tr_model_runtime

import mq3.compat.numeric as n
import mq3.format.md3 as md3
import mq3.format.pk3 as pk3
import mq3.renderer.md4_animation as animation
import mq3.renderer.model_tags as tags
import mq3.renderer.model_bounds as bounds
import std.string as strings

const MOD_BAD=0
const MOD_BRUSH=1
const MOD_MESH=2
const MOD_MD4=3
const MAX_MOD_KNOWN=1024
const MAX_QPATH=64
const MD3_MAX_LODS=3
const MD4_IDENT=0x34504449
const MD4_VERSION=1
const MD4_MAX_BONES=128
const SHADER_MAX_VERTEXES=1000
const SHADER_MAX_INDEXES=6000

/// Data record for `mq3.renderer.tr_model_runtime.Md4Lod`; groups `surfaces`.
struct Md4Lod surfaces end struct
/// Data record for `mq3.renderer.tr_model_runtime.Md4Model`; groups `name`, `numFrames`, `numBones`, `frames`, `lods`, `bounds`, and 1 further field.
struct Md4Model name numFrames numBones frames lods bounds dataSize end struct
/// Data record for `mq3.renderer.tr_model_runtime.Model`; groups `name`, `type`, `index`, `dataSize`, `brushBounds`, `md3`, and 2 further fields.
struct Model name type index dataSize brushBounds md3 md4 numLods end struct
/// Data record for `mq3.renderer.tr_model_runtime.State`; groups `models`, `numModels`, `maxModels`, `archives`, `registered`, `viewCluster`, and 6 further fields.
struct State models numModels maxModels archives registered viewCluster initCount syncCount flareClears sceneClears stretchPrimes glConfig end struct
/// Data record for `mq3.renderer.tr_model_runtime.ModelListEntry`; groups `dataSize`, `lods`, `name`.
struct ModelListEntry dataSize lods name end struct
/// Data record for `mq3.renderer.tr_model_runtime.ModelList`; groups `entries`, `total`.
struct ModelList entries total end struct

/// Creates error `7790` with message `"tr_model: "+text`.
/// @param text Input used in the result expression `error(7790,"tr_model: "+text)`.
function fail(text) return error(7790,"tr_model: "+text) end function
/// Returns `value` from `mq3.renderer.tr_model_runtime.i32`; earlier branches return `fail("truncated integer")`.
/// @param data Argument 1 supplied to `mq3.compat.numeric.readI32`.
/// @param offset Argument 2 supplied to `mq3.compat.numeric.readI32`.
function i32(data,offset) value=n.readI32(data,offset);if value is error then return fail("truncated integer") end if;return value end function
/// Returns `n.bitsFloat(value)` from `mq3.renderer.tr_model_runtime.f32`; earlier branches return `fail("truncated float")`.
/// @param data Argument 1 supplied to `mq3.compat.numeric.readU32`.
/// @param offset Argument 2 supplied to `mq3.compat.numeric.readU32`.
function f32(data,offset) value=n.readU32(data,offset);if value is error then return fail("truncated float") end if;return n.bitsFloat(value) end function
/// Returns `[f32(data,offset),f32(data,offset+4),f32(data,offset+8)]` for `mq3.renderer.tr_model_runtime.vec3`.
/// @param data Value forwarded as `data` to `mq3.renderer.tr_model_runtime.f32`.
/// @param offset Value forwarded as `offset` to `mq3.renderer.tr_model_runtime.f32`.
function vec3(data,offset) return [f32(data,offset),f32(data,offset+4),f32(data,offset+8)] end function
/// Returns `true` from `mq3.renderer.tr_model_runtime.span`; earlier branches return `fail("section outside model")`.
/// @param offset Input tested by `offset<0 or size<0 or offset>limit or size>limit-offset`.
/// @param size Input tested by `offset<0 or size<0 or offset>limit or size>limit-offset`.
/// @param limit Input tested by `offset<0 or size<0 or offset>limit or size>limit-offset`.
function span(offset,size,limit) if offset<0 or size<0 or offset>limit or size>limit-offset then return fail("section outside model") end if;return true end function
/// Returns `decode(slice(data,offset,length))` from `mq3.renderer.tr_model_runtime.fixedString`; earlier branches return `check`.
/// @param data Argument 1 supplied to `slice`.
/// @param offset Value forwarded as `offset` to `mq3.renderer.tr_model_runtime.span`.
/// @param capacity Value forwarded as `size` to `mq3.renderer.tr_model_runtime.span`.
function fixedString(data,offset,capacity) check=span(offset,capacity,len(data));if check is error then return check end if;length=0;while length<capacity and data[offset+length]!=0 length=length+1 end while;return decode(slice(data,offset,length)) end function
/// Constructs `mq3.renderer.tr_model_runtime.Model` with `name` = `""`, `type` = `MOD_BAD`, `dataSize` = `0`, `brushBounds` = `void` and the supplied remaining values.
/// @param index Initial value for `mq3.renderer.tr_model_runtime.Model.index`.
function emptyModel(index) return Model("",MOD_BAD,index,0,void,array(MD3_MAX_LODS,void),void,0) end function
/// Returns `state` from `mq3.renderer.tr_model_runtime.createState`.
/// @param archives Value used for `mq3.renderer.tr_model_runtime.State.archives`.
/// @param glConfig Value used for `mq3.renderer.tr_model_runtime.State.glConfig`.
function createState(archives,glConfig) state=State([],0,MAX_MOD_KNOWN,archives,false,-1,0,0,0,0,0,glConfig);R_ModelInit(state);return state end function

/// Updates `state.models`, `state.numModels` in `mq3.renderer.tr_model_runtime.R_AllocModel`; returns `value`.
/// @param state Mutable record or buffer; this call updates `state.models`, `state.numModels`.
function R_AllocModel(state)
  if state==void or state.numModels>=state.maxModels then return void end if
  value=emptyModel(state.numModels);state.models=state.models+[value];state.numModels=state.numModels+1;return value
end function
/// Returns `state.models[index]` from `mq3.renderer.tr_model_runtime.R_GetModelByHandle`; earlier branches return `void`, `state.models[0]`.
/// @param state Record providing `state.numModels`, `state.models`.
/// @param index Input tested by `index<1 or index>=state.numModels`.
function R_GetModelByHandle(state,index)
  if state==void or state.numModels<1 then return void end if
  if index<1 or index>=state.numModels then return state.models[0] end if;return state.models[index]
end function
/// Updates `state.models`, `state.numModels` in `mq3.renderer.tr_model_runtime.R_ModelInit`; returns `true`.
/// @param state Mutable record or buffer; this call updates `state.models`, `state.numModels`.
function R_ModelInit(state)
  if state==void then return fail("model state is required") end if
  state.models=[];state.numModels=0;value=R_AllocModel(state);if value==void then return fail("could not allocate null model") end if;value.type=MOD_BAD;return true
end function

/// Calls `mq3.format.md3.normalizeSurfaceNames` with `(value)` and returns its result.
/// @param value Argument 1 supplied to `mq3.format.md3.normalizeSurfaceNames`.
function normalizeSurfaceNames(value) return md3.normalizeSurfaceNames(value) end function
/// Updates `model.type`, `model.md3[lod]`, `model.dataSize` in `mq3.renderer.tr_model_runtime.R_LoadMD3`; returns `true`.
/// @param model Mutable record or buffer; this call updates `model.type`, `model.md3[lod]`, `model.dataSize`.
/// @param lod Input tested by `model==void or lod<0 or lod>=MD3_MAX_LODS`.
/// @param data Argument 1 supplied to `mq3.format.md3.load`.
/// @param name Input tested by `surface.mesh.numVerts>SHADER_MAX_VERTEXES`.
function R_LoadMD3(model,lod,data,name)
  if model==void or lod<0 or lod>=MD3_MAX_LODS then return fail("invalid MD3 destination") end if
  value=md3.load(data);if value is error then return value end if
  for each surface in value.surfaces
    if surface.mesh.numVerts>SHADER_MAX_VERTEXES then return fail(name+" has too many MD3 vertices") end if
    if surface.mesh.numTriangles*3>SHADER_MAX_INDEXES then return fail(name+" has too many MD3 indexes") end if
  end for
  normalizeSurfaceNames(value);model.type=MOD_MESH;model.md3[lod]=value;model.dataSize=model.dataSize+len(data);return true
end function

/// Updates `model.type`, `model.md4`, `model.dataSize` in `mq3.renderer.tr_model_runtime.R_LoadMD4`; returns `true`.
/// @param model Mutable record or buffer; this call updates `model.type`, `model.md4`, `model.dataSize`.
/// @param data Value forwarded as `data` to `mq3.renderer.tr_model_runtime.i32`.
/// @param name Unused compatibility argument retained by this entry point.
function R_LoadMD4(model,data,name)
  if model==void or data==void or typeof(data)!="bytes" or len(data)<100 then return fail("truncated MD4 header") end if
  if i32(data,0)!=MD4_IDENT then return fail("invalid MD4 signature") end if;if i32(data,4)!=MD4_VERSION then return fail("unsupported MD4 version") end if
  numFrames=i32(data,72);numBones=i32(data,76);ofsFrames=i32(data,84);numLods=i32(data,88);ofsLods=i32(data,92);ofsEnd=i32(data,96)
  if numFrames<1 then return fail("MD4 has no frames") end if;if numBones<0 or numBones>MD4_MAX_BONES then return fail("invalid MD4 bone count") end if;if numLods<0 then return fail("invalid MD4 LOD count") end if
  if ofsEnd<100 or ofsEnd>len(data) then return fail("invalid MD4 file end") end if
  frameSize=40+numBones*48;check=span(ofsFrames,numFrames*frameSize,ofsEnd);if check is error then return check end if
  frames=[];modelBounds=void
  for frameIndex=0 to numFrames-1
    at=ofsFrames+frameIndex*frameSize;mins=vec3(data,at);maxs=vec3(data,at+12);bones=[]
    if numBones>0 then for boneIndex=0 to numBones-1 rows=[];base=at+40+boneIndex*48;for row=0 to 2 rows=rows+[[f32(data,base+row*16),f32(data,base+row*16+4),f32(data,base+row*16+8),f32(data,base+row*16+12)]] end for;bones=bones+[animation.bone(rows)] end for end if
    frames=frames+[animation.frame(bones)];if frameIndex==0 then modelBounds=[mins,maxs] end if
  end for
  check=span(ofsLods,numLods*12,ofsEnd);if check is error then return check end if;lods=[];lodOffset=ofsLods
  if numLods>0 then for lodIndex=0 to numLods-1
    check=span(lodOffset,12,ofsEnd);if check is error then return check end if;surfaceCount=i32(data,lodOffset);surfaceOffset=i32(data,lodOffset+4);lodEnd=i32(data,lodOffset+8)
    if surfaceCount<0 or surfaceOffset<12 or lodEnd<12 or lodOffset+lodEnd>ofsEnd then return fail("invalid MD4 LOD") end if
    surfaces=[];current=lodOffset+surfaceOffset
    if surfaceCount>0 then for surfaceIndex=0 to surfaceCount-1
      check=span(current,168,lodOffset+lodEnd);if check is error then return check end if
      vertexCount=i32(data,current+140);ofsVerts=i32(data,current+144);triangleCount=i32(data,current+148);ofsTriangles=i32(data,current+152);surfaceEnd=i32(data,current+164)
      if vertexCount<0 or vertexCount>SHADER_MAX_VERTEXES or triangleCount<0 or triangleCount*3>SHADER_MAX_INDEXES or surfaceEnd<168 or current+surfaceEnd>lodOffset+lodEnd then return fail("invalid MD4 surface counts") end if
      triangles=[];if triangleCount>0 then for triangleIndex=0 to triangleCount-1 base=current+ofsTriangles+triangleIndex*12;check=span(base,12,current+surfaceEnd);if check is error then return check end if;for corner=0 to 2 index=i32(data,base+corner*4);if index<0 or index>=vertexCount then return fail("MD4 triangle index outside vertices") end if;triangles=triangles+[index] end for end for end if
      vertices=[];vertexOffset=current+ofsVerts
      if vertexCount>0 then for vertexIndex=0 to vertexCount-1
        check=span(vertexOffset,24,current+surfaceEnd);if check is error then return check end if;normal=vec3(data,vertexOffset);tex=[f32(data,vertexOffset+12),f32(data,vertexOffset+16)];weightCount=i32(data,vertexOffset+20);if weightCount<0 then return fail("negative MD4 weight count") end if;check=span(vertexOffset+24,weightCount*20,current+surfaceEnd);if check is error then return check end if
        weights=[];if weightCount>0 then for weightIndex=0 to weightCount-1 at=vertexOffset+24+weightIndex*20;boneIndex=i32(data,at);if boneIndex<0 or boneIndex>=numBones then return fail("MD4 bone index outside model") end if;weights=weights+[animation.weight(boneIndex,f32(data,at+4),vec3(data,at+8))] end for end if
        vertices=vertices+[animation.vertex(normal,tex,weights)];vertexOffset=vertexOffset+24+weightCount*20
      end for end if
      surfaces=surfaces+[animation.surface(0,triangles,vertices)];current=current+surfaceEnd
    end for end if
    if current>lodOffset+lodEnd then return fail("MD4 surface chain outside LOD") end if;lods=lods+[Md4Lod(surfaces)];lodOffset=lodOffset+lodEnd
  end for end if
  value=Md4Model(fixedString(data,8,64),numFrames,numBones,frames,lods,modelBounds,ofsEnd);model.type=MOD_MD4;model.md4=value;model.dataSize=model.dataSize+ofsEnd;return true
end function

/// Searches archives in reverse priority order and returns the first readable named asset, or void.
/// @param state Record providing `state.archives`.
/// @param name Argument 2 supplied to `mq3.format.pk3.read`.
function archiveRead(state,name)
  if state.archives==void then return void end if
  values=state.archives;if typeof(values)!="array" then values=[values] end if
  if len(values)>0 then for index=len(values)-1 to 0 data=try(pk3.read(values[index],name));if data is not error then return data end if end for end if;return void
end function
/// Returns `decode(slice(raw,0,dot))+"_"+str(lod)+".md3"` from `mq3.renderer.tr_model_runtime.lodName`; earlier branches return `name`.
/// @param name Argument 1 supplied to `bytes`.
/// @param lod Input tested by `lod==0`.
function lodName(name,lod)
  if lod==0 then return name end if;raw=bytes(name);dot=strings.lastIndexOf(name,".");if dot<0 then dot=len(raw) end if;return decode(slice(raw,0,dot))+"_"+str(lod)+".md3"
end function
/// Builds `model.name`, `model.numLods`, `model.type`, `model.md3[lod]` in `mq3.renderer.tr_model_runtime.RE_RegisterModel`; returns `model.index`.
/// @param state Record providing `state.numModels`, `state.models`.
/// @param name Value assigned to `model.name`.
function RE_RegisterModel(state,name)
  if state==void or name==void or name=="" or len(bytes(name))>=MAX_QPATH then return 0 end if
  if state.numModels>1 then for handle=1 to state.numModels-1 value=state.models[handle];if value.name==name then if value.type==MOD_BAD then return 0 end if;return handle end if end for end if
  model=R_AllocModel(state);if model==void then return 0 end if;model.name=name;model.numLods=0;loaded=0
  for lod=MD3_MAX_LODS-1 to 0
    data=archiveRead(state,lodName(name,lod));if data==void then continue end if;ident=i32(data,0);ok=false
    if ident==MD4_IDENT then ok=R_LoadMD4(model,data,name) else if ident==md3.MD3_IDENT then ok=R_LoadMD3(model,lod,data,name) else ok=fail("unknown model file id") end if
    if ok is error then if lod==0 then model.type=MOD_BAD;return 0 else break end if end if;model.numLods=model.numLods+1;loaded=loaded+1;if model.type==MOD_MD4 then break end if
  end for
  if loaded==0 then model.type=MOD_BAD;return 0 end if
  // Fill missing lower slots from the nearest loaded higher LOD, matching the
  // renderer's runtime-lodbias safety aliases.
  nearest=void;for lod=MD3_MAX_LODS-1 to 0 if model.md3[lod]!=void then nearest=model.md3[lod] else if nearest!=void then model.md3[lod]=nearest;model.numLods=model.numLods+1 end if end for
  return model.index
end function

/// Computes `tagModel` from `tags.md3(frames,first[0],first[1])` using `mq3.renderer.model_tags.tag`, `mq3.renderer.model_bounds.md3`, `mq3.renderer.model_tags.md3`.
/// @param value Record providing `value.tags`.
function tagModel(value)
  if value==void then return void end if;frames=[];for each sourceFrame in value.tags entries=[];for each item in sourceFrame entries=entries+[tags.tag(item.name,item.origin,item.axis)] end for;frames=frames+[entries] end for
  first=bounds.md3(value);return tags.md3(frames,first[0],first[1])
end function
/// Returns `tags.getTag(tagModel(model.md3[0]),frame,tagName)` from `mq3.renderer.tr_model_runtime.R_GetTag`; earlier branches return `void`.
/// @param model Record providing `model.md3`.
/// @param frame Argument 2 supplied to `mq3.renderer.model_tags.getTag`.
/// @param tagName Argument 3 supplied to `mq3.renderer.model_tags.getTag`.
function R_GetTag(model,frame,tagName) if model==void or model.md3[0]==void then return void end if;return tags.getTag(tagModel(model.md3[0]),frame,tagName) end function
/// Returns `tags.lerpTag(tags.model(void,tagModel(model.md3[0])),startFrame,endFrame,frac,tagName)` from `mq3.renderer.tr_model_runtime.R_LerpTag`; earlier branches return `tags.missingOrientation()`.
/// @param state Value forwarded as `state` to `mq3.renderer.tr_model_runtime.R_GetModelByHandle`.
/// @param handle Value forwarded as `index` to `mq3.renderer.tr_model_runtime.R_GetModelByHandle`.
/// @param startFrame Argument 2 supplied to `mq3.renderer.model_tags.lerpTag`.
/// @param endFrame Argument 3 supplied to `mq3.renderer.model_tags.lerpTag`.
/// @param frac Argument 4 supplied to `mq3.renderer.model_tags.lerpTag`.
/// @param tagName Argument 5 supplied to `mq3.renderer.model_tags.lerpTag`.
function R_LerpTag(state,handle,startFrame,endFrame,frac,tagName)
  model=R_GetModelByHandle(state,handle);if model==void or model.md3[0]==void then return tags.missingOrientation() end if;return tags.lerpTag(tags.model(void,tagModel(model.md3[0])),startFrame,endFrame,frac,tagName)
end function
/// Computes `R_ModelBounds` from `bounds.md3(model.md3[0])` using `mq3.renderer.tr_model_runtime.R_GetModelByHandle`, `mq3.renderer.model_tags.modelBounds`, `mq3.renderer.model_tags.model`.
/// @param state Value forwarded as `state` to `mq3.renderer.tr_model_runtime.R_GetModelByHandle`.
/// @param handle Value forwarded as `index` to `mq3.renderer.tr_model_runtime.R_GetModelByHandle`.
function R_ModelBounds(state,handle)
  model=R_GetModelByHandle(state,handle);if model==void then return [[0.0,0.0,0.0],[0.0,0.0,0.0]] end if
  if model.brushBounds!=void then return tags.modelBounds(tags.model(model.brushBounds,void)) end if;if model.md3[0]==void then return [[0.0,0.0,0.0],[0.0,0.0,0.0]] end if;return bounds.md3(model.md3[0])
end function
/// Builds `mq3.renderer.tr_model_runtime.ModelList` for `mq3.renderer.tr_model_runtime.R_Modellist_f`.
/// @param state Record providing `state.numModels`, `state.models`.
function R_Modellist_f(state)
  entries=[];total=0;if state.numModels>1 then for index=1 to state.numModels-1 model=state.models[index];lods=1;for lod=1 to MD3_MAX_LODS-1 if model.md3[lod]!=void and model.md3[lod]!=model.md3[lod-1] then lods=lods+1 end if end for;entries=entries+[ModelListEntry(model.dataSize,lods,model.name)];total=total+model.dataSize end for end if;return ModelList(entries,total)
end function
/// Updates `state.initCount`, `state.syncCount`, `state.viewCluster`, `state.flareClears`, `state.sceneClears` in `mq3.renderer.tr_model_runtime.RE_BeginRegistration`; returns `state.glConfig`.
/// @param state Mutable record or buffer; this call updates `state.initCount`, `state.syncCount`, `state.viewCluster`, `state.flareClears`, `state.sceneClears`.
function RE_BeginRegistration(state)
  if state==void then return fail("registration state is required") end if;state.initCount=state.initCount+1;state.syncCount=state.syncCount+1;state.viewCluster=-1;state.flareClears=state.flareClears+1;state.sceneClears=state.sceneClears+1;state.registered=true;state.stretchPrimes=state.stretchPrimes+1;return state.glConfig
end function
