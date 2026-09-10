// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_team_helpers as team
import mq3.game.bot_lifecycle as bots
function require(v,label) if not v then return error(499,"Bot team query contract: "+label) end if return 1 end function
function pm(s,client) if client==1 then return 0 end if return 3 end function
function contracts()
 count=0;s=team.create();s.maxclients=70;s.gametype=3;s.getClientPmTypeFn=pm;s.configs[0]="\\n\\^1RedBot\\t\\1";s.configs[1]="\\n\\BlueBot\\t\\2";s.configs[2]="\\n\\Mate\\t\\1";b=bots.createBot(0)
 count=count+require(team.team(s,b)==1 and team.oppositeTeam(s,b)==2,"red team")
 b.client=1;count=count+require(team.team(s,b)==2 and team.oppositeTeam(s,b)==1,"blue team")
 b.client=-1;count=count+require(team.team(s,b)==0 and team.oppositeTeam(s,b)==0,"invalid client")
 b.client=0;count=count+require(team.sameTeam(s,b,2) and not team.sameTeam(s,b,1),"same-team values")
 count=count+require(not team.sameTeam(s,b,64),"same-team range")
 s.gametype=2;count=count+require(not team.sameTeam(s,b,2),"non-team gametype");s.gametype=3
 count=count+require(team.cleanClientText("^1Red"+decode(bytes([1]))+"Bot")=="RedBot","Q_CleanStr subset")
 count=count+require(team.clientFromName(s,"redbot")==0 and team.clientFromName(s,"BLUEBOT")==1,"case and color name lookup")
 count=count+require(team.clientFromName(s,"missing")==-1,"missing name")
 count=count+require(team.clientOnSameTeamFromName(s,b,"Mate")==2 and team.clientOnSameTeamFromName(s,b,"BlueBot")==-1,"team name lookup")
 count=count+require(not team.entityIsDead(s,1) and team.entityIsDead(s,2) and not team.entityIsDead(s,70),"entity death range and pm type")
 return count
end function
function main(args) count=contracts();print("PASS: "+str(count)+" bot team query contracts\n");return 0 end function
