import mq3.engine.local_qvm_match as match
import mq3.qcommon.command_buffer as commands
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
import std.string as strings
import std.time as time

function req(ok,text) if not ok then return error(7705,"singleplayer bots: "+text) end if;return 1 end function
function main(args)
  if len(args)!=2 then return error(7705,"pak0 and qvm root required") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  map=bsp.load(pk3.read(archive,"maps/q3dm1.bsp"));if map is error then return map end if
  settings=match.UserSettings([["g_gametype","2","0",void,0]],array(256,void),array(match.MAX_CLIENTS,"\\name\\Sarge\\rate\\25000"),[])
  state=match.bootWithQvmsSettingsNamed(archive,map,"q3dm1",1000,args[1],settings);if state is error then return state end if
  count=0
  count=count+req(state.game.botEnable==1 and state.context.cvars!=void,"bot library enabled")
  joined=match.connectLocal(state,0);if joined is error then return joined end if
  count=count+req(state.context.clientStates[0]==1,"human client connected")
  count=count+req(strings.contains(state.context.configstrings[544],"n\\Sarge"),"human appears in player configstrings")
  executed=commands.execute(state.context.commandState);if executed is error then return executed end if
  count=count+req(state.context.botAllocations>=1 and state.context.clientStates[1]==2,"arena bot allocated after map")
  count=count+req(strings.contains(state.context.userinfos[1],"\\name\\Ranger") or strings.contains(state.context.userinfos[1],"\\name\\ranger"),"q3dm1 arena opponent selected")
  started=time.ticks();samples=array(4,0);sampleIndex=0;result=void
  routeStats=array(4,"")
  for frame=1 to 200
    result=match.runFrame(state,1000+frame*100);if result is error then return result end if
    if frame%50==0 then
      samples[sampleIndex]=time.ticks()-started
      cache=state.context.aasRouteCache
      routeStats[sampleIndex]=str(cache.hits)+"/"+str(cache.misses)+"/"+str(cache.areaHits)+"/"+str(cache.areaMisses)+"/"+str(len(cache.entries))
      sampleIndex=sampleIndex+1;started=time.ticks()
    end if
  end for
  count=count+req(state.context.botServer.clients[1].lastPacketTime>=3000,"bot participates after original 2000 ms spawn delay")
  match.sendClientCommand(state.context,"score");scored=match.runFrame(state,21100);if scored is error then return scored end if
  foundScore=false;for each entry in state.context.console if strings.contains(entry[1],"scores ") then foundScore=true;print("SCORE_REPLY: "+entry[1]) end if end for
  count=count+req(foundScore,"human score request reaches qagame and returns scoreboard")
  stopped=match.shutdown(state);if stopped is error then return stopped end if
  print("PASS: "+str(count)+" singleplayer q3dm1 bot and human contracts bot50ms="+str(samples[0])+","+str(samples[1])+","+str(samples[2])+","+str(samples[3])+" route(h/m/ah/am/n)="+str(routeStats[0])+","+str(routeStats[1])+","+str(routeStats[2])+","+str(routeStats[3]))
  return 0
end function
