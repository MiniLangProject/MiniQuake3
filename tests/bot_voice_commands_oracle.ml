// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_voice_commands as voice
import mq3.compat.numeric as n

function eventText(actions)
  rendered=""
  for each a in actions
    if a.kind=="alternate-route" then rendered=rendered+"A"+str(a.value)
    else if a.kind=="team-status" then rendered=rendered+"S"
    else if a.kind=="remember-task" then rendered=rendered+"M"
    else if a.kind=="initial-chat" then rendered=rendered+"C"+a.text+":"+a.value+";"
    else if a.kind=="enter-chat" then rendered=rendered+"E"+str(a.client)+":"+str(a.channel)+";"
    else if a.kind=="voice-only" then rendered=rendered+"V"+str(a.client)+":"+a.text+";"
    else if a.kind=="ea-action" then rendered=rendered+"X"+str(a.client)+":"+str(a.value)+";" end if
  end for
  return rendered
end function
function dump(label,state,bot)
  print(label+"|"+str(bot.decisionmaker)+","+str(bot.ordered)+","+str(bot.ltgtype)+","+str(n.trunc32(bot.orderTime))+","+str(n.trunc32(bot.teammessageTime))+","+str(n.trunc32(bot.teamgoalTime))+","+str(bot.teamgoal.entitynum)+","+str(bot.teamgoal.areanum)+","+str(n.trunc32(bot.teammatevisibleTime))+","+str(n.trunc32(bot.formationDist))+","+bot.teamleader+","+str(bot.teamgoal.tag)+","+str(bot.teammate)+"|"+eventText(state.actions))
end function
function reset(state) state.actions=[];state.timeIndex=0;state.timeValues=[10.0,11.0,12.0,13.0];return void end function
function fresh() b=voice.createBot(1);b.cs=9;b.team=voice.TEAM_RED;return b end function
function main(args)
  s=voice.create();s.randomValue=0.0;s.names[1]="Ranger";s.names[2]="Sarge";s.easyNames[2]="Sarge";voice.setClientTeam(s,2,voice.TEAM_RED)
  s.redFlag=voice.goal(0,11,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],101);s.blueFlag=voice.goal(0,22,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],102);s.neutralFlag.areanum=33
  s.redObelisk=voice.goal(0,44,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],201);s.blueObelisk=voice.goal(0,55,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],202)
  reset(s);b=fresh();s.gametype=voice.GT_CTF;voice.getFlag(s,b,2,1,false);dump("getflag",s,b)
  reset(s);b=fresh();s.gametype=3;voice.offense(s,b,2,1,false);dump("offense",s,b)
  reset(s);b=fresh();s.gametype=voice.GT_HARVESTER;voice.offense(s,b,2,1,false);dump("harvest",s,b)
  reset(s);b=fresh();s.gametype=voice.GT_CTF;voice.defendFlag(s,b,2,1,false);dump("defend",s,b)
  reset(s);b=fresh();b.team=voice.TEAM_BLUE;s.gametype=voice.GT_OBELISK;voice.defend(s,b,2,1,false);dump("obelisk",s,b)
  reset(s);b=fresh();voice.patrol(s,b,2,1,false);dump("patrol",s,b)
  reset(s);b=fresh();s.entityInfos[2].valid=false;voice.camp(s,b,2,1,false);dump("camp-miss",s,b)
  reset(s);b=fresh();s.entityInfos[2].valid=true;s.entityInfos[2].origin=[7.0,8.0,0.0];s.pointAreas[2]=77;voice.camp(s,b,2,1,false);dump("camp",s,b)
  reset(s);b=fresh();voice.followMe(s,b,2,1,false);dump("follow",s,b)
  reset(s);b=fresh();s.flagCarrier=2;voice.followFlagCarrier(s,b,9,1,false);dump("carrier",s,b)
  reset(s);b=fresh();s.gametype=voice.GT_1FCTF;voice.returnFlag(s,b,2,1,false);dump("return",s,b)
  reset(s);b=fresh();voice.startLeader(s,b,2,1,false);voice.stopLeader(s,b,2,1,false);dump("leaders",s,b)
  reset(s);b=fresh();b.teamleader="RANGER";voice.whoIsLeader(s,b,2,1,false);dump("who",s,b)
  reset(s);b=fresh();s.taskPreferences[2]=voice.TEAMTP_ATTACKER|8;voice.wantOnDefense(s,b,2,1,false);dump("wantdef",s,b);print("prefdef="+str(s.taskPreferences[2]))
  reset(s);b=fresh();s.taskPreferences[2]=voice.TEAMTP_DEFENDER|8;voice.wantOnOffense(s,b,2,1,false);dump("wantoff",s,b);print("prefoff="+str(s.taskPreferences[2]))
  reset(s);b=fresh();s.gametype=3;result=voice.voiceChatCommand(s,b,1,"1 2 7 OfFeNsE",false);dump("command",s,b);print("result="+str(result))
  reset(s);b=fresh();result=voice.voiceChatCommand(s,b,1,"0 2 0 missing",false);print("unknown="+str(result))
  s.teamplay=false;result=voice.voiceChatCommand(s,b,1,"0 2 0 offense",false);print("noteam="+str(result));s.teamplay=true
  result=voice.voiceChatCommand(s,b,voice.SAY_ALL,"0 2 0 offense",false);print("sayall="+str(result))
  reset(s);b=fresh();voice.dummy(s,b,2,1,false);dump("dummy",s,b)
  return 0
end function
