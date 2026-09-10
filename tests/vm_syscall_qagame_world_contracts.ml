import mq3.vm.syscall_qagame_world as world
import mq3.compat.numeric as n

struct Machine data mask end struct
struct Context events overflow end struct
function req(value,label) if not value then return error(499,"qagame world syscall: "+label) end if;return 1 end function
function invoke(host,vm,base,values) for i=0 to len(values)-1 n.writeU32(vm.data,base+i*4,values[i]) end for;return world.dispatch(host,vm,base,values[0]) end function
function vec(vm,at,x,y,z) n.writeU32(vm.data,at,n.floatBits(x));n.writeU32(vm.data,at+4,n.floatBits(y));n.writeU32(vm.data,at+8,n.floatBits(z)) end function
function event(c,text) c.events=c.events+[text] end function
function hostTrace(c,start,mins,maxs,finish,pass,mask,capsule) event(c,"trace:"+str(pass)+":"+str(mask)+":"+str(capsule)+":"+str(mins==void)+":"+str(maxs==void));return world.TraceResult(true,false,0.375,[-1.25,2.5,300.0],[1.0,-0.5,0.25],64.5,2,5,0x12345678,0x89abcdef,1022) end function
function contents(c,point,pass) event(c,"contents:"+str(pass)+":"+str(point[1]==2.0));return 0x11223344 end function
function entities(c,mins,maxs,capacity) event(c,"entities:"+str(capacity)+":"+str(mins[0]==-16.0 and maxs[2]==18.0));if c.overflow then return [3,7,11] end if;if capacity==0 then return [] end if;return [3,7] end function
function contact(c,mins,maxs,entity,capsule) event(c,"contact:"+str(entity)+":"+str(capsule));return capsule or mins[0]<maxs[0] end function
function usercmd(c,client) event(c,"usercmd:"+str(client));return world.userCommand(12345,[-1,32768,65535],0x76543210,250,-128,127,-1) end function
function fixture() vm=Machine(bytes(4096,0),4095);c=Context([],false);host=world.services(c);host.traceFn=hostTrace;host.pointContentsFn=contents;host.entitiesInBoxFn=entities;host.entityContactFn=contact;host.getUsercmdFn=usercmd;return [vm,host,c] end function

function main(args)
  f=fixture();vm=f[0];host=f[1];c=f[2];base=3900;count=0
  vec(vm,100,1.0,2.0,3.0);vec(vm,120,-16.0,-17.0,-18.0);vec(vm,140,16.0,17.0,18.0);vec(vm,160,4.0,5.0,6.0)
  count=count+req(invoke(host,vm,base,[24,300,100,120,140,160,-1,0x2000001])==0,"trace result")
  count=count+req(c.events[0]=="trace:-1:33554433:false:false:false","trace arguments")
  count=count+req(n.readI32(vm.data,300)==1 and n.readI32(vm.data,304)==0,"trace booleans")
  count=count+req(n.readU32(vm.data,308)==n.floatBits(0.375),"trace fraction")
  count=count+req(n.readU32(vm.data,312)==n.floatBits(-1.25) and n.readU32(vm.data,320)==n.floatBits(300.0),"trace endpos")
  count=count+req(n.readU32(vm.data,324)==n.floatBits(1.0) and n.readU32(vm.data,336)==n.floatBits(64.5),"trace plane floats")
  count=count+req(vm.data[340]==2 and vm.data[341]==5 and vm.data[342]==0 and vm.data[343]==0,"trace plane bytes")
  count=count+req(n.readU32(vm.data,344)==0x12345678 and n.readU32(vm.data,348)==0x89abcdef and n.readI32(vm.data,352)==1022,"trace tail")
  count=count+req(invoke(host,vm,base,[43,420,100,0,0,160,2,3])==0,"capsule trace result")
  count=count+req(c.events[1]=="trace:2:3:true:true:true","nullable capsule bounds")
  count=count+req(invoke(host,vm,base,[25,100,9])==0x11223344 and c.events[2]=="contents:9:true","point contents")
  count=count+req(invoke(host,vm,base,[32,120,140,500,4])==2,"entities count")
  count=count+req(n.readI32(vm.data,500)==3 and n.readI32(vm.data,504)==7 and c.events[3]=="entities:4:true","entity-list output")
  count=count+req(invoke(host,vm,base,[32,120,140,0,0])==0,"zero-capacity NULL list")
  count=count+req(invoke(host,vm,base,[33,120,140,700])==1 and c.events[5]=="contact:700:false","box contact")
  count=count+req(invoke(host,vm,base,[44,120,140,4796])==1 and c.events[6]=="contact:700:true","masked capsule entity")
  count=count+req(invoke(host,vm,base,[36,5,800])==0 and c.events[7]=="usercmd:5","get usercmd")
  count=count+req(n.readI32(vm.data,800)==12345 and n.readI32(vm.data,804)==-1 and n.readI32(vm.data,808)==32768 and n.readI32(vm.data,812)==65535,"usercmd words")
  count=count+req(n.readU32(vm.data,816)==0x76543210 and vm.data[820]==250 and vm.data[821]==128 and vm.data[822]==127 and vm.data[823]==255,"usercmd byte tail")
  count=count+req(try(invoke(host,vm,base,[24,4070,100,120,140,160,0,1])) is error,"trace output span")
  count=count+req(try(invoke(host,vm,base,[24,300,4090,120,140,160,0,1])) is error,"trace start span")
  count=count+req(try(invoke(host,vm,base,[24,300,100,120,140,4090,0,1])) is error,"trace end span")
  count=count+req(try(invoke(host,vm,base,[25,0,1])) is error,"NULL point")
  count=count+req(try(invoke(host,vm,base,[32,120,140,500,-1])) is error,"negative entity capacity")
  count=count+req(try(invoke(host,vm,base,[32,120,140,500,2000])) is error,"entity capacity overflow")
  c.overflow=true;count=count+req(try(invoke(host,vm,base,[32,120,140,500,2])) is error,"entity service overflow");c.overflow=false
  count=count+req(try(invoke(host,vm,base,[33,120,140,0])) is error,"NULL contact entity")
  count=count+req(try(invoke(host,vm,base,[36,2,4080])) is error,"usercmd output span")
  count=count+req(try(world.writeTrace(vm,300,world.TraceResult(false,false,1.0,[0.0],[0.0,0.0,1.0],0.0,0,0,0,0,0))) is error,"bad trace vector")
  count=count+req(try(world.writeUsercmd(vm,800,world.userCommand(0,[1,2],0,0,0,0,0))) is error,"bad usercmd angles")
  empty=world.services(c);count=count+req(try(invoke(empty,vm,base,[24,300,100,120,140,160,0,1])) is error,"missing trace service")
  count=count+req(try(invoke(empty,vm,base,[25,100,0])) is error,"missing contents service")
  count=count+req(try(invoke(empty,vm,base,[32,120,140,500,2])) is error,"missing entities service")
  count=count+req(try(invoke(empty,vm,base,[33,120,140,700])) is error,"missing contact service")
  count=count+req(try(invoke(empty,vm,base,[36,0,800])) is error,"missing usercmd service")
  count=count+req(try(world.dispatch(void,vm,base,24)) is error,"invalid host")
  count=count+req(try(world.dispatch(host,vm,base,99)) is error,"unsupported opcode")
  print "PASS: "+str(count)+" qagame binary-world syscall contracts";return 0
end function
