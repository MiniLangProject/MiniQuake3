// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_team_helpers as team
import mq3.game.bot_lifecycle as bots
function require(v,label) if not v then return error(499,"Bot team helper contract: "+label) end if return 1 end function
function same(s,b,client) return client==0 or client==2 end function
function fromName(s,name) if name=="Leader" then return 2 end if return -1 end function
function contracts()
  count=0;s=team.create();s.maxclients=70;s.sameTeamFn=same;s.clientFromNameFn=fromName;b=bots.createBot(0)
  count=count+require(not team.validTeamLeader(s,b),"empty leader")
  b.teamleader="Missing";count=count+require(not team.validTeamLeader(s,b),"missing leader")
  b.teamleader="Leader";count=count+require(team.validTeamLeader(s,b),"valid leader")
  s.configs[0]="\\n\\One\\t\\1";s.configs[1]="\\n\\Spec\\t\\3";s.configs[2]="\\n\\Two\\t\\1";s.configs[3]="\\t\\1"
  count=count+require(team.numTeamMates(s,b)==2,"team enumeration filters")
  s.names[1]="Alpha";team.setTeamMateTaskPreference(s,b,1,team.TEAMTP_DEFENDER)
  count=count+require(team.getTeamMateTaskPreference(s,b,1,"alpha")==team.TEAMTP_DEFENDER,"case-insensitive preference owner")
  count=count+require(team.getTeamMateTaskPreference(s,b,1,"Other")==0,"slot reuse rejects preference")
  s.preferences[1]=0;count=count+require(team.getTeamMateTaskPreference(s,b,1,"Alpha")==0,"zero preference")
  s.names[0]="Zero";s.names[1]="One";s.names[2]="Two";s.names[3]="Three";s.names[4]="Four"
  s.preferences[0]=team.TEAMTP_ATTACKER;s.preferences[1]=team.TEAMTP_DEFENDER;s.preferences[2]=0;s.preferences[3]=team.TEAMTP_ATTACKER;s.preferences[4]=team.TEAMTP_DEFENDER|team.TEAMTP_ATTACKER
  s.preferenceNames[0]="Zero";s.preferenceNames[1]="One";s.preferenceNames[3]="Three";s.preferenceNames[4]="Four"
  sorted=team.sortTeamMatesByTaskPreference(s,b,[0,1,2,3,4])
  count=count+require(sorted==[1,4,2,0,3],"defender roamer attacker order")
  count=count+require(team.sortTeamMatesByTaskPreference(s,b,[])==[],"empty sort")
  return count
end function
function main(args) count=contracts();print("PASS: "+str(count)+" bot team helper contracts\n");return 0 end function
