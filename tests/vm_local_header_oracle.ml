import mq3.vm.abi as abi

function main(args)
  print("offsets "+str(abi.VM_OFFSET_PROGRAM_STACK)+" "+str(abi.VM_OFFSET_SYSTEM_CALL))
  line="opcodes";for each value in abi.opcodeValues() line=line+" "+str(value) end for;print(line)
  print("symbols 8")
  return 0
end function
