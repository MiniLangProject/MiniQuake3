// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native facade for the complete renderer/tr_shade.c back-end surface.
package mq3.renderer.tr_shade_runtime
import mq3.compat.numeric as n
import mq3.renderer.playable_materials as materials
import mq3.renderer.playable_dynamic_lights as dlights
import mq3.renderer.playable_fog as fogRuntime
import mq3.renderer.playable_world_batch as worldBatch
import mq3.renderer.tr_shade_calc_runtime as calc

const SURF_SKY=4
const SURF_NODLIGHT=1024
const SS_OPAQUE=3.0

/// Data record for `mq3.renderer.tr_shade_runtime.ArrayVertex`; groups `position`, `color`, `texture0`, `texture1`.
struct ArrayVertex position color texture0 texture1 end struct
/// Data record for `mq3.renderer.tr_shade_runtime.StripResult`; groups `strips`, `begins`, `vertexes`.
struct StripResult strips begins vertexes end struct
/// Data record for `mq3.renderer.tr_shade_runtime.ElementPlan`; groups `mode`, `strips`, `indexCount`.
struct ElementPlan mode strips indexCount end struct
/// Data record for `mq3.renderer.tr_shade_runtime.DebugPlan`; groups `mode`, `indexes`, `vertices`, `depthNear`, `depthFar`.
struct DebugPlan mode indexes vertices depthNear depthFar end struct
/// Data record for `mq3.renderer.tr_shade_runtime.SurfaceState`; groups `shader`, `fogNum`, `dlightBits`, `shaderTime`, `numIndexes`, `numVertexes`, and 2 further fields.
struct SurfaceState shader fogNum dlightBits shaderTime numIndexes numVertexes numPasses iteratorName end struct
/// Data record for `mq3.renderer.tr_shade_runtime.ShaderState`; groups `name`, `remappedShader`, `timeOffset`, `clampTime`, `sort`, `fogPass`, and 4 further fields.
struct ShaderState name remappedShader timeOffset clampTime sort fogPass polygonOffset surfaceFlags numPasses iteratorName end struct
/// Data record for `mq3.renderer.tr_shade_runtime.MultiPlan`; groups `texture0`, `texture1`, `environment`, `portalFill`, `indexCount`.
struct MultiPlan texture0 texture1 environment portalFill indexCount end struct
/// Data record for `mq3.renderer.tr_shade_runtime.DlightPass`; groups `lightIndex`, `uvs`, `colors`, `indexes`, `additive`.
struct DlightPass lightIndex uvs colors indexes additive end struct
/// Data record for `mq3.renderer.tr_shade_runtime.FogPlan`; groups `uvs`, `colors`, `indexes`, `depthEqual`.
struct FogPlan uvs colors indexes depthEqual end struct
/// Data record for `mq3.renderer.tr_shade_runtime.EndCounters`; groups `shaders`, `vertexes`, `indexes`, `totalIndexes`.
struct EndCounters shaders vertexes indexes totalIndexes end struct
/// Data record for `mq3.renderer.tr_shade_runtime.EndResult`; groups `skipped`, `shadow`, `counters`, `iteratorResult`, `debugTris`, `debugNormals`.
struct EndResult skipped shadow counters iteratorResult debugTris debugNormals end struct

/// Creates error `7791` with message `"tr_shade: "+message`.
/// @param message Input used in the result expression `error(7791,"tr_shade: "+message)`.
function fail(message) return error(7791,"tr_shade: "+message) end function

// R_ArrayElementDiscrete emits the currently selected texture-coordinate set,
// packed color and position for one array element.
/// @param index Input tested by `index<0 or index>=len(positions) or index>=len(colors) or index>=len(texture0)`.
/// @param positions Indexed input read at `index`.
/// @param colors Indexed input read at `index`.
/// @param texture0 Indexed input read at `index`.
/// @param texture1 Indexed input read at `index`.
/// @param currentTmu Input tested by `currentTmu!=0`.
function R_ArrayElementDiscrete(index,positions,colors,texture0,texture1,currentTmu)
  if index<0 or index>=len(positions) or index>=len(colors) or index>=len(texture0) then return fail("array element outside tessellation") end if
  second=void;if currentTmu!=0 then if index>=len(texture1) then return fail("missing secondary texture coordinate") end if;second=texture1[index] end if
  return ArrayVertex(positions[index],colors[index],texture0[index],second)
end function

// Preserve the original alternating winding test. Each returned list is one
// GL_TRIANGLE_STRIP and repeats three indexes when a new strip is required.
/// @param indexes Indexed input read at `0`, `1`, `2`, `i`.
function R_DrawStripElements(indexes)
  if len(indexes)==0 then return StripResult([],1,0) end if
  if len(indexes)<3 or len(indexes)%3!=0 then return fail("triangle index count is not divisible by three") end if
  strips=[[indexes[0],indexes[1],indexes[2]]];last=[indexes[0],indexes[1],indexes[2]];even=false;vertexes=3
  i=3
  while i<len(indexes)
    continued=false
    if not even then
      if indexes[i]==last[2] and indexes[i+1]==last[1] then strips[len(strips)-1]=strips[len(strips)-1]+[indexes[i+2]];vertexes=vertexes+1;even=true;continued=true end if
    else
      if last[2]==indexes[i+1] and last[0]==indexes[i] then strips[len(strips)-1]=strips[len(strips)-1]+[indexes[i+2]];vertexes=vertexes+1;even=false;continued=true end if
    end if
    if not continued then strips=strips+[[indexes[i],indexes[i+1],indexes[i+2]]];vertexes=vertexes+3;even=false end if
    last=[indexes[i],indexes[i+1],indexes[i+2]]
    i=i+3
  end while
  return StripResult(strips,len(strips),vertexes)
end function

/// Builds `mq3.renderer.tr_shade_runtime.ElementPlan` for `mq3.renderer.tr_shade_runtime.R_DrawElements`.
/// @param indexes Value forwarded as `indexes` to `mq3.renderer.tr_shade_runtime.R_DrawStripElements`.
/// @param primitives Input used by `mode=primitives`.
/// @param compiledArrays Input tested by `mode==0`.
function R_DrawElements(indexes,primitives,compiledArrays)
  mode=primitives;if mode==0 then if compiledArrays then mode=2 else mode=1 end if end if
  if mode==2 then return ElementPlan("triangles",void,len(indexes)) end if
  if mode==1 or mode==3 then strips=R_DrawStripElements(indexes);if strips is error then return strips end if;kind="strip-array";if mode==3 then kind="strip-discrete" end if;return ElementPlan(kind,strips,len(indexes)) end if
  return ElementPlan("none",void,0)
end function

/// Computes `R_BindAnimatedImage` from `slots[index%len(slots)]` using `mq3.compat.numeric.trunc32`.
/// @param isVideo Input tested by `isVideo`.
/// @param slots Indexed input read at `0`, `index%len(slots)`.
/// @param animationSpeed Input used by `index=n.trunc32(shaderTime*animationSpeed*1024.0)`.
/// @param shaderTime Input used by `index=n.trunc32(shaderTime*animationSpeed*1024.0)`.
function R_BindAnimatedImage(isVideo,slots,animationSpeed,shaderTime)
  if isVideo then return -2 end if
  if slots==void or len(slots)==0 then return -1 end if
  if len(slots)==1 then return slots[0] end if
  index=n.trunc32(shaderTime*animationSpeed*1024.0);index=index>>10;if index<0 then index=0 end if;return slots[index%len(slots)]
end function

/// Constructs `mq3.renderer.tr_shade_runtime.DebugPlan` with `mode` = `"triangles"`, `vertices` = `[]`, `depthNear` = `0.0`, `depthFar` = `0.0` and the supplied remaining values.
/// @param indexes Initial value for `mq3.renderer.tr_shade_runtime.DebugPlan.indexes`.
function DrawTris(indexes) return DebugPlan("triangles",indexes,[],0.0,0.0) end function
/// Builds `mq3.renderer.tr_shade_runtime.DebugPlan` for `mq3.renderer.tr_shade_runtime.DrawNormals`.
/// @param positions Indexed input read at `index`.
/// @param normals Indexed input read at `index`.
function DrawNormals(positions,normals)
  if len(positions)!=len(normals) then return fail("normal count differs from vertex count") end if
  lines=[];for index=0 to len(positions)-1 p=positions[index];v=normals[index];lines=lines+[p,[p[0]+2.0*v[0],p[1]+2.0*v[1],p[2]+2.0*v[2]]] end for
  return DebugPlan("lines",[],lines,0.0,0.0)
end function

/// Builds `mq3.renderer.tr_shade_runtime.SurfaceState` for `mq3.renderer.tr_shade_runtime.RB_BeginSurface`.
/// @param shader Record providing `shader.remappedShader`.
/// @param fogNum Initial value for `mq3.renderer.tr_shade_runtime.SurfaceState.fogNum`.
/// @param floatTime Input used by `shaderTime=floatTime-state.timeOffset`.
function RB_BeginSurface(shader,fogNum,floatTime)
  if shader==void then return fail("missing shader") end if
  state=shader;if shader.remappedShader!=void then state=shader.remappedShader end if
  shaderTime=floatTime-state.timeOffset;if state.clampTime!=0.0 and shaderTime>=state.clampTime then shaderTime=state.clampTime end if
  return SurfaceState(state,fogNum,0,shaderTime,0,0,state.numPasses,state.iteratorName)
end function

/// Builds `mq3.renderer.tr_shade_runtime.MultiPlan` for `mq3.renderer.tr_shade_runtime.DrawMultitextured`.
/// @param input Record providing `input.shaderTime`, `input.numIndexes`.
/// @param stage Indexed input read at `0`, `1`.
/// @param lightmapOnly Input tested by `lightmapOnly`.
/// @param portal Initial value for `mq3.renderer.tr_shade_runtime.MultiPlan.portalFill`.
function DrawMultitextured(input,stage,lightmapOnly,portal)
  if input==void or stage==void then return fail("missing multitexture input") end if
  texture0=R_BindAnimatedImage(false,stage[0].slots,stage[0].animationSpeed,input.shaderTime)
  texture1=R_BindAnimatedImage(false,stage[1].slots,stage[1].animationSpeed,input.shaderTime)
  environment="modulate";if lightmapOnly then environment="replace" end if
  return MultiPlan(texture0,texture1,environment,portal,input.numIndexes)
end function

// Exact CPU half of ProjectDlightTexture. The productive draw path below uses
// playable_dynamic_lights for the same projection and blend submission.
/// @param positions Sequence traversed as `position` while producing this result.
/// @param indexes Indexed input read at `i`, `i+1`, `i+2`.
/// @param dlightBits Input tested by `(dlightBits&(1<<lightIndex))==0`.
/// @param lights Indexed input read at `lightIndex`.
function ProjectDlightTexture(positions,indexes,dlightBits,lights)
  passes=[]
  for lightIndex=0 to len(lights)-1
    if (dlightBits&(1<<lightIndex))==0 then continue end if
    light=lights[lightIndex];uvs=[];colors=[];clips=[]
    for each position in positions result=dlights.vertex(light,position);uvs=uvs+[result.uv];colors=colors+[result.color];clips=clips+[result.clip] end for
    hit=[];i=0;while i<len(indexes) a=indexes[i];b=indexes[i+1];c=indexes[i+2];if (clips[a]&clips[b]&clips[c])==0 then hit=hit+[a,b,c] end if;i=i+3 end while
    if len(hit)>0 then passes=passes+[DlightPass(lightIndex,uvs,colors,hit,light.additive)] end if
  end for
  return passes
end function
/// Calls `mq3.renderer.playable_dynamic_lights.draw` with `(batch,catalog,lights,projection)` and returns its result.
/// @param batch Argument 1 supplied to `mq3.renderer.playable_dynamic_lights.draw`.
/// @param catalog Argument 2 supplied to `mq3.renderer.playable_dynamic_lights.draw`.
/// @param lights Argument 3 supplied to `mq3.renderer.playable_dynamic_lights.draw`.
/// @param projection Argument 4 supplied to `mq3.renderer.playable_dynamic_lights.draw`.
function ProjectDlightTextureDraw(batch,catalog,lights,projection) return dlights.draw(batch,catalog,lights,projection) end function

/// Builds `mq3.renderer.tr_shade_runtime.FogPlan` using `mq3.renderer.playable_fog.coordinates`.
/// @param positions Sequence traversed as `position` while producing this result.
/// @param indexes Initial value for `mq3.renderer.tr_shade_runtime.FogPlan.indexes`.
/// @param fog Record providing `fog.color`.
/// @param viewOrigin Argument 3 supplied to `mq3.renderer.playable_fog.coordinates`.
/// @param forward Argument 4 supplied to `mq3.renderer.playable_fog.coordinates`.
/// @param depthEqual Initial value for `mq3.renderer.tr_shade_runtime.FogPlan.depthEqual`.
function RB_FogPass(positions,indexes,fog,viewOrigin,forward,depthEqual)
  uvs=[];color=[n.trunc32(fog.color[0]*255.0),n.trunc32(fog.color[1]*255.0),n.trunc32(fog.color[2]*255.0),255];colors=[]
  for each position in positions uvs=uvs+[fogRuntime.coordinates(fog,position,viewOrigin,forward)];colors=colors+[color] end for
  return FogPlan(uvs,colors,indexes,depthEqual)
end function
/// Calls `mq3.renderer.playable_fog.draw` with `(batch,catalog,projection)` and returns its result.
/// @param batch Argument 1 supplied to `mq3.renderer.playable_fog.draw`.
/// @param catalog Argument 2 supplied to `mq3.renderer.playable_fog.draw`.
/// @param projection Argument 3 supplied to `mq3.renderer.playable_fog.draw`.
function RB_FogPassDraw(batch,catalog,projection) return fogRuntime.draw(batch,catalog,projection) end function

/// Evaluates per-vertex shader/entity color and optionally modulates it by the matching fog density.
/// @param stage Argument 1 supplied to `mq3.renderer.playable_materials.stageColorAtEntity`.
/// @param vertexColors Indexed input read at `index`.
/// @param entityColor Argument 3 supplied to `mq3.renderer.playable_materials.stageColorAtEntity`.
/// @param positions Indexed input read at `index`.
/// @param viewOrigin Argument 5 supplied to `mq3.renderer.playable_materials.stageColorAtEntity`.
/// @param nowMilliseconds Argument 6 supplied to `mq3.renderer.playable_materials.stageColorAtEntity`.
/// @param fogDensities Indexed input read at `index`.
/// @param fogAdjustment Argument 3 supplied to `mq3.renderer.playable_materials.modulateForFog`.
function ComputeColors(stage,vertexColors,entityColor,positions,viewOrigin,nowMilliseconds,fogDensities,fogAdjustment)
  output=[]
  for index=0 to len(vertexColors)-1
    color=materials.stageColorAtEntity(stage,vertexColors[index],entityColor,positions[index],viewOrigin,nowMilliseconds)
    if fogDensities!=void and index<len(fogDensities) then color=materials.modulateForFog(color,fogDensities[index],fogAdjustment) end if
    output=output+[color]
  end for
  return output
end function

/// Generates stage coordinates from texture, lightmap, vector, environment, or fog inputs and applies UV modifiers.
/// @param stage Record providing `stage.tcGen`.
/// @param baseCoords Indexed input read at `index`.
/// @param lightmapCoords Indexed input read at `index`.
/// @param positions Indexed input read at `index`.
/// @param normals Indexed input read at `index`.
/// @param viewOrigin Argument 3 supplied to `mq3.renderer.playable_materials.environmentUV`.
/// @param entityTranslate Argument 4 supplied to `mq3.renderer.playable_materials.transformUVEntityAt`.
/// @param nowMilliseconds Argument 6 supplied to `mq3.renderer.playable_materials.transformUVEntityAt`.
/// @param fog Argument 1 supplied to `mq3.renderer.playable_fog.coordinates`.
/// @param forward Argument 4 supplied to `mq3.renderer.playable_fog.coordinates`.
function ComputeTexCoords(stage,baseCoords,lightmapCoords,positions,normals,viewOrigin,entityTranslate,nowMilliseconds,fog,forward)
  result=[]
  for index=0 to len(positions)-1
    uv=[0.0,0.0]
    if stage.tcGen=="texture" then uv=baseCoords[index]
    else if stage.tcGen=="lightmap" then uv=lightmapCoords[index]
    else if stage.tcGen=="vector" then uv=materials.vectorUV(stage,positions[index])
    else if stage.tcGen=="environment" then uv=materials.environmentUV(positions[index],normals[index],viewOrigin)
    else if stage.tcGen=="fog" then if fog==void then return fail("fog tcGen requires a fog volume") end if;uv=fogRuntime.coordinates(fog,positions[index],viewOrigin,forward)
    else if stage.tcGen=="bad" then return []
    end if
    result=result+[materials.transformUVEntityAt(stage,uv,positions[index],entityTranslate,0.0,nowMilliseconds)]
  end for
  return result
end function

// The retained renderer creates one StagePass per original shader stage. These
// entry points all submit those passes, dynamic lights and fog in original
// order through the productive rasterizer.
/// @param batch Argument 1 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`.
/// @param projection Argument 2 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`.
/// @param nowMilliseconds Argument 3 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`.
/// @param lights Argument 4 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`.
function RB_IterateStagesGeneric(batch,projection,nowMilliseconds,lights) return worldBatch.drawMaterialsLit(batch,projection,nowMilliseconds,lights) end function
/// Calls `mq3.renderer.playable_world_batch.drawMaterialsLit` with `(batch,projection,nowMilliseconds,lights)` and returns its result.
/// @param batch Argument 1 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`.
/// @param projection Argument 2 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`.
/// @param nowMilliseconds Argument 3 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`.
/// @param lights Argument 4 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`.
function RB_StageIteratorGeneric(batch,projection,nowMilliseconds,lights) return worldBatch.drawMaterialsLit(batch,projection,nowMilliseconds,lights) end function
/// Calls `mq3.renderer.playable_world_batch.drawMaterialsLit` with `(batch,projection,nowMilliseconds,lights)` and returns its result.
/// @param batch Argument 1 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`.
/// @param projection Argument 2 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`.
/// @param nowMilliseconds Argument 3 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`.
/// @param lights Argument 4 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`.
function RB_StageIteratorVertexLitTexture(batch,projection,nowMilliseconds,lights) return worldBatch.drawMaterialsLit(batch,projection,nowMilliseconds,lights) end function
/// Calls `mq3.renderer.playable_world_batch.drawMaterialsLit` with `(batch,projection,nowMilliseconds,lights)` and returns its result.
/// @param batch Argument 1 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`.
/// @param projection Argument 2 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`.
/// @param nowMilliseconds Argument 3 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`.
/// @param lights Argument 4 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`.
function RB_StageIteratorLightmappedMultitexture(batch,projection,nowMilliseconds,lights) return worldBatch.drawMaterialsLit(batch,projection,nowMilliseconds,lights) end function

/// Builds `mq3.renderer.tr_shade_runtime.EndResult` after updating `surface.numIndexes`, `surface.numVertexes`.
/// @param surface Mutable record or buffer; this call updates `surface.numIndexes`, `surface.numVertexes`.
/// @param indexes Value forwarded as `indexes` to `mq3.renderer.tr_shade_runtime.DrawTris`.
/// @param positions Value forwarded as `positions` to `mq3.renderer.tr_shade_runtime.DrawNormals`.
/// @param normals Value forwarded as `normals` to `mq3.renderer.tr_shade_runtime.DrawNormals`.
/// @param counters Initial value for `mq3.renderer.tr_shade_runtime.EndResult.counters`.
/// @param debugSort Input tested by `debugSort!=0 and debugSort<surface.shader.sort`.
/// @param shadow Input tested by `shadow`.
/// @param iteratorResult Initial value for `mq3.renderer.tr_shade_runtime.EndResult.iteratorResult`.
/// @param showTris Input tested by `showTris`.
/// @param showNormals Input tested by `showNormals`.
function RB_EndSurface(surface,indexes,positions,normals,counters,debugSort,shadow,iteratorResult,showTris,showNormals)
  if len(indexes)==0 then return EndResult(true,false,counters,0,void,void) end if
  if shadow then return EndResult(false,true,counters,iteratorResult,void,void) end if
  if debugSort!=0 and debugSort<surface.shader.sort then return EndResult(true,false,counters,0,void,void) end if
  updated=EndCounters(counters.shaders+1,counters.vertexes+len(positions),counters.indexes+len(indexes),counters.totalIndexes+len(indexes)*surface.numPasses)
  tris=void;normalLines=void;if showTris then tris=DrawTris(indexes) end if;if showNormals then normalLines=DrawNormals(positions,normals) end if
  surface.numIndexes=0;surface.numVertexes=0;return EndResult(false,false,updated,iteratorResult,tris,normalLines)
end function
