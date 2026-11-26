// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Window-system input boundary with Baseq3 Sys_QueEvent ring semantics.
package mq3.platform.input_events

const SE_NONE=0
const SE_KEY=1
const SE_CHAR=2
const SE_MOUSE=3
const SE_JOYSTICK_AXIS=4
const MAX_QUED_EVENTS=256

// Baseq3 key numbers from keys.h. A wheel notch is represented as a complete
// key press so bindings cannot remain stuck when a host only reports deltas.
const K_MWHEELDOWN=183
const K_MWHEELUP=184

/// Data record for `mq3.platform.input_events.Event`; groups `time`, `type`, `value`, `value2`.
struct Event time type value value2 end struct
/// Data record for `mq3.platform.input_events.Queue`; groups `events`, `head`, `tail`, `overflows`, `clockFn`, `clockContext`.
struct Queue events head tail overflows clockFn clockContext end struct
/// Callback table for `mq3.platform.input_events.Handlers`; exposes `context`, `keyFn`, `charFn`, `mouseFn`, `joystickFn`.
struct Handlers context keyFn charFn mouseFn joystickFn end struct

/// Constructs `mq3.platform.input_events.Queue` with `events` = `array(MAX_QUED_EVENTS,void)`, `head` = `0`, `tail` = `0`, `overflows` = `0` and the supplied remaining values.
/// @param clockContext Initial value for `mq3.platform.input_events.Queue.clockContext`.
/// @param clockFn Initial value for `mq3.platform.input_events.Queue.clockFn`.
function create(clockContext,clockFn)
  return Queue(array(MAX_QUED_EVENTS,void),0,0,0,clockFn,clockContext)
end function

/// Returns `queue.head-queue.tail` from `mq3.platform.input_events.queued`; earlier branches return `0`.
/// @param queue Record providing `queue.head`, `queue.tail`.
function queued(queue)
  if queue==void then return 0 end if
  return queue.head-queue.tail
end function

// Exact ownership rule of Sys_QueEvent for input-only events: overwrite the
// oldest slot on overflow, then append at the current head position.
/// @param queue Mutable record or buffer; this call updates `queue.tail`, `queue.overflows`, `queue.events[index]`, `queue.head`.
/// @param time Value used for `mq3.platform.input_events.Event.time`.
/// @param type Value used for `mq3.platform.input_events.Event.type`.
/// @param value Value used for `mq3.platform.input_events.Event.value`.
/// @param value2 Value used for `mq3.platform.input_events.Event.value2`.
function queueEvent(queue,time,type,value,value2)
  if queue==void then return error(7100,"input events: missing queue") end if
  if typeof(time)!="int" or time<0 then return error(7100,"input events: invalid time") end if
  if type<SE_KEY or type>SE_JOYSTICK_AXIS then return error(7100,"input events: invalid type") end if
  index=queue.head&(MAX_QUED_EVENTS-1)
  if queue.head-queue.tail>=MAX_QUED_EVENTS then
    queue.tail=queue.tail+1;queue.overflows=queue.overflows+1
  end if
  if time==0 then
    if queue.clockFn==void then return error(7100,"input events: missing clock") end if
    time=queue.clockFn(queue.clockContext)
    if typeof(time)!="int" or time<0 then return error(7100,"input events: invalid clock") end if
  end if
  queue.events[index]=Event(time,type,value,value2);queue.head=queue.head+1
  return void
end function

/// Returns `queueEvent(queue,time,SE_KEY,key,value)` from `mq3.platform.input_events.keyEvent`; earlier branches return `error(7100,"input events: invalid key")`.
/// @param queue Value forwarded as `queue` to `mq3.platform.input_events.queueEvent`.
/// @param time Value forwarded as `time` to `mq3.platform.input_events.queueEvent`.
/// @param key Value forwarded as `value` to `mq3.platform.input_events.queueEvent`.
/// @param down Input tested by `down`.
function keyEvent(queue,time,key,down)
  if typeof(key)!="int" then return error(7100,"input events: invalid key") end if
  value=0;if down then value=1 end if
  return queueEvent(queue,time,SE_KEY,key,value)
end function

/// Returns `queueEvent(queue,time,SE_CHAR,character,0)` from `mq3.platform.input_events.charEvent`; earlier branches return `error(7100,"input events: invalid character")`.
/// @param queue Value forwarded as `queue` to `mq3.platform.input_events.queueEvent`.
/// @param time Value forwarded as `time` to `mq3.platform.input_events.queueEvent`.
/// @param character Value forwarded as `value` to `mq3.platform.input_events.queueEvent`.
function charEvent(queue,time,character)
  if typeof(character)!="int" or character<0 then return error(7100,"input events: invalid character") end if
  return queueEvent(queue,time,SE_CHAR,character,0)
end function

/// Returns `queueEvent(queue,time,SE_MOUSE,dx,dy)` from `mq3.platform.input_events.mouseEvent`; earlier branches return `error(7100,"input events: invalid mouse delta")`, `void`.
/// @param queue Value forwarded as `queue` to `mq3.platform.input_events.queueEvent`.
/// @param time Value forwarded as `time` to `mq3.platform.input_events.queueEvent`.
/// @param dx Value forwarded as `value` to `mq3.platform.input_events.queueEvent`.
/// @param dy Value forwarded as `value2` to `mq3.platform.input_events.queueEvent`.
function mouseEvent(queue,time,dx,dy)
  if typeof(dx)!="int" or typeof(dy)!="int" then return error(7100,"input events: invalid mouse delta") end if
  if dx==0 and dy==0 then return void end if
  return queueEvent(queue,time,SE_MOUSE,dx,dy)
end function

/// Returns `queueEvent(queue,time,SE_JOYSTICK_AXIS,axis,value)` from `mq3.platform.input_events.joystickEvent`; earlier branches return `error(7100,"input events: invalid joystick value")`.
/// @param queue Value forwarded as `queue` to `mq3.platform.input_events.queueEvent`.
/// @param time Value forwarded as `time` to `mq3.platform.input_events.queueEvent`.
/// @param axis Value forwarded as `value` to `mq3.platform.input_events.queueEvent`.
/// @param value Value forwarded as `value2` to `mq3.platform.input_events.queueEvent`.
function joystickEvent(queue,time,axis,value)
  if typeof(axis)!="int" or typeof(value)!="int" or axis<0 or value<(-127) or value>127 then return error(7100,"input events: invalid joystick value") end if
  return queueEvent(queue,time,SE_JOYSTICK_AXIS,axis,value)
end function

/// Expands signed mouse-wheel steps into matching press/release key-event pairs.
/// @param queue Value forwarded as `queue` to `mq3.platform.input_events.keyEvent`.
/// @param time Value forwarded as `time` to `mq3.platform.input_events.keyEvent`.
/// @param delta Input tested by `typeof(delta)!="int"`.
function wheelEvent(queue,time,delta)
  if typeof(delta)!="int" then return error(7100,"input events: invalid wheel delta") end if
  if delta==0 then return void end if
  key=K_MWHEELUP;if delta<0 then key=K_MWHEELDOWN end if
  steps=delta;if steps<0 then steps=0-steps end if
  for step=0 to steps-1 keyEvent(queue,time,key,true);keyEvent(queue,time,key,false) end for
  return void
end function

/// Updates `queue.tail` in `mq3.platform.input_events.poll`; returns `event`.
/// @param queue Mutable record or buffer; this call updates `queue.tail`.
function poll(queue)
  if queue==void then return error(7100,"input events: missing queue") end if
  if queue.head<=queue.tail then return void end if
  index=queue.tail&(MAX_QUED_EVENTS-1);event=queue.events[index]
  queue.tail=queue.tail+1;return event
end function

/// Constructs `mq3.platform.input_events.Handlers` from `context`, `keyFn`, `charFn`, `mouseFn`, `joystickFn`.
/// @param context Initial value for `mq3.platform.input_events.Handlers.context`.
/// @param keyFn Initial value for `mq3.platform.input_events.Handlers.keyFn`.
/// @param charFn Initial value for `mq3.platform.input_events.Handlers.charFn`.
/// @param mouseFn Initial value for `mq3.platform.input_events.Handlers.mouseFn`.
/// @param joystickFn Initial value for `mq3.platform.input_events.Handlers.joystickFn`.
function handlers(context,keyFn,charFn,mouseFn,joystickFn)
  return Handlers(context,keyFn,charFn,mouseFn,joystickFn)
end function

// Productive Com_EventLoop input half. A desktop window adapter only has to
// enqueue events; engine callbacks stay independent of the native GUI API.
/// @param event Record providing `event.type`, `event.value`, `event.value2`, `event.time`.
/// @param sink Record providing `sink.keyFn`, `sink.context`, `sink.charFn`, `sink.mouseFn`, `sink.joystickFn`.
function dispatch(event,sink)
  if event==void or sink==void then return error(7101,"input events: invalid dispatch") end if
  if event.type==SE_KEY then
    if sink.keyFn!=void then sink.keyFn(sink.context,event.value,event.value2!=0,event.time) end if
  else if event.type==SE_CHAR then
    if sink.charFn!=void then sink.charFn(sink.context,event.value) end if
  else if event.type==SE_MOUSE then
    if sink.mouseFn!=void then sink.mouseFn(sink.context,event.value,event.value2,event.time) end if
  else if event.type==SE_JOYSTICK_AXIS then
    if sink.joystickFn!=void then sink.joystickFn(sink.context,event.value,event.value2,event.time) end if
  else
    return error(7101,"input events: bad event type")
  end if
  return void
end function

/// Dispatches at most maxEvents queued input events to the supplied sink and returns the dispatched count.
/// @param queue Record providing `queue.head`, `queue.tail`.
/// @param sink Value forwarded as `sink` to `mq3.platform.input_events.dispatch`.
/// @param maxEvents Input tested by `queue==void or sink==void or typeof(maxEvents)!="int" or maxEvents<0`.
function drain(queue,sink,maxEvents)
  if queue==void or sink==void or typeof(maxEvents)!="int" or maxEvents<0 then return error(7101,"input events: invalid drain") end if
  count=0
  while count<maxEvents and queue.head>queue.tail
    event=poll(queue);dispatch(event,sink);count=count+1
  end while
  return count
end function
