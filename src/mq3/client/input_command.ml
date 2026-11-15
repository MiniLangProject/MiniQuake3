// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Productive Baseq3 CL_CreateCmd input core from client/cl_input.c.
package mq3.client.input_command

import mq3.compat.numeric as n

const BUTTON_ATTACK=1
const BUTTON_TALK=2
const BUTTON_WALKING=16
const BUTTON_ANY=2048
const MAX_JOYSTICK_AXIS=16

struct Button down0 down1 downtime msec active wasPressed end struct
struct Config forwardSpeed sideSpeed upSpeed yawSpeed pitchSpeed angleSpeedKey run filter sensitivity mouseAccel mouseYaw mousePitch mouseForward mouseSide freelook end struct
struct State left right forward back lookup lookdown moveleft moveright strafe speed up down buttons mlooking viewangles mouseDx mouseDy mouseIndex joystickAxis end struct
struct Command angles buttons weapon forwardmove rightmove upmove serverTime viewangles end struct

function button() return Button(0,0,0,0,false,false) end function
function defaults() return Config(127.0,127.0,127.0,140.0,140.0,1.5,true,false,5.0,0.0,0.022,0.022,0.25,0.25,true) end function
function create(pitch,yaw,roll)
  values=[];for index=0 to 15 values=values+[button()] end for
  return State(button(),button(),button(),button(),button(),button(),button(),button(),button(),button(),button(),button(),values,false,[n.f32(pitch),n.f32(yaw),n.f32(roll)],[0,0],[0,0],0,array(MAX_JOYSTICK_AXIS,0))
end function

function clampChar(value)
  value=n.trunc32(value);if value< -128 then return -128 end if;if value>127 then return 127 end if;return value
end function
function angleShort(value) return n.trunc32(value*65536.0/360.0)&65535 end function

// IN_KeyDown/IN_KeyUp preserve two independent physical sources and exact
// sub-frame timestamps. A zero timestamp on release means half a frame.
function keyDown(value,key,time)
  if value==void or typeof(key)!="int" or typeof(time)!="int" or time<0 then return error(7700,"input command: invalid key down") end if
  if key==value.down0 or key==value.down1 then return false end if
  if value.down0==0 then value.down0=key else if value.down1==0 then value.down1=key else return false end if
  if value.active then return false end if
  value.downtime=time;value.active=true;value.wasPressed=true;return true
end function
function keyUp(value,key,time,frameMsec)
  if value==void or typeof(key)!="int" or typeof(time)!="int" or typeof(frameMsec)!="int" or time<0 or frameMsec<=0 then return error(7700,"input command: invalid key up") end if
  if key==0 then value.down0=0;value.down1=0;value.active=false;return true end if
  if value.down0==key then value.down0=0 else if value.down1==key then value.down1=0 else return false end if
  if value.down0!=0 or value.down1!=0 then return false end if
  value.active=false;if time!=0 then value.msec=value.msec+time-value.downtime else value.msec=value.msec+(frameMsec>>1) end if;return true
end function
function setPolled(value,active,time,frameMsec)
  if active and not value.active then return keyDown(value,1,time) end if
  if not active and value.active then return keyUp(value,1,time,frameMsec) end if
  return false
end function
function keyState(value,frameTime,frameMsec)
  if value==void or frameMsec<=0 then return 0.0 end if
  milliseconds=value.msec;value.msec=0
  if value.active then if value.downtime==0 then milliseconds=frameTime else milliseconds=milliseconds+frameTime-value.downtime end if;value.downtime=frameTime end if
  fraction=n.f32(milliseconds/frameMsec);if fraction<0.0 then return 0.0 end if;if fraction>1.0 then return 1.0 end if;return fraction
end function

function accumulateMouse(state,dx,dy)
  if state==void or typeof(dx)!="int" or typeof(dy)!="int" then return error(7700,"input command: invalid mouse delta") end if
  state.mouseDx[state.mouseIndex]=state.mouseDx[state.mouseIndex]+dx;state.mouseDy[state.mouseIndex]=state.mouseDy[state.mouseIndex]+dy;return void
end function
function clearMouse(state)
  if state==void then return error(7700,"input command: missing mouse state") end if
  state.mouseDx[0]=0;state.mouseDx[1]=0;state.mouseDy[0]=0;state.mouseDy[1]=0;return void
end function
function joystickEvent(state,axis,value)
  if state==void or axis<0 or axis>=MAX_JOYSTICK_AXIS or value< -127 or value>127 then return error(7700,"input command: invalid joystick axis") end if
  state.joystickAxis[axis]=value;return void
end function

function adjustAngles(state,config,frameTime,frameMsec)
  scale=0.001*frameMsec;if state.speed.active then scale=scale*config.angleSpeedKey end if
  if not state.strafe.active then state.viewangles[1]=n.f32(state.viewangles[1]-scale*config.yawSpeed*keyState(state.right,frameTime,frameMsec));state.viewangles[1]=n.f32(state.viewangles[1]+scale*config.yawSpeed*keyState(state.left,frameTime,frameMsec)) end if
  state.viewangles[0]=n.f32(state.viewangles[0]-scale*config.pitchSpeed*keyState(state.lookup,frameTime,frameMsec));state.viewangles[0]=n.f32(state.viewangles[0]+scale*config.pitchSpeed*keyState(state.lookdown,frameTime,frameMsec));return void
end function
function keyMove(state,config,command,frameTime,frameMsec)
  moveSpeed=64;if state.speed.active!=config.run then moveSpeed=127;command.buttons=command.buttons&(~BUTTON_WALKING) else command.buttons=command.buttons|BUTTON_WALKING end if
  forward=0;side=0;up=0
  if state.strafe.active then side=side+n.trunc32(moveSpeed*keyState(state.right,frameTime,frameMsec));side=side-n.trunc32(moveSpeed*keyState(state.left,frameTime,frameMsec)) end if
  side=side+n.trunc32(moveSpeed*keyState(state.moveright,frameTime,frameMsec));side=side-n.trunc32(moveSpeed*keyState(state.moveleft,frameTime,frameMsec))
  up=up+n.trunc32(moveSpeed*keyState(state.up,frameTime,frameMsec));up=up-n.trunc32(moveSpeed*keyState(state.down,frameTime,frameMsec))
  forward=forward+n.trunc32(moveSpeed*keyState(state.forward,frameTime,frameMsec));forward=forward-n.trunc32(moveSpeed*keyState(state.back,frameTime,frameMsec))
  command.forwardmove=clampChar(forward);command.rightmove=clampChar(side);command.upmove=clampChar(up);return void
end function
function mouseMove(state,config,command,frameMsec,cgameSensitivity)
  mx=0.0;my=0.0;if config.filter then mx=(state.mouseDx[0]+state.mouseDx[1])*0.5;my=(state.mouseDy[0]+state.mouseDy[1])*0.5 else mx=state.mouseDx[state.mouseIndex];my=state.mouseDy[state.mouseIndex] end if
  state.mouseIndex=state.mouseIndex^1;state.mouseDx[state.mouseIndex]=0;state.mouseDy[state.mouseIndex]=0
  rate=n.fsqrt(n.f32(mx*mx+my*my))/frameMsec;acceleration=(config.sensitivity+rate*config.mouseAccel)*cgameSensitivity;mx=mx*acceleration;my=my*acceleration
  if state.strafe.active then command.rightmove=clampChar(command.rightmove+config.mouseSide*mx) else state.viewangles[1]=n.f32(state.viewangles[1]-config.mouseYaw*mx) end if
  if (state.mlooking or config.freelook) and not state.strafe.active then state.viewangles[0]=n.f32(state.viewangles[0]+config.mousePitch*my) else command.forwardmove=clampChar(command.forwardmove-config.mouseForward*my) end if
  return void
end function
function joystickMove(state,config,command,frameMsec)
  moveSpeed=1;if state.speed.active!=config.run then moveSpeed=2 else command.buttons=command.buttons|BUTTON_WALKING end if
  angleSpeed=0.001*frameMsec;if state.speed.active then angleSpeed=angleSpeed*config.angleSpeedKey end if
  if not state.strafe.active then state.viewangles[1]=n.f32(state.viewangles[1]+angleSpeed*config.yawSpeed*state.joystickAxis[0]) else command.rightmove=clampChar(command.rightmove+state.joystickAxis[0]) end if
  if state.mlooking then state.viewangles[0]=n.f32(state.viewangles[0]+angleSpeed*config.pitchSpeed*state.joystickAxis[1]) else command.forwardmove=clampChar(command.forwardmove+state.joystickAxis[1]) end if
  command.upmove=clampChar(command.upmove+state.joystickAxis[2]);return void
end function
function commandButtons(state,command,keyCatchers,anyKeyDown)
  for index=0 to 14 if state.buttons[index].active or state.buttons[index].wasPressed then command.buttons=command.buttons|(1<<index) end if;state.buttons[index].wasPressed=false end for
  if keyCatchers!=0 then command.buttons=command.buttons|BUTTON_TALK end if;if anyKeyDown and keyCatchers==0 then command.buttons=command.buttons|BUTTON_ANY end if;return void
end function

function createCommand(state,config,frameTime,frameMsec,serverTime,weapon,cgameSensitivity,keyCatchers,anyKeyDown)
  if state==void or config==void or frameMsec<=0 then return error(7700,"input command: invalid create") end if
  oldPitch=state.viewangles[0];adjustAngles(state,config,frameTime,frameMsec)
  command=Command([0,0,0],0,weapon&255,0,0,0,serverTime,[0.0,0.0,0.0]);commandButtons(state,command,keyCatchers,anyKeyDown);keyMove(state,config,command,frameTime,frameMsec);mouseMove(state,config,command,frameMsec,cgameSensitivity);joystickMove(state,config,command,frameMsec)
  if state.viewangles[0]-oldPitch>90.0 then state.viewangles[0]=oldPitch+90.0 else if oldPitch-state.viewangles[0]>90.0 then state.viewangles[0]=oldPitch-90.0 end if
  command.angles=[angleShort(state.viewangles[0]),angleShort(state.viewangles[1]),angleShort(state.viewangles[2])];command.viewangles=[state.viewangles[0],state.viewangles[1],state.viewangles[2]];return command
end function
