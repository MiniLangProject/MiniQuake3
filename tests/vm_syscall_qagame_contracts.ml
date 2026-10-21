import mq3.vm.syscall_qagame as game
import mq3.vm.syscall_common as common
import mq3.qcommon.cvar as cv
import mq3.qcommon.command_buffer as cmd
import mq3.compat.numeric as n

struct Machine data mask end struct
struct Context events token end struct
struct ClockSample epoch data end struct

function req(value,label) if not value then return error(499,"qagame syscall: "+label) end if;return 1 end function
function put(vm,at,text) data=bytes(text);copyBytes(vm.data,at,data,0,len(data));vm.data[at+len(data)]=0;return at end function
function textAt(vm,at) stop=at;while vm.data[stop]!=0 stop=stop+1 end while;return decode(slice(vm.data,at,stop-at)) end function
function invoke(host,vm,base,values) for i=0 to len(values)-1 n.writeU32(vm.data,base+i*4,values[i]) end for;return game.dispatch(host,vm,base) end function
function event(c,value) c.events=c.events+[value];return void end function

function locate(c,entities,count,entityStride,clients,clientStride) event(c,"locate:"+str(entities)+":"+str(count)+":"+str(entityStride)+":"+str(clients)+":"+str(clientStride)) end function
function drop(c,client,text) event(c,"drop:"+str(client)+":"+text) end function
function send(c,client,text) event(c,"send:"+str(client)+":"+text) end function
function setConfig(c,index,text) event(c,"setcs:"+str(index)+":"+text) end function
function getConfig(c,index) return "cs"+str(index) end function
function getUser(c,index) return "\\name\\player"+str(index) end function
function setUser(c,index,text) event(c,"setui:"+str(index)+":"+text) end function
function getServer(c) return "\\sv_hostname\\MiniQuake3" end function
function setBrush(c,entity,name) event(c,"brush:"+str(entity)+":"+name) end function
function pvs(c,a,b,ignore) event(c,"pvs:"+str(ignore));return a[0]==1.5 and b[2]==-7.0 and ignore end function
function portal(c,entity,isOpen) event(c,"portal:"+str(entity)+":"+str(isOpen)) end function
function areas(c,a,b) return a==3 and b==4 end function
function hostLink(c,entity) event(c,"link:"+str(entity)) end function
function hostUnlink(c,entity) event(c,"unlink:"+str(entity)) end function
function alloc(c) event(c,"alloc");return 7 end function
function free(c,client) event(c,"free:"+str(client)) end function
function token(c) if c.token==0 then c.token=1;return game.TokenResult(true,"{\"classname\"\"worldspawn\"") end if;return game.TokenResult(false,"") end function
function tick(c) return 99 end function
function files(c,path,extension) event(c,"files:"+path+":"+extension);return ["a.arena","long.arena","z.arena"] end function
function polygon(c,color,points) event(c,"poly:"+str(color)+":"+str(len(points))+":"+str(points[1][2]));return 73 end function
function deletePolygon(c,id) event(c,"delpoly:"+str(id)) end function
function wallClock(c) data=bytes(36,0);for index=0 to 8 n.writeU32(data,index*4,100+index) end for;return ClockSample(1700000000,data) end function
function seek(c,handle,offset,origin) event(c,"seek:"+str(handle)+":"+str(offset)+":"+str(origin));return -2 end function

function fixture()
  vm=Machine(bytes(4096,0),4095);context=Context([],0)
  shared=common.services(cv.create(),cmd.create(),context);shared.millisecondsFn=tick
  host=game.services(shared,context)
  host.locateGameDataFn=locate;host.dropClientFn=drop;host.sendServerCommandFn=send
  host.setConfigstringFn=setConfig;host.getConfigstringFn=getConfig;host.getUserinfoFn=getUser
  host.setUserinfoFn=setUser;host.getServerinfoFn=getServer;host.setBrushModelFn=setBrush
  host.inPvsFn=pvs;host.adjustAreaPortalFn=portal;host.areasConnectedFn=areas
  host.linkEntityFn=hostLink;host.unlinkEntityFn=hostUnlink;host.botAllocateClientFn=alloc
  host.botFreeClientFn=free;host.entityTokenFn=token;host.fileListFn=files
  host.debugPolygonCreateFn=polygon;host.debugPolygonDeleteFn=deletePolygon;host.realTimeFn=wallClock;host.seekFn=seek
  return [vm,host,context]
end function

function main(args)
  f=fixture();vm=f[0];host=f[1];c=f[2];base=3900;count=0
  count=count+req(invoke(host,vm,base,[2])==99,"common trap delegation")
  count=count+req(invoke(host,vm,base,[15,100,2,64,300,128])==0,"locate result")
  count=count+req(c.events[0]=="locate:100:2:64:300:128","locate layout")
  put(vm,500,"timed out");invoke(host,vm,base,[16,3,500]);count=count+req(c.events[1]=="drop:3:timed out","drop client")
  put(vm,530,"cp \"Fight!\"");invoke(host,vm,base,[17,-1,530]);count=count+req(c.events[2]=="send:-1:cp \"Fight!\"","broadcast command")
  put(vm,570,"warmup");invoke(host,vm,base,[18,5,570]);count=count+req(c.events[3]=="setcs:5:warmup","set configstring")
  invoke(host,vm,base,[19,5,600,16]);count=count+req(textAt(vm,600)=="cs5","get configstring")
  invoke(host,vm,base,[20,2,650,32]);count=count+req(textAt(vm,650)=="\\name\\player2","get userinfo")
  put(vm,700,"\\rate\\25000");invoke(host,vm,base,[21,2,700]);count=count+req(c.events[4]=="setui:2:\\rate\\25000","set userinfo")
  invoke(host,vm,base,[22,750,64]);count=count+req(textAt(vm,750)=="\\sv_hostname\\MiniQuake3","serverinfo")
  put(vm,850,"*3");invoke(host,vm,base,[23,900,850]);count=count+req(c.events[5]=="brush:900:*3","brush model")

  n.writeU32(vm.data,1000,n.floatBits(1.5));n.writeU32(vm.data,1004,n.floatBits(2.0));n.writeU32(vm.data,1008,n.floatBits(3.0))
  n.writeU32(vm.data,1020,n.floatBits(4.0));n.writeU32(vm.data,1024,n.floatBits(5.0));n.writeU32(vm.data,1028,n.floatBits(-7.0))
  count=count+req(invoke(host,vm,base,[26,1000,1020])==0,"PVS portals applied")
  count=count+req(invoke(host,vm,base,[27,1000,1020])==1,"PVS ignore portals")
  invoke(host,vm,base,[28,900,1]);count=count+req(c.events[8]=="portal:900:true","portal state")
  count=count+req(invoke(host,vm,base,[29,3,4])==1 and invoke(host,vm,base,[29,4,3])==0,"areas connected")
  invoke(host,vm,base,[30,900]);invoke(host,vm,base,[31,900]);count=count+req(c.events[9]=="link:900" and c.events[10]=="unlink:900","link lifecycle")
  count=count+req(invoke(host,vm,base,[34])==7 and c.events[11]=="alloc","bot allocation")
  invoke(host,vm,base,[35,7]);count=count+req(c.events[12]=="free:7","bot free")
  count=count+req(invoke(host,vm,base,[37,1100,64])==1 and textAt(vm,1100)=="{\"classname\"\"worldspawn\"","entity token")
  count=count+req(invoke(host,vm,base,[37,1100,64])==0 and textAt(vm,1100)=="","entity token EOF")
  put(vm,1160,"scripts");put(vm,1180,".arena")
  count=count+req(invoke(host,vm,base,[38,1160,1180,1200,20])==2,"bounded file-list count")
  count=count+req(decode(slice(vm.data,1200,7))=="a.arena" and vm.data[1207]==0 and decode(slice(vm.data,1208,10))=="long.arena" and vm.data[1218]==0,"NUL-separated file-list output")
  count=count+req(c.events[13]=="files:scripts:.arena","file-list service arguments")
  for axis=0 to 5 n.writeU32(vm.data,1300+axis*4,n.floatBits(axis+0.25)) end for
  count=count+req(invoke(host,vm,base,[39,0x11223344,2,1300])==73,"debug polygon handle")
  count=count+req(c.events[14]=="poly:287454020:2:5.25","debug polygon vertices")
  count=count+req(invoke(host,vm,base,[40,73])==0 and c.events[15]=="delpoly:73","debug polygon delete")
  count=count+req(invoke(host,vm,base,[41,1400])==1700000000 and n.readI32(vm.data,1400)==100 and n.readI32(vm.data,1432)==108,"real time qtime layout")
  count=count+req(invoke(host,vm,base,[41,0])==1700000000,"real time accepts NULL qtime")
  n.writeU32(vm.data,1460,n.floatBits(1.6));n.writeU32(vm.data,1464,n.floatBits(-1.6));n.writeU32(vm.data,1468,n.floatBits(2.5))
  count=count+req(invoke(host,vm,base,[42,1460])==0 and n.bitsFloat(n.readU32(vm.data,1460))==2.0 and n.bitsFloat(n.readU32(vm.data,1464))==-2.0 and n.bitsFloat(n.readU32(vm.data,1468))==2.0,"snap vector")
  count=count+req(invoke(host,vm,base,[45,12,-50,2])==-2 and c.events[len(c.events)-1]=="seek:12:-50:2","file seek")

  count=count+req(try(invoke(host,vm,base,[15,100,-1,64,300,128])) is error,"negative entity count")
  count=count+req(try(invoke(host,vm,base,[15,4000,2,64,300,128])) is error,"entity array span")
  count=count+req(try(invoke(host,vm,base,[15,100,2,0,300,128])) is error,"zero entity stride")
  count=count+req(try(invoke(host,vm,base,[23,0,850])) is error,"NULL entity")
  count=count+req(try(invoke(host,vm,base,[26,4090,1020])) is error,"vector span")
  count=count+req(try(invoke(host,vm,base,[19,5,4090,16])) is error,"output span")
  count=count+req(try(invoke(host,vm,base,[37,1100,-1])) is error,"negative token capacity")
  count=count+req(try(invoke(host,vm,base,[38,1160,1180,1200,-1])) is error,"negative file-list capacity")
  count=count+req(try(invoke(host,vm,base,[39,1,-1,1300])) is error,"negative debug-polygon count")
  count=count+req(try(invoke(host,vm,base,[39,1,2,4090])) is error,"debug-polygon span")
  count=count+req(try(invoke(host,vm,base,[41,4080])) is error,"qtime output span")
  noSeek=game.services(host.shared,c);count=count+req(try(invoke(noSeek,vm,base,[45,1,0,0])) is error,"missing seek service")
  count=count+req(try(invoke(host,vm,base,[24])) is error,"unported trace explicit")
  count=count+req(try(invoke(host,vm,base,[36])) is error,"unported usercmd explicit")
  empty=game.services(host.shared,c);count=count+req(try(invoke(empty,vm,base,[16,1,500])) is error,"missing service")
  count=count+req(try(game.dispatch(void,vm,base)) is error,"invalid host")
  count=count+req(game.opaque(vm,4196,"masked entity")==100,"masked pointer")

  print "PASS: "+str(count)+" qagame-specific syscall contracts";return 0
end function
