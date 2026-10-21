// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
package mq3.client.ui_start_server
import std.string as strings
import mq3.shared.info as info
import mq3.compat.numeric as numeric
const GT_FFA=0
const GT_TOURNAMENT=1
const GT_SINGLE_PLAYER=2
const GT_TEAM=3
const GT_CTF=4
const PLAYER_SLOTS=12
const MAPS_PER_PAGE=4
const BOTS_PER_PAGE=16
struct Action boundary kind name value number dispatched end struct
struct Arena map type bots end struct
struct Bot name model end struct
struct StartState multiplayer gametype maps mapBits currentMap page maxPages displayName actions end struct
struct Options multiplayer gametype mapName playerTypes playerNames playerTeams dedicated timeLimit fragLimit flagLimit friendlyFire hostname pure botSkill punkbuster newBot newBotIndex newBotName visibleNames visibleTeams actions end struct
struct BotState bots sorted modelPage numPages selected icons names active alreadySelected actions end struct
function startState() return StartState(false,0,[],[],0,0,0,"NO MAPS FOUND",[]) end function
function options() return Options(false,0,"",array(PLAYER_SLOTS,0),array(PLAYER_SLOTS,""),array(PLAYER_SLOTS,0),0,0,0,0,0,"",1,1,0,false,0,"",array(PLAYER_SLOTS,false),array(PLAYER_SLOTS,false),[]) end function
function botState() return BotState([],[],0,0,0,array(BOTS_PER_PAGE,""),array(BOTS_PER_PAGE,""),array(BOTS_PER_PAGE,false),array(BOTS_PER_PAGE,false),[]) end function
function emit(actions,boundary,kind,name,value,number,retailActive) actions=actions+[Action(boundary,kind,name,value,number,not retailActive)];return actions end function
function words(text) effect=[];data=bytes(text);at=0;while at<len(data) while at<len(data) and data[at]<=32 at=at+1 end while;if at>=len(data) then break end if;start=at;while at<len(data) and data[at]>32 at=at+1 end while;effect=effect+[decode(slice(data,start,at-start))] end while;return effect end function
// GametypeBits
function gametypeBits(text) bits=0;for each token in words(text) key=strings.toLowerAscii(token);if key=="ffa" then bits=bits|(1<<GT_FFA) else if key=="tourney" then bits=bits|(1<<GT_TOURNAMENT) else if key=="single" then bits=bits|(1<<GT_SINGLE_PLAYER) else if key=="team" then bits=bits|(1<<GT_TEAM) else if key=="ctf" then bits=bits|(1<<GT_CTF) end if end for;return bits end function
function remapGametype(index) return [GT_FFA,GT_TEAM,GT_TOURNAMENT,GT_CTF][index] end function
// StartServer_Update
function startServerUpdate(state) if len(state.maps)==0 then state.currentMap=0;state.displayName="NO MAPS FOUND";return false end if;if state.currentMap>=len(state.maps) then state.currentMap=len(state.maps)-1 end if;state.displayName=strings.toUpperAscii(state.maps[state.currentMap]);return true end function
function ntrunc(value) return numeric.trunc32(value) end function
// StartServer_MapEvent
function startServerMapEvent(state,slot,activated) if not activated then return false end if;index=state.page*MAPS_PER_PAGE+slot;if index<0 or index>=len(state.maps) then return false end if;state.currentMap=index;startServerUpdate(state);return true end function
// StartServer_GametypeEvent
function startServerGametypeEvent(state,arenas,index,activated) if not activated then return false end if;state.gametype=index;match=1<<remapGametype(index);if remapGametype(index)==GT_FFA then match=match|(1<<GT_SINGLE_PLAYER) end if;state.maps=[];state.mapBits=[];for each arena in arenas bits=gametypeBits(arena.type);if (bits&match)!=0 and len(state.maps)<64 then state.maps=state.maps+[strings.toUpperAscii(arena.map)];state.mapBits=state.mapBits+[bits] end if end for;state.maxPages=ntrunc((len(state.maps)+MAPS_PER_PAGE-1)/MAPS_PER_PAGE);state.page=0;state.currentMap=0;startServerUpdate(state);return true end function
// StartServer_MenuEvent
function startServerMenuEvent(state,id,activated,retailActive) if not activated then return false end if;if id==15 and state.page>0 then state.page=state.page-1;startServerUpdate(state) else if id==16 and state.page<state.maxPages-1 then state.page=state.page+1;startServerUpdate(state) else if id==18 then state.actions=emit(state.actions,"cvar","set","g_gameType",str(remapGametype(state.gametype)),0,retailActive);state.actions=emit(state.actions,"ui","push","server-options","",0,retailActive) else if id==17 then state.actions=emit(state.actions,"ui","pop","start-server","",0,retailActive) end if;return true end function
// StartServer_LevelshotDraw
function startServerLevelshotDraw(state,slot,available,retailActive) index=state.page*4+slot;if index>=len(state.maps) then return false end if;shader="levelshots/"+state.maps[index];if not available then shader="menu/art/unknownmap" end if;state.actions=emit(state.actions,"renderer","draw-levelshot",shader,state.maps[index],index,retailActive);return true end function
// StartServer_MenuInit
function startServerMenuInit(state,arenas) startServerGametypeEvent(state,arenas,0,true);return state end function
// StartServer_Cache
function startServerCache(state,arenas,buildScript,retailActive) for each name in ["menu/art/back_0","menu/art/back_1","menu/art/next_0","menu/art/next_1","menu/art/frame2_l","menu/art/frame1_r","menu/art/maps_select","menu/art/maps_selected","menu/art/unknownmap","menu/art/gs_arrows_0","menu/art/gs_arrows_l","menu/art/gs_arrows_r"] state.actions=emit(state.actions,"renderer","register-shader",name,"",0,retailActive) end for;if buildScript then for each arena in arenas state.actions=emit(state.actions,"renderer","register-shader","levelshots/"+strings.toUpperAscii(arena.map),"",0,retailActive) end for end if;return len(state.actions) end function
// UI_StartServerMenu
function uiStartServerMenu(state,arenas,multiplayer,retailActive) startServerMenuInit(state,arenas);state.multiplayer=multiplayer;state.actions=emit(state.actions,"ui","push","start-server","",0,retailActive);return state end function
// BotAlreadySelected
function botAlreadySelected(value,name) for i=1 to PLAYER_SLOTS-1 if value.playerTypes[i]==1 and (value.gametype<GT_TEAM or value.playerTeams[i]==value.playerTeams[value.newBotIndex]) and strings.equalsIgnoreCaseAscii(name,value.playerNames[i]) then return true end if end for;return false end function
function clamp(value,low,high) if value<low then return low end if;if value>high then return high end if;return value end function
// ServerOptions_Start
function serverOptionsStart(value,retailActive) maxClients=0;for i=0 to PLAYER_SLOTS-1 if value.playerTypes[i]!=2 and not (value.playerTypes[i]==1 and value.playerNames[i]=="") then maxClients=maxClients+1 end if end for;uiSets=[];if value.gametype==GT_TOURNAMENT then uiSets=[["ui_tourney_fraglimit",str(value.fragLimit)],["ui_tourney_timelimit",str(value.timeLimit)]] else if value.gametype==GT_TEAM then uiSets=[["ui_team_fraglimit",str(value.fragLimit)],["ui_team_timelimit",str(value.timeLimit)],["ui_team_friendlt",str(value.friendlyFire)]] else if value.gametype==GT_CTF then uiSets=[["ui_ctf_fraglimit",str(value.fragLimit)],["ui_ctf_timelimit",str(value.timeLimit)],["ui_ctf_friendlt",str(value.friendlyFire)]] else uiSets=[["ui_ffa_fraglimit",str(value.fragLimit)],["ui_ffa_timelimit",str(value.timeLimit)]] end if;for each pair in uiSets value.actions=emit(value.actions,"cvar","set",pair[0],pair[1],0,retailActive) end for;sets=[["sv_maxclients",str(clamp(maxClients,0,12))],["dedicated",str(clamp(value.dedicated,0,2))],["timelimit",str(value.timeLimit)],["fraglimit",str(value.fragLimit)],["capturelimit",str(value.flagLimit)],["g_friendlyfire",str(value.friendlyFire)],["sv_pure",str(value.pure)],["sv_hostname",value.hostname],["sv_punkbuster",str(value.punkbuster)]];for each pair in sets value.actions=emit(value.actions,"cvar","set",pair[0],pair[1],0,retailActive) end for;value.actions=emit(value.actions,"command","append","map","wait ; wait ; map "+value.mapName+"\n",0,retailActive);value.actions=emit(value.actions,"command","append","wait","wait 3\n",0,retailActive);for i=1 to PLAYER_SLOTS-1 if value.playerTypes[i]==1 and value.playerNames[i]!="" and strings.substr(value.playerNames[i],0,1)!="-" then command="addbot "+value.playerNames[i]+" "+str(value.botSkill+1);if value.gametype>=GT_TEAM then team="Blue";if value.playerTeams[i]==1 then team="Red" end if;command=command+" "+team end if;value.actions=emit(value.actions,"command","append","addbot",command+"\n",i,retailActive) end if end for;if value.dedicated==0 and value.gametype>=GT_TEAM then team="Blue";if value.playerTeams[0]==1 then team="Red" end if;value.actions=emit(value.actions,"command","append","team","wait 5; team "+team+"\n",0,retailActive) end if;return maxClients end function
// ServerOptions_InitPlayerItems
function serverOptionsInitPlayerItems(value,playerName) initial=1;if value.multiplayer then initial=0 end if;value.playerTypes=array(PLAYER_SLOTS,initial);if value.multiplayer and value.gametype<GT_TEAM then for i=8 to 11 value.playerTypes[i]=2 end for end if;if value.dedicated==0 then value.playerTypes[0]=0;value.playerNames[0]=playerName end if;if value.gametype>=GT_TEAM then for i=0 to 11 value.playerTeams[i]=0;if i>=6 then value.playerTeams[i]=1 end if end for end if;return void end function
// ServerOptions_SetPlayerItems
function serverOptionsSetPlayerItems(value) for i=0 to 11 value.visibleNames[i]=value.playerTypes[i]==1;value.visibleTeams[i]=value.gametype>=GT_TEAM and value.playerTypes[i]!=2 end for;if value.dedicated==0 then value.visibleNames[0]=true end if;return void end function
// ServerOptions_Event
function serverOptionsEvent(value,id,activated,retailActive) if id==23 and activated then serverOptionsStart(value,retailActive);return true end if;if id==24 and activated then value.actions=emit(value.actions,"ui","pop","server-options","",0,retailActive);return true end if;serverOptionsSetPlayerItems(value);return id==20 or id==21 or id==22 end function
// ServerOptions_PlayerNameEvent
function serverOptionsPlayerNameEvent(value,index,activated,retailActive) if not activated then return false end if;value.newBotIndex=index;value.actions=emit(value.actions,"ui","push","bot-select",value.playerNames[index],index,retailActive);return true end function
// ServerOptions_StatusBar
function serverOptionsStatusBar() return "0 = NO LIMIT" end function
// ServerOptions_LevelshotDraw
function serverOptionsLevelshotDraw(value,retailActive) if value.newBot then value.playerNames[value.newBotIndex]=value.newBotName;value.newBot=false end if;value.actions=emit(value.actions,"renderer","draw-levelshot","levelshots/"+value.mapName,value.mapName,value.gametype,retailActive);return true end function
// ServerOptions_InitBotNames
function serverOptionsInitBotNames(value,arena,bots) if value.gametype>=GT_TEAM then value.playerNames[1]="grunt";value.playerNames[2]="major";if value.gametype==GT_TEAM then value.playerNames[3]="visor" else value.playerTypes[3]=2 end if;value.playerTypes[4]=2;value.playerTypes[5]=2;value.playerNames[6]="sarge";value.playerNames[7]="grunt";value.playerNames[8]="major";if value.gametype==GT_TEAM then value.playerNames[9]="visor" else value.playerTypes[9]=2 end if;value.playerTypes[10]=2;value.playerTypes[11]=2;return void end if;count=1;for each key in words(arena.bots) for each bot in bots if strings.equalsIgnoreCaseAscii(bot.name,key) and count<12 then value.playerNames[count]=bot.name;count=count+1 end if end for end for;for i=count to 11 value.playerNames[i]="--------" end for;for i=count to 7 value.playerTypes[i]=0 end for;for i=8 to 11 if value.playerTypes[i]==1 then value.playerTypes[i]=2 end if end for;return void end function
// ServerOptions_SetMenuItems
function serverOptionsSetMenuItems(value,mapName,playerName,arena,bots) value.mapName=strings.toUpperAscii(mapName);value.timeLimit=clamp(value.timeLimit,0,999);value.fragLimit=clamp(value.fragLimit,0,999);value.flagLimit=clamp(value.flagLimit,0,100);serverOptionsInitPlayerItems(value,playerName);serverOptionsSetPlayerItems(value);serverOptionsInitBotNames(value,arena,bots);serverOptionsSetPlayerItems(value);return void end function
// PlayerName_Draw
function playerNameDraw(value,index,focused,retailActive) text=value.playerNames[index];value.actions=emit(value.actions,"ui","draw-player-name",text,str(focused),index,retailActive);return text end function
// ServerOptions_MenuInit
function serverOptionsMenuInit(value,multiplayer,gametype,mapName,playerName,arena,bots) value.multiplayer=multiplayer;value.gametype=clamp(gametype,0,5);serverOptionsSetMenuItems(value,mapName,playerName,arena,bots);return value end function
// ServerOptions_Cache
function serverOptionsCache(value,retailActive) for each name in ["menu/art/back_0","menu/art/back_1","menu/art/fight_0","menu/art/fight_1","menu/art/maps_select","menu/art/unknownmap"] value.actions=emit(value.actions,"renderer","register-shader",name,"",0,retailActive) end for;return void end function
// UI_ServerOptionsMenu
function uiServerOptionsMenu(value,multiplayer,retailActive) value.multiplayer=multiplayer;value.actions=emit(value.actions,"ui","push","server-options","",0,retailActive);return value end function
// UI_BotSelectMenu_SortCompare
function botSortCompare(a,b) left=bytes(strings.toLowerAscii(a.name));right=bytes(strings.toLowerAscii(b.name));count=len(left);if len(right)<count then count=len(right) end if;for i=0 to count-1 if left[i]<right[i] then return -1 else if left[i]>right[i] then return 1 end if end for;if len(left)<len(right) then return -1 end if;if len(left)>len(right) then return 1 end if;return 0 end function
// UI_BotSelectMenu_BuildList
function botSelectBuildList(state,bots) state.bots=bots;state.sorted=[];remaining=bots;while len(remaining)>0 best=0;if len(remaining)>1 then for i=1 to len(remaining)-1 if botSortCompare(remaining[i],remaining[best])<0 then best=i end if end for end if;state.sorted=state.sorted+[remaining[best]];next=[];for i=0 to len(remaining)-1 if i!=best then next=next+[remaining[i]] end if end for;remaining=next end while;state.modelPage=0;state.numPages=ntrunc((len(bots)+15)/16);return len(bots) end function
// ServerPlayerIcon
function serverPlayerIcon(modelAndSkin,skinExists) slash=-1;for i=0 to len(modelAndSkin)-1 if strings.substr(modelAndSkin,i,1)=="/" then slash=i end if end for;model=modelAndSkin;skin="default";if slash>=0 then model=strings.substr(modelAndSkin,0,slash);skin=strings.substr(modelAndSkin,slash+1,len(modelAndSkin)-slash-1) end if;if not skinExists and skin!="default" then skin="default" end if;return "models/players/"+model+"/icon_"+skin+".tga" end function
// UI_BotSelectMenu_UpdateGrid
function botSelectUpdateGrid(state,value) start=state.modelPage*16;for i=0 to 15 if start+i<len(state.sorted) then state.active[i]=true;bot=state.sorted[start+i];state.names[i]=bot.name;state.icons[i]=serverPlayerIcon(bot.model,true);state.alreadySelected[i]=botAlreadySelected(value,bot.name) else state.active[i]=false;state.names[i]="";state.icons[i]="";state.alreadySelected[i]=false end if end for;return void end function
// UI_BotSelectMenu_Default
function botSelectDefault(state,name) state.selected=0;for i=0 to len(state.sorted)-1 if strings.equalsIgnoreCaseAscii(state.sorted[i].name,name) then state.selected=i end if end for;return state.selected end function
// UI_BotSelectMenu_LeftEvent
function botSelectLeftEvent(state,value,activated) if activated and state.modelPage>0 then state.modelPage=state.modelPage-1;state.selected=state.modelPage*16;botSelectUpdateGrid(state,value);return true end if;return false end function
// UI_BotSelectMenu_RightEvent
function botSelectRightEvent(state,value,activated) if activated and state.modelPage<state.numPages-1 then state.modelPage=state.modelPage+1;state.selected=state.modelPage*16;botSelectUpdateGrid(state,value);return true end if;return false end function
// UI_BotSelectMenu_BotEvent
function botSelectBotEvent(state,index,activated) if not activated or index<0 or index>=16 or not state.active[index] then return false end if;state.selected=state.modelPage*16+index;return true end function
// UI_BotSelectMenu_BackEvent
function botSelectBackEvent(state,activated,retailActive) if not activated then return false end if;state.actions=emit(state.actions,"ui","pop","bot-select","",0,retailActive);return true end function
// UI_BotSelectMenu_SelectEvent
function botSelectSelectEvent(state,value,activated,retailActive) if not activated or state.selected>=len(state.sorted) then return false end if;value.newBot=true;value.newBotName=state.sorted[state.selected].name;state.actions=emit(state.actions,"ui","pop","bot-select","",0,retailActive);return true end function
// UI_BotSelectMenu_Cache
function botSelectCache(state,retailActive) for each name in ["menu/art/back_0","menu/art/back_1","menu/art/accept_0","menu/art/accept_1","menu/art/opponents_select","menu/art/opponents_selected","menu/art/gs_arrows_0","menu/art/gs_arrows_l","menu/art/gs_arrows_r"] state.actions=emit(state.actions,"renderer","register-shader",name,"",0,retailActive) end for;return void end function
// UI_BotSelectMenu_Init
function botSelectInit(state,value,bots,selected) botSelectBuildList(state,bots);botSelectDefault(state,selected);state.modelPage=ntrunc(state.selected/16);botSelectUpdateGrid(state,value);return state end function
// UI_BotSelectMenu
function uiBotSelectMenu(state,value,bots,selected,retailActive) botSelectInit(state,value,bots,selected);state.actions=emit(state.actions,"ui","push","bot-select","",0,retailActive);return state end function
