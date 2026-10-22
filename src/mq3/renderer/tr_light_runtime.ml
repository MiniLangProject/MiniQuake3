// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native MiniLang facade for renderer/tr_light.c.
package mq3.renderer.tr_light_runtime

import mq3.compat.numeric as n
import mq3.compat.transcendental as trans
import mq3.renderer.playable_light_grid as grids

const RF_FIRST_PERSON=4
const RF_LIGHTING_ORIGIN=128
const RDF_NOWORLDMODEL=1
const SF_FACE=1
const SF_GRID=2
const SF_TRIANGLES=3
const DLIGHT_AT_RADIUS=16.0
const DLIGHT_MINIMUM_RADIUS=16.0

struct Orientation origin axis end struct
struct Dlight origin transformed radius color end struct
struct Surface surfaceType dlightBits end struct
struct Bmodel bounds surfaces end struct
struct RefEntity origin lightingOrigin axis renderfx lightingCalculated ambientLight directedLight lightDir ambientLightInt needDlights end struct
struct Refdef rdflags dlights end struct
struct LightResult found ambientLight directedLight lightDir end struct

function identityAxis() return [[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]] end function
function sub3(a,b) return [a[0]-b[0],a[1]-b[1],a[2]-b[2]] end function
function dot3(a,b) return a[0]*b[0]+a[1]*b[1]+a[2]*b[2] end function
function scale3(a,s) return [a[0]*s,a[1]*s,a[2]*s] end function
function ma3(a,s,b) return [a[0]+s*b[0],a[1]+s*b[1],a[2]+s*b[2]] end function
function length3(a) return trans.sqrt(a[0]*a[0]+a[1]*a[1]+a[2]*a[2]) end function
function normalize3(a) length=length3(a);if length!=0.0 then inverse=1.0/length;a[0]=a[0]*inverse;a[1]=a[1]*inverse;a[2]=a[2]*inverse end if;return length end function
function entity(origin)
  return RefEntity(origin,[0.0,0.0,0.0],identityAxis(),0,false,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,false)
end function
function orientation(origin,axis) return Orientation(origin,axis) end function
function dlight(origin,radius,color) return Dlight(origin,[0.0,0.0,0.0],radius,color) end function

function R_TransformDlights(count,lights,orient)
  if lights==void or orient==void then return lights end if;limit=count;if limit>len(lights) then limit=len(lights) end if
  if limit>0 then for index=0 to limit-1 temp=sub3(lights[index].origin,orient.origin);lights[index].transformed=[dot3(temp,orient.axis[0]),dot3(temp,orient.axis[1]),dot3(temp,orient.axis[2])] end for end if
  return lights
end function

function R_DlightBmodel(model,lights,orient,smpFrame,currentEntity)
  if model==void or lights==void or orient==void then return 0 end if;R_TransformDlights(len(lights),lights,orient);mask=0
  if len(lights)>0 then for index=0 to len(lights)-1 light=lights[index];inside=true;for axis=0 to 2 if light.transformed[axis]-model.bounds[1][axis]>light.radius or model.bounds[0][axis]-light.transformed[axis]>light.radius then inside=false end if end for;if inside then mask=mask|(1<<index) end if end for end if
  if currentEntity!=void then currentEntity.needDlights=mask!=0 end if
  for each surface in model.surfaces
    if surface.surfaceType==SF_FACE or surface.surfaceType==SF_GRID or surface.surfaceType==SF_TRIANGLES then while len(surface.dlightBits)<=smpFrame surface.dlightBits=surface.dlightBits+[0] end while;surface.dlightBits[smpFrame]=mask end if
  end for
  return mask
end function

function lightOrigin(ent) if (ent.renderfx&RF_LIGHTING_ORIGIN)!=0 then return ent.lightingOrigin end if;return ent.origin end function
function R_SetupEntityLightingGrid(grid,ent,ambientScale,directedScale)
  if ent==void then return ent end if;value=grids.sample(grid,lightOrigin(ent));ent.ambientLight=scale3(value.ambient,ambientScale);ent.directedLight=scale3(value.directed,directedScale);if value.totalFactor==0.0 then ent.lightDir=[0.0,0.0,0.0] else ent.lightDir=value.direction end if;return ent
end function

// Preserves the original function's else-if quirk: Z is tested only when Y
// did not replace the current maximum.
function LogLight(ent)
  if ent==void or (ent.renderfx&RF_FIRST_PERSON)==0 then return void end if
  max1=n.trunc32(ent.ambientLight[0]);if ent.ambientLight[1]>max1 then max1=n.trunc32(ent.ambientLight[1]) else if ent.ambientLight[2]>max1 then max1=n.trunc32(ent.ambientLight[2]) end if
  max2=n.trunc32(ent.directedLight[0]);if ent.directedLight[1]>max2 then max2=n.trunc32(ent.directedLight[1]) else if ent.directedLight[2]>max2 then max2=n.trunc32(ent.directedLight[2]) end if
  return "amb:"+str(max1)+"  dir:"+str(max2)+"\n"
end function

function packAmbient(value)
  red=n.trunc32(value[0])&255;green=n.trunc32(value[1])&255;blue=n.trunc32(value[2])&255;return red|(green<<8)|(blue<<16)|(255<<24)
end function

function R_SetupEntityLighting(refdef,grid,ent,identityLight,identityLightByte,sunDirection,ambientScale,directedScale,debugLight)
  if ent==void or refdef==void then return ent end if;if ent.lightingCalculated then return ent end if;ent.lightingCalculated=true;origin=lightOrigin(ent)
  if (refdef.rdflags&RDF_NOWORLDMODEL)==0 and grid!=void and grid.valid then R_SetupEntityLightingGrid(grid,ent,ambientScale,directedScale)
  else amount=identityLight*150.0;ent.ambientLight=[amount,amount,amount];ent.directedLight=[amount,amount,amount];ent.lightDir=[sunDirection[0],sunDirection[1],sunDirection[2]] end if
  minimum=identityLight*32.0;for channel=0 to 2 ent.ambientLight[channel]=ent.ambientLight[channel]+minimum end for
  length=length3(ent.directedLight);combined=scale3(ent.lightDir,length)
  for each light in refdef.dlights
    direction=sub3(light.origin,origin);distance=normalize3(direction);power=DLIGHT_AT_RADIUS*light.radius*light.radius;if distance<DLIGHT_MINIMUM_RADIUS then distance=DLIGHT_MINIMUM_RADIUS end if;amount=power/(distance*distance);ent.directedLight=ma3(ent.directedLight,amount,light.color);combined=ma3(combined,amount,direction)
  end for
  for channel=0 to 2 if ent.ambientLight[channel]>identityLightByte then ent.ambientLight[channel]=identityLightByte end if end for
  if debugLight then LogLight(ent) end if;ent.ambientLightInt=packAmbient(ent.ambientLight);normalize3(combined);ent.lightDir=[dot3(combined,ent.axis[0]),dot3(combined,ent.axis[1]),dot3(combined,ent.axis[2])];return ent
end function

function R_LightForPoint(grid,point,ambientScale,directedScale)
  if grid==void or not grid.valid then return LightResult(false,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0]) end if
  ent=entity(point);R_SetupEntityLightingGrid(grid,ent,ambientScale,directedScale);return LightResult(true,ent.ambientLight,ent.directedLight,ent.lightDir)
end function
