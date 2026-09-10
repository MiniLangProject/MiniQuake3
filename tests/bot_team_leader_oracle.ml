// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_team_helpers as team
import mq3.game.bot_lifecycle as bots
struct Context events ordered end struct
function same(s,b,client) return client==3 or client==4 end function
function lastTask(s,b) s.context.events=s.context.events+["last"];return s.context.ordered end function
function defend(s,b,client,mode) s.context.events=s.context.events+["defend:"+str(client)+":"+str(mode)];return void end function
function bit(v) if v then return 1 end if return 0 end function
function run(s,b) print "found="+str(bit(team.findHumanTeamLeader(s,b)))+":"+b.teamleader;for each e in s.context.events print e end for;s.context.events=[];b.teamleader="";return void end function
function main(args)
 s=team.create();s.sameTeamFn=same;s.setLastOrderedTaskFn=lastTask;s.defendFn=defend;s.context=Context([],false);b=bots.createBot(0)
 s.entityInUse[0]=true;s.entitySvFlags[0]=8;s.entityInUse[1]=true;s.notLeader[1]=true;s.entityInUse[2]=true;s.names[2]="Wrong";s.entityInUse[3]=true;s.names[3]="Human";run(s,b)
 s.context.ordered=true;run(s,b)
 s.entityInUse[3]=false;s.entityInUse[4]=false;run(s,b)
 return 0
end function
