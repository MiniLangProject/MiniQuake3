import mq3.vm.syscall_ui as ui
import mq3.vm.syscall_common as common
import mq3.qcommon.cvar as cv
import mq3.qcommon.command_buffer as cmd
import mq3.compat.numeric as n

struct Machine data mask end struct
struct Context events end struct

function req(value,label) if not value then return error(499,"UI syscall: "+label) end if;return 1 end function
function put(vm,at,text) data=bytes(text);copyBytes(vm.data,at,data,0,len(data));vm.data[at+len(data)]=0;return at end function
function textAt(vm,at) stop=at;while vm.data[stop]!=0 stop=stop+1 end while;return decode(slice(vm.data,at,stop-at)) end function
function invoke(host,vm,base,values) for i=0 to len(values)-1 n.writeU32(vm.data,base+i*4,values[i]) end for;return ui.dispatch(host,vm,base) end function
function emit(c,value) c.events=c.events+[value];return void end function

function tick(c) return 321 end function
function uiHostModel(c,name) emit(c,["model",name]);return 11 end function
function uiHostSkin(c,name) emit(c,["skin",name]);return 12 end function
function uiHostShader(c,name) emit(c,["shader",name]);return 13 end function
function uiHostClearScene(c) emit(c,["clear"]) end function
function hostSetColor(c,value) emit(c,["color",value]) end function
function uiHostDraw(c,values,shaderHandle) emit(c,["draw",values,shaderHandle]) end function
function uiHostUpdate(c) emit(c,["update"]) end function

function keyName(c,key) return "KEY"+str(key) end function
function binding(c,key) if key==7 then return "+attack" end if;if key==8 then return void end if;return "" end function
function uiHostSetBinding(c,key,value) emit(c,["bind",key,value]) end function
function isDown(c,key) return key==7 end function
function getOverstrike(c) return true end function
function uiHostSetOverstrike(c,value) emit(c,["overstrike",value]) end function
function uiHostClearKeys(c) emit(c,["clearKeys"]) end function
function getCatcher(c) return 9 end function
function uiHostSetCatcher(c,value) emit(c,["catcher",value]) end function

function clipboard(c) return "clip text" end function
function glconfig(c) return bytes(ui.GLCONFIG_SIZE,42) end function
function clientState(c) return bytes(ui.CLIENT_STATE_SIZE,43) end function
function configString(c,index) if index==5 then return "sv_hostname\\Test" end if;return void end function
function memory(c) return 765432 end function
function fileList(c,path,extension) if path=="scripts" and extension==".arena" then return ["q3dm1.arena","q3dm2.arena"] end if;return [] end function

function loadServers(c) emit(c,["load"]) end function
function saveServers(c) emit(c,["save"]) end function
function addServer(c,source,name,address) emit(c,["add",source,name,address]);return 1 end function
function removeServer(c,source,address) emit(c,["remove",source,address]) end function
function pingCount(c) return 3 end function
function clearPing(c,index) emit(c,["clearPing",index]) end function
function hostGetPing(c,index) if index==2 then return ["127.0.0.1:27960",44] end if;return void end function
function pingInfo(c,index) return "\\hostname\\server"+str(index) end function
function serverCount(c,source) return 10+source end function
function serverAddress(c,source,index) return "10.0."+str(source)+"."+str(index)+":27960" end function
function serverInfo(c,source,index) return "\\hostname\\s"+str(source)+str(index) end function
function serverPing(c,source,index) return 40+source+index end function
function markVisible(c,source,index,visible) emit(c,["visible",source,index,visible]) end function
function isVisible(c,source,index) return source==1 and index==2 end function
function updatePings(c,source) return source==2 end function
function resetPings(c,source) emit(c,["reset",source]) end function
function status(c,address) if address=="pending" then return void end if;return "\\sv_hostname\\ready" end function
function compare(c,source,sortKey,direction,left,right) return source+sortKey+direction+left-right end function
function badGlconfig(c) return bytes(10,0) end function
function badClientState(c) return bytes(10,0) end function

function fixture()
  vm=Machine(bytes(65536,0),65535);context=Context([])
  shared=common.services(cv.create(),cmd.create(),context);shared.millisecondsFn=tick
  host=ui.services(shared,context)
  host.renderer.registerModelFn=uiHostModel;host.renderer.registerSkinFn=uiHostSkin;host.renderer.registerShaderNoMipFn=uiHostShader
  host.renderer.clearSceneFn=uiHostClearScene;host.renderer.setColorFn=hostSetColor;host.renderer.drawStretchPicFn=uiHostDraw;host.renderer.updateScreenFn=uiHostUpdate
  host.keys.keyNameFn=keyName;host.keys.bindingFn=binding;host.keys.setBindingFn=uiHostSetBinding;host.keys.isDownFn=isDown
  host.keys.getOverstrikeFn=getOverstrike;host.keys.setOverstrikeFn=uiHostSetOverstrike;host.keys.clearFn=uiHostClearKeys
  host.keys.getCatcherFn=getCatcher;host.keys.setCatcherFn=uiHostSetCatcher
  host.client.clipboardFn=clipboard;host.client.glconfigFn=glconfig;host.client.clientStateFn=clientState;host.client.configStringFn=configString
  host.fileListFn=fileList;host.memoryRemainingFn=memory
  host.lan.loadFn=loadServers;host.lan.saveFn=saveServers;host.lan.addFn=addServer;host.lan.removeFn=removeServer
  host.lan.pingQueueCountFn=pingCount;host.lan.clearPingFn=clearPing;host.lan.getPingFn=hostGetPing;host.lan.getPingInfoFn=pingInfo
  host.lan.serverCountFn=serverCount;host.lan.serverAddressFn=serverAddress;host.lan.serverInfoFn=serverInfo;host.lan.serverPingFn=serverPing
  host.lan.markVisibleFn=markVisible;host.lan.isVisibleFn=isVisible;host.lan.updatePingsFn=updatePings;host.lan.resetPingsFn=resetPings
  host.lan.serverStatusFn=status;host.lan.compareFn=compare
  return [vm,host,context]
end function

function main(args)
  f=fixture();vm=f[0];host=f[1];c=f[2];base=65300;count=0
  count=count+req(invoke(host,vm,base,[2])==321,"common delegation")
  put(vm,40,"scripts");put(vm,60,".arena");count=count+req(invoke(host,vm,base,[17,40,60,80,32])==2,"file list count")
  count=count+req(textAt(vm,80)=="q3dm1.arena" and textAt(vm,92)=="q3dm2.arena","file list packed output")
  put(vm,100,"models/mapobjects/teleporter/teleporter.md3");count=count+req(invoke(host,vm,base,[18,100])==11,"model registration")
  put(vm,180,"models/players/sarge/default.skin");count=count+req(invoke(host,vm,base,[19,180])==12,"skin registration")
  put(vm,240,"menu/art/back_0");count=count+req(invoke(host,vm,base,[20,240])==13,"shader registration")
  count=count+req(c.events[0][1]=="models/mapobjects/teleporter/teleporter.md3" and c.events[2][1]=="menu/art/back_0","registration strings")
  invoke(host,vm,base,[21]);count=count+req(c.events[3][0]=="clear","clear scene")
  for i=0 to 3 n.writeU32(vm.data,400+i*4,n.floatBits((i+1)*0.25)) end for
  invoke(host,vm,base,[26,400]);count=count+req(c.events[4][1][0]==0.25 and c.events[4][1][3]==1.0,"color input")
  invoke(host,vm,base,[26,0]);count=count+req(c.events[5][1]==void,"NULL color resets")
  values=[27];for i=1 to 8 values=values+[n.floatBits(i*0.5)] end for;values=values+[77]
  invoke(host,vm,base,values);count=count+req(c.events[6][1][0]==0.5 and c.events[6][1][7]==4.0 and c.events[6][2]==77,"stretch pic floats")
  invoke(host,vm,base,[28]);count=count+req(c.events[7][0]=="update","screen update")

  invoke(host,vm,base,[33,7,500,8]);count=count+req(textAt(vm,500)=="KEY7","key name")
  invoke(host,vm,base,[34,7,520,16]);count=count+req(textAt(vm,520)=="+attack","binding output")
  put(vm,520,"stale");vm.data[519]=91;invoke(host,vm,base,[34,8,520,16]);count=count+req(vm.data[520]==0 and vm.data[521]==116 and vm.data[519]==91,"NULL binding writes only an empty terminator like Key_GetBindingBuf")
  vm.data[520]=93;invoke(host,vm,base,[34,8,520,0]);count=count+req(vm.data[520]==93,"zero-capacity NULL binding output preserves memory")
  invoke(host,vm,base,[34,7,520,3]);count=count+req(textAt(vm,520)=="+a" and vm.data[523]==108,"bound binding output retains truncation and NUL boundary")
  put(vm,550,"+moveleft");invoke(host,vm,base,[35,9,550]);count=count+req(c.events[8]==["bind",9,"+moveleft"],"set binding")
  count=count+req(invoke(host,vm,base,[36,7])==1 and invoke(host,vm,base,[36,8])==0,"key down boolean")
  count=count+req(invoke(host,vm,base,[37])==1,"overstrike state")
  invoke(host,vm,base,[38,0]);count=count+req(c.events[9]==["overstrike",false],"set overstrike")
  invoke(host,vm,base,[39]);count=count+req(c.events[10][0]=="clearKeys","clear key states")
  count=count+req(invoke(host,vm,base,[40])==9,"get catcher")
  invoke(host,vm,base,[41,17]);count=count+req(c.events[11]==["catcher",17],"set catcher")

  invoke(host,vm,base,[42,600,6]);count=count+req(textAt(vm,600)=="clip ","clipboard bounded")
  invoke(host,vm,base,[43,1000]);count=count+req(vm.data[1000]==42 and vm.data[1000+ui.GLCONFIG_SIZE-1]==42,"glconfig layout")
  invoke(host,vm,base,[44,13000]);count=count+req(vm.data[13000]==43 and vm.data[13000+ui.CLIENT_STATE_SIZE-1]==43,"client state layout")
  count=count+req(invoke(host,vm,base,[45,5,17000,24])==1 and textAt(vm,17000)=="sv_hostname\\Test","config string found")
  vm.data[17100]=91;count=count+req(invoke(host,vm,base,[45,6,17100,24])==0 and vm.data[17100]==91,"config string missing")
  count=count+req(invoke(host,vm,base,[52])==765432,"memory remaining")

  count=count+req(invoke(host,vm,base,[46])==3,"ping queue count")
  invoke(host,vm,base,[47,2]);count=count+req(c.events[12]==["clearPing",2],"clear ping")
  invoke(host,vm,base,[48,2,17200,32,17240]);count=count+req(textAt(vm,17200)=="127.0.0.1:27960" and n.readI32(vm.data,17240)==44,"ping result")
  invoke(host,vm,base,[48,3,17250,8,17260]);count=count+req(textAt(vm,17250)=="" and n.readI32(vm.data,17260)==0,"missing ping")
  invoke(host,vm,base,[49,2,17300,32]);count=count+req(textAt(vm,17300)=="\\hostname\\server2","ping info")
  count=count+req(invoke(host,vm,base,[65,2])==12,"server count")
  invoke(host,vm,base,[66,1,2,17400,32]);count=count+req(textAt(vm,17400)=="10.0.1.2:27960","server address")
  invoke(host,vm,base,[67,2,4,17500,32]);count=count+req(textAt(vm,17500)=="\\hostname\\s24","server info")
  invoke(host,vm,base,[68,1,2,1]);count=count+req(c.events[13]==["visible",1,2,true],"mark visible")
  count=count+req(invoke(host,vm,base,[69,2])==1 and invoke(host,vm,base,[69,1])==0,"update visible pings")
  invoke(host,vm,base,[70,3]);count=count+req(c.events[14]==["reset",3],"reset pings")
  invoke(host,vm,base,[71]);invoke(host,vm,base,[72]);count=count+req(c.events[15][0]=="load" and c.events[16][0]=="save","cached servers")
  put(vm,17600,"Local");put(vm,17620,"127.0.0.1:27960");count=count+req(invoke(host,vm,base,[73,0,17600,17620])==1,"add server result")
  count=count+req(c.events[17]==["add",0,"Local","127.0.0.1:27960"],"add server values")
  invoke(host,vm,base,[74,0,17620]);count=count+req(c.events[18]==["remove",0,"127.0.0.1:27960"],"remove server")
  put(vm,17700,"127.0.0.1:27960");count=count+req(invoke(host,vm,base,[82,17700,17800,32])==1 and textAt(vm,17800)=="\\sv_hostname\\ready","server status")
  put(vm,17700,"pending");vm.data[17800]=93;count=count+req(invoke(host,vm,base,[82,17700,17800,32])==0 and vm.data[17800]==93,"pending status")
  count=count+req(invoke(host,vm,base,[83,2,3])==45,"server ping")
  count=count+req(invoke(host,vm,base,[84,1,2])==1 and invoke(host,vm,base,[84,1,3])==0,"server visibility")
  count=count+req(invoke(host,vm,base,[85,1,2,3,8,5])==9,"server comparison")

  count=count+req(try(invoke(host,vm,base,[42,65530,20])) is error,"clipboard output span")
  count=count+req(try(invoke(host,vm,base,[43,60000])) is error,"glconfig output span")
  count=count+req(try(invoke(host,vm,base,[44,64000])) is error,"client state output span")
  count=count+req(try(invoke(host,vm,base,[45,5,0,24])) is error,"NULL config output")
  count=count+req(try(invoke(host,vm,base,[17,40,60,80,-1])) is error,"negative file list capacity")
  count=count+req(try(invoke(host,vm,base,[48,2,18000,32,0])) is error,"NULL ping time")
  count=count+req(try(invoke(host,vm,base,[66,1,2,65530,20])) is error,"server address span")
  count=count+req(try(invoke(host,vm,base,[26,65530])) is error,"color input span")
  host.client.glconfigFn=badGlconfig;count=count+req(try(invoke(host,vm,base,[43,1000])) is error,"glconfig service layout")
  host.client.clientStateFn=badClientState;count=count+req(try(invoke(host,vm,base,[44,13000])) is error,"client state service layout")
  empty=ui.services(host.shared,c);count=count+req(try(invoke(empty,vm,base,[40])) is error,"missing key service")
  count=count+req(try(invoke(host,vm,base,[31])) is error,"unsupported trap")
  count=count+req(try(invoke(host,vm,65534,[2])) is error,"argument vector span")
  invoke(host,vm,base,[42,66000,8]);count=count+req(textAt(vm,464)=="clip te","masked clipboard pointer")

  print "PASS: "+str(count)+" UI-specific syscall contracts";return 0
end function
