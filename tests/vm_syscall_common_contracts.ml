import mq3.vm.syscall_common as sys
import mq3.qcommon.cvar as cv
import mq3.qcommon.command_buffer as cmd
import mq3.compat.numeric as n
import mq3.vm.interpreter as interpreter

struct Machine data mask end struct
struct Host events files writes closed now end struct

function req(value,label) if not value then return error(499,"vm syscall: "+label) end if;return 1 end function
function put(vm,at,text) data=bytes(text);copyBytes(vm.data,at,data,0,len(data));vm.data[at+len(data)]=0;return at end function
function invoke(abi,host,vm,base,values)
  for index=0 to len(values)-1 n.writeU32(vm.data,base+index*4,values[index]) end for
  return sys.dispatch(abi,host,vm,base)
end function
function textAt(vm,at) stop=at;while vm.data[stop]!=0 stop=stop+1 end while;return decode(slice(vm.data,at,stop-at)) end function
function printEvent(h,text) h.events=h.events+["print:"+text];return void end function
function errorEvent(h,text) h.events=h.events+["error:"+text];return void end function
function clock(h) return h.now end function
function consoleEvent(h,when,text) h.events=h.events+["console:"+str(when)+":"+text];return void end function
function openFile(h,name,mode) h.events=h.events+["open:"+name+":"+str(mode)];return sys.OpenResult(17,5) end function
function readFile(h,handle,count) h.events=h.events+["read:"+str(handle)+":"+str(count)];return slice(bytes("quake!"),0,count) end function
function writeFile(h,handle,data) h.writes=h.writes+[[handle,decode(data)]];return len(data) end function
function closeFile(h,handle) h.closed=h.closed+[handle];return void end function

function fixture()
  registry=cv.create();commands=cmd.create();cmd.tokenizeString(commands,"say \"hello arena\" 3")
  context=Host([],[],[],[],4242);host=sys.services(registry,commands,context)
  host.printFn=printEvent;host.errorFn=errorEvent;host.millisecondsFn=clock;host.consoleFn=consoleEvent
  host.openFn=openFile;host.readFn=readFile;host.writeFn=writeFile;host.closeFn=closeFile
  return [Machine(bytes(2048,0),2047),host,context]
end function

function clockQvm()
  // ENTER 64; CONST -3; CALL; LEAVE 64. Negative calls encode trap as -1-call.
  image=bytes(112,0);n.writeU32(image,0,0x12721444);n.writeU32(image,4,4)
  n.writeU32(image,8,32);n.writeU32(image,12,16);n.writeU32(image,16,48)
  n.writeU32(image,20,64);n.writeU32(image,24,0);n.writeU32(image,28,65536)
  image[32]=3;n.writeU32(image,33,64);image[37]=8;n.writeU32(image,38,-3)
  image[42]=5;image[43]=4;n.writeU32(image,44,64);return image
end function

function main(args)
  count=0;base=1800;f=fixture();vm=f[0];host=f[1];h=f[2]
  put(vm,100,"hello");count=count+req(invoke(sys.ABI_QAGAME,host,vm,base,[0,100])==0 and h.events[0]=="print:hello","qagame print")
  count=count+req(invoke(sys.ABI_CGAME,host,vm,base,[1,100])==0 and h.events[1]=="error:hello","cgame error")
  count=count+req(invoke(sys.ABI_UI,host,vm,base,[1,100])==0 and h.events[2]=="print:hello","UI print numbering")
  count=count+req(invoke(sys.ABI_UI,host,vm,base,[2])==4242 and invoke(sys.ABI_QAGAME,host,vm,base,[2])==4242,"milliseconds")

  put(vm,120,"g_speed");put(vm,140,"320")
  count=count+req(invoke(sys.ABI_QAGAME,host,vm,base,[3,300,120,140,0])==0,"cvar register")
  count=count+req(n.readI32(vm.data,300)==1 and n.readI32(vm.data,304)==1 and n.readI32(vm.data,312)==320 and textAt(vm,316)=="320","vmCvar layout")
  put(vm,160,"400");invoke(sys.ABI_CGAME,host,vm,base,[5,120,160]);count=count+req(cv.find(host.cvars,"g_speed").integer==400,"cgame cvar set")
  count=count+req(invoke(sys.ABI_QAGAME,host,vm,base,[6,120])==400,"qagame cvar integer")
  count=count+req(invoke(sys.ABI_UI,host,vm,base,[4,120])==n.i32(n.floatBits(400.0)),"UI cvar float bits")
  invoke(sys.ABI_CGAME,host,vm,base,[6,120,600,4]);count=count+req(textAt(vm,600)=="400","cvar string truncation")
  invoke(sys.ABI_UI,host,vm,base,[51,300]);count=count+req(n.readI32(vm.data,304)==2 and textAt(vm,316)=="400","cvar update snapshot")
  put(vm,180,"cg_drawGun");put(vm,200,"1");invoke(sys.ABI_UI,host,vm,base,[50,700,180,200,0]);count=count+req(textAt(vm,716)=="1","UI late cvar register opcode")

  count=count+req(invoke(sys.ABI_QAGAME,host,vm,base,[8])==3 and invoke(sys.ABI_CGAME,host,vm,base,[7])==3,"argc ABI mapping")
  invoke(sys.ABI_QAGAME,host,vm,base,[9,1,800,32]);count=count+req(textAt(vm,800)=="hello arena","argv quoted token")
  invoke(sys.ABI_CGAME,host,vm,base,[9,850,32]);count=count+req(textAt(vm,850)=="hello arena 3","cgame args")
  invoke(sys.ABI_UI,host,vm,base,[11,99,900,8]);count=count+req(textAt(vm,900)=="","missing argv empty")

  put(vm,220,"maps/q3dm1.bsp");count=count+req(invoke(sys.ABI_QAGAME,host,vm,base,[10,220,950,0])==5 and n.readI32(vm.data,950)==17,"file open result")
  invoke(sys.ABI_CGAME,host,vm,base,[11,980,5,17]);count=count+req(decode(slice(vm.data,980,5))=="quake","file read")
  put(vm,1000,"data");invoke(sys.ABI_UI,host,vm,base,[15,1000,4,17]);count=count+req(h.writes==[[17,"data"]],"file write")
  invoke(sys.ABI_UI,host,vm,base,[16,17]);count=count+req(h.closed==[17],"file close")
  put(vm,240,"map q3dm1");invoke(sys.ABI_QAGAME,host,vm,base,[14,2,240]);count=count+req(h.events[len(h.events)-1]=="console:2:map q3dm1","console command")

  count=count+req(try(invoke(sys.ABI_QAGAME,host,vm,base,[0,0])) is error,"NULL string rejected")
  count=count+req(try(invoke(sys.ABI_QAGAME,host,vm,base,[7,120,2040,16])) is error,"cross-boundary output rejected")
  stringVm=Machine(bytes(32,65),31)
  count=count+req(try(sys.readString(stringVm,1)) is error,"unterminated string rejected")
  count=count+req(try(sys.dispatch(sys.ABI_QAGAME,host,vm,2046)) is error,"argument vector bound")
  count=count+req(try(invoke(sys.ABI_QAGAME,host,vm,base,[999])) is error,"unknown trap rejected")
  count=count+req(try(sys.dispatch(99,host,vm,base)) is error,"unknown ABI rejected")
  count=count+req(try(invoke(sys.ABI_CGAME,host,vm,base,[11,100, -1,17])) is error,"negative read rejected")
  bad=sys.services(void,host.commands,h);count=count+req(try(invoke(sys.ABI_QAGAME,bad,vm,base,[6,120])) is error,"missing cvar service rejected")
  count=count+req(try(sys.pointer(vm,2047,2,"probe")) is error,"pointer span rejected")
  count=count+req(sys.pointer(vm,4097,1,"masked")==1,"QVM pointer mask")
  machine=interpreter.load(clockQvm(),sys.callback(sys.ABI_QAGAME,host))
  count=count+req(interpreter.call(machine,[])==4242,"interpreter syscall callback")
  print "PASS: "+str(count)+" common QVM syscall contracts";return 0
end function
