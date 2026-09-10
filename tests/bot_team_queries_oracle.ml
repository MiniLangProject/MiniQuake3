// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_team_helpers as team
import mq3.game.bot_lifecycle as bots
function pm(s,client) if client==1 then return 0 end if return 3 end function
function bit(v) if v then return 1 end if return 0 end function
function main(args)
 s=team.create();s.maxclients=5;s.gametype=3;s.getClientPmTypeFn=pm;s.configs[0]="\\n\\^1RedBot\\t\\1";s.configs[1]="\\n\\BlueBot\\t\\2";s.configs[2]="\\n\\Mate\\t\\1";s.configs[3]="\\n\\Free\\t\\0";b=bots.createBot(0)
 print "team="+str(team.team(s,b))+":"+str(team.oppositeTeam(s,b));b.client=1;print "team="+str(team.team(s,b))+":"+str(team.oppositeTeam(s,b));b.client=3;print "team="+str(team.team(s,b))+":"+str(team.oppositeTeam(s,b));b.client=-1;print "team="+str(team.team(s,b))+":"+str(team.oppositeTeam(s,b))
 b.client=0;print "same="+str(bit(team.sameTeam(s,b,2)))+","+str(bit(team.sameTeam(s,b,1)))+","+str(bit(team.sameTeam(s,b,64)));s.gametype=2;print "same="+str(bit(team.sameTeam(s,b,2)));s.gametype=3
 print "find="+str(team.clientFromName(s,"redbot"))+","+str(team.clientFromName(s,"BLUEBOT"))+","+str(team.clientFromName(s,"missing"))
 print "teamfind="+str(team.clientOnSameTeamFromName(s,b,"Mate"))+","+str(team.clientOnSameTeamFromName(s,b,"BlueBot"))
 print "dead="+str(bit(team.entityIsDead(s,1)))+","+str(bit(team.entityIsDead(s,2)))+","+str(bit(team.entityIsDead(s,70)))
 return 0
end function
