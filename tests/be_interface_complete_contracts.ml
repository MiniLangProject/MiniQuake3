import mq3.botlib.be_interface as iface
import mq3.botlib.lifecycle_runtime as lifecycle
import mq3.vm.pc_parser as pc

struct Capture calls failure end struct
function add(capture,name) capture.calls=capture.calls+[name];return 0 end function
function aasSetup(c) return add(c,"aas+") end function
function eaSetup(c) return add(c,"ea+") end function
function weaponSetup(c) return add(c,"weapon+") end function
function goalSetup(c) if c.failure==4 then add(c,"goal!");return 9 end if;return add(c,"goal+") end function
function chatSetup(c) return add(c,"chat+") end function
function moveSetup(c) return add(c,"move+") end function
function chatShutdown(c) return add(c,"chat-") end function
function moveShutdown(c) return add(c,"move-") end function
function goalShutdown(c) return add(c,"goal-") end function
function weaponShutdown(c) return add(c,"weapon-") end function
function weightsShutdown(c) return add(c,"weights-") end function
function charactersShutdown(c) return add(c,"characters-") end function
function aasShutdown(c) return add(c,"aas-") end function
function eaShutdown(c) return add(c,"ea-") end function
function libvarsReleased(c) return add(c,"libvars-") end function
function definesRemoved(c) return add(c,"defines-") end function
function logShutdown(c) return add(c,"log-") end function
function checkSources(c) return add(c,"sources?") end function
function startFrame(c,value) add(c,"frame:"+str(value));if c.failure==1 then return 8 end if;return 0 end function
function loadMap(c,value) add(c,"map:"+value);if c.failure==2 then return 7 end if;return 0 end function
function initItems(c) return add(c,"items") end function
function brushTypes(c) return add(c,"brush") end function
function updateEntity(c,number,present) add(c,"entity:"+str(number)+":"+str(present));if c.failure==3 then return 6 end if;return 0 end function
function configured(capture)
  value=iface.services(capture);value.aasSetupFn=aasSetup;value.eaSetupFn=eaSetup;value.weaponSetupFn=weaponSetup;value.goalSetupFn=goalSetup;value.chatSetupFn=chatSetup;value.moveSetupFn=moveSetup
  value.chatShutdownFn=chatShutdown;value.moveShutdownFn=moveShutdown;value.goalShutdownFn=goalShutdown;value.weaponShutdownFn=weaponShutdown;value.weightsShutdownFn=weightsShutdown;value.charactersShutdownFn=charactersShutdown;value.aasShutdownFn=aasShutdown;value.eaShutdownFn=eaShutdown;value.libvarsReleasedFn=libvarsReleased;value.definesRemovedFn=definesRemoved;value.logShutdownFn=logShutdown;value.checkSourcesFn=checkSources
  value.aasStartFrameFn=startFrame;value.aasLoadMapFn=loadMap;value.initLevelItemsFn=initItems;value.setBrushModelTypesFn=brushTypes;value.aasUpdateEntityFn=updateEntity;return value
end function
function loadFile(context,name) if name=="scripts/test.cfg" then return "#define VALUE 41\nVALUE + 1\n" end if;return void end function
function req(ok,label) if not ok then return error(7749,"be_interface: "+label) end if;return 1 end function
function main(args)
  count=0
  count=count+req(iface.GetBotLibAPI(1,true)==void and iface.GetBotLibAPI(2,false)==void,"API version/import guard")
  api=iface.GetBotLibAPI(2,true);count=count+req(api!=void and len(api.top)==13 and len(api.aas)==22 and len(api.ea)==24 and len(api.ai)==75,"complete 134-slot export surface")
  count=count+req(api.top[0][0]=="BotLibSetup" and api.top[12][1]=="BotExportTest" and api.ai[74][0]=="GeneticParentsAndChildSelection","export endpoints")
  count=count+req(iface.Sys_MilliSeconds(12345,1000)==12345 and iface.Sys_MilliSeconds(1,0)==0,"clock conversion")
  state=lifecycle.create();count=count+req(iface.ValidClientNumber(state,0) and iface.ValidClientNumber(state,128) and not iface.ValidClientNumber(state,129),"client inclusive boundary")
  count=count+req(iface.ValidEntityNumber(state,0) and iface.ValidEntityNumber(state,1024) and not iface.ValidEntityNumber(state,-1),"entity inclusive boundary")
  count=count+req(not iface.BotLibSetup(state) and iface.Export_BotLibStartFrame(state,1.0,iface.services(void))==iface.BLERR_LIBRARYNOTSETUP,"pre-setup guard")
  iface.Export_BotLibVarSet(state,"maxclients","12");iface.Export_BotLibVarSet(state,"maxentities","33");iface.Export_BotLibVarSet(state,"bot_developer","1");iface.Export_BotLibVarSet(state,"long","abcdef")
  count=count+req(iface.Export_BotLibVarGet(state,"LONG",4)=="abc" and iface.Export_BotLibVarGet(state,"missing",4)=="","libvar get truncation")
  capture=Capture([],0);service=configured(capture);count=count+req(iface.Export_BotLibSetup(state,service)==0 and state.setup and state.maxclients==12 and state.maxentities==33 and state.developer==1 and capture.calls==["aas+","ea+","weapon+","goal+","chat+","move+"],"setup order, developer and limits")
  failed=lifecycle.create();failedCapture=Capture([],4);count=count+req(iface.Export_BotLibSetup(failed,configured(failedCapture))==9 and not failed.setup and failedCapture.calls==["aas+","ea+","weapon+","goal!"],"setup short circuit")
  count=count+req(iface.Export_BotLibStartFrame(state,1.25,service)==0 and state.frames==1 and state.time==1.25 and capture.calls[len(capture.calls)-1]=="frame:1.25","frame delegation")
  capture.failure=1;count=count+req(iface.Export_BotLibStartFrame(state,2.0,service)==8 and state.frames==1 and state.time==1.25,"failed frame preserves counters");capture.failure=0
  count=count+req(iface.Export_BotLibLoadMap(state,"q3dm1",service)==0 and state.mapName=="q3dm1" and state.mapLoads==1 and capture.calls[len(capture.calls)-3]=="map:q3dm1" and capture.calls[len(capture.calls)-2]=="items" and capture.calls[len(capture.calls)-1]=="brush","map setup order")
  capture.failure=2;count=count+req(iface.Export_BotLibLoadMap(state,"q3dm2",service)==7 and state.mapName=="q3dm1" and state.mapLoads==1,"failed map preserves active map");capture.failure=0
  count=count+req(iface.Export_BotLibUpdateEntity(state,33,false,service)==0 and state.entityUpdates==1 and state.removedEntities==1,"entity update/removal")
  count=count+req(iface.Export_BotLibUpdateEntity(state,34,true,service)==iface.BLERR_INVALIDENTITYNUMBER and state.entityUpdates==1,"invalid entity rejected")
  count=count+req(iface.Export_BotLibUpdateEntityPlain(state,0,false)==0 and state.entityUpdates==2 and state.removedEntities==2,"callback-free entity removal keeps lifecycle counters")
  count=count+req(iface.Export_BotLibUpdateEntityPlain(state,34,true)==iface.BLERR_INVALIDENTITYNUMBER and state.entityUpdates==2,"callback-free entity update keeps inclusive bounds")
  registry=pc.create(void,loadFile);iface.PC_AddGlobalDefine(registry,"OUTER 9")
  count=count+req(iface.Export_BotLibShutdown(state,service,registry)==0 and capture.calls[len(capture.calls)-12]=="chat-" and capture.calls[len(capture.calls)-11]=="move-" and capture.calls[len(capture.calls)-10]=="goal-" and capture.calls[len(capture.calls)-9]=="weapon-" and capture.calls[len(capture.calls)-8]=="weights-" and capture.calls[len(capture.calls)-7]=="characters-" and capture.calls[len(capture.calls)-6]=="aas-" and capture.calls[len(capture.calls)-5]=="ea-" and capture.calls[len(capture.calls)-4]=="libvars-" and capture.calls[len(capture.calls)-3]=="defines-" and capture.calls[len(capture.calls)-2]=="log-" and capture.calls[len(capture.calls)-1]=="sources?","shutdown order")
  count=count+req(not state.setup and len(state.variables)==0 and len(registry.defines)==0,"shutdown releases variables and defines")
  count=count+req(iface.Export_BotLibShutdown(state,service,registry)==iface.BLERR_LIBRARYNOTSETUP,"repeat shutdown guard")
  count=count+req(iface.PC_AddGlobalDefine(registry,"TEN 10")==1 and len(registry.defines)==1,"global define export")
  handle=iface.PC_LoadSourceHandle(registry,"scripts/test.cfg");token=iface.PC_ReadTokenHandle(registry,handle);location=iface.PC_SourceFileAndLine(registry,handle)
  count=count+req(handle>0 and token.text=="41" and token.intValue==41 and location[0]=="scripts/test.cfg" and location[1]==2 and iface.PC_CheckOpenSourceHandles(registry)==1,"source/token/location exports")
  count=count+req(iface.PC_FreeSourceHandle(registry,handle)==1 and iface.PC_FreeSourceHandle(registry,handle)==0,"source free export")
  count=count+req(iface.PC_SourceFileAndLine(registry,handle)==void,"freed location invalid")
  count=count+req(iface.BotExportTest(7,"x",[1.0,2.0,3.0],[4.0,5.0,6.0])==0,"release test export")
  print("PASS: "+str(count)+" be_interface complete contracts");return 0
end function
