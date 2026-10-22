// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.ai_main as ai
import mq3.game.bot_lifecycle as life
import mq3.qcommon.cvar as cv

struct Context events leader traceValue area end struct
function req(ok,label) if not ok then return error(7911,"ai_main contract: "+label) end if;return 1 end function
function event(s,text) s.context.events=s.context.events+[text];return void end function
function printHost(s,kind,text) return event(s,"print:"+str(kind)+":"+text) end function
function traceHost(s,start,mins,maxs,traceEnd,passent,mask) event(s,"trace:"+str(passent)+":"+str(mask));return s.context.traceValue end function
function entityHost(s,entity) event(s,"entity:"+str(entity));return "entity-"+str(entity) end function
function synonym(s,bot) return 17 end function
function initial(s,chat,type,context,vars) return event(s,"initial:"+str(chat)+":"+type+":"+str(context)+":"+str(len(vars))) end function
function fromName(s,name) if name=="Alpha" then return s.context.leader end if;return -1 end function
function cvarText(s,name) return s.context.events[0] end function

function fixture()
  state=life.create(cv.create());s=ai.create(state);s.context=Context([],3,"trace-result",void);s.printFn=printHost;s.traceFn=traceHost;s.entityInfoFn=entityHost;s.synonymContextFn=synonym;s.initialChatFn=initial;s.clientFromNameFn=fromName;return s
end function
function main(args)
  count=0;s=fixture();count=count+req(s.frameServices.lifecycleState==s.lifecycleState and s.clientServices.lifecycleState==s.lifecycleState,"coherent adapter graph")
  count=count+req(ai.AngleDifference(10.0,350.0)==20.0 and ai.AngleDifference(350.0,10.0)==-20.0,"angle difference delegate")
  count=count+req(ai.BotChangeViewAngle(350.0,10.0,5.0)>354.99 and ai.BotChangeViewAngle(350.0,10.0,5.0)<355.01,"view clamp delegate")
  count=count+req(ai.RemoveColorEscapeSequences("^1Red") == "Red","color escape delegate")
  ai.BotAI_Print(s,ai.PRT_WARNING,"careful");count=count+req(s.context.events[0]=="print:2:careful" and s.actions[0].kind=="warning","typed print dispatch")
  result=ai.BotAI_Trace(s,[0.0,0.0,0.0],void,void,[1.0,2.0,3.0],4,9);count=count+req(result=="trace-result" and s.context.events[1]=="trace:4:9","typed trace dispatch")
  count=count+req(ai.BotEntityInfo(s,12)=="entity-12" and s.context.events[2]=="entity:12","entity info boundary")
  before=len(s.context.events);s.retailActive=true;count=count+req(ai.BotAI_Trace(s,[],void,void,[],0,0)==void and len(s.context.events)==before,"retail suppression")
  s.retailActive=false;b0=life.createBot(0);b3=life.createBot(3);b9=life.createBot(9);s.lifecycleState.botstates[0]=b0;s.lifecycleState.botstates[3]=b3;s.lifecycleState.botstates[9]=b9;s.lifecycleState.numbots=3;s.lifecycleState.thinktime.integer=100
  count=count+req(ai.NumBots(s)==3 and ai.BotScheduleBotThink(s)==3,"bot count and schedule count")
  count=count+req(s.frameServices.runtimes[0].botthinkResidual==0 and s.frameServices.runtimes[3].botthinkResidual==33 and s.frameServices.runtimes[9].botthinkResidual==66,"distributed residuals")
  b0.teamleader="Alpha";count=count+req(ai.BotTeamLeader(s,b0),"active named leader");b3.inuse=false;count=count+req(not ai.BotTeamLeader(s,b0),"inactive leader rejected");b3.inuse=true;s.context.leader=-1;count=count+req(not ai.BotTeamLeader(s,b0),"unknown leader rejected")
  b0.cs=44;ai.BotAI_BotInitialChat(s,b0,"hello",["one","two"]);count=count+req(s.context.events[len(s.context.events)-1]=="initial:44:hello:17:8","initial chat context and padding")
  goal=ai.SessionGoal(4,5,6,7,8,[1.25,-2.5,3.75],[-4.0,-5.0,-6.0],[4.0,5.0,6.0]);s.sessions[0]=ai.SessionData(1,2,3,goal);text=ai.BotWriteSessionData(s,b0)
  count=count+req(text=="1 2 3 4 5 6 7 8 1.250000 -2.500000 3.750000 -4.000000 -5.000000 -6.000000 4.000000 5.000000 6.000000","session C formatting")
  parsed=ai.parseSession(text);count=count+req(parsed.decisionmaker==1 and parsed.goal.number==8 and parsed.goal.origin[1]==-2.5 and parsed.goal.maxs[2]==6.0,"session parse roundtrip")
  bad=ai.parseSession("broken");count=count+req(bad.decisionmaker==0 and bad.goal.areanum==0,"short session zero semantics")
  count=count+req(ai.NumBots(s)==3,"bot count remains stable")
  count=count+req(len(s.actions)==5,"typed action accounting")
  print("PASS: "+str(count)+" ai_main native adapter contracts\n");return 0
end function





