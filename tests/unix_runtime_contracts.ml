import std.fs as fs
import mq3.platform.unix_runtime as u

struct Context calls end struct
function frameStep(context) context.calls=context.calls+1;return void end function
function syscall(machine,address) return 0 end function
function req(value,label) if not value then return error(7982,"Unix runtime contract: "+label) end if;return 1 end function
function main(args)
  count=0
  count=count+req(len(u.linuxCommonSymbols())==4 and len(u.linuxGlimpSymbols())==35 and len(u.linuxJoystickSymbols())==2,"Linux core surfaces")
  count=count+req(len(u.linuxQglSymbols())==341 and len(u.unixMainSymbols())==43,"QGL/main surfaces")
  count=count+req(len(u.unixNetSymbols())==16 and len(u.unixSharedSymbols())==20 and len(u.unixVmX86Symbols())==2,"network/shared/VM surfaces")
  state=u.create();source=bytes([1,2,3,4,5]);target=bytes(5,0);u.Com_Memcpy(target,1,source,2,3)
  count=count+req(target[1]==3 and target[3]==5,"memory copy")
  u.Com_Memset(target,0,0xaa,2);count=count+req(target[0]==0xaa and target[1]==0xaa and u.Com_Prefetch(target,5)==5,"memory set/prefetch")
  count=count+req(u.Q_stristr("Quake III Arena","III")==6 and u.Q_stristr("abc","Z")==-1,"case insensitive search")
  count=count+req(u.GLimp_Init(state) and state.glInitialized and u.GLW_SetMode(state,3,false)==0,"GL init/mode")
  u.GLimp_SetGamma(state,[1],[2],[3]);count=count+req(len(state.gamma)==3 and u.GLimp_EndFrame(state),"gamma/frame")
  u.GLimp_LogComment(state,"off");state.logging=true;u.GLimp_LogComment(state,"on");count=count+req(len(state.events)>=2,"GL logging")
  u.IN_Init(state);u.IN_StartupJoystick(state);u.IN_JoyMove(state,[1,2]);count=count+req(state.inputInitialized and state.joystickInitialized,"input/joystick")
  u.install_grabs(state);u.uninstall_grabs(state);count=count+req(not state.active and u.XLateKey(state,42)==42,"input grabs/key translation")
  u.InitSig(state);count=count+req(state.signals and try(u.signal_handler(state,11)) is error,"signal handling")
  count=count+req(u.SNDDMA_Init(state) and u.SNDDMA_BeginPainting(state) and u.SNDDMA_Submit(state),"DMA lifecycle")
  u.SNDDMA_Shutdown(state);count=count+req(not state.soundInitialized and u.SNDDMA_GetDMAPos(state)==0,"DMA shutdown")
  u.Hist_Add(state,"one");u.Hist_Add(state,"two");count=count+req(u.Hist_Prev(state)=="two" and u.Hist_Prev(state)=="one" and u.Hist_Next(state)=="two","console history")
  u.Sys_Print(state,"hello");u.Sys_Warn(state,"warn");count=count+req(len(state.warnings)==1 and len(state.events)>0,"print/warn")
  u.Sys_QueEvent(state,3,"queued",1,2);event=u.Sys_GetEvent(state);count=count+req(event.kind=="queued" and event.value1==1 and len(state.events)>0,"event queue isolation")
  loopback=u.Sys_StringToAdr("localhost");remote=u.Sys_StringToAdr("192.168.1.4:27961")
  count=count+req(loopback.type==u.NA_LOOPBACK and remote.type==u.NA_IP and remote.port==27961,"address parsing")
  count=count+req(u.Sys_IsLANAddress(loopback) and u.Sys_IsLANAddress(remote) and not u.Sys_IsLANAddress(u.Sys_StringToAdr("8.8.8.8")),"LAN classification")
  u.Sys_SendPacket(state,3,bytes([7,8,9,10]),remote);count=count+req(len(state.packets)==1 and len(state.packets[0][1])==3 and u.Sys_GetPacket(state)==void,"packet I/O")
  u.Sys_SetDefaultCDPath(state,"/cd");u.Sys_SetDefaultHomePath(state,"/home");u.Sys_SetDefaultInstallPath(state,"/opt/q3")
  count=count+req(u.Sys_DefaultCDPath(state)=="/cd" and u.Sys_DefaultHomePath(state)=="/home" and u.Sys_DefaultInstallPath(state)=="/opt/q3","default paths")
  state.user="player";state.currentTime=1234;count=count+req(u.Sys_GetCurrentUser(state)=="player" and u.Sys_Milliseconds(state)==1234 and u.Sys_ProcessorCount(state)==1,"shared system values")
  count=count+req(u.Sys_SnapVector([1.9,-2.9,3.1])==[1,-2,3] and u.fastftol(-2.9)==-2 and u.strlwr("Q3A")=="q3a","numeric/shared helpers")
  count=count+req(u.NET_IPSocket("",27960)==1 and u.NET_BaseAdrToString(remote)=="192.168.1.4","network socket facade")
  image=fs.readAllBytes(args[0]);compiled=u.VM_Compile(image,syscall);count=count+req(u.VM_CallCompiled(compiled,[0])==42 and compiled.architecture=="x86","Unix compiled VM")
  context=Context(0);u.unixMain(state,3,frameStep,context);count=count+req(context.calls==3,"bounded Unix loop")
  u.Sys_Quit(state);u.unixMain(state,3,frameStep,context);count=count+req(context.calls==3 and state.quitRequested,"quit stops loop")
  u.GLimp_Shutdown(state);u.IN_Shutdown(state);count=count+req(not state.glInitialized and not state.inputInitialized,"platform shutdown")
  print "PASS: "+str(count)+" Unix platform contracts";return 0
end function

