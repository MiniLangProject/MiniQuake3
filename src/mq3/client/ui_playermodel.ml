// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_playermodel.c.
package mq3.client.ui_playermodel

import mq3.client.ui_players as players
import mq3.client.ui_qmenu as qmenu
import mq3.compat.numeric as n
import std.string as strings

const LOW_MEMORY=5242880
const PLAYERGRID_COLS=4
const PLAYERGRID_ROWS=4
const MAX_MODELSPERPAGE=16
const MAX_PLAYERMODELS=256
const ID_PREVPAGE=100
const ID_NEXTPAGE=101
const ID_BACK=102

struct State source menu pics picbuttons left right back player playerinfo nummodels modelnames modelpage numpages modelskin selectedmodel modelname skinname playername actions cvarWrites popped pushed memoryRemaining drawRows end struct
function artList() return ["menu/art/back_0","menu/art/back_1","menu/art/opponents_select","menu/art/opponents_selected","menu/art/frame1_l","menu/art/frame1_r","menu/art/player_models_ports","menu/art/gs_arrows_0","menu/art/gs_arrows_l","menu/art/gs_arrows_r"] end function
function create(source) return State(source,qmenu.menu(true,true),[],[],void,void,void,void,players.create(),0,[],0,0,"",0,"","","",[],[],false,false,LOW_MEMORY+1,[]) end function
function emit(value,boundary,kind,name,detail,number,retailActive) value.actions=value.actions+[players.Action(boundary,kind,name,detail,number,void,not retailActive)];return void end function
function lower(text) return strings.toLowerAscii(text) end function
function starts(text,prefix) if len(text)<len(prefix) then return false end if;return lower(strings.substr(text,0,len(prefix)))==lower(prefix) end function
function ends(text,suffix) if len(text)<len(suffix) then return false end if;return lower(strings.substr(text,len(text)-len(suffix),len(suffix)))==lower(suffix) end function
function truncate(text,max) if len(bytes(text))>=max then return decode(slice(bytes(text),0,max-1)) end if;return text end function
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
function iconParts(path) prefix="models/players/";if not starts(path,prefix) then return void end if;tail=strings.substr(path,len(prefix),len(path)-len(prefix));slash=strings.indexOf(tail,"/",0);if slash<=0 then return void end if;model=strings.substr(tail,0,slash);leaf=strings.substr(tail,slash+1,len(tail)-slash-1);if strings.indexOf(leaf,"/",0)>=0 or not starts(leaf,"icon_") or not ends(leaf,".tga") then return void end if;skin=strings.substr(leaf,5,len(leaf)-9);if skin=="" then return void end if;return [model,skin,"models/players/"+model+"/icon_"+skin] end function
function setLabels(value,path)
  part=iconParts(path+".tga");if part==void then return false end if;value.modelskin=part[0]+"/"+part[1];value.modelname=strings.toUpperAscii(truncate(part[0],16));value.skinname=strings.toUpperAscii(truncate(part[1],16));return true
end function

// PlayerModel_UpdateGrid
function PlayerModel_UpdateGrid(value)
  start=value.modelpage*MAX_MODELSPERPAGE;for i=0 to MAX_MODELSPERPAGE-1 index=start+i;if index<value.nummodels then value.pics[i].name=value.modelnames[index];value.picbuttons[i].flags=value.picbuttons[i].flags&(~qmenu.QMF_INACTIVE) else value.pics[i].name="";value.picbuttons[i].flags=value.picbuttons[i].flags|qmenu.QMF_INACTIVE end if;value.pics[i].flags=value.pics[i].flags&(~qmenu.QMF_HIGHLIGHT);value.pics[i].shader=0;value.picbuttons[i].flags=value.picbuttons[i].flags|qmenu.QMF_PULSEIFFOCUS end for
  if value.nummodels>0 and n.trunc32(value.selectedmodel/MAX_MODELSPERPAGE)==value.modelpage then i=value.selectedmodel%MAX_MODELSPERPAGE;value.pics[i].flags=value.pics[i].flags|qmenu.QMF_HIGHLIGHT;value.picbuttons[i].flags=value.picbuttons[i].flags&(~qmenu.QMF_PULSEIFFOCUS) end if
  if value.numpages>1 then if value.modelpage>0 then value.left.flags=value.left.flags&(~qmenu.QMF_INACTIVE) else value.left.flags=value.left.flags|qmenu.QMF_INACTIVE end if;if value.modelpage<value.numpages-1 then value.right.flags=value.right.flags&(~qmenu.QMF_INACTIVE) else value.right.flags=value.right.flags|qmenu.QMF_INACTIVE end if else value.left.flags=value.left.flags|qmenu.QMF_INACTIVE;value.right.flags=value.right.flags|qmenu.QMF_INACTIVE end if;return value
end function
// PlayerModel_UpdateModel
function PlayerModel_UpdateModel(value) value.playerinfo=players.create();players.UI_PlayerInfo_SetModel(value.source,value.playerinfo,value.modelskin);players.UI_PlayerInfo_SetInfo(value.source,value.playerinfo,players.LEGS_IDLE,players.TORSO_STAND,[0.0,150.0,0.0],[0.0,0.0,0.0],players.WP_MACHINEGUN,false);return value.playerinfo end function
// PlayerModel_SaveChanges
function PlayerModel_SaveChanges(value,retailActive) for each name in ["model","headmodel","team_model","team_headmodel"] value.cvarWrites=value.cvarWrites+[[name,value.modelskin]];emit(value,"cvar","set",name,value.modelskin,0,retailActive) end for;return void end function
// PlayerModel_MenuEvent
function PlayerModel_MenuEvent(value,id,event,retailActive) if event!=qmenu.QM_ACTIVATED then return false end if;if id==ID_PREVPAGE then if value.modelpage>0 then value.modelpage=value.modelpage-1;PlayerModel_UpdateGrid(value) end if else if id==ID_NEXTPAGE then if value.modelpage<value.numpages-1 then value.modelpage=value.modelpage+1;PlayerModel_UpdateGrid(value) end if else if id==ID_BACK then PlayerModel_SaveChanges(value,retailActive);value.popped=true;emit(value,"ui","pop","player-model","",0,retailActive) end if;return true end function
function current(value) return qmenu.Menu_ItemAtCursor(value.menu) end function
// PlayerModel_MenuKey
function PlayerModel_MenuKey(value,key,cursorx,cursory,retailActive)
  item=current(value);picnum=-1;if item!=void then picnum=item.id end if
  if key==qmenu.K_KP_LEFTARROW or key==qmenu.K_LEFTARROW then if picnum>=0 and picnum<=15 then if picnum>0 then qmenu.Menu_SetCursor(value.menu,value.menu.cursor-2);return qmenu.SOUND_MOVE else if value.modelpage>0 then value.modelpage=value.modelpage-1;qmenu.Menu_SetCursor(value.menu,value.menu.cursor+30);PlayerModel_UpdateGrid(value);return qmenu.SOUND_MOVE else return qmenu.SOUND_BUZZ end if end if
  else if key==qmenu.K_KP_RIGHTARROW or key==qmenu.K_RIGHTARROW then if picnum>=0 and picnum<=15 then if picnum<15 and value.modelpage*16+picnum+1<value.nummodels then qmenu.Menu_SetCursor(value.menu,value.menu.cursor+2);return qmenu.SOUND_MOVE else if picnum==15 and value.modelpage<value.numpages-1 then value.modelpage=value.modelpage+1;qmenu.Menu_SetCursor(value.menu,value.menu.cursor-30);PlayerModel_UpdateGrid(value);return qmenu.SOUND_MOVE else return qmenu.SOUND_BUZZ end if end if
  else if key==qmenu.K_MOUSE2 or key==qmenu.K_ESCAPE then PlayerModel_SaveChanges(value,retailActive) end if
  activate=key==qmenu.K_ENTER or key==qmenu.K_KP_ENTER or qmenu.joystickActivate(key);if activate and item!=void and (item.flags&(qmenu.QMF_INACTIVE|qmenu.QMF_GRAYED))==0 then if item.id>=0 and item.id<=15 then PlayerModel_PicEvent(value,item.id,qmenu.QM_ACTIVATED,value.memoryRemaining) else PlayerModel_MenuEvent(value,item.id,qmenu.QM_ACTIVATED,retailActive) end if;return qmenu.SOUND_MOVE end if;return qmenu.Menu_DefaultKey(value.menu,key,cursorx,cursory)
end function
// PlayerModel_PicEvent
function PlayerModel_PicEvent(value,id,event,memoryRemaining)
  if event!=qmenu.QM_ACTIVATED or id<0 or id>=16 then return false end if;modelnum=value.modelpage*16+id;if modelnum<0 or modelnum>=value.nummodels then return false end if;for i=0 to 15 value.pics[i].flags=value.pics[i].flags&(~qmenu.QMF_HIGHLIGHT);value.picbuttons[i].flags=value.picbuttons[i].flags|qmenu.QMF_PULSEIFFOCUS end for;value.pics[id].flags=value.pics[id].flags|qmenu.QMF_HIGHLIGHT;value.picbuttons[id].flags=value.picbuttons[id].flags&(~qmenu.QMF_PULSEIFFOCUS);if not setLabels(value,value.modelnames[modelnum]) then return false end if;value.selectedmodel=modelnum;if len(value.menu.items)>6 then value.menu.items[5].string=value.modelname;value.menu.items[6].string=value.skinname end if;if memoryRemaining>LOW_MEMORY then PlayerModel_UpdateModel(value) end if;return true
end function
// PlayerModel_DrawPlayer
function PlayerModel_DrawPlayer(value,realtime,frametime,retailActive) if value.memoryRemaining<=LOW_MEMORY then emit(value,"ui","draw-text","LOW MEMORY","red",0,retailActive);return [] end if;before=len(value.playerinfo.actions);players.UI_DrawPlayer(value.source,400.0,-40.0,320.0,560.0,value.playerinfo,n.trunc32(realtime/2),frametime,retailActive);rows=[];if len(value.playerinfo.actions)>before then for i=before to len(value.playerinfo.actions)-1 rows=rows+[value.playerinfo.actions[i]] end for end if;value.drawRows=rows;return rows end function
// PlayerModel_BuildList
function PlayerModel_BuildList(value,files,buildscript,retailActive)
  value.modelpage=0;value.modelnames=[];for each path in files
    if buildscript and starts(path,"models/players/") and ends(path,".tga") then leaf=path;slash=-1;for i=0 to len(path)-1 if strings.substr(path,i,1)=="/" then slash=i end if end for;if slash>=0 then skin=strings.substr(path,slash+1,len(path)-slash-5);emit(value,"audio","register-sound","sound/player/announce/"+skin+"_wins.wav","",0,retailActive) end if end if
    part=iconParts(path);if part!=void and len(value.modelnames)<MAX_PLAYERMODELS then value.modelnames=value.modelnames+[part[2]] end if
  end for;value.nummodels=len(value.modelnames);value.numpages=n.trunc32(value.nummodels/16);if value.nummodels%16!=0 then value.numpages=value.numpages+1 end if;return value.nummodels
end function
// PlayerModel_SetMenuItems
function PlayerModel_SetMenuItems(value,playerName,model)
  value.playername=clean(truncate(playerName,16));value.modelskin=truncate(model,64);value.selectedmodel=0;if value.nummodels>0 then for i=0 to value.nummodels-1 part=iconParts(value.modelnames[i]+".tga");if part!=void and value.modelskin==part[0]+"/"+part[1] then value.selectedmodel=i;value.modelpage=n.trunc32(i/16);setLabels(value,value.modelnames[i]);break end if end for end if;return value.selectedmodel
end function
function bitmap(name,id,x,y,flags,w,h) value=qmenu.item(qmenu.MTYPE_BITMAP,name,id,x,y,flags);value.width=w;value.height=h;return value end function
// PlayerModel_MenuInit
function PlayerModel_MenuInit(value,files,playerName,model,buildscript,retailActive)
  value.menu=qmenu.menu(true,true);PlayerModel_Cache(value,files,buildscript,retailActive);value.pics=[];value.picbuttons=[];y=59
  for row=0 to 3 x=50;for col=0 to 3 index=row*4+col;pic=bitmap("",-1,x,y,qmenu.QMF_LEFT_JUSTIFY|qmenu.QMF_INACTIVE,64,64);pic.focuspic="menu/art/opponents_selected";button=bitmap("",index,x-16,y-16,qmenu.QMF_LEFT_JUSTIFY|qmenu.QMF_NODEFAULTINIT|qmenu.QMF_PULSEIFFOCUS,128,128);button.left=x;button.top=y;button.right=x+64;button.bottom=y+64;button.focuspic="menu/art/opponents_select";value.pics=value.pics+[pic];value.picbuttons=value.picbuttons+[button];x=x+70 end for;y=y+70 end for
  value.left=bitmap("",ID_PREVPAGE,125,340,qmenu.QMF_LEFT_JUSTIFY|qmenu.QMF_PULSEIFFOCUS,64,32);value.left.focuspic="menu/art/gs_arrows_l";value.right=bitmap("",ID_NEXTPAGE,186,340,qmenu.QMF_LEFT_JUSTIFY|qmenu.QMF_PULSEIFFOCUS,64,32);value.right.focuspic="menu/art/gs_arrows_r";value.back=bitmap("menu/art/back_0",ID_BACK,0,416,qmenu.QMF_LEFT_JUSTIFY|qmenu.QMF_PULSEIFFOCUS,128,64);value.back.focuspic="menu/art/back_1";value.player=bitmap("",-1,400,-40,qmenu.QMF_INACTIVE,320,560)
  decor=[qmenu.item(qmenu.MTYPE_BTEXT,"",-1,320,16,qmenu.QMF_INACTIVE),bitmap("menu/art/frame1_l",-1,0,78,qmenu.QMF_LEFT_JUSTIFY|qmenu.QMF_INACTIVE,256,329),bitmap("menu/art/frame1_r",-1,376,76,qmenu.QMF_LEFT_JUSTIFY|qmenu.QMF_INACTIVE,256,334),bitmap("menu/art/player_models_ports",-1,50,59,qmenu.QMF_LEFT_JUSTIFY|qmenu.QMF_INACTIVE,274,274),qmenu.item(qmenu.MTYPE_PTEXT,"",-1,320,440,qmenu.QMF_CENTER_JUSTIFY|qmenu.QMF_INACTIVE),qmenu.item(qmenu.MTYPE_PTEXT,"",-1,497,54,qmenu.QMF_CENTER_JUSTIFY|qmenu.QMF_INACTIVE),qmenu.item(qmenu.MTYPE_PTEXT,"",-1,497,394,qmenu.QMF_CENTER_JUSTIFY|qmenu.QMF_INACTIVE)];decor[0].string="PLAYER MODEL";decor[4].string=value.playername;decor[5].string=value.modelname;decor[6].string=value.skinname;for each item in decor value.menu=qmenu.Menu_AddItem(value.menu,item) end for;for i=0 to 15 value.menu=qmenu.Menu_AddItem(value.menu,value.pics[i]);value.menu=qmenu.Menu_AddItem(value.menu,value.picbuttons[i]) end for;value.menu=qmenu.Menu_AddItem(value.menu,value.player);value.menu=qmenu.Menu_AddItem(value.menu,bitmap("menu/art/gs_arrows_0",-1,125,340,qmenu.QMF_INACTIVE,128,32));value.menu=qmenu.Menu_AddItem(value.menu,value.left);value.menu=qmenu.Menu_AddItem(value.menu,value.right);value.menu=qmenu.Menu_AddItem(value.menu,value.back)
  PlayerModel_SetMenuItems(value,playerName,model);value.menu.items[4].string=value.playername;value.menu.items[5].string=value.modelname;value.menu.items[6].string=value.skinname;PlayerModel_UpdateGrid(value);if value.modelskin!="" then PlayerModel_UpdateModel(value) end if;return value
end function
// PlayerModel_Cache
function PlayerModel_Cache(value,files,buildscript,retailActive) for each art in artList() emit(value,"renderer","register-shader",art,"",0,retailActive) end for;PlayerModel_BuildList(value,files,buildscript,retailActive);for each icon in value.modelnames emit(value,"renderer","register-shader",icon,"",0,retailActive) end for;return len(value.actions) end function
// UI_PlayerModelMenu
function UI_PlayerModelMenu(value,files,playerName,model,buildscript,retailActive) PlayerModel_MenuInit(value,files,playerName,model,buildscript,retailActive);value.pushed=true;emit(value,"ui","push","player-model","",0,retailActive);if value.nummodels>0 then value.menu.cursor=8+(value.selectedmodel%16)*2 end if;return value end function
