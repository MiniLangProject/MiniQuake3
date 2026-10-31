import std.fs as fs
import mq3.vm.jit_compat as jit

function syscall(machine,address) return 0 end function
function req(value,label) if not value then return error(7976,"JIT compatibility contract: "+label) end if;return 1 end function
function main(args)
  count=0
  count=count+req(len(jit.x86Symbols())==15 and jit.x86Symbols()[14]=="callAsmCall","x86 surface")
  count=count+req(len(jit.ppcSymbols())==14 and jit.ppcSymbols()[13]=="ltopandsecond","PPC surface")
  count=count+req(len(jit.ppcNewSymbols())==18 and jit.ppcNewSymbols()[17]=="spillOpStack","new PPC surface")
  count=count+req(jit.Hex(48)==0 and jit.Hex(70)==15 and jit.Hex(97)==10 and try(jit.Hex(71)) is error,"hex decoder")
  emitted=jit.Emit1(bytes(0,0),0x12);emitted=jit.Emit2(emitted,0x3456);emitted=jit.Emit4(emitted,0x789abcde)
  count=count+req(len(emitted)==7 and emitted[0]==0x12 and emitted[1]==0x56 and emitted[2]==0x34 and emitted[3]==0xde and emitted[6]==0x78,"little endian emitters")
  text=jit.EmitString(bytes(0,0),"89 07 83 C7 04")
  count=count+req(len(text)==5 and text[0]==0x89 and text[4]==4,"hex emitter")
  count=count+req(len(jit.EmitMovEAXEDI(bytes(0,0)))==2 and len(jit.EmitAddEDI4(bytes(0,0)))==3,"x86 peepholes")
  count=count+req(jit.InstImm(0x38000000,3,4,-7)==0x3864fff9,"PPC immediate encoding")
  image=fs.readAllBytes(args[0]);compiled=jit.VM_Compile(image,syscall,"portable")
  count=count+req(compiled.architecture=="portable" and not compiled.nativeCode and len(compiled.instructionPointers)==3,"portable compile plan")
  count=count+req(compiled.codeLength==len(compiled.machine.code) and compiled.tableLength==12,"compiled sizes")
  count=count+req(jit.Constant4(compiled.machine,0)==64 and jit.Constant4(compiled.machine,1)==42,"constant decoding")
  count=count+req(jit.VM_CallCompiled(compiled,[0])==42 and jit.callAsmCall(compiled,[0])==42 and jit.AsmCall(compiled,[0])==42,"compiled calls")
  count=count+req(try(jit.VM_Compile(image,syscall,"mips")) is error and try(jit.VM_CallCompiled(void,[])) is error,"invalid inputs")
  count=count+req(jit.makeInteger(4294967295)==-1 and jit.makeFloat(0x3f800000)==1.0,"PPC stack conversions")
  print "PASS: "+str(count)+" portable JIT compatibility contracts";return 0
end function
