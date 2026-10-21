// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_teamorders.c.
package mq3.client.ui_teamorders

import mq3.client.ui_qmenu as qmenu
import mq3.compat.textnumbers as numbers
import mq3.shared.info as info
import std.string as strings

const ART_FRAME="menu/art/addbotframe"
const ART_BACK0="menu/art/back_0"
const ART_BACK1="menu/art/back_1"
const ID_LIST_BOTS=10
const ID_LIST_CTF_ORDERS=11
const ID_LIST_TEAM_ORDERS=12
const GT_TEAM=3
const GT_CTF=4
const TEAM_SPECTATOR=3

struct Action boundary kind name text x y number dispatched end struct
struct State menu banner frame list back gametype numBots selectedBot bots botNames actions pushed popped retailActive end struct

function ctfOrders() return ["I Am the Leader","Defend the Base","Follow Me","Get Enemy Flag","Camp Here","Report","I Relinquish Command"] end function
function ctfMessages() return ["i am the leader","%s defend the base","%s follow me","%s get enemy flag","%s camp here","%s report","i stop being the leader"] end function
function teamOrders() return ["I Am the Leader","Follow Me","Roam","Camp Here","Report","I Relinquish Command"] end function
function teamMessages() return ["i am the leader","%s follow me","%s roam","%s camp here","%s report","i stop being the leader"] end function
function create(retailActive) return State(qmenu.menu(false,false),void,void,void,void,0,0,0,[],[],[],false,false,retailActive) end function
function emit(state,boundary,kind,name,text,x,y,number) action=Action(boundary,kind,name,text,x,y,number,not state.retailActive);state.actions=state.actions+[action];return action end function
function truncate(text,maxBytes) data=bytes(text);if len(data)>=maxBytes then return decode(slice(data,0,maxBytes-1)) end if;return text end function
function clean(text)
  data=bytes(text);result="";at=0
  while at<len(data)
    if data[at]==94 and at+1<len(data) and data[at+1]!=94 then
      at=at+2
    else
      if data[at]>=32 and data[at]<=126 then result=result+decode(bytes([data[at]])) end if
      at=at+1
    end if
  end while
  return result
end function
function playerInfo(playerInfos,index) if index<0 or index>=len(playerInfos) then return "" end if;return playerInfos[index] end function

// UI_TeamOrdersMenu_BackEvent
function UI_TeamOrdersMenu_BackEvent(state,event)
  if event!=qmenu.QM_ACTIVATED then return false end if;state.popped=true;state.menu.popped=true;emit(state,"ui","pop-menu","team-orders","",0,0,0);return true
end function

// UI_TeamOrdersMenu_SetList
function UI_TeamOrdersMenu_SetList(state,id)
  state.list.id=id;if id==ID_LIST_CTF_ORDERS then state.list.itemnames=ctfOrders() else if id==ID_LIST_TEAM_ORDERS then state.list.itemnames=teamOrders() else state.list.id=ID_LIST_BOTS;state.list.itemnames=state.bots end if;state.list.numitems=len(state.list.itemnames);state.list.curvalue=0;state.list.oldvalue=0;state.list.bottom=state.list.top+state.list.numitems*qmenu.PROP_HEIGHT;if len(state.menu.items)>2 then state.menu.items[2]=state.list end if;return state.list.numitems
end function

function replaceTarget(format,target) at=strings.indexOf(format,"%s",0);if at<0 then return format end if;return strings.substr(format,0,at)+target+strings.substr(format,at+2,len(format)-at-2) end function

// UI_TeamOrdersMenu_ListEvent
function UI_TeamOrdersMenu_ListEvent(state,event)
  if event!=qmenu.QM_ACTIVATED then return false end if;id=state.list.id;selection=state.list.curvalue;if selection<0 or selection>=state.list.numitems then return false end if
  if id==ID_LIST_BOTS then state.selectedBot=selection;if state.gametype==GT_CTF then UI_TeamOrdersMenu_SetList(state,ID_LIST_CTF_ORDERS) else UI_TeamOrdersMenu_SetList(state,ID_LIST_TEAM_ORDERS) end if;return true end if
  target="";message="";if state.selectedBot>=0 and state.selectedBot<len(state.botNames) then target=state.botNames[state.selectedBot] end if;if id==ID_LIST_CTF_ORDERS then message=replaceTarget(ctfMessages()[selection],target) else message=replaceTarget(teamMessages()[selection],target) end if
  command="say_team \""+message+"\"\n";emit(state,"command","execute-append","say_team",command,0,0,0);state.popped=true;state.menu.popped=true;emit(state,"ui","pop-menu","team-orders","",0,0,0);return true
end function

// UI_TeamOrdersMenu_Key
function UI_TeamOrdersMenu_Key(state,key,cursorx,cursory)
  current=qmenu.Menu_ItemAtCursor(state.menu);if current==void or current.menuPosition!=state.list.menuPosition then return qmenu.Menu_DefaultKey(state.menu,key,cursorx,cursory) end if
  if state.list.numitems<=0 then return qmenu.SOUND_BUZZ end if
  if key==qmenu.K_MOUSE1 then if cursorx>=state.list.left and cursorx<state.list.right and cursory>=state.list.top and cursory<state.list.bottom then index=numbers.atoi(str((cursory-state.list.top)/qmenu.PROP_HEIGHT));if index>=0 and index<state.list.numitems then state.list.oldvalue=state.list.curvalue;state.list.curvalue=index;UI_TeamOrdersMenu_ListEvent(state,qmenu.QM_ACTIVATED);return qmenu.SOUND_MOVE end if end if;return qmenu.SOUND_NULL end if
  if key==qmenu.K_KP_UPARROW or key==qmenu.K_UPARROW then state.list.oldvalue=state.list.curvalue;if state.list.curvalue==0 then state.list.curvalue=state.list.numitems-1 else state.list.curvalue=state.list.curvalue-1 end if;return qmenu.SOUND_MOVE end if
  if key==qmenu.K_KP_DOWNARROW or key==qmenu.K_DOWNARROW then state.list.oldvalue=state.list.curvalue;if state.list.curvalue==state.list.numitems-1 then state.list.curvalue=0 else state.list.curvalue=state.list.curvalue+1 end if;return qmenu.SOUND_MOVE end if
  return qmenu.Menu_DefaultKey(state.menu,key,cursorx,cursory)
end function

// UI_TeamOrdersMenu_ListDraw
function UI_TeamOrdersMenu_ListDraw(state)
  rows=[];focus=state.menu.cursor==state.list.menuPosition;y=state.list.y;for i=0 to state.list.numitems-1 style=qmenu.UI_LEFT|qmenu.UI_SMALLFONT|qmenu.UI_CENTER;color="orange";if i==state.list.curvalue then color="yellow";if focus then style=style|qmenu.UI_PULSE end if end if;row=emit(state,"draw","proportional-string",color,state.list.itemnames[i],320,y,style);rows=rows+[row];y=y+qmenu.PROP_HEIGHT end for;return rows
end function

// UI_TeamOrdersMenu_BuildBotList
function UI_TeamOrdersMenu_BuildBotList(state,serverInfo,clientNum,playerInfos)
  state.botNames=["Everyone"];state.bots=["Everyone"];state.numBots=1;state.gametype=numbers.atoi(info.value(serverInfo,"g_gametype"));maxPlayers=numbers.atoi(info.value(serverInfo,"sv_maxclients"));if maxPlayers>len(playerInfos) then maxPlayers=len(playerInfos) end if
  own=playerInfo(playerInfos,clientNum);playerTeam=info.value(own,"t");for index=0 to maxPlayers-1 if index!=clientNum and state.numBots<9 then row=playerInfo(playerInfos,index);if numbers.atoi(info.value(row,"skill"))!=0 and info.value(row,"t")==playerTeam then name=clean(truncate(info.value(row,"n"),16));state.botNames=state.botNames+[name];state.bots=state.bots+[name];state.numBots=state.numBots+1 end if end if end for;return state.numBots
end function

function bitmap(name,id,x,y,flags,w,h) value=qmenu.item(qmenu.MTYPE_BITMAP,name,id,x,y,flags);value.width=w;value.height=h;return value end function

// UI_TeamOrdersMenu_Cache
function UI_TeamOrdersMenu_Cache(state) for each art in [ART_FRAME,ART_BACK0,ART_BACK1] emit(state,"renderer","register-shader",art,"",0,0,0) end for;return 3 end function

// UI_TeamOrdersMenu_Init
function UI_TeamOrdersMenu_Init(state,serverInfo,clientNum,playerInfos)
  state.menu=qmenu.menu(false,false);state.actions=[];state.popped=false;state.pushed=false;UI_TeamOrdersMenu_Cache(state);UI_TeamOrdersMenu_BuildBotList(state,serverInfo,clientNum,playerInfos)
  state.banner=qmenu.item(qmenu.MTYPE_BTEXT,"",-1,320,16,qmenu.QMF_INACTIVE);state.banner.string="TEAM ORDERS";state.banner.style=qmenu.UI_CENTER
  state.frame=bitmap(ART_FRAME,-1,87,74,qmenu.QMF_INACTIVE,466,332)
  state.list=qmenu.item(qmenu.MTYPE_SCROLLLIST,"",ID_LIST_BOTS,256,120,qmenu.QMF_PULSEIFFOCUS|qmenu.QMF_NODEFAULTINIT);state.list.left=220;state.list.top=120;state.list.right=420;state.list.menuPosition=2
  state.back=bitmap(ART_BACK0,-1,0,416,qmenu.QMF_LEFT_JUSTIFY|qmenu.QMF_PULSEIFFOCUS,128,64);state.back.focuspic=ART_BACK1
  state.menu=qmenu.Menu_AddItem(state.menu,state.banner);state.menu=qmenu.Menu_AddItem(state.menu,state.frame);state.menu=qmenu.Menu_AddItem(state.menu,state.list);state.menu=qmenu.Menu_AddItem(state.menu,state.back);state.menu.cursor=2;UI_TeamOrdersMenu_SetList(state,ID_LIST_BOTS);return state
end function

// UI_TeamOrdersMenu
function UI_TeamOrdersMenu(state,serverInfo,clientNum,playerInfos) UI_TeamOrdersMenu_Init(state,serverInfo,clientNum,playerInfos);state.pushed=true;emit(state,"ui","push-menu","team-orders","",0,0,0);return state end function

// UI_TeamOrdersMenu_f
function UI_TeamOrdersMenu_f(state,serverInfo,clientNum,playerInfos)
  gametype=numbers.atoi(info.value(serverInfo,"g_gametype"));if gametype<GT_TEAM then return false end if;team=numbers.atoi(info.value(playerInfo(playerInfos,clientNum),"t"));if team==TEAM_SPECTATOR then return false end if;UI_TeamOrdersMenu(state,serverInfo,clientNum,playerInfos);return true
end function
