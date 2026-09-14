// SPDX-License-Identifier: GPL-2.0-or-later
// QVM argument and bot_input_t marshalling for BOTLIB_EA_* traps 400..423.
package mq3.botlib.elementary_action_syscalls

import mq3.botlib.elementary_actions as ea
import mq3.vm.syscall_common as common
import mq3.compat.numeric as n

function farg(vm,base,index) return n.bitsFloat(common.argument(vm,base,index)) end function
function dispatch(state,vm,base,op)
  client=common.argument(vm,base,1)
  if op==ea.OP_SAY or op==ea.OP_SAY_TEAM or op==ea.OP_COMMAND then
    text=common.readString(vm,common.argument(vm,base,2));if text is error then return text end if
    if op==ea.OP_SAY then return ea.say(state,client,text) else if op==ea.OP_SAY_TEAM then return ea.sayTeam(state,client,text) else return ea.command(state,client,text) end if
  end if
  if op==ea.OP_ACTION then return ea.action(state,client,common.argument(vm,base,2)) end if
  if op==ea.OP_GESTURE then return ea.gesture(state,client) end if
  if op==ea.OP_TALK then return ea.talk(state,client) end if
  if op==ea.OP_ATTACK then return ea.attack(state,client) end if
  if op==ea.OP_USE then return ea.useAction(state,client) end if
  if op==ea.OP_RESPAWN then return ea.respawn(state,client) end if
  if op==ea.OP_CROUCH then return ea.crouch(state,client) end if
  if op==ea.OP_MOVE_UP then return ea.moveUp(state,client) end if
  if op==ea.OP_MOVE_DOWN then return ea.moveDown(state,client) end if
  if op==ea.OP_MOVE_FORWARD then return ea.moveForward(state,client) end if
  if op==ea.OP_MOVE_BACK then return ea.moveBack(state,client) end if
  if op==ea.OP_MOVE_LEFT then return ea.moveLeft(state,client) end if
  if op==ea.OP_MOVE_RIGHT then return ea.moveRight(state,client) end if
  if op==ea.OP_SELECT_WEAPON then return ea.selectWeapon(state,client,common.argument(vm,base,2)) end if
  if op==ea.OP_JUMP then return ea.jump(state,client) end if
  if op==ea.OP_DELAYED_JUMP then return ea.delayedJump(state,client) end if
  if op==ea.OP_MOVE then direction=common.readFloatVector(vm,common.argument(vm,base,2),3,"EA movement direction");if direction is error then return direction end if;return ea.move(state,client,direction,farg(vm,base,3)) end if
  if op==ea.OP_VIEW then angles=common.readFloatVector(vm,common.argument(vm,base,2),3,"EA view angles");if angles is error then return angles end if;return ea.view(state,client,angles) end if
  if op==ea.OP_END_REGULAR then return ea.endRegular(state,client,farg(vm,base,2)) end if
  if op==ea.OP_GET_INPUT then
    value=ea.getInput(state,client,farg(vm,base,2));if value is error then return value end if
    output=common.pointer(vm,common.argument(vm,base,3),ea.INPUT_SIZE,"EA bot_input_t output");if output is error then return output end if;return ea.writeInput(vm.data,output,value)
  end if
  if op==ea.OP_RESET_INPUT then return ea.resetInput(state,client) end if
  return error(7541,"unsupported Elementary Actions trap "+str(op))
end function
