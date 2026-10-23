import mq3.vm.interpreter as vm
import mq3.compat.numeric as n

function req(ok,label) if not ok then return error(7830,"VM debug: "+label) end if;return 1 end function
function symbolName(context,value) return context+str(value) end function
function main(args)
  count=0
  count=count+req(vm.VM_Indent(0)=="" and vm.VM_Indent(1)=="  ","indent shallow")
  count=count+req(len(bytes(vm.VM_Indent(20)))==40 and len(bytes(vm.VM_Indent(21)))==40,"indent cap")
  count=count+req(try(vm.VM_Indent(-1)) is error,"indent negative")
  data=bytes(512,0);n.writeU32(data,20,32);n.writeU32(data,32,200);n.writeU32(data,36,48);n.writeU32(data,48,-1)
  count=count+req(vm.VM_StackTrace(data,100,16,symbolName,"pc:")==["pc:100","pc:200"],"frame walk")
  count=count+req(vm.VM_StackTrace(data,100,16,void,void)==["100","200"],"numeric fallback")
  count=count+req(try(vm.VM_StackTrace(data,100,508,symbolName,"")) is error,"frame bounds")
  count=count+req(try(vm.VM_StackTrace([],100,16,symbolName,"")) is error,"data type")
  chain=bytes(512,0)
  for index=0 to 39 at=index*8;n.writeU32(chain,at,index);n.writeU32(chain,at+4,(index+1)*8) end for
  n.writeU32(chain,320,-1)
  count=count+req(len(vm.VM_StackTrace(chain,999,0,void,void))==32,"original 32-frame cap")
  print("PASS: "+str(count)+" VM interpreted debug contracts")
  return 0
end function
