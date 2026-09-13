// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 cg_shadows=1 player blob shadows for the playable renderer.
package mq3.client.playable_player_shadows

import mq3.collision.world as collision
import mq3.renderer.playable_materials as materials
import mq3.client.playable_viewer as viewer
import mq3.platform.playable_window as window
import mq3.platform.playable_multitexture as multitexture
import mq3.shared.math as qmath
import mq3.compat.numeric as numeric
import mq3.compat.transcendental as trans

const SHADOW_DISTANCE=128.0
const SHADOW_RADIUS=24.0
const MASK_PLAYERSOLID=0x02010001
const PI=3.14159265358979323846

struct Catalog imageName image textureSlot end struct
struct Shadow origin normal orientation alpha radius end struct

function fail(message) return error(7670,"playable player shadows: "+message) end function
function load(archive,textureSlot)
  if archive==void or textureSlot<0 then return fail("archive and texture slot are required") end if
  loaded=materials.loadImage(archive,"gfx/damage/shadow");if loaded==void then return fail("missing retail shadow mark") end if
  return Catalog(loaded[0],loaded[1],textureSlot)
end function
function upload(catalog) if catalog==void then return fail("catalog is required") end if;return window.uploadTextureNoMip(catalog.textureSlot,catalog.image.pixels,catalog.image.width,catalog.image.height) end function
function release(catalog) if catalog!=void then window.releaseTexture(catalog.textureSlot) end if;return void end function

function worldTrace(context,startPoint,endPoint,mins,maxs) return collision.boxTrace(context,startPoint,endPoint,mins,maxs,0,MASK_PLAYERSOLID,false) end function
function traceWith(traceFn,context,origin,orientation)
  if traceFn==void or origin==void or len(origin)!=3 then return fail("trace and origin are required") end if
  finish=[origin[0],origin[1],origin[2]-SHADOW_DISTANCE]
  hit=traceFn(context,origin,finish,[-15.0,-15.0,0.0],[15.0,15.0,2.0]);if hit is error then return hit end if
  if hit.trace.fraction>=1.0 or hit.trace.startsolid or hit.trace.allsolid then return void end if
  alpha=1.0-hit.trace.fraction;if alpha<0.0 then alpha=0.0 end if;if alpha>1.0 then alpha=1.0 end if
  normal=[hit.trace.normal[0],hit.trace.normal[1],hit.trace.normal[2]];if qmath.VectorNormalize(normal)==0.0 then return void end if
  return Shadow([hit.endpos[0],hit.endpos[1],hit.endpos[2]],normal,orientation,alpha,SHADOW_RADIUS)
end function
function trace(world,origin,orientation) return traceWith(worldTrace,world,origin,orientation) end function

function perpendicular(normal)
  seed=[0.0,0.0,1.0];if normal[2]>0.9 or normal[2]<-0.9 then seed=[0.0,1.0,0.0] end if
  result=qmath.CrossProduct(seed,normal);qmath.VectorNormalize(result);return result
end function
function axes(shadow)
  base=perpendicular(shadow.normal);other=qmath.CrossProduct(shadow.normal,base);radians=shadow.orientation*PI/180.0;s=trans.sin(radians);c=trans.cos(radians)
  axis2=[base[0]*c+other[0]*s,base[1]*c+other[1]*s,base[2]*c+other[2]*s];axis1=qmath.CrossProduct(shadow.normal,axis2);return [axis1,axis2]
end function
function point(shadow,axis1,axis2,x,y) return viewer.ScreenPoint(shadow.origin[0]+axis1[0]*x+axis2[0]*y,shadow.origin[1]+axis1[1]*x+axis2[1]*y,shadow.origin[2]+axis1[2]*x+axis2[2]*y) end function
function color(shadow) value=numeric.trunc32(shadow.alpha*255.0);if value<0 then value=0 end if;if value>255 then value=255 end if;return [value,value,value,255] end function

function draw(shadows,catalog,projection)
  if shadows==void or catalog==void or projection==void then return fail("draw inputs are required") end if
  if len(shadows)==0 then return 0 end if
  batch=window.createTriangleBatch(len(shadows)*2);if batch is error then return batch end if
  multitexture.setAlphaTest(multitexture.ALPHA_TEST_NONE);multitexture.setTextureClamp(true);multitexture.setPolygonOffset(true);multitexture.setState(multitexture.BLEND_MARK,false,false)
  for each shadow in shadows basis=axes(shadow);r=shadow.radius;a=point(shadow,basis[0],basis[1],0.0-r,0.0-r);b=point(shadow,basis[0],basis[1],r,0.0-r);c=point(shadow,basis[0],basis[1],r,r);d=point(shadow,basis[0],basis[1],0.0-r,r);shade=color(shadow);window.appendSingleTextureTriangleColored(batch,catalog.textureSlot,a,[0.0,0.0],1.0,shade,b,[1.0,0.0],1.0,shade,c,[1.0,1.0],1.0,shade,255,255,255);window.appendSingleTextureTriangleColored(batch,catalog.textureSlot,a,[0.0,0.0],1.0,shade,c,[1.0,1.0],1.0,shade,d,[0.0,1.0],1.0,shade,255,255,255) end for
  rendered=window.submitWorldTriangleBatch(batch,projection);multitexture.setPolygonOffset(false);multitexture.setTextureClamp(false);multitexture.setState(multitexture.BLEND_OPAQUE,false,true);return rendered
end function
