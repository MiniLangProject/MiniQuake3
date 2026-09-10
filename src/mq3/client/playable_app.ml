// SPDX-License-Identifier: GPL-2.0-or-later
// Interactive MiniQuake3 vertical slice with textured BSP and retail MD3 assets.
package mq3.client.playable_app

import mq3.client.playable_viewer as viewer
import mq3.client.playable_menu as menu
import mq3.client.playable_hud as hud
import mq3.client.playable_movement as playableMovement
import mq3.client.playable_items as playableItems
import mq3.client.playable_weapon as playableWeapon
import mq3.client.playable_weapon_inventory as weaponInventory
import mq3.client.playable_shotgun as playableShotgun
import mq3.client.playable_effects as effects
import mq3.client.playable_targets as playableTargets
import mq3.client.playable_target_render as targetRender
import mq3.client.playable_combat_view as combatView
import mq3.client.playable_player as playablePlayer
import mq3.client.playable_enemy_ai as enemyAi
import mq3.client.playable_enemy_events as enemyEvents
import mq3.client.playable_enemy_movement as enemyMovement
import mq3.client.playable_enemy_projectiles as enemyProjectiles
import mq3.client.playable_player_projectiles as playerProjectiles
import mq3.client.playable_projectile_view as projectileView
import mq3.client.playable_projectile_models as projectileModels
import mq3.client.playable_projectile_fx as projectileFx
import mq3.client.playable_sky as playableSky
import mq3.client.playable_muzzle_flash as muzzleFlash
import mq3.client.playable_match as playableMatch
import mq3.client.playable_weapon_sounds as weaponSounds
import mq3.client.playable_ambient_sounds as ambientSounds
import mq3.client.playable_item_models as itemModels
import mq3.client.playable_fps_title as fpsTitle
import mq3.client.baseq3_hud as baseHud
import mq3.client.baseq3_match_display as baseMatchDisplay
import mq3.platform.playable_window as window
import mq3.platform.playable_audio as audio
import mq3.platform.playable_multitexture as multitexture
import mq3.renderer.bsp_preview as preview
import mq3.renderer.bsp_render_data as renderData
import mq3.renderer.world_surface_selection as worldSelection
import mq3.renderer.playable_world_batch as playableWorldBatch
import mq3.renderer.playable_materials as materials
import mq3.renderer.player_model_assembly as playerAssembly
import mq3.renderer.player_skins as playerSkins
import mq3.renderer.player_render_cache as playerCache
import mq3.format.bsp as bsp
import mq3.format.pk3 as pk3
import mq3.format.md3 as md3
import mq3.format.player_animation as playerAnimation
import mq3.audio.wav as wav
import mq3.collision.world as collision
import mq3.compat.textnumbers as textnumbers
import mq3.shared.math as qmath
import std.time as time

// Baseq3's virtual screen and default cg_fov are 640x480 and 90 degrees.
// Using them directly avoids HUD/aspect distortion and lowers software fill cost.
const WIDTH=640
const HEIGHT=480
const HORIZONTAL_FOV=90.0
const MAX_LINES=0
const WORLD_SELECTION_INTERVAL=15
const PLAYER_TEXTURE_FIRST_SLOT=208
const PLAYER_TRIANGLES_PER_SURFACE=8192
const MAX_DETAILED_PLAYER_MODELS=5
const MAX_NATIVE_TEXTURE_SLOTS=256
const MAX_ITEM_MODELS=24
const MAX_ITEM_TEXTURES=48
const MAX_VISIBLE_ITEMS=24
const MAX_ITEM_TRIANGLES=5000
const MAX_TRIANGLES_PER_ITEM=512
const MAX_VIEWMODEL_TRIANGLES=2048
// The optimized indexed-MD3 path keeps stock bob/spin transforms affordable
// at render cadence instead of visibly stepping the pickup animation.
const ITEM_POSE_INTERVAL=1
const MAX_PROJECTILE_TEXTURES=8
const MAX_PROJECTILE_TRIANGLES=1024
const MAX_TRIANGLES_PER_PROJECTILE=256

struct PlayerTexture part surface imageName image slot end struct
struct PlayerSkinSet lower upper head end struct
struct PlayerModelAssets models animation textures cache end struct

function captureEnemyPositions(targetState)
  result=[]
  for each target in targetState.targets result=result+[[[target.origin[0],target.origin[1],target.origin[2]],target.alive]] end for
  return result
end function

function restoreEnemyPositions(targetState,previous)
  for index=0 to len(targetState.targets)-1
    target=targetState.targets[index]
    if previous[index][1] then target.origin=previous[index][0]
    else if target.alive then target.origin=[target.spawnOrigin[0],target.spawnOrigin[1],target.spawnOrigin[2]] end if
  end for
  return void
end function

function collideEnemyPositions(world,targetState,previous)
  for index=0 to len(targetState.targets)-1
    target=targetState.targets[index]
    if target.alive then
      origin=previous[index][0]
      if not previous[index][1] then origin=[target.spawnOrigin[0],target.spawnOrigin[1],target.spawnOrigin[2]] end if
      desired=[target.origin[0]-origin[0],target.origin[1]-origin[1],target.origin[2]-origin[2]]
      target.origin=[origin[0],origin[1],origin[2]]
      moved=enemyMovement.moveTarget(world,target,desired);if moved is error then return moved end if
    end if
  end for
  return void
end function

function field(fields,key)
  for each pair in fields
    if pair[0]==key then return pair[1] end if
  end for
  return ""
end function

function startPose(map)
  entities=bsp.entities(map);if entities is error then return entities end if
  for each entity in entities
    classname=field(entity,"classname")
    if classname=="info_player_deathmatch" or classname=="info_player_start" then
      parsed=textnumbers.vector(field(entity,"origin"),[0.0,0.0,64.0])
      if parsed[0]==3 then
        origin=parsed[1];origin[2]=origin[2]+48.0
        angle=field(entity,"angle");yaw=0.0;if angle!="" then yaw=toNumber(angle) end if
        return [origin,yaw]
      end if
    end if
  end for
  return [[0.0,0.0,64.0],0.0]
end function

function vertexLight(vertex)
  return (vertex.color[0]+vertex.color[1]+vertex.color[2])/(255.0*3.0)
end function

function archiveSound(archive,name)
  if archive==void then return void end if
  data=try(pk3.read(archive,name));if data is error then return void end if
  sound=try(wav.decode(data));if sound is error then return void end if
  return sound
end function

function trailFor(trails,projectileId)
  for each trail in trails if trail.projectileId==projectileId then return trail end if end for
  return void
end function

function projectileSnapshots(previous,state,now)
  result=[]
  for each value in previous
    if value.entityId<1000000 and value.state==projectileView.STATE_IMPACT and projectileView.alive(value,now) then result=result+[value] end if
  end for
  for each trail in state.trails
    result=result+[projectileView.flying(trail.projectileId,projectileView.STYLE_PLASMA,trail.start,trail.endPoint,trail.toTime)]
  end for
  for each projectile in state.projectiles
    if trailFor(state.trails,projectile.id)==void then
      result=result+[projectileView.flying(projectile.id,projectileView.STYLE_PLASMA,projectile.origin,projectile.origin,now)]
    end if
  end for
  for each impact in state.impacts
    if impact.kind!="expired" then result=result+[projectileView.defaultImpact(impact.projectileId,projectileView.STYLE_PLASMA,impact.point,impact.normal,impact.at)] end if
  end for
  return result
end function

function playerProjectileSnapshots(previous,state,now)
  result=[]
  for each value in previous
    if value.entityId>=1000000 and value.state==projectileView.STATE_IMPACT and projectileView.alive(value,now) then result=result+[value] end if
  end for
  for each trail in state.trails
    result=result+[projectileView.flying(1000000+trail.projectileId,trail.style,trail.start,trail.endPoint,trail.toTime)]
  end for
  for each projectile in state.projectiles
    if trailFor(state.trails,projectile.id)==void then
      result=result+[projectileView.flying(1000000+projectile.id,projectile.profile.style,projectile.origin,projectile.origin,now)]
    end if
  end for
  for each impact in state.impacts
    if impact.kind!="expired" then result=result+[projectileView.defaultImpact(1000000+impact.projectileId,impact.style,impact.point,impact.normal,impact.at)] end if
  end for
  return result
end function

function isPlayerProjectile(classname)
  return classname=="weapon_rocketlauncher" or classname=="weapon_plasmagun" or classname=="weapon_grenadelauncher" or classname=="weapon_bfg"
end function

function archiveModel(archive,name,maxTriangles)
  if archive==void then return [] end if
  data=try(pk3.read(archive,name));if data is error then return [] end if
  model=try(md3.load(data));if model is error then return [] end if
  result=try(md3.renderTriangles(model,0,0,0,0.0,maxTriangles));if result is error then return [] end if
  return result
end function

function archiveBytes(archive,name)
  if archive==void then return void end if
  data=try(pk3.read(archive,name));if data is error then return void end if
  return data
end function

function textureSlotForName(textures,name)
  for each texture in textures if stringEqualsIgnoreCaseAscii(texture.imageName,name) then return texture.slot end if end for
  return -1
end function

function nextPlayerTextureSlot(textures)
  slot=PLAYER_TEXTURE_FIRST_SLOT
  for each texture in textures if texture.slot>=slot then slot=texture.slot+1 end if end for
  return slot
end function

function itemClassnames(items)
  // The machinegun also supplies the first-person view model, even on maps
  // which do not place a machinegun pickup.
  result=["weapon_gauntlet","weapon_machinegun"]
  for each value in items
    found=false;for each name in result if stringEqualsIgnoreCaseAscii(name,value.classname) then found=true end if end for
    if not found then result=result+[value.classname] end if
  end for
  for each name in muzzleFlash.classnames()
    found=false;for each existing in result if stringEqualsIgnoreCaseAscii(existing,name) then found=true end if end for
    if not found then result=result+[name] end if
  end for
  return result
end function

function firstFreeModelTexture(modelAssets)
  slot=PLAYER_TEXTURE_FIRST_SLOT
  if modelAssets!=void then for each texture in modelAssets.textures if texture.slot>=slot then slot=texture.slot+1 end if end for end if
  return slot
end function

function firstFreeHudTexture(modelAssets,itemCatalog)
  slot=firstFreeModelTexture(modelAssets)
  if itemCatalog!=void then for each texture in itemCatalog.textures if texture.slot>=slot then slot=texture.slot+1 end if end for end if
  return slot
end function

function firstFreeMenuTexture(modelAssets,itemCatalog,baseHudCatalog)
  slot=firstFreeHudTexture(modelAssets,itemCatalog)
  if baseHudCatalog!=void and baseHudCatalog.firstTextureSlot+baseHudCatalog.textureCount>slot then slot=baseHudCatalog.firstTextureSlot+baseHudCatalog.textureCount end if
  return slot
end function

function pickupName(classname)
  if classname=="item_health_small" then return "5 HEALTH" end if
  if classname=="item_health" then return "25 HEALTH" end if
  if classname=="item_health_large" then return "50 HEALTH" end if
  if classname=="item_health_mega" then return "MEGA HEALTH" end if
  if classname=="item_armor_shard" then return "ARMOR SHARD" end if
  if classname=="item_armor_combat" then return "YELLOW ARMOR" end if
  if classname=="item_armor_body" then return "RED ARMOR" end if
  if classname=="weapon_gauntlet" then return "GAUNTLET" end if
  if classname=="weapon_machinegun" then return "MACHINEGUN" end if
  if classname=="weapon_shotgun" then return "SHOTGUN" end if
  if classname=="weapon_rocketlauncher" then return "ROCKET LAUNCHER" end if
  if classname=="weapon_lightning" then return "LIGHTNING GUN" end if
  if classname=="weapon_plasmagun" then return "PLASMA GUN" end if
  if classname=="weapon_railgun" then return "RAILGUN" end if
  return classname
end function

function digitWeaponDown()
  if window.keyDown(window.VK_1) then return 1 end if
  if window.keyDown(window.VK_2) then return 2 end if
  if window.keyDown(window.VK_3) then return 3 end if
  if window.keyDown(window.VK_4) then return 4 end if
  if window.keyDown(window.VK_5) then return 5 end if
  if window.keyDown(window.VK_6) then return 6 end if
  if window.keyDown(window.VK_7) then return 7 end if
  if window.keyDown(window.VK_8) then return 8 end if
  if window.keyDown(window.VK_9) then return 9 end if
  return 0
end function

function applySelectedWeapon(inventoryState,weaponState,playerState,itemState,combatState)
  selectedDef=weaponInventory.weaponDefinition(inventoryState.selectedWeapon)
  if selectedDef==void then return error(749,"selected weapon definition missing") end if
  configured=playableWeapon.configure(weaponState,selectedDef.classname);if configured is error then return configured end if
  selectedAmmo=weaponInventory.ammoFor(inventoryState,inventoryState.selectedWeapon);if selectedAmmo is error then return selectedAmmo end if
  weaponState.ammo=selectedAmmo
  playerState.weapon=selectedDef.classname;playerState.ammo=selectedAmmo
  itemState.stats.weapon=selectedDef.classname;itemState.stats.ammo=selectedAmmo
  combatState.weaponName=pickupName(selectedDef.classname)
  return true
end function

function syncHudWeaponSelection(hudState,inventoryState,now)
  weapons=[];ammo=[]
  for weapon=weaponInventory.WP_GAUNTLET to weaponInventory.WP_BFG
    if weaponInventory.owns(inventoryState,weapon) then
      def=weaponInventory.weaponDefinition(weapon);if def==void then return error(749,"HUD weapon definition missing") end if
      amount=weaponInventory.ammoFor(inventoryState,weapon);if amount is error then return amount end if
      weapons=weapons+[def.classname];ammo=ammo+[amount]
    end if
  end for
  selected=weaponInventory.weaponDefinition(inventoryState.selectedWeapon);if selected==void then return error(749,"HUD selected weapon missing") end if
  return baseHud.selectWeapons(hudState,weapons,ammo,selected.classname,now)
end function

function gauntletHasTarget(weaponState,camera,targetState)
  muzzle=playableWeapon.muzzlePoint(camera);if muzzle is error then return muzzle end if
  basis=viewer.cameraBasis(camera)
  probe=playableWeapon.shootRay(weaponState,muzzle,basis[0]);if probe is error then return probe end if
  for each target in targetState.targets
    if target.alive and playableTargets.segmentFraction(probe.start,probe.endPoint,target,targetState.radius,targetState.minZ,targetState.maxZ)>=0.0 then return true end if
  end for
  return false
end function

function modelLight(normal)
  // Stable ambient + directed light keeps MD3 shape readable until dynamic
  // BSP light-grid sampling is wired into the preview.
  direction=[0.35,-0.25,0.90];qmath.VectorNormalize(direction)
  dot=qmath.DotProduct(normal,direction);if dot<0.0 then dot=0.0 end if
  value=0.42+dot*0.58;if value>1.0 then value=1.0 end if
  return value
end function

function drawItemTriangles(projection,triangles)
  for each triangle in triangles
    a=viewer.projectPrepared(projection,triangle.positions[0])
    b=viewer.projectPrepared(projection,triangle.positions[1])
    c=viewer.projectPrepared(projection,triangle.positions[2])
    if a!=void and b!=void and c!=void then
      window.drawTriangle(triangle.textureSlot,a,triangle.texCoords[0],modelLight(triangle.normals[0]),b,triangle.texCoords[1],modelLight(triangle.normals[1]),c,triangle.texCoords[2],modelLight(triangle.normals[2]),255,255,255)
    end if
  end for
  return len(triangles)
end function

function drawProjectileTriangles(projection,triangles)
  for each triangle in triangles
    a=viewer.projectPrepared(projection,triangle.positions[0]);b=viewer.projectPrepared(projection,triangle.positions[1]);c=viewer.projectPrepared(projection,triangle.positions[2])
    if a!=void and b!=void and c!=void then
      la=1.0;lb=1.0;lc=1.0
      if triangle.style!=projectileView.STYLE_PLASMA and triangle.style!=projectileView.STYLE_BFG then
        la=modelLight(triangle.normals[0]);lb=modelLight(triangle.normals[1]);lc=modelLight(triangle.normals[2])
      end if
      window.drawTriangle(triangle.textureSlot,a,triangle.texCoords[0],la,b,triangle.texCoords[1],lb,c,triangle.texCoords[2],lc,255,255,255)
    end if
  end for
  return len(triangles)
end function

function pickupModelTriangles(camera,catalog,items,now)
  if catalog==void then return [] end if
  triangles=[];drawn=0
  for index=0 to len(items)-1
    value=items[index]
    if value.active and drawn<MAX_VISIBLE_ITEMS and len(triangles)<MAX_ITEM_TRIANGLES then
      center=viewer.projectPoint(camera,[value.origin[0],value.origin[1],value.origin[2]+8.0],WIDTH,HEIGHT,HORIZONTAL_FOV,1.0)
      if center!=void and center.depth<1800.0 and center.x>-96.0 and center.x<WIDTH+96.0 and center.y>-96.0 and center.y<HEIGHT+96.0 then
        asset=itemModels.find(catalog,value.classname)
        if asset!=void then
          budget=MAX_TRIANGLES_PER_ITEM;remaining=MAX_ITEM_TRIANGLES-len(triangles);if budget>remaining then budget=remaining end if
          output=itemModels.renderItem(asset,value.origin,index,now,budget);if output is error then return output end if
          triangles=triangles+output;drawn=drawn+1
        end if
      end if
    end if
  end for
  return triangles
end function

function drawTintedItemTriangles(projection,triangles,red,green,blue)
  for each triangle in triangles
    a=viewer.projectPrepared(projection,triangle.positions[0]);b=viewer.projectPrepared(projection,triangle.positions[1]);c=viewer.projectPrepared(projection,triangle.positions[2])
    if a!=void and b!=void and c!=void then
      window.drawTriangle(triangle.textureSlot,a,triangle.texCoords[0],1.0,b,triangle.texCoords[1],1.0,c,triangle.texCoords[2],1.0,red,green,blue)
    end if
  end for
  return len(triangles)
end function

function renderViewModel(camera,projection,catalog,weaponState,combatState,now)
  if catalog==void then return 0 end if
  weaponClass=weaponState.classname
  asset=itemModels.find(catalog,weaponClass)
  if asset==void then asset=itemModels.find(catalog,"weapon_machinegun") end if
  if asset==void then return 0 end if
  axes=viewer.cameraBasis(camera);origin=qmath.VectorMA(camera.position,11.0,axes[0]);origin=qmath.VectorMA(origin,4.2,axes[1]);origin=qmath.VectorMA(origin,-5.0,axes[2])
  recoil=combatView.pulse(combatState,now).recoil
  origin=qmath.VectorMA(origin,-1.6*recoil/1000.0,axes[0]);origin=qmath.VectorMA(origin,-0.7*recoil/1000.0,axes[2])
  transform=itemModels.transform(origin,axes,1.35)
  triangles=itemModels.renderAsset(asset,transform,MAX_VIEWMODEL_TRIANGLES);if triangles is error then return triangles end if
  window.clearDepth(1000000000.0)
  drawn=drawItemTriangles(projection,triangles)
  flash=muzzleFlash.render(catalog,weaponClass,transform,combatState.lastFire,now,weaponState.triggerHeld,MAX_VIEWMODEL_TRIANGLES);if flash is error then return flash end if
  flashDrawn=drawTintedItemTriangles(projection,flash.triangles,flash.red,flash.green,flash.blue)
  return drawn+flashDrawn
end function

function appendSkinTextures(textures,skin,part)
  for each binding in skin.bindings
    slot=textureSlotForName(textures,binding.imageName)
    if slot<0 then slot=nextPlayerTextureSlot(textures) end if
    textures=textures+[PlayerTexture(part,binding.surface,binding.imageName,binding.image,slot)]
  end for
  return textures
end function

function archivePlayerAssets(archive,shaderScripts)
  lower=archiveBytes(archive,"models/players/sarge/lower.md3")
  upper=archiveBytes(archive,"models/players/sarge/upper.md3")
  head=archiveBytes(archive,"models/players/sarge/head.md3")
  configData=archiveBytes(archive,"models/players/sarge/animation.cfg")
  if lower==void or upper==void or head==void or configData==void then return void end if
  modelSet=try(playerAssembly.load(lower,upper,head));if modelSet is error then return void end if
  animation=try(playerAnimation.parse(decode(configData)));if animation is error then return void end if
  lowerSkin=try(playerSkins.loadResolved(archive,playerSkins.SARGE_LOWER,shaderScripts));if lowerSkin is error then return void end if
  upperSkin=try(playerSkins.loadResolved(archive,playerSkins.SARGE_UPPER,shaderScripts));if upperSkin is error then return void end if
  headSkin=try(playerSkins.loadResolved(archive,playerSkins.SARGE_HEAD,shaderScripts));if headSkin is error then return void end if
  textures=appendSkinTextures([],lowerSkin,playerAssembly.LOWER_PART)
  textures=appendSkinTextures(textures,upperSkin,playerAssembly.UPPER_PART)
  textures=appendSkinTextures(textures,headSkin,playerAssembly.HEAD_PART)
  policy=try(playerCache.lodPolicy(320.0,850.0,1800.0,2,4));if policy is error then return void end if
  light=try(playerCache.lighting([0.35,-0.25,0.90],0.42,0.58));if light is error then return void end if
  skinSet=PlayerSkinSet(lowerSkin,upperSkin,headSkin)
  cache=try(playerCache.createDetailed(modelSet,skinSet,4,48,MAX_DETAILED_PLAYER_MODELS,policy,light));if cache is error then return void end if
  return PlayerModelAssets(modelSet,animation,textures,cache)
end function

function playerTextureSlot(assets,triangle)
  model=assets.models.lower
  if triangle.part==playerAssembly.UPPER_PART then model=assets.models.upper else if triangle.part==playerAssembly.HEAD_PART then model=assets.models.head end if
  if triangle.surfaceIndex<0 or triangle.surfaceIndex>=len(model.surfaces) then return -1 end if
  surface=model.surfaces[triangle.surfaceIndex].name
  for each texture in assets.textures
    if texture.part==triangle.part and stringEqualsIgnoreCaseAscii(texture.surface,surface) then return texture.slot end if
  end for
  return -1
end function

function detailedPlayerTextureSlot(assets,triangle)
  for each texture in assets.textures if stringEqualsIgnoreCaseAscii(texture.imageName,triangle.imageName) then return texture.slot end if end for
  return -1
end function

function targetTransform(target,camera)
  forward=[camera.position[0]-target.origin[0],camera.position[1]-target.origin[1],0.0]
  if qmath.VectorNormalize(forward)==0.0 then forward=[1.0,0.0,0.0] end if
  left=[0.0-forward[1],forward[0],0.0]
  root=playerAssembly.identityTransform();root.origin=[target.origin[0],target.origin[1],target.origin[2]+24.0];root.axis=[forward,left,[0.0,0.0,1.0]]
  return root
end function

function animatedPlayerTriangles(assets,now)
  if assets==void then return [] end if
  sample=try(playerAnimation.samplePlayer(assets.animation,15,11,now));if sample is error then return [] end if
  lower=playerAssembly.animation(sample.lower.frame,sample.lower.oldFrame,sample.lower.backlerp)
  upper=playerAssembly.animation(sample.upper.frame,sample.upper.oldFrame,sample.upper.backlerp)
  head=playerAssembly.animation(0,0,0.0)
  assembled=try(playerAssembly.assemble(assets.models,lower,upper,head,playerAssembly.identityTransform()));if assembled is error then return [] end if
  triangles=try(playerAssembly.render(assembled,PLAYER_TRIANGLES_PER_SURFACE));if triangles is error then return [] end if
  return triangles
end function

function renderTargetModels(camera,projection,renderTargets,modelAssets,eventState,enemyState,now)
  if modelAssets==void or eventState==void then return void end if
  reset=playerCache.beginFrame(modelAssets.cache);if reset is error then return reset end if
  for index=0 to len(renderTargets)-1
    target=renderTargets[index];input=enemyEvents.input(eventState,index)
    if input is error then return input end if
    show=enemyState.brains[index].visible
    if input.action=="death" and input.elapsedMilliseconds<1200 then show=true end if
    if modelAssets.cache.frameTargets<MAX_DETAILED_PLAYER_MODELS then
      lower=playerAnimation.sampleAnimation(modelAssets.animation,input.lowerAnimation,input.elapsedMilliseconds)
      upper=playerAnimation.sampleAnimation(modelAssets.animation,input.upperAnimation,input.elapsedMilliseconds)
      if not (lower is error) and not (upper is error) then
        root=targetTransform(target,camera)
        modelTriangles=playerCache.renderTargetDetailed(modelAssets.cache,lower,upper,root,camera.position,show)
        if not (modelTriangles is error) then
          for each triangle in modelTriangles
            a=viewer.projectPrepared(projection,triangle.positions[0])
            b=viewer.projectPrepared(projection,triangle.positions[1])
            c=viewer.projectPrepared(projection,triangle.positions[2])
            if a!=void and b!=void and c!=void then
              slot=detailedPlayerTextureSlot(modelAssets,triangle)
              window.drawTriangle(slot,a,triangle.texCoords[0],triangle.lights[0],b,triangle.texCoords[1],triangle.lights[1],c,triangle.texCoords[2],triangle.lights[2],255,255,255)
            end if
          end for
        end if
      end if
    end if
  end for
  return void
end function

function createRenderTargets(targetState)
  result=[]
  for each target in targetState.targets result=result+[targetRender.target(target.origin,target.health,target.maxHealth)] end for
  return result
end function

function syncRenderTargets(targetState,renderTargets,combatHit,now)
  for index=0 to len(targetState.targets)-1
    source=targetState.targets[index];view=renderTargets[index]
    view.origin=source.origin;view.health=source.health;view.maxHealth=source.maxHealth
    view.alive=source.alive;view.respawnAt=source.respawnAt
  end for
  if combatHit!=void then renderTargets[combatHit.targetIndex].hitFlashUntil=now+120 end if
  return void
end function

function visibleTargetViews(enemyState,renderTargets,now)
  result=[]
  for index=0 to len(renderTargets)-1
    view=renderTargets[index]
    if enemyState.brains[index].visible or (not view.alive and view.respawnAt>now) then result=result+[view] end if
  end for
  return result
end function

function reservePlayerSpawn(targetState,playerState,spawnIndex)
  previous=spawnIndex-1;if previous<0 then previous=len(playerState.spawns)-1 end if
  for each target in targetState.targets
    if target.spawnIndex==spawnIndex then
      spawn=playerState.spawns[previous];target.spawnIndex=previous
      target.spawnOrigin=[spawn.origin[0],spawn.origin[1],spawn.origin[2]-48.0]
      target.origin=[target.spawnOrigin[0],target.spawnOrigin[1],target.spawnOrigin[2]]
      return void
    end if
  end for
  return void
end function

function render(camera,geometry,worldBatchState,materialCatalog,skyCatalog,itemCatalog,projectileCatalog,projectileFxState,pickupTriangles,hudState,baseHudCatalog,baseHudState,menuCatalog,menuState,matchMedia,itemState,playerState,shotEffects,projectileEffects,renderTargets,visibleTargets,modelAssets,eventState,enemyState,weaponState,combatState,matchState,matchView,matchCenter,now,menuOpen)
  window.beginFrame(7,10,16)
  if menuOpen then
    menuDraw=menu.drawRetailState(menuCatalog,menuState,WIDTH,HEIGHT,now);if menuDraw is error then return menuDraw end if
    if menuCatalog==void then hud.drawText("SPACE JUMP  MOUSE1 FIRE",WIDTH/2-138,HEIGHT/2+112,2,150,205,215) end if
    window.present();return void
  end if
  if skyCatalog!=void then skyDraw=playableSky.draw(skyCatalog,camera,WIDTH,HEIGHT,now);if skyDraw is error then return skyDraw end if end if
  projection=viewer.prepareProjection(camera,WIDTH,HEIGHT,HORIZONTAL_FOV,1.0);if projection is error then return projection end if
  worldDrawn=0
  if materialCatalog!=void then worldDrawn=playableWorldBatch.drawMaterials(worldBatchState,projection,now)
  else worldDrawn=playableWorldBatch.draw(worldBatchState,projection) end if
  if worldDrawn is error then return worldDrawn end if
  for each edge in geometry.lines
    projected=viewer.projectLine(camera,edge.a,edge.b,WIDTH,HEIGHT,HORIZONTAL_FOV,1.0)
    if projected.visible then window.drawLine(projected.a,projected.b,28,80,90) end if
  end for
  if menuOpen then
    menu.drawRetail(menuCatalog,WIDTH,HEIGHT,now)
    if menuCatalog==void then hud.drawText("SPACE JUMP  MOUSE1 FIRE",WIDTH/2-138,HEIGHT/2+112,2,150,205,215) end if
  else
    itemDraw=drawItemTriangles(projection,pickupTriangles);if itemDraw is error then return itemDraw end if
    targetDraw=renderTargetModels(camera,projection,renderTargets,modelAssets,eventState,enemyState,now);if targetDraw is error then return targetDraw end if
    trailCommands=projectileFx.frameCommands(projectileFxState,camera,projectileEffects,now,WIDTH,HEIGHT,HORIZONTAL_FOV,1.0)
    projectileFx.draw(trailCommands)
    fallbackProjectiles=projectileEffects
    if projectileCatalog!=void then
      projectileBatch=projectileModels.renderSnapshots(projectileCatalog,projectileEffects,camera,now,MAX_TRIANGLES_PER_PROJECTILE,MAX_PROJECTILE_TRIANGLES);if projectileBatch is error then return projectileBatch end if
      projectileDraw=drawProjectileTriangles(projection,projectileBatch.triangles);if projectileDraw is error then return projectileDraw end if
      fallbackProjectiles=projectileBatch.fallbackSnapshots
    end if
    projectileCommands=projectileView.frameCommands(camera,fallbackProjectiles,now,WIDTH,HEIGHT,HORIZONTAL_FOV,1.0)
    projectileView.draw(projectileCommands)
    viewDraw=renderViewModel(camera,projection,itemCatalog,weaponState,combatState,now);if viewDraw is error then return viewDraw end if
    uiState=multitexture.setState(multitexture.BLEND_ALPHA,false,false);if uiState is error then return uiState end if
    if baseHudCatalog!=void then
      drawnHud=baseHud.draw(baseHudCatalog,baseHudState,WIDTH,HEIGHT,now);if drawnHud is error then return drawnHud end if
      combatView.drawTransientFeedback(combatState,WIDTH,HEIGHT,now)
    else
      hud.draw(hudState,WIDTH,HEIGHT);combatView.drawFeedback(combatState,WIDTH,HEIGHT,now)
    end if
    if matchMedia!=void and matchView!=void then
      warmupEnd=0;if matchState.phase==playableMatch.PHASE_WARMUP then warmupEnd=matchState.matchStart end if
      showTimer=matchState.phase==playableMatch.PHASE_ACTIVE or matchState.phase==playableMatch.PHASE_INTERMISSION
      matchDraw=baseMatchDisplay.draw(matchMedia,WIDTH,HEIGHT,matchState.matchStart,now,showTimer,"FREE FOR ALL",warmupEnd,matchCenter);if matchDraw is error then return matchDraw end if
      if matchState.phase==playableMatch.PHASE_INTERMISSION then scoreDraw=baseMatchDisplay.drawScoreboard(matchMedia,WIDTH,HEIGHT,combatState.score,combatState.deaths,combatState.deaths);if scoreDraw is error then return scoreDraw end if end if
    else if matchView!=void then
      hud.drawText(matchView.clock,WIDTH/2-hud.textWidth(matchView.clock,2)/2,16,2,255,255,255)
      if len(matchView.message)>0 then hud.drawText(matchView.message,WIDTH/2-hud.textWidth(matchView.message,4)/2,HEIGHT/2-56,4,255,220,96) end if
    end if
    resetUiState=multitexture.setState(multitexture.BLEND_OPAQUE,false,true);if resetUiState is error then return resetUiState end if
  end if
  window.present()
  return void
end function

function frameLoop(camera,geometry,triangles,worldBatchState,materialCatalog,worldCache,worldConfig,materialSlots,skyTextureFlags,skyCatalog,itemCatalog,projectileCatalog,projectileFxState,hudState,baseHudCatalog,baseHudState,menuCatalog,menuState,matchMedia,itemState,inventoryState,weaponState,targetState,renderTargets,modelAssets,combatState,matchState,playerState,enemyState,eventState,projectileState,playerProjectileState,controller,fpsState,maxFrames,matchSounds,fireSound,weaponSoundCatalog,enemyFireSound,enemyImpactSound,pickupSound,jumpSound,painSound,deathSound)
  previous=window.milliseconds();frames=0;menuOpen=maxFrames<0;lastEnter=false;lastEscape=false;lastPreviousWeapon=false;lastNextWeapon=false;lastDigitWeapon=0;shotEffects=[];projectileEffects=[];pickupTriangles=[];updateMilliseconds=0;renderMilliseconds=0;matchView=void;lastMatchMessage="";matchCenter=void
  if maxFrames>=0 then started=playableMatch.start(matchState,previous);if started is error then return started end if;hudSelection=syncHudWeaponSelection(baseHudState,inventoryState,previous);if hudSelection is error then return hudSelection end if end if
  while not window.shouldClose() and (maxFrames<0 or frames<maxFrames)
    window.poll()
    enterDown=window.keyDown(window.VK_RETURN);escapeDown=window.keyDown(window.VK_ESCAPE)
    if menuOpen and escapeDown and not lastEscape then break end if
    menuAction=menu.ACTION_NONE
    if menuOpen then menuAction=menu.step(menuState,window.keyDown(window.VK_UP),window.keyDown(window.VK_DOWN),enterDown);if menuAction is error then return menuAction end if end if
    if menuOpen and menuAction==menu.ACTION_EXIT then break end if
    if menuOpen and menuAction==menu.ACTION_SINGLE_PLAYER then
      menuOpen=false
      if matchState.phase==playableMatch.PHASE_WAITING then started=playableMatch.start(matchState,window.milliseconds());if started is error then return started end if end if
      hudSelection=syncHudWeaponSelection(baseHudState,inventoryState,window.milliseconds());if hudSelection is error then return hudSelection end if
    end if
    if not menuOpen and escapeDown and not lastEscape then menuOpen=true end if
    current=window.milliseconds();elapsed=current-previous;previous=current
    mouse=window.mouseDelta()
    if not menuOpen then
      matchView=playableMatch.update(matchState,current,combatState.score,combatState.deaths);if matchView is error then return matchView end if
      if matchView.message!=lastMatchMessage then
        cue=playableMatch.announcerCue(matchView.message)
        if cue>playableMatch.ANNOUNCER_NONE and matchSounds!=void and cue<len(matchSounds) and matchSounds[cue]!=void then ignored=try(audio.play(matchSounds[cue])) end if
        lastMatchMessage=matchView.message
        if matchView.message=="FIGHT!" or matchView.phase==playableMatch.PHASE_INTERMISSION then
          centerDuration=3000;if matchView.phase==playableMatch.PHASE_INTERMISSION then centerDuration=600000 end if
          matchCenter=baseMatchDisplay.centerPrint(matchView.message,current,144,16,centerDuration);if matchCenter is error then return matchCenter end if
        end if
      end if
      viewer.applyMouse(camera,mouse[0],mouse[1])
      previousTargets=captureEnemyPositions(targetState)
      targetCount=playableTargets.update(targetState,current);if targetCount is error then return targetCount end if
      restoreEnemyPositions(targetState,previousTargets)
      respawn=playablePlayer.pollRespawn(playerState,current);if respawn is error then return respawn end if
      if respawn.respawned then
        reservePlayerSpawn(targetState,playerState,respawn.spawnIndex)
        controller.motion.origin=[respawn.position[0],respawn.position[1],respawn.position[2]];controller.motion.velocity=[0.0,0.0,0.0]
        camera.position=controller.motion.origin;camera.yaw=respawn.yaw;camera.pitch=0.0
        resetInventory=weaponInventory.respawn(inventoryState,false);if resetInventory is error then return resetInventory end if
        respawnWeapon=weaponInventory.weaponDefinition(inventoryState.selectedWeapon);if respawnWeapon==void then return error(749,"respawn weapon definition missing") end if
        configured=playableWeapon.configure(weaponState,respawnWeapon.classname);if configured is error then return configured end if
        weaponState.cooldownRemaining=0;weaponState.triggerHeld=false;weaponState.ammo=weaponInventory.ammoFor(inventoryState,inventoryState.selectedWeapon)
        playerState.weapon=respawnWeapon.classname;playerState.ammo=weaponState.ammo
        itemState.stats.health=playerState.health;itemState.stats.armor=playerState.armor;itemState.stats.ammo=playerState.ammo;itemState.stats.weapon=playerState.weapon
        combatState.weaponName=pickupName(playerState.weapon)
        hudSelection=syncHudWeaponSelection(baseHudState,inventoryState,current);if hudSelection is error then return hudSelection end if
      end if
      shot=void;enemyState.events=[]
      if playerState.alive and matchView.phase!=playableMatch.PHASE_INTERMISSION then
        forward=0;if window.keyDown(window.VK_W) then forward=forward+1 end if;if window.keyDown(window.VK_S) then forward=forward-1 end if
        right=0;if window.keyDown(window.VK_D) then right=right+1 end if;if window.keyDown(window.VK_A) then right=right-1 end if
        jumped=playableMovement.step(controller,camera.yaw,forward,right,window.keyDown(window.VK_SPACE),elapsed)
        if jumped is error then return jumped end if
        camera.position=playableMovement.position(controller);playerState.position=camera.position;playerState.yaw=camera.yaw
        if jumped and jumpSound!=void then ignored=try(audio.play(jumpSound)) end if
        pickups=playableItems.updateInventory(itemState,camera.position,current,inventoryState,false);if pickups is error then return pickups end if
        if len(pickups)>0 then
          previousWeapon=playerState.weapon
          playerState.health=itemState.stats.health;playerState.armor=itemState.stats.armor;playerState.ammo=itemState.stats.ammo;playerState.weapon=itemState.stats.weapon
          combatState.weaponName=pickupName(playerState.weapon)
          weaponState.ammo=playerState.ammo
          if playerState.weapon!=previousWeapon then configured=playableWeapon.configure(weaponState,playerState.weapon);if configured is error then return configured end if;hudSelection=syncHudWeaponSelection(baseHudState,inventoryState,current);if hudSelection is error then return hudSelection end if end if
          selectedPickupSound=pickupSound
          if weaponSoundCatalog!=void then candidate=weaponSounds.pickupSound(weaponSoundCatalog,pickups[len(pickups)-1].classname);if candidate!=void then selectedPickupSound=candidate end if end if
          if selectedPickupSound!=void then ignored=try(audio.play(selectedPickupSound)) end if
          if baseHudCatalog!=void then for each pickup in pickups baseHud.pickup(baseHudState,pickup.classname,pickupName(pickup.classname),current) end for end if
        end if
        previousWeaponDown=window.keyDown(window.VK_Q);nextWeaponDown=window.keyDown(window.VK_E);digitWeapon=digitWeaponDown()
        if (previousWeaponDown and not lastPreviousWeapon) or (nextWeaponDown and not lastNextWeapon) or (digitWeapon!=0 and digitWeapon!=lastDigitWeapon) then
          inventoryState.ammo[inventoryState.selectedWeapon]=weaponState.ammo
          selectedWeapon=inventoryState.selectedWeapon
          if previousWeaponDown and not lastPreviousWeapon then selectedWeapon=weaponInventory.previousWeapon(inventoryState)
          else if nextWeaponDown and not lastNextWeapon then selectedWeapon=weaponInventory.nextWeapon(inventoryState)
          else if weaponInventory.selectDigit(inventoryState,digitWeapon) then selectedWeapon=inventoryState.selectedWeapon end if
          if selectedWeapon is error then return selectedWeapon end if
          selectedDef=weaponInventory.weaponDefinition(selectedWeapon)
          if selectedDef!=void and selectedDef.classname!=playerState.weapon then changed=applySelectedWeapon(inventoryState,weaponState,playerState,itemState,combatState);if changed is error then return changed end if;hudSelection=syncHudWeaponSelection(baseHudState,inventoryState,current);if hudSelection is error then return hudSelection end if end if
        end if
        attacks=enemyAi.step(controller.motion.context,enemyState,targetState,camera.position,current,elapsed);if attacks is error then return attacks end if
        collided=collideEnemyPositions(controller.motion.context,targetState,previousTargets);if collided is error then return collided end if
        spawned=enemyProjectiles.spawnAttacks(projectileState,enemyState,targetState,camera.position,current);if spawned is error then return spawned end if
        if len(spawned)>0 and enemyFireSound!=void then ignored=try(audio.play(enemyFireSound)) end if
        attackDown=window.keyDown(window.VK_LBUTTON)
        if attackDown and weaponState.classname=="weapon_gauntlet" then attackDown=gauntletHasTarget(weaponState,camera,targetState);if attackDown is error then return attackDown end if end if
        shot=playableWeapon.step(weaponState,camera,attackDown,elapsed)
        if shot is error then return shot end if
        if weaponState.noAmmoEvent then
          selectedWeapon=weaponInventory.outOfAmmoChange(inventoryState);if selectedWeapon is error then return selectedWeapon end if
          changed=applySelectedWeapon(inventoryState,weaponState,playerState,itemState,combatState);if changed is error then return changed end if
          hudSelection=syncHudWeaponSelection(baseHudState,inventoryState,current);if hudSelection is error then return hudSelection end if
        end if
        if shot!=void then
          inventoryState.ammo[inventoryState.selectedWeapon]=weaponState.ammo;itemState.stats.ammo=weaponState.ammo;playerState.ammo=weaponState.ammo
          combatView.fire(combatState,current)
          if weaponState.classname=="weapon_shotgun" then
            basis=viewer.cameraBasis(camera)
            blast=playableShotgun.fire(controller.motion.context,targetState,shot.start,basis[0],weaponState.shotsFired&255,current);if blast is error then return blast end if
            hitCursor=0
            for each pellet in blast.pellets
              pelletImpact=pellet.endPoint
              if pellet.targetIndex>=0 then
                pelletHit=blast.hits[hitCursor];hitCursor=hitCursor+1;pelletImpact=pelletHit.point
                syncRenderTargets(targetState,renderTargets,pelletHit,current)
              end if
              shotEffects=shotEffects+[effects.defaultShot(pellet.start,pelletImpact,current)]
            end for
            if blast.accuracyHit then combatView.registerHit(combatState,current) end if
            if blast.kills>0 then
              for killIndex=1 to blast.kills combatView.registerKill(combatState,current,targetState.score);if baseHudCatalog!=void then baseHud.frag(baseHudState,current) end if end for
            end if
          else if isPlayerProjectile(weaponState.classname) then
            basis=viewer.cameraBasis(camera)
            spawnedPlayerProjectile=playerProjectiles.spawn(playerProjectileState,weaponState.classname,shot.start,basis[0],current)
            if spawnedPlayerProjectile is error then return spawnedPlayerProjectile end if
          else
            combatHit=playableTargets.applyShot(targetState,shot,weaponState.damage,current);if combatHit is error then return combatHit end if
            impact=shot.endPoint
            if combatHit!=void then
              impact=combatHit.point;combatView.registerHit(combatState,current)
              if combatHit.killed then combatView.registerKill(combatState,current,targetState.score);if baseHudCatalog!=void then baseHud.frag(baseHudState,current) end if end if
            end if
            syncRenderTargets(targetState,renderTargets,combatHit,current)
            if weaponState.classname!="weapon_gauntlet" or combatHit!=void then shotEffects=shotEffects+[effects.defaultShot(shot.start,impact,current)] end if
          end if
          selectedFireSound=fireSound
          if weaponSoundCatalog!=void then candidate=weaponSounds.fireSound(weaponSoundCatalog,weaponState.classname,weaponState.shotsFired-1);if candidate!=void then selectedFireSound=candidate end if end if
          if selectedFireSound!=void then ignored=try(audio.play(selectedFireSound)) end if
        end if
      end if
      if shot==void then syncRenderTargets(targetState,renderTargets,void,current) end if
      projectileDamage=enemyProjectiles.update(controller.motion.context,projectileState,camera.position,current);if projectileDamage is error then return projectileDamage end if
      for each projectileImpact in projectileState.impacts
        if projectileImpact.kind=="player" and playerState.alive then
          damage=playablePlayer.applyNormalDamage(playerState,projectileImpact.damage,current);if damage is error then return damage end if
          if not damage.ignored and damage.taken>0 then
            combatView.takeDamage(combatState,current,damage.taken,projectileImpact.side)
            if damage.killed then
              combatView.registerDeath(combatState)
              if deathSound!=void then ignored=try(audio.play(deathSound)) end if
            else if painSound!=void then ignored=try(audio.play(painSound)) end if
          end if
        end if
        if projectileImpact.kind!="expired" and enemyImpactSound!=void then ignored=try(audio.play(enemyImpactSound)) end if
      end for
      projectileEffects=projectileSnapshots(projectileEffects,projectileState,current)
      playerProjectileDamage=playerProjectiles.update(controller.motion.context,playerProjectileState,targetState,current);if playerProjectileDamage is error then return playerProjectileDamage end if
      for each playerImpact in playerProjectileState.impacts
        for each dealt in playerImpact.damages
          if dealt.amount>0 then combatView.registerHit(combatState,current);syncRenderTargets(targetState,renderTargets,dealt,current) end if
          if dealt.killed then combatView.registerKill(combatState,current,targetState.score);if baseHudCatalog!=void then baseHud.frag(baseHudState,current) end if end if
        end for
        if playerImpact.kind!="expired" and weaponSoundCatalog!=void then
          selectedImpactSound=weaponSounds.impactSound(weaponSoundCatalog,playerImpact.classname,playerImpact.id)
          if selectedImpactSound!=void then ignored=try(audio.play(selectedImpactSound)) end if
        end if
      end for
      projectileEffects=projectileEffects+playerProjectileSnapshots(projectileEffects,playerProjectileState,current)
      trailCount=projectileFx.update(projectileFxState,projectileEffects,current);if trailCount is error then return trailCount end if
      itemState.stats.health=playerState.health;itemState.stats.armor=playerState.armor
      enemyInputs=enemyEvents.update(eventState,targetState,enemyState,current);if enemyInputs is error then return enemyInputs end if
      shotEffects=effects.liveEffects(shotEffects,current)
      hud.setValues(hudState,itemState.stats.health,itemState.stats.armor,weaponState.ammo)
      if baseHudCatalog!=void then
        baseHudState.health=itemState.stats.health;baseHudState.armor=itemState.stats.armor;baseHudState.ammo=weaponState.ammo;baseHudState.weapon=playerState.weapon
        baseHudState.score=combatState.score;baseHudState.kills=combatState.kills;baseHudState.deaths=combatState.deaths
      end if
      if frames%ITEM_POSE_INTERVAL==0 then pickupTriangles=pickupModelTriangles(camera,itemCatalog,itemState.items,current) end if
      if frames>0 and frames%WORLD_SELECTION_INTERVAL==0 then
        prepared=worldSelection.prepareCached(worldCache,camera,worldConfig);if prepared is error then return prepared end if
        triangles=prepared.renderData
        worldBatchState=void
        if materialCatalog!=void then worldBatchState=playableWorldBatch.buildMaterials(triangles,materialCatalog,skyTextureFlags)
        else worldBatchState=playableWorldBatch.build(triangles,materialSlots,skyTextureFlags) end if
        if worldBatchState is error then return worldBatchState end if
      end if
    end if
    visibleTargets=renderTargets
    if not menuOpen then visibleTargets=visibleTargetViews(enemyState,renderTargets,current) end if
    renderStarted=window.milliseconds();updateMilliseconds=updateMilliseconds+(renderStarted-current)
    rendered=render(camera,geometry,worldBatchState,materialCatalog,skyCatalog,itemCatalog,projectileCatalog,projectileFxState,pickupTriangles,hudState,baseHudCatalog,baseHudState,menuCatalog,menuState,matchMedia,itemState,playerState,shotEffects,projectileEffects,renderTargets,visibleTargets,modelAssets,eventState,enemyState,weaponState,combatState,matchState,matchView,matchCenter,current,menuOpen);if rendered is error then return rendered end if;renderMilliseconds=renderMilliseconds+(window.milliseconds()-renderStarted);frames=frames+1
    caption=fpsTitle.frame(fpsState,window.milliseconds());if caption is error then return caption end if
    if caption!=void and not window.setTitle(caption) then return error(7489,"could not update preview window title") end if
    lastEnter=enterDown;lastEscape=escapeDown;lastPreviousWeapon=window.keyDown(window.VK_Q);lastNextWeapon=window.keyDown(window.VK_E);lastDigitWeapon=digitWeaponDown()
    time.sleep(1)
  end while
  if frames>0 then print "Frame profile: update "+str(updateMilliseconds/frames)+" ms, render "+str(renderMilliseconds/frames)+" ms" end if
  return frames
end function

function runLimited(map,maxFrames,sound,archive)
  geometry=preview.wireframe(map,[],MAX_LINES);if geometry is error then return geometry end if
  world=collision.load(map.data);if world is error then return world end if
  playerState=playablePlayer.load(map);if playerState is error then return playerState end if
  camera=viewer.camera(playerState.position,playerState.yaw,0.0,320.0,0.12);if camera is error then return camera end if
  worldConfig=worldSelection.defaults(WIDTH,HEIGHT);if worldConfig is error then return worldConfig end if
  worldConfig.horizontalFov=HORIZONTAL_FOV
  worldConfig.triangleBudget=20000
  worldCache=worldSelection.buildCache(map,worldConfig.patchError);if worldCache is error then return worldCache end if
  preparedWorld=worldSelection.prepareCached(worldCache,camera,worldConfig);if preparedWorld is error then return preparedWorld end if
  triangles=preparedWorld.renderData
  controller=playableMovement.create(world,camera.position);if controller is error then return controller end if
  itemState=playableItems.load(map);if itemState is error then return itemState end if
  inventoryState=weaponInventory.create(false);if inventoryState is error then return inventoryState end if
  weaponState=playableWeapon.create(world);if weaponState is error then return weaponState end if
  weaponState.capacity=200;weaponState.ammo=weaponInventory.ammoFor(inventoryState,inventoryState.selectedWeapon)
  playerState.ammo=weaponState.ammo;playerState.weapon="weapon_machinegun"
  targetState=playableTargets.load(map,playerState.spawnIndex);if targetState is error then return targetState end if
  enemyState=enemyAi.state(targetState,0);if enemyState is error then return enemyState end if
  eventState=enemyEvents.state(targetState,0);if eventState is error then return eventState end if
  projectileState=enemyProjectiles.createAabb(0);if projectileState is error then return projectileState end if
  playerProjectileState=playerProjectiles.create(0);if playerProjectileState is error then return playerProjectileState end if
  projectileFxState=projectileFx.create()
  renderTargets=createRenderTargets(targetState)
  combatState=combatView.state(pickupName(playerState.weapon))
  matchState=playableMatch.create(10,5,3000);if matchState is error then return matchState end if
  shaderScripts=void
  if archive!=void then loadedScripts=try(materials.buildScriptIndex(archive));if not (loadedScripts is error) then shaderScripts=loadedScripts end if end if
  catalog=void
  if archive!=void and shaderScripts!=void then
    loadedCatalog=try(materials.loadIndexed(archive,map,128,64,shaderScripts[0],shaderScripts[1]))
    if not (loadedCatalog is error) then catalog=loadedCatalog end if
  end if
  projectileCatalog=void
  if archive!=void then
    projectileFirst=64;if catalog!=void then projectileFirst=64+catalog.textureCount end if
    availableProjectileSlots=PLAYER_TEXTURE_FIRST_SLOT-projectileFirst
    if availableProjectileSlots>MAX_PROJECTILE_TEXTURES then availableProjectileSlots=MAX_PROJECTILE_TEXTURES end if
    if availableProjectileSlots>0 then
      loadedProjectiles=try(projectileModels.loadCatalog(archive,projectileFirst,availableProjectileSlots))
      if not (loadedProjectiles is error) then projectileCatalog=loadedProjectiles end if
    end if
  end if
  skyCatalog=void
  if archive!=void then
    skyFirst=64;if catalog!=void then skyFirst=64+catalog.textureCount end if
    if projectileCatalog!=void then skyFirst=projectileCatalog.firstTextureSlot+len(projectileCatalog.textures) end if
    skySlots=PLAYER_TEXTURE_FIRST_SLOT-skyFirst
    if skySlots>=playableSky.REQUIRED_TEXTURES then
      loadedSky=try(playableSky.load(archive,skyFirst,skySlots));if not (loadedSky is error) then skyCatalog=loadedSky end if
    end if
  end if
  modelAssets=void;if shaderScripts!=void then modelAssets=archivePlayerAssets(archive,shaderScripts[0]) end if
  itemCatalog=void
  if archive!=void then
    itemTextureFirst=firstFreeModelTexture(modelAssets);itemTextureCount=MAX_NATIVE_TEXTURE_SLOTS-itemTextureFirst
    if itemTextureCount>MAX_ITEM_TEXTURES then itemTextureCount=MAX_ITEM_TEXTURES end if
    if itemTextureCount>0 then
      loadedItems=try(itemModels.loadCatalog(archive,itemClassnames(itemState.items),itemTextureFirst,itemTextureCount,MAX_ITEM_MODELS))
      if not (loadedItems is error) then itemCatalog=loadedItems end if
    end if
  end if
  playableItems.setStats(itemState,playerState.health,playerState.armor,playerState.ammo,playerState.weapon)
  hudState=hud.state(playerState.health,playerState.armor,playerState.ammo,"READY","WASD MOVE  MOUSE1 FIRE  SPACE JUMP")
  baseHudCatalog=void;baseHudState=baseHud.state(playerState.health,playerState.armor,playerState.ammo,playerState.weapon,0,0,0)
  if archive!=void then
    hudTextureFirst=64;if catalog!=void then hudTextureFirst=64+catalog.textureCount end if
    if projectileCatalog!=void then hudTextureFirst=projectileCatalog.firstTextureSlot+len(projectileCatalog.textures) end if
    if skyCatalog!=void then hudTextureFirst=skyCatalog.firstTextureSlot+skyCatalog.textureCount end if
    hudTextureCount=PLAYER_TEXTURE_FIRST_SLOT-hudTextureFirst
    loadedHud=try(baseHud.load(archive,hudTextureFirst,hudTextureCount));if not (loadedHud is error) then baseHudCatalog=loadedHud end if
  end if
  menuCatalog=void
  menuState=menu.state()
  if archive!=void then
    menuTextureFirst=firstFreeMenuTexture(modelAssets,itemCatalog,baseHudCatalog);menuTextureCount=MAX_NATIVE_TEXTURE_SLOTS-menuTextureFirst
    loadedMenu=try(menu.load(archive,menuTextureFirst,menuTextureCount));if not (loadedMenu is error) then menuCatalog=loadedMenu end if
  end if
  matchMedia=void
  if archive!=void then
    matchTextureSlot=firstFreeMenuTexture(modelAssets,itemCatalog,baseHudCatalog)
    if menuCatalog!=void then matchTextureSlot=menuCatalog.firstTextureSlot+menuCatalog.textureCount end if
    if matchTextureSlot<MAX_NATIVE_TEXTURE_SLOTS then loadedMatch=try(baseMatchDisplay.load(archive,matchTextureSlot));if not (loadedMatch is error) then matchMedia=loadedMatch end if end if
  end if
  ambientCatalog=void
  if archive!=void then loadedAmbient=try(ambientSounds.load(map,archive));if not (loadedAmbient is error) then ambientCatalog=loadedAmbient end if end if
  ambientLoops=ambientSounds.globalLoops(ambientCatalog)
  opened=window.open(WIDTH,HEIGHT);if opened is error then return opened end if
  fpsState=fpsTitle.create("q3dm1",window.milliseconds());if fpsState is error then window.shutdown();return fpsState end if
  if not window.setTitle(fpsTitle.initialTitle(fpsState)) then window.shutdown();return error(7489,"could not set preview window title") end if
  audioReady=try(audio.init())
  if not (audioReady is error) then
    for each ambientEntry in ambientLoops ignored=try(audio.playLoop(ambientEntry[1])) end for
  end if
  weaponSoundCatalog=void
  if archive!=void then loadedWeaponSounds=try(weaponSounds.load(archive));if not (loadedWeaponSounds is error) then weaponSoundCatalog=loadedWeaponSounds end if end if
  fireSound=archiveSound(archive,"sound/weapons/machinegun/machgf1b.wav")
  enemyFireSound=archiveSound(archive,"sound/weapons/plasma/hyprbf1a.wav")
  enemyImpactSound=archiveSound(archive,"sound/weapons/plasma/plasmx1a.wav")
  pickupSound=archiveSound(archive,"sound/misc/w_pkup.wav")
  jumpSound=archiveSound(archive,"sound/player/sarge/jump1.wav")
  painSound=archiveSound(archive,"sound/player/sarge/pain100_1.wav")
  deathSound=archiveSound(archive,"sound/player/sarge/death1.wav")
  threeSound=archiveSound(archive,"sound/feedback/three.wav")
  twoSound=archiveSound(archive,"sound/feedback/two.wav")
  oneSound=archiveSound(archive,"sound/feedback/one.wav")
  if audioReady is error then sound=void;fireSound=void;weaponSoundCatalog=void;enemyFireSound=void;enemyImpactSound=void;pickupSound=void;jumpSound=void;painSound=void;deathSound=void;threeSound=void;twoSound=void;oneSound=void end if
  matchSounds=[void,threeSound,twoSound,oneSound,sound]
  soundCount=0
  if sound!=void then soundCount=soundCount+1 end if
  if fireSound!=void then soundCount=soundCount+1 end if
  if enemyFireSound!=void then soundCount=soundCount+1 end if
  if enemyImpactSound!=void then soundCount=soundCount+1 end if
  if pickupSound!=void then soundCount=soundCount+1 end if
  if jumpSound!=void then soundCount=soundCount+1 end if
  if painSound!=void then soundCount=soundCount+1 end if
  if deathSound!=void then soundCount=soundCount+1 end if
  if threeSound!=void then soundCount=soundCount+1 end if
  if twoSound!=void then soundCount=soundCount+1 end if
  if oneSound!=void then soundCount=soundCount+1 end if
  if weaponSoundCatalog!=void then soundCount=soundCount+len(weaponSoundCatalog.clips) end if
  ambientSoundCount=len(ambientLoops);soundCount=soundCount+ambientSoundCount
  if archive!=void then
    if catalog!=void then
      uploadedMaterials=playableWorldBatch.uploadMaterials(catalog);if uploadedMaterials is error then window.shutdown();return uploadedMaterials end if
    end if
    if projectileCatalog!=void then for each texture in projectileCatalog.textures if not window.uploadTexture(texture.slot,texture.image.pixels,texture.image.width,texture.image.height) then window.shutdown();return error(7488,"could not upload projectile texture") end if end for end if
    if skyCatalog!=void then uploadedSky=playableSky.upload(skyCatalog);if uploadedSky is error then window.shutdown();return uploadedSky end if end if
    if modelAssets!=void then
      uploaded=[]
      for each texture in modelAssets.textures
        seen=false;for each slot in uploaded if slot==texture.slot then seen=true end if end for
        if not seen then
          if not window.uploadTexture(texture.slot,texture.image.pixels,texture.image.width,texture.image.height) then window.shutdown();return error(7488,"could not upload player texture") end if
          uploaded=uploaded+[texture.slot]
        end if
      end for
    end if
    if itemCatalog!=void then
      for each texture in itemCatalog.textures
        if not window.uploadTexture(texture.slot,texture.image.pixels,texture.image.width,texture.image.height) then window.shutdown();return error(7488,"could not upload item texture") end if
      end for
    end if
    if baseHudCatalog!=void then uploadedHud=baseHud.upload(baseHudCatalog);if uploadedHud is error then window.shutdown();return uploadedHud end if end if
    if menuCatalog!=void then uploadedMenu=menu.upload(menuCatalog);if uploadedMenu is error then window.shutdown();return uploadedMenu end if end if
    if matchMedia!=void then uploadedMatch=baseMatchDisplay.upload(matchMedia);if uploadedMatch is error then window.shutdown();return uploadedMatch end if end if
  end if
  materialSlots=array(map.counts[1],-1)
  skyTextureFlags=array(map.counts[1],false)
  for textureIndex=0 to map.counts[1]-1
    mapShader=materials.shaderName(map,textureIndex);if mapShader is error then window.shutdown();return mapShader end if
    skyTextureFlags[textureIndex]=playableSky.isSkyShader(mapShader)
  end for
  if catalog!=void then for each material in catalog.materials materialSlots[material.textureIndex]=material.slot end for end if
  worldBatchState=void
  if catalog!=void then worldBatchState=playableWorldBatch.buildMaterials(triangles,catalog,skyTextureFlags)
  else worldBatchState=playableWorldBatch.build(triangles,materialSlots,skyTextureFlags) end if
  if worldBatchState is error then window.shutdown();return worldBatchState end if
  lightmapCount=map.counts[14];if lightmapCount>64 then lightmapCount=64 end if
  for index=0 to lightmapCount-1
    pixels=renderData.lightmapRgba(map,index);if pixels is error then window.shutdown();return pixels end if
    if not window.uploadTexture(index,pixels,128,128) then window.shutdown();return error(7484,"could not upload BSP lightmap") end if
  end for
  print "MiniQuake3 playable preview"
  print "Enter: play, WASD: move, mouse: look/fire, Space: jump, Escape: menu"
  print "Gameplay items: "+str(len(itemState.items))+" ammo: "+str(weaponState.ammo)
  print "Gameplay targets: "+str(len(targetState.targets))
  modelTriangleCount=len(animatedPlayerTriangles(modelAssets,0))
  playerTextureCount=0
  if modelAssets!=void then
    playerSlots=[]
    for each texture in modelAssets.textures
      seen=false;for each slot in playerSlots if slot==texture.slot then seen=true end if end for
      if not seen then playerSlots=playerSlots+[texture.slot] end if
    end for
    playerTextureCount=len(playerSlots)
  end if
  print "MD3 target triangles: "+str(modelTriangleCount)+" player textures: "+str(playerTextureCount)
  itemModelCount=0;itemTextureCount=0
  if itemCatalog!=void then itemModelCount=len(itemCatalog.assets);itemTextureCount=len(itemCatalog.textures) end if
  print "MD3 item models: "+str(itemModelCount)+" item textures: "+str(itemTextureCount)
  hudTextureCount=0;if baseHudCatalog!=void then hudTextureCount=baseHudCatalog.textureCount end if
  print "Baseq3 HUD textures: "+str(hudTextureCount)
  menuTextureCount=0;if menuCatalog!=void then menuTextureCount=menuCatalog.textureCount end if
  print "Baseq3 menu textures: "+str(menuTextureCount)
  matchFontCount=0;if matchMedia!=void then matchFontCount=1 end if
  print "Baseq3 match font: "+str(matchFontCount)
  projectileAssetCount=0;projectileTextureCount=0
  if projectileCatalog!=void then projectileAssetCount=len(projectileCatalog.assets);projectileTextureCount=len(projectileCatalog.textures) end if
  print "Retail projectile assets: "+str(projectileAssetCount)+" textures: "+str(projectileTextureCount)
  skyTextureCount=0;if skyCatalog!=void then skyTextureCount=skyCatalog.textureCount end if
  print "Retail q3dm1 sky textures: "+str(skyTextureCount)
  print "Gameplay sounds loaded: "+str(soundCount)
  print "Looped map ambience: "+str(ambientSoundCount)
  materialCount=0;if catalog!=void then materialCount=len(catalog.materials) end if
  print "Render triangles: "+str(len(triangles.triangles))+" base textures: "+str(materialCount)+" lightmaps: "+str(lightmapCount)
  print "World cache: "+str(worldCache.totalTriangleCount)+" triangles; visible surfaces: "+str(preparedWorld.selection.selectedSurfaceCount)
  result=try(frameLoop(camera,geometry,triangles,worldBatchState,catalog,worldCache,worldConfig,materialSlots,skyTextureFlags,skyCatalog,itemCatalog,projectileCatalog,projectileFxState,hudState,baseHudCatalog,baseHudState,menuCatalog,menuState,matchMedia,itemState,inventoryState,weaponState,targetState,renderTargets,modelAssets,combatState,matchState,playerState,enemyState,eventState,projectileState,playerProjectileState,controller,fpsState,maxFrames,matchSounds,fireSound,weaponSoundCatalog,enemyFireSound,enemyImpactSound,pickupSound,jumpSound,painSound,deathSound))
  for index=0 to lightmapCount-1 window.releaseTexture(index) end for
  if catalog!=void then playableWorldBatch.releaseMaterials(catalog) end if
  if modelAssets!=void then for each texture in modelAssets.textures window.releaseTexture(texture.slot) end for end if
  if itemCatalog!=void then for each texture in itemCatalog.textures window.releaseTexture(texture.slot) end for end if
  if projectileCatalog!=void then for each texture in projectileCatalog.textures window.releaseTexture(texture.slot) end for end if
  if skyCatalog!=void then playableSky.release(skyCatalog) end if
  if baseHudCatalog!=void then baseHud.release(baseHudCatalog) end if
  if menuCatalog!=void then menu.release(menuCatalog) end if
  if matchMedia!=void then baseMatchDisplay.release(matchMedia) end if
  window.shutdown()
  if not (audioReady is error) then audio.shutdown() end if
  if result is error then return result end if
  print "Preview frames: "+str(result)
  print "Enemy projectiles spawned: "+str(projectileState.nextId)
  print "Player projectiles spawned: "+str(playerProjectileState.nextProjectileId)
  return 0
end function

function run(map,sound,archive) return runLimited(map,-1,sound,archive) end function
function smoke(map,frames)
  if frames<1 or frames>600 then return error(7482,"preview smoke frame count outside range") end if
  return runLimited(map,frames,void,void)
end function
function smokeAssets(map,frames,archive)
  if frames<1 or frames>600 then return error(7482,"preview smoke frame count outside range") end if
  return runLimited(map,frames,void,archive)
end function
