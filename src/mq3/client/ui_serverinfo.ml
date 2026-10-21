// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_serverinfo.c.
package mq3.client.ui_serverinfo

import mq3.client.ui_qmenu as qmenu
import std.string as strings

const SERVERINFO_FRAMEL="menu/art/frame2_l"
const SERVERINFO_FRAMER="menu/art/frame1_r"
const SERVERINFO_BACK0="menu/art/back_0"
const SERVERINFO_BACK1="menu/art/back_1"
const ID_ADD=100
const ID_BACK=101
const MAX_FAVORITESERVERS=16

struct Action boundary kind name text x y number dispatched end struct
struct State menu banner framel framer back add info pairs numlines currentAddress favorites actions pushed popped retailActive end struct

function create(retailActive) return State(qmenu.menu(true,true),void,void,void,void,void,"",[],0,"",[],[],false,false,retailActive) end function
function emit(state,boundary,kind,name,text,x,y,number) action=Action(boundary,kind,name,text,x,y,number,not state.retailActive);state.actions=state.actions+[action];return action end function
function same(a,b) return strings.equalsIgnoreCaseAscii(a,b) end function
function digitAddress(value) if value=="" then return false end if;c=bytes(value)[0];return c>=48 and c<=57 end function
function infoPairs(text) fields=strings.split(text,"\\");at=0;if len(fields)>0 and fields[0]=="" then at=1 end if;result=[];while at+1<len(fields) if fields[at]=="" then break end if;result=result+[[fields[at],fields[at+1]]];at=at+2 end while;return result end function

// Favorites_Add
function Favorites_Add(state)
  server=state.currentAddress;if server=="" then return 0 end if;best=0;for index=0 to MAX_FAVORITESERVERS-1 address="";if index<len(state.favorites) then address=state.favorites[index] end if;if same(server,address) then return 0 end if;if not digitAddress(address) and best==0 then best=index+1 end if end for
  if best==0 then return 0 end if;while len(state.favorites)<MAX_FAVORITESERVERS state.favorites=state.favorites+[""] end while;state.favorites[best-1]=server;emit(state,"cvar","set","server"+str(best),server,0,0,best);return best
end function

// ServerInfo_Event
function ServerInfo_Event(state,id,event)
  if event!=qmenu.QM_ACTIVATED then return false end if;if id==ID_ADD then Favorites_Add(state);state.popped=true;state.menu.popped=true;emit(state,"ui","pop-menu","server-info","",0,0,0);return true end if;if id==ID_BACK then state.popped=true;state.menu.popped=true;emit(state,"ui","pop-menu","server-info","",0,0,0);return true end if;return false
end function

// ServerInfo_MenuDraw
function ServerInfo_MenuDraw(state,realtime)
  rows=[];y=240-state.numlines*qmenu.SMALLCHAR_HEIGHT/2-20;for each pair in state.pairs rows=rows+[emit(state,"draw","string-right","red",pair[0]+":",312,y,qmenu.UI_RIGHT|qmenu.UI_SMALLFONT)];rows=rows+[emit(state,"draw","string-left","normal",pair[1],328,y,qmenu.UI_LEFT|qmenu.UI_SMALLFONT)];y=y+qmenu.SMALLCHAR_HEIGHT end for;rows=rows+[emit(state,"draw","menu","server-info","",0,0,realtime)];return rows
end function

// ServerInfo_MenuKey
function ServerInfo_MenuKey(state,key,cursorx,cursory) return qmenu.Menu_DefaultKey(state.menu,key,cursorx,cursory) end function

// ServerInfo_Cache
function ServerInfo_Cache(state) for each art in [SERVERINFO_FRAMEL,SERVERINFO_FRAMER,SERVERINFO_BACK0,SERVERINFO_BACK1] emit(state,"renderer","register-shader",art,"",0,0,0) end for;return 4 end function

function bitmap(name,id,x,y,flags,w,h) value=qmenu.item(qmenu.MTYPE_BITMAP,name,id,x,y,flags);value.width=w;value.height=h;return value end function

// UI_ServerInfoMenu
function UI_ServerInfoMenu(state,serverInfo,svRunning,currentAddress,favorites)
  state.menu=qmenu.menu(true,true);state.actions=[];state.pushed=false;state.popped=false;state.info=serverInfo;state.pairs=infoPairs(serverInfo);state.numlines=len(state.pairs);if state.numlines>16 then state.numlines=16 end if;state.currentAddress=currentAddress;state.favorites=favorites;ServerInfo_Cache(state)
  state.banner=qmenu.item(qmenu.MTYPE_BTEXT,"",-1,320,16,qmenu.QMF_INACTIVE);state.banner.string="SERVER INFO";state.banner.style=qmenu.UI_CENTER
  state.framel=bitmap(SERVERINFO_FRAMEL,-1,0,78,qmenu.QMF_INACTIVE,256,329);state.framer=bitmap(SERVERINFO_FRAMER,-1,376,76,qmenu.QMF_INACTIVE,256,334)
  flags=qmenu.QMF_CENTER_JUSTIFY|qmenu.QMF_PULSEIFFOCUS;if svRunning then flags=flags|qmenu.QMF_GRAYED end if;state.add=qmenu.item(qmenu.MTYPE_PTEXT,"",ID_ADD,320,371,flags);state.add.string="ADD TO FAVORITES";state.add.style=qmenu.UI_CENTER|qmenu.UI_SMALLFONT;state.add.color=[1.0,0.0,0.0,1.0]
  state.back=bitmap(SERVERINFO_BACK0,ID_BACK,0,416,qmenu.QMF_LEFT_JUSTIFY|qmenu.QMF_PULSEIFFOCUS,128,64);state.back.focuspic=SERVERINFO_BACK1
  state.menu=qmenu.Menu_AddItem(state.menu,state.banner);state.menu=qmenu.Menu_AddItem(state.menu,state.framel);state.menu=qmenu.Menu_AddItem(state.menu,state.framer);state.menu=qmenu.Menu_AddItem(state.menu,state.add);state.menu=qmenu.Menu_AddItem(state.menu,state.back);state.menu.cursor=3;state.pushed=true;emit(state,"ui","push-menu","server-info","",0,0,0);return state
end function
