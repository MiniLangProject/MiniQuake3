// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_team_helpers as team
import mq3.game.bot_lifecycle as bots
struct Context events ordered end struct
function require(v,label) if not v then return error(499,"Bot team leader contract: "+label) end if return 1 end function
function same(s,b,client) return client==3 or client==4 end function
function lastTask(s,b) s.context.events=s.context.events+["last"];return s.context.ordered end function
function defend(s,b,client,mode) s.context.events=s.context.events+[[client,mode]];return void end function
function contracts()
 count=0;s=team.create();s.sameTeamFn=same;s.setLastOrderedTaskFn=lastTask;s.defendFn=defend;s.context=Context([],false);b=bots.createBot(0)
 s.entityInUse[0]=true;s.entitySvFlags[0]=8;s.entityInUse[1]=true;s.notLeader[1]=true;s.entityInUse[2]=true;s.names[2]="Wrong";s.entityInUse[3]=true;s.names[3]="Human"
 count=count+require(team.findHumanTeamLeader(s,b),"finds candidate");count=count+require(b.teamleader=="Human","copies name")
 count=count+require(s.context.events==["last",[3,1]],"default defense")
 s.context.events=[];s.context.ordered=true;count=count+require(team.findHumanTeamLeader(s,b) and s.context.events==["last"],"keeps existing order")
 s.entityInUse[3]=false;s.entityInUse[4]=false;count=count+require(not team.findHumanTeamLeader(s,b),"no candidates")
 count=count+require(b.teamleader=="Human","failed scan preserves leader")
 return count
end function
function main(args) count=contracts();print("PASS: "+str(count)+" bot team leader contracts\n");return 0 end function
