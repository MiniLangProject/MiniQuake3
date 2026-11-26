// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 BSP light-flare parsing, depth visibility, fading and screen quads.
package mq3.renderer.playable_flares

import mq3.compat.numeric as n
import mq3.client.playable_viewer as viewer
import mq3.platform.playable_window as window
import mq3.platform.playable_multitexture as multitexture
import mq3.renderer.playable_materials as materials
import mq3.renderer.playable_fog as playableFog

const MST_FLARE=4
const FACE_STRIDE=104
const DEFAULT_SIZE=40.0
const DEFAULT_FADE=7.0
const VISIBILITY_TOLERANCE=24.0
const MAX_VIEW_STATES=16

/// Data record for `mq3.renderer.playable_flares.Flare`; groups `faceIndex`, `textureIndex`, `fogIndex`, `origin`, `color`, `normal`.
struct Flare faceIndex textureIndex fogIndex origin color normal end struct
/// Data record for `mq3.renderer.playable_flares.State`; groups `visible`, `fadeTime`, `drawIntensity`.
struct State visible fadeTime drawIntensity end struct
/// Data record for `mq3.renderer.playable_flares.Catalog`; groups `flares`, `states`, `dynamicStates`, `textureSlot`, `image`, `enabled`.
struct Catalog flares states dynamicStates textureSlot image enabled end struct
/// Data record for `mq3.renderer.playable_flares.Point`; groups `x`, `y`, `depth`.
struct Point x y depth end struct

/// Creates error `7696` with message `"playable flares: "+message`.
/// @param message Input used in the result expression `error(7696,"playable flares: "+message)`.
function fail(message) return error(7696,"playable flares: "+message) end function
/// Computes `map!=void and typeof(map.data)=="bytes" and map.offsets!=void and len(map.offsets)>13 and map.counts!=void and len(map.counts)>13` for `mq3.renderer.playable_flares.validMap`.
/// @param map Record providing `map.data`, `map.offsets`, `map.counts`.
function validMap(map) return map!=void and typeof(map.data)=="bytes" and map.offsets!=void and len(map.offsets)>13 and map.counts!=void and len(map.counts)>13 end function
/// Returns `n.bitsFloat(value)` from `mq3.renderer.playable_flares.f32`; earlier branches return `fail("truncated float")`.
/// @param map Record providing `map.data`.
/// @param offset Argument 2 supplied to `mq3.compat.numeric.readU32`.
function f32(map,offset) value=n.readU32(map.data,offset);if value is error then return fail("truncated float") end if;return n.bitsFloat(value) end function
/// Returns `value` from `mq3.renderer.playable_flares.i32`; earlier branches return `fail("truncated integer")`.
/// @param map Record providing `map.data`.
/// @param offset Argument 2 supplied to `mq3.compat.numeric.readI32`.
function i32(map,offset) value=n.readI32(map.data,offset);if value is error then return fail("truncated integer") end if;return value end function

// ParseFlare in tr_bsp.c copies these fields directly from dsurface_t.
/// @param map Record providing `map.counts`, `map.offsets`, `map.data`.
function parse(map)
  if not validMap(map) then return fail("invalid BSP") end if
  result=[]
  for faceIndex=0 to map.counts[13]-1
    offset=map.offsets[13]+faceIndex*FACE_STRIDE
    if offset<0 or offset+FACE_STRIDE>len(map.data) then return fail("face outside BSP") end if
    kind=i32(map,offset+8);if kind is error then return kind end if
    if kind==MST_FLARE then
      textureIndex=i32(map,offset);fogIndex=i32(map,offset+4)
      if textureIndex is error or fogIndex is error then return fail("truncated flare face") end if
      if textureIndex<0 or textureIndex>=map.counts[1] then return fail("flare shader index outside BSP") end if
      origin=[f32(map,offset+48),f32(map,offset+52),f32(map,offset+56)]
      color=[f32(map,offset+60),f32(map,offset+64),f32(map,offset+68)]
      normal=[f32(map,offset+84),f32(map,offset+88),f32(map,offset+92)]
      result=result+[Flare(faceIndex,textureIndex,fogIndex+1,origin,color,normal)]
    end if
  end for
  return result
end function

/// Returns `result` from `mq3.renderer.playable_flares.makeStates`.
/// @param count Input used by `for index=0 to count-1 result=result+[State(false,0,0.0)]`.
function makeStates(count) result=[];for index=0 to count-1 result=result+[State(false,0,0.0)] end for;return result end function
/// Updates `catalog.states` in `mq3.renderer.playable_flares.ensureView`; returns `catalog.states[viewIndex]`.
/// @param catalog Mutable record or buffer; this call updates `catalog.states`.
/// @param viewIndex Input tested by `viewIndex<0 or viewIndex>=MAX_VIEW_STATES`.
function ensureView(catalog,viewIndex)
  if viewIndex<0 or viewIndex>=MAX_VIEW_STATES then return fail("view index outside flare state range") end if
  while len(catalog.states)<=viewIndex catalog.states=catalog.states+[makeStates(len(catalog.flares))] end while
  return catalog.states[viewIndex]
end function

/// Builds `mq3.renderer.playable_flares.Catalog` using `mq3.renderer.playable_materials.mappedImageName`, `mq3.renderer.playable_materials.loadImage`.
/// @param archive Argument 1 supplied to `mq3.renderer.playable_materials.loadImage`.
/// @param map Value forwarded as `map` to `mq3.renderer.playable_flares.parse`.
/// @param scripts Argument 1 supplied to `mq3.renderer.playable_materials.mappedImageName`.
/// @param textureSlot Initial value for `mq3.renderer.playable_flares.Catalog.textureSlot`.
/// @param enabled Input tested by `enabled or len(flares)>0`.
function load(archive,map,scripts,textureSlot,enabled)
  flares=parse(map);if flares is error then return flares end if
  if textureSlot<0 or textureSlot>=window.NATIVE_TEXTURE_SLOTS then return fail("invalid texture slot") end if
  image=void
  if enabled or len(flares)>0 then
    name=materials.mappedImageName(scripts,"flareShader");if name==void then name="gfx/misc/flare" end if
    loaded=materials.loadImage(archive,name);if loaded!=void then image=loaded[1] end if
  end if
  return Catalog(flares,[],[],textureSlot,image,enabled and image!=void)
end function
/// Uploads the enabled flare catalog image to its assigned texture slot and reports upload failure.
/// @param catalog Record providing `catalog.enabled`, `catalog.textureSlot`, `catalog.image`.
function upload(catalog)
  if catalog==void then return fail("missing catalog") end if
  if not catalog.enabled then return 0 end if
  if not window.uploadTextureNoMip(catalog.textureSlot,catalog.image.pixels,catalog.image.width,catalog.image.height) then return fail("could not upload flare texture") end if
  return 1
end function
/// Returns `void` from `mq3.renderer.playable_flares.release`.
/// @param catalog Record providing `catalog.image`, `catalog.textureSlot`.
function release(catalog) if catalog!=void and catalog.image!=void then window.releaseTexture(catalog.textureSlot) end if;return void end function

// RB_TestFlare changes visibility at now-1 and clamps the linear fade.
/// @param state Mutable record or buffer; this call updates `state.visible`, `state.fadeTime`, `state.drawIntensity`.
/// @param visible Input tested by `visible`.
/// @param nowMilliseconds Input used by `state.fadeTime=nowMilliseconds-1`.
/// @param fadeRate Input tested by `fadeRate<0.0`.
function updateState(state,visible,nowMilliseconds,fadeRate)
  if fadeRate<0.0 then return fail("negative fade rate") end if
  fade=0.0
  if visible then
    if not state.visible then state.visible=true;state.fadeTime=nowMilliseconds-1 end if
    fade=(nowMilliseconds-state.fadeTime)*0.001*fadeRate
  else
    if state.visible then state.visible=false;state.fadeTime=nowMilliseconds-1 end if
    fade=1.0-(nowMilliseconds-state.fadeTime)*0.001*fadeRate
  end if
  if fade<0.0 then fade=0.0 end if;if fade>1.0 then fade=1.0 end if
  state.drawIntensity=fade;return fade
end function
/// Computes `surfaceDepth>0.0 and flareDepth-surfaceDepth<VISIBILITY_TOLERANCE` for `mq3.renderer.playable_flares.visibleAtDepth`.
/// @param flareDepth Input used in the result expression `surfaceDepth>0.0 and flareDepth-surfaceDepth<VISIBILITY_TOLERANCE`.
/// @param surfaceDepth Input used in the result expression `surfaceDepth>0.0 and flareDepth-surfaceDepth<VISIBILITY_TOLERANCE`.
function visibleAtDepth(flareDepth,surfaceDepth) return surfaceDepth>0.0 and flareDepth-surfaceDepth<VISIBILITY_TOLERANCE end function
/// Returns `viewportWidth*(sizeValue/640.0+8.0/eyeDepth)` from `mq3.renderer.playable_flares.flareSize`; earlier branches return `0.0`.
/// @param viewportWidth Input tested by `viewportWidth<1 or eyeDepth<=0.0`.
/// @param eyeDepth Input tested by `viewportWidth<1 or eyeDepth<=0.0`.
/// @param sizeValue Input used in the result expression `viewportWidth*(sizeValue/640.0+8.0/eyeDepth)`.
function flareSize(viewportWidth,eyeDepth,sizeValue) if viewportWidth<1 or eyeDepth<=0.0 then return 0.0 end if;return viewportWidth*(sizeValue/640.0+8.0/eyeDepth) end function
/// Returns `(dx*normal[0]+dy*normal[1]+dz*normal[2])/length` from `mq3.renderer.playable_flares.facing`; earlier branches return `0.0`.
/// @param origin Three-component vector read at indices 0, 1, and 2.
/// @param point Three-component vector read at indices 0, 1, and 2.
/// @param normal Three-component vector read at indices 0, 1, and 2.
function facing(origin,point,normal)
  dx=origin[0]-point[0];dy=origin[1]-point[1];dz=origin[2]-point[2];length=n.fsqrt(dx*dx+dy*dy+dz*dz)
  if length<=0.0 then return 0.0 end if
  return (dx*normal[0]+dy*normal[1]+dz*normal[2])/length
end function
/// Returns `n.trunc32(value)` from `mq3.renderer.playable_flares.colorByte`; earlier branches return `0`, `255`.
/// @param value Argument 1 supplied to `mq3.compat.numeric.trunc32`.
function colorByte(value) if value<0.0 then return 0 end if;if value>255.0 then return 255 end if;return n.trunc32(value) end function

// RB_AddDlightFlares assigns each submitted light to the first fog whose
// axial brush bounds contain its origin.  Fog zero is the outside fallback.
/// @param fogCatalog Record providing `fogCatalog.fogs`.
/// @param origin Three-component vector read at indices 0, 1, and 2.
function fogIndexAt(fogCatalog,origin)
  if fogCatalog==void or origin==void or len(origin)!=3 then return 0 end if
  for fogIndex=1 to len(fogCatalog.fogs)-1
    fog=fogCatalog.fogs[fogIndex]
    if fog!=void and origin[0]>=fog.bounds[0][0] and origin[0]<=fog.bounds[1][0] and origin[1]>=fog.bounds[0][1] and origin[1]<=fog.bounds[1][1] and origin[2]>=fog.bounds[0][2] and origin[2]<=fog.bounds[1][2] then return fogIndex end if
  end for
  return 0
end function

/// Updates `catalog.dynamicStates`, `catalog.dynamicStates[viewIndex]` in `mq3.renderer.playable_flares.ensureDynamicView`; returns `states`.
/// @param catalog Mutable record or buffer; this call updates `catalog.dynamicStates`, `catalog.dynamicStates[viewIndex]`.
/// @param viewIndex Input tested by `viewIndex<0 or viewIndex>=MAX_VIEW_STATES`.
/// @param count Input used by `while len(states)<count states=states+[State(false,0,0.0)]`.
function ensureDynamicView(catalog,viewIndex,count)
  if viewIndex<0 or viewIndex>=MAX_VIEW_STATES then return fail("view index outside flare state range") end if
  while len(catalog.dynamicStates)<=viewIndex catalog.dynamicStates=catalog.dynamicStates+[[]] end while
  states=catalog.dynamicStates[viewIndex];while len(states)<count states=states+[State(false,0,0.0)] end while;catalog.dynamicStates[viewIndex]=states;return states
end function

// RB_RenderFlares frees active entries that were not submitted this frame.
// Slot identity matches the stable refdef dlight-array address used by Baseq3.
/// @param states Mutable record or buffer; this call updates `states[index].visible`, `states[index].fadeTime`, `states[index].drawIntensity`.
/// @param submittedCount Input used by `for index=submittedCount to len(states)-1 states[index].visible=false`.
/// @param nowMilliseconds Input used by `states[index].fadeTime=nowMilliseconds-2000`.
function retireDynamicStates(states,submittedCount,nowMilliseconds)
  for index=submittedCount to len(states)-1 states[index].visible=false;states[index].fadeTime=nowMilliseconds-2000;states[index].drawIntensity=0.0 end for;return states
end function

// RB_RenderFlare begins flareShader with the retained fog number. Its additive
// blend selects ACFF_MODULATE_RGB in FinishShader, so fog attenuates RGB only.
/// @param flare Record providing `flare.fogIndex`, `flare.origin`.
/// @param color Argument 1 supplied to `mq3.renderer.playable_materials.modulateForFog`.
/// @param fogCatalog Record providing `fogCatalog.fogs`.
/// @param viewOrigin Argument 3 supplied to `mq3.renderer.playable_fog.density`.
/// @param forward Argument 4 supplied to `mq3.renderer.playable_fog.density`.
function foggedColor(flare,color,fogCatalog,viewOrigin,forward)
  if fogCatalog==void or flare.fogIndex<=0 or flare.fogIndex>=len(fogCatalog.fogs) then return color end if
  density=playableFog.density(fogCatalog.fogs[flare.fogIndex],flare.origin,viewOrigin,forward)
  return materials.modulateForFog(color,density,"rgb")
end function

/// Projects a flare, tests on-screen depth visibility, updates its fade state, and submits its visible quad.
/// @param catalog Record providing `catalog.textureSlot`.
/// @param fogCatalog Value forwarded as `fogCatalog` to `mq3.renderer.playable_flares.foggedColor`.
/// @param flare Record providing `flare.origin`, `flare.normal`, `flare.color`.
/// @param state Value forwarded as `state` to `mq3.renderer.playable_flares.updateState`.
/// @param projection Record providing `projection.position`, `projection.forward`.
/// @param area Record providing `area.x`, `area.width`, `area.y`, `area.height`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_flares.updateState`.
/// @param applyFacing Input tested by `applyFacing`.
function drawOne(catalog,fogCatalog,flare,state,projection,area,nowMilliseconds,applyFacing)
  screen=viewer.projectPrepared(projection,flare.origin);onscreen=screen!=void and not (screen is error)
  if onscreen then onscreen=screen.x>=area.x and screen.x<area.x+area.width and screen.y>=area.y and screen.y<area.y+area.height end if
  visible=false
  if onscreen then sampled=window.sampleDepth(screen.x,screen.y);visible=visibleAtDepth(screen.depth,sampled) end if
  intensity=updateState(state,visible,nowMilliseconds,DEFAULT_FADE);if intensity is error then return intensity end if
  if not onscreen or intensity<=0.0 then return 0 end if
  direction=1.0;if applyFacing then direction=facing(projection.position,flare.origin,flare.normal);if direction<0.0 then direction=0.0 end if end if
  red=colorByte(flare.color[0]*direction*intensity*255.0);green=colorByte(flare.color[1]*direction*intensity*255.0);blue=colorByte(flare.color[2]*direction*intensity*255.0)
  color=foggedColor(flare,[red,green,blue,255],fogCatalog,projection.position,projection.forward);red=color[0];green=color[1];blue=color[2]
  size=flareSize(area.width,screen.depth,DEFAULT_SIZE)
  if size<=0.0 or (red<=0 and green<=0 and blue<=0) then return 0 end if
  depth=0.001;a=Point(screen.x-size,screen.y-size,depth);b=Point(screen.x-size,screen.y+size,depth);c=Point(screen.x+size,screen.y+size,depth);d=Point(screen.x+size,screen.y-size,depth)
  window.drawTriangleColored(catalog.textureSlot,a,[0.0,0.0],color,b,[0.0,1.0],color,c,[1.0,1.0],color,255,255,255)
  window.drawTriangleColored(catalog.textureSlot,a,[0.0,0.0],color,c,[1.0,1.0],color,d,[1.0,0.0],color,255,255,255);return 1
end function

/// Draws enabled static and dynamic flares for one view using persistent per-view visibility state.
/// @param catalog Record providing `catalog.enabled`, `catalog.flares`.
/// @param fogCatalog Value forwarded as `fogCatalog` to `mq3.renderer.playable_flares.drawOne`.
/// @param lights Indexed input read at `index`.
/// @param projection Value forwarded as `projection` to `mq3.renderer.playable_flares.drawOne`.
/// @param area Value forwarded as `area` to `mq3.renderer.playable_flares.drawOne`.
/// @param nowMilliseconds Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_flares.drawOne`.
/// @param viewIndex Value forwarded as `viewIndex` to `mq3.renderer.playable_flares.ensureView`.
function drawViewport(catalog,fogCatalog,lights,projection,area,nowMilliseconds,viewIndex)
  if catalog==void then return 0 end if
  if projection==void or area==void then return fail("projection and viewport are required") end if
  if not catalog.enabled then return 0 end if
  states=ensureView(catalog,viewIndex);if states is error then return states end if
  dynamicCount=0;if lights!=void then dynamicCount=len(lights) end if
  dynamicStates=ensureDynamicView(catalog,viewIndex,dynamicCount);if dynamicStates is error then return dynamicStates end if
  drawn=0
  stateValue=multitexture.setState(multitexture.BLEND_ADD,false,false);if stateValue is error then return stateValue end if
  stateValue=multitexture.setTextureClamp(true);if stateValue is error then return stateValue end if
  for index=0 to len(catalog.flares)-1
    added=drawOne(catalog,fogCatalog,catalog.flares[index],states[index],projection,area,nowMilliseconds,true);if added is error then return added end if;drawn=drawn+added
  end for
  // RB_AddDlightFlares passes a null normal, so dynamic-light color does not
  // receive BSP-surface facing attenuation.  It otherwise shares depth,
  // fade, size, flareShader and fog behavior with retained BSP flares.
  for index=0 to dynamicCount-1
    light=lights[index];flare=Flare(-1,-1,fogIndexAt(fogCatalog,light.origin),light.origin,light.color,void)
    added=drawOne(catalog,fogCatalog,flare,dynamicStates[index],projection,area,nowMilliseconds,false);if added is error then return added end if;drawn=drawn+added
  end for
  retireDynamicStates(dynamicStates,dynamicCount,nowMilliseconds)
  multitexture.setTextureClamp(false);multitexture.setState(multitexture.BLEND_OPAQUE,false,true);return drawn
end function
