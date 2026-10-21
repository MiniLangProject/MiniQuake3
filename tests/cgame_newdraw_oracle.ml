import mq3.client.cgame_newdraw as hud
function color(value) if value[0]==1.0 then return "1.00,0.00,0.00,0.25" else if value[2]==1.0 then return "0.00,0.00,1.00,0.25" end if;return "0.00,0.17,0.00,0.25" end function
function main(args)
  s=hud.create(false);hud.initTeamChat(s);hud.setPrintString(s,0,"system");hud.setPrintString(s,1,"first");hud.setPrintString(s,1,"second");print("chat|"+s.systemChat+"|"+s.teamChat1+"|"+s.teamChat2)
  print("status|"+hud.statusHandle(0)+"|"+hud.statusHandle(1)+"|"+hud.statusHandle(2)+"|"+hud.statusHandle(3)+"|"+hud.statusHandle(4)+"|"+hud.statusHandle(5)+"|"+hud.statusHandle(6)+"|"+hud.statusHandle(7)+"|"+hud.statusHandle(8))
  s.gametype=hud.GT_CTF;s.team=hud.TEAM_RED;s.redflag=hud.FLAG_TAKEN;s.blueflag=0;first=hud.otherTeamHasFlag(s);second=hud.yourTeamHasFlag(s);s.blueflag=hud.FLAG_TAKEN;print("flags|"+str(first)+"|"+str(second)+"|"+str(hud.yourTeamHasFlag(s)))
  s.gametype=hud.GT_1FCTF;s.flagStatus=hud.FLAG_TAKEN_BLUE;print("oneflag|"+str(hud.otherTeamHasFlag(s))+"|"+str(hud.yourTeamHasFlag(s)))
  types="types";for i=0 to 7 s.gametype=i;types=types+"|"+hud.gameTypeString(s) end for;print(types)
  print("killer|"+hud.getKillerText(s)+"|Fragged by Sarge")
  s.team=hud.TEAM_RED;a=hud.getTeamColor(s);s.team=hud.TEAM_BLUE;b=hud.getTeamColor(s);s.team=hud.TEAM_FREE;c=hud.getTeamColor(s);print("colors|"+color(a)+"|"+color(b)+"|"+color(c))
  s.clients=[hud.client("Ranger",hud.TEAM_RED),hud.client("Sarge",hud.TEAM_BLUE)];print("clients|"+str(hud.clientNumFromName(s,"rAnGeR"))+"|"+str(hud.clientNumFromName(s,"missing")))
  s.sorted=[0,1];s.selected=4;selected=hud.getSelectedPlayer(s);print("selected|"+str(selected)+"|"+str(s.selected))
  s.gametype=hud.GT_FFA;s.team=hud.TEAM_FREE;s.rank=0;s.score=5;one=hud.getGameStatusText(s);s.gametype=hud.GT_TEAM;s.teamScores=[4,2];two=hud.getGameStatusText(s);s.teamScores=[4,4];three=hud.getGameStatusText(s);print("game|"+one+"|"+two+"|"+three);return 0
end function
