// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_lifecycle as bots
import mq3.qcommon.cvar as cv

struct Context
  events
  setupResult
  selection
end struct

function require(condition,label)
  if not condition then return error(499,"Bot lifecycle contract: "+label) end if
  return 1
end function

function same(actual,expected)
  if len(actual) != len(expected) then return false end if
  for index = 0 to len(actual)-1
    if actual[index] != expected[index] then return false end if
  end for
  return true
end function

function event(state,text)
  state.context.events = state.context.events+[text]; return void
end function

function cvarEvent(state,kind,key,value)
  if kind == 1 then return event(state,"register:"+key+"="+value) end if
  if kind == 2 then return event(state,"query:"+key) end if
  if kind == 3 then return event(state,"update:"+key) end if
  return event(state,"set:"+key+"="+value)
end function
function varSet(state,key,value) return event(state,"var:"+key+"="+value) end function
function libSetup(state) event(state,"lib-setup"); return state.context.setupResult end function
function libShutdown(state) return event(state,"lib-shutdown") end function
function libLoad(state,map) return event(state,"load:"+map) end function
function freeWaypoints(state,value) return event(state,"free:"+str(value)) end function
function resetMove(state,value) return event(state,"move:"+str(value)) end function
function resetGoal(state,value) return event(state,"goal:"+str(value)) end function
function resetWeapon(state,value) return event(state,"weapon:"+str(value)) end function
function resetAvoidGoal(state,value) return event(state,"avoid-goal:"+str(value)) end function
function resetAvoidReach(state,value) return event(state,"avoid-reach:"+str(value)) end function
function setupDeathmatch(state) return event(state,"deathmatch") end function
function shutdownClient(state,client,restart) return event(state,"client-down:"+str(client)+":"+str(restart)) end function
function selectGenetic(state,ranks)
  event(state,"select:"+str(ranks[0])+":"+str(ranks[1])+":"+str(ranks[2])+":"+str(ranks[63]))
  return state.context.selection
end function
function interbreedGoal(state,p1,p2,child) return event(state,"breed:"+str(p1)+":"+str(p2)+":"+str(child)) end function
function mutateGoal(state,goal,amount) return event(state,"mutate:"+str(goal)+":"+str(amount)) end function
function saveGoal(state,goal,name) return event(state,"save:"+str(goal)+":"+name) end function

function fixture()
  state = bots.create(cv.create()); state.context = Context([],0,[0,0,0,0])
  state.cvarEffectFn = cvarEvent; state.botLibVarSetFn = varSet; state.botLibSetupFn = libSetup
  state.botLibShutdownFn = libShutdown; state.botLibLoadMapFn = libLoad; state.freeWaypointsFn = freeWaypoints
  state.resetMoveStateFn = resetMove; state.resetGoalStateFn = resetGoal; state.resetWeaponStateFn = resetWeapon
  state.resetAvoidGoalsFn = resetAvoidGoal; state.resetAvoidReachFn = resetAvoidReach
  state.deathmatchSetupFn = setupDeathmatch; state.shutdownClientFn = shutdownClient
  state.geneticSelectionFn = selectGenetic; state.interbreedGoalFn = interbreedGoal
  state.mutateGoalFn = mutateGoal; state.saveGoalFn = saveGoal
  return state
end function

function contracts()
  count = 0
  bare = bots.create(cv.create())
  count = count+require(bots.setup(bare,1),"restart setup needs no botlib service")
  count = count+require(bots.shutdown(bare,1),"empty restart shutdown needs no client service")
  bots.endMatch(bare); count = count+require(bare.interbreedMatchCount==0,"disabled end-match needs no genetic service")

  state = fixture(); held = bots.createBot(9); state.botstates[9] = held
  count = count+require(bots.setup(state,1) and state.botstates[9] == held,"restart setup preserves slots")
  count = count+require(len(state.context.events) == 12 and state.context.events[0] == "register:bot_thinktime=100" and state.context.events[11] == "register:bot_interbreedwrite=","restart registers all Cvars only")
  count = count+require(state.thinktime.integer == 100 and state.interbreedcycle.integer == 20,"setup snapshots")

  state = fixture(); registry = state.registry
  cv.set2(registry,"sv_maxclients","12",true); cv.set2(registry,"sv_mapChecksum","abc",true)
  cv.set2(registry,"max_aaslinks","321",true); cv.set2(registry,"g_gametype","4",true)
  cv.set2(registry,"bot_nochat","1",true); cv.set2(registry,"bot_visualizejumppads","yes",true)
  cv.set2(registry,"bot_reloadcharacters","",true); cv.set2(registry,"fs_basepath","base",true)
  old = bots.createBot(3); state.botstates[3] = old
  count = count+require(bots.setup(state,0) and state.botstates[3] is void,"fresh setup clears pointer table")
  expectedTail = ["var:g_gametype=4","var:bot_developer=0","var:log=4","query:bot_nochat","var:nochat=0"]
  found = false
  for index = 0 to len(state.context.events)-len(expectedTail)
    matches = true
    for offset = 0 to len(expectedTail)-1
      if state.context.events[index+offset] != expectedTail[offset] then matches = false end if
    end for
    if matches then found = true end if
  end for
  count = count+require(found,"BotInitLibrary preserves log and nochat bugs")
  count = count+require(state.context.events[len(state.context.events)-1] == "lib-setup","library setup is last")

  state = fixture(); state.context.setupResult = 7
  count = count+require(not bots.setup(state,0),"BotLib error propagates as setup failure")

  state = fixture(); cv.set2(state.registry,"mapname","q3dm7",true)
  bot = bots.createBot(5); bot.settings = "held-settings"; bot.curPs = "held-ps"; bot.character = 10
  bot.ms = 11; bot.gs = 12; bot.cs = 13; bot.ws = 14; bot.entergameTime = 15.0
  bot.setupcount = 99; bot.checkpoints = 21; bot.patrolpoints = 22; bot.numKills = 8; bot.numDeaths = 3; bot.transient = "drop"
  state.botstates[5] = bot; state.context.events = []
  count = count+require(bots.loadMap(state,0),"map load succeeds")
  count = count+require(same(state.context.events,["register:mapname=","load:q3dm7","free:21","free:22","move:11","goal:12","weapon:14","avoid-goal:12","avoid-reach:11","deathmatch"]),"map reset call order")
  count = count+require(bot.setupcount == 4 and bot.settings == "held-settings" and bot.curPs == "held-ps" and bot.character == 10 and bot.cs == 13 and bot.entergameTime == 15.0,"map reset preserves native fields")
  count = count+require(bot.numKills == 0 and bot.numDeaths == 0 and bot.transient is void and bot.checkpoints is void,"map reset clears transient fields")
  state.context.events = []; bots.loadMap(state,1)
  count = count+require(state.context.events[0] == "free:void" and state.context.events[len(state.context.events)-1] == "deathmatch","restart skips map load but resets bots")

  state = fixture(); first = bots.createBot(7); second = bots.createBot(2)
  state.botstates[1] = first; state.botstates[63] = second; state.context.events = []
  bots.shutdown(state,1)
  count = count+require(same(state.context.events,["client-down:7:1","client-down:2:1"]),"restart shutdown scans slots ascending")
  state.context.events = []; bots.shutdown(state,0)
  count = count+require(same(state.context.events,["lib-shutdown"]),"final shutdown only closes botlib")

  state = fixture(); a = bots.createBot(0); b = bots.createBot(1); child = bots.createBot(2)
  bots.setup(state,1); state.context.events = []
  a.gs = 100; b.gs = 101; child.gs = 102; a.numKills = 3; a.numDeaths = 1
  b.numKills = 4; b.numDeaths = 3; child.numKills = 0; child.numDeaths = 5
  state.botstates[0] = a; state.botstates[1] = b; state.botstates[2] = child
  bots.endMatch(state); count = count+require(len(state.context.events)==0,"disabled interbreed is inert")
  state.interbreed = true; state.interbreedcycle.integer = 2; state.context.selection = [1,0,1,2]
  bots.endMatch(state); count = count+require(state.interbreedMatchCount==1 and len(state.context.events)==0,"cycle waits")
  cv.set2(state.registry,"bot_interbreedwrite","winner.c",true); state.context.events = []
  bots.endMatch(state)
  count = count+require(same(state.context.events,["update:bot_interbreedwrite","save:100:winner.c","set:bot_interbreedwrite=","select:5.:5.:-5.:-1","breed:100:101:102","mutate:102:1"]),"match-end order and first-rank tie")
  count = count+require(state.interbreedMatchCount==0 and a.numKills==0 and b.numDeaths==0 and child.numDeaths==0,"match-end resets scores")
  count = count+require(state.interbreedwrite.string=="winner.c" and cv.find(state.registry,"bot_interbreedwrite").string=="","Cvar set leaves VM snapshot stale")

  state = fixture(); bots.setup(state,1); state.context.events = []; bot = bots.createBot(0); bot.gs = 9; bot.numKills = 0; bot.numDeaths = 0
  state.botstates[0] = bot; state.interbreed = true; state.interbreedcycle.integer = 1
  cv.set2(state.registry,"bot_interbreedwrite","zero.c",true); state.context.selection = [0,0,0,0]; state.context.events = []
  bots.endMatch(state)
  count = count+require(same(state.context.events,["update:bot_interbreedwrite","set:bot_interbreedwrite=","select:0.:-1:-1:-1"]),"zero rank is not saved and failed selection still resets")
  count = count+require(bot.numKills==0 and bot.numDeaths==0,"failed genetic selection resets active bot")
  return count
end function

function main(args)
  count = contracts(); print("PASS: "+str(count)+" bot lifecycle contracts\n"); return 0
end function
