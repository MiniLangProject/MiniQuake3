// SPDX-License-Identifier: GPL-2.0-or-later
import std.fs as fs
import mq3.vm.runtime as runtime

struct Context image events loads end struct
function loader(host,path) host.context.loads=host.context.loads+1;if path=="vm/qagame.qvm" or path=="vm/cgame.qvm" or path=="vm/ui.qvm" or path=="vm/extra.qvm" then return host.context.image end if;return void end function
function diagnostic(host,kind,name) host.context.events=host.context.events+kind+":"+name+",";return void end function
function syscall(machine,address) return 0 end function
function req(value,label) if not value then return error(3419,"VM runtime: "+label) end if;return 1 end function
function main(args)
  count=0;context=Context(fs.readAllBytes(args[0]),"",0);host=runtime.services();host.context=context;host.loadFn=loader;host.diagnosticFn=diagnostic
  state=runtime.create(host);game=runtime.load(state,"qagame",syscall)
  count=count+req(game.active and game.generation==1 and context.loads==1,"first load")
  count=count+req(runtime.call(state,game,[0])==42 and state.current==void,"call and restore current")
  count=count+req(runtime.load(state,"QAGAME",syscall)==game and context.loads==1,"case-insensitive reuse")
  cgame=runtime.load(state,"cgame",syscall);ui=runtime.load(state,"ui",syscall)
  count=count+req(cgame!=game and ui!=game and context.loads==3,"three slots")
  count=count+req(try(runtime.load(state,"extra",syscall)) is error,"slot limit")
  before=game.machine;runtime.restart(state,game)
  count=count+req(game.machine!=before and game.generation==2 and runtime.call(state,game,[])==42,"restart reloads")
  count=count+req(context.loads==4 and context.events=="load:qagame,load:cgame,load:ui,restart:qagame,","lifecycle diagnostics")
  runtime.free(state,cgame);count=count+req(not cgame.active and runtime.find(state,"cgame")==void,"free")
  replacement=runtime.load(state,"extra",syscall);count=count+req(replacement==cgame and replacement.generation==2,"slot reuse generation")
  count=count+req(try(runtime.call(state,void,[])) is error,"invalid call")
  count=count+req(try(runtime.restart(state,void)) is error,"invalid restart")
  count=count+req(try(runtime.load(state,"",syscall)) is error,"empty name")
  count=count+req(try(runtime.load(state,"missing",syscall)) is error,"missing image")
  state.current=game;count=count+req(try(runtime.free(state,game)) is error and game.active,"current free rejected");state.current=void
  runtime.freeAll(state);count=count+req(runtime.find(state,"qagame")==void and runtime.find(state,"extra")==void,"free all")
  count=count+req(context.events=="load:qagame,load:cgame,load:ui,restart:qagame,free:cgame,load:extra,free:qagame,free:extra,free:ui,","ordered diagnostics")
  count=count+req(try(runtime.create(runtime.services())) is error,"loader required")
  print "PASS: "+str(count)+" VM runtime contracts";return 0
end function
