// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.vm.syscall_common as sys
import mq3.qcommon.cvar as cvar
import mq3.qcommon.command_buffer as command
import mq3.compat.numeric as n

struct Machine data mask end struct
function req(ok,label) if not ok then return error(3302,"productive cvar contract: "+label) end if;return 1 end function
function put(vm,at,text) data=bytes(text);copyBytes(vm.data,at,data,0,len(data));vm.data[at+len(data)]=0;return at end function
function textAt(vm,at) stop=at;while vm.data[stop]!=0 stop=stop+1 end while;return decode(slice(vm.data,at,stop-at)) end function
function invoke(abi,host,vm,base,values)
  for index=0 to len(values)-1 n.writeU32(vm.data,base+index*4,values[index]) end for
  return sys.dispatch(abi,host,vm,base)
end function

function main(args)
  count=0;registry=cvar.create();host=sys.services(registry,command.create(),void);vm=Machine(bytes(4096,0),4095);base=4000
  put(vm,100,"latched");put(vm,140,"base");put(vm,180,"live")
  value=cvar.get(registry,"latched","base",cvar.LATCH);invoke(sys.ABI_QAGAME,host,vm,base,[5,100,180])
  count=count+req(value.string=="live" and value.latchedString==void,"qagame Cvar_Set is forced")
  put(vm,220,"cg_value");put(vm,260,"3");invoke(sys.ABI_CGAME,host,vm,base,[5,220,260])
  count=count+req(cvar.variableIntegerValue(registry,"cg_value")==3,"cgame set reaches registry")
  count=count+req(invoke(sys.ABI_QAGAME,host,vm,base,[6,220])==3,"qagame integer query")
  count=count+req(invoke(sys.ABI_UI,host,vm,base,[4,220])==n.i32(n.floatBits(3.0)),"UI float query")
  invoke(sys.ABI_CGAME,host,vm,base,[6,220,300,2]);count=count+req(textAt(vm,300)=="3","cgame bounded string query")
  put(vm,340,"ui_value");invoke(sys.ABI_UI,host,vm,base,[6,340,n.floatBits(1.25)])
  count=count+req(cvar.variableString(registry,"ui_value")=="1.250000","UI SetValue")
  invoke(sys.ABI_UI,host,vm,base,[7,340]);count=count+req(cvar.variableString(registry,"ui_value")=="1.250000","UI reset uses creation default")
  put(vm,380,"ui_created");put(vm,420,"created");invoke(sys.ABI_UI,host,vm,base,[8,380,420,cvar.USERINFO])
  created=cvar.find(registry,"ui_created");count=count+req(created!=void and created.string=="created" and created.flags==cvar.USERINFO,"UI create")
  invoke(sys.ABI_UI,host,vm,base,[9,cvar.USERINFO,500,64]);count=count+req(textAt(vm,500)=="\\ui_created\\created","UI info-string output")
  count=count+req(try(invoke(sys.ABI_UI,host,vm,base,[9,cvar.USERINFO,4090,16])) is error,"UI info output bounds")
  put(vm,560,"vm_bound");put(vm,600,"8");invoke(sys.ABI_UI,host,vm,base,[50,700,560,600,0])
  count=count+req(n.readI32(vm.data,700)==registry.numIndexes-1 and textAt(vm,716)=="8","productive VM registration")
  put(vm,640,"9");invoke(sys.ABI_UI,host,vm,base,[3,560,640]);invoke(sys.ABI_UI,host,vm,base,[51,700])
  count=count+req(n.readI32(vm.data,704)==2 and textAt(vm,716)=="9","productive VM update")
  print "PASS: "+str(count)+" productive cvar syscall contracts";return 0
end function
