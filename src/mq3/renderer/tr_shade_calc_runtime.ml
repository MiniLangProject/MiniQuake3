// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native, allocation-friendly facade for every function in tr_shade_calc.c.
// The interactive renderer uses the same kernels in playable_materials and
// playable_world_batch; this module preserves the original C surface for
// focused differential tests and other renderer front ends.
package mq3.renderer.tr_shade_calc_runtime

import mq3.compat.numeric as n
import mq3.compat.transcendental as trans
import mq3.renderer.noise as rendererNoise
import mq3.renderer.playable_fog as fogRuntime
import mq3.renderer.playable_light_grid as lightGrid
import mq3.renderer.playable_materials as materials
import mq3.renderer.playable_world_batch as worldBatch
import mq3.renderer.shader_parser as shaderParser
import mq3.shared.math as qmath

/// Number of samples in the periodic shader waveform lookup table.
const FUNCTABLE_SIZE=1024
/// Mask that wraps waveform-table indices to the power-of-two table size.
const FUNCTABLE_MASK=1023
/// Data record for `mq3.renderer.tr_shade_calc_runtime.TextGeometry`; groups `positions`, `texCoords`, `colors`, `indexes`.
struct TextGeometry
  /// Glyph-quad positions generated from the deform-text shader's source surface.
  positions
  /// Font-atlas coordinates generated for the quads of a deform-text shader stage.
  texCoords
  /// Vertex modulation colors emitted for the generated deform-text glyph quads.
  colors
  /// Triangle indices connecting the glyph quads produced by text deformation.
  indexes
end struct

/// Calls `mq3.compat.numeric.trunc32` with `(value)` and returns its result.
/// @param value Argument 1 supplied to `mq3.compat.numeric.trunc32`.
function myftol(value) return n.trunc32(value) end function
/// Returns `func` from `mq3.renderer.tr_shade_calc_runtime.TableForFunc`; earlier branches return `error(7750,"TableForFunc: invalid waveform")`.
/// @param func Input tested by `func<1 or func>5`.
function TableForFunc(func)
  if func<1 or func>5 then return error(7750,"TableForFunc: invalid waveform") end if
  return func
end function
/// Returns `materials.waveSample(wave,nowMilliseconds)` from `mq3.renderer.tr_shade_calc_runtime.EvalWaveForm`; earlier branches return `checked`.
/// @param wave Record providing `wave.func`.
/// @param nowMilliseconds Argument 2 supplied to `mq3.renderer.playable_materials.waveSample`.
function EvalWaveForm(wave,nowMilliseconds) checked=TableForFunc(wave.func);if checked is error then return checked end if;return materials.waveSample(wave,nowMilliseconds) end function
/// Returns `value` from `mq3.renderer.tr_shade_calc_runtime.EvalWaveFormClamped`; earlier branches return `value`, `0.0`, `1.0`.
/// @param wave Value forwarded as `wave` to `mq3.renderer.tr_shade_calc_runtime.EvalWaveForm`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.tr_shade_calc_runtime.EvalWaveForm`.
function EvalWaveFormClamped(wave,nowMilliseconds) value=EvalWaveForm(wave,nowMilliseconds);if value is error then return value end if;if value<0.0 then return 0.0 end if;if value>1.0 then return 1.0 end if;return value end function

/// Returns `result` from `mq3.renderer.tr_shade_calc_runtime.copy2`.
/// @param values Sequence traversed as `value` while producing this result.
function copy2(values) result=[];for each value in values result=result+[[value[0],value[1]]] end for;return result end function
/// Returns `result` from `mq3.renderer.tr_shade_calc_runtime.copy3`.
/// @param values Sequence traversed as `value` while producing this result.
function copy3(values) result=[];for each value in values result=result+[[value[0],value[1],value[2]]] end for;return result end function
/// Returns `materials.waveSignal(wave,0)` from `mq3.renderer.tr_shade_calc_runtime.sinIndex`.
/// @param index Input used by `wave=shaderParser.Wave(1,0.0,1.0,n.fdiv(n.f32(index&FUNCTABLE_MASK),1024.0),0.0)`.
function sinIndex(index)
  wave=shaderParser.Wave(1,0.0,1.0,n.fdiv(n.f32(index&FUNCTABLE_MASK),1024.0),0.0)
  return materials.waveSignal(wave,0)
end function

/// Returns `result` from `mq3.renderer.tr_shade_calc_runtime.RB_CalcTransformTexCoords`.
/// @param matrix Nested indexed data; outer entries read at `0`, `1`.
/// @param translate Indexed input read at `0`, `1`.
/// @param coords Sequence traversed as `uv` while producing this result.
function RB_CalcTransformTexCoords(matrix,translate,coords)
  result=[]
  for each uv in coords s=uv[0];t=uv[1];result=result+[[s*matrix[0][0]+t*matrix[1][0]+translate[0],s*matrix[0][1]+t*matrix[1][1]+translate[1]]] end for
  return result
end function
/// Returns `RB_CalcTransformTexCoords([[p,0.0],[0.0,p]],[offset,offset],coords)` from `mq3.renderer.tr_shade_calc_runtime.RB_CalcStretchTexCoords`; earlier branches return `value`.
/// @param wave Value forwarded as `wave` to `mq3.renderer.tr_shade_calc_runtime.EvalWaveForm`.
/// @param coords Value forwarded as `coords` to `mq3.renderer.tr_shade_calc_runtime.RB_CalcTransformTexCoords`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.tr_shade_calc_runtime.EvalWaveForm`.
function RB_CalcStretchTexCoords(wave,coords,nowMilliseconds)
  value=EvalWaveForm(wave,nowMilliseconds);if value is error then return value end if;p=1.0/value;offset=0.5-0.5*p
  return RB_CalcTransformTexCoords([[p,0.0],[0.0,p]],[offset,offset],coords)
end function
/// Calls `mq3.renderer.tr_shade_calc_runtime.RB_CalcTransformTexCoords` with `([[scale[0],0.0],[0.0,scale[1]]],[0.0,0.0],coords)` and returns its result.
/// @param scale Indexed input read at `0`, `1`.
/// @param coords Value forwarded as `coords` to `mq3.renderer.tr_shade_calc_runtime.RB_CalcTransformTexCoords`.
function RB_CalcScaleTexCoords(scale,coords) return RB_CalcTransformTexCoords([[scale[0],0.0],[0.0,scale[1]]],[0.0,0.0],coords) end function
/// Returns `result` from `mq3.renderer.tr_shade_calc_runtime.RB_CalcScrollTexCoords`.
/// @param speed Indexed input read at `0`, `1`.
/// @param coords Sequence traversed as `uv` while producing this result.
/// @param shaderTimeSeconds Input used by `s=speed[0]*shaderTimeSeconds`.
function RB_CalcScrollTexCoords(speed,coords,shaderTimeSeconds)
  s=speed[0]*shaderTimeSeconds;s=s-materials.floorNumber(s);t=speed[1]*shaderTimeSeconds;t=t-materials.floorNumber(t);result=[]
  for each uv in coords result=result+[[uv[0]+s,uv[1]+t]] end for;return result
end function
/// Rotates texture coordinates around the texture center using the time-scaled angle and sine table.
/// @param degreesPerSecond Input used by `index=n.trunc32((0.0-degreesPerSecond*shaderTimeSeconds)*(FUNCTABLE_SIZE/360.0))`.
/// @param coords Value forwarded as `coords` to `mq3.renderer.tr_shade_calc_runtime.RB_CalcTransformTexCoords`.
/// @param shaderTimeSeconds Input used by `index=n.trunc32((0.0-degreesPerSecond*shaderTimeSeconds)*(FUNCTABLE_SIZE/360.0))`.
function RB_CalcRotateTexCoords(degreesPerSecond,coords,shaderTimeSeconds)
  index=n.trunc32((0.0-degreesPerSecond*shaderTimeSeconds)*(FUNCTABLE_SIZE/360.0));sine=sinIndex(index);cosine=sinIndex(index+256)
  return RB_CalcTransformTexCoords([[cosine,sine],[0.0-sine,cosine]],[0.5-0.5*cosine+0.5*sine,0.5-0.5*sine-0.5*cosine],coords)
end function
/// Adds position- and time-dependent sine turbulence to each texture-coordinate pair.
/// @param wave Record providing `wave.phase`, `wave.frequency`, `wave.amplitude`.
/// @param coords Indexed input read at `index`.
/// @param positions Indexed input read at `index`.
/// @param nowMilliseconds Input used by `now=wave.phase+nowMilliseconds*0.001*wave.frequency`.
function RB_CalcTurbulentTexCoords(wave,coords,positions,nowMilliseconds)
  now=wave.phase+nowMilliseconds*0.001*wave.frequency;result=[]
  for index=0 to len(coords)-1 uv=coords[index];point=positions[index];si=n.trunc32(((point[0]+point[2])/1024.0+now)*1024.0);ti=n.trunc32((point[1]/1024.0+now)*1024.0);result=result+[[uv[0]+sinIndex(si)*wave.amplitude,uv[1]+sinIndex(ti)*wave.amplitude]] end for
  return result
end function
/// Returns `result` from `mq3.renderer.tr_shade_calc_runtime.RB_CalcEnvironmentTexCoords`.
/// @param positions Indexed input read at `index`.
/// @param normals Indexed input read at `index`.
/// @param viewOrigin Argument 3 supplied to `mq3.renderer.playable_materials.environmentUV`.
function RB_CalcEnvironmentTexCoords(positions,normals,viewOrigin)
  result=[];for index=0 to len(positions)-1 result=result+[materials.environmentUV(positions[index],normals[index],viewOrigin)] end for;return result
end function
/// Returns `result` from `mq3.renderer.tr_shade_calc_runtime.RB_CalcFogTexCoords`.
/// @param fog Argument 1 supplied to `mq3.renderer.playable_fog.coordinates`.
/// @param positions Sequence traversed as `position` while producing this result.
/// @param viewOrigin Argument 3 supplied to `mq3.renderer.playable_fog.coordinates`.
/// @param forward Argument 4 supplied to `mq3.renderer.playable_fog.coordinates`.
function RB_CalcFogTexCoords(fog,positions,viewOrigin,forward)
  result=[];for each position in positions result=result+[fogRuntime.coordinates(fog,position,viewOrigin,forward)] end for;return result
end function

/// Returns `result` from `mq3.renderer.tr_shade_calc_runtime.RB_CalcDeformVertexes`.
/// @param deform Input used by `for index=0 to len(positions)-1 result=result+[worldBatch.deformedPosition(positions[index],normals[index],[0.0,0.0],[deform],nowMilliseconds)]`.
/// @param positions Indexed input read at `index`.
/// @param normals Indexed input read at `index`.
/// @param nowMilliseconds Argument 5 supplied to `mq3.renderer.playable_world_batch.deformedPosition`.
function RB_CalcDeformVertexes(deform,positions,normals,nowMilliseconds)
  result=[];for index=0 to len(positions)-1 result=result+[worldBatch.deformedPosition(positions[index],normals[index],[0.0,0.0],[deform],nowMilliseconds)] end for;return result
end function
/// Returns `result` from `mq3.renderer.tr_shade_calc_runtime.RB_CalcBulgeVertexes`.
/// @param deform Input used by `for index=0 to len(positions)-1 result=result+[worldBatch.deformedPosition(positions[index],normals[index],coords[index],[deform],nowMilliseconds)]`.
/// @param positions Indexed input read at `index`.
/// @param normals Indexed input read at `index`.
/// @param coords Indexed input read at `index`.
/// @param nowMilliseconds Argument 5 supplied to `mq3.renderer.playable_world_batch.deformedPosition`.
function RB_CalcBulgeVertexes(deform,positions,normals,coords,nowMilliseconds)
  result=[];for index=0 to len(positions)-1 result=result+[worldBatch.deformedPosition(positions[index],normals[index],coords[index],[deform],nowMilliseconds)] end for;return result
end function
/// Moves every vertex along a deformation vector scaled by the current waveform value.
/// @param deform Record providing `deform.wave`, `deform.vector`.
/// @param positions Sequence traversed as `point` while producing this result.
/// @param nowMilliseconds Argument 2 supplied to `mq3.renderer.playable_materials.waveSample`.
function RB_CalcMoveVertexes(deform,positions,nowMilliseconds)
  result=[];scale=materials.waveSample(deform.wave,nowMilliseconds);for each point in positions result=result+[[point[0]+deform.vector[0]*scale,point[1]+deform.vector[1]*scale,point[2]+deform.vector[2]*scale]] end for;return result
end function
/// Applies the specified time-dependent normal deformation, creating deterministic noise state when necessary.
/// @param deform Input used by `for index=0 to len(positions)-1 result=result+[worldBatch.deformedNormal(positions[index],normals[index],[deform],nowMilliseconds,noise)]`.
/// @param positions Indexed input read at `index`.
/// @param normals Indexed input read at `index`.
/// @param nowMilliseconds Argument 4 supplied to `mq3.renderer.playable_world_batch.deformedNormal`.
/// @param noise Argument 5 supplied to `mq3.renderer.playable_world_batch.deformedNormal`.
function RB_CalcDeformNormals(deform,positions,normals,nowMilliseconds,noise)
  if noise==void then noise=rendererNoise.create() end if;result=[];for index=0 to len(positions)-1 result=result+[worldBatch.deformedNormal(positions[index],normals[index],[deform],nowMilliseconds,noise)] end for;return result
end function
/// Returns `[qmath.DotProduct(value,axes[0]),qmath.DotProduct(value,axes[1]),qmath.DotProduct(value,axes[2])]` for `mq3.renderer.tr_shade_calc_runtime.GlobalVectorToLocal`.
/// @param value Argument 1 supplied to `mq3.shared.math.DotProduct`.
/// @param axes Three-component vector read at indices 0, 1, and 2.
function GlobalVectorToLocal(value,axes) return [qmath.DotProduct(value,axes[0]),qmath.DotProduct(value,axes[1]),qmath.DotProduct(value,axes[2])] end function
/// Calls `mq3.renderer.playable_world_batch.autospriteQuad` with `(pass,triangleIndex,leftDirection,upDirection)` and returns its result.
/// @param pass Argument 1 supplied to `mq3.renderer.playable_world_batch.autospriteQuad`.
/// @param triangleIndex Argument 2 supplied to `mq3.renderer.playable_world_batch.autospriteQuad`.
/// @param leftDirection Argument 3 supplied to `mq3.renderer.playable_world_batch.autospriteQuad`.
/// @param upDirection Argument 4 supplied to `mq3.renderer.playable_world_batch.autospriteQuad`.
function AutospriteDeform(pass,triangleIndex,leftDirection,upDirection) return worldBatch.autospriteQuad(pass,triangleIndex,leftDirection,upDirection) end function
/// Calls `mq3.renderer.playable_world_batch.autosprite2Quad` with `(pass,triangleIndex,forward)` and returns its result.
/// @param pass Argument 1 supplied to `mq3.renderer.playable_world_batch.autosprite2Quad`.
/// @param triangleIndex Argument 2 supplied to `mq3.renderer.playable_world_batch.autosprite2Quad`.
/// @param forward Argument 3 supplied to `mq3.renderer.playable_world_batch.autosprite2Quad`.
function Autosprite2Deform(pass,triangleIndex,forward) return worldBatch.autosprite2Quad(pass,triangleIndex,forward) end function

// The original text deformation converts one four-corner surface into atlas
// quads. Return the complete indexed geometry so callers are not coupled to
// the global tess scratch buffer.
/// @param text Argument 1 supplied to `bytes`.
/// @param corners Indexed input read at `index`.
/// @param normal Three-component vector read at indices 0, 1, and 2.
function DeformText(text,corners,normal)
  if len(corners)<4 or len(normal)!=3 then return error(7751,"DeformText: four corners and a normal are required") end if
  down=[0.0,0.0,-1.0];width=[normal[1]*down[2]-normal[2]*down[1],normal[2]*down[0]-normal[0]*down[2],normal[0]*down[1]-normal[1]*down[0]]
  mid=[0.0,0.0,0.0];bottom=999999.0;top=-999999.0
  for index=0 to 3 point=corners[index];for axis=0 to 2 mid[axis]=mid[axis]+point[axis]*0.25 end for;if point[2]<bottom then bottom=point[2] end if;if point[2]>top then top=point[2] end if end for
  height=[0.0,0.0,(top-bottom)*0.5];for axis=0 to 2 width[axis]=width[axis]*height[2]*(0.0-0.75) end for
  origin=[mid[0]+(len(text)-1)*width[0],mid[1]+(len(text)-1)*width[1],mid[2]+(len(text)-1)*width[2]];positions=[];uvs=[];colors=[];indexes=[]
  for cursor=0 to len(text)-1
    ch=bytes(text)[cursor]&255
    if ch!=32 then row=ch>>4;column=ch&15;u=column*0.0625;v=row*0.0625;base=len(positions);positions=positions+[[origin[0]+width[0]+height[0],origin[1]+width[1]+height[1],origin[2]+width[2]+height[2]],[origin[0]-width[0]+height[0],origin[1]-width[1]+height[1],origin[2]-width[2]+height[2]],[origin[0]-width[0]-height[0],origin[1]-width[1]-height[1],origin[2]-width[2]-height[2]],[origin[0]+width[0]-height[0],origin[1]+width[1]-height[1],origin[2]+width[2]-height[2]]];uvs=uvs+[[u,v],[u+0.0625,v],[u+0.0625,v+0.0625],[u,v+0.0625]];colors=colors+[[255,255,255,255],[255,255,255,255],[255,255,255,255],[255,255,255,255]];indexes=indexes+[base,base+1,base+3,base+3,base+1,base+2] end if
    origin=[origin[0]-2.0*width[0],origin[1]-2.0*width[1],origin[2]-2.0*width[2]]
  end for
  return TextGeometry(positions,uvs,colors,indexes)
end function
/// Computes `RB_DeformTessGeometry` from `[outputPositions,outputNormals]` using `mq3.renderer.tr_shade_calc_runtime.copy3`, `mq3.renderer.tr_shade_calc_runtime.RB_CalcDeformVertexes`, `mq3.renderer.tr_shade_calc_runtime.RB_CalcDeformNormals`.
/// @param deforms Sequence traversed as `deform` while producing this result.
/// @param positions Value forwarded as `values` to `mq3.renderer.tr_shade_calc_runtime.copy3`.
/// @param normals Value forwarded as `values` to `mq3.renderer.tr_shade_calc_runtime.copy3`.
/// @param coords Value forwarded as `coords` to `mq3.renderer.tr_shade_calc_runtime.RB_CalcBulgeVertexes`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.tr_shade_calc_runtime.RB_CalcDeformVertexes`.
/// @param noise Value forwarded as `noise` to `mq3.renderer.tr_shade_calc_runtime.RB_CalcDeformNormals`.
function RB_DeformTessGeometry(deforms,positions,normals,coords,nowMilliseconds,noise)
  outputPositions=copy3(positions);outputNormals=copy3(normals)
  for each deform in deforms
    if deform.kind=="wave" then outputPositions=RB_CalcDeformVertexes(deform,outputPositions,outputNormals,nowMilliseconds)
    else if deform.kind=="normal" then outputNormals=RB_CalcDeformNormals(deform,outputPositions,outputNormals,nowMilliseconds,noise)
    else if deform.kind=="bulge" then outputPositions=RB_CalcBulgeVertexes(deform,outputPositions,outputNormals,coords,nowMilliseconds)
    else if deform.kind=="move" then outputPositions=RB_CalcMoveVertexes(deform,outputPositions,nowMilliseconds)
    end if
  end for
  return [outputPositions,outputNormals]
end function

/// Returns `result` from `mq3.renderer.tr_shade_calc_runtime.repeatColor`.
/// @param color Indexed input read at `0`, `1`, `2`, `3`.
/// @param count Input used by `for index=0 to count-1 result=result+[[color[0],color[1],color[2],color[3]]]`.
function repeatColor(color,count) result=[];for index=0 to count-1 result=result+[[color[0],color[1],color[2],color[3]]] end for;return result end function
/// Calls `mq3.renderer.tr_shade_calc_runtime.repeatColor` with `(entityColor,count)` and returns its result.
/// @param entityColor Value forwarded as `color` to `mq3.renderer.tr_shade_calc_runtime.repeatColor`.
/// @param count Value forwarded as `count` to `mq3.renderer.tr_shade_calc_runtime.repeatColor`.
function RB_CalcColorFromEntity(entityColor,count) return repeatColor(entityColor,count) end function
/// Calls `mq3.renderer.tr_shade_calc_runtime.repeatColor` with `([255-entityColor[0],255-entityColor[1],255-entityColor[2],255-entityColor[3]],count)` and returns its result.
/// @param entityColor Indexed input read at `0`, `1`, `2`, `3`.
/// @param count Value forwarded as `count` to `mq3.renderer.tr_shade_calc_runtime.repeatColor`.
function RB_CalcColorFromOneMinusEntity(entityColor,count) return repeatColor([255-entityColor[0],255-entityColor[1],255-entityColor[2],255-entityColor[3]],count) end function
/// Returns `result` from `mq3.renderer.tr_shade_calc_runtime.RB_CalcAlphaFromEntity`.
/// @param colors Sequence traversed as `color` while producing this result.
/// @param entityColor Indexed input read at `3`.
function RB_CalcAlphaFromEntity(colors,entityColor) result=[];for each color in colors result=result+[[color[0],color[1],color[2],entityColor[3]]] end for;return result end function
/// Returns `result` from `mq3.renderer.tr_shade_calc_runtime.RB_CalcAlphaFromOneMinusEntity`.
/// @param colors Sequence traversed as `color` while producing this result.
/// @param entityColor Indexed input read at `3`.
function RB_CalcAlphaFromOneMinusEntity(colors,entityColor) result=[];for each color in colors result=result+[[color[0],color[1],color[2],255-entityColor[3]]] end for;return result end function
/// Computes `RB_CalcWaveColor` from `repeatColor([value,value,value,255],count)` using `mq3.renderer.noise.create`, `mq3.renderer.noise.get4f`, `mq3.renderer.tr_shade_calc_runtime.EvalWaveForm`.
/// @param wave Record providing `wave.func`, `wave.base`, `wave.phase`, `wave.frequency`, `wave.amplitude`.
/// @param count Value forwarded as `count` to `mq3.renderer.tr_shade_calc_runtime.repeatColor`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.tr_shade_calc_runtime.EvalWaveForm`.
/// @param identityLight Brightness multiplier applied to non-noise waveform color before byte conversion.
/// @param noise Argument 1 supplied to `mq3.renderer.noise.get4f`.
function RB_CalcWaveColor(wave,count,nowMilliseconds,identityLight,noise)
  glow=0.0;if wave.func==6 then if noise==void then noise=rendererNoise.create() end if;glow=wave.base+rendererNoise.get4f(noise,0.0,0.0,0.0,(nowMilliseconds*0.001+wave.phase)*wave.frequency)*wave.amplitude else glow=EvalWaveForm(wave,nowMilliseconds)*identityLight end if
  if glow<0.0 then glow=0.0 end if;if glow>1.0 then glow=1.0 end if;value=n.trunc32(255.0*glow);return repeatColor([value,value,value,255],count)
end function
/// Returns `result` from `mq3.renderer.tr_shade_calc_runtime.RB_CalcWaveAlpha`.
/// @param wave Value forwarded as `wave` to `mq3.renderer.tr_shade_calc_runtime.EvalWaveFormClamped`.
/// @param colors Sequence traversed as `color` while producing this result.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.tr_shade_calc_runtime.EvalWaveFormClamped`.
function RB_CalcWaveAlpha(wave,colors,nowMilliseconds) glow=EvalWaveFormClamped(wave,nowMilliseconds);result=[];for each color in colors result=result+[[color[0],color[1],color[2],n.trunc32(255.0*glow)]] end for;return result end function
/// Returns `result` from `mq3.renderer.tr_shade_calc_runtime.fogModulate`.
/// @param colors Indexed input read at `index`.
/// @param densities Indexed input read at `index`.
/// @param mode Argument 3 supplied to `mq3.renderer.playable_materials.modulateForFog`.
function fogModulate(colors,densities,mode) result=[];for index=0 to len(colors)-1 result=result+[materials.modulateForFog(colors[index],densities[index],mode)] end for;return result end function
/// Calls `mq3.renderer.tr_shade_calc_runtime.fogModulate` with `(colors,densities,"rgb")` and returns its result.
/// @param colors Value forwarded as `colors` to `mq3.renderer.tr_shade_calc_runtime.fogModulate`.
/// @param densities Value forwarded as `densities` to `mq3.renderer.tr_shade_calc_runtime.fogModulate`.
function RB_CalcModulateColorsByFog(colors,densities) return fogModulate(colors,densities,"rgb") end function
/// Calls `mq3.renderer.tr_shade_calc_runtime.fogModulate` with `(colors,densities,"alpha")` and returns its result.
/// @param colors Value forwarded as `colors` to `mq3.renderer.tr_shade_calc_runtime.fogModulate`.
/// @param densities Value forwarded as `densities` to `mq3.renderer.tr_shade_calc_runtime.fogModulate`.
function RB_CalcModulateAlphasByFog(colors,densities) return fogModulate(colors,densities,"alpha") end function
/// Calls `mq3.renderer.tr_shade_calc_runtime.fogModulate` with `(colors,densities,"rgba")` and returns its result.
/// @param colors Value forwarded as `colors` to `mq3.renderer.tr_shade_calc_runtime.fogModulate`.
/// @param densities Value forwarded as `densities` to `mq3.renderer.tr_shade_calc_runtime.fogModulate`.
function RB_CalcModulateRGBAsByFog(colors,densities) return fogModulate(colors,densities,"rgba") end function
/// Returns `result` from `mq3.renderer.tr_shade_calc_runtime.RB_CalcSpecularAlpha`.
/// @param colors Indexed input read at `index`.
/// @param positions Indexed input read at `index`.
/// @param normals Indexed input read at `index`.
/// @param viewOrigin Argument 3 supplied to `mq3.renderer.playable_world_batch.specularAlpha`.
function RB_CalcSpecularAlpha(colors,positions,normals,viewOrigin) result=[];for index=0 to len(colors)-1 color=colors[index];result=result+[[color[0],color[1],color[2],worldBatch.specularAlpha(positions[index],normals[index],viewOrigin)]] end for;return result end function
/// Returns `result` from `mq3.renderer.tr_shade_calc_runtime.RB_CalcDiffuseColor`.
/// @param sample Argument 1 supplied to `mq3.renderer.playable_light_grid.vertexColor`.
/// @param normals Sequence traversed as `normal` while producing this result.
function RB_CalcDiffuseColor(sample,normals) result=[];for each normal in normals result=result+[lightGrid.vertexColor(sample,normal)] end for;return result end function
