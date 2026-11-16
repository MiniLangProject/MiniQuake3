import mq3.engine.local_qvm_match as match
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
import std.string as strings
import std.time as time

function req(ok,text) if not ok then return error(7705,"singleplayer bots: "+text) end if;return 1 end function
function main(args)
  if len(args)!=3 then return error(7705,"pak0, qvm root and map required") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  mapName=args[2];botName="Ranger";if mapName=="q3dm0" then botName="Crash" end if
  map=bsp.load(pk3.read(archive,"maps/"+mapName+".bsp"));if map is error then return map end if
  settings=match.UserSettings([["g_gametype","2","0",void,0]],array(256,void),array(match.MAX_CLIENTS,"\\name\\Sarge\\rate\\25000"),[])
  state=match.bootWithQvmsSettingsNamed(archive,map,mapName,1000,args[1],settings);if state is error then return state end if
  count=0
  count=count+req(state.game.botEnable==1 and state.context.cvars!=void,"bot library enabled")
  joined=match.connectLocal(state,0);if joined is error then return joined end if
  count=count+req(state.context.clientStates[0]==1,"human client connected")
  count=count+req(strings.contains(state.context.configstrings[544],"n\\Sarge"),"human appears in player configstrings")
  // The real window calls runServerFrame directly during bootstrap.
  executed=match.runServerFrame(state,1050);if executed is error then return executed end if
  count=count+req(state.context.botAllocations>=1 and state.context.clientStates[1]==2,"arena bot allocated by productive server frame")
  count=count+req(strings.contains(state.context.userinfos[1],"\\name\\"+botName) or strings.contains(state.context.userinfos[1],"\\name\\"+strings.toLowerAscii(botName)),"arena opponent selected")
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
  snapshot=match.snapshotProductive(state,0);if snapshot is error then return snapshot end if
  count=count+req(state.context.linked[1],"spawned arena bot linked into the server world")
  visibleBot=false;for each entity in snapshot.entities if entity.number==1 and entity.eType==1 then visibleBot=true end if end for
  print("BOT_SNAPSHOT: linked="+str(state.context.linked[1])+" humanLinked="+str(state.context.linked[0])+" entityCount="+str(len(snapshot.entities))+" botVisible="+str(visibleBot))
  booted=match.bootCgame(state);if booted is error then return booted end if
  drawn=match.drawCgameProductive(state,21000);if drawn is error then return drawn end if
  activated=match.executeClientConsole(state,"+scores");if activated is error then return activated end if
  count=count+req(state.context.pendingClientCommands.len()>0,"Tab scoreboard command reaches original cgame QVM")
  scored=match.runFrame(state,21100);if scored is error then return scored end if
  foundScore=false;for each entry in state.context.console if strings.contains(entry[1],"scores ") then foundScore=true;print("SCORE_REPLY: "+entry[1]) end if end for
  count=count+req(foundScore,"cgame score request reaches qagame and returns scoreboard")
  stopped=match.shutdown(state);if stopped is error then return stopped end if
  print("PASS: "+str(count)+" singleplayer "+mapName+" bot and human contracts bot50ms="+str(samples[0])+","+str(samples[1])+","+str(samples[2])+","+str(samples[3])+" route(h/m/ah/am/n)="+str(routeStats[0])+","+str(routeStats[1])+","+str(routeStats[2])+","+str(routeStats[3]))
  return 0
end function
