// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_team_helpers as team
import mq3.game.bot_lifecycle as bots
import mq3.qcommon.cvar as cv
struct Context order events end struct
function require(v,label) if not v then return error(499,"Own-flag-away contract: "+label) end if return 1 end function
function sortBase(s,bot) return s.context.order end function
function chat(s,bot,kind,args) s.context.events=s.context.events+["C:"+kind+":"+args[0]];return void end function
function order(s,bot,client) s.context.events=s.context.events+["O:"+str(client)];return void end function
function fixture(list,aggressive)
 s=team.create();s.context=Context(list,[]);s.sortBaseFn=sortBase;s.initialChatFn=chat;s.orderAlwaysFn=order;for index=0 to 63 s.names[index]="P"+str(index) end for
 b=bots.createBot(0);b.numteammates=len(list);if aggressive then b.ctfstrategy=team.CTFS_AGRESSIVE end if;return [s,b]
end function
function same(a,b) if len(a)!=len(b) then return false end if for i=0 to len(a)-1 if a[i]!=b[i] then return false end if end for return true end function
function contracts()
 count=0
 pair=fixture([0],false);team.ctfOrdersFlagNotAtBase(pair[0],pair[1]);count=count+require(len(pair[0].context.events)==0,"passive singleton")
 pair=fixture([0],true);team.ctfOrdersFlagNotAtBase(pair[0],pair[1]);count=count+require(len(pair[0].context.events)==0,"aggressive singleton")
 pair=fixture([0,1],false);team.ctfOrdersFlagNotAtBase(pair[0],pair[1]);count=count+require(same(pair[0].context.events,["C:cmd_defendbase:P0","O:0","C:cmd_getflag:P1","O:1"]),"passive pair")
 pair=fixture([0,1],true);team.ctfOrdersFlagNotAtBase(pair[0],pair[1]);count=count+require(same(pair[0].context.events,["C:cmd_getflag:P0","O:0","C:cmd_getflag:P1","O:1"]),"aggressive pair")
 pair=fixture([0,1,2],false);team.ctfOrdersFlagNotAtBase(pair[0],pair[1]);expected=["C:cmd_defendbase:P0","O:0","C:cmd_getflag:P1","O:1","C:cmd_getflag:P2","O:2"];count=count+require(same(pair[0].context.events,expected),"passive triple")
 pair=fixture([0,1,2],true);team.ctfOrdersFlagNotAtBase(pair[0],pair[1]);count=count+require(same(pair[0].context.events,expected),"aggressive triple keeps Baseq3 defend chat")
 pair=fixture([0,1,2,3,4],false);team.ctfOrdersFlagNotAtBase(pair[0],pair[1]);count=count+require(same(pair[0].context.events,["C:cmd_defendbase:P0","O:0","C:cmd_defendbase:P1","O:1","C:cmd_getflag:P4","O:4","C:cmd_getflag:P3","O:3","C:cmd_getflag:P2","O:2","C:cmd_getflag:P1","O:1"]),"passive default overlap preserved")
 pair=fixture([0,1,2,3,4],true);team.ctfOrdersFlagNotAtBase(pair[0],pair[1]);count=count+require(len(pair[0].context.events)==10 and pair[0].context.events[0]=="C:cmd_defendbase:P0" and pair[0].context.events[2]=="C:cmd_getflag:P4","aggressive default bands")
 members=[];for i=0 to 11 members=members+[i] end for;pair=fixture(members,false);team.ctfOrdersFlagNotAtBase(pair[0],pair[1]);count=count+require(len(pair[0].context.events)==18,"passive three/six caps")
 pair=fixture(members,true);team.ctfOrdersFlagNotAtBase(pair[0],pair[1]);count=count+require(len(pair[0].context.events)==18,"aggressive two/seven caps")
 pair=fixture([0,1,2,3,4],false);pair[0].preferences[4]=team.TEAMTP_DEFENDER;pair[0].preferenceNames[4]="P4";pair[0].preferences[0]=team.TEAMTP_ATTACKER;pair[0].preferenceNames[0]="P0";team.ctfOrdersFlagNotAtBase(pair[0],pair[1]);count=count+require(pair[0].context.events[0]=="C:cmd_defendbase:P4" and pair[0].context.events[4]=="C:cmd_getflag:P0","preference sorting")
 pair=fixture([0,1],false);pair[1].flagcarrier=0;team.ctfOrdersFlagNotAtBase(pair[0],pair[1]);a=pair[0].context.events;pair=fixture([0,1],false);pair[1].flagcarrier=-1;team.ctfOrdersFlagNotAtBase(pair[0],pair[1]);count=count+require(same(a,pair[0].context.events),"own-away policy is carrier independent")
 count=count+require(try(team.ctfOrdersFlagNotAtBase(team.create(),bots.createBot(0))) is error,"sorting service required")
 return count
end function
function main(args) count=contracts();print("PASS: "+str(count)+" own-flag-away CTF order contracts\n");return 0 end function
