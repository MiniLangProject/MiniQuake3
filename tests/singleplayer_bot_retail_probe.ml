import mq3.engine.local_qvm_match as match
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
import mq3.game.playerstate as ps
import mq3.game.constants as gameConstants
import mq3.shared.math as arenaMath
import mq3.vm.syscall_qagame_world as qworld
import mq3.botlib.ai_move_runtime as aiMove
import mq3.botlib.ai_resource_pools as aiPools
import mq3.botlib.elementary_actions as botActions
import mq3.botlib.aas_runtime as arenaAas
import std.fs as probeFs
import std.string as strings
import std.time as time

function req(ok,text) if not ok then return error(7705,"singleplayer bots: "+text) end if;return 1 end function
function arrangeEncounter(state,bot)
  // Use real arena collision to place the human on a nearby floor in the
  // bot's field of view. The bot, its inputs and its weapon events remain
  // controlled by the shipped qagame QVM.
  if bot.groundEntityNum==aiMove.ENTITYNUM_NONE then return false end if
  context=state.context
  origin=bot.origin
  eye=[origin[0],origin[1],origin[2]+bot.viewheight]
  for each yaw in [0.0,-30.0,30.0,-60.0,60.0]
    forward=arenaMath.AngleVectors([0.0,bot.viewangles[1]+yaw,0.0])[0]
    for each distance in [96.0,72.0,120.0]
      start=[origin[0]+forward[0]*distance,origin[1]+forward[1]*distance,origin[2]+32.0]
      finish=[start[0],start[1],origin[2]-64.0]
      landed=match.traceWorld(context,start,[-15.0,-15.0,-24.0],[15.0,15.0,32.0],finish,0,0x10001,false)
      if landed is error or landed.startsolid or landed.fraction>=1.0 then continue end if
      point=landed.endpos
      sight=match.traceWorld(context,eye,[0.0,0.0,0.0],[0.0,0.0,0.0],point,1,0x10001,false)
      if sight is error or sight.fraction<1.0 then continue end if
      data=state.game.slot.machine.data
      match.writeVector(data,context.gameClients+20,point)
      match.writeVector(data,context.gameClients+32,[0.0,0.0,0.0])
      match.writeVector(data,context.gameEntities+24,point)
      match.writeVector(data,context.gameEntities+match.R_CURRENTORIGIN,point)
      match.linkEntity(context,context.gameEntities)
      return true
    end for
  end for
  return false
end function
function acceptsGroundMovement(state,bot)
  context=state.context
  handle=aiPools.allocMoveState(context.aiResources)
  if handle<=0 then return false end if
  movement=context.aiMoveRuntime
  aiMove.initMoveState(movement,handle,aiMove.InitMove(bot.origin,[0.0,0.0,0.0],[0.0,0.0,26.0],1,1,0.1,arenaAas.PRESENCE_NORMAL,bot.viewangles,aiMove.MFL_ONGROUND))
  accepted=false
  for each direction in [[1.0,0.0,0.0],[-1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,-1.0,0.0]]
    botActions.resetInput(context.elementaryActions,1)
    if aiMove.moveInDirection(movement,handle,direction,200.0,aiMove.MOVE_WALK) and botActions.getInput(context.elementaryActions,1,0.1).speed==200.0 then accepted=true;break end if
  end for
  aiPools.freeMoveState(context.aiResources,handle)
  return accepted
end function
function runCombatFrame(state,frameTime,cadence)
  if cadence!="outer" then
    if cadence=="fixed" then
      intermediate=match.runServerFrame(state,frameTime-50);if intermediate is error then return intermediate end if
    end if
    return match.runFrame(state,frameTime)
  end if
  // Emulate a 100-Hz client loop across two 20-Hz server ticks.
  for index=1 to 10
    time=frameTime-100+index*10
    thought=match.runBotFrame(state,time);if thought is error then return thought end if
    if index%5==0 then
      advanced=match.runServerTick(state,time);if advanced is error then return advanced end if
    end if
  end for
  return void
end function
function main(args)
  if len(args)!=3 and len(args)!=4 then return error(7705,"pak0, qvm root and map required, optional frame cadence") end if
  cadence="probe";if len(args)==4 then cadence=args[3] end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  mapName=args[2];botName="Ranger";if mapName=="q3dm0" then botName="Crash" end if
  map=bsp.load(pk3.read(archive,"maps/"+mapName+".bsp"));if map is error then return map end if
  settings=match.UserSettings([["g_gametype","2","0",void,0],["sv_maxclients","12","8",void,0]],array(256,void),array(match.MAX_CLIENTS,"\\name\\Sarge\\rate\\25000"),[])
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
  attackFrames=0;strafeFrames=0;weaponEvents=0;eventSequence=0;encounter=false;groundMove=false
  for frame=1 to 200
    frameTime=1000+frame*100
    if encounter and weaponEvents==0 then
      firing=match.submitUsercmd(state,0,qworld.userCommand(frameTime,[0,0,0],1,2,0,0,0));if firing is error then return firing end if
    end if
    result=runCombatFrame(state,frameTime,cadence);if result is error then return result end if
    command=state.context.botServer.clients[1].userCommand
    if command!=void then
      if (command.buttons&1)!=0 then attackFrames=attackFrames+1 end if
      if command.rightmove!=0 then strafeFrames=strafeFrames+1 end if
      bot=ps.load(state.game.slot.machine.data,state.context.gameClients+state.context.clientStride)
      if not encounter and frame>=52 then encounter=arrangeEncounter(state,bot) end if
      firstEvent=eventSequence
      if firstEvent<bot.eventSequence-2 then firstEvent=bot.eventSequence-2 end if
      if firstEvent<bot.eventSequence then for event=firstEvent to bot.eventSequence-1
        if bot.events[event&1]==gameConstants.EV_FIRE_WEAPON then weaponEvents=weaponEvents+1 end if
      end for end if
      eventSequence=bot.eventSequence
    end if
    if frame%50==0 then
      samples[sampleIndex]=time.ticks()-started
      cache=state.context.aasRouteCache
      routeStats[sampleIndex]=str(cache.hits)+"/"+str(cache.misses)+"/"+str(cache.areaHits)+"/"+str(cache.areaMisses)+"/"+str(cache.entries.len())+"/"+str(cache.weightedBuilds)+"/"+str(cache.weightedFallbacks)
      sampleIndex=sampleIndex+1;started=time.ticks()
    end if
  end for
  count=count+req(state.context.botServer.clients[1].lastPacketTime>=3000,"bot participates after original 2000 ms spawn delay")
  snapshot=match.snapshotProductive(state,0);if snapshot is error then return snapshot end if
  count=count+req(state.context.linked[1],"spawned arena bot linked into the server world")
  visibleBot=false;for each entity in snapshot.entities if entity.number==1 and entity.eType==1 then visibleBot=true end if end for
  print("BOT_SNAPSHOT: linked="+str(state.context.linked[1])+" humanLinked="+str(state.context.linked[0])+" entityCount="+str(len(snapshot.entities))+" botVisible="+str(visibleBot))
  bot=ps.load(state.game.slot.machine.data,state.context.gameClients+state.context.clientStride)
  groundMove=acceptsGroundMovement(state,bot)
  print("BOT_COMBAT: encounter="+str(encounter)+" attackFrames="+str(attackFrames)+" strafeFrames="+str(strafeFrames)+" weaponEvents="+str(weaponEvents)+" groundCommand="+str(groundMove))
  count=count+req(encounter and attackFrames>0 and weaponEvents>0 and groundMove,"arena bot generates grounded movement and fires its weapon when the player is in sight")
  booted=match.bootCgame(state);if booted is error then return booted end if
  drawn=match.drawCgameProductive(state,21000);if drawn is error then return drawn end if
  activated=match.executeClientConsole(state,"+scores");if activated is error then return activated end if
  count=count+req(state.context.pendingClientCommands.len()>0,"Tab scoreboard command reaches original cgame QVM")
  scored=match.runFrame(state,21100);if scored is error then return scored end if
  foundScore=false;for each entry in state.context.console if strings.contains(entry[1],"scores ") then foundScore=true;print("SCORE_REPLY: "+entry[1]) end if end for
  count=count+req(foundScore,"cgame score request reaches qagame and returns scoreboard")
  for slot=2 to 11
    allocated=req(match.allocateBot(state.context)==slot,"configured client slot "+str(slot)+" allocated");if allocated is error then return allocated end if
  end for
  count=count+req(match.allocateBot(state.context)==-1,"server honors configured twelve-slot capacity")
  cachePath=state.context.aasCachePath
  stopped=match.shutdown(state);if stopped is error then return stopped end if
  count=count+req(cachePath!="" and probeFs.isFile(cachePath),"route cache is written after match shutdown")
  print("PASS: "+str(count)+" singleplayer "+mapName+" bot and human contracts bot50ms="+str(samples[0])+","+str(samples[1])+","+str(samples[2])+","+str(samples[3])+" route(h/m/ah/am/n/build/fallback)="+str(routeStats[0])+","+str(routeStats[1])+","+str(routeStats[2])+","+str(routeStats[3]))
  return 0
end function
