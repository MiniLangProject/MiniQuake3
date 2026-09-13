// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// BSP fog volumes and the Baseq3 fog-density overlay for the playable renderer.
package mq3.renderer.playable_fog
import mq3.compat.numeric as n
import mq3.compat.transcendental as trans
import mq3.renderer.playable_materials as materials
import mq3.renderer.shader_parser as shaderParser
import mq3.platform.playable_window as window
import mq3.platform.playable_multitexture as multitexture
import mq3.client.playable_viewer as viewer

const FOG_STRIDE=72
const BRUSH_STRIDE=12
const BRUSH_SIDE_STRIDE=8
const PLANE_STRIDE=16

struct Fog shaderName color depth tcScale bounds surface hasSurface end struct
struct Catalog fogs end struct
struct FogBatch commands sourcePositions fogIndexes end struct

function fail(message) return error(7620,"playable fog: "+message) end function
function i32(map,offset) return n.readI32(map.data,offset) end function
function f32(map,offset) return n.bitsFloat(n.readU32(map.data,offset)) end function
function recordOffset(map,lump,index,stride) if index<0 or index>=map.counts[lump] then return fail("BSP fog reference outside lump") end if;return map.offsets[lump]+index*stride end function
function recordName(map,offset) length=0;while length<64 and map.data[offset+length]!=0 length=length+1 end while;return decode(slice(map.data,offset,length)) end function
function plane(map,index) offset=recordOffset(map,2,index,PLANE_STRIDE);if offset is error then return offset end if;return [[f32(map,offset),f32(map,offset+4),f32(map,offset+8)],f32(map,offset+12)] end function

function load(map,index)
  if map==void or index==void then return fail("BSP and shader index are required") end if
  fogs=[void]
  for fogIndex=0 to map.counts[12]-1
    offset=recordOffset(map,12,fogIndex,FOG_STRIDE);name=recordName(map,offset);brushIndex=i32(map,offset+64);visibleSide=i32(map,offset+68)
    brushOffset=recordOffset(map,8,brushIndex,BRUSH_STRIDE);if brushOffset is error then return brushOffset end if;firstSide=i32(map,brushOffset);numSides=i32(map,brushOffset+4)
    if numSides<6 or firstSide<0 or firstSide+numSides>map.counts[9] then return fail("fog brush lacks six axial sides") end if
    distances=[]
    for side=0 to 5
      sideOffset=recordOffset(map,9,firstSide+side,BRUSH_SIDE_STRIDE);if sideOffset is error then return sideOffset end if;p=plane(map,i32(map,sideOffset));if p is error then return p end if;distances=distances+[p[1]]
    end for
    bounds=[[-distances[0],-distances[2],-distances[4]],[distances[1],distances[3],distances[5]]]
    parsed=shaderParser.parseIndexed(index,name);if parsed is error then return parsed end if;if parsed==void or parsed.fogDepth<=0.0 then return fail("missing fogParms for "+name) end if
    surface=[0.0,0.0,0.0,0.0];hasSurface=visibleSide>=0
    if hasSurface then
      if visibleSide>=numSides then return fail("fog visible side outside brush") end if
      sideOffset=recordOffset(map,9,firstSide+visibleSide,BRUSH_SIDE_STRIDE);p=plane(map,i32(map,sideOffset));if p is error then return p end if
      surface=[0.0-p[0][0],0.0-p[0][1],0.0-p[0][2],0.0-p[1]]
    end if
    depth=parsed.fogDepth;if depth<1.0 then depth=1.0 end if
    fogs=fogs+[Fog(name,parsed.fogColor,depth,1.0/(depth*8.0),bounds,surface,hasSurface)]
  end for
  return Catalog(fogs)
end function

function fogFactor(s,t)
  s=s-1.0/512.0;if s<0.0 or t<1.0/32.0 then return 0.0 end if
  if t<31.0/32.0 then s=s*(t-1.0/32.0)/(30.0/32.0) end if
  s=s*8.0;if s>1.0 then s=1.0 end if
  index=n.trunc32(s*255.0);if index<0 then index=0 end if;if index>255 then index=255 end if
  return trans.sqrt(index/255.0)
end function

function density(fog,position,viewOrigin,forward)
  dx=position[0]-viewOrigin[0];dy=position[1]-viewOrigin[1];dz=position[2]-viewOrigin[2]
  s=(dx*forward[0]+dy*forward[1]+dz*forward[2])*fog.tcScale+1.0/512.0
  t=31.0/32.0
  if fog.hasSurface then
    eyeT=viewOrigin[0]*fog.surface[0]+viewOrigin[1]*fog.surface[1]+viewOrigin[2]*fog.surface[2]-fog.surface[3]
    pointT=position[0]*fog.surface[0]+position[1]*fog.surface[1]+position[2]*fog.surface[2]-fog.surface[3]
    if eyeT<0.0 then
      if pointT<1.0 then t=1.0/32.0 else t=1.0/32.0+(30.0/32.0)*pointT/(pointT-eyeT) end if
    else
      if pointT<0.0 then t=1.0/32.0 else t=31.0/32.0 end if
    end if
  end if
  return fogFactor(s,t)
end function

function build(renderData,catalog)
  if renderData==void or catalog==void then return fail("render data and fog catalog are required") end if
  count=0;for each triangle in renderData.triangles if triangle.fogIndex>0 and triangle.fogIndex<len(catalog.fogs) then count=count+1 end if end for
  capacity=count;if capacity<1 then capacity=1 end if;commands=window.createTriangleBatch(capacity);positions=[];indexes=[];zero=[0.0,0.0];clear=[255,255,255,0]
  for each triangle in renderData.triangles
    if triangle.fogIndex>0 and triangle.fogIndex<len(catalog.fogs) then
      a=triangle.vertices[0];b=triangle.vertices[1];c=triangle.vertices[2]
      commands=window.appendSingleTextureTriangleColored(commands,-1,viewer.ScreenPoint(a.position[0],a.position[1],a.position[2]),zero,1.0,clear,viewer.ScreenPoint(b.position[0],b.position[1],b.position[2]),zero,1.0,clear,viewer.ScreenPoint(c.position[0],c.position[1],c.position[2]),zero,1.0,clear,255,255,255)
      positions=positions+[[a.position,b.position,c.position]];indexes=indexes+[triangle.fogIndex]
    end if
  end for
  return FogBatch(commands,positions,indexes)
end function

function update(batch,catalog,viewOrigin,forward)
  for triangleIndex=0 to batch.commands.count-1
    fog=catalog.fogs[batch.fogIndexes[triangleIndex]];offset=triangleIndex*window.TRIANGLE_BATCH_RECORD_BYTES
    red=n.trunc32(fog.color[0]*255.0);green=n.trunc32(fog.color[1]*255.0);blue=n.trunc32(fog.color[2]*255.0)
    for vertex=0 to 2 alpha=n.trunc32(density(fog,batch.sourcePositions[triangleIndex][vertex],viewOrigin,forward)*255.0);window.writeBatchColor(batch.commands.data,offset+116+vertex*4,[red,green,blue,alpha]) end for
  end for
  return batch.commands.count
end function

function draw(batch,catalog,projection)
  if batch==void or batch.commands.count==0 then return 0 end if
  update(batch,catalog,projection.position,projection.forward);multitexture.setState(multitexture.BLEND_ALPHA,true,false);result=window.submitWorldTriangleBatch(batch.commands,projection);multitexture.setState(multitexture.BLEND_OPAQUE,false,true);return result
end function
