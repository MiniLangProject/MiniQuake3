// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native representation of code/cgame/cg_scoreboard.c.
package mq3.client.cgame_scoreboard
import mq3.compat.numeric as numeric

const TEAM_FREE=0
const TEAM_RED=1
const TEAM_BLUE=2
const TEAM_SPECTATOR=3
const GT_SINGLE_PLAYER=2
const GT_TEAM=3
const PM_DEAD=3
const PM_INTERMISSION=5
const RANK_TIED_FLAG=0x4000
const SB_HEADER=86
const SB_TOP=118
const SB_STATUSBAR=420
const SB_NORMAL_HEIGHT=40
const SB_INTER_HEIGHT=16
const SB_MAXCLIENTS_NORMAL=7
const SB_MAXCLIENTS_INTER=17
const BIGCHAR_WIDTH=16
const BIGCHAR_HEIGHT=16
const GIANT_WIDTH=32
const GIANT_HEIGHT=48
const FADE_TIME=200

struct Score client score ping time end struct
struct Client name team powerups botSkill handicap wins losses infoValid score end struct
struct State time scoresRequestTime showScores numScores scoreFadeTime paused gametype pmType warmup killerName teamScores clientNum playerTeam rank playerScore readyMask deferredPlayerLoading motd scores clients end struct
struct Draw kind x y width height text alpha red green blue client team large end struct
struct Frame drawn commands clientCommands deferredLoads localClient lineHeight end struct

function score(client,points,ping,time) return Score(client,points,ping,time) end function
function client(name,team) return Client(name,team,0,0,100,0,0,true,0) end function
function state() return State(0,0,false,0,0,false,TEAM_FREE,0,0,"",[0,0],0,TEAM_FREE,0,0,0,0,"",[],[]) end function
function draw(kind,x,y,width,height,text,alpha,red,green,blue,clientNum,team,large) return Draw(kind,x,y,width,height,text,alpha,red,green,blue,clientNum,team,large) end function
function frame(drawn) return Frame(drawn,[],[],0,false,SB_NORMAL_HEIGHT) end function
function append(value,command) value.commands=value.commands+[command];return void end function
function printableLength(text)
  data=bytes(text);count=0;index=0
  while index<len(data)
    if data[index]==94 and index+1<len(data) and data[index+1]!=94 then index=index+2 else count=count+1;index=index+1 end if
  end while
  return count
end function
function placeString(rank)
  tied=(rank & RANK_TIED_FLAG)!=0;value=rank & ~RANK_TIED_FLAG;text=""
  if value==1 then text="1st" else if value==2 then text="2nd" else if value==3 then text="3rd" else text=str(value)+"th" end if
  if tied then return "Tied for "+text end if;return text
end function
function fadeAlpha(stateValue)
  elapsed=stateValue.time-stateValue.scoreFadeTime;if elapsed<0 or elapsed>=FADE_TIME then return 0.0 end if;return (FADE_TIME-elapsed)/FADE_TIME
end function
function padLeft(value,width)
  text=str(value);while len(text)<width text=" "+text end while;return text
end function

// CG_DrawClientScore
function drawClientScore(value,y,entry,fade,largeFormat)
  if entry.client<0 or entry.client>=len(value.clients) then return [[draw("print",0,0,0,0,"Bad score->client: "+str(entry.client)+"\n",1.0,1.0,1.0,1.0,-1,0,false)],false] end if
  ci=value.clients[entry.client];commands=[];iconx=80;headx=112;text=""
  iconY=y;iconSize=16;if largeFormat then iconY=y-8;iconSize=32 end if
  if ci.powerups!=0 then commands=commands+[draw("flag",iconx,iconY,iconSize,iconSize,"",fade,1.0,1.0,1.0,entry.client,ci.team,largeFormat)]
  else if ci.botSkill>0 and ci.botSkill<=5 then commands=commands+[draw("botskill",iconx,iconY,iconSize,iconSize,str(ci.botSkill),fade,1.0,1.0,1.0,entry.client,ci.team,largeFormat)]
  else if ci.handicap<100 then commands=commands+[draw("small",iconx,y,0,0,str(ci.handicap),fade,1.0,1.0,1.0,entry.client,ci.team,false)] end if
  if value.gametype==1 then commands=commands+[draw("small",iconx,y,0,0,str(ci.wins)+"/"+str(ci.losses),fade,1.0,1.0,1.0,entry.client,ci.team,false)] end if
  headY=y;headSize=16;if largeFormat then headY=y-16;headSize=48 end if;commands=commands+[draw("head",headx,headY,headSize,headSize,"",fade,1.0,1.0,1.0,entry.client,ci.team,largeFormat)]
  if entry.ping==-1 then text=" connecting    "+ci.name else if ci.team==TEAM_SPECTATOR then text=" SPECT "+padLeft(entry.ping,3)+" "+padLeft(entry.time,4)+" "+ci.name else text=padLeft(entry.score,5)+" "+padLeft(entry.ping,4)+" "+padLeft(entry.time,4)+" "+ci.name end if
  local=entry.client==value.clientNum
  if local then
    rank=value.rank & ~RANK_TIED_FLAG;if value.playerTeam==TEAM_SPECTATOR or value.gametype>=GT_TEAM then rank=-1 end if
    red=0.7;green=0.7;blue=0.7;if rank==0 then red=0.0;green=0.0;blue=0.7 else if rank==1 then red=0.7;green=0.0;blue=0.0 else if rank==2 then red=0.7;green=0.7;blue=0.0 end if
    commands=commands+[draw("fill",176,y,464,17,"",fade*0.7,red,green,blue,entry.client,ci.team,false)]
  end if
  commands=commands+[draw("big",160,y,0,0,text,fade,1.0,1.0,1.0,entry.client,ci.team,false)]
  if (value.readyMask & (1<<entry.client))!=0 then commands=commands+[draw("big",iconx,y,0,0,"READY",fade,1.0,1.0,1.0,entry.client,ci.team,false)] end if
  return [commands,local]
end function

// CG_TeamScoreboard
function teamScoreboard(value,y,team,fade,maxClients,lineHeight)
  commands=[];count=0;local=false
  for each entry in value.scores
    if count>=maxClients then break end if
    if entry.client>=0 and entry.client<len(value.clients) and value.clients[entry.client].team==team then
      part=drawClientScore(value,y+lineHeight*count,entry,fade,lineHeight==SB_NORMAL_HEIGHT);commands=commands+part[0];if part[1] then local=true end if;count=count+1
    end if
  end for
  return [count,commands,local]
end function

// CG_DrawOldScoreboard
function drawOldScoreboard(value)
  result=frame(false);fade=0.0;text="";maxClients=0;lineHeight=0;topBorder=0
  if value.paused or (value.gametype==GT_SINGLE_PLAYER and value.pmType==PM_INTERMISSION) then value.deferredPlayerLoading=0;return result end if
  if value.warmup!=0 and not value.showScores then return result end if
  if value.showScores or value.pmType==PM_DEAD or value.pmType==PM_INTERMISSION then fade=1.0 else fade=fadeAlpha(value);if fade==0.0 then value.deferredPlayerLoading=0;value.killerName="";return result end if end if
  result.drawn=true
  if value.killerName!="" then text="Fragged by "+value.killerName;append(result,draw("big",(640-printableLength(text)*16)/2,40,0,0,text,fade,1.0,1.0,1.0,-1,0,false)) end if
  if value.gametype<GT_TEAM then
    if value.playerTeam!=TEAM_SPECTATOR then text=placeString(value.rank+1)+" place with "+str(value.playerScore);append(result,draw("big",(640-printableLength(text)*16)/2,60,0,0,text,fade,1.0,1.0,1.0,-1,0,false)) end if
  else
    if value.teamScores[0]==value.teamScores[1] then text="Teams are tied at "+str(value.teamScores[0]) else if value.teamScores[0]>=value.teamScores[1] then text="Red leads "+str(value.teamScores[0])+" to "+str(value.teamScores[1]) else text="Blue leads "+str(value.teamScores[1])+" to "+str(value.teamScores[0]) end if
    append(result,draw("big",(640-printableLength(text)*16)/2,60,0,0,text,fade,1.0,1.0,1.0,-1,0,false))
  end if
  for each header in [[176,"score"],[264,"ping"],[344,"time"],[416,"name"]] append(result,draw("pic",header[0],SB_HEADER,64,32,header[1],fade,1.0,1.0,1.0,-1,0,false)) end for
  if value.numScores>SB_MAXCLIENTS_NORMAL then maxClients=SB_MAXCLIENTS_INTER;lineHeight=SB_INTER_HEIGHT;topBorder=8 else maxClients=SB_MAXCLIENTS_NORMAL;lineHeight=SB_NORMAL_HEIGHT;topBorder=16 end if
  result.lineHeight=lineHeight;y=SB_TOP;local=false
  if value.gametype>=GT_TEAM then
    y=y+lineHeight/2;first=TEAM_RED;second=TEAM_BLUE;if value.teamScores[0]<value.teamScores[1] then first=TEAM_BLUE;second=TEAM_RED end if
    part=teamScoreboard(value,y,first,fade,maxClients,lineHeight);result.commands=result.commands+part[1];local=local or part[2];append(result,draw("teamfill",0,y-topBorder,640,part[0]*lineHeight+16,"",0.33,1.0,1.0,1.0,-1,first,false));y=y+part[0]*lineHeight+16;maxClients=maxClients-part[0]
    part=teamScoreboard(value,y,second,fade,maxClients,lineHeight);result.commands=result.commands+part[1];local=local or part[2];append(result,draw("teamfill",0,y-topBorder,640,part[0]*lineHeight+16,"",0.33,1.0,1.0,1.0,-1,second,false));y=y+part[0]*lineHeight+16;maxClients=maxClients-part[0]
    part=teamScoreboard(value,y,TEAM_SPECTATOR,fade,maxClients,lineHeight);result.commands=result.commands+part[1];local=local or part[2];y=y+part[0]*lineHeight+16
  else
    part=teamScoreboard(value,y,TEAM_FREE,fade,maxClients,lineHeight);result.commands=result.commands+part[1];local=local or part[2];y=y+part[0]*lineHeight+16
    part=teamScoreboard(value,y,TEAM_SPECTATOR,fade,maxClients-part[0],lineHeight);result.commands=result.commands+part[1];local=local or part[2];y=y+part[0]*lineHeight+16
  end if
  if not local then for each entry in value.scores if entry.client==value.clientNum then part=drawClientScore(value,y,entry,fade,lineHeight==SB_NORMAL_HEIGHT);result.commands=result.commands+part[0];local=true;break end if end for end if
  result.localClient=local;value.deferredPlayerLoading=value.deferredPlayerLoading+1;if value.deferredPlayerLoading>10 then result.deferredLoads=1 end if;return result
end function

// CG_CenterGiantLine
function centerGiantLine(y,text) return draw("giant",(640-GIANT_WIDTH*printableLength(text))/2,y,0,0,text,1.0,1.0,1.0,1.0,-1,0,false) end function

// CG_DrawOldTourneyScoreboard
function drawOldTourneyScoreboard(value)
  result=frame(true);text="";if value.scoresRequestTime+2000<value.time then value.scoresRequestTime=value.time;result.clientCommands=["score"] end if
  append(result,draw("fill",0,0,640,480,"",1.0,0.0,0.0,0.0,-1,0,false));title=value.motd;if title=="" then title="Scoreboard" end if;append(result,centerGiantLine(8,title))
  seconds=numeric.trunc32(value.time/1000);minutes=numeric.trunc32(seconds/60);seconds=seconds%60;append(result,centerGiantLine(64,str(minutes)+":"+str(numeric.trunc32(seconds/10))+str(seconds%10)));y=160
  if value.gametype>=GT_TEAM then
    append(result,draw("giant",8,y,0,0,"Red Team",1.0,0.0,0.0,0.0,-1,TEAM_RED,false));text=str(value.teamScores[0]);append(result,draw("giant",632-GIANT_WIDTH*len(text),y,0,0,text,1.0,0.0,0.0,0.0,-1,TEAM_RED,false));y=y+64
    append(result,draw("giant",8,y,0,0,"Blue Team",1.0,0.0,0.0,0.0,-1,TEAM_BLUE,false));text=str(value.teamScores[1]);append(result,draw("giant",632-GIANT_WIDTH*len(text),y,0,0,text,1.0,0.0,0.0,0.0,-1,TEAM_BLUE,false))
  else
    for each ci in value.clients if ci.infoValid and ci.team==TEAM_FREE then append(result,draw("giant",8,y,0,0,ci.name,1.0,0.0,0.0,0.0,-1,TEAM_FREE,false));text=str(ci.score);append(result,draw("giant",632-GIANT_WIDTH*len(text),y,0,0,text,1.0,0.0,0.0,0.0,-1,TEAM_FREE,false));y=y+64 end if end for
  end if;return result
end function
