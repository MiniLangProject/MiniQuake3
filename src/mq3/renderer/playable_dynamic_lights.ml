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
// origins/axes are parallel to triangles for moving brush models.  The
// original R_DlightBmodel transforms each world-space light into the model's
// local orientation before ProjectDlightTexture derives S/T and attenuation.
// Static world batches keep both arrays void and retain the cheaper path.
struct Batch commands triangles origins axes bounds end struct
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

function createCatalog(slot) if slot<0 or slot>=window.NATIVE_TEXTURE_SLOTS then return fail("invalid texture slot") end if;return Catalog(slot,textureImage()) end function
function upload(catalog) if catalog==void or not window.uploadTextureNoMip(catalog.textureSlot,catalog.image.pixels,catalog.image.width,catalog.image.height) then return fail("could not upload projected-light texture") end if;return 1 end function
function release(catalog) if catalog!=void then window.releaseTexture(catalog.textureSlot) end if;return void end function

function build(renderData,receiveFlags)
  if renderData==void or receiveFlags==void then return fail("render data and receive flags are required") end if
  count=0
  for each triangle in renderData.triangles if triangle.textureIndex>=0 and triangle.textureIndex<len(receiveFlags) and receiveFlags[triangle.textureIndex] then count=count+1 end if end for
  triangles=array(count,void);output=0
  for each triangle in renderData.triangles if triangle.textureIndex>=0 and triangle.textureIndex<len(receiveFlags) and receiveFlags[triangle.textureIndex] then triangles[output]=triangle;output=output+1 end if end for
  capacity=count;if capacity<1 then capacity=1 end if;commands=window.createTriangleBatch(capacity);if commands is error then return commands end if
  return Batch(commands,triangles,void,void,void)
end function

function buildOriented(renderData,receiveFlags,origins,axes,bounds)
  if renderData==void or receiveFlags==void or origins==void or axes==void or bounds==void or len(origins)!=len(renderData.triangles) or len(axes)!=len(renderData.triangles) or len(bounds)!=len(renderData.triangles) then return fail("oriented render data needs one origin, axis and bounds pair per triangle") end if
  count=0
  for each triangle in renderData.triangles if triangle.textureIndex>=0 and triangle.textureIndex<len(receiveFlags) and receiveFlags[triangle.textureIndex] then count=count+1 end if end for
  triangles=array(count,void);keptOrigins=array(count,void);keptAxes=array(count,void);keptBounds=array(count,void);sourceIndex=0;output=0
  for each triangle in renderData.triangles
    if triangle.textureIndex>=0 and triangle.textureIndex<len(receiveFlags) and receiveFlags[triangle.textureIndex] then triangles[output]=triangle;keptOrigins[output]=origins[sourceIndex];keptAxes[output]=axes[sourceIndex];keptBounds[output]=bounds[sourceIndex];output=output+1 end if
    sourceIndex=sourceIndex+1
  end for
  capacity=count;if capacity<1 then capacity=1 end if;commands=window.createTriangleBatch(capacity);if commands is error then return commands end if
  return Batch(commands,triangles,keptOrigins,keptAxes,keptBounds)
end function

function vertex(light,position)
  scale=1.0/light.radius;dx=light.origin[0]-position[0];dy=light.origin[1]-position[1];dz=light.origin[2]-position[2];u=0.5+dx*scale;v=0.5+dy*scale;clip=0;modulate=0.0
  if u<0.0 then clip=clip+1 else if u>1.0 then clip=clip+2 end if;if v<0.0 then clip=clip+4 else if v>1.0 then clip=clip+8 end if
  if dz>light.radius then clip=clip+16;modulate=0.0 else if dz<0.0-light.radius then clip=clip+32;modulate=0.0 else absZ=dz;if absZ<0.0 then absZ=0.0-absZ end if;if absZ<light.radius*0.5 then modulate=1.0 else modulate=2.0*(light.radius-absZ)*scale end if end if
  return VertexResult([u,v],[n.trunc32(light.color[0]*255.0*modulate),n.trunc32(light.color[1]*255.0*modulate),n.trunc32(light.color[2]*255.0*modulate),255],clip)
end function

function localPoint(point,origin,axis)
  if point==void or origin==void or axis==void or len(point)!=3 or len(origin)!=3 or len(axis)!=3 then return fail("oriented projected light needs origin and three axes") end if
  delta=[point[0]-origin[0],point[1]-origin[1],point[2]-origin[2]]
  return [delta[0]*axis[0][0]+delta[1]*axis[0][1]+delta[2]*axis[0][2],delta[0]*axis[1][0]+delta[1]*axis[1][1]+delta[2]*axis[1][2],delta[0]*axis[2][0]+delta[1]*axis[2][1]+delta[2]*axis[2][2]]
end function

function orientedVertex(light,position,origin,axis)
  localLight=localPoint(light.origin,origin,axis);if localLight is error then return localLight end if
  localPosition=localPoint(position,origin,axis);if localPosition is error then return localPosition end if
  return vertex(Light(localLight,light.radius,light.color,light.additive),localPosition)
end function

// Exact R_DlightBmodel point-to-expanded-bounds test after R_TransformDlights.
// The renderer stores the same result as a bit mask on every bmodel surface;
// the retained batch evaluates the equivalent predicate per light/model pair.
function affectsBounds(light,origin,axis,bounds)
  if light==void or light.radius<=0.0 or bounds==void or len(bounds)!=2 or len(bounds[0])!=3 or len(bounds[1])!=3 then return false end if
  transformed=localPoint(light.origin,origin,axis);if transformed is error then return transformed end if
  for component=0 to 2
    if transformed[component]-bounds[1][component]>light.radius or bounds[0][component]-transformed[component]>light.radius then return false end if
  end for
  return true
end function

function update(batch,catalog,light)
  if batch==void or catalog==void or light==void or light.radius<=0.0 then return fail("invalid projected light") end if
  window.resetTriangleBatch(batch.commands)
  triangleIndex=0
  for each triangle in batch.triangles
    a=void;b=void;c=void
    if batch.origins==void then a=vertex(light,triangle.vertices[0].position);b=vertex(light,triangle.vertices[1].position);c=vertex(light,triangle.vertices[2].position)
    else origin=batch.origins[triangleIndex];axis=batch.axes[triangleIndex];bounds=batch.bounds[triangleIndex];affected=affectsBounds(light,origin,axis,bounds);if affected is error then return affected end if;if not affected then triangleIndex=triangleIndex+1;continue end if;a=orientedVertex(light,triangle.vertices[0].position,origin,axis);b=orientedVertex(light,triangle.vertices[1].position,origin,axis);c=orientedVertex(light,triangle.vertices[2].position,origin,axis) end if
    if a is error then return a end if;if b is error then return b end if;if c is error then return c end if
    triangleIndex=triangleIndex+1
    if (a.clip & b.clip & c.clip)!=0 then continue end if
    commands=window.appendSingleTextureTriangleColored(batch.commands,catalog.textureSlot,viewer.ScreenPoint(triangle.vertices[0].position[0],triangle.vertices[0].position[1],triangle.vertices[0].position[2]),a.uv,1.0,a.color,viewer.ScreenPoint(triangle.vertices[1].position[0],triangle.vertices[1].position[1],triangle.vertices[1].position[2]),b.uv,1.0,b.color,viewer.ScreenPoint(triangle.vertices[2].position[0],triangle.vertices[2].position[1],triangle.vertices[2].position[2]),c.uv,1.0,c.color,255,255,255);if commands is error then return commands end if
  end for
  return batch.commands.count
end function

function drawTarget(batch,catalog,lights,projection,area)
  if batch==void or catalog==void or lights==void then return fail("dynamic-light draw inputs are required") end if
  drawn=0;value=0;multitexture.setAlphaTest(multitexture.ALPHA_TEST_NONE);multitexture.setPolygonOffset(false);multitexture.setTextureClamp(true)
  for each light in lights
    count=update(batch,catalog,light);if count is error then return count end if
    if count>0 then blend=multitexture.BLEND_DYNAMIC_LIGHT;if light.additive then blend=multitexture.BLEND_ADD end if;multitexture.setState(blend,true,false);if area==void then value=window.submitWorldTriangleBatch(batch.commands,projection) else value=window.submitWorldTriangleBatchViewport(batch.commands,projection,area) end if;if value is error then return value end if;drawn=drawn+value end if
  end for
  multitexture.setTextureClamp(false);multitexture.setState(multitexture.BLEND_OPAQUE,false,true);return drawn
end function
function draw(batch,catalog,lights,projection) return drawTarget(batch,catalog,lights,projection,void) end function
function drawViewport(batch,catalog,lights,projection,area) return drawTarget(batch,catalog,lights,projection,area) end function
