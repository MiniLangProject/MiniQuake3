import mq3.client.ui_lan_browser as lan
import mq3.vm.syscall_ui as ui
import mq3.vm.syscall_common as common
import mq3.qcommon.cvar as cvar
import mq3.qcommon.command_buffer as commands
import mq3.compat.numeric as n
import mq3.shared.info as info

struct Machine data mask end struct
struct Context browser end struct
function req(value,label) if not value then return error(7696,"UI LAN dispatch: "+label) end if;return 1 end function
function put(vm,at,text) data=bytes(text);copyBytes(vm.data,at,data,0,len(data));vm.data[at+len(data)]=0;return at end function
function invoke(host,vm,base,values) for index=0 to len(values)-1 n.writeU32(vm.data,base+index*4,values[index]) end for;return ui.dispatch(host,vm,base) end function

function load(c) return lan.load(c.browser) end function
function save(c) return lan.save(c.browser) end function
function add(c,source,name,address) return lan.add(c.browser,source,name,address) end function
function remove(c,source,address) return lan.remove(c.browser,source,address) end function
function pingCount(c) return lan.pingCount(c.browser) end function
function clearPing(c,index) return lan.clearPing(c.browser,index) end function
function hostGetPing(c,index) return lan.getPing(c.browser,index) end function
function hostGetPingInfo(c,index) return lan.getPingInfo(c.browser,index) end function
function serverCount(c,source) return lan.count(c.browser,source) end function
function serverAddress(c,source,index) return lan.address(c.browser,source,index) end function
function serverInfo(c,source,index) return lan.serverInfo(c.browser,source,index) end function
function serverPing(c,source,index) return lan.serverPing(c.browser,source,index) end function
function mark(c,source,index,visible) return lan.markVisible(c.browser,source,index,visible) end function
function visible(c,source,index) return lan.isVisible(c.browser,source,index) end function
function update(c,source) return lan.updateVisiblePings(c.browser,source) end function
function reset(c,source) return lan.resetPings(c.browser,source) end function
function status(c,address) return lan.serverStatus(c.browser,address) end function
function compare(c,source,key,direction,first,second) return lan.compare(c.browser,source,key,direction,first,second) end function

function main(args)
  vm=Machine(bytes(8192,0),8191);context=Context(lan.create());shared=common.services(cvar.create(),commands.create(),context);host=ui.services(shared,context)
  host.lan.loadFn=load;host.lan.saveFn=save;host.lan.addFn=add;host.lan.removeFn=remove;host.lan.pingQueueCountFn=pingCount;host.lan.clearPingFn=clearPing
  host.lan.getPingFn=hostGetPing;host.lan.getPingInfoFn=hostGetPingInfo;host.lan.serverCountFn=serverCount;host.lan.serverAddressFn=serverAddress;host.lan.serverInfoFn=serverInfo
  host.lan.serverPingFn=serverPing;host.lan.markVisibleFn=mark;host.lan.isVisibleFn=visible;host.lan.updatePingsFn=update;host.lan.resetPingsFn=reset;host.lan.serverStatusFn=status;host.lan.compareFn=compare
  base=8000;put(vm,100,"Mini Arena");put(vm,140,"127.0.0.1:27960");count=0
  count=count+req(invoke(host,vm,base,[73,lan.AS_FAVORITES,100,140])==1,"add trap")
  count=count+req(invoke(host,vm,base,[65,lan.AS_FAVORITES])==1,"count trap")
  invoke(host,vm,base,[66,lan.AS_FAVORITES,0,200,64]);count=count+req(common.readString(vm,200)=="127.0.0.1:27960","address trap")
  invoke(host,vm,base,[67,lan.AS_FAVORITES,0,300,512]);text=common.readString(vm,300);count=count+req(info.value(text,"hostname")=="Mini Arena","info trap")
  count=count+req(invoke(host,vm,base,[83,lan.AS_FAVORITES,0])== -1,"ping trap")
  count=count+req(invoke(host,vm,base,[84,lan.AS_FAVORITES,0])==1,"visible trap")
  invoke(host,vm,base,[68,lan.AS_FAVORITES,0,0]);count=count+req(invoke(host,vm,base,[84,lan.AS_FAVORITES,0])==0,"mark trap")
  invoke(host,vm,base,[68,lan.AS_FAVORITES,-1,1]);count=count+req(invoke(host,vm,base,[69,lan.AS_FAVORITES])==1,"update trap")
  count=count+req(invoke(host,vm,base,[85,lan.AS_FAVORITES,lan.SORT_HOST,0,0,0])==0,"compare trap")
  invoke(host,vm,base,[72]);invoke(host,vm,base,[74,lan.AS_FAVORITES,140]);count=count+req(invoke(host,vm,base,[65,lan.AS_FAVORITES])==0,"remove trap")
  invoke(host,vm,base,[71]);count=count+req(invoke(host,vm,base,[65,lan.AS_FAVORITES])==1,"cache load trap")
  lan.queuePing(context.browser,"127.0.0.1:27960",19,"\\hostname\\Mini Arena")
  count=count+req(invoke(host,vm,base,[46])==1,"ping count trap")
  invoke(host,vm,base,[48,0,900,64,1000]);count=count+req(common.readString(vm,900)=="127.0.0.1:27960" and n.readI32(vm.data,1000)==19,"get ping trap")
  invoke(host,vm,base,[49,0,1100,128]);count=count+req(info.value(common.readString(vm,1100),"hostname")=="Mini Arena","ping info trap")
  invoke(host,vm,base,[47,0]);count=count+req(invoke(host,vm,base,[46])==0,"clear ping trap")
  lan.updateServer(context.browser,lan.AS_FAVORITES,0,"q3dm1",1,8,35,0,0,"baseq3",0,1,0,"ready")
  invoke(host,vm,base,[82,140,1400,128]);count=count+req(common.readString(vm,1400)=="ready","status trap")
  invoke(host,vm,base,[70,lan.AS_FAVORITES]);count=count+req(invoke(host,vm,base,[83,lan.AS_FAVORITES,0])== -1,"reset trap")
  print("PASS: "+str(count)+" UI LAN syscall integration contracts");return 0
end function
