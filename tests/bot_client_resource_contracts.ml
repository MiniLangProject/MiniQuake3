// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_lifecycle as lifecycle
import mq3.game.bot_client_resources as clients
import mq3.qcommon.cvar as cv

struct Context
  events
  aas
  character
  itemResult
  weaponResult
  chatResult
  gender
  testChat
  chatExit
end struct
function require(condition,label)
  if not condition then return error(499,"Bot client resource contract: "+label) end if
  return 1
end function
function same(a,b)
  if len(a)!=len(b) then return false end if
  for i=0 to len(a)-1 if a[i]!=b[i] then return false end if end for
  return true
end function
function event(s,text) s.context.events=s.context.events+[text]; return void end function
function aas(s) event(s,"aas"); return s.context.aas end function
function diag(s,kind,client,settings) return event(s,"diag:"+str(kind)+":"+str(client)) end function
function loadCharacter(s,file,skill) event(s,"character:"+file+":"+str(skill)); return s.context.character end function
function allocGoal(s,client) event(s,"alloc-goal:"+str(client)); return 101 end function
function characteristic(s,ch,index,capacity)
  event(s,"char:"+str(ch)+":"+str(index)+":"+str(capacity))
  if index==clients.CHARACTERISTIC_ITEMWEIGHTS then return "items.c" end if
  if index==clients.CHARACTERISTIC_WEAPONWEIGHTS then return "weapons.c" end if
  if index==clients.CHARACTERISTIC_CHAT_FILE then return "chat.c" end if
  if index==clients.CHARACTERISTIC_CHAT_NAME then return "Ranger" end if
  return s.context.gender
end function
function loadItems(s,handle,file) event(s,"load-items:"+str(handle)+":"+file); return s.context.itemResult end function
function freeGoal(s,handle) return event(s,"free-goal:"+str(handle)) end function
function allocWeapon(s) event(s,"alloc-weapon"); return 102 end function
function loadWeapons(s,handle,file) event(s,"load-weapons:"+str(handle)+":"+file); return s.context.weaponResult end function
function freeWeapon(s,handle) return event(s,"free-weapon:"+str(handle)) end function
function allocChat(s) event(s,"alloc-chat"); return 103 end function
function loadChat(s,handle,file,name) event(s,"load-chat:"+str(handle)+":"+file+":"+name); return s.context.chatResult end function
function freeChat(s,handle) return event(s,"free-chat:"+str(handle)) end function
function setGender(s,handle,gender) return event(s,"gender:"+str(handle)+":"+str(gender)) end function
function floatTime(s) event(s,"time"); return 12.5 end function
function allocMove(s) event(s,"alloc-move"); return 104 end function
function characteristicFloat(s,ch,index,low,high) event(s,"char-float:"+str(ch)+":"+str(index)); return 0.75 end function
function integerQuery(s,name) event(s,"query:"+name); return s.context.testChat end function
function varSet(s,name,value) return event(s,"var:"+name+"="+value) end function
function chatTest(s,bot) return event(s,"chat-test:"+str(bot.client)) end function
function schedule(s) return event(s,"schedule") end function
function mutate(s,goal,amount) return event(s,"mutate:"+str(goal)+":"+str(amount)) end function
function readSession(s,bot) return event(s,"read:"+str(bot.client)) end function
function writeSession(s,bot) return event(s,"write:"+str(bot.client)) end function
function chatExit(s,bot) event(s,"chat-exit:"+str(bot.client)); return s.context.chatExit end function
function enterChat(s,chat,client,sendto) return event(s,"enter-chat:"+str(chat)+":"+str(client)+":"+str(sendto)) end function
function freeMove(s,handle) return event(s,"free-move:"+str(handle)) end function
function freeCharacter(s,handle) return event(s,"free-character:"+str(handle)) end function
function freeWaypoints(s,handle) return event(s,"free-waypoints:"+str(handle)) end function
function clearActivate(s,bot) return event(s,"clear-activate:"+str(bot.client)) end function

function fixture()
  ls=lifecycle.create(cv.create()); service=clients.create(ls)
  service.context=Context([],true,77,0,0,0,"Female",0,false)
  service.aasInitializedFn=aas; service.diagnosticFn=diag; service.loadCharacterFn=loadCharacter
  service.allocGoalStateFn=allocGoal; service.characteristicStringFn=characteristic
  service.loadItemWeightsFn=loadItems; service.freeGoalStateFn=freeGoal
  service.allocWeaponStateFn=allocWeapon; service.loadWeaponWeightsFn=loadWeapons; service.freeWeaponStateFn=freeWeapon
  service.allocChatStateFn=allocChat; service.loadChatFileFn=loadChat; service.freeChatStateFn=freeChat
  service.setChatGenderFn=setGender; service.floatTimeFn=floatTime; service.allocMoveStateFn=allocMove
  service.characteristicFloatFn=characteristicFloat; service.integerQueryFn=integerQuery
  service.botLibVarSetFn=varSet; service.chatTestFn=chatTest; service.scheduleThinkFn=schedule
  service.mutateGoalFn=mutate; service.readSessionFn=readSession; service.writeSessionFn=writeSession
  service.chatExitGameFn=chatExit; service.enterChatFn=enterChat; service.freeMoveStateFn=freeMove
  service.freeCharacterFn=freeCharacter; service.freeWaypointsFn=freeWaypoints
  service.clearActivateGoalStackFn=clearActivate; return service
end function

function contracts()
  count=0; settings=clients.Settings("bots/sarge_c.c",3.0,"red")
  s=fixture(); s.lifecycleState.interbreed=true; s.context.testChat=1
  count=count+require(clients.setupClient(s,4,settings,1),"successful setup")
  b=s.lifecycleState.botstates[4]
  count=count+require(b.inuse and b.client==4 and b.entitynum==4 and b.character==77 and b.gs==101 and b.ws==102 and b.cs==103 and b.ms==104,"successful handles")
  count=count+require(b.settings.characterfile==settings.characterfile and b.settings.skill==3.0 and b.settings.team=="red" and b.setupcount==4 and b.entergameTime==12.5 and b.walker==0.75 and s.lifecycleState.numbots==1,"successful state")
  count=count+require(same(s.context.events,["aas","character:bots/sarge_c.c:3.","alloc-goal:4","char:77:40:144","load-items:101:items.c","alloc-weapon","char:77:3:144","load-weapons:102:weapons.c","alloc-chat","char:77:21:144","char:77:22:144","load-chat:103:chat.c:Ranger","char:77:1:144","gender:103:1","time","alloc-move","char-float:77:48","query:bot_testichat","var:bot_testichat=1","chat-test:4","schedule","mutate:101:1","read:4"]),"successful setup order")

  s=fixture(); b=lifecycle.createBot(2); s.lifecycleState.botstates[2]=b
  count=count+require(not clients.setupClient(s,2,settings,0) and same(s.context.events,["diag:1:2"]),"already active diagnostic")
  s=fixture(); s.context.aas=false
  count=count+require(not clients.setupClient(s,2,settings,0) and same(s.context.events,["aas","diag:2:2"]) and s.lifecycleState.botstates[2]!=void,"AAS failure after allocation")
  s=fixture(); s.context.character=0
  count=count+require(not clients.setupClient(s,2,settings,0) and same(s.context.events,["aas","character:bots/sarge_c.c:3.","diag:3:2"]),"character failure")

  s=fixture(); s.context.itemResult=9
  count=count+require(not clients.setupClient(s,2,settings,0) and s.context.events[len(s.context.events)-1]=="free-goal:101" and s.lifecycleState.botstates[2].character==77,"item failure frees only goal and leaks character")
  s=fixture(); s.context.weaponResult=9
  count=count+require(not clients.setupClient(s,2,settings,0) and same([s.context.events[len(s.context.events)-2],s.context.events[len(s.context.events)-1]],["free-goal:101","free-weapon:102"]),"weapon failure cleanup order")
  s=fixture(); s.context.chatResult=9
  count=count+require(not clients.setupClient(s,2,settings,0) and same([s.context.events[len(s.context.events)-3],s.context.events[len(s.context.events)-2],s.context.events[len(s.context.events)-1]],["free-chat:103","free-goal:101","free-weapon:102"]),"chat failure cleanup order")

  for each pair in [["female",1],["F",1],["male",2],["M",2],["it",0],["",0]]
    s=fixture(); s.context.gender=pair[0]; clients.setupClient(s,1,settings,0)
    count=count+require(s.context.events[13]=="gender:103:"+str(pair[1]),"gender mapping "+pair[0])
  end for

  s=fixture(); clients.setupClient(s,6,settings,0); b=s.lifecycleState.botstates[6]
  b.checkpoints=201; b.patrolpoints=202; b.numKills=9; b.transient="busy"; s.context.chatExit=true; s.context.events=[]
  count=count+require(clients.shutdownClient(s,6,1),"restart shutdown")
  count=count+require(same(s.context.events,["write:6","chat-exit:6","enter-chat:103:6:0","free-move:104","free-goal:101","free-chat:103","free-weapon:102","free-character:77","free-waypoints:201","free-waypoints:202","clear-activate:6"]),"shutdown cleanup order")
  count=count+require(not b.inuse and b.character==0 and b.gs==0 and b.checkpoints is void and b.numKills==0 and b.transient is void and s.lifecycleState.numbots==0,"shutdown clears same state object")
  s.context.events=[]; count=count+require(not clients.shutdownClient(s,6,0) and len(s.context.events)==0,"double shutdown inert")

  s=fixture(); clients.setupClient(s,3,settings,0); s.context.events=[]; clients.shutdownClient(s,3,0)
  count=count+require(s.context.events[0]=="chat-exit:3" and s.context.events[1]=="free-move:104","nonrestart skips session and false chat skips enter")
  count=count+require(try(clients.setupClient(s,-1,settings,0)) is error and try(clients.shutdownClient(s,64,0)) is error,"slot guards")
  return count
end function
function main(args)
  count=contracts(); print("PASS: "+str(count)+" bot client resource contracts\n"); return 0
end function
