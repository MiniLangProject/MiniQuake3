// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 projectile explosion sprites and plasma ring for the playable path.
package mq3.client.playable_explosions

import mq3.client.playable_projectile_view as view
import mq3.client.playable_viewer as viewer
import mq3.platform.playable_window as window
import mq3.platform.playable_multitexture as multitexture
import mq3.renderer.playable_materials as materials
import mq3.format.pk3 as pk3
import mq3.format.md3 as md3
import mq3.shared.math as qmath
import mq3.compat.numeric as numeric
import mq3.compat.transcendental as trans

/// Capacity limit for the textures collection or bounded storage used by this client module.
const MAX_TEXTURES=15
/// Capacity limit for the triangles collection or bounded storage used by this client module.
const MAX_TRIANGLES=4096
/// Circle constant used to convert or evaluate angles in trigonometric calculations.
const PI=3.14159265358979323846

/// Stores playable explosions texture record, including `name`, `image`, `slot`.
struct Texture
  /// Virtual resource or definition name used to locate this entry in the client asset catalog.
  name
  /// When constructing this record, `load` supplies `loaded[1]` for this member. Used by `upload`
  /// during subsequent processing.
  image
  /// Texture or media-cache slot assigned to this asset for renderer submission.
  slot
end struct
/// Stores playable explosions profile record, including `style`, `frequency`, `frames`, `sprite`, `duration`.
struct Profile
  /// Projectile style selecting this explosion's model, sprite, and presentation parameters.
  style
  /// When constructing this record, `profile` supplies `8.0` for this member.
  frequency
  /// When constructing this record, `profile` supplies `["models/weaphits/plasmaboom"]` for this
  /// member.
  frames
  /// When constructing this record, `profile` supplies `true` for this member.
  sprite
  /// When constructing this record, `profile` supplies `1000` for this member.
  duration
end struct
/// Stores playable explosions catalog record, including `textures`, `profiles`, `plasmaModel`, `firstTextureSlot`, `textureCount`.
struct Catalog
  /// When constructing this record, `load` supplies `textures` for this member. Used by `textureFor`
  /// and `upload` during subsequent processing.
  textures
  /// When constructing this record, `load` supplies `profiles` for this member.
  profiles
  /// Model resource selected for the plasma presentation.
  plasmaModel
  /// First texture-cache slot reserved for this module's media resources.
  firstTextureSlot
  /// Number of texture resources or texture-cache slots represented by this media record.
  textureCount
end struct

/// Creates the playable explosions error `7650` with diagnostic text `"playable explosions: "+message`.
/// @param message Argument 2 of `error`; passed as `"playable explosions: "+message`.
function fail(message) return error(7650,"playable explosions: "+message) end function
/// Calls `mq3.client.playable_explosions.Profile` from playable explosions `profile`.
/// @param style Value used by `if style==view.STYLE_ROCKET then return Profile(style,8.0,["models/weaphits/rlboom/rlboom_1","models/weaphits/rlboom/rlboom_2","models/weaphit...`.
function profile(style)
  if style==view.STYLE_ROCKET then return Profile(style,8.0,["models/weaphits/rlboom/rlboom_1","models/weaphits/rlboom/rlboom_2","models/weaphits/rlboom/rlboom_3","models/weaphits/rlboom/rlboom_4","models/weaphits/rlboom/rlboom_5","models/weaphits/rlboom/rlboom_6","models/weaphits/rlboom/rlboom_7","models/weaphits/rlboom/rlboom_8"],true,1000) end if
  if style==view.STYLE_GRENADE then return Profile(style,5.0,["models/weaphits/glboom/glboom_1","models/weaphits/glboom/glboom_2","models/weaphits/glboom/glboom_3"],true,600) end if
  if style==view.STYLE_BFG then return Profile(style,5.0,["models/weaphits/bfgboom/bfgboom_1","models/weaphits/bfgboom/bfgboom_2","models/weaphits/bfgboom/bfgboom_3"],true,600) end if
  if style==view.STYLE_PLASMA then return Profile(style,0.0,["models/weaphits/plasmaboom"],false,600) end if
  return void
end function
/// Calls `stringEqualsIgnoreCaseAscii` from playable explosions `textureFor`.
/// @param catalog Asset catalog used to resolve names to loaded resources. Record read through `catalog.textures`.
/// @param name Name used to select or register the corresponding playable explosions resource.
function textureFor(catalog,name) for each texture in catalog.textures if stringEqualsIgnoreCaseAscii(texture.name,name) then return texture end if end for;return void end function

/// Calls `mq3.client.playable_explosions.profile`, `mq3.renderer.playable_materials.loadImage`, `mq3.client.playable_explosions.Texture` and additional helpers from playable explosions `load`. The final path returns `Catalog(textures,profiles,plasmaModel,firstTextureSlot,len(textures))`.
/// @param archive Opened game archive supplying maps, models, textures or other assets.
/// @param firstTextureSlot First texture slot reserved for this asset collection.
/// @param maxTextureSlots Maximum number of texture slots available to the renderer.
function load(archive,firstTextureSlot,maxTextureSlots)
  if archive==void or firstTextureSlot<0 or maxTextureSlots<MAX_TEXTURES then return fail("archive and fifteen texture slots are required") end if
  profiles=[profile(view.STYLE_ROCKET),profile(view.STYLE_GRENADE),profile(view.STYLE_BFG),profile(view.STYLE_PLASMA)];textures=[]
  for each p in profiles for each name in p.frames
    loaded=materials.loadImage(archive,name);if loaded==void then return fail("missing retail explosion image "+name) end if
    textures=textures+[Texture(name,loaded[1],firstTextureSlot+len(textures))]
  end for end for
  modelData=pk3.read(archive,"models/weaphits/ring02.md3");if modelData is error then return modelData end if;plasmaModel=md3.load(modelData);if plasmaModel is error then return plasmaModel end if
  return Catalog(textures,profiles,plasmaModel,firstTextureSlot,len(textures))
end function
/// Calls `mq3.platform.playable_window.uploadTextureNoMip` from playable explosions `upload`. The final path returns `len(catalog.textures)`.
/// @param catalog Asset catalog used to resolve names to loaded resources. Record read through `catalog.textures`.
function upload(catalog) if catalog==void then return fail("catalog is required") end if;for each texture in catalog.textures if not window.uploadTextureNoMip(texture.slot,texture.image.pixels,texture.image.width,texture.image.height) then return fail("could not upload "+texture.name) end if end for;return len(catalog.textures) end function
/// Calls `mq3.platform.playable_window.releaseTexture` from playable explosions `release`.
/// @param catalog Asset catalog used to resolve names to loaded resources. Record read through `catalog.textures`.
function release(catalog) if catalog!=void then for each texture in catalog.textures window.releaseTexture(texture.slot) end for end if;return void end function

/// Computes `value-numeric.trunc32(value)` for playable explosions `fraction`.
/// @param value Value used by `return value-numeric.trunc32(value)`.
function fraction(value) return value-numeric.trunc32(value) end function
/// Computes `numeric.i32(snapshot.entityId*97+snapshot.eventAt*17) & 63` for playable explosions `randomOffset`.
/// @param snapshot Record read through `snapshot.entityId`, `snapshot.eventAt`.
function randomOffset(snapshot) return numeric.i32(snapshot.entityId*97+snapshot.eventAt*17) & 63 end function
/// Computes `numeric.i32(snapshot.entityId*53+snapshot.eventAt*29) % 360` for playable explosions `rotation`.
/// @param snapshot Record read through `snapshot.entityId`, `snapshot.eventAt`.
function rotation(snapshot) return numeric.i32(snapshot.entityId*53+snapshot.eventAt*29) % 360 end function
/// Calls `mq3.client.playable_explosions.randomOffset` from playable explosions `timing`. The final path returns `[elapsed,start+p.duration]`.
/// @param snapshot Record read through `snapshot.eventAt`.
/// @param p Record read through `p.duration`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function timing(snapshot,p,now)
  start=snapshot.eventAt-randomOffset(snapshot);elapsed=now-start;if elapsed<0 then elapsed=0 end if
  return [elapsed,start+p.duration]
end function
/// Evaluates playable explosions `spriteRadius` and returns `42.0*(1.0-c)+30.0` according to its guard/selection conditions.
/// @param endTime Value used by `c=(endTime-now)/(endTime-startTime)`.
/// @param startTime Value used by `c=(endTime-now)/(endTime-startTime)`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function spriteRadius(endTime,startTime,now)
  c=(endTime-now)/(endTime-startTime);if c>1.0 then c=1.0 end if;if c<0.0 then c=0.0 end if;return 42.0*(1.0-c)+30.0
end function
/// Calls `mq3.compat.transcendental.sin`, `mq3.compat.transcendental.cos` from playable explosions `rotatePair`.
/// @param right Sequence read at `right[0]`, `right[1]`, `right[2]`.
/// @param up Sequence read at `up[0]`, `up[1]`, `up[2]`.
/// @param degrees Value used by `radians=degrees*PI/180.0`.
function rotatePair(right,up,degrees)
  radians=degrees*PI/180.0;s=trans.sin(radians);c=trans.cos(radians)
  return [[right[0]*c+up[0]*s,right[1]*c+up[1]*s,right[2]*c+up[2]*s],[up[0]*c-right[0]*s,up[1]*c-right[1]*s,up[2]*c-right[2]*s]]
end function
/// Adapts `mq3.client.playable_viewer.ScreenPoint` to playable explosions `worldPoint`, returning its result for `center[0]+right[0]*x+up[0]*y, center[1]+right[1]*x+up[1]*y, center[2]+right[2]*x+up[2]*y`.
/// @param center Argument 1, 2, 3 of `mq3.client.playable_viewer.ScreenPoint`; passed as `center[0]+right[0]*x+up[0]*y`, `center[1]+right[1]*x+up[1]*y`, `center[2]+right[2]*x+up[2]*y`.
/// @param right Argument 1, 2, 3 of `mq3.client.playable_viewer.ScreenPoint`; passed as `center[0]+right[0]*x+up[0]*y`, `center[1]+right[1]*x+up[1]*y`, `center[2]+right[2]*x+up[2]*y`.
/// @param up Argument 1, 2, 3 of `mq3.client.playable_viewer.ScreenPoint`; passed as `center[0]+right[0]*x+up[0]*y`, `center[1]+right[1]*x+up[1]*y`, `center[2]+right[2]*x+up[2]*y`.
/// @param x Argument 1, 2, 3 of `mq3.client.playable_viewer.ScreenPoint`; passed as `center[0]+right[0]*x+up[0]*y`, `center[1]+right[1]*x+up[1]*y`, `center[2]+right[2]*x+up[2]*y`.
/// @param y Argument 1, 2, 3 of `mq3.client.playable_viewer.ScreenPoint`; passed as `center[0]+right[0]*x+up[0]*y`, `center[1]+right[1]*x+up[1]*y`, `center[2]+right[2]*x+up[2]*y`.
function worldPoint(center,right,up,x,y) return viewer.ScreenPoint(center[0]+right[0]*x+up[0]*y,center[1]+right[1]*x+up[1]*y,center[2]+right[2]*x+up[2]*y) end function
/// Calls `mq3.client.playable_explosions.worldPoint`, `mq3.platform.playable_window.appendSingleTextureTriangleColored` from playable explosions `appendQuad`.
/// @param batch Value used by `value=window.appendSingleTextureTriangleColored(batch,slot,a,[0.0,1.0],1.0,color,b,[1.0,1.0],1.0,color,c,[1.0,0.0],1.0,color,255,255,255)`.
/// @param slot Value used by `value=window.appendSingleTextureTriangleColored(batch,slot,a,[0.0,1.0],1.0,color,b,[1.0,1.0],1.0,color,c,[1.0,0.0],1.0,color,255,255,255)`.
/// @param center Value used by `a=worldPoint(center,right,up,0.0-radius,0.0-radius)`.
/// @param right Value used by `a=worldPoint(center,right,up,0.0-radius,0.0-radius)`.
/// @param up Value used by `a=worldPoint(center,right,up,0.0-radius,0.0-radius)`.
/// @param radius Radius used by the spatial or visual calculation.
/// @param intensity Value used by `color=[intensity,intensity,intensity,255]`.
function appendQuad(batch,slot,center,right,up,radius,intensity)
  a=worldPoint(center,right,up,0.0-radius,0.0-radius);b=worldPoint(center,right,up,radius,0.0-radius);c=worldPoint(center,right,up,radius,radius);d=worldPoint(center,right,up,0.0-radius,radius);color=[intensity,intensity,intensity,255]
  value=window.appendSingleTextureTriangleColored(batch,slot,a,[0.0,1.0],1.0,color,b,[1.0,1.0],1.0,color,c,[1.0,0.0],1.0,color,255,255,255);if value is error then return value end if
  return window.appendSingleTextureTriangleColored(batch,slot,a,[0.0,1.0],1.0,color,c,[1.0,0.0],1.0,color,d,[0.0,0.0],1.0,color,255,255,255)
end function

/// Calls `mq3.client.playable_explosions.timing`, `mq3.compat.numeric.trunc32`, `mq3.client.playable_explosions.fraction` and additional helpers from playable explosions `drawSprite`. The final path returns `drawn`.
/// @param catalog Asset catalog used to resolve names to loaded resources.
/// @param batch Value used by `window.resetTriangleBatch(batch)`.
/// @param snapshot Record read through `snapshot.position`, `snapshot.normal`, `snapshot.eventAt`.
/// @param p Record read through `p.frequency`, `p.frames`.
/// @param camera Camera state used to transform/project the scene.
/// @param projection Projection parameters used to convert camera-space geometry to screen coordinates.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function drawSprite(catalog,batch,snapshot,p,camera,projection,now)
  timingValue=timing(snapshot,p,now);elapsed=timingValue[0];endTime=timingValue[1];if now>=endTime then return 0 end if
  phase=elapsed*p.frequency/1000.0;frame=numeric.trunc32(phase);mix=fraction(phase);if frame>=len(p.frames) then frame=len(p.frames)-1;mix=0.0 end if
  basis=viewer.cameraBasis(camera);pair=rotatePair(basis[1],basis[2],rotation(snapshot));center=[snapshot.position[0]+snapshot.normal[0]*16.0,snapshot.position[1]+snapshot.normal[1]*16.0,snapshot.position[2]+snapshot.normal[2]*16.0];radius=spriteRadius(endTime,snapshot.eventAt-randomOffset(snapshot),now)
  drawn=0;weights=[1.0-mix,mix]
  for stage=0 to 1 index=frame+stage;if index<len(p.frames) and weights[stage]>0.0 then texture=textureFor(catalog,p.frames[index]);window.resetTriangleBatch(batch);value=appendQuad(batch,texture.slot,center,pair[0],pair[1],radius,numeric.trunc32(255.0*weights[stage]));if value is error then return value end if;submitted=window.submitWorldTriangleBatch(batch,projection);if submitted is error then return submitted end if;drawn=drawn+submitted end if end for
  return drawn
end function

/// Calls `mq3.shared.math.VectorNormalize`, `mq3.shared.math.CrossProduct`, `mq3.client.playable_explosions.rotatePair` and additional helpers from playable explosions `plasmaAxes`. The final path returns `[normal,pair[0],pair[1]]`.
/// @param snapshot Record read through `snapshot.normal`.
function plasmaAxes(snapshot)
  normal=[snapshot.normal[0],snapshot.normal[1],snapshot.normal[2]];if qmath.VectorNormalize(normal)==0.0 then normal=[0.0,0.0,1.0] end if
  seed=[0.0,0.0,1.0];if normal[2]>0.9 or normal[2]<-0.9 then seed=[0.0,1.0,0.0] end if;side=qmath.CrossProduct(seed,normal);qmath.VectorNormalize(side);up=qmath.CrossProduct(normal,side);pair=rotatePair(side,up,rotation(snapshot));return [normal,pair[0],pair[1]]
end function
/// Adapts `mq3.client.playable_viewer.ScreenPoint` to playable explosions `transformPoint`, returning its result for `origin[0]+axes[0][0]*point[0]+axes[1][0]*point[1]+axes[2][0]*point[2], origin[1]+axes[0][1]*point[0]+axes[1][1]*point[1]+axes[2][1]*point[2], origin[2]+axes[0][2]*point[0]+axes[1][2]*point[1]+axes[...`.
/// @param origin World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.playable_viewer.ScreenPoint`.
/// @param axes Argument 1, 2, 3 of `mq3.client.playable_viewer.ScreenPoint`; passed as `origin[0]+axes[0][0]*point[0]+axes[1][0]*point[1]+axes[2][0]*point[2]`, `origin[1]+axes[0][1]*point[0]+axes[1][1]*point[1]+axes[2][1]*point[2]`, `origin[2]+axes[0][2]*point[0]+axes[1][2]*point[1]+axes[2][2]*point[2]`.
/// @param point Argument 1, 2, 3 of `mq3.client.playable_viewer.ScreenPoint`; passed as `origin[0]+axes[0][0]*point[0]+axes[1][0]*point[1]+axes[2][0]*point[2]`, `origin[1]+axes[0][1]*point[0]+axes[1][1]*point[1]+axes[2][1]*point[2]`, `origin[2]+axes[0][2]*point[0]+axes[1][2]*point[1]+axes[2][2]*point[2]`.
function transformPoint(origin,axes,point) return viewer.ScreenPoint(origin[0]+axes[0][0]*point[0]+axes[1][0]*point[1]+axes[2][0]*point[2],origin[1]+axes[0][1]*point[0]+axes[1][1]*point[1]+axes[2][1]*point[2],origin[2]+axes[0][2]*point[0]+axes[1][2]*point[1]+axes[2][2]*point[2]) end function
/// Calls `mq3.client.playable_explosions.fraction` from playable explosions `triangleWave`. The final path returns `2.0-f*2.0`.
/// @param value Value used by `f=fraction(value)`.
function triangleWave(value) f=fraction(value);if f<0.5 then return f*2.0 end if;return 2.0-f*2.0 end function
/// Calls `mq3.client.playable_explosions.triangleWave`, `mq3.compat.transcendental.sin`, `mq3.compat.transcendental.cos` from playable explosions `plasmaUv`. The final path returns `[0.5+du*c-dv*s,0.5+du*s+dv*c]`.
/// @param uv Sequence read at `uv[0]`, `uv[1]`.
/// @param elapsed Value used by `wave=0.6+0.1*triangleWave(elapsed*8.0/1000.0)`.
function plasmaUv(uv,elapsed)
  wave=0.6+0.1*triangleWave(elapsed*8.0/1000.0);u=0.5+(uv[0]-0.5)/wave;v=0.5+(uv[1]-0.5)/wave;angle=elapsed*999.0/1000.0;radians=angle*PI/180.0;s=trans.sin(radians);c=trans.cos(radians);du=u-0.5;dv=v-0.5;return [0.5+du*c-dv*s,0.5+du*s+dv*c]
end function
/// Calls `mq3.client.playable_explosions.timing`, `mq3.format.md3.renderTriangles`, `mq3.client.playable_explosions.textureFor` and additional helpers from playable explosions `drawPlasma`. The final path returns `window.submitWorldTriangleBatch(batch,projection)`.
/// @param catalog Asset catalog used to resolve names to loaded resources. Record read through `catalog.plasmaModel`.
/// @param batch Value used by `window.resetTriangleBatch(batch)`.
/// @param snapshot Record read through `snapshot.position`.
/// @param p Record read through `p.frames`.
/// @param projection Projection parameters used to convert camera-space geometry to screen coordinates.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function drawPlasma(catalog,batch,snapshot,p,projection,now)
  timingValue=timing(snapshot,p,now);elapsed=timingValue[0];if now>=timingValue[1] then return 0 end if
  source=md3.renderTriangles(catalog.plasmaModel,0,0,0,0.0,MAX_TRIANGLES);if source is error then return source end if;texture=textureFor(catalog,p.frames[0]);axesValue=plasmaAxes(snapshot);window.resetTriangleBatch(batch);intensity=numeric.trunc32(255.0*(1.0-fraction(elapsed*1.5/1000.0)));color=[intensity,intensity,intensity,255]
  for each triangle in source
    a=transformPoint(snapshot.position,axesValue,triangle.positions[0]);b=transformPoint(snapshot.position,axesValue,triangle.positions[1]);c=transformPoint(snapshot.position,axesValue,triangle.positions[2]);value=window.appendSingleTextureTriangleColored(batch,texture.slot,a,plasmaUv(triangle.texCoords[0],elapsed),1.0,color,b,plasmaUv(triangle.texCoords[1],elapsed),1.0,color,c,plasmaUv(triangle.texCoords[2],elapsed),1.0,color,255,255,255);if value is error then return value end if
  end for
  return window.submitWorldTriangleBatch(batch,projection)
end function

/// Calls `mq3.platform.playable_window.createTriangleBatch`, `mq3.platform.playable_multitexture.setAlphaTest`, `mq3.platform.playable_multitexture.setTextureClamp` and additional helpers from playable explosions `draw`. The final path returns `drawn`.
/// @param catalog Asset catalog used to resolve names to loaded resources.
/// @param snapshots Value used by `if catalog==void or snapshots==void or camera==void or projection==void or now<0 then return fail("draw inputs are required") end if`.
/// @param camera Camera state used to transform/project the scene.
/// @param projection Projection parameters used to convert camera-space geometry to screen coordinates.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function draw(catalog,snapshots,camera,projection,now)
  if catalog==void or snapshots==void or camera==void or projection==void or now<0 then return fail("draw inputs are required") end if
  batch=window.createTriangleBatch(MAX_TRIANGLES);if batch is error then return batch end if;multitexture.setAlphaTest(multitexture.ALPHA_TEST_NONE);multitexture.setTextureClamp(true);multitexture.setPolygonOffset(false);multitexture.setState(multitexture.BLEND_ADD,false,false);drawn=0;value=0
  for each snapshot in snapshots if snapshot.state==view.STATE_IMPACT and view.alive(snapshot,now) then p=profile(snapshot.style);if p!=void then if p.sprite then value=drawSprite(catalog,batch,snapshot,p,camera,projection,now) else value=drawPlasma(catalog,batch,snapshot,p,projection,now) end if;if value is error then return value end if;drawn=drawn+value end if end if end for
  multitexture.setTextureClamp(false);multitexture.setState(multitexture.BLEND_OPAQUE,false,true);return drawn
end function
