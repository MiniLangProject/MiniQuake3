// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.vm.interpreter as vm
import mq3.vm.jit_compat as jit
import mq3.compat.numeric as n
import std.fs as fs
function require(ok,text) if not ok then return error(3498,"native QVM: "+text) end if;return 1 end function
function recursiveNative(state,address) return vm.callFast(state,[0]) end function
function recursivePortable(state,address) return vm.call(state,[0]) end function
function trapFailure(state,address) return error(3497,"synthetic trap failure") end function
function expected(op,a,b)
  if op==54 then return n.i32(n.addBits(a,b)) end if
  if op==55 then return n.i32(n.subBits(a,b)) end if
  if op==56 then return n.i32(n.divBits(a,b)) end if
  if op==57 then return n.i32(n.mulBits(a,b)) end if
  if op==58 then return n.i32(n.floatBits(n.f32(n.i32(a)))) end if
  value=n.bitsFloat(a)
  if n.isNaNBits(a) or value>=2147483648.0 or value< -2147483648.0 then return -2147483648 end if
  return n.trunc32(value)
end function
function main(args)
  count=0;folder=args[1];cases=fs.readAllBytes(args[0]);machines=array(6,void)
  for index=0 to 5 machines[index]=vm.load(fs.readAllBytes(folder+"/float"+str(index+54)+".qvm"),void) end for
  for caseIndex=0 to len(cases)/12-1
    offset=caseIndex*12
    op=n.readI32(cases,offset);a=n.readU32(cases,offset+4);b=n.readU32(cases,offset+8)
    result=vm.callFast(machines[op-54],[n.i32(a),n.i32(b)]);wanted=expected(op,a,b)
    if result!=wanted then return error(3498,"native float mismatch op="+str(op)+" a="+str(a)+" b="+str(b)+" got="+str(result)+" expected="+str(wanted)) end if
    count=count+1
  end for
  image=fs.readAllBytes(folder+"/recursive.qvm");native=vm.load(image,recursiveNative);portable=vm.load(image,recursivePortable)
  nr=vm.callFast(native,[1]);pr=vm.call(portable,[1]);count=count+require(nr==42 and nr==pr and native.steps==portable.steps and native.programStack==portable.programStack and native.data==portable.data,"reentrant trap preserves continuation, memory and counters")
  compiled=jit.VM_Compile(image,recursiveNative,"portable");count=count+require(jit.VM_CallCompiled(compiled,[1])==42 and compiled.instructionPointers==compiled.machine.addresses,"compiled ABI uses bounded native continuation")
  limited=vm.load(fs.readAllBytes(folder+"/loop.qvm"),void);limited.limit=5;before=limited.programStack
  count=count+require(try(vm.callFast(limited,[])) is error and limited.steps==6 and limited.programStack==before,"instruction limit and unwind")
  failed=vm.load(image,trapFailure);before=failed.programStack
  count=count+require(try(vm.callFast(failed,[1])) is error and failed.programStack==before,"trap failure unwinds program stack")
  count=count+require(try(vm.callFast(failed,array(11,0))) is error,"argument bound")
  bad=vm.load(fs.readAllBytes(folder+"/badload.qvm"),void);before=bad.programStack
  count=count+require(try(vm.callFast(bad,[])) is error and bad.programStack==before,"masked memory end remains checked")
  print "PASS: "+str(count)+" native QVM float/reentrant/bounds contracts";return 0
end function
