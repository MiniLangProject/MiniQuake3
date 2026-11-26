// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Missionpack owner-draw HUD port of code/cgame/cg_newdraw.c.
package mq3.client.cgame_newdraw

import std.string as strings
import mq3.compat.numeric as n
import mq3.compat.transcendental as trans

const TEAM_FREE=0
const TEAM_RED=1
const TEAM_BLUE=2
const TEAM_SPECTATOR=3
const GT_FFA=0
const GT_TOURNAMENT=1
const GT_SINGLE_PLAYER=2
const GT_TEAM=3
const GT_CTF=4
const GT_1FCTF=5
const GT_OBELISK=6
const GT_HARVESTER=7
const FLAG_ATBASE=0
const FLAG_TAKEN=1
const FLAG_DROPPED=2
const FLAG_TAKEN_RED=3
const FLAG_TAKEN_BLUE=4
const PW_REDFLAG=7
const PW_BLUEFLAG=8
const PW_NEUTRALFLAG=9
const TEAMTASK_NONE=0
const TEAMTASK_OFFENSE=1
const TEAMTASK_DEFENSE=2
const TEAMTASK_PATROL=3
const TEAMTASK_FOLLOW=4
const TEAMTASK_RETRIEVE=5
const TEAMTASK_ESCORT=6
const TEAMTASK_CAMP=7
const PM_NORMAL=0
const PM_SPECTATOR=2
const CGAME_EVENT_NONE=0
const CGAME_EVENT_TEAMMENU=1
const CGAME_EVENT_SCOREBOARD=2
const CGAME_EVENT_EDITHUD=3
const K_MOUSE2=179
const SCORE_NOT_PRESENT=-9999
const HUD_VERTICAL=0

const CG_SHOW_BLUE_TEAM_HAS_REDFLAG=0x00000001
const CG_SHOW_RED_TEAM_HAS_BLUEFLAG=0x00000002
const CG_SHOW_ANYTEAMGAME=0x00000004
const CG_SHOW_HARVESTER=0x00000008
const CG_SHOW_ONEFLAG=0x00000010
const CG_SHOW_CTF=0x00000020
const CG_SHOW_OBELISK=0x00000040
const CG_SHOW_HEALTHCRITICAL=0x00000080
const CG_SHOW_SINGLEPLAYER=0x00000100
const CG_SHOW_TOURNAMENT=0x00000200
const CG_SHOW_DURINGINCOMINGVOICE=0x00000400
const CG_SHOW_IF_PLAYER_HAS_FLAG=0x00000800
const CG_SHOW_HEALTHOK=0x00004000
const CG_SHOW_TEAMINFO=0x00008000
const CG_SHOW_NOTEAMINFO=0x00010000
const CG_SHOW_OTHERTEAMHASFLAG=0x00020000
const CG_SHOW_YOURTEAMHASENEMYFLAG=0x00040000
const CG_SHOW_ANYNONTEAMGAME=0x00080000
const CG_SHOW_2DONLY=0x10000000

const CG_PLAYER_ARMOR_ICON=1
const CG_PLAYER_ARMOR_VALUE=2
const CG_PLAYER_HEAD=3
const CG_PLAYER_HEALTH=4
const CG_PLAYER_AMMO_ICON=5
const CG_PLAYER_AMMO_VALUE=6
const CG_SELECTEDPLAYER_HEAD=7
const CG_SELECTEDPLAYER_NAME=8
const CG_SELECTEDPLAYER_LOCATION=9
const CG_SELECTEDPLAYER_STATUS=10
const CG_SELECTEDPLAYER_WEAPON=11
const CG_SELECTEDPLAYER_POWERUP=12
const CG_PLAYER_ITEM=19
const CG_PLAYER_SCORE=20
const CG_BLUE_FLAGHEAD=21
const CG_BLUE_FLAGSTATUS=22
const CG_BLUE_FLAGNAME=23
const CG_RED_FLAGHEAD=24
const CG_RED_FLAGSTATUS=25
const CG_RED_FLAGNAME=26
const CG_BLUE_SCORE=27
const CG_RED_SCORE=28
const CG_RED_NAME=29
const CG_BLUE_NAME=30
const CG_HARVESTER_SKULLS=31
const CG_ONEFLAG_STATUS=32
const CG_PLAYER_LOCATION=33
const CG_TEAM_COLOR=34
const CG_CTF_POWERUP=35
const CG_AREA_POWERUP=36
const CG_PLAYER_HASFLAG=38
const CG_GAME_TYPE=39
const CG_SELECTEDPLAYER_ARMOR=40
const CG_SELECTEDPLAYER_HEALTH=41
const CG_PLAYER_STATUS=42
const CG_AREA_SYSTEMCHAT=46
const CG_AREA_TEAMCHAT=47
const CG_AREA_CHAT=48
const CG_GAME_STATUS=49
const CG_KILLER=50
const CG_PLAYER_ARMOR_ICON2D=51
const CG_PLAYER_AMMO_ICON2D=52
const CG_ACCURACY=53
const CG_ASSISTS=54
const CG_DEFEND=55
const CG_EXCELLENT=56
const CG_IMPRESSIVE=57
const CG_PERFECT=58
const CG_GAUNTLET=59
const CG_SPECTATORS=60
const CG_TEAMINFO=61
const CG_VOICE_HEAD=62
const CG_VOICE_NAME=63
const CG_PLAYER_HASFLAG2D=64
const CG_HARVESTER_SKULLS2D=65
const CG_CAPFRAGLIMIT=66
const CG_1STPLACE=67
const CG_2NDPLACE=68
const CG_CAPTURES=69

/// Stores client game newdraw rectangle, including `x`, `y`, `w`, `h`.
struct Rect x y w h end struct
/// Stores client game newdraw client record, including `infoValid`, `name`, `team`, `health`, `armor`, `teamTask` and additional values.
struct Client infoValid name team health armor teamTask location curWeapon powerups headModel headSkin modelIcon deferred headOffset end struct
/// Stores client game newdraw powerup record, including `id`, `expires`, `icon`.
struct Powerup id expires icon end struct
/// Stores client game newdraw medal record, including `accuracy`, `assists`, `defend`, `excellent`, `impressive`, `perfect` and additional values.
struct Medal accuracy assists defend excellent impressive perfect gauntlet captures end struct
/// Stores client game newdraw queued engine action, including `boundary`, `kind`, `rect`, `text`, `shader`, `model` and additional values.
struct Action boundary kind rect text shader model color value client dispatched end struct
/// Stores client game newdraw state, including `time`, `gametype`, `team`, `health`, `armor`, `ammo` and additional values.
struct State time gametype team health armor ammo weapon score rank holdable persistentPowerup generic1 playerPowerups powerups scores1 scores2 capturelimit fraglimit teamScores clients sorted locations selected selectedName selectedClient currentOrder orderPending orderTime voiceClient voiceTime redflag blueflag flagStatus redTeamName blueTeamName killerName systemChat teamChat1 teamChat2 drawStatus drawIcons draw3dIcons pmType showScores cursorX cursorY activeCursor capturedItem eventHandling spectatorList spectatorLen spectatorWidth spectatorOffset spectatorPaintX spectatorPaintX2 spectatorTime medals selectedScore commands cvars menus actions retailActive emitted suppressed glyphWidth end struct

/// Creates a `mq3.client.cgame_newdraw.Client` record. Assigns `name` from `name`, `team` from `team`.
/// @param name Value used to initialize `Client.name`.
/// @param team Value used to initialize `Client.team`.
function client(name,team) return Client(true,name,team,100,0,TEAMTASK_NONE,0,0,0,"head","skin","icon",false,[0.0,0.0,0.0]) end function
/// Creates a `mq3.client.cgame_newdraw.Medal` record. Initializes the record with the defaults written in this constructor.
function medal() return Medal(0,0,0,0,0,0,0,0) end function
/// Creates a `mq3.client.cgame_newdraw.State` record. Assigns `retailActive` from `retailActive`.
/// @param retailActive Value used to initialize `State.retailActive`.
function create(retailActive)
  return State(0,GT_FFA,TEAM_FREE,100,0,0,0,0,0,0,0,0,[],[],SCORE_NOT_PRESENT,SCORE_NOT_PRESENT,0,0,[0,0],[],[],[],0,"Everyone",-1,TEAMTASK_NONE,false,0,0,0,-1,-1,-1,"Red","Blue","","","","",true,true,true,PM_NORMAL,false,320,240,"",void,CGAME_EVENT_NONE,"",0,-1,0,1.0,-1,0,[],0,[],[],[],[],retailActive,0,0,8.0)
end function
/// Creates a `mq3.client.cgame_newdraw.Rect` record. Assigns `x` from `x`, `y` from `y`, `w` from `w`, `h` from `h`.
/// @param x Value used to initialize `Rect.x`.
/// @param y Value used to initialize `Rect.y`.
/// @param w Value used to initialize `Rect.w`.
/// @param h Value used to initialize `Rect.h`.
function rect(x,y,w,h) return Rect(x,y,w,h) end function
/// Evaluates client game newdraw `copyColor` and returns `[1.0,1.0,1.0,1.0]`, `[value[0],value[1],value[2],value[3]]` according to its guard/selection conditions.
/// @param value Sequence read at `value[0]`, `value[1]`, `value[2]`, `value[3]`.
function copyColor(value) if value==void then return [1.0,1.0,1.0,1.0] end if;return [value[0],value[1],value[2],value[3]] end function
/// Appends a client game newdraw action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.
/// @param state Mutable client game newdraw record/storage; this routine assigns `state.actions`, `state.emitted`, `state.suppressed`.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param r Value used by `a=Action("cgame-newdraw",kind,r,text,shader,model,copyColor(color),value,clientNum,dispatched)`.
/// @param text Text consumed or emitted by `emit` in the client game newdraw path.
/// @param shader Shader handle or asset name selected for this draw operation.
/// @param model Model handle, asset or preview record used by this client game newdraw operation.
/// @param color Color value used by the client game newdraw drawing or interpolation operation.
/// @param value Value used by `a=Action("cgame-newdraw",kind,r,text,shader,model,copyColor(color),value,clientNum,dispatched)`.
/// @param clientNum Client slot identifier used by the client/server protocol.
function emit(state,kind,r,text,shader,model,color,value,clientNum)
  dispatched=not state.retailActive;a=Action("cgame-newdraw",kind,r,text,shader,model,copyColor(color),value,clientNum,dispatched);state.actions=state.actions+[a];if dispatched then state.emitted=state.emitted+1 else state.suppressed=state.suppressed+1 end if;return a
end function
/// Adapts `mq3.client.cgame_newdraw.emit` to client game newdraw `text`, returning its result for `state, "text", r, value, "", "", color, scale, -1`.
/// @param state Argument 1 of `mq3.client.cgame_newdraw.emit`.
/// @param r Argument 3 of `mq3.client.cgame_newdraw.emit`.
/// @param value Argument 4 of `mq3.client.cgame_newdraw.emit`.
/// @param scale Argument 8 of `mq3.client.cgame_newdraw.emit`.
/// @param color Argument 7 of `mq3.client.cgame_newdraw.emit`.
function text(state,r,value,scale,color) return emit(state,"text",r,value,"","",color,scale,-1) end function
/// Calls `mq3.client.cgame_newdraw.emit` from client game newdraw `pic`. The final path returns `emit(state,"pic",r,"",shader,"",color,0.0,-1)`.
/// @param state Shared client game newdraw state passed to the helper calls in `pic`.
/// @param r Value used by `return emit(state,"pic",r,"",shader,"",color,0.0,-1)`.
/// @param shader Shader handle or asset name selected for this draw operation.
/// @param color Color value used by the client game newdraw drawing or interpolation operation.
function pic(state,r,shader,color) if shader=="" then return void end if;return emit(state,"pic",r,"",shader,"",color,0.0,-1) end function
/// Calls `mq3.client.cgame_newdraw.emit` from client game newdraw `model`. The final path returns `emit(state,"model",r,"","",name,void,0.0,clientNum)`.
/// @param state Shared client game newdraw state passed to the helper calls in `model`.
/// @param r Value used by `return emit(state,"model",r,"","",name,void,0.0,clientNum)`.
/// @param name Name used to select or register the corresponding client game newdraw resource.
/// @param clientNum Client slot identifier used by the client/server protocol.
function model(state,r,name,clientNum) if name=="" then return void end if;return emit(state,"model",r,"","",name,void,0.0,clientNum) end function
/// Evaluates client game newdraw `currentClient` and returns `void`, `state.clients[0]`, `state.clients[id]` according to its guard/selection conditions.
/// @param state Record read through `state.clients`, `state.selected`, `state.sorted`.
function currentClient(state) if len(state.clients)==0 then return void end if;index=state.selected;if index<0 or index>=len(state.sorted) then index=0 end if;if len(state.sorted)==0 then return state.clients[0] end if;id=state.sorted[index];if id<0 or id>=len(state.clients) then return void end if;return state.clients[id] end function
/// Evaluates client game newdraw `selfClient` and returns `void`, `state.clients[0]` according to its guard/selection conditions.
/// @param state Record read through `state.clients`.
function selfClient(state) if len(state.clients)==0 then return void end if;return state.clients[0] end function
/// Evaluates client game newdraw `voiceClient` and returns `void`, `state.clients[state.voiceClient]` according to its guard/selection conditions.
/// @param state Record read through `state.voiceClient`, `state.clients`.
function voiceClient(state) if state.voiceClient<0 or state.voiceClient>=len(state.clients) then return void end if;return state.clients[state.voiceClient] end function
/// Evaluates client game newdraw `location` and returns `state.locations[id]`, `"unknown"` according to its guard/selection conditions.
/// @param state Record read through `state.locations`.
/// @param id Value used by `if id>=0 and id<len(state.locations) and state.locations[id]!="" then return state.locations[id] end if`.
function location(state,id) if id>=0 and id<len(state.locations) and state.locations[id]!="" then return state.locations[id] end if;return "unknown" end function
/// Evaluates client game newdraw `two` and returns `" "+str(value)`, `str(value)` according to its guard/selection conditions.
/// @param value Value tested by `value>=0 and value<10` before the calculation continues.
function two(value) if value>=0 and value<10 then return " "+str(value) end if;return str(value) end function

// CG_InitTeamChat / CG_SetPrintString
/// @param state Mutable client game newdraw record/storage; this routine assigns `state.systemChat`, `state.teamChat1`, `state.teamChat2`.
function initTeamChat(state) state.systemChat="";state.teamChat1="";state.teamChat2="";return void end function
/// Updates `state.systemChat`, `state.teamChat2`, `state.teamChat1` during client game newdraw `setPrintString`.
/// @param state Mutable client game newdraw record/storage; this routine assigns `state.systemChat`, `state.teamChat2`, `state.teamChat1`.
/// @param type Value used by `if type==0 then state.systemChat=value else state.teamChat2=state.teamChat1`.
/// @param value Value assigned to `state.systemChat`, `state.teamChat1`.
function setPrintString(state,type,value) if type==0 then state.systemChat=value else state.teamChat2=state.teamChat1;state.teamChat1=value end if;return void end function

/// Evaluates client game newdraw `taskVoice` and returns `["onoffense","offense","+button7; wait; -button7"]`, `["ondefense","defend","+button8; wait; -button8"]`, `["onpatrol","patrol","+button9; wait; -button9"]` and additional values according to its guard/selection conditions.
/// @param task Value used by `if task==TEAMTASK_OFFENSE then return ["onoffense","offense","+button7`.
function taskVoice(task)
  if task==TEAMTASK_OFFENSE then return ["onoffense","offense","+button7; wait; -button7"] end if
  if task==TEAMTASK_DEFENSE then return ["ondefense","defend","+button8; wait; -button8"] end if
  if task==TEAMTASK_PATROL then return ["onpatrol","patrol","+button9; wait; -button9"] end if
  if task==TEAMTASK_FOLLOW then return ["onfollow","followme","+button10; wait; -button10"] end if
  if task==TEAMTASK_CAMP then return ["oncamping","camp",""] end if
  if task==TEAMTASK_RETRIEVE then return ["ongetflag","returnflag",""] end if
  if task==TEAMTASK_ESCORT then return ["onfollowcarrier","followflagcarrier",""] end if
  return ["","",""]
end function
// CG_CheckOrderPending
/// @param state Mutable client game newdraw record/storage; this routine assigns `state.commands`, `state.orderPending`.
function checkOrderPending(state)
  if state.gametype<GT_CTF or not state.orderPending then return 0 end if;voice=taskVoice(state.currentOrder)
  if state.selected==len(state.sorted) then
    if voice[1]!="" then state.commands=state.commands+["cmd vsay_team "+voice[1]+"\n"] end if
  else
    if state.selected>=0 and state.selected<len(state.sorted) then
      target=state.sorted[state.selected]
      if target==0 and voice[0]!="" then state.commands=state.commands+["teamtask "+str(state.currentOrder)+"\n","cmd vsay_team "+voice[0]+"\n"]
      else if voice[1]!="" then state.commands=state.commands+["cmd vtell "+str(target)+" "+voice[1]+"\n"] end if
    end if
  end if
  if voice[2]!="" then state.commands=state.commands+[voice[2]] end if;state.orderPending=false;return 1
end function
// CG_SetSelectedPlayerName
/// @param state Mutable client game newdraw record/storage; this routine assigns `state.selectedName`, `state.selectedClient`, `state.currentOrder`, `state.cvars`.
function setSelectedPlayerName(state)
  if state.selected>=0 and state.selected<len(state.sorted) then id=state.sorted[state.selected];if id>=0 and id<len(state.clients) then ci=state.clients[id];state.selectedName=ci.name;state.selectedClient=id;state.currentOrder=ci.teamTask;state.cvars=state.cvars+[["cg_selectedPlayerName",ci.name],["cg_selectedPlayer",str(id)]] end if else state.selectedName="Everyone";state.cvars=state.cvars+[["cg_selectedPlayerName","Everyone"]] end if;return state.selectedName
end function
/// Updates `state.selected` during client game newdraw `getSelectedPlayer`.
/// @param state Mutable client game newdraw record/storage; this routine assigns `state.selected`.
function getSelectedPlayer(state) if state.selected<0 or state.selected>=len(state.sorted) then state.selected=0 end if;return state.selected end function
/// Updates `state.selected` during client game newdraw `selectNextPlayer`.
/// @param state Mutable client game newdraw record/storage; this routine assigns `state.selected`.
function selectNextPlayer(state) checkOrderPending(state);if state.selected>=0 and state.selected<len(state.sorted) then state.selected=state.selected+1 else state.selected=0 end if;setSelectedPlayerName(state);return state.selected end function
/// Updates `state.selected` during client game newdraw `selectPrevPlayer`.
/// @param state Mutable client game newdraw record/storage; this routine assigns `state.selected`.
function selectPrevPlayer(state) checkOrderPending(state);if state.selected>0 and state.selected<len(state.sorted) then state.selected=state.selected-1 else state.selected=len(state.sorted) end if;setSelectedPlayerName(state);return state.selected end function

/// Evaluates client game newdraw `statusHandle` and returns `"defend"`, `"patrol"`, `"follow"` and additional values according to its guard/selection conditions.
/// @param task Value used by `if task==TEAMTASK_DEFENSE then return "defend" else if task==TEAMTASK_PATROL then return "patrol" else if task==TEAMTASK_FOLLOW then return "f...`.
function statusHandle(task)
  if task==TEAMTASK_DEFENSE then return "defend" else if task==TEAMTASK_PATROL then return "patrol" else if task==TEAMTASK_FOLLOW then return "follow" else if task==TEAMTASK_CAMP then return "camp" else if task==TEAMTASK_RETRIEVE then return "retrieve" else if task==TEAMTASK_ESCORT then return "escort" end if;return "assault"
end function
/// Calls `mq3.client.cgame_newdraw.pic`, `mq3.client.cgame_newdraw.text` from client game newdraw `numericDraw`. The final path returns `text(state,r,str(value),scale,color)`.
/// @param state Shared client game newdraw state passed to the helper calls in `numericDraw`.
/// @param r Value used by `if shader!="" then return pic(state,r,shader,color) end if`.
/// @param value Value used by `return text(state,r,str(value),scale,color)`.
/// @param scale Value used by `return text(state,r,str(value),scale,color)`.
/// @param color Color value used by the client game newdraw drawing or interpolation operation.
/// @param shader Shader handle or asset name selected for this draw operation.
function numericDraw(state,r,value,scale,color,shader) if shader!="" then return pic(state,r,shader,color) end if;return text(state,r,str(value),scale,color) end function
/// Calls `mq3.client.cgame_newdraw.pic`, `mq3.client.cgame_newdraw.model` from client game newdraw `drawPlayerArmorIcon`. The final path returns `model(state,r,"armorModel",0)`.
/// @param state Record read through `state.drawStatus`, `state.draw3dIcons`, `state.drawIcons`.
/// @param r Value used by `if draw2D or (not state.draw3dIcons and state.drawIcons) then return pic(state,r,"armorIcon",void) else if state.draw3dIcons then return model...`.
/// @param draw2D Value used by `if draw2D or (not state.draw3dIcons and state.drawIcons) then return pic(state,r,"armorIcon",void) else if state.draw3dIcons then return model...`.
function drawPlayerArmorIcon(state,r,draw2D) if not state.drawStatus then return void end if;if draw2D or (not state.draw3dIcons and state.drawIcons) then return pic(state,r,"armorIcon",void) else if state.draw3dIcons then return model(state,r,"armorModel",0) end if;return void end function
/// Adapts `mq3.client.cgame_newdraw.numericDraw` to client game newdraw `drawPlayerArmorValue`, returning its result for `state, r, state.armor, scale, color, shader`.
/// @param state Record read through `state.armor`.
/// @param r Argument 2 of `mq3.client.cgame_newdraw.numericDraw`.
/// @param scale Argument 4 of `mq3.client.cgame_newdraw.numericDraw`.
/// @param color Argument 5 of `mq3.client.cgame_newdraw.numericDraw`.
/// @param shader Argument 6 of `mq3.client.cgame_newdraw.numericDraw`.
function drawPlayerArmorValue(state,r,scale,color,shader) return numericDraw(state,r,state.armor,scale,color,shader) end function
/// Calls `mq3.client.cgame_newdraw.pic`, `mq3.client.cgame_newdraw.model` from client game newdraw `drawPlayerAmmoIcon`.
/// @param state Record read through `state.draw3dIcons`, `state.drawIcons`, `state.weapon`.
/// @param r Value used by `if draw2D or (not state.draw3dIcons and state.drawIcons) then return pic(state,r,"weapon"+str(state.weapon)+"AmmoIcon",void) else if state.dra...`.
/// @param draw2D Value used by `if draw2D or (not state.draw3dIcons and state.drawIcons) then return pic(state,r,"weapon"+str(state.weapon)+"AmmoIcon",void) else if state.dra...`.
function drawPlayerAmmoIcon(state,r,draw2D) if draw2D or (not state.draw3dIcons and state.drawIcons) then return pic(state,r,"weapon"+str(state.weapon)+"AmmoIcon",void) else if state.draw3dIcons and state.weapon!=0 then return model(state,r,"weapon"+str(state.weapon)+"AmmoModel",0) end if;return void end function
/// Calls `mq3.client.cgame_newdraw.numericDraw` from client game newdraw `drawPlayerAmmoValue`. The final path returns `numericDraw(state,r,state.ammo,scale,color,shader)`.
/// @param state Record read through `state.weapon`, `state.ammo`.
/// @param r Value used by `return numericDraw(state,r,state.ammo,scale,color,shader)`.
/// @param scale Value used by `return numericDraw(state,r,state.ammo,scale,color,shader)`.
/// @param color Color value used by the client game newdraw drawing or interpolation operation.
/// @param shader Shader handle or asset name selected for this draw operation.
function drawPlayerAmmoValue(state,r,scale,color,shader) if state.weapon==0 or state.ammo<0 then return void end if;return numericDraw(state,r,state.ammo,scale,color,shader) end function
/// Calls `mq3.client.cgame_newdraw.selfClient`, `mq3.client.cgame_newdraw.pic`, `mq3.client.cgame_newdraw.model` from client game newdraw `drawPlayerHead`.
/// @param state Record read through `state.draw3dIcons`.
/// @param r Value used by `if ci!=void then return pic(state,r,ci.modelIcon,void) end if else return model(state,r,"playerHead",0) end if`.
/// @param draw2D Value used by `if draw2D or not state.draw3dIcons then ci=selfClient(state)`.
function drawPlayerHead(state,r,draw2D) if draw2D or not state.draw3dIcons then ci=selfClient(state);if ci!=void then return pic(state,r,ci.modelIcon,void) end if else return model(state,r,"playerHead",0) end if;return void end function
/// Calls `mq3.client.cgame_newdraw.currentClient`, `mq3.client.cgame_newdraw.numericDraw` from client game newdraw `drawSelectedPlayerHealth`. The final path returns `numericDraw(state,r,ci.health,scale,color,shader)`.
/// @param state Shared client game newdraw state passed to the helper calls in `drawSelectedPlayerHealth`.
/// @param r Value used by `return numericDraw(state,r,ci.health,scale,color,shader)`.
/// @param scale Value used by `return numericDraw(state,r,ci.health,scale,color,shader)`.
/// @param color Color value used by the client game newdraw drawing or interpolation operation.
/// @param shader Shader handle or asset name selected for this draw operation.
function drawSelectedPlayerHealth(state,r,scale,color,shader) ci=currentClient(state);if ci==void then return void end if;return numericDraw(state,r,ci.health,scale,color,shader) end function
/// Calls `mq3.client.cgame_newdraw.currentClient`, `mq3.client.cgame_newdraw.numericDraw` from client game newdraw `drawSelectedPlayerArmor`. The final path returns `numericDraw(state,r,ci.armor,scale,color,shader)`.
/// @param state Shared client game newdraw state passed to the helper calls in `drawSelectedPlayerArmor`.
/// @param r Value used by `return numericDraw(state,r,ci.armor,scale,color,shader)`.
/// @param scale Value used by `return numericDraw(state,r,ci.armor,scale,color,shader)`.
/// @param color Color value used by the client game newdraw drawing or interpolation operation.
/// @param shader Shader handle or asset name selected for this draw operation.
function drawSelectedPlayerArmor(state,r,scale,color,shader) ci=currentClient(state);if ci==void or ci.armor<=0 then return void end if;return numericDraw(state,r,ci.armor,scale,color,shader) end function
/// Calls `mq3.client.cgame_newdraw.currentClient`, `mq3.client.cgame_newdraw.pic`, `mq3.client.cgame_newdraw.statusHandle` from client game newdraw `drawSelectedPlayerStatus`. The final path returns `pic(state,r,statusHandle(task),void)`.
/// @param state Record read through `state.orderPending`, `state.time`, `state.orderTime`, `state.currentOrder`.
/// @param r Value used by `return pic(state,r,statusHandle(task),void)`.
function drawSelectedPlayerStatus(state,r) ci=currentClient(state);if ci==void then return void end if;if state.orderPending and state.time>state.orderTime-2500 and ((state.time>>9)&1)!=0 then return void end if;task=ci.teamTask;if state.orderPending then task=state.currentOrder end if;return pic(state,r,statusHandle(task),void) end function
/// Calls `mq3.client.cgame_newdraw.selfClient`, `mq3.client.cgame_newdraw.pic`, `mq3.client.cgame_newdraw.statusHandle` from client game newdraw `drawPlayerStatus`. The final path returns `pic(state,r,statusHandle(ci.teamTask),void)`.
/// @param state Shared client game newdraw state passed to the helper calls in `drawPlayerStatus`.
/// @param r Value used by `return pic(state,r,statusHandle(ci.teamTask),void)`.
function drawPlayerStatus(state,r) ci=selfClient(state);if ci==void then return void end if;return pic(state,r,statusHandle(ci.teamTask),void) end function
/// Calls `mq3.client.cgame_newdraw.currentClient`, `mq3.client.cgame_newdraw.voiceClient`, `mq3.client.cgame_newdraw.text` from client game newdraw `drawSelectedPlayerName`. The final path returns `text(state,r,ci.name,scale,color)`.
/// @param state Shared client game newdraw state passed to the helper calls in `drawSelectedPlayerName`.
/// @param r Value used by `return text(state,r,ci.name,scale,color)`.
/// @param scale Value used by `return text(state,r,ci.name,scale,color)`.
/// @param color Color value used by the client game newdraw drawing or interpolation operation.
/// @param voice Value used by `if voice then ci=voiceClient(state) end if`.
function drawSelectedPlayerName(state,r,scale,color,voice) ci=currentClient(state);if voice then ci=voiceClient(state) end if;if ci==void then return void end if;return text(state,r,ci.name,scale,color) end function
/// Calls `mq3.client.cgame_newdraw.currentClient`, `mq3.client.cgame_newdraw.text`, `mq3.client.cgame_newdraw.location` from client game newdraw `drawSelectedPlayerLocation`. The final path returns `text(state,r,location(state,ci.location),scale,color)`.
/// @param state Shared client game newdraw state passed to the helper calls in `drawSelectedPlayerLocation`.
/// @param r Value used by `return text(state,r,location(state,ci.location),scale,color)`.
/// @param scale Value used by `return text(state,r,location(state,ci.location),scale,color)`.
/// @param color Color value used by the client game newdraw drawing or interpolation operation.
function drawSelectedPlayerLocation(state,r,scale,color) ci=currentClient(state);if ci==void then return void end if;return text(state,r,location(state,ci.location),scale,color) end function
/// Calls `mq3.client.cgame_newdraw.selfClient`, `mq3.client.cgame_newdraw.text`, `mq3.client.cgame_newdraw.location` from client game newdraw `drawPlayerLocation`. The final path returns `text(state,r,location(state,ci.location),scale,color)`.
/// @param state Shared client game newdraw state passed to the helper calls in `drawPlayerLocation`.
/// @param r Value used by `return text(state,r,location(state,ci.location),scale,color)`.
/// @param scale Value used by `return text(state,r,location(state,ci.location),scale,color)`.
/// @param color Color value used by the client game newdraw drawing or interpolation operation.
function drawPlayerLocation(state,r,scale,color) ci=selfClient(state);if ci==void then return void end if;return text(state,r,location(state,ci.location),scale,color) end function
/// Calls `mq3.client.cgame_newdraw.currentClient`, `mq3.client.cgame_newdraw.pic` from client game newdraw `drawSelectedPlayerWeapon`. The final path returns `pic(state,r,name,void)`.
/// @param state Shared client game newdraw state passed to the helper calls in `drawSelectedPlayerWeapon`.
/// @param r Value used by `return pic(state,r,name,void)`.
function drawSelectedPlayerWeapon(state,r) ci=currentClient(state);if ci==void then return void end if;name="defer";if ci.curWeapon!=0 then name="weapon"+str(ci.curWeapon)+"Icon" end if;return pic(state,r,name,void) end function
/// Adapts `mq3.client.cgame_newdraw.numericDraw` to client game newdraw `drawPlayerScore`, returning its result for `state, r, state.score, scale, color, shader`.
/// @param state Record read through `state.score`.
/// @param r Argument 2 of `mq3.client.cgame_newdraw.numericDraw`.
/// @param scale Argument 4 of `mq3.client.cgame_newdraw.numericDraw`.
/// @param color Argument 5 of `mq3.client.cgame_newdraw.numericDraw`.
/// @param shader Argument 6 of `mq3.client.cgame_newdraw.numericDraw`.
function drawPlayerScore(state,r,scale,color,shader) return numericDraw(state,r,state.score,scale,color,shader) end function
/// Calls `mq3.client.cgame_newdraw.pic` from client game newdraw `drawPlayerItem`. The final path returns `pic(state,r,"item"+str(state.holdable)+"Icon",void)`.
/// @param state Record read through `state.holdable`.
/// @param r Value used by `return pic(state,r,"item"+str(state.holdable)+"Icon",void)`.
/// @param scale Accepted for compatibility with `drawPlayerItem`; the current implementation does not read it.
/// @param draw2D Accepted for compatibility with `drawPlayerItem`; the current implementation does not read it.
function drawPlayerItem(state,r,scale,draw2D) if state.holdable==0 then return void end if;return pic(state,r,"item"+str(state.holdable)+"Icon",void) end function
/// Evaluates client game newdraw `firstPowerup` and returns `id`, `-1` according to its guard/selection conditions.
/// @param bits Value used by `for id=0 to 31 if (bits&(1<<id))!=0 then return id end if end for`.
function firstPowerup(bits) for id=0 to 31 if (bits&(1<<id))!=0 then return id end if end for;return -1 end function
/// Calls `mq3.client.cgame_newdraw.currentClient`, `mq3.client.cgame_newdraw.firstPowerup`, `mq3.client.cgame_newdraw.pic` from client game newdraw `drawSelectedPlayerPowerup`. The final path returns `pic(state,r,"powerup"+str(id)+"Icon",void)`.
/// @param state Shared client game newdraw state passed to the helper calls in `drawSelectedPlayerPowerup`.
/// @param r Value used by `return pic(state,r,"powerup"+str(id)+"Icon",void)`.
/// @param draw2D Accepted for compatibility with `drawSelectedPlayerPowerup`; the current implementation does not read it.
function drawSelectedPlayerPowerup(state,r,draw2D) ci=currentClient(state);if ci==void then return void end if;id=firstPowerup(ci.powerups);if id<0 then return void end if;return pic(state,r,"powerup"+str(id)+"Icon",void) end function
/// Calls `mq3.client.cgame_newdraw.currentClient`, `mq3.client.cgame_newdraw.voiceClient`, `mq3.client.cgame_newdraw.model` and additional helpers from client game newdraw `drawSelectedPlayerHead`. The final path returns `result`.
/// @param state Record read through `state.selectedClient`, `state.voiceClient`, `state.draw3dIcons`, `state.drawIcons`.
/// @param r Value used by `if state.draw3dIcons and not draw2D then result=model(state,r,ci.headModel,id) else if state.drawIcons then result=pic(state,r,ci.modelIcon,vo...`.
/// @param draw2D Value used by `if state.draw3dIcons and not draw2D then result=model(state,r,ci.headModel,id) else if state.drawIcons then result=pic(state,r,ci.modelIcon,vo...`.
/// @param voice Value used by `if voice then ci=voiceClient(state)`.
function drawSelectedPlayerHead(state,r,draw2D,voice) ci=currentClient(state);id=state.selectedClient;if voice then ci=voiceClient(state);id=state.voiceClient end if;if ci==void then return void end if;result=void;if state.draw3dIcons and not draw2D then result=model(state,r,ci.headModel,id) else if state.drawIcons then result=pic(state,r,ci.modelIcon,void) end if;if ci.deferred then pic(state,r,"defer",void) end if;return result end function
/// Adapts `mq3.client.cgame_newdraw.numericDraw` to client game newdraw `drawPlayerHealth`, returning its result for `state, r, state.health, scale, color, shader`.
/// @param state Record read through `state.health`.
/// @param r Argument 2 of `mq3.client.cgame_newdraw.numericDraw`.
/// @param scale Argument 4 of `mq3.client.cgame_newdraw.numericDraw`.
/// @param color Argument 5 of `mq3.client.cgame_newdraw.numericDraw`.
/// @param shader Argument 6 of `mq3.client.cgame_newdraw.numericDraw`.
function drawPlayerHealth(state,r,scale,color,shader) return numericDraw(state,r,state.health,scale,color,shader) end function
/// Calls `mq3.client.cgame_newdraw.text` from client game newdraw `drawRedScore`. The final path returns `text(state,r,value,scale,color)`.
/// @param state Record read through `state.scores1`.
/// @param r Value used by `return text(state,r,value,scale,color)`.
/// @param scale Value used by `return text(state,r,value,scale,color)`.
/// @param color Color value used by the client game newdraw drawing or interpolation operation.
/// @param shader Accepted for compatibility with `drawRedScore`; the current implementation does not read it.
function drawRedScore(state,r,scale,color,shader) value="-";if state.scores1!=SCORE_NOT_PRESENT then value=str(state.scores1) end if;return text(state,r,value,scale,color) end function
/// Calls `mq3.client.cgame_newdraw.text` from client game newdraw `drawBlueScore`. The final path returns `text(state,r,value,scale,color)`.
/// @param state Record read through `state.scores2`.
/// @param r Value used by `return text(state,r,value,scale,color)`.
/// @param scale Value used by `return text(state,r,value,scale,color)`.
/// @param color Color value used by the client game newdraw drawing or interpolation operation.
/// @param shader Accepted for compatibility with `drawBlueScore`; the current implementation does not read it.
function drawBlueScore(state,r,scale,color,shader) value="-";if state.scores2!=SCORE_NOT_PRESENT then value=str(state.scores2) end if;return text(state,r,value,scale,color) end function
/// Adapts `mq3.client.cgame_newdraw.text` to client game newdraw `drawRedName`, returning its result for `state, r, state.redTeamName, scale, color`.
/// @param state Record read through `state.redTeamName`.
/// @param r Argument 2 of `mq3.client.cgame_newdraw.text`.
/// @param scale Argument 4 of `mq3.client.cgame_newdraw.text`.
/// @param color Argument 5 of `mq3.client.cgame_newdraw.text`.
function drawRedName(state,r,scale,color) return text(state,r,state.redTeamName,scale,color) end function
/// Adapts `mq3.client.cgame_newdraw.text` to client game newdraw `drawBlueName`, returning its result for `state, r, state.blueTeamName, scale, color`.
/// @param state Record read through `state.blueTeamName`.
/// @param r Argument 2 of `mq3.client.cgame_newdraw.text`.
/// @param scale Argument 4 of `mq3.client.cgame_newdraw.text`.
/// @param color Argument 5 of `mq3.client.cgame_newdraw.text`.
function drawBlueName(state,r,scale,color) return text(state,r,state.blueTeamName,scale,color) end function
/// Evaluates client game newdraw `flagCarrier` and returns `id`, `-1` according to its guard/selection conditions.
/// @param state Record read through `state.clients`.
/// @param wantedTeam Value used by `if ci.infoValid and ci.team==wantedTeam and (ci.powerups&(1<<powerup))!=0 then return id end if end for`.
/// @param powerup Value used by `if ci.infoValid and ci.team==wantedTeam and (ci.powerups&(1<<powerup))!=0 then return id end if end for`.
function flagCarrier(state,wantedTeam,powerup) for id=0 to len(state.clients)-1 ci=state.clients[id];if ci.infoValid and ci.team==wantedTeam and (ci.powerups&(1<<powerup))!=0 then return id end if end for;return -1 end function
/// Calls `mq3.client.cgame_newdraw.flagCarrier`, `mq3.client.cgame_newdraw.text` from client game newdraw `drawBlueFlagName`.
/// @param state Record read through `state.clients`.
/// @param r Value used by `if id>=0 then return text(state,r,state.clients[id].name,scale,color) end if`.
/// @param scale Value used by `if id>=0 then return text(state,r,state.clients[id].name,scale,color) end if`.
/// @param color Color value used by the client game newdraw drawing or interpolation operation.
function drawBlueFlagName(state,r,scale,color) id=flagCarrier(state,TEAM_RED,PW_BLUEFLAG);if id>=0 then return text(state,r,state.clients[id].name,scale,color) end if;return void end function
/// Calls `mq3.client.cgame_newdraw.flagCarrier`, `mq3.client.cgame_newdraw.text` from client game newdraw `drawRedFlagName`.
/// @param state Record read through `state.clients`.
/// @param r Value used by `if id>=0 then return text(state,r,state.clients[id].name,scale,color) end if`.
/// @param scale Value used by `if id>=0 then return text(state,r,state.clients[id].name,scale,color) end if`.
/// @param color Color value used by the client game newdraw drawing or interpolation operation.
function drawRedFlagName(state,r,scale,color) id=flagCarrier(state,TEAM_BLUE,PW_REDFLAG);if id>=0 then return text(state,r,state.clients[id].name,scale,color) end if;return void end function
/// Calls `mq3.client.cgame_newdraw.pic` from client game newdraw `drawBlueFlagStatus`. The final path returns `pic(state,r,"flag"+str(index),[0.0,0.0,1.0,1.0])`.
/// @param state Record read through `state.gametype`, `state.blueflag`.
/// @param r Value used by `if state.gametype==GT_HARVESTER then return pic(state,r,"blueCubeIcon",[0.0,0.0,1.0,1.0]) end if`.
/// @param shader Shader handle or asset name selected for this draw operation.
function drawBlueFlagStatus(state,r,shader) if state.gametype==GT_HARVESTER then return pic(state,r,"blueCubeIcon",[0.0,0.0,1.0,1.0]) end if;if state.gametype!=GT_CTF and state.gametype!=GT_1FCTF then return void end if;if shader!="" then return pic(state,r,shader,void) end if;index=state.blueflag;if index<0 or index>2 then index=0 end if;return pic(state,r,"flag"+str(index),[0.0,0.0,1.0,1.0]) end function
/// Calls `mq3.client.cgame_newdraw.pic` from client game newdraw `drawRedFlagStatus`. The final path returns `pic(state,r,"flag"+str(index),[1.0,0.0,0.0,1.0])`.
/// @param state Record read through `state.gametype`, `state.redflag`.
/// @param r Value used by `if state.gametype==GT_HARVESTER then return pic(state,r,"redCubeIcon",[1.0,0.0,0.0,1.0]) end if`.
/// @param shader Shader handle or asset name selected for this draw operation.
function drawRedFlagStatus(state,r,shader) if state.gametype==GT_HARVESTER then return pic(state,r,"redCubeIcon",[1.0,0.0,0.0,1.0]) end if;if state.gametype!=GT_CTF and state.gametype!=GT_1FCTF then return void end if;if shader!="" then return pic(state,r,shader,void) end if;index=state.redflag;if index<0 or index>2 then index=0 end if;return pic(state,r,"flag"+str(index),[1.0,0.0,0.0,1.0]) end function
/// Calls `mq3.client.cgame_newdraw.flagCarrier`, `mq3.client.cgame_newdraw.model` from client game newdraw `drawBlueFlagHead`.
/// @param state Shared client game newdraw state passed to the helper calls in `drawBlueFlagHead`.
/// @param r Value used by `if id>=0 then return model(state,r,"clientHead",0) end if`.
function drawBlueFlagHead(state,r) id=flagCarrier(state,TEAM_RED,PW_BLUEFLAG);if id>=0 then return model(state,r,"clientHead",0) end if;return void end function
/// Calls `mq3.client.cgame_newdraw.flagCarrier`, `mq3.client.cgame_newdraw.model` from client game newdraw `drawRedFlagHead`.
/// @param state Shared client game newdraw state passed to the helper calls in `drawRedFlagHead`.
/// @param r Value used by `if id>=0 then return model(state,r,"clientHead",0) end if`.
function drawRedFlagHead(state,r) id=flagCarrier(state,TEAM_BLUE,PW_REDFLAG);if id>=0 then return model(state,r,"clientHead",0) end if;return void end function
/// Calls `mq3.client.cgame_newdraw.text`, `mq3.client.cgame_newdraw.model`, `mq3.client.cgame_newdraw.pic` from client game newdraw `harvesterSkulls`. The final path returns `value`.
/// @param state Record read through `state.gametype`, `state.generic1`, `state.team`, `state.drawIcons` and additional values.
/// @param r Value used by `text(state,r,str(value),scale,color)`.
/// @param scale Value used by `text(state,r,str(value),scale,color)`.
/// @param color Color value used by the client game newdraw drawing or interpolation operation.
/// @param force2D Value used by `if state.drawIcons then if not force2D and state.draw3dIcons then model(state,r,enemy+"CubeModel",0) else pic(state,r,enemy+"CubeIcon",void) e...`.
function harvesterSkulls(state,r,scale,color,force2D) if state.gametype!=GT_HARVESTER then return void end if;value=state.generic1;if value>99 then value=99 end if;text(state,r,str(value),scale,color);enemy="blue";if state.team==TEAM_BLUE then enemy="red" end if;if state.drawIcons then if not force2D and state.draw3dIcons then model(state,r,enemy+"CubeModel",0) else pic(state,r,enemy+"CubeIcon",void) end if end if;return value end function
/// Calls `mq3.client.cgame_newdraw.pic` from client game newdraw `oneFlagStatus`. The final path returns `pic(state,r,"flag"+str(index),color)`.
/// @param state Record read through `state.gametype`, `state.flagStatus`.
/// @param r Value used by `return pic(state,r,"flag"+str(index),color)`.
function oneFlagStatus(state,r) if state.gametype!=GT_1FCTF then return void end if;index=0;color=[1.0,1.0,1.0,1.0];if state.flagStatus==FLAG_TAKEN_RED then index=1;color=[1.0,0.0,0.0,1.0] else if state.flagStatus==FLAG_TAKEN_BLUE then index=1;color=[0.0,0.0,1.0,1.0] else if state.flagStatus==FLAG_DROPPED then index=2 end if;return pic(state,r,"flag"+str(index),color) end function
/// Calls `mq3.client.cgame_newdraw.pic` from client game newdraw `drawCTFPowerUp`. The final path returns `pic(state,r,"item"+str(state.persistentPowerup)+"Icon",void)`.
/// @param state Record read through `state.gametype`, `state.persistentPowerup`.
/// @param r Value used by `return pic(state,r,"item"+str(state.persistentPowerup)+"Icon",void)`.
function drawCTFPowerUp(state,r) if state.gametype<GT_CTF or state.persistentPowerup==0 then return void end if;return pic(state,r,"item"+str(state.persistentPowerup)+"Icon",void) end function
/// Adapts `mq3.client.cgame_newdraw.emit` to client game newdraw `drawTeamColor`, returning its result for `state, "team-background", r, "", "", "", color, color[3], state.team`.
/// @param state Record read through `state.team`.
/// @param r Argument 3 of `mq3.client.cgame_newdraw.emit`.
/// @param color Argument 7, 8 of `mq3.client.cgame_newdraw.emit`; passed as `color`, `color[3]`.
function drawTeamColor(state,r,color) return emit(state,"team-background",r,"","","",color,color[3],state.team) end function
/// Evaluates client game newdraw `sortedPowerups` and returns `result` according to its guard/selection conditions.
/// @param state Record read through `state.powerups`, `state.time`.
function sortedPowerups(state) result=[];for each p in state.powerups remaining=p.expires-state.time;if remaining>0 and remaining<999000 then inserted=false;next=[];for each old in result if not inserted and old.expires-state.time>=remaining then next=next+[p];inserted=true end if;next=next+[old] end for;if not inserted then next=next+[p] end if;result=next end if end for;return result end function
/// Calls `mq3.client.cgame_newdraw.sortedPowerups`, `mq3.compat.numeric.trunc32`, `mq3.client.cgame_newdraw.pic` and additional helpers from client game newdraw `drawAreaPowerUp`. The final path returns `len(items)`.
/// @param state Record read through `state.health`, `state.time`.
/// @param r Record read through `r.x`, `r.y`, `r.w`, `r.h`.
/// @param align Value used by `if align==HUD_VERTICAL then y=y+r.w+special else x=x+r.w+special end if end for`.
/// @param special Value used by `if align==HUD_VERTICAL then y=y+r.w+special else x=x+r.w+special end if end for`.
/// @param scale Value used by `text(state,Rect(x+r.w*0.75+3,y,r.w*0.25,r.h),str(n.trunc32(remaining/1000.0)),scale,color)`.
/// @param color Color value used by the client game newdraw drawing or interpolation operation.
function drawAreaPowerUp(state,r,align,special,scale,color) if state.health<=0 then return 0 end if;items=sortedPowerups(state);x=r.x;y=r.y;for each p in items remaining=p.expires-state.time;shade=[1.0,1.0,1.0,1.0];if remaining<5000 then fraction=(remaining/1000.0)-n.trunc32(remaining/1000.0);shade=[fraction,fraction,fraction,fraction] end if;pic(state,Rect(x,y,r.w*0.75,r.h),p.icon,shade);text(state,Rect(x+r.w*0.75+3,y,r.w*0.25,r.h),str(n.trunc32(remaining/1000.0)),scale,color);if align==HUD_VERTICAL then y=y+r.w+special else x=x+r.w+special end if end for;return len(items) end function

// CG_GetValue
/// @param state Record read through `state.armor`, `state.weapon`, `state.ammo`, `state.score` and additional values.
/// @param ownerDraw Value used by `if ownerDraw==CG_SELECTEDPLAYER_ARMOR and ci!=void then return ci.armor end if`.
function getValue(state,ownerDraw)
  ci=currentClient(state);if ownerDraw==CG_SELECTEDPLAYER_ARMOR and ci!=void then return ci.armor end if;if ownerDraw==CG_SELECTEDPLAYER_HEALTH and ci!=void then return ci.health end if;if ownerDraw==CG_PLAYER_ARMOR_VALUE then return state.armor end if;if ownerDraw==CG_PLAYER_AMMO_VALUE and state.weapon!=0 then return state.ammo end if;if ownerDraw==CG_PLAYER_SCORE then return state.score end if;if ownerDraw==CG_PLAYER_HEALTH then return state.health end if;if ownerDraw==CG_RED_SCORE then return state.scores1 end if;if ownerDraw==CG_BLUE_SCORE then return state.scores2 end if;return -1
end function
/// Evaluates client game newdraw `otherTeamHasFlag` and returns `false`, `(state.team==TEAM_RED and state.flagStatus==FLAG_TAKEN_BLUE) or (state.team==TEAM_BLUE and state.flagStatus==FLAG_TAKEN_RED)`, `(state.team==TEAM_RED and state.redflag==FLAG_TAKEN) or (state.team==TEAM_BLUE and state.blueflag==FLAG_TAKEN)` according to its guard/selection conditions.
/// @param state Record read through `state.gametype`, `state.team`, `state.flagStatus`, `state.redflag` and additional values.
function otherTeamHasFlag(state) if state.gametype!=GT_CTF and state.gametype!=GT_1FCTF then return false end if;if state.gametype==GT_1FCTF then return (state.team==TEAM_RED and state.flagStatus==FLAG_TAKEN_BLUE) or (state.team==TEAM_BLUE and state.flagStatus==FLAG_TAKEN_RED) end if;return (state.team==TEAM_RED and state.redflag==FLAG_TAKEN) or (state.team==TEAM_BLUE and state.blueflag==FLAG_TAKEN) end function
/// Evaluates client game newdraw `yourTeamHasFlag` and returns `false`, `(state.team==TEAM_RED and state.flagStatus==FLAG_TAKEN_RED) or (state.team==TEAM_BLUE and state.flagStatus==FLAG_TAKEN_BLUE)`, `(state.team==TEAM_RED and state.blueflag==FLAG_TAKEN) or (state.team==TEAM_BLUE and state.redflag==FLAG_TAKEN)` according to its guard/selection conditions.
/// @param state Record read through `state.gametype`, `state.team`, `state.flagStatus`, `state.blueflag` and additional values.
function yourTeamHasFlag(state) if state.gametype!=GT_CTF and state.gametype!=GT_1FCTF then return false end if;if state.gametype==GT_1FCTF then return (state.team==TEAM_RED and state.flagStatus==FLAG_TAKEN_RED) or (state.team==TEAM_BLUE and state.flagStatus==FLAG_TAKEN_BLUE) end if;return (state.team==TEAM_RED and state.blueflag==FLAG_TAKEN) or (state.team==TEAM_BLUE and state.redflag==FLAG_TAKEN) end function
/// Computes `(state.playerPowerups&(1<<PW_REDFLAG))!=0 or (state.playerPowerups&(1<<PW_BLUEFLAG))!=0 or (state.playerPowerups&(1<<PW_NEUTRALFLAG))!=0` for client game newdraw `hasPlayerFlag`.
/// @param state Record read through `state.playerPowerups`.
function hasPlayerFlag(state) return (state.playerPowerups&(1<<PW_REDFLAG))!=0 or (state.playerPowerups&(1<<PW_BLUEFLAG))!=0 or (state.playerPowerups&(1<<PW_NEUTRALFLAG))!=0 end function
/// Calls `mq3.client.cgame_newdraw.otherTeamHasFlag`, `mq3.client.cgame_newdraw.yourTeamHasFlag`, `mq3.client.cgame_newdraw.hasPlayerFlag` from client game newdraw `ownerDrawVisible`.
/// @param state Record read through `state.selected`, `state.sorted`, `state.redflag`, `state.flagStatus` and additional values.
/// @param flags Value used by `if (flags&CG_SHOW_TEAMINFO)!=0 then return state.selected==len(state.sorted) end if`.
function ownerDrawVisible(state,flags)
  if (flags&CG_SHOW_TEAMINFO)!=0 then return state.selected==len(state.sorted) end if;if (flags&CG_SHOW_NOTEAMINFO)!=0 then return state.selected!=len(state.sorted) end if;if (flags&CG_SHOW_OTHERTEAMHASFLAG)!=0 then return otherTeamHasFlag(state) end if;if (flags&CG_SHOW_YOURTEAMHASENEMYFLAG)!=0 then return yourTeamHasFlag(state) end if
  if (flags&(CG_SHOW_BLUE_TEAM_HAS_REDFLAG|CG_SHOW_RED_TEAM_HAS_BLUEFLAG))!=0 then return ((flags&CG_SHOW_BLUE_TEAM_HAS_REDFLAG)!=0 and (state.redflag==FLAG_TAKEN or state.flagStatus==FLAG_TAKEN_RED)) or ((flags&CG_SHOW_RED_TEAM_HAS_BLUEFLAG)!=0 and (state.blueflag==FLAG_TAKEN or state.flagStatus==FLAG_TAKEN_BLUE)) end if
  if (flags&CG_SHOW_ANYTEAMGAME)!=0 and state.gametype>=GT_TEAM then return true end if;if (flags&CG_SHOW_ANYNONTEAMGAME)!=0 and state.gametype<GT_TEAM then return true end if;if (flags&CG_SHOW_HARVESTER)!=0 then return state.gametype==GT_HARVESTER end if;if (flags&CG_SHOW_ONEFLAG)!=0 then return state.gametype==GT_1FCTF end if;if (flags&CG_SHOW_CTF)!=0 and state.gametype==GT_CTF then return true end if;if (flags&CG_SHOW_OBELISK)!=0 then return state.gametype==GT_OBELISK end if;if (flags&CG_SHOW_HEALTHCRITICAL)!=0 and state.health<25 then return true end if;if (flags&CG_SHOW_HEALTHOK)!=0 and state.health>=25 then return true end if;if (flags&CG_SHOW_SINGLEPLAYER)!=0 and state.gametype==GT_SINGLE_PLAYER then return true end if;if (flags&CG_SHOW_TOURNAMENT)!=0 and state.gametype==GT_TOURNAMENT then return true end if;if (flags&CG_SHOW_IF_PLAYER_HAS_FLAG)!=0 and hasPlayerFlag(state) then return true end if;return false
end function
/// Calls `mq3.client.cgame_newdraw.emit` from client game newdraw `drawPlayerHasFlag`.
/// @param state Record read through `state.playerPowerups`.
/// @param r Value used by `if (state.playerPowerups&(1<<PW_REDFLAG))!=0 then return emit(state,"flag",r,"red","","",void,force2D,TEAM_RED) else if (state.playerPowerups&...`.
/// @param force2D Value used by `if (state.playerPowerups&(1<<PW_REDFLAG))!=0 then return emit(state,"flag",r,"red","","",void,force2D,TEAM_RED) else if (state.playerPowerups&...`.
function drawPlayerHasFlag(state,r,force2D) if (state.playerPowerups&(1<<PW_REDFLAG))!=0 then return emit(state,"flag",r,"red","","",void,force2D,TEAM_RED) else if (state.playerPowerups&(1<<PW_BLUEFLAG))!=0 then return emit(state,"flag",r,"blue","","",void,force2D,TEAM_BLUE) else if (state.playerPowerups&(1<<PW_NEUTRALFLAG))!=0 then return emit(state,"flag",r,"neutral","","",void,force2D,TEAM_FREE) end if;return void end function
/// Adapts `mq3.client.cgame_newdraw.text` to client game newdraw `drawAreaSystemChat`, returning its result for `state, r, state.systemChat, scale, color`.
/// @param state Record read through `state.systemChat`.
/// @param r Argument 2 of `mq3.client.cgame_newdraw.text`.
/// @param scale Argument 4 of `mq3.client.cgame_newdraw.text`.
/// @param color Argument 5 of `mq3.client.cgame_newdraw.text`.
/// @param shader Accepted for compatibility with `drawAreaSystemChat`; the current implementation does not read it.
function drawAreaSystemChat(state,r,scale,color,shader) return text(state,r,state.systemChat,scale,color) end function
/// Adapts `mq3.client.cgame_newdraw.text` to client game newdraw `drawAreaTeamChat`, returning its result for `state, r, state.teamChat1, scale, color`.
/// @param state Record read through `state.teamChat1`.
/// @param r Argument 2 of `mq3.client.cgame_newdraw.text`.
/// @param scale Argument 4 of `mq3.client.cgame_newdraw.text`.
/// @param color Argument 5 of `mq3.client.cgame_newdraw.text`.
/// @param shader Accepted for compatibility with `drawAreaTeamChat`; the current implementation does not read it.
function drawAreaTeamChat(state,r,scale,color,shader) return text(state,r,state.teamChat1,scale,color) end function
/// Adapts `mq3.client.cgame_newdraw.text` to client game newdraw `drawAreaChat`, returning its result for `state, r, state.teamChat2, scale, color`.
/// @param state Record read through `state.teamChat2`.
/// @param r Argument 2 of `mq3.client.cgame_newdraw.text`.
/// @param scale Argument 4 of `mq3.client.cgame_newdraw.text`.
/// @param color Argument 5 of `mq3.client.cgame_newdraw.text`.
/// @param shader Accepted for compatibility with `drawAreaChat`; the current implementation does not read it.
function drawAreaChat(state,r,scale,color,shader) return text(state,r,state.teamChat2,scale,color) end function
/// Evaluates client game newdraw `getKillerText` and returns `"Fragged by "+state.killerName`, `""` according to its guard/selection conditions.
/// @param state Record read through `state.killerName`.
function getKillerText(state) if state.killerName!="" then return "Fragged by "+state.killerName end if;return "" end function
/// Calls `mq3.client.cgame_newdraw.getKillerText`, `mq3.client.cgame_newdraw.text` from client game newdraw `drawKiller`. The final path returns `text(state,r,value,scale,color)`.
/// @param state Shared client game newdraw state passed to the helper calls in `drawKiller`.
/// @param r Value used by `return text(state,r,value,scale,color)`.
/// @param scale Value used by `return text(state,r,value,scale,color)`.
/// @param color Color value used by the client game newdraw drawing or interpolation operation.
/// @param shader Accepted for compatibility with `drawKiller`; the current implementation does not read it.
function drawKiller(state,r,scale,color,shader) value=getKillerText(state);if value=="" then return void end if;return text(state,r,value,scale,color) end function
/// Calls `mq3.client.cgame_newdraw.text`, `mq3.client.cgame_newdraw.two` from client game newdraw `drawCapFragLimit`. The final path returns `text(state,r,two(limit),scale,color)`.
/// @param state Record read through `state.fraglimit`, `state.gametype`, `state.capturelimit`.
/// @param r Value used by `return text(state,r,two(limit),scale,color)`.
/// @param scale Value used by `return text(state,r,two(limit),scale,color)`.
/// @param color Color value used by the client game newdraw drawing or interpolation operation.
/// @param shader Accepted for compatibility with `drawCapFragLimit`; the current implementation does not read it.
function drawCapFragLimit(state,r,scale,color,shader) limit=state.fraglimit;if state.gametype>=GT_CTF then limit=state.capturelimit end if;return text(state,r,two(limit),scale,color) end function
/// Calls `mq3.client.cgame_newdraw.text`, `mq3.client.cgame_newdraw.two` from client game newdraw `draw1stPlace`. The final path returns `text(state,r,two(state.scores1),scale,color)`.
/// @param state Record read through `state.scores1`.
/// @param r Value used by `return text(state,r,two(state.scores1),scale,color)`.
/// @param scale Value used by `return text(state,r,two(state.scores1),scale,color)`.
/// @param color Color value used by the client game newdraw drawing or interpolation operation.
/// @param shader Accepted for compatibility with `draw1stPlace`; the current implementation does not read it.
function draw1stPlace(state,r,scale,color,shader) if state.scores1==SCORE_NOT_PRESENT then return void end if;return text(state,r,two(state.scores1),scale,color) end function
/// Calls `mq3.client.cgame_newdraw.text`, `mq3.client.cgame_newdraw.two` from client game newdraw `draw2ndPlace`. The final path returns `text(state,r,two(state.scores2),scale,color)`.
/// @param state Record read through `state.scores2`.
/// @param r Value used by `return text(state,r,two(state.scores2),scale,color)`.
/// @param scale Value used by `return text(state,r,two(state.scores2),scale,color)`.
/// @param color Color value used by the client game newdraw drawing or interpolation operation.
/// @param shader Accepted for compatibility with `draw2ndPlace`; the current implementation does not read it.
function draw2ndPlace(state,r,scale,color,shader) if state.scores2==SCORE_NOT_PRESENT then return void end if;return text(state,r,two(state.scores2),scale,color) end function
/// Evaluates client game newdraw `placeString` and returns `str(rank)+"th"`, `str(rank)+"st"`, `str(rank)+"nd"` and additional values according to its guard/selection conditions.
/// @param rank Value used by `if rank%100>=11 and rank%100<=13 then return str(rank)+"th" end if`.
function placeString(rank) if rank%100>=11 and rank%100<=13 then return str(rank)+"th" end if;last=rank%10;if last==1 then return str(rank)+"st" else if last==2 then return str(rank)+"nd" else if last==3 then return str(rank)+"rd" end if;return str(rank)+"th" end function
/// Calls `mq3.client.cgame_newdraw.placeString` from client game newdraw `getGameStatusText`. The final path returns `"Blue leads Red, "+str(state.teamScores[1])+" to "+str(state.teamScores[0])`.
/// @param state Record read through `state.gametype`, `state.team`, `state.rank`, `state.score` and additional values.
function getGameStatusText(state) if state.gametype<GT_TEAM then if state.team!=TEAM_SPECTATOR then return placeString(state.rank+1)+" place with "+str(state.score) end if;return "" end if;if state.teamScores[0]==state.teamScores[1] then return "Teams are tied at "+str(state.teamScores[0]) else if state.teamScores[0]>=state.teamScores[1] then return "Red leads Blue, "+str(state.teamScores[0])+" to "+str(state.teamScores[1]) end if;return "Blue leads Red, "+str(state.teamScores[1])+" to "+str(state.teamScores[0]) end function
/// Adapts `mq3.client.cgame_newdraw.text` to client game newdraw `drawGameStatus`, returning its result for `state, r, getGameStatusText(state), scale, color`.
/// @param state Argument 1, 3 of `mq3.client.cgame_newdraw.text`; passed as `state`, `getGameStatusText(state)`.
/// @param r Argument 2 of `mq3.client.cgame_newdraw.text`.
/// @param scale Argument 4 of `mq3.client.cgame_newdraw.text`.
/// @param color Argument 5 of `mq3.client.cgame_newdraw.text`.
/// @param shader Accepted for compatibility with `drawGameStatus`; the current implementation does not read it.
function drawGameStatus(state,r,scale,color,shader) return text(state,r,getGameStatusText(state),scale,color) end function
/// Evaluates client game newdraw `gameTypeString` and returns `"Free For All"`, `"Team Deathmatch"`, `"Capture the Flag"` and additional values according to its guard/selection conditions.
/// @param state Record read through `state.gametype`.
function gameTypeString(state) if state.gametype==GT_FFA then return "Free For All" else if state.gametype==GT_TEAM then return "Team Deathmatch" else if state.gametype==GT_CTF then return "Capture the Flag" else if state.gametype==GT_1FCTF then return "One Flag CTF" else if state.gametype==GT_OBELISK then return "Overload" else if state.gametype==GT_HARVESTER then return "Harvester" end if;return "" end function
/// Adapts `mq3.client.cgame_newdraw.text` to client game newdraw `drawGameType`, returning its result for `state, r, gameTypeString(state), scale, color`.
/// @param state Argument 1, 3 of `mq3.client.cgame_newdraw.text`; passed as `state`, `gameTypeString(state)`.
/// @param r Argument 2 of `mq3.client.cgame_newdraw.text`.
/// @param scale Argument 4 of `mq3.client.cgame_newdraw.text`.
/// @param color Argument 5 of `mq3.client.cgame_newdraw.text`.
/// @param shader Accepted for compatibility with `drawGameType`; the current implementation does not read it.
function drawGameType(state,r,scale,color,shader) return text(state,r,gameTypeString(state),scale,color) end function

// CG_Text_Paint_Limit
/// @param state Record read through `state.glyphWidth`.
/// @param maxX Value used by `if value==void then return [maxX,""] end if`.
/// @param x Horizontal coordinate in the coordinate space used by `textPaintLimit`.
/// @param y Vertical coordinate in the coordinate space used by `textPaintLimit`.
/// @param scale Value used by `while at<len(value) and count<maximum if at+1<len(value) and value[at]=="^" and value[at+1]!="^" then at=at+2 else width=state.glyphWidth*scale`.
/// @param color Color value used by the client game newdraw drawing or interpolation operation.
/// @param value Sequence read at `value[at]`, `value[at+1]`.
/// @param adjust Value used by `cursor=cursor+width+adjust`.
/// @param limit Upper limit applied while collecting or rendering the result.
function textPaintLimit(state,maxX,x,y,scale,color,value,adjust,limit)
  if value==void then return [maxX,""] end if;cursor=x;painted="";at=0;count=0;maximum=len(value);if limit>0 and maximum>limit then maximum=limit end if
  while at<len(value) and count<maximum if at+1<len(value) and value[at]=="^" and value[at+1]!="^" then at=at+2 else width=state.glyphWidth*scale;if cursor+width>maxX then return [0.0,painted] end if;painted=painted+value[at];cursor=cursor+width+adjust;at=at+1;count=count+1 end if end while
  if painted!="" then text(state,Rect(x,y,cursor-x,scale*16),painted,scale,color) end if;return [cursor,painted]
end function
/// Calls `mq3.client.cgame_newdraw.pic`, `mq3.client.cgame_newdraw.Rect`, `mq3.client.cgame_newdraw.statusHandle` and additional helpers from client game newdraw `drawNewTeamInfo`. The final path returns `drawn`.
/// @param state Record read through `state.sorted`, `state.clients`, `state.team`.
/// @param r Record read through `r.y`, `r.x`, `r.w`, `r.h`.
/// @param textX Accepted for compatibility with `drawNewTeamInfo`; the current implementation does not read it.
/// @param textY Value used by `textPaintLimit(state,r.x+r.w,x+27,y+textY,scale,color,ci.name,0.0,0)`.
/// @param scale Value used by `textPaintLimit(state,r.x+r.w,x+27,y+textY,scale,color,ci.name,0.0,0)`.
/// @param color Color value used by the client game newdraw drawing or interpolation operation.
/// @param shader Accepted for compatibility with `drawNewTeamInfo`; the current implementation does not read it.
function drawNewTeamInfo(state,r,textX,textY,scale,color,shader)
  count=len(state.sorted);if count>8 then count=8 end if;y=r.y;drawn=0;if count>0 then for i=0 to count-1 id=state.sorted[i];if id>=0 and id<len(state.clients) then ci=state.clients[id];if ci.infoValid and ci.team==state.team then x=r.x+38;pic(state,Rect(x,y,10,10),"heart",void);pic(state,Rect(x+13,y,12,12),statusHandle(ci.teamTask),void);textPaintLimit(state,r.x+r.w,x+27,y+textY,scale,color,ci.name,0.0,0);textPaintLimit(state,r.x+r.w,x+r.w/2,y+textY,scale,color,location(state,ci.location),0.0,0);y=y+textY+2;drawn=drawn+1;if y+textY+2>r.y+r.h then return drawn end if end if end if end for end if;return drawn
end function
/// Updates `state.spectatorWidth`, `state.spectatorPaintX`, `state.spectatorPaintX2`, `state.spectatorOffset` and additional values during client game newdraw `drawTeamSpectators`.
/// @param state Mutable client game newdraw record/storage; this routine assigns `state.spectatorWidth`, `state.spectatorPaintX`, `state.spectatorPaintX2`, `state.spectatorOffset` and additional values.
/// @param r Record read through `r.x`, `r.w`, `r.y`, `r.h`.
/// @param scale Value used by `if state.spectatorPaintX<=r.x+2 then if state.spectatorOffset<state.spectatorLen then state.spectatorPaintX=state.spectatorPaintX+state.glyphW...`.
/// @param color Color value used by the client game newdraw drawing or interpolation operation.
/// @param shader Accepted for compatibility with `drawTeamSpectators`; the current implementation does not read it.
function drawTeamSpectators(state,r,scale,color,shader)
  if state.spectatorLen==0 then return 0 end if;if state.spectatorWidth==-1 then state.spectatorWidth=0;state.spectatorPaintX=r.x+1;state.spectatorPaintX2=-1 end if;if state.spectatorOffset>state.spectatorLen then state.spectatorOffset=0;state.spectatorPaintX=r.x+1;state.spectatorPaintX2=-1 end if;if state.time>state.spectatorTime then state.spectatorTime=state.time+10;if state.spectatorPaintX<=r.x+2 then if state.spectatorOffset<state.spectatorLen then state.spectatorPaintX=state.spectatorPaintX+state.glyphWidth*scale-1;state.spectatorOffset=state.spectatorOffset+1 else state.spectatorOffset=0;state.spectatorPaintX=r.x+r.w-2;state.spectatorPaintX2=-1 end if else state.spectatorPaintX=state.spectatorPaintX-1;if state.spectatorPaintX2>=0 then state.spectatorPaintX2=state.spectatorPaintX2-1 end if end if end if
  visible=strings.substr(state.spectatorList,state.spectatorOffset,state.spectatorLen-state.spectatorOffset);result=textPaintLimit(state,r.x+r.w-2,state.spectatorPaintX,r.y+r.h-3,scale,color,visible,0.0,0);if state.spectatorOffset!=0 and result[0]>0 and state.spectatorPaintX2==-1 then state.spectatorPaintX2=r.x+r.w-2 else if state.spectatorOffset==0 or result[0]==0 then state.spectatorPaintX2=-1 end if;return 1
end function
/// Evaluates client game newdraw `medalValue` and returns `0`, `score.accuracy`, `score.assists` and additional values according to its guard/selection conditions.
/// @param score Record read through `score.accuracy`, `score.assists`, `score.defend`, `score.excellent` and additional values.
/// @param ownerDraw Value used by `if ownerDraw==CG_ACCURACY then return score.accuracy else if ownerDraw==CG_ASSISTS then return score.assists else if ownerDraw==CG_DEFEND then...`.
function medalValue(score,ownerDraw) if score==void then return 0 end if;if ownerDraw==CG_ACCURACY then return score.accuracy else if ownerDraw==CG_ASSISTS then return score.assists else if ownerDraw==CG_DEFEND then return score.defend else if ownerDraw==CG_EXCELLENT then return score.excellent else if ownerDraw==CG_IMPRESSIVE then return score.impressive else if ownerDraw==CG_PERFECT then return score.perfect else if ownerDraw==CG_GAUNTLET then return score.gauntlet else if ownerDraw==CG_CAPTURES then return score.captures end if;return 0 end function
/// Calls `mq3.client.cgame_newdraw.medalValue`, `mq3.client.cgame_newdraw.copyColor`, `mq3.client.cgame_newdraw.pic` and additional helpers from client game newdraw `drawMedal`. The final path returns `value`.
/// @param state Record read through `state.selectedScore`, `state.medals`.
/// @param ownerDraw Value used by `value=medalValue(score,ownerDraw)`.
/// @param r Value used by `pic(state,r,shader,shade)`.
/// @param scale Value used by `if label!="" then text(state,r,label,scale,[shade[0],shade[1],shade[2],1.0]) end if`.
/// @param color Color value used by the client game newdraw drawing or interpolation operation.
/// @param shader Shader handle or asset name selected for this draw operation.
function drawMedal(state,ownerDraw,r,scale,color,shader) score=void;if state.selectedScore>=0 and state.selectedScore<len(state.medals) then score=state.medals[state.selectedScore] end if;value=medalValue(score,ownerDraw);shade=copyColor(color);shade[3]=0.25;label="";if value>0 then shade[3]=1.0;if ownerDraw==CG_ACCURACY then label=str(value)+"%" else if ownerDraw==CG_PERFECT then label="Wow" else label=str(value) end if end if;pic(state,r,shader,shade);if label!="" then text(state,r,label,scale,[shade[0],shade[1],shade[2],1.0]) end if;return value end function

// CG_OwnerDraw dispatcher
/// @param state Record read through `state.drawStatus`, `state.selected`, `state.sorted`.
/// @param x Horizontal coordinate in the coordinate space used by `ownerDraw`.
/// @param y Vertical coordinate in the coordinate space used by `ownerDraw`.
/// @param w Width in the coordinate space used by `ownerDraw`.
/// @param h Height in the coordinate space used by `ownerDraw`.
/// @param textX Value used by `if owner==CG_PLAYER_ARMOR_ICON or owner==CG_PLAYER_ARMOR_ICON2D then return drawPlayerArmorIcon(state,r,force2D or owner==CG_PLAYER_ARMOR_ICON...`.
/// @param textY Value used by `if owner==CG_PLAYER_ARMOR_ICON or owner==CG_PLAYER_ARMOR_ICON2D then return drawPlayerArmorIcon(state,r,force2D or owner==CG_PLAYER_ARMOR_ICON...`.
/// @param owner Value used by `if owner==CG_PLAYER_ARMOR_ICON or owner==CG_PLAYER_ARMOR_ICON2D then return drawPlayerArmorIcon(state,r,force2D or owner==CG_PLAYER_ARMOR_ICON...`.
/// @param flags Value used by `force2D=(flags&CG_SHOW_2DONLY)!=0`.
/// @param align Value used by `if owner==CG_PLAYER_ARMOR_ICON or owner==CG_PLAYER_ARMOR_ICON2D then return drawPlayerArmorIcon(state,r,force2D or owner==CG_PLAYER_ARMOR_ICON...`.
/// @param special Value used by `if owner==CG_PLAYER_ARMOR_ICON or owner==CG_PLAYER_ARMOR_ICON2D then return drawPlayerArmorIcon(state,r,force2D or owner==CG_PLAYER_ARMOR_ICON...`.
/// @param scale Value used by `if owner==CG_PLAYER_ARMOR_ICON or owner==CG_PLAYER_ARMOR_ICON2D then return drawPlayerArmorIcon(state,r,force2D or owner==CG_PLAYER_ARMOR_ICON...`.
/// @param color Color value used by the client game newdraw drawing or interpolation operation.
/// @param shader Shader handle or asset name selected for this draw operation.
/// @param textStyle Accepted for compatibility with `ownerDraw`; the current implementation does not read it.
function ownerDraw(state,x,y,w,h,textX,textY,owner,flags,align,special,scale,color,shader,textStyle)
  if not state.drawStatus then return void end if;r=Rect(x,y,w,h);force2D=(flags&CG_SHOW_2DONLY)!=0
  if owner==CG_PLAYER_ARMOR_ICON or owner==CG_PLAYER_ARMOR_ICON2D then return drawPlayerArmorIcon(state,r,force2D or owner==CG_PLAYER_ARMOR_ICON2D) else if owner==CG_PLAYER_ARMOR_VALUE then return drawPlayerArmorValue(state,r,scale,color,shader) else if owner==CG_PLAYER_AMMO_ICON or owner==CG_PLAYER_AMMO_ICON2D then return drawPlayerAmmoIcon(state,r,force2D or owner==CG_PLAYER_AMMO_ICON2D) else if owner==CG_PLAYER_AMMO_VALUE then return drawPlayerAmmoValue(state,r,scale,color,shader) else if owner==CG_SELECTEDPLAYER_HEAD or owner==CG_VOICE_HEAD then return drawSelectedPlayerHead(state,r,force2D,owner==CG_VOICE_HEAD) else if owner==CG_VOICE_NAME then return drawSelectedPlayerName(state,r,scale,color,true) else if owner==CG_SELECTEDPLAYER_STATUS then return drawSelectedPlayerStatus(state,r) else if owner==CG_SELECTEDPLAYER_ARMOR then return drawSelectedPlayerArmor(state,r,scale,color,shader) else if owner==CG_SELECTEDPLAYER_HEALTH then return drawSelectedPlayerHealth(state,r,scale,color,shader) else if owner==CG_SELECTEDPLAYER_NAME then return drawSelectedPlayerName(state,r,scale,color,false) else if owner==CG_SELECTEDPLAYER_LOCATION then return drawSelectedPlayerLocation(state,r,scale,color) else if owner==CG_SELECTEDPLAYER_WEAPON then return drawSelectedPlayerWeapon(state,r) else if owner==CG_SELECTEDPLAYER_POWERUP then return drawSelectedPlayerPowerup(state,r,force2D) else if owner==CG_PLAYER_HEAD then return drawPlayerHead(state,r,force2D) else if owner==CG_PLAYER_ITEM then return drawPlayerItem(state,r,scale,force2D) else if owner==CG_PLAYER_SCORE then return drawPlayerScore(state,r,scale,color,shader) else if owner==CG_PLAYER_HEALTH then return drawPlayerHealth(state,r,scale,color,shader) else if owner==CG_RED_SCORE then return drawRedScore(state,r,scale,color,shader) else if owner==CG_BLUE_SCORE then return drawBlueScore(state,r,scale,color,shader) else if owner==CG_RED_NAME then return drawRedName(state,r,scale,color) else if owner==CG_BLUE_NAME then return drawBlueName(state,r,scale,color) else if owner==CG_BLUE_FLAGHEAD then return drawBlueFlagHead(state,r) else if owner==CG_BLUE_FLAGSTATUS then return drawBlueFlagStatus(state,r,shader) else if owner==CG_BLUE_FLAGNAME then return drawBlueFlagName(state,r,scale,color) else if owner==CG_RED_FLAGHEAD then return drawRedFlagHead(state,r) else if owner==CG_RED_FLAGSTATUS then return drawRedFlagStatus(state,r,shader) else if owner==CG_RED_FLAGNAME then return drawRedFlagName(state,r,scale,color) else if owner==CG_HARVESTER_SKULLS or owner==CG_HARVESTER_SKULLS2D then return harvesterSkulls(state,r,scale,color,owner==CG_HARVESTER_SKULLS2D) else if owner==CG_ONEFLAG_STATUS then return oneFlagStatus(state,r) else if owner==CG_PLAYER_LOCATION then return drawPlayerLocation(state,r,scale,color) else if owner==CG_TEAM_COLOR then return drawTeamColor(state,r,color) else if owner==CG_CTF_POWERUP then return drawCTFPowerUp(state,r) else if owner==CG_AREA_POWERUP then return drawAreaPowerUp(state,r,align,special,scale,color) else if owner==CG_PLAYER_STATUS then return drawPlayerStatus(state,r) else if owner==CG_PLAYER_HASFLAG or owner==CG_PLAYER_HASFLAG2D then return drawPlayerHasFlag(state,r,owner==CG_PLAYER_HASFLAG2D) else if owner==CG_AREA_SYSTEMCHAT then return drawAreaSystemChat(state,r,scale,color,shader) else if owner==CG_AREA_TEAMCHAT then return drawAreaTeamChat(state,r,scale,color,shader) else if owner==CG_AREA_CHAT then return drawAreaChat(state,r,scale,color,shader) else if owner==CG_GAME_TYPE then return drawGameType(state,r,scale,color,shader) else if owner==CG_GAME_STATUS then return drawGameStatus(state,r,scale,color,shader) else if owner==CG_KILLER then return drawKiller(state,r,scale,color,shader) else if (owner>=CG_ACCURACY and owner<=CG_GAUNTLET) or owner==CG_CAPTURES then return drawMedal(state,owner,r,scale,color,shader) else if owner==CG_SPECTATORS then return drawTeamSpectators(state,r,scale,color,shader) else if owner==CG_TEAMINFO then if state.selected==len(state.sorted) then return drawNewTeamInfo(state,r,textX,textY,scale,color,shader) end if else if owner==CG_CAPFRAGLIMIT then return drawCapFragLimit(state,r,scale,color,shader) else if owner==CG_1STPLACE then return draw1stPlace(state,r,scale,color,shader) else if owner==CG_2NDPLACE then return draw2ndPlace(state,r,scale,color,shader) end if;return void
end function

/// Updates `state.cursorX`, `state.cursorY` during client game newdraw `mouseEvent`.
/// @param state Mutable client game newdraw record/storage; this routine assigns `state.cursorX`, `state.cursorY`.
/// @param x Horizontal coordinate in the coordinate space used by `mouseEvent`.
/// @param y Vertical coordinate in the coordinate space used by `mouseEvent`.
function mouseEvent(state,x,y) if (state.pmType==PM_NORMAL or state.pmType==PM_SPECTATOR) and not state.showScores then emit(state,"key-catcher",Rect(0,0,0,0),"0","","",void,0,-1);return false end if;state.cursorX=state.cursorX+x;if state.cursorX<0 then state.cursorX=0 else if state.cursorX>640 then state.cursorX=640 end if;state.cursorY=state.cursorY+y;if state.cursorY<0 then state.cursorY=0 else if state.cursorY>480 then state.cursorY=480 end if;emit(state,"mouse-move",Rect(state.cursorX,state.cursorY,x,y),"","","",void,0,-1);return true end function
/// Updates `state.menus` during client game newdraw `hideTeamMenu`.
/// @param state Mutable client game newdraw record/storage; this routine assigns `state.menus`.
function hideTeamMenu(state) state.menus=state.menus+[["close","teamMenu"],["close","getMenu"]];emit(state,"menu-close",Rect(0,0,0,0),"teamMenu,getMenu","","",void,0,-1);return void end function
/// Updates `state.menus` during client game newdraw `showTeamMenu`.
/// @param state Mutable client game newdraw record/storage; this routine assigns `state.menus`.
function showTeamMenu(state) state.menus=state.menus+[["open","teamMenu"]];emit(state,"menu-open",Rect(0,0,0,0),"teamMenu","","",void,0,-1);return void end function
/// Updates `state.eventHandling` during client game newdraw `eventHandling`.
/// @param state Mutable client game newdraw record/storage; this routine assigns `state.eventHandling`.
/// @param type Value assigned to `state.eventHandling`.
function eventHandling(state,type) state.eventHandling=type;if type==CGAME_EVENT_NONE then hideTeamMenu(state) end if;return type end function
/// Updates `state.capturedItem` during client game newdraw `keyEvent`.
/// @param state Mutable client game newdraw record/storage; this routine assigns `state.capturedItem`.
/// @param key Key or control identifier used to select the corresponding client game newdraw entry.
/// @param down Whether this event presses the key/button; false represents its release.
function keyEvent(state,key,down) if not down then return false end if;if state.pmType==PM_NORMAL or (state.pmType==PM_SPECTATOR and not state.showScores) then eventHandling(state,CGAME_EVENT_NONE);emit(state,"key-catcher",Rect(0,0,0,0),"0","","",void,0,-1);return false end if;emit(state,"key",Rect(state.cursorX,state.cursorY,0,0),str(key),"","",void,down,-1);if state.capturedItem!=void then state.capturedItem=void else if key==K_MOUSE2 then state.capturedItem="display-item" end if;return true end function
/// Calls `std.string.equalsIgnoreCaseAscii` from client game newdraw `clientNumFromName`. The final path returns `-1`.
/// @param state Record read through `state.clients`.
/// @param name Name used to select or register the corresponding client game newdraw resource.
function clientNumFromName(state,name) for id=0 to len(state.clients)-1 ci=state.clients[id];if ci.infoValid and strings.equalsIgnoreCaseAscii(ci.name,name) then return id end if end for;return -1 end function
/// Updates `state.menus`, `state.cvars`, `state.voiceTime` during client game newdraw `showResponseHead`.
/// @param state Mutable client game newdraw record/storage; this routine assigns `state.menus`, `state.cvars`, `state.voiceTime`.
function showResponseHead(state) state.menus=state.menus+[["open","voiceMenu"]];state.cvars=state.cvars+[["cl_conXOffset","72"]];state.voiceTime=state.time;emit(state,"menu-open",Rect(0,0,0,0),"voiceMenu","","",void,0,-1);return void end function
// The original body is empty. Preserve that behavior while making the host
// boundary deterministic and observable for future menu script extensions.
/// @param state Shared client game newdraw state passed to the helper calls in `runMenuScript`.
/// @param args Value used by `emit(state,"menu-script",Rect(0,0,0,0),args,"","",void,0,-1)`.
function runMenuScript(state,args) emit(state,"menu-script",Rect(0,0,0,0),args,"","",void,0,-1);return false end function
/// Evaluates client game newdraw `getTeamColor` and returns `[1.0,0.0,0.0,0.25]`, `[0.0,0.0,1.0,0.25]`, `[0.0,0.17,0.0,0.25]` according to its guard/selection conditions.
/// @param state Record read through `state.team`.
function getTeamColor(state) if state.team==TEAM_RED then return [1.0,0.0,0.0,0.25] else if state.team==TEAM_BLUE then return [0.0,0.0,1.0,0.25] end if;return [0.0,0.17,0.0,0.25] end function
