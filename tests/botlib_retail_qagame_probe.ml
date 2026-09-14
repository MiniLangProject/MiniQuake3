import mq3.engine.local_qvm_match as match
import mq3.botlib.lifecycle_runtime as botlibRuntime
import mq3.server.game_vm as gameVm
import mq3.format.bsp as bsp
import mq3.format.pk3 as pk3

function require(ok,label) if not ok then return error(7697,"retail botlib lifecycle: "+label) end if;return 1 end function
function main(args)
  if len(args)!=2 then return error(7697,"usage: botlib_retail_qagame_probe <pak0.pk3> <qvm-directory>") end if
  count=0;archive=pk3.open(args[0]);if archive is error then return archive end if
  map=bsp.load(pk3.read(archive,"maps/q3dm1.bsp"));if map is error then return map end if
  state=match.bootWithBots(archive,map,1000,args[1]);if state is error then return state end if
  count=count+require(state.game.botEnable==1,"server captured bot_enable")
  runtime=state.context.botlib
  count=count+require(runtime.setup,"retail BotAISetup called BOTLIB_SETUP")
  count=count+require(runtime.maxclients==8 and runtime.maxentities==1024,"retail setup propagated limits")
  count=count+require(runtime.mapName=="q3dm1" and runtime.mapLoads==1,"retail BotAILoadMap called BOTLIB_LOAD_MAP")
  count=count+require(len(runtime.variables)>=5,"retail BotInitLibrary populated libvars")
  count=count+require(botlibRuntime.varGet(runtime,"maxclients")=="8" and botlibRuntime.varGet(runtime,"g_gametype")=="0","retail libvar values retained")
  count=count+require(len(state.context.errors)==0,"retail qagame initialized without host errors")
  gameVm.botStartFrame(state.game,1100);gameVm.botStartFrame(state.game,1150);gameVm.botStartFrame(state.game,1200)
  count=count+require(runtime.frames==2 and runtime.time>1.199 and runtime.time<1.201,"BOTAI_START_FRAME drives second-based BotLib frames")
  count=count+require(runtime.entityUpdates>0,"initialized AAS accepts the retail entity feed")
  count=count+require(len(state.context.errors)==0,"retail bot frames emitted no host errors")
  match.shutdown(state)
  count=count+require(not runtime.setup and len(runtime.variables)==0,"retail shutdown releases botlib")
  print("PASS: "+str(count)+" retail qagame botlib lifecycle contracts frames=2 map=q3dm1");return 0
end function
