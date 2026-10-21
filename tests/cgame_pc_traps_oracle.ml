import mq3.vm.cgame_pc_traps as pcTraps
import mq3.vm.pc_parser as pcParser
import mq3.compat.numeric as n

function main(args)
  token=pcParser.Token(pcParser.TT_NUMBER,0x1008,-42,3.5,"answer",1,false);data=pcParser.encode(token)
  print "abi|"+str(pcTraps.CG_PC_ADD_GLOBAL_DEFINE)+"|"+str(pcTraps.CG_PC_LOAD_SOURCE)+"|"+str(pcTraps.CG_PC_FREE_SOURCE)+"|"+str(pcTraps.CG_PC_READ_TOKEN)+"|"+str(pcTraps.CG_PC_SOURCE_FILE_AND_LINE)
  print "layout|"+str(len(data))+"|0|4|8|12|16"
  print "token|"+str(n.readI32(data,0))+"|"+str(n.readI32(data,4))+"|"+str(n.readI32(data,8))+"|"+str(n.readU32(data,12))+"|"+decode(slice(data,16,6))
  return 0
end function
