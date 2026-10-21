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

const ARENAS_PER_TIER=4
const QM_ACTIVATED=3
const ID_LEFTARROW=10
const ID_PICTURE0=11
const ID_RIGHTARROW=15
const ID_PLAYERPIC=16
const ID_AWARD1=17
const ID_BACK=23
const ID_RESET=24
const ID_CUSTOM=25
const ID_NEXT=26
const KEYCATCH_UI=2
const AWARD_FRAGS=4
const ART_LEVELFRAME_FOCUS="menu/art/maps_select"
const ART_LEVELFRAME_SELECTED="menu/art/maps_selected"
const ART_ARROW="menu/art/narrow_0"
const ART_ARROW_FOCUS="menu/art/narrow_1"
const ART_MAP_UNKNOWN="menu/art/unknownmap"

struct MapSlot active grayed x y map longname picture score skill end struct
struct Bot name picture end struct
struct Action boundary kind x y w h text asset value dispatched end struct
struct State data selectedArenaSet selectedArena currentSet currentGame trainingTier finalTier minTier maxTier selectedArenaInfo numMaps maps bots playerModel playerPic awardLevels awardSounds reinit cached cacheAssets actions cvars menuEvents retailActive realtime cursor playerName pushed keyCatcher end struct

function emptyMap(x) return MapSlot(false,false,x,64,"","","",0,0) end function
function create(data,retailActive)
  return State(data,0,0,0,0,-1,0,0,0,"",0,[emptyMap(46),emptyMap(186),emptyMap(326),emptyMap(466)],[],"","",[0,0,0,0,0,0],awardSounds(),false,false,[],[],[],[],retailActive,0,ID_NEXT,"",false,0)
end function
function emit(state,kind,x,y,w,h,text,asset,value) dispatched=not state.retailActive;a=Action("ui-sp-level",kind,x,y,w,h,text,asset,value,dispatched);state.actions=state.actions+[a];return a end function
function cvar(state,name) if state.data!=void then return game.cvar(state.data,name) end if;for each pair in state.cvars if pair[0]==name then return pair[1] end if end for;return "" end function
function setCvar(state,name,value) next=[];for each pair in state.cvars if pair[0]!=name then next=next+[pair] end if end for;state.cvars=next+[[name,str(value)]];if state.data!=void then game.setCvar(state.data,name,str(value)) end if;emit(state,"cvar",0,0,0,0,name+"="+str(value),"",0);return void end function
function awardPics() return ["menu/medals/medal_accuracy","menu/medals/medal_impressive","menu/medals/medal_excellent","menu/medals/medal_gauntlet","menu/medals/medal_frags","menu/medals/medal_victory"] end function
function awardSounds() return ["sound/feedback/accuracy.wav","sound/feedback/impressive_a.wav","sound/feedback/excellent_a.wav","sound/feedback/gauntlet.wav","sound/feedback/frags.wav","sound/feedback/perfect.wav"] end function
function same(a,b) return strings.equalsIgnoreCaseAscii(a,b) end function
function hasAsset(assets,name)
  if assets==void then return true end if;stem=name;if len(name)>4 and same(strings.substr(name,len(name)-4,4),".tga") then stem=strings.substr(name,0,len(name)-4) end if
  for each value in assets if same(value,name) or same(value,stem+".jpg") or same(value,stem+".jpeg") then return true end if end for;return false
end function
function clean(value) result="";at=0;while at<len(value) if at+1<len(value) and value[at]=="^" and value[at+1]!="^" then at=at+2 else result=result+value[at];at=at+1 end if end while;return result end function
function truncate(value,count) if len(value)<=count then return value end if;return strings.substr(value,0,count) end function

// PlayerIcon
function playerIcon(modelAndSkin,availableAssets)
  slash=strings.lastIndexOf(modelAndSkin,"/");model=modelAndSkin;skin="default";if slash>=0 then model=strings.substr(modelAndSkin,0,slash);skin=strings.substr(modelAndSkin,slash+1,len(modelAndSkin)-slash-1) end if
  name="models/players/"+model+"/icon_"+skin+".tga";if not hasAsset(availableAssets,name) and not same(skin,"default") then name="models/players/"+model+"/icon_default.tga" end if;return name
end function
// PlayerIconHandle is a typed registration boundary in the native host.
function playerIconHandle(state,modelAndSkin,availableAssets) name=playerIcon(modelAndSkin,availableAssets);emit(state,"register-shader",0,0,0,0,"",name,0);return name end function

// UI_SPLevelMenu_SetBots
function setBots(state,availableAssets)
  state.bots=[];if state.selectedArenaSet>state.currentSet or state.selectedArenaInfo==void or state.selectedArenaInfo=="" then return 0 end if
  raw=strings.split(info.value(state.selectedArenaInfo,"bots")," ")
  for each name in raw if name!="" and len(state.bots)<7 then botInfo=game.UI_GetBotInfoByName(state.data,name);picture="";label=name;if botInfo!=void then picture=playerIconHandle(state,info.value(botInfo,"model"),availableAssets);label=info.value(botInfo,"name") end if;state.bots=state.bots+[Bot(truncate(clean(label),9),picture)] end if end for;return len(state.bots)
end function

// UI_SPLevelMenu_SetMenuArena
function setMenuArena(state,n,level,arenaInfo,availableAssets)
  map=info.value(arenaInfo,"map");best=game.UI_GetBestScore(state.data,level);score=best.score;if score>8 then score=8 end if;picture="levelshots/"+map+".tga";if not hasAsset(availableAssets,picture) then picture=ART_MAP_UNKNOWN end if
  slot=state.maps[n];slot.active=true;slot.grayed=state.selectedArenaSet>state.currentSet;slot.map=strings.toUpperAscii(map);slot.longname=info.value(arenaInfo,"longname");slot.picture=picture;slot.score=score;slot.skill=best.skill;return slot
end function
function clearExtraMaps(state,first) for i=first to 3 state.maps[i].active=false;state.maps[i].picture="" end for;return void end function
// UI_SPLevelMenu_SetMenuItems
function setMenuItems(state,availableAssets)
  if state.selectedArenaSet>state.currentSet then state.selectedArena=-1 else if state.selectedArena==-1 then state.selectedArena=0 end if;if state.selectedArenaSet==state.trainingTier or state.selectedArenaSet==state.finalTier then state.selectedArena=0 end if
  if state.selectedArena!=-1 then setCvar(state,"ui_spSelection",state.selectedArenaSet*ARENAS_PER_TIER+state.selectedArena) end if
  if state.selectedArenaSet==state.trainingTier then arena=game.UI_GetSpecialArenaInfo(state.data,"training");level=numbers.atoi(info.value(arena,"num"));state.maps[0].x=256;setMenuArena(state,0,level,arena,availableAssets);state.selectedArenaInfo=arena;state.numMaps=1;clearExtraMaps(state,1)
  else if state.selectedArenaSet==state.finalTier then arena=game.UI_GetSpecialArenaInfo(state.data,"final");level=numbers.atoi(info.value(arena,"num"));state.maps[0].x=256;setMenuArena(state,0,level,arena,availableAssets);state.selectedArenaInfo=arena;state.numMaps=1;clearExtraMaps(state,1)
  else state.maps[0].x=46;state.numMaps=4;for n=0 to 3 level=state.selectedArenaSet*ARENAS_PER_TIER+n;arena=game.UI_GetArenaInfoByNumber(state.data,level);setMenuArena(state,n,level,arena,availableAssets) end for;if state.selectedArena!=-1 then state.selectedArenaInfo=game.UI_GetArenaInfoByNumber(state.data,state.selectedArenaSet*ARENAS_PER_TIER+state.selectedArena) end if end if
  setBots(state,availableAssets);return state.numMaps
end function

function resetDraw(state) lines=["WARNING: This resets all of the","single player game variables.","Do this only if you want to","start over from the beginning."];for i=0 to 3 emit(state,"text",320,356+27*i,0,0,lines[i],"yellow",0) end for;return lines end function
function resetAction(state,result,availableAssets) if not result then return false end if;game.UI_NewGame(state.data);setCvar(state,"ui_spSelection",-4);state.menuEvents=state.menuEvents+[["pop"],["open-level"]];spLevelMenu(state,availableAssets);return true end function
function resetEvent(state,event,availableAssets) if event!=QM_ACTIVATED then return false end if;state.menuEvents=state.menuEvents+[["confirm","RESET GAME?"]];emit(state,"confirm",320,240,0,0,"RESET GAME?","",0);return true end function
function levelEvent(state,id,event,availableAssets) if event!=QM_ACTIVATED or state.selectedArenaSet==state.trainingTier or state.selectedArenaSet==state.finalTier then return false end if;state.selectedArena=id-ID_PICTURE0;state.selectedArenaInfo=game.UI_GetArenaInfoByNumber(state.data,state.selectedArenaSet*ARENAS_PER_TIER+state.selectedArena);setBots(state,availableAssets);setCvar(state,"ui_spSelection",state.selectedArenaSet*ARENAS_PER_TIER+state.selectedArena);return true end function
function leftArrowEvent(state,event,availableAssets) if event!=QM_ACTIVATED or state.selectedArenaSet==state.minTier then return false end if;state.selectedArenaSet=state.selectedArenaSet-1;setMenuItems(state,availableAssets);return true end function
function rightArrowEvent(state,event,availableAssets) if event!=QM_ACTIVATED or state.selectedArenaSet==state.maxTier then return false end if;state.selectedArenaSet=state.selectedArenaSet+1;setMenuItems(state,availableAssets);return true end function
function playerEvent(state,event) if event!=QM_ACTIVATED then return false end if;state.menuEvents=state.menuEvents+[["player-settings"]];emit(state,"menu",0,0,0,0,"player-settings","",0);return true end function
function awardEvent(state,id,event) if event!=QM_ACTIVATED then return false end if;n=id-ID_AWARD1;if n<0 or n>=6 then return false end if;emit(state,"sound",0,0,0,0,"",state.awardSounds[n],n);return true end function
function nextEvent(state,event) if event!=QM_ACTIVATED or state.selectedArenaSet>state.currentSet then return false end if;if state.selectedArena==-1 then state.selectedArena=0 end if;state.menuEvents=state.menuEvents+[["skill",state.selectedArenaInfo]];emit(state,"menu",0,0,0,0,"skill","",state.selectedArena);return true end function
function backEvent(state,event) if event!=QM_ACTIVATED then return false end if;if state.selectedArena==-1 then state.selectedArena=0 end if;state.menuEvents=state.menuEvents+[["pop"]];emit(state,"menu-pop",0,0,0,0,"","",0);return true end function
function customEvent(state,event) if event!=QM_ACTIVATED then return false end if;state.menuEvents=state.menuEvents+[["start-server",false]];emit(state,"menu",0,0,0,0,"start-server","",0);return true end function

function awardLabel(value) if value>=1000000 then return str(numeric.trunc32(value/1000000))+"m" else if value>=1000 then return str(numeric.trunc32(value/1000))+"k" end if;return str(value) end function
// UI_SPLevelMenu_MenuDraw
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
function cache(state)
  assets=[ART_LEVELFRAME_FOCUS,ART_LEVELFRAME_SELECTED,ART_ARROW,ART_ARROW_FOCUS,ART_MAP_UNKNOWN,"menu/art/level_complete1","menu/art/level_complete2","menu/art/level_complete3","menu/art/level_complete4","menu/art/level_complete5","menu/art/back_0","menu/art/back_1","menu/art/fight_0","menu/art/fight_1","menu/art/reset_0","menu/art/reset_1","menu/art/skirmish_0","menu/art/skirmish_1"]+awardPics();state.cacheAssets=assets;for each name in assets emit(state,"register-shader",0,0,0,0,"",name,0) end for;for each sound in state.awardSounds emit(state,"register-sound",0,0,0,0,"",sound,0) end for
  // The original stores seven renderer handles after the precache pass.  Keep
  // those registrations visible because renderer implementations may assign
  // handles lazily even when a name was registered earlier in this function.
  handles=[ART_LEVELFRAME_SELECTED,ART_LEVELFRAME_FOCUS,"menu/art/level_complete1","menu/art/level_complete2","menu/art/level_complete3","menu/art/level_complete4","menu/art/level_complete5"];for each name in handles emit(state,"register-shader",0,0,0,0,"",name,0) end for;state.cached=true;return len(assets)+len(state.awardSounds)+len(handles)
end function
// UI_SPLevelMenu_Init
function init(state,availableAssets)
  skill=numbers.atoi(cvar(state,"g_spSkill"));if skill<1 or skill>5 then setCvar(state,"g_spSkill",2) end if;state.actions=[];state.maps=[emptyMap(46),emptyMap(186),emptyMap(326),emptyMap(466)];state.bots=[];state.reinit=false;cache(state);state.playerModel=cvar(state,"model");state.playerPic=playerIconHandle(state,state.playerModel,availableAssets)
  for n=0 to 5 state.awardLevels[n]=game.UI_GetAwardLevel(state.data,n) end for;state.awardLevels[AWARD_FRAGS]=100*numeric.trunc32(state.awardLevels[AWARD_FRAGS]/100)
  selection=cvar(state,"ui_spSelection");if selection!="" then value=numbers.atoi(selection);state.selectedArenaSet=numeric.trunc32(value/ARENAS_PER_TIER);state.selectedArena=value%ARENAS_PER_TIER else state.selectedArenaSet=state.currentSet;state.selectedArena=state.currentGame end if;setMenuItems(state,availableAssets);return state
end function
// UI_SPLevelMenu
function spLevelMenu(state,availableAssets)
  state.trainingTier=-1;trainingLevel=-2;training=game.UI_GetSpecialArenaInfo(state.data,"training");if training!=void then state.minTier=-1;trainingLevel=numbers.atoi(info.value(training,"num")) else state.minTier=0 end if;state.finalTier=game.UI_GetNumSPTiers(state.data);finalArena=game.UI_GetSpecialArenaInfo(state.data,"final");if finalArena!=void then state.maxTier=state.finalTier else state.maxTier=state.finalTier-1;if state.maxTier<state.minTier then state.maxTier=state.minTier end if end if
  level=game.UI_GetCurrentGame(state.data);if level==-1 then level=game.UI_GetNumSPArenas(state.data)-1;if state.maxTier==state.finalTier then level=level+1 end if end if;if level==trainingLevel then state.currentSet=-1;state.currentGame=0 else state.currentSet=numeric.trunc32(level/ARENAS_PER_TIER);state.currentGame=level%ARENAS_PER_TIER end if;init(state,availableAssets);state.pushed=true;state.cursor=ID_NEXT;state.menuEvents=state.menuEvents+[["push"],["cursor",ID_NEXT]];return state
end function
function spLevelMenuF(state,availableAssets) state.keyCatcher=KEYCATCH_UI;state.menuEvents=[];emit(state,"key-catcher",0,0,0,0,"","",KEYCATCH_UI);return spLevelMenu(state,availableAssets) end function
function reInit(state) state.reinit=true;return void end function
