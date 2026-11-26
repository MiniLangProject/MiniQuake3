// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3-style 640x480 status bar backed by the original pak0.pk3 artwork.
package mq3.client.baseq3_hud

import mq3.format.pk3 as pk3
import mq3.renderer.playable_materials as materials
import mq3.platform.playable_window as window
import mq3.client.playable_hud as textHud
import std.string as strings

/// Width of the native UI's virtual coordinate space before scaling to the display.
const VIRTUAL_WIDTH=640.0
/// Height of the native UI's virtual coordinate space before scaling to the display.
const VIRTUAL_HEIGHT=480.0
/// Width of a standard character in virtual screen coordinates.
const CHAR_WIDTH=32.0
/// Height of a standard character in virtual screen coordinates.
const CHAR_HEIGHT=48.0
/// Default square HUD icon size in virtual screen coordinates.
const ICON_SIZE=48.0
/// Horizontal gap between text and its adjacent HUD icon.
const TEXT_ICON_SPACE=4.0
// CG_DrawStatusBarHead uses ICON_SIZE * 1.25 and anchors it to y=480-size.
const STATUS_HEAD_SIZE=60.0
/// Virtual-screen Y coordinate used to place the HUD status-head model.
const STATUS_HEAD_Y=420.0
/// Number of texture slots required by the module's fixed media layout.
const REQUIRED_TEXTURES=39
/// Duration in milliseconds of temporary HUD feedback emphasis.
const FEEDBACK_TIME=3000
/// Milliseconds for which the weapon-selection HUD remains visible.
const WEAPON_SELECT_TIME=1400
/// Normal weapon-icon size in virtual HUD coordinates.
const WEAPON_ICON_SIZE=40.0
/// Enlarged icon size used to emphasize the currently selected weapon.
const SELECTED_WEAPON_ICON_SIZE=48.0

/// Stores base Quake III HUD asset record, including `key`, `imageName`, `image`, `slot`.
struct Asset
  /// When constructing this record, `load` supplies `item[0]` for this member. Used by `find` during
  /// subsequent processing.
  key
  /// Resolved artwork path for a status-bar digit, icon, or other base-game HUD asset.
  imageName
  /// When constructing this record, `load` supplies `loaded[1]` for this member. Used by `upload`
  /// during subsequent processing.
  image
  /// Texture or media-cache slot assigned to this asset for renderer submission.
  slot
end struct
/// Stores base Quake III HUD catalog record, including `assets`, `firstTextureSlot`, `textureCount`.
struct Catalog
  /// Loaded base-game HUD artwork indexed for status digits, icons, and other status-bar drawing.
  assets
  /// First texture-cache slot reserved for this module's media resources.
  firstTextureSlot
  /// Number of texture resources or texture-cache slots represented by this media record.
  textureCount
end struct
/// Stores base Quake III HUD state, including `health`, `armor`, `ammo`, `weapon`, `score`, `kills` and additional values.
struct State
  /// Player health supplied to the base-game-style numeric status display.
  health
  /// Player armor supplied to the base-game-style armor icon and numeric display.
  armor
  /// Ammunition quantity or ammunition state associated with the selected weapon.
  ammo
  /// Selected weapon classname used to highlight the base-game-style weapon selection strip.
  weapon
  /// Player score displayed by the base-game HUD.
  score
  /// When constructing this record, `state` supplies `kills` for this member.
  kills
  /// When constructing this record, `state` supplies `deaths` for this member.
  deaths
  /// When constructing this record, `state` supplies an empty string for this member.
  pickupClass
  /// Human-readable item name shown by pickup notifications and item-selection UI.
  pickupName
  /// Timestamp of the last item pickup, used with the feedback lifetime to hide its temporary HUD
  /// notification.
  pickupTime
  /// Timestamp of the last frag notification, used to expire the HUD's kill feedback.
  fragTime
  /// When constructing this record, `state` supplies an empty list for this member.
  ownedWeapons
  /// When constructing this record, `state` supplies an empty list for this member.
  weaponAmmo
  /// Timestamp at which the weapon-selection display was last refreshed.
  weaponSelectTime
end struct
/// Stores base Quake III HUD point record, including `x`, `y`, `depth`.
struct Point
  /// Horizontal coordinate of a status-HUD image vertex in the target window.
  x
  /// Vertical coordinate of a status-HUD image vertex in the target window.
  y
  /// When constructing this record, `point` supplies `0.001` for this member.
  depth
end struct
/// Stores base Quake III HUD layout record, including `scaleX`, `scaleY`, `ammoX`, `healthX`, `armorX`, `statusY` and additional values.
struct Layout
  /// Horizontal scale used to transform virtual UI coordinates to the actual display.
  scaleX
  /// Vertical scale used to transform virtual UI coordinates to the actual display.
  scaleY
  /// When constructing this record, `layout` supplies `0.0` for this member.
  ammoX
  /// When constructing this record, `layout` supplies `185.0` for this member.
  healthX
  /// When constructing this record, `layout` supplies `370.0` for this member.
  armorX
  /// When constructing this record, `layout` supplies `432.0` for this member.
  statusY
  /// When constructing this record, `layout` supplies `432.0` for this member.
  iconY
end struct

/// Creates the base Quake III HUD error `7580` with diagnostic text `"Baseq3 HUD: "+message`.
/// @param message Argument 2 of `error`; passed as `"Baseq3 HUD: "+message`.
function fail(message) return error(7580,"Baseq3 HUD: "+message) end function

/// Builds the base Quake III HUD `descriptor` sequence from `[key,name]`.
/// @param key Key or control identifier used to select the corresponding base Quake III HUD entry.
/// @param name Name used to select or register the corresponding base Quake III HUD resource.
function descriptor(key,name) return [key,name] end function

// The first eleven entries match cgs.media.numberShaders[0..STAT_MINUS].
// The remaining artwork is the stock Baseq3 HUD and common q3dm1 pickup set.
// Baseq3's status bar uses a distinct icona_* picture for each ammo type.
function descriptors()
  return [
    descriptor("number_0","gfx/2d/numbers/zero_32b"),descriptor("number_1","gfx/2d/numbers/one_32b"),
    descriptor("number_2","gfx/2d/numbers/two_32b"),descriptor("number_3","gfx/2d/numbers/three_32b"),
    descriptor("number_4","gfx/2d/numbers/four_32b"),descriptor("number_5","gfx/2d/numbers/five_32b"),
    descriptor("number_6","gfx/2d/numbers/six_32b"),descriptor("number_7","gfx/2d/numbers/seven_32b"),
    descriptor("number_8","gfx/2d/numbers/eight_32b"),descriptor("number_9","gfx/2d/numbers/nine_32b"),
    descriptor("number_minus","gfx/2d/numbers/minus_32b"),descriptor("crosshair","gfx/2d/crosshaira"),
    descriptor("armor","icons/iconr_yellow"),descriptor("face","models/players/sarge/icon_default"),
    descriptor("ammo_machinegun","icons/icona_machinegun"),descriptor("ammo_shotgun","icons/icona_shotgun"),
    descriptor("ammo_grenadelauncher","icons/icona_grenade"),descriptor("ammo_rocketlauncher","icons/icona_rocket"),
    descriptor("ammo_lightning","icons/icona_lightning"),descriptor("ammo_railgun","icons/icona_railgun"),
    descriptor("ammo_plasmagun","icons/icona_plasma"),descriptor("ammo_bfg","icons/icona_bfg"),
    descriptor("weapon_gauntlet","icons/iconw_gauntlet"),
    descriptor("weapon_machinegun","icons/iconw_machinegun"),descriptor("weapon_shotgun","icons/iconw_shotgun"),
    descriptor("weapon_grenadelauncher","icons/iconw_grenade"),descriptor("weapon_rocketlauncher","icons/iconw_rocket"),
    descriptor("weapon_lightning","icons/iconw_lightning"),descriptor("weapon_railgun","icons/iconw_railgun"),
    descriptor("weapon_plasmagun","icons/iconw_plasma"),descriptor("weapon_bfg","icons/iconw_bfg"),
    descriptor("item_health_small","icons/iconh_green"),descriptor("item_health","icons/iconh_yellow"),
    descriptor("item_health_large","icons/iconh_red"),descriptor("item_health_mega","icons/iconh_mega"),
    descriptor("item_armor_shard","icons/iconr_shard"),descriptor("item_armor_body","icons/iconr_red"),
    descriptor("medal_impressive","medal_impressive"),descriptor("medal_excellent","medal_excellent")]
end function

/// Calls `mq3.client.baseq3_hud.descriptors`, `mq3.renderer.playable_materials.buildScriptIndex`, `mq3.renderer.playable_materials.mappedImageName` and additional helpers from base Quake III HUD `load`. The final path returns `Catalog(assets,firstTextureSlot,len(assets))`.
/// @param archive Opened game archive supplying maps, models, textures or other assets.
/// @param firstTextureSlot First texture slot reserved for this asset collection.
/// @param maxTextureSlots Maximum number of texture slots available to the renderer.
function load(archive,firstTextureSlot,maxTextureSlots)
  if archive==void then return fail("PK3 archive is required") end if
  if firstTextureSlot<0 or firstTextureSlot>=512 then return fail("first texture slot outside native range") end if
  definitions=descriptors()
  if maxTextureSlots<len(definitions) or firstTextureSlot+len(definitions)>512 then return fail("insufficient texture slots") end if
  scripts=materials.buildScriptIndex(archive);if scripts is error then return scripts end if
  assets=[]
  for index=0 to len(definitions)-1
    item=definitions[index];name=item[1]
    mapped=materials.mappedImageName(scripts[0],name);if mapped==void then mapped=name end if
    loaded=materials.loadImage(archive,mapped)
    if loaded==void and mapped!=name then loaded=materials.loadImage(archive,name) end if
    if loaded==void then return fail("missing retail artwork "+name) end if
    assets=assets+[Asset(item[0],loaded[0],loaded[1],firstTextureSlot+index)]
  end for
  return Catalog(assets,firstTextureSlot,len(assets))
end function

/// Searches the base Quake III HUD collection for find, returning `void` when no entry matches.
/// @param catalog Asset catalog used to resolve names to loaded resources. Record read through `catalog.assets`.
/// @param key Key or control identifier used to select the corresponding base Quake III HUD entry.
function find(catalog,key)
  if catalog==void then return void end if
  wanted=strings.toLowerAscii(key)
  for each asset in catalog.assets if strings.toLowerAscii(asset.key)==wanted then return asset end if end for
  return void
end function

/// Calls `mq3.platform.playable_window.uploadTextureNoMip`, `mq3.client.baseq3_hud.release` from base Quake III HUD `upload`.
/// @param catalog Asset catalog used to resolve names to loaded resources. Record read through `catalog.assets`.
function upload(catalog)
  if catalog==void then return fail("catalog is required") end if
  for each asset in catalog.assets
    if not window.uploadTextureNoMip(asset.slot,asset.image.pixels,asset.image.width,asset.image.height) then
      release(catalog);return fail("could not upload "+asset.imageName)
    end if
  end for
  return true
end function

/// Calls `mq3.platform.playable_window.releaseTexture` from base Quake III HUD `release`.
/// @param catalog Asset catalog used to resolve names to loaded resources. Record read through `catalog.assets`.
function release(catalog)
  if catalog==void then return void end if
  for each asset in catalog.assets window.releaseTexture(asset.slot) end for
  return void
end function

/// Evaluates base Quake III HUD `clampField` and returns `0`, `maximum`, `minimum` and additional values according to its guard/selection conditions.
/// @param value Value tested by `value>maximum`, `if value<minimum` before the calculation continues.
/// @param width Width in the coordinate space used by `clampField`.
function clampField(value,width)
  if width<=0 then return 0 end if
  maximum=9
  for index=2 to width maximum=maximum*10+9 end for
  minimum=0-((maximum+1)/10-1)
  if value>maximum then return maximum end if
  if value<minimum then return minimum end if
  return value
end function

/// Creates a `mq3.client.baseq3_hud.State` record. Assigns `health` from `health`, `armor` from `armor`, `ammo` from `ammo`, `weapon` from `weapon`.
/// @param health Value used to initialize `State.health`.
/// @param armor Value used to initialize `State.armor`.
/// @param ammo Value used to initialize `State.ammo`.
/// @param weapon Value used to initialize `State.weapon`.
/// @param score Value used to initialize `State.score`.
/// @param kills Value used to initialize `State.kills`.
/// @param deaths Value used to initialize `State.deaths`.
function state(health,armor,ammo,weapon,score,kills,deaths)
  return State(health,armor,ammo,weapon,score,kills,deaths,"","",0,0,[],[],0)
end function

// Mirrors CG_Weapon_f/CG_NextWeapon_f feedback: the selection strip is only
// visible briefly after a real selection change. Callers pass owned weapon
// classnames in weapon-id order and the matching ammo counts.
/// @param value Mutable base Quake III HUD record/storage; this routine assigns `value.ownedWeapons`, `value.weaponAmmo`, `value.weapon`, `value.weaponSelectTime`.
/// @param weapons Sequence whose length/content is inspected by `selectWeapons`.
/// @param ammo Sequence whose length/content is inspected by `selectWeapons`.
/// @param selected Value assigned to `value.weapon`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function selectWeapons(value,weapons,ammo,selected,now)
  if value==void or typeof(weapons)!="array" or typeof(ammo)!="array" or len(weapons)!=len(ammo) then return fail("invalid weapon selection") end if
  value.ownedWeapons=weapons;value.weaponAmmo=ammo;value.weapon=selected;value.weaponSelectTime=now
  return len(weapons)
end function

/// Updates `value.pickupClass`, `value.pickupName`, `value.pickupTime` during base Quake III HUD `pickup`.
/// @param value Mutable base Quake III HUD record/storage; this routine assigns `value.pickupClass`, `value.pickupName`, `value.pickupTime`.
/// @param classname Value assigned to `value.pickupClass`.
/// @param name Value assigned to `value.pickupName`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function pickup(value,classname,name,now)
  if value==void then return fail("state is required") end if
  value.pickupClass=classname;value.pickupName=name;value.pickupTime=now;return void
end function

/// Updates `value.fragTime` during base Quake III HUD `frag`.
/// @param value Mutable base Quake III HUD record/storage; this routine assigns `value.fragTime`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function frag(value,now)
  if value==void then return fail("state is required") end if
  value.fragTime=now;return void
end function

/// Calls `mq3.client.baseq3_hud.Layout` from base Quake III HUD `layout`. The final path returns `Layout(width/VIRTUAL_WIDTH,height/VIRTUAL_HEIGHT,0.0,185.0,370.0,432.0,432.0)`.
/// @param width Width in the coordinate space used by `layout`.
/// @param height Height in the coordinate space used by `layout`.
function layout(width,height)
  if width<320 or height<240 then return fail("surface is too small") end if
  return Layout(width/VIRTUAL_WIDTH,height/VIRTUAL_HEIGHT,0.0,185.0,370.0,432.0,432.0)
end function

/// Computes `placement.healthX+CHAR_WIDTH*3.0+TEXT_ICON_SPACE` for base Quake III HUD `statusHeadX`.
/// @param placement Record read through `placement.healthX`.
function statusHeadX(placement)
  return placement.healthX+CHAR_WIDTH*3.0+TEXT_ICON_SPACE
end function

/// Creates a `mq3.client.baseq3_hud.Point` record. Assigns `x` from `x`, `y` from `y`.
/// @param x Value used to initialize `Point.x`.
/// @param y Value used to initialize `Point.y`.
function point(x,y) return Point(x,y,0.001) end function

/// Calls `mq3.client.baseq3_hud.point`, `mq3.platform.playable_window.drawTriangle` from base Quake III HUD `drawAsset`.
/// @param asset Record read through `asset.slot`.
/// @param x Horizontal coordinate in the coordinate space used by `drawAsset`.
/// @param y Vertical coordinate in the coordinate space used by `drawAsset`.
/// @param w Width in the coordinate space used by `drawAsset`.
/// @param h Height in the coordinate space used by `drawAsset`.
/// @param placement Record read through `placement.scaleX`, `placement.scaleY`.
/// @param red Red color component.
/// @param green Green color component.
/// @param blue Blue color component.
function drawAsset(asset,x,y,w,h,placement,red,green,blue)
  if asset==void then return false end if
  left=x*placement.scaleX;top=y*placement.scaleY;right=(x+w)*placement.scaleX;bottom=(y+h)*placement.scaleY
  a=point(left,top);b=point(right,top);c=point(right,bottom);d=point(left,bottom)
  window.drawTriangle(asset.slot,a,[0.0,0.0],1.0,b,[1.0,0.0],1.0,c,[1.0,1.0],1.0,red,green,blue)
  window.drawTriangle(asset.slot,a,[0.0,0.0],1.0,c,[1.0,1.0],1.0,d,[0.0,1.0],1.0,red,green,blue)
  return true
end function

/// Evaluates base Quake III HUD `numberKey` and returns `"number_minus"`, `"number_"+character` according to its guard/selection conditions.
/// @param character Value used by `if character=="-" then return "number_minus" end if`.
function numberKey(character)
  if character=="-" then return "number_minus" end if
  return "number_"+character
end function

/// Calls `mq3.client.baseq3_hud.clampField` from base Quake III HUD `fieldStart`. The final path returns `x+2.0+CHAR_WIDTH*(width-length)`.
/// @param x Horizontal coordinate in the coordinate space used by `fieldStart`.
/// @param width Width in the coordinate space used by `fieldStart`.
/// @param value Value used by `text=str(clampField(value,width))`.
function fieldStart(x,width,value)
  text=str(clampField(value,width));length=len(text);if length>width then length=width end if
  return x+2.0+CHAR_WIDTH*(width-length)
end function

/// Calls `mq3.client.baseq3_hud.clampField`, `slice`, `mq3.client.baseq3_hud.fieldStart` and additional helpers from base Quake III HUD `drawField`.
/// @param catalog Asset catalog used to resolve names to loaded resources.
/// @param x Horizontal coordinate in the coordinate space used by `drawField`.
/// @param y Vertical coordinate in the coordinate space used by `drawField`.
/// @param width Width in the coordinate space used by `drawField`.
/// @param value Value used by `text=str(clampField(value,width))`.
/// @param placement Value used by `drawAsset(find(catalog,numberKey(text[index])),cursor,y,CHAR_WIDTH,CHAR_HEIGHT,placement,red,green,blue)`.
/// @param red Red color component.
/// @param green Green color component.
/// @param blue Blue color component.
function drawField(catalog,x,y,width,value,placement,red,green,blue)
  if width<1 then return void end if
  if width>5 then width=5 end if
  text=str(clampField(value,width));if len(text)>width then text=slice(text,0,width) end if
  cursor=fieldStart(x,width,value)
  for index=0 to len(text)-1
    drawAsset(find(catalog,numberKey(text[index])),cursor,y,CHAR_WIDTH,CHAR_HEIGHT,placement,red,green,blue)
    cursor=cursor+CHAR_WIDTH
  end for
  return void
end function

/// Calls `std.string.toLowerAscii`, `std.string.startsWith` from base Quake III HUD `weaponIconKey`. The final path returns `"weapon_bfg"`.
/// @param weapon Value used by `name=strings.toLowerAscii(weapon)`.
function weaponIconKey(weapon)
  name=strings.toLowerAscii(weapon)
  if strings.startsWith(name,"weapon_") then return name end if
  if name=="machinegun" then return "weapon_machinegun" end if
  if name=="shotgun" then return "weapon_shotgun" end if
  if name=="grenade" or name=="grenade launcher" or name=="grenadelauncher" then return "weapon_grenadelauncher" end if
  if name=="rocket launcher" or name=="rocketlauncher" then return "weapon_rocketlauncher" end if
  if name=="lightning" or name=="lightning gun" or name=="lightninggun" then return "weapon_lightning" end if
  if name=="rail" or name=="railgun" then return "weapon_railgun" end if
  if name=="plasma gun" or name=="plasmagun" then return "weapon_plasmagun" end if
  if name=="bfg" or name=="bfg10k" then return "weapon_bfg" end if
  return "weapon_machinegun"
end function

/// Calls `mq3.client.baseq3_hud.weaponIconKey` from base Quake III HUD `ammoIconKey`. The final path returns `"ammo_machinegun"`.
/// @param weapon Value used by `icon=weaponIconKey(weapon)`.
function ammoIconKey(weapon)
  icon=weaponIconKey(weapon)
  if icon=="weapon_shotgun" then return "ammo_shotgun" end if
  if icon=="weapon_grenadelauncher" then return "ammo_grenadelauncher" end if
  if icon=="weapon_rocketlauncher" then return "ammo_rocketlauncher" end if
  if icon=="weapon_lightning" then return "ammo_lightning" end if
  if icon=="weapon_railgun" then return "ammo_railgun" end if
  if icon=="weapon_plasmagun" then return "ammo_plasmagun" end if
  if icon=="weapon_bfg" then return "ammo_bfg" end if
  return "ammo_machinegun"
end function

/// Calls `std.string.toLowerAscii`, `mq3.client.baseq3_hud.findKey`, `std.string.startsWith` and additional helpers from base Quake III HUD `pickupIconKey`. The final path returns `weaponIconKey(name)`.
/// @param classname Value used by `name=strings.toLowerAscii(classname)`.
function pickupIconKey(classname)
  name=strings.toLowerAscii(classname)
  if findKey(name,["item_health_small","item_health","item_health_large","item_health_mega","item_armor_shard","item_armor_body"]) then return name end if
  if name=="item_armor_combat" then return "armor" end if
  if strings.startsWith(name,"weapon_") then return name end if
  return weaponIconKey(name)
end function

/// Evaluates base Quake III HUD `findKey` and returns `true`, `false` according to its guard/selection conditions.
/// @param value Value tested by `value==item` before the calculation continues.
/// @param values Value used by `for each item in values if value==item then return true end if end for`.
function findKey(value,values)
  for each item in values if value==item then return true end if end for
  return false
end function

/// Calls `mq3.client.baseq3_hud.weaponIconKey` from base Quake III HUD `weaponDisplayName`. The final path returns `"MACHINEGUN"`.
/// @param weapon Value used by `key=weaponIconKey(weapon)`.
function weaponDisplayName(weapon)
  key=weaponIconKey(weapon)
  if key=="weapon_gauntlet" then return "GAUNTLET" end if
  if key=="weapon_shotgun" then return "SHOTGUN" end if
  if key=="weapon_grenadelauncher" then return "GRENADE LAUNCHER" end if
  if key=="weapon_rocketlauncher" then return "ROCKET LAUNCHER" end if
  if key=="weapon_lightning" then return "LIGHTNING GUN" end if
  if key=="weapon_railgun" then return "RAILGUN" end if
  if key=="weapon_plasmagun" then return "PLASMA GUN" end if
  if key=="weapon_bfg" then return "BFG10K" end if
  return "MACHINEGUN"
end function

/// Calls `std.string.toLowerAscii`, `mq3.client.baseq3_hud.drawAsset`, `mq3.client.baseq3_hud.find` and additional helpers from base Quake III HUD `drawWeaponSelect`. The final path returns `drawn`.
/// @param catalog Asset catalog used to resolve names to loaded resources.
/// @param value Record read through `value.weaponSelectTime`, `value.ownedWeapons`, `value.weaponAmmo`, `value.weapon`.
/// @param placement Record read through `placement.scaleX`, `placement.scaleY`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function drawWeaponSelect(catalog,value,placement,now)
  if value.weaponSelectTime<=0 or now-value.weaponSelectTime<0 or now-value.weaponSelectTime>=WEAPON_SELECT_TIME then return 0 end if
  count=len(value.ownedWeapons);if count==0 or count!=len(value.weaponAmmo) then return 0 end if
  spacing=WEAPON_ICON_SIZE+4.0;start=(VIRTUAL_WIDTH-count*spacing+4.0)/2.0;y=368.0;drawn=0
  for index=0 to count-1
    weapon=value.ownedWeapons[index];size=WEAPON_ICON_SIZE;offset=0.0
    if strings.toLowerAscii(weapon)==strings.toLowerAscii(value.weapon) then size=SELECTED_WEAPON_ICON_SIZE;offset=(size-WEAPON_ICON_SIZE)/2.0 end if
    red=255;green=255;blue=255;if value.weaponAmmo[index]==0 then green=72;blue=72 end if
    if drawAsset(find(catalog,weaponIconKey(weapon)),start+index*spacing-offset,y-offset,size,size,placement,red,green,blue) then drawn=drawn+1 end if
  end for
  label=weaponDisplayName(value.weapon)
  textHud.drawText(label,VIRTUAL_WIDTH*placement.scaleX/2-textHud.textWidth(label,2)/2,350.0*placement.scaleY,2,255,255,255)
  return drawn
end function

/// Calls `mq3.client.baseq3_hud.layout`, `mq3.client.baseq3_hud.drawAsset`, `mq3.client.baseq3_hud.find` and additional helpers from base Quake III HUD `draw`.
/// @param catalog Asset catalog used to resolve names to loaded resources.
/// @param value Record read through `value.ammo`, `value.weapon`, `value.health`, `value.armor` and additional values.
/// @param width Width in the coordinate space used by `draw`.
/// @param height Height in the coordinate space used by `draw`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function draw(catalog,value,width,height,now)
  if catalog==void or value==void then return fail("catalog and state are required") end if
  placement=layout(width,height);if placement is error then return placement end if
  // Baseq3 uses the first crosshair and the fixed 640x480 status-bar positions.
  drawAsset(find(catalog,"crosshair"),304.0,224.0,32.0,32.0,placement,255,255,255)
  drawField(catalog,placement.ammoX,placement.statusY,3,value.ammo,placement,255,176,0)
  drawAsset(find(catalog,ammoIconKey(value.weapon)),CHAR_WIDTH*3.0+TEXT_ICON_SPACE,placement.iconY,ICON_SIZE,ICON_SIZE,placement,255,255,255)
  healthRed=255;healthGreen=176;healthBlue=0
  if value.health<=25 then healthGreen=50 end if
  if value.health>100 then healthGreen=255;healthBlue=255 end if
  drawField(catalog,placement.healthX,placement.statusY,3,value.health,placement,healthRed,healthGreen,healthBlue)
  // With 3D icons disabled, CG_DrawStatusBarHead falls back to the player's
  // pak0 model icon in the same 60x60 box used by the animated head model.
  drawAsset(find(catalog,"face"),statusHeadX(placement),STATUS_HEAD_Y,STATUS_HEAD_SIZE,STATUS_HEAD_SIZE,placement,255,255,255)
  if value.armor>0 then
    drawField(catalog,placement.armorX,placement.statusY,3,value.armor,placement,255,176,0)
    drawAsset(find(catalog,"armor"),placement.armorX+CHAR_WIDTH*3.0+TEXT_ICON_SPACE,placement.iconY,ICON_SIZE,ICON_SIZE,placement,255,255,255)
  end if
  drawWeaponSelect(catalog,value,placement,now)
  if value.pickupTime>0 and now-value.pickupTime<FEEDBACK_TIME then
    drawAsset(find(catalog,pickupIconKey(value.pickupClass)),8.0,368.0,48.0,48.0,placement,255,255,255)
    textHud.drawText(value.pickupName,64*placement.scaleX,382*placement.scaleY,2,255,255,255)
  end if
  if value.fragTime>0 and now-value.fragTime<FEEDBACK_TIME then
    drawAsset(find(catalog,"medal_impressive"),288.0,96.0,64.0,64.0,placement,255,255,255)
    textHud.drawText("FRAG +1",width/2-textHud.textWidth("FRAG +1",3)/2,166*placement.scaleY,3,255,220,96)
  end if
  textHud.drawText("SCORE "+str(value.score),width-textHud.textWidth("SCORE "+str(value.score),2)-16,16,2,255,220,96)
  return void
end function
