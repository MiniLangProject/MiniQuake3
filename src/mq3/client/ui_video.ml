// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_video.c.
package mq3.client.ui_video
import std.string as strings
import mq3.compat.numeric as numeric

/// Activation callback event accepted by the graphics-options and driver-information menus before it
/// processes the selected control action.
const QM_ACTIVATED=3
/// Menu control identifier routed to the driverinfoback action by the menu event handler.
const ID_DRIVERINFOBACK=100
/// Menu control identifier routed to the back2 action by the menu event handler.
const ID_BACK2=101
/// Menu control identifier routed to the fullscreen action by the menu event handler.
const ID_FULLSCREEN=102
/// Menu control identifier routed to the list action by the menu event handler.
const ID_LIST=103
/// Menu control identifier routed to the mode action by the menu event handler.
const ID_MODE=104
/// Menu control identifier routed to the driverinfo action by the menu event handler.
const ID_DRIVERINFO=105
/// Menu control identifier routed to the graphics action by the menu event handler.
const ID_GRAPHICS=106
/// Menu control identifier routed to the display action by the menu event handler.
const ID_DISPLAY=107
/// Menu control identifier routed to the sound action by the menu event handler.
const ID_SOUND=108
/// Menu control identifier routed to the network action by the menu event handler.
const ID_NETWORK=109
/// Renderer-driver category identifying a standard installable OpenGL driver.
const GLDRV_ICD=0
/// Renderer-driver category identifying the legacy Voodoo driver path.
const GLDRV_VOODOO=2
/// Renderer-hardware category identifying the legacy 3Dfx 2D/3D hardware path.
const GLHW_3DFX_2D3D=1

/// Stores UI video host action record, including `boundary`, `kind`, `name`, `text`, `number`, `dispatched`.
struct HostAction
  /// Host service category recorded with a request emitted while listing renderer capabilities and
  /// applying graphics configuration changes.
  boundary
  /// Operation selector telling the host how to interpret a request emitted while listing renderer
  /// capabilities and applying graphics configuration changes.
  kind
  /// Target resource, command, or setting name addressed by this queued host action.
  name
  /// Driver-information text, video-setting value, or renderer restart command supplied by the graphics
  /// menu.
  text
  /// When constructing this record, `host` supplies `number` for this member.
  number
  /// True when this request is marked for native dispatch while listing renderer capabilities and
  /// applying graphics configuration changes; false when its native effect is suppressed.
  dispatched
end struct
/// Stores UI video menu item, including `id`, `kind`, `name`, `x`, `y`, `active` and additional values.
struct Item
  /// Event-routing identifier of this selectable control in the graphics-options and driver-information
  /// menus.
  id
  /// Item category selecting pickup behavior or the type-specific UI control implementation.
  kind
  /// Label or artwork resource identifying a video-options control.
  name
  /// Horizontal position of this menu control in the virtual layout used by the graphics-options and
  /// driver-information menus.
  x
  /// Vertical position of this menu control in the virtual layout used by the graphics-options and
  /// driver-information menus.
  y
  /// When constructing this record, `item` supplies `active` for this member.
  active
  /// When constructing this record, `item` supplies `hidden` for this member.
  hidden
  /// When constructing this record, `item` supplies `grayed` for this member.
  grayed
end struct
/// Stores UI video draw line record, including `text`, `x`, `y`, `alignment`.
struct DrawLine
  /// Driver-information line containing vendor, renderer, version, or extension text.
  text
  /// Horizontal coordinate of a renderer-information text line in the graphics menu layout.
  x
  /// Vertical coordinate of a renderer-information text line in the graphics menu layout.
  y
  /// Horizontal alignment mode for the item within its layout region.
  alignment
end struct
/// Stores UI video choice list record, including `name`, `values`.
struct ChoiceList
  /// Caption for a graphics choice group, such as video mode, color depth, or texture quality.
  name
  /// When constructing this record, `graphicsChoices` supplies `["High
  /// Quality","Normal","Fast","Fastest","Custom"]` for this member.
  values
end struct
/// Stores UI video gl config record, including `vendor`, `version`, `renderer`, `extensions`, `colorBits`, `depthBits` and additional values.
struct GlConfig
  /// Renderer vendor identification string reported by the graphics driver.
  vendor
  /// Graphics-driver or renderer version string exposed to the video-settings UI.
  version
  /// Renderer implementation name reported by the graphics driver.
  renderer
  /// Graphics extension information exposed by the renderer or selected by the video-settings UI.
  extensions
  /// Number of bits requested or provided for the framebuffer's color channels.
  colorBits
  /// Number of bits available in the graphics depth buffer.
  depthBits
  /// Number of bits available in the graphics stencil buffer.
  stencilBits
  /// Native renderer-driver category used to select compatible video-settings behavior.
  driverType
  /// Native graphics-hardware category used to select compatible video-settings behavior.
  hardwareType
end struct
/// Stores UI video video cvars record, including `mode`, `fullscreen`, `allowExtensions`, `picmip`, `vertexLight`, `textureBits` and additional values.
struct VideoCvars
  /// Renderer video-mode index read from the engine's mode configuration variable.
  mode
  /// Fullscreen video setting supplied by the renderer configuration variables.
  fullscreen
  /// Nonzero when the renderer is allowed to use optional graphics-driver extensions.
  allowExtensions
  /// Texture mip-level reduction setting; larger values select lower-resolution texture data.
  picmip
  /// Nonzero when lighting is computed from vertex colors instead of lightmap sampling.
  vertexLight
  /// Requested color precision for texture storage.
  textureBits
  /// Texture-filtering mode name used to select bilinear or trilinear sampling.
  textureMode
  /// Bias applied when choosing lower-detail model geometry.
  lodBias
  /// Renderer subdivision setting used to control curved-surface geometry detail.
  subdivisions
  /// Number of bits requested or provided for the framebuffer's color channels.
  colorBits
  /// Configured OpenGL driver name or path selected by the video-settings UI.
  glDriver
end struct
/// Stores UI video initial video record, including `mode`, `fullscreen`, `tq`, `lighting`, `colorDepth`, `textureBits` and additional values.
struct InitialVideo
  /// When constructing this record, `initial` supplies `mode` for this member.
  mode
  /// Fullscreen choice saved when the graphics menu opens, used to detect unapplied video changes.
  fullscreen
  /// When constructing this record, `initial` supplies `tq` for this member.
  tq
  /// When constructing this record, `initial` supplies `lighting` for this member.
  lighting
  /// When constructing this record, `initial` supplies `colorDepth` for this member.
  colorDepth
  /// Requested color precision for texture storage.
  textureBits
  /// When constructing this record, `initial` supplies `geometry` for this member.
  geometry
  /// When constructing this record, `initial` supplies `filter` for this member.
  filter
  /// When constructing this record, `initial` supplies `driver` for this member.
  driver
  /// Graphics extension information exposed by the renderer or selected by the video-settings UI.
  extensions
end struct
/// Stores UI video driver info state record, including `config`, `extensionStrings`, `drawLines`, `items`, `assets`, `actions`.
struct DriverInfoState
  /// When constructing this record, `driverState` supplies `config` for this member.
  config
  /// When constructing this record, `driverState` supplies an empty list for this member.
  extensionStrings
  /// When constructing this record, `driverState` supplies an empty list for this member.
  drawLines
  /// When constructing this record, `driverState` supplies an empty list for this member.
  items
  /// Media resources retained for registering and drawing the artwork used by the graphics-options and
  /// driver-information menus.
  assets
  /// Host requests queued while listing renderer capabilities and applying graphics configuration
  /// changes, retained in request order.
  actions
end struct
/// Stores UI video graphics state record, including `mode`, `fullscreen`, `tq`, `lighting`, `colorDepth`, `textureBits` and additional values.
struct GraphicsState
  /// When constructing this record, `graphicsState` supplies `0` for this member.
  mode
  /// Current fullscreen choice in the graphics menu, applied to the renderer when settings are
  /// accepted.
  fullscreen
  /// When constructing this record, `graphicsState` supplies `0` for this member.
  tq
  /// When constructing this record, `graphicsState` supplies `0` for this member.
  lighting
  /// When constructing this record, `graphicsState` supplies `0` for this member.
  colorDepth
  /// Requested color precision for texture storage.
  textureBits
  /// When constructing this record, `graphicsState` supplies `0` for this member.
  geometry
  /// When constructing this record, `graphicsState` supplies `0` for this member.
  filter
  /// When constructing this record, `graphicsState` supplies `0` for this member.
  driver
  /// Graphics extension information exposed by the renderer or selected by the video-settings UI.
  extensions
  /// When constructing this record, `graphicsState` supplies `4` for this member.
  preset
  /// When constructing this record, `graphicsState` supplies `false` for this member.
  applyVisible
  /// When constructing this record, `graphicsState` supplies `false` for this member.
  fullscreenGrayed
  /// When constructing this record, `graphicsState` supplies `false` for this member.
  colorDepthGrayed
  /// When constructing this record, `graphicsState` supplies `false` for this member.
  driverHidden
  /// When constructing this record, `graphicsState` supplies `base` for this member.
  initial
  /// When constructing this record, `graphicsState` supplies an empty list for this member.
  choices
  /// When constructing this record, `graphicsState` supplies an empty list for this member.
  items
  /// Media resources retained for registering and drawing the artwork used by the graphics-options and
  /// driver-information menus.
  assets
  /// Host requests queued while listing renderer capabilities and applying graphics configuration
  /// changes, retained in request order.
  actions
end struct

/// Computes `actions+[HostAction(boundary,kind,name,text,number,not retailActive)]` for UI video `host`.
/// @param actions Value used by `return actions+[HostAction(boundary,kind,name,text,number,not retailActive)]`.
/// @param boundary Engine service boundary recorded on the queued action, such as renderer, audio or cvar.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param name Name used to select or register the corresponding UI video resource.
/// @param text Text consumed or emitted by `host` in the UI video path.
/// @param number Value used by `return actions+[HostAction(boundary,kind,name,text,number,not retailActive)]`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function host(actions,boundary,kind,name,text,number,retailActive)
  return actions+[HostAction(boundary,kind,name,text,number,not retailActive)]
end function

/// Creates a `mq3.client.ui_video.Item` record. Assigns `id` from `id`, `kind` from `kind`, `name` from `name`, `x` from `x`.
/// @param id Value used to initialize `Item.id`.
/// @param kind Value used to initialize `Item.kind`.
/// @param name Value used to initialize `Item.name`.
/// @param x Value used to initialize `Item.x`.
/// @param y Value used to initialize `Item.y`.
/// @param active Value used to initialize `Item.active`.
/// @param hidden Value used to initialize `Item.hidden`.
/// @param grayed Value used to initialize `Item.grayed`.
function item(id,kind,name,x,y,active,hidden,grayed)
  return Item(id,kind,name,x,y,active,hidden,grayed)
end function

/// Creates a `mq3.client.ui_video.InitialVideo` record. Assigns `mode` from `mode`, `fullscreen` from `fullscreen`, `tq` from `tq`, `lighting` from `lighting`.
/// @param mode Value used to initialize `InitialVideo.mode`.
/// @param fullscreen Value used to initialize `InitialVideo.fullscreen`.
/// @param tq Value used to initialize `InitialVideo.tq`.
/// @param lighting Value used to initialize `InitialVideo.lighting`.
/// @param colorDepth Value used to initialize `InitialVideo.colorDepth`.
/// @param textureBits Value used to initialize `InitialVideo.textureBits`.
/// @param geometry Value used to initialize `InitialVideo.geometry`.
/// @param filter Value used to initialize `InitialVideo.filter`.
/// @param driver Value used to initialize `InitialVideo.driver`.
/// @param extensions Value used to initialize `InitialVideo.extensions`.
function initial(mode,fullscreen,tq,lighting,colorDepth,textureBits,geometry,filter,driver,extensions)
  return InitialVideo(mode,fullscreen,tq,lighting,colorDepth,textureBits,geometry,filter,driver,extensions)
end function

/// Builds the UI video `templates` sequence from `[ initial(4,true,2,0,2,2,1,1,0,true), initial(3,true,2,0,0,0,1,0,0,true), initial(2,true,1,0,1,0,0,0,0,true), initial(2,true,1,1,1,0,0,0,0,true), initial(3,true,1,0,0,0,1,0,0,true) ]`.
function templates()
  return [
    initial(4,true,2,0,2,2,1,1,0,true),
    initial(3,true,2,0,0,0,1,0,0,true),
    initial(2,true,1,0,1,0,0,0,0,true),
    initial(2,true,1,1,1,0,0,0,0,true),
    initial(3,true,1,0,0,0,1,0,0,true)
  ]
end function

/// Adapts `mq3.client.ui_video.initial` to UI video `copyInitial`, returning its result for `value.mode, value.fullscreen, value.tq, value.lighting, value.colorDepth, value.textureBits, value.geometry, value.filter, value.driver, value.extensions`.
/// @param value Record read through `value.mode`, `value.fullscreen`, `value.tq`, `value.lighting` and additional values.
function copyInitial(value)
  return initial(value.mode,value.fullscreen,value.tq,value.lighting,value.colorDepth,value.textureBits,value.geometry,value.filter,value.driver,value.extensions)
end function

/// Calls `mq3.client.ui_video.initial`, `mq3.client.ui_video.GraphicsState` from UI video `graphicsState`. The final path returns `GraphicsState(0,false,0,0,0,0,0,0,0,false,4,false,false,false,false,base,[],[],[],[])`.
function graphicsState()
  base=initial(0,false,0,0,0,0,0,0,0,false)
  return GraphicsState(0,false,0,0,0,0,0,0,0,false,4,false,false,false,false,base,[],[],[],[])
end function

/// Creates a `mq3.client.ui_video.DriverInfoState` record. Assigns `config` from `config`.
/// @param config Value used to initialize `DriverInfoState.config`.
function driverState(config)
  return DriverInfoState(config,[],[],[],[],[])
end function

/// Calls `decode`, `slice`, `std.string.substr` from UI video `words`. The final path returns `result`.
/// @param text Text consumed or emitted by `words` in the UI video path.
/// @param limit Upper limit applied while collecting or rendering the result.
function words(text,limit)
  result=[]
  data=bytes(text)
  at=0
  while at<len(data) and len(result)<limit
    while at<len(data) and data[at]==32 at=at+1 end while
    if at>=len(data) then break end if
    first=at
    while at<len(data) and data[at]!=32 at=at+1 end while
    token=decode(slice(data,first,at-first))
    if len(token)>32 then token=strings.substr(token,0,len(token)-1)+">" end if
    result=result+[token]
  end while
  return result
end function

// DriverInfo_Event
/// @param state Mutable UI video record/storage; this routine assigns `state.actions`.
/// @param eventCode Quake III event identifier selecting the event handler.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function driverInfoEvent(state,eventCode,retailActive)
  if eventCode!=QM_ACTIVATED then return false end if
  state.actions=host(state.actions,"ui","pop","driver-info","",ID_DRIVERINFOBACK,retailActive)
  return true
end function

/// Updates `state.drawLines`, `state.actions` during UI video `draw`.
/// @param state Mutable UI video record/storage; this routine assigns `state.drawLines`, `state.actions`.
/// @param text Text consumed or emitted by `draw` in the UI video path.
/// @param x Horizontal coordinate in the coordinate space used by `draw`.
/// @param y Vertical coordinate in the coordinate space used by `draw`.
/// @param alignment Value used by `state.drawLines=state.drawLines+[DrawLine(text,x,y,alignment)]`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function draw(state,text,x,y,alignment,retailActive)
  state.drawLines=state.drawLines+[DrawLine(text,x,y,alignment)]
  state.actions=host(state.actions,"renderer","draw-string",alignment,text,0,retailActive)
  return void
end function

// DriverInfo_MenuDraw
/// @param state Mutable UI video record/storage; this routine assigns `state.actions`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function driverInfoMenuDraw(state,retailActive)
  state.actions=host(state.actions,"ui","draw-menu","driver-info","",0,retailActive)
  draw(state,"VENDOR",320,80,"center-red",retailActive)
  draw(state,"PIXELFORMAT",320,152,"center-red",retailActive)
  draw(state,"EXTENSIONS",320,192,"center-red",retailActive)
  draw(state,state.config.vendor,320,96,"center-normal",retailActive)
  draw(state,state.config.version,320,112,"center-normal",retailActive)
  draw(state,state.config.renderer,320,128,"center-normal",retailActive)
  format="color("+str(state.config.colorBits)+"-bits) Z("+str(state.config.depthBits)+"-bits) stencil("+str(state.config.stencilBits)+"-bits)"
  draw(state,format,320,168,"center-normal",retailActive)
  y=208
  pairs=numeric.trunc32(len(state.extensionStrings)/2)
  if pairs>0 then
    for i=0 to pairs-1
      draw(state,state.extensionStrings[i*2],316,y,"right-normal",retailActive)
      draw(state,state.extensionStrings[i*2+1],324,y,"left-normal",retailActive)
      y=y+16
    end for
  end if
  if (len(state.extensionStrings)&1)!=0 then draw(state,state.extensionStrings[len(state.extensionStrings)-1],320,y,"center-normal",retailActive) end if
  return len(state.actions)
end function

// DriverInfo_Cache
/// @param state Mutable UI video record/storage; this routine assigns `state.assets`, `state.actions`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function driverInfoCache(state,retailActive)
  state.assets=["menu/art/frame2_l","menu/art/frame1_r","menu/art/back_0","menu/art/back_1"]
  for each asset in state.assets state.actions=host(state.actions,"renderer","register-shader",asset,"",0,retailActive) end for
  return len(state.assets)
end function

// UI_DriverInfo_Menu
/// @param config Record read through `config.extensions`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function uiDriverInfoMenu(config,retailActive)
  state=driverState(config)
  extensionText=config.extensions
  extensionBytes=bytes(extensionText)
  if len(extensionBytes)>1023 then extensionText=decode(slice(extensionBytes,0,1023)) end if
  state.extensionStrings=words(extensionText,40)
  state.items=[
    item(0,"btext","DRIVER INFO",320,16,true,false,false),
    item(0,"bitmap","menu/art/frame2_l",0,78,false,false,false),
    item(0,"bitmap","menu/art/frame1_r",376,76,false,false,false),
    item(ID_DRIVERINFOBACK,"bitmap","menu/art/back_0",0,416,true,false,false)
  ]
  driverInfoCache(state,retailActive)
  state.actions=host(state.actions,"ui","push","driver-info","",0,retailActive)
  return state
end function

// GraphicsOptions_GetInitialVideo
/// @param state Mutable UI video record/storage; this routine assigns `state.initial`.
function graphicsOptionsGetInitialVideo(state)
  state.initial=initial(state.mode,state.fullscreen,state.tq,state.lighting,state.colorDepth,state.textureBits,state.geometry,state.filter,state.driver,state.extensions)
  return copyInitial(state.initial)
end function

/// Computes `value.colorDepth==state.colorDepth and value.driver==state.driver and value.mode==state.mode and value.fullscreen==state.fullscreen and value.tq==state.tq and value.lighting==state.lighting and val...` for UI video `sameTemplate`.
/// @param state Record read through `state.colorDepth`, `state.driver`, `state.mode`, `state.fullscreen` and additional values.
/// @param value Record read through `value.colorDepth`, `value.driver`, `value.mode`, `value.fullscreen` and additional values.
function sameTemplate(state,value)
  return value.colorDepth==state.colorDepth and value.driver==state.driver and value.mode==state.mode and value.fullscreen==state.fullscreen and value.tq==state.tq and value.lighting==state.lighting and value.geometry==state.geometry and value.filter==state.filter
end function

// GraphicsOptions_CheckConfig
/// @param state Mutable UI video record/storage; this routine assigns `state.preset`.
function graphicsOptionsCheckConfig(state)
  all=templates()
  for i=0 to len(all)-1
    if sameTemplate(state,all[i]) then state.preset=i;return i end if
  end for
  state.preset=4
  return 4
end function

// GraphicsOptions_UpdateMenuItems
/// @param state Mutable UI video record/storage; this routine assigns `state.fullscreen`, `state.fullscreenGrayed`, `state.colorDepth`, `state.colorDepthGrayed` and additional values.
function graphicsOptionsUpdateMenuItems(state)
  if state.driver==1 then state.fullscreen=true;state.fullscreenGrayed=true;state.colorDepth=1 else state.fullscreenGrayed=false end if
  if not state.fullscreen or state.driver==1 then state.colorDepth=0;state.colorDepthGrayed=true else state.colorDepthGrayed=false end if
  if not state.extensions and state.textureBits==0 then state.textureBits=1 end if
  old=state.initial
  state.applyVisible=old.mode!=state.mode or old.fullscreen!=state.fullscreen or old.extensions!=state.extensions or old.tq!=state.tq or old.lighting!=state.lighting or old.colorDepth!=state.colorDepth or old.driver!=state.driver or old.textureBits!=state.textureBits or old.geometry!=state.geometry or old.filter!=state.filter
  graphicsOptionsCheckConfig(state)
  return state.applyVisible
end function

/// Updates `state.actions` during UI video `write`.
/// @param state Mutable UI video record/storage; this routine assigns `state.actions`.
/// @param name Name used to select or register the corresponding UI video resource.
/// @param text Text consumed or emitted by `write` in the UI video path.
/// @param number Value used by `state.actions=host(state.actions,"cvar","set",name,text,number,retailActive)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function write(state,name,text,number,retailActive)
  state.actions=host(state.actions,"cvar","set",name,text,number,retailActive)
  return void
end function

/// Evaluates UI video `booleanNumber` and returns `1`, `0` according to its guard/selection conditions.
/// @param value Value tested by `value` before the calculation continues.
function booleanNumber(value)
  if value then return 1 end if
  return 0
end function

// GraphicsOptions_ApplyChanges
/// @param state Mutable UI video record/storage; this routine assigns `state.actions`.
/// @param eventCode Quake III event identifier selecting the event handler.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function graphicsOptionsApplyChanges(state,eventCode,retailActive)
  if eventCode!=QM_ACTIVATED then return false end if
  textureBits=[0,16,32][state.textureBits]
  write(state,"r_texturebits",str(textureBits),textureBits,retailActive)
  write(state,"r_picmip",str(3-state.tq),3-state.tq,retailActive)
  extensions=booleanNumber(state.extensions)
  fullscreen=booleanNumber(state.fullscreen)
  write(state,"r_allowExtensions",str(extensions),extensions,retailActive)
  write(state,"r_mode",str(state.mode),state.mode,retailActive)
  write(state,"r_fullscreen",str(fullscreen),fullscreen,retailActive)
  drivers=["opengl32","3dfxvgl"]
  write(state,"r_glDriver",drivers[state.driver],state.driver,retailActive)
  if state.colorDepth==0 then
    write(state,"r_colorbits","0",0,retailActive);write(state,"r_depthbits","0",0,retailActive);write(state,"r_stencilbits","0",0,retailActive)
  else if state.colorDepth==1 then
    write(state,"r_colorbits","16",16,retailActive);write(state,"r_depthbits","16",16,retailActive);write(state,"r_stencilbits","0",0,retailActive)
  else
    write(state,"r_colorbits","32",32,retailActive);write(state,"r_depthbits","24",24,retailActive)
  end if
  write(state,"r_vertexLight",str(state.lighting),state.lighting,retailActive)
  lod=1
  subdivisions=20
  if state.geometry==2 then lod=0;subdivisions=4 else if state.geometry==1 then lod=1;subdivisions=12 else lod=1;subdivisions=20 end if
  write(state,"r_lodBias",str(lod),lod,retailActive)
  write(state,"r_subdivisions",str(subdivisions),subdivisions,retailActive)
  textureMode="GL_LINEAR_MIPMAP_NEAREST"
  if state.filter!=0 then textureMode="GL_LINEAR_MIPMAP_LINEAR" end if
  write(state,"r_textureMode",textureMode,state.filter,retailActive)
  state.actions=host(state.actions,"command","append","vid_restart","vid_restart\n",0,retailActive)
  return true
end function

/// Updates `state.mode`, `state.tq`, `state.lighting`, `state.colorDepth` and additional values during UI video `applyTemplate`.
/// @param state Mutable UI video record/storage; this routine assigns `state.mode`, `state.tq`, `state.lighting`, `state.colorDepth` and additional values.
/// @param index Value used by `value=templates()[index]`.
function applyTemplate(state,index)
  value=templates()[index]
  state.mode=value.mode;state.tq=value.tq;state.lighting=value.lighting;state.colorDepth=value.colorDepth;state.textureBits=value.textureBits;state.geometry=value.geometry;state.filter=value.filter;state.fullscreen=value.fullscreen
  return void
end function

// GraphicsOptions_Event
/// @param state Mutable UI video record/storage; this routine assigns `state.mode`, `state.actions`.
/// @param id Value used by `if id==ID_MODE then`.
/// @param eventCode Quake III event identifier selecting the event handler.
/// @param config Record read through `config.vendor`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function graphicsOptionsEvent(state,id,eventCode,config,retailActive)
  if eventCode!=QM_ACTIVATED then return false end if
  if id==ID_MODE then
    if state.driver==1 then
      if state.mode<2 then state.mode=2 else if state.mode>6 then state.mode=6 end if
    end if
  else if id==ID_LIST then
    if state.preset>=0 and state.preset<len(templates()) then applyTemplate(state,state.preset) end if
  else if id==ID_DRIVERINFO then
    state.actions=host(state.actions,"ui","push","driver-info",config.vendor,0,retailActive)
  else if id==ID_BACK2 then
    state.actions=host(state.actions,"ui","pop","graphics","",0,retailActive)
  else if id==ID_DISPLAY then
    state.actions=host(state.actions,"ui","pop","graphics","",0,retailActive);state.actions=host(state.actions,"ui","push","display","",0,retailActive)
  else if id==ID_SOUND then
    state.actions=host(state.actions,"ui","pop","graphics","",0,retailActive);state.actions=host(state.actions,"ui","push","sound","",0,retailActive)
  else if id==ID_NETWORK then
    state.actions=host(state.actions,"ui","pop","graphics","",0,retailActive);state.actions=host(state.actions,"ui","push","network","",0,retailActive)
  end if
  return true
end function

// GraphicsOptions_TQEvent
/// @param state Mutable UI video record/storage; this routine assigns `state.tq`.
/// @param eventCode Quake III event identifier selecting the event handler.
function graphicsOptionsTQEvent(state,eventCode)
  if eventCode!=QM_ACTIVATED then return false end if
  state.tq=numeric.trunc32(state.tq+0.5)
  return true
end function

// GraphicsOptions_MenuDraw
/// @param state Mutable UI video record/storage; this routine assigns `state.items`, `state.actions`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function graphicsOptionsMenuDraw(state,retailActive)
  graphicsOptionsUpdateMenuItems(state)
  state.items=graphicsItems(state)
  state.actions=host(state.actions,"ui","draw-menu","graphics-options","",0,retailActive)
  return state.applyVisible
end function

// GraphicsOptions_SetMenuItems
/// @param state Mutable UI video record/storage; this routine assigns `state.mode`, `state.fullscreen`, `state.extensions`, `state.tq` and additional values.
/// @param cvars Record read through `cvars.mode`, `cvars.fullscreen`, `cvars.allowExtensions`, `cvars.picmip` and additional values.
function graphicsOptionsSetMenuItems(state,cvars)
  state.mode=cvars.mode
  if state.mode<0 then state.mode=3 end if
  state.fullscreen=cvars.fullscreen!=0
  state.extensions=cvars.allowExtensions!=0
  state.tq=3-cvars.picmip
  if state.tq<0 then state.tq=0 else if state.tq>3 then state.tq=3 end if
  state.lighting=0
  if cvars.vertexLight!=0 then state.lighting=1 end if
  if cvars.textureBits==16 then state.textureBits=1 else if cvars.textureBits==32 then state.textureBits=2 else state.textureBits=0 end if
  if strings.equalsIgnoreCaseAscii(cvars.textureMode,"GL_LINEAR_MIPMAP_NEAREST") then state.filter=0 else state.filter=1 end if
  if cvars.lodBias>0 then
    if cvars.subdivisions>=20 then state.geometry=0 else state.geometry=1 end if
  else state.geometry=2 end if
  if cvars.colorBits==16 then state.colorDepth=1 else if cvars.colorBits==32 then state.colorDepth=2 else state.colorDepth=0 end if
  if not state.fullscreen then state.colorDepth=0 end if
  if state.driver==1 then state.colorDepth=1 end if
  return state
end function

/// Builds the UI video `graphicsItems` sequence from `[ item(0,"btext","SYSTEM SETUP",320,16,true,false,false), item(0,"bitmap","menu/art/frame2_l",0,78,false,false,false), item(0,"bitmap","menu/art/frame1_r",376,76,false,false,false), item(ID_GRAPHIC...`.
/// @param state Record read through `state.driverHidden`, `state.colorDepthGrayed`, `state.fullscreenGrayed`, `state.applyVisible`.
function graphicsItems(state)
  return [
    item(0,"btext","SYSTEM SETUP",320,16,true,false,false),
    item(0,"bitmap","menu/art/frame2_l",0,78,false,false,false),
    item(0,"bitmap","menu/art/frame1_r",376,76,false,false,false),
    item(ID_GRAPHICS,"ptext","GRAPHICS",216,186,true,false,false),
    item(ID_DISPLAY,"ptext","DISPLAY",216,213,true,false,false),
    item(ID_SOUND,"ptext","SOUND",216,240,true,false,false),
    item(ID_NETWORK,"ptext","NETWORK",216,267,true,false,false),
    item(ID_LIST,"spin","Graphics Settings:",400,132,true,false,false),
    item(0,"spin","GL Driver:",400,168,true,state.driverHidden,false),
    item(0,"spin","GL Extensions:",400,186,true,false,false),
    item(ID_MODE,"spin","Video Mode:",400,204,true,false,false),
    item(0,"spin","Color Depth:",400,222,true,false,state.colorDepthGrayed),
    item(ID_FULLSCREEN,"spin","Fullscreen:",400,240,true,false,state.fullscreenGrayed),
    item(0,"spin","Lighting:",400,258,true,false,false),
    item(0,"spin","Geometric Detail:",400,276,true,false,false),
    item(0,"slider","Texture Detail:",400,294,true,false,false),
    item(0,"spin","Texture Quality:",400,312,true,false,false),
    item(0,"spin","Texture Filter:",400,330,true,false,false),
    item(ID_DRIVERINFO,"ptext","Driver Info",320,362,true,false,false),
    item(ID_BACK2,"bitmap","menu/art/back_0",0,416,true,false,false),
    item(0,"bitmap","menu/art/accept_0",640,416,state.applyVisible,not state.applyVisible,false)
  ]
end function

/// Builds the UI video `graphicsChoices` sequence from `[ ChoiceList("Graphics Settings",["High Quality","Normal","Fast","Fastest","Custom"]), ChoiceList("GL Driver",["Default","Voodoo"]), ChoiceList("GL Extensions",["Off","On"]), ChoiceList("Video Mode...`.
function graphicsChoices()
  return [
    ChoiceList("Graphics Settings",["High Quality","Normal","Fast","Fastest","Custom"]),
    ChoiceList("GL Driver",["Default","Voodoo"]),
    ChoiceList("GL Extensions",["Off","On"]),
    ChoiceList("Video Mode",["320x240","400x300","512x384","640x480","800x600","960x720","1024x768","1152x864","1280x1024","1600x1200","2048x1536","856x480 wide screen"]),
    ChoiceList("Color Depth",["Default","16 bit","32 bit"]),
    ChoiceList("Fullscreen",["Off","On"]),
    ChoiceList("Lighting",["Lightmap","Vertex"]),
    ChoiceList("Geometric Detail",["Low","Medium","High"]),
    ChoiceList("Texture Quality",["Default","16 bit","32 bit"]),
    ChoiceList("Texture Filter",["Bilinear","Trilinear"])
  ]
end function

// GraphicsOptions_Cache
/// @param state Mutable UI video record/storage; this routine assigns `state.assets`, `state.actions`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function graphicsOptionsCache(state,retailActive)
  state.assets=["menu/art/frame2_l","menu/art/frame1_r","menu/art/back_0","menu/art/back_1","menu/art/accept_0","menu/art/accept_1"]
  for each asset in state.assets state.actions=host(state.actions,"renderer","register-shader",asset,"",0,retailActive) end for
  return len(state.assets)
end function

// GraphicsOptions_MenuInit
/// @param cvars Value used by `graphicsOptionsSetMenuItems(state,cvars)`.
/// @param config Record read through `config.driverType`, `config.hardwareType`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function graphicsOptionsMenuInit(cvars,config,retailActive)
  state=graphicsState()
  if config.driverType==GLDRV_VOODOO then state.driver=1 end if
  if config.driverType==GLDRV_ICD and config.hardwareType==GLHW_3DFX_2D3D then state.driverHidden=true end if
  graphicsOptionsCache(state,retailActive)
  graphicsOptionsSetMenuItems(state,cvars)
  graphicsOptionsGetInitialVideo(state)
  graphicsOptionsUpdateMenuItems(state)
  state.choices=graphicsChoices()
  state.items=graphicsItems(state)
  return state
end function

// UI_GraphicsOptionsMenu
/// @param cvars Value used by `state=graphicsOptionsMenuInit(cvars,config,retailActive)`.
/// @param config Value used by `state=graphicsOptionsMenuInit(cvars,config,retailActive)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function uiGraphicsOptionsMenu(cvars,config,retailActive)
  state=graphicsOptionsMenuInit(cvars,config,retailActive)
  state.actions=host(state.actions,"ui","push","graphics-options","",0,retailActive)
  state.actions=host(state.actions,"ui","cursor","GRAPHICS","",ID_GRAPHICS,retailActive)
  return state
end function
