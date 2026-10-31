import mq3.vm.qvm_assembly_abi as abi

function req(value,label) if not value then return error(7974,"QVM assembly ABI contract: "+label) end if;return 1 end function
function main(args)
  count=0
  count=count+req(len(abi.cgameNames())==102 and len(abi.cgameOrdinals())==102,"cgame inventory")
  count=count+req(abi.cgameNames()[0]=="trap_Print" and abi.cgameNames()[101]=="acos","cgame names")
  count=count+req(abi.cgameOrdinals()[0]==-1 and abi.cgameOrdinals()[101]==-112,"cgame ordinals")
  count=count+req(len(abi.gameNames())==194 and len(abi.gameOrdinals())==194,"qagame inventory")
  count=count+req(abi.gameNames()[0]=="trap_Printf" and abi.gameNames()[193]=="trap_BotLibSourceFileAndLine","qagame names")
  count=count+req(abi.gameOrdinals()[0]==-1 and abi.gameOrdinals()[193]==-582,"qagame ordinals")
  count=count+req(abi.gameOrdinals()[156]==-546 and abi.gameOrdinals()[157]==-546,"historical duplicate")
  count=count+req(abi.gameDuplicate546Count()==2,"duplicate count")
  count=count+req(abi.syscallNumber(-1)==0 and abi.syscallNumber(-90)==89,"ordinal decoding")
  count=count+req(not abi.isBuiltinOrdinal(-90) and abi.isBuiltinOrdinal(-101),"builtin boundary")
  print "PASS: "+str(count)+" QVM assembly ABI contracts";return 0
end function
