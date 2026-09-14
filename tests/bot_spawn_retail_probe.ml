import mq3.engine.local_qvm_match as match
import mq3.botlib.ai_resource_pools as resourcePools
import mq3.format.bsp as bsp
import mq3.format.pk3 as pk3
import mq3.compat.numeric as n
import std.string as strings

function require(ok,label) if not ok then return error(7699,"retail bot spawn: "+label) end if;return 1 end function
function main(args)
  if len(args)!=2 then return error(7699,"usage: bot_spawn_retail_probe <pak0.pk3> <qvm-directory>") end if
  count=0;archive=pk3.open(args[0]);if archive is error then return archive end if
  map=bsp.load(pk3.read(archive,"maps/q3dm1.bsp"));if map is error then return map end if
  state=match.bootWithBots(archive,map,1000,args[1]);if state is error then return state end if
  result=try(match.executeGameConsole(state,"addbot Sarge 3"))
  count=count+require(not (result is error) and len(state.context.errors)==0,"retail BotAISetupClient completes")
  count=count+require(state.context.botAllocations==1 and state.context.botFrees==0,"server allocated one active bot client")
  count=count+require(state.context.clientStates[0]==2,"first free client slot became a bot")
  info=state.context.userinfos[0]
  count=count+require(strings.contains(info,"\\name\\Sarge") and strings.contains(info,"\\characterfile\\bots/sarge_c.c"),"retail bot metadata reached server userinfo")
  count=count+require(strings.contains(info,"\\skill\\    3.00") and strings.contains(info,"\\team\\red"),"retail skill and team defaults retained")
  machine=state.game.slot.machine;flags=n.readI32(machine.data,state.context.gameEntities+424)
  count=count+require((flags&8)!=0,"retail qagame marked allocated entity SVF_BOT")
  count=count+require(state.context.botlib.setup and state.context.aas!=void and state.context.aasRouter!=void,"lifecycle AAS and routing survived through spawn")
  count=count+require(state.context.aiVisiblePosition.router==state.context.aasRouter and state.context.aiMapGoals.initialized and len(state.context.aiMapGoals.locations)==12 and len(state.context.aiMapGoals.campSpots)==0,"visible routing and q3dm1 map goals are bound to the live AAS")
  count=count+require(state.context.aiChatOutput.loaded and len(state.context.aiChatOutput.randomLists)==244 and len(state.context.aiChatOutput.replies)==456,"retail random and reply chat data loaded during botlib setup")
  count=count+require(state.context.aiMoveRuntime.services.onGroundFn!=void and state.context.aiMoveRuntime.services.blockTraceFn!=void and state.context.aiMoveRuntime.services.jumpRunStartFn!=void,"live movement uses collision-backed ground, blocker and jump-run callbacks")
  character=state.context.aiCharacters.characters[5]
  count=count+require(character!=void and character.filename=="bots/sarge_c.c" and character.skill==3.0,"retail Sarge skill-3 character was parsed and interpolated")
  goal=resourcePools.goalState(state.context.aiResources,1)
  count=count+require(goal!=void and goal.client==0 and goal.itemWeightConfig!=void and len(goal.itemWeightIndex)==35 and resourcePools.goalState(state.context.aiResources,2)==void,"retail setup bound Sarge item weights to goal handle one")
  weapon=resourcePools.weaponState(state.context.aiResources,1);chat=resourcePools.chatState(state.context.aiResources,1);move=resourcePools.moveState(state.context.aiResources,1)
  count=count+require(weapon!=void and weapon.weaponWeightConfig!=void and len(weapon.weaponWeightIndex)==32,"retail setup bound Sarge weapon weights to weapon handle one")
  count=count+require(chat!=void and chat.chat!=void and chat.chat.chatName=="sarge" and chat.gender==2 and move!=void,"retail setup initialized chat and move handles")
  frameResult=0;for frame=1 to 256 if frameResult is error then break end if;frameResult=try(match.runFrame(state,1000+frame*100)) end for
  command=state.context.usercmds[0]
  count=count+require(not (frameResult is error) and state.context.lastBotTrap==211 and state.context.frames==256 and state.context.botServer.clients[0].lastPacketTime>=26600 and command.forwardmove==86 and command.rightmove==15 and command.upmove==0 and command.weapon==8 and chat.numConsoleMessages==0 and move.numAvoidSpots==0 and len(state.context.aiChatMatches.templates)==138 and len(state.context.aiChatStrings.groups)==175,"initialized Sarge runs 256 bot frames and submits the routed movement command")
  slots=[];for unused=1 to 7 slots=slots+[match.allocateBot(state.context)] end for
  count=count+require(slots==[1,2,3,4,5,6,7] and match.allocateBot(state.context)==-1,"eight-slot server capacity")
  match.freeBot(state.context,3);replacement=match.allocateBot(state.context)
  count=count+require(replacement==3 and state.context.botAllocations==9 and state.context.botFrees==1,"freed slot is reset and reused")
  stopped=try(match.shutdown(state));count=count+require(not (stopped is error) and resourcePools.goalState(state.context.aiResources,1)==void and resourcePools.weaponState(state.context.aiResources,1)==void and resourcePools.chatState(state.context.aiResources,1)==void and resourcePools.moveState(state.context.aiResources,1)==void,"match shutdown frees allocated AI resource handles")
  print("PASS: "+str(count)+" retail original-bot spawn contracts setup=complete frames=256 running=BOTLIB_USER_COMMAND command=86,15,0 weapon=8 goal=1 chat=1 move=1");return 0
end function
