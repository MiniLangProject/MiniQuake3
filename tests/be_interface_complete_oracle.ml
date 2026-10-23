import mq3.botlib.be_interface as iface
import mq3.botlib.lifecycle_runtime as lifecycle
import mq3.vm.pc_parser as pc

struct Capture calls failure end struct
function mark(c,value) c.calls=c.calls+value;return 0 end function
function aasSetup(c) mark(c,"A");if c.failure==1 then return 11 end if;return 0 end function
function eaSetup(c) mark(c,"E");if c.failure==2 then return 12 end if;return 0 end function
function weaponSetup(c) mark(c,"W");if c.failure==3 then return 13 end if;return 0 end function
function goalSetup(c) mark(c,"G");if c.failure==4 then return 14 end if;return 0 end function
function chatSetup(c) mark(c,"C");if c.failure==5 then return 15 end if;return 0 end function
function moveSetup(c) mark(c,"M");if c.failure==6 then return 16 end if;return 0 end function
function chatShutdown(c) return mark(c,"C") end function
function moveShutdown(c) return mark(c,"M") end function
function goalShutdown(c) return mark(c,"G") end function
function weaponShutdown(c) return mark(c,"W") end function
function weightsShutdown(c) return mark(c,"T") end function
function charactersShutdown(c) return mark(c,"H") end function
function aasShutdown(c) return mark(c,"A") end function
function eaShutdown(c) return mark(c,"E") end function
function libvarsReleased(c) return mark(c,"D") end function
function definesRemoved(c) return mark(c,"P") end function
function logShutdown(c) return mark(c,"L") end function
function checkSources(c) return mark(c,"K") end function
function frame(c,value) mark(c,"F");if value<0.0 then return 17 end if;return 0 end function
function loadMap(c,name) mark(c,"Q");if name=="bad" then return 18 end if;return 0 end function
function items(c) return mark(c,"I") end function
function brushes(c) return mark(c,"B") end function
function entity(c,number,present) if present then mark(c,"U") else mark(c,"R") end if;return number+20 end function
function service(c)
  s=iface.services(c);s.aasSetupFn=aasSetup;s.eaSetupFn=eaSetup;s.weaponSetupFn=weaponSetup;s.goalSetupFn=goalSetup;s.chatSetupFn=chatSetup;s.moveSetupFn=moveSetup
  s.chatShutdownFn=chatShutdown;s.moveShutdownFn=moveShutdown;s.goalShutdownFn=goalShutdown;s.weaponShutdownFn=weaponShutdown;s.weightsShutdownFn=weightsShutdown;s.charactersShutdownFn=charactersShutdown;s.aasShutdownFn=aasShutdown;s.eaShutdownFn=eaShutdown
  s.libvarsReleasedFn=libvarsReleased;s.definesRemovedFn=definesRemoved;s.logShutdownFn=logShutdown;s.checkSourcesFn=checkSources;s.aasStartFrameFn=frame;s.aasLoadMapFn=loadMap;s.initLevelItemsFn=items;s.setBrushModelTypesFn=brushes;s.aasUpdateEntityFn=entity;return s
end function
function boolInt(value) if value then return 1 end if;return 0 end function
function noFile(context,name) return void end function
function main(args)
  state=lifecycle.create();state.maxclients=2;state.maxentities=4
  print("valid="+str(boolInt(iface.ValidClientNumber(state,-1)))+","+str(boolInt(iface.ValidClientNumber(state,0)))+","+str(boolInt(iface.ValidClientNumber(state,2)))+","+str(boolInt(iface.ValidEntityNumber(state,-1)))+","+str(boolInt(iface.ValidEntityNumber(state,4)))+","+str(boolInt(iface.ValidEntityNumber(state,5))))
  empty=iface.services(void);print("guard="+str(boolInt(iface.BotLibSetup(state)))+","+str(iface.Export_BotLibStartFrame(state,1.0,empty))+","+str(iface.Export_BotLibLoadMap(state,"q3dm1",empty))+","+str(iface.Export_BotLibUpdateEntity(state,0,true,empty)))
  iface.Export_BotLibVarSet(state,"alpha","abcdef");print("var="+iface.Export_BotLibVarGet(state,"alpha",4)+",alpha")
  iface.Export_BotLibVarSet(state,"maxclients","2");iface.Export_BotLibVarSet(state,"maxentities","4");capture=Capture("",0);s=service(capture);result=iface.Export_BotLibSetup(state,s);print("setup="+str(result)+","+capture.calls+","+str(boolInt(state.setup))+","+str(boolInt(state.setup))+","+str(state.maxclients)+","+str(state.maxentities))
  capture.calls="";result=iface.Export_BotLibStartFrame(state,1.25,s);print("frame="+str(result)+","+capture.calls)
  capture.calls="";result=iface.Export_BotLibStartFrame(state,-1.0,s);print("framefail="+str(result)+","+capture.calls)
  capture.calls="";result=iface.Export_BotLibLoadMap(state,"q3dm1",s);print("map="+str(result)+","+capture.calls)
  capture.calls="";result=iface.Export_BotLibLoadMap(state,"bad",s);print("mapfail="+str(result)+","+capture.calls)
  capture.calls="";result=iface.Export_BotLibUpdateEntity(state,4,true,s);print("entity="+str(result)+","+capture.calls)
  capture.calls="";result=iface.Export_BotLibUpdateEntity(state,0,false,s);print("remove="+str(result)+","+capture.calls)
  capture.calls="";result=iface.Export_BotLibUpdateEntity(state,5,true,s);print("entitybad="+str(result)+","+capture.calls)
  registry=pc.create(void,noFile);capture.calls="";result=iface.Export_BotLibShutdown(state,s,registry);print("shutdown="+str(result)+","+capture.calls+","+str(boolInt(state.setup))+","+str(boolInt(state.setup)))
  capture.calls="";result=iface.Export_BotLibShutdown(state,s,registry);print("shutdown2="+str(result)+","+capture.calls)
  failed=lifecycle.create();failedCapture=Capture("",4);result=iface.Export_BotLibSetup(failed,service(failedCapture));print("setupfail="+str(result)+","+failedCapture.calls+","+str(boolInt(failed.setup))+","+str(boolInt(failed.setup)))
  print("test="+str(iface.BotExportTest(0,void,void,void)));return 0
end function
