// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.qcommon.cvar as cvar
import std.string as strings

struct Seen values end struct
function collect(seen,name) seen.values=seen.values+[name];return void end function
function collector(seen) return function(name) => collect(seen,name) end function
function req(ok,label) if not ok then return error(3302,"cvar complete contract: "+label) end if;return 1 end function

function main(args)
  count=0;registry=cvar.create()
  count=count+req(cvar.generateHashValue("abc")==210 and cvar.generateHashValue("ABC")==210,"ASCII case-insensitive hash")
  count=count+req(cvar.generateHashValue("")==0 and cvar.generateHashValue(void)==0,"empty hash")
  count=count+req(cvar.validName("clean_name") and not cvar.validName("bad;name") and not cvar.validName("bad\\name") and not cvar.validName("bad\"name") and not cvar.validName(void),"name validation")
  original=cvar.get(registry,"Mixed","12.75",0)
  count=count+req(cvar.find(registry,"mIXED")==original,"case-insensitive find")
  count=count+req(cvar.variableValue(registry,"MIXED")==12.75 and cvar.variableIntegerValue(registry,"mixed")==12,"numeric lookup")
  count=count+req(cvar.variableString(registry,"mixed")=="12.75" and cvar.variableString(registry,"missing")=="","string lookup")
  count=count+req(cvar.variableStringBuffer(registry,"mixed",5)=="12.7" and cvar.variableStringBuffer(registry,"missing",1)=="","buffer truncation")
  count=count+req(try(cvar.variableStringBuffer(registry,"mixed",0)) is error,"invalid buffer size")
  invalid=cvar.get(registry,"bad;name","value",0);count=count+req(invalid.name=="BADNAME" and cvar.find(registry,"bad;name")==void,"invalid name fallback")
  registry.modifiedFlags=0;adopt=cvar.set2(registry,"adopt","user",false);cvar.get(registry,"adopt","engine",cvar.SERVERINFO)
  count=count+req(adopt.string=="user" and adopt.resetString=="engine" and adopt.flags==cvar.SERVERINFO and registry.modifiedFlags==cvar.SERVERINFO,"user-created adoption")
  latch=cvar.get(registry,"latch","base",cvar.LATCH);cvar.setLatched(registry,"latch","next")
  count=count+req(latch.string=="base" and latch.latchedString=="next" and latch.modificationCount==2,"latched write")
  cvar.get(registry,"latch","base",cvar.LATCH);count=count+req(latch.string=="next" and latch.latchedString==void and latch.modificationCount==3,"get applies latch")
  number=cvar.get(registry,"number","0",0);cvar.setValue(registry,"number",2.0);count=count+req(number.string=="2","integral SetValue format")
  cvar.setValue(registry,"number",1.25);count=count+req(number.string=="1.250000" and number.value==1.25,"fractional SetValue format")
  cvar.reset(registry,"number");count=count+req(number.string=="0","reset wrapper")
  rom=cvar.get(registry,"rom","base",cvar.ROM);registry.modifiedFlags=0;cvar.setLatched(registry,"rom","blocked")
  count=count+req(rom.string=="base" and rom.modificationCount==1 and (registry.modifiedFlags&cvar.ROM)!=0,"ROM blocks after dirty mark")
  cvar.set(registry,"rom","forced");count=count+req(rom.string=="forced" and rom.modificationCount==2,"forced set wrapper")
  cvar.set(registry,"sv_cheats","0");cheat=cvar.get(registry,"cheat","safe",cvar.CHEAT);registry.modifiedFlags=0;cvar.setLatched(registry,"cheat","blocked")
  count=count+req(cheat.string=="safe" and cheat.modificationCount==1 and registry.modifiedFlags==cvar.CHEAT,"cheat protection")
  cvar.set(registry,"cheat","unsafe");cvar.setLatched(registry,"cheat","pending");cvar.setCheatState(registry)
  count=count+req(cheat.string=="safe" and cheat.latchedString==void,"cheat-state reset and latch clear")
  alpha=cvar.get(registry,"alpha","one",cvar.USERINFO);beta=cvar.get(registry,"beta","two",cvar.USERINFO)
  count=count+req(cvar.infoString(registry,cvar.USERINFO)=="\\alpha\\one\\beta\\two","small info prepend order")
  count=count+req(cvar.infoStringBig(registry,cvar.USERINFO)=="\\beta\\two\\alpha\\one","big info append order")
  count=count+req(cvar.infoStringBuffer(registry,cvar.USERINFO,8)=="\\alpha\\","info buffer truncation")
  vm=cvar.createVm();cvar.registerVm(registry,vm,"vm","7.5",cvar.ARCHIVE)
  count=count+req(vm.string=="7.5" and vm.value==7.5 and vm.integer==7 and vm.modificationCount==1,"VM registration copy")
  cvar.set(registry,"vm","9");count=count+req(vm.string=="7.5","VM remains stale until update")
  cvar.updateVm(registry,vm);count=count+req(vm.string=="9" and vm.integer==9 and vm.modificationCount==2,"VM update")
  count=count+req(try(cvar.updateVm(registry,void)) is error,"VM NULL rejected")
  broken=cvar.createVm();broken.handle=registry.numIndexes;count=count+req(try(cvar.updateVm(registry,broken)) is error,"VM handle bounds")
  seen=Seen([]);cvar.commandCompletion(registry,collector(seen))
  count=count+req(len(seen.values)==registry.numIndexes and seen.values[0]=="vm" and seen.values[len(seen.values)-1]=="sv_cheats","completion linked-list order")
  count=count+req(cvar.MAX_CVARS==1024 and cvar.MAX_CVAR_VALUE_STRING==256 and cvar.FILE_HASH_SIZE==256,"native bounds")
  print "PASS: "+str(count)+" complete cvar contracts";return 0
end function
