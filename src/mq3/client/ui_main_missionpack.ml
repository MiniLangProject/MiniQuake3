// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Semantic runtime port of Team Arena code/ui/ui_main.c.
package mq3.client.ui_main_missionpack
import std.string as strings
import mq3.shared.info as info
import mq3.compat.textnumbers as numbers
import mq3.compat.numeric as n

const UI_GETAPIVERSION=0
const UI_INIT=1
const UI_SHUTDOWN=2
const UI_KEY_EVENT=3
const UI_MOUSE_EVENT=4
const UI_REFRESH=5
const UI_IS_FULLSCREEN=6
const UI_SET_ACTIVE_MENU=7
const UI_CONSOLE_COMMAND=8
const UI_DRAW_CONNECT_SCREEN=9
const UI_HASUNIQUECDKEY=10
const UI_API_VERSION=6
const SAY_ALL=0
const GT_FFA=0
const GT_TOURNAMENT=1
const GT_SINGLE_PLAYER=2
const GT_TEAM=3
const GT_CTF=4
const GT_1FCTF=5
const GT_OBELISK=6
const GT_HARVESTER=7
const AS_LOCAL=0
const AS_MPLAYER=1
const AS_GLOBAL=2
const AS_FAVORITES=3
const FEEDER_HEADS=0
const FEEDER_MAPS=1
const FEEDER_SERVERS=2
const FEEDER_ALLMAPS=4
const FEEDER_PLAYER_LIST=7
const FEEDER_TEAM_LIST=8
const FEEDER_MODS=9
const FEEDER_DEMOS=10
const FEEDER_Q3HEADS=12
const FEEDER_SERVERSTATUS=13
const FEEDER_FINDPLAYER=14
const FEEDER_CINEMATICS=15
const K_MOUSE1=178
const K_MOUSE2=179
const UI_SHOW_LEADER=1
const UI_SHOW_NOTLEADER=2
const UI_SHOW_FAVORITESERVERS=4
const UI_SHOW_ANYNONTEAMGAME=8
const UI_SHOW_ANYTEAMGAME=16
const UI_SHOW_NEWHIGHSCORE=32
const UI_SHOW_DEMOAVAILABLE=64
const UI_SHOW_NEWBESTTIME=128
const UI_SHOW_FFA=256
const UI_SHOW_NOTFFA=512
const UI_SHOW_NETANYNONTEAMGAME=1024
const UI_SHOW_NETANYTEAMGAME=2048
const UI_SHOW_NOTFAVORITESERVERS=4096

struct Rect x y w h end struct
struct Action boundary kind name text values dispatched end struct
struct MapInfo mapLoadName mapName imageName typeBits active cinematic levelShot opponentName teamMembers timeToBeat end struct
struct TeamInfo name imageName teamMembers cinematic end struct
struct CharacterInfo name base imageName active headImage end struct
struct AliasInfo name ai action end struct
struct ServerInfo address hostname mapname clients maxClients gametype ping nettype punkbuster visible favorite end struct
struct ModInfo name description end struct
struct ParseResult ok next end struct
struct DispatchResult value action end struct
struct State
  actions retailActive hostFn initialized shutdown ingameLoad realtime frametime cursorx cursory activeMenu fullscreen keyCatcher paused
  cvars assets menus maps teams characters aliases gameTypes joinGameTypes servers displayServers serverStatusLines foundPlayerNames foundPlayerAddresses
  playerNames teamNames mods movies demos q3HeadNames q3HeadIcons
  currentMap currentGameType currentNetGameType currentJoinGameType currentTeam currentOpponent currentBot currentBotSkill currentCrosshair currentNetSource currentNetFilter selectedPlayer
  sortKey sortDir refreshActive refreshTime nextDisplayRefresh playerRefresh newHighScoreTime newBestTime demoAvailable numPlayersOnServers
  serverMOTD serverRefreshDate glInfo fontWidths fontHeight lastConnState lastLoadingText
end struct

function mapInfo(loadName,name,typeBits) return MapInfo(loadName,name,"levelshots/"+loadName,typeBits,true,-1,-1,"",0,array(8,0)) end function
function teamInfo(name,image,members) return TeamInfo(name,image,members,-1) end function
function characterInfo(name,base,image) return CharacterInfo(name,base,image,true,-1) end function
function serverInfo(address,hostname,mapname,clients,maxClients,gametype,ping) return ServerInfo(address,hostname,mapname,clients,maxClients,gametype,ping,0,false,true,false) end function
function create(retailActive)
  widths=array(256,8.0);games=[["Free For All",GT_FFA],["Tournament",GT_TOURNAMENT],["Single Player",GT_SINGLE_PLAYER],["Team Deathmatch",GT_TEAM],["Capture the Flag",GT_CTF],["One Flag CTF",GT_1FCTF],["Overload",GT_OBELISK],["Harvester",GT_HARVESTER]]
  return State([],retailActive,void,false,false,false,0,0,320.0,240.0,0,false,0,false,
    [],[],[],[],[],[],[],games,games,[],[],[],[],[],[],[],[],[],[],[],[],
    0,0,0,0,0,0,0,2,4,0,0,0,0,0,false,0,0,0,0,0,false,0,"","","",widths,16.0,-1,"")
end function
function emit(state,boundary,kind,name,text,values)
  action=Action(boundary,kind,name,text,values,not state.retailActive);state.actions=state.actions+[action]
  if not state.retailActive and state.hostFn!=void then state.hostFn(state,action) end if;return action
end function
function cvarIndex(state,name) wanted=strings.toLowerAscii(name);for i=0 to len(state.cvars)-1 if strings.toLowerAscii(state.cvars[i][0])==wanted then return i end if end for;return -1 end function
function cvarString(state,name) index=cvarIndex(state,name);if index<0 then return "" end if;return state.cvars[index][1] end function
function cvarValue(state,name) return numbers.atof32(cvarString(state,name)) end function
function setCvar(state,name,value) index=cvarIndex(state,name);if index<0 then state.cvars=state.cvars+[[name,str(value)]] else state.cvars[index][1]=str(value) end if;emit(state,"cvar","set",name,str(value),[]);return void end function
function clamp(value,minimum,maximum) if value<minimum then return minimum end if;if value>maximum then return maximum end if;return value end function
function leftKey(key) return key==K_MOUSE2 or key==134 or key==132 end function
function direction(key) if leftKey(key) then return -1 end if;return 1 end function
function cycle(value,count,key) if count<=0 then return 0 end if;value=value+direction(key);if value<0 then value=count-1 else if value>=count then value=0 end if;return value end function
function visibleColor(text,index) data=bytes(text);return index+1<len(data) and data[index]==94 and data[index+1]!=94 end function
function containsValue(values,wanted) for each value in values if value==wanted then return true end if end for;return false end function

// AssetCache / Asset_Parse
function AssetCache(state)
  names=["gradientbar","scrollbar","scrollbar_arrowup","scrollbar_arrowdown","scrollbar_thumb","slider2","sliderbutt_1","menu_enter","menu_exit","menu_buzz","menu_null"]
  for each name in names if not containsValue(state.assets,name) then state.assets=state.assets+[name];emit(state,"renderer","register-shader",name,"",[]) end if end for;return len(state.assets)
end function
function Asset_Parse(state,tokens,start)
  at=start;if at<len(tokens) and tokens[at]=="{" then at=at+1 end if
  while at<len(tokens) and tokens[at]!="}"
    key=strings.toLowerAscii(tokens[at]);at=at+1;if at>=len(tokens) then return ParseResult(false,at) end if
    value=tokens[at];at=at+1
    if key=="font" or key=="smallfont" or key=="bigfont" then if at>=len(tokens) then return ParseResult(false,at) end if;size=numbers.atoi(tokens[at]);at=at+1;state.assets=state.assets+[key+"="+value+":"+str(size)];emit(state,"renderer","register-font",value,"",[size])
    else if key=="shadowcolor" then if at+2>=len(tokens) then return ParseResult(false,at) end if;color=[numbers.atof32(value),numbers.atof32(tokens[at]),numbers.atof32(tokens[at+1]),numbers.atof32(tokens[at+2])];at=at+3;state.assets=state.assets+[key+"="+str(color)];emit(state,"renderer","asset-color",key,"",color)
    else state.assets=state.assets+[key+"="+value];if strings.indexOf(key,"sound",0)>=0 then emit(state,"audio","register",value,"",[]) else if key=="gradientbar" or key=="cursor" then emit(state,"renderer","register-shader",value,"",[]) else emit(state,"ui","asset-value",key,value,[]) end if end if
  end while
  if at<len(tokens) and tokens[at]=="}" then at=at+1;return ParseResult(true,at) end if;return ParseResult(false,at)
end function
function Font_Report(state) return emit(state,"ui","font-report","Font_Report","",[len(state.fontWidths),state.fontHeight]) end function
function UI_Report(state) return emit(state,"ui","report","UI_Report","",[len(state.menus),len(state.assets)]) end function

// Text_Width / Text_Height / paint paths preserve color escapes and limits.
function Text_Width(state,text,scale,limit)
  if text==void then return 0 end if;data=bytes(text);width=0.0;count=0;at=0
  while at<len(data) and (limit<=0 or count<limit)
    if visibleColor(text,at) then at=at+2;continue end if;code=data[at]&255;width=width+state.fontWidths[code]*scale;count=count+1;at=at+1
  end while;return n.trunc32(width)
end function
function Text_Height(state,text,scale,limit) if text==void or text=="" then return 0 end if;return n.trunc32(state.fontHeight*scale) end function
function Text_PaintChar(state,x,y,width,height,scale,s,t,s2,t2,hShader) return emit(state,"renderer","glyph",str(hShader),"",[x,y,width,height,scale,s,t,s2,t2]) end function
function Text_Paint(state,x,y,scale,color,text,adjust,limit,style) return emit(state,"renderer","text",str(style),text,[x,y,scale,color,adjust,limit]) end function
function Text_PaintWithCursor(state,x,y,scale,color,text,cursorPos,cursor,limit,style) action=Text_Paint(state,x,y,scale,color,text,0.0,limit,style);if cursorPos>=0 then emit(state,"renderer","cursor",cursor,"",[x+Text_Width(state,strings.substr(text,0,cursorPos),scale,0),y,scale,color]) end if;return action end function
function Text_Paint_Limit(state,maxX,x,y,scale,color,text,adjust,limit) width=Text_Width(state,text,scale,limit);available=maxX[0]-x;if width>available then width=n.trunc32(available) end if;Text_Paint(state,x,y,scale,color,text,adjust,limit,0);maxX[0]=x+width;return width end function
function Text_PaintCenter(state,x,y,scale,color,text,adjust) return Text_Paint(state,x-Text_Width(state,text,scale,0)/2.0,y,scale,color,text,0.0,0,6) end function
function Text_PaintCenter_AutoWrapped(state,x,y,xmax,ystep,scale,color,text,adjust)
  words=strings.split(text," ");line="";rows=0
  for each word in words candidate=word;if line!="" then candidate=line+" "+word end if;if line!="" and Text_Width(state,candidate,scale,0)>xmax then Text_PaintCenter(state,x,y+rows*ystep,scale,color,line,adjust);rows=rows+1;line=word else line=candidate end if end for
  if line!="" then Text_PaintCenter(state,x,y+rows*ystep,scale,color,line,adjust);rows=rows+1 end if;return rows
end function

function _UI_DrawSides(state,x,y,w,h,size) emit(state,"renderer","rect-sides","white","",[x,y,w,h,size]);return void end function
function _UI_DrawTopBottom(state,x,y,w,h,size) emit(state,"renderer","rect-top-bottom","white","",[x,y,w,h,size]);return void end function
function _UI_DrawRect(state,x,y,width,height,size,color) _UI_DrawSides(state,x,y,width,height,size);_UI_DrawTopBottom(state,x,y,width,height,size);return emit(state,"renderer","set-color","","",[void]) end function
function UI_DrawCenteredPic(state,image,w,h) return emit(state,"renderer","pic",str(image),"",[320-w/2.0,240-h/2.0,w,h]) end function
function UI_ShowPostGame(state,newHigh) setCvar(state,"cg_cameraOrbit","0");setCvar(state,"cg_thirdPerson","0");return emit(state,"menu","activate","endofgame","",[newHigh]) end function

function GetMenuBuffer(state,filename,files) for each pair in files if strings.toLowerAscii(pair[0])==strings.toLowerAscii(filename) then emit(state,"filesystem","read",filename,"",[len(bytes(pair[1]))]);return pair[1] end if end for;return "" end function
function UI_ParseMenu(state,menuFile,text) if text=="" then return false end if;state.menus=state.menus+[menuFile];emit(state,"menu","parse",menuFile,text,[]);return true end function
function Load_Menu(state,tokens,start,files) at=start;if at<len(tokens) and tokens[at]=="{" then at=at+1 end if;while at<len(tokens) and tokens[at]!="}" filename=tokens[at];at=at+1;UI_ParseMenu(state,filename,GetMenuBuffer(state,filename,files)) end while;if at<len(tokens) then at=at+1 end if;return ParseResult(true,at) end function
function UI_LoadMenus(state,menuFile,reset,files)
  if reset then state.menus=[];emit(state,"menu","reset","","",[]) end if;text=GetMenuBuffer(state,menuFile,files);if text=="" then text=GetMenuBuffer(state,"ui/menus.txt",files) end if;if text=="" then return false end if
  tokens=tokenize(text);at=0;loaded=false;parsed=ParseResult(false,0);while at<len(tokens) key=strings.toLowerAscii(tokens[at]);at=at+1;if key=="loadmenu" then parsed=Load_Menu(state,tokens,at,files);if not parsed.ok then return false end if;at=parsed.next;loaded=true end if end while;if not loaded then return UI_ParseMenu(state,menuFile,text) end if;return true
end function
function UI_Load(state,files) state.assets=[];AssetCache(state);return UI_LoadMenus(state,"ui/menus.txt",true,files) end function

function draw(state,name,rect,text,values) return emit(state,"renderer","owner-draw",name,text,[rect.x,rect.y,rect.w,rect.h]+values) end function
function UI_DrawHandicap(state,rect,scale,color,textStyle) return draw(state,"handicap",rect,cvarString(state,"handicap"),[scale,color,textStyle]) end function
function UI_DrawClanName(state,rect,scale,color,textStyle) return draw(state,"clan-name",rect,cvarString(state,"ui_teamName"),[scale,color,textStyle]) end function
function UI_DrawGameType(state,rect,scale,color,textStyle) index=clamp(state.currentGameType,0,len(state.gameTypes)-1);return draw(state,"game-type",rect,state.gameTypes[index][0],[scale,color,textStyle]) end function
function UI_DrawNetGameType(state,rect,scale,color,textStyle) index=clamp(state.currentNetGameType,0,len(state.gameTypes)-1);return draw(state,"net-game-type",rect,state.gameTypes[index][0],[scale,color,textStyle]) end function
function UI_DrawJoinGameType(state,rect,scale,color,textStyle) index=clamp(state.currentJoinGameType,0,len(state.joinGameTypes)-1);return draw(state,"join-game-type",rect,state.joinGameTypes[index][0],[scale,color,textStyle]) end function
function UI_TeamIndexFromName(state,name) for i=0 to len(state.teams)-1 if strings.toLowerAscii(state.teams[i].name)==strings.toLowerAscii(name) then return i end if end for;return 0 end function
function teamAt(state,index) if len(state.teams)==0 then return void end if;return state.teams[clamp(index,0,len(state.teams)-1)] end function
function UI_DrawClanLogo(state,rect,scale,color) team=teamAt(state,state.currentTeam);if team==void then return void end if;return draw(state,"clan-logo",rect,team.imageName,[scale,color]) end function
function UI_DrawClanCinematic(state,rect,scale,color) team=teamAt(state,state.currentTeam);if team==void then return void end if;if team.cinematic<0 then team.cinematic=UI_PlayCinematic(state,team.name,rect.x,rect.y,rect.w,rect.h) end if;return UI_DrawCinematic(state,team.cinematic,rect.x,rect.y,rect.w,rect.h) end function
function UI_DrawPreviewCinematic(state,rect,scale,color) return draw(state,"preview-cinematic",rect,cvarString(state,"ui_previewMovie"),[scale,color]) end function
function UI_DrawSkill(state,rect,scale,color,textStyle) return draw(state,"skill",rect,str(state.currentBotSkill),[scale,color,textStyle]) end function
function UI_DrawTeamName(state,rect,scale,color,blue,textStyle) name=cvarString(state,"ui_redteam");if blue then name=cvarString(state,"ui_blueteam") end if;return draw(state,"team-name",rect,name,[scale,color,blue,textStyle]) end function
function UI_DrawTeamMember(state,rect,scale,color,blue,num,textStyle) prefix="ui_redteam";if blue then prefix="ui_blueteam" end if;return draw(state,"team-member",rect,cvarString(state,prefix+str(num)),[scale,color,textStyle]) end function
function UI_DrawEffects(state,rect,scale,color) return draw(state,"effects",rect,cvarString(state,"color1"),[scale,color]) end function
function currentMap(state) if len(state.maps)==0 then return void end if;return state.maps[clamp(state.currentMap,0,len(state.maps)-1)] end function
function UI_DrawMapPreview(state,rect,scale,color,net) map=currentMap(state);if map==void then return void end if;if map.levelShot<0 then map.levelShot=len(state.assets)+1;state.assets=state.assets+[map.imageName];emit(state,"renderer","register-shader",map.imageName,"",[]) end if;return draw(state,"map-preview",rect,map.imageName,[scale,color,net,map.levelShot]) end function
function UI_DrawMapTimeToBeat(state,rect,scale,color,textStyle) map=currentMap(state);if map==void then return void end if;game=clamp(state.currentGameType,0,7);seconds=map.timeToBeat[game];return draw(state,"map-time",rect,str(seconds/60)+":"+str(seconds%60),[scale,color,textStyle]) end function
function UI_PlayCinematic(state,name,x,y,w,h) emit(state,"cinematic","play",name,"",[x,y,w,h]);return len(state.actions) end function
function UI_StopCinematic(state,handle) return emit(state,"cinematic","stop",str(handle),"",[]) end function
function UI_DrawCinematic(state,handle,x,y,w,h) return emit(state,"cinematic","draw",str(handle),"",[x,y,w,h]) end function
function UI_RunCinematicFrame(state,handle) return emit(state,"cinematic","run",str(handle),"",[]) end function
function UI_DrawMapCinematic(state,rect,scale,color,net) map=currentMap(state);if map==void then return void end if;if map.cinematic<0 then map.cinematic=UI_PlayCinematic(state,map.mapLoadName,rect.x,rect.y,rect.w,rect.h) end if;UI_RunCinematicFrame(state,map.cinematic);return UI_DrawCinematic(state,map.cinematic,rect.x,rect.y,rect.w,rect.h) end function
function UI_DrawPlayerModel(state,rect) return draw(state,"player-model",rect,cvarString(state,"model"),[]) end function
function UI_DrawNetSource(state,rect,scale,color,textStyle) sources=["Local","MPlayer","Internet","Favorites"];return draw(state,"net-source",rect,sources[clamp(state.currentNetSource,0,3)],[scale,color,textStyle]) end function
function UI_DrawNetMapPreview(state,rect,scale,color) return UI_DrawMapPreview(state,rect,scale,color,true) end function
function UI_DrawNetMapCinematic(state,rect,scale,color) return UI_DrawMapCinematic(state,rect,scale,color,true) end function
function UI_DrawNetFilter(state,rect,scale,color,textStyle) return draw(state,"net-filter",rect,str(state.currentNetFilter),[scale,color,textStyle]) end function
function UI_DrawTier(state,rect,scale,color,textStyle) return draw(state,"tier",rect,cvarString(state,"ui_currentTier"),[scale,color,textStyle]) end function
function UI_DrawTierMap(state,rect,index) if index<0 or index>=len(state.maps) then return void end if;return draw(state,"tier-map",rect,state.maps[index].imageName,[index]) end function
function UI_DrawTierMapName(state,rect,scale,color,textStyle) map=currentMap(state);if map==void then return void end if;return draw(state,"tier-map-name",rect,map.mapName,[scale,color,textStyle]) end function
function UI_DrawTierGameType(state,rect,scale,color,textStyle) return UI_DrawGameType(state,rect,scale,color,textStyle) end function
function UI_OpponentLeaderName(state) team=teamAt(state,state.currentOpponent);if team==void or len(team.teamMembers)==0 then return "" end if;return team.teamMembers[0] end function
function UI_AIFromName(state,name) for each alias in state.aliases if strings.toLowerAscii(alias.name)==strings.toLowerAscii(name) then return alias.ai end if end for;return name end function
function UI_AIIndex(state,name) for i=0 to len(state.aliases)-1 if strings.toLowerAscii(state.aliases[i].name)==strings.toLowerAscii(name) then return i end if end for;return 0 end function
function UI_AIIndexFromName(state,name) return UI_AIIndex(state,name) end function
function UI_OpponentLeaderHead(state) return UI_AIFromName(state,UI_OpponentLeaderName(state)) end function
function UI_OpponentLeaderModel(state) return UI_OpponentLeaderHead(state)+"/default" end function
function UI_DrawOpponent(state,rect) return draw(state,"opponent",rect,UI_OpponentLeaderModel(state),[]) end function
function UI_NextOpponent(state) state.currentOpponent=cycle(state.currentOpponent,len(state.teams),K_MOUSE1);return state.currentOpponent end function
function UI_PriorOpponent(state) state.currentOpponent=cycle(state.currentOpponent,len(state.teams),K_MOUSE2);return state.currentOpponent end function
function UI_DrawPlayerLogo(state,rect,color) return draw(state,"player-logo",rect,cvarString(state,"ui_teamName"),[color]) end function
function UI_DrawPlayerLogoMetal(state,rect,color) return draw(state,"player-logo-metal",rect,cvarString(state,"ui_teamName"),[color]) end function
function UI_DrawPlayerLogoName(state,rect,color) return draw(state,"player-logo-name",rect,cvarString(state,"ui_teamName"),[color]) end function
function UI_DrawOpponentLogo(state,rect,color) team=teamAt(state,state.currentOpponent);if team==void then return void end if;return draw(state,"opponent-logo",rect,team.name,[color]) end function
function UI_DrawOpponentLogoMetal(state,rect,color) return UI_DrawOpponentLogo(state,rect,color) end function
function UI_DrawOpponentLogoName(state,rect,color) return UI_DrawOpponentLogo(state,rect,color) end function
function UI_DrawAllMapsSelection(state,rect,scale,color,textStyle,net) map=currentMap(state);if map==void then return void end if;return draw(state,"allmaps-selection",rect,map.mapName,[scale,color,textStyle,net]) end function
function UI_DrawOpponentName(state,rect,scale,color,textStyle) team=teamAt(state,state.currentOpponent);if team==void then return void end if;return draw(state,"opponent-name",rect,team.name,[scale,color,textStyle]) end function
function UI_DrawBotName(state,rect,scale,color,textStyle) if len(state.aliases)==0 then return void end if;alias=state.aliases[clamp(state.currentBot,0,len(state.aliases)-1)];return draw(state,"bot-name",rect,alias.name,[scale,color,textStyle]) end function
function UI_DrawBotSkill(state,rect,scale,color,textStyle) return draw(state,"bot-skill",rect,str(state.currentBotSkill),[scale,color,textStyle]) end function
function UI_DrawRedBlue(state,rect,scale,color,textStyle) return draw(state,"red-blue",rect,cvarString(state,"ui_redblue"),[scale,color,textStyle]) end function
function UI_DrawCrosshair(state,rect,scale,color) return draw(state,"crosshair",rect,"gfx/2d/crosshair"+str(state.currentCrosshair),[scale,color]) end function
function UI_BuildPlayerList(state,names,teams,ownTeam) state.playerNames=names;state.teamNames=[];for i=0 to len(names)-1 if i<len(teams) and teams[i]==ownTeam then state.teamNames=state.teamNames+[names[i]] end if end for;state.playerRefresh=state.realtime+3000;return len(state.playerNames) end function
function UI_DrawSelectedPlayer(state,rect,scale,color,textStyle) name="Everyone";if state.selectedPlayer>=0 and state.selectedPlayer<len(state.teamNames) then name=state.teamNames[state.selectedPlayer] end if;return draw(state,"selected-player",rect,name,[scale,color,textStyle]) end function
function UI_DrawServerRefreshDate(state,rect,scale,color,textStyle) return draw(state,"server-refresh-date",rect,state.serverRefreshDate,[scale,color,textStyle]) end function
function UI_DrawServerMOTD(state,rect,scale,color) return draw(state,"server-motd",rect,state.serverMOTD,[scale,color]) end function
function UI_DrawKeyBindStatus(state,rect,scale,color,textStyle) return draw(state,"keybind-status",rect,cvarString(state,"ui_bindStatus"),[scale,color,textStyle]) end function
function UI_DrawGLInfo(state,rect,scale,color,textStyle) return draw(state,"gl-info",rect,state.glInfo,[scale,color,textStyle]) end function

function UI_OwnerDrawWidth(state,ownerDraw,scale)
  if ownerDraw==200 then return Text_Width(state,cvarString(state,"handicap"),scale,0)
  else if ownerDraw==203 then return Text_Width(state,cvarString(state,"ui_teamName"),scale,0)
  else if ownerDraw==205 then index=clamp(state.currentGameType,0,len(state.gameTypes)-1);return Text_Width(state,state.gameTypes[index][0],scale,0)
  else if ownerDraw==237 then team=teamAt(state,state.currentOpponent);if team!=void then return Text_Width(state,team.name,scale,0) end if
  else if ownerDraw==239 and len(state.aliases)>0 then return Text_Width(state,state.aliases[clamp(state.currentBot,0,len(state.aliases)-1)].name,scale,0)
  else if ownerDraw==247 then return Text_Width(state,state.serverRefreshDate,scale,0) end if;return 0
end function
function UI_OwnerDraw_Width(state,ownerDraw) return UI_OwnerDrawWidth(state,ownerDraw,0.4) end function
function UI_OwnerDraw(state,x,y,w,h,text_x,text_y,ownerDraw,ownerDrawFlags,align,special,scale,color,shader,textStyle)
  rect=Rect(x,y,w,h)
  if not UI_OwnerDrawVisible(state,ownerDrawFlags) then return void end if
  if ownerDraw==200 then return UI_DrawHandicap(state,rect,scale,color,textStyle)
  else if ownerDraw==201 then return UI_DrawEffects(state,rect,scale,color)
  else if ownerDraw==202 then return UI_DrawPlayerModel(state,rect)
  else if ownerDraw==203 then return UI_DrawClanName(state,rect,scale,color,textStyle)
  else if ownerDraw==204 then return UI_DrawClanLogo(state,rect,scale,color)
  else if ownerDraw==205 then return UI_DrawGameType(state,rect,scale,color,textStyle)
  else if ownerDraw==206 then return UI_DrawMapPreview(state,rect,scale,color,false)
  else if ownerDraw==207 then return UI_DrawSkill(state,rect,scale,color,textStyle)
  else if ownerDraw==208 then return UI_DrawTeamName(state,rect,scale,color,true,textStyle)
  else if ownerDraw==209 then return UI_DrawTeamName(state,rect,scale,color,false,textStyle)
  else if ownerDraw>=210 and ownerDraw<=214 then return UI_DrawTeamMember(state,rect,scale,color,true,ownerDraw-209,textStyle)
  else if ownerDraw>=215 and ownerDraw<=219 then return UI_DrawTeamMember(state,rect,scale,color,false,ownerDraw-214,textStyle)
  else if ownerDraw==220 then return UI_DrawNetSource(state,rect,scale,color,textStyle)
  else if ownerDraw==221 then return UI_DrawNetMapPreview(state,rect,scale,color)
  else if ownerDraw==222 then return UI_DrawNetFilter(state,rect,scale,color,textStyle)
  else if ownerDraw==223 then return UI_DrawTier(state,rect,scale,color,textStyle)
  else if ownerDraw==224 then return UI_DrawOpponent(state,rect)
  else if ownerDraw>=225 and ownerDraw<=227 then return UI_DrawTierMap(state,rect,ownerDraw-225)
  else if ownerDraw==228 then return UI_DrawPlayerLogo(state,rect,color)
  else if ownerDraw==229 then return UI_DrawOpponentLogo(state,rect,color)
  else if ownerDraw==230 then return UI_DrawPlayerLogoMetal(state,rect,color)
  else if ownerDraw==231 then return UI_DrawOpponentLogoMetal(state,rect,color)
  else if ownerDraw==232 then return UI_DrawPlayerLogoName(state,rect,color)
  else if ownerDraw==233 then return UI_DrawOpponentLogoName(state,rect,color)
  else if ownerDraw==234 then return UI_DrawTierMapName(state,rect,scale,color,textStyle)
  else if ownerDraw==235 then return UI_DrawTierGameType(state,rect,scale,color,textStyle)
  else if ownerDraw==236 or ownerDraw==256 then return UI_DrawAllMapsSelection(state,rect,scale,color,textStyle,ownerDraw==256)
  else if ownerDraw==237 then return UI_DrawOpponentName(state,rect,scale,color,textStyle)
  else if ownerDraw==239 then return UI_DrawBotName(state,rect,scale,color,textStyle)
  else if ownerDraw==240 then return UI_DrawBotSkill(state,rect,scale,color,textStyle)
  else if ownerDraw==241 then return UI_DrawRedBlue(state,rect,scale,color,textStyle)
  else if ownerDraw==242 then return UI_DrawCrosshair(state,rect,scale,color)
  else if ownerDraw==243 then return UI_DrawSelectedPlayer(state,rect,scale,color,textStyle)
  else if ownerDraw==244 then return UI_DrawMapCinematic(state,rect,scale,color,false)
  else if ownerDraw==245 then return UI_DrawNetGameType(state,rect,scale,color,textStyle)
  else if ownerDraw==246 then return UI_DrawNetMapCinematic(state,rect,scale,color)
  else if ownerDraw==247 then return UI_DrawServerRefreshDate(state,rect,scale,color,textStyle)
  else if ownerDraw==248 then return UI_DrawServerMOTD(state,rect,scale,color)
  else if ownerDraw==249 then return UI_DrawGLInfo(state,rect,scale,color,textStyle)
  else if ownerDraw==250 then return UI_DrawKeyBindStatus(state,rect,scale,color,textStyle)
  else if ownerDraw==251 then return UI_DrawClanCinematic(state,rect,scale,color)
  else if ownerDraw==252 then return UI_DrawMapTimeToBeat(state,rect,scale,color,textStyle)
  else if ownerDraw==253 then return UI_DrawJoinGameType(state,rect,scale,color,textStyle)
  else if ownerDraw==254 then return UI_DrawPreviewCinematic(state,rect,scale,color) end if
  return draw(state,"unknown-owner-draw",rect,"",[ownerDraw,ownerDrawFlags,align,special,shader])
end function
function UI_OwnerDrawVisible(state,flags)
  if (flags&UI_SHOW_FAVORITESERVERS)!=0 and state.currentNetSource!=AS_FAVORITES then return false end if
  if (flags&UI_SHOW_NOTFAVORITESERVERS)!=0 and state.currentNetSource==AS_FAVORITES then return false end if
  if (flags&UI_SHOW_NEWHIGHSCORE)!=0 and state.realtime>state.newHighScoreTime then return false end if
  if (flags&UI_SHOW_NEWBESTTIME)!=0 and state.realtime>state.newBestTime then return false end if
  if (flags&UI_SHOW_DEMOAVAILABLE)!=0 and not state.demoAvailable then return false end if
  game=state.currentGameType;if (flags&UI_SHOW_FFA)!=0 and game!=GT_FFA then return false end if;if (flags&UI_SHOW_NOTFFA)!=0 and game==GT_FFA then return false end if
  if (flags&UI_SHOW_ANYTEAMGAME)!=0 and game<GT_TEAM then return false end if;if (flags&UI_SHOW_ANYNONTEAMGAME)!=0 and game>=GT_TEAM then return false end if
  if (flags&UI_SHOW_NETANYTEAMGAME)!=0 and state.currentNetGameType<GT_TEAM then return false end if;if (flags&UI_SHOW_NETANYNONTEAMGAME)!=0 and state.currentNetGameType>=GT_TEAM then return false end if
  return true
end function

function UI_Handicap_HandleKey(state,flags,special,key) value=n.trunc32(cvarValue(state,"handicap"));value=value-direction(key)*5;if value>100 then value=5 else if value<5 then value=100 end if;setCvar(state,"handicap",value);return true end function
function UI_Effects_HandleKey(state,flags,special,key) value=n.trunc32(cvarValue(state,"color1"));value=cycle(value-1,7,key)+1;setCvar(state,"color1",value);return true end function
function UI_ClanName_HandleKey(state,flags,special,key) state.currentTeam=cycle(state.currentTeam,len(state.teams),key);if len(state.teams)>0 then setCvar(state,"ui_teamName",state.teams[state.currentTeam].name) end if;return true end function
function UI_GameType_HandleKey(state,flags,special,key,resetMap) state.currentGameType=cycle(state.currentGameType,len(state.gameTypes),key);if resetMap then state.currentMap=0 end if;setCvar(state,"ui_gameType",state.currentGameType);return true end function
function UI_NetGameType_HandleKey(state,flags,special,key) state.currentNetGameType=cycle(state.currentNetGameType,len(state.gameTypes),key);state.currentMap=0;setCvar(state,"ui_netGameType",state.currentNetGameType);return true end function
function UI_JoinGameType_HandleKey(state,flags,special,key) state.currentJoinGameType=cycle(state.currentJoinGameType,len(state.joinGameTypes),key);setCvar(state,"ui_joinGameType",state.currentJoinGameType);return true end function
function UI_Skill_HandleKey(state,flags,special,key) state.currentBotSkill=cycle(state.currentBotSkill-1,5,key)+1;setCvar(state,"g_spSkill",state.currentBotSkill);return true end function
function UI_TeamName_HandleKey(state,flags,special,key,blue) index=state.currentTeam;if blue then index=state.currentOpponent end if;index=cycle(index,len(state.teams),key);if blue then state.currentOpponent=index;setCvar(state,"ui_blueTeam",state.teams[index].name) else state.currentTeam=index;setCvar(state,"ui_redTeam",state.teams[index].name) end if;return true end function
function UI_TeamMember_HandleKey(state,flags,special,key,blue,num) prefix="ui_redteam";if blue then prefix="ui_blueteam" end if;value=n.trunc32(cvarValue(state,prefix+str(num)));value=cycle(value,6,key);setCvar(state,prefix+str(num),value);return true end function
function UI_NetSource_HandleKey(state,flags,special,key) state.currentNetSource=cycle(state.currentNetSource,4,key);setCvar(state,"ui_netSource",state.currentNetSource);UI_StartServerRefresh(state,true);return true end function
function UI_NetFilter_HandleKey(state,flags,special,key) state.currentNetFilter=cycle(state.currentNetFilter,len(state.gameTypes)+1,key);setCvar(state,"ui_serverFilterType",state.currentNetFilter);return true end function
function UI_OpponentName_HandleKey(state,flags,special,key) if direction(key)<0 then UI_PriorOpponent(state) else UI_NextOpponent(state) end if;if len(state.teams)>0 then setCvar(state,"ui_opponentName",state.teams[state.currentOpponent].name) end if;return true end function
function UI_BotName_HandleKey(state,flags,special,key) state.currentBot=cycle(state.currentBot,len(state.aliases),key);return true end function
function UI_BotSkill_HandleKey(state,flags,special,key) state.currentBotSkill=cycle(state.currentBotSkill-1,5,key)+1;return true end function
function UI_RedBlue_HandleKey(state,flags,special,key) value=n.trunc32(cvarValue(state,"ui_redblue"));value=1-value;setCvar(state,"ui_redblue",value);return true end function
function UI_Crosshair_HandleKey(state,flags,special,key) state.currentCrosshair=cycle(state.currentCrosshair,10,key);setCvar(state,"cg_drawCrosshair",state.currentCrosshair);return true end function
function UI_SelectedPlayer_HandleKey(state,flags,special,key) state.selectedPlayer=cycle(state.selectedPlayer,len(state.teamNames)+1,key);setCvar(state,"cg_selectedPlayer",state.selectedPlayer);return true end function
function UI_OwnerDrawHandleKey(state,ownerDraw,flags,special,key)
  if ownerDraw==200 then return UI_Handicap_HandleKey(state,flags,special,key) else if ownerDraw==201 then return UI_Effects_HandleKey(state,flags,special,key) else if ownerDraw==203 then return UI_ClanName_HandleKey(state,flags,special,key) else if ownerDraw==205 then return UI_GameType_HandleKey(state,flags,special,key,true) else if ownerDraw==207 then return UI_Skill_HandleKey(state,flags,special,key) else if ownerDraw==220 then return UI_NetSource_HandleKey(state,flags,special,key) else if ownerDraw==222 then return UI_NetFilter_HandleKey(state,flags,special,key) else if ownerDraw==237 then return UI_OpponentName_HandleKey(state,flags,special,key) else if ownerDraw==239 then return UI_BotName_HandleKey(state,flags,special,key) else if ownerDraw==240 then return UI_BotSkill_HandleKey(state,flags,special,key) else if ownerDraw==241 then return UI_RedBlue_HandleKey(state,flags,special,key) else if ownerDraw==242 then return UI_Crosshair_HandleKey(state,flags,special,key) else if ownerDraw==243 then return UI_SelectedPlayer_HandleKey(state,flags,special,key) else if ownerDraw==245 then return UI_NetGameType_HandleKey(state,flags,special,key) else if ownerDraw==253 then return UI_JoinGameType_HandleKey(state,flags,special,key) end if;return false
end function
function UI_GetValue(state,ownerDraw) return 0.0 end function

function compareText(left,right) a=bytes(strings.toLowerAscii(left));b=bytes(strings.toLowerAscii(right));count=len(a);if len(b)<count then count=len(b) end if;for i=0 to count-1 if a[i]<b[i] then return -1 else if a[i]>b[i] then return 1 end if end for;if len(a)<len(b) then return -1 else if len(a)>len(b) then return 1 end if;return 0 end function
function UI_ServersQsortCompare(state,leftIndex,rightIndex)
  left=state.servers[leftIndex];right=state.servers[rightIndex];result=0
  if state.sortKey==0 then result=compareText(left.hostname,right.hostname)
  else if state.sortKey==1 then result=compareText(left.mapname,right.mapname)
  else if state.sortKey==2 then result=left.clients-right.clients
  else if state.sortKey==3 then result=left.gametype-right.gametype
  else if state.sortKey==4 then result=left.ping-right.ping
  else if state.sortKey==5 then result=left.punkbuster-right.punkbuster end if
  if state.sortDir!=0 then result=0-result end if;return result
end function
function UI_ServersSort(state,column,force)
  if not force and state.sortKey==column then return false end if;state.sortKey=column
  sorted=[];for each index in state.displayServers inserted=false;next=[];for each old in sorted if not inserted and UI_ServersQsortCompare(state,index,old)<0 then next=next+[index];inserted=true end if;next=next+[old] end for;if not inserted then next=next+[index] end if;sorted=next end for;state.displayServers=sorted;return true
end function
function UI_InsertServerIntoDisplayList(state,num,position) if containsValue(state.displayServers,num) then return false end if;position=clamp(position,0,len(state.displayServers));result=[];inserted=false;if len(state.displayServers)>0 then for i=0 to len(state.displayServers)-1 if i==position then result=result+[num];inserted=true end if;result=result+[state.displayServers[i]] end for end if;if not inserted then result=result+[num] end if;state.displayServers=result;return true end function
function UI_RemoveServerFromDisplayList(state,num) result=[];removed=false;for each value in state.displayServers if value==num then removed=true else result=result+[value] end if end for;state.displayServers=result;return removed end function
function UI_BinaryServerInsertion(state,num) low=0;high=len(state.displayServers);while low<high mid=(low+high)>>1;if UI_ServersQsortCompare(state,num,state.displayServers[mid])<0 then high=mid else low=mid+1 end if end while;return UI_InsertServerIntoDisplayList(state,num,low) end function
function serverPasses(state,server)
  if not server.visible or server.ping<=0 then return false end if
  if state.currentNetSource==AS_FAVORITES and not server.favorite then return false end if
  if numbers.atoi(cvarString(state,"ui_browserShowEmpty"))==0 and server.clients==0 then return false end if
  if numbers.atoi(cvarString(state,"ui_browserShowFull"))==0 and server.clients>=server.maxClients then return false end if
  if state.currentNetFilter>0 and server.gametype!=state.currentNetFilter-1 then return false end if;return true
end function
function UI_BuildServerDisplayList(state,force)
  if force then state.displayServers=[];state.numPlayersOnServers=0 end if
  for index=0 to len(state.servers)-1 server=state.servers[index];passes=serverPasses(state,server);shown=containsValue(state.displayServers,index);if passes and not shown then UI_BinaryServerInsertion(state,index);state.numPlayersOnServers=state.numPlayersOnServers+server.clients else if not passes and shown then UI_RemoveServerFromDisplayList(state,index) end if end for
  return len(state.displayServers)
end function
function UI_SortServerStatusInfo(state,rows)
  keys=[];values=[];for each row in rows if len(row)>=2 and (row[0]=="Address" or row[0]=="Name" or row[0]=="Game name" or row[0]=="Game type") then keys=keys+[row] else values=values+[row] end if end for
  sorted=[];for each row in values inserted=false;next=[];for each old in sorted if not inserted and compareText(row[0],old[0])<0 then next=next+[row];inserted=true end if;next=next+[old] end for;if not inserted then next=next+[row] end if;sorted=next end for;state.serverStatusLines=keys+sorted;return state.serverStatusLines
end function
function UI_GetServerStatusInfo(state,address,statusText)
  if address=="" or statusText=="" then return false end if;rows=[["Address",address,"",""]];lines=strings.split(statusText,"\n");for each line in lines fields=strings.split(line,"\t");if len(fields)>=2 then row=[fields[0],fields[1],"",""];if len(fields)>=4 then row=fields end if;rows=rows+[row] end if end for;UI_SortServerStatusInfo(state,rows);return true
end function
function stristr(text,needle) if needle=="" then return 0 end if;return strings.indexOf(strings.toLowerAscii(text),strings.toLowerAscii(needle),0) end function
function UI_BuildFindPlayerList(state,force)
  if not force and state.realtime<state.nextDisplayRefresh then return len(state.foundPlayerNames) end if;wanted=strings.toLowerAscii(cvarString(state,"ui_findPlayer"));state.foundPlayerNames=[];state.foundPlayerAddresses=[]
  if wanted=="" then return 0 end if
  for each server in state.servers if strings.indexOf(strings.toLowerAscii(server.hostname),wanted,0)>=0 then state.foundPlayerNames=state.foundPlayerNames+[server.hostname];state.foundPlayerAddresses=state.foundPlayerAddresses+[server.address] end if end for;state.nextDisplayRefresh=state.realtime+1000;return len(state.foundPlayerNames)
end function
function UI_BuildServerStatus(state,force) if len(state.displayServers)==0 then state.serverStatusLines=[];return false end if;index=state.displayServers[clamp(n.trunc32(cvarValue(state,"ui_serverStatusIndex")),0,len(state.displayServers)-1)];server=state.servers[index];state.serverStatusLines=[["Address",server.address,"",""],["Name",server.hostname,"",""],["Map",server.mapname,"",""]];return true end function

function UI_MapCountByGameType(state,singlePlayer)
  bit=1<<state.currentGameType;count=0;for each map in state.maps map.active=(map.typeBits&bit)!=0;if map.active then count=count+1 end if end for;if state.currentMap>=count then state.currentMap=0 end if;return count
end function
function UI_HeadCountByTeam(state) count=0;for each character in state.characters character.active=true;if character.active then count=count+1 end if end for;return count end function
function UI_SelectedMap(state,index,actual) count=0;actual[0]=0;for i=0 to len(state.maps)-1 if state.maps[i].active then if count==index then actual[0]=i;return state.maps[i].mapName end if;count=count+1 end if end for;return "" end function
function UI_SelectedHead(state,index,actual) count=0;actual[0]=0;for i=0 to len(state.characters)-1 if state.characters[i].active then if count==index then actual[0]=i;return state.characters[i].name end if;count=count+1 end if end for;return "" end function
function UI_GetIndexFromSelection(state,actual) count=0;for i=0 to len(state.maps)-1 if state.maps[i].active then if i==actual then return count end if;count=count+1 end if end for;return 0 end function
function UI_UpdatePendingPings(state) emit(state,"lan","reset-pings",str(state.currentNetSource),"",[]);state.refreshActive=true;state.refreshTime=state.realtime+1000;return void end function
function UI_FeederCount(state,feederID)
  if feederID==FEEDER_HEADS then return UI_HeadCountByTeam(state) else if feederID==FEEDER_Q3HEADS then return len(state.q3HeadNames) else if feederID==FEEDER_CINEMATICS then return len(state.movies) else if feederID==FEEDER_MAPS or feederID==FEEDER_ALLMAPS then return UI_MapCountByGameType(state,feederID==FEEDER_MAPS) else if feederID==FEEDER_SERVERS then return len(state.displayServers) else if feederID==FEEDER_SERVERSTATUS then return len(state.serverStatusLines) else if feederID==FEEDER_FINDPLAYER then return len(state.foundPlayerNames) else if feederID==FEEDER_PLAYER_LIST then return len(state.playerNames) else if feederID==FEEDER_TEAM_LIST then return len(state.teamNames) else if feederID==FEEDER_MODS then return len(state.mods) else if feederID==FEEDER_DEMOS then return len(state.demos) end if;return 0
end function
function UI_FeederItemText(state,feederID,index,column)
  if feederID==FEEDER_HEADS then actual=[0];return UI_SelectedHead(state,index,actual) else if feederID==FEEDER_Q3HEADS and index>=0 and index<len(state.q3HeadNames) then return state.q3HeadNames[index] else if feederID==FEEDER_MAPS or feederID==FEEDER_ALLMAPS then actual=[0];return UI_SelectedMap(state,index,actual)
  else if feederID==FEEDER_SERVERS and index>=0 and index<len(state.displayServers) then server=state.servers[state.displayServers[index]];if column==0 then if server.ping<=0 then return server.address end if;return server.hostname else if column==1 then return server.mapname else if column==2 then return str(server.clients)+" ("+str(server.maxClients)+")" else if column==3 then if server.gametype>=0 and server.gametype<len(state.gameTypes) then return state.gameTypes[server.gametype][0] end if;return "Unknown" else if column==4 then if server.ping<=0 then return "..." end if;return str(server.ping) else if column==5 then if server.punkbuster then return "Yes" end if;return "No" end if
  else if feederID==FEEDER_SERVERSTATUS and index>=0 and index<len(state.serverStatusLines) and column>=0 and column<len(state.serverStatusLines[index]) then return state.serverStatusLines[index][column] else if feederID==FEEDER_FINDPLAYER and index>=0 and index<len(state.foundPlayerNames) then return state.foundPlayerNames[index] else if feederID==FEEDER_PLAYER_LIST and index>=0 and index<len(state.playerNames) then return state.playerNames[index] else if feederID==FEEDER_TEAM_LIST and index>=0 and index<len(state.teamNames) then return state.teamNames[index] else if feederID==FEEDER_MODS and index>=0 and index<len(state.mods) then if state.mods[index].description!="" then return state.mods[index].description end if;return state.mods[index].name else if feederID==FEEDER_CINEMATICS and index>=0 and index<len(state.movies) then return state.movies[index] else if feederID==FEEDER_DEMOS and index>=0 and index<len(state.demos) then return state.demos[index] end if;return ""
end function
function UI_FeederItemImage(state,feederID,index)
  if feederID==FEEDER_HEADS then actual=[0];UI_SelectedHead(state,index,actual);if actual[0]<len(state.characters) then character=state.characters[actual[0]];if character.headImage<0 then character.headImage=len(state.assets)+1;state.assets=state.assets+[character.imageName];emit(state,"renderer","register-shader",character.imageName,"",[]) end if;return character.headImage end if else if feederID==FEEDER_Q3HEADS and index>=0 and index<len(state.q3HeadIcons) then return state.q3HeadIcons[index] else if feederID==FEEDER_MAPS or feederID==FEEDER_ALLMAPS then actual=[0];UI_SelectedMap(state,index,actual);if actual[0]<len(state.maps) then map=state.maps[actual[0]];if map.levelShot<0 then map.levelShot=len(state.assets)+1;state.assets=state.assets+[map.imageName];emit(state,"renderer","register-shader",map.imageName,"",[]) end if;return map.levelShot end if end if;return 0
end function
function UI_FeederSelection(state,feederID,index)
  if feederID==FEEDER_HEADS then actual=[0];UI_SelectedHead(state,index,actual);setCvar(state,"model",state.characters[actual[0]].base)
  else if feederID==FEEDER_MAPS or feederID==FEEDER_ALLMAPS then actual=[0];UI_SelectedMap(state,index,actual);state.currentMap=actual[0];setCvar(state,"ui_mapIndex",index)
  else if feederID==FEEDER_SERVERS then setCvar(state,"ui_serverStatusIndex",index);UI_BuildServerStatus(state,true)
  else if feederID==FEEDER_FINDPLAYER and index<len(state.foundPlayerAddresses) then setCvar(state,"ui_serverStatusAddress",state.foundPlayerAddresses[index])
  else if feederID==FEEDER_PLAYER_LIST or feederID==FEEDER_TEAM_LIST then state.selectedPlayer=index;setCvar(state,"cg_selectedPlayer",index)
  else if feederID==FEEDER_MODS then setCvar(state,"fs_game",state.mods[index].name)
  else if feederID==FEEDER_CINEMATICS then setCvar(state,"ui_movie",state.movies[index]) else if feederID==FEEDER_DEMOS then setCvar(state,"ui_demo",state.demos[index]) end if;return void
end function

function UI_LoadMods(state,entries) state.mods=[];for each pair in entries if len(state.mods)>=64 then break end if;description="";if len(pair)>1 then description=pair[1] end if;state.mods=state.mods+[ModInfo(pair[0],description)] end for;return len(state.mods) end function
function UI_LoadTeams(state,entries) state.teams=[];for each row in entries members=[];if len(row)>2 then members=row[2] end if;state.teams=state.teams+[teamInfo(row[0],row[1],members)] end for;return len(state.teams) end function
function stripExtension(name,extension) lower=strings.toLowerAscii(name);suffix=strings.toLowerAscii(extension);if strings.endsWith(lower,suffix) then return strings.substr(name,0,len(bytes(name))-len(bytes(extension))) end if;return name end function
function UI_LoadMovies(state,files) state.movies=[];for each file in files if len(state.movies)>=64 then break end if;state.movies=state.movies+[strings.toUpperAscii(stripExtension(file,".roq"))] end for;return len(state.movies) end function
function UI_LoadDemos(state,files,protocol) state.demos=[];extension=".dm_"+str(protocol);for each file in files if len(state.demos)>=128 then break end if;state.demos=state.demos+[strings.toUpperAscii(stripExtension(file,extension))] end for;return len(state.demos) end function
function UI_SetNextMap(state,actual,index) for i=actual+1 to len(state.maps)-1 if state.maps[i].active then state.currentMap=i;emit(state,"menu","feeder-selection","skirmish","",[FEEDER_MAPS,index+1]);return true end if end for;return false end function
function UI_StartSinglePlayer(state) return UI_StartSkirmish(state,false) end function
function UI_StartSkirmish(state,next)
  if len(state.maps)==0 then return false end if;if next then actual=state.currentMap;if not UI_SetNextMap(state,actual,UI_GetIndexFromSelection(state,actual)) then UI_GameType_HandleKey(state,0,0,K_MOUSE1,false);state.currentMap=0 end if end if
  map=state.maps[state.currentMap];game=state.gameTypes[clamp(state.currentGameType,0,len(state.gameTypes)-1)][1];setCvar(state,"g_gametype",game);setCvar(state,"ui_scoreMap",map.mapName);setCvar(state,"ui_singlePlayerActive","1");setCvar(state,"cg_cameraOrbit","0");setCvar(state,"cg_thirdPerson","0");setCvar(state,"cg_drawTimer","1");setCvar(state,"g_doWarmup","1");setCvar(state,"g_warmup","15");setCvar(state,"sv_pure","0");setCvar(state,"g_friendlyFire","0");emit(state,"command","append","map",map.mapLoadName,[game]);return true
end function

function UI_SetCapFragLimits(state,uiVars)
  game=state.currentGameType;frag="0";capture="0";time="0";friendly="0"
  if game==GT_FFA then frag=cvarString(state,"ui_ffa_fraglimit");time=cvarString(state,"ui_ffa_timelimit")
  else if game==GT_TOURNAMENT then frag=cvarString(state,"ui_tourney_fraglimit");time=cvarString(state,"ui_tourney_timelimit")
  else if game==GT_TEAM then frag=cvarString(state,"ui_team_fraglimit");time=cvarString(state,"ui_team_timelimit");friendly=cvarString(state,"ui_team_friendly")
  else if game>=GT_CTF then capture=cvarString(state,"ui_ctf_capturelimit");time=cvarString(state,"ui_ctf_timelimit");friendly=cvarString(state,"ui_ctf_friendly") end if
  if uiVars then setCvar(state,"ui_fragLimit",frag);setCvar(state,"ui_captureLimit",capture) else setCvar(state,"fraglimit",frag);setCvar(state,"capturelimit",capture);setCvar(state,"timelimit",time);setCvar(state,"g_friendlyFire",friendly) end if;return void
end function
function UI_Update(state,name)
  lower=strings.toLowerAscii(name)
  if lower=="ui_setname" then setCvar(state,"name",cvarString(state,"ui_Name"))
  else if lower=="ui_setrate" then rate=cvarValue(state,"rate");if rate>=5000 then setCvar(state,"cl_maxpackets","30");setCvar(state,"cl_packetdup","1") else if rate>=4000 then setCvar(state,"cl_maxpackets","15");setCvar(state,"cl_packetdup","2") else setCvar(state,"cl_maxpackets","15");setCvar(state,"cl_packetdup","1") end if
  else if lower=="ui_getname" then setCvar(state,"ui_Name",cvarString(state,"name"))
  else if lower=="ui_setcolor" then setCvar(state,"color1",cvarString(state,"ui_effectsColor"))
  else if lower=="ui_glcustom" then preset=n.trunc32(cvarValue(state,"ui_glCustom"));if preset==0 then setCvar(state,"r_subdivisions","4");setCvar(state,"r_vertexLight","0") else if preset==1 then setCvar(state,"r_subdivisions","12");setCvar(state,"r_vertexLight","1") end if
  else if lower=="ui_mousepitch" then value=cvarValue(state,"m_pitch");if numbers.atoi(cvarString(state,"ui_mousePitch"))==0 and value<0 then value=0.0-value else if numbers.atoi(cvarString(state,"ui_mousePitch"))!=0 and value>0 then value=0.0-value end if;setCvar(state,"m_pitch",value)
  else if lower=="ui_setcrosshair" then setCvar(state,"cg_drawCrosshair",state.currentCrosshair)
  else if lower=="ui_setgametype" then UI_SetCapFragLimits(state,true) end if;return true
end function
function UI_RunMenuScript(state,args)
  if len(args)==0 then return false end if;command=strings.toLowerAscii(args[0])
  if command=="startserver" then
    setCvar(state,"cg_thirdPerson","0");setCvar(state,"cg_cameraOrbit","0");setCvar(state,"ui_singlePlayerActive","0");setCvar(state,"dedicated",clamp(n.trunc32(cvarValue(state,"ui_dedicated")),0,2));if len(state.maps)>0 then emit(state,"command","append","map",state.maps[clamp(state.currentMap,0,len(state.maps)-1)].mapLoadName,[]) end if
  else if command=="updatespmenu" then UI_SetCapFragLimits(state,true);UI_MapCountByGameType(state,true);setCvar(state,"ui_mapIndex",UI_GetIndexFromSelection(state,state.currentMap));emit(state,"menu","feeder-selection","skirmish","",[FEEDER_MAPS,n.trunc32(cvarValue(state,"ui_mapIndex"))])
  else if command=="resetdefaults" then emit(state,"command","append","exec","default.cfg",[]);emit(state,"command","append","cvar_restart","",[]);emit(state,"controls","defaults","","",[]);setCvar(state,"com_introPlayed","1");emit(state,"command","append","vid_restart","",[])
  else if command=="getcdkey" then emit(state,"cdkey","read","","",[])
  else if command=="verifycdkey" then key=cvarString(state,"cdkey1")+cvarString(state,"cdkey2")+cvarString(state,"cdkey3")+cvarString(state,"cdkey4");setCvar(state,"cdkey",key);emit(state,"cdkey","verify",key,cvarString(state,"cdkeychecksum"),[])
  else if command=="loadarenas" then emit(state,"gameinfo","load-arenas","","",[]);UI_MapCountByGameType(state,false);emit(state,"menu","feeder-selection","createserver","",[FEEDER_ALLMAPS,0])
  else if command=="savecontrols" then emit(state,"controls","save","","",[true])
  else if command=="loadcontrols" then emit(state,"controls","load","","",[])
  else if command=="clearerror" then setCvar(state,"com_errorMessage","")
  else if command=="loadgameinfo" then emit(state,"gameinfo","load","gameinfo.txt","",[])
  else if command=="resetscores" then emit(state,"scores","clear","","",[])
  else if command=="refreshservers" then UI_StartServerRefresh(state,true);UI_BuildServerDisplayList(state,true)
  else if command=="refreshfilter" then UI_StartServerRefresh(state,false);UI_BuildServerDisplayList(state,true)
  else if command=="runspdemo" then if state.demoAvailable and len(state.maps)>0 then emit(state,"command","append","demo",state.maps[state.currentMap].mapLoadName+"_"+str(state.currentGameType),[]) end if
  else if command=="loaddemos" then emit(state,"filesystem","list","demos","",[])
  else if command=="loadmovies" then emit(state,"filesystem","list","video","roq",[])
  else if command=="loadmods" then emit(state,"filesystem","list","$modlist","",[])
  else if command=="playmovie" then movie=cvarString(state,"ui_movie");if len(args)>1 then movie=args[1] end if;emit(state,"command","append","cinematic",movie+".roq 2",[])
  else if command=="runmod" then name=cvarString(state,"fs_game");if len(args)>1 then name=args[1] end if;setCvar(state,"fs_game",name);emit(state,"command","append","vid_restart","",[])
  else if command=="rundemo" then demo=cvarString(state,"ui_demo");if len(args)>1 then demo=args[1] end if;emit(state,"command","append","demo",demo,[])
  else if command=="quake3" then setCvar(state,"fs_game","");emit(state,"command","append","vid_restart","",[])
  else if command=="closejoin" then if state.refreshActive then UI_StopServerRefresh(state);state.nextDisplayRefresh=0;UI_BuildServerDisplayList(state,true) else emit(state,"menu","close","joinserver","",[]);emit(state,"menu","activate","main","",[]) end if
  else if command=="stoprefresh" then UI_StopServerRefresh(state);state.nextDisplayRefresh=0
  else if command=="updatefilter" then if state.currentNetSource==AS_LOCAL then UI_StartServerRefresh(state,true) end if;UI_BuildServerDisplayList(state,true);if len(state.displayServers)>0 then UI_FeederSelection(state,FEEDER_SERVERS,0) end if
  else if command=="serverstatus" then UI_BuildServerStatus(state,true)
  else if command=="foundplayerserverstatus" then UI_BuildServerStatus(state,true);emit(state,"menu","feeder-selection","","",[FEEDER_FINDPLAYER,0])
  else if command=="findplayer" then UI_BuildFindPlayerList(state,true);state.serverStatusLines=[];emit(state,"menu","feeder-selection","","",[FEEDER_FINDPLAYER,0])
  else if command=="joinserver" then setCvar(state,"cg_thirdPerson","0");setCvar(state,"cg_cameraOrbit","0");setCvar(state,"ui_singlePlayerActive","0");if len(state.displayServers)>0 then emit(state,"command","append","connect",state.servers[state.displayServers[0]].address,[]) end if
  else if command=="foundplayerjoinserver" then setCvar(state,"ui_singlePlayerActive","0");if len(state.foundPlayerAddresses)>0 then emit(state,"command","append","connect",state.foundPlayerAddresses[0],[]) end if
  else if command=="quit" then setCvar(state,"ui_singlePlayerActive","0");emit(state,"command","now","quit","",[])
  else if command=="controls" then _UI_SetActiveMenu(state,4);emit(state,"menu","activate","setup_menu2","",[])
  else if command=="leave" then emit(state,"command","append","disconnect","",[]);emit(state,"menu","activate","main","",[])
  else if command=="serversort" then if len(args)>1 then column=numbers.atoi(args[1]);if column==state.sortKey then state.sortDir=1-state.sortDir end if;UI_ServersSort(state,column,true) end if
  else if command=="nextskirmish" then return UI_StartSkirmish(state,true)
  else if command=="skirmishstart" or command=="startskirmish" then return UI_StartSkirmish(state,false)
  else if command=="closeingame" then _UI_SetActiveMenu(state,0)
  else if command=="votemap" then if len(state.maps)>0 then emit(state,"command","append","callvote map",state.maps[state.currentMap].mapLoadName,[]) end if
  else if command=="votekick" then if len(state.playerNames)>0 then emit(state,"command","append","callvote kick",state.playerNames[clamp(state.selectedPlayer,0,len(state.playerNames)-1)],[]) end if
  else if command=="votegame" then emit(state,"command","append","callvote g_gametype",str(state.currentNetGameType),[])
  else if command=="voteleader" then if len(state.teamNames)>0 then emit(state,"command","append","callteamvote leader",state.teamNames[clamp(state.selectedPlayer,0,len(state.teamNames)-1)],[]) end if
  else if command=="addbot" then if len(state.characters)>0 then emit(state,"command","append","addbot",state.characters[clamp(state.currentBot,0,len(state.characters)-1)].name,[state.currentBotSkill,numbers.atoi(cvarString(state,"ui_redblue"))]) end if
  else if command=="addfavorite" then if state.currentNetSource!=AS_FAVORITES and len(state.displayServers)>0 then state.servers[state.displayServers[0]].favorite=true;emit(state,"lan","add-favorite",state.servers[state.displayServers[0]].address,state.servers[state.displayServers[0]].hostname,[]) end if
  else if command=="deletefavorite" then if state.currentNetSource==AS_FAVORITES and len(state.displayServers)>0 then state.servers[state.displayServers[0]].favorite=false;emit(state,"lan","remove-favorite",state.servers[state.displayServers[0]].address,"",[]) end if
  else if command=="createfavorite" then if state.currentNetSource==AS_FAVORITES then emit(state,"lan","add-favorite",cvarString(state,"ui_favoriteAddress"),cvarString(state,"ui_favoriteName"),[]) end if
  else if command=="orders" or command=="voiceordersteam" or command=="voiceorders" then if len(args)>1 then emit(state,"command","append",command,args[1],[state.selectedPlayer]) end if;_UI_SetActiveMenu(state,0)
  else if command=="glcustom" then setCvar(state,"ui_glCustom","4")
  else if command=="update" then if len(args)>1 then UI_Update(state,args[1]) end if
  else if command=="setpbclstatus" then if len(args)>1 then emit(state,"punkbuster","set-client-status","","",[numbers.atoi(args[1])]) end if
  else return false end if;return true
end function

function parseOpen(tokens,start) if start>=len(tokens) or tokens[start]!="{" then return -1 end if;return start+1 end function
function Team_Parse(state,tokens,start)
  at=parseOpen(tokens,start);if at<0 then return ParseResult(false,start) end if
  while at<len(tokens) and tokens[at]!="}"
    if tokens[at]!="{" or at+8>=len(tokens) then return ParseResult(false,at) end if;at=at+1;name=tokens[at];image=tokens[at+1];members=[];for i=0 to 4 members=members+[tokens[at+2+i]] end for;at=at+7;if at>=len(tokens) or tokens[at]!="}" then return ParseResult(false,at) end if;at=at+1;state.teams=state.teams+[TeamInfo(name,image,members,-1)];emit(state,"renderer","register-team",image,"",[])
  end while;if at<len(tokens) then return ParseResult(true,at+1) end if;return ParseResult(false,at)
end function
function Character_Parse(state,tokens,start)
  at=parseOpen(tokens,start);if at<0 then return ParseResult(false,start) end if
  while at<len(tokens) and tokens[at]!="}" if tokens[at]!="{" or at+3>=len(tokens) then return ParseResult(false,at) end if;name=tokens[at+1];kind=strings.toLowerAscii(tokens[at+2]);base=tokens[at+2];if kind=="female" then base="Janet" else if kind=="male" then base="James" end if;state.characters=state.characters+[CharacterInfo(name,base,"models/players/heads/"+name+"/icon_default.tga",true,-1)];at=at+3;if tokens[at]!="}" then return ParseResult(false,at) end if;at=at+1 end while;if at<len(tokens) then return ParseResult(true,at+1) end if;return ParseResult(false,at)
end function
function Alias_Parse(state,tokens,start)
  at=parseOpen(tokens,start);if at<0 then return ParseResult(false,start) end if
  while at<len(tokens) and tokens[at]!="}" if tokens[at]!="{" or at+4>=len(tokens) then return ParseResult(false,at) end if;state.aliases=state.aliases+[AliasInfo(tokens[at+1],tokens[at+2],tokens[at+3])];at=at+4;if tokens[at]!="}" then return ParseResult(false,at) end if;at=at+1 end while;if at<len(tokens) then return ParseResult(true,at+1) end if;return ParseResult(false,at)
end function
function GameType_Parse(state,tokens,start,join)
  at=parseOpen(tokens,start);if at<0 then return ParseResult(false,start) end if;rows=[]
  while at<len(tokens) and tokens[at]!="}" if tokens[at]!="{" or at+3>=len(tokens) then return ParseResult(false,at) end if;rows=rows+[[tokens[at+1],numbers.atoi(tokens[at+2])]];at=at+3;if tokens[at]!="}" then return ParseResult(false,at) end if;at=at+1 end while;if join then state.joinGameTypes=rows else state.gameTypes=rows end if;if at<len(tokens) then return ParseResult(true,at+1) end if;return ParseResult(false,at)
end function
function MapList_Parse(state,tokens,start)
  at=parseOpen(tokens,start);if at<0 then return ParseResult(false,start) end if;state.maps=[]
  while at<len(tokens) and tokens[at]!="}"
    if tokens[at]!="{" or at+5>=len(tokens) then return ParseResult(false,at) end if;at=at+1;name=tokens[at];load=tokens[at+1];members=numbers.atoi(tokens[at+2]);opponent=tokens[at+3];at=at+4;map=mapInfo(load,name,0);map.teamMembers=members;map.opponentName=opponent
    while at<len(tokens) and tokens[at]!="}" game=numbers.atoi(tokens[at]);at=at+1;if game<0 or game>=8 or at>=len(tokens) then return ParseResult(false,at) end if;map.typeBits=map.typeBits|(1<<game);map.timeToBeat[game]=numbers.atoi(tokens[at]);at=at+1 end while;if at>=len(tokens) then return ParseResult(false,at) end if;at=at+1;state.maps=state.maps+[map];emit(state,"renderer","register-shader",load+"_small","",[])
  end while;if at<len(tokens) then return ParseResult(true,at+1) end if;return ParseResult(false,at)
end function
function tokenize(text)
  data=bytes(text);result=[];at=0
  while at<len(data)
    while at<len(data) and data[at]<=32 at=at+1 end while;if at>=len(data) then break end if
    if data[at]==47 and at+1<len(data) and data[at+1]==47 then while at<len(data) and data[at]!=10 at=at+1 end while;continue end if
    if data[at]==123 or data[at]==125 then result=result+[decode(slice(data,at,1))];at=at+1;continue end if
    if data[at]==34 then at=at+1;start=at;while at<len(data) and data[at]!=34 at=at+1 end while;result=result+[decode(slice(data,start,at-start))];if at<len(data) then at=at+1 end if;continue end if
    start=at;while at<len(data) and data[at]>32 and data[at]!=123 and data[at]!=125 at=at+1 end while;result=result+[decode(slice(data,start,at-start))]
  end while;return result
end function
function UI_ParseTeamInfo(state,teamFile,text) tokens=tokenize(text);at=0;parsed=ParseResult(false,0);while at<len(tokens) key=strings.toLowerAscii(tokens[at]);at=at+1;if key=="teams" then parsed=Team_Parse(state,tokens,at) else if key=="characters" then parsed=Character_Parse(state,tokens,at) else if key=="aliases" then parsed=Alias_Parse(state,tokens,at) else continue end if;if not parsed.ok then return false end if;at=parsed.next end while;emit(state,"filesystem","parse-team",teamFile,"",[]);return true end function
function UI_ParseGameInfo(state,gameFile,text) tokens=tokenize(text);at=0;parsed=ParseResult(false,0);while at<len(tokens) key=strings.toLowerAscii(tokens[at]);at=at+1;if key=="gametypes" then parsed=GameType_Parse(state,tokens,at,false) else if key=="joingametypes" then parsed=GameType_Parse(state,tokens,at,true) else if key=="maps" then parsed=MapList_Parse(state,tokens,at) else continue end if;if not parsed.ok then return false end if;at=parsed.next end while;emit(state,"filesystem","parse-game",gameFile,"",[]);return true end function

function UI_GetTeamColor(state) if numbers.atoi(cvarString(state,"ui_redblue"))==0 then return [1.0,0.0,0.0,1.0] end if;return [0.0,0.0,1.0,1.0] end function
function UI_hasSkinForBase(state,base,team) wanted=strings.toLowerAscii(base);suffix="/"+strings.toLowerAscii(team);for each name in state.q3HeadNames lower=strings.toLowerAscii(name);if strings.startsWith(lower,wanted) and strings.endsWith(lower,suffix) then return true end if end for;return false end function
function UI_BuildQ3Model_List(state,icons) state.q3HeadNames=[];state.q3HeadIcons=[];for each icon in icons lower=strings.toLowerAscii(icon);if strings.endsWith(lower,"icon_default.tga") or strings.indexOf(lower,"icon_",0)>=0 then state.q3HeadNames=state.q3HeadNames+[icon];state.q3HeadIcons=state.q3HeadIcons+[len(state.assets)+1];state.assets=state.assets+[icon] end if end for;return len(state.q3HeadNames) end function
function UI_EnglishMapName(state,map) for each value in state.maps if strings.toLowerAscii(value.mapLoadName)==strings.toLowerAscii(map) then return value.mapName end if end for;return map end function
function UI_LoadNonIngame(state,files) return UI_LoadMenus(state,"ui/menus.txt",true,files) end function
function UI_Pause(state,value) state.paused=value;setCvar(state,"cl_paused",value);setCvar(state,"sv_paused",value);return void end function

function UI_ReadableSize(value)
  if value>1073741824 then return str(n.quotient(value,1073741824))+"."+twoDigits(signedQuotient(n.mul32(value%1073741824,100),1073741824))+" GB"
  else if value>1048576 then return str(n.quotient(value,1048576))+"."+twoDigits(signedQuotient(n.mul32(value%1048576,100),1048576))+" MB"
  else if value>1024 then return str(n.quotient(value,1024))+" KB" end if;return str(value)+" bytes"
end function
function twoDigits(value) if value<10 and value>=0 then return "0"+str(value) end if;return str(value) end function
function signedQuotient(value,divisor) if value<0 then return 0-n.quotient(0-value,divisor) end if;return n.quotient(value,divisor) end function
function UI_PrintTime(time) seconds=n.quotient(time,1000);if seconds>3600 then return str(n.quotient(seconds,3600))+" hr "+str(n.quotient(seconds%3600,60))+" min" else if seconds>60 then return str(n.quotient(seconds,60))+" min "+str(seconds%60)+" sec" end if;return str(seconds)+" sec" end function
function UI_DisplayDownloadInfo(state,downloadName,centerPoint,yStart,scale)
  size=n.trunc32(cvarValue(state,"cl_downloadSize"));count=n.trunc32(cvarValue(state,"cl_downloadCount"));start=n.trunc32(cvarValue(state,"cl_downloadTime"));elapsed=state.realtime-start;rate=0;if elapsed>0 then rate=n.quotient(count*1000,elapsed) end if;remaining=0;if rate>0 and size>count then remaining=n.quotient((size-count)*1000,rate) end if
  text=downloadName+" "+UI_ReadableSize(count)+" of "+UI_ReadableSize(size);emit(state,"renderer","download",downloadName,text,[centerPoint,yStart,scale,rate,remaining]);return [rate,remaining,text]
end function
function UI_DrawConnectScreen(state,overlay)
  connection=cvarString(state,"ui_connectState");loading=cvarString(state,"ui_loadingText");if connection!=str(state.lastConnState) or loading!=state.lastLoadingText then state.lastConnState=numbers.atoi(connection);state.lastLoadingText=loading end if
  action=emit(state,"renderer","connect-screen",connection,loading,[overlay]);download=cvarString(state,"cl_downloadName");if download!="" then UI_DisplayDownloadInfo(state,download,320.0,130.0,0.5) end if;return action
end function

function UI_StopServerRefresh(state)
  if not state.refreshActive then return false end if;state.refreshActive=false;emit(state,"lan","refresh-stop",str(state.currentNetSource),"",[len(state.displayServers),state.numPlayersOnServers]);return true
end function
function ArenaServers_MaxPing(state) value=n.trunc32(cvarValue(state,"cl_maxPing"));if value<100 then value=100 end if;return value end function
function UI_DoServerRefresh(state)
  if not state.refreshActive then return false end if;if state.realtime<state.refreshTime then return false end if;UI_BuildServerDisplayList(state,false);pending=false;for each server in state.servers if server.visible and server.ping<=0 then pending=true end if end for;if pending then state.refreshTime=state.realtime+1000;emit(state,"lan","update-pings",str(state.currentNetSource),"",[]) else UI_BuildServerDisplayList(state,true);UI_StopServerRefresh(state) end if;return true
end function
function UI_StartServerRefresh(state,full)
  state.serverRefreshDate="now";setCvar(state,"ui_lastServerRefresh_"+str(state.currentNetSource),state.serverRefreshDate)
  if not full then UI_UpdatePendingPings(state);return true end if;state.refreshActive=true;state.nextDisplayRefresh=state.realtime+1000;state.displayServers=[];state.numPlayersOnServers=0;for each server in state.servers server.visible=true end for;emit(state,"lan","mark-visible",str(state.currentNetSource),"",[-1,true]);emit(state,"lan","reset-pings",str(state.currentNetSource),"",[])
  if state.currentNetSource==AS_LOCAL then emit(state,"command","now","localservers","",[]);state.refreshTime=state.realtime+1000 else state.refreshTime=state.realtime+5000;if state.currentNetSource==AS_GLOBAL or state.currentNetSource==AS_MPLAYER then emit(state,"command","now","globalservers",cvarString(state,"protocol"),[state.currentNetSource-AS_GLOBAL]) end if end if;return true
end function

function defaultCvars()
  rows=[["ui_ffa_fraglimit","20"],["ui_ffa_timelimit","0"],["ui_tourney_fraglimit","0"],["ui_tourney_timelimit","15"],["ui_team_fraglimit","0"],["ui_team_timelimit","20"],["ui_team_friendly","1"],["ui_ctf_capturelimit","8"],["ui_ctf_timelimit","30"],["ui_ctf_friendly","0"],["g_arenasFile",""],["g_botsFile",""],["g_spScores1",""],["g_spScores2",""],["g_spScores3",""],["g_spScores4",""],["g_spScores5",""],["g_spAwards",""],["g_spVideos",""],["g_spSkill","2"],["ui_spSelection",""]]
  rows=rows+[["ui_browserMaster","0"],["ui_browserGameType","0"],["ui_browserSortKey","4"],["ui_browserShowFull","1"],["ui_browserShowEmpty","1"],["cg_brassTime","2500"],["cg_drawCrosshair","4"],["cg_drawCrosshairNames","1"],["cg_marks","1"]];for i=1 to 16 rows=rows+[["server"+str(i),""]] end for
  rows=rows+[["ui_cdkeychecked","0"],["ui_new","0"],["ui_debug","0"],["ui_initialized","0"],["ui_teamName","Pagans"],["ui_opponentName","Stroggs"],["ui_redteam","Pagans"],["ui_blueteam","Stroggs"],["ui_dedicated","0"],["ui_gametype","3"],["ui_joinGametype","0"],["ui_netGametype","3"],["ui_actualNetGametype","3"]]
  for each prefix in ["ui_redteam","ui_blueteam"] for i=1 to 5 rows=rows+[[prefix+str(i),"0"]] end for end for
  rows=rows+[["ui_netSource","0"],["ui_menuFiles","ui/menus.txt"],["ui_currentTier","0"],["ui_currentMap","0"],["ui_currentNetMap","0"],["ui_mapIndex","0"],["ui_currentOpponent","0"],["cg_selectedPlayer","0"],["cg_selectedPlayerName",""],["ui_lastServerRefresh_0",""],["ui_lastServerRefresh_1",""],["ui_lastServerRefresh_2",""],["ui_lastServerRefresh_3",""],["ui_singlePlayerActive","0"]]
  rows=rows+[["ui_scoreAccuracy","0"],["ui_scoreImpressives","0"],["ui_scoreExcellents","0"],["ui_scoreCaptures","0"],["ui_scoreDefends","0"],["ui_scoreAssists","0"],["ui_scoreGauntlets","0"],["ui_scoreScore","0"],["ui_scorePerfect","0"],["ui_scoreTeam","0 to 0"],["ui_scoreBase","0"],["ui_scoreTime","00:00"],["ui_scoreTimeBonus","0"],["ui_scoreSkillBonus","0"],["ui_scoreShutoutBonus","0"]]
  rows=rows+[["ui_fragLimit","10"],["ui_captureLimit","5"],["ui_smallFont","0.25"],["ui_bigFont","0.4"],["ui_findPlayer","Sarge"],["ui_q3model","0"],["cg_hudFiles","ui/hud.txt"],["ui_recordSPDemo","0"],["ui_teamArenaFirstRun","0"],["g_warmup","20"],["capturelimit","8"],["ui_serverStatusTimeOut","7000"]];return rows
end function
function UI_RegisterCvars(state) state.cvars=defaultCvars();for each row in state.cvars emit(state,"cvar","register",row[0],row[1],[]) end for;return len(state.cvars) end function
function UI_UpdateCvars(state) for each row in state.cvars emit(state,"cvar","update",row[0],row[1],[]) end for;return len(state.cvars) end function

function _UI_Init(state,inGameLoad,files)
  state.initialized=true;state.shutdown=false;state.ingameLoad=inGameLoad;state.realtime=0;state.frametime=0;UI_RegisterCvars(state);AssetCache(state);if len(files)>0 then UI_Load(state,files) end if;setCvar(state,"ui_initialized","1");emit(state,"ui","init","_UI_Init","",[inGameLoad]);return true
end function
function _UI_Shutdown(state) state.shutdown=true;state.initialized=false;emit(state,"ui","shutdown","_UI_Shutdown","",[]);return void end function
function _UI_KeyEvent(state,key,down) if not down then return false end if;emit(state,"input","key",str(key),"",[down]);if key==27 and state.activeMenu!=0 then _UI_SetActiveMenu(state,0) end if;return true end function
function _UI_MouseEvent(state,dx,dy) state.cursorx=clamp(state.cursorx+dx,0.0,640.0);state.cursory=clamp(state.cursory+dy,0.0,480.0);emit(state,"input","mouse","","",[dx,dy,state.cursorx,state.cursory]);return void end function
function _UI_Refresh(state,realtime) state.frametime=realtime-state.realtime;state.realtime=realtime;UI_UpdateCvars(state);if state.refreshActive then UI_DoServerRefresh(state) end if;emit(state,"renderer","refresh","","",[realtime,state.frametime]);return void end function
function _UI_SetActiveMenu(state,menu)
  state.activeMenu=menu;if menu==0 then state.fullscreen=false;state.keyCatcher=0;UI_Pause(state,false);emit(state,"menu","close-all","","",[])
  else state.fullscreen=true;state.keyCatcher=2;if menu==1 then emit(state,"menu","activate","main","",[]) else if menu==2 then emit(state,"menu","activate","needcd","",[]) else if menu==3 then emit(state,"menu","activate","badcd","",[]) else if menu==4 then UI_Pause(state,true);emit(state,"menu","activate","ingame","",[]) else if menu==5 then emit(state,"menu","activate","team","",[]) else if menu==6 then emit(state,"menu","activate","postgame","",[]) end if end if;return void
end function
function _UI_IsFullscreen(state) return state.fullscreen end function
function consoleCommand(state,realtime,command) lower=strings.toLowerAscii(command);if lower=="ui_report" then UI_Report(state);return true else if lower=="ui_load" then emit(state,"ui","load","","",[]);return true else if lower=="ui_cache" then AssetCache(state);return true else if lower=="ui_teamorders" or lower=="ui_cdkey" then return true end if;return false end function
function vmMain(state,command,args)
  if command==UI_GETAPIVERSION then return DispatchResult(UI_API_VERSION,void)
  else if command==UI_INIT then _UI_Init(state,args[0],[]);return DispatchResult(0,state.actions[len(state.actions)-1])
  else if command==UI_SHUTDOWN then _UI_Shutdown(state);return DispatchResult(0,state.actions[len(state.actions)-1])
  else if command==UI_KEY_EVENT then _UI_KeyEvent(state,args[0],args[1]);return DispatchResult(0,state.actions[len(state.actions)-1])
  else if command==UI_MOUSE_EVENT then _UI_MouseEvent(state,args[0],args[1]);return DispatchResult(0,state.actions[len(state.actions)-1])
  else if command==UI_REFRESH then _UI_Refresh(state,args[0]);return DispatchResult(0,state.actions[len(state.actions)-1])
  else if command==UI_IS_FULLSCREEN then return DispatchResult(_UI_IsFullscreen(state),void)
  else if command==UI_SET_ACTIVE_MENU then _UI_SetActiveMenu(state,args[0]);return DispatchResult(0,state.actions[len(state.actions)-1])
  else if command==UI_CONSOLE_COMMAND then return DispatchResult(consoleCommand(state,args[0],args[1]),void)
  else if command==UI_DRAW_CONNECT_SCREEN then UI_DrawConnectScreen(state,args[0]);return DispatchResult(0,state.actions[len(state.actions)-1])
  else if command==UI_HASUNIQUECDKEY then return DispatchResult(true,void) end if;return DispatchResult(-1,void)
end function
