// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_video.c.
package mq3.client.ui_video
import std.string as strings
import mq3.compat.numeric as numeric

const QM_ACTIVATED=3
const ID_DRIVERINFOBACK=100
const ID_BACK2=101
const ID_FULLSCREEN=102
const ID_LIST=103
const ID_MODE=104
const ID_DRIVERINFO=105
const ID_GRAPHICS=106
const ID_DISPLAY=107
const ID_SOUND=108
const ID_NETWORK=109
const GLDRV_ICD=0
const GLDRV_VOODOO=2
const GLHW_3DFX_2D3D=1

struct HostAction boundary kind name text number dispatched end struct
struct Item id kind name x y active hidden grayed end struct
struct DrawLine text x y alignment end struct
struct ChoiceList name values end struct
struct GlConfig vendor version renderer extensions colorBits depthBits stencilBits driverType hardwareType end struct
struct VideoCvars mode fullscreen allowExtensions picmip vertexLight textureBits textureMode lodBias subdivisions colorBits glDriver end struct
struct InitialVideo mode fullscreen tq lighting colorDepth textureBits geometry filter driver extensions end struct
struct DriverInfoState config extensionStrings drawLines items assets actions end struct
struct GraphicsState mode fullscreen tq lighting colorDepth textureBits geometry filter driver extensions preset applyVisible fullscreenGrayed colorDepthGrayed driverHidden initial choices items assets actions end struct

function host(actions,boundary,kind,name,text,number,retailActive)
  return actions+[HostAction(boundary,kind,name,text,number,not retailActive)]
end function

function item(id,kind,name,x,y,active,hidden,grayed)
  return Item(id,kind,name,x,y,active,hidden,grayed)
end function

function initial(mode,fullscreen,tq,lighting,colorDepth,textureBits,geometry,filter,driver,extensions)
  return InitialVideo(mode,fullscreen,tq,lighting,colorDepth,textureBits,geometry,filter,driver,extensions)
end function

function templates()
  return [
    initial(4,true,2,0,2,2,1,1,0,true),
    initial(3,true,2,0,0,0,1,0,0,true),
    initial(2,true,1,0,1,0,0,0,0,true),
    initial(2,true,1,1,1,0,0,0,0,true),
    initial(3,true,1,0,0,0,1,0,0,true)
  ]
end function

function copyInitial(value)
  return initial(value.mode,value.fullscreen,value.tq,value.lighting,value.colorDepth,value.textureBits,value.geometry,value.filter,value.driver,value.extensions)
end function

function graphicsState()
  base=initial(0,false,0,0,0,0,0,0,0,false)
  return GraphicsState(0,false,0,0,0,0,0,0,0,false,4,false,false,false,false,base,[],[],[],[])
end function

function driverState(config)
  return DriverInfoState(config,[],[],[],[],[])
end function

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
function driverInfoEvent(state,eventCode,retailActive)
  if eventCode!=QM_ACTIVATED then return false end if
  state.actions=host(state.actions,"ui","pop","driver-info","",ID_DRIVERINFOBACK,retailActive)
  return true
end function

function draw(state,text,x,y,alignment,retailActive)
  state.drawLines=state.drawLines+[DrawLine(text,x,y,alignment)]
  state.actions=host(state.actions,"renderer","draw-string",alignment,text,0,retailActive)
  return void
end function

// DriverInfo_MenuDraw
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
function driverInfoCache(state,retailActive)
  state.assets=["menu/art/frame2_l","menu/art/frame1_r","menu/art/back_0","menu/art/back_1"]
  for each asset in state.assets state.actions=host(state.actions,"renderer","register-shader",asset,"",0,retailActive) end for
  return len(state.assets)
end function

// UI_DriverInfo_Menu
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
function graphicsOptionsGetInitialVideo(state)
  state.initial=initial(state.mode,state.fullscreen,state.tq,state.lighting,state.colorDepth,state.textureBits,state.geometry,state.filter,state.driver,state.extensions)
  return copyInitial(state.initial)
end function

function sameTemplate(state,value)
  return value.colorDepth==state.colorDepth and value.driver==state.driver and value.mode==state.mode and value.fullscreen==state.fullscreen and value.tq==state.tq and value.lighting==state.lighting and value.geometry==state.geometry and value.filter==state.filter
end function

// GraphicsOptions_CheckConfig
function graphicsOptionsCheckConfig(state)
  all=templates()
  for i=0 to len(all)-1
    if sameTemplate(state,all[i]) then state.preset=i;return i end if
  end for
  state.preset=4
  return 4
end function

// GraphicsOptions_UpdateMenuItems
function graphicsOptionsUpdateMenuItems(state)
  if state.driver==1 then state.fullscreen=true;state.fullscreenGrayed=true;state.colorDepth=1 else state.fullscreenGrayed=false end if
  if not state.fullscreen or state.driver==1 then state.colorDepth=0;state.colorDepthGrayed=true else state.colorDepthGrayed=false end if
  if not state.extensions and state.textureBits==0 then state.textureBits=1 end if
  old=state.initial
  state.applyVisible=old.mode!=state.mode or old.fullscreen!=state.fullscreen or old.extensions!=state.extensions or old.tq!=state.tq or old.lighting!=state.lighting or old.colorDepth!=state.colorDepth or old.driver!=state.driver or old.textureBits!=state.textureBits or old.geometry!=state.geometry or old.filter!=state.filter
  graphicsOptionsCheckConfig(state)
  return state.applyVisible
end function

function write(state,name,text,number,retailActive)
  state.actions=host(state.actions,"cvar","set",name,text,number,retailActive)
  return void
end function

function booleanNumber(value)
  if value then return 1 end if
  return 0
end function

// GraphicsOptions_ApplyChanges
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

function applyTemplate(state,index)
  value=templates()[index]
  state.mode=value.mode;state.tq=value.tq;state.lighting=value.lighting;state.colorDepth=value.colorDepth;state.textureBits=value.textureBits;state.geometry=value.geometry;state.filter=value.filter;state.fullscreen=value.fullscreen
  return void
end function

// GraphicsOptions_Event
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
function graphicsOptionsTQEvent(state,eventCode)
  if eventCode!=QM_ACTIVATED then return false end if
  state.tq=numeric.trunc32(state.tq+0.5)
  return true
end function

// GraphicsOptions_MenuDraw
function graphicsOptionsMenuDraw(state,retailActive)
  graphicsOptionsUpdateMenuItems(state)
  state.items=graphicsItems(state)
  state.actions=host(state.actions,"ui","draw-menu","graphics-options","",0,retailActive)
  return state.applyVisible
end function

// GraphicsOptions_SetMenuItems
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
function graphicsOptionsCache(state,retailActive)
  state.assets=["menu/art/frame2_l","menu/art/frame1_r","menu/art/back_0","menu/art/back_1","menu/art/accept_0","menu/art/accept_1"]
  for each asset in state.assets state.actions=host(state.actions,"renderer","register-shader",asset,"",0,retailActive) end for
  return len(state.assets)
end function

// GraphicsOptions_MenuInit
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
function uiGraphicsOptionsMenu(cvars,config,retailActive)
  state=graphicsOptionsMenuInit(cvars,config,retailActive)
  state.actions=host(state.actions,"ui","push","graphics-options","",0,retailActive)
  state.actions=host(state.actions,"ui","cursor","GRAPHICS","",ID_GRAPHICS,retailActive)
  return state
end function
