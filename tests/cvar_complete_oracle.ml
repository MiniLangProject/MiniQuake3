// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.qcommon.cvar as cvar
import mq3.compat.textnumbers as textnumbers
struct Completion names count end struct
function complete(context,name)
  if context.count>0 then context.names=context.names+"," end if
  context.names=context.names+name;context.count=context.count+1;return void
end function
function completionCallback(context) return function(name) => complete(context,name) end function
function nullable(value) if value==void then return "<null>" end if;return value end function
function main(args)
  registry=cvar.create()
  cvar.get(registry,"MiXeD","12.75",0)
  print "lookup|"+textnumbers.fixed6(cvar.variableValue(registry,"mixed"))+"|"+str(cvar.variableIntegerValue(registry,"MIXED"))+"|"+cvar.variableString(registry,"mIxEd")
  print "buffer|"+cvar.variableStringBuffer(registry,"mixed",5)+"|missing="+cvar.variableString(registry,"absent")
  cvar.get(registry,"bad;name","one",0);cvar.get(registry,"bad\\name","two",0);cvar.get(registry,"bad\"name","three",0)
  print "validation|"+cvar.variableString(registry,"BADNAME")+"|"+str(cvar.variableIntegerValue(registry,"bad;name"))
  registry.modifiedFlags=0;variable=cvar.set2(registry,"adopt","user",false);print "adopt0|"+variable.string+"|"+variable.resetString+"|"+str(variable.flags)
  variable=cvar.get(registry,"adopt","engine",cvar.SERVERINFO);print "adopt1|"+variable.string+"|"+variable.resetString+"|"+str(variable.flags)+"|dirty="+str(registry.modifiedFlags)
  variable=cvar.get(registry,"latched","base",cvar.LATCH);cvar.setLatched(registry,"latched","next");print "latch0|"+variable.string+"|"+variable.latchedString+"|"+str(variable.modificationCount)
  cvar.get(registry,"latched","base",cvar.LATCH);print "latch1|"+variable.string+"|"+nullable(variable.latchedString)+"|"+str(variable.modificationCount)
  cvar.get(registry,"number","0",0);cvar.setValue(registry,"number",2.0);print "setvalue0|"+cvar.variableString(registry,"number")
  cvar.setValue(registry,"number",1.25);print "setvalue1|"+cvar.variableString(registry,"number")
  cvar.reset(registry,"number");print "reset|"+cvar.variableString(registry,"number")
  cvar.get(registry,"alpha","one",cvar.SERVERINFO);cvar.get(registry,"beta","two",cvar.SERVERINFO)
  print "info|"+cvar.infoString(registry,cvar.SERVERINFO);print "big|"+cvar.infoStringBig(registry,cvar.SERVERINFO)
  print "infobuf|"+cvar.infoStringBuffer(registry,cvar.SERVERINFO,5)
  vm=cvar.createVm();cvar.registerVm(registry,vm,"vmprobe","7.5",cvar.ARCHIVE)
  print "vm0|"+str(vm.handle)+"|"+str(vm.modificationCount)+"|"+textnumbers.fixed6(vm.value)+"|"+str(vm.integer)+"|"+vm.string
  cvar.set(registry,"vmprobe","9");print "vmstale|"+str(vm.modificationCount)+"|"+vm.string;cvar.updateVm(registry,vm)
  print "vm1|"+str(vm.modificationCount)+"|"+textnumbers.fixed6(vm.value)+"|"+str(vm.integer)+"|"+vm.string
  variable=cvar.get(registry,"cheatprobe","safe",cvar.CHEAT);cvar.set(registry,"cheatprobe","unsafe");cvar.setCheatState(registry);print "cheat|"+variable.string+"|"+str(variable.modificationCount)
  completion=Completion("",0);cvar.commandCompletion(registry,completionCallback(completion));print "completion|"+str(completion.count)+"|"+completion.names
  print "PASS: 18 original cvar API records";return 0
end function
