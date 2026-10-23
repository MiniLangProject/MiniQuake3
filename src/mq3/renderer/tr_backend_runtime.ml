// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native, stateful renderer back end corresponding to renderer/tr_backend.c.
// Hardware calls cross an injected services boundary; the retained renderer
// consumes the resulting batches, view state, uploads and frame transitions.
package mq3.renderer.tr_backend_runtime

import mq3.compat.numeric as n
import mq3.renderer.command_queue as commands
import mq3.renderer.draw_surfs as drawSurfs
import mq3.renderer.texture_state as textures
import mq3.renderer.tr_local as trLocal
import mq3.renderer.qgl as qgl

const CT_FRONT_SIDED=0
const CT_BACK_SIDED=1
const CT_TWO_SIDED=2
const RDF_NOWORLDMODEL=1
const RDF_HYPERSPACE=4
const RF_DEPTHHACK=8
const ENTITYNUM_WORLD=1022
const GL_MODULATE=0x2100
const GL_DECAL=0x2101
const GL_REPLACE=0x1e01
const GL_ADD=0x0104
const GLS_SRCBLEND_BITS=trLocal.GLS_SRCBLEND_BITS
const GLS_DSTBLEND_BITS=trLocal.GLS_DSTBLEND_BITS
const GLS_DEPTHMASK_TRUE=trLocal.GLS_DEPTHMASK_TRUE
const GLS_POLYMODE_LINE=trLocal.GLS_POLYMODE_LINE
const GLS_DEPTHTEST_DISABLE=trLocal.GLS_DEPTHTEST_DISABLE
const GLS_DEPTHFUNC_EQUAL=trLocal.GLS_DEPTHFUNC_EQUAL
const GLS_ATEST_BITS=trLocal.GLS_ATEST_BITS
const GLS_ATEST_GT_0=0x10000000
const GLS_ATEST_LT_80=0x20000000
const GLS_ATEST_GE_80=0x40000000
const GLS_DEFAULT=GLS_DEPTHMASK_TRUE

struct GLState faceCulling texEnv stateBits depthEqual blendEnabled srcBlend dstBlend depthWrite wireframe depthTest alphaTest mirror end struct
struct ViewParms projectionMatrix viewportX viewportY viewportWidth viewportHeight isPortal isMirror portalNormal portalDist orientationOrigin orientationAxis worldMatrix end struct
struct Entity shaderTime renderfx needDlights modelMatrix end struct
struct Refdef time floatTime rdflags entities dlights end struct
struct Shader name entityMergable timeOffset end struct
struct Surface sort surface end struct
struct DrawPayload refdef viewParms drawSurfs shaders end struct
struct RawUpload client width height pixels fullUpload dirty end struct
struct RawQuad positions texCoords client end struct
struct ImageInfo image uploadWidth uploadHeight end struct
struct Command id payload end struct
struct Services eventFn surfaceFn screenshotFn sleepFn context end struct
struct State textureState gl commandBackend services width height projection2D finishCalled isHyperspace skyRenderedThisView smpFrame refdef viewParms worldEntity currentEntity tessShader tessFog tessDlight numIndexes color2D overdraw msec rawImages uploads frames end struct

function fail(message) return error(7720,"tr_backend: "+message) end function
function qglRequiredCount() return len(qgl.requiredEntryPoints()) end function
function services() return Services(void,void,void,void,void) end function
function glState() return GLState(-1,[0,0],0,false,false,0,0,true,false,true,0,false) end function
function identityMatrix() return [1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0] end function
function identityAxis() return [[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]] end function
function viewParms(width,height) return ViewParms(identityMatrix(),0,0,width,height,false,false,[0.0,0.0,1.0],0.0,[0.0,0.0,0.0],identityAxis(),identityMatrix()) end function
function refdef() return Refdef(0,0.0,0,[],[]) end function
function entity() return Entity(0.0,0,false,identityMatrix()) end function
function create(textureState,width,height,host)
  if textureState==void or width<=0 or height<=0 then return fail("texture state and positive dimensions are required") end if
  if host==void then host=services() end if
  commandState=commands.backend(void)
  return State(textureState,glState(),commandState,host,width,height,false,false,false,false,0,refdef(),viewParms(width,height),entity(),void,void,-1,0,0,commandState.color2D,0,0,[],[],0)
end function
function emit(state,kind,value)
  if state.services.eventFn!=void then state.services.eventFn(state.services.context,kind,value) end if
  return void
end function

// C-named texture facade.  These calls use the productive two-TMU cache.
function GL_Bind(state,image) return textures.bind(state.textureState,image) end function
function GL_SelectTexture(state,unit) return textures.selectTexture(state.textureState,unit) end function
function GL_BindMultitexture(state,image0,env0,image1,env1) return textures.bindMultitexture(state.textureState,image0,env0,image1,env1) end function

function GL_Cull(state,cullType)
  if state==void or (cullType!=CT_FRONT_SIDED and cullType!=CT_BACK_SIDED and cullType!=CT_TWO_SIDED) then return fail("invalid cull mode") end if
  if state.gl.faceCulling==cullType then return false end if
  state.gl.faceCulling=cullType
  if cullType==CT_TWO_SIDED then emit(state,"cull",[false,0])
  else
    face=1
    if (cullType==CT_BACK_SIDED and not state.viewParms.isMirror) or (cullType==CT_FRONT_SIDED and state.viewParms.isMirror) then face=2 end if
    emit(state,"cull",[true,face])
  end if
  return true
end function

function GL_TexEnv(state,env)
  if state==void then return fail("missing state") end if
  unit=state.textureState.currentTmu
  if env!=GL_MODULATE and env!=GL_REPLACE and env!=GL_DECAL and env!=GL_ADD then return fail("invalid texture environment") end if
  if state.gl.texEnv[unit]==env then return false end if
  state.gl.texEnv[unit]=env;emit(state,"texEnv",[unit,env]);return true
end function

function srcFactor(bits)
  value=bits&GLS_SRCBLEND_BITS;if value>=1 and value<=9 then return value end if;return error(7721,"invalid source blend bits")
end function
function dstFactor(bits)
  value=(bits&GLS_DSTBLEND_BITS)>>4;if value>=1 and value<=8 then return value end if;return error(7721,"invalid destination blend bits")
end function
function GL_State(state,stateBits)
  if state==void then return fail("missing state") end if
  diff=stateBits^state.gl.stateBits;if diff==0 then return false end if
  if (diff&GLS_DEPTHFUNC_EQUAL)!=0 then state.gl.depthEqual=(stateBits&GLS_DEPTHFUNC_EQUAL)!=0;emit(state,"depthFunc",state.gl.depthEqual) end if
  if (diff&(GLS_SRCBLEND_BITS|GLS_DSTBLEND_BITS))!=0 then
    if (stateBits&(GLS_SRCBLEND_BITS|GLS_DSTBLEND_BITS))!=0 then
      source=srcFactor(stateBits);if source is error then return source end if;destination=dstFactor(stateBits);if destination is error then return destination end if
      state.gl.blendEnabled=true;state.gl.srcBlend=source;state.gl.dstBlend=destination;emit(state,"blend",[source,destination])
    else state.gl.blendEnabled=false;emit(state,"blend",[0,0]) end if
  end if
  if (diff&GLS_DEPTHMASK_TRUE)!=0 then state.gl.depthWrite=(stateBits&GLS_DEPTHMASK_TRUE)!=0;emit(state,"depthMask",state.gl.depthWrite) end if
  if (diff&GLS_POLYMODE_LINE)!=0 then state.gl.wireframe=(stateBits&GLS_POLYMODE_LINE)!=0;emit(state,"wireframe",state.gl.wireframe) end if
  if (diff&GLS_DEPTHTEST_DISABLE)!=0 then state.gl.depthTest=(stateBits&GLS_DEPTHTEST_DISABLE)==0;emit(state,"depthTest",state.gl.depthTest) end if
  if (diff&GLS_ATEST_BITS)!=0 then
    mode=stateBits&GLS_ATEST_BITS;if mode!=0 and mode!=GLS_ATEST_GT_0 and mode!=GLS_ATEST_LT_80 and mode!=GLS_ATEST_GE_80 then return fail("invalid alpha-test bits") end if
    state.gl.alphaTest=mode;emit(state,"alphaTest",mode)
  end if
  state.gl.stateBits=stateBits;return true
end function

function RB_Hyperspace(state)
  c=(state.refdef.time&255)/255.0;emit(state,"clearColor",[c,c,c,1.0]);emit(state,"clear",["color"]);state.isHyperspace=true;return c
end function
function SetViewportAndScissor(state)
  view=state.viewParms;emit(state,"projection",view.projectionMatrix);emit(state,"viewport",[view.viewportX,view.viewportY,view.viewportWidth,view.viewportHeight]);emit(state,"scissor",[view.viewportX,view.viewportY,view.viewportWidth,view.viewportHeight]);return void
end function
function portalPlane(view)
  p=view.portalNormal;a=view.orientationAxis;o=view.orientationOrigin
  return [a[0][0]*p[0]+a[0][1]*p[1]+a[0][2]*p[2],a[1][0]*p[0]+a[1][1]*p[1]+a[1][2]*p[2],a[2][0]*p[0]+a[2][1]*p[1]+a[2][2]*p[2],p[0]*o[0]+p[1]*o[1]+p[2]*o[2]-view.portalDist]
end function
function RB_BeginDrawingView(state,finishMode,measureOverdraw,shadowMode,fastSky)
  if finishMode==1 and not state.finishCalled then emit(state,"finish",void);state.finishCalled=true end if
  if finishMode==0 then state.finishCalled=true end if
  state.projection2D=false;state.commandBackend.projection2D=false;SetViewportAndScissor(state);GL_State(state,GLS_DEFAULT)
  clear=["depth"];if measureOverdraw or shadowMode==2 then clear=clear+["stencil"] end if;if fastSky and (state.refdef.rdflags&RDF_NOWORLDMODEL)==0 then emit(state,"clearColor",[0.0,0.0,0.0,1.0]);clear=clear+["color"] end if;emit(state,"clear",clear)
  if (state.refdef.rdflags&RDF_HYPERSPACE)!=0 then RB_Hyperspace(state);return false end if
  state.isHyperspace=false;state.gl.faceCulling=-1;state.skyRenderedThisView=false
  if state.viewParms.isPortal then emit(state,"clipPlane",portalPlane(state.viewParms)) else emit(state,"clipPlane",void) end if
  return true
end function

function endSurface(state)
  if state.tessShader!=void then emit(state,"endSurface",[state.tessShader.name,state.tessFog,state.tessDlight,state.numIndexes]) end if
  state.numIndexes=0;return void
end function
function beginSurface(state,shader,fog,dlight)
  state.tessShader=shader;state.tessFog=fog;state.tessDlight=dlight;state.numIndexes=0;emit(state,"beginSurface",[shader.name,fog,dlight]);return void
end function
function entityAt(state,index)
  if index<0 or index>=len(state.refdef.entities) then return state.worldEntity end if;return state.refdef.entities[index]
end function
function RB_RenderDrawSurfList(state,surfaces,shaders,finishMode,measureOverdraw,shadowMode,fastSky)
  if surfaces==void or shaders==void then return fail("draw surfaces and shaders are required") end if
  if not RB_BeginDrawingView(state,finishMode,measureOverdraw,shadowMode,fastSky) then return 0 end if
  originalTime=state.refdef.floatTime;oldSort=-1;oldEntity=-1;oldShader=void;oldFog=-1;oldDlight=-1;depthRange=false;rendered=0
  for each item in surfaces
    if item.sort==oldSort then
      if state.services.surfaceFn!=void then state.services.surfaceFn(state.services.context,item.surface) end if;state.numIndexes=state.numIndexes+1;rendered=rendered+1
    else
      oldSort=item.sort;fields=drawSurfs.decompose(item.sort)
      if fields.shaderIndex<0 or fields.shaderIndex>=len(shaders) then return fail("shader index outside table") end if;shader=shaders[fields.shaderIndex]
      if shader!=oldShader or fields.fogNum!=oldFog or fields.dlightMap!=oldDlight or (fields.entityNum!=oldEntity and not shader.entityMergable) then
        if oldShader!=void then endSurface(state) end if;beginSurface(state,shader,fields.fogNum,fields.dlightMap);oldShader=shader;oldFog=fields.fogNum;oldDlight=fields.dlightMap
      end if
      if fields.entityNum!=oldEntity then
        depthRange=false
        if fields.entityNum!=ENTITYNUM_WORLD then
          current=entityAt(state,fields.entityNum);state.currentEntity=current;state.refdef.floatTime=originalTime-current.shaderTime;emit(state,"modelMatrix",current.modelMatrix);if current.needDlights then emit(state,"transformDlights",len(state.refdef.dlights)) end if;if (current.renderfx&RF_DEPTHHACK)!=0 then depthRange=true end if
        else state.currentEntity=state.worldEntity;state.refdef.floatTime=originalTime;emit(state,"modelMatrix",state.viewParms.worldMatrix);emit(state,"transformDlights",len(state.refdef.dlights)) end if
        emit(state,"shaderTime",state.refdef.floatTime-shader.timeOffset);emit(state,"depthRange",depthRange);oldEntity=fields.entityNum
      end if
      if state.services.surfaceFn!=void then state.services.surfaceFn(state.services.context,item.surface) end if;state.numIndexes=state.numIndexes+1;rendered=rendered+1
    end if
  end for
  state.refdef.floatTime=originalTime;if oldShader!=void then endSurface(state) end if;emit(state,"modelMatrix",state.viewParms.worldMatrix);if depthRange then emit(state,"depthRange",false) end if;emit(state,"shadowFinish",void);emit(state,"renderFlares",void);return rendered
end function

function RB_SetGL2D(state,now)
  state.projection2D=true;state.commandBackend.projection2D=true;emit(state,"viewport",[0,0,state.width,state.height]);emit(state,"ortho",[0,state.width,state.height,0,0,1]);GL_State(state,GLS_DEPTHTEST_DISABLE|5|0x60);emit(state,"cull",[false,0]);emit(state,"clipPlane",void);state.refdef.time=now;state.refdef.floatTime=now*0.001;return void
end function
function powerOfTwo(value) return value>0 and (value&(value-1))==0 end function
function uploadRaw(state,w,h,cols,rows,data,client,dirty,requirePowerOfTwo)
  if state==void or cols<=0 or rows<=0 or client<0 then return fail("invalid cinematic upload") end if
  if requirePowerOfTwo and (not powerOfTwo(cols) or not powerOfTwo(rows)) then return fail("cinematic size must be power of two") end if
  while len(state.rawImages)<=client state.rawImages=state.rawImages+[void] end while
  previous=state.rawImages[client];full=previous==void or previous.uploadWidth!=cols or previous.uploadHeight!=rows
  image=ImageInfo(void,cols,rows);state.rawImages[client]=image
  if full or dirty then state.uploads=state.uploads+[RawUpload(client,cols,rows,data,full,dirty)] end if
  return full or dirty
end function
function RE_UploadCinematic(state,w,h,cols,rows,data,client,dirty) return uploadRaw(state,w,h,cols,rows,data,client,dirty,false) end function
function RE_StretchRaw(state,x,y,w,h,cols,rows,data,client,dirty,now)
  uploaded=uploadRaw(state,w,h,cols,rows,data,client,dirty,true);if uploaded is error then return uploaded end if;RB_SetGL2D(state,now)
  quad=RawQuad([[x,y],[x+w,y],[x+w,y+h],[x,y+h]],[[0.5/cols,0.5/rows],[(cols-0.5)/cols,0.5/rows],[(cols-0.5)/cols,(rows-0.5)/rows],[0.5/cols,(rows-0.5)/rows]],client);emit(state,"rawQuad",quad);return quad
end function

function RB_SetColor(state,command)
  commands.executeSetColor(state.commandBackend,command);state.color2D=state.commandBackend.color2D;return state.color2D
end function
function RB_StretchPic(state,command,now)
  if not state.projection2D then RB_SetGL2D(state,now) end if
  commands.executeStretchPic(state.commandBackend,command);state.numIndexes=state.commandBackend.numIndexes;state.tessShader=command.shader;return 1
end function
function RB_DrawSurfs(state,command,finishMode,measureOverdraw,shadowMode,fastSky)
  if state.numIndexes>0 then endSurface(state) end if;payload=command.payload;state.refdef=payload.refdef;state.viewParms=payload.viewParms;return RB_RenderDrawSurfList(state,payload.drawSurfs,payload.shaders,finishMode,measureOverdraw,shadowMode,fastSky)
end function
function RB_DrawBuffer(state,command,clearDebug)
  emit(state,"drawBuffer",command.payload);if clearDebug then emit(state,"clearColor",[1.0,0.0,0.5,1.0]);emit(state,"clear",["color","depth"]) end if;return true
end function
function RB_ShowImages(state,images,mode,now)
  if not state.projection2D then RB_SetGL2D(state,now) end if;emit(state,"clear",["color"]);result=[];cellW=state.width/20;cellH=state.height/15
  for index=0 to len(images)-1 info=images[index];w=cellW;h=cellH;if mode==2 then w=w*info.uploadWidth/512.0;h=h*info.uploadHeight/512.0 end if;x=(index%20)*cellW;y=n.quotient(index,20)*cellH;result=result+[RawQuad([[x,y],[x+w,y],[x+w,y+h],[x,y+h]],[[0.0,0.0],[1.0,0.0],[1.0,1.0],[0.0,1.0]],index)] end for
  emit(state,"showImages",result);return result
end function
function RB_SwapBuffers(state,command,showImages,images,measureOverdraw,stencil,now)
  if state.numIndexes>0 then endSurface(state) end if;if showImages!=0 then RB_ShowImages(state,images,showImages,now) end if
  if measureOverdraw then sum=0;for each value in stencil sum=sum+value end for;state.overdraw=state.overdraw+sum end if
  if not state.finishCalled then emit(state,"finish",void) end if;emit(state,"endFrame",void);state.projection2D=false;state.commandBackend.projection2D=false;state.frames=state.frames+1;return true
end function

function RB_ExecuteRenderCommands(state,stream,smpEnabled,secondBuffer,now)
  if state==void or stream==void then return fail("state and command stream are required") end if;state.smpFrame=0;if smpEnabled and secondBuffer then state.smpFrame=1 end if;count=0
  for each command in stream
    if command.id==commands.RC_SET_COLOR then RB_SetColor(state,command.payload)
    else if command.id==commands.RC_STRETCH_PIC then RB_StretchPic(state,command.payload,now)
    else if command.id==commands.RC_DRAW_SURFS then RB_DrawSurfs(state,command,0,false,0,false)
    else if command.id==commands.RC_DRAW_BUFFER then RB_DrawBuffer(state,command,false)
    else if command.id==commands.RC_SWAP_BUFFERS then RB_SwapBuffers(state,command,0,[],false,[],now)
    else if command.id==commands.RC_SCREENSHOT then if state.services.screenshotFn!=void then state.services.screenshotFn(state.services.context,command.payload) end if
    else state.msec=0;return count
    end if;count=count+1
  end for
  state.msec=0;return count
end function
function RB_RenderThread(state,streams,smpEnabled,now)
  if streams==void then return 0 end if;count=0;for each stream in streams if stream==void then return count end if;RB_ExecuteRenderCommands(state,stream,smpEnabled,count%2==1,now);count=count+1 end for;return count
end function
