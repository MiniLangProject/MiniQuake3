// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_team_helpers as team
import mq3.game.bot_lifecycle as bots
function same(s,b,client) return client==0 or client==2 end function
function fromName(s,name) if name=="Leader" then return 2 end if return -1 end function
function bit(value) if value then return 1 end if return 0 end function
function listText(values) result="[";for index=0 to len(values)-1 if index>0 then result=result+", " end if;result=result+str(values[index]) end for;return result+"]" end function
function main(args)
  s=team.create();s.maxclients=5;s.sameTeamFn=same;s.clientFromNameFn=fromName;b=bots.createBot(0)
  print "valid="+str(bit(team.validTeamLeader(s,b)));b.teamleader="Missing";print "valid="+str(bit(team.validTeamLeader(s,b)));b.teamleader="Leader";print "valid="+str(bit(team.validTeamLeader(s,b)))
  s.configs[0]="\\n\\One\\t\\1";s.configs[1]="\\n\\Spec\\t\\3";s.configs[2]="\\n\\Two\\t\\1";s.configs[3]="\\t\\1";print "mates="+str(team.numTeamMates(s,b))
  s.names[1]="Alpha";team.setTeamMateTaskPreference(s,b,1,team.TEAMTP_DEFENDER);print "pref="+str(team.getTeamMateTaskPreference(s,b,1,"alpha"))+","+str(team.getTeamMateTaskPreference(s,b,1,"Other"))
  s.names[0]="Zero";s.names[1]="One";s.names[2]="Two";s.names[3]="Three";s.names[4]="Four";s.preferences[0]=team.TEAMTP_ATTACKER;s.preferences[1]=team.TEAMTP_DEFENDER;s.preferences[2]=0;s.preferences[3]=team.TEAMTP_ATTACKER;s.preferences[4]=team.TEAMTP_DEFENDER|team.TEAMTP_ATTACKER;s.preferenceNames[0]="Zero";s.preferenceNames[1]="One";s.preferenceNames[3]="Three";s.preferenceNames[4]="Four"
  print "sort="+listText(team.sortTeamMatesByTaskPreference(s,b,[0,1,2,3,4]))
  return 0
end function
