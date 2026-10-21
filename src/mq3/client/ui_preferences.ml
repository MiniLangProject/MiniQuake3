// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_preferences.c.
package mq3.client.ui_preferences
const QM_ACTIVATED=3
const ID_CROSSHAIR=127
const ID_SIMPLEITEMS=128
const ID_HIGHQUALITYSKY=129
const ID_EJECTINGBRASS=130
const ID_WALLMARKS=131
const ID_DYNAMICLIGHTS=132
const ID_IDENTIFYTARGET=133
const ID_SYNCEVERYFRAME=134
const ID_FORCEMODEL=135
const ID_DRAWTEAMOVERLAY=136
const ID_ALLOWDOWNLOAD=137
const ID_BACK=138
struct PreferenceItem id label y kind end struct
struct Preferences crosshair simpleItems highQualitySky brass wallMarks dynamicLights identifyTarget syncEveryFrame forceModel teamOverlay allowDownload items assets cvarWrites actions end struct
function clamp(value,low,high) if value<low then return low end if;if value>high then return high end if;return value end function
// Preferences_SetMenuItems
function setMenuItems(crosshair,simpleItems,brassTime,marks,identify,dynamicLights,fastSky,finish,forceModel,teamOverlay,allowDownload)
  value=Preferences(crosshair%10,simpleItems!=0,fastSky==0,brassTime!=0,marks!=0,dynamicLights!=0,identify!=0,finish!=0,forceModel!=0,clamp(teamOverlay,0,3),allowDownload!=0,[],[],[],[])
  return value
end function
// Preferences_Event
function event(value,id,notification)
  if notification!=QM_ACTIVATED then return value end if
  if id==ID_CROSSHAIR then value.crosshair=(value.crosshair+1)%10;value.cvarWrites=value.cvarWrites+["cg_drawCrosshair="+str(value.crosshair)]
  else if id==ID_SIMPLEITEMS then value.cvarWrites=value.cvarWrites+["cg_simpleItems="+str(value.simpleItems)]
  else if id==ID_HIGHQUALITYSKY then value.cvarWrites=value.cvarWrites+["r_fastsky="+str(not value.highQualitySky)]
  else if id==ID_EJECTINGBRASS then if value.brass then value.cvarWrites=value.cvarWrites+["reset:cg_brassTime"] else value.cvarWrites=value.cvarWrites+["cg_brassTime=0"] end if
  else if id==ID_WALLMARKS then value.cvarWrites=value.cvarWrites+["cg_marks="+str(value.wallMarks)]
  else if id==ID_DYNAMICLIGHTS then value.cvarWrites=value.cvarWrites+["r_dynamiclight="+str(value.dynamicLights)]
  else if id==ID_IDENTIFYTARGET then value.cvarWrites=value.cvarWrites+["cg_drawCrosshairNames="+str(value.identifyTarget)]
  else if id==ID_SYNCEVERYFRAME then value.cvarWrites=value.cvarWrites+["r_finish="+str(value.syncEveryFrame)]
  else if id==ID_FORCEMODEL then value.cvarWrites=value.cvarWrites+["cg_forcemodel="+str(value.forceModel)]
  else if id==ID_DRAWTEAMOVERLAY then value.cvarWrites=value.cvarWrites+["cg_drawTeamOverlay="+str(value.teamOverlay)]
  else if id==ID_ALLOWDOWNLOAD then value.cvarWrites=value.cvarWrites+["cl_allowDownload="+str(value.allowDownload),"sv_allowDownload="+str(value.allowDownload)]
  else if id==ID_BACK then value.actions=value.actions+["pop"] end if
  return value
end function
// Crosshair_Draw
function drawCrosshair(value,focus,grayed,blink)
  color="normal";style="small"
  if grayed then color="disabled" else if focus then color="highlight";style="small+pulse" else if blink then color="highlight";style="small+blink" end if
  actions=[];if focus then actions=actions+["fill:listbar","char:13"] end if;actions=actions+["label:Crosshair:"]
  if value.crosshair!=0 then actions=actions+["pic:gfx/2d/crosshair"+str(value.crosshair)] end if
  return [color,style,actions]
end function
// Preferences_Cache
function cache()
  result=["menu/art/frame2_l","menu/art/frame1_r","menu/art/back_0","menu/art/back_1"]
  for i=0 to 9 result=result+["gfx/2d/crosshair"+str(i)] end for
  return result
end function
// Preferences_MenuInit
function init(value)
  y=144;items=[PreferenceItem(ID_CROSSHAIR,"Crosshair:",y,"ownerdraw")];y=y+30
  for each item in [[ID_SIMPLEITEMS,"Simple Items:","radio"],[ID_WALLMARKS,"Marks on Walls:","radio"],[ID_EJECTINGBRASS,"Ejecting Brass:","radio"],[ID_DYNAMICLIGHTS,"Dynamic Lights:","radio"],[ID_IDENTIFYTARGET,"Identify Target:","radio"],[ID_HIGHQUALITYSKY,"High Quality Sky:","radio"],[ID_SYNCEVERYFRAME,"Sync Every Frame:","radio"],[ID_FORCEMODEL,"Force Player Models:","radio"],[ID_DRAWTEAMOVERLAY,"Draw Team Overlay:","spin"],[ID_ALLOWDOWNLOAD,"Automatic Downloading:","radio"]]
    items=items+[PreferenceItem(item[0],item[1],y,item[2])];y=y+18
  end for
  items=items+[PreferenceItem(ID_BACK,"BACK",416,"bitmap")];value.items=items;value.assets=cache();return value
end function
// UI_PreferencesMenu
function open(value) value=init(value);value.actions=value.actions+["push"];return value end function
