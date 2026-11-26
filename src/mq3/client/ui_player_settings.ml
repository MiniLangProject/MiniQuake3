// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_playersettings.c.
package mq3.client.ui_player_settings

import mq3.client.ui_mfield as mfield
import mq3.client.ui_players as players
import mq3.client.ui_qmenu as qmenu
import mq3.compat.numeric as numeric

/// Menu control identifier routed to the name action by the menu event handler.
const ID_NAME=10
/// Menu control identifier routed to the handicap action by the menu event handler.
const ID_HANDICAP=11
/// Menu control identifier routed to the effects action by the menu event handler.
const ID_EFFECTS=12
/// Event identifier of the Back control used to leave the player name, handicap, and color menu and
/// return to its parent menu.
const ID_BACK=13
/// Menu control identifier routed to the model action by the menu event handler.
const ID_MODEL=14
/// Length limit used for a player or menu display name.
const MAX_NAMELENGTH=20

/// Stores UI player settings host action record, including `boundary`, `kind`, `name`, `text`, `number`, `x` and additional values.
struct HostAction
  /// Host service category recorded with a request emitted while saving player identity and color
  /// settings or drawing the player preview.
  boundary
  /// Operation selector telling the host how to interpret a request emitted while saving player
  /// identity and color settings or drawing the player preview.
  kind
  /// Target resource, command, or setting name addressed by this queued host action.
  name
  /// Player-setting text or cvar value sent to the host, such as the edited name, handicap, or effect
  /// color.
  text
  /// When constructing this record, `emit` supplies `number` for this member.
  number
  /// Horizontal coordinate of the player-settings host drawing request in virtual menu coordinates.
  x
  /// Vertical coordinate of the player-settings host drawing request in virtual menu coordinates.
  y
  /// Destination width recorded for a player-settings renderer request.
  width
  /// Destination height recorded for a player-settings renderer request.
  height
  /// True when this request is marked for native dispatch while saving player identity and color
  /// settings or drawing the player preview; false when its native effect is suppressed.
  dispatched
end struct
/// Stores UI player settings draw command record, including `kind`, `text`, `x`, `y`, `width`, `height` and additional values.
struct DrawCommand
  /// Player-settings drawing operation selecting how its text, artwork, bounds, and color are
  /// interpreted.
  kind
  /// Text portion of a player-settings drawing command, such as the cleaned name or a handicap label.
  text
  /// Horizontal coordinate of the player-settings text or image command in the virtual menu layout.
  x
  /// Vertical coordinate of the player-settings text or image command in the virtual menu layout.
  y
  /// Width of the character or image quad in a player-settings draw command.
  width
  /// Height of the character or image quad in a player-settings draw command.
  height
  /// UI drawing-style flags controlling alignment, font selection, and text emphasis.
  style
  /// RGBA text or cursor color selected for the player-settings draw command.
  color
  /// When constructing this record, `visibleNameCommands` supplies an empty string for this member.
  asset
end struct
/// Stores UI player settings state, including `source`, `menu`, `name`, `handicap`, `effects`, `currentFx` and additional values.
struct State
  /// When constructing this record, `create` supplies `source` for this member.
  source
  /// When constructing this record, `create` supplies `qmenu.menu(true,true)` for this member.
  menu
  /// Player display name currently edited by the player-settings menu.
  name
  /// Player handicap setting used by the user-info and team-display paths.
  handicap
  /// UI palette index for the selected effects color; converted to the game's color code when saving
  /// color1.
  effects
  /// Additional effect-selection slot initialized to zero; current color drawing and saving use the
  /// effects field.
  currentFx
  /// Model resource selected for the player presentation.
  playerModel
  /// When constructing this record, `create` supplies `players.create()` for this member.
  playerinfo
  /// Media resources retained for registering and drawing the artwork used by the player name,
  /// handicap, and color menu.
  assets
  /// Host requests queued while saving player identity and color settings or drawing the player
  /// preview, retained in request order.
  actions
  /// Cvar name/value changes queued by the player name, handicap, and color menu for the host to apply.
  cvarWrites
  /// Records a request to remove the player name, handicap, and color menu from the active menu stack.
  popped
  /// Records that the player name, handicap, and color menu has been opened on the active menu stack.
  pushed
  /// True after saving current player settings and requesting the player-model selection menu.
  modelMenu
  /// Drawing records accumulated for the player-settings labels, editable name, effects selector, and
  /// preview.
  drawCommands
  /// UI timestamp in milliseconds used to animate the player-settings menu and its preview.
  realtime
  /// Elapsed client time in milliseconds since the preceding frame.
  frametime
end struct

/// Lists the 14 UI player settings art list strings in their declared order, beginning with `"menu/art/frame2_l"`, `"menu/art/frame1_r"`, `"menu/art/model_0"`.
function artList() return ["menu/art/frame2_l","menu/art/frame1_r","menu/art/model_0","menu/art/model_1","menu/art/back_0","menu/art/back_1","menu/art/fx_base","menu/art/fx_red","menu/art/fx_yel","menu/art/fx_grn","menu/art/fx_teal","menu/art/fx_blue","menu/art/fx_cyan","menu/art/fx_white"] end function
/// Lists the 20 UI player settings handicap items strings in their declared order, beginning with `"None"`, `"95"`, `"90"`.
function handicapItems() return ["None","95","90","85","80","75","70","65","60","55","50","45","40","35","30","25","20","15","10","5"] end function
/// Builds the UI player settings `gameCodeToUi` sequence from `[4,2,3,0,5,1,6]`.
function gameCodeToUi() return [4,2,3,0,5,1,6] end function
/// Builds the UI player settings `uiToGameCode` sequence from `[4,6,2,3,1,5,7]`.
function uiToGameCode() return [4,6,2,3,1,5,7] end function
/// Appends a UI player settings action record to the queued engine requests.
/// @param value Mutable UI player settings record/storage; this routine assigns `value.actions`.
/// @param boundary Engine service boundary recorded on the queued action, such as renderer, audio or cvar.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param name Name used to select or register the corresponding UI player settings resource.
/// @param text Text consumed or emitted by `emit` in the UI player settings path.
/// @param number Value used by `value.actions=value.actions+[HostAction(boundary,kind,name,text,number,x,y,width,height,not retailActive)]`.
/// @param x Horizontal coordinate in the coordinate space used by `emit`.
/// @param y Vertical coordinate in the coordinate space used by `emit`.
/// @param width Width in the coordinate space used by `emit`.
/// @param height Height in the coordinate space used by `emit`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function emit(value,boundary,kind,name,text,number,x,y,width,height,retailActive) value.actions=value.actions+[HostAction(boundary,kind,name,text,number,x,y,width,height,not retailActive)];return void end function
/// Creates a `mq3.client.ui_player_settings.State` record. Assigns `source` from `source`.
/// @param source Value used to initialize `State.source`.
function create(source)
  return State(source,qmenu.menu(true,true),mfield.field(MAX_NAMELENGTH,MAX_NAMELENGTH),0,0,0,"",players.create(),[],[],[],false,false,false,[],0,16)
end function
/// Evaluates UI player settings `color` and returns `table[index]` according to its guard/selection conditions.
/// @param index Value tested by `index<0 or index>7` before the calculation continues.
function color(index) table=[[0.0,0.0,0.0,1.0],[1.0,0.0,0.0,1.0],[0.0,1.0,0.0,1.0],[1.0,1.0,0.0,1.0],[0.0,0.0,1.0,1.0],[0.0,1.0,1.0,1.0],[1.0,0.0,1.0,1.0],[1.0,1.0,1.0,1.0]];if index<0 or index>7 then index=7 end if;return table[index] end function
/// Computes `index+1<len(data) and data[index]==94 and data[index+1]!=94` for UI player settings `isColor`.
/// @param data Sequence read at `data[index]`, `data[index+1]`.
/// @param index Value used by `return index+1<len(data) and data[index]==94 and data[index+1]!=94`.
function isColor(data,index) return index+1<len(data) and data[index]==94 and data[index+1]!=94 end function
/// Calls `mq3.client.ui_player_settings.isColor`, `decode` from UI player settings `cleanName`. The final path returns `result`.
/// @param text Text consumed or emitted by `cleanName` in the UI player settings path.
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
/// Calls `mq3.client.ui_player_settings.color`, `mq3.client.ui_player_settings.isColor`, `mq3.client.ui_player_settings.DrawCommand` and additional helpers from UI player settings `visibleNameCommands`. The final path returns `rows`.
/// @param text Text consumed or emitted by `visibleNameCommands` in the UI player settings path.
/// @param focus Value used by `if not focus and isColor(data,at) then n=data[at+1]-48`.
/// @param basex Value used by `x=basex`.
/// @param y Vertical coordinate in the coordinate space used by `visibleNameCommands`.
/// @param style Value used by `else rows=rows+[DrawCommand("char",decode(bytes([data[at]])),x,y,8,16,style,current,"")]`.
function visibleNameCommands(text,focus,basex,y,style)
  rows=[];data=bytes(text);at=0;x=basex;current=color(7)
  while at<len(data)
    if not focus and isColor(data,at) then n=data[at+1]-48;if n==0 then n=7 end if;current=color(n);at=at+2
    else rows=rows+[DrawCommand("char",decode(bytes([data[at]])),x,y,8,16,style,current,"")];x=x+qmenu.SMALLCHAR_WIDTH;at=at+1 end if
  end while;return rows
end function

// PlayerSettings_DrawName
/// @param value Mutable UI player settings record/storage; this routine assigns `value.drawCommands`.
/// @param focus Value used by `if focus then style=style|qmenu.UI_PULSE end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function PlayerSettings_DrawName(value,focus,retailActive)
  style=qmenu.UI_LEFT|qmenu.UI_SMALLFONT;if focus then style=style|qmenu.UI_PULSE end if;rows=[DrawCommand("proportional","Name",192,144,0,0,style,void,"")];rows=rows+visibleNameCommands(value.name.buffer,focus,256,144+qmenu.PROP_HEIGHT,style)
  if focus then cursorChar=10;if value.name.overstrike then cursorChar=11 end if;cursorStyle=(style&(~qmenu.UI_PULSE))|qmenu.UI_BLINK;rows=rows+[DrawCommand("char",decode(bytes([cursorChar])),256+value.name.cursor*qmenu.SMALLCHAR_WIDTH,144+qmenu.PROP_HEIGHT,8,16,cursorStyle,color(7),"")] end if
  rows=rows+[DrawCommand("proportional",cleanName(value.name.buffer),320,440,0,0,qmenu.UI_CENTER|128,void,"")];value.drawCommands=value.drawCommands+rows;for each row in rows emit(value,"renderer","draw-"+row.kind,row.asset,row.text,0,row.x,row.y,row.width,row.height,retailActive) end for;return rows
end function

// PlayerSettings_DrawHandicap
/// @param value Mutable UI player settings record/storage; this routine assigns `value.drawCommands`.
/// @param focus Value used by `if focus then style=style|qmenu.UI_PULSE end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function PlayerSettings_DrawHandicap(value,focus,retailActive)
  style=qmenu.UI_LEFT|qmenu.UI_SMALLFONT;if focus then style=style|qmenu.UI_PULSE end if;items=handicapItems();index=value.handicap;if index<0 then index=0 end if;if index>=len(items) then index=len(items)-1 end if;rows=[DrawCommand("proportional","Handicap",192,225,0,0,style,void,""),DrawCommand("proportional",items[index],256,225+qmenu.PROP_HEIGHT,0,0,style,void,"")];value.drawCommands=value.drawCommands+rows;for each row in rows emit(value,"renderer","draw-proportional","",row.text,0,row.x,row.y,0,0,retailActive) end for;return rows
end function

// PlayerSettings_DrawEffects
/// @param value Mutable UI player settings record/storage; this routine assigns `value.drawCommands`.
/// @param focus Value used by `if focus then style=style|qmenu.UI_PULSE end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function PlayerSettings_DrawEffects(value,focus,retailActive)
  style=qmenu.UI_LEFT|qmenu.UI_SMALLFONT;if focus then style=style|qmenu.UI_PULSE end if;index=value.effects;if index<0 then index=0 end if;if index>6 then index=6 end if;fx=artList();rows=[DrawCommand("proportional","Effects",192,306,0,0,style,void,""),DrawCommand("picture","",256,306+qmenu.PROP_HEIGHT+8,128,8,0,void,fx[6]),DrawCommand("picture","",256+index*16+8,306+qmenu.PROP_HEIGHT+6,16,12,0,void,fx[7+index])];value.drawCommands=value.drawCommands+rows;for each row in rows emit(value,"renderer","draw-"+row.kind,row.asset,row.text,0,row.x,row.y,row.width,row.height,retailActive) end for;return rows
end function

// PlayerSettings_DrawPlayer
/// @param value Mutable UI player settings record/storage; this routine assigns `value.playerModel`.
/// @param model Value assigned to `value.playerModel`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function PlayerSettings_DrawPlayer(value,model,retailActive)
  if model!=value.playerModel then players.UI_PlayerInfo_SetModel(value.source,value.playerinfo,model);value.playerModel=model;players.UI_PlayerInfo_SetInfo(value.source,value.playerinfo,players.LEGS_IDLE,players.TORSO_STAND,[0.0,150.0,0.0],[0.0,0.0,0.0],players.WP_MACHINEGUN,false) end if
  before=len(value.playerinfo.actions);players.UI_DrawPlayer(value.source,400.0,-40.0,320.0,560.0,value.playerinfo,numeric.trunc32(value.realtime/2),value.frametime,retailActive);rows=[];if len(value.playerinfo.actions)>before then for i=before to len(value.playerinfo.actions)-1 rows=rows+[value.playerinfo.actions[i]] end for end if;return rows
end function

// PlayerSettings_SaveChanges
/// @param value Mutable UI player settings record/storage; this routine assigns `value.cvarWrites`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function PlayerSettings_SaveChanges(value,retailActive)
  writes=[["name",value.name.buffer],["handicap",str(100-value.handicap*5)],["color1",str(uiToGameCode()[value.effects])]];value.cvarWrites=value.cvarWrites+writes;for each pair in writes emit(value,"cvar","set",pair[0],pair[1],0,0,0,0,0,retailActive) end for;return writes
end function

// PlayerSettings_MenuKey
/// @param value Record read through `value.menu`.
/// @param key Key or control identifier used to select the corresponding UI player settings entry.
/// @param cursorx Value used by `return qmenu.Menu_DefaultKey(value.menu,key,cursorx,cursory)`.
/// @param cursory Value used by `return qmenu.Menu_DefaultKey(value.menu,key,cursorx,cursory)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function PlayerSettings_MenuKey(value,key,cursorx,cursory,retailActive)
  if key==qmenu.K_MOUSE2 or key==qmenu.K_ESCAPE then PlayerSettings_SaveChanges(value,retailActive) end if;return qmenu.Menu_DefaultKey(value.menu,key,cursorx,cursory)
end function

// PlayerSettings_SetMenuItems
/// @param value Mutable UI player settings record/storage; this routine assigns `value.name.buffer`, `value.name.cursor`, `value.effects`, `value.playerinfo` and additional values.
/// @param name Mutable UI player settings record/storage; this routine assigns `name.buffer`, `name.cursor`.
/// @param color1 Value used by `c=numeric.trunc32(color1)-1`.
/// @param model Model handle, asset or preview record used by this UI player settings operation.
/// @param handicap Value used by `h=handicap`.
function PlayerSettings_SetMenuItems(value,name,color1,model,handicap)
  data=bytes(name);if len(data)>=mfield.MAX_EDIT_LINE then value.name.buffer=decode(slice(data,0,mfield.MAX_EDIT_LINE-1)) else value.name.buffer=name end if;value.name.cursor=len(bytes(value.name.buffer));c=numeric.trunc32(color1)-1;if c<0 or c>6 then c=6 end if;value.effects=gameCodeToUi()[c];value.playerinfo=players.create();players.UI_PlayerInfo_SetModel(value.source,value.playerinfo,model);players.UI_PlayerInfo_SetInfo(value.source,value.playerinfo,players.LEGS_IDLE,players.TORSO_STAND,[0.0,150.0,0.0],[0.0,0.0,0.0],players.WP_MACHINEGUN,false);h=handicap;if h<5 then h=5 end if;if h>100 then h=100 end if;value.handicap=20-numeric.trunc32(h/5);return value
end function

// PlayerSettings_MenuEvent
/// @param value Mutable UI player settings record/storage; this routine assigns `value.cvarWrites`, `value.modelMenu`, `value.popped`.
/// @param id Value used by `if id==ID_HANDICAP then immediate=str(100-25*value.handicap)`.
/// @param event Event identifier compared with the supported activation/input events.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function PlayerSettings_MenuEvent(value,id,event,retailActive)
  if event!=qmenu.QM_ACTIVATED then return false end if
  if id==ID_HANDICAP then immediate=str(100-25*value.handicap);value.cvarWrites=value.cvarWrites+[["handicap",immediate]];emit(value,"cvar","set","handicap",immediate,0,0,0,0,0,retailActive)
  else if id==ID_MODEL then PlayerSettings_SaveChanges(value,retailActive);value.modelMenu=true;emit(value,"ui","push","player-model","",0,0,0,0,0,retailActive)
  else if id==ID_BACK then PlayerSettings_SaveChanges(value,retailActive);value.popped=true;emit(value,"ui","pop","player-settings","",0,0,0,0,0,retailActive) end if;return true
end function
/// Calls `mq3.client.ui_qmenu.item` from UI player settings `bitmap`. The final path returns `item`.
/// @param name Name used to select or register the corresponding UI player settings resource.
/// @param id Value used by `item=qmenu.item(qmenu.MTYPE_BITMAP,name,id,x,y,flags)`.
/// @param x Horizontal coordinate in the coordinate space used by `bitmap`.
/// @param y Vertical coordinate in the coordinate space used by `bitmap`.
/// @param flags Value used by `item=qmenu.item(qmenu.MTYPE_BITMAP,name,id,x,y,flags)`.
/// @param width Value assigned to `item.width`.
/// @param height Value assigned to `item.height`.
function bitmap(name,id,x,y,flags,width,height) item=qmenu.item(qmenu.MTYPE_BITMAP,name,id,x,y,flags);item.width=width;item.height=height;return item end function

// PlayerSettings_MenuInit
/// @param value Mutable UI player settings record/storage; this routine assigns `value.menu`, `value.actions`, `value.cvarWrites`, `value.assets` and additional values.
/// @param name Name used to select or register the corresponding UI player settings resource.
/// @param color1 Value used by `PlayerSettings_SetMenuItems(value,name,color1,model,handicap)`.
/// @param model Model handle, asset or preview record used by this UI player settings operation.
/// @param handicap Value used by `PlayerSettings_SetMenuItems(value,name,color1,model,handicap)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
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
/// @param value Mutable UI player settings record/storage; this routine assigns `value.assets`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function PlayerSettings_Cache(value,retailActive) value.assets=artList();for each art in value.assets emit(value,"renderer","register-shader",art,"",0,0,0,0,0,retailActive) end for;return len(value.assets) end function

// UI_PlayerSettingsMenu
/// @param value Mutable UI player settings record/storage; this routine assigns `value.pushed`.
/// @param name Name used to select or register the corresponding UI player settings resource.
/// @param color1 Value used by `PlayerSettings_MenuInit(value,name,color1,model,handicap,retailActive)`.
/// @param model Model handle, asset or preview record used by this UI player settings operation.
/// @param handicap Value used by `PlayerSettings_MenuInit(value,name,color1,model,handicap,retailActive)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function UI_PlayerSettingsMenu(value,name,color1,model,handicap,retailActive) PlayerSettings_MenuInit(value,name,color1,model,handicap,retailActive);value.pushed=true;emit(value,"ui","push","player-settings","",0,0,0,0,0,retailActive);return value end function
