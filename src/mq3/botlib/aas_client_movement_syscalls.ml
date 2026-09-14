// SPDX-License-Identifier: GPL-2.0-or-later
// QVM ABI for BOTLIB_AAS_PREDICT_CLIENT_MOVEMENT (Baseq3 opcode 318).
package mq3.botlib.aas_client_movement_syscalls

import mq3.botlib.aas_client_movement as aasClientMovement
import mq3.vm.syscall_common as common
import mq3.compat.numeric as n

const AAS_CLIENTMOVE_SIZE=84
function writeVector(data,address,value) for axis=0 to 2 n.writeU32(data,address+axis*4,n.floatBits(value[axis])) end for;return void end function
function dispatch(services,vm,base)
  output=common.pointer(vm,common.argument(vm,base,1),AAS_CLIENTMOVE_SIZE,"aas_clientmove_t output");if output is error then return output end if
  origin=common.readFloatVector(vm,common.argument(vm,base,3),3,"AAS movement origin");if origin is error then return origin end if
  velocity=common.readFloatVector(vm,common.argument(vm,base,6),3,"AAS movement velocity");if velocity is error then return velocity end if
  command=common.readFloatVector(vm,common.argument(vm,base,7),3,"AAS movement command");if command is error then return command end if
  value=aasClientMovement.predict(services,common.argument(vm,base,2),origin,common.argument(vm,base,4),common.argument(vm,base,5)!=0,velocity,command,common.argument(vm,base,8),common.argument(vm,base,9),n.bitsFloat(common.argument(vm,base,10)),common.argument(vm,base,11),common.argument(vm,base,12),common.argument(vm,base,13)!=0)
  if value is error then return value end if
  writeVector(vm.data,output,value.endpos);n.writeU32(vm.data,output+12,value.endarea);writeVector(vm.data,output+16,value.velocity)
  trace=value.trace;startsolid=0;if trace.startsolid then startsolid=1 end if;n.writeU32(vm.data,output+28,startsolid);n.writeU32(vm.data,output+32,n.floatBits(trace.fraction));writeVector(vm.data,output+36,trace.endpos)
  n.writeU32(vm.data,output+48,trace.ent);n.writeU32(vm.data,output+52,trace.lastarea);n.writeU32(vm.data,output+56,trace.area);n.writeU32(vm.data,output+60,trace.planenum)
  n.writeU32(vm.data,output+64,value.presencetype);n.writeU32(vm.data,output+68,value.stopevent);n.writeU32(vm.data,output+72,value.endcontents);n.writeU32(vm.data,output+76,n.floatBits(value.time));n.writeU32(vm.data,output+80,value.frames)
  if value.success then return 1 else return 0 end if
end function
