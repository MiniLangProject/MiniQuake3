import mq3.client.cl_ui_runtime as clui
import mq3.client.ui_lan_browser as lan
import mq3.client.ui_lan_cache as cache
import mq3.client.ui_host_lifecycle as hostState
import mq3.client.ui_vm as uiVm
import mq3.vm.syscall_ui as syscallUi
import mq3.vm.syscall_common as common
import mq3.qcommon.cvar as cvar
import mq3.qcommon.command_buffer as commands
import mq3.compat.numeric as n
import mq3.shared.info as info

struct Machine data mask end struct
struct Context cache version mode events catcher end struct
struct Memory data reads writes end struct
struct Slot active end struct
function req(ok,label) if not ok then return error(7802,"cl_ui contract: "+label) end if;return 1 end function
function cacheRead(context,name) if context.cache==void then return error(7802,"missing cache") end if;return context.cache end function
function cacheWrite(context,name,data) context.cache=data;return true end function
function memoryRead(context,name) context.reads=context.reads+1;return context.data end function
function memoryWrite(context,name,data) context.writes=context.writes+1;context.data=data;return true end function
function vmSyscall(machine,address) return 0 end function
function loadVm(context,name,callback,mode) context.mode=mode;return Slot(true) end function
function callVm(context,slot,args) context.events=context.events+[args];if args[0]==uiVm.UI_GETAPIVERSION then return context.version end if;if args[0]==uiVm.UI_HASUNIQUECDKEY or args[0]==uiVm.UI_CONSOLE_COMMAND then return 1 end if;return args[0] end function
function freeVm(context,slot) slot.active=false;return void end function
function tick(context) return 777 end function
function keyName(context,key) return "KEY"+str(key) end function
function binding(context,key) if key==7 then return "+attack" end if;return "" end function
function getCatcher(context) return context.catcher end function
function setCatcher(context,value) context.catcher=value;return void end function
function trap(state,vm,base,values) for index=0 to len(values)-1 n.writeU32(vm.data,base+index*4,values[index]) end for;return clui.CL_UISystemCalls(state,vm,base) end function

function main(args)
  count=0;context=Context(void,uiVm.UI_API_VERSION,0,[],11);browser=lan.create();memory=Memory(void,0,0);cacheHost=cache.services(memoryRead,memoryWrite,memory)
  shared=common.services(cvar.create(),commands.create(),context);shared.millisecondsFn=tick;syscallHost=syscallUi.services(shared,context);syscallHost.keys.keyNameFn=keyName;syscallHost.keys.bindingFn=binding;syscallHost.keys.getCatcherFn=getCatcher;syscallHost.keys.setCatcherFn=setCatcher
  uiHost=uiVm.services(context,vmSyscall,loadVm,callVm,freeVm);ui=uiVm.create(uiHost);client=hostState.createClientState(hostState.CA_CHALLENGING,3,4,"server","update","message")
  configs=array(clui.MAX_CONFIGSTRINGS,"");configs[7]="hello";state=clui.create(browser,cacheHost,void,syscallHost,ui,client,bytes(syscallUi.GLCONFIG_SIZE,42),configs);state.clipboard="clipboard"
  count=count+req(state.cacheHost==cacheHost,"facade cache host")
  encoded=clui.GetClientState(state);count=count+req(len(encoded)==hostState.CLIENT_STATE_SIZE and n.readI32(encoded,0)==hostState.CA_CHALLENGING and n.readI32(encoded,4)==3 and n.readI32(encoded,8)==4,"client state ABI")
  count=count+req(len(clui.CL_GetGlconfig(state))==syscallUi.GLCONFIG_SIZE and clui.CL_GetGlconfig(state)[0]==42,"glconfig copy")
  count=count+req(clui.GetClipboardData(state,5)=="clip" and clui.GetClipboardData(state,0)=="","clipboard bounds")
  count=count+req(clui.Key_KeynumToStringBuf(state,7,16)=="KEY7" and clui.Key_GetBindingBuf(state,7,16)=="+attack","key strings")
  count=count+req(clui.Key_GetCatcher(state)==11,"key catcher get");clui.Key_SetCatcher(state,19);count=count+req(context.catcher==19 and state.keyCatchers==19,"key catcher set")
  count=count+req(clui.GetConfigString(state,7,4)=="hel" and clui.GetConfigString(state,8,16)==void and clui.GetConfigString(state,-1,16)==void,"config strings")
  count=count+req(clui.FloatAsInt(1.0)==0x3f800000 and clui.FloatAsInt(-2.5)==n.i32(0xc0200000),"FloatAsInt bit cast")

  count=count+req(clui.LAN_AddServer(state,lan.AS_GLOBAL,"Zulu","127.0.0.1:27960")==1,"LAN add");count=count+req(clui.LAN_AddServer(state,lan.AS_GLOBAL,"again","127.0.0.1:27960")==0,"LAN duplicate")
  count=count+req(clui.LAN_GetServerCount(state,lan.AS_GLOBAL)==1 and clui.LAN_GetServerPtr(state,lan.AS_GLOBAL,0).hostName=="Zulu","LAN count/pointer")
  count=count+req(clui.LAN_GetServerAddressString(state,lan.AS_GLOBAL,0,10)=="127.0.0.1","LAN bounded address")
  lan.updateServer(browser,lan.AS_GLOBAL,0,"q3dm1",2,8,35,0,100,"baseq3",0,1,0,"ready");text=clui.LAN_GetServerInfo(state,lan.AS_GLOBAL,0,1024)
  count=count+req(info.value(text,"hostname")=="Zulu" and info.value(text,"mapname")=="q3dm1" and clui.LAN_GetServerPing(state,lan.AS_GLOBAL,0)==35,"LAN info/ping")
  count=count+req(clui.LAN_CompareServers(state,lan.AS_GLOBAL,lan.SORT_HOST,0,0,0)==0,"LAN compare")
  count=count+req(clui.LAN_ServerIsVisible(state,lan.AS_GLOBAL,0),"LAN visible");clui.LAN_MarkServerVisible(state,lan.AS_GLOBAL,-1,false);count=count+req(not clui.LAN_ServerIsVisible(state,lan.AS_GLOBAL,0),"LAN mark all")
  clui.LAN_ResetPings(state,lan.AS_GLOBAL);count=count+req(clui.LAN_GetServerPing(state,lan.AS_GLOBAL,0)==-1,"LAN reset pings")
  lan.queuePing(browser,"127.0.0.1:27960",23,"\\hostname\\Zulu");count=count+req(clui.LAN_GetPingQueueCount(state)==1,"ping count");ping=clui.LAN_GetPing(state,0,10);count=count+req(ping[0]=="127.0.0.1" and ping[1]==23,"ping bounded result")
  count=count+req(info.value(clui.LAN_GetPingInfo(state,0,64),"hostname")=="Zulu","ping info");clui.LAN_ClearPing(state,0);count=count+req(clui.LAN_GetPingQueueCount(state)==0,"clear ping")
  status=clui.LAN_GetServerStatus(state,"127.0.0.1:27960",4);count=count+req(status[0] and status[1]=="rea","server status")
  clui.LAN_MarkServerVisible(state,lan.AS_GLOBAL,0,true);count=count+req(clui.LAN_UpdateVisiblePings(state,lan.AS_GLOBAL),"visible ping work")
  count=count+req(len(cache.encode(state.browser))==cache.CACHE_SIZE,"cache encoding");count=count+req(clui.LAN_SaveServersToCache(state) and memory.writes==1,"cache save");clui.LAN_RemoveServer(state,lan.AS_GLOBAL,"127.0.0.1:27960");count=count+req(clui.LAN_GetServerCount(state,lan.AS_GLOBAL)==0,"LAN remove")
  loadedCache=clui.LAN_LoadCachedServers(state);count=count+req(loadedCache and clui.LAN_GetServerCount(state,lan.AS_GLOBAL)==1,"cache load reads "+str(memory.reads)+" size "+str(len(memory.data)))

  vm=Machine(bytes(256,0),255);count=count+req(trap(state,vm,224,[2])==777,"CL_UISystemCalls delegation")
  slot=clui.CL_InitUI(state,hostState.CA_CHALLENGING,1,0);count=count+req(slot==ui.slot and context.mode==uiVm.VMI_COMPILED and ui.lastArgs[0]==uiVm.UI_INIT and ui.lastArgs[1]==1,"CL_InitUI pure connecting")
  state.fsGame="missionpack";state.cdKey="0123456789ABCDEFabcdefghijklmnop";count=count+req(clui.UI_usesUniqueCDKey(state) and clui.CLUI_GetCDKey(state,17)=="abcdefghijklmnop","unique mod CD key")
  clui.CLUI_SetCDKey(state,"FEDCBA9876543210");count=count+req(clui.CLUI_GetCDKey(state,17)=="FEDCBA9876543210" and (state.modifiedFlags&clui.CVAR_ARCHIVE)!=0,"set mod CD key")
  state.realtime=1234;count=count+req(clui.UI_GameCommand(state) and ui.lastArgs[1]==1234,"UI console command")
  context.catcher=15;state.keyCatchers=8;clui.CL_ShutdownUI(state);count=count+req(not ui.active and context.catcher==13 and state.keyCatchers==13,"CL_ShutdownUI clears authoritative host catcher")
  detached=clui.create(browser,cacheHost,void,syscallHost,void,client,bytes(syscallUi.GLCONFIG_SIZE,0),configs);context.catcher=7;detached.keyCatchers=0;clui.CL_ShutdownUI(detached);count=count+req(context.catcher==5 and detached.keyCatchers==5,"CL_ShutdownUI clears catcher without VM")
  count=count+req(not clui.UI_usesUniqueCDKey(state) and not clui.UI_GameCommand(state),"inactive UI helpers")
  print("PASS: "+str(count)+" complete cl_ui contracts");return 0
end function
