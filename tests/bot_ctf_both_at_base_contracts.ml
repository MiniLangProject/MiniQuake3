// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_team_helpers as team
import mq3.game.bot_lifecycle as bots
struct Context order events end struct
function require(v,label) if not v then return error(499,"Both-flags-at-base contract: "+label) end if return 1 end function
function sortBase(s,bot) return s.context.order end function
function chat(s,bot,kind,args)
 value="C:"+kind
 for each arg in args value=value+":"+arg end for
 s.context.events=s.context.events+[value];return void
end function
function order(s,bot,client) s.context.events=s.context.events+["O:"+str(client)];return void end function
function fixture(list,aggressive)
 s=team.create();s.context=Context(list,[]);s.sortBaseFn=sortBase;s.initialChatFn=chat;s.orderAlwaysFn=order
 for index=0 to 63 s.names[index]="P"+str(index) end for
 b=bots.createBot(0);b.numteammates=len(list);if aggressive then b.ctfstrategy=team.CTFS_AGRESSIVE end if;return [s,b]
end function
function same(a,b) if len(a)!=len(b) then return false end if for i=0 to len(a)-1 if a[i]!=b[i] then return false end if end for return true end function
function contracts()
 count=0
 pair=fixture([0],false);team.ctfOrdersBothFlagsAtBase(pair[0],pair[1]);count=count+require(len(pair[0].context.events)==0,"passive singleton")
 pair=fixture([0],true);team.ctfOrdersBothFlagsAtBase(pair[0],pair[1]);count=count+require(len(pair[0].context.events)==0,"aggressive singleton")
 pair=fixture([0,1],false);team.ctfOrdersBothFlagsAtBase(pair[0],pair[1]);count=count+require(same(pair[0].context.events,["C:cmd_defendbase:P0","O:0","C:cmd_getflag:P1","O:1"]),"passive pair")
 pair=fixture([0,1],true);team.ctfOrdersBothFlagsAtBase(pair[0],pair[1]);count=count+require(same(pair[0].context.events,["C:cmd_defendbase:P0","O:0","C:cmd_getflag:P1","O:1"]),"aggressive pair")
 pair=fixture([0,1,2],false);team.ctfOrdersBothFlagsAtBase(pair[0],pair[1]);count=count+require(same(pair[0].context.events,["C:cmd_defendbase:P0","O:0","C:cmd_defendbase:P1","O:1","C:cmd_getflag:P2","O:2"]),"passive triple")
 pair=fixture([0,1,2],true);team.ctfOrdersBothFlagsAtBase(pair[0],pair[1]);count=count+require(same(pair[0].context.events,["C:cmd_defendbase:P0","O:0","C:cmd_getflag:P1","O:1","C:cmd_getflag:P2","O:2"]),"aggressive triple")
 pair=fixture([0,1,2,3],false);team.ctfOrdersBothFlagsAtBase(pair[0],pair[1]);count=count+require(same(pair[0].context.events,["C:cmd_defendbase:P0","O:0","C:cmd_defendbase:P1","O:1","C:cmd_getflag:P3","O:3","C:cmd_getflag:P2","O:2"]),"passive four-player rounding")
 pair=fixture([0,1,2,3],true);team.ctfOrdersBothFlagsAtBase(pair[0],pair[1]);count=count+require(same(pair[0].context.events,["C:cmd_defendbase:P0","O:0","C:cmd_defendbase:P1","O:1","C:cmd_getflag:P3","O:3","C:cmd_getflag:P2","O:2"]),"aggressive four-player rounding")
 pair=fixture([0,1,2,3,4],false);team.ctfOrdersBothFlagsAtBase(pair[0],pair[1]);count=count+require(len(pair[0].context.events)==10 and pair[0].context.events[4]=="C:cmd_defendbase:P2" and pair[0].context.events[6]=="C:cmd_getflag:P4","passive half-up rounding")
 pair=fixture([0,1,2,3,4],true);team.ctfOrdersBothFlagsAtBase(pair[0],pair[1]);count=count+require(len(pair[0].context.events)==10 and pair[0].context.events[4]=="C:cmd_getflag:P4","aggressive half-up rounding")
 pair=fixture([0,1,2,3,4],false);pair[0].preferences[4]=team.TEAMTP_DEFENDER;pair[0].preferenceNames[4]="P4";pair[0].preferences[0]=team.TEAMTP_ATTACKER;pair[0].preferenceNames[0]="P0";team.ctfOrdersBothFlagsAtBase(pair[0],pair[1]);count=count+require(pair[0].context.events[0]=="C:cmd_defendbase:P4" and pair[0].context.events[6]=="C:cmd_getflag:P0","passive preference bands")
 pair=fixture([0,1,2,3,4],true);pair[0].preferences[4]=team.TEAMTP_DEFENDER;pair[0].preferenceNames[4]="P4";pair[0].preferences[0]=team.TEAMTP_ATTACKER;pair[0].preferenceNames[0]="P0";team.ctfOrdersBothFlagsAtBase(pair[0],pair[1]);count=count+require(pair[0].context.events[0]=="C:cmd_defendbase:P4" and pair[0].context.events[4]=="C:cmd_getflag:P0","aggressive preference bands")
 members=[];for i=0 to 11 members=members+[i] end for;pair=fixture(members,false);team.ctfOrdersBothFlagsAtBase(pair[0],pair[1]);count=count+require(len(pair[0].context.events)==18 and pair[0].context.events[8]=="C:cmd_defendbase:P4" and pair[0].context.events[10]=="C:cmd_getflag:P11","passive five/four caps")
 members=[];for i=0 to 11 members=members+[i] end for;pair=fixture(members,true);team.ctfOrdersBothFlagsAtBase(pair[0],pair[1]);count=count+require(len(pair[0].context.events)==18 and pair[0].context.events[6]=="C:cmd_defendbase:P3" and pair[0].context.events[8]=="C:cmd_getflag:P11","aggressive four/five caps")
 pair=fixture([0,1,2,3,4,5],false);team.ctfOrdersBothFlagsAtBase(pair[0],pair[1]);count=count+require(len(pair[0].context.events)==10,"passive six-player rounding")
 pair=fixture([0,1,2,3,4,5],true);team.ctfOrdersBothFlagsAtBase(pair[0],pair[1]);count=count+require(len(pair[0].context.events)==10,"aggressive six-player rounding")
 count=count+require(try(team.ctfOrdersBothFlagsAtBase(team.create(),bots.createBot(0))) is error,"sorting service required")
 return count
end function
function main(args) count=contracts();print("PASS: "+str(count)+" both-flags-at-base CTF order contracts\n");return 0 end function
