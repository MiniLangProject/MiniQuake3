import mq3.vm.interpreter as vm
import mq3.compat.numeric as n

function symbolName(context,value) return "sym:"+str(value) end function
function main(args)
  levels=[0,1,5,20,21]
  for each level in levels print("indent:"+str(level)+":["+vm.VM_Indent(level)+"]") end for
  data=bytes(128,0);n.writeU32(data,20,32);n.writeU32(data,32,200);n.writeU32(data,36,48);n.writeU32(data,48,-1)
  lines=vm.VM_StackTrace(data,100,16,symbolName,void)
  for each line in lines print(line) end for
  return 0
end function
