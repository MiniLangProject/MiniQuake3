// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_team_helpers as team
import mq3.game.bot_lifecycle as bots
import mq3.qcommon.cvar as cv

struct Context order events end struct
function require(v,label) if not v then return error(499,"Both-flags-away contract: "+label) end if return 1 end function
function sortBase(s,bot) return s.context.order end function
function chat(s,bot,kind,args)
 text="chat:"+kind;for each value in args text=text+":"+value end for;s.context.events=s.context.events+[text];return void
end function
function order(s,bot,client) s.context.events=s.context.events+["order:"+str(client)];return void end function
function fixture(list,carrier,self)
 s=team.create();s.context=Context(list,[]);s.sortBaseFn=sortBase;s.initialChatFn=chat;s.orderAlwaysFn=order
 for index=0 to 63 s.names[index]="P"+str(index) end for
 b=bots.createBot(self);b.flagcarrier=carrier;b.numteammates=len(list);return [s,b]
end function
function same(a,b) if len(a)!=len(b) then return false end if for index=0 to len(a)-1 if a[index]!=b[index] then return false end if end for return true end function
function contracts()
 count=0
 pair=fixture([0],-1,0);team.ctfOrdersBothFlagsNotAtBase(pair[0],pair[1]);count=count+require(len(pair[0].context.events)==0,"one teammate receives no order")
 pair=fixture([0,1],0,0);team.ctfOrdersBothFlagsNotAtBase(pair[0],pair[1]);count=count+require(same(pair[0].context.events,["chat:cmd_getflag:P1","order:1"]),"two teammates skips first carrier")
 pair=fixture([0,1],1,0);team.ctfOrdersBothFlagsNotAtBase(pair[0],pair[1]);count=count+require(same(pair[0].context.events,["chat:cmd_getflag:P0","order:0"]),"two teammates chooses first noncarrier")
 pair=fixture([0,1,2],0,0);team.ctfOrdersBothFlagsNotAtBase(pair[0],pair[1]);count=count+require(same(pair[0].context.events,["chat:cmd_accompanyme:P1","order:1","chat:cmd_getflag:P2","order:2"]),"three teammates self carrier")
 pair=fixture([0,1,2],2,0);team.ctfOrdersBothFlagsNotAtBase(pair[0],pair[1]);count=count+require(same(pair[0].context.events,["chat:cmd_accompany:P0:P2","order:0","chat:cmd_getflag:P1","order:1"]),"three teammates remote far carrier")
 pair=fixture([0,1,2],-1,0);team.ctfOrdersBothFlagsNotAtBase(pair[0],pair[1]);count=count+require(same(pair[0].context.events,["chat:cmd_getflag:P0","order:0","chat:cmd_getflag:P2","order:2"]),"three teammates missing carrier")
 pair=fixture([0,1,2,3,4],2,2);team.ctfOrdersBothFlagsNotAtBase(pair[0],pair[1]);count=count+require(same(pair[0].context.events,["chat:cmd_accompanyme:P0","order:0","chat:cmd_accompanyme:P1","order:1","chat:cmd_getflag:P4","order:4","chat:cmd_getflag:P3","order:3"]),"default self carrier defender and attacker bands")
 pair=fixture([0,1,2,3,4],0,2);team.ctfOrdersBothFlagsNotAtBase(pair[0],pair[1]);count=count+require(same(pair[0].context.events,["chat:cmd_accompany:P1:P0","order:1","chat:cmd_getflag:P4","order:4","chat:cmd_getflag:P3","order:3","chat:cmd_getflag:P2","order:2"]),"default remote carrier skipped")
 pair=fixture([0,1,2,3,4],-1,2);team.ctfOrdersBothFlagsNotAtBase(pair[0],pair[1]);count=count+require(len(pair[0].context.events)==10 and pair[0].context.events[0]=="chat:cmd_getflag:P0" and pair[0].context.events[8]=="chat:cmd_getflag:P2","default missing carrier orders both bands")
 pair=fixture([0,1,2,3,4],-1,2);pair[0].preferences[4]=team.TEAMTP_DEFENDER;pair[0].preferenceNames[4]="P4";pair[0].preferences[0]=team.TEAMTP_ATTACKER;pair[0].preferenceNames[0]="P0";team.ctfOrdersBothFlagsNotAtBase(pair[0],pair[1]);count=count+require(pair[0].context.events[0]=="chat:cmd_getflag:P4" and pair[0].context.events[4]=="chat:cmd_getflag:P0","task preference sort feeds order bands")
 members=[];for index=0 to 11 members=members+[index] end for;pair=fixture(members,-1,6);team.ctfOrdersBothFlagsNotAtBase(pair[0],pair[1]);count=count+require(len(pair[0].context.events)==18,"defender four and attacker five caps")
 count=count+require(try(team.ctfOrdersBothFlagsNotAtBase(team.create(),bots.createBot(0))) is error,"sorting service required")
 return count
end function
function main(args) count=contracts();print("PASS: "+str(count)+" both-flags-away CTF order contracts\n");return 0 end function
