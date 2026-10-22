// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_voice_commands as voice

function req(value,label) if not value then return error(499,"ai_vcmd contract: "+label) end if;return 1 end function
function configured()
  s=voice.create();s.randomValue=0.0;s.timeValues=[20.0,21.0,22.0,23.0];s.names[1]="Ranger";s.names[2]="Sarge";s.easyNames[2]="Sarge"
  voice.setClientTeam(s,2,voice.TEAM_RED);s.redFlag=voice.goal(0,10,[1.0,2.0,3.0],[0.0,0.0,0.0],[0.0,0.0,0.0],11);s.blueFlag=voice.goal(0,20,[4.0,5.0,6.0],[0.0,0.0,0.0],[0.0,0.0,0.0],22);s.neutralFlag.areanum=30
  s.redObelisk=voice.goal(0,40,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],33);s.blueObelisk=voice.goal(0,50,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],44)
  return s
end function
function bot() b=voice.createBot(1);b.cs=7;b.team=voice.TEAM_RED;return b end function
function has(state,kind) for each action in state.actions if action.kind==kind then return true end if end for;return false end function
function contracts()
  checks=0;s=configured();b=bot();s.gametype=voice.GT_CTF;s.redFlag.areanum=0;voice.getFlag(s,b,2,1,false);checks=checks+req(not b.ordered and len(s.actions)==0,"missing CTF flag rejects order")
  s=configured();b=bot();s.gametype=voice.GT_CTF;voice.getFlag(s,b,2,1,false);checks=checks+req(b.ltgtype==voice.LTG_GETFLAG and b.teamgoalTime==622.0 and has(s,"alternate-route") and has(s,"remember-task"),"CTF get-flag transition")
  s=configured();b=bot();s.missionpack=false;s.gametype=voice.GT_1FCTF;voice.getFlag(s,b,2,1,false);checks=checks+req(not b.ordered,"baseq3 excludes 1FCTF")
  s=configured();b=bot();s.gametype=voice.GT_HARVESTER;voice.offense(s,b,2,1,false);checks=checks+req(b.ltgtype==voice.LTG_HARVEST and b.teamgoalTime==142.0 and b.harvestawayTime==0.0,"harvester offense")
  s=configured();b=bot();s.gametype=3;voice.offense(s,b,2,1,false);checks=checks+req(b.ltgtype==voice.LTG_ATTACKENEMYBASE and b.attackawayTime==0.0,"default offense")
  s=configured();b=bot();s.gametype=voice.GT_CTF;voice.defend(s,b,2,1,false);checks=checks+req(b.ltgtype==voice.LTG_DEFENDKEYAREA and b.teamgoal.tag==11 and b.teamgoal.origin[0]==1.0,"red flag defense goal copy")
  s.redFlag.origin[0]=99.0;checks=checks+req(b.teamgoal.origin[0]==1.0,"defense goal is value copy")
  s=configured();b=bot();b.team=voice.TEAM_BLUE;s.gametype=voice.GT_OBELISK;voice.defendFlag(s,b,2,1,false);checks=checks+req(b.teamgoal.tag==44,"missionpack obelisk defense")
  s=configured();b=bot();voice.patrol(s,b,2,1,false);checks=checks+req(not b.ordered and b.decisionmaker==2 and b.ltgtype==0 and len(s.actions)==4,"patrol dismissal")
  s=configured();b=bot();voice.camp(s,b,2,1,false);checks=checks+req(not b.ordered and s.actions[0].text=="whereareyou","camp unavailable client")
  s=configured();b=bot();s.entityInfos[2].valid=true;s.entityInfos[2].origin=[7.0,8.0,9.0];s.pointAreas[2]=77;voice.camp(s,b,2,1,false);checks=checks+req(b.ltgtype==voice.LTG_CAMPORDER and b.teamgoal.mins==[-8.0,-8.0,-8.0] and b.teammate==2,"camp client goal")
  s=configured();b=bot();s.entityInfos[2].valid=true;s.entityInfos[2].origin=[7.0,8.0,9.0];s.pointAreas[2]=77;voice.followMe(s,b,2,1,false);checks=checks+req(b.ltgtype==voice.LTG_TEAMACCOMPANY and b.teammatevisibleTime==21.0 and b.teammessageTime==22.0 and b.teamgoalTime==623.0 and b.formationDist==112.0,"follow timing and formation")
  s=configured();b=bot();s.flagCarrier=-1;voice.followFlagCarrier(s,b,2,1,false);checks=checks+req(not b.ordered,"absent flag carrier")
  s=configured();b=bot();s.gametype=voice.GT_CTF;voice.returnFlag(s,b,2,1,false);checks=checks+req(b.ltgtype==voice.LTG_RETURNFLAG and not has(s,"remember-task") and b.teamgoalTime==202.0,"return flag intentionally not remembered")
  s=configured();b=bot();voice.startLeader(s,b,2,1,false);checks=checks+req(b.teamleader=="Sarge","start leader name");voice.stopLeader(s,b,2,1,false);checks=checks+req(b.teamleader=="" and s.notLeader[2],"stop matching leader")
  s=configured();b=bot();b.teamleader="RANGER";voice.whoIsLeader(s,b,2,1,false);checks=checks+req(len(s.actions)==3 and s.actions[0].text=="iamteamleader" and s.actions[2].text=="startleader","leader response")
  s=configured();b=bot();s.taskPreferences[2]=voice.TEAMTP_ATTACKER|8;voice.wantOnDefense(s,b,2,1,false);checks=checks+req(s.taskPreferences[2]==9 and s.actions[3].value==voice.ACTION_AFFIRMATIVE,"defense preference bit transform")
  s=configured();b=bot();s.taskPreferences[2]=voice.TEAMTP_DEFENDER|8;voice.wantOnOffense(s,b,2,1,false);checks=checks+req(s.taskPreferences[2]==10,"offense preference bit transform")
  s=configured();b=bot();s.gametype=3;checks=checks+req(voice.voiceChatCommand(s,b,1,"1 2 7 OfFeNsE",false) and b.ltgtype==voice.LTG_ATTACKENEMYBASE,"case-insensitive dispatch")
  checks=checks+req(not voice.voiceChatCommand(s,b,1,"0 3 0 offense",false),"same-team gate")
  checks=checks+req(not voice.voiceChatCommand(s,b,voice.SAY_ALL,"0 2 0 offense",false),"public voice gate")
  s.teamplay=false;checks=checks+req(not voice.voiceChatCommand(s,b,1,"0 2 0 offense",false),"teamplay gate")
  s=configured();b=bot();s.gametype=3;voice.offense(s,b,2,1,true);checks=checks+req(len(s.actions)==2 and not s.actions[0].dispatched and not s.actions[1].dispatched,"retail suppresses duplicate host dispatch")
  s=configured();b=bot();before=b.ltgtype;voice.dummy(s,b,2,1,false);checks=checks+req(b.ltgtype==before and len(s.actions)==0,"dummy no-op")
  return checks
end function
function main(args) count=contracts();print("PASS: "+str(count)+" ai_vcmd contracts");return 0 end function
