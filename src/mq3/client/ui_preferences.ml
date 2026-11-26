// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_preferences.c.
package mq3.client.ui_preferences
/// Activation callback event accepted by the gameplay-preferences menu before it processes the selected
/// control action.
const QM_ACTIVATED=3
/// Menu control identifier routed to the crosshair action by the menu event handler.
const ID_CROSSHAIR=127
/// Menu control identifier routed to the simpleitems action by the menu event handler.
const ID_SIMPLEITEMS=128
/// Menu control identifier routed to the highqualitysky action by the menu event handler.
const ID_HIGHQUALITYSKY=129
/// Menu control identifier routed to the ejectingbrass action by the menu event handler.
const ID_EJECTINGBRASS=130
/// Menu control identifier routed to the wallmarks action by the menu event handler.
const ID_WALLMARKS=131
/// Menu control identifier routed to the dynamiclights action by the menu event handler.
const ID_DYNAMICLIGHTS=132
/// Menu control identifier routed to the identifytarget action by the menu event handler.
const ID_IDENTIFYTARGET=133
/// Menu control identifier routed to the synceveryframe action by the menu event handler.
const ID_SYNCEVERYFRAME=134
/// Menu control identifier routed to the forcemodel action by the menu event handler.
const ID_FORCEMODEL=135
/// Menu control identifier routed to the drawteamoverlay action by the menu event handler.
const ID_DRAWTEAMOVERLAY=136
/// Menu control identifier routed to the allowdownload action by the menu event handler.
const ID_ALLOWDOWNLOAD=137
/// Event identifier of the Back control used to leave the gameplay-preferences menu and return to its
/// parent menu.
const ID_BACK=138
/// Stores UI preferences preference item record, including `id`, `label`, `y`, `kind`.
struct PreferenceItem
  /// Event-routing identifier of this selectable control in the gameplay-preferences menu.
  id
  /// Human-readable caption painted beside or inside the UI control.
  label
  /// Vertical position of this menu control in the virtual layout used by the gameplay-preferences
  /// menu.
  y
  /// Item category selecting pickup behavior or the type-specific UI control implementation.
  kind
end struct
/// Stores UI preferences preferences record, including `crosshair`, `simpleItems`, `highQualitySky`, `brass`, `wallMarks`, `dynamicLights` and additional values.
struct Preferences
  /// When constructing this record, `setMenuItems` supplies `crosshair%10` for this member.
  crosshair
  /// When constructing this record, `setMenuItems` supplies `simpleItems!=0` for this member.
  simpleItems
  /// When constructing this record, `setMenuItems` supplies `fastSky==0` for this member.
  highQualitySky
  /// When constructing this record, `setMenuItems` supplies `brassTime!=0` for this member.
  brass
  /// When constructing this record, `setMenuItems` supplies `marks!=0` for this member.
  wallMarks
  /// When constructing this record, `setMenuItems` supplies `dynamicLights!=0` for this member.
  dynamicLights
  /// When constructing this record, `setMenuItems` supplies `identify!=0` for this member.
  identifyTarget
  /// When constructing this record, `setMenuItems` supplies `finish!=0` for this member.
  syncEveryFrame
  /// Model resource selected for the force presentation.
  forceModel
  /// When constructing this record, `setMenuItems` supplies `clamp(teamOverlay,0,3)` for this member.
  teamOverlay
  /// When constructing this record, `setMenuItems` supplies `allowDownload!=0` for this member.
  allowDownload
  /// When constructing this record, `setMenuItems` supplies an empty list for this member.
  items
  /// Media resources retained for registering and drawing the artwork used by the gameplay-preferences
  /// menu.
  assets
  /// Cvar name/value changes queued by the gameplay-preferences menu for the host to apply.
  cvarWrites
  /// Host requests queued while applying crosshair, effects, and other gameplay preferences, retained
  /// in request order.
  actions
end struct
/// Clamps `value` to the inclusive bounds `low` and `high` for UI preferences.
/// @param value Value tested by `value<low`, `value>high` before the calculation continues.
/// @param low Lower bound used for comparison or clamping.
/// @param high Upper bound used for comparison or clamping.
function clamp(value,low,high) if value<low then return low end if;if value>high then return high end if;return value end function
// Preferences_SetMenuItems
/// @param crosshair Value used by `value=Preferences(crosshair%10,simpleItems!=0,fastSky==0,brassTime!=0,marks!=0,dynamicLights!=0,identify!=0,finish!=0,forceModel!=0,clamp(team...`.
/// @param simpleItems Value used by `value=Preferences(crosshair%10,simpleItems!=0,fastSky==0,brassTime!=0,marks!=0,dynamicLights!=0,identify!=0,finish!=0,forceModel!=0,clamp(team...`.
/// @param brassTime Value used by `value=Preferences(crosshair%10,simpleItems!=0,fastSky==0,brassTime!=0,marks!=0,dynamicLights!=0,identify!=0,finish!=0,forceModel!=0,clamp(team...`.
/// @param marks Value used by `value=Preferences(crosshair%10,simpleItems!=0,fastSky==0,brassTime!=0,marks!=0,dynamicLights!=0,identify!=0,finish!=0,forceModel!=0,clamp(team...`.
/// @param identify Value used by `value=Preferences(crosshair%10,simpleItems!=0,fastSky==0,brassTime!=0,marks!=0,dynamicLights!=0,identify!=0,finish!=0,forceModel!=0,clamp(team...`.
/// @param dynamicLights Value used by `value=Preferences(crosshair%10,simpleItems!=0,fastSky==0,brassTime!=0,marks!=0,dynamicLights!=0,identify!=0,finish!=0,forceModel!=0,clamp(team...`.
/// @param fastSky Value used by `value=Preferences(crosshair%10,simpleItems!=0,fastSky==0,brassTime!=0,marks!=0,dynamicLights!=0,identify!=0,finish!=0,forceModel!=0,clamp(team...`.
/// @param finish Value used by `value=Preferences(crosshair%10,simpleItems!=0,fastSky==0,brassTime!=0,marks!=0,dynamicLights!=0,identify!=0,finish!=0,forceModel!=0,clamp(team...`.
/// @param forceModel Value used by `value=Preferences(crosshair%10,simpleItems!=0,fastSky==0,brassTime!=0,marks!=0,dynamicLights!=0,identify!=0,finish!=0,forceModel!=0,clamp(team...`.
/// @param teamOverlay Value used by `value=Preferences(crosshair%10,simpleItems!=0,fastSky==0,brassTime!=0,marks!=0,dynamicLights!=0,identify!=0,finish!=0,forceModel!=0,clamp(team...`.
/// @param allowDownload Value used by `value=Preferences(crosshair%10,simpleItems!=0,fastSky==0,brassTime!=0,marks!=0,dynamicLights!=0,identify!=0,finish!=0,forceModel!=0,clamp(team...`.
function setMenuItems(crosshair,simpleItems,brassTime,marks,identify,dynamicLights,fastSky,finish,forceModel,teamOverlay,allowDownload)
  value=Preferences(crosshair%10,simpleItems!=0,fastSky==0,brassTime!=0,marks!=0,dynamicLights!=0,identify!=0,finish!=0,forceModel!=0,clamp(teamOverlay,0,3),allowDownload!=0,[],[],[],[])
  return value
end function
// Preferences_Event
/// @param value Mutable UI preferences record/storage; this routine assigns `value.crosshair`, `value.cvarWrites`, `value.actions`.
/// @param id Value used by `if id==ID_CROSSHAIR then value.crosshair=(value.crosshair+1)%10`.
/// @param notification Value used by `if notification!=QM_ACTIVATED then return value end if`.
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
/// @param value Record read through `value.crosshair`.
/// @param focus Value used by `if grayed then color="disabled" else if focus then color="highlight"`.
/// @param grayed Value used by `if grayed then color="disabled" else if focus then color="highlight"`.
/// @param blink Value used by `style="small+pulse" else if blink then color="highlight"`.
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
/// @param value Mutable UI preferences record/storage; this routine assigns `value.items`, `value.assets`.
function init(value)
  y=144;items=[PreferenceItem(ID_CROSSHAIR,"Crosshair:",y,"ownerdraw")];y=y+30
  for each item in [[ID_SIMPLEITEMS,"Simple Items:","radio"],[ID_WALLMARKS,"Marks on Walls:","radio"],[ID_EJECTINGBRASS,"Ejecting Brass:","radio"],[ID_DYNAMICLIGHTS,"Dynamic Lights:","radio"],[ID_IDENTIFYTARGET,"Identify Target:","radio"],[ID_HIGHQUALITYSKY,"High Quality Sky:","radio"],[ID_SYNCEVERYFRAME,"Sync Every Frame:","radio"],[ID_FORCEMODEL,"Force Player Models:","radio"],[ID_DRAWTEAMOVERLAY,"Draw Team Overlay:","spin"],[ID_ALLOWDOWNLOAD,"Automatic Downloading:","radio"]]
    items=items+[PreferenceItem(item[0],item[1],y,item[2])];y=y+18
  end for
  items=items+[PreferenceItem(ID_BACK,"BACK",416,"bitmap")];value.items=items;value.assets=cache();return value
end function
// UI_PreferencesMenu
/// @param value Mutable UI preferences record/storage; this routine assigns `value.actions`.
function open(value) value=init(value);value.actions=value.actions+["push"];return value end function
