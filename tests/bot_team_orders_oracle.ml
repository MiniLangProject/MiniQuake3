// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_team_helpers as team
import mq3.game.bot_lifecycle as bots
struct Context events end struct
function getMessage(s,chat) s.context.events=s.context.events+["get:"+str(chat)];return "defend" end function
function queue(s,chat,kind,text) s.context.events=s.context.events+["queue:"+str(chat)+":"+str(kind)+":"+text];return void end function
function enter(s,chat,client,kind) s.context.events=s.context.events+["enter:"+str(chat)+":"+str(client)+":"+str(kind)];return void end function
function dump(events) for each value in events print value end for return void end function
function main(args)
 s=team.create();s.context=Context([]);s.getChatMessageFn=getMessage;s.queueConsoleMessageFn=queue;s.enterChatFn=enter;s.names[3]="Ranger";b=bots.createBot(3);b.cs=17
 team.sayTeamOrderAlways(s,b,3);dump(s.context.events);s.context.events=[]
 team.sayTeamOrderAlways(s,b,5);dump(s.context.events);s.context.events=[]
 team.sayTeamOrder(s,b,3);dump(s.context.events);s.context.events=[]
 team.sayTeamOrder(s,b,5);dump(s.context.events);s.context.events=[]
 team.voiceChat(s,b,-1,"yes");team.voiceChatOnly(s,b,2,"no");team.sayVoiceTeamOrder(s,b,1,"attack");print "voice-events="+str(len(s.context.events))
 return 0
end function
