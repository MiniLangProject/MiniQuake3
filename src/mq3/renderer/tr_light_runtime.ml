// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native MiniLang facade for renderer/tr_light.c.
package mq3.renderer.tr_light_runtime

import mq3.compat.numeric as n
import mq3.compat.transcendental as trans
import mq3.renderer.playable_light_grid as grids

/// Entity-rendering flag that draws the entity only in first-person views.
const RF_FIRST_PERSON=4
/// Entity-rendering flag selecting the supplied alternate lighting origin.
const RF_LIGHTING_ORIGIN=128
/// View flag that renders submitted entities without the BSP world model.
const RDF_NOWORLDMODEL=1
/// Surface-dispatch tag identifying a planar BSP face.
const SF_FACE=1
/// Surface-dispatch tag identifying a tessellated curved-patch grid.
const SF_GRID=2
/// Surface-dispatch tag identifying indexed triangle geometry.
const SF_TRIANGLES=3
/// Dynamic-light contribution used at a distance equal to the light's radius.
const DLIGHT_AT_RADIUS=16.0
/// Lower bound applied to dynamic-light radius calculations.
const DLIGHT_MINIMUM_RADIUS=16.0

/// Data record for `mq3.renderer.tr_light_runtime.Orientation`; groups `origin`, `axis`.
struct Orientation
  /// Entity origin used to transform world lighting into the object's local coordinates.
  origin
  /// Object basis used to rotate incoming light directions into entity-local space.
  axis
end struct
/// Data record for `mq3.renderer.tr_light_runtime.Dlight`; groups `origin`, `transformed`, `radius`, `color`.
struct Dlight
  /// Untransformed world-space center of the dynamic light.
  origin
  /// Dynamic-light origin expressed in the current entity's coordinate system.
  transformed
  /// Radius used for the light, sprite, beam, or bounded object.
  radius
  /// RGB light intensity accumulated into an entity's dynamic-light contribution.
  color
end struct
/// Data record for `mq3.renderer.tr_light_runtime.Surface`; groups `surfaceType`, `dlightBits`.
struct Surface
  /// Surface-dispatch tag identifying the concrete geometry representation.
  surfaceType
  /// Bit mask identifying dynamic lights that affect this surface.
  dlightBits
end struct
/// Data record for `mq3.renderer.tr_light_runtime.Bmodel`; groups `bounds`, `surfaces`.
struct Bmodel
  /// Minimum and maximum corners enclosing the object or surface.
  bounds
  /// Surface records owned by the world, model, or drawing group.
  surfaces
end struct
/// Data record for `mq3.renderer.tr_light_runtime.RefEntity`; groups `origin`, `lightingOrigin`, `axis`, `renderfx`, `lightingCalculated`, `ambientLight`, and 4 further fields.
struct RefEntity
  /// Entity placement used as the default point for baked-light-grid sampling.
  origin
  /// Alternate position used to give multipart models consistent lighting.
  lightingOrigin
  /// Rendered entity's orientation used to express its sampled lighting direction in local coordinates.
  axis
  /// Bit mask of entity rendering options, such as depth hack or shadow suppression.
  renderfx
  /// Whether entity lighting has already been computed for this frame.
  lightingCalculated
  /// Ambient light contribution applied to the entity.
  ambientLight
  /// Directional light contribution applied to the entity.
  directedLight
  /// Direction of the dominant light in the entity's coordinate system.
  lightDir
  /// Packed integer representation of the entity's ambient color.
  ambientLightInt
  /// Whether the entity must receive dynamic-light processing.
  needDlights
end struct
/// Data record for `mq3.renderer.tr_light_runtime.Refdef`; groups `rdflags`, `dlights`.
struct Refdef
  /// Bit mask of view-level rendering options such as no-world or hyperspace rendering.
  rdflags
  /// Dynamic lights submitted to the current scene.
  dlights
end struct
/// Data record for `mq3.renderer.tr_light_runtime.LightResult`; groups `found`, `ambientLight`, `directedLight`, `lightDir`.
struct LightResult
  /// Whether the requested object or result was found.
  found
  /// Ambient light contribution applied to the entity.
  ambientLight
  /// Directional light contribution applied to the entity.
  directedLight
  /// Direction of the dominant light in the entity's coordinate system.
  lightDir
end struct

/// Returns `[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]]` for `mq3.renderer.tr_light_runtime.identityAxis`.
function identityAxis() return [[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]] end function
/// Returns `[a[0]-b[0],a[1]-b[1],a[2]-b[2]]` for `mq3.renderer.tr_light_runtime.sub3`.
/// @param a Three-component vector read at indices 0, 1, and 2.
/// @param b Three-component vector read at indices 0, 1, and 2.
function sub3(a,b) return [a[0]-b[0],a[1]-b[1],a[2]-b[2]] end function
/// Computes `a[0]*b[0]+a[1]*b[1]+a[2]*b[2]` for `mq3.renderer.tr_light_runtime.dot3`.
/// @param a Three-component vector read at indices 0, 1, and 2.
/// @param b Three-component vector read at indices 0, 1, and 2.
function dot3(a,b) return a[0]*b[0]+a[1]*b[1]+a[2]*b[2] end function
/// Returns `[a[0]*s,a[1]*s,a[2]*s]` for `mq3.renderer.tr_light_runtime.scale3`.
/// @param a Three-component vector read at indices 0, 1, and 2.
/// @param s Input used in the result expression `[a[0]*s,a[1]*s,a[2]*s]`.
function scale3(a,s) return [a[0]*s,a[1]*s,a[2]*s] end function
/// Returns `[a[0]+s*b[0],a[1]+s*b[1],a[2]+s*b[2]]` for `mq3.renderer.tr_light_runtime.ma3`.
/// @param a Three-component vector read at indices 0, 1, and 2.
/// @param s Input used in the result expression `[a[0]+s*b[0],a[1]+s*b[1],a[2]+s*b[2]]`.
/// @param b Three-component vector read at indices 0, 1, and 2.
function ma3(a,s,b) return [a[0]+s*b[0],a[1]+s*b[1],a[2]+s*b[2]] end function
/// Calls `mq3.compat.transcendental.sqrt` with `(a[0]*a[0]+a[1]*a[1]+a[2]*a[2])` and returns its result.
/// @param a Three-component vector read at indices 0, 1, and 2.
function length3(a) return trans.sqrt(a[0]*a[0]+a[1]*a[1]+a[2]*a[2]) end function
/// Updates `a[0]`, `a[1]`, `a[2]` in `mq3.renderer.tr_light_runtime.normalize3`; returns `length`.
/// @param a Mutable record or buffer; this call updates `a[0]`, `a[1]`, `a[2]`.
function normalize3(a) length=length3(a);if length!=0.0 then inverse=1.0/length;a[0]=a[0]*inverse;a[1]=a[1]*inverse;a[2]=a[2]*inverse end if;return length end function
/// Constructs `mq3.renderer.tr_light_runtime.RefEntity` with `lightingOrigin` = `[0.0,0.0,0.0]`, `axis` = `identityAxis()`, `renderfx` = `0`, `lightingCalculated` = `false` and the supplied remaining values.
/// @param origin Initial value for `mq3.renderer.tr_light_runtime.RefEntity.origin`.
function entity(origin)
  return RefEntity(origin,[0.0,0.0,0.0],identityAxis(),0,false,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,false)
end function
/// Constructs `mq3.renderer.tr_light_runtime.Orientation` from `origin`, `axis`.
/// @param origin Initial value for `mq3.renderer.tr_light_runtime.Orientation.origin`.
/// @param axis Initial value for `mq3.renderer.tr_light_runtime.Orientation.axis`.
function orientation(origin,axis) return Orientation(origin,axis) end function
/// Constructs `mq3.renderer.tr_light_runtime.Dlight` with `transformed` = `[0.0,0.0,0.0]` and the supplied remaining values.
/// @param origin Initial value for `mq3.renderer.tr_light_runtime.Dlight.origin`.
/// @param radius Initial value for `mq3.renderer.tr_light_runtime.Dlight.radius`.
/// @param color Initial value for `mq3.renderer.tr_light_runtime.Dlight.color`.
function dlight(origin,radius,color) return Dlight(origin,[0.0,0.0,0.0],radius,color) end function

/// Updates `lights[index].transformed` in `mq3.renderer.tr_light_runtime.R_TransformDlights`; returns `lights`.
/// @param count Input used by `limit=count`.
/// @param lights Mutable record or buffer; this call updates `lights[index].transformed`.
/// @param orient Record providing `orient.origin`, `orient.axis`.
function R_TransformDlights(count,lights,orient)
  if lights==void or orient==void then return lights end if;limit=count;if limit>len(lights) then limit=len(lights) end if
  if limit>0 then for index=0 to limit-1 temp=sub3(lights[index].origin,orient.origin);lights[index].transformed=[dot3(temp,orient.axis[0]),dot3(temp,orient.axis[1]),dot3(temp,orient.axis[2])] end for end if
  return lights
end function

/// Updates `currentEntity.needDlights` in `mq3.renderer.tr_light_runtime.R_DlightBmodel`; returns `mask`.
/// @param model Record providing `model.bounds`, `model.surfaces`.
/// @param lights Value forwarded as `lights` to `mq3.renderer.tr_light_runtime.R_TransformDlights`.
/// @param orient Value forwarded as `orient` to `mq3.renderer.tr_light_runtime.R_TransformDlights`.
/// @param smpFrame Input used by `surface.dlightBits[smpFrame]=mask`.
/// @param currentEntity Mutable record or buffer; this call updates `currentEntity.needDlights`.
function R_DlightBmodel(model,lights,orient,smpFrame,currentEntity)
  if model==void or lights==void or orient==void then return 0 end if;R_TransformDlights(len(lights),lights,orient);mask=0
  if len(lights)>0 then for index=0 to len(lights)-1 light=lights[index];inside=true;for axis=0 to 2 if light.transformed[axis]-model.bounds[1][axis]>light.radius or model.bounds[0][axis]-light.transformed[axis]>light.radius then inside=false end if end for;if inside then mask=mask|(1<<index) end if end for end if
  if currentEntity!=void then currentEntity.needDlights=mask!=0 end if
  for each surface in model.surfaces
    if surface.surfaceType==SF_FACE or surface.surfaceType==SF_GRID or surface.surfaceType==SF_TRIANGLES then while len(surface.dlightBits)<=smpFrame surface.dlightBits=surface.dlightBits+[0] end while;surface.dlightBits[smpFrame]=mask end if
  end for
  return mask
end function

/// Returns `ent.origin` from `mq3.renderer.tr_light_runtime.lightOrigin`; earlier branches return `ent.lightingOrigin`.
/// @param ent Record providing `ent.renderfx`, `ent.lightingOrigin`, `ent.origin`.
function lightOrigin(ent) if (ent.renderfx&RF_LIGHTING_ORIGIN)!=0 then return ent.lightingOrigin end if;return ent.origin end function
/// Updates `ent.ambientLight`, `ent.directedLight`, `ent.lightDir` in `mq3.renderer.tr_light_runtime.R_SetupEntityLightingGrid`; returns `ent`.
/// @param grid Argument 1 supplied to `mq3.renderer.playable_light_grid.sample`.
/// @param ent Mutable record or buffer; this call updates `ent.ambientLight`, `ent.directedLight`, `ent.lightDir`.
/// @param ambientScale Value forwarded as `s` to `mq3.renderer.tr_light_runtime.scale3`.
/// @param directedScale Value forwarded as `s` to `mq3.renderer.tr_light_runtime.scale3`.
function R_SetupEntityLightingGrid(grid,ent,ambientScale,directedScale)
  if ent==void then return ent end if;value=grids.sample(grid,lightOrigin(ent));ent.ambientLight=scale3(value.ambient,ambientScale);ent.directedLight=scale3(value.directed,directedScale);if value.totalFactor==0.0 then ent.lightDir=[0.0,0.0,0.0] else ent.lightDir=value.direction end if;return ent
end function

// Preserves the original function's else-if quirk: Z is tested only when Y
// did not replace the current maximum.
/// @param ent Record providing `ent.renderfx`, `ent.ambientLight`, `ent.directedLight`.
function LogLight(ent)
  if ent==void or (ent.renderfx&RF_FIRST_PERSON)==0 then return void end if
  max1=n.trunc32(ent.ambientLight[0]);if ent.ambientLight[1]>max1 then max1=n.trunc32(ent.ambientLight[1]) else if ent.ambientLight[2]>max1 then max1=n.trunc32(ent.ambientLight[2]) end if
  max2=n.trunc32(ent.directedLight[0]);if ent.directedLight[1]>max2 then max2=n.trunc32(ent.directedLight[1]) else if ent.directedLight[2]>max2 then max2=n.trunc32(ent.directedLight[2]) end if
  return "amb:"+str(max1)+"  dir:"+str(max2)+"\n"
end function

/// Returns `red|(green<<8)|(blue<<16)|(255<<24)` from `mq3.renderer.tr_light_runtime.packAmbient`.
/// @param value Three-component vector read at indices 0, 1, and 2.
function packAmbient(value)
  red=n.trunc32(value[0])&255;green=n.trunc32(value[1])&255;blue=n.trunc32(value[2])&255;return red|(green<<8)|(blue<<16)|(255<<24)
end function

/// Updates `ent.lightingCalculated`, `ent.ambientLight`, `ent.directedLight`, `ent.lightDir`, `ent.ambientLight[channel]` in `mq3.renderer.tr_light_runtime.R_SetupEntityLighting`; returns `ent`.
/// @param refdef Record providing `refdef.rdflags`, `refdef.dlights`.
/// @param grid Record providing `grid.valid`.
/// @param ent Mutable record or buffer; this call updates `ent.lightingCalculated`, `ent.ambientLight`, `ent.directedLight`, `ent.lightDir`, `ent.ambientLight[channel]`.
/// @param identityLight Input used by `else amount=identityLight*150.0`.
/// @param identityLightByte Value assigned to `ent.ambientLight[channel]`.
/// @param sunDirection Three-component vector read at indices 0, 1, and 2.
/// @param ambientScale Value forwarded as `ambientScale` to `mq3.renderer.tr_light_runtime.R_SetupEntityLightingGrid`.
/// @param directedScale Value forwarded as `directedScale` to `mq3.renderer.tr_light_runtime.R_SetupEntityLightingGrid`.
/// @param debugLight Input tested by `debugLight`.
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

/// Builds `mq3.renderer.tr_light_runtime.LightResult` for `mq3.renderer.tr_light_runtime.R_LightForPoint`.
/// @param grid Record providing `grid.valid`.
/// @param point Value forwarded as `origin` to `mq3.renderer.tr_light_runtime.entity`.
/// @param ambientScale Value forwarded as `ambientScale` to `mq3.renderer.tr_light_runtime.R_SetupEntityLightingGrid`.
/// @param directedScale Value forwarded as `directedScale` to `mq3.renderer.tr_light_runtime.R_SetupEntityLightingGrid`.
function R_LightForPoint(grid,point,ambientScale,directedScale)
  if grid==void or not grid.valid then return LightResult(false,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0]) end if
  ent=entity(point);R_SetupEntityLightingGrid(grid,ent,ambientScale,directedScale);return LightResult(true,ent.ambientLight,ent.directedLight,ent.lightDir)
end function
