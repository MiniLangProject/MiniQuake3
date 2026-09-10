// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Texture-unit selection and binding cache from renderer/tr_backend.c.
package mq3.renderer.texture_state

const GL_TEXTURE_2D=0x0de1
const GL_TEXTURE0_ARB=0x84c0
const GL_TEXTURE1_ARB=0x84c1

struct Image texnum frameUsed end struct
struct Services bindTextureFn activeTextureFn clientActiveTextureFn logFn warningFn dropFn context end struct
struct State currentTextures currentTmu defaultImage dlightImage noBind frameCount services end struct

function fail(message) return error(7200,"texture state: "+message) end function
function services() return Services(void,void,void,void,void,void,void) end function
function image(texnum) return Image(texnum,0) end function

function create(host,defaultImage)
  if host==void then host=services() end if
  if defaultImage==void then return fail("default image is required") end if
  return State([0,0],0,defaultImage,void,false,0,host)
end function

function emitLog(state,message)
  if state.services.logFn!=void then state.services.logFn(state.services.context,message) end if
end function

function selectTexture(state,unit)
  if state==void then return fail("missing state") end if
  if unit!=0 and unit!=1 then
    if state.services.dropFn!=void then state.services.dropFn(state.services.context,"GL_SelectTexture: unit = "+str(unit)) end if
    return fail("unit must be zero or one")
  end if
  if state.currentTmu==unit then return false end if
  value=GL_TEXTURE0_ARB;if unit==1 then value=GL_TEXTURE1_ARB end if
  if state.services.activeTextureFn!=void then state.services.activeTextureFn(state.services.context,value) end if
  emitLog(state,"glActiveTextureARB("+str(value)+")")
  if state.services.clientActiveTextureFn!=void then state.services.clientActiveTextureFn(state.services.context,value) end if
  emitLog(state,"glClientActiveTextureARB("+str(value)+")")
  state.currentTmu=unit
  return true
end function

function requestedImage(state,requested)
  if requested!=void then return requested end if
  if state.services.warningFn!=void then state.services.warningFn(state.services.context,"GL_Bind: NULL image") end if
  return state.defaultImage
end function

function bind(state,requested)
  if state==void then return fail("missing state") end if
  selected=requestedImage(state,requested);texnum=selected.texnum
  if state.noBind and state.dlightImage!=void then texnum=state.dlightImage.texnum end if
  unit=state.currentTmu
  if state.currentTextures[unit]==texnum then return false end if
  // Baseq3 accounts the requested image even when r_nobind redirects the texnum.
  if requested!=void then requested.frameUsed=state.frameCount else selected.frameUsed=state.frameCount end if
  state.currentTextures[unit]=texnum
  if state.services.bindTextureFn!=void then state.services.bindTextureFn(state.services.context,GL_TEXTURE_2D,texnum) end if
  return true
end function

function bindMultitexture(state,image0,env0,image1,env1)
  if state==void or image0==void or image1==void then return fail("multitexture images are required") end if
  texnum0=image0.texnum;texnum1=image1.texnum
  if state.noBind and state.dlightImage!=void then texnum0=state.dlightImage.texnum;texnum1=texnum0 end if
  changed=0
  if state.currentTextures[1]!=texnum1 then
    selectTexture(state,1);image1.frameUsed=state.frameCount;state.currentTextures[1]=texnum1
    if state.services.bindTextureFn!=void then state.services.bindTextureFn(state.services.context,GL_TEXTURE_2D,texnum1) end if
    changed=changed+1
  end if
  if state.currentTextures[0]!=texnum0 then
    selectTexture(state,0);image0.frameUsed=state.frameCount;state.currentTextures[0]=texnum0
    if state.services.bindTextureFn!=void then state.services.bindTextureFn(state.services.context,GL_TEXTURE_2D,texnum0) end if
    changed=changed+1
  end if
  return changed
end function
