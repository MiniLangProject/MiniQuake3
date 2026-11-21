// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.engine.local_qvm_match as match
import mq3.format.bsp as bsp
import mq3.format.mod_stack as mods
import mq3.format.pk3 as pk3
import mq3.vm.interpreter as interpreter
import mq3.vm.syscall_qagame_world as qworld
import std.fs as fs

struct ModFixtureContext archive qvmRoot end struct
struct ModFixtureHost context end struct

function require(ok,label)
  if not ok then return error(7689,"Retail mod probe: "+label) end if
  return 1
end function
function unusedTrap(vm,address) return 0 end function

function main(args)
  if len(args)!=3 then return error(7689,"usage: mod_stack_retail_probe <retail-baseq3> <fixture-install> <qvms>") end if
  baseDir=args[0];root=args[1];qvmRoot=args[2]
  base=pk3.openStandard(baseDir);mounted=mods.mount(base,root,"fixturemod")
  active=mounted.archive
  checks=require(mounted.game=="fixturemod" and mounted.dataRoot==fs.joinPath(root,"fixturemod"),"active data root")
  checks=checks+require(pk3.has(active,"SCRIPTS/fixture.cfg") and decode(pk3.read(active,"scripts/fixture.cfg"))=="loose fixture file","loose qpath resolution")
  checks=checks+require(decode(pk3.read(active,"mod-layer.txt"))=="highest package","high package overrides loose and low packages")
  checks=checks+require(decode(pk3.read(active,"default.cfg"))=="fixture override","active game overrides Baseq3 file")
  checks=checks+require(not pk3.has(base,"mod-layer.txt") and pk3.read(base,"default.cfg")!=pk3.read(active,"default.cfg"),"switch leaves Baseq3 intact")
  checks=checks+require(not pk3.has(active,"helper.dll") and not pk3.has(active,"missing"),"DLLs are not indexed from loose directories")
  host=ModFixtureHost(ModFixtureContext(active,qvmRoot))
  gameImage=match.imageLoader(host,"vm/qagame.qvm")
  checks=checks+require(gameImage==fs.readAllBytes(fs.joinPath(qvmRoot,"qagame.qvm")),"absent mod module uses packaged game")
  clientImage=match.imageLoader(host,"vm/cgame.qvm")
  clientVm=interpreter.load(clientImage,unusedTrap)
  checks=checks+require(interpreter.callFast(clientVm,[0])==239,"PK3 mod QVM overrides packaged and loose modules")
  uiImage=match.imageLoader(host,"vm/ui.qvm")
  checks=checks+require(uiImage==fs.readAllBytes(fs.joinPath(qvmRoot,"ui.qvm")),"absent mod UI uses packaged UI")
  names=match.uiDesktopModList(mounted.dataRoot);found=false
  for each name in names if name=="Fixture for mod mounting" then found=true end if end for
  checks=checks+require(found,"Mods list searches the install root while in a mod")

  assetOnly=mods.mount(base,root,"assetmod")
  checks=checks+require(decode(pk3.read(assetOnly.archive,"fixture_asset.txt"))=="Fixture mod data","loose-only mod can be mounted")
  data=pk3.read(assetOnly.archive,"maps/q3dm0.bsp");level=bsp.load(data)
  state=match.bootWithQvmsSettingsNamed(assetOnly.archive,level,"q3dm0",1000,qvmRoot,void)
  checks=checks+require(match.botCacheDirectory(state.context)==fs.joinPath(assetOnly.dataRoot,"maps"),"bot cache is isolated from Baseq3")
  match.connectLocal(state,0)
  for frame=1 to 2
    time=1000+frame*50
    match.submitUsercmd(state,0,qworld.userCommand(time,[0,0,0],0,2,0,0,0))
    match.runServerFrame(state,time)
    match.snapshotProductive(state,0)
    if frame==1 then match.bootCgame(state) end if
    match.drawCgameProductive(state,time)
  end for
  checks=checks+require(len(state.context.renderViews)>0,"Retail map renders through an asset-only mod")
  match.shutdown(state)
  baseAgain=mods.mount(base,root,"BASEQ3")
  checks=checks+require(baseAgain.game=="" and baseAgain.archive==base and not pk3.has(baseAgain.archive,"mod-layer.txt"),"Baseq3 deactivation")
  for each name in ["../fixturemod","fixturemod/.","badmod","nativemod","missingmod"]
    checks=checks+require(try(mods.mount(base,root,name)) is error,"invalid or unavailable mod rejected: "+name)
  end for
  print "PASS: "+str(checks)+" Retail mod mount, precedence and QVM checks"
  return 0
end function
