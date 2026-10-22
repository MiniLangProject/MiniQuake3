import mq3.game.ai_team as team
import mq3.format.pk3 as pk3
import std.string as strings
function req(ok,label) if not ok then return error(499,"ai_team retail: "+label) end if;return 1 end function
function main(args)
 if len(args)!=1 then return 2 end if;archive=pk3.open(args[0]);if archive is error then return archive end if;raw=pk3.read(archive,"botfiles/teamplay.h");if raw is error then return raw end if;text=decode(raw);checks=0
 checks=checks+req(strings.indexOf(text,"type \"whoisteamleader\"",0)>=0,"leader query chat exists");checks=checks+req(strings.indexOf(text,"type \"iamteamleader\"",0)>=0,"leader claim chat exists")
 s=team.create();s.maxclients=2;s.helper.maxclients=2;s.names[0]="Sarge";s.names[1]="Grunt";s.configs[0]="\\n\\Sarge\\t\\1";s.configs[1]="\\n\\Grunt\\t\\1";b=team.createBot(0);b.numteammates=2;b.teamleader="Sarge";s.gametype=team.GT_1FCTF;s.now=30.0;b.teamgiveordersTime=20.0;b.lastflagcaptureTime=30.0;team.BotTeamAI(s,b,false);checks=checks+req(len(s.actions)>0 and s.actions[0].text=="cmd_defendbase","retail-backed one-flag team path")
 print("PASS: "+str(checks)+" retail teamplay/strategy contracts bytes="+str(len(raw))+"\n");return 0
end function
