// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native MiniLang port of code/q3_ui/ui_demo2.c.
package mq3.client.ui_demos

import std.string as strings

const QM_ACTIVATED=3
const ID_BACK=10
const ID_GO=11
const ID_LIST=12
const ID_RIGHT=13
const ID_LEFT=14
const K_LEFTARROW=134
const K_RIGHTARROW=135
const MAX_DEMOS=128
const ART_BACK0="menu/art/back_0"
const ART_BACK1="menu/art/back_1"
const ART_GO0="menu/art/play_0"
const ART_GO1="menu/art/play_1"
const ART_FRAMEL="menu/art/frame2_l"
const ART_FRAMER="menu/art/frame1_r"
const ART_ARROWS="menu/art/arrows_horz_0"
const ART_ARROWLEFT="menu/art/arrows_horz_left"
const ART_ARROWRIGHT="menu/art/arrows_horz_right"

struct Action boundary kind name text value dispatched end struct
struct State numDemos names selected top columns height goVisible actions retailActive cached pushed menuEvents protocol extension end struct

function create(retailActive) return State(0,[],0,0,3,14,true,[],retailActive,false,false,[],0,"") end function
function emit(state,kind,name,text,value) item=Action("ui-demos",kind,name,text,value,not state.retailActive);state.actions=state.actions+[item];return item end function
function compareNames(left,right) a=bytes(strings.toLowerAscii(left));b=bytes(strings.toLowerAscii(right));count=len(a);if len(b)<count then count=len(b) end if;for i=0 to count-1 if a[i]<b[i] then return -1 else if a[i]>b[i] then return 1 end if end for;if len(a)<len(b) then return -1 end if;if len(a)>len(b) then return 1 end if;return 0 end function
function normalize(name) value=name;if len(value)>=4 and strings.equalsIgnoreCaseAscii(strings.substr(value,len(value)-4,4),".dm3") then value=strings.substr(value,0,len(value)-4) end if;return strings.toUpperAscii(value) end function
function sortNames(values) result=[];remaining=values;while len(remaining)>0 best=0;if len(remaining)>1 then for i=1 to len(remaining)-1 if compareNames(remaining[i],remaining[best])<0 then best=i end if end for end if;result=result+[remaining[best]];next=[];for i=0 to len(remaining)-1 if i!=best then next=next+[remaining[i]] end if end for;remaining=next end while;return result end function
function scroll(state,key)
  if key==K_LEFTARROW then if state.selected<state.height then return false end if;state.selected=state.selected-state.height;if state.selected<state.top then state.top=state.top-state.height end if;return true end if
  if key==K_RIGHTARROW then target=state.selected+state.height;if target>=state.numDemos then return false end if;state.selected=target;if state.selected>state.top+state.columns*state.height-1 then state.top=state.top+state.height end if;return true end if;return false
end function
// Demos_MenuEvent
function menuEvent(state,id,event)
  if event!=QM_ACTIVATED then return false end if;if id==ID_GO then if not state.goVisible or state.numDemos==0 then return false end if;emit(state,"force-menu-off","demos","",0);emit(state,"execute","demo","demo "+state.names[state.selected]+"\n",2);return true else if id==ID_BACK then state.menuEvents=state.menuEvents+[["pop"]];emit(state,"menu-pop","demos","",0);return true else if id==ID_LEFT then emit(state,"scroll-key","demos","",K_LEFTARROW);scroll(state,K_LEFTARROW);return true else if id==ID_RIGHT then emit(state,"scroll-key","demos","",K_RIGHTARROW);scroll(state,K_RIGHTARROW);return true end if;return false
end function
// UI_DemosMenu_Key
function menuKey(state,key) emit(state,"default-key","demos",str(key),key);return "default" end function
// Demos_Cache
function cache(state) for each asset in [ART_BACK0,ART_BACK1,ART_GO0,ART_GO1,ART_FRAMEL,ART_FRAMER,ART_ARROWS,ART_ARROWLEFT,ART_ARROWRIGHT] emit(state,"register-shader",asset,"",0) end for;state.cached=true;return 9 end function
// Demos_MenuInit
function menuInit(state,protocol,files)
  state.actions=[];state.menuEvents=[];cache(state);state.protocol=protocol;state.extension="dm_"+str(protocol);limited=[];count=len(files);if count>MAX_DEMOS then count=MAX_DEMOS end if;if count>0 then for i=0 to count-1 limited=limited+[files[i]] end for end if;if len(limited)==0 then state.names=["No Demos Found."];state.numDemos=1;state.goVisible=false else state.names=[];for each name in sortNames(limited) state.names=state.names+[normalize(name)] end for;state.numDemos=len(state.names);state.goVisible=true end if;state.selected=0;state.top=0;return state
end function
// UI_DemosMenu
function demosMenu(state,protocol,files) menuInit(state,protocol,files);state.pushed=true;state.menuEvents=state.menuEvents+[["push"]];emit(state,"push-menu","demos","",0);return state end function
