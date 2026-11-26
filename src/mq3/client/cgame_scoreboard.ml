// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native representation of code/cgame/cg_scoreboard.c.
package mq3.client.cgame_scoreboard
import mq3.compat.numeric as numeric

/// Native team identifier for free, used by player and team presentation.
const TEAM_FREE=0
/// Native team identifier for red, used by player and team presentation.
const TEAM_RED=1
/// Native team identifier for blue, used by player and team presentation.
const TEAM_BLUE=2
/// Native team identifier for spectator, used by player and team presentation.
const TEAM_SPECTATOR=3
/// Native game-type value for single-player arena progression, used when choosing team grouping and
/// single-player scoreboard behavior.
const GT_SINGLE_PLAYER=2
/// Native game-type value for team deathmatch, used when choosing team grouping and single-player
/// scoreboard behavior.
const GT_TEAM=3
/// Player-movement mode selecting dead input and physics behavior.
const PM_DEAD=3
/// Player-movement mode selecting intermission input and physics behavior.
const PM_INTERMISSION=5
/// Bit marking that the stored rank is tied with another player's rank.
const RANK_TIED_FLAG=0x4000
/// Virtual-screen Y coordinate of the scoreboard header.
const SB_HEADER=86
/// Virtual-screen Y coordinate at which scoreboard player rows begin.
const SB_TOP=118
/// Virtual-screen Y coordinate of the scoreboard's status-bar boundary.
const SB_STATUSBAR=420
/// Height of one scoreboard player row in the ordinary layout.
const SB_NORMAL_HEIGHT=40
/// Height of one scoreboard player row in the compact intermission layout.
const SB_INTER_HEIGHT=16
/// Maximum player rows displayed by the ordinary scoreboard layout.
const SB_MAXCLIENTS_NORMAL=7
/// Maximum player rows displayed by the compact intermission scoreboard layout.
const SB_MAXCLIENTS_INTER=17
/// Bigchar font metric controlling width in virtual UI coordinates.
const BIGCHAR_WIDTH=16
/// Bigchar font metric controlling height in virtual UI coordinates.
const BIGCHAR_HEIGHT=16
/// Width of a giant-font character in virtual screen coordinates.
const GIANT_WIDTH=32
/// Height of a giant-font character in virtual screen coordinates.
const GIANT_HEIGHT=48
/// Duration in milliseconds of the standard CGame presentation fade.
const FADE_TIME=200

/// Stores client game scoreboard score record, including `client`, `score`, `ping`, `time`.
struct Score
  /// Player slot associated with this score or client-side record.
  client
  /// Numeric player score rendered in this scoreboard entry.
  score
  /// Player latency displayed in the scoreboard, in milliseconds; -1 displays the connecting label.
  ping
  /// Elapsed player connection time reported by the server for scoreboard presentation.
  time
end struct
/// Stores client game scoreboard client record, including `name`, `team`, `powerups`, `botSkill`, `handicap`, `wins` and additional values.
struct Client
  /// Player name shown in a scoreboard row alongside score and team information.
  name
  /// Client team membership used to place the player in a team or spectator scoreboard section.
  team
  /// Player powerup bitmask consulted while drawing scoreboard status and flag indicators.
  powerups
  /// Bot difficulty level; zero denotes a human player and native bot levels range from one to five.
  botSkill
  /// Player handicap setting used by the user-info and team-display paths.
  handicap
  /// Tournament victories reported for this player.
  wins
  /// Tournament losses reported for this player.
  losses
  /// True when the client-information entry has been populated from valid server data.
  infoValid
  /// Player score retained in the scoreboard client-information record.
  score
end struct
/// Stores client game scoreboard state, including `time`, `scoresRequestTime`, `showScores`, `numScores`, `scoreFadeTime`, `paused` and additional values.
struct State
  /// Client-game timestamp in milliseconds used when drawing and fading the scoreboard.
  time
  /// Timestamp of the most recent request for updated server scores.
  scoresRequestTime
  /// True while the player explicitly requests the scoreboard overlay.
  showScores
  /// Number of valid scoreboard entries received from the server.
  numScores
  /// Timestamp used to fade the scoreboard after its display request ends.
  scoreFadeTime
  /// When constructing this record, `state` supplies `false` for this member.
  paused
  /// Game-rule identifier selecting tournament, team, and single-player scoreboard behavior.
  gametype
  /// Viewed player's movement mode, used to show the scoreboard after death and during intermission.
  pmType
  /// Warmup deadline or state supplied by the server's warmup configuration.
  warmup
  /// Display name of the player responsible for the local player's latest death.
  killerName
  /// Current score totals indexed by the two competing teams.
  teamScores
  /// Local client slot used to highlight and retain the corresponding scoreboard row.
  clientNum
  /// When constructing this record, `state` supplies `TEAM_FREE` for this member.
  playerTeam
  /// Zero-based player rank, including the tied-rank flag, used to compose the scoreboard's placement
  /// message.
  rank
  /// Viewed player's score displayed in the placement message above the scoreboard.
  playerScore
  /// Client-slot bitset that marks scoreboard rows with READY during intermission.
  readyMask
  /// True while player media is scheduled for deferred registration.
  deferredPlayerLoading
  /// When constructing this record, `state` supplies an empty string for this member.
  motd
  /// Scoreboard entries received from the server.
  scores
  /// Client identity and team records used to render scoreboard entries by client slot.
  clients
end struct
/// Stores client game scoreboard draw record, including `kind`, `x`, `y`, `width`, `height`, `text` and additional values.
struct Draw
  /// Drawing primitive or presentation category selecting how this record is rendered.
  kind
  /// Horizontal coordinate of a scoreboard text, icon, or background request in the virtual screen
  /// layout.
  x
  /// Vertical coordinate of a scoreboard text, icon, or background request in the virtual screen
  /// layout.
  y
  /// Width of the scoreboard image or rectangle in virtual HUD coordinates.
  width
  /// Height of the scoreboard image or rectangle in virtual HUD coordinates.
  height
  /// Text rendered in a scoreboard heading, player row, or match-status notice.
  text
  /// Opacity or alpha modulation applied while drawing or fading the object.
  alpha
  /// Red color component used by this drawing or effect record.
  red
  /// Green color component used by this drawing or effect record.
  green
  /// Blue color component used by this drawing or effect record.
  blue
  /// Player slot associated with this score or client-side record.
  client
  /// Team associated with the scoreboard row or section represented by this draw request.
  team
  /// When constructing this record, `draw` supplies `large` for this member.
  large
end struct
/// Stores client game scoreboard frame data, including `drawn`, `commands`, `clientCommands`, `deferredLoads`, `localClient`, `lineHeight`.
struct Frame
  /// When constructing this record, `frame` supplies `drawn` for this member.
  drawn
  /// When constructing this record, `frame` supplies an empty list for this member.
  commands
  /// When constructing this record, `frame` supplies an empty list for this member.
  clientCommands
  /// When constructing this record, `frame` supplies `0` for this member.
  deferredLoads
  /// When constructing this record, `frame` supplies `false` for this member.
  localClient
  /// When constructing this record, `frame` supplies `SB_NORMAL_HEIGHT` for this member.
  lineHeight
end struct

/// Creates a `mq3.client.cgame_scoreboard.Score` record. Assigns `client` from `client`, `score` from `points`, `ping` from `ping`, `time` from `time`.
/// @param client Value used to initialize `Score.client`.
/// @param points Value used to initialize `Score.score`.
/// @param ping Value used to initialize `Score.ping`.
/// @param time Value used to initialize `Score.time`.
function score(client,points,ping,time) return Score(client,points,ping,time) end function
/// Creates a `mq3.client.cgame_scoreboard.Client` record. Assigns `name` from `name`, `team` from `team`.
/// @param name Value used to initialize `Client.name`.
/// @param team Value used to initialize `Client.team`.
function client(name,team) return Client(name,team,0,0,100,0,0,true,0) end function
/// Creates a `mq3.client.cgame_scoreboard.State` record. Initializes the record with the defaults written in this constructor.
function state() return State(0,0,false,0,0,false,TEAM_FREE,0,0,"",[0,0],0,TEAM_FREE,0,0,0,0,"",[],[]) end function
/// Creates a `mq3.client.cgame_scoreboard.Draw` record. Assigns `kind` from `kind`, `x` from `x`, `y` from `y`, `width` from `width`.
/// @param kind Value used to initialize `Draw.kind`.
/// @param x Value used to initialize `Draw.x`.
/// @param y Value used to initialize `Draw.y`.
/// @param width Value used to initialize `Draw.width`.
/// @param height Value used to initialize `Draw.height`.
/// @param text Value used to initialize `Draw.text`.
/// @param alpha Value used to initialize `Draw.alpha`.
/// @param red Value used to initialize `Draw.red`.
/// @param green Value used to initialize `Draw.green`.
/// @param blue Value used to initialize `Draw.blue`.
/// @param clientNum Value used to initialize `Draw.client`.
/// @param team Value used to initialize `Draw.team`.
/// @param large Value used to initialize `Draw.large`.
function draw(kind,x,y,width,height,text,alpha,red,green,blue,clientNum,team,large) return Draw(kind,x,y,width,height,text,alpha,red,green,blue,clientNum,team,large) end function
/// Creates a `mq3.client.cgame_scoreboard.Frame` record. Assigns `drawn` from `drawn`.
/// @param drawn Value used to initialize `Frame.drawn`.
function frame(drawn) return Frame(drawn,[],[],0,false,SB_NORMAL_HEIGHT) end function
/// Updates `value.commands` during client game scoreboard `append`.
/// @param value Mutable client game scoreboard record/storage; this routine assigns `value.commands`.
/// @param command Value used by `value.commands=value.commands+[command]`.
function append(value,command) value.commands=value.commands+[command];return void end function
/// Evaluates client game scoreboard `printableLength` and returns `count` according to its guard/selection conditions.
/// @param text Text consumed or emitted by `printableLength` in the client game scoreboard path.
function printableLength(text)
  data=bytes(text);count=0;index=0
  while index<len(data)
    if data[index]==94 and index+1<len(data) and data[index+1]!=94 then index=index+2 else count=count+1;index=index+1 end if
  end while
  return count
end function
/// Evaluates client game scoreboard `placeString` and returns `"Tied for "+text`, `text` according to its guard/selection conditions.
/// @param rank Value used by `tied=(rank & RANK_TIED_FLAG)!=0`.
function placeString(rank)
  tied=(rank & RANK_TIED_FLAG)!=0;value=rank & ~RANK_TIED_FLAG;text=""
  if value==1 then text="1st" else if value==2 then text="2nd" else if value==3 then text="3rd" else text=str(value)+"th" end if
  if tied then return "Tied for "+text end if;return text
end function
/// Evaluates client game scoreboard `fadeAlpha` and returns `0.0`, `(FADE_TIME-elapsed)/FADE_TIME` according to its guard/selection conditions.
/// @param stateValue Record read through `stateValue.time`, `stateValue.scoreFadeTime`.
function fadeAlpha(stateValue)
  elapsed=stateValue.time-stateValue.scoreFadeTime;if elapsed<0 or elapsed>=FADE_TIME then return 0.0 end if;return (FADE_TIME-elapsed)/FADE_TIME
end function
/// Evaluates client game scoreboard `padLeft` and returns `text` according to its guard/selection conditions.
/// @param value Value used by `text=str(value)`.
/// @param width Width in the coordinate space used by `padLeft`.
function padLeft(value,width)
  text=str(value);while len(text)<width text=" "+text end while;return text
end function

// CG_DrawClientScore
/// @param value Record read through `value.clients`, `value.gametype`, `value.clientNum`, `value.rank` and additional values.
/// @param y Vertical coordinate in the coordinate space used by `drawClientScore`.
/// @param entry Record read through `entry.client`, `entry.ping`, `entry.time`, `entry.score`.
/// @param fade Value used by `if ci.powerups!=0 then commands=commands+[draw("flag",iconx,iconY,iconSize,iconSize,"",fade,1.0,1.0,1.0,entry.client,ci.team,largeFormat)]`.
/// @param largeFormat Value used by `if largeFormat then iconY=y-8`.
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
/// @param value Record read through `value.scores`, `value.clients`.
/// @param y Vertical coordinate in the coordinate space used by `teamScoreboard`.
/// @param team Value used by `if entry.client>=0 and entry.client<len(value.clients) and value.clients[entry.client].team==team then`.
/// @param fade Value used by `part=drawClientScore(value,y+lineHeight*count,entry,fade,lineHeight==SB_NORMAL_HEIGHT)`.
/// @param maxClients Value used by `if count>=maxClients then break end if`.
/// @param lineHeight Value used by `part=drawClientScore(value,y+lineHeight*count,entry,fade,lineHeight==SB_NORMAL_HEIGHT)`.
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
/// @param value Mutable client game scoreboard record/storage; this routine assigns `value.deferredPlayerLoading`, `value.killerName`.
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
/// @param y Argument 3 of `mq3.client.cgame_scoreboard.draw`.
/// @param text Argument 2, 6 of `mq3.client.cgame_scoreboard.draw`; passed as `(640-GIANT_WIDTH*printableLength(text))/2`, `text`.
function centerGiantLine(y,text) return draw("giant",(640-GIANT_WIDTH*printableLength(text))/2,y,0,0,text,1.0,1.0,1.0,1.0,-1,0,false) end function

// CG_DrawOldTourneyScoreboard
/// @param value Mutable client game scoreboard record/storage; this routine assigns `value.scoresRequestTime`.
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
