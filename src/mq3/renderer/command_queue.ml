// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Front-end render command queue and the first 2D back-end commands from
// renderer/tr_cmds.c and renderer/tr_backend.c.
package mq3.renderer.command_queue
import mq3.compat.numeric as n
import std.ds.list as lists

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

/// Data record for `mq3.renderer.command_queue.Command`; groups `id`, `bytes`, `values`, `shader`.
struct Command id bytes values shader end struct
/// Data record for `mq3.renderer.command_queue.Queue`; groups `commands`, `used`, `registered`, `shaderFn`, `shaderContext`, `commandList`.
struct Queue commands used registered shaderFn shaderContext commandList end struct
/// Callback table for `mq3.renderer.command_queue.Services`; exposes `set2DFn`, `endSurfaceFn`, `beginSurfaceFn`, `quadFn`, `drawBufferFn`, `clearFn`, and 4 further fields.
struct Services set2DFn endSurfaceFn beginSurfaceFn quadFn drawBufferFn clearFn finishFn endFrameFn diagnosticFn context end struct
/// Data record for `mq3.renderer.command_queue.Backend`; groups `color2D`, `projection2D`, `shader`, `numIndexes`, `finishCalled`, `clearOnDrawBuffer`, and 1 further field.
struct Backend color2D projection2D shader numIndexes finishCalled clearOnDrawBuffer services end struct

/// Creates error `7260` with message `"render commands: "+message`.
/// @param message Input used in the result expression `error(7260,"render commands: "+message)`.
function fail(message) return error(7260,"render commands: "+message) end function
/// Constructs `mq3.renderer.command_queue.Services` with `set2DFn` = `void`, `endSurfaceFn` = `void`, `beginSurfaceFn` = `void`, `quadFn` = `void` and the supplied remaining values.
function services() return Services(void,void,void,void,void,void,void,void,void,void) end function
/// Constructs `mq3.renderer.command_queue.Queue` with `commands` = `[]`, `used` = `0`, `registered` = `true`, `commandList` = `void` and the supplied remaining values.
/// @param shaderFn Initial value for `mq3.renderer.command_queue.Queue.shaderFn`.
/// @param shaderContext Initial value for `mq3.renderer.command_queue.Queue.shaderContext`.
function create(shaderFn,shaderContext) return Queue([],0,true,shaderFn,shaderContext,void) end function
// Productive QVM drawing emits dozens to hundreds of commands each frame.
// Repeated array concatenation is quadratic in MiniLang, so accumulate into a
// geometric std list and expose the exact legacy array once the QVM returns.
/// @param shaderFn Initial value for `mq3.renderer.command_queue.Queue.shaderFn`.
/// @param shaderContext Initial value for `mq3.renderer.command_queue.Queue.shaderContext`.
/// @param capacity Argument 1 supplied to `std.ds.list.List.withCapacity`.
function createFast(shaderFn,shaderContext,capacity)
  if capacity<1 then capacity=1 end if
  return Queue([],0,true,shaderFn,shaderContext,lists.List.withCapacity(capacity))
end function
/// Updates `queue.commands` in `mq3.renderer.command_queue.snapshot`; returns `queue.commands`.
/// @param queue Mutable record or buffer; this call updates `queue.commands`.
function snapshot(queue)
  if queue==void then return fail("missing queue") end if
  if queue.commandList!=void then queue.commands=queue.commandList.toArray() end if
  return queue.commands
end function
/// Returns `len(queue.commands)` from `mq3.renderer.command_queue.count`; earlier branches return `0`, `queue.commandList.len()`.
/// @param queue Record providing `queue.commandList`, `queue.commands`.
function count(queue) if queue==void then return 0 else if queue.commandList!=void then return queue.commandList.len() else return len(queue.commands) end if end function
/// Returns `Back` from `mq3.renderer.command_queue.backend`.
/// @param host Value used for `mq3.renderer.command_queue.Backend.services`.
function backend(host)
  if host==void then host=services() end if
  return Backend([255,255,255,255],false,void,0,false,false,host)
end function

/// Updates `queue.used` in `mq3.renderer.command_queue.allocate`; returns `true`.
/// @param queue Mutable record or buffer; this call updates `queue.used`.
/// @param bytes Input tested by `bytes<=0`.
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

/// Updates `queue.commands` in `mq3.renderer.command_queue.append`; returns `true`.
/// @param queue Mutable record or buffer; this call updates `queue.commands`.
/// @param id Value used for `mq3.renderer.command_queue.Command.id`.
/// @param bytes Value forwarded as `bytes` to `mq3.renderer.command_queue.allocate`.
/// @param values Value used for `mq3.renderer.command_queue.Command.values`.
/// @param shader Value used for `mq3.renderer.command_queue.Command.shader`.
function append(queue,id,bytes,values,shader)
  admitted=allocate(queue,bytes);if admitted is error then return admitted end if
  if not admitted then return false end if
  command=Command(id,bytes,values,shader)
  if queue.commandList!=void then queue.commandList.add(command) else queue.commands=queue.commands+[command] end if
  return true
end function

/// Queues four-component draw color, substituting opaque white when no color is supplied.
/// @param queue Record providing `queue.registered`.
/// @param rgba Indexed input read at `0`, `1`, `2`, `3`.
function setColor(queue,rgba)
  if queue==void or not queue.registered then return false end if
  if rgba==void then rgba=[1.0,1.0,1.0,1.0] end if
  if len(rgba)!=4 then return fail("set color requires four components") end if
  return append(queue,RC_SET_COLOR,SET_COLOR_BYTES,[rgba[0],rgba[1],rgba[2],rgba[3]],void)
end function

/// Resolves the shader handle and queues a stretch-picture command with eight geometry/UV values.
/// @param queue Record providing `queue.registered`, `queue.shaderFn`, `queue.shaderContext`.
/// @param values Value forwarded as `values` to `mq3.renderer.command_queue.append`.
/// @param shaderHandle Argument 2 supplied to `queue.shaderFn`.
function stretchPicValues(queue,values,shaderHandle)
  if queue==void or not queue.registered then return false end if
  if values==void or len(values)!=8 then return fail("stretch picture requires eight values") end if
  shader=shaderHandle
  if queue.shaderFn!=void then shader=queue.shaderFn(queue.shaderContext,shaderHandle) end if
  return append(queue,RC_STRETCH_PIC,STRETCH_PIC_BYTES,values,shader)
end function
/// Calls `mq3.renderer.command_queue.stretchPicValues` with `(queue,[x,y,w,h,s1,t1,s2,t2],shaderHandle)` and returns its result.
/// @param queue Value forwarded as `queue` to `mq3.renderer.command_queue.stretchPicValues`.
/// @param x Input used in the result expression `stretchPicValues(queue,[x,y,w,h,s1,t1,s2,t2],shaderHandle)`.
/// @param y Input used in the result expression `stretchPicValues(queue,[x,y,w,h,s1,t1,s2,t2],shaderHandle)`.
/// @param w Input used in the result expression `stretchPicValues(queue,[x,y,w,h,s1,t1,s2,t2],shaderHandle)`.
/// @param h Input used in the result expression `stretchPicValues(queue,[x,y,w,h,s1,t1,s2,t2],shaderHandle)`.
/// @param s1 Input used in the result expression `stretchPicValues(queue,[x,y,w,h,s1,t1,s2,t2],shaderHandle)`.
/// @param t1 Input used in the result expression `stretchPicValues(queue,[x,y,w,h,s1,t1,s2,t2],shaderHandle)`.
/// @param s2 Input used in the result expression `stretchPicValues(queue,[x,y,w,h,s1,t1,s2,t2],shaderHandle)`.
/// @param t2 Input used in the result expression `stretchPicValues(queue,[x,y,w,h,s1,t1,s2,t2],shaderHandle)`.
/// @param shaderHandle Value forwarded as `shaderHandle` to `mq3.renderer.command_queue.stretchPicValues`.
function stretchPic(queue,x,y,w,h,s1,t1,s2,t2,shaderHandle) return stretchPicValues(queue,[x,y,w,h,s1,t1,s2,t2],shaderHandle) end function

/// Returns `app` from `mq3.renderer.command_queue.drawBuffer`; earlier branches return `false`.
/// @param queue Record providing `queue.registered`.
/// @param buffer Input used in the result expression `append(queue,RC_DRAW_BUFFER,DRAW_BUFFER_BYTES,[buffer],void)`.
function drawBuffer(queue,buffer)
  if queue==void or not queue.registered then return false end if
  return append(queue,RC_DRAW_BUFFER,DRAW_BUFFER_BYTES,[buffer],void)
end function

/// Returns `app` from `mq3.renderer.command_queue.swapBuffers`; earlier branches return `false`.
/// @param queue Record providing `queue.registered`.
function swapBuffers(queue)
  if queue==void or not queue.registered then return false end if
  return append(queue,RC_SWAP_BUFFERS,SWAP_BUFFERS_BYTES,[],void)
end function

/// Sends a renderer-backend diagnostic event through the optional diagnostic service callback.
/// @param state Record providing `state.services`.
/// @param kind Argument 2 supplied to `state.services.diagnosticFn`.
/// @param value Argument 3 supplied to `state.services.diagnosticFn`.
function emit(state,kind,value)
  if state.services.diagnosticFn!=void then state.services.diagnosticFn(state.services.context,kind,value) end if
end function

/// Updates `state.color2D` in `mq3.renderer.command_queue.executeSetColor`.
/// @param state Mutable record or buffer; this call updates `state.color2D`.
/// @param command Record providing `command.values`.
function executeSetColor(state,command)
  color=command.values
  state.color2D=[n.trunc32(color[0]*255.0),n.trunc32(color[1]*255.0),n.trunc32(color[2]*255.0),n.trunc32(color[3]*255.0)]
  emit(state,"setColor",state.color2D)
end function

/// Updates `state.projection2D`, `state.numIndexes`, `state.shader` in `mq3.renderer.command_queue.executeStretchPic`.
/// @param state Mutable record or buffer; this call updates `state.projection2D`, `state.numIndexes`, `state.shader`.
/// @param command Record providing `command.shader`, `command.values`.
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

/// Selects the requested draw buffer and optionally clears it through backend service callbacks.
/// @param state Record providing `state.services`, `state.clearOnDrawBuffer`.
/// @param command Record providing `command.values`.
function executeDrawBuffer(state,command)
  if state.services.drawBufferFn!=void then state.services.drawBufferFn(state.services.context,command.values[0]) end if
  if state.clearOnDrawBuffer and state.services.clearFn!=void then state.services.clearFn(state.services.context,1.0,0.0,0.5,1.0) end if
end function

/// Updates `state.numIndexes`, `state.shader`, `state.projection2D` in `mq3.renderer.command_queue.executeSwapBuffers`.
/// @param state Mutable record or buffer; this call updates `state.numIndexes`, `state.shader`, `state.projection2D`.
function executeSwapBuffers(state)
  if state.numIndexes>0 and state.services.endSurfaceFn!=void then state.services.endSurfaceFn(state.services.context) end if
  state.numIndexes=0;state.shader=void
  if not state.finishCalled and state.services.finishFn!=void then state.services.finishFn(state.services.context) end if
  if state.services.endFrameFn!=void then state.services.endFrameFn(state.services.context) end if
  state.projection2D=false
end function

/// Snapshots and executes queued renderer commands in order, dispatching each recognized command kind.
/// @param state Value forwarded as `state` to `mq3.renderer.command_queue.executeSetColor`.
/// @param queue Value forwarded as `queue` to `mq3.renderer.command_queue.snapshot`.
function execute(state,queue)
  if state==void or queue==void then return fail("missing backend or queue") end if
  executed=0;commands=snapshot(queue)
  for each command in commands
    if command.id==RC_SET_COLOR then executeSetColor(state,command)
    else if command.id==RC_STRETCH_PIC then executeStretchPic(state,command)
    else if command.id==RC_DRAW_BUFFER then executeDrawBuffer(state,command)
    else if command.id==RC_SWAP_BUFFERS then executeSwapBuffers(state)
    else if command.id==RC_END_OF_LIST then return executed
    else return fail("unknown command "+str(command.id))
    end if
    executed=executed+1
  end for
  return executed
end function

/// Updates `queue.commands`, `queue.used` in `mq3.renderer.command_queue.reset`.
/// @param queue Mutable record or buffer; this call updates `queue.commands`, `queue.used`.
function reset(queue) queue.commands=[];if queue.commandList!=void then queue.commandList.clear() end if;queue.used=0 end function
