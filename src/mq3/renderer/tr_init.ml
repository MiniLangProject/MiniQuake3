// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native renderer bootstrap corresponding to code/renderer/tr_init.c. Platform,
// OpenGL and filesystem work is exposed as typed, retail-suppressible actions.
package mq3.renderer.tr_init
import mq3.compat.numeric as n
import mq3.renderer.tr_public as trPublic

/// Renderer import/export ABI version expected by the engine.
const REF_API_VERSION=trPublic.REF_API_VERSION
/// Data record for `mq3.renderer.tr_init.Action`; groups `boundary`, `kind`, `name`, `value`, `number`, `dispatched`.
struct Action
  /// Host operation boundary at which this platform action is dispatched.
  boundary
  /// Renderer lifecycle operation to dispatch through the named platform boundary.
  kind
  /// Resource, command, or console-variable name targeted by the renderer lifecycle action.
  name
  /// Value carried by the event, configuration item, or requested operation.
  value
  /// Numeric argument supplied to the platform action handler.
  number
  /// Whether the recorded action was delivered to its host implementation.
  dispatched
end struct
/// Data record for `mq3.renderer.tr_init.Cvar`; groups `name`, `value`, `integer`, `flags`.
struct Cvar
  /// Console-variable name registered or queried by renderer initialization.
  name
  /// Value carried by the event, configuration item, or requested operation.
  value
  /// Integer interpretation of the console variable's value.
  integer
  /// Console-variable flags governing persistence and runtime modification.
  flags
end struct
/// Data record for `mq3.renderer.tr_init.Mode`; groups `description`, `width`, `height`, `pixelAspect`.
struct Mode
  /// Human-readable description of the selected video mode.
  description
  /// Width in pixels of the renderer video-mode table entry.
  width
  /// Height in pixels of the renderer video-mode table entry.
  height
  /// Pixel aspect ratio associated with the video mode.
  pixelAspect
end struct
/// Data record for `mq3.renderer.tr_init.Config`; groups `vendor`, `renderer`, `version`, `extensions`, `maxTextureSize`, `maxActiveTextures`, and 12 further fields.
struct Config
  /// Graphics-driver vendor identification string.
  vendor
  /// Graphics-driver renderer identification string.
  renderer
  /// Version string reported by the loaded graphics implementation.
  version
  /// Graphics extension capabilities or extension names reported by the driver.
  extensions
  /// Largest supported texture dimension reported by the graphics driver.
  maxTextureSize
  /// Number of simultaneous texture units supported by the driver.
  maxActiveTextures
  /// Color-buffer precision in bits.
  colorBits
  /// Depth-buffer precision in bits.
  depthBits
  /// Stencil-buffer precision in bits.
  stencilBits
  /// Width of the active video mode in pixels.
  vidWidth
  /// Height of the active video mode in pixels.
  vidHeight
  /// Refresh frequency of the selected display mode, in hertz.
  displayFrequency
  /// Whether the selected video mode occupies the full display.
  fullscreen
  /// Configured gamma correction or platform gamma-ramp state.
  gamma
  /// Detected graphics-hardware family used to select compatibility behavior.
  hardwareType
  /// Whether a separate render thread is currently active.
  smpActive
  /// Whether the driver supports additive texture-environment combining.
  textureEnvAddAvailable
  /// Selected texture-compression capability or mode.
  textureCompression
end struct
/// Data record for `mq3.renderer.tr_init.State`; groups `registered`, `cvars`, `commands`, `config`, `textureMode`, `overbrightBits`, and 7 further fields.
struct State
  /// Whether the subsystem has completed resource registration.
  registered
  /// Console variables and their current runtime values.
  cvars
  /// Console commands registered by the renderer lifecycle.
  commands
  /// Configuration values used to initialize or drive this subsystem.
  config
  /// Configured texture-filtering mode applied to registered images.
  textureMode
  /// Number of additional brightness bits used by color mapping.
  overbrightBits
  /// Maximum number of polygons accepted by the scene buffer.
  maxPolys
  /// Maximum number of polygon vertices accepted by the scene buffer.
  maxPolyVerts
  /// Most recently observed graphics-driver error code.
  glError
  /// Platform operations recorded for dispatch or inspection.
  actions
  /// Path or result of the latest ordinary screenshot request.
  lastScreenshot
  /// Path or result of the latest JPEG screenshot request.
  lastScreenshotJpeg
  /// Renderer functions exposed through the refresh API.
  apiExports
end struct

/// Constructs `mq3.renderer.tr_init.State` with `registered` = `false`, `cvars` = `[]`, `commands` = `[]`, `config` = `Config("","","","",0,0,0,0,0,0,0,0,false,false,0,false,false,0)` and the supplied remaining values.
function create() return State(false,[],[],Config("","","","",0,0,0,0,0,0,0,0,false,false,0,false,false,0),"GL_LINEAR_MIPMAP_NEAREST",0,600,3000,0,[],0,0,[]) end function
/// Updates `state.actions` in `mq3.renderer.tr_init.action`; returns `item`.
/// @param state Mutable record or buffer; this call updates `state.actions`.
/// @param boundary Value used for `mq3.renderer.tr_init.Action.boundary`.
/// @param kind Value used for `mq3.renderer.tr_init.Action.kind`.
/// @param name Value used for `mq3.renderer.tr_init.Action.name`.
/// @param value Value used for `mq3.renderer.tr_init.Action.value`.
/// @param number Value used for `mq3.renderer.tr_init.Action.number`.
/// @param retailActive Input used by `item=Action(boundary,kind,name,value,number,not retailActive)`.
function action(state,boundary,kind,name,value,number,retailActive) item=Action(boundary,kind,name,value,number,not retailActive);state.actions=state.actions+[item];return item end function
/// Constructs `mq3.renderer.tr_init.Cvar` with `integer` = `atoi(value)` and the supplied remaining values.
/// @param name Initial value for `mq3.renderer.tr_init.Cvar.name`.
/// @param value Initial value for `mq3.renderer.tr_init.Cvar.value`.
/// @param flags Initial value for `mq3.renderer.tr_init.Cvar.flags`.
function cvar(name,value,flags) return Cvar(name,value,atoi(value),flags) end function
/// Parses the leading decimal integer from a C string through the C runtime.
/// @param text NUL-terminated decimal text passed through the declared C-string binding.
/// @returns The parsed integer; zero when no decimal conversion is possible.
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
/// Returns `void` from `mq3.renderer.tr_init.findCvar`; earlier branches return `cv`.
/// @param state Record providing `state.cvars`.
/// @param name Input used by `for each cv in state.cvars if cv.name==name then return cv`.
function findCvar(state,name) for each cv in state.cvars if cv.name==name then return cv end if end for;return void end function

// AssertCvarRange
/// @param state Value forwarded as `state` to `mq3.renderer.tr_init.action`.
/// @param cv Mutable record or buffer; this call updates `cv.value`, `cv.integer`.
/// @param minValue Value assigned to `cv.value`.
/// @param maxValue Value assigned to `cv.value`.
/// @param integral Input tested by `integral and toFloat(cv.integer)!=cv.value`.
/// @param retailActive Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`.
function assertCvarRange(state,cv,minValue,maxValue,integral,retailActive) changed=false;if integral and toFloat(cv.integer)!=cv.value then cv.value=toFloat(cv.integer);changed=true end if;if cv.value<minValue then cv.value=minValue;cv.integer=n.trunc32(minValue);changed=true else if cv.value>maxValue then cv.value=maxValue;cv.integer=n.trunc32(maxValue);changed=true end if;if changed then action(state,"cvar","set",cv.name,str(cv.value),0,retailActive) end if;return changed end function
// InitOpenGL
/// @param state Mutable record or buffer; this call updates `state.config.maxTextureSize`.
/// @param retailActive Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`.
function initOpenGL(state,retailActive) if state.config.vidWidth==0 then action(state,"platform","glimp-init","","",0,retailActive);action(state,"gl","query-max-texture-size","","",0,retailActive);if state.config.maxTextureSize<0 then state.config.maxTextureSize=0 end if end if;action(state,"renderer","init-command-buffers","","",0,retailActive);gfxInfo(state,retailActive);glSetDefaultState(state,retailActive);return void end function
// GL_CheckErrors
/// @param state Record providing `state.glError`.
/// @param ignoreErrors Input tested by `state.glError==0 or ignoreErrors`.
/// @param retailActive Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`.
function glCheckErrors(state,ignoreErrors,retailActive) if state.glError==0 or ignoreErrors then return "" end if;names=[[1280,"GL_INVALID_ENUM"],[1281,"GL_INVALID_VALUE"],[1282,"GL_INVALID_OPERATION"],[1283,"GL_STACK_OVERFLOW"],[1284,"GL_STACK_UNDERFLOW"],[1285,"GL_OUT_OF_MEMORY"]];text=str(state.glError);for each pair in names if pair[0]==state.glError then text=pair[1] end if end for;action(state,"system","fatal-error","GL_CheckErrors",text,state.glError,retailActive);return text end function
/// Builds the 12-element result for `mq3.renderer.tr_init.modes` from `Mode("Mode 0: 320x240",320,240,1.0)`, `Mode("Mode 1: 400x300",400,300,1.0)`, `Mode("Mode 2: 512x384",512,384,1.0)`, `Mode("Mode 3: 640x480",640,480,1.0)`, `Mode("Mode 4: 800x600",800,600,1.0)`.
function modes() return [Mode("Mode  0: 320x240",320,240,1.0),Mode("Mode  1: 400x300",400,300,1.0),Mode("Mode  2: 512x384",512,384,1.0),Mode("Mode  3: 640x480",640,480,1.0),Mode("Mode  4: 800x600",800,600,1.0),Mode("Mode  5: 960x720",960,720,1.0),Mode("Mode  6: 1024x768",1024,768,1.0),Mode("Mode  7: 1152x864",1152,864,1.0),Mode("Mode  8: 1280x1024",1280,1024,1.0),Mode("Mode  9: 1600x1200",1600,1200,1.0),Mode("Mode 10: 2048x1536",2048,1536,1.0),Mode("Mode 11: 856x480 (wide)",856,480,1.0)] end function
// R_GetModeInfo
/// @param mode Input tested by `mode==-1`.
/// @param customWidth Input tested by `mode==-1`.
/// @param customHeight Input tested by `mode==-1`.
/// @param customAspect Input tested by `mode==-1`.
function getModeInfo(mode,customWidth,customHeight,customAspect) if mode==-1 then return [customWidth,customHeight,customAspect] end if;if mode<0 or mode>=len(modes()) then return void end if;item=modes()[mode];return [item.width,item.height,item.width/(item.height*item.pixelAspect)] end function
// R_ModeList_f
/// @param state Value forwarded as `state` to `mq3.renderer.tr_init.action`.
/// @param retailActive Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`.
function modeList(state,retailActive) text="\n";for each item in modes() text=text+item.description+"\n" end for;text=text+"\n";action(state,"system","print","modelist",text,0,retailActive);return text end function
// tga
/// @param width Input used by `header[12]=width&255`.
/// @param height Input used by `header[14]=height&255`.
/// @param rgb Indexed input read at `i+2`, `i+1`, `i`.
function tga(width,height,rgb) header=array(18,0);header[2]=2;header[12]=width&255;header[13]=width>>8;header[14]=height&255;header[15]=height>>8;header[16]=24;pixels=[];i=0;while i<len(rgb) pixels=pixels+[rgb[i+2],rgb[i+1],rgb[i]];i=i+3 end while;return bytes(header+pixels) end function
// RB_TakeScreenshotCmd
/// @param state Value forwarded as `state` to `mq3.renderer.tr_init.rbTakeScreenshotJpeg`.
/// @param x Value forwarded as `x` to `mq3.renderer.tr_init.rbTakeScreenshotJpeg`.
/// @param y Value forwarded as `y` to `mq3.renderer.tr_init.rbTakeScreenshotJpeg`.
/// @param width Value forwarded as `width` to `mq3.renderer.tr_init.rbTakeScreenshotJpeg`.
/// @param height Value forwarded as `height` to `mq3.renderer.tr_init.rbTakeScreenshotJpeg`.
/// @param name Value forwarded as `name` to `mq3.renderer.tr_init.rbTakeScreenshotJpeg`.
/// @param jpeg Input tested by `jpeg`.
/// @param retailActive Value forwarded as `retailActive` to `mq3.renderer.tr_init.rbTakeScreenshotJpeg`.
function takeScreenshotCmd(state,x,y,width,height,name,jpeg,retailActive) if jpeg then return rbTakeScreenshotJpeg(state,x,y,width,height,name,retailActive) end if;return rbTakeScreenshot(state,x,y,width,height,name,retailActive) end function
// RB_TakeScreenshotJPEG
/// @param state Value forwarded as `state` to `mq3.renderer.tr_init.action`.
/// @param x Input used by `action(state,"gl","read-pixels-rgba",name,str(x)+","+str(y)+","+str(width)+","+str(height),95,retailActive)`.
/// @param y Input used by `action(state,"gl","read-pixels-rgba",name,str(x)+","+str(y)+","+str(width)+","+str(height),95,retailActive)`.
/// @param width Input used by `action(state,"gl","read-pixels-rgba",name,str(x)+","+str(y)+","+str(width)+","+str(height),95,retailActive)`.
/// @param height Input used by `action(state,"gl","read-pixels-rgba",name,str(x)+","+str(y)+","+str(width)+","+str(height),95,retailActive)`.
/// @param name Value forwarded as `name` to `mq3.renderer.tr_init.action`.
/// @param retailActive Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`.
function rbTakeScreenshotJpeg(state,x,y,width,height,name,retailActive) action(state,"gl","read-pixels-rgba",name,str(x)+","+str(y)+","+str(width)+","+str(height),95,retailActive);action(state,"filesystem","write-jpeg",name,"",95,retailActive);return name end function
/// Returns `name` from `mq3.renderer.tr_init.rbTakeScreenshot`.
/// @param state Value forwarded as `state` to `mq3.renderer.tr_init.action`.
/// @param x Input used by `action(state,"gl","read-pixels-rgb",name,str(x)+","+str(y)+","+str(width)+","+str(height),24,retailActive)`.
/// @param y Input used by `action(state,"gl","read-pixels-rgb",name,str(x)+","+str(y)+","+str(width)+","+str(height),24,retailActive)`.
/// @param width Input used by `action(state,"gl","read-pixels-rgb",name,str(x)+","+str(y)+","+str(width)+","+str(height),24,retailActive)`.
/// @param height Input used by `action(state,"gl","read-pixels-rgb",name,str(x)+","+str(y)+","+str(width)+","+str(height),24,retailActive)`.
/// @param name Value forwarded as `name` to `mq3.renderer.tr_init.action`.
/// @param retailActive Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`.
function rbTakeScreenshot(state,x,y,width,height,name,retailActive) action(state,"gl","read-pixels-rgb",name,str(x)+","+str(y)+","+str(width)+","+str(height),24,retailActive);action(state,"filesystem","write-tga",name,"",width*height*3+18,retailActive);return name end function
// R_TakeScreenshot
/// @param state Value forwarded as `state` to `mq3.renderer.tr_init.action`.
/// @param x Input used by `action(state,"command-buffer","screenshot",name,str(x)+","+str(y)+","+str(width)+","+str(height),jpeg,retailActive)`.
/// @param y Input used by `action(state,"command-buffer","screenshot",name,str(x)+","+str(y)+","+str(width)+","+str(height),jpeg,retailActive)`.
/// @param width Input used by `action(state,"command-buffer","screenshot",name,str(x)+","+str(y)+","+str(width)+","+str(height),jpeg,retailActive)`.
/// @param height Input used by `action(state,"command-buffer","screenshot",name,str(x)+","+str(y)+","+str(width)+","+str(height),jpeg,retailActive)`.
/// @param name Value forwarded as `name` to `mq3.renderer.tr_init.action`.
/// @param jpeg Value forwarded as `number` to `mq3.renderer.tr_init.action`.
/// @param retailActive Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`.
function takeScreenshot(state,x,y,width,height,name,jpeg,retailActive) action(state,"command-buffer","screenshot",name,str(x)+","+str(y)+","+str(width)+","+str(height),jpeg,retailActive);return name end function
/// Returns `str(a)+str(b)+str(c)+str(d)` from `mq3.renderer.tr_init.fourDigits`.
/// @param number Input tested by `number<0 or number>9999`.
function fourDigits(number) if number<0 or number>9999 then number=9999 end if;a=n.trunc32(number/1000);number=number-a*1000;b=n.trunc32(number/100);number=number-b*100;c=n.trunc32(number/10);d=number-c*10;return str(a)+str(b)+str(c)+str(d) end function
// R_ScreenshotFilename
/// @param number Value forwarded as `number` to `mq3.renderer.tr_init.fourDigits`.
function screenshotFilename(number) return "screenshots/shot"+fourDigits(number)+".tga" end function
// R_ScreenshotFilenameJPEG
/// @param number Value forwarded as `number` to `mq3.renderer.tr_init.fourDigits`.
function screenshotFilenameJpeg(number) return "screenshots/shot"+fourDigits(number)+".jpg" end function
/// Updates `state.lastScreenshotJpeg`, `state.lastScreenshot` in `mq3.renderer.tr_init.nextScreenshot`.
/// @param state Mutable record or buffer; this call updates `state.lastScreenshotJpeg`, `state.lastScreenshot`.
/// @param jpeg Input tested by `jpeg`.
/// @param existing Sequence traversed as `file` while producing this result.
function nextScreenshot(state,jpeg,existing) number=state.lastScreenshot;if jpeg then number=state.lastScreenshotJpeg end if;if number<0 then number=0 end if;while number<=9999 name=screenshotFilename(number);if jpeg then name=screenshotFilenameJpeg(number) end if;found=false;for each file in existing if file==name then found=true end if end for;if not found then if jpeg then state.lastScreenshotJpeg=number+1 else state.lastScreenshot=number+1 end if;return name end if;number=number+1 end while;return void end function
// R_LevelShot
/// @param state Value forwarded as `state` to `mq3.renderer.tr_init.action`.
/// @param mapName Input used by `name="levelshots/"+mapName+".tga"`.
/// @param retailActive Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`.
function levelShot(state,mapName,retailActive) name="levelshots/"+mapName+".tga";action(state,"gl","read-levelshot-source",name,"512x384 sampling grid",0,retailActive);action(state,"filesystem","write-tga",name,"128x128",49170,retailActive);action(state,"system","print","levelshot","Wrote "+name+"\n",0,retailActive);return name end function
// R_ScreenShot_f
/// @param state Record providing `state.config`.
/// @param args Indexed input read at `1`.
/// @param existing Value forwarded as `existing` to `mq3.renderer.tr_init.nextScreenshot`.
/// @param retailActive Value forwarded as `retailActive` to `mq3.renderer.tr_init.levelShot`.
function screenShot(state,args,existing,retailActive) if len(args)>1 and args[1]=="levelshot" then return levelShot(state,"current",retailActive) end if;silent=len(args)>1 and args[1]=="silent";name="";if len(args)==2 and not silent then name="screenshots/"+args[1]+".tga" else name=nextScreenshot(state,false,existing) end if;if name==void then return void end if;takeScreenshot(state,0,0,state.config.vidWidth,state.config.vidHeight,name,false,retailActive);if not silent then action(state,"system","print","screenshot","Wrote "+name+"\n",0,retailActive) end if;return name end function
// R_ScreenShotJPEG_f
/// @param state Record providing `state.config`.
/// @param args Indexed input read at `1`.
/// @param existing Value forwarded as `existing` to `mq3.renderer.tr_init.nextScreenshot`.
/// @param retailActive Value forwarded as `retailActive` to `mq3.renderer.tr_init.levelShot`.
function screenShotJpeg(state,args,existing,retailActive) if len(args)>1 and args[1]=="levelshot" then return levelShot(state,"current",retailActive) end if;silent=len(args)>1 and args[1]=="silent";name="";if len(args)==2 and not silent then name="screenshots/"+args[1]+".jpg" else name=nextScreenshot(state,true,existing) end if;if name==void then return void end if;takeScreenshot(state,0,0,state.config.vidWidth,state.config.vidHeight,name,true,retailActive);if not silent then action(state,"system","print","screenshot","Wrote "+name+"\n",0,retailActive) end if;return name end function
// GL_SetDefaultState
/// @param state Record providing `state.textureMode`.
/// @param retailActive Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`.
function glSetDefaultState(state,retailActive) for each setting in ["clear-depth:1","cull-face:front","color:1,1,1,1","texture-2d:on","texture-env:modulate","shade:smooth","depth-func:lequal","vertex-array:on","polygon:fill","depth-mask:on","depth-test:off","scissor:on","cull:off","blend:off"] action(state,"gl","default-state",setting,"",0,retailActive) end for;action(state,"gl","texture-mode",state.textureMode,"",0,retailActive);return void end function
// GfxInfo_f
/// @param state Record providing `state.config`.
/// @param retailActive Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`.
function gfxInfo(state,retailActive) c=state.config;text="\nGL_VENDOR: "+c.vendor+"\nGL_RENDERER: "+c.renderer+"\nGL_VERSION: "+c.version+"\nGL_EXTENSIONS: "+c.extensions+"\nGL_MAX_TEXTURE_SIZE: "+str(c.maxTextureSize)+"\nGL_MAX_ACTIVE_TEXTURES_ARB: "+str(c.maxActiveTextures)+"\nPIXELFORMAT: color("+str(c.colorBits)+"-bits) Z("+str(c.depthBits)+"-bit) stencil("+str(c.stencilBits)+"-bits)\nMODE: "+str(c.vidWidth)+" x "+str(c.vidHeight);action(state,"system","print","gfxinfo",text,0,retailActive);return text end function
/// Builds the 21-element result for `mq3.renderer.tr_init.cvarPairs` from `["r_glDriver","opengl32"]`, `["r_allowExtensions","1"]`, `["r_picmip","1"]`, `["r_texturebits","0"]`, `["r_colorbits","0"]`.
function cvarPairs() return [["r_glDriver","opengl32"],["r_allowExtensions","1"],["r_picmip","1"],["r_texturebits","0"],["r_colorbits","0"],["r_stencilbits","8"],["r_depthbits","0"],["r_mode","3"],["r_fullscreen","1"],["r_customwidth","1600"],["r_customheight","1024"],["r_customaspect","1"],["r_subdivisions","4"],["r_smp","0"],["r_displayRefresh","0"],["r_znear","4"],["r_ignoreGLErrors","1"],["r_textureMode","GL_LINEAR_MIPMAP_NEAREST"],["r_gamma","1"],["r_maxpolys","600"],["r_maxpolyverts","3000"]] end function
// R_Register
/// @param state Mutable record or buffer; this call updates `state.cvars`, `state.commands`.
/// @param retailActive Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`.
function register(state,retailActive) state.cvars=[];for each pair in cvarPairs() cv=cvar(pair[0],pair[1],1);state.cvars=state.cvars+[cv];action(state,"cvar","register",cv.name,str(cv.value),cv.flags,retailActive) end for;state.commands=["imagelist","shaderlist","skinlist","modellist","modelist","screenshot","screenshotJPEG","gfxinfo"];for each name in state.commands action(state,"command","add",name,"",0,retailActive) end for;return len(state.cvars) end function
// R_Init
/// @param state Mutable record or buffer; this call updates `state.actions`, `state.registered`.
/// @param retailActive Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`.
function init(state,retailActive) state.actions=[];action(state,"system","print","renderer","----- R_Init -----\n",0,retailActive);register(state,retailActive);action(state,"memory","allocate-backend","polys","",state.maxPolys,retailActive);initOpenGL(state,retailActive);for each name in ["images","shaders","skins","models","freetype"] action(state,"renderer","init-subsystem",name,"",0,retailActive) end for;state.registered=true;action(state,"system","print","renderer","----- finished R_Init -----\n",0,retailActive);return true end function
// RE_Shutdown
/// @param state Mutable record or buffer; this call updates `state.registered`.
/// @param destroyWindow Input tested by `destroyWindow`.
/// @param retailActive Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`.
function shutdown(state,destroyWindow,retailActive) for each name in state.commands action(state,"command","remove",name,"",0,retailActive) end for;if state.registered then for each name in ["sync-render-thread","shutdown-command-buffers","delete-textures"] action(state,"renderer",name,"","",0,retailActive) end for end if;action(state,"renderer","done-freetype","","",0,retailActive);if destroyWindow then action(state,"platform","glimp-shutdown","","",0,retailActive) end if;state.registered=false;return void end function
// RE_EndRegistration
/// @param state Value forwarded as `state` to `mq3.renderer.tr_init.action`.
/// @param lowMemory Input tested by `not lowMemory`.
/// @param retailActive Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`.
function endRegistration(state,lowMemory,retailActive) action(state,"renderer","sync-render-thread","","",0,retailActive);if not lowMemory then action(state,"renderer","show-images","","",0,retailActive) end if;return void end function
// Error-/Print-Grenzen
/// @param state Value forwarded as `state` to `mq3.renderer.tr_init.action`.
/// @param text Value forwarded as `value` to `mq3.renderer.tr_init.action`.
/// @param retailActive Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`.
function rendererPrint(state,text,retailActive) return action(state,"system","print","renderer",text,0,retailActive) end function
/// Calls `mq3.renderer.tr_init.action` with `(state,"system","fatal-error","renderer",text,0,retailActive)` and returns its result.
/// @param state Value forwarded as `state` to `mq3.renderer.tr_init.action`.
/// @param text Value forwarded as `value` to `mq3.renderer.tr_init.action`.
/// @param retailActive Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`.
function rendererError(state,text,retailActive) return action(state,"system","fatal-error","renderer",text,0,retailActive) end function
// GetRefAPI
/// @param state Mutable record or buffer; this call updates `state.apiExports`.
/// @param apiVersion Argument 1 supplied to `mq3.renderer.tr_public.compatible`.
/// @param retailActive Value forwarded as `retailActive` to `mq3.renderer.tr_init.rendererPrint`.
function getRefAPI(state,apiVersion,retailActive) if not trPublic.compatible(apiVersion) then rendererPrint(state,"Mismatched REF_API_VERSION: expected "+str(REF_API_VERSION)+", got "+str(apiVersion)+"\n",retailActive);return void end if;state.apiExports=trPublic.exportNames();return state.apiExports end function
