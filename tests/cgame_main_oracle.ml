import mq3.client.cgame_main as main
function main(args)
  s=main.create();s.time=1000;s.crosshairClientTime=0;s.crosshairClientNum=3;s.attackerTime=0;s.attackerNum=7;print("query|"+str(main.crosshairPlayer(s))+"|"+str(main.lastAttacker(s)))
  s.time=999;s.crosshairClientTime=0;s.attackerTime=1;print("query|"+str(main.crosshairPlayer(s))+"|"+str(main.lastAttacker(s)))
  s.time=1001;print("query|"+str(main.crosshairPlayer(s))+"|"+str(main.lastAttacker(s)))
  s.clients[0].infoValid=true;s.clients[0].team=main.TEAM_SPECTATOR;s.clients[0].name="A";s.clients[3].infoValid=true;s.clients[3].team=main.TEAM_SPECTATOR;s.clients[3].name="Long Name";text=main.buildSpectatorString(s);print("spectators|"+str(len(text))+"|"+text)
  s.scores=[main.Score(1,main.TEAM_RED,0,0,0),main.Score(2,main.TEAM_BLUE,0,0,0),main.Score(3,main.TEAM_RED,0,0,0)];s.numScores=3;print("feeders|"+str(main.feederCount(s,main.FEEDER_REDTEAM_LIST))+"|"+str(main.feederCount(s,main.FEEDER_BLUETEAM_LIST))+"|"+str(main.feederCount(s,main.FEEDER_SCOREBOARD)))
  return 0
end function
