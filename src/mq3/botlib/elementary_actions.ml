// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Client-local Elementary Actions state matching code/botlib/be_ea.c.
package mq3.botlib.elementary_actions

import mq3.botlib.public_headers as publicHeaders
import mq3.compat.numeric as n

const MAX_USERMOVE=400.0
const INPUT_SIZE=40

const ACTION_ATTACK=publicHeaders.ACTION_ATTACK
const ACTION_USE=publicHeaders.ACTION_USE
const ACTION_RESPAWN=publicHeaders.ACTION_RESPAWN
const ACTION_JUMP=publicHeaders.ACTION_JUMP
const ACTION_MOVEUP=publicHeaders.ACTION_MOVEUP
const ACTION_CROUCH=publicHeaders.ACTION_CROUCH
const ACTION_MOVEDOWN=publicHeaders.ACTION_MOVEDOWN
const ACTION_MOVEFORWARD=publicHeaders.ACTION_MOVEFORWARD
const ACTION_MOVEBACK=publicHeaders.ACTION_MOVEBACK
const ACTION_MOVELEFT=publicHeaders.ACTION_MOVELEFT
const ACTION_MOVERIGHT=publicHeaders.ACTION_MOVERIGHT
const ACTION_DELAYEDJUMP=publicHeaders.ACTION_DELAYEDJUMP
const ACTION_TALK=publicHeaders.ACTION_TALK
const ACTION_GESTURE=publicHeaders.ACTION_GESTURE
const ACTION_WALK=publicHeaders.ACTION_WALK
const ACTION_AFFIRMATIVE=publicHeaders.ACTION_AFFIRMATIVE
const ACTION_NEGATIVE=publicHeaders.ACTION_NEGATIVE
const ACTION_GETFLAG=publicHeaders.ACTION_GETFLAG
const ACTION_GUARDBASE=publicHeaders.ACTION_GUARDBASE
const ACTION_PATROL=publicHeaders.ACTION_PATROL
const ACTION_FOLLOWME=publicHeaders.ACTION_FOLLOWME

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

/// `ElementaryInput` record for elementary actions, containing `thinktime`, `dir`, `speed`, `viewangles` and `actionflags` and related fields.
struct ElementaryInput thinktime dir speed viewangles actionflags weapon end struct
/// `State` record for elementary actions, containing `initialized`, `maxClients`, `inputs`, `commandFn` and `context` and related fields.
struct State initialized maxClients inputs commandFn context commandCount end struct

/// Construct error `7540` with diagnostic text `"Elementary Actions: "+message`.
/// @param message Message text supplied to the diagnostic or chat operation.
function fail(message) return error(7540,"Elementary Actions: "+message) end function
/// Create a `mq3.botlib.elementary_actions.ElementaryInput` record, initializing `dir` as `[0.0,0.0,0.0]` and `viewangles` as `[0.0,0.0,0.0]`.
function emptyInput() return ElementaryInput(0.0,[0.0,0.0,0.0],0.0,[0.0,0.0,0.0],0,0) end function
/// Create a `mq3.botlib.elementary_actions.ElementaryInput` record, initializing `thinktime` as `value.thinktime`, `dir` as `[value.dir[0],value.dir[1],value.dir[2]]` and `speed` as `value.speed`.
/// @param value Value record; accesses `thinktime`, `dir`, `speed`, `viewangles` and `actionflags` and related fields.
function copyInput(value) return ElementaryInput(value.thinktime,[value.dir[0],value.dir[1],value.dir[2]],value.speed,[value.viewangles[0],value.viewangles[1],value.viewangles[2]],value.actionflags,value.weapon) end function
/// Build the `mq3.botlib.elementary_actions.State` result for `create`. Return paths include `State(true,maxClients,values,commandFn,context,0)`.
/// @param maxClients Initial value stored in `mq3.botlib.elementary_actions.State.maxClients`.
/// @param commandFn Initial value stored in `mq3.botlib.elementary_actions.State.commandFn`.
/// @param context Context forwarded to the configured host callbacks.
function create(maxClients,commandFn,context)
  if maxClients<0 then return fail("negative client count") end if
  values=array(maxClients,void);if maxClients>0 then for client=0 to maxClients-1 values[client]=emptyInput() end for end if
  return State(true,maxClients,values,commandFn,context,0)
end function
/// Update `state.initialized`, `state.inputs` and `state.maxClients` during `shutdown`.
/// @param state Elementary actions state; accesses `initialized`, `inputs` and `maxClients`. May update `state.initialized`, `state.inputs` and `state.maxClients` in place.
function shutdown(state) if state!=void then state.initialized=false;state.inputs=[];state.maxClients=0 end if;return 0 end function
/// Test `state!=void and state.initialized and client>=0 and client<state.maxClients` as the condition for `validClient`.
/// @param state Elementary actions state; accesses `initialized` and `maxClients`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function validClient(state,client) return state!=void and state.initialized and client>=0 and client<state.maxClients end function
/// Apply `mq3.botlib.elementary_actions.validClient` while evaluating `inputAt`. Return paths include `state.inputs[client]`.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function inputAt(state,client) if not validClient(state,client) then return fail("client outside input table") end if;return state.inputs[client] end function
/// Set `state.commandCount` to `state.commandCount+1` in `mq3.botlib.elementary_actions.emit`.
/// @param state Elementary actions state; accesses `commandFn`, `context` and `commandCount`. May update `state.commandCount` in place.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
/// @param text Text to parse, format or deliver.
function emit(state,client,text)
  if not validClient(state,client) then return fail("client outside input table") end if
  if state.commandFn==void then return fail("client command callback missing") end if
  result=state.commandFn(state.context,client,text);if result is error then return result end if;state.commandCount=state.commandCount+1;return 0
end function
/// Forward `say` to `mq3.botlib.elementary_actions.emit` and return the delegated result.
/// @param state Elementary actions state; accesses `commandFn`, `context` and `commandCount`. May update `state.commandCount` in place.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
/// @param text Text to parse, format or deliver.
function say(state,client,text) return emit(state,client,"say "+text) end function
/// Forward `sayTeam` to `mq3.botlib.elementary_actions.emit` and return the delegated result.
/// @param state Elementary actions state; accesses `commandFn`, `context` and `commandCount`. May update `state.commandCount` in place.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
/// @param text Text to parse, format or deliver.
function sayTeam(state,client,text) return emit(state,client,"say_team "+text) end function
/// Forward `command` to `mq3.botlib.elementary_actions.emit` and return the delegated result.
/// @param state Elementary actions state; accesses `commandFn`, `context` and `commandCount`. May update `state.commandCount` in place.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
/// @param text Text to parse, format or deliver.
function command(state,client,text) return emit(state,client,text) end function
/// Forward `tell` to `mq3.botlib.elementary_actions.emit` and return the delegated result.
/// @param state Elementary actions state; accesses `commandFn`, `context` and `commandCount`. May update `state.commandCount` in place.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
/// @param clientTo Value passed as argument 1 to `str`.
/// @param text Text to parse, format or deliver.
function tell(state,client,clientTo,text) return emit(state,client,"tell "+str(clientTo)+", "+text) end function
/// Forward `useItem` to `mq3.botlib.elementary_actions.emit` and return the delegated result.
/// @param state Elementary actions state; accesses `commandFn`, `context` and `commandCount`. May update `state.commandCount` in place.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
/// @param item Operand used to evaluate the returned expression `emit(state,client,"use "+item)`.
function useItem(state,client,item) return emit(state,client,"use "+item) end function
/// Forward `dropItem` to `mq3.botlib.elementary_actions.emit` and return the delegated result.
/// @param state Elementary actions state; accesses `commandFn`, `context` and `commandCount`. May update `state.commandCount` in place.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
/// @param item Operand used to evaluate the returned expression `emit(state,client,"drop "+item)`.
function dropItem(state,client,item) return emit(state,client,"drop "+item) end function
/// Forward `useInv` to `mq3.botlib.elementary_actions.emit` and return the delegated result.
/// @param state Elementary actions state; accesses `commandFn`, `context` and `commandCount`. May update `state.commandCount` in place.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
/// @param inventory Bot inventory indexed by the corresponding inventory constants.
function useInv(state,client,inventory) return emit(state,client,"invuse "+inventory) end function
/// Forward `dropInv` to `mq3.botlib.elementary_actions.emit` and return the delegated result.
/// @param state Elementary actions state; accesses `commandFn`, `context` and `commandCount`. May update `state.commandCount` in place.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
/// @param inventory Bot inventory indexed by the corresponding inventory constants.
function dropInv(state,client,inventory) return emit(state,client,"invdrop "+inventory) end function

/// Apply `mq3.botlib.elementary_actions.inputAt` while evaluating `action`.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
/// @param bits Value used by `action` in `value.actionflags=value.actionflags|bits`.
function action(state,client,bits) value=inputAt(state,client);if value is error then return value end if;value.actionflags=value.actionflags|bits;return 0 end function
/// Forward `gesture` to `mq3.botlib.elementary_actions.action` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function gesture(state,client) return action(state,client,ACTION_GESTURE) end function
/// Forward `talk` to `mq3.botlib.elementary_actions.action` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function talk(state,client) return action(state,client,ACTION_TALK) end function
/// Forward `attack` to `mq3.botlib.elementary_actions.action` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function attack(state,client) return action(state,client,ACTION_ATTACK) end function
/// Forward `useAction` to `mq3.botlib.elementary_actions.action` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function useAction(state,client) return action(state,client,ACTION_USE) end function
/// Forward `respawn` to `mq3.botlib.elementary_actions.action` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function respawn(state,client) return action(state,client,ACTION_RESPAWN) end function
/// Forward `crouch` to `mq3.botlib.elementary_actions.action` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function crouch(state,client) return action(state,client,ACTION_CROUCH) end function
/// Forward `walk` to `mq3.botlib.elementary_actions.action` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function walk(state,client) return action(state,client,ACTION_WALK) end function
/// Forward `moveUp` to `mq3.botlib.elementary_actions.action` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function moveUp(state,client) return action(state,client,ACTION_MOVEUP) end function
/// Forward `moveDown` to `mq3.botlib.elementary_actions.action` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function moveDown(state,client) return action(state,client,ACTION_MOVEDOWN) end function
/// Forward `moveForward` to `mq3.botlib.elementary_actions.action` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function moveForward(state,client) return action(state,client,ACTION_MOVEFORWARD) end function
/// Forward `moveBack` to `mq3.botlib.elementary_actions.action` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function moveBack(state,client) return action(state,client,ACTION_MOVEBACK) end function
/// Forward `moveLeft` to `mq3.botlib.elementary_actions.action` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function moveLeft(state,client) return action(state,client,ACTION_MOVELEFT) end function
/// Forward `moveRight` to `mq3.botlib.elementary_actions.action` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function moveRight(state,client) return action(state,client,ACTION_MOVERIGHT) end function
/// Apply `mq3.botlib.elementary_actions.inputAt` while evaluating `selectWeapon`.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
/// @param weapon Weapon identifier used by the action or inventory lookup.
function selectWeapon(state,client,weapon) value=inputAt(state,client);if value is error then return value end if;value.weapon=weapon;return 0 end function
/// Apply `mq3.botlib.elementary_actions.inputAt` while evaluating `jump`.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function jump(state,client)
  value=inputAt(state,client);if value is error then return value end if
  if (value.actionflags&ACTION_JUMPEDLASTFRAME)!=0 then value.actionflags=value.actionflags&(~ACTION_JUMP) else value.actionflags=value.actionflags|ACTION_JUMP end if;return 0
end function
/// Apply `mq3.botlib.elementary_actions.inputAt` while evaluating `delayedJump`.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function delayedJump(state,client)
  value=inputAt(state,client);if value is error then return value end if
  if (value.actionflags&ACTION_JUMPEDLASTFRAME)!=0 then value.actionflags=value.actionflags&(~ACTION_DELAYEDJUMP) else value.actionflags=value.actionflags|ACTION_DELAYEDJUMP end if;return 0
end function
/// Apply `mq3.botlib.elementary_actions.inputAt` while evaluating `move`.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
/// @param direction Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param speed Requested movement speed.
function move(state,client,direction,speed)
  value=inputAt(state,client);if value is error then return value end if
  if direction==void or len(direction)!=3 then return fail("movement direction must be vec3") end if
  value.dir=[n.f32(direction[0]),n.f32(direction[1]),n.f32(direction[2])]
  speed=n.f32(speed);if speed>MAX_USERMOVE then speed=MAX_USERMOVE else if speed<0.0-MAX_USERMOVE then speed=0.0-MAX_USERMOVE end if;value.speed=speed;return 0
end function
/// Apply `mq3.botlib.elementary_actions.inputAt` while evaluating `view`.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
/// @param angles Pitch, yaw and roll angles in degrees.
function view(state,client,angles)
  value=inputAt(state,client);if value is error then return value end if
  if angles==void or len(angles)!=3 then return fail("view angles must be vec3") end if
  value.viewangles=[n.f32(angles[0]),n.f32(angles[1]),n.f32(angles[2])];return 0
end function
// The complete body is commented out in released be_ea.c.
/// @param state Not read by this implementation; retained in the `endRegular` signature.
/// @param client Not read by this implementation; retained in the `endRegular` signature.
/// @param thinktime Not read by this implementation; retained in the `endRegular` signature.
function endRegular(state,client,thinktime) return 0 end function
/// Apply `mq3.botlib.elementary_actions.inputAt` and `mq3.botlib.elementary_actions.copyInput` while evaluating `getInput`. Return paths include `copyInput(value)`.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
/// @param thinktime Bot thinking interval in seconds.
function getInput(state,client,thinktime)
  value=inputAt(state,client);if value is error then return value end if;value.thinktime=n.f32(thinktime);return copyInput(value)
end function
/// Apply `mq3.botlib.elementary_actions.inputAt` while evaluating `resetInput`.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function resetInput(state,client)
  value=inputAt(state,client);if value is error then return value end if
  value.actionflags=value.actionflags&(~ACTION_JUMPEDLASTFRAME);jumped=(value.actionflags&ACTION_JUMP)!=0
  value.thinktime=0.0;value.dir=[0.0,0.0,0.0];value.speed=0.0;value.actionflags=0
  if jumped then value.actionflags=value.actionflags|ACTION_JUMPEDLASTFRAME end if;return 0
end function

/// Serialize bot_input_t fields into a validated VM byte buffer using their exact 32-bit ABI offsets.
/// @param data Sequence whose length bounds the iteration or lookup in `writeInput`.
/// @param offset Offset into the buffer or sequence used by this operation.
/// @param value Value record; accesses `thinktime`, `dir`, `speed`, `viewangles` and `actionflags` and related fields.
function writeInput(data,offset,value)
  if data==void or typeof(data)!="bytes" or offset<0 or offset>len(data) or INPUT_SIZE>len(data)-offset then return fail("bot_input_t output outside memory") end if
  n.writeU32(data,offset,n.floatBits(value.thinktime));for axis=0 to 2 n.writeU32(data,offset+4+axis*4,n.floatBits(value.dir[axis])) end for
  n.writeU32(data,offset+16,n.floatBits(value.speed));for axis=0 to 2 n.writeU32(data,offset+20+axis*4,n.floatBits(value.viewangles[axis])) end for
  n.writeU32(data,offset+32,value.actionflags);n.writeU32(data,offset+36,value.weapon);return 0
end function

// Complete code/botlib/be_ea.c surface.  The explicit state argument replaces
// the original process-global botinputs pointer while retaining every original
// transition and command string exactly.
/// @param maxClients Initial value stored in `mq3.botlib.elementary_actions.State.maxClients`.
function EA_Setup(maxClients)
  if maxClients<0 then return fail("negative client count") end if
  values=array(maxClients,void);if maxClients>0 then for client=0 to maxClients-1 values[client]=emptyInput() end for end if
  return State(true,maxClients,values,void,void,0)
end function
/// Forward `EA_Shutdown` to `mq3.botlib.elementary_actions.shutdown` and return the delegated result.
/// @param state Elementary actions state; accesses `initialized`, `inputs` and `maxClients`. May update `state.initialized`, `state.inputs` and `state.maxClients` in place.
function EA_Shutdown(state) return shutdown(state) end function
/// Forward `EA_Say` to `mq3.botlib.elementary_actions.say` and return the delegated result.
/// @param state Elementary actions state; accesses `commandFn`, `context` and `commandCount`. May update `state.commandCount` in place.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
/// @param text Text to parse, format or deliver.
function EA_Say(state,client,text) return say(state,client,text) end function
/// Forward `EA_SayTeam` to `mq3.botlib.elementary_actions.sayTeam` and return the delegated result.
/// @param state Elementary actions state; accesses `commandFn`, `context` and `commandCount`. May update `state.commandCount` in place.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
/// @param text Text to parse, format or deliver.
function EA_SayTeam(state,client,text) return sayTeam(state,client,text) end function
/// Forward `EA_Tell` to `mq3.botlib.elementary_actions.tell` and return the delegated result.
/// @param state Elementary actions state; accesses `commandFn`, `context` and `commandCount`. May update `state.commandCount` in place.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
/// @param clientTo Value passed as argument 1 to `str`.
/// @param text Text to parse, format or deliver.
function EA_Tell(state,client,clientTo,text) return tell(state,client,clientTo,text) end function
/// Forward `EA_UseItem` to `mq3.botlib.elementary_actions.useItem` and return the delegated result.
/// @param state Elementary actions state; accesses `commandFn`, `context` and `commandCount`. May update `state.commandCount` in place.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
/// @param item Operand used to evaluate the returned expression `emit(state,client,"use "+item)`.
function EA_UseItem(state,client,item) return useItem(state,client,item) end function
/// Forward `EA_DropItem` to `mq3.botlib.elementary_actions.dropItem` and return the delegated result.
/// @param state Elementary actions state; accesses `commandFn`, `context` and `commandCount`. May update `state.commandCount` in place.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
/// @param item Operand used to evaluate the returned expression `emit(state,client,"drop "+item)`.
function EA_DropItem(state,client,item) return dropItem(state,client,item) end function
/// Forward `EA_UseInv` to `mq3.botlib.elementary_actions.useInv` and return the delegated result.
/// @param state Elementary actions state; accesses `commandFn`, `context` and `commandCount`. May update `state.commandCount` in place.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
/// @param inventory Bot inventory indexed by the corresponding inventory constants.
function EA_UseInv(state,client,inventory) return useInv(state,client,inventory) end function
/// Forward `EA_DropInv` to `mq3.botlib.elementary_actions.dropInv` and return the delegated result.
/// @param state Elementary actions state; accesses `commandFn`, `context` and `commandCount`. May update `state.commandCount` in place.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
/// @param inventory Bot inventory indexed by the corresponding inventory constants.
function EA_DropInv(state,client,inventory) return dropInv(state,client,inventory) end function
/// Forward `EA_Gesture` to `mq3.botlib.elementary_actions.gesture` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function EA_Gesture(state,client) return gesture(state,client) end function
/// Forward `EA_Command` to `mq3.botlib.elementary_actions.command` and return the delegated result.
/// @param state Elementary actions state; accesses `commandFn`, `context` and `commandCount`. May update `state.commandCount` in place.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
/// @param text Text to parse, format or deliver.
function EA_Command(state,client,text) return command(state,client,text) end function
/// Forward `EA_SelectWeapon` to `mq3.botlib.elementary_actions.selectWeapon` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
/// @param weapon Weapon identifier used by the action or inventory lookup.
function EA_SelectWeapon(state,client,weapon) return selectWeapon(state,client,weapon) end function
/// Forward `EA_Attack` to `mq3.botlib.elementary_actions.attack` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function EA_Attack(state,client) return attack(state,client) end function
/// Forward `EA_Talk` to `mq3.botlib.elementary_actions.talk` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function EA_Talk(state,client) return talk(state,client) end function
/// Forward `EA_Use` to `mq3.botlib.elementary_actions.useAction` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function EA_Use(state,client) return useAction(state,client) end function
/// Forward `EA_Respawn` to `mq3.botlib.elementary_actions.respawn` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function EA_Respawn(state,client) return respawn(state,client) end function
/// Forward `EA_Jump` to `mq3.botlib.elementary_actions.jump` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function EA_Jump(state,client) return jump(state,client) end function
/// Forward `EA_DelayedJump` to `mq3.botlib.elementary_actions.delayedJump` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function EA_DelayedJump(state,client) return delayedJump(state,client) end function
/// Forward `EA_Crouch` to `mq3.botlib.elementary_actions.crouch` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function EA_Crouch(state,client) return crouch(state,client) end function
/// Forward `EA_Walk` to `mq3.botlib.elementary_actions.walk` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function EA_Walk(state,client) return walk(state,client) end function
/// Forward `EA_Action` to `mq3.botlib.elementary_actions.action` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
/// @param bits Value used by `action` in `value.actionflags=value.actionflags|bits`.
function EA_Action(state,client,bits) return action(state,client,bits) end function
/// Forward `EA_MoveUp` to `mq3.botlib.elementary_actions.moveUp` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function EA_MoveUp(state,client) return moveUp(state,client) end function
/// Forward `EA_MoveDown` to `mq3.botlib.elementary_actions.moveDown` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function EA_MoveDown(state,client) return moveDown(state,client) end function
/// Forward `EA_MoveForward` to `mq3.botlib.elementary_actions.moveForward` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function EA_MoveForward(state,client) return moveForward(state,client) end function
/// Forward `EA_MoveBack` to `mq3.botlib.elementary_actions.moveBack` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function EA_MoveBack(state,client) return moveBack(state,client) end function
/// Forward `EA_MoveLeft` to `mq3.botlib.elementary_actions.moveLeft` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function EA_MoveLeft(state,client) return moveLeft(state,client) end function
/// Forward `EA_MoveRight` to `mq3.botlib.elementary_actions.moveRight` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function EA_MoveRight(state,client) return moveRight(state,client) end function
/// Forward `EA_Move` to `mq3.botlib.elementary_actions.move` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
/// @param direction Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param speed Requested movement speed.
function EA_Move(state,client,direction,speed) return move(state,client,direction,speed) end function
/// Forward `EA_View` to `mq3.botlib.elementary_actions.view` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
/// @param angles Pitch, yaw and roll angles in degrees.
function EA_View(state,client,angles) return view(state,client,angles) end function
/// Forward `EA_EndRegular` to `mq3.botlib.elementary_actions.endRegular` and return the delegated result.
/// @param state Value passed as argument 1 to `mq3.botlib.elementary_actions.endRegular`.
/// @param client Value passed as argument 2 to `mq3.botlib.elementary_actions.endRegular`.
/// @param thinktime Bot thinking interval in seconds.
function EA_EndRegular(state,client,thinktime) return endRegular(state,client,thinktime) end function
/// Forward `EA_GetInput` to `mq3.botlib.elementary_actions.getInput` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
/// @param thinktime Bot thinking interval in seconds.
function EA_GetInput(state,client,thinktime) return getInput(state,client,thinktime) end function
/// Forward `EA_ResetInput` to `mq3.botlib.elementary_actions.resetInput` and return the delegated result.
/// @param state Elementary actions state; accesses `inputs`.
/// @param client Operand used to evaluate the returned expression `state!=void and state.initialized and client>=0 and client<state.maxClients`.
function EA_ResetInput(state,client) return resetInput(state,client) end function
