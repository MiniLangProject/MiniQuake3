// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_ai_commands as commands
import mq3.game.bot_lifecycle as bots
import mq3.game.playerstate as ps
import mq3.qcommon.cvar as cv

struct Context events pending cursor configs names nodeResults nodeCursor end struct
function require(v,label) if not v then return error(499,"Bot AI command contract: "+label) end if return 1 end function
function event(s,text) s.context.events=s.context.events+[text];return void end function
function reset(s,client) return event(s,"reset:"+str(client)) end function
function clientState(s,client) p=ps.create();p.commandTime=77;return [true,p] end function
function nextCommand(s,client) if s.context.cursor>=len(s.context.pending) then return void end if;v=s.context.pending[s.context.cursor];s.context.cursor=s.context.cursor+1;return v end function
function queue(s,chat,kind,text) return event(s,"queue:"+str(chat)+":"+str(kind)+":"+text) end function
function setup(s) return event(s,"setup") end function
function diagnostic(s,client) return event(s,"fatal:"+str(client)) end function
function clientName(s,client) return s.context.names[client] end function
function easyName(s,client) return "Easy"+str(client) end function
function goalName(s,goal) return "Goal"+str(goal) end function
function topGoal(s,handle) return 99 end function
function carryingCallback(s,bot) return bot.client==1 end function
function teamCallback(s,bot) if bot.client==1 then return 1 end if return 2 end function
function getConfig(s,client) return s.context.configs[client] end function
function setInfo(s,client,value) return event(s,"info:"+str(client)+":"+value) end function
function printLine(s,text) return event(s,"print:"+text) end function
function nodeStep(s,b) event(s,"node:"+str(b.aiNode));result=s.context.nodeResults[s.context.nodeCursor];s.context.nodeCursor=s.context.nodeCursor+1;return result end function
function fixture()
 ls=bots.create(cv.create());s=commands.create(ls);s.context=Context([],[],0,array(64,""),array(64,""),[],0);s.maxclients=4
 s.resetInputFn=reset;s.getClientStateFn=clientState;s.nextServerCommandFn=nextCommand;s.queueMessageFn=queue;s.deathmatchSetupFn=setup;s.diagnosticFn=diagnostic
 s.clientNameFn=clientName;s.easyClientNameFn=easyName;s.goalNameFn=goalName;s.topGoalNumberFn=topGoal;s.carryingFlagFn=carryingCallback;s.teamFn=teamCallback;s.getPlayerConfigFn=getConfig;s.setBotInfoFn=setInfo;s.printFn=printLine
 return s
end function
function bot(s,slot) b=bots.createBot(slot);b.cs=100+slot;b.gs=200+slot;s.lifecycleState.botstates[slot]=b;s.context.names[slot]="Bot"+str(slot);return b end function
function has(a,v) for each x in a if x==v then return true end if end for return false end function
function contracts()
 count=0
 cleaned=commands.removeColorEscapeSequences("^1Red^^Caret"+decode(bytes([127,128,255])))
  count=count+require(cleaned=="Red^aret"+decode(bytes([128,255])),"MSVC color/high-byte filtering")
 count=count+require(commands.unquote("\"hello\"")=="hello" and commands.unquote("")=="","quote removal")
 s=fixture();s.context.pending=["print \"^1hello\"","chat \"team^7 msg\"","tchat \"squad\"","scores no-op","cp ignored","cs ignored","nospace"]
 b=bot(s,2);count=count+require(commands.botAI(s,2,0.1),"active BotAI")
 count=count+require(b.curPs.commandTime==77 and s.context.events[0]=="reset:2" and s.context.events[len(s.context.events)-1]=="setup","state copy and setup order")
 count=count+require(has(s.context.events,"queue:102:0:hello") and has(s.context.events,"queue:102:1:team msg") and has(s.context.events,"queue:102:1:squad"),"print/chat/tchat queues")
 count=count+require(len(s.context.events)==5,"ignored commands do not queue")
 s=fixture();b=bot(s,2);b.aiNode=1;s.nodeStepFn=nodeStep;s.context.nodeResults=[false,true];count=count+require(commands.botAI(s,2,0.1),"AI node redispatch completes")
 count=count+require(s.context.events==["reset:2","setup","node:1","node:1"],"deathmatch setup precedes bounded node dispatch")
 s=fixture();b=bot(s,2);b.aiNode=99;s.nodeStepFn=void;count=count+require(try(commands.runNodes(s,b)) is error,"nonzero node requires dispatcher")
 s=fixture();b=bot(s,2);b.aiNode=1;s.nodeStepFn=nodeStep;s.context.nodeResults=array(commands.MAX_NODESWITCHES,false);count=count+require(try(commands.runNodes(s,b)) is error and s.context.nodeCursor==commands.MAX_NODESWITCHES,"node switch bound cap")
 s=fixture();count=count+require(not commands.botAI(s,3,0.1) and s.context.events==["reset:3","fatal:3"],"inactive bot fatal after reset")

 s=fixture();b=bot(s,1);s.context.names[1]="Leader";b.teamleader="Leader";b.ltgtype=commands.LTG_TEAMHELP;b.teammate=3;s.gametype=4
 count=count+require(commands.action(s,b,99)=="helping Easy3","teamhelp action")
 expected=[[commands.LTG_TEAMACCOMPANY,"accompanying Easy3"],[commands.LTG_DEFENDKEYAREA,"defending Goal7"],[commands.LTG_GETITEM,"getting item Goal7"],[commands.LTG_KILL,"killing Bot2"],[commands.LTG_CAMP,"camping"],[commands.LTG_CAMPORDER,"camping"],[commands.LTG_PATROL,"patrolling"],[commands.LTG_GETFLAG,"capturing flag"],[commands.LTG_RUSHBASE,"rushing base"],[commands.LTG_RETURNFLAG,"returning flag"],[commands.LTG_ATTACKENEMYBASE,"attacking the enemy base"],[commands.LTG_HARVEST,"harvesting"],[0,"roaming Goal99"]]
 b.teamgoalNumber=7;b.teamgoalEntitynum=2;s.context.names[2]="Bot2"
 for each row in expected b.ltgtype=row[0];count=count+require(commands.action(s,b,99)==row[1],"action "+str(row[0])) end for
 b.ltgtype=commands.LTG_TEAMHELP;value=commands.setInfoConfigString(s,b)
 count=count+require(value=="l\\L\\c\\F \\a\\helping Easy3" and s.context.events[0]=="info:1:"+value,"bot info config string")
 line=commands.reportStatus(s,b);count=count+require(line=="Leader              L^1F : helping Easy3\n","colored padded report")
 s=fixture();r=bot(s,1);r.ltgtype=commands.LTG_PATROL;s.context.names[1]="Red";bl=bot(s,2);bl.ltgtype=commands.LTG_CAMP;s.context.names[2]="Blue"
 s.context.configs[1]="\\n\\Red\\t\\1";s.context.configs[2]="\\n\\Blue\\t\\2";s.context.configs[3]="\\t\\1"
 count=count+require(commands.updateInfoConfigStrings(s)==2,"info update filters and counts")
 count=count+require(has(s.context.events,"info:1:l\\ \\c\\  \\a\\patrolling") and has(s.context.events,"info:2:l\\ \\c\\  \\a\\camping"),"info update content")
 s.context.events=[];commands.teamplayReport(s)
 count=count+require(s.context.events[0]=="print:^1RED\n" and s.context.events[2]=="print:^4BLUE\n" and len(s.context.events)==4,"team report headings and order")
 return count
end function
function main(args) count=contracts();print("PASS: "+str(count)+" bot AI command/status contracts\n");return 0 end function
