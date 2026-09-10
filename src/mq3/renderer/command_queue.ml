// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Front-end render command queue and the first 2D back-end commands from
// renderer/tr_cmds.c and renderer/tr_backend.c.
package mq3.renderer.command_queue
import mq3.compat.numeric as n

const RC_END_OF_LIST=0
const RC_SET_COLOR=1
const RC_STRETCH_PIC=2
const RC_DRAW_SURFS=3
const RC_DRAW_BUFFER=4
const RC_SWAP_BUFFERS=5
const RC_SCREENSHOT=6
const MAX_RENDER_COMMANDS=0x40000
const END_COMMAND_BYTES=4
const SET_COLOR_BYTES=20
const STRETCH_PIC_BYTES=40
const DRAW_BUFFER_BYTES=8
const SWAP_BUFFERS_BYTES=4

struct Command id bytes values shader end struct
struct Queue commands used registered shaderFn shaderContext end struct
struct Services set2DFn endSurfaceFn beginSurfaceFn quadFn drawBufferFn clearFn finishFn endFrameFn diagnosticFn context end struct
struct Backend color2D projection2D shader numIndexes finishCalled clearOnDrawBuffer services end struct

function fail(message) return error(7260,"render commands: "+message) end function
function services() return Services(void,void,void,void,void,void,void,void,void,void) end function
function create(shaderFn,shaderContext) return Queue([],0,true,shaderFn,shaderContext) end function
function backend(host)
  if host==void then host=services() end if
  return Backend([255,255,255,255],false,void,0,false,false,host)
end function

function allocate(queue,bytes)
  if queue==void then return fail("missing queue") end if
  if bytes<=0 then return fail("bad size "+str(bytes)) end if
  // R_GetCommandBuffer always reserves four bytes for RC_END_OF_LIST.
  if queue.used+bytes+END_COMMAND_BYTES>MAX_RENDER_COMMANDS then
    if bytes>MAX_RENDER_COMMANDS-END_COMMAND_BYTES then return fail("bad size "+str(bytes)) end if
    return false
  end if
  queue.used=queue.used+bytes
  return true
end function

function append(queue,id,bytes,values,shader)
  admitted=allocate(queue,bytes);if admitted is error then return admitted end if
  if not admitted then return false end if
  queue.commands=queue.commands+[Command(id,bytes,values,shader)]
  return true
end function

function setColor(queue,rgba)
  if queue==void or not queue.registered then return false end if
  if rgba==void then rgba=[1.0,1.0,1.0,1.0] end if
  if len(rgba)!=4 then return fail("set color requires four components") end if
  return append(queue,RC_SET_COLOR,SET_COLOR_BYTES,[rgba[0],rgba[1],rgba[2],rgba[3]],void)
end function

function stretchPic(queue,x,y,w,h,s1,t1,s2,t2,shaderHandle)
  if queue==void or not queue.registered then return false end if
  shader=shaderHandle
  if queue.shaderFn!=void then shader=queue.shaderFn(queue.shaderContext,shaderHandle) end if
  return append(queue,RC_STRETCH_PIC,STRETCH_PIC_BYTES,[x,y,w,h,s1,t1,s2,t2],shader)
end function

function drawBuffer(queue,buffer)
  if queue==void or not queue.registered then return false end if
  return append(queue,RC_DRAW_BUFFER,DRAW_BUFFER_BYTES,[buffer],void)
end function

function swapBuffers(queue)
  if queue==void or not queue.registered then return false end if
  return append(queue,RC_SWAP_BUFFERS,SWAP_BUFFERS_BYTES,[],void)
end function

function emit(state,kind,value)
  if state.services.diagnosticFn!=void then state.services.diagnosticFn(state.services.context,kind,value) end if
end function

function executeSetColor(state,command)
  color=command.values
  state.color2D=[n.trunc32(color[0]*255.0),n.trunc32(color[1]*255.0),n.trunc32(color[2]*255.0),n.trunc32(color[3]*255.0)]
  emit(state,"setColor",state.color2D)
end function

function executeStretchPic(state,command)
  if not state.projection2D then
    if state.services.set2DFn!=void then state.services.set2DFn(state.services.context) end if
    state.projection2D=true
  end if
  if command.shader!=state.shader then
    if state.numIndexes>0 and state.services.endSurfaceFn!=void then state.services.endSurfaceFn(state.services.context) end if
    state.numIndexes=0
    if state.services.beginSurfaceFn!=void then state.services.beginSurfaceFn(state.services.context,command.shader,0) end if
    state.shader=command.shader
  end if
  v=command.values;x=v[0];y=v[1];w=v[2];h=v[3];s1=v[4];t1=v[5];s2=v[6];t2=v[7]
  vertices=[[x,y,0.0],[x+w,y,0.0],[x+w,y+h,0.0],[x,y+h,0.0]]
  texcoords=[[s1,t1],[s2,t1],[s2,t2],[s1,t2]]
  base=n.quotient(state.numIndexes,6)*4
  indexes=[base+3,base,base+2,base+2,base,base+1]
  if state.services.quadFn!=void then state.services.quadFn(state.services.context,command.shader,vertices,texcoords,indexes,state.color2D) end if
  state.numIndexes=state.numIndexes+6
end function

function executeDrawBuffer(state,command)
  if state.services.drawBufferFn!=void then state.services.drawBufferFn(state.services.context,command.values[0]) end if
  if state.clearOnDrawBuffer and state.services.clearFn!=void then state.services.clearFn(state.services.context,1.0,0.0,0.5,1.0) end if
end function

function executeSwapBuffers(state)
  if state.numIndexes>0 and state.services.endSurfaceFn!=void then state.services.endSurfaceFn(state.services.context) end if
  state.numIndexes=0;state.shader=void
  if not state.finishCalled and state.services.finishFn!=void then state.services.finishFn(state.services.context) end if
  if state.services.endFrameFn!=void then state.services.endFrameFn(state.services.context) end if
  state.projection2D=false
end function

function execute(state,queue)
  if state==void or queue==void then return fail("missing backend or queue") end if
  count=0
  for each command in queue.commands
    if command.id==RC_SET_COLOR then executeSetColor(state,command)
    else if command.id==RC_STRETCH_PIC then executeStretchPic(state,command)
    else if command.id==RC_DRAW_BUFFER then executeDrawBuffer(state,command)
    else if command.id==RC_SWAP_BUFFERS then executeSwapBuffers(state)
    else if command.id==RC_END_OF_LIST then return count
    else return fail("unknown command "+str(command.id))
    end if
    count=count+1
  end for
  return count
end function

function reset(queue) queue.commands=[];queue.used=0 end function
