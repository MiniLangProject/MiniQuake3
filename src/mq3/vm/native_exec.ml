// SPDX-License-Identifier: GPL-2.0-or-later
// Native QVM dispatch with managed, reentrant engine-trap continuations.
package mq3.vm.native_exec
import mq3.compat.numeric as n
extern function planSizeNative(image as ptr,count as i32) from "miniquake3_qvm.dll" symbol "mq3_qvm_plan_size" returns i32
extern function prepareNative(image as ptr,count as i32,plan as ptr,capacity as i32) from "miniquake3_qvm.dll" symbol "mq3_qvm_prepare" returns i32
extern function beginNative(control as ptr,count as i32,original as i32,bottom as i32,mask as i32,limit as i32,breaks as i32) from "miniquake3_qvm.dll" symbol "mq3_qvm_begin" returns i32
extern function runNative(plan as ptr,planBytes as i32,data as ptr,dataBytes as i32,control as ptr,controlBytes as i32,value as i32,resume as i32) from "miniquake3_qvm.dll" symbol "mq3_qvm_run" returns i32
const CONTROL_BYTES=1080
function fail(text) return error(3400,"QVM: "+text) end function
function prepare(image)
  size=planSizeNative(nativeBytesPtr(image),len(image));if size<1 then return fail("invalid native instruction plan") end if
  plan=bytes(size,0);if prepareNative(nativeBytesPtr(image),len(image),nativeBytesPtr(plan),len(plan))!=1 then return fail("native instruction plan rejected") end if;return plan
end function
function restoreStack(vm,saved) vm.programStack=saved;return void end function
function call(vm,args)
  if len(args)>10 then return fail("vmMain accepts at most ten arguments") end if
  original=vm.programStack;defer restoreStack(vm,original);initialSteps=vm.steps
  control=bytes(CONTROL_BYTES,0)
  if beginNative(nativeBytesPtr(control),len(control),original,vm.stackBottom,vm.mask,vm.limit,vm.breaks)!=1 then return fail("program stack exhausted") end if
  ps=original-48;n.writeU32(vm.data,ps,-1);n.writeU32(vm.data,ps+4,0)
  for index=0 to 9 value=0;if index<len(args) then value=args[index] end if;n.writeU32(vm.data,ps+8+index*4,value) end for
  resume=0;value=0
  while true
    n.writeU32(control,24,vm.steps-initialSteps);n.writeU32(control,32,vm.breaks)
    status=runNative(nativeBytesPtr(vm.nativePlan),len(vm.nativePlan),nativeBytesPtr(vm.data),len(vm.data),nativeBytesPtr(control),len(control),value,resume)
    vm.steps=initialSteps+n.readI32(control,24);vm.breaks=n.readI32(control,32)
    if status==0 then return n.readI32(control,40) end if
    if status<0 then return fail("native execution rejected state ("+str(status)+"), steps="+str(vm.steps-initialSteps)+" limit="+str(vm.limit)) end if
    if vm.syscall==void then return fail("syscall handler missing") end if
    vm.programStack=n.readI32(control,4)-4;callback=vm.syscall;value=callback(vm,n.readI32(control,40));if value is error then return value end if
    value=n.i32(value);vm.programStack=original;resume=1
  end while
end function
