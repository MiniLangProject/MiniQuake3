// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Persistent Baseq3 weapon-impact marks for the playable renderer.
package mq3.client.playable_marks

import mq3.client.playable_projectile_view as projectileView
import mq3.client.playable_viewer as viewer
import mq3.platform.playable_window as window
import mq3.platform.playable_multitexture as multitexture
import mq3.renderer.playable_materials as materials
import mq3.shared.math as qmath
import mq3.compat.numeric as numeric
import mq3.compat.transcendental as trans
import std.array as arrays

const MARK_TOTAL_TIME=10000
const MARK_FADE_TIME=1000
const MAX_MARKS=256
const KIND_BULLET=1
const KIND_BURN=2
const KIND_HOLE=3
const KIND_ENERGY=4
const PI=3.14159265358979323846

struct Texture kind name image slot end struct
struct Catalog textures firstTextureSlot textureCount end struct
struct Mark key kind origin normal radius orientation bornAt alphaFade end struct
struct State marks end struct

function fail(message) return error(7640,"playable marks: "+message) end function
function create() return State([]) end function
function valid3(value) return value!=void and typeof(value)=="array" and len(value)==3 end function
function copy3(value) return [numeric.f32(value[0]),numeric.f32(value[1]),numeric.f32(value[2])] end function

function textureName(kind)
  if kind==KIND_BULLET then return "gfx/damage/bullet_mrk" end if
  if kind==KIND_BURN then return "gfx/damage/burn_med_mrk" end if
  if kind==KIND_HOLE then return "gfx/damage/hole_lg_mrk" end if
  if kind==KIND_ENERGY then return "gfx/damage/plasma_mrk" end if
  return ""
end function

function load(archive,firstTextureSlot,maxTextureSlots)
  if archive==void or firstTextureSlot<0 or maxTextureSlots<4 then return fail("archive and four texture slots are required") end if
  textures=[]
  for kind=KIND_BULLET to KIND_ENERGY
    name=textureName(kind);loaded=materials.loadImage(archive,name);if loaded==void then return fail("missing retail mark "+name) end if
    textures=textures+[Texture(kind,loaded[0],loaded[1],firstTextureSlot+len(textures))]
  end for
  return Catalog(textures,firstTextureSlot,len(textures))
end function

function upload(catalog)
  if catalog==void then return fail("catalog is required") end if
  for each texture in catalog.textures if not window.uploadTextureNoMip(texture.slot,texture.image.pixels,texture.image.width,texture.image.height) then return fail("could not upload "+texture.name) end if end for
  return len(catalog.textures)
end function
function release(catalog) if catalog!=void then for each texture in catalog.textures window.releaseTexture(texture.slot) end for end if;return void end function
function textureFor(catalog,kind) if catalog!=void then for each texture in catalog.textures if texture.kind==kind then return texture end if end for end if;return void end function

function weaponProfile(classname)
  if classname=="weapon_machinegun" then return [KIND_BULLET,8.0,false] end if
  if classname=="weapon_shotgun" then return [KIND_BULLET,4.0,false] end if
  if classname=="weapon_lightning" then return [KIND_HOLE,12.0,false] end if
  if classname=="weapon_railgun" then return [KIND_ENERGY,24.0,true] end if
  if classname=="weapon_rocketlauncher" or classname=="weapon_grenadelauncher" then return [KIND_BURN,64.0,false] end if
  if classname=="weapon_plasmagun" then return [KIND_ENERGY,16.0,true] end if
  if classname=="weapon_bfg" then return [KIND_BURN,32.0,false] end if
  return void
end function

function projectileProfile(style)
  if style==projectileView.STYLE_ROCKET or style==projectileView.STYLE_GRENADE then return [KIND_BURN,64.0,false] end if
  if style==projectileView.STYLE_PLASMA then return [KIND_ENERGY,16.0,true] end if
  if style==projectileView.STYLE_BFG then return [KIND_BURN,32.0,false] end if
  return void
end function

function orientation(key,bornAt) return ((numeric.i32(key*97+bornAt*17) & 1023)*360.0)/1024.0 end function
function hasKey(state,key,bornAt)
  for each mark in state.marks if mark.key==key and mark.bornAt==bornAt then return true end if end for
  return false
end function
function append(state,key,profile,origin,normal,bornAt)
  if state==void or profile==void or not valid3(origin) or not valid3(normal) or bornAt<0 then return false end if
  direction=copy3(normal);if qmath.VectorNormalize(direction)==0.0 or hasKey(state,key,bornAt) then return false end if
  if len(state.marks)>=MAX_MARKS then state.marks=arrays.slice(state.marks,len(state.marks)-MAX_MARKS+1,MAX_MARKS-1) end if
  state.marks=state.marks+[Mark(key,profile[0],copy3(origin),direction,profile[1],orientation(key,bornAt),bornAt,profile[2])]
  return true
end function

function update(state,snapshots,shotEffects,now)
  if state==void or snapshots==void or shotEffects==void or now<0 then return fail("state, sources and time are required") end if
  live=[];for each mark in state.marks if now<=mark.bornAt+MARK_TOTAL_TIME then live=live+[mark] end if end for;state.marks=live
  for each snapshot in snapshots if snapshot.state==projectileView.STATE_IMPACT then append(state,snapshot.entityId,projectileProfile(snapshot.style),snapshot.position,snapshot.normal,snapshot.eventAt) end if end for
  for each effect in shotEffects if effect.worldHit then append(state,effect.key,weaponProfile(effect.classname),effect.impactPoint,effect.normal,effect.bornAt) end if end for
  return len(state.marks)
end function

function perpendicular(normal)
  seed=[0.0,0.0,1.0];if normal[2]>0.9 or normal[2]<-0.9 then seed=[0.0,1.0,0.0] end if
  result=qmath.CrossProduct(seed,normal);qmath.VectorNormalize(result);return result
end function
function axes(mark)
  base=perpendicular(mark.normal);other=qmath.CrossProduct(mark.normal,base);radians=mark.orientation*PI/180.0;s=trans.sin(radians);c=trans.cos(radians)
  axis2=[base[0]*c+other[0]*s,base[1]*c+other[1]*s,base[2]*c+other[2]*s]
  axis1=qmath.CrossProduct(mark.normal,axis2);return [axis1,axis2]
end function
function point(mark,axis1,axis2,x,y)
  // The renderer's polygon offset performs the same coplanar separation as
  // Baseq3's polygonOffset mark shaders.
  return viewer.ScreenPoint(mark.origin[0]+axis1[0]*x+axis2[0]*y,mark.origin[1]+axis1[1]*x+axis2[1]*y,mark.origin[2]+axis1[2]*x+axis2[2]*y)
end function

function color(mark,now)
  rgb=255;alpha=255;remaining=mark.bornAt+MARK_TOTAL_TIME-now
  if mark.kind==KIND_ENERGY then energy=450-numeric.trunc32(450.0*(now-mark.bornAt)/3000.0);if energy<255 then if energy<0 then energy=0 end if;rgb=energy end if end if
  if remaining<MARK_FADE_TIME then fade=numeric.trunc32(255.0*remaining/MARK_FADE_TIME);if fade<0 then fade=0 end if;if mark.alphaFade then alpha=fade else rgb=fade end if end if
  return [rgb,rgb,rgb,alpha]
end function

function draw(state,catalog,projection,now)
  if state==void or catalog==void or projection==void or now<0 then return fail("draw inputs are required") end if
  batch=window.createTriangleBatch(MAX_MARKS*2);if batch is error then return batch end if
  multitexture.setAlphaTest(multitexture.ALPHA_TEST_NONE);multitexture.setTextureClamp(true);multitexture.setPolygonOffset(true)
  // Energy marks use alpha blending; the three monochrome damage marks use
  // GL_ZERO, GL_ONE_MINUS_SRC_COLOR. Submit separately to preserve both modes.
  drawn=0
  for kind=KIND_BULLET to KIND_ENERGY
    window.resetTriangleBatch(batch)
    for each mark in state.marks if mark.kind==kind then
      texture=textureFor(catalog,kind);basis=axes(mark);r=mark.radius;a=point(mark,basis[0],basis[1],0.0-r,0.0-r);b=point(mark,basis[0],basis[1],r,0.0-r);c=point(mark,basis[0],basis[1],r,r);d=point(mark,basis[0],basis[1],0.0-r,r);shade=color(mark,now)
      window.appendSingleTextureTriangleColored(batch,texture.slot,a,[0.0,0.0],1.0,shade,b,[1.0,0.0],1.0,shade,c,[1.0,1.0],1.0,shade,255,255,255);window.appendSingleTextureTriangleColored(batch,texture.slot,a,[0.0,0.0],1.0,shade,c,[1.0,1.0],1.0,shade,d,[0.0,1.0],1.0,shade,255,255,255)
    end if end for
    if batch.count>0 then blend=multitexture.BLEND_MARK;if kind==KIND_ENERGY then blend=multitexture.BLEND_ALPHA end if;multitexture.setState(blend,false,false);value=window.submitWorldTriangleBatch(batch,projection);if value is error then return value end if;drawn=drawn+value end if
  end for
  multitexture.setPolygonOffset(false);multitexture.setTextureClamp(false);multitexture.setState(multitexture.BLEND_OPAQUE,false,true);return drawn
end function
