// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_playermodel.c.
package mq3.client.ui_playermodel

import mq3.client.ui_players as players
import mq3.client.ui_qmenu as qmenu
import mq3.compat.numeric as n
import std.string as strings

/// Memory threshold below which client media loading should be deferred or reduced.
const LOW_MEMORY=5242880
/// Number of model-preview columns shown on one player-selection page.
const PLAYERGRID_COLS=4
/// Number of model-preview rows shown on one player-selection page.
const PLAYERGRID_ROWS=4
/// Capacity limit for the modelsperpage collection or bounded storage used by this client module.
const MAX_MODELSPERPAGE=16
/// Capacity limit for the playermodels collection or bounded storage used by this client module.
const MAX_PLAYERMODELS=256
/// Menu control identifier routed to the prevpage action by the menu event handler.
const ID_PREVPAGE=100
/// Menu control identifier routed to the nextpage action by the menu event handler.
const ID_NEXTPAGE=101
/// Event identifier of the Back control used to leave the player-model and skin selection menu and
/// return to its parent menu.
const ID_BACK=102

/// Stores UI playermodel state, including `source`, `menu`, `pics`, `picbuttons`, `left`, `right` and additional values.
struct State
  /// When constructing this record, `create` supplies `source` for this member.
  source
  /// When constructing this record, `create` supplies `qmenu.menu(true,true)` for this member.
  menu
  /// Bitmap widgets showing the model and skin icons on the current selection page.
  pics
  /// Focusable button widgets paired with the model icons, enabled only for populated page slots.
  picbuttons
  /// Left boundary of the interactive or clipped region.
  left
  /// Right boundary of the interactive or clipped region.
  right
  /// Back-button widget that saves the selected model and leaves the model-selection menu.
  back
  /// Noninteractive bitmap widget reserving the rectangle used for the animated player preview.
  player
  /// When constructing this record, `create` supplies `players.create()` for this member.
  playerinfo
  /// Number of discovered model/skin icon entries available to the selection grid.
  nummodels
  /// Discovered model/skin icon paths used to populate the paged selection grid.
  modelnames
  /// Zero-based page of model icons currently displayed in the selection grid.
  modelpage
  /// Number of pages required to display all discovered model/skin icons.
  numpages
  /// When constructing this record, `create` supplies an empty string for this member.
  modelskin
  /// Index of the selected model/skin entry across all grid pages.
  selectedmodel
  /// When constructing this record, `create` supplies an empty string for this member.
  modelname
  /// When constructing this record, `create` supplies an empty string for this member.
  skinname
  /// When constructing this record, `create` supplies an empty string for this member.
  playername
  /// Host requests queued while paging model icons, previewing a model, and saving the selected skin,
  /// retained in request order.
  actions
  /// Cvar name/value changes queued by the player-model and skin selection menu for the host to apply.
  cvarWrites
  /// Records a request to remove the player-model and skin selection menu from the active menu stack.
  popped
  /// Records that the player-model and skin selection menu has been opened on the active menu stack.
  pushed
  /// When constructing this record, `create` supplies `LOW_MEMORY+1` for this member.
  memoryRemaining
  /// Most recent player-preview draw actions, or the low-memory message when preview rendering is
  /// unavailable.
  drawRows
end struct
/// Lists the 10 UI playermodel art list strings in their declared order, beginning with `"menu/art/back_0"`, `"menu/art/back_1"`, `"menu/art/opponents_select"`.
function artList() return ["menu/art/back_0","menu/art/back_1","menu/art/opponents_select","menu/art/opponents_selected","menu/art/frame1_l","menu/art/frame1_r","menu/art/player_models_ports","menu/art/gs_arrows_0","menu/art/gs_arrows_l","menu/art/gs_arrows_r"] end function
/// Creates a `mq3.client.ui_playermodel.State` record. Assigns `source` from `source`.
/// @param source Value used to initialize `State.source`.
function create(source) return State(source,qmenu.menu(true,true),[],[],void,void,void,void,players.create(),0,[],0,0,"",0,"","","",[],[],false,false,LOW_MEMORY+1,[]) end function
/// Appends a UI playermodel action record to the queued engine requests.
/// @param value Mutable UI playermodel record/storage; this routine assigns `value.actions`.
/// @param boundary Engine service boundary recorded on the queued action, such as renderer, audio or cvar.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param name Name used to select or register the corresponding UI playermodel resource.
/// @param detail Value used by `value.actions=value.actions+[players.Action(boundary,kind,name,detail,number,void,not retailActive)]`.
/// @param number Value used by `value.actions=value.actions+[players.Action(boundary,kind,name,detail,number,void,not retailActive)]`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function emit(value,boundary,kind,name,detail,number,retailActive) value.actions=value.actions+[players.Action(boundary,kind,name,detail,number,void,not retailActive)];return void end function
/// Adapts `std.string.toLowerAscii` to UI playermodel `lower`, returning its result for `text`.
/// @param text Argument 1 of `std.string.toLowerAscii`.
function lower(text) return strings.toLowerAscii(text) end function
/// Calls `mq3.client.ui_playermodel.lower`, `std.string.substr` from UI playermodel `starts`. The final path returns `lower(strings.substr(text,0,len(prefix)))==lower(prefix)`.
/// @param text Text whose length/content is inspected by `starts`.
/// @param prefix Sequence whose length/content is inspected by `starts`.
function starts(text,prefix) if len(text)<len(prefix) then return false end if;return lower(strings.substr(text,0,len(prefix)))==lower(prefix) end function
/// Calls `mq3.client.ui_playermodel.lower`, `std.string.substr` from UI playermodel `ends`. The final path returns `lower(strings.substr(text,len(text)-len(suffix),len(suffix)))==lower(suffix)`.
/// @param text Text whose length/content is inspected by `ends`.
/// @param suffix Sequence whose length/content is inspected by `ends`.
function ends(text,suffix) if len(text)<len(suffix) then return false end if;return lower(strings.substr(text,len(text)-len(suffix),len(suffix)))==lower(suffix) end function
/// Calls `decode`, `slice` from UI playermodel `truncate`. The final path returns `text`.
/// @param text Text consumed or emitted by `truncate` in the UI playermodel path.
/// @param max Value used by `if len(bytes(text))>=max then return decode(slice(bytes(text),0,max-1)) end if`.
function truncate(text,max) if len(bytes(text))>=max then return decode(slice(bytes(text),0,max-1)) end if;return text end function
/// Calls `decode` from UI playermodel `clean`. The final path returns `result`.
/// @param text Text consumed or emitted by `clean` in the UI playermodel path.
function clean(text)
  data=bytes(text);result="";at=0
  while at<len(data)
    if data[at]==94 and at+1<len(data) and data[at+1]!=94 then
      at=at+2
    else
      if data[at]>=32 and data[at]<=126 then result=result+decode(bytes([data[at]])) end if;at=at+1
    end if
  end while
  return result
end function
/// Calls `mq3.client.ui_playermodel.starts`, `std.string.substr`, `std.string.indexOf` and additional helpers from UI playermodel `iconParts`. The final path returns `[model,skin,"models/players/"+model+"/icon_"+skin]`.
/// @param path File or asset path used by this operation.
function iconParts(path) prefix="models/players/";if not starts(path,prefix) then return void end if;tail=strings.substr(path,len(prefix),len(path)-len(prefix));slash=strings.indexOf(tail,"/",0);if slash<=0 then return void end if;model=strings.substr(tail,0,slash);leaf=strings.substr(tail,slash+1,len(tail)-slash-1);if strings.indexOf(leaf,"/",0)>=0 or not starts(leaf,"icon_") or not ends(leaf,".tga") then return void end if;skin=strings.substr(leaf,5,len(leaf)-9);if skin=="" then return void end if;return [model,skin,"models/players/"+model+"/icon_"+skin] end function
/// Updates `value.modelskin`, `value.modelname`, `value.skinname` during UI playermodel `setLabels`.
/// @param value Mutable UI playermodel record/storage; this routine assigns `value.modelskin`, `value.modelname`, `value.skinname`.
/// @param path File or asset path used by this operation.
function setLabels(value,path)
  part=iconParts(path+".tga");if part==void then return false end if;value.modelskin=part[0]+"/"+part[1];value.modelname=strings.toUpperAscii(truncate(part[0],16));value.skinname=strings.toUpperAscii(truncate(part[1],16));return true
end function

// PlayerModel_UpdateGrid
/// @param value Mutable UI playermodel record/storage; this routine assigns `value.pics[i].name`, `value.picbuttons[i].flags`, `value.pics[i].flags`, `value.pics[i].shader` and additional values.
function PlayerModel_UpdateGrid(value)
  start=value.modelpage*MAX_MODELSPERPAGE;for i=0 to MAX_MODELSPERPAGE-1 index=start+i;if index<value.nummodels then value.pics[i].name=value.modelnames[index];value.picbuttons[i].flags=value.picbuttons[i].flags&(~qmenu.QMF_INACTIVE) else value.pics[i].name="";value.picbuttons[i].flags=value.picbuttons[i].flags|qmenu.QMF_INACTIVE end if;value.pics[i].flags=value.pics[i].flags&(~qmenu.QMF_HIGHLIGHT);value.pics[i].shader=0;value.picbuttons[i].flags=value.picbuttons[i].flags|qmenu.QMF_PULSEIFFOCUS end for
  if value.nummodels>0 and n.trunc32(value.selectedmodel/MAX_MODELSPERPAGE)==value.modelpage then i=value.selectedmodel%MAX_MODELSPERPAGE;value.pics[i].flags=value.pics[i].flags|qmenu.QMF_HIGHLIGHT;value.picbuttons[i].flags=value.picbuttons[i].flags&(~qmenu.QMF_PULSEIFFOCUS) end if
  if value.numpages>1 then if value.modelpage>0 then value.left.flags=value.left.flags&(~qmenu.QMF_INACTIVE) else value.left.flags=value.left.flags|qmenu.QMF_INACTIVE end if;if value.modelpage<value.numpages-1 then value.right.flags=value.right.flags&(~qmenu.QMF_INACTIVE) else value.right.flags=value.right.flags|qmenu.QMF_INACTIVE end if else value.left.flags=value.left.flags|qmenu.QMF_INACTIVE;value.right.flags=value.right.flags|qmenu.QMF_INACTIVE end if;return value
end function
// PlayerModel_UpdateModel
/// @param value Mutable UI playermodel record/storage; this routine assigns `value.playerinfo`.
function PlayerModel_UpdateModel(value) value.playerinfo=players.create();players.UI_PlayerInfo_SetModel(value.source,value.playerinfo,value.modelskin);players.UI_PlayerInfo_SetInfo(value.source,value.playerinfo,players.LEGS_IDLE,players.TORSO_STAND,[0.0,150.0,0.0],[0.0,0.0,0.0],players.WP_MACHINEGUN,false);return value.playerinfo end function
// PlayerModel_SaveChanges
/// @param value Mutable UI playermodel record/storage; this routine assigns `value.cvarWrites`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function PlayerModel_SaveChanges(value,retailActive) for each name in ["model","headmodel","team_model","team_headmodel"] value.cvarWrites=value.cvarWrites+[[name,value.modelskin]];emit(value,"cvar","set",name,value.modelskin,0,retailActive) end for;return void end function
// PlayerModel_MenuEvent
/// @param value Mutable UI playermodel record/storage; this routine assigns `value.modelpage`, `value.popped`.
/// @param id Value used by `if id==ID_PREVPAGE then if value.modelpage>0 then value.modelpage=value.modelpage-1`.
/// @param event Event identifier compared with the supported activation/input events.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function PlayerModel_MenuEvent(value,id,event,retailActive) if event!=qmenu.QM_ACTIVATED then return false end if;if id==ID_PREVPAGE then if value.modelpage>0 then value.modelpage=value.modelpage-1;PlayerModel_UpdateGrid(value) end if else if id==ID_NEXTPAGE then if value.modelpage<value.numpages-1 then value.modelpage=value.modelpage+1;PlayerModel_UpdateGrid(value) end if else if id==ID_BACK then PlayerModel_SaveChanges(value,retailActive);value.popped=true;emit(value,"ui","pop","player-model","",0,retailActive) end if;return true end function
/// Adapts `mq3.client.ui_qmenu.Menu_ItemAtCursor` to UI playermodel `current`, returning its result for `value.menu`.
/// @param value Record read through `value.menu`.
function current(value) return qmenu.Menu_ItemAtCursor(value.menu) end function
// PlayerModel_MenuKey
/// @param value Mutable UI playermodel record/storage; this routine assigns `value.modelpage`.
/// @param key Key or control identifier used to select the corresponding UI playermodel entry.
/// @param cursorx Value used by `return qmenu.Menu_DefaultKey(value.menu,key,cursorx,cursory)`.
/// @param cursory Value used by `return qmenu.Menu_DefaultKey(value.menu,key,cursorx,cursory)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function PlayerModel_MenuKey(value,key,cursorx,cursory,retailActive)
  item=current(value);picnum=-1;if item!=void then picnum=item.id end if
  if key==qmenu.K_KP_LEFTARROW or key==qmenu.K_LEFTARROW then if picnum>=0 and picnum<=15 then if picnum>0 then qmenu.Menu_SetCursor(value.menu,value.menu.cursor-2);return qmenu.SOUND_MOVE else if value.modelpage>0 then value.modelpage=value.modelpage-1;qmenu.Menu_SetCursor(value.menu,value.menu.cursor+30);PlayerModel_UpdateGrid(value);return qmenu.SOUND_MOVE else return qmenu.SOUND_BUZZ end if end if
  else if key==qmenu.K_KP_RIGHTARROW or key==qmenu.K_RIGHTARROW then if picnum>=0 and picnum<=15 then if picnum<15 and value.modelpage*16+picnum+1<value.nummodels then qmenu.Menu_SetCursor(value.menu,value.menu.cursor+2);return qmenu.SOUND_MOVE else if picnum==15 and value.modelpage<value.numpages-1 then value.modelpage=value.modelpage+1;qmenu.Menu_SetCursor(value.menu,value.menu.cursor-30);PlayerModel_UpdateGrid(value);return qmenu.SOUND_MOVE else return qmenu.SOUND_BUZZ end if end if
  else if key==qmenu.K_MOUSE2 or key==qmenu.K_ESCAPE then PlayerModel_SaveChanges(value,retailActive) end if
  activate=key==qmenu.K_ENTER or key==qmenu.K_KP_ENTER or qmenu.joystickActivate(key);if activate and item!=void and (item.flags&(qmenu.QMF_INACTIVE|qmenu.QMF_GRAYED))==0 then if item.id>=0 and item.id<=15 then PlayerModel_PicEvent(value,item.id,qmenu.QM_ACTIVATED,value.memoryRemaining) else PlayerModel_MenuEvent(value,item.id,qmenu.QM_ACTIVATED,retailActive) end if;return qmenu.SOUND_MOVE end if;return qmenu.Menu_DefaultKey(value.menu,key,cursorx,cursory)
end function
// PlayerModel_PicEvent
/// @param value Mutable UI playermodel record/storage; this routine assigns `value.pics[i].flags`, `value.picbuttons[i].flags`, `value.pics[id].flags`, `value.picbuttons[id].flags` and additional values.
/// @param id Value used by `if event!=qmenu.QM_ACTIVATED or id<0 or id>=16 then return false end if`.
/// @param event Event identifier compared with the supported activation/input events.
/// @param memoryRemaining Value used by `if memoryRemaining>LOW_MEMORY then PlayerModel_UpdateModel(value) end if`.
function PlayerModel_PicEvent(value,id,event,memoryRemaining)
  if event!=qmenu.QM_ACTIVATED or id<0 or id>=16 then return false end if;modelnum=value.modelpage*16+id;if modelnum<0 or modelnum>=value.nummodels then return false end if;for i=0 to 15 value.pics[i].flags=value.pics[i].flags&(~qmenu.QMF_HIGHLIGHT);value.picbuttons[i].flags=value.picbuttons[i].flags|qmenu.QMF_PULSEIFFOCUS end for;value.pics[id].flags=value.pics[id].flags|qmenu.QMF_HIGHLIGHT;value.picbuttons[id].flags=value.picbuttons[id].flags&(~qmenu.QMF_PULSEIFFOCUS);if not setLabels(value,value.modelnames[modelnum]) then return false end if;value.selectedmodel=modelnum;if len(value.menu.items)>6 then value.menu.items[5].string=value.modelname;value.menu.items[6].string=value.skinname end if;if memoryRemaining>LOW_MEMORY then PlayerModel_UpdateModel(value) end if;return true
end function
// PlayerModel_DrawPlayer
/// @param value Mutable UI playermodel record/storage; this routine assigns `value.drawRows`.
/// @param realtime Current client real-time clock in milliseconds.
/// @param frametime Value used by `players.UI_DrawPlayer(value.source,400.0,-40.0,320.0,560.0,value.playerinfo,n.trunc32(realtime/2),frametime,retailActive)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function PlayerModel_DrawPlayer(value,realtime,frametime,retailActive) if value.memoryRemaining<=LOW_MEMORY then emit(value,"ui","draw-text","LOW MEMORY","red",0,retailActive);return [] end if;before=len(value.playerinfo.actions);players.UI_DrawPlayer(value.source,400.0,-40.0,320.0,560.0,value.playerinfo,n.trunc32(realtime/2),frametime,retailActive);rows=[];if len(value.playerinfo.actions)>before then for i=before to len(value.playerinfo.actions)-1 rows=rows+[value.playerinfo.actions[i]] end for end if;value.drawRows=rows;return rows end function
// PlayerModel_BuildList
/// @param value Mutable UI playermodel record/storage; this routine assigns `value.modelpage`, `value.modelnames`, `value.nummodels`, `value.numpages`.
/// @param files Value used by `for each path in files`.
/// @param buildscript Value used by `if buildscript and starts(path,"models/players/") and ends(path,".tga") then leaf=path`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function PlayerModel_BuildList(value,files,buildscript,retailActive)
  value.modelpage=0;value.modelnames=[];for each path in files
    if buildscript and starts(path,"models/players/") and ends(path,".tga") then leaf=path;slash=-1;for i=0 to len(path)-1 if strings.substr(path,i,1)=="/" then slash=i end if end for;if slash>=0 then skin=strings.substr(path,slash+1,len(path)-slash-5);emit(value,"audio","register-sound","sound/player/announce/"+skin+"_wins.wav","",0,retailActive) end if end if
    part=iconParts(path);if part!=void and len(value.modelnames)<MAX_PLAYERMODELS then value.modelnames=value.modelnames+[part[2]] end if
  end for;value.nummodels=len(value.modelnames);value.numpages=n.trunc32(value.nummodels/16);if value.nummodels%16!=0 then value.numpages=value.numpages+1 end if;return value.nummodels
end function
// PlayerModel_SetMenuItems
/// @param value Mutable UI playermodel record/storage; this routine assigns `value.playername`, `value.modelskin`, `value.selectedmodel`, `value.modelpage`.
/// @param playerName Player name shown in the UI or supplied to the client configuration.
/// @param model Model handle, asset or preview record used by this UI playermodel operation.
function PlayerModel_SetMenuItems(value,playerName,model)
  value.playername=clean(truncate(playerName,16));value.modelskin=truncate(model,64);value.selectedmodel=0;if value.nummodels>0 then for i=0 to value.nummodels-1 part=iconParts(value.modelnames[i]+".tga");if part!=void and value.modelskin==part[0]+"/"+part[1] then value.selectedmodel=i;value.modelpage=n.trunc32(i/16);setLabels(value,value.modelnames[i]);break end if end for end if;return value.selectedmodel
end function
/// Calls `mq3.client.ui_qmenu.item` from UI playermodel `bitmap`. The final path returns `value`.
/// @param name Name used to select or register the corresponding UI playermodel resource.
/// @param id Value used by `value=qmenu.item(qmenu.MTYPE_BITMAP,name,id,x,y,flags)`.
/// @param x Horizontal coordinate in the coordinate space used by `bitmap`.
/// @param y Vertical coordinate in the coordinate space used by `bitmap`.
/// @param flags Value used by `value=qmenu.item(qmenu.MTYPE_BITMAP,name,id,x,y,flags)`.
/// @param w Value assigned to `value.width`.
/// @param h Value assigned to `value.height`.
function bitmap(name,id,x,y,flags,w,h) value=qmenu.item(qmenu.MTYPE_BITMAP,name,id,x,y,flags);value.width=w;value.height=h;return value end function
// PlayerModel_MenuInit
/// @param value Mutable UI playermodel record/storage; this routine assigns `value.menu`, `value.pics`, `value.picbuttons`, `value.left` and additional values.
/// @param files Value used by `PlayerModel_Cache(value,files,buildscript,retailActive)`.
/// @param playerName Player name shown in the UI or supplied to the client configuration.
/// @param model Model handle, asset or preview record used by this UI playermodel operation.
/// @param buildscript Value used by `PlayerModel_Cache(value,files,buildscript,retailActive)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function PlayerModel_MenuInit(value,files,playerName,model,buildscript,retailActive)
  value.menu=qmenu.menu(true,true);PlayerModel_Cache(value,files,buildscript,retailActive);value.pics=[];value.picbuttons=[];y=59
  for row=0 to 3 x=50;for col=0 to 3 index=row*4+col;pic=bitmap("",-1,x,y,qmenu.QMF_LEFT_JUSTIFY|qmenu.QMF_INACTIVE,64,64);pic.focuspic="menu/art/opponents_selected";button=bitmap("",index,x-16,y-16,qmenu.QMF_LEFT_JUSTIFY|qmenu.QMF_NODEFAULTINIT|qmenu.QMF_PULSEIFFOCUS,128,128);button.left=x;button.top=y;button.right=x+64;button.bottom=y+64;button.focuspic="menu/art/opponents_select";value.pics=value.pics+[pic];value.picbuttons=value.picbuttons+[button];x=x+70 end for;y=y+70 end for
  value.left=bitmap("",ID_PREVPAGE,125,340,qmenu.QMF_LEFT_JUSTIFY|qmenu.QMF_PULSEIFFOCUS,64,32);value.left.focuspic="menu/art/gs_arrows_l";value.right=bitmap("",ID_NEXTPAGE,186,340,qmenu.QMF_LEFT_JUSTIFY|qmenu.QMF_PULSEIFFOCUS,64,32);value.right.focuspic="menu/art/gs_arrows_r";value.back=bitmap("menu/art/back_0",ID_BACK,0,416,qmenu.QMF_LEFT_JUSTIFY|qmenu.QMF_PULSEIFFOCUS,128,64);value.back.focuspic="menu/art/back_1";value.player=bitmap("",-1,400,-40,qmenu.QMF_INACTIVE,320,560)
  decor=[qmenu.item(qmenu.MTYPE_BTEXT,"",-1,320,16,qmenu.QMF_INACTIVE),bitmap("menu/art/frame1_l",-1,0,78,qmenu.QMF_LEFT_JUSTIFY|qmenu.QMF_INACTIVE,256,329),bitmap("menu/art/frame1_r",-1,376,76,qmenu.QMF_LEFT_JUSTIFY|qmenu.QMF_INACTIVE,256,334),bitmap("menu/art/player_models_ports",-1,50,59,qmenu.QMF_LEFT_JUSTIFY|qmenu.QMF_INACTIVE,274,274),qmenu.item(qmenu.MTYPE_PTEXT,"",-1,320,440,qmenu.QMF_CENTER_JUSTIFY|qmenu.QMF_INACTIVE),qmenu.item(qmenu.MTYPE_PTEXT,"",-1,497,54,qmenu.QMF_CENTER_JUSTIFY|qmenu.QMF_INACTIVE),qmenu.item(qmenu.MTYPE_PTEXT,"",-1,497,394,qmenu.QMF_CENTER_JUSTIFY|qmenu.QMF_INACTIVE)];decor[0].string="PLAYER MODEL";decor[4].string=value.playername;decor[5].string=value.modelname;decor[6].string=value.skinname;for each item in decor value.menu=qmenu.Menu_AddItem(value.menu,item) end for;for i=0 to 15 value.menu=qmenu.Menu_AddItem(value.menu,value.pics[i]);value.menu=qmenu.Menu_AddItem(value.menu,value.picbuttons[i]) end for;value.menu=qmenu.Menu_AddItem(value.menu,value.player);value.menu=qmenu.Menu_AddItem(value.menu,bitmap("menu/art/gs_arrows_0",-1,125,340,qmenu.QMF_INACTIVE,128,32));value.menu=qmenu.Menu_AddItem(value.menu,value.left);value.menu=qmenu.Menu_AddItem(value.menu,value.right);value.menu=qmenu.Menu_AddItem(value.menu,value.back)
  PlayerModel_SetMenuItems(value,playerName,model);value.menu.items[4].string=value.playername;value.menu.items[5].string=value.modelname;value.menu.items[6].string=value.skinname;PlayerModel_UpdateGrid(value);if value.modelskin!="" then PlayerModel_UpdateModel(value) end if;return value
end function
// PlayerModel_Cache
/// @param value Record read through `value.modelnames`, `value.actions`.
/// @param files Value used by `PlayerModel_BuildList(value,files,buildscript,retailActive)`.
/// @param buildscript Value used by `PlayerModel_BuildList(value,files,buildscript,retailActive)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function PlayerModel_Cache(value,files,buildscript,retailActive) for each art in artList() emit(value,"renderer","register-shader",art,"",0,retailActive) end for;PlayerModel_BuildList(value,files,buildscript,retailActive);for each icon in value.modelnames emit(value,"renderer","register-shader",icon,"",0,retailActive) end for;return len(value.actions) end function
// UI_PlayerModelMenu
/// @param value Mutable UI playermodel record/storage; this routine assigns `value.pushed`, `value.menu.cursor`.
/// @param files Value used by `PlayerModel_MenuInit(value,files,playerName,model,buildscript,retailActive)`.
/// @param playerName Player name shown in the UI or supplied to the client configuration.
/// @param model Model handle, asset or preview record used by this UI playermodel operation.
/// @param buildscript Value used by `PlayerModel_MenuInit(value,files,playerName,model,buildscript,retailActive)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function UI_PlayerModelMenu(value,files,playerName,model,buildscript,retailActive) PlayerModel_MenuInit(value,files,playerName,model,buildscript,retailActive);value.pushed=true;emit(value,"ui","push","player-model","",0,retailActive);if value.nummodels>0 then value.menu.cursor=8+(value.selectedmodel%16)*2 end if;return value end function
