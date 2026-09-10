import mq3.vm.syscall_qagame_world as world

struct Machine data mask end struct
function encodeHex(data,at,count) digits=bytes("0123456789abcdef");text="";for i=0 to count-1 v=data[at+i];text=text+decode(bytes([digits[(v>>4)&15],digits[v&15]])) end for;return text end function
function main(args)
  print "ops|24|25|32|33|36|43|44"
  print "trace-layout|56|0|4|8|12|24|36|40|44|48|52"
  print "usercmd-layout|24|0|4|16|20|21|22|23|12"
  vm=Machine(bytes(128,0),127)
  tr=world.TraceResult(true,false,0.375,[-1.25,2.5,300.0],[1.0,-0.5,0.25],64.5,2,5,0x12345678,0x89abcdef,1022)
  world.writeTrace(vm,8,tr);print "trace|"+encodeHex(vm.data,8,56)
  cmd=world.userCommand(0x10203040,[-1,32768,65535],0x76543210,255,-128,127,-1)
  world.writeUsercmd(vm,72,cmd);print "usercmd|"+encodeHex(vm.data,72,24)
  return 0
end function
