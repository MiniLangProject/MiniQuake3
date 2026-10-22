import mq3.game.bot_command_matches as cmd
import mq3.botlib.ai_chat_matches as chat
function req(ok,label) if not ok then return error(7441,"ai_cmd contract: "+label) end if;return 1 end function
function matched(kind,subtype,values)
  value="";offsets=array(8,-1);lengths=array(8,0);for i=0 to len(values)-1 offsets[i]=len(bytes(value));value=value+values[i];lengths[i]=len(bytes(values[i])) end for;return chat.Match(value,kind,subtype,offsets,lengths)
end function
function ready()
  matcher=chat.create(void,void);matcher.loaded=true;s=cmd.create(matcher);s.maxclients=5;s.names=["Sarge","Ranger","Major","Xaero",""]+array(59,"");s.teams=[1,1,1,2,0]+array(59,0);s.configs=["x","x","x","x",""]+array(59,"");s.pointAreas[1]=7;s.entityInfos[1].valid=true;s.entityInfos[1].origin=[10.0,20.0,30.0];s.redFlag=cmd.goal(1,-1,2,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,"Red Flag");s.blueFlag=cmd.goal(2,-1,3,[1.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,"Blue Flag");s.itemGoals=[cmd.goal(4,-1,8,[3.0,4.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,"Rocket Launcher")];return s
end function
function main(args)
  c=0;s=ready();b=cmd.createBot(0);b.team=1;c=c+req(cmd.FindClientByName(s,"major")==2 and cmd.FindClientByName(s,"ang")==1,"client exact and substring");c=c+req(cmd.FindEnemyByName(s,b,"Xaero")==3 and cmd.FindEnemyByName(s,b,"Ranger")==-1,"enemy team filter");c=c+req(cmd.NumPlayersOnSameTeam(s,b)==2,"native i+1 teammate count")
  p=cmd.BotGPSToPosition(" -1 20 003");c=c+req(p==[-1.0,20.0,3.0],"GPS integer parser")
  c=c+req(cmd.BotGetItemTeamGoal(s,"rocket launcher").areanum==8 and cmd.BotGetItemTeamGoal(s,"")==void,"item goal")
  b.checkpoints=[cmd.Waypoint("alpha",cmd.goal(0,-1,9,[1.0,2.0,3.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,"alpha"))];c=c+req(cmd.BotGetMessageTeamGoal(s,b,"Alpha").areanum==9,"checkpoint goal")
  m=matched(cmd.MSG_FORMATIONSPACE,cmd.ST_FEET,["Ranger","","","","","20",""]);cmd.BotMatch_FormationSpace(s,b,m,true);c=c+req(b.formationDist>195.0 and b.formationDist<196.0,"feet conversion")
  m=matched(cmd.MSG_FORMATIONSPACE,0,["Ranger","","","","","1",""]);cmd.BotMatch_FormationSpace(s,b,m,true);c=c+req(b.formationDist==100.0,"formation clamp")
  m=matched(cmd.MSG_STARTTEAMLEADERSHIP,cmd.ST_I,["Ranger","","","","","",""]);cmd.BotMatch_StartTeamLeaderShip(s,b,m,true);c=c+req(b.teamleader=="Ranger","leadership start")
  b.teamleader="Sarge";m=matched(cmd.MSG_TASKPREFERENCE,cmd.ST_DEFENDER,["Ranger","","","","","",""]);cmd.BotMatch_TaskPreference(s,b,m,true);c=c+req(s.taskPreferences[1]==cmd.TEAMTP_DEFENDER and len(s.actions)==4,"preference reply/actions")
  m=matched(cmd.MSG_STOPTEAMLEADERSHIP,cmd.ST_I,["Sarge","","","","","",""]);cmd.BotMatch_StopTeamLeaderShip(s,b,m,true);c=c+req(b.teamleader=="" and s.notleader[0],"leadership stop")
  b.teamleader="Sarge";cmd.BotMatch_WhatIsMyCommand(s,b,m,true);c=c+req(b.forceorders,"force orders")
  m=matched(cmd.MSG_JOINSUBTEAM,0,["Ranger","","","","Delta","",""]);cmd.BotMatch_JoinSubteam(s,b,m,true);c=c+req(b.subteam=="Delta","join subteam");cmd.BotMatch_LeaveSubteam(s,b,m,true);c=c+req(b.subteam=="","leave subteam")
  s.gametype=cmd.GT_CTF;m=matched(cmd.MSG_GETFLAG,0,["Ranger","","","","","",""]);cmd.BotMatch_GetFlag(s,b,m,true);c=c+req(b.ltgtype==cmd.LTG_GETFLAG and b.teamgoalTime==700.0,"get flag order")
  cmd.BotMatch_ReturnFlag(s,b,m,true);c=c+req(b.ltgtype==cmd.LTG_RETURNFLAG and b.teamgoalTime==280.0,"return flag order")
  m=matched(cmd.MSG_KILL,0,["Ranger","","","","Xaero","",""]);cmd.BotMatch_Kill(s,b,m,true);c=c+req(b.ltgtype==cmd.LTG_KILL and b.teamgoal.entitynum==3,"kill enemy")
  m=matched(cmd.MSG_CTF,cmd.ST_GOTFLAG,["Xaero","red","","","","",""]);cmd.BotMatch_CTF(s,b,m,true);c=c+req(b.redflagstatus==1 and b.flagstatuschanged==1,"flag event")
  m=matched(cmd.MSG_CTF,cmd.ST_CAPTUREDFLAG,["Xaero","red","","","","",""]);cmd.BotMatch_CTF(s,b,m,true);c=c+req(b.redflagstatus==0 and b.blueflagstatus==0,"capture event")
  m=matched(cmd.MSG_CHECKPOINT,0,["Ranger","","","","","10 20 30","home"]);s.pointAreas[0]=11;cmd.BotMatch_CheckPoint(s,b,m,true);c=c+req(len(b.checkpoints)==2 and b.checkpoints[0].goal.origin==[10.0,20.0,30.5],"checkpoint")
  nearest=cmd.BotNearestVisibleItem(s,b,"Rocket Launcher");c=c+req(nearest[0]==5.0 and nearest[1].areanum==8,"nearest visible item")
  m=matched(cmd.MSG_DISMISS,0,["Ranger","","","","","",""]);b.ltgtype=8;b.leadTime=12.0;cmd.BotMatch_Dismiss(s,b,m,true);c=c+req(b.ltgtype==0 and b.leadTime==0.0,"dismiss")
  cmd.BotMatch_Suicide(s,b,m,true);c=c+req(s.actions[len(s.actions)-3].kind=="command" and s.actions[len(s.actions)-3].text=="kill","suicide action")
  print("PASS: "+str(c)+" ai_cmd native contracts");return 0
end function
