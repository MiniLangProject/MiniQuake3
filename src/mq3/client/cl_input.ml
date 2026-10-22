// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native file adapter for code/client/cl_input.c.
package mq3.client.cl_input

import mq3.client.input_command as input
import mq3.client.send_cmd as send
import mq3.client.command_ring as commandRing
import mq3.qcommon.command_buffer as command

const KEYCATCH_UI=2
const KEYCATCH_CGAME=8

// The callbacks are the only VM/host boundary in this module.  Supplying void
// suppresses the corresponding side effect, which makes deterministic native
// and headless clients use the same input state machine as the windowed host.
struct Host uiMouseFn cgameMouseFn debugGraphFn printFn context end struct
struct State inputState config sendState sendHost commandState host frameTime frameMsec serverTime weapon cgameSensitivity keyCatchers anyKeyDown deltaPitch debugMove initialized end struct

function hostServices() return Host(void,void,void,void,void) end function
function create(commandState,sendState,sendHost)
  return State(input.create(0.0,0.0,0.0),input.defaults(),sendState,sendHost,commandState,hostServices(),0,1,0,0,1.0,0,false,0,0,false)
end function
function emit(state,text) if state.host!=void and state.host.printFn!=void then state.host.printFn(state.host.context,text) end if;return void end function
function parseArg(commandState,index,fallback) if command.argc(commandState)<=index then return fallback end if;return atoi(command.argv(commandState,index)) end function

function IN_KeyDown(state,value,key,time)
  if state==void or value==void then return error(7740,"cl_input: missing key-down state") end if
  before0=value.down0;before1=value.down1;result=input.keyDown(value,key,time)
  if not result and value.down0==before0 and value.down1==before1 and value.active and key!=before0 and key!=before1 and before0!=0 and before1!=0 then emit(state,"Three keys down for a button!\n") end if
  return result
end function
function IN_KeyUp(state,value,key,time) if state==void or value==void then return error(7740,"cl_input: missing key-up state") end if;return input.keyUp(value,key,time,state.frameMsec) end function
function CL_KeyState(state,value) if state==void then return 0.0 end if;return input.keyState(value,state.frameTime,state.frameMsec) end function

function IN_MLookDown(state,key,time) state.inputState.mlooking=true;return true end function
function IN_MLookUp(state,key,time) state.inputState.mlooking=false;if not state.config.freelook then IN_CenterView(state) end if;return true end function
function IN_CenterView(state) state.inputState.viewangles[0]=0.0-(state.deltaPitch*360.0/65536.0);return void end function

function IN_UpDown(state,key,time) return IN_KeyDown(state,state.inputState.up,key,time) end function
function IN_UpUp(state,key,time) return IN_KeyUp(state,state.inputState.up,key,time) end function
function IN_DownDown(state,key,time) return IN_KeyDown(state,state.inputState.down,key,time) end function
function IN_DownUp(state,key,time) return IN_KeyUp(state,state.inputState.down,key,time) end function
function IN_LeftDown(state,key,time) return IN_KeyDown(state,state.inputState.left,key,time) end function
function IN_LeftUp(state,key,time) return IN_KeyUp(state,state.inputState.left,key,time) end function
function IN_RightDown(state,key,time) return IN_KeyDown(state,state.inputState.right,key,time) end function
function IN_RightUp(state,key,time) return IN_KeyUp(state,state.inputState.right,key,time) end function
function IN_ForwardDown(state,key,time) return IN_KeyDown(state,state.inputState.forward,key,time) end function
function IN_ForwardUp(state,key,time) return IN_KeyUp(state,state.inputState.forward,key,time) end function
function IN_BackDown(state,key,time) return IN_KeyDown(state,state.inputState.back,key,time) end function
function IN_BackUp(state,key,time) return IN_KeyUp(state,state.inputState.back,key,time) end function
function IN_LookupDown(state,key,time) return IN_KeyDown(state,state.inputState.lookup,key,time) end function
function IN_LookupUp(state,key,time) return IN_KeyUp(state,state.inputState.lookup,key,time) end function
function IN_LookdownDown(state,key,time) return IN_KeyDown(state,state.inputState.lookdown,key,time) end function
function IN_LookdownUp(state,key,time) return IN_KeyUp(state,state.inputState.lookdown,key,time) end function
function IN_MoveleftDown(state,key,time) return IN_KeyDown(state,state.inputState.moveleft,key,time) end function
function IN_MoveleftUp(state,key,time) return IN_KeyUp(state,state.inputState.moveleft,key,time) end function
function IN_MoverightDown(state,key,time) return IN_KeyDown(state,state.inputState.moveright,key,time) end function
function IN_MoverightUp(state,key,time) return IN_KeyUp(state,state.inputState.moveright,key,time) end function
function IN_SpeedDown(state,key,time) return IN_KeyDown(state,state.inputState.speed,key,time) end function
function IN_SpeedUp(state,key,time) return IN_KeyUp(state,state.inputState.speed,key,time) end function
function IN_StrafeDown(state,key,time) return IN_KeyDown(state,state.inputState.strafe,key,time) end function
function IN_StrafeUp(state,key,time) return IN_KeyUp(state,state.inputState.strafe,key,time) end function

function IN_Button0Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[0],key,time) end function
function IN_Button0Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[0],key,time) end function
function IN_Button1Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[1],key,time) end function
function IN_Button1Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[1],key,time) end function
function IN_Button2Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[2],key,time) end function
function IN_Button2Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[2],key,time) end function
function IN_Button3Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[3],key,time) end function
function IN_Button3Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[3],key,time) end function
function IN_Button4Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[4],key,time) end function
function IN_Button4Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[4],key,time) end function
function IN_Button5Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[5],key,time) end function
function IN_Button5Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[5],key,time) end function
function IN_Button6Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[6],key,time) end function
function IN_Button6Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[6],key,time) end function
function IN_Button7Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[7],key,time) end function
function IN_Button7Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[7],key,time) end function
function IN_Button8Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[8],key,time) end function
function IN_Button8Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[8],key,time) end function
function IN_Button9Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[9],key,time) end function
function IN_Button9Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[9],key,time) end function
function IN_Button10Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[10],key,time) end function
function IN_Button10Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[10],key,time) end function
function IN_Button11Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[11],key,time) end function
function IN_Button11Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[11],key,time) end function
function IN_Button12Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[12],key,time) end function
function IN_Button12Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[12],key,time) end function
function IN_Button13Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[13],key,time) end function
function IN_Button13Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[13],key,time) end function
function IN_Button14Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[14],key,time) end function
function IN_Button14Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[14],key,time) end function
function IN_Button15Down(state,key,time) return IN_KeyDown(state,state.inputState.buttons[15],key,time) end function
function IN_Button15Up(state,key,time) return IN_KeyUp(state,state.inputState.buttons[15],key,time) end function
function IN_ButtonDown(state,key,time) return IN_Button1Down(state,key,time) end function
function IN_ButtonUp(state,key,time) return IN_Button1Up(state,key,time) end function

function CL_AdjustAngles(state) return input.adjustAngles(state.inputState,state.config,state.frameTime,state.frameMsec) end function
function CL_KeyMove(state,value) return input.keyMove(state.inputState,state.config,value,state.frameTime,state.frameMsec) end function
function CL_MouseEvent(state,dx,dy,time)
  if (state.keyCatchers&KEYCATCH_UI)!=0 then if state.host.uiMouseFn!=void then state.host.uiMouseFn(state.host.context,dx,dy) end if;return "ui" end if
  if (state.keyCatchers&KEYCATCH_CGAME)!=0 then if state.host.cgameMouseFn!=void then state.host.cgameMouseFn(state.host.context,dx,dy) end if;return "cgame" end if
  result=input.accumulateMouse(state.inputState,dx,dy);if result is error then return result end if;return "game"
end function
function CL_JoystickEvent(state,axis,value,time)
  // The original validates only the axis. Native Win32 normally supplies the
  // -127..127 range, but retaining arbitrary host values is ABI-significant.
  if state==void or axis<0 or axis>=input.MAX_JOYSTICK_AXIS then return error(7740,"CL_JoystickEvent: bad axis "+str(axis)) end if
  state.inputState.joystickAxis[axis]=value;return void
end function
function CL_JoystickMove(state,value) return input.joystickMove(state.inputState,state.config,value,state.frameMsec) end function
function CL_MouseMove(state,value) return input.mouseMove(state.inputState,state.config,value,state.frameMsec,state.cgameSensitivity) end function
function CL_CmdButtons(state,value) return input.commandButtons(state.inputState,value,state.keyCatchers,state.anyKeyDown) end function
function CL_FinishMove(state,value)
  value.weapon=state.weapon&255;value.serverTime=state.serverTime
  value.angles=[input.angleShort(state.inputState.viewangles[0]),input.angleShort(state.inputState.viewangles[1]),input.angleShort(state.inputState.viewangles[2])]
  value.viewangles=[state.inputState.viewangles[0],state.inputState.viewangles[1],state.inputState.viewangles[2]];return void
end function
function magnitude(value) if value<0.0 then return 0.0-value end if;return value end function
function CL_CreateCmd(state)
  oldPitch=state.inputState.viewangles[0];oldYaw=state.inputState.viewangles[1];CL_AdjustAngles(state)
  value=input.Command([0,0,0],0,state.weapon&255,0,0,0,state.serverTime,[0.0,0.0,0.0]);CL_CmdButtons(state,value);CL_KeyMove(state,value);CL_MouseMove(state,value);CL_JoystickMove(state,value)
  if state.inputState.viewangles[0]-oldPitch>90.0 then state.inputState.viewangles[0]=oldPitch+90.0 else if oldPitch-state.inputState.viewangles[0]>90.0 then state.inputState.viewangles[0]=oldPitch-90.0 end if
  CL_FinishMove(state,value)
  if state.host.debugGraphFn!=void and state.debugMove==1 then state.host.debugGraphFn(state.host.context,magnitude(state.inputState.viewangles[1]-oldYaw),0) end if
  if state.host.debugGraphFn!=void and state.debugMove==2 then state.host.debugGraphFn(state.host.context,magnitude(state.inputState.viewangles[0]-oldPitch),0) end if
  return value
end function

function CL_CreateNewCommands(state,frameTime)
  if state==void or state.sendState==void then return error(7740,"cl_input: missing send state") end if
  advanced=commandRing.advance(state.sendState.connectionState,frameTime,state.sendState.oldFrameTime,state.sendState.cmdNumber)
  if not advanced.created then return false end if
  state.frameTime=frameTime;state.frameMsec=advanced.frameMsec;state.sendState.frameMsec=advanced.frameMsec;state.sendState.oldFrameTime=advanced.oldFrameTime;state.sendState.cmdNumber=advanced.commandNumber
  value=CL_CreateCmd(state);commandRing.store(state.sendState.commands,state.sendState.cmdNumber,send.commandCopy(value));return true
end function
function CL_ReadyToSendPacket(state) return send.ready(state.sendState,state.sendHost) end function
function CL_WritePacket(state) return send.writePacket(state.sendState,state.sendHost) end function
function CL_SendCmd(state,frameTime)
  if state==void or state.sendState==void or state.sendHost==void then return error(7740,"cl_input: missing send services") end if
  if state.sendState.connectionState<send.CA_CONNECTED then return "disconnected" end if
  if state.sendState.serverRunning and state.sendState.serverPaused and state.sendState.clientPaused then return "paused" end if
  created=CL_CreateNewCommands(state,frameTime);if created is error then return created end if
  if not CL_ReadyToSendPacket(state) then return "choked" end if
  return CL_WritePacket(state)
end function

function dispatchInputCommand(commandState,state)
  name=command.argv(commandState,0);down=len(bytes(name))>0 and bytes(name)[0]==43
  if command.sameInsensitive(name,"centerview") then return IN_CenterView(state) end if
  key=parseArg(commandState,1,-1);time=parseArg(commandState,2,0);if not down and command.argc(commandState)<=1 then key=0 end if
  if command.sameInsensitive(name,"+mlook") then return IN_MLookDown(state,key,time) end if;if command.sameInsensitive(name,"-mlook") then return IN_MLookUp(state,key,time) end if
  target=void
  if command.sameInsensitive(name,"+moveup") or command.sameInsensitive(name,"-moveup") then target=state.inputState.up end if;if command.sameInsensitive(name,"+movedown") or command.sameInsensitive(name,"-movedown") then target=state.inputState.down end if
  if command.sameInsensitive(name,"+left") or command.sameInsensitive(name,"-left") then target=state.inputState.left end if;if command.sameInsensitive(name,"+right") or command.sameInsensitive(name,"-right") then target=state.inputState.right end if
  if command.sameInsensitive(name,"+forward") or command.sameInsensitive(name,"-forward") then target=state.inputState.forward end if;if command.sameInsensitive(name,"+back") or command.sameInsensitive(name,"-back") then target=state.inputState.back end if
  if command.sameInsensitive(name,"+lookup") or command.sameInsensitive(name,"-lookup") then target=state.inputState.lookup end if;if command.sameInsensitive(name,"+lookdown") or command.sameInsensitive(name,"-lookdown") then target=state.inputState.lookdown end if
  if command.sameInsensitive(name,"+strafe") or command.sameInsensitive(name,"-strafe") then target=state.inputState.strafe end if;if command.sameInsensitive(name,"+moveleft") or command.sameInsensitive(name,"-moveleft") then target=state.inputState.moveleft end if
  if command.sameInsensitive(name,"+moveright") or command.sameInsensitive(name,"-moveright") then target=state.inputState.moveright end if;if command.sameInsensitive(name,"+speed") or command.sameInsensitive(name,"-speed") then target=state.inputState.speed end if
  if command.sameInsensitive(name,"+attack") or command.sameInsensitive(name,"-attack") or command.sameInsensitive(name,"+button0") or command.sameInsensitive(name,"-button0") then target=state.inputState.buttons[0] end if
  for index=1 to 14 if command.sameInsensitive(name,"+button"+str(index)) or command.sameInsensitive(name,"-button"+str(index)) then target=state.inputState.buttons[index] end if end for
  if target==void then return false end if;if down then return IN_KeyDown(state,target,key,time) end if;return IN_KeyUp(state,target,key,time)
end function
function inputCommandNames()
  names=["centerview","+moveup","-moveup","+movedown","-movedown","+left","-left","+right","-right","+forward","-forward","+back","-back","+lookup","-lookup","+lookdown","-lookdown","+strafe","-strafe","+moveleft","-moveleft","+moveright","-moveright","+speed","-speed","+attack","-attack","+button0","-button0"]
  for index=1 to 14 names=names+["+button"+str(index),"-button"+str(index)] end for
  return names+["+mlook","-mlook"]
end function
function CL_InitInput(state)
  if state==void or state.commandState==void then return error(7740,"cl_input: missing command state") end if
  if state.initialized then return true end if
  for each name in inputCommandNames() if not command.addContextCommand(state.commandState,name,dispatchInputCommand,state) then return error(7740,"cl_input command already registered: "+name) end if end for
  state.initialized=true;return true
end function

extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
