// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 BSP light-grid loading and trilinear entity-light sampling.
package mq3.renderer.playable_light_grid

import mq3.format.bsp as bsp
import mq3.compat.numeric as numeric
import mq3.compat.textnumbers as textnumbers
import mq3.compat.transcendental as trans
import mq3.shared.math as qmath

const DEFAULT_X=64.0
const DEFAULT_Y=64.0
const DEFAULT_Z=128.0
const PI=3.14159265358979323846
const MINLIGHT=32.0

struct Grid data offset length origin size inverse bounds valid end struct
struct Sample ambient directed direction totalFactor end struct

function fail(message) return error(7660,"playable light grid: "+message) end function
function floorNumber(value) result=numeric.trunc32(value);if value<result then result=result-1 end if;return result end function
function ceilNumber(value) result=floorNumber(value);if value>result then result=result+1 end if;return result end function

function worldGridSize(map)
  size=[DEFAULT_X,DEFAULT_Y,DEFAULT_Z];entities=bsp.entities(map);if entities is error or len(entities)==0 then return size end if
  for each field in entities[0] if stringEqualsIgnoreCaseAscii(field[0],"gridsize") then parsed=textnumbers.vector(field[1],size);if parsed[0]==3 and parsed[1][0]>0.0 and parsed[1][1]>0.0 and parsed[1][2]>0.0 then size=parsed[1] end if end if end for
  return size
end function

function load(map)
  if map==void or map.counts[7]<1 then return fail("world model is required") end if
  size=worldGridSize(map);model=map.offsets[7];mins=[numeric.bitsFloat(numeric.readU32(map.data,model)),numeric.bitsFloat(numeric.readU32(map.data,model+4)),numeric.bitsFloat(numeric.readU32(map.data,model+8))];maxs=[numeric.bitsFloat(numeric.readU32(map.data,model+12)),numeric.bitsFloat(numeric.readU32(map.data,model+16)),numeric.bitsFloat(numeric.readU32(map.data,model+20))]
  origin=[];bounds=[];inverse=[]
  for axis=0 to 2 first=size[axis]*ceilNumber(mins[axis]/size[axis]);last=size[axis]*floorNumber(maxs[axis]/size[axis]);origin=origin+[first];bounds=bounds+[numeric.trunc32((last-first)/size[axis])+1];inverse=inverse+[1.0/size[axis]] end for
  expected=bounds[0]*bounds[1]*bounds[2]*8;valid=map.lengths[15]==expected and expected>0
  return Grid(map.data,map.offsets[15],map.lengths[15],origin,size,inverse,bounds,valid)
end function

function shiftColor(red,green,blue)
  r=red*2;g=green*2;b=blue*2
  if (r | g | b)>255 then maximum=r;if g>maximum then maximum=g end if;if b>maximum then maximum=b end if;r=numeric.quotient(r*255,maximum);g=numeric.quotient(g*255,maximum);b=numeric.quotient(b*255,maximum) end if
  return [r,g,b]
end function
function emptySample() return Sample([0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,1.0],0.0) end function

function sample(grid,point)
  if grid==void or not grid.valid or point==void or len(point)!=3 then return emptySample() end if
  pos=[];frac=[]
  for axis=0 to 2 value=(point[axis]-grid.origin[axis])*grid.inverse[axis];cell=floorNumber(value);part=value-cell;if cell<0 then cell=0;part=0.0 else if cell>=grid.bounds[axis]-1 then cell=grid.bounds[axis]-1;part=0.0 end if;pos=pos+[cell];frac=frac+[part] end for
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

function entitySample(grid,point)
  value=sample(grid,point);for channel=0 to 2 value.ambient[channel]=value.ambient[channel]+MINLIGHT;if value.ambient[channel]>255.0 then value.ambient[channel]=255.0 end if end for;return value
end function
function vertexLight(value,normal)
  if value==void or normal==void then return 1.0 end if;dot=qmath.DotProduct(normal,value.direction);if dot<0.0 then dot=0.0 end if
  brightness=(value.ambient[0]+value.ambient[1]+value.ambient[2]+dot*(value.directed[0]+value.directed[1]+value.directed[2]))/(255.0*3.0);if brightness<0.0 then brightness=0.0 end if;if brightness>1.0 then brightness=1.0 end if;return brightness
end function
function vertexColor(value,normal)
  if value==void or normal==void then return [255,255,255,255] end if
  incoming=qmath.DotProduct(normal,value.direction);if incoming<0.0 then incoming=0.0 end if;color=[]
  for channel=0 to 2 component=numeric.trunc32(value.ambient[channel]+incoming*value.directed[channel]);if component<0 then component=0 end if;if component>255 then component=255 end if;color=color+[component] end for
  return color+[255]
end function
