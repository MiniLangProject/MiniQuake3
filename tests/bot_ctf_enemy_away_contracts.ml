// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_team_helpers as team
import mq3.game.bot_lifecycle as bots
struct Context order events end struct
function require(v,label) if not v then return error(499,"Enemy-flag-away contract: "+label) end if return 1 end function
function sortBase(s,bot) return s.context.order end function
function chat(s,bot,kind,args)
 value="C:"+kind
 for each arg in args value=value+":"+arg end for
 s.context.events=s.context.events+[value];return void
end function
function order(s,bot,client) s.context.events=s.context.events+["O:"+str(client)];return void end function
function fixture(list,carrier,self)
 s=team.create();s.context=Context(list,[]);s.sortBaseFn=sortBase;s.initialChatFn=chat;s.orderAlwaysFn=order
 for index=0 to 63 s.names[index]="P"+str(index) end for
 b=bots.createBot(self);b.numteammates=len(list);b.flagcarrier=carrier;return [s,b]
end function
function same(a,b) if len(a)!=len(b) then return false end if for i=0 to len(a)-1 if a[i]!=b[i] then return false end if end for return true end function
function contracts()
 count=0
 pair=fixture([0],-1,0);team.ctfOrdersEnemyFlagNotAtBase(pair[0],pair[1]);count=count+require(len(pair[0].context.events)==0,"singleton")
 pair=fixture([0,1],0,0);team.ctfOrdersEnemyFlagNotAtBase(pair[0],pair[1]);count=count+require(same(pair[0].context.events,["C:cmd_defendbase:P1","O:1"]),"pair carrier first")
 pair=fixture([0,1],1,0);team.ctfOrdersEnemyFlagNotAtBase(pair[0],pair[1]);count=count+require(same(pair[0].context.events,["C:cmd_defendbase:P0","O:0"]),"pair carrier second")
 pair=fixture([0,1],-1,0);team.ctfOrdersEnemyFlagNotAtBase(pair[0],pair[1]);count=count+require(same(pair[0].context.events,["C:cmd_defendbase:P0","O:0"]),"pair no carrier")
 pair=fixture([0,1,2],0,0);team.ctfOrdersEnemyFlagNotAtBase(pair[0],pair[1]);count=count+require(same(pair[0].context.events,["C:cmd_defendbase:P1","O:1","C:cmd_defendbase:P2","O:2"]),"triple carrier first")
 pair=fixture([0,1,2],1,0);team.ctfOrdersEnemyFlagNotAtBase(pair[0],pair[1]);count=count+require(same(pair[0].context.events,["C:cmd_defendbase:P0","O:0","C:cmd_defendbase:P2","O:2"]),"triple carrier middle")
 pair=fixture([0,1,2],2,0);team.ctfOrdersEnemyFlagNotAtBase(pair[0],pair[1]);count=count+require(same(pair[0].context.events,["C:cmd_defendbase:P0","O:0","C:cmd_defendbase:P1","O:1"]),"triple carrier last")
 pair=fixture([0,1,2,3,4],2,2);team.ctfOrdersEnemyFlagNotAtBase(pair[0],pair[1]);count=count+require(same(pair[0].context.events,["C:cmd_defendbase:P0","O:0","C:cmd_defendbase:P1","O:1","C:cmd_accompanyme:P4","O:4","C:cmd_accompanyme:P3","O:3"]),"self carrier")
 pair=fixture([0,1,2,3,4],0,2);team.ctfOrdersEnemyFlagNotAtBase(pair[0],pair[1]);count=count+require(same(pair[0].context.events,["C:cmd_defendbase:P1","O:1","C:cmd_defendbase:P2","O:2","C:cmd_accompany:P4:P0","O:4","C:cmd_accompany:P3:P0","O:3"]),"remote carrier")
 pair=fixture([0,1,2,3,4],-1,2);team.ctfOrdersEnemyFlagNotAtBase(pair[0],pair[1]);count=count+require(same(pair[0].context.events,["C:cmd_defendbase:P0","O:0","C:cmd_defendbase:P1","O:1","C:cmd_defendbase:P2","O:2","C:cmd_getflag:P4","O:4","C:cmd_getflag:P3","O:3"]),"no carrier")
 pair=fixture([0,1,2,3,4],-1,2);pair[0].preferences[4]=team.TEAMTP_DEFENDER;pair[0].preferenceNames[4]="P4";pair[0].preferences[0]=team.TEAMTP_ATTACKER;pair[0].preferenceNames[0]="P0";team.ctfOrdersEnemyFlagNotAtBase(pair[0],pair[1]);count=count+require(pair[0].context.events[0]=="C:cmd_defendbase:P4" and pair[0].context.events[6]=="C:cmd_getflag:P0","preference sorting")
 members=[];for i=0 to 11 members=members+[i] end for;pair=fixture(members,-1,0);team.ctfOrdersEnemyFlagNotAtBase(pair[0],pair[1]);count=count+require(len(pair[0].context.events)==18,"six/three caps")
 pair=fixture([0,1,2,3,4],4,2);team.ctfOrdersEnemyFlagNotAtBase(pair[0],pair[1]);count=count+require(len(pair[0].context.events)==8 and pair[0].context.events[6]=="C:cmd_accompany:P3:P4","carrier skipped in attacker band")
 pair=fixture([0,1,2,3,4],-1,2);pair[1].ctfstrategy=team.CTFS_AGRESSIVE;team.ctfOrdersEnemyFlagNotAtBase(pair[0],pair[1]);count=count+require(len(pair[0].context.events)==10,"strategy-independent source policy")
 count=count+require(try(team.ctfOrdersEnemyFlagNotAtBase(team.create(),bots.createBot(0))) is error,"sorting service required")
 return count
end function
function main(args) count=contracts();print("PASS: "+str(count)+" enemy-flag-away CTF order contracts\n");return 0 end function
