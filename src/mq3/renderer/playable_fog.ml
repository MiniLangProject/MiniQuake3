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
const FOG_TEXTURE_WIDTH=256
const FOG_TEXTURE_HEIGHT=32

/// Data record for `mq3.renderer.playable_fog.Fog`; groups `shaderName`, `color`, `depth`, `tcScale`, `bounds`, `surface`, and 1 further field.
struct Fog shaderName color depth tcScale bounds surface hasSurface end struct
/// Data record for `mq3.renderer.playable_fog.Catalog`; groups `fogs`, `textureSlot`, `texture`.
struct Catalog fogs textureSlot texture end struct
/// Data record for `mq3.renderer.playable_fog.FogBatch`; groups `commands`, `sourcePositions`, `fogIndexes`.
struct FogBatch commands sourcePositions fogIndexes end struct

/// Creates error `7620` with message `"playable fog: "+message`.
/// @param message Input used in the result expression `error(7620,"playable fog: "+message)`.
function fail(message) return error(7620,"playable fog: "+message) end function
/// Calls `mq3.compat.numeric.readI32` with `(map.data,offset)` and returns its result.
/// @param map Record providing `map.data`.
/// @param offset Argument 2 supplied to `mq3.compat.numeric.readI32`.
function i32(map,offset) return n.readI32(map.data,offset) end function
/// Calls `mq3.compat.numeric.bitsFloat` with `(n.readU32(map.data,offset))` and returns its result.
/// @param map Record providing `map.data`.
/// @param offset Argument 2 supplied to `mq3.compat.numeric.readU32`.
function f32(map,offset) return n.bitsFloat(n.readU32(map.data,offset)) end function
/// Returns `map.offsets[lump]+index*stride` from `mq3.renderer.playable_fog.recordOffset`; earlier branches return `fail("BSP fog reference outside lump")`.
/// @param map Record providing `map.counts`, `map.offsets`.
/// @param lump Input tested by `index<0 or index>=map.counts[lump]`.
/// @param index Input tested by `index<0 or index>=map.counts[lump]`.
/// @param stride Input used in the result expression `map.offsets[lump]+index*stride`.
function recordOffset(map,lump,index,stride) if index<0 or index>=map.counts[lump] then return fail("BSP fog reference outside lump") end if;return map.offsets[lump]+index*stride end function
/// Returns `decode(slice(map.data,offset,length))` from `mq3.renderer.playable_fog.recordName`.
/// @param map Record providing `map.data`.
/// @param offset Argument 2 supplied to `slice`.
function recordName(map,offset) length=0;while length<64 and map.data[offset+length]!=0 length=length+1 end while;return decode(slice(map.data,offset,length)) end function
/// Returns `[[f32(map,offset),f32(map,offset+4),f32(map,offset+8)],f32(map,offset+12)]` from `mq3.renderer.playable_fog.plane`; earlier branches return `offset`.
/// @param map Value forwarded as `map` to `mq3.renderer.playable_fog.recordOffset`.
/// @param index Value forwarded as `index` to `mq3.renderer.playable_fog.recordOffset`.
function plane(map,index) offset=recordOffset(map,2,index,PLANE_STRIDE);if offset is error then return offset end if;return [[f32(map,offset),f32(map,offset+4),f32(map,offset+8)],f32(map,offset+12)] end function

/// Builds `mq3.renderer.playable_fog.Catalog` using `mq3.renderer.shader_parser.parseIndexed`.
/// @param map Record providing `map.counts`.
/// @param index Argument 1 supplied to `mq3.renderer.shader_parser.parseIndexed`.
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
  return Catalog(fogs,-1,textureImage())
end function

/// Computes `fogFactor` from `trans.sqrt(index/255.0)` using `mq3.compat.numeric.trunc32`, `mq3.compat.transcendental.sqrt`.
/// @param s Input used by `s=s-1.0/512.0`.
/// @param t Input tested by `s<0.0 or t<1.0/32.0`.
function fogFactor(s,t)
  s=s-1.0/512.0;if s<0.0 or t<1.0/32.0 then return 0.0 end if
  if t<31.0/32.0 then s=s*(t-1.0/32.0)/(30.0/32.0) end if
  s=s*8.0;if s>1.0 then s=1.0 end if
  index=n.trunc32(s*255.0);if index<0 then index=0 end if;if index>255 then index=255 end if
  return trans.sqrt(index/255.0)
end function

/// Builds `pixels[(y*FOG_TEXTURE_WIDTH+x)*4+3]` in `mq3.renderer.playable_fog.textureImage`; returns `materials.Image(FOG_TEXTURE_WIDTH,FOG_TEXTURE_HEIGHT,pixels)`.
function textureImage()
  pixels=bytes(FOG_TEXTURE_WIDTH*FOG_TEXTURE_HEIGHT*4,255)
  for y=0 to FOG_TEXTURE_HEIGHT-1
    t=(y+0.5)/FOG_TEXTURE_HEIGHT
    for x=0 to FOG_TEXTURE_WIDTH-1
      s=(x+0.5)/FOG_TEXTURE_WIDTH;pixels[(y*FOG_TEXTURE_WIDTH+x)*4+3]=n.trunc32(255.0*fogFactor(s,t))
    end for
  end for
  return materials.Image(FOG_TEXTURE_WIDTH,FOG_TEXTURE_HEIGHT,pixels)
end function

/// Updates `catalog.textureSlot` in `mq3.renderer.playable_fog.assignTexture`; returns `1`.
/// @param catalog Mutable record or buffer; this call updates `catalog.textureSlot`.
/// @param slot Value assigned to `catalog.textureSlot`.
function assignTexture(catalog,slot)
  if catalog==void or slot<0 or slot>=window.NATIVE_TEXTURE_SLOTS then return fail("invalid fog texture slot") end if
  catalog.textureSlot=slot;return 1
end function

/// Uploads the fog lookup image to its assigned native texture slot.
/// @param catalog Record providing `catalog.textureSlot`, `catalog.texture`.
function upload(catalog)
  if catalog==void or catalog.textureSlot<0 then return fail("fog texture slot is not assigned") end if
  if not window.uploadTextureNoMip(catalog.textureSlot,catalog.texture.pixels,catalog.texture.width,catalog.texture.height) then return fail("could not upload fog lookup texture") end if
  return 1
end function

/// Returns `void` from `mq3.renderer.playable_fog.release`.
/// @param catalog Record providing `catalog.textureSlot`.
function release(catalog) if catalog!=void and catalog.textureSlot>=0 then window.releaseTexture(catalog.textureSlot) end if;return void end function

/// Computes `coordinates` from `[s,t]`.
/// @param fog Record providing `fog.tcScale`, `fog.hasSurface`, `fog.surface`.
/// @param position Three-component vector read at indices 0, 1, and 2.
/// @param viewOrigin Three-component vector read at indices 0, 1, and 2.
/// @param forward Three-component vector read at indices 0, 1, and 2.
function coordinates(fog,position,viewOrigin,forward)
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
  return [s,t]
end function

/// Returns `fogFactor(uv[0],uv[1])` from `mq3.renderer.playable_fog.density`.
/// @param fog Value forwarded as `fog` to `mq3.renderer.playable_fog.coordinates`.
/// @param position Value forwarded as `position` to `mq3.renderer.playable_fog.coordinates`.
/// @param viewOrigin Value forwarded as `viewOrigin` to `mq3.renderer.playable_fog.coordinates`.
/// @param forward Value forwarded as `forward` to `mq3.renderer.playable_fog.coordinates`.
function density(fog,position,viewOrigin,forward) uv=coordinates(fog,position,viewOrigin,forward);return fogFactor(uv[0],uv[1]) end function

/// Builds `mq3.renderer.playable_fog.FogBatch` after updating `positions[output]`, `indexes[output]`.
/// @param renderData Record providing `renderData.triangles`.
/// @param catalog Record providing `catalog.fogs`.
function build(renderData,catalog)
  if renderData==void or catalog==void then return fail("render data and fog catalog are required") end if
  count=0;for each triangle in renderData.triangles if triangle.fogIndex>0 and triangle.fogIndex<len(catalog.fogs) then count=count+1 end if end for
  capacity=count;if capacity<1 then capacity=1 end if;commands=window.createTriangleBatch(capacity);positions=array(count,void);indexes=array(count,0);output=0;zero=[0.0,0.0];clear=[255,255,255,0]
  for each triangle in renderData.triangles
    if triangle.fogIndex>0 and triangle.fogIndex<len(catalog.fogs) then
      a=triangle.vertices[0];b=triangle.vertices[1];c=triangle.vertices[2]
      commands=window.appendSingleTextureTriangleColored(commands,-1,viewer.ScreenPoint(a.position[0],a.position[1],a.position[2]),zero,1.0,clear,viewer.ScreenPoint(b.position[0],b.position[1],b.position[2]),zero,1.0,clear,viewer.ScreenPoint(c.position[0],c.position[1],c.position[2]),zero,1.0,clear,255,255,255)
      positions[output]=[a.position,b.position,c.position];indexes[output]=triangle.fogIndex;output=output+1
    end if
  end for
  return FogBatch(commands,positions,indexes)
end function

/// Computes `update` from `batch.commands.count` using `mq3.compat.numeric.trunc32`, `mq3.platform.playable_window.writeBatchI32`, `mq3.renderer.playable_fog.coordinates`.
/// @param batch Record providing `batch.commands`, `batch.fogIndexes`, `batch.sourcePositions`.
/// @param catalog Record providing `catalog.fogs`, `catalog.textureSlot`.
/// @param viewOrigin Value forwarded as `viewOrigin` to `mq3.renderer.playable_fog.coordinates`.
/// @param forward Value forwarded as `forward` to `mq3.renderer.playable_fog.coordinates`.
function update(batch,catalog,viewOrigin,forward)
  for triangleIndex=0 to batch.commands.count-1
    fog=catalog.fogs[batch.fogIndexes[triangleIndex]];offset=triangleIndex*window.TRIANGLE_BATCH_RECORD_BYTES
    red=n.trunc32(fog.color[0]*255.0);green=n.trunc32(fog.color[1]*255.0);blue=n.trunc32(fog.color[2]*255.0)
    window.writeBatchI32(batch.commands.data,offset,catalog.textureSlot)
    for vertex=0 to 2
      uv=coordinates(fog,batch.sourcePositions[triangleIndex][vertex],viewOrigin,forward);uvOffset=offset+32+vertex*32
      window.writeBatchF32(batch.commands.data,uvOffset,uv[0]);window.writeBatchF32(batch.commands.data,uvOffset+4,uv[1]);window.writeBatchColor(batch.commands.data,offset+116+vertex*4,[red,green,blue,255])
    end for
  end for
  return batch.commands.count
end function

/// Updates view-dependent fog coordinates and draws the fog pass using alpha blending and equal-depth testing.
/// @param batch Record providing `batch.commands`.
/// @param catalog Record providing `catalog.textureSlot`.
/// @param projection Record providing `projection.position`, `projection.forward`.
/// @param area Argument 3 supplied to `mq3.platform.playable_window.submitWorldTriangleBatchViewport`.
function drawTarget(batch,catalog,projection,area)
  if batch==void or batch.commands.count==0 then return 0 end if
  if catalog==void or catalog.textureSlot<0 then return fail("fog texture is unavailable") end if
  result=0;update(batch,catalog,projection.position,projection.forward);multitexture.setState(multitexture.BLEND_ALPHA,true,false);multitexture.setTextureClamp(true);if area==void then result=window.submitWorldTriangleBatch(batch.commands,projection) else result=window.submitWorldTriangleBatchViewport(batch.commands,projection,area) end if;multitexture.setTextureClamp(false);multitexture.setState(multitexture.BLEND_OPAQUE,false,true);return result
end function
/// Calls `mq3.renderer.playable_fog.drawTarget` with `(batch,catalog,projection,void)` and returns its result.
/// @param batch Value forwarded as `batch` to `mq3.renderer.playable_fog.drawTarget`.
/// @param catalog Value forwarded as `catalog` to `mq3.renderer.playable_fog.drawTarget`.
/// @param projection Value forwarded as `projection` to `mq3.renderer.playable_fog.drawTarget`.
function draw(batch,catalog,projection) return drawTarget(batch,catalog,projection,void) end function
/// Calls `mq3.renderer.playable_fog.drawTarget` with `(batch,catalog,projection,area)` and returns its result.
/// @param batch Value forwarded as `batch` to `mq3.renderer.playable_fog.drawTarget`.
/// @param catalog Value forwarded as `catalog` to `mq3.renderer.playable_fog.drawTarget`.
/// @param projection Value forwarded as `projection` to `mq3.renderer.playable_fog.drawTarget`.
/// @param area Value forwarded as `area` to `mq3.renderer.playable_fog.drawTarget`.
function drawViewport(batch,catalog,projection,area) return drawTarget(batch,catalog,projection,area) end function
