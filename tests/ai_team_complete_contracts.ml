import mq3.game.ai_team as team
function req(ok,label) if not ok then return error(499,"ai_team contract: "+label) end if;return 1 end function
function configured(count)
 s=team.create();s.maxclients=count;s.helper.maxclients=count
 for i=0 to count-1 s.names[i]="P"+str(i);s.configs[i]="\\n\\P"+str(i)+"\\t\\1";s.travelTimes[i]=(count-i)*10 end for
 b=team.createBot(0);b.teamleader="P0";return [s,b]
end function
function main(args)
 checks=0;p=configured(4);s=p[0];b=p[1]
 mates=team.BotSortTeamMatesByBaseTravelTime(s,b,64);checks=checks+req(mates[0]==3 and mates[3]==0,"stable base travel sorting")
 team.BotSetTeamMateTaskPreference(s,b,0,team.TEAMTP_ATTACKER);team.BotSetTeamMateTaskPreference(s,b,3,team.TEAMTP_DEFENDER);mates=team.BotSortTeamMatesByTaskPreference(s,b,mates);checks=checks+req(mates[0]==3 and mates[3]==0,"task preference bands")
 checks=checks+req(team.BotNumTeamMates(s,b)==4 and team.BotValidTeamLeader(s,b),"team enumeration and leader")
 s.actions=[];team.BotTeamOrders(s,b,true);checks=checks+req(len(s.actions)==4 and s.actions[0].suppressed,"team grouping and suppression")
 s.actions=[];b.neutralflagstatus=3;team.Bot1FCTFOrders(s,b,false);checks=checks+req(s.actions[0].text=="cmd_defendbase" and s.actions[len(s.actions)-3].text=="cmd_getflag","dropped neutral flag transition")
 s.actions=[];team.BotVoiceChat(s,b,-1,"startleader",true);team.BotVoiceChatOnly(s,b,2,"defend",false);checks=checks+req(s.actions[0].text=="vsay_team startleader" and s.actions[0].suppressed and s.actions[1].text=="votell 2 defend","voice command ABI")
 p=configured(5);s=p[0];b=p[1];b.numteammates=5;b.redflagstatus=0;b.blueflagstatus=0;team.BotCTFOrders(s,b,true);checks=checks+req(len(s.actions)>0 and s.actions[0].suppressed and s.actions[2].kind=="command" and s.actions[2].text=="vtell 4 defend","missionpack CTF chat/voice adapter")
 p=configured(5);s=p[0];b=p[1];b.numteammates=5;s.gametype=team.GT_1FCTF;s.now=20.0;b.teamgiveordersTime=10.0;b.lastflagcaptureTime=20.0;b.neutralflagstatus=0;team.BotTeamAI(s,b,false);checks=checks+req(b.teamgiveordersTime==0.0 and len(s.actions)>0,"1FCTF timed dispatch")
 p=configured(5);s=p[0];b=p[1];b.numteammates=5;s.gametype=team.GT_OBELISK;s.now=20.0;b.teamgiveordersTime=10.0;team.BotTeamAI(s,b,false);checks=checks+req(b.teamgiveordersTime==50.0 and s.actions[0].text=="cmd_defendbase","obelisk periodic orders")
 p=configured(5);s=p[0];b=p[1];b.numteammates=5;s.gametype=team.GT_HARVESTER;s.now=20.0;b.teamgiveordersTime=10.0;b.ctfstrategy=team.CTFS_AGRESSIVE;team.BotTeamAI(s,b,false);checks=checks+req(b.teamgiveordersTime==50.0 and s.actions[len(s.actions)-3].text=="cmd_harvest","harvester aggressive orders")
 p=configured(2);s=p[0];b=p[1];b.teamleader="";s.gametype=team.GT_TEAM;s.now=20.0;b.entergameTime=0.0;s.helper.entityInUse=array(64,false);team.BotTeamAI(s,b,false);checks=checks+req(b.becometeamleaderTime==30.0,"leader election scheduling")
 print("PASS: "+str(checks)+" ai_team native contracts\n");return 0
end function
