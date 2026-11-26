// SPDX-License-Identifier: GPL-2.0-or-later
// Native QVM dispatch with managed, reentrant engine-trap continuations.
package mq3.vm.native_exec
import mq3.compat.numeric as n
/// Measure the decoded QVM instruction-plan allocation from the image header.
/// @param image Read-only QVM image byte address.
/// @param count QVM image length in bytes.
/// @returns The required plan size in bytes, or -1 for an invalid image header.
extern function planSizeNative(image as ptr,count as i32) from "miniquake3_qvm.dll" symbol "mq3_qvm_plan_size" returns i32
/// Validate QVM instructions and branches while constructing a native dispatch plan.
/// @param image Read-only QVM image bytes.
/// @param count Image length in bytes.
/// @param plan Writable native plan allocation.
/// @param capacity Plan-buffer byte capacity, at least planSizeNative(image, count).
/// @returns 1 on success; -1 for invalid buffers/header, -2 for invalid instructions, or -3 for an invalid branch target.
extern function prepareNative(image as ptr,count as i32,plan as ptr,capacity as i32) from "miniquake3_qvm.dll" symbol "mq3_qvm_prepare" returns i32
/// Initialize the reentrant QVM control block and reserve the vmMain argument frame.
/// @param control Writable control block of at least CONTROL_BYTES bytes.
/// @param count Control-block capacity in bytes.
/// @param original Original VM program-stack byte offset.
/// @param bottom Lower program-stack boundary.
/// @param mask VM data-address mask.
/// @param limit Nonnegative instruction budget.
/// @param breaks Initial breakpoint counter.
/// @returns 1 after initialization, or 0 when the control buffer, stack, or instruction budget is invalid.
extern function beginNative(control as ptr,count as i32,original as i32,bottom as i32,mask as i32,limit as i32,breaks as i32) from "miniquake3_qvm.dll" symbol "mq3_qvm_begin" returns i32
/// Execute or resume a prepared QVM until completion, a syscall continuation, or an execution error.
/// @param plan Read-only decoded instruction plan.
/// @param planBytes Instruction-plan length in bytes.
/// @param data Mutable QVM data-memory address.
/// @param dataBytes Power-of-two VM data-memory size in bytes.
/// @param control Mutable reentrant control block.
/// @param controlBytes Control-block capacity in bytes.
/// @param value Syscall result supplied when resuming.
/// @param resume Nonzero to resume the pending syscall using value.
/// @returns 0 for normal return, a positive syscall-continuation status, or a negative validation/execution error; the control block carries the result.
extern function runNative(plan as ptr,planBytes as i32,data as ptr,dataBytes as i32,control as ptr,controlBytes as i32,value as i32,resume as i32) from "miniquake3_qvm.dll" symbol "mq3_qvm_run" returns i32
/// Byte size used for control storage or binary layout in mq3.vm.native_exec.
const CONTROL_BYTES=1080
/// Create the vm.native_exec error for `fail` with 3400 and the supplied diagnostic text.
/// @param text Text used in `("QVM: " + text)` and `error(3400, ("QVM: " + text))`.
function fail(text) return error(3400,"QVM: "+text) end function
/// Prepare native exec in vm.native_exec; the normal completion returns `plan`.
/// @param image Image used in `len(image)` and `nativeBytesPtr(image)`.
function prepare(image)
  size=planSizeNative(nativeBytesPtr(image),len(image));if size<1 then return fail("invalid native instruction plan") end if
  plan=bytes(size,0);if prepareNative(nativeBytesPtr(image),len(image),nativeBytesPtr(plan),len(plan))!=1 then return fail("native instruction plan rejected") end if;return plan
end function
/// Update `vm.programStack` in vm.native_exec.
///
/// Direct state writes: `vm.programStack`.
/// @param vm Updated in place: `programStack`.
/// @param saved Saved operand used by `restoreStack`; its reads are shown in the implementation.
function restoreStack(vm,saved) vm.programStack=saved;return void end function
/// Invoke vmMain with at most ten arguments, servicing native syscall continuations and restoring the VM stack on every exit.
///
/// Direct state writes: `vm.steps`, `vm.breaks`, `vm.programStack`.
/// @param vm Mutable VM runtime, including data memory, prepared native plan, stack bounds, counters, and syscall callback.
/// @param args At most ten vmMain integer arguments; omitted slots are filled with zero.
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
