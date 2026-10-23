import mq3.vm.abi as abi

function req(ok,text) if not ok then return error(7868,"vm_local.h: "+text) end if;return 1 end function
function main(args)
  count=0;values=abi.opcodeValues();count=count+req(len(values)==abi.OP_COUNT,"opcode count")
  for index=0 to len(values)-1 count=count+req(values[index]==index,"opcode ordinal "+str(index)) end for
  count=count+req(abi.VM_OFFSET_PROGRAM_STACK==0 and abi.VM_OFFSET_SYSTEM_CALL==4,"assembler offsets")
  sym=abi.VmSymbol(void,123,7,"vmMain");count=count+req(sym.symValue==123 and sym.profileCount==7 and sym.symName=="vmMain","vmSymbol_t")
  state=abi.createState("qagame");count=count+req(state.name=="qagame" and state.programStack==0 and not state.compiled and state.numSymbols==0,"vm_s managed state")
  print("PASS: "+str(count)+" vm_local.h ABI contracts");return 0
end function
