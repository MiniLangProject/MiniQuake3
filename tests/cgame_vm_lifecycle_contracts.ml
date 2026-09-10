import mq3.client.cgame_vm as cgameVm
struct Context events clock mode end struct
struct Slot active end struct
function syscall(machine,address) return 0 end function
function loadVm(context,name,callback,mode) context.mode=mode;context.events=context.events+"load:"+name+",";return Slot(true) end function
function callVm(context,slot,args) if not slot.active then return error(3448,"inactive mock") end if;return args[0] end function
function freeVm(context,slot) slot.active=false;context.events=context.events+"free,";return void end function
function milliseconds(context) value=context.clock;context.clock=context.clock+25;context.events=context.events+"time,";return value end function
function closeConsole(context) context.events=context.events+"close-console,";return void end function
function serverInfo(context) context.events=context.events+"serverinfo,";return "\\sv_hostname\\Arena\\mapname\\q3dm17\\sv_pure\\1" end function
function endRegistration(context) context.events=context.events+"end-registration,";return void end function
function lowMemory(context) context.events=context.events+"low-memory,";return false end function
function touchMemory(context) context.events=context.events+"touch-memory,";return void end function
function clearNotify(context) context.events=context.events+"clear-notify,";return void end function
function req(value,label) if not value then return error(3449,"cgame VM contract: "+label) end if;return 1 end function
function main(args)
  count=0;context=Context("",100,0);host=cgameVm.services(context,syscall,loadVm,callVm,freeVm);host.context=context
  host.millisecondsFn=milliseconds;host.closeConsoleFn=closeConsole;host.serverInfoFn=serverInfo;host.endRegistrationFn=endRegistration;host.lowMemoryFn=lowMemory;host.touchMemoryFn=touchMemory;host.clearNotifyFn=clearNotify
  state=cgameVm.create(host);state.keyCatchers=15
  count=count+req(not state.active and not state.cgameStarted,"fresh state")
  slot=cgameVm.initialize(state,51,48,2,1,0)
  count=count+req(state.active and state.cgameStarted and slot==state.slot,"loaded")
  count=count+req(state.connectionState==cgameVm.CA_PRIMED and context.mode==cgameVm.VMI_COMPILED,"pure forces compiled")
  count=count+req(state.mapname=="maps/q3dm17.bsp" and state.loadMilliseconds==25,"map and duration")
  count=count+req(state.lastExport==cgameVm.CG_INIT and state.lastArgs[1]==51 and state.lastArgs[2]==48 and state.lastArgs[3]==2,"CG_INIT arguments")
  count=count+req(context.events=="time,close-console,serverinfo,load:cgame,time,end-registration,low-memory,touch-memory,clear-notify,","init order")
  count=count+req(cgameVm.consoleCommand(state)==cgameVm.CG_CONSOLE_COMMAND,"console")
  count=count+req(cgameVm.drawActiveFrame(state,900,2,true)==cgameVm.CG_DRAW_ACTIVE_FRAME and state.lastArgs[1]==900 and state.lastArgs[2]==2 and state.lastArgs[3]==1,"draw")
  count=count+req(cgameVm.crosshairPlayer(state)==cgameVm.CG_CROSSHAIR_PLAYER,"crosshair")
  count=count+req(cgameVm.lastAttacker(state)==cgameVm.CG_LAST_ATTACKER,"attacker")
  count=count+req(cgameVm.keyEvent(state,13,true)==cgameVm.CG_KEY_EVENT and state.lastArgs[2]==1,"key")
  count=count+req(cgameVm.mouseEvent(state,-4,7)==cgameVm.CG_MOUSE_EVENT,"mouse")
  count=count+req(cgameVm.eventHandling(state,3)==cgameVm.CG_EVENT_HANDLING,"event handling")
  calls=state.callCount;old=state.slot;cgameVm.shutdown(state)
  count=count+req(not state.active and not state.cgameStarted and not old.active,"shutdown")
  count=count+req(state.keyCatchers==7 and state.lastExport==cgameVm.CG_SHUTDOWN and state.callCount==calls+1,"shutdown state")
  cgameVm.shutdown(state);count=count+req(state.callCount==calls+1,"repeat shutdown")
  count=count+req(cgameVm.consoleCommand(state)==0,"inactive console")
  count=count+req(try(cgameVm.drawActiveFrame(state,0,0,false)) is error,"inactive draw")
  slot2=cgameVm.initialize(state,0,0,0,0,1);count=count+req(state.active and slot2==state.slot and context.mode==1,"reload after shutdown");cgameVm.shutdown(state)
  count=count+req(try(cgameVm.create(cgameVm.services(void,syscall,loadVm,callVm,freeVm))) is error,"runtime required")
  print "PASS: "+str(count)+" cgame VM lifecycle contracts";return 0
end function
