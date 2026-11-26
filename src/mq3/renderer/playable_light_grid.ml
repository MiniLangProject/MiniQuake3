// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 BSP light-grid loading and trilinear entity-light sampling.
package mq3.renderer.playable_light_grid

import mq3.format.bsp as bsp
import mq3.compat.numeric as numeric
import mq3.compat.textnumbers as textnumbers
import mq3.compat.transcendental as trans
import mq3.shared.math as qmath
import mq3.renderer.bsp_render_data as renderData

/// Default light-grid cell spacing along the world X axis.
const DEFAULT_X=64.0
/// Default light-grid cell spacing along the world Y axis.
const DEFAULT_Y=64.0
/// Default light-grid cell spacing along the world Z axis.
const DEFAULT_Z=128.0
/// Ratio of a circle's circumference to its diameter, used for angle conversion.
const PI=3.14159265358979323846
/// Minimum ambient contribution enforced for entities requesting minimum lighting.
const MINLIGHT=32.0
/// Dynamic-light contribution used at a distance equal to the light's radius.
const DLIGHT_AT_RADIUS=16.0
/// Lower bound applied to dynamic-light radius calculations.
const DLIGHT_MINIMUM_RADIUS=16.0
/// Fallback ambient-light contribution when rendering without a world light grid.
const NOWORLD_AMBIENT=182.0
/// Fallback directional-light contribution when rendering without a world light grid.
const NOWORLD_DIRECTED=150.0

/// Data record for `mq3.renderer.playable_light_grid.Grid`; groups `data`, `offset`, `length`, `origin`, `size`, `inverse`, and 3 further fields.
struct Grid
  /// Packed BSP light-grid sample bytes containing ambient, directed, and angular lighting data.
  data
  /// Byte offset of the current cursor or data range.
  offset
  /// Number of bytes in the data range represented by this record.
  length
  /// World-space position of the first sample in the BSP lighting grid.
  origin
  /// World-space spacing between light-grid samples along each axis.
  size
  /// Reciprocal grid-cell dimensions used to locate a light-grid sample.
  inverse
  /// Minimum and maximum corners enclosing the object or surface.
  bounds
  /// Whether the record contains usable data for the requested operation.
  valid
  /// Dynamic lights considered in addition to baked grid lighting.
  dynamicLights
end struct
/// Data record for `mq3.renderer.playable_light_grid.Sample`; groups `ambient`, `directed`, `direction`, `totalFactor`.
struct Sample
  /// Ambient light contribution sampled or applied by the renderer.
  ambient
  /// Directional light contribution sampled or applied by the renderer.
  directed
  /// Direction of the dominant light contribution.
  direction
  /// Accumulated weight used to normalize interpolated light-grid samples.
  totalFactor
end struct

/// Creates error `7660` with message `"playable light grid: "+message`.
/// @param message Input used in the result expression `error(7660,"playable light grid: "+message)`.
function fail(message) return error(7660,"playable light grid: "+message) end function
/// Returns `result` from `mq3.renderer.playable_light_grid.floorNumber`.
/// @param value Argument 1 supplied to `mq3.compat.numeric.trunc32`.
function floorNumber(value) result=numeric.trunc32(value);if value<result then result=result-1 end if;return result end function
/// Returns `result` from `mq3.renderer.playable_light_grid.ceilNumber`.
/// @param value Value forwarded as `value` to `mq3.renderer.playable_light_grid.floorNumber`.
function ceilNumber(value) result=floorNumber(value);if value>result then result=result+1 end if;return result end function

/// Computes `worldGridSize` from `[DEFAULT_X,DEFAULT_Y,DEFAULT_Z]` using `mq3.format.bsp.entities`, `stringEqualsIgnoreCaseAscii`, `mq3.compat.textnumbers.vector`.
/// @param map Argument 1 supplied to `mq3.format.bsp.entities`.
function worldGridSize(map)
  size=[DEFAULT_X,DEFAULT_Y,DEFAULT_Z];entities=bsp.entities(map);if entities is error or len(entities)==0 then return size end if
  for each field in entities[0] if stringEqualsIgnoreCaseAscii(field[0],"gridsize") then parsed=textnumbers.vector(field[1],size);if parsed[0]==3 and parsed[1][0]>0.0 and parsed[1][1]>0.0 and parsed[1][2]>0.0 then size=parsed[1] end if end if end for
  return size
end function

/// Builds `mq3.renderer.playable_light_grid.Grid` for `mq3.renderer.playable_light_grid.load`.
/// @param map Record providing `map.counts`, `map.offsets`, `map.data`, `map.lengths`.
function load(map)
  if map==void or map.counts[7]<1 then return fail("world model is required") end if
  size=worldGridSize(map);model=map.offsets[7];mins=[numeric.bitsFloat(numeric.readU32(map.data,model)),numeric.bitsFloat(numeric.readU32(map.data,model+4)),numeric.bitsFloat(numeric.readU32(map.data,model+8))];maxs=[numeric.bitsFloat(numeric.readU32(map.data,model+12)),numeric.bitsFloat(numeric.readU32(map.data,model+16)),numeric.bitsFloat(numeric.readU32(map.data,model+20))]
  origin=[];bounds=[];inverse=[]
  for axis=0 to 2 first=size[axis]*ceilNumber(mins[axis]/size[axis]);last=size[axis]*floorNumber(maxs[axis]/size[axis]);origin=origin+[first];bounds=bounds+[numeric.trunc32((last-first)/size[axis])+1];inverse=inverse+[1.0/size[axis]] end for
  expected=bounds[0]*bounds[1]*bounds[2]*8;valid=map.lengths[15]==expected and expected>0
  return Grid(map.data,map.offsets[15],map.lengths[15],origin,size,inverse,bounds,valid,[])
end function

/// Calls `mq3.renderer.bsp_render_data.colorShiftLighting` with `(red,green,blue,2)` and returns its result.
/// @param red Argument 1 supplied to `mq3.renderer.bsp_render_data.colorShiftLighting`.
/// @param green Argument 2 supplied to `mq3.renderer.bsp_render_data.colorShiftLighting`.
/// @param blue Argument 3 supplied to `mq3.renderer.bsp_render_data.colorShiftLighting`.
function shiftColor(red,green,blue)
  return renderData.colorShiftLighting(red,green,blue,2)
end function
/// Constructs `mq3.renderer.playable_light_grid.Sample` with `ambient` = `[0.0,0.0,0.0]`, `directed` = `[0.0,0.0,0.0]`, `direction` = `[0.0,0.0,1.0]`, `totalFactor` = `0.0`.
function emptySample() return Sample([0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,1.0],0.0) end function

/// Builds `mq3.renderer.playable_light_grid.Sample` after updating `ambient[channel]`, `directed[channel]`.
/// @param grid Record providing `grid.valid`, `grid.origin`, `grid.inverse`, `grid.bounds`, `grid.offset`, `grid.length`.
/// @param point Indexed input read at `axis`.
function sample(grid,point)
  if grid==void or not grid.valid or point==void or len(point)!=3 then return emptySample() end if
  pos=[];frac=[]
  // tr_light.c clamps the cell coordinate but deliberately retains the
  // fraction computed from the unclamped coordinate.  This matters for
  // R_LightForPoint calls just outside a map's light-grid bounds.
  for axis=0 to 2 value=(point[axis]-grid.origin[axis])*grid.inverse[axis];cell=floorNumber(value);part=value-cell;if cell<0 then cell=0 else if cell>=grid.bounds[axis]-1 then cell=grid.bounds[axis]-1 end if;pos=pos+[cell];frac=frac+[part] end for
  ambient=[0.0,0.0,0.0];directed=[0.0,0.0,0.0];direction=[0.0,0.0,0.0];total=0.0;steps=[8,8*grid.bounds[0],8*grid.bounds[0]*grid.bounds[1]]
  for corner=0 to 7 factor=1.0;at=grid.offset+pos[0]*steps[0]+pos[1]*steps[1]+pos[2]*steps[2]
    for axis=0 to 2 if (corner & (1 << axis))!=0 then factor=factor*frac[axis];at=at+steps[axis] else factor=factor*(1.0-frac[axis]) end if end for
    if factor>0.0 and at+7<grid.offset+grid.length and (grid.data[at]+grid.data[at+1]+grid.data[at+2])!=0 then
      total=total+factor;a=shiftColor(grid.data[at],grid.data[at+1],grid.data[at+2]);d=shiftColor(grid.data[at+3],grid.data[at+4],grid.data[at+5]);for channel=0 to 2 ambient[channel]=ambient[channel]+factor*a[channel];directed[channel]=directed[channel]+factor*d[channel] end for
      longitude=grid.data[at+6]*2.0*PI/256.0;latitude=grid.data[at+7]*2.0*PI/256.0;normal=[trans.cos(latitude)*trans.sin(longitude),trans.sin(latitude)*trans.sin(longitude),trans.cos(longitude)];direction=qmath.VectorMA(direction,factor,normal)
    end if
  end for
  if total>0.0 and total<0.99 then scale=1.0/total;ambient=qmath.VectorScale(ambient,scale);directed=qmath.VectorScale(directed,scale) end if
  if qmath.VectorNormalize(direction)==0.0 then direction=[0.0,0.0,1.0] end if
  return Sample(ambient,directed,direction,total)
end function

/// Builds `mq3.renderer.playable_light_grid.Sample` after updating `directed[channel]`.
/// @param value Record providing `value.ambient`, `value.directed`, `value.direction`, `value.totalFactor`.
/// @param point Three-component vector read at indices 0, 1, and 2.
/// @param lights Sequence traversed as `light` while producing this result.
function withDynamicLights(value,point,lights)
  if value==void or point==void or lights==void or len(lights)==0 then return value end if
  ambient=[value.ambient[0],value.ambient[1],value.ambient[2]];directed=[value.directed[0],value.directed[1],value.directed[2]];length=qmath.VectorLength(directed);direction=qmath.VectorScale(value.direction,length);total=value.totalFactor
  for each light in lights
    if light!=void and light.radius>0.0 and light.origin!=void and light.color!=void then
      delta=[light.origin[0]-point[0],light.origin[1]-point[1],light.origin[2]-point[2]];distance=qmath.VectorNormalize(delta);if distance<DLIGHT_MINIMUM_RADIUS then distance=DLIGHT_MINIMUM_RADIUS end if
      amount=DLIGHT_AT_RADIUS*light.radius*light.radius/(distance*distance)
      for channel=0 to 2 directed[channel]=directed[channel]+amount*light.color[channel] end for
      direction=qmath.VectorMA(direction,amount,delta);if amount>0.0 then total=1.0 end if
    end if
  end for
  if qmath.VectorNormalize(direction)==0.0 then direction=[0.0,0.0,1.0] end if
  return Sample(ambient,directed,direction,total)
end function
/// Updates `grid.dynamicLights` in `mq3.renderer.playable_light_grid.setDynamicLights`; returns `grid`.
/// @param grid Mutable record or buffer; this call updates `grid.dynamicLights`.
/// @param lights Value assigned to `grid.dynamicLights`.
function setDynamicLights(grid,lights) if grid!=void then if lights==void then grid.dynamicLights=[] else grid.dynamicLights=lights end if end if;return grid end function
/// Builds `value.ambient[channel]` in `mq3.renderer.playable_light_grid.entitySample`; returns `value`.
/// @param grid Record providing `grid.dynamicLights`.
/// @param point Value forwarded as `point` to `mq3.renderer.playable_light_grid.sample`.
function entitySample(grid,point)
  value=sample(grid,point);for channel=0 to 2 value.ambient[channel]=value.ambient[channel]+MINLIGHT;if value.ambient[channel]>255.0 then value.ambient[channel]=255.0 end if end for
  if grid!=void then value=withDynamicLights(value,point,grid.dynamicLights) end if;return value
end function
// R_SetupEntityLighting uses identityLight*150 for both components when the
// refdef has RDF_NOWORLDMODEL, then applies the renderer's unconditional
// 32-unit minimum-light add. The software renderer uses identityLight 1.0.
/// @param grid Record providing `grid.dynamicLights`.
/// @param point Value forwarded as `point` to `mq3.renderer.playable_light_grid.withDynamicLights`.
function noWorldEntitySample(grid,point)
  direction=[0.45,0.3,0.9];qmath.VectorNormalize(direction)
  value=Sample([NOWORLD_AMBIENT,NOWORLD_AMBIENT,NOWORLD_AMBIENT],[NOWORLD_DIRECTED,NOWORLD_DIRECTED,NOWORLD_DIRECTED],direction,1.0)
  if grid!=void then value=withDynamicLights(value,point,grid.dynamicLights) end if;return value
end function
/// Combines ambient and directional grid lighting against a vertex normal and clamps the resulting brightness.
/// @param value Record providing `value.direction`, `value.ambient`, `value.directed`.
/// @param normal Argument 1 supplied to `mq3.shared.math.DotProduct`.
function vertexLight(value,normal)
  if value==void or normal==void then return 1.0 end if;dot=qmath.DotProduct(normal,value.direction);if dot<0.0 then dot=0.0 end if
  brightness=(value.ambient[0]+value.ambient[1]+value.ambient[2]+dot*(value.directed[0]+value.directed[1]+value.directed[2]))/(255.0*3.0);if brightness<0.0 then brightness=0.0 end if;if brightness>1.0 then brightness=1.0 end if;return brightness
end function
/// Computes `vertexColor` from `color+[255]` using `mq3.shared.math.DotProduct`, `mq3.compat.numeric.trunc32`.
/// @param value Record providing `value.direction`, `value.ambient`, `value.directed`.
/// @param normal Argument 1 supplied to `mq3.shared.math.DotProduct`.
function vertexColor(value,normal)
  if value==void or normal==void then return [255,255,255,255] end if
  incoming=qmath.DotProduct(normal,value.direction);if incoming<0.0 then incoming=0.0 end if;color=[]
  for channel=0 to 2 component=numeric.trunc32(value.ambient[channel]+incoming*value.directed[channel]);if component<0 then component=0 end if;if component>255 then component=255 end if;color=color+[component] end for
  return color+[255]
end function
/// Updates `color[0]`, `color[1]`, `color[2]`, `color[3]`, `color[channel]` in `mq3.renderer.playable_light_grid.vertexColorInto`; returns `color`.
/// @param value Record providing `value.direction`, `value.ambient`, `value.directed`.
/// @param normal Value forwarded as `normal` to `mq3.renderer.playable_light_grid.vertexColor`.
/// @param color Mutable record or buffer; this call updates `color[0]`, `color[1]`, `color[2]`, `color[3]`, `color[channel]`.
function vertexColorInto(value,normal,color)
  if color==void or len(color)!=4 then return vertexColor(value,normal) end if
  if value==void or normal==void then color[0]=255;color[1]=255;color[2]=255;color[3]=255;return color end if
  incoming=qmath.DotProduct(normal,value.direction);if incoming<0.0 then incoming=0.0 end if
  for channel=0 to 2 component=numeric.trunc32(value.ambient[channel]+incoming*value.directed[channel]);if component<0 then component=0 end if;if component>255 then component=255 end if;color[channel]=component end for
  color[3]=255;return color
end function
