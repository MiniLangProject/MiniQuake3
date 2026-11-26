// SPDX-License-Identifier: GPL-2.0-or-later
// PK3-backed Quake III pickup models and renderer-neutral world triangles.
package mq3.client.playable_item_models

import mq3.compat.numeric as numeric
import mq3.compat.transcendental as trans
import mq3.format.md3 as md3
import mq3.format.pk3 as pk3
import mq3.renderer.playable_materials as materials
import mq3.renderer.player_skins as skins
import mq3.renderer.surface_md3 as md3Mesh
import mq3.renderer.view_math as viewMath
import std.string as strings

/// Fallback bob amplitude setting used when constructing the native client simulation or effect
/// configuration.
const DEFAULT_BOB_AMPLITUDE=4.0
/// Default spin angular rate, in degrees per second.
const DEFAULT_SPIN_DEGREES_PER_SECOND=100.0
/// Capacity limit for the catalog models collection or bounded storage used by this client module.
const MAX_CATALOG_MODELS=64
/// Capacity limit for the catalog textures collection or bounded storage used by this client module.
const MAX_CATALOG_TEXTURES=96
/// Circle constant used to convert or evaluate angles in trigonometric calculations.
const PI=3.14159265358979323846

/// Stores playable item models definition record, including `classname`, `category`, `modelPath`, `skinPath`, `scale`, `heightOffset` and additional values.
struct Definition
  /// Native item classname that keys the world-model definition lookup.
  classname
  /// When constructing this record, `item` supplies `category` for this member.
  category
  /// Virtual path used to load the model resource for this client presentation.
  modelPath
  /// When constructing this record, `item` supplies an empty string for this member.
  skinPath
  /// When constructing this record, `item` supplies `scale` for this member.
  scale
  /// When constructing this record, `item` supplies `heightOffset` for this member.
  heightOffset
  /// When constructing this record, `item` supplies `DEFAULT_BOB_AMPLITUDE` for this member.
  bobAmplitude
  /// When constructing this record, `item` supplies `DEFAULT_SPIN_DEGREES_PER_SECOND` for this member.
  spinDegreesPerSecond
end struct
/// Stores playable item models texture record, including `imageName`, `image`, `slot`.
struct Texture
  /// Resolved image path of a loaded texture available to world-item materials.
  imageName
  /// When constructing this record, `resolveBinding` supplies `loaded[1]` for this member.
  image
  /// Texture or media-cache slot assigned to this asset for renderer submission.
  slot
end struct
/// Stores playable item models binding record, including `surfaceIndex`, `surfaceName`, `shaderName`, `imageName`, `image`, `textureSlot`.
struct Binding
  /// When constructing this record, `resolveBinding` supplies `surfaceIndex` for this member.
  surfaceIndex
  /// When constructing this record, `resolveBinding` supplies `surface.name` for this member.
  surfaceName
  /// Virtual shader name used to register or resolve the displayed resource.
  shaderName
  /// Image path bound to a model surface's shader for world-item drawing.
  imageName
  /// When constructing this record, `resolveBinding` supplies `texture.image` for this member.
  image
  /// Texture-cache slot assigned to the resource for renderer submission.
  textureSlot
end struct
/// Stores playable item models cached surface record, including `positions`, `normals`, `triangleIndexes`, `triangleTexCoords`, `surfaceIndex`, `numTriangles`.
struct CachedSurface
  /// Ordered positions used to build the stored trail or spatial history.
  positions
  /// When constructing this record, `cacheModelTriangles` supplies `decoded[1]` for this member.
  normals
  /// When constructing this record, `cacheModelTriangles` supplies `triangleIndexes` for this member.
  triangleIndexes
  /// When constructing this record, `cacheModelTriangles` supplies `triangleTexCoords` for this member.
  triangleTexCoords
  /// When constructing this record, `cacheModelTriangles` supplies `surfaceIndex` for this member.
  surfaceIndex
  /// Number of triangles represented by the model or geometry collection.
  numTriangles
end struct
/// Stores playable item models asset record, including `classname`, `category`, `modelPath`, `skinPath`, `model`, `bindings` and additional values.
struct Asset
  /// Item classname that keys this loaded model asset in the world-item catalog.
  classname
  /// When constructing this record, `loadDefinition` supplies `def.category` for this member.
  category
  /// Virtual path used to load the model resource for this client presentation.
  modelPath
  /// When constructing this record, `loadDefinition` supplies `def.skinPath` for this member.
  skinPath
  /// Model resource selected for rendering the object.
  model
  /// Key-to-command associations available to the UI controls editor.
  bindings
  /// When constructing this record, `loadDefinition` supplies `sourceTriangles` for this member. Used
  /// by `renderAsset` during subsequent processing.
  sourceTriangles
  /// When constructing this record, `loadDefinition` supplies `def.scale` for this member.
  scale
  /// When constructing this record, `loadDefinition` supplies `def.heightOffset` for this member.
  heightOffset
  /// When constructing this record, `loadDefinition` supplies `def.bobAmplitude` for this member.
  bobAmplitude
  /// When constructing this record, `loadDefinition` supplies `def.spinDegreesPerSecond` for this
  /// member.
  spinDegreesPerSecond
end struct
/// Stores playable item models catalog record, including `assets`, `textures`, `shaderIndex`, `scriptCount`, `firstTextureSlot`, `maxTextureSlots` and additional values.
struct Catalog
  /// Loaded world-item render assets, looked up by the item's native classname.
  assets
  /// When constructing this record, `loadCatalog` supplies an empty list for this member. Used by
  /// `textureByName` and `resolveBinding` during subsequent processing.
  textures
  /// When constructing this record, `loadCatalog` supplies `scripts[0]` for this member. Used by
  /// `resolveBinding` during subsequent processing.
  shaderIndex
  /// When constructing this record, `loadCatalog` supplies `scripts[1]` for this member.
  scriptCount
  /// First texture-cache slot reserved for this module's media resources.
  firstTextureSlot
  /// When constructing this record, `loadCatalog` supplies `maxTextureSlots` for this member. Used by
  /// `resolveBinding` during subsequent processing.
  maxTextureSlots
  /// When constructing this record, `loadCatalog` supplies `0` for this member.
  skipped
end struct
/// Stores playable item models transform record, including `origin`, `axis`, `scale`.
struct Transform
  /// World-space translation applied after rotating and scaling a world-item model vertex.
  origin
  /// Three orientation basis vectors used to transform the rendered object.
  axis
  /// When constructing this record, `transform` supplies `scale` for this member.
  scale
end struct
/// Stores playable item models triangle record, including `positions`, `texCoords`, `normals`, `textureSlot`, `imageName`, `shaderName` and additional values.
struct Triangle
  /// Ordered positions used to build the stored trail or spatial history.
  positions
  /// When constructing this record, `renderAsset` supplies `surface.triangleTexCoords[triangleIndex]`
  /// for this member.
  texCoords
  /// When constructing this record, `renderAsset` supplies `normals` for this member.
  normals
  /// Texture-cache slot assigned to the resource for renderer submission.
  textureSlot
  /// Image path identifying the material used by this emitted world-item triangle.
  imageName
  /// Virtual shader name used to register or resolve the displayed resource.
  shaderName
  /// Item classname identifying which world-item asset produced this rendered triangle.
  classname
  /// When constructing this record, `renderAsset` supplies `surface.surfaceIndex` for this member.
  surfaceIndex
  /// When constructing this record, `renderAsset` supplies `value.origin` for this member.
  lightOrigin
end struct
/// Stores playable item models batch record, including `triangles`, `drawnItems`, `skippedItems`.
struct Batch
  /// When constructing this record, `renderItems` supplies `result` for this member.
  triangles
  /// When constructing this record, `renderItems` supplies `drawn` for this member.
  drawnItems
  /// Number of candidate items omitted from the generated rendering batch.
  skippedItems
end struct

/// Creates the playable item models error `7560` with diagnostic text `"preview item models: "+message`.
/// @param message Argument 2 of `error`; passed as `"preview item models: "+message`.
function fail(message) return error(7560,"preview item models: "+message) end function

/// Creates a `mq3.client.playable_item_models.Definition` record. Assigns `classname` from `classname`, `category` from `category`, `modelPath` from `path`, `scale` from `scale`.
/// @param classname Value used to initialize `Definition.classname`.
/// @param category Value used to initialize `Definition.category`.
/// @param path Value used to initialize `Definition.modelPath`.
/// @param scale Value used to initialize `Definition.scale`.
/// @param heightOffset Value used to initialize `Definition.heightOffset`.
function item(classname,category,path,scale,heightOffset)
  return Definition(classname,category,path,"",scale,heightOffset,DEFAULT_BOB_AMPLITUDE,DEFAULT_SPIN_DEGREES_PER_SECOND)
end function

// Baseq3 bg_itemlist world_model[0] paths. These are the actual MD3 pickups in
// pak0.pk3; aliases only cover classnames emitted by stock maps/gamecode.
/// @param classname Value used by `name=strings.toLowerAscii(classname)`.
function definition(classname)
  name=strings.toLowerAscii(classname)
  if name=="flash_gauntlet" then return item(name,"flash","models/weapons2/gauntlet/gauntlet_flash.md3",1.0,0.0) end if
  if name=="flash_machinegun" then return item(name,"flash","models/weapons2/machinegun/machinegun_flash.md3",1.0,0.0) end if
  if name=="flash_shotgun" then return item(name,"flash","models/weapons2/shotgun/shotgun_flash.md3",1.0,0.0) end if
  if name=="flash_grenadelauncher" then return item(name,"flash","models/weapons2/grenadel/grenadel_flash.md3",1.0,0.0) end if
  if name=="flash_rocketlauncher" then return item(name,"flash","models/weapons2/rocketl/rocketl_flash.md3",1.0,0.0) end if
  if name=="flash_lightning" then return item(name,"flash","models/weapons2/lightning/lightning_flash.md3",1.0,0.0) end if
  if name=="flash_railgun" then return item(name,"flash","models/weapons2/railgun/railgun_flash.md3",1.0,0.0) end if
  if name=="flash_plasmagun" then return item(name,"flash","models/weapons2/plasma/plasma_flash.md3",1.0,0.0) end if
  if name=="flash_bfg" then return item(name,"flash","models/weapons2/bfg/bfg_flash.md3",1.0,0.0) end if
  if name=="barrel_gauntlet" then return item(name,"barrel","models/weapons2/gauntlet/gauntlet_barrel.md3",1.0,0.0) end if
  if name=="barrel_machinegun" then return item(name,"barrel","models/weapons2/machinegun/machinegun_barrel.md3",1.0,0.0) end if
  if name=="barrel_bfg" then return item(name,"barrel","models/weapons2/bfg/bfg_barrel.md3",1.0,0.0) end if
  if name=="weapon_gauntlet" then return item(name,"weapon","models/weapons2/gauntlet/gauntlet.md3",1.0,0.0) end if
  if name=="weapon_machinegun" then return item(name,"weapon","models/weapons2/machinegun/machinegun.md3",1.0,0.0) end if
  if name=="weapon_shotgun" then return item(name,"weapon","models/weapons2/shotgun/shotgun.md3",1.0,0.0) end if
  if name=="weapon_grenadelauncher" then return item(name,"weapon","models/weapons2/grenadel/grenadel.md3",1.0,0.0) end if
  if name=="weapon_rocketlauncher" then return item(name,"weapon","models/weapons2/rocketl/rocketl.md3",1.0,0.0) end if
  if name=="weapon_lightning" then return item(name,"weapon","models/weapons2/lightning/lightning.md3",1.0,0.0) end if
  if name=="weapon_railgun" then return item(name,"weapon","models/weapons2/railgun/railgun.md3",1.0,0.0) end if
  if name=="weapon_plasmagun" then return item(name,"weapon","models/weapons2/plasma/plasma.md3",1.0,0.0) end if
  if name=="weapon_bfg" then return item(name,"weapon","models/weapons2/bfg/bfg.md3",1.0,0.0) end if
  if name=="weapon_grapplinghook" then return item(name,"weapon","models/weapons2/grapple/grapple.md3",1.0,0.0) end if
  if name=="ammo_bullets" then return item(name,"ammo","models/powerups/ammo/machinegunam.md3",1.0,0.0) end if
  if name=="ammo_shells" then return item(name,"ammo","models/powerups/ammo/shotgunam.md3",1.0,0.0) end if
  if name=="ammo_grenades" then return item(name,"ammo","models/powerups/ammo/grenadeam.md3",1.0,0.0) end if
  if name=="ammo_rockets" then return item(name,"ammo","models/powerups/ammo/rocketam.md3",1.0,0.0) end if
  if name=="ammo_lightning" then return item(name,"ammo","models/powerups/ammo/lightningam.md3",1.0,0.0) end if
  if name=="ammo_slugs" then return item(name,"ammo","models/powerups/ammo/railgunam.md3",1.0,0.0) end if
  if name=="ammo_cells" then return item(name,"ammo","models/powerups/ammo/plasmaam.md3",1.0,0.0) end if
  if name=="ammo_bfg" then return item(name,"ammo","models/powerups/ammo/bfgam.md3",1.0,0.0) end if
  if name=="item_health_small" then return item(name,"health","models/powerups/health/small_cross.md3",1.0,0.0) end if
  if name=="item_health" then return item(name,"health","models/powerups/health/medium_cross.md3",1.0,0.0) end if
  if name=="item_health_large" then return item(name,"health","models/powerups/health/large_cross.md3",1.0,0.0) end if
  if name=="item_health_mega" then return item(name,"health","models/powerups/health/mega_cross.md3",1.0,0.0) end if
  if name=="item_armor_shard" then return item(name,"armor","models/powerups/armor/shard.md3",1.0,0.0) end if
  if name=="item_armor_combat" then return item(name,"armor","models/powerups/armor/armor_yel.md3",1.0,0.0) end if
  if name=="item_armor_body" then return item(name,"armor","models/powerups/armor/armor_red.md3",1.0,0.0) end if
  if name=="item_quad" then return item(name,"powerup","models/powerups/instant/quad.md3",1.0,0.0) end if
  if name=="item_enviro" then return item(name,"powerup","models/powerups/instant/enviro.md3",1.0,0.0) end if
  if name=="item_haste" then return item(name,"powerup","models/powerups/instant/haste.md3",1.0,0.0) end if
  if name=="item_invis" then return item(name,"powerup","models/powerups/instant/invis.md3",1.0,0.0) end if
  if name=="item_regen" then return item(name,"powerup","models/powerups/instant/regen.md3",1.0,0.0) end if
  if name=="item_flight" then return item(name,"powerup","models/powerups/instant/flight.md3",1.0,0.0) end if
  if name=="holdable_medkit" then return item(name,"holdable","models/powerups/holdable/medkit.md3",1.0,0.0) end if
  if name=="holdable_teleporter" then return item(name,"holdable","models/powerups/holdable/teleporter.md3",1.0,0.0) end if
  return void
end function

/// Creates the three orthonormal unit axes used as the identity orientation in playable item models.
function identityAxis() return [[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]] end function
/// Creates a `mq3.client.playable_item_models.Transform` record. Assigns `origin` from `origin`, `axis` from `axis`, `scale` from `scale`.
/// @param origin Value used to initialize `Transform.origin`.
/// @param axis Value used to initialize `Transform.axis`.
/// @param scale Value used to initialize `Transform.scale`.
function transform(origin,axis,scale) return Transform(origin,axis,scale) end function
/// Creates a `mq3.client.playable_item_models.Transform` record. Initializes the record with the defaults written in this constructor.
function identityTransform() return Transform([0.0,0.0,0.0],identityAxis(),1.0) end function
/// Computes `value!=void and len(value)==3` for playable item models `valid3`.
/// @param value Sequence whose length/content is inspected by `valid3`.
function valid3(value) return value!=void and len(value)==3 end function

/// Calls `mq3.client.playable_item_models.valid3` from playable item models `validateTransform`.
/// @param value Record read through `value.origin`, `value.axis`, `value.scale`.
function validateTransform(value)
  if value==void or not valid3(value.origin) or value.axis==void or len(value.axis)!=3 or value.scale<=0.0 then return fail("malformed transform") end if
  for row=0 to 2 if not valid3(value.axis[row]) then return fail("malformed transform axis") end if end for
  return true
end function

/// Calls `mq3.compat.numeric.f32`, `mq3.compat.transcendental.sin`, `mq3.compat.transcendental.cos` and additional helpers from playable item models `yawAxis`. The final path returns `[[c,s,0.0],[numeric.fneg(s),c,0.0],[0.0,0.0,1.0]]`.
/// @param degrees Value used by `radians=numeric.f32(degrees*PI/180.0)`.
function yawAxis(degrees)
  radians=numeric.f32(degrees*PI/180.0);s=numeric.f32(trans.sin(radians));c=numeric.f32(trans.cos(radians))
  return [[c,s,0.0],[numeric.fneg(s),c,0.0],[0.0,0.0,1.0]]
end function

/// Calls `stringEqualsIgnoreCaseAscii` from playable item models `surfaceShader`. The final path returns `""`.
/// @param surface Record read through `surface.name`, `surface.shaders`.
/// @param skin Record read through `skin.mappings`.
function surfaceShader(surface,skin)
  if skin!=void then
    for each mapping in skin.mappings
      if stringEqualsIgnoreCaseAscii(mapping.surface,surface.name) then return mapping.shaderName end if
    end for
  end if
  if len(surface.shaders)>0 then return surface.shaders[0] end if
  return ""
end function

/// Calls `stringEqualsIgnoreCaseAscii` from playable item models `textureByName`.
/// @param catalog Asset catalog used to resolve names to loaded resources. Record read through `catalog.textures`.
/// @param name Name used to select or register the corresponding playable item models resource.
function textureByName(catalog,name)
  for each texture in catalog.textures if stringEqualsIgnoreCaseAscii(texture.imageName,name) then return texture end if end for
  return void
end function

/// Calls `std.string.toLowerAscii`, `std.string.endsWith`, `decode` and additional helpers from playable item models `imageStem`. The final path returns `name`.
/// @param name Name used to select or register the corresponding playable item models resource.
function imageStem(name)
  lower=strings.toLowerAscii(name)
  if strings.endsWith(lower,".tga") or strings.endsWith(lower,".jpg") then return decode(slice(bytes(name),0,len(bytes(name))-4)) end if
  if strings.endsWith(lower,".jpeg") then return decode(slice(bytes(name),0,len(bytes(name))-5)) end if
  return name
end function

/// Updates `catalog.textures` during playable item models `resolveBinding`.
/// @param archive Opened game archive supplying maps, models, textures or other assets.
/// @param catalog Mutable playable item models record/storage; this routine assigns `catalog.textures`.
/// @param surface Record read through `surface.name`.
/// @param surfaceIndex Value used by `return Binding(surfaceIndex,surface.name,shaderName,texture.imageName,texture.image,texture.slot)`.
/// @param skin Value used by `shaderName=surfaceShader(surface,skin)`.
function resolveBinding(archive,catalog,surface,surfaceIndex,skin)
  shaderName=surfaceShader(surface,skin);if shaderName=="" then return fail("surface has no shader: "+surface.name) end if
  requested=materials.mappedImageName(catalog.shaderIndex,shaderName)
  // RE_RegisterShader strips image extensions before looking up a scripted
  // shader; retail pickup MD3s often retain the old .tga suffix.
  if requested==void then requested=materials.mappedImageName(catalog.shaderIndex,imageStem(shaderName)) end if
  if requested==void then requested=shaderName end if
  loaded=materials.loadImage(archive,requested)
  if loaded==void and requested!=shaderName then loaded=materials.loadImage(archive,shaderName) end if
  // Several retail MD3s name a .TGA shader while pak0 stores the same base
  // image as JPEG. Extension-neutral lookup matches the renderer's image path.
  if loaded==void then loaded=materials.loadImage(archive,imageStem(requested)) end if
  if loaded==void and requested!=shaderName then loaded=materials.loadImage(archive,imageStem(shaderName)) end if
  if loaded==void then return fail("image not found for "+shaderName) end if
  texture=textureByName(catalog,loaded[0])
  if texture==void then
    if len(catalog.textures)>=catalog.maxTextureSlots then return fail("texture slot budget exhausted") end if
    texture=Texture(loaded[0],loaded[1],catalog.firstTextureSlot+len(catalog.textures));catalog.textures=catalog.textures+[texture]
  end if
  return Binding(surfaceIndex,surface.name,shaderName,texture.imageName,texture.image,texture.slot)
end function

/// Calls `stringEqualsIgnoreCaseAscii` from playable item models `containsClassname`.
/// @param catalog Asset catalog used to resolve names to loaded resources. Record read through `catalog.assets`.
/// @param classname Value used by `for each asset in catalog.assets if stringEqualsIgnoreCaseAscii(asset.classname,classname) then return true end if end for`.
function containsClassname(catalog,classname)
  for each asset in catalog.assets if stringEqualsIgnoreCaseAscii(asset.classname,classname) then return true end if end for
  return false
end function

/// Calls `mq3.renderer.surface_md3.lerpVertexes`, `mq3.client.playable_item_models.CachedSurface` from playable item models `cacheModelTriangles`. The final path returns `result`.
/// @param model Record read through `model.surfaces`.
function cacheModelTriangles(model)
  result=[]
  for surfaceIndex=0 to len(model.surfaces)-1
    surface=model.surfaces[surfaceIndex]
    decoded=md3Mesh.lerpVertexes(surface.mesh,0,0,0.0);if decoded is error then return decoded end if
    triangleIndexes=array(surface.mesh.numTriangles,void);triangleTexCoords=array(surface.mesh.numTriangles,void)
    for triangleIndex=0 to surface.mesh.numTriangles-1
      at=triangleIndex*3;a=surface.mesh.triangles[at];b=surface.mesh.triangles[at+1];c=surface.mesh.triangles[at+2]
      triangleIndexes[triangleIndex]=[a,b,c]
      triangleTexCoords[triangleIndex]=[surface.mesh.texCoords[a],surface.mesh.texCoords[b],surface.mesh.texCoords[c]]
    end for
    result=result+[CachedSurface(decoded[0],decoded[1],triangleIndexes,triangleTexCoords,surfaceIndex,surface.mesh.numTriangles)]
  end for
  return result
end function

/// Calls `mq3.format.pk3.read`, `mq3.format.md3.load`, `mq3.renderer.player_skins.load` and additional helpers from playable item models `loadDefinition`.
/// @param archive Opened game archive supplying maps, models, textures or other assets.
/// @param catalog Asset catalog used to resolve names to loaded resources.
/// @param def Record read through `def.modelPath`, `def.skinPath`, `def.classname`, `def.category` and additional values.
function loadDefinition(archive,catalog,def)
  data=pk3.read(archive,def.modelPath);if data is error then return data end if
  model=md3.load(data);if model is error then return model end if
  skin=void
  if def.skinPath!="" then skin=skins.load(archive,def.skinPath);if skin is error then return skin end if end if
  bindings=[]
  if len(model.surfaces)>0 then
    for surfaceIndex=0 to len(model.surfaces)-1
      binding=resolveBinding(archive,catalog,model.surfaces[surfaceIndex],surfaceIndex,skin);if binding is error then return binding end if
      bindings=bindings+[binding]
    end for
  end if
  sourceTriangles=cacheModelTriangles(model);if sourceTriangles is error then return sourceTriangles end if
  return Asset(def.classname,def.category,def.modelPath,def.skinPath,model,bindings,sourceTriangles,def.scale,def.heightOffset,def.bobAmplitude,def.spinDegreesPerSecond)
end function

// Loads each unique recognized classname once. The returned texture list owns
// stable native slots and is shared by world pickups and first-person weapons.
/// @param archive Opened game archive supplying maps, models, textures or other assets.
/// @param classnames Value used by `if archive==void or classnames==void then return fail("archive and classnames are required") end if`.
/// @param firstTextureSlot First texture slot reserved for this asset collection.
/// @param maxTextureSlots Maximum number of texture slots available to the renderer.
/// @param maxModels Value used by `if maxModels<0 or maxModels>MAX_CATALOG_MODELS then return fail("model budget outside supported range") end if`.
function loadCatalog(archive,classnames,firstTextureSlot,maxTextureSlots,maxModels)
  if archive==void or classnames==void then return fail("archive and classnames are required") end if
  if firstTextureSlot<0 or maxTextureSlots<0 or maxTextureSlots>MAX_CATALOG_TEXTURES then return fail("texture budget outside supported range") end if
  if maxModels<0 or maxModels>MAX_CATALOG_MODELS then return fail("model budget outside supported range") end if
  scripts=materials.buildScriptIndex(archive);if scripts is error then return scripts end if
  catalog=Catalog([],[],scripts[0],scripts[1],firstTextureSlot,maxTextureSlots,0)
  for each classname in classnames
    def=definition(classname)
    if def!=void and not containsClassname(catalog,def.classname) then
      if len(catalog.assets)>=maxModels then catalog.skipped=catalog.skipped+1
      else
        asset=loadDefinition(archive,catalog,def);if asset is error then return asset end if
        catalog.assets=catalog.assets+[asset]
      end if
    end if
  end for
  return catalog
end function

/// Searches the playable item models collection for find, returning `void` when no entry matches.
/// @param catalog Asset catalog used to resolve names to loaded resources. Record read through `catalog.assets`.
/// @param classname Value used by `for each asset in catalog.assets if stringEqualsIgnoreCaseAscii(asset.classname,classname) then return asset end if end for`.
function find(catalog,classname)
  if catalog==void then return void end if
  for each asset in catalog.assets if stringEqualsIgnoreCaseAscii(asset.classname,classname) then return asset end if end for
  return void
end function

/// Evaluates playable item models `bindingForSurface` and returns `void`, `binding` according to its guard/selection conditions.
/// @param asset Record read through `asset.bindings`.
/// @param surfaceIndex Value used by `for each binding in asset.bindings if binding.surfaceIndex==surfaceIndex then return binding end if end for`.
function bindingForSurface(asset,surfaceIndex)
  if asset==void then return void end if
  for each binding in asset.bindings if binding.surfaceIndex==surfaceIndex then return binding end if end for
  return void
end function

/// Calls `mq3.client.playable_item_models.validateTransform`, `mq3.client.playable_item_models.Triangle` from playable item models `renderAsset`.
/// @param asset Record read through `asset.sourceTriangles`, `asset.bindings`, `asset.classname`.
/// @param value Record read through `value.scale`, `value.axis`, `value.origin`.
/// @param maxTriangles Upper bound on emitted render triangles.
function renderAsset(asset,value,maxTriangles)
  if asset==void then return fail("asset is required") end if
  valid=validateTransform(value);if valid is error then return valid end if
  if maxTriangles<0 then return fail("negative triangle budget") end if
  count=0
  for each surface in asset.sourceTriangles count=count+surface.numTriangles end for
  if count>maxTriangles then count=maxTriangles end if
  result=array(count,void)
  if count==0 then return result end if
  outputIndex=0
  for each surface in asset.sourceTriangles
    if outputIndex<count then
      if surface.surfaceIndex<0 or surface.surfaceIndex>=len(asset.bindings) then return fail("surface material missing") end if
      binding=asset.bindings[surface.surfaceIndex]
      transformedPositions=array(len(surface.positions),void);transformedNormals=array(len(surface.normals),void)
      triangleIndex=0
      while triangleIndex<surface.numTriangles and outputIndex<count
        positions=array(3,void);normals=array(3,void);vertexIndexes=surface.triangleIndexes[triangleIndex]
        for corner=0 to 2
          vertexIndex=vertexIndexes[corner]
          point=transformedPositions[vertexIndex];normal=transformedNormals[vertexIndex]
          if point==void then
            sourcePoint=surface.positions[vertexIndex]
            px=sourcePoint[0]*value.scale;py=sourcePoint[1]*value.scale;pz=sourcePoint[2]*value.scale
            point=[px*value.axis[0][0]+py*value.axis[1][0]+pz*value.axis[2][0]+value.origin[0],px*value.axis[0][1]+py*value.axis[1][1]+pz*value.axis[2][1]+value.origin[1],px*value.axis[0][2]+py*value.axis[1][2]+pz*value.axis[2][2]+value.origin[2]]
            sourceNormal=surface.normals[vertexIndex];nx=sourceNormal[0];ny=sourceNormal[1];nz=sourceNormal[2]
            normal=[nx*value.axis[0][0]+ny*value.axis[1][0]+nz*value.axis[2][0],nx*value.axis[0][1]+ny*value.axis[1][1]+nz*value.axis[2][1],nx*value.axis[0][2]+ny*value.axis[1][2]+nz*value.axis[2][2]]
            transformedPositions[vertexIndex]=point;transformedNormals[vertexIndex]=normal
          end if
          positions[corner]=point;normals[corner]=normal
        end for
        result[outputIndex]=Triangle(positions,surface.triangleTexCoords[triangleIndex],normals,binding.textureSlot,binding.imageName,binding.shaderName,asset.classname,surface.surfaceIndex,value.origin)
        outputIndex=outputIndex+1;triangleIndex=triangleIndex+1
      end while
    end if
  end for
  return result
end function

/// Calls `mq3.client.playable_item_models.valid3`, `mq3.compat.numeric.f32`, `mq3.compat.transcendental.sin` and additional helpers from playable item models `itemTransform`. The final path returns `Transform(placed,yawAxis(yaw),asset.scale)`.
/// @param asset Record read through `asset.bobAmplitude`, `asset.spinDegreesPerSecond`, `asset.heightOffset`, `asset.scale`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param itemIndex Value used by `if asset==void or not valid3(origin) or itemIndex<0 or now<0 then return fail("asset, origin, item index and time are required") end if`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function itemTransform(asset,origin,itemIndex,now)
  if asset==void or not valid3(origin) or itemIndex<0 or now<0 then return fail("asset, origin, item index and time are required") end if
  phase=itemIndex*0.73;seconds=now/1000.0
  bob=numeric.f32(trans.sin(seconds*2.0+phase)*asset.bobAmplitude)
  yaw=seconds*asset.spinDegreesPerSecond+itemIndex*55.0
  placed=[origin[0],origin[1],origin[2]+asset.heightOffset+bob]
  return Transform(placed,yawAxis(yaw),asset.scale)
end function

/// Calls `mq3.client.playable_item_models.itemTransform`, `mq3.client.playable_item_models.renderAsset` from playable item models `renderItem`. The final path returns `renderAsset(asset,placed,maxTriangles)`.
/// @param asset Value used by `placed=itemTransform(asset,origin,itemIndex,now)`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param itemIndex Value used by `placed=itemTransform(asset,origin,itemIndex,now)`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param maxTriangles Upper bound on emitted render triangles.
function renderItem(asset,origin,itemIndex,now,maxTriangles)
  placed=itemTransform(asset,origin,itemIndex,now);if placed is error then return placed end if
  return renderAsset(asset,placed,maxTriangles)
end function

// Applies both per-item and whole-frame budgets to playable_items.Item values.
/// @param catalog Asset catalog used to resolve names to loaded resources.
/// @param itemValues Sequence read at `itemValues[itemIndex]`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param maxItems Value used by `if maxItems<0 or maxTrianglesPerItem<0 or maxTriangles<0 then return fail("negative frame budget") end if`.
/// @param maxTrianglesPerItem Value used by `if maxItems<0 or maxTrianglesPerItem<0 or maxTriangles<0 then return fail("negative frame budget") end if`.
/// @param maxTriangles Upper bound on emitted render triangles.
function renderItems(catalog,itemValues,now,maxItems,maxTrianglesPerItem,maxTriangles)
  if catalog==void or itemValues==void or now<0 then return fail("catalog, items and non-negative time are required") end if
  if maxItems<0 or maxTrianglesPerItem<0 or maxTriangles<0 then return fail("negative frame budget") end if
  result=[];drawn=0;skipped=0
  if len(itemValues)>0 then
    for itemIndex=0 to len(itemValues)-1
      source=itemValues[itemIndex]
      if source.active then
        asset=find(catalog,source.classname)
        if asset==void or drawn>=maxItems or len(result)>=maxTriangles then skipped=skipped+1
        else
          budget=maxTrianglesPerItem;remaining=maxTriangles-len(result);if budget>remaining then budget=remaining end if
          triangles=renderItem(asset,source.origin,itemIndex,now,budget);if triangles is error then return triangles end if
          result=result+triangles;drawn=drawn+1
        end if
      end if
    end for
  end if
  return Batch(result,drawn,skipped)
end function
