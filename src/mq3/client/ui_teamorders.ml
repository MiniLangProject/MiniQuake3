// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_teamorders.c.
package mq3.client.ui_teamorders

import mq3.client.ui_qmenu as qmenu
import mq3.compat.textnumbers as numbers
import mq3.shared.info as info
import std.string as strings

/// Virtual shader or image asset name used for the menu's frame artwork.
const ART_FRAME="menu/art/addbotframe"
/// Virtual shader or image asset name used for the menu's back0 artwork.
const ART_BACK0="menu/art/back_0"
/// Virtual shader or image asset name used for the menu's back1 artwork.
const ART_BACK1="menu/art/back_1"
/// Menu control identifier routed to the list bots action by the menu event handler.
const ID_LIST_BOTS=10
/// Menu control identifier routed to the list ctf orders action by the menu event handler.
const ID_LIST_CTF_ORDERS=11
/// Menu control identifier routed to the list team orders action by the menu event handler.
const ID_LIST_TEAM_ORDERS=12
/// Native game-type value for team deathmatch, used when choosing the team-order choices appropriate to
/// the current game mode.
const GT_TEAM=3
/// Native game-type value for capture the flag, used when choosing the team-order choices appropriate
/// to the current game mode.
const GT_CTF=4
/// Native team identifier for spectator, used by player and team presentation.
const TEAM_SPECTATOR=3

/// Stores UI teamorders queued engine action, including `boundary`, `kind`, `name`, `text`, `x`, `y` and additional values.
struct Action
  /// Host service category recorded with a request emitted while selecting a teammate and issuing a
  /// predefined team order.
  boundary
  /// Operation selector telling the host how to interpret a request emitted while selecting a teammate
  /// and issuing a predefined team order.
  kind
  /// Team-chat command name, drawing color, menu target, or artwork resource selected by the
  /// team-orders action.
  name
  /// Team-order label to draw or the complete say_team command sent for the selected recipient and
  /// order.
  text
  /// Horizontal position of this queued drawing operation in the virtual layout used by the team-order
  /// command menu.
  x
  /// Vertical position of this queued drawing operation in the virtual layout used by the team-order
  /// command menu.
  y
  /// Numeric argument interpreted by the selected host operation while selecting a teammate and issuing
  /// a predefined team order.
  number
  /// True when this request is marked for native dispatch while selecting a teammate and issuing a
  /// predefined team order; false when its native effect is suppressed.
  dispatched
end struct
/// Stores UI teamorders state, including `menu`, `banner`, `frame`, `list`, `back`, `gametype` and additional values.
struct State
  /// When constructing this record, `create` supplies `qmenu.menu(false,false)` for this member. Used
  /// by `UI_TeamOrdersMenu_BackEvent` and `UI_TeamOrdersMenu_SetList` during subsequent processing.
  menu
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `UI_TeamOrdersMenu_Init` during subsequent processing.
  banner
  /// Decorative bitmap widget drawing the border around the team-orders menu.
  frame
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `UI_TeamOrdersMenu_SetList` and `UI_TeamOrdersMenu_ListEvent` during subsequent processing.
  list
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `UI_TeamOrdersMenu_Init` during subsequent processing.
  back
  /// Game-rule value parsed from server information to select capture-the-flag or general team orders.
  gametype
  /// When constructing this record, `create` supplies `0` for this member. Used by
  /// `UI_TeamOrdersMenu_BuildBotList` during subsequent processing.
  numBots
  /// When constructing this record, `create` supplies `0` for this member. Used by
  /// `UI_TeamOrdersMenu_ListEvent` during subsequent processing.
  selectedBot
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `UI_TeamOrdersMenu_SetList` and `UI_TeamOrdersMenu_BuildBotList` during subsequent processing.
  bots
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `UI_TeamOrdersMenu_ListEvent` and `UI_TeamOrdersMenu_BuildBotList` during subsequent processing.
  botNames
  /// Host requests queued while selecting a teammate and issuing a predefined team order, retained in
  /// request order.
  actions
  /// Records that the team-order command menu has been opened on the active menu stack.
  pushed
  /// Records a request to remove the team-order command menu from the active menu stack.
  popped
  /// True when the retail QVM owns the team-order command menu, so the native observer records requests
  /// without emitting duplicate host effects.
  retailActive
end struct

/// Lists the 7 UI teamorders ctf orders strings in their declared order, beginning with `"I Am the Leader"`, `"Defend the Base"`, `"Follow Me"`.
function ctfOrders() return ["I Am the Leader","Defend the Base","Follow Me","Get Enemy Flag","Camp Here","Report","I Relinquish Command"] end function
/// Lists the 7 UI teamorders ctf messages strings in their declared order, beginning with `"i am the leader"`, `"%s defend the base"`, `"%s follow me"`.
function ctfMessages() return ["i am the leader","%s defend the base","%s follow me","%s get enemy flag","%s camp here","%s report","i stop being the leader"] end function
/// Lists the 6 UI teamorders team orders strings in their declared order, beginning with `"I Am the Leader"`, `"Follow Me"`, `"Roam"`.
function teamOrders() return ["I Am the Leader","Follow Me","Roam","Camp Here","Report","I Relinquish Command"] end function
/// Lists the 6 UI teamorders team messages strings in their declared order, beginning with `"i am the leader"`, `"%s follow me"`, `"%s roam"`.
function teamMessages() return ["i am the leader","%s follow me","%s roam","%s camp here","%s report","i stop being the leader"] end function
/// Creates a `mq3.client.ui_teamorders.State` record. Assigns `retailActive` from `retailActive`.
/// @param retailActive Value used to initialize `State.retailActive`.
function create(retailActive) return State(qmenu.menu(false,false),void,void,void,void,0,0,0,[],[],[],false,false,retailActive) end function
/// Appends a UI teamorders action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.
/// @param state Mutable UI teamorders record/storage; this routine assigns `state.actions`.
/// @param boundary Engine service boundary recorded on the queued action, such as renderer, audio or cvar.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param name Name used to select or register the corresponding UI teamorders resource.
/// @param text Text consumed or emitted by `emit` in the UI teamorders path.
/// @param x Horizontal coordinate in the coordinate space used by `emit`.
/// @param y Vertical coordinate in the coordinate space used by `emit`.
/// @param number Value used by `action=Action(boundary,kind,name,text,x,y,number,not state.retailActive)`.
function emit(state,boundary,kind,name,text,x,y,number) action=Action(boundary,kind,name,text,x,y,number,not state.retailActive);state.actions=state.actions+[action];return action end function
/// Calls `decode`, `slice` from UI teamorders `truncate`. The final path returns `text`.
/// @param text Text consumed or emitted by `truncate` in the UI teamorders path.
/// @param maxBytes Value used by `if len(data)>=maxBytes then return decode(slice(data,0,maxBytes-1)) end if`.
function truncate(text,maxBytes) data=bytes(text);if len(data)>=maxBytes then return decode(slice(data,0,maxBytes-1)) end if;return text end function
/// Calls `decode` from UI teamorders `clean`. The final path returns `result`.
/// @param text Text consumed or emitted by `clean` in the UI teamorders path.
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
/// Evaluates UI teamorders `playerInfo` and returns `""`, `playerInfos[index]` according to its guard/selection conditions.
/// @param playerInfos Sequence read at `playerInfos[index]`.
/// @param index Value tested by `index<0 or index>=len(playerInfos)` before the calculation continues.
function playerInfo(playerInfos,index) if index<0 or index>=len(playerInfos) then return "" end if;return playerInfos[index] end function

// UI_TeamOrdersMenu_BackEvent
/// @param state Mutable UI teamorders record/storage; this routine assigns `state.popped`, `state.menu.popped`.
/// @param event Event identifier compared with the supported activation/input events.
function UI_TeamOrdersMenu_BackEvent(state,event)
  if event!=qmenu.QM_ACTIVATED then return false end if;state.popped=true;state.menu.popped=true;emit(state,"ui","pop-menu","team-orders","",0,0,0);return true
end function

// UI_TeamOrdersMenu_SetList
/// @param state Mutable UI teamorders record/storage; this routine assigns `state.list.id`, `state.list.itemnames`, `state.list.numitems`, `state.list.curvalue` and additional values.
/// @param id Value assigned to `state.list.id`.
function UI_TeamOrdersMenu_SetList(state,id)
  state.list.id=id;if id==ID_LIST_CTF_ORDERS then state.list.itemnames=ctfOrders() else if id==ID_LIST_TEAM_ORDERS then state.list.itemnames=teamOrders() else state.list.id=ID_LIST_BOTS;state.list.itemnames=state.bots end if;state.list.numitems=len(state.list.itemnames);state.list.curvalue=0;state.list.oldvalue=0;state.list.bottom=state.list.top+state.list.numitems*qmenu.PROP_HEIGHT;if len(state.menu.items)>2 then state.menu.items[2]=state.list end if;return state.list.numitems
end function

/// Calls `std.string.indexOf`, `std.string.substr` from UI teamorders `replaceTarget`. The final path returns `strings.substr(format,0,at)+target+strings.substr(format,at+2,len(format)-at-2)`.
/// @param format Sequence whose length/content is inspected by `replaceTarget`.
/// @param target Value used by `return strings.substr(format,0,at)+target+strings.substr(format,at+2,len(format)-at-2)`.
function replaceTarget(format,target) at=strings.indexOf(format,"%s",0);if at<0 then return format end if;return strings.substr(format,0,at)+target+strings.substr(format,at+2,len(format)-at-2) end function

// UI_TeamOrdersMenu_ListEvent
/// @param state Mutable UI teamorders record/storage; this routine assigns `state.selectedBot`, `state.popped`, `state.menu.popped`.
/// @param event Event identifier compared with the supported activation/input events.
function UI_TeamOrdersMenu_ListEvent(state,event)
  if event!=qmenu.QM_ACTIVATED then return false end if;id=state.list.id;selection=state.list.curvalue;if selection<0 or selection>=state.list.numitems then return false end if
  if id==ID_LIST_BOTS then state.selectedBot=selection;if state.gametype==GT_CTF then UI_TeamOrdersMenu_SetList(state,ID_LIST_CTF_ORDERS) else UI_TeamOrdersMenu_SetList(state,ID_LIST_TEAM_ORDERS) end if;return true end if
  target="";message="";if state.selectedBot>=0 and state.selectedBot<len(state.botNames) then target=state.botNames[state.selectedBot] end if;if id==ID_LIST_CTF_ORDERS then message=replaceTarget(ctfMessages()[selection],target) else message=replaceTarget(teamMessages()[selection],target) end if
  command="say_team \""+message+"\"\n";emit(state,"command","execute-append","say_team",command,0,0,0);state.popped=true;state.menu.popped=true;emit(state,"ui","pop-menu","team-orders","",0,0,0);return true
end function

// UI_TeamOrdersMenu_Key
/// @param state Mutable UI teamorders record/storage; this routine assigns `state.list.oldvalue`, `state.list.curvalue`.
/// @param key Key or control identifier used to select the corresponding UI teamorders entry.
/// @param cursorx Value used by `if current==void or current.menuPosition!=state.list.menuPosition then return qmenu.Menu_DefaultKey(state.menu,key,cursorx,cursory) end if`.
/// @param cursory Value used by `if current==void or current.menuPosition!=state.list.menuPosition then return qmenu.Menu_DefaultKey(state.menu,key,cursorx,cursory) end if`.
function UI_TeamOrdersMenu_Key(state,key,cursorx,cursory)
  current=qmenu.Menu_ItemAtCursor(state.menu);if current==void or current.menuPosition!=state.list.menuPosition then return qmenu.Menu_DefaultKey(state.menu,key,cursorx,cursory) end if
  if state.list.numitems<=0 then return qmenu.SOUND_BUZZ end if
  if key==qmenu.K_MOUSE1 then if cursorx>=state.list.left and cursorx<state.list.right and cursory>=state.list.top and cursory<state.list.bottom then index=numbers.atoi(str((cursory-state.list.top)/qmenu.PROP_HEIGHT));if index>=0 and index<state.list.numitems then state.list.oldvalue=state.list.curvalue;state.list.curvalue=index;UI_TeamOrdersMenu_ListEvent(state,qmenu.QM_ACTIVATED);return qmenu.SOUND_MOVE end if end if;return qmenu.SOUND_NULL end if
  if key==qmenu.K_KP_UPARROW or key==qmenu.K_UPARROW then state.list.oldvalue=state.list.curvalue;if state.list.curvalue==0 then state.list.curvalue=state.list.numitems-1 else state.list.curvalue=state.list.curvalue-1 end if;return qmenu.SOUND_MOVE end if
  if key==qmenu.K_KP_DOWNARROW or key==qmenu.K_DOWNARROW then state.list.oldvalue=state.list.curvalue;if state.list.curvalue==state.list.numitems-1 then state.list.curvalue=0 else state.list.curvalue=state.list.curvalue+1 end if;return qmenu.SOUND_MOVE end if
  return qmenu.Menu_DefaultKey(state.menu,key,cursorx,cursory)
end function

// UI_TeamOrdersMenu_ListDraw
/// @param state Record read through `state.menu.cursor`, `state.list.menuPosition`, `state.list.y`, `state.list.numitems` and additional values.
function UI_TeamOrdersMenu_ListDraw(state)
  rows=[];focus=state.menu.cursor==state.list.menuPosition;y=state.list.y;for i=0 to state.list.numitems-1 style=qmenu.UI_LEFT|qmenu.UI_SMALLFONT|qmenu.UI_CENTER;color="orange";if i==state.list.curvalue then color="yellow";if focus then style=style|qmenu.UI_PULSE end if end if;row=emit(state,"draw","proportional-string",color,state.list.itemnames[i],320,y,style);rows=rows+[row];y=y+qmenu.PROP_HEIGHT end for;return rows
end function

// UI_TeamOrdersMenu_BuildBotList
/// @param state Mutable UI teamorders record/storage; this routine assigns `state.botNames`, `state.bots`, `state.numBots`, `state.gametype`.
/// @param serverInfo Value used by `state.gametype=numbers.atoi(info.value(serverInfo,"g_gametype"))`.
/// @param clientNum Client slot identifier used by the client/server protocol.
/// @param playerInfos Sequence whose length/content is inspected by `UI_TeamOrdersMenu_BuildBotList`.
function UI_TeamOrdersMenu_BuildBotList(state,serverInfo,clientNum,playerInfos)
  state.botNames=["Everyone"];state.bots=["Everyone"];state.numBots=1;state.gametype=numbers.atoi(info.value(serverInfo,"g_gametype"));maxPlayers=numbers.atoi(info.value(serverInfo,"sv_maxclients"));if maxPlayers>len(playerInfos) then maxPlayers=len(playerInfos) end if
  own=playerInfo(playerInfos,clientNum);playerTeam=info.value(own,"t");for index=0 to maxPlayers-1 if index!=clientNum and state.numBots<9 then row=playerInfo(playerInfos,index);if numbers.atoi(info.value(row,"skill"))!=0 and info.value(row,"t")==playerTeam then name=clean(truncate(info.value(row,"n"),16));state.botNames=state.botNames+[name];state.bots=state.bots+[name];state.numBots=state.numBots+1 end if end if end for;return state.numBots
end function

/// Calls `mq3.client.ui_qmenu.item` from UI teamorders `bitmap`. The final path returns `value`.
/// @param name Name used to select or register the corresponding UI teamorders resource.
/// @param id Value used by `value=qmenu.item(qmenu.MTYPE_BITMAP,name,id,x,y,flags)`.
/// @param x Horizontal coordinate in the coordinate space used by `bitmap`.
/// @param y Vertical coordinate in the coordinate space used by `bitmap`.
/// @param flags Value used by `value=qmenu.item(qmenu.MTYPE_BITMAP,name,id,x,y,flags)`.
/// @param w Value assigned to `value.width`.
/// @param h Value assigned to `value.height`.
function bitmap(name,id,x,y,flags,w,h) value=qmenu.item(qmenu.MTYPE_BITMAP,name,id,x,y,flags);value.width=w;value.height=h;return value end function

// UI_TeamOrdersMenu_Cache
/// @param state Shared UI teamorders state passed to the helper calls in `UI_TeamOrdersMenu_Cache`.
function UI_TeamOrdersMenu_Cache(state) for each art in [ART_FRAME,ART_BACK0,ART_BACK1] emit(state,"renderer","register-shader",art,"",0,0,0) end for;return 3 end function

// UI_TeamOrdersMenu_Init
/// @param state Mutable UI teamorders record/storage; this routine assigns `state.menu`, `state.actions`, `state.popped`, `state.pushed` and additional values.
/// @param serverInfo Value used by `UI_TeamOrdersMenu_BuildBotList(state,serverInfo,clientNum,playerInfos)`.
/// @param clientNum Client slot identifier used by the client/server protocol.
/// @param playerInfos Value used by `UI_TeamOrdersMenu_BuildBotList(state,serverInfo,clientNum,playerInfos)`.
function UI_TeamOrdersMenu_Init(state,serverInfo,clientNum,playerInfos)
  state.menu=qmenu.menu(false,false);state.actions=[];state.popped=false;state.pushed=false;UI_TeamOrdersMenu_Cache(state);UI_TeamOrdersMenu_BuildBotList(state,serverInfo,clientNum,playerInfos)
  state.banner=qmenu.item(qmenu.MTYPE_BTEXT,"",-1,320,16,qmenu.QMF_INACTIVE);state.banner.string="TEAM ORDERS";state.banner.style=qmenu.UI_CENTER
  state.frame=bitmap(ART_FRAME,-1,87,74,qmenu.QMF_INACTIVE,466,332)
  state.list=qmenu.item(qmenu.MTYPE_SCROLLLIST,"",ID_LIST_BOTS,256,120,qmenu.QMF_PULSEIFFOCUS|qmenu.QMF_NODEFAULTINIT);state.list.left=220;state.list.top=120;state.list.right=420;state.list.menuPosition=2
  state.back=bitmap(ART_BACK0,-1,0,416,qmenu.QMF_LEFT_JUSTIFY|qmenu.QMF_PULSEIFFOCUS,128,64);state.back.focuspic=ART_BACK1
  state.menu=qmenu.Menu_AddItem(state.menu,state.banner);state.menu=qmenu.Menu_AddItem(state.menu,state.frame);state.menu=qmenu.Menu_AddItem(state.menu,state.list);state.menu=qmenu.Menu_AddItem(state.menu,state.back);state.menu.cursor=2;UI_TeamOrdersMenu_SetList(state,ID_LIST_BOTS);return state
end function

// UI_TeamOrdersMenu
/// @param state Mutable UI teamorders record/storage; this routine assigns `state.pushed`.
/// @param serverInfo Value used by `UI_TeamOrdersMenu_Init(state,serverInfo,clientNum,playerInfos)`.
/// @param clientNum Client slot identifier used by the client/server protocol.
/// @param playerInfos Value used by `UI_TeamOrdersMenu_Init(state,serverInfo,clientNum,playerInfos)`.
function UI_TeamOrdersMenu(state,serverInfo,clientNum,playerInfos) UI_TeamOrdersMenu_Init(state,serverInfo,clientNum,playerInfos);state.pushed=true;emit(state,"ui","push-menu","team-orders","",0,0,0);return state end function

// UI_TeamOrdersMenu_f
/// @param state Shared UI teamorders state passed to the helper calls in `UI_TeamOrdersMenu_f`.
/// @param serverInfo Value used by `gametype=numbers.atoi(info.value(serverInfo,"g_gametype"))`.
/// @param clientNum Client slot identifier used by the client/server protocol.
/// @param playerInfos Value used by `team=numbers.atoi(info.value(playerInfo(playerInfos,clientNum),"t"))`.
function UI_TeamOrdersMenu_f(state,serverInfo,clientNum,playerInfos)
  gametype=numbers.atoi(info.value(serverInfo,"g_gametype"));if gametype<GT_TEAM then return false end if;team=numbers.atoi(info.value(playerInfo(playerInfos,clientNum),"t"));if team==TEAM_SPECTATOR then return false end if;UI_TeamOrdersMenu(state,serverInfo,clientNum,playerInfos);return true
end function
