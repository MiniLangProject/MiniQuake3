// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 BSP light-flare parsing, depth visibility, fading and screen quads.
package mq3.renderer.playable_flares

import mq3.compat.numeric as n
import mq3.client.playable_viewer as viewer
import mq3.platform.playable_window as window
import mq3.platform.playable_multitexture as multitexture
import mq3.renderer.playable_materials as materials

const MST_FLARE=4
const FACE_STRIDE=104
const DEFAULT_SIZE=40.0
const DEFAULT_FADE=7.0
const VISIBILITY_TOLERANCE=24.0
const MAX_VIEW_STATES=16

struct Flare faceIndex textureIndex fogIndex origin color normal end struct
struct State visible fadeTime drawIntensity end struct
struct Catalog flares states textureSlot image enabled end struct
struct Point x y depth end struct

function fail(message) return error(7696,"playable flares: "+message) end function
function validMap(map) return map!=void and typeof(map.data)=="bytes" and map.offsets!=void and len(map.offsets)>13 and map.counts!=void and len(map.counts)>13 end function
function f32(map,offset) value=n.readU32(map.data,offset);if value is error then return fail("truncated float") end if;return n.bitsFloat(value) end function
function i32(map,offset) value=n.readI32(map.data,offset);if value is error then return fail("truncated integer") end if;return value end function

// ParseFlare in tr_bsp.c copies these fields directly from dsurface_t.
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

function makeStates(count) result=[];for index=0 to count-1 result=result+[State(false,0,0.0)] end for;return result end function
function ensureView(catalog,viewIndex)
  if viewIndex<0 or viewIndex>=MAX_VIEW_STATES then return fail("view index outside flare state range") end if
  while len(catalog.states)<=viewIndex catalog.states=catalog.states+[makeStates(len(catalog.flares))] end while
  return catalog.states[viewIndex]
end function

function load(archive,map,scripts,textureSlot,enabled)
  flares=parse(map);if flares is error then return flares end if
  if textureSlot<0 or textureSlot>=512 then return fail("invalid texture slot") end if
  image=void
  if len(flares)>0 then
    name=materials.mappedImageName(scripts,"flareShader");if name==void then name="gfx/misc/flare" end if
    loaded=materials.loadImage(archive,name);if loaded!=void then image=loaded[1] end if
  end if
  return Catalog(flares,[],textureSlot,image,enabled and image!=void)
end function
function upload(catalog)
  if catalog==void then return fail("missing catalog") end if
  if not catalog.enabled then return 0 end if
  if not window.uploadTextureNoMip(catalog.textureSlot,catalog.image.pixels,catalog.image.width,catalog.image.height) then return fail("could not upload flare texture") end if
  return 1
end function
function release(catalog) if catalog!=void and catalog.image!=void then window.releaseTexture(catalog.textureSlot) end if;return void end function

// RB_TestFlare changes visibility at now-1 and clamps the linear fade.
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
function visibleAtDepth(flareDepth,surfaceDepth) return surfaceDepth>0.0 and flareDepth-surfaceDepth<VISIBILITY_TOLERANCE end function
function flareSize(viewportWidth,eyeDepth,sizeValue) if viewportWidth<1 or eyeDepth<=0.0 then return 0.0 end if;return viewportWidth*(sizeValue/640.0+8.0/eyeDepth) end function
function facing(origin,point,normal)
  dx=origin[0]-point[0];dy=origin[1]-point[1];dz=origin[2]-point[2];length=n.fsqrt(dx*dx+dy*dy+dz*dz)
  if length<=0.0 then return 0.0 end if
  return (dx*normal[0]+dy*normal[1]+dz*normal[2])/length
end function
function colorByte(value) if value<0.0 then return 0 end if;if value>255.0 then return 255 end if;return n.trunc32(value) end function

function drawViewport(catalog,projection,area,nowMilliseconds,viewIndex)
  if catalog==void then return 0 end if
  if projection==void or area==void then return fail("projection and viewport are required") end if
  if not catalog.enabled or len(catalog.flares)==0 then return 0 end if
  states=ensureView(catalog,viewIndex);if states is error then return states end if
  drawn=0
  stateValue=multitexture.setState(multitexture.BLEND_ADD,false,false);if stateValue is error then return stateValue end if
  stateValue=multitexture.setTextureClamp(true);if stateValue is error then return stateValue end if
  for index=0 to len(catalog.flares)-1
    flare=catalog.flares[index];screen=viewer.projectPrepared(projection,flare.origin);onscreen=screen!=void and not (screen is error)
    if onscreen then onscreen=screen.x>=area.x and screen.x<area.x+area.width and screen.y>=area.y and screen.y<area.y+area.height end if
    visible=false
    if onscreen then sampled=window.sampleDepth(screen.x,screen.y);visible=visibleAtDepth(screen.depth,sampled) end if
    intensity=updateState(states[index],visible,nowMilliseconds,DEFAULT_FADE);if intensity is error then return intensity end if
    if onscreen and intensity>0.0 then
      direction=facing(projection.position,flare.origin,flare.normal);if direction<0.0 then direction=0.0 end if
      red=colorByte(flare.color[0]*direction*intensity*255.0);green=colorByte(flare.color[1]*direction*intensity*255.0);blue=colorByte(flare.color[2]*direction*intensity*255.0)
      size=flareSize(area.width,screen.depth,DEFAULT_SIZE)
      if size>0.0 and (red>0 or green>0 or blue>0) then
        depth=0.001;a=Point(screen.x-size,screen.y-size,depth);b=Point(screen.x-size,screen.y+size,depth);c=Point(screen.x+size,screen.y+size,depth);d=Point(screen.x+size,screen.y-size,depth);color=[red,green,blue,255]
        window.drawTriangleColored(catalog.textureSlot,a,[0.0,0.0],color,b,[0.0,1.0],color,c,[1.0,1.0],color,255,255,255)
        window.drawTriangleColored(catalog.textureSlot,a,[0.0,0.0],color,c,[1.0,1.0],color,d,[1.0,0.0],color,255,255,255);drawn=drawn+1
      end if
    end if
  end for
  multitexture.setTextureClamp(false);multitexture.setState(multitexture.BLEND_OPAQUE,false,true);return drawn
end function
