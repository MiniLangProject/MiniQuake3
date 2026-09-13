// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3's projected dynamic-light texture pass for retained BSP triangles.
package mq3.renderer.playable_dynamic_lights
import mq3.compat.numeric as n
import mq3.client.playable_viewer as viewer
import mq3.platform.playable_window as window
import mq3.platform.playable_multitexture as multitexture
import mq3.renderer.playable_materials as materials

const DLIGHT_SIZE=16
struct Catalog textureSlot image end struct
struct Batch commands triangles end struct
struct VertexResult uv color clip end struct
struct Light origin radius color additive end struct

function fail(message) return error(7630,"playable dynamic lights: "+message) end function

function textureImage()
  pixels=bytes(DLIGHT_SIZE*DLIGHT_SIZE*4,255)
  for y=0 to DLIGHT_SIZE-1
    for x=0 to DLIGHT_SIZE-1
      dx=DLIGHT_SIZE/2-0.5-x;dy=DLIGHT_SIZE/2-0.5-y;brightness=n.trunc32(4000.0/(dx*dx+dy*dy));if brightness>255 then brightness=255 else if brightness<75 then brightness=0 end if
      offset=(y*DLIGHT_SIZE+x)*4;pixels[offset]=brightness;pixels[offset+1]=brightness;pixels[offset+2]=brightness
    end for
  end for
  return materials.Image(DLIGHT_SIZE,DLIGHT_SIZE,pixels)
end function

function createCatalog(slot) if slot<0 or slot>=512 then return fail("invalid texture slot") end if;return Catalog(slot,textureImage()) end function
function upload(catalog) if catalog==void or not window.uploadTextureNoMip(catalog.textureSlot,catalog.image.pixels,catalog.image.width,catalog.image.height) then return fail("could not upload projected-light texture") end if;return 1 end function
function release(catalog) if catalog!=void then window.releaseTexture(catalog.textureSlot) end if;return void end function

function build(renderData,receiveFlags)
  if renderData==void or receiveFlags==void then return fail("render data and receive flags are required") end if
  triangles=[]
  for each triangle in renderData.triangles if triangle.textureIndex>=0 and triangle.textureIndex<len(receiveFlags) and receiveFlags[triangle.textureIndex] then triangles=triangles+[triangle] end if end for
  capacity=len(triangles);if capacity<1 then capacity=1 end if;commands=window.createTriangleBatch(capacity);if commands is error then return commands end if
  return Batch(commands,triangles)
end function

function vertex(light,position)
  scale=1.0/light.radius;dx=light.origin[0]-position[0];dy=light.origin[1]-position[1];dz=light.origin[2]-position[2];u=0.5+dx*scale;v=0.5+dy*scale;clip=0;modulate=0.0
  if u<0.0 then clip=clip+1 else if u>1.0 then clip=clip+2 end if;if v<0.0 then clip=clip+4 else if v>1.0 then clip=clip+8 end if
  if dz>light.radius then clip=clip+16;modulate=0.0 else if dz<0.0-light.radius then clip=clip+32;modulate=0.0 else absZ=dz;if absZ<0.0 then absZ=0.0-absZ end if;if absZ<light.radius*0.5 then modulate=1.0 else modulate=2.0*(light.radius-absZ)*scale end if end if
  return VertexResult([u,v],[n.trunc32(light.color[0]*255.0*modulate),n.trunc32(light.color[1]*255.0*modulate),n.trunc32(light.color[2]*255.0*modulate),255],clip)
end function

function update(batch,catalog,light)
  if batch==void or catalog==void or light==void or light.radius<=0.0 then return fail("invalid projected light") end if
  window.resetTriangleBatch(batch.commands)
  for each triangle in batch.triangles
    a=vertex(light,triangle.vertices[0].position);b=vertex(light,triangle.vertices[1].position);c=vertex(light,triangle.vertices[2].position)
    if (a.clip & b.clip & c.clip)!=0 then continue end if
    commands=window.appendSingleTextureTriangleColored(batch.commands,catalog.textureSlot,viewer.ScreenPoint(triangle.vertices[0].position[0],triangle.vertices[0].position[1],triangle.vertices[0].position[2]),a.uv,1.0,a.color,viewer.ScreenPoint(triangle.vertices[1].position[0],triangle.vertices[1].position[1],triangle.vertices[1].position[2]),b.uv,1.0,b.color,viewer.ScreenPoint(triangle.vertices[2].position[0],triangle.vertices[2].position[1],triangle.vertices[2].position[2]),c.uv,1.0,c.color,255,255,255);if commands is error then return commands end if
  end for
  return batch.commands.count
end function

function draw(batch,catalog,lights,projection)
  if batch==void or catalog==void or lights==void then return fail("dynamic-light draw inputs are required") end if
  drawn=0;multitexture.setAlphaTest(multitexture.ALPHA_TEST_NONE);multitexture.setPolygonOffset(false);multitexture.setTextureClamp(true)
  for each light in lights
    count=update(batch,catalog,light);if count is error then return count end if
    if count>0 then blend=multitexture.BLEND_DYNAMIC_LIGHT;if light.additive then blend=multitexture.BLEND_ADD end if;multitexture.setState(blend,true,false);value=window.submitWorldTriangleBatch(batch.commands,projection);if value is error then return value end if;drawn=drawn+value end if
  end for
  multitexture.setTextureClamp(false);multitexture.setState(multitexture.BLEND_OPAQUE,false,true);return drawn
end function
