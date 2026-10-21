import mq3.client.cgame_scoreboard as board
function req(value,message) if not value then return error(7699,message) end if;return 1 end function
function kindCount(commands,kind) n=0;for each command in commands if command.kind==kind then n=n+1 end if end for;return n end function
function main(args)
  count=0;state=board.state();state.showScores=true;state.clientNum=0;state.playerTeam=board.TEAM_FREE;state.rank=0;state.playerScore=17;state.killerName="Sarge";state.readyMask=1
  a=board.client("Ranger",board.TEAM_FREE);a.score=17;b=board.client("Sarge",board.TEAM_FREE);b.score=12;s=board.client("Spectator",board.TEAM_SPECTATOR)
  state.clients=[a,b,s];state.scores=[board.score(0,17,25,90),board.score(1,12,40,88),board.score(2,0,-1,0)];state.numScores=3
  result=board.drawOldScoreboard(state);count=count+req(result.drawn,"visible FFA board");count=count+req(result.localClient,"local player found");count=count+req(result.lineHeight==40,"normal line height");count=count+req(kindCount(result.commands,"pic")==4,"four headers");count=count+req(kindCount(result.commands,"head")==3,"three heads");count=count+req(kindCount(result.commands,"fill")==1,"local highlight");count=count+req(kindCount(result.commands,"big")>=6,"rank, killer, rows and ready")
  state.paused=true;paused=board.drawOldScoreboard(state);count=count+req(not paused.drawn and state.deferredPlayerLoading==0,"paused suppression");state.paused=false
  state.showScores=false;state.warmup=1;count=count+req(not board.drawOldScoreboard(state).drawn,"warmup death suppression");state.warmup=0;state.scoreFadeTime=0;state.time=500;state.killerName="Sarge";count=count+req(not board.drawOldScoreboard(state).drawn and state.killerName=="","expired fade clears killer")
  state.showScores=true;state.numScores=8;state.scores=[];for index=0 to 7 state.scores=state.scores+[board.score(index%3,index,20,1)] end for;count=count+req(board.drawOldScoreboard(state).lineHeight==16,"interleaved layout")
  state=board.state();state.showScores=true;state.gametype=board.GT_TEAM;state.teamScores=[3,5];r=board.client("Red",board.TEAM_RED);bl=board.client("Blue",board.TEAM_BLUE);state.clients=[r,bl];state.scores=[board.score(0,3,10,1),board.score(1,5,10,1)];state.numScores=2;team=board.drawOldScoreboard(state);count=count+req(kindCount(team.commands,"teamfill")==2,"team backgrounds");count=count+req(team.commands[5].team==board.TEAM_BLUE,"leading team first")
  state=board.state();state.time=65001;state.motd="Arena";one=board.client("One",board.TEAM_FREE);one.score=9;state.clients=[one];tour=board.drawOldTourneyScoreboard(state);count=count+req(tour.clientCommands==["score"],"periodic score request");count=count+req(tour.commands[1].text=="Arena","MOTD title");count=count+req(tour.commands[2].text=="1:05","server time");count=count+req(kindCount(tour.commands,"giant")==4,"FFA tourney rows")
  centered=board.centerGiantLine(8,"^1RED^7 wins");count=count+req(centered.x==192,"color-aware centering");count=count+req(board.printableLength("^^x")==1,"escaped caret length");count=count+req(board.placeString(1)=="1st" and board.placeString(0x4002)=="Tied for 2nd","rank strings")
  bad=board.drawClientScore(state,0,board.score(7,0,0,0),1.0,true);count=count+req(bad[0][0].kind=="print","invalid score client diagnostic")
  print("PASS: "+str(count)+" native cg_scoreboard contracts");return 0
end function
