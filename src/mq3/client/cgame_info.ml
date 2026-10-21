// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native data/layout port of code/cgame/cg_info.c.
package mq3.client.cgame_info
import mq3.shared.info as info
import mq3.qcommon.command_buffer as commandBuffer
import std.string as strings
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
const MAX_LOADING_PLAYER_ICONS=16
const MAX_LOADING_ITEM_ICONS=26
const GT_FFA=0
const GT_TOURNAMENT=1
const GT_SINGLE_PLAYER=2
const GT_TEAM=3
const GT_CTF=4
struct State playerIcons itemIcons infoScreenText updates registeredShaders registeredSounds end struct
struct Draw kind x y width height text asset end struct
struct Information commands requestedShaders end struct
function create() return State([],[],"",0,[],[]) end function
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
function loadingString(state,text) state.infoScreenText=commandBuffer.copyString(text,1024);state.updates=state.updates+1;return void end function
function loadingItem(state,icon,pickupName,handle)
  if icon!="" and len(state.itemIcons)<MAX_LOADING_ITEM_ICONS then state.itemIcons=state.itemIcons+[handle];state.registeredShaders=state.registeredShaders+[icon] end if;loadingString(state,pickupName);return void
end function
function splitModel(value)
  parts=strings.split(value,"/");if len(parts)>1 then return [parts[0],parts[len(parts)-1]] end if;return [value,"default"]
end function
function loadingClient(state,playerInfo,gametype,availableAssets)
  modelSkin=splitModel(info.value(playerInfo,"model"));model=modelSkin[0];skin=modelSkin[1];chosen="";candidates=["models/players/"+model+"/icon_"+skin+".tga","models/players/characters/"+model+"/icon_"+skin+".tga","models/players/sarge/icon_default.tga"]
  if len(state.playerIcons)<MAX_LOADING_PLAYER_ICONS then for each path in candidates if chosen=="" and availableAssets(path) then chosen=path end if end for;if chosen!="" then state.playerIcons=state.playerIcons+[chosen];state.registeredShaders=state.registeredShaders+[chosen] end if end if
  personality=clean(commandBuffer.copyString(info.value(playerInfo,"n"),64));if gametype==GT_SINGLE_PLAYER then state.registeredSounds=state.registeredSounds+["sound/player/announce/"+personality+".wav"] end if;loadingString(state,personality);return chosen
end function
// CG_DrawLoadingIcons
function drawLoadingIcons(state)
  result=[];index=0;for each handle in state.playerIcons result=result+[Draw("pic",16+index*78,284,64,64,"",handle)];index=index+1 end for
  index=0;for each handle in state.itemIcons y=360;if index>=13 then y=y+40 end if;result=result+[Draw("pic",16+(index%13)*48,y,32,32,"",handle)];index=index+1 end for;return result
end function
function gametypeName(gametype)
  if gametype==GT_FFA then return "Free For All" else if gametype==GT_SINGLE_PLAYER then return "Single Player" else if gametype==GT_TOURNAMENT then return "Tournament" else if gametype==GT_TEAM then return "Team Deathmatch" else if gametype==GT_CTF then return "Capture The Flag" end if;return "Unknown Gametype"
end function
function line(result,y,text) result.commands=result.commands+[Draw("text",320,y,0,0,text,"")];return y+27 end function
// CG_DrawInformation
function drawInformation(state,serverInfo,systemInfo,motd,message,gametype,svRunning,availableAssets)
  result=Information([],[]);map=info.value(serverInfo,"mapname");levelshot="levelshots/"+map+".tga";if not availableAssets(levelshot) then levelshot="menu/art/unknownmap" end if
  result.requestedShaders=[levelshot,"levelShotDetail"];result.commands=[Draw("pic",0,0,640,480,"",levelshot),Draw("detail",0,0,640,480,"","levelShotDetail")]+drawLoadingIcons(state)
  text="Awaiting snapshot...";if state.infoScreenText!="" then text="Loading... "+state.infoScreenText end if;result.commands=result.commands+[Draw("text",320,96,0,0,text,"")];y=148
  if not svRunning then host=clean(commandBuffer.copyString(info.value(serverInfo,"sv_hostname"),1024));y=line(result,y,host);if info.value(systemInfo,"sv_pure")!="" and bytes(info.value(systemInfo,"sv_pure"))[0]==49 then y=line(result,y,"Pure Server") end if;if motd!="" then y=line(result,y,motd) end if;y=y+10 end if
  if message!="" then y=line(result,y,message) end if;if info.value(systemInfo,"sv_cheats")!="" and bytes(info.value(systemInfo,"sv_cheats"))[0]==49 then y=line(result,y,"CHEATS ARE ENABLED") end if
  y=line(result,y,gametypeName(gametype));value=atoi(info.value(serverInfo,"timelimit"));if value!=0 then y=line(result,y,"timelimit "+str(value)) end if
  if gametype<GT_CTF then value=atoi(info.value(serverInfo,"fraglimit"));if value!=0 then y=line(result,y,"fraglimit "+str(value)) end if else value=atoi(info.value(serverInfo,"capturelimit"));if value!=0 then y=line(result,y,"capturelimit "+str(value)) end if end if;return result
end function
