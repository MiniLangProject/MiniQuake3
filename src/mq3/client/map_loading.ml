// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CG_DrawInformation followed by UI_DrawConnectScreen(qtrue) during map loads.
package mq3.client.map_loading
import mq3.client.cgame_info as cgameInfo
import mq3.client.cgame_drawtools as loadFont
import mq3.client.ui_connect as loadConnect
import mq3.format.pk3 as pk3
import mq3.game.bg_public as bg
import mq3.platform.playable_window as window
import mq3.renderer.command_queue as q2commands
import mq3.renderer.playable_materials as materials
import mq3.renderer.qvm_2d_batch as qvm2d
import mq3.renderer.shader_index as shaderIndex
import mq3.shared.info as info
import std.ds.list as lists
import std.ds.hashmap as maps
import std.string as strings

// The map screen releases its textures before the match uploads its HUD.
const FIRST_TEXTURE=3072
const TEXTURE_COUNT=980
/// Stores map loading screen record, including `archive`, `scripts`, `assets`, `kinds`, `mapName`, `serverName` and additional values.
struct Screen archive scripts assets kinds mapName serverName localGame catalog loadingInfo startedAt indexMillis end struct

/// Calls `mq3.platform.playable_window.milliseconds`, `mq3.renderer.playable_materials.buildScriptIndex`, `mq3.renderer.shader_index.find` and additional helpers from map loading `create`.
/// @param archive Opened game archive supplying maps, models, textures or other assets.
/// @param mapName Map name used to select the level and its associated assets.
/// @param serverName Value used by `return Screen(archive,scripts,[name,"levelShotDetail","menu/art/font1_prop"],["shaderNoMip","shader","shaderNoMip"],mapName,serverName,localGa...`.
/// @param localGame Value used by `return Screen(archive,scripts,[name,"levelShotDetail","menu/art/font1_prop"],["shaderNoMip","shader","shaderNoMip"],mapName,serverName,localGa...`.
function create(archive,mapName,serverName,localGame)
  startedAt=window.milliseconds()
  scripts=materials.buildScriptIndex(archive);if scripts is error then return scripts end if
  indexMillis=window.milliseconds()-startedAt
  name="levelshots/"+mapName
  found=shaderIndex.find(scripts[0],name)!=void
  for each path in materials.candidates(name+".tga")
    if pk3.findEntry(archive,path)!=void then found=true;break end if
  end for
  if not found then name="menu/art/unknownmap" end if
  return Screen(archive,scripts,[name,"levelShotDetail","menu/art/font1_prop"],["shaderNoMip","shader","shaderNoMip"],mapName,serverName,localGame,void,cgameInfo.create(),startedAt,indexMillis)
end function

/// Calls `commands.add`, `mq3.renderer.command_queue.Command` from map loading `quad`.
/// @param commands Record read through `commands.add`.
/// @param x Horizontal coordinate in the coordinate space used by `quad`.
/// @param y Vertical coordinate in the coordinate space used by `quad`.
/// @param w Width in the coordinate space used by `quad`.
/// @param h Height in the coordinate space used by `quad`.
/// @param s1 Value used by `commands.add(q2commands.Command(q2commands.RC_STRETCH_PIC,q2commands.STRETCH_PIC_BYTES,[x,y,w,h,s1,t1,s2,t2],handle))`.
/// @param t1 Value used by `commands.add(q2commands.Command(q2commands.RC_STRETCH_PIC,q2commands.STRETCH_PIC_BYTES,[x,y,w,h,s1,t1,s2,t2],handle))`.
/// @param s2 Value used by `commands.add(q2commands.Command(q2commands.RC_STRETCH_PIC,q2commands.STRETCH_PIC_BYTES,[x,y,w,h,s1,t1,s2,t2],handle))`.
/// @param t2 Value used by `commands.add(q2commands.Command(q2commands.RC_STRETCH_PIC,q2commands.STRETCH_PIC_BYTES,[x,y,w,h,s1,t1,s2,t2],handle))`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `quad`.
function quad(commands,x,y,w,h,s1,t1,s2,t2,handle)
  commands.add(q2commands.Command(q2commands.RC_STRETCH_PIC,q2commands.STRETCH_PIC_BYTES,[x,y,w,h,s1,t1,s2,t2],handle))
end function

/// Calls `mq3.client.cgame_drawtools.clear`, `mq3.client.cgame_drawtools.drawProportionalString`, `mq3.client.map_loading.quad` and additional helpers from map loading `textLine`.
/// @param commands Record read through `commands.add`.
/// @param font Record read through `font.actions`.
/// @param x Horizontal coordinate in the coordinate space used by `textLine`.
/// @param y Vertical coordinate in the coordinate space used by `textLine`.
/// @param text Text consumed or emitted by `textLine` in the map loading path.
/// @param small Value used by `if small then style=style|loadFont.UI_SMALLFONT end if`.
function textLine(commands,font,x,y,text,small)
  if text=="" then return void end if
  style=loadFont.UI_CENTER|loadFont.UI_DROPSHADOW
  if small then style=style|loadFont.UI_SMALLFONT end if
  loadFont.clear(font)
  loadFont.drawProportionalString(font,x,y,text,style,[1.0,1.0,1.0,1.0],false)
  for each action in font.actions
    if action.kind=="stretch-pic" then
      quad(commands,action.x,action.y,action.width,action.height,action.s1,action.t1,action.s2,action.t2,3)
    else if action.kind=="set-color" then
      color=action.color;if color==void then color=[1.0,1.0,1.0,1.0] end if
      commands.add(q2commands.Command(q2commands.RC_SET_COLOR,q2commands.SET_COLOR_BYTES,color,0))
    end if
  end for
end function

/// Evaluates map loading `configValue` and returns `""`, `config[slot]` according to its guard/selection conditions.
/// @param config Sequence read at `config[slot]`.
/// @param slot Value used by `if config==void or slot>=len(config) or config[slot]==void then return "" end if`.
function configValue(config,slot)
  if config==void or slot>=len(config) or config[slot]==void then return "" end if
  return config[slot]
end function

/// Calls `mq3.renderer.playable_materials.candidates`, `mq3.format.pk3.findEntry`, `mq3.renderer.shader_index.find` from map loading `hasImage`. The final path returns `shaderIndex.find(screen.scripts[0],name)!=void`.
/// @param screen Record read through `screen.archive`, `screen.scripts`.
/// @param name Name used to select or register the corresponding map loading resource.
function hasImage(screen,name)
  for each path in materials.candidates(name)
    if pk3.findEntry(screen.archive,path)!=void then return true end if
  end for
  return shaderIndex.find(screen.scripts[0],name)!=void
end function

/// Calls `assetList.len`, `assetList.get`, `assetList.add` and additional helpers from map loading `addIcon`. The final path returns `assetList.len()`.
/// @param assetList Record read through `assetList.len`, `assetList.get`, `assetList.add`.
/// @param kindList Record read through `kindList.add`.
/// @param name Name used to select or register the corresponding map loading resource.
function addIcon(assetList,kindList,name)
  for i=0 to assetList.len()-1
    if assetList.get(i)==name then return i+1 end if
  end for
  assetList.add(name);kindList.add("shaderNoMip")
  return assetList.len()
end function

/// Updates `screen.loadingInfo.itemIcons`, `screen.loadingInfo.playerIcons`, `screen.assets`, `screen.kinds` during map loading `collectIcons`.
/// @param screen Mutable map loading record/storage; this routine assigns `screen.loadingInfo.itemIcons`, `screen.loadingInfo.playerIcons`, `screen.assets`, `screen.kinds`.
/// @param config Value used by `bits=bytes(configValue(config,bg.CS_ITEMS))`.
/// @param assets Sequence read at `assets[index]`.
/// @param kinds Sequence read at `kinds[index]`.
/// @param clientNum Client slot identifier used by the client/server protocol.
function collectIcons(screen,config,assets,kinds,clientNum)
  assetList=lists.List.withCapacity(48);kindList=lists.List.withCapacity(48)
  for each name in screen.assets assetList.add(name) end for
  for each kind in screen.kinds kindList.add(kind) end for
  registered=maps.HashMap.new()
  for index=0 to len(assets)-1
    if kinds[index]=="shaderNoMip" then registered.set(strings.toLowerAscii(assets[index]),true) end if
  end for
  icons=cgameInfo.baseItemIcons();bits=bytes(configValue(config,bg.CS_ITEMS))
  items=lists.List.withCapacity(cgameInfo.MAX_LOADING_ITEM_ICONS)
  for i=1 to len(icons)-1
    if i>=len(bits) or items.len()>=cgameInfo.MAX_LOADING_ITEM_ICONS then break end if
    if bits[i]==49 and registered.get(icons[i])==true and hasImage(screen,icons[i]) then items.add(addIcon(assetList,kindList,icons[i])) end if
  end for
  screen.loadingInfo.itemIcons=items.toArray()
  players=lists.List.withCapacity(cgameInfo.MAX_LOADING_PLAYER_ICONS)
  // CG_RegisterClients draws the local player first, then the other slots.
  for i= -1 to 63
    if i==clientNum then continue end if
    slot=i;if slot<0 then slot=clientNum end if
    player=configValue(config,bg.CS_PLAYERS+slot);if player=="" then continue end if
    for each path in cgameInfo.playerIconCandidates(player)
      if registered.get(strings.toLowerAscii(path))==true and hasImage(screen,path) then players.add(addIcon(assetList,kindList,path));break end if
    end for
    if players.len()>=cgameInfo.MAX_LOADING_PLAYER_ICONS then break end if
  end for
  screen.loadingInfo.playerIcons=players.toArray()
  screen.assets=assetList.toArray();screen.kinds=kindList.toArray()
end function

/// Calls `mq3.client.map_loading.configValue`, `mq3.shared.info.setValue`, `mq3.client.cgame_info.loadingString` and additional helpers from map loading `layout`. The final path returns `commands.toArray()`.
/// @param screen Record read through `screen.mapName`, `screen.loadingInfo`, `screen.localGame`, `screen.assets` and additional values.
/// @param loadingText Value used by `cgameInfo.loadingString(state,loadingText)`.
/// @param width Value assigned to `font.screenXScale`.
/// @param height Value assigned to `font.screenYScale`, `font.screenXScale`.
/// @param config Value used by `server=configValue(config,0)`.
function layout(screen,loadingText,width,height,config)
  server=configValue(config,0)
  if server=="" then server=info.setValue("","mapname",screen.mapName,void,void) end if
  state=screen.loadingInfo;cgameInfo.loadingString(state,loadingText)
  details=cgameInfo.drawInformationWithShot(state,server,configValue(config,1),configValue(config,bg.CS_MOTD),configValue(config,bg.CS_MESSAGE),cgameInfo.atoi(info.value(server,"g_gametype")),screen.localGame,screen.assets[0])
  commands=lists.List.withCapacity(512);font=loadFont.create()
  font.screenXScale=width/640.0;font.screenYScale=height/480.0
  for each field in details.commands
    if field.kind=="pic" then
      handle=1;if typeof(field.asset)=="int" then handle=field.asset end if
      quad(commands,field.x*font.screenXScale,field.y*font.screenYScale,field.width*font.screenXScale,field.height*font.screenYScale,0.0,0.0,1.0,1.0,handle)
    else if field.kind=="detail" then quad(commands,0,0,width,height,0.0,0.0,2.5,2.0,2)
    else if field.kind=="text" and (config!=void or field.y==96) then textLine(commands,font,field.x,field.y,field.text,true)
    end if
  end for
  // The original UI centers a uniform 640x480 canvas on wide displays.
  if width*480>height*640 then font.screenXScale=height/480.0;font.screenXBias=(width-640.0*font.screenXScale)*0.5 end if
  overlay=loadConnect.create(false)
  overlay.client=loadConnect.clientState(loadConnect.CA_LOADING,0,screen.serverName,"","",server)
  loadConnect.drawConnectScreen(overlay,true)
  for each field in overlay.actions
    if field.kind=="text" then textLine(commands,font,field.x,field.y,field.text,field.style!="big-center-dropshadow") end if
  end for
  return commands.toArray()
end function

/// Updates `screen.catalog` during map loading `show`.
/// @param screen Mutable map loading record/storage; this routine assigns `screen.catalog`.
/// @param loadingText Value used by `commands=layout(screen,loadingText,width,height,config)`.
/// @param width Width in the coordinate space used by `show`.
/// @param height Height in the coordinate space used by `show`.
/// @param config Value used by `commands=layout(screen,loadingText,width,height,config)`.
/// @param reupload Value used by `reupload=true`.
function show(screen,loadingText,width,height,config,reupload)
  window.poll();if window.shouldClose() then return false end if
  commands=layout(screen,loadingText,width,height,config);if commands is error then return commands end if
  firstNew=0
  if screen.catalog==void then
    built=qvm2d.buildIndexed(screen.archive,commands,screen.assets,screen.kinds,FIRST_TEXTURE,TEXTURE_COUNT,width,height,width,height,void,screen.scripts)
    if built is error then return built end if
    screen.catalog=built;reupload=true
  else
    firstNew=len(screen.catalog.textures)
    refreshed=qvm2d.refresh(screen.catalog,commands,screen.assets,screen.kinds,width,height,width,height);if refreshed is error then return refreshed end if
  end if
  if reupload then firstNew=0 end if
  if firstNew<len(screen.catalog.textures) then uploaded=qvm2d.uploadFrom(screen.catalog,firstNew);if uploaded is error then return uploaded end if end if
  window.setTitle("MiniQuake3 | Loading "+screen.mapName)
  window.beginFrame(0,0,0)
  drawn=qvm2d.draw(screen.catalog,0);if drawn is error then return drawn end if
  window.present();window.poll();return not window.shouldClose()
end function

/// Updates `screen.catalog` during map loading `release`.
/// @param screen Mutable map loading record/storage; this routine assigns `screen.catalog`.
function release(screen)
  if screen!=void and screen.catalog!=void then qvm2d.release(screen.catalog);screen.catalog=void end if
end function
