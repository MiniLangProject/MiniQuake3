import mq3.vm.syscall_ui_media as media
import mq3.compat.numeric as n

struct Machine data mask end struct
struct Context events end struct

function req(value,label) if not value then return error(499,"UI media syscall: "+label) end if;return 1 end function
function put(vm,at,text) data=bytes(text);copyBytes(vm.data,at,data,0,len(data));vm.data[at+len(data)]=0;return at end function
function invoke(host,vm,base,values) for i=0 to len(values)-1 n.writeU32(vm.data,base+i*4,values[i]) end for;return media.dispatch(host,vm,base) end function
function emit(c,value) c.events=c.events+[value];return void end function

function hostRegisterSound(c,name,compressed) emit(c,["register",name,compressed]);return 41 end function
function hostStartLocal(c,handle,channel) emit(c,["local",handle,channel]) end function
function hostStopBackground(c) emit(c,["stopBackground"]) end function
function hostStartBackground(c,intro,loopName) emit(c,["background",intro,loopName]) end function
function hostRealTime(c) return [1723456789,bytes(media.QTIME_SIZE,23)] end function
function badHostRealTime(c) return [0,bytes(8,0)] end function
function hostPlay(c,name,x,y,w,h,bits) emit(c,["play",name,x,y,w,h,bits]);return 7 end function
function hostStop(c,handle) emit(c,["stop",handle]);return 8 end function
function hostRun(c,handle) emit(c,["run",handle]);return 9 end function
function hostDraw(c,handle) emit(c,["draw",handle]) end function
function hostExtents(c,handle,x,y,w,h) emit(c,["extents",handle,x,y,w,h]) end function
function hostRemap(c,oldName,newName,timeOffset) emit(c,["remap",oldName,newName,timeOffset]) end function
function hostGetKey(c) return "ABCDEFGHIJKLMNOP-extra" end function
function hostShortKey(c) return "short" end function
function hostSetKey(c,value) emit(c,["setKey",value]) end function
function hostVerify(c,key,checksum) emit(c,["verify",key,checksum]);return key=="ABCDEFGHIJKLMNOP" and checksum=="deadbeef" end function
function hostSeek(c,handle,offset,origin) emit(c,["seek",handle,offset,origin]);return -2 end function
function hostPb(c,status) emit(c,["pb",status]) end function

function fixture()
  vm=Machine(bytes(65536,0),65535);context=Context([]);host=media.services(context)
  host.sound.registerFn=hostRegisterSound;host.sound.startLocalFn=hostStartLocal;host.sound.stopBackgroundFn=hostStopBackground;host.sound.startBackgroundFn=hostStartBackground
  host.cinematic.playFn=hostPlay;host.cinematic.stopFn=hostStop;host.cinematic.runFn=hostRun;host.cinematic.drawFn=hostDraw;host.cinematic.setExtentsFn=hostExtents
  host.platform.realTimeFn=hostRealTime;host.platform.remapShaderFn=hostRemap;host.platform.getCdKeyFn=hostGetKey;host.platform.setCdKeyFn=hostSetKey
  host.platform.verifyCdKeyFn=hostVerify;host.platform.seekFn=hostSeek;host.platform.pbStatusFn=hostPb
  return [vm,host,context]
end function

function main(args)
  f=fixture();vm=f[0];host=f[1];c=f[2];base=65000;count=0
  put(vm,100,"sound/menu/enter.wav")
  count=count+req(invoke(host,vm,base,[31,100,1])==41,"sound handle")
  count=count+req(c.events[0]==["register","sound/menu/enter.wav",true],"sound arguments")
  invoke(host,vm,base,[32,41,6]);count=count+req(c.events[1]==["local",41,6],"local sound")
  invoke(host,vm,base,[62]);count=count+req(c.events[2][0]=="stopBackground","stop background")
  put(vm,160,"music/intro.wav");put(vm,190,"music/loop.wav");invoke(host,vm,base,[63,160,190])
  count=count+req(c.events[3]==["background","music/intro.wav","music/loop.wav"],"background arguments")

  count=count+req(invoke(host,vm,base,[64,300])==1723456789,"real-time return")
  count=count+req(vm.data[300]==23 and vm.data[335]==23,"qtime_t output")
  put(vm,400,"video/idlogo.roq");count=count+req(invoke(host,vm,base,[75,400,10,20,320,240,5])==7,"play result")
  count=count+req(c.events[4]==["play","video/idlogo.roq",10,20,320,240,5],"play arguments")
  count=count+req(invoke(host,vm,base,[76,7])==8,"stop result")
  count=count+req(invoke(host,vm,base,[77,7])==9,"run result")
  invoke(host,vm,base,[78,7]);count=count+req(c.events[7]==["draw",7],"draw cinematic")
  invoke(host,vm,base,[79,7,11,22,333,222]);count=count+req(c.events[8]==["extents",7,11,22,333,222],"cinematic extents")

  put(vm,500,"textures/old");put(vm,530,"textures/new");put(vm,560,"0.25")
  invoke(host,vm,base,[80,500,530,560]);count=count+req(c.events[9]==["remap","textures/old","textures/new","0.25"],"shader remap")
  invoke(host,vm,base,[53,600,17]);count=count+req(decode(slice(vm.data,600,16))=="ABCDEFGHIJKLMNOP","CD-key output")
  count=count+req(vm.data[616]==0,"CD-key terminator")
  put(vm,700,"1234567890ABCDEFtail");invoke(host,vm,base,[54,700])
  count=count+req(decode(c.events[10][1])=="1234567890ABCDEF","fixed CD-key input")
  put(vm,750,"ABCDEFGHIJKLMNOP");put(vm,780,"deadbeef")
  count=count+req(invoke(host,vm,base,[81,750,780])==1,"valid CD key")
  put(vm,780,"bad");count=count+req(invoke(host,vm,base,[81,750,780])==0,"invalid CD key")
  count=count+req(c.events[12]==["verify","ABCDEFGHIJKLMNOP","bad"],"validation arguments")
  count=count+req(invoke(host,vm,base,[86,12,-50,2])==-2,"seek result")
  count=count+req(c.events[13]==["seek",12,-50,2],"seek arguments")
  invoke(host,vm,base,[87,3]);count=count+req(c.events[14]==["pb",3],"PB compatibility status")

  count=count+req(try(invoke(host,vm,base,[31,0,0])) is error,"NULL sound name")
  count=count+req(try(invoke(host,vm,base,[63,160,0])) is error,"NULL loop name")
  count=count+req(try(invoke(host,vm,base,[64,65520])) is error,"qtime_t output span")
  host.platform.realTimeFn=badHostRealTime;count=count+req(try(invoke(host,vm,base,[64,300])) is error,"qtime_t service layout");host.platform.realTimeFn=hostRealTime
  count=count+req(try(invoke(host,vm,base,[75,0,0,0,0,0,0])) is error,"NULL cinematic name")
  count=count+req(try(invoke(host,vm,base,[80,500,0,560])) is error,"NULL remap name")
  count=count+req(try(invoke(host,vm,base,[53,600,16])) is error,"short CD-key capacity")
  count=count+req(try(invoke(host,vm,base,[53,65525,17])) is error,"CD-key output span")
  host.platform.getCdKeyFn=hostShortKey;count=count+req(try(invoke(host,vm,base,[53,600,17])) is error,"short CD-key service value");host.platform.getCdKeyFn=hostGetKey
  count=count+req(try(invoke(host,vm,base,[54,65530])) is error,"CD-key input span")
  count=count+req(try(invoke(host,vm,base,[81,0,780])) is error,"NULL verification key")
  empty=media.services(c);count=count+req(try(invoke(empty,vm,base,[31,100,0])) is error,"missing sound service")
  count=count+req(try(invoke(empty,vm,base,[75,400,0,0,0,0,0])) is error,"missing cinematic service")
  count=count+req(try(invoke(empty,vm,base,[86,1,0,0])) is error,"missing seek service")
  count=count+req(invoke(empty,vm,base,[87,1])==0,"PB no-op without service")
  count=count+req(try(invoke(host,vm,base,[99])) is error,"unsupported trap")
  count=count+req(try(invoke(host,vm,65534,[31])) is error,"argument vector span")
  invoke(host,vm,base,[53,66000,17]);count=count+req(decode(slice(vm.data,464,16))=="ABCDEFGHIJKLMNOP","masked CD-key pointer")
  count=count+req(try(media.dispatch(void,vm,base)) is error,"invalid host")

  print "PASS: "+str(count)+" UI media syscall contracts";return 0
end function
