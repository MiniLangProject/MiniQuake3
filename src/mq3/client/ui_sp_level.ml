// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native state machine for code/q3_ui/ui_splevel.c.
package mq3.client.ui_sp_level

import mq3.client.ui_gameinfo as game
import mq3.shared.info as info
import mq3.compat.textnumbers as numbers
import mq3.compat.numeric as numeric
import mq3.compat.transcendental as trans
import std.string as strings

/// Number of arenas grouped into one single-player progression tier.
const ARENAS_PER_TIER=4
/// Activation callback event accepted by the single-player arena selection menu before it processes the
/// selected control action.
const QM_ACTIVATED=3
/// Menu control identifier routed to the leftarrow action by the menu event handler.
const ID_LEFTARROW=10
/// Menu control identifier routed to the picture0 action by the menu event handler.
const ID_PICTURE0=11
/// Menu control identifier routed to the rightarrow action by the menu event handler.
const ID_RIGHTARROW=15
/// Menu control identifier routed to the playerpic action by the menu event handler.
const ID_PLAYERPIC=16
/// Menu control identifier routed to the award1 action by the menu event handler.
const ID_AWARD1=17
/// Native Back-control identifier exposed by single-player arena selection for returning to the
/// previous menu.
const ID_BACK=23
/// Menu control identifier routed to the reset action by the menu event handler.
const ID_RESET=24
/// Menu control identifier routed to the custom action by the menu event handler.
const ID_CUSTOM=25
/// Menu control identifier routed to the next action by the menu event handler.
const ID_NEXT=26
/// UI keyboard-capture mask used when returning keyboard focus to single-player arena selection.
const KEYCATCH_UI=2
/// Postgame award identifier selecting the frags award category.
const AWARD_FRAGS=4
/// Virtual shader or image asset name used for the menu's levelframe focus artwork.
const ART_LEVELFRAME_FOCUS="menu/art/maps_select"
/// Virtual shader or image asset name used for the menu's levelframe selected artwork.
const ART_LEVELFRAME_SELECTED="menu/art/maps_selected"
/// Virtual shader or image asset name used for the menu's arrow artwork.
const ART_ARROW="menu/art/narrow_0"
/// Virtual shader or image asset name used for the menu's arrow focus artwork.
const ART_ARROW_FOCUS="menu/art/narrow_1"
/// Virtual shader or image asset name used for the menu's map unknown artwork.
const ART_MAP_UNKNOWN="menu/art/unknownmap"

/// Stores UI sp level map slot record, including `active`, `grayed`, `x`, `y`, `map`, `longname` and additional values.
struct MapSlot
  /// When constructing this record, `emptyMap` supplies `false` for this member.
  active
  /// When constructing this record, `emptyMap` supplies `false` for this member.
  grayed
  /// Horizontal coordinate of an arena levelshot tile in the single-player selection layout.
  x
  /// Vertical coordinate of an arena levelshot tile in the single-player selection layout.
  y
  /// When constructing this record, `emptyMap` supplies an empty string for this member.
  map
  /// When constructing this record, `emptyMap` supplies an empty string for this member.
  longname
  /// When constructing this record, `emptyMap` supplies an empty string for this member.
  picture
  /// Best recorded finishing place for this arena; first place enables its completion artwork and zero
  /// means no result.
  score
  /// When constructing this record, `emptyMap` supplies `0` for this member.
  skill
end struct
/// Stores UI sp level bot record, including `name`, `picture`.
struct Bot
  /// Opponent name shown in the selected single-player arena's bot lineup.
  name
  /// When constructing this record, `setBots` supplies `picture` for this member.
  picture
end struct
/// Stores UI sp level queued engine action, including `boundary`, `kind`, `x`, `y`, `w`, `h` and additional values.
struct Action
  /// Host service category recorded with a request emitted while selecting an unlocked arena and
  /// presenting its bots and best result.
  boundary
  /// Operation selector telling the host how to interpret a request emitted while selecting an unlocked
  /// arena and presenting its bots and best result.
  kind
  /// Horizontal position of this queued drawing operation in the virtual layout used by the
  /// single-player arena selection menu.
  x
  /// Vertical position of this queued drawing operation in the virtual layout used by the single-player
  /// arena selection menu.
  y
  /// Width of the rectangular display region.
  w
  /// Height of the rectangular display region.
  h
  /// Arena-selection text payload, including labels, confirmation prompts, menu targets, or serialized
  /// cvar assignments.
  text
  /// When constructing this record, `emit` supplies `asset` for this member.
  asset
  /// Value payload supplied to the selected host operation while selecting an unlocked arena and
  /// presenting its bots and best result.
  value
  /// True when this request is marked for native dispatch while selecting an unlocked arena and
  /// presenting its bots and best result; false when its native effect is suppressed.
  dispatched
end struct
/// Stores UI sp level state, including `data`, `selectedArenaSet`, `selectedArena`, `currentSet`, `currentGame`, `trainingTier` and additional values.
struct State
  /// When constructing this record, `create` supplies `data` for this member. Used by `cvar` and
  /// `setCvar` during subsequent processing.
  data
  /// When constructing this record, `create` supplies `0` for this member. Used by `setBots` and
  /// `setMenuArena` during subsequent processing.
  selectedArenaSet
  /// When constructing this record, `create` supplies `0` for this member. Used by `setMenuItems` and
  /// `levelEvent` during subsequent processing.
  selectedArena
  /// When constructing this record, `create` supplies `0` for this member. Used by `setBots` and
  /// `setMenuArena` during subsequent processing.
  currentSet
  /// When constructing this record, `create` supplies `0` for this member. Used by `init` and
  /// `spLevelMenu` during subsequent processing.
  currentGame
  /// When constructing this record, `create` supplies `-1` for this member. Used by `setMenuItems` and
  /// `levelEvent` during subsequent processing.
  trainingTier
  /// When constructing this record, `create` supplies `0` for this member. Used by `setMenuItems` and
  /// `levelEvent` during subsequent processing.
  finalTier
  /// When constructing this record, `create` supplies `0` for this member. Used by `leftArrowEvent` and
  /// `spLevelMenu` during subsequent processing.
  minTier
  /// When constructing this record, `create` supplies `0` for this member. Used by `rightArrowEvent`
  /// and `spLevelMenu` during subsequent processing.
  maxTier
  /// When constructing this record, `create` supplies an empty string for this member. Used by
  /// `setBots` and `setMenuItems` during subsequent processing.
  selectedArenaInfo
  /// When constructing this record, `create` supplies `0` for this member. Used by `setMenuItems` and
  /// `menuDraw` during subsequent processing.
  numMaps
  /// When constructing this record, `create` supplies
  /// `[emptyMap(46),emptyMap(186),emptyMap(326),emptyMap(466)]` for this member. Used by `setMenuArena`
  /// and `clearExtraMaps` during subsequent processing.
  maps
  /// When constructing this record, `create` supplies an empty list for this member. Used by `setBots`
  /// and `menuDraw` during subsequent processing.
  bots
  /// Model resource selected for the player presentation.
  playerModel
  /// When constructing this record, `create` supplies an empty string for this member. Used by
  /// `menuDraw` and `init` during subsequent processing.
  playerPic
  /// When constructing this record, `create` supplies `[0,0,0,0,0,0]` for this member. Used by
  /// `menuDraw` and `init` during subsequent processing.
  awardLevels
  /// Sound resources selected for the award event or effect.
  awardSounds
  /// When constructing this record, `create` supplies `false` for this member. Used by `menuDraw` and
  /// `init` during subsequent processing.
  reinit
  /// True once the module's required media has been cached or registered.
  cached
  /// When constructing this record, `create` supplies an empty list for this member. Used by `cache`
  /// during subsequent processing.
  cacheAssets
  /// Host requests queued while selecting an unlocked arena and presenting its bots and best result,
  /// retained in request order.
  actions
  /// Configuration-variable values exposed to the native UI implementation.
  cvars
  /// Menu-stack and selection events queued for the host adapter.
  menuEvents
  /// True when the retail QVM owns the single-player arena selection menu, so the native observer
  /// records requests without emitting duplicate host effects.
  retailActive
  /// UI timestamp in milliseconds used to pulse and animate the single-player arena selection.
  realtime
  /// When constructing this record, `create` supplies `ID_NEXT` for this member. Used by `spLevelMenu`
  /// during subsequent processing.
  cursor
  /// When constructing this record, `create` supplies an empty string for this member. Used by
  /// `menuDraw` during subsequent processing.
  playerName
  /// Records that the single-player arena selection menu has been opened on the active menu stack.
  pushed
  /// Input-capture bitmask selecting which client subsystem currently receives key events.
  keyCatcher
end struct

/// Creates a `mq3.client.ui_sp_level.MapSlot` record. Assigns `x` from `x`.
/// @param x Value used to initialize `MapSlot.x`.
function emptyMap(x) return MapSlot(false,false,x,64,"","","",0,0) end function
/// Creates a `mq3.client.ui_sp_level.State` record. Assigns `data` from `data`, `retailActive` from `retailActive`.
/// @param data Value used to initialize `State.data`.
/// @param retailActive Value used to initialize `State.retailActive`.
function create(data,retailActive)
  return State(data,0,0,0,0,-1,0,0,0,"",0,[emptyMap(46),emptyMap(186),emptyMap(326),emptyMap(466)],[],"","",[0,0,0,0,0,0],awardSounds(),false,false,[],[],[],[],retailActive,0,ID_NEXT,"",false,0)
end function
/// Appends a UI sp level action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.
/// @param state Mutable UI sp level record/storage; this routine assigns `state.actions`.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param x Horizontal coordinate in the coordinate space used by `emit`.
/// @param y Vertical coordinate in the coordinate space used by `emit`.
/// @param w Width in the coordinate space used by `emit`.
/// @param h Height in the coordinate space used by `emit`.
/// @param text Text consumed or emitted by `emit` in the UI sp level path.
/// @param asset Value used by `a=Action("ui-sp-level",kind,x,y,w,h,text,asset,value,dispatched)`.
/// @param value Value used by `a=Action("ui-sp-level",kind,x,y,w,h,text,asset,value,dispatched)`.
function emit(state,kind,x,y,w,h,text,asset,value) dispatched=not state.retailActive;a=Action("ui-sp-level",kind,x,y,w,h,text,asset,value,dispatched);state.actions=state.actions+[a];return a end function
/// Calls `mq3.client.ui_gameinfo.cvar` from UI sp level `cvar`. The final path returns `""`.
/// @param state Record read through `state.data`, `state.cvars`.
/// @param name Name used to select or register the corresponding UI sp level resource.
function cvar(state,name) if state.data!=void then return game.cvar(state.data,name) end if;for each pair in state.cvars if pair[0]==name then return pair[1] end if end for;return "" end function
/// Updates `state.cvars` during UI sp level `setCvar`.
/// @param state Mutable UI sp level record/storage; this routine assigns `state.cvars`.
/// @param name Name used to select or register the corresponding UI sp level resource.
/// @param value Value used by `state.cvars=next+[[name,str(value)]]`.
function setCvar(state,name,value) next=[];for each pair in state.cvars if pair[0]!=name then next=next+[pair] end if end for;state.cvars=next+[[name,str(value)]];if state.data!=void then game.setCvar(state.data,name,str(value)) end if;emit(state,"cvar",0,0,0,0,name+"="+str(value),"",0);return void end function
/// Lists the 6 UI sp level award pics strings in their declared order, beginning with `"menu/medals/medal_accuracy"`, `"menu/medals/medal_impressive"`, `"menu/medals/medal_excellent"`.
function awardPics() return ["menu/medals/medal_accuracy","menu/medals/medal_impressive","menu/medals/medal_excellent","menu/medals/medal_gauntlet","menu/medals/medal_frags","menu/medals/medal_victory"] end function
/// Lists the 6 UI sp level award sounds strings in their declared order, beginning with `"sound/feedback/accuracy.wav"`, `"sound/feedback/impressive_a.wav"`, `"sound/feedback/excellent_a.wav"`.
function awardSounds() return ["sound/feedback/accuracy.wav","sound/feedback/impressive_a.wav","sound/feedback/excellent_a.wav","sound/feedback/gauntlet.wav","sound/feedback/frags.wav","sound/feedback/perfect.wav"] end function
/// Compares two UI sp level names using ASCII case-insensitive equality.
/// @param a Argument 1 of `std.string.equalsIgnoreCaseAscii`.
/// @param b Argument 2 of `std.string.equalsIgnoreCaseAscii`.
function same(a,b) return strings.equalsIgnoreCaseAscii(a,b) end function
/// Calls `mq3.client.ui_sp_level.same`, `std.string.substr` from UI sp level `hasAsset`.
/// @param assets Value used by `if assets==void then return true end if`.
/// @param name Name whose length/content is inspected by `hasAsset`.
function hasAsset(assets,name)
  if assets==void then return true end if;stem=name;if len(name)>4 and same(strings.substr(name,len(name)-4,4),".tga") then stem=strings.substr(name,0,len(name)-4) end if
  for each value in assets if same(value,name) or same(value,stem+".jpg") or same(value,stem+".jpeg") then return true end if end for;return false
end function
/// Evaluates UI sp level `clean` and returns `result` according to its guard/selection conditions.
/// @param value Sequence read at `value[at]`, `value[at+1]`.
function clean(value) result="";at=0;while at<len(value) if at+1<len(value) and value[at]=="^" and value[at+1]!="^" then at=at+2 else result=result+value[at];at=at+1 end if end while;return result end function
/// Calls `std.string.substr` from UI sp level `truncate`. The final path returns `strings.substr(value,0,count)`.
/// @param value Sequence whose length/content is inspected by `truncate`.
/// @param count Value tested by `len(value)<=count` before the calculation continues.
function truncate(value,count) if len(value)<=count then return value end if;return strings.substr(value,0,count) end function

// PlayerIcon
/// @param modelAndSkin Sequence whose length/content is inspected by `playerIcon`.
/// @param availableAssets Asset names/resources available for model or menu selection.
function playerIcon(modelAndSkin,availableAssets)
  slash=strings.lastIndexOf(modelAndSkin,"/");model=modelAndSkin;skin="default";if slash>=0 then model=strings.substr(modelAndSkin,0,slash);skin=strings.substr(modelAndSkin,slash+1,len(modelAndSkin)-slash-1) end if
  name="models/players/"+model+"/icon_"+skin+".tga";if not hasAsset(availableAssets,name) and not same(skin,"default") then name="models/players/"+model+"/icon_default.tga" end if;return name
end function
// PlayerIconHandle is a typed registration boundary in the native host.
/// @param state Shared UI sp level state passed to the helper calls in `playerIconHandle`.
/// @param modelAndSkin Value used by `name=playerIcon(modelAndSkin,availableAssets)`.
/// @param availableAssets Asset names/resources available for model or menu selection.
function playerIconHandle(state,modelAndSkin,availableAssets) name=playerIcon(modelAndSkin,availableAssets);emit(state,"register-shader",0,0,0,0,"",name,0);return name end function

// UI_SPLevelMenu_SetBots
/// @param state Mutable UI sp level record/storage; this routine assigns `state.bots`.
/// @param availableAssets Asset names/resources available for model or menu selection.
function setBots(state,availableAssets)
  state.bots=[];if state.selectedArenaSet>state.currentSet or state.selectedArenaInfo==void or state.selectedArenaInfo=="" then return 0 end if
  raw=strings.split(info.value(state.selectedArenaInfo,"bots")," ")
  for each name in raw if name!="" and len(state.bots)<7 then botInfo=game.UI_GetBotInfoByName(state.data,name);picture="";label=name;if botInfo!=void then picture=playerIconHandle(state,info.value(botInfo,"model"),availableAssets);label=info.value(botInfo,"name") end if;state.bots=state.bots+[Bot(truncate(clean(label),9),picture)] end if end for;return len(state.bots)
end function

// UI_SPLevelMenu_SetMenuArena
/// @param state Record read through `state.data`, `state.maps`, `state.selectedArenaSet`, `state.currentSet`.
/// @param n Value used by `slot=state.maps[n]`.
/// @param level Value used by `best=game.UI_GetBestScore(state.data,level)`.
/// @param arenaInfo Value used by `map=info.value(arenaInfo,"map")`.
/// @param availableAssets Asset names/resources available for model or menu selection.
function setMenuArena(state,n,level,arenaInfo,availableAssets)
  map=info.value(arenaInfo,"map");best=game.UI_GetBestScore(state.data,level);score=best.score;if score>8 then score=8 end if;picture="levelshots/"+map+".tga";if not hasAsset(availableAssets,picture) then picture=ART_MAP_UNKNOWN end if
  slot=state.maps[n];slot.active=true;slot.grayed=state.selectedArenaSet>state.currentSet;slot.map=strings.toUpperAscii(map);slot.longname=info.value(arenaInfo,"longname");slot.picture=picture;slot.score=score;slot.skill=best.skill;return slot
end function
/// Updates `state.maps[i].active`, `state.maps[i].picture` during UI sp level `clearExtraMaps`.
/// @param state Mutable UI sp level record/storage; this routine assigns `state.maps[i].active`, `state.maps[i].picture`.
/// @param first Value used by `for i=first to 3 state.maps[i].active=false`.
function clearExtraMaps(state,first) for i=first to 3 state.maps[i].active=false;state.maps[i].picture="" end for;return void end function
// UI_SPLevelMenu_SetMenuItems
/// @param state Mutable UI sp level record/storage; this routine assigns `state.selectedArena`, `state.maps[0].x`, `state.selectedArenaInfo`, `state.numMaps`.
/// @param availableAssets Asset names/resources available for model or menu selection.
function setMenuItems(state,availableAssets)
  if state.selectedArenaSet>state.currentSet then state.selectedArena=-1 else if state.selectedArena==-1 then state.selectedArena=0 end if;if state.selectedArenaSet==state.trainingTier or state.selectedArenaSet==state.finalTier then state.selectedArena=0 end if
  if state.selectedArena!=-1 then setCvar(state,"ui_spSelection",state.selectedArenaSet*ARENAS_PER_TIER+state.selectedArena) end if
  if state.selectedArenaSet==state.trainingTier then arena=game.UI_GetSpecialArenaInfo(state.data,"training");level=numbers.atoi(info.value(arena,"num"));state.maps[0].x=256;setMenuArena(state,0,level,arena,availableAssets);state.selectedArenaInfo=arena;state.numMaps=1;clearExtraMaps(state,1)
  else if state.selectedArenaSet==state.finalTier then arena=game.UI_GetSpecialArenaInfo(state.data,"final");level=numbers.atoi(info.value(arena,"num"));state.maps[0].x=256;setMenuArena(state,0,level,arena,availableAssets);state.selectedArenaInfo=arena;state.numMaps=1;clearExtraMaps(state,1)
  else state.maps[0].x=46;state.numMaps=4;for n=0 to 3 level=state.selectedArenaSet*ARENAS_PER_TIER+n;arena=game.UI_GetArenaInfoByNumber(state.data,level);setMenuArena(state,n,level,arena,availableAssets) end for;if state.selectedArena!=-1 then state.selectedArenaInfo=game.UI_GetArenaInfoByNumber(state.data,state.selectedArenaSet*ARENAS_PER_TIER+state.selectedArena) end if end if
  setBots(state,availableAssets);return state.numMaps
end function

/// Calls `mq3.client.ui_sp_level.emit` from UI sp level `resetDraw`. The final path returns `lines`.
/// @param state Shared UI sp level state passed to the helper calls in `resetDraw`.
function resetDraw(state) lines=["WARNING: This resets all of the","single player game variables.","Do this only if you want to","start over from the beginning."];for i=0 to 3 emit(state,"text",320,356+27*i,0,0,lines[i],"yellow",0) end for;return lines end function
/// Updates `state.menuEvents` during UI sp level `resetAction`.
/// @param state Mutable UI sp level record/storage; this routine assigns `state.menuEvents`.
/// @param result Value used by `if not result then return false end if`.
/// @param availableAssets Asset names/resources available for model or menu selection.
function resetAction(state,result,availableAssets) if not result then return false end if;game.UI_NewGame(state.data);setCvar(state,"ui_spSelection",-4);state.menuEvents=state.menuEvents+[["pop"],["open-level"]];spLevelMenu(state,availableAssets);return true end function
/// Updates `state.menuEvents` during UI sp level `resetEvent`.
/// @param state Mutable UI sp level record/storage; this routine assigns `state.menuEvents`.
/// @param event Event identifier compared with the supported activation/input events.
/// @param availableAssets Accepted for compatibility with `resetEvent`; the current implementation does not read it.
function resetEvent(state,event,availableAssets) if event!=QM_ACTIVATED then return false end if;state.menuEvents=state.menuEvents+[["confirm","RESET GAME?"]];emit(state,"confirm",320,240,0,0,"RESET GAME?","",0);return true end function
/// Updates `state.selectedArena`, `state.selectedArenaInfo` during UI sp level `levelEvent`.
/// @param state Mutable UI sp level record/storage; this routine assigns `state.selectedArena`, `state.selectedArenaInfo`.
/// @param id Value assigned to `state.selectedArena`.
/// @param event Event identifier compared with the supported activation/input events.
/// @param availableAssets Asset names/resources available for model or menu selection.
function levelEvent(state,id,event,availableAssets) if event!=QM_ACTIVATED or state.selectedArenaSet==state.trainingTier or state.selectedArenaSet==state.finalTier then return false end if;state.selectedArena=id-ID_PICTURE0;state.selectedArenaInfo=game.UI_GetArenaInfoByNumber(state.data,state.selectedArenaSet*ARENAS_PER_TIER+state.selectedArena);setBots(state,availableAssets);setCvar(state,"ui_spSelection",state.selectedArenaSet*ARENAS_PER_TIER+state.selectedArena);return true end function
/// Updates `state.selectedArenaSet` during UI sp level `leftArrowEvent`.
/// @param state Mutable UI sp level record/storage; this routine assigns `state.selectedArenaSet`.
/// @param event Event identifier compared with the supported activation/input events.
/// @param availableAssets Asset names/resources available for model or menu selection.
function leftArrowEvent(state,event,availableAssets) if event!=QM_ACTIVATED or state.selectedArenaSet==state.minTier then return false end if;state.selectedArenaSet=state.selectedArenaSet-1;setMenuItems(state,availableAssets);return true end function
/// Updates `state.selectedArenaSet` during UI sp level `rightArrowEvent`.
/// @param state Mutable UI sp level record/storage; this routine assigns `state.selectedArenaSet`.
/// @param event Event identifier compared with the supported activation/input events.
/// @param availableAssets Asset names/resources available for model or menu selection.
function rightArrowEvent(state,event,availableAssets) if event!=QM_ACTIVATED or state.selectedArenaSet==state.maxTier then return false end if;state.selectedArenaSet=state.selectedArenaSet+1;setMenuItems(state,availableAssets);return true end function
/// Updates `state.menuEvents` during UI sp level `playerEvent`.
/// @param state Mutable UI sp level record/storage; this routine assigns `state.menuEvents`.
/// @param event Event identifier compared with the supported activation/input events.
function playerEvent(state,event) if event!=QM_ACTIVATED then return false end if;state.menuEvents=state.menuEvents+[["player-settings"]];emit(state,"menu",0,0,0,0,"player-settings","",0);return true end function
/// Calls `mq3.client.ui_sp_level.emit` from UI sp level `awardEvent`.
/// @param state Record read through `state.awardSounds`.
/// @param id Value used by `n=id-ID_AWARD1`.
/// @param event Event identifier compared with the supported activation/input events.
function awardEvent(state,id,event) if event!=QM_ACTIVATED then return false end if;n=id-ID_AWARD1;if n<0 or n>=6 then return false end if;emit(state,"sound",0,0,0,0,"",state.awardSounds[n],n);return true end function
/// Updates `state.selectedArena`, `state.menuEvents` during UI sp level `nextEvent`.
/// @param state Mutable UI sp level record/storage; this routine assigns `state.selectedArena`, `state.menuEvents`.
/// @param event Event identifier compared with the supported activation/input events.
function nextEvent(state,event) if event!=QM_ACTIVATED or state.selectedArenaSet>state.currentSet then return false end if;if state.selectedArena==-1 then state.selectedArena=0 end if;state.menuEvents=state.menuEvents+[["skill",state.selectedArenaInfo]];emit(state,"menu",0,0,0,0,"skill","",state.selectedArena);return true end function
/// Updates `state.selectedArena`, `state.menuEvents` during UI sp level `backEvent`.
/// @param state Mutable UI sp level record/storage; this routine assigns `state.selectedArena`, `state.menuEvents`.
/// @param event Event identifier compared with the supported activation/input events.
function backEvent(state,event) if event!=QM_ACTIVATED then return false end if;if state.selectedArena==-1 then state.selectedArena=0 end if;state.menuEvents=state.menuEvents+[["pop"]];emit(state,"menu-pop",0,0,0,0,"","",0);return true end function
/// Updates `state.menuEvents` during UI sp level `customEvent`.
/// @param state Mutable UI sp level record/storage; this routine assigns `state.menuEvents`.
/// @param event Event identifier compared with the supported activation/input events.
function customEvent(state,event) if event!=QM_ACTIVATED then return false end if;state.menuEvents=state.menuEvents+[["start-server",false]];emit(state,"menu",0,0,0,0,"start-server","",0);return true end function

/// Calls `mq3.compat.numeric.trunc32` from UI sp level `awardLabel`. The final path returns `str(value)`.
/// @param value Value tested by `value>=1000000`, `value>=1000` before the calculation continues.
function awardLabel(value) if value>=1000000 then return str(numeric.trunc32(value/1000000))+"m" else if value>=1000 then return str(numeric.trunc32(value/1000))+"k" end if;return str(value) end function
// UI_SPLevelMenu_MenuDraw
/// @param state Mutable UI sp level record/storage; this routine assigns `state.menuEvents`, `state.reinit`, `state.playerName`, `state.playerModel` and additional values.
/// @param availableAssets Asset names/resources available for model or menu selection.
function menuDraw(state,availableAssets)
  if state.reinit then state.menuEvents=state.menuEvents+[["pop"],["open-level"]];state.reinit=false;spLevelMenu(state,availableAssets);return "reinit" end if
  state.playerName=clean(cvar(state,"name"));emit(state,"text",320,314,0,0,state.playerName,"orange",0);model=cvar(state,"model");if not same(model,state.playerModel) then state.playerModel=model;state.playerPic=playerIconHandle(state,model,availableAssets) end if;emit(state,"menu-draw",0,0,640,480,"CHOOSE LEVEL","",0)
  shown=0;for n=0 to 5 level=state.awardLevels[n];if level>0 then shown=shown+1;if level!=1 then emit(state,"text",0,388,0,0,awardLabel(level),"yellow",n) end if end if end for;emit(state,"text",18,38,0,0,"Tier "+str(state.selectedArenaSet+1),"orange",0)
  if state.selectedArenaSet>state.currentSet then emit(state,"text",320,216,0,0,"ACCESS DENIED","red",0);return "denied" end if
  pulse=0.5+0.5*trans.sin(state.realtime/75.0);for n=0 to state.numMaps-1 slot=state.maps[n];emit(state,"pic",slot.x,slot.y,128,96,"",slot.picture,n);emit(state,"text",slot.x+64,slot.y+96,0,0,slot.map,"orange",0);if slot.score==1 and slot.skill>=1 and slot.skill<=5 then emit(state,"pic",slot.x,slot.y,128,96,"","menu/art/level_complete"+str(slot.skill),slot.skill) end if;if n==state.selectedArena then emit(state,"selection",slot.x-1,slot.y-1,130,116,"",ART_LEVELFRAME_SELECTED,pulse) end if end for
  if state.selectedArenaInfo!="" then map=strings.toUpperAscii(truncate(info.value(state.selectedArenaInfo,"map"),19));emit(state,"text",320,192,0,0,map+": "+info.value(state.selectedArenaInfo,"longname"),"orange",0) end if
  pad=numeric.trunc32((7-len(state.bots))*(64+26)/2);for n=0 to len(state.bots)-1 bot=state.bots[n];x=18+pad+(64+26)*n;if bot.picture!="" then emit(state,"pic",x,216,64,64,"",bot.picture,n) else emit(state,"unknown-bot",x,216,64,64,"?","black",n) end if;emit(state,"text",x,280,0,0,bot.name,"orange",n) end for;return "drawn"
end function

// UI_SPLevelMenu_Cache
/// @param state Mutable UI sp level record/storage; this routine assigns `state.cacheAssets`, `state.cached`.
function cache(state)
  assets=[ART_LEVELFRAME_FOCUS,ART_LEVELFRAME_SELECTED,ART_ARROW,ART_ARROW_FOCUS,ART_MAP_UNKNOWN,"menu/art/level_complete1","menu/art/level_complete2","menu/art/level_complete3","menu/art/level_complete4","menu/art/level_complete5","menu/art/back_0","menu/art/back_1","menu/art/fight_0","menu/art/fight_1","menu/art/reset_0","menu/art/reset_1","menu/art/skirmish_0","menu/art/skirmish_1"]+awardPics();state.cacheAssets=assets;for each name in assets emit(state,"register-shader",0,0,0,0,"",name,0) end for;for each sound in state.awardSounds emit(state,"register-sound",0,0,0,0,"",sound,0) end for
  // The original stores seven renderer handles after the precache pass.  Keep
  // those registrations visible because renderer implementations may assign
  // handles lazily even when a name was registered earlier in this function.
  handles=[ART_LEVELFRAME_SELECTED,ART_LEVELFRAME_FOCUS,"menu/art/level_complete1","menu/art/level_complete2","menu/art/level_complete3","menu/art/level_complete4","menu/art/level_complete5"];for each name in handles emit(state,"register-shader",0,0,0,0,"",name,0) end for;state.cached=true;return len(assets)+len(state.awardSounds)+len(handles)
end function
// UI_SPLevelMenu_Init
/// @param state Mutable UI sp level record/storage; this routine assigns `state.actions`, `state.maps`, `state.bots`, `state.reinit` and additional values.
/// @param availableAssets Asset names/resources available for model or menu selection.
function init(state,availableAssets)
  skill=numbers.atoi(cvar(state,"g_spSkill"));if skill<1 or skill>5 then setCvar(state,"g_spSkill",2) end if;state.actions=[];state.maps=[emptyMap(46),emptyMap(186),emptyMap(326),emptyMap(466)];state.bots=[];state.reinit=false;cache(state);state.playerModel=cvar(state,"model");state.playerPic=playerIconHandle(state,state.playerModel,availableAssets)
  for n=0 to 5 state.awardLevels[n]=game.UI_GetAwardLevel(state.data,n) end for;state.awardLevels[AWARD_FRAGS]=100*numeric.trunc32(state.awardLevels[AWARD_FRAGS]/100)
  selection=cvar(state,"ui_spSelection");if selection!="" then value=numbers.atoi(selection);state.selectedArenaSet=numeric.trunc32(value/ARENAS_PER_TIER);state.selectedArena=value%ARENAS_PER_TIER else state.selectedArenaSet=state.currentSet;state.selectedArena=state.currentGame end if;setMenuItems(state,availableAssets);return state
end function
// UI_SPLevelMenu
/// @param state Mutable UI sp level record/storage; this routine assigns `state.trainingTier`, `state.minTier`, `state.finalTier`, `state.maxTier` and additional values.
/// @param availableAssets Asset names/resources available for model or menu selection.
function spLevelMenu(state,availableAssets)
  state.trainingTier=-1;trainingLevel=-2;training=game.UI_GetSpecialArenaInfo(state.data,"training");if training!=void then state.minTier=-1;trainingLevel=numbers.atoi(info.value(training,"num")) else state.minTier=0 end if;state.finalTier=game.UI_GetNumSPTiers(state.data);finalArena=game.UI_GetSpecialArenaInfo(state.data,"final");if finalArena!=void then state.maxTier=state.finalTier else state.maxTier=state.finalTier-1;if state.maxTier<state.minTier then state.maxTier=state.minTier end if end if
  level=game.UI_GetCurrentGame(state.data);if level==-1 then level=game.UI_GetNumSPArenas(state.data)-1;if state.maxTier==state.finalTier then level=level+1 end if end if;if level==trainingLevel then state.currentSet=-1;state.currentGame=0 else state.currentSet=numeric.trunc32(level/ARENAS_PER_TIER);state.currentGame=level%ARENAS_PER_TIER end if;init(state,availableAssets);state.pushed=true;state.cursor=ID_NEXT;state.menuEvents=state.menuEvents+[["push"],["cursor",ID_NEXT]];return state
end function
/// Updates `state.keyCatcher`, `state.menuEvents` during UI sp level `spLevelMenuF`.
/// @param state Mutable UI sp level record/storage; this routine assigns `state.keyCatcher`, `state.menuEvents`.
/// @param availableAssets Asset names/resources available for model or menu selection.
function spLevelMenuF(state,availableAssets) state.keyCatcher=KEYCATCH_UI;state.menuEvents=[];emit(state,"key-catcher",0,0,0,0,"","",KEYCATCH_UI);return spLevelMenu(state,availableAssets) end function
/// Updates `state.reinit` during UI sp level `reInit`.
/// @param state Mutable UI sp level record/storage; this routine assigns `state.reinit`.
function reInit(state) state.reinit=true;return void end function
