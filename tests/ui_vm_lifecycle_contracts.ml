import mq3.client.ui_vm as uiVm
struct Context events version mode end struct
struct Slot active end struct
function syscall(machine,address) return 0 end function
function loadVm(context,name,callback,mode) context.mode=mode;context.events=context.events+"load:"+name+",";return Slot(true) end function
function callVm(context,slot,args) if not slot.active then return error(3458,"inactive mock") end if;if args[0]==uiVm.UI_GETAPIVERSION then return context.version end if;if args[0]==uiVm.UI_IS_FULLSCREEN or args[0]==uiVm.UI_HASUNIQUECDKEY then return 1 end if;return args[0] end function
function freeVm(context,slot) slot.active=false;context.events=context.events+"free,";return void end function
function req(value,label) if not value then return error(3459,"UI VM contract: "+label) end if;return 1 end function
function main(args)
  count=0;context=Context("",uiVm.UI_API_VERSION,0);host=uiVm.services(context,syscall,loadVm,callVm,freeVm);state=uiVm.create(host);state.keyCatchers=15
  count=count+req(not state.active and not state.uiStarted,"fresh")
  slot=uiVm.initialize(state,5,1,0)
  count=count+req(state.active and state.uiStarted and slot==state.slot,"init")
  count=count+req(state.apiVersion==6 and context.mode==uiVm.VMI_COMPILED,"version and pure mode")
  count=count+req(state.lastExport==uiVm.UI_INIT and state.lastArgs[1]==1,"connecting init")
  count=count+req(context.events=="load:ui,","load order")
  count=count+req(uiVm.keyEvent(state,27,true)==uiVm.UI_KEY_EVENT and state.lastArgs[2]==1,"key")
  count=count+req(uiVm.mouseEvent(state,-3,9)==uiVm.UI_MOUSE_EVENT,"mouse")
  count=count+req(uiVm.refresh(state,1234)==uiVm.UI_REFRESH,"refresh")
  count=count+req(uiVm.isFullscreen(state),"fullscreen")
  count=count+req(uiVm.setActiveMenu(state,2)==uiVm.UI_SET_ACTIVE_MENU,"menu")
  count=count+req(uiVm.consoleCommand(state,1300)==uiVm.UI_CONSOLE_COMMAND and state.lastArgs[1]==1300,"console")
  count=count+req(uiVm.drawConnectScreen(state,true)==uiVm.UI_DRAW_CONNECT_SCREEN and state.lastArgs[1]==1,"connect screen")
  count=count+req(uiVm.usesUniqueCdKey(state),"unique key")
  old=state.slot;calls=state.callCount;uiVm.shutdown(state)
  count=count+req(not state.active and not state.uiStarted and not old.active,"shutdown")
  count=count+req(state.keyCatchers==13 and state.lastExport==uiVm.UI_SHUTDOWN and state.callCount==calls+1,"shutdown state")
  uiVm.shutdown(state);count=count+req(state.callCount==calls+1,"repeat shutdown")
  count=count+req(uiVm.consoleCommand(state,0)==0 and not uiVm.usesUniqueCdKey(state),"inactive helpers")
  context.version=uiVm.UI_OLD_API_VERSION;slot2=uiVm.initialize(state,8,0,1)
  count=count+req(state.active and state.uiStarted and state.lastArgs[1]==0 and context.mode==1,"old API accepted")
  uiVm.shutdown(state)
  context.version=5;count=count+req(try(uiVm.initialize(state,2,0,1)) is error and state.active and not state.uiStarted,"bad API rejected")
  uiVm.shutdown(state)
  count=count+req(try(uiVm.refresh(state,0)) is error,"inactive export")
  count=count+req(try(uiVm.create(uiVm.services(void,syscall,loadVm,callVm,freeVm))) is error,"runtime required")
  count=count+req(uiVm.UI_OLD_API_VERSION==4 and uiVm.UI_API_VERSION==6,"API constants")
  print "PASS: "+str(count)+" UI VM lifecycle contracts";return 0
end function
