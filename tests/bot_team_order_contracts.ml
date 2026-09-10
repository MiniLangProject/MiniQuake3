// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_team_helpers as team
import mq3.game.bot_lifecycle as bots
struct Context events end struct
function require(v,label) if not v then return error(499,"Bot team order contract: "+label) end if return 1 end function
function getMessage(s,chat) s.context.events=s.context.events+["get"];return "hold position" end function
function queue(s,chat,kind,text) s.context.events=s.context.events+[["queue",chat,kind,text]];return void end function
function enter(s,chat,client,kind) s.context.events=s.context.events+[["enter",chat,client,kind]];return void end function
function contracts()
 count=0;s=team.create();s.context=Context([]);s.getChatMessageFn=getMessage;s.queueConsoleMessageFn=queue;s.enterChatFn=enter;s.names[3]="Ranger";b=bots.createBot(3);b.cs=17;ec=decode(bytes([25]))
 team.sayTeamOrderAlways(s,b,3);count=count+require(len(s.context.events)==2 and s.context.events[0]=="get","self fetches chat")
 count=count+require(s.context.events[1]==["queue",17,1,ec+"(Ranger"+ec+")"+ec+": hold position"],"self queues decorated team chat")
 s.context.events=[];team.sayTeamOrderAlways(s,b,5);count=count+require(s.context.events==[["enter",17,5,2]],"other client tell")
 s.context.events=[];team.sayTeamOrder(s,b,3);count=count+require(len(s.context.events)==2,"baseq3 wrapper uses always")
 s.context.events=[];team.voiceChat(s,b,-1,"yes");team.voiceChatOnly(s,b,2,"no");team.sayVoiceTeamOrder(s,b,1,"attack");count=count+require(s.context.events==[],"baseq3 voice helpers are no-op")
 return count
end function
function main(args) count=contracts();print("PASS: "+str(count)+" bot team order contracts\n");return 0 end function
