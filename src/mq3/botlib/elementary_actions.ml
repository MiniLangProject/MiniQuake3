// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Client-local Elementary Actions state matching code/botlib/be_ea.c.
package mq3.botlib.elementary_actions

import mq3.compat.numeric as n

const MAX_USERMOVE=400.0
const INPUT_SIZE=40

const ACTION_ATTACK=0x0000001
const ACTION_USE=0x0000002
const ACTION_RESPAWN=0x0000008
const ACTION_JUMP=0x0000010
const ACTION_MOVEUP=0x0000020
const ACTION_CROUCH=0x0000080
const ACTION_MOVEDOWN=0x0000100
const ACTION_MOVEFORWARD=0x0000200
const ACTION_MOVEBACK=0x0000800
const ACTION_MOVELEFT=0x0001000
const ACTION_MOVERIGHT=0x0002000
const ACTION_DELAYEDJUMP=0x0008000
const ACTION_TALK=0x0010000
const ACTION_GESTURE=0x0020000
const ACTION_WALK=0x0080000
const ACTION_AFFIRMATIVE=0x0100000
const ACTION_NEGATIVE=0x0200000
const ACTION_GETFLAG=0x0800000
const ACTION_GUARDBASE=0x1000000
const ACTION_PATROL=0x2000000
const ACTION_FOLLOWME=0x8000000

// Private be_ea.c latch. Its collision with ACTION_CROUCH is original.
const ACTION_JUMPEDLASTFRAME=128

const OP_SAY=400
const OP_SAY_TEAM=401
const OP_COMMAND=402
const OP_ACTION=403
const OP_GESTURE=404
const OP_TALK=405
const OP_ATTACK=406
const OP_USE=407
const OP_RESPAWN=408
const OP_CROUCH=409
const OP_MOVE_UP=410
const OP_MOVE_DOWN=411
const OP_MOVE_FORWARD=412
const OP_MOVE_BACK=413
const OP_MOVE_LEFT=414
const OP_MOVE_RIGHT=415
const OP_SELECT_WEAPON=416
const OP_JUMP=417
const OP_DELAYED_JUMP=418
const OP_MOVE=419
const OP_VIEW=420
const OP_END_REGULAR=421
const OP_GET_INPUT=422
const OP_RESET_INPUT=423

struct ElementaryInput thinktime dir speed viewangles actionflags weapon end struct
struct State initialized maxClients inputs commandFn context commandCount end struct

function fail(message) return error(7540,"Elementary Actions: "+message) end function
function emptyInput() return ElementaryInput(0.0,[0.0,0.0,0.0],0.0,[0.0,0.0,0.0],0,0) end function
function copyInput(value) return ElementaryInput(value.thinktime,[value.dir[0],value.dir[1],value.dir[2]],value.speed,[value.viewangles[0],value.viewangles[1],value.viewangles[2]],value.actionflags,value.weapon) end function
function create(maxClients,commandFn,context)
  if maxClients<0 then return fail("negative client count") end if
  values=array(maxClients,void);if maxClients>0 then for client=0 to maxClients-1 values[client]=emptyInput() end for end if
  return State(true,maxClients,values,commandFn,context,0)
end function
function shutdown(state) if state!=void then state.initialized=false;state.inputs=[];state.maxClients=0 end if;return 0 end function
function validClient(state,client) return state!=void and state.initialized and client>=0 and client<state.maxClients end function
function inputAt(state,client) if not validClient(state,client) then return fail("client outside input table") end if;return state.inputs[client] end function
function emit(state,client,text)
  if not validClient(state,client) then return fail("client outside input table") end if
  if state.commandFn==void then return fail("client command callback missing") end if
  result=state.commandFn(state.context,client,text);if result is error then return result end if;state.commandCount=state.commandCount+1;return 0
end function
function say(state,client,text) return emit(state,client,"say "+text) end function
function sayTeam(state,client,text) return emit(state,client,"say_team "+text) end function
function command(state,client,text) return emit(state,client,text) end function
function tell(state,client,clientTo,text) return emit(state,client,"tell "+str(clientTo)+", "+text) end function
function useItem(state,client,item) return emit(state,client,"use "+item) end function
function dropItem(state,client,item) return emit(state,client,"drop "+item) end function
function useInv(state,client,inventory) return emit(state,client,"invuse "+inventory) end function
function dropInv(state,client,inventory) return emit(state,client,"invdrop "+inventory) end function

function action(state,client,bits) value=inputAt(state,client);if value is error then return value end if;value.actionflags=value.actionflags|bits;return 0 end function
function gesture(state,client) return action(state,client,ACTION_GESTURE) end function
function talk(state,client) return action(state,client,ACTION_TALK) end function
function attack(state,client) return action(state,client,ACTION_ATTACK) end function
function useAction(state,client) return action(state,client,ACTION_USE) end function
function respawn(state,client) return action(state,client,ACTION_RESPAWN) end function
function crouch(state,client) return action(state,client,ACTION_CROUCH) end function
function walk(state,client) return action(state,client,ACTION_WALK) end function
function moveUp(state,client) return action(state,client,ACTION_MOVEUP) end function
function moveDown(state,client) return action(state,client,ACTION_MOVEDOWN) end function
function moveForward(state,client) return action(state,client,ACTION_MOVEFORWARD) end function
function moveBack(state,client) return action(state,client,ACTION_MOVEBACK) end function
function moveLeft(state,client) return action(state,client,ACTION_MOVELEFT) end function
function moveRight(state,client) return action(state,client,ACTION_MOVERIGHT) end function
function selectWeapon(state,client,weapon) value=inputAt(state,client);if value is error then return value end if;value.weapon=weapon;return 0 end function
function jump(state,client)
  value=inputAt(state,client);if value is error then return value end if
  if (value.actionflags&ACTION_JUMPEDLASTFRAME)!=0 then value.actionflags=value.actionflags&(~ACTION_JUMP) else value.actionflags=value.actionflags|ACTION_JUMP end if;return 0
end function
function delayedJump(state,client)
  value=inputAt(state,client);if value is error then return value end if
  if (value.actionflags&ACTION_JUMPEDLASTFRAME)!=0 then value.actionflags=value.actionflags&(~ACTION_DELAYEDJUMP) else value.actionflags=value.actionflags|ACTION_DELAYEDJUMP end if;return 0
end function
function move(state,client,direction,speed)
  value=inputAt(state,client);if value is error then return value end if
  if direction==void or len(direction)!=3 then return fail("movement direction must be vec3") end if
  value.dir=[n.f32(direction[0]),n.f32(direction[1]),n.f32(direction[2])]
  speed=n.f32(speed);if speed>MAX_USERMOVE then speed=MAX_USERMOVE else if speed<0.0-MAX_USERMOVE then speed=0.0-MAX_USERMOVE end if;value.speed=speed;return 0
end function
function view(state,client,angles)
  value=inputAt(state,client);if value is error then return value end if
  if angles==void or len(angles)!=3 then return fail("view angles must be vec3") end if
  value.viewangles=[n.f32(angles[0]),n.f32(angles[1]),n.f32(angles[2])];return 0
end function
// The complete body is commented out in released be_ea.c.
function endRegular(state,client,thinktime) return 0 end function
function getInput(state,client,thinktime)
  value=inputAt(state,client);if value is error then return value end if;value.thinktime=n.f32(thinktime);return copyInput(value)
end function
function resetInput(state,client)
  value=inputAt(state,client);if value is error then return value end if
  value.actionflags=value.actionflags&(~ACTION_JUMPEDLASTFRAME);jumped=(value.actionflags&ACTION_JUMP)!=0
  value.thinktime=0.0;value.dir=[0.0,0.0,0.0];value.speed=0.0;value.actionflags=0
  if jumped then value.actionflags=value.actionflags|ACTION_JUMPEDLASTFRAME end if;return 0
end function

function writeInput(data,offset,value)
  if data==void or typeof(data)!="bytes" or offset<0 or offset>len(data) or INPUT_SIZE>len(data)-offset then return fail("bot_input_t output outside memory") end if
  n.writeU32(data,offset,n.floatBits(value.thinktime));for axis=0 to 2 n.writeU32(data,offset+4+axis*4,n.floatBits(value.dir[axis])) end for
  n.writeU32(data,offset+16,n.floatBits(value.speed));for axis=0 to 2 n.writeU32(data,offset+20+axis*4,n.floatBits(value.viewangles[axis])) end for
  n.writeU32(data,offset+32,value.actionflags);n.writeU32(data,offset+36,value.weapon);return 0
end function

// Complete code/botlib/be_ea.c surface.  The explicit state argument replaces
// the original process-global botinputs pointer while retaining every original
// transition and command string exactly.
function EA_Setup(maxClients)
  if maxClients<0 then return fail("negative client count") end if
  values=array(maxClients,void);if maxClients>0 then for client=0 to maxClients-1 values[client]=emptyInput() end for end if
  return State(true,maxClients,values,void,void,0)
end function
function EA_Shutdown(state) return shutdown(state) end function
function EA_Say(state,client,text) return say(state,client,text) end function
function EA_SayTeam(state,client,text) return sayTeam(state,client,text) end function
function EA_Tell(state,client,clientTo,text) return tell(state,client,clientTo,text) end function
function EA_UseItem(state,client,item) return useItem(state,client,item) end function
function EA_DropItem(state,client,item) return dropItem(state,client,item) end function
function EA_UseInv(state,client,inventory) return useInv(state,client,inventory) end function
function EA_DropInv(state,client,inventory) return dropInv(state,client,inventory) end function
function EA_Gesture(state,client) return gesture(state,client) end function
function EA_Command(state,client,text) return command(state,client,text) end function
function EA_SelectWeapon(state,client,weapon) return selectWeapon(state,client,weapon) end function
function EA_Attack(state,client) return attack(state,client) end function
function EA_Talk(state,client) return talk(state,client) end function
function EA_Use(state,client) return useAction(state,client) end function
function EA_Respawn(state,client) return respawn(state,client) end function
function EA_Jump(state,client) return jump(state,client) end function
function EA_DelayedJump(state,client) return delayedJump(state,client) end function
function EA_Crouch(state,client) return crouch(state,client) end function
function EA_Walk(state,client) return walk(state,client) end function
function EA_Action(state,client,bits) return action(state,client,bits) end function
function EA_MoveUp(state,client) return moveUp(state,client) end function
function EA_MoveDown(state,client) return moveDown(state,client) end function
function EA_MoveForward(state,client) return moveForward(state,client) end function
function EA_MoveBack(state,client) return moveBack(state,client) end function
function EA_MoveLeft(state,client) return moveLeft(state,client) end function
function EA_MoveRight(state,client) return moveRight(state,client) end function
function EA_Move(state,client,direction,speed) return move(state,client,direction,speed) end function
function EA_View(state,client,angles) return view(state,client,angles) end function
function EA_EndRegular(state,client,thinktime) return endRegular(state,client,thinktime) end function
function EA_GetInput(state,client,thinktime) return getInput(state,client,thinktime) end function
function EA_ResetInput(state,client) return resetInput(state,client) end function
