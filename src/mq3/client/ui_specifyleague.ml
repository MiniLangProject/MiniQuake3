// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_specifyleague.c.
package mq3.client.ui_specifyleague
import mq3.client.ui_qmenu as q
import std.string as strings
const MAX_LISTBOXITEMS=128
const MAX_LISTBOXWIDTH=40
const MAX_LEAGUENAME=80
const ID_SPECIFYLEAGUENAME=100
const ID_SPECIFYLEAGUELIST=101
const ID_SPECIFYLEAGUEUP=102
const ID_SPECIFYLEAGUEDOWN=103
const ID_SPECIFYLEAGUEBACK=104
function artList() return ["menu/art/frame2_l","menu/art/frame1_r","menu/art/arrows_vert_0","menu/art/arrows_vert_top","menu/art/arrows_vert_bot","menu/art/back_0","menu/art/back_1","menu/art/gr/grlogo","menu/art/gr/grletters"] end function
struct Action boundary kind name text number dispatched end struct
struct State menu banner framel framer rankname list arrows up down back grlogo playername leagueNames displayNames actions pushed popped selected retailActive end struct
function create(retailActive) return State(q.menu(true,true),void,void,void,void,void,void,void,void,void,void,"",[],[],[],false,false,"",retailActive) end function
function emit(state,boundary,kind,name,text,number) a=Action(boundary,kind,name,text,number,not state.retailActive);state.actions=state.actions+[a];return a end function
function truncate(text,max) data=bytes(text);if len(data)>=max then return decode(slice(data,0,max-1)) end if;return text end function
// SpecifyLeague_GetList
function SpecifyLeague_GetList(state,leagues)
  state.playername=truncate(state.rankname.buffer,MAX_LEAGUENAME);emit(state,"rank","get-leagues","player",state.playername,0);state.leagueNames=[];state.displayNames=[];limit=len(leagues);if limit>MAX_LISTBOXITEMS then limit=MAX_LISTBOXITEMS end if;if limit>0 then for i=0 to limit-1 full=truncate(leagues[i],MAX_LEAGUENAME);state.leagueNames=state.leagueNames+[full];state.displayNames=state.displayNames+[truncate(full,MAX_LISTBOXWIDTH)] end for end if;state.list.itemnames=state.displayNames;state.list.numitems=limit;if limit==0 then state.list.curvalue=0 else if state.list.curvalue>=limit then state.list.curvalue=limit-1 end if;return limit
end function
function prefixSame(old,newText) if len(newText)>len(old) then return false end if;return strings.substr(old,0,len(newText))==newText end function
// SpecifyLeague_Event
function SpecifyLeague_Event(state,id,event,leagues)
  if id==ID_SPECIFYLEAGUELIST then return event==q.QM_GOTFOCUS end if;if id==ID_SPECIFYLEAGUEUP and event==q.QM_ACTIVATED then q.ScrollList_Key(state.list,q.K_UPARROW,0,0);return true end if;if id==ID_SPECIFYLEAGUEDOWN and event==q.QM_ACTIVATED then q.ScrollList_Key(state.list,q.K_DOWNARROW,0,0);return true end if;if id==ID_SPECIFYLEAGUENAME and event==q.QM_LOSTFOCUS and not prefixSame(state.playername,state.rankname.buffer) then SpecifyLeague_GetList(state,leagues);return true end if;if id==ID_SPECIFYLEAGUEBACK and event==q.QM_ACTIVATED then if len(state.leagueNames)>0 and state.list.curvalue>=0 and state.list.curvalue<len(state.leagueNames) then state.selected=state.leagueNames[state.list.curvalue];emit(state,"cvar","set","sv_leagueName",state.selected,state.list.curvalue) end if;state.popped=true;state.menu.popped=true;emit(state,"ui","pop-menu","specify-league","",0);return true end if;return false
end function
function bitmap(name,id,x,y,flags,w,h) item=q.item(q.MTYPE_BITMAP,name,id,x,y,flags);item.width=w;item.height=h;return item end function
// SpecifyLeague_Cache
function SpecifyLeague_Cache(state) for each art in artList() emit(state,"renderer","register-shader",art,"",0) end for;return 9 end function
// SpecifyLeague_MenuInit
function SpecifyLeague_MenuInit(state,playerName,leagues)
  state.menu=q.menu(true,true);state.actions=[];SpecifyLeague_Cache(state);state.banner=q.item(q.MTYPE_BTEXT,"",-1,320,16,q.QMF_INACTIVE);state.banner.string="CHOOSE LEAGUE";state.banner.style=q.UI_CENTER;state.framel=bitmap("menu/art/frame2_l",-1,0,78,q.QMF_INACTIVE,256,334);state.framer=bitmap("menu/art/frame1_r",-1,376,76,q.QMF_INACTIVE,256,334);state.grlogo=bitmap("menu/art/gr/grlogo",-1,0,0,q.QMF_INACTIVE,64,128)
  state.rankname=q.item(q.MTYPE_FIELD,"Player Name:",ID_SPECIFYLEAGUENAME,226,128,q.QMF_PULSEIFFOCUS|q.QMF_SMALLFONT);state.rankname.widthInChars=32;state.rankname.maxchars=80;state.rankname.buffer=truncate(playerName,80);state.list=q.item(q.MTYPE_SCROLLLIST,"",ID_SPECIFYLEAGUELIST,160,200,q.QMF_HIGHLIGHT_IF_FOCUS);state.list.width=40;state.list.height=8;state.list.itemnames=[];state.arrows=bitmap("menu/art/arrows_vert_0",-1,512,192,q.QMF_LEFT_JUSTIFY|q.QMF_INACTIVE,64,128);state.up=bitmap("",ID_SPECIFYLEAGUEUP,512,192,q.QMF_LEFT_JUSTIFY|q.QMF_PULSEIFFOCUS|q.QMF_MOUSEONLY,64,64);state.up.focuspic="menu/art/arrows_vert_top";state.down=bitmap("",ID_SPECIFYLEAGUEDOWN,512,256,q.QMF_LEFT_JUSTIFY|q.QMF_PULSEIFFOCUS|q.QMF_MOUSEONLY,64,64);state.down.focuspic="menu/art/arrows_vert_bot";state.back=bitmap("menu/art/back_0",ID_SPECIFYLEAGUEBACK,0,416,q.QMF_LEFT_JUSTIFY|q.QMF_PULSEIFFOCUS,128,64);state.back.focuspic="menu/art/back_1";for each item in [state.banner,state.framel,state.framer,state.grlogo,state.rankname,state.list,state.arrows,state.up,state.down,state.back] state.menu=q.Menu_AddItem(state.menu,item) end for;state.playername=state.rankname.buffer;SpecifyLeague_GetList(state,leagues);return state
end function
// UI_SpecifyLeagueMenu
function UI_SpecifyLeagueMenu(state,playerName,leagues) SpecifyLeague_MenuInit(state,playerName,leagues);state.pushed=true;emit(state,"ui","push-menu","specify-league","",0);return state end function
