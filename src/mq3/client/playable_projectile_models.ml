// SPDX-License-Identifier: GPL-2.0-or-later
// Retail Baseq3 missile models and plasma sprite for the software preview.
package mq3.client.playable_projectile_models

import mq3.client.playable_item_models as itemModels
import mq3.client.playable_projectile_view as projectileView
import mq3.client.playable_viewer as viewer
import mq3.renderer.playable_materials as materials
import mq3.shared.math as qmath
import mq3.compat.numeric as numeric
import mq3.compat.transcendental as trans

const KIND_MODEL=1
const KIND_SPRITE=2
const MAX_TEXTURE_SLOTS=16
const MAX_TRIANGLES_PER_PROJECTILE=4096
const PLASMA_RADIUS=16.0
const SPIN_DEGREES_PER_MILLISECOND=0.25
const PI=3.14159265358979323846

/// Stores playable projectile models definition record, including `style`, `kind`, `modelPath`, `shaderName`, `radius`, `expectedTextures`.
struct Definition style kind modelPath shaderName radius expectedTextures end struct
/// Stores playable projectile models asset record, including `style`, `kind`, `modelPath`, `shaderName`, `modelAsset`, `textureSlot` and additional values.
struct Asset style kind modelPath shaderName modelAsset textureSlot imageName image radius end struct
/// Stores playable projectile models catalog record, including `assets`, `textures`, `shaderIndex`, `scriptCount`, `firstTextureSlot`, `maxTextureSlots` and additional values.
struct Catalog assets textures shaderIndex scriptCount firstTextureSlot maxTextureSlots skipped end struct
/// Stores playable projectile models triangle record, including `positions`, `texCoords`, `normals`, `textureSlot`, `imageName`, `shaderName` and additional values.
struct Triangle positions texCoords normals textureSlot imageName shaderName style surfaceIndex lightOrigin end struct
/// Stores playable projectile models rendered record, including `triangles`, `fallback`, `style`.
struct Rendered triangles fallback style end struct
/// Stores playable projectile models batch record, including `triangles`, `fallbackSnapshots`.
struct Batch triangles fallbackSnapshots end struct

/// Creates the playable projectile models error `7600` with diagnostic text `"preview projectile models: "+message`.
/// @param message Argument 2 of `error`; passed as `"preview projectile models: "+message`.
function fail(message) return error(7600,"preview projectile models: "+message) end function
/// Computes `value!=void and typeof(value)=="array" and len(value)==3` for playable projectile models `valid3`.
/// @param value Sequence whose length/content is inspected by `valid3`.
function valid3(value) return value!=void and typeof(value)=="array" and len(value)==3 end function

// cg_weapons.c registers these exact assets. Plasma has no missile MD3 in
// Baseq3: CG_Missile emits an RT_SPRITE using sprites/plasma1 at radius 16.
/// @param style Value used by `if style==projectileView.STYLE_ROCKET then return Definition(style,KIND_MODEL,"models/ammo/rocket/rocket.md3","",0.0,4) end if`.
function definition(style)
  if style==projectileView.STYLE_ROCKET then return Definition(style,KIND_MODEL,"models/ammo/rocket/rocket.md3","",0.0,4) end if
  if style==projectileView.STYLE_PLASMA then return Definition(style,KIND_SPRITE,"","sprites/plasma1",PLASMA_RADIUS,1) end if
  if style==projectileView.STYLE_GRENADE then return Definition(style,KIND_MODEL,"models/ammo/grenade1.md3","",0.0,1) end if
  if style==projectileView.STYLE_BFG then return Definition(style,KIND_MODEL,"models/weaphits/bfg.md3","",0.0,2) end if
  return void
end function

/// Evaluates playable projectile models `containsStyle` and returns `true`, `false` according to its guard/selection conditions.
/// @param values Value used by `for each value in values if value==style then return true end if end for`.
/// @param style Value used by `for each value in values if value==style then return true end if end for`.
function containsStyle(values,style)
  for each value in values if value==style then return true end if end for
  return false
end function

/// Searches the playable projectile models collection for find, returning `void` when no entry matches.
/// @param catalog Asset catalog used to resolve names to loaded resources. Record read through `catalog.assets`.
/// @param style Value used by `for each asset in catalog.assets if asset.style==style then return asset end if end for`.
function find(catalog,style)
  if catalog==void then return void end if
  for each asset in catalog.assets if asset.style==style then return asset end if end for
  return void
end function

/// Updates `catalog.skipped` during playable projectile models `appendFallback`.
/// @param catalog Mutable playable projectile models record/storage; this routine assigns `catalog.skipped`.
/// @param style Value used by `if not containsStyle(catalog.skipped,style) then catalog.skipped=catalog.skipped+[style] end if`.
function appendFallback(catalog,style)
  if not containsStyle(catalog.skipped,style) then catalog.skipped=catalog.skipped+[style] end if
end function

/// Calls `stringEqualsIgnoreCaseAscii` from playable projectile models `textureByName`.
/// @param catalog Asset catalog used to resolve names to loaded resources. Record read through `catalog.textures`.
/// @param name Name used to select or register the corresponding playable projectile models resource.
function textureByName(catalog,name)
  for each texture in catalog.textures if stringEqualsIgnoreCaseAscii(texture.imageName,name) then return texture end if end for
  return void
end function

/// Updates `catalog.textures` during playable projectile models `loadSprite`.
/// @param archive Opened game archive supplying maps, models, textures or other assets.
/// @param catalog Mutable playable projectile models record/storage; this routine assigns `catalog.textures`.
/// @param def Record read through `def.shaderName`, `def.style`, `def.kind`, `def.radius`.
function loadSprite(archive,catalog,def)
  mapped=materials.mappedImageName(catalog.shaderIndex,def.shaderName);if mapped==void then mapped=def.shaderName end if
  loaded=materials.loadImage(archive,mapped)
  if loaded==void and mapped!=def.shaderName then loaded=materials.loadImage(archive,def.shaderName) end if
  if loaded==void then loaded=materials.loadImage(archive,itemModels.imageStem(mapped)) end if
  if loaded==void then return void end if
  texture=textureByName(catalog,loaded[0])
  if texture==void then
    if len(catalog.textures)>=catalog.maxTextureSlots then return void end if
    texture=itemModels.Texture(loaded[0],loaded[1],catalog.firstTextureSlot+len(catalog.textures))
    catalog.textures=catalog.textures+[texture]
  end if
  return Asset(def.style,def.kind,"",def.shaderName,void,texture.slot,texture.imageName,texture.image,def.radius)
end function

/// Updates `catalog.textures` during playable projectile models `loadModel`.
/// @param archive Opened game archive supplying maps, models, textures or other assets.
/// @param catalog Mutable playable projectile models record/storage; this routine assigns `catalog.textures`.
/// @param def Record read through `def.modelPath`, `def.style`, `def.kind`.
function loadModel(archive,catalog,def)
  backing=itemModels.Catalog([],catalog.textures,catalog.shaderIndex,catalog.scriptCount,catalog.firstTextureSlot,catalog.maxTextureSlots,0)
  itemDef=itemModels.Definition("projectile","projectile",def.modelPath,"",1.0,0.0,0.0,0.0)
  loaded=try(itemModels.loadDefinition(archive,backing,itemDef))
  if loaded is error then return void end if
  catalog.textures=backing.textures
  return Asset(def.style,def.kind,def.modelPath,"",loaded,-1,"",void,0.0)
end function

// Missing/corrupt optional media and an exhausted slot budget select the
// existing effect renderer as a fallback instead of making preview startup fail.
/// @param archive Opened game archive supplying maps, models, textures or other assets.
/// @param firstTextureSlot First texture slot reserved for this asset collection.
/// @param maxTextureSlots Maximum number of texture slots available to the renderer.
function loadCatalog(archive,firstTextureSlot,maxTextureSlots)
  if archive==void then return fail("archive is required") end if
  if firstTextureSlot<0 or maxTextureSlots<0 or maxTextureSlots>MAX_TEXTURE_SLOTS then return fail("texture slot budget outside supported range") end if
  scripts=materials.buildScriptIndex(archive);if scripts is error then return scripts end if
  catalog=Catalog([],[],scripts[0],scripts[1],firstTextureSlot,maxTextureSlots,[])
  styles=[projectileView.STYLE_ROCKET,projectileView.STYLE_PLASMA,projectileView.STYLE_GRENADE,projectileView.STYLE_BFG]
  for each style in styles
    def=definition(style)
    if len(catalog.textures)+def.expectedTextures>catalog.maxTextureSlots then appendFallback(catalog,style)
    else
      asset=void
      if def.kind==KIND_SPRITE then asset=loadSprite(archive,catalog,def) else asset=loadModel(archive,catalog,def) end if
      if asset==void then appendFallback(catalog,style) else catalog.assets=catalog.assets+[asset] end if
    end if
  end for
  return catalog
end function

/// Calls `mq3.shared.math.CrossProduct`, `mq3.shared.math.VectorNormalize` from playable projectile models `perpendicular`. The final path returns `side`.
/// @param direction Direction vector used by the spatial calculation.
function perpendicular(direction)
  // A stable equivalent of PerpendicularVector for missile roll axes.
  seed=[0.0,0.0,1.0]
  if direction[2]>0.9 or direction[2]<-0.9 then seed=[0.0,1.0,0.0] end if
  side=qmath.CrossProduct(seed,direction);qmath.VectorNormalize(side)
  return side
end function

/// Calls `mq3.compat.numeric.f32`, `mq3.compat.transcendental.sin`, `mq3.compat.transcendental.cos` from playable projectile models `rotatePair`. The final path returns `[spunSide,spunUp]`.
/// @param side Sequence read at `side[0]`, `side[1]`, `side[2]`.
/// @param up Sequence read at `up[0]`, `up[1]`, `up[2]`.
/// @param degrees Value used by `radians=numeric.f32(degrees*PI/180.0)`.
function rotatePair(side,up,degrees)
  radians=numeric.f32(degrees*PI/180.0);s=numeric.f32(trans.sin(radians));c=numeric.f32(trans.cos(radians))
  spunSide=[side[0]*c+up[0]*s,side[1]*c+up[1]*s,side[2]*c+up[2]*s]
  spunUp=[up[0]*c-side[0]*s,up[1]*c-side[1]*s,up[2]*c-side[2]*s]
  return [spunSide,spunUp]
end function

// Mirrors CG_Missile: axis[0] follows travel and the other axes roll by
// cg.time/4 degrees. A stationary snapshot points upward as in the C code.
/// @param snapshot Record read through `snapshot.previousPosition`, `snapshot.position`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
function snapshotAxis(snapshot,nowMilliseconds)
  if snapshot==void or nowMilliseconds<0 or not valid3(snapshot.previousPosition) or not valid3(snapshot.position) then return fail("snapshot and non-negative time are required") end if
  forward=[snapshot.position[0]-snapshot.previousPosition[0],snapshot.position[1]-snapshot.previousPosition[1],snapshot.position[2]-snapshot.previousPosition[2]]
  if qmath.VectorNormalize(forward)==0.0 then forward=[0.0,0.0,1.0] end if
  side=perpendicular(forward);up=qmath.CrossProduct(forward,side)
  pair=rotatePair(side,up,nowMilliseconds*SPIN_DEGREES_PER_MILLISECOND)
  return [forward,pair[0],pair[1]]
end function

/// Creates a `mq3.client.playable_projectile_models.Triangle` record. Assigns `style` from `style`.
/// @param source Record read through `source.positions`, `source.texCoords`, `source.normals`, `source.textureSlot` and additional values.
/// @param style Value used to initialize `Triangle.style`.
function wrapModelTriangle(source,style)
  return Triangle(source.positions,source.texCoords,source.normals,source.textureSlot,source.imageName,source.shaderName,style,source.surfaceIndex,source.lightOrigin)
end function

/// Calls `mq3.client.playable_projectile_models.snapshotAxis`, `mq3.client.playable_item_models.transform`, `mq3.client.playable_item_models.renderAsset` and additional helpers from playable projectile models `renderModel`. The final path returns `result`.
/// @param asset Record read through `asset.modelAsset`, `asset.style`.
/// @param snapshot Record read through `snapshot.position`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
/// @param maxTriangles Upper bound on emitted render triangles.
function renderModel(asset,snapshot,nowMilliseconds,maxTriangles)
  axis=snapshotAxis(snapshot,nowMilliseconds);if axis is error then return axis end if
  value=itemModels.transform(snapshot.position,axis,1.0)
  source=itemModels.renderAsset(asset.modelAsset,value,maxTriangles);if source is error then return source end if
  result=[];for each triangle in source result=result+[wrapModelTriangle(triangle,asset.style)] end for
  return result
end function

/// Builds the playable projectile models `spritePoint` sequence from `[center[0]+right[0]*x+up[0]*y,center[1]+right[1]*x+up[1]*y,center[2]+right[2]*x+up[2]*y]`.
/// @param center Sequence read at `center[0]`, `center[1]`, `center[2]`.
/// @param right Sequence read at `right[0]`, `right[1]`, `right[2]`.
/// @param up Sequence read at `up[0]`, `up[1]`, `up[2]`.
/// @param x Horizontal coordinate in the coordinate space used by `spritePoint`.
/// @param y Vertical coordinate in the coordinate space used by `spritePoint`.
function spritePoint(center,right,up,x,y)
  return [center[0]+right[0]*x+up[0]*y,center[1]+right[1]*x+up[1]*y,center[2]+right[2]*x+up[2]*y]
end function

/// Calls `mq3.client.playable_viewer.cameraBasis`, `mq3.client.playable_projectile_models.spritePoint`, `mq3.client.playable_projectile_models.Triangle` from playable projectile models `renderSprite`. The final path returns `[one,two]`.
/// @param asset Record read through `asset.radius`, `asset.textureSlot`, `asset.imageName`, `asset.shaderName` and additional values.
/// @param snapshot Record read through `snapshot.position`.
/// @param camera Camera state used to transform/project the scene.
/// @param maxTriangles Upper bound on emitted render triangles.
function renderSprite(asset,snapshot,camera,maxTriangles)
  if camera==void then return fail("sprite rendering needs a camera") end if
  if maxTriangles<2 then return [] end if
  basis=viewer.cameraBasis(camera);right=basis[1];up=basis[2];r=asset.radius;c=snapshot.position
  p0=spritePoint(c,right,up,0.0-r,0.0-r);p1=spritePoint(c,right,up,r,0.0-r);p2=spritePoint(c,right,up,r,r);p3=spritePoint(c,right,up,0.0-r,r)
  normal=[0.0-basis[0][0],0.0-basis[0][1],0.0-basis[0][2]];normals=[normal,normal,normal]
  one=Triangle([p0,p1,p2],[[0.0,1.0],[1.0,1.0],[1.0,0.0]],normals,asset.textureSlot,asset.imageName,asset.shaderName,asset.style,0,snapshot.position)
  two=Triangle([p0,p2,p3],[[0.0,1.0],[1.0,0.0],[0.0,0.0]],normals,asset.textureSlot,asset.imageName,asset.shaderName,asset.style,0,snapshot.position)
  return [one,two]
end function

/// Calls `mq3.client.playable_projectile_view.alive`, `mq3.client.playable_projectile_models.Rendered`, `mq3.client.playable_projectile_models.find` and additional helpers from playable projectile models `renderSnapshot`. The final path returns `Rendered(triangles,len(triangles)==0,snapshot.style)`.
/// @param catalog Asset catalog used to resolve names to loaded resources.
/// @param snapshot Record read through `snapshot.state`, `snapshot.style`.
/// @param camera Camera state used to transform/project the scene.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
/// @param maxTriangles Upper bound on emitted render triangles.
function renderSnapshot(catalog,snapshot,camera,nowMilliseconds,maxTriangles)
  if catalog==void or snapshot==void then return fail("catalog and snapshot are required") end if
  if nowMilliseconds<0 or maxTriangles<0 or maxTriangles>MAX_TRIANGLES_PER_PROJECTILE then return fail("time or triangle budget outside supported range") end if
  if snapshot.state!=projectileView.STATE_FLYING or not projectileView.alive(snapshot,nowMilliseconds) then return Rendered([],true,snapshot.style) end if
  asset=find(catalog,snapshot.style);if asset==void then return Rendered([],true,snapshot.style) end if
  triangles=[]
  if asset.kind==KIND_SPRITE then triangles=renderSprite(asset,snapshot,camera,maxTriangles)
  else triangles=renderModel(asset,snapshot,nowMilliseconds,maxTriangles) end if
  if triangles is error then return triangles end if
  return Rendered(triangles,len(triangles)==0,snapshot.style)
end function

/// Calls `mq3.client.playable_projectile_models.renderSnapshot`, `mq3.client.playable_projectile_models.Batch` from playable projectile models `renderSnapshots`. The final path returns `Batch(result,fallback)`.
/// @param catalog Asset catalog used to resolve names to loaded resources.
/// @param snapshots Value used by `if snapshots==void or maxPerProjectile<0 or maxTriangles<0 then return fail("snapshots and non-negative budgets are required") end if`.
/// @param camera Camera state used to transform/project the scene.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
/// @param maxPerProjectile Value used by `if snapshots==void or maxPerProjectile<0 or maxTriangles<0 then return fail("snapshots and non-negative budgets are required") end if`.
/// @param maxTriangles Upper bound on emitted render triangles.
function renderSnapshots(catalog,snapshots,camera,nowMilliseconds,maxPerProjectile,maxTriangles)
  if snapshots==void or maxPerProjectile<0 or maxTriangles<0 then return fail("snapshots and non-negative budgets are required") end if
  result=[];fallback=[]
  for each snapshot in snapshots
    remaining=maxTriangles-len(result);budget=maxPerProjectile;if budget>remaining then budget=remaining end if
    rendered=renderSnapshot(catalog,snapshot,camera,nowMilliseconds,budget);if rendered is error then return rendered end if
    result=result+rendered.triangles
    if rendered.fallback then fallback=fallback+[snapshot] end if
  end for
  return Batch(result,fallback)
end function
