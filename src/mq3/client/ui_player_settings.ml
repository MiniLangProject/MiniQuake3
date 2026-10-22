// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_playersettings.c.
package mq3.client.ui_player_settings

import mq3.client.ui_mfield as mfield
import mq3.client.ui_players as players
import mq3.client.ui_qmenu as qmenu
import mq3.compat.numeric as numeric

const ID_NAME=10
const ID_HANDICAP=11
const ID_EFFECTS=12
const ID_BACK=13
const ID_MODEL=14
const MAX_NAMELENGTH=20

struct HostAction boundary kind name text number x y width height dispatched end struct
struct DrawCommand kind text x y width height style color asset end struct
struct State source menu name handicap effects currentFx playerModel playerinfo assets actions cvarWrites popped pushed modelMenu drawCommands realtime frametime end struct

function artList() return ["menu/art/frame2_l","menu/art/frame1_r","menu/art/model_0","menu/art/model_1","menu/art/back_0","menu/art/back_1","menu/art/fx_base","menu/art/fx_red","menu/art/fx_yel","menu/art/fx_grn","menu/art/fx_teal","menu/art/fx_blue","menu/art/fx_cyan","menu/art/fx_white"] end function
function handicapItems() return ["None","95","90","85","80","75","70","65","60","55","50","45","40","35","30","25","20","15","10","5"] end function
function gameCodeToUi() return [4,2,3,0,5,1,6] end function
function uiToGameCode() return [4,6,2,3,1,5,7] end function
function emit(value,boundary,kind,name,text,number,x,y,width,height,retailActive) value.actions=value.actions+[HostAction(boundary,kind,name,text,number,x,y,width,height,not retailActive)];return void end function
function create(source)
  return State(source,qmenu.menu(true,true),mfield.field(MAX_NAMELENGTH,MAX_NAMELENGTH),0,0,0,"",players.create(),[],[],[],false,false,false,[],0,16)
end function
function color(index) table=[[0.0,0.0,0.0,1.0],[1.0,0.0,0.0,1.0],[0.0,1.0,0.0,1.0],[1.0,1.0,0.0,1.0],[0.0,0.0,1.0,1.0],[0.0,1.0,1.0,1.0],[1.0,0.0,1.0,1.0],[1.0,1.0,1.0,1.0]];if index<0 or index>7 then index=7 end if;return table[index] end function
function isColor(data,index) return index+1<len(data) and data[index]==94 and data[index+1]!=94 end function
function cleanName(text)
  data=bytes(text);result="";at=0
  while at<len(data)
    if isColor(data,at) then
      at=at+2
    else
      if data[at]>=32 and data[at]<=126 then result=result+decode(bytes([data[at]])) end if
      at=at+1
    end if
  end while;return result
end function
function visibleNameCommands(text,focus,basex,y,style)
  rows=[];data=bytes(text);at=0;x=basex;current=color(7)
  while at<len(data)
    if not focus and isColor(data,at) then n=data[at+1]-48;if n==0 then n=7 end if;current=color(n);at=at+2
    else rows=rows+[DrawCommand("char",decode(bytes([data[at]])),x,y,8,16,style,current,"")];x=x+qmenu.SMALLCHAR_WIDTH;at=at+1 end if
  end while;return rows
end function

// PlayerSettings_DrawName
function PlayerSettings_DrawName(value,focus,retailActive)
  style=qmenu.UI_LEFT|qmenu.UI_SMALLFONT;if focus then style=style|qmenu.UI_PULSE end if;rows=[DrawCommand("proportional","Name",192,144,0,0,style,void,"")];rows=rows+visibleNameCommands(value.name.buffer,focus,256,144+qmenu.PROP_HEIGHT,style)
  if focus then cursorChar=10;if value.name.overstrike then cursorChar=11 end if;cursorStyle=(style&(~qmenu.UI_PULSE))|qmenu.UI_BLINK;rows=rows+[DrawCommand("char",decode(bytes([cursorChar])),256+value.name.cursor*qmenu.SMALLCHAR_WIDTH,144+qmenu.PROP_HEIGHT,8,16,cursorStyle,color(7),"")] end if
  rows=rows+[DrawCommand("proportional",cleanName(value.name.buffer),320,440,0,0,qmenu.UI_CENTER|128,void,"")];value.drawCommands=value.drawCommands+rows;for each row in rows emit(value,"renderer","draw-"+row.kind,row.asset,row.text,0,row.x,row.y,row.width,row.height,retailActive) end for;return rows
end function

// PlayerSettings_DrawHandicap
function PlayerSettings_DrawHandicap(value,focus,retailActive)
  style=qmenu.UI_LEFT|qmenu.UI_SMALLFONT;if focus then style=style|qmenu.UI_PULSE end if;items=handicapItems();index=value.handicap;if index<0 then index=0 end if;if index>=len(items) then index=len(items)-1 end if;rows=[DrawCommand("proportional","Handicap",192,225,0,0,style,void,""),DrawCommand("proportional",items[index],256,225+qmenu.PROP_HEIGHT,0,0,style,void,"")];value.drawCommands=value.drawCommands+rows;for each row in rows emit(value,"renderer","draw-proportional","",row.text,0,row.x,row.y,0,0,retailActive) end for;return rows
end function

// PlayerSettings_DrawEffects
function PlayerSettings_DrawEffects(value,focus,retailActive)
  style=qmenu.UI_LEFT|qmenu.UI_SMALLFONT;if focus then style=style|qmenu.UI_PULSE end if;index=value.effects;if index<0 then index=0 end if;if index>6 then index=6 end if;fx=artList();rows=[DrawCommand("proportional","Effects",192,306,0,0,style,void,""),DrawCommand("picture","",256,306+qmenu.PROP_HEIGHT+8,128,8,0,void,fx[6]),DrawCommand("picture","",256+index*16+8,306+qmenu.PROP_HEIGHT+6,16,12,0,void,fx[7+index])];value.drawCommands=value.drawCommands+rows;for each row in rows emit(value,"renderer","draw-"+row.kind,row.asset,row.text,0,row.x,row.y,row.width,row.height,retailActive) end for;return rows
end function

// PlayerSettings_DrawPlayer
function PlayerSettings_DrawPlayer(value,model,retailActive)
  if model!=value.playerModel then players.UI_PlayerInfo_SetModel(value.source,value.playerinfo,model);value.playerModel=model;players.UI_PlayerInfo_SetInfo(value.source,value.playerinfo,players.LEGS_IDLE,players.TORSO_STAND,[0.0,150.0,0.0],[0.0,0.0,0.0],players.WP_MACHINEGUN,false) end if
  before=len(value.playerinfo.actions);players.UI_DrawPlayer(value.source,400.0,-40.0,320.0,560.0,value.playerinfo,numeric.trunc32(value.realtime/2),value.frametime,retailActive);rows=[];if len(value.playerinfo.actions)>before then for i=before to len(value.playerinfo.actions)-1 rows=rows+[value.playerinfo.actions[i]] end for end if;return rows
end function

// PlayerSettings_SaveChanges
function PlayerSettings_SaveChanges(value,retailActive)
  writes=[["name",value.name.buffer],["handicap",str(100-value.handicap*5)],["color1",str(uiToGameCode()[value.effects])]];value.cvarWrites=value.cvarWrites+writes;for each pair in writes emit(value,"cvar","set",pair[0],pair[1],0,0,0,0,0,retailActive) end for;return writes
end function

// PlayerSettings_MenuKey
function PlayerSettings_MenuKey(value,key,cursorx,cursory,retailActive)
  if key==qmenu.K_MOUSE2 or key==qmenu.K_ESCAPE then PlayerSettings_SaveChanges(value,retailActive) end if;return qmenu.Menu_DefaultKey(value.menu,key,cursorx,cursory)
end function

// PlayerSettings_SetMenuItems
function PlayerSettings_SetMenuItems(value,name,color1,model,handicap)
  data=bytes(name);if len(data)>=mfield.MAX_EDIT_LINE then value.name.buffer=decode(slice(data,0,mfield.MAX_EDIT_LINE-1)) else value.name.buffer=name end if;value.name.cursor=len(bytes(value.name.buffer));c=numeric.trunc32(color1)-1;if c<0 or c>6 then c=6 end if;value.effects=gameCodeToUi()[c];value.playerinfo=players.create();players.UI_PlayerInfo_SetModel(value.source,value.playerinfo,model);players.UI_PlayerInfo_SetInfo(value.source,value.playerinfo,players.LEGS_IDLE,players.TORSO_STAND,[0.0,150.0,0.0],[0.0,0.0,0.0],players.WP_MACHINEGUN,false);h=handicap;if h<5 then h=5 end if;if h>100 then h=100 end if;value.handicap=20-numeric.trunc32(h/5);return value
end function

// PlayerSettings_MenuEvent
function PlayerSettings_MenuEvent(value,id,event,retailActive)
  if event!=qmenu.QM_ACTIVATED then return false end if
  if id==ID_HANDICAP then immediate=str(100-25*value.handicap);value.cvarWrites=value.cvarWrites+[["handicap",immediate]];emit(value,"cvar","set","handicap",immediate,0,0,0,0,0,retailActive)
  else if id==ID_MODEL then PlayerSettings_SaveChanges(value,retailActive);value.modelMenu=true;emit(value,"ui","push","player-model","",0,0,0,0,0,retailActive)
  else if id==ID_BACK then PlayerSettings_SaveChanges(value,retailActive);value.popped=true;emit(value,"ui","pop","player-settings","",0,0,0,0,0,retailActive) end if;return true
end function
function bitmap(name,id,x,y,flags,width,height) item=qmenu.item(qmenu.MTYPE_BITMAP,name,id,x,y,flags);item.width=width;item.height=height;return item end function

// PlayerSettings_MenuInit
function PlayerSettings_MenuInit(value,name,color1,model,handicap,retailActive)
  value.menu=qmenu.menu(true,true);value.actions=[];value.cvarWrites=[];value.assets=[];value.popped=false;value.pushed=false;value.modelMenu=false;PlayerSettings_Cache(value,retailActive)
  banner=qmenu.item(qmenu.MTYPE_BTEXT,"",-1,320,16,qmenu.QMF_INACTIVE);banner.string="PLAYER SETTINGS";banner.style=qmenu.UI_CENTER
  framel=bitmap("menu/art/frame2_l",-1,0,78,qmenu.QMF_LEFT_JUSTIFY|qmenu.QMF_INACTIVE,256,329);framer=bitmap("menu/art/frame1_r",-1,376,76,qmenu.QMF_LEFT_JUSTIFY|qmenu.QMF_INACTIVE,256,334)
  nameItem=qmenu.item(qmenu.MTYPE_FIELD,"",ID_NAME,192,144,qmenu.QMF_NODEFAULTINIT);nameItem.left=184;nameItem.top=136;nameItem.right=392;nameItem.bottom=144+2*qmenu.PROP_HEIGHT;nameItem.widthInChars=MAX_NAMELENGTH;nameItem.maxchars=MAX_NAMELENGTH
  handicapItem=qmenu.item(qmenu.MTYPE_SPINCONTROL,"",ID_HANDICAP,192,225,qmenu.QMF_NODEFAULTINIT);handicapItem.left=184;handicapItem.top=217;handicapItem.right=392;handicapItem.bottom=225+2*qmenu.PROP_HEIGHT;handicapItem.numitems=20
  effectsItem=qmenu.item(qmenu.MTYPE_SPINCONTROL,"",ID_EFFECTS,192,306,qmenu.QMF_NODEFAULTINIT);effectsItem.left=184;effectsItem.top=298;effectsItem.right=392;effectsItem.bottom=306+2*qmenu.PROP_HEIGHT;effectsItem.numitems=7
  modelItem=bitmap("menu/art/model_0",ID_MODEL,640,416,qmenu.QMF_RIGHT_JUSTIFY|qmenu.QMF_PULSEIFFOCUS,128,64);modelItem.focuspic="menu/art/model_1";back=bitmap("menu/art/back_0",ID_BACK,0,416,qmenu.QMF_LEFT_JUSTIFY|qmenu.QMF_PULSEIFFOCUS,128,64);back.focuspic="menu/art/back_1";player=bitmap("",-1,400,-40,qmenu.QMF_INACTIVE,320,560);nullItem=bitmap("",-1,0,0,qmenu.QMF_LEFT_JUSTIFY|qmenu.QMF_MOUSEONLY|qmenu.QMF_SILENT,640,480)
  for each item in [banner,framel,framer,nameItem,handicapItem,effectsItem,modelItem,back,player,nullItem] value.menu=qmenu.Menu_AddItem(value.menu,item) end for;PlayerSettings_SetMenuItems(value,name,color1,model,handicap);return value
end function

// PlayerSettings_Cache
function PlayerSettings_Cache(value,retailActive) value.assets=artList();for each art in value.assets emit(value,"renderer","register-shader",art,"",0,0,0,0,0,retailActive) end for;return len(value.assets) end function

// UI_PlayerSettingsMenu
function UI_PlayerSettingsMenu(value,name,color1,model,handicap,retailActive) PlayerSettings_MenuInit(value,name,color1,model,handicap,retailActive);value.pushed=true;emit(value,"ui","push","player-settings","",0,0,0,0,0,retailActive);return value end function
