// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_atoms.c.
package mq3.client.ui_atoms

import mq3.client.ui_main as uiMain
import mq3.client.ui_qmenu as qmenu
import mq3.compat.numeric as numeric
import mq3.compat.transcendental as trans
import std.string as strings

const UI_LEFT=0
const UI_CENTER=1
const UI_RIGHT=2
const UI_FORMATMASK=7
const UI_SMALLFONT=16
const UI_BIGFONT=32
const UI_GIANTFONT=64
const UI_DROPSHADOW=2048
const UI_BLINK=4096
const UI_INVERSE=8192
const UI_PULSE=16384
const PROP_GAP_WIDTH=3
const PROP_SPACE_WIDTH=8
const PROP_HEIGHT=27
const PROP_SMALL_SIZE_SCALE=0.75
const UIMENU_NONE=0
const UIMENU_MAIN=1
const UIMENU_INGAME=2
const UIMENU_NEED_CD=3
const UIMENU_BAD_CD_KEY=4
const UIMENU_TEAM=5
const UIMENU_POSTGAME=6
const KEYCATCH_UI=2

struct Action boundary kind name text values color dispatched end struct
struct State scale bias vidWidth vidHeight realtime frametime cursorx cursory keyCatcher stack activeMenu firstdraw enterSound actions args cvars mainState cacheNames whiteShader menuBackShader menuBackNoLogoShader cursorShader end struct
function create(retailActive) return State(1.0,0.0,640,480,0,0,320,240,0,[],void,false,false,[],[],[],uiMain.create(retailActive),[],"white","menuback","menubacknologo","menu/art/3_cursor2") end function
function emit(state,boundary,kind,name,text,values,color) value=Action(boundary,kind,name,text,values,color,not state.mainState.retailQvmActive);state.actions=state.actions+[value];return value end function
function clamp(value,low,high) if value<low then return low end if;if value>high then return high end if;return value end function
function propWidths() return [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,8,7,14,17,18,23,18,7,8,9,18,18,7,11,6,14,17,12,17,18,19,18,18,16,17,18,7,7,14,14,14,18,22,18,18,18,17,13,13,18,17,8,16,18,12,23,18,18,18,18,17,18,14,18,19,29,18,18,14,7,13,7,17,21,5,18,18,18,17,13,13,18,17,8,16,18,12,23,18,18,18,18,17,18,14,18,19,29,18,18,14,13,5,13,17,-1] end function
function bannerWidths() return [33,31,31,30,21,21,32,30,13,29,31,21,40,32,31,31,30,30,30,25,30,32,51,32,31,25] end function
function quakeColor(code) table=[[0.0,0.0,0.0,1.0],[1.0,0.0,0.0,1.0],[0.0,1.0,0.0,1.0],[1.0,1.0,0.0,1.0],[0.0,0.0,1.0,1.0],[0.0,1.0,1.0,1.0],[1.0,0.0,1.0,1.0],[1.0,1.0,1.0,1.0]];return table[(code-48)&7] end function

// Com_Error
function Com_Error(state,level,message) return emit(state,"system","error",str(level),message,[],void) end function
// Com_Printf
function Com_Printf(state,message) return emit(state,"system","print","",message,[],void) end function
// UI_ClampCvar
function UI_ClampCvar(minimum,maximum,value) return clamp(value,minimum,maximum) end function
// UI_StartDemoLoop
function UI_StartDemoLoop(state) return emit(state,"command","append","d1","d1\n",[],void) end function

// UI_PushMenu
function UI_PushMenu(state,menu)
  found=-1;if len(state.stack)>0 then for i=0 to len(state.stack)-1 if state.stack[i]==menu then found=i;break end if end for end if;if found>=0 then state.stack=slice(state.stack,0,found+1) else if len(state.stack)>=8 then return error(7896,"UI_PushMenu: menu stack overflow") else state.stack=state.stack+[menu] end if;state.activeMenu=menu;menu.cursor=0;menu.cursor_prev=0;state.enterSound=true;state.keyCatcher=KEYCATCH_UI
  if len(menu.items)>0 then for i=0 to len(menu.items)-1 item=menu.items[i];if (item.flags&(qmenu.QMF_GRAYED|qmenu.QMF_MOUSEONLY|qmenu.QMF_INACTIVE))==0 then menu.cursor_prev=-1;qmenu.Menu_SetCursor(menu,i);break end if end for end if;state.firstdraw=true;emit(state,"ui","push-menu","",str(len(state.stack)),[],void);return menu
end function
// UI_PopMenu
function UI_PopMenu(state) emit(state,"audio","local-sound","menu-out","",[],void);if len(state.stack)==0 then return error(7896,"UI_PopMenu: menu stack underflow") end if;if len(state.stack)==1 then state.stack=[] else state.stack=slice(state.stack,0,len(state.stack)-1) end if;if len(state.stack)>0 then state.activeMenu=state.stack[len(state.stack)-1];state.firstdraw=true else UI_ForceMenuOff(state) end if;return state.activeMenu end function
// UI_ForceMenuOff
function UI_ForceMenuOff(state) state.stack=[];state.activeMenu=void;state.keyCatcher=state.keyCatcher&(~KEYCATCH_UI);emit(state,"input","clear-states","","",[],void);state.cvars=state.cvars+[["cl_paused","0"]];emit(state,"cvar","set","cl_paused","0",[],void);return void end function
// UI_LerpColor
function UI_LerpColor(a,b,t) result=[];for i=0 to 3 result=result+[clamp(a[i]+t*(b[i]-a[i]),0.0,1.0)] end for;return result end function

// UI_DrawBannerString2
function UI_DrawBannerString2(state,x,y,text,color)
  rows=[];at=x*state.scale+state.bias;widths=bannerWidths();for each ch in bytes(text) c=ch&127;if c==32 then at=at+(12+4)*state.scale else if c>=65 and c<=90 then width=widths[c-65];rows=rows+[emit(state,"renderer","banner-glyph",str(c),"",[at,y*state.scale,width*state.scale,36*state.scale],color)];at=at+(width+4)*state.scale end if end for;return rows
end function
// UI_DrawBannerString
function UI_DrawBannerString(state,x,y,text,style,color) width=0;widths=bannerWidths();for each ch in bytes(text) if ch==32 then width=width+12 else if ch>=65 and ch<=90 then width=width+widths[ch-65]+4 end if end for;width=width-4;if (style&UI_FORMATMASK)==UI_CENTER then x=x-numeric.trunc32(width/2) else if (style&UI_FORMATMASK)==UI_RIGHT then x=x-width end if;rows=[];if (style&UI_DROPSHADOW)!=0 then rows=rows+UI_DrawBannerString2(state,x+2,y+2,text,[0.0,0.0,0.0,color[3]]) end if;return rows+UI_DrawBannerString2(state,x,y,text,color) end function
// UI_ProportionalStringWidth
function UI_ProportionalStringWidth(text) width=0;map=propWidths();for each ch in bytes(text) w=map[ch&127];if w!=-1 then width=width+w+PROP_GAP_WIDTH end if end for;return width-PROP_GAP_WIDTH end function
// UI_DrawProportionalString2
function UI_DrawProportionalString2(state,x,y,text,color,sizeScale,charset) rows=[];at=x*state.scale+state.bias;map=propWidths();for each ch in bytes(text) c=ch&127;w=map[c];if c==32 then w=PROP_SPACE_WIDTH else if w!=-1 then rows=rows+[emit(state,"renderer","proportional-glyph",charset,"",[at,y*state.scale,w*state.scale*sizeScale,PROP_HEIGHT*state.scale*sizeScale,c],color)] end if;if w!=-1 then at=at+(w+PROP_GAP_WIDTH)*state.scale*sizeScale end if end for;return rows end function
// UI_ProportionalSizeScale
function UI_ProportionalSizeScale(style) if (style&UI_SMALLFONT)!=0 then return PROP_SMALL_SIZE_SCALE end if;return 1.0 end function
// UI_DrawProportionalString
function UI_DrawProportionalString(state,x,y,text,style,color)
  sizeScale=UI_ProportionalSizeScale(style);width=UI_ProportionalStringWidth(text)*sizeScale;if (style&UI_FORMATMASK)==UI_CENTER then x=x-numeric.trunc32(width/2) else if (style&UI_FORMATMASK)==UI_RIGHT then x=x-width end if;rows=[];if (style&UI_DROPSHADOW)!=0 then rows=rows+UI_DrawProportionalString2(state,x+2,y+2,text,[0.0,0.0,0.0,color[3]],sizeScale,"font1_prop") end if;if (style&UI_INVERSE)!=0 then return rows+UI_DrawProportionalString2(state,x,y,text,[color[0]*0.7,color[1]*0.7,color[2]*0.7,color[3]],sizeScale,"font1_prop") end if;rows=rows+UI_DrawProportionalString2(state,x,y,text,color,sizeScale,"font1_prop");if (style&UI_PULSE)!=0 then rows=rows+UI_DrawProportionalString2(state,x,y,text,[color[0],color[1],color[2],0.5+0.5*trans.sin(state.realtime/75.0)],sizeScale,"font1_prop_glo") end if;return rows
end function
// UI_DrawProportionalString_AutoWrapped
function UI_DrawProportionalString_AutoWrapped(state,x,y,xmax,ystep,text,style,color)
  rows=[];if text=="" then return rows end if;words=strings.split(text," ");line="";for each word in words candidate=word;if line!="" then candidate=line+" "+word end if;if line!="" and UI_ProportionalStringWidth(candidate)*UI_ProportionalSizeScale(style)>xmax then rows=rows+UI_DrawProportionalString(state,x,y,line,style,color);y=y+ystep;line=word else line=candidate end if end for;if line!="" then rows=rows+UI_DrawProportionalString(state,x,y,line,style,color) end if;return rows
end function
// UI_DrawString2
function UI_DrawString2(state,x,y,text,color,charw,charh)
  rows=[];if y<0-charh then return rows end if;at=x*state.scale+state.bias;data=bytes(text);i=0;current=color;while i<len(data) if data[i]==94 and i+1<len(data) and data[i+1]!=94 then current=quakeColor(data[i+1]);current[3]=color[3];i=i+2 else ch=data[i]&255;if ch!=32 then rows=rows+[emit(state,"renderer","charset-glyph","charset","",[at,y*state.scale,charw*state.scale,charh*state.scale,ch],current)] end if;at=at+charw*state.scale;i=i+1 end if end while;return rows
end function
// UI_DrawString
function UI_DrawString(state,x,y,text,style,color)
  rows=[];if text==void then return rows end if;if (style&UI_BLINK)!=0 and (numeric.trunc32(state.realtime/200)&1)!=0 then return rows end if;charw=16;charh=16;if (style&UI_SMALLFONT)!=0 then charw=8;charh=16 else if (style&UI_GIANTFONT)!=0 then charw=32;charh=48 end if;drawcolor=color;if (style&UI_PULSE)!=0 then drawcolor=UI_LerpColor(color,[color[0]*0.8,color[1]*0.8,color[2]*0.8,color[3]*0.8],0.5+0.5*trans.sin(state.realtime/75.0)) end if;if (style&UI_FORMATMASK)==UI_CENTER then x=x-numeric.trunc32(len(bytes(text))*charw/2) else if (style&UI_FORMATMASK)==UI_RIGHT then x=x-len(bytes(text))*charw end if;if (style&UI_DROPSHADOW)!=0 then rows=rows+UI_DrawString2(state,x+2,y+2,text,[0.0,0.0,0.0,drawcolor[3]],charw,charh) end if;return rows+UI_DrawString2(state,x,y,text,drawcolor,charw,charh)
end function
// UI_DrawChar
function UI_DrawChar(state,x,y,ch,style,color) return UI_DrawString(state,x,y,decode(bytes([ch&255])),style,color) end function
// UI_IsFullscreen
function UI_IsFullscreen(state) return state.activeMenu!=void and (state.keyCatcher&KEYCATCH_UI)!=0 and state.activeMenu.fullscreen end function
// NeedCDAction
function NeedCDAction(state,result) if not result then return emit(state,"command","append","quit","quit\n",[],void) end if;return void end function
// NeedCDKeyAction
function NeedCDKeyAction(state,result) return NeedCDAction(state,result) end function
// UI_SetActiveMenu
function UI_SetActiveMenu(state,menu) emit(state,"ui","cache","Menu_Cache","",[],void);if menu==UIMENU_NONE then UI_ForceMenuOff(state) else if menu==UIMENU_MAIN then emit(state,"ui","open-menu","main","",[],void) else if menu==UIMENU_NEED_CD then emit(state,"ui","confirm","Insert the CD","",[],void) else if menu==UIMENU_BAD_CD_KEY then emit(state,"ui","confirm","Bad CD Key","",[],void) else if menu==UIMENU_INGAME then state.cvars=state.cvars+[["cl_paused","1"]];emit(state,"cvar","set","cl_paused","1",[],void);emit(state,"ui","open-menu","ingame","",[],void) else Com_Printf(state,"UI_SetActiveMenu: bad enum "+str(menu)+"\n") end if;return void end function
// UI_KeyEvent
function UI_KeyEvent(state,key,down) if state.activeMenu==void or not down then return 0 end if;sound=qmenu.Menu_DefaultKey(state.activeMenu,key,state.cursorx,state.cursory);if sound>0 and sound!=qmenu.SOUND_NULL then emit(state,"audio","local-sound",str(sound),"",[],void) end if;return sound end function
// UI_MouseEvent
function UI_MouseEvent(state,dx,dy)
  if state.activeMenu==void then return -1 end if;state.cursorx=clamp(state.cursorx+dx,0,640);state.cursory=clamp(state.cursory+dy,0,480);menu=state.activeMenu;if len(menu.items)>0 then for i=0 to len(menu.items)-1 item=menu.items[i];if (item.flags&(qmenu.QMF_GRAYED|qmenu.QMF_INACTIVE))==0 and state.cursorx>=item.left and state.cursorx<=item.right and state.cursory>=item.top and state.cursory<=item.bottom then if menu.cursor!=i then previous=menu.cursor;qmenu.Menu_SetCursor(menu,i);if previous>=0 and previous<len(menu.items) then menu.items[previous].flags=menu.items[previous].flags&(~qmenu.QMF_HASMOUSEFOCUS) end if;if (item.flags&qmenu.QMF_SILENT)==0 then emit(state,"audio","local-sound","menu-move","",[],void) end if end if;menu.items[menu.cursor].flags=menu.items[menu.cursor].flags|qmenu.QMF_HASMOUSEFOCUS;return i end if end for;if menu.cursor>=0 and menu.cursor<len(menu.items) then menu.items[menu.cursor].flags=menu.items[menu.cursor].flags&(~qmenu.QMF_HASMOUSEFOCUS) end if end if;return -1
end function
// UI_Argv
function UI_Argv(state,index) if index<0 or index>=len(state.args) then return "" end if;return state.args[index] end function
// UI_Cvar_VariableString
function UI_Cvar_VariableString(state,name) for each pair in state.cvars if pair[0]==name then return pair[1] end if end for;return "" end function
// UI_Cache_f
function UI_Cache_f(state) state.cacheNames=["MainMenu","InGame","ConfirmMenu","PlayerModel","PlayerSettings","Controls","Demos","Cinematics","Preferences","ServerInfo","SpecifyServer","ArenaServers","StartServer","ServerOptions","DriverInfo","GraphicsOptions","DisplayOptions","SoundOptions","NetworkOptions","SPLevel","SPSkill","SPPostgame","TeamMain","AddBots","RemoveBots","Setup","BotSelect","CDKey","Mods"];for each name in state.cacheNames emit(state,"ui","cache",name,"",[],void) end for;return len(state.cacheNames) end function
// UI_ConsoleCommand
function UI_ConsoleCommand(state,realTime) state.realtime=realTime;emit(state,"ui","cache","Menu_Cache","",[],void);cmd=strings.toLowerAscii(UI_Argv(state,0));names=[["levelselect","SPLevel"],["postgame","SPPostgame"],["ui_cache","Cache"],["ui_cinematics","Cinematics"],["ui_teamorders","TeamOrders"],["iamacheater","SPUnlock"],["iamamonkey","SPUnlockMedals"],["ui_cdkey","CDKey"]];for each pair in names if cmd==pair[0] then if cmd=="ui_cache" then UI_Cache_f(state) else emit(state,"ui","command",pair[1],"",[],void) end if;return true end if end for;return false end function
// UI_Shutdown
function UI_Shutdown(state) emit(state,"ui","shutdown","","",[],void);return void end function
// UI_Init
function UI_Init(state,vidWidth,vidHeight) uiMain.UI_RegisterCvars(state.mainState);state.vidWidth=vidWidth;state.vidHeight=vidHeight;state.scale=vidHeight/480.0;if vidWidth*480>vidHeight*640 then state.bias=0.5*(vidWidth-vidHeight*(640.0/480.0)) else state.bias=0.0 end if;emit(state,"ui","init-gameinfo","","",[],void);emit(state,"ui","cache","Menu_Cache","",[],void);state.activeMenu=void;state.stack=[];return state end function
// UI_AdjustFrom640
function UI_AdjustFrom640(state,x,y,w,h) return [x*state.scale+state.bias,y*state.scale,w*state.scale,h*state.scale] end function
// UI_DrawNamedPic
function UI_DrawNamedPic(state,x,y,width,height,picname) emit(state,"renderer","register-shader",picname,"",[],void);v=UI_AdjustFrom640(state,x,y,width,height);return emit(state,"renderer","stretch-pic",picname,"",v+[0.0,0.0,1.0,1.0],void) end function
// UI_DrawHandlePic
function UI_DrawHandlePic(state,x,y,w,h,shader) s0=0.0;s1=1.0;t0=0.0;t1=1.0;if w<0 then w=0-w;s0=1.0;s1=0.0 end if;if h<0 then h=0-h;t0=1.0;t1=0.0 end if;v=UI_AdjustFrom640(state,x,y,w,h);return emit(state,"renderer","stretch-pic",shader,"",v+[s0,t0,s1,t1],void) end function
// UI_FillRect
function UI_FillRect(state,x,y,width,height,color) v=UI_AdjustFrom640(state,x,y,width,height);return emit(state,"renderer","fill-rect",state.whiteShader,"",v,color) end function
// UI_DrawRect
function UI_DrawRect(state,x,y,width,height,color) v=UI_AdjustFrom640(state,x,y,width,height);rows=[];rows=rows+[emit(state,"renderer","fill-rect",state.whiteShader,"",[v[0],v[1],v[2],1.0],color),emit(state,"renderer","fill-rect",state.whiteShader,"",[v[0],v[1],1.0,v[3]],color),emit(state,"renderer","fill-rect",state.whiteShader,"",[v[0],v[1]+v[3]-1.0,v[2],1.0],color),emit(state,"renderer","fill-rect",state.whiteShader,"",[v[0]+v[2]-1.0,v[1],1.0,v[3]],color)];return rows end function
// UI_SetColor
function UI_SetColor(state,rgba) return emit(state,"renderer","set-color","","",[],rgba) end function
// UI_UpdateScreen
function UI_UpdateScreen(state) return emit(state,"renderer","update-screen","","",[],void) end function
// UI_Refresh
function UI_Refresh(state,realtime)
  state.frametime=realtime-state.realtime;state.realtime=realtime;if (state.keyCatcher&KEYCATCH_UI)==0 then return [] end if;uiMain.UI_UpdateCvars(state.mainState);rows=[];if state.activeMenu!=void then if state.activeMenu.fullscreen then shader=state.menuBackNoLogoShader;if state.activeMenu.showlogo then shader=state.menuBackShader end if;rows=rows+[UI_DrawHandlePic(state,0,0,640,480,shader)] end if;drawn=qmenu.Menu_Draw(state.activeMenu,realtime);if drawn is error then return drawn end if;emit(state,"ui","draw-menu","","",[],void);if state.firstdraw then UI_MouseEvent(state,0,0);state.firstdraw=false end if end if;UI_SetColor(state,void);rows=rows+[UI_DrawHandlePic(state,state.cursorx-16,state.cursory-16,32,32,state.cursorShader)];if state.enterSound then emit(state,"audio","local-sound","menu-in","",[],void);state.enterSound=false end if;return rows
end function
// UI_DrawTextBox
function UI_DrawTextBox(state,x,y,width,lines) return [UI_FillRect(state,x+8,y+8,(width+1)*16,(lines+1)*16,[0.0,0.0,0.0,1.0])]+UI_DrawRect(state,x+8,y+8,(width+1)*16,(lines+1)*16,[1.0,1.0,1.0,1.0]) end function
// UI_CursorInRect
function UI_CursorInRect(state,x,y,width,height) return state.cursorx>=x and state.cursory>=y and state.cursorx<=x+width and state.cursory<=y+height end function
