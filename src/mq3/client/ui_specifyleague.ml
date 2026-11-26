// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_specifyleague.c.
package mq3.client.ui_specifyleague
import mq3.client.ui_qmenu as q
import std.string as strings
/// Capacity limit for the listboxitems collection or bounded storage used by this client module.
const MAX_LISTBOXITEMS=128
/// Maximum display width reserved for a listbox entry.
const MAX_LISTBOXWIDTH=40
/// Length limit for the legacy ranking-service league name.
const MAX_LEAGUENAME=80
/// Menu control identifier routed to the specifyleaguename action by the menu event handler.
const ID_SPECIFYLEAGUENAME=100
/// Menu control identifier routed to the specifyleaguelist action by the menu event handler.
const ID_SPECIFYLEAGUELIST=101
/// Menu control identifier routed to the specifyleagueup action by the menu event handler.
const ID_SPECIFYLEAGUEUP=102
/// Menu control identifier routed to the specifyleaguedown action by the menu event handler.
const ID_SPECIFYLEAGUEDOWN=103
/// Menu control identifier routed to the specifyleagueback action by the menu event handler.
const ID_SPECIFYLEAGUEBACK=104
/// Lists the 9 UI specifyleague art list strings in their declared order, beginning with `"menu/art/frame2_l"`, `"menu/art/frame1_r"`, `"menu/art/arrows_vert_0"`.
function artList() return ["menu/art/frame2_l","menu/art/frame1_r","menu/art/arrows_vert_0","menu/art/arrows_vert_top","menu/art/arrows_vert_bot","menu/art/back_0","menu/art/back_1","menu/art/gr/grlogo","menu/art/gr/grletters"] end function
/// Stores UI specifyleague queued engine action, including `boundary`, `kind`, `name`, `text`, `number`, `dispatched`.
struct Action
  /// Host service category recorded with a request emitted while accepting a league identifier for
  /// ranked play.
  boundary
  /// Operation selector telling the host how to interpret a request emitted while accepting a league
  /// identifier for ranked play.
  kind
  /// League-query label, selected-league cvar, menu target, or artwork resource named by the operation.
  name
  /// Player name used for league lookup or selected league name written to the server setting.
  text
  /// Numeric argument interpreted by the selected host operation while accepting a league identifier
  /// for ranked play.
  number
  /// True when this request is marked for native dispatch while accepting a league identifier for
  /// ranked play; false when its native effect is suppressed.
  dispatched
end struct
/// Stores UI specifyleague state, including `menu`, `banner`, `framel`, `framer`, `rankname`, `list` and additional values.
struct State
  /// When constructing this record, `create` supplies `q.menu(true,true)` for this member. Used by
  /// `SpecifyLeague_Event` and `SpecifyLeague_MenuInit` during subsequent processing.
  menu
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `SpecifyLeague_MenuInit` during subsequent processing.
  banner
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `SpecifyLeague_MenuInit` during subsequent processing.
  framel
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `SpecifyLeague_MenuInit` during subsequent processing.
  framer
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `SpecifyLeague_GetList` and `SpecifyLeague_Event` during subsequent processing.
  rankname
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `SpecifyLeague_GetList` and `SpecifyLeague_Event` during subsequent processing.
  list
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `SpecifyLeague_MenuInit` during subsequent processing.
  arrows
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `SpecifyLeague_MenuInit` during subsequent processing.
  up
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `SpecifyLeague_MenuInit` during subsequent processing.
  down
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `SpecifyLeague_MenuInit` during subsequent processing.
  back
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `SpecifyLeague_MenuInit` during subsequent processing.
  grlogo
  /// When constructing this record, `create` supplies an empty string for this member. Used by
  /// `SpecifyLeague_GetList` and `SpecifyLeague_Event` during subsequent processing.
  playername
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `SpecifyLeague_GetList` and `SpecifyLeague_Event` during subsequent processing.
  leagueNames
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `SpecifyLeague_GetList` during subsequent processing.
  displayNames
  /// Host requests queued while accepting a league identifier for ranked play, retained in request
  /// order.
  actions
  /// Records that the ranked-play league dialog has been opened on the active menu stack.
  pushed
  /// Records a request to remove the ranked-play league dialog from the active menu stack.
  popped
  /// Current selection state or selected entry retained by the owning UI control.
  selected
  /// True when the retail QVM owns the ranked-play league dialog, so the native observer records
  /// requests without emitting duplicate host effects.
  retailActive
end struct
/// Creates a `mq3.client.ui_specifyleague.State` record. Assigns `retailActive` from `retailActive`.
/// @param retailActive Value used to initialize `State.retailActive`.
function create(retailActive) return State(q.menu(true,true),void,void,void,void,void,void,void,void,void,void,"",[],[],[],false,false,"",retailActive) end function
/// Appends a UI specifyleague action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.
/// @param state Mutable UI specifyleague record/storage; this routine assigns `state.actions`.
/// @param boundary Engine service boundary recorded on the queued action, such as renderer, audio or cvar.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param name Name used to select or register the corresponding UI specifyleague resource.
/// @param text Text consumed or emitted by `emit` in the UI specifyleague path.
/// @param number Value used by `a=Action(boundary,kind,name,text,number,not state.retailActive)`.
function emit(state,boundary,kind,name,text,number) a=Action(boundary,kind,name,text,number,not state.retailActive);state.actions=state.actions+[a];return a end function
/// Calls `decode`, `slice` from UI specifyleague `truncate`. The final path returns `text`.
/// @param text Text consumed or emitted by `truncate` in the UI specifyleague path.
/// @param max Value used by `if len(data)>=max then return decode(slice(data,0,max-1)) end if`.
function truncate(text,max) data=bytes(text);if len(data)>=max then return decode(slice(data,0,max-1)) end if;return text end function
// SpecifyLeague_GetList
/// @param state Mutable UI specifyleague record/storage; this routine assigns `state.playername`, `state.leagueNames`, `state.displayNames`, `state.list.itemnames` and additional values.
/// @param leagues Sequence read at `leagues[i]`.
function SpecifyLeague_GetList(state,leagues)
  state.playername=truncate(state.rankname.buffer,MAX_LEAGUENAME);emit(state,"rank","get-leagues","player",state.playername,0);state.leagueNames=[];state.displayNames=[];limit=len(leagues);if limit>MAX_LISTBOXITEMS then limit=MAX_LISTBOXITEMS end if;if limit>0 then for i=0 to limit-1 full=truncate(leagues[i],MAX_LEAGUENAME);state.leagueNames=state.leagueNames+[full];state.displayNames=state.displayNames+[truncate(full,MAX_LISTBOXWIDTH)] end for end if;state.list.itemnames=state.displayNames;state.list.numitems=limit;if limit==0 then state.list.curvalue=0 else if state.list.curvalue>=limit then state.list.curvalue=limit-1 end if;return limit
end function
/// Calls `std.string.substr` from UI specifyleague `prefixSame`. The final path returns `strings.substr(old,0,len(newText))==newText`.
/// @param old Sequence whose length/content is inspected by `prefixSame`.
/// @param newText Sequence whose length/content is inspected by `prefixSame`.
function prefixSame(old,newText) if len(newText)>len(old) then return false end if;return strings.substr(old,0,len(newText))==newText end function
// SpecifyLeague_Event
/// @param state Mutable UI specifyleague record/storage; this routine assigns `state.selected`, `state.popped`, `state.menu.popped`.
/// @param id Value used by `if id==ID_SPECIFYLEAGUELIST then return event==q.QM_GOTFOCUS end if`.
/// @param event Event identifier compared with the supported activation/input events.
/// @param leagues Value used by `if id==ID_SPECIFYLEAGUENAME and event==q.QM_LOSTFOCUS and not prefixSame(state.playername,state.rankname.buffer) then SpecifyLeague_GetList(st...`.
function SpecifyLeague_Event(state,id,event,leagues)
  if id==ID_SPECIFYLEAGUELIST then return event==q.QM_GOTFOCUS end if;if id==ID_SPECIFYLEAGUEUP and event==q.QM_ACTIVATED then q.ScrollList_Key(state.list,q.K_UPARROW,0,0);return true end if;if id==ID_SPECIFYLEAGUEDOWN and event==q.QM_ACTIVATED then q.ScrollList_Key(state.list,q.K_DOWNARROW,0,0);return true end if;if id==ID_SPECIFYLEAGUENAME and event==q.QM_LOSTFOCUS and not prefixSame(state.playername,state.rankname.buffer) then SpecifyLeague_GetList(state,leagues);return true end if;if id==ID_SPECIFYLEAGUEBACK and event==q.QM_ACTIVATED then if len(state.leagueNames)>0 and state.list.curvalue>=0 and state.list.curvalue<len(state.leagueNames) then state.selected=state.leagueNames[state.list.curvalue];emit(state,"cvar","set","sv_leagueName",state.selected,state.list.curvalue) end if;state.popped=true;state.menu.popped=true;emit(state,"ui","pop-menu","specify-league","",0);return true end if;return false
end function
/// Calls `mq3.client.ui_qmenu.item` from UI specifyleague `bitmap`. The final path returns `item`.
/// @param name Name used to select or register the corresponding UI specifyleague resource.
/// @param id Value used by `item=q.item(q.MTYPE_BITMAP,name,id,x,y,flags)`.
/// @param x Horizontal coordinate in the coordinate space used by `bitmap`.
/// @param y Vertical coordinate in the coordinate space used by `bitmap`.
/// @param flags Value used by `item=q.item(q.MTYPE_BITMAP,name,id,x,y,flags)`.
/// @param w Value assigned to `item.width`.
/// @param h Value assigned to `item.height`.
function bitmap(name,id,x,y,flags,w,h) item=q.item(q.MTYPE_BITMAP,name,id,x,y,flags);item.width=w;item.height=h;return item end function
// SpecifyLeague_Cache
/// @param state Shared UI specifyleague state passed to the helper calls in `SpecifyLeague_Cache`.
function SpecifyLeague_Cache(state) for each art in artList() emit(state,"renderer","register-shader",art,"",0) end for;return 9 end function
// SpecifyLeague_MenuInit
/// @param state Mutable UI specifyleague record/storage; this routine assigns `state.menu`, `state.actions`, `state.banner`, `state.banner.string` and additional values.
/// @param playerName Player name shown in the UI or supplied to the client configuration.
/// @param leagues Value used by `SpecifyLeague_GetList(state,leagues)`.
function SpecifyLeague_MenuInit(state,playerName,leagues)
  state.menu=q.menu(true,true);state.actions=[];SpecifyLeague_Cache(state);state.banner=q.item(q.MTYPE_BTEXT,"",-1,320,16,q.QMF_INACTIVE);state.banner.string="CHOOSE LEAGUE";state.banner.style=q.UI_CENTER;state.framel=bitmap("menu/art/frame2_l",-1,0,78,q.QMF_INACTIVE,256,334);state.framer=bitmap("menu/art/frame1_r",-1,376,76,q.QMF_INACTIVE,256,334);state.grlogo=bitmap("menu/art/gr/grlogo",-1,0,0,q.QMF_INACTIVE,64,128)
  state.rankname=q.item(q.MTYPE_FIELD,"Player Name:",ID_SPECIFYLEAGUENAME,226,128,q.QMF_PULSEIFFOCUS|q.QMF_SMALLFONT);state.rankname.widthInChars=32;state.rankname.maxchars=80;state.rankname.buffer=truncate(playerName,80);state.list=q.item(q.MTYPE_SCROLLLIST,"",ID_SPECIFYLEAGUELIST,160,200,q.QMF_HIGHLIGHT_IF_FOCUS);state.list.width=40;state.list.height=8;state.list.itemnames=[];state.arrows=bitmap("menu/art/arrows_vert_0",-1,512,192,q.QMF_LEFT_JUSTIFY|q.QMF_INACTIVE,64,128);state.up=bitmap("",ID_SPECIFYLEAGUEUP,512,192,q.QMF_LEFT_JUSTIFY|q.QMF_PULSEIFFOCUS|q.QMF_MOUSEONLY,64,64);state.up.focuspic="menu/art/arrows_vert_top";state.down=bitmap("",ID_SPECIFYLEAGUEDOWN,512,256,q.QMF_LEFT_JUSTIFY|q.QMF_PULSEIFFOCUS|q.QMF_MOUSEONLY,64,64);state.down.focuspic="menu/art/arrows_vert_bot";state.back=bitmap("menu/art/back_0",ID_SPECIFYLEAGUEBACK,0,416,q.QMF_LEFT_JUSTIFY|q.QMF_PULSEIFFOCUS,128,64);state.back.focuspic="menu/art/back_1";for each item in [state.banner,state.framel,state.framer,state.grlogo,state.rankname,state.list,state.arrows,state.up,state.down,state.back] state.menu=q.Menu_AddItem(state.menu,item) end for;state.playername=state.rankname.buffer;SpecifyLeague_GetList(state,leagues);return state
end function
// UI_SpecifyLeagueMenu
/// @param state Mutable UI specifyleague record/storage; this routine assigns `state.pushed`.
/// @param playerName Player name shown in the UI or supplied to the client configuration.
/// @param leagues Value used by `SpecifyLeague_MenuInit(state,playerName,leagues)`.
function UI_SpecifyLeagueMenu(state,playerName,leagues) SpecifyLeague_MenuInit(state,playerName,leagues);state.pushed=true;emit(state,"ui","push-menu","specify-league","",0);return state end function
