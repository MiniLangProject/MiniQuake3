// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native data/layout port of code/cgame/cg_info.c.
package mq3.client.cgame_info
import mq3.shared.info as info
import mq3.qcommon.command_buffer as commandBuffer
import std.string as strings
/// Converts a NUL-terminated decimal C string to a signed 32-bit integer using the Windows C runtime. This binding is used by client game info.
/// @param text NUL-terminated C string containing the decimal numeric text.
/// @returns The converted integer; a string with no initial numeric conversion yields zero.
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
/// Capacity limit for the loading player icons collection or bounded storage used by this client
/// module.
const MAX_LOADING_PLAYER_ICONS=16
/// Capacity limit for the loading item icons collection or bounded storage used by this client module.
const MAX_LOADING_ITEM_ICONS=26
/// Native game-type identifier selecting free-for-all deathmatch.
const GT_FFA=0
/// Native game-type value for one-on-one tournament play, used when composing the loading screen's
/// game-mode and rules text.
const GT_TOURNAMENT=1
/// Native game-type value for single-player arena progression, used when composing the loading screen's
/// game-mode and rules text.
const GT_SINGLE_PLAYER=2
/// Native game-type value for team deathmatch, used when composing the loading screen's game-mode and
/// rules text.
const GT_TEAM=3
/// Native game-type value for capture the flag, used when composing the loading screen's game-mode and
/// rules text.
const GT_CTF=4
/// Stores client game info state, including `playerIcons`, `itemIcons`, `infoScreenText`, `updates`, `registeredShaders`, `registeredSounds`.
struct State
  /// Image or shader resources used to draw the player icon.
  playerIcons
  /// Image or shader resources used to draw the item icon.
  itemIcons
  /// Status text displayed while connecting, loading, or waiting for a game view.
  infoScreenText
  /// When constructing this record, `create` supplies `0` for this member. Used by `loadingString`
  /// during subsequent processing.
  updates
  /// Shader resources selected for registered rendering.
  registeredShaders
  /// Sound resources selected for the registered event or effect.
  registeredSounds
end struct
/// Stores client game info draw record, including `kind`, `x`, `y`, `width`, `height`, `text` and additional values.
struct Draw
  /// Drawing primitive or presentation category selecting how this record is rendered.
  kind
  /// Horizontal coordinate of a loading-information drawing command in the virtual screen layout.
  x
  /// Vertical coordinate of a loading-information drawing command in the virtual screen layout.
  y
  /// Width of the loading-screen image or detail overlay in virtual screen coordinates.
  width
  /// Height of the loading-screen image or detail overlay in virtual screen coordinates.
  height
  /// Status or information string drawn on the map-loading screen.
  text
  /// When constructing this record, `drawLoadingIcons` supplies `handle` for this member.
  asset
end struct
/// Stores client game info information record, including `commands`, `requestedShaders`.
struct Information
  /// When constructing this record, `drawInformationWithShot` supplies an empty list for this member.
  commands
  /// Shader resources selected for requested rendering.
  requestedShaders
end struct
/// Creates a `mq3.client.cgame_info.State` record. Initializes the record with the defaults written in this constructor.
function create() return State([],[],"",0,[],[]) end function
/// Calls `decode` from client game info `clean`. The final path returns `decode(bytes(result))`.
/// @param text Text consumed or emitted by `clean` in the client game info path.
function clean(text)
  data=bytes(text);result=[];index=0
  while index<len(data)
    if data[index]==94 and index+1<len(data) then
      index=index+2
    else
      if data[index]>=32 then result=result+[data[index]] end if;index=index+1
    end if
  end while;return decode(bytes(result))
end function
/// Updates `state.infoScreenText`, `state.updates` during client game info `loadingString`.
/// @param state Mutable client game info record/storage; this routine assigns `state.infoScreenText`, `state.updates`.
/// @param text Text consumed or emitted by `loadingString` in the client game info path.
function loadingString(state,text) state.infoScreenText=commandBuffer.copyString(text,1024);state.updates=state.updates+1;return void end function
/// Updates `state.itemIcons`, `state.registeredShaders` during client game info `loadingItem`.
/// @param state Mutable client game info record/storage; this routine assigns `state.itemIcons`, `state.registeredShaders`.
/// @param icon Value used by `if icon!="" and len(state.itemIcons)<MAX_LOADING_ITEM_ICONS then state.itemIcons=state.itemIcons+[handle]`.
/// @param pickupName Value used by `loadingString(state,pickupName)`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `loadingItem`.
function loadingItem(state,icon,pickupName,handle)
  if icon!="" and len(state.itemIcons)<MAX_LOADING_ITEM_ICONS then state.itemIcons=state.itemIcons+[handle];state.registeredShaders=state.registeredShaders+[icon] end if;loadingString(state,pickupName);return void
end function
/// Calls `std.string.split` from client game info `splitModel`. The final path returns `[value,"default"]`.
/// @param value Value used by `parts=strings.split(value,"/")`.
function splitModel(value)
  parts=strings.split(value,"/");if len(parts)>1 then return [parts[0],parts[len(parts)-1]] end if;return [value,"default"]
end function
/// Calls `mq3.client.cgame_info.splitModel`, `mq3.shared.info.value` from client game info `playerIconCandidates`.
/// @param playerInfo Value used by `modelSkin=splitModel(info.value(playerInfo,"model"))`.
function playerIconCandidates(playerInfo)
  modelSkin=splitModel(info.value(playerInfo,"model"));model=modelSkin[0];skin=modelSkin[1]
  return ["models/players/"+model+"/icon_"+skin+".tga","models/players/characters/"+model+"/icon_"+skin+".tga","models/players/sarge/icon_default.tga"]
end function
/// Updates `state.playerIcons`, `state.registeredShaders`, `state.registeredSounds` during client game info `loadingClient`.
/// @param state Mutable client game info record/storage; this routine assigns `state.playerIcons`, `state.registeredShaders`, `state.registeredSounds`.
/// @param playerInfo Value used by `candidates=playerIconCandidates(playerInfo)`.
/// @param gametype Quake III game-type identifier.
/// @param availableAssets Asset names/resources available for model or menu selection.
function loadingClient(state,playerInfo,gametype,availableAssets)
  chosen="";candidates=playerIconCandidates(playerInfo)
  if len(state.playerIcons)<MAX_LOADING_PLAYER_ICONS then for each path in candidates if chosen=="" and availableAssets(path) then chosen=path end if end for;if chosen!="" then state.playerIcons=state.playerIcons+[chosen];state.registeredShaders=state.registeredShaders+[chosen] end if end if
  personality=clean(commandBuffer.copyString(info.value(playerInfo,"n"),64));if gametype==GT_SINGLE_PLAYER then state.registeredSounds=state.registeredSounds+["sound/player/announce/"+personality+".wav"] end if;loadingString(state,personality);return chosen
end function
// Baseq3 bg_itemlist order is the bit order of CS_ITEMS.
function baseItemIcons()
  return ["","icons/iconr_shard","icons/iconr_yellow","icons/iconr_red",
    "icons/iconh_green","icons/iconh_yellow","icons/iconh_red","icons/iconh_mega",
    "icons/iconw_gauntlet","icons/iconw_shotgun","icons/iconw_machinegun","icons/iconw_grenade",
    "icons/iconw_rocket","icons/iconw_lightning","icons/iconw_railgun","icons/iconw_plasma",
    "icons/iconw_bfg","icons/iconw_grapple","icons/icona_shotgun","icons/icona_machinegun",
    "icons/icona_grenade","icons/icona_plasma","icons/icona_lightning","icons/icona_rocket",
    "icons/icona_railgun","icons/icona_bfg","icons/teleporter","icons/medkit",
    "icons/quad","icons/envirosuit","icons/haste","icons/invis",
    "icons/regen","icons/flight","icons/iconf_red1","icons/iconf_blu1"]
end function
// CG_DrawLoadingIcons
/// @param state Record read through `state.playerIcons`, `state.itemIcons`.
function drawLoadingIcons(state)
  result=[];index=0;for each handle in state.playerIcons result=result+[Draw("pic",16+index*78,284,64,64,"",handle)];index=index+1 end for
  index=0;for each handle in state.itemIcons y=360;if index>=13 then y=y+40 end if;result=result+[Draw("pic",16+(index%13)*48,y,32,32,"",handle)];index=index+1 end for;return result
end function
/// Evaluates client game info `gametypeName` and returns `"Free For All"`, `"Single Player"`, `"Tournament"` and additional values according to its guard/selection conditions.
/// @param gametype Quake III game-type identifier.
function gametypeName(gametype)
  if gametype==GT_FFA then return "Free For All" else if gametype==GT_SINGLE_PLAYER then return "Single Player" else if gametype==GT_TOURNAMENT then return "Tournament" else if gametype==GT_TEAM then return "Team Deathmatch" else if gametype==GT_CTF then return "Capture The Flag" end if;return "Unknown Gametype"
end function
/// Updates `result.commands` during client game info `line`.
/// @param result Mutable client game info record/storage; this routine assigns `result.commands`.
/// @param y Vertical coordinate in the coordinate space used by `line`.
/// @param text Text consumed or emitted by `line` in the client game info path.
function line(result,y,text) result.commands=result.commands+[Draw("text",320,y,0,0,text,"")];return y+27 end function
// CG_DrawInformation
/// @param state Shared client game info state passed to the helper calls in `drawInformation`.
/// @param serverInfo Value used by `levelshot="levelshots/"+info.value(serverInfo,"mapname")+".tga"`.
/// @param systemInfo Value used by `return drawInformationWithShot(state,serverInfo,systemInfo,motd,message,gametype,svRunning,levelshot)`.
/// @param motd Value used by `return drawInformationWithShot(state,serverInfo,systemInfo,motd,message,gametype,svRunning,levelshot)`.
/// @param message Value used by `return drawInformationWithShot(state,serverInfo,systemInfo,motd,message,gametype,svRunning,levelshot)`.
/// @param gametype Quake III game-type identifier.
/// @param svRunning Value used by `return drawInformationWithShot(state,serverInfo,systemInfo,motd,message,gametype,svRunning,levelshot)`.
/// @param availableAssets Asset names/resources available for model or menu selection.
function drawInformation(state,serverInfo,systemInfo,motd,message,gametype,svRunning,availableAssets)
  levelshot="levelshots/"+info.value(serverInfo,"mapname")+".tga"
  if not availableAssets(levelshot) then levelshot="menu/art/unknownmap" end if
  return drawInformationWithShot(state,serverInfo,systemInfo,motd,message,gametype,svRunning,levelshot)
end function
/// Calls `mq3.client.cgame_info.Information`, `mq3.client.cgame_info.Draw`, `mq3.client.cgame_info.drawLoadingIcons` and additional helpers from client game info `drawInformationWithShot`. The final path returns `result`.
/// @param state Record read through `state.infoScreenText`.
/// @param serverInfo Value used by `if not svRunning then host=clean(commandBuffer.copyString(info.value(serverInfo,"sv_hostname"),1024))`.
/// @param systemInfo Value used by `if info.value(systemInfo,"sv_pure")!="" and bytes(info.value(systemInfo,"sv_pure"))[0]==49 then y=line(result,y,"Pure Server") end if`.
/// @param motd Value used by `if motd!="" then y=line(result,y,motd) end if`.
/// @param message Value used by `if message!="" then y=line(result,y,message) end if`.
/// @param gametype Quake III game-type identifier.
/// @param svRunning Value used by `if not svRunning then host=clean(commandBuffer.copyString(info.value(serverInfo,"sv_hostname"),1024))`.
/// @param levelshot Value used by `result.requestedShaders=[levelshot,"levelShotDetail"]`.
function drawInformationWithShot(state,serverInfo,systemInfo,motd,message,gametype,svRunning,levelshot)
  result=Information([],[])
  result.requestedShaders=[levelshot,"levelShotDetail"];result.commands=[Draw("pic",0,0,640,480,"",levelshot),Draw("detail",0,0,640,480,"","levelShotDetail")]+drawLoadingIcons(state)
  text="Awaiting snapshot...";if state.infoScreenText!="" then text="Loading... "+state.infoScreenText end if;result.commands=result.commands+[Draw("text",320,96,0,0,text,"")];y=148
  if not svRunning then host=clean(commandBuffer.copyString(info.value(serverInfo,"sv_hostname"),1024));y=line(result,y,host);if info.value(systemInfo,"sv_pure")!="" and bytes(info.value(systemInfo,"sv_pure"))[0]==49 then y=line(result,y,"Pure Server") end if;if motd!="" then y=line(result,y,motd) end if;y=y+10 end if
  if message!="" then y=line(result,y,message) end if;if info.value(systemInfo,"sv_cheats")!="" and bytes(info.value(systemInfo,"sv_cheats"))[0]==49 then y=line(result,y,"CHEATS ARE ENABLED") end if
  y=line(result,y,gametypeName(gametype));value=atoi(info.value(serverInfo,"timelimit"));if value!=0 then y=line(result,y,"timelimit "+str(value)) end if
  if gametype<GT_CTF then value=atoi(info.value(serverInfo,"fraglimit"));if value!=0 then y=line(result,y,"fraglimit "+str(value)) end if else value=atoi(info.value(serverInfo,"capturelimit"));if value!=0 then y=line(result,y,"capturelimit "+str(value)) end if end if;return result
end function
