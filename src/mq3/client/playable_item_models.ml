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

const DEFAULT_BOB_AMPLITUDE=4.0
const DEFAULT_SPIN_DEGREES_PER_SECOND=100.0
const MAX_CATALOG_MODELS=64
const MAX_CATALOG_TEXTURES=96
const PI=3.14159265358979323846

struct Definition classname category modelPath skinPath scale heightOffset bobAmplitude spinDegreesPerSecond end struct
struct Texture imageName image slot end struct
struct Binding surfaceIndex surfaceName shaderName imageName image textureSlot end struct
struct CachedSurface positions normals triangleIndexes triangleTexCoords surfaceIndex numTriangles end struct
struct Asset classname category modelPath skinPath model bindings sourceTriangles scale heightOffset bobAmplitude spinDegreesPerSecond end struct
struct Catalog assets textures shaderIndex scriptCount firstTextureSlot maxTextureSlots skipped end struct
struct Transform origin axis scale end struct
struct Triangle positions texCoords normals textureSlot imageName shaderName classname surfaceIndex lightOrigin end struct
struct Batch triangles drawnItems skippedItems end struct

function fail(message) return error(7560,"preview item models: "+message) end function

function item(classname,category,path,scale,heightOffset)
  return Definition(classname,category,path,"",scale,heightOffset,DEFAULT_BOB_AMPLITUDE,DEFAULT_SPIN_DEGREES_PER_SECOND)
end function

// Baseq3 bg_itemlist world_model[0] paths. These are the actual MD3 pickups in
// pak0.pk3; aliases only cover classnames emitted by stock maps/gamecode.
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

function identityAxis() return [[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]] end function
function transform(origin,axis,scale) return Transform(origin,axis,scale) end function
function identityTransform() return Transform([0.0,0.0,0.0],identityAxis(),1.0) end function
function valid3(value) return value!=void and len(value)==3 end function

function validateTransform(value)
  if value==void or not valid3(value.origin) or value.axis==void or len(value.axis)!=3 or value.scale<=0.0 then return fail("malformed transform") end if
  for row=0 to 2 if not valid3(value.axis[row]) then return fail("malformed transform axis") end if end for
  return true
end function

function yawAxis(degrees)
  radians=numeric.f32(degrees*PI/180.0);s=numeric.f32(trans.sin(radians));c=numeric.f32(trans.cos(radians))
  return [[c,s,0.0],[numeric.fneg(s),c,0.0],[0.0,0.0,1.0]]
end function

function surfaceShader(surface,skin)
  if skin!=void then
    for each mapping in skin.mappings
      if stringEqualsIgnoreCaseAscii(mapping.surface,surface.name) then return mapping.shaderName end if
    end for
  end if
  if len(surface.shaders)>0 then return surface.shaders[0] end if
  return ""
end function

function textureByName(catalog,name)
  for each texture in catalog.textures if stringEqualsIgnoreCaseAscii(texture.imageName,name) then return texture end if end for
  return void
end function

function imageStem(name)
  lower=strings.toLowerAscii(name)
  if strings.endsWith(lower,".tga") or strings.endsWith(lower,".jpg") then return decode(slice(bytes(name),0,len(bytes(name))-4)) end if
  if strings.endsWith(lower,".jpeg") then return decode(slice(bytes(name),0,len(bytes(name))-5)) end if
  return name
end function

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

function containsClassname(catalog,classname)
  for each asset in catalog.assets if stringEqualsIgnoreCaseAscii(asset.classname,classname) then return true end if end for
  return false
end function

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

function find(catalog,classname)
  if catalog==void then return void end if
  for each asset in catalog.assets if stringEqualsIgnoreCaseAscii(asset.classname,classname) then return asset end if end for
  return void
end function

function bindingForSurface(asset,surfaceIndex)
  if asset==void then return void end if
  for each binding in asset.bindings if binding.surfaceIndex==surfaceIndex then return binding end if end for
  return void
end function

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

function itemTransform(asset,origin,itemIndex,now)
  if asset==void or not valid3(origin) or itemIndex<0 or now<0 then return fail("asset, origin, item index and time are required") end if
  phase=itemIndex*0.73;seconds=now/1000.0
  bob=numeric.f32(trans.sin(seconds*2.0+phase)*asset.bobAmplitude)
  yaw=seconds*asset.spinDegreesPerSecond+itemIndex*55.0
  placed=[origin[0],origin[1],origin[2]+asset.heightOffset+bob]
  return Transform(placed,yawAxis(yaw),asset.scale)
end function

function renderItem(asset,origin,itemIndex,now,maxTriangles)
  placed=itemTransform(asset,origin,itemIndex,now);if placed is error then return placed end if
  return renderAsset(asset,placed,maxTriangles)
end function

// Applies both per-item and whole-frame budgets to playable_items.Item values.
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
